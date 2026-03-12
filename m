Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F11C106703C
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 14:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5C310EA34;
	Thu, 12 Mar 2026 14:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvIwjQXB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B4210EA35
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773327471; x=1804863471;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zxowcZpt3vyVwAtwF6cN8QDdfGqf3t/goa3y36QFqpI=;
 b=TvIwjQXBUZV+m0CsEq62w6jTfWyN+XjRoM6m/7DBzH3TVJwDc1II0uI6
 WEwkBuEADe4l2p0QZ+rK0/7rVwK+ycgFAh5Z0lwK4w7ozVQsq70F5LupC
 l3HYy0Xd1/bTf7Do6ZYx0BFqJ2cWGJ+O4w3wbxtSbwubCGOrMHEpwundQ
 4cHGWeO5NXkMJdrwJvoRl6I8PBID87RCes9lWc7m+LDZONXfb7t+Db9+o
 BaKEMaJbsa0kr7jNpV79rS7CzYTV2TmU3qHgfG8KlEMqJZewuARES5sK+
 AQGWntl02HC8kHmtkj2tyC6n2EDmrBPQ0GJ1+hG3dpIBAqhs0BKRqpH3i Q==;
X-CSE-ConnectionGUID: X+PA4wrvRFSqjWbE+2PoTw==
X-CSE-MsgGUID: hLPpqUW/S3+4Qf5pTIdvgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="97033527"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="97033527"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 07:57:50 -0700
X-CSE-ConnectionGUID: bNuxUlZJTo+h4KA7TPG+xQ==
X-CSE-MsgGUID: 7vc0YYXHStKyjBhMexCsPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="220898170"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 07:57:50 -0700
Date: Thu, 12 Mar 2026 15:57:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH i-g-t v1 1/6] mkdocs.yml: add mkdocs-cdoc and mdx_linkify
Message-ID: <20260312145747.lfu7wpjqzzhpxxdk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
References: <20260220150202.1013804-1-pawel.sikora@intel.com>
 <20260220150202.1013804-2-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260220150202.1013804-2-pawel.sikora@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Pawel,
On 2026-02-20 at 16:01:55 +0100, Pawel Sikora wrote:
> Add mkdocs-cdoc to plugins used for automatic code reference build.
> API reference build is split for igt-tests for 'tests' and igt-lib
> for 'lib' directories.
> 
> Add mdx_linkify to markdown_extensions in mkdocs configuration.
> This allows automatic link creation in generated HTML
> from markdown files when a URL is provided without
> the explicit []() brackets used by default in markdown.
> 
> Adjust mkdocs.yml for new API reference generated content.
> 
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> ---
>  docs/requirements-docs.txt |  2 ++
>  mkdocs.yml                 | 32 ++++++++++++++++++++++++++++++--
>  2 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/requirements-docs.txt b/docs/requirements-docs.txt
> index 9a6e5f0be..986ce3e69 100644
> --- a/docs/requirements-docs.txt
> +++ b/docs/requirements-docs.txt
> @@ -1,3 +1,5 @@
>  mkdocs
> +mkdocs-cdoc==1.0.6

Could this be '>='?
With or without it LGTM,

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  mkdocs-minify-plugin
>  mkdocs-material
> +mdx_linkify
> diff --git a/mkdocs.yml b/mkdocs.yml
> index 0abb76704..99f363307 100644
> --- a/mkdocs.yml
> +++ b/mkdocs.yml
> @@ -41,7 +41,6 @@ nav:
>      - Links to CI for a specific HW platform:
>        - Intel GFX CI: https://intel-gfx-ci.01.org
>    - Download: 'download.md'
> -  - API Reference: 'api_reference/index.html'
>    - News: 'NEWS.md'
>    - FAQ: 'faq.md'
>  
> @@ -91,7 +90,6 @@ theme:
>  
>      # Table of contents
>      - toc.follow
> -    - toc.integrate
>  
>      # Search
>      - search.suggest
> @@ -109,6 +107,9 @@ theme:
>      - content.code.annotate
>      - content.tabs.link
>      - content.tooltips
> +    - content.code.copy      # Copy button
> +    - content.code.select    # Line selection
> +    - content.code.annotate  # Code annotations
>  
>  # Plugins
>  plugins:
> @@ -119,11 +120,38 @@ plugins:
>        minify_css: true
>        htmlmin_opts:
>          remove_comments: true
> +  - cdoc:
> +      project_name: igt-gpu-tools
> +      version_file: meson.build
> +      parser: "auto"
> +      clang_args: ["-Ilib", "-Itests", "-Iinclude"]
> +      appendix_code_usages: false
> +      custom_index_pages:
> +        - docs/api-intro.md
> +      sources:
> +        - root: lib
> +          nav_title: Core API
> +          output_dir: api_reference/lib
> +          custom_index_pages:
> +            - docs/lib-intro.md
> +        - root: tests
> +          nav_title: Tests API
> +          output_dir: api_reference/tests
> +          extensions: [".c"]
> +          igt:
> +            group_by: [category, mega_feature, sub_category, functionality]
> +          custom_index_pages:
> +            - docs/tests-intro.md
> +
> +      # Rendering
> +      convert_rst: true
> +      convert_gtkdoc: true
>  
>  extra_css:
>    - css/extra.css
>  
>  markdown_extensions:
> +  - mdx_linkify
>    - abbr
>    - admonition
>    - attr_list
> -- 
> 2.51.0
> 
