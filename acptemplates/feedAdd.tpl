{capture assign='pageTitle'}{lang}cms.acp.feed.{@$action}{/lang}{/capture}

{include file='header'}

<script data-relocate="true" src="{@$__wcf->getPath()}js/WCF.Like.js?v={@$__wcfVersion}"></script>
<script data-relocate="true" src="{@$__wcf->getPath('cms')}js/CMS.News.js?v={@$__wcfVersion}"></script>
<script data-relocate="true" src="{@$__wcf->getPath('cms')}acp/js/CMS.ACP.js?v={@$__wcfVersion}"></script>
<script data-relocate="true">
	//<![CDATA[
		$(function () {
			WCF.Language.addObject({
				'wcf.global.button.upload': '{lang}wcf.global.button.upload{/lang}'
			});
			
			new WCF.Category.NestedList();
			new WCF.Message.FormGuard();
			
			// use acp file picker
			new CMS.ACP.File.Picker($('#filePicker > .button'), 'imageID', {
				{if $image|isset}
					{@$image->fileID}: {
						fileID: {@$image->fileID},
						title: '{$image->getTitle()}',
						formattedFilesize: '{@$image->filesize|filesize}'
					}
				{/if}
			}, { fileType: 'image' });
			new CMS.ACP.File.Preview();
			
			WCF.Message.Submit.registerButton('text', $('#messageContainer > .formSubmit > input[type=submit]'));
		});
	//]]>
</script>

<header class="boxHeadline">
	<h1>{lang}cms.acp.feed.{@$action}{/lang}</h1>
</header>

{include file='formError'}

{if $success|isset}
	<p class="success">{lang}wcf.global.success.{@$action}{/lang}</p>
{/if}


<div class="contentNavigation">
	<nav>
		<ul>
			<li><a href="{link application='cms' controller='FeedList'}{/link}" title="{lang}cms.acp.menu.link.cms.feed.list{/lang}" class="button"><span class="icon icon24 icon-list"></span> <span>{lang}cms.acp.menu.link.cms.feed.list{/lang}</span></a></li>
			{event name='contentNavigationButtons'}
		</ul>
	</nav>
</div>

<form method="post" action="{if $action == 'add'}{link application='cms' controller='FeedAdd'}{/link}{else}{link application='cms' controller='FeedEdit' id=$feedID}{/link}{/if}">
	<div class="marginTop container shadow containerPadding">
		<fieldset>
			<legend>{lang}cms.acp.feed.general{/lang}</legend>
			<dl>
				<dt><label for="title">{lang}cms.acp.feed.title{/lang}</label></dt>
				<dd>
					<input type="text"  id="title" name="title" value="{$title}"/>
				</dd>
			</dl>
			<dl>
				<dt><label for="feedUrl">{lang}cms.acp.feed.url{/lang}</label></dt>
				<dd>
					<input type="text"  id="feedUrl" name="feedUrl" value="{$feedUrl}"/>
				</dd>
			</dl>
				{include file='messageFormMultilingualism'}
			<dl>
				<dt><label for="categoryID">{lang}cms.acp.feed.categoryID{/lang}</label></dt>
				<dd>
					<select id="categoryID" name="categoryID">
						{foreach from=$categories item=$category}
							<option value="{$category->categoryID}" {if $categoryID == $category->categoryID}selected="selected"{/if}>{$category->getTitle()|language}</option>
						{/foreach}
					</select>
				</dd>
			</dl>
			<dl class="newsImageSelect">
				<dt><label for="image">{lang}cms.news.image{/lang}</label></dt>
				<dd>
					<div id="filePicker">							
						<ul class="formAttachmentList clearfix"></ul>
						<span class="button small">{lang}cms.acp.file.picker{/lang}</span>
					</div>
				</dd>
			</dl>
		</fieldset>
	</div>
	<div class="formSubmit">
		<input type="submit" value="{lang}wcf.global.button.submit{/lang}" accesskey="s" />
		{@SECURITY_TOKEN_INPUT_TAG}
		<input type="hidden" name="action" value="{@$action}" />
	</div>
</form>

{include file='footer'}
