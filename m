Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C35C47DA9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 09:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A091126BD;
	Mon, 29 Jan 2024 09:56:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9674E1127C7
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2024 09:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706522164; x=1738058164;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wqg7+4efWfOZ3tlIzj7f6j7T6k17RPPH8lyvkuzW/Is=;
 b=QqyqiTlq8e/1oCGMmWjjURTAlkK6tziSq17psbtJnZJmEx2TzY/clKX0
 A5mHSSEyBm0VXaM8Joj9t2GNN4RtWQHHe2mesZIKH4Afwcp0FR/bsTJ7C
 apUQi1OxDPP4iKsXJm9NIynTS6/qbWOCfmRyGkO4Brn5PjEaaiEwpL8/b
 eJjqPRKL7GjOUaSKoYqcxIvgVBcsTqbz2K7z7a5+LVsTmAb/XsxnAixsh
 qRxjul4yKH9bDjp4TRLvFQyfjxb+FJVDiutHyjwDLRT7GCPllYvNTq9XE
 rO37jlOp0E7lnD/Ehombq7nmsFASRFUGNBAWl+I7OlzD5wcNKisYXiY8J w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10293786"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="10293786"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 01:56:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="1118887157"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="1118887157"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 01:56:00 -0800
Date: Mon, 29 Jan 2024 10:55:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] testplan/meson.build: add a ninja PHONY target
 for Intel CI testlists
Message-ID: <20240129095558.ctwnpstnthz37466@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240126124021.2700482-1-mauro.chehab@linux.intel.com>
 <20240126124021.2700482-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240126124021.2700482-3-mauro.chehab@linux.intel.com>
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

Hi Mauro,
On 2024-01-26 at 13:37:28 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Add custom phony targets to create testlists to be used by Intel-CI.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  docs/testplan/meson.build | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 9e0c3aee06af..5560347f1337 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -1,5 +1,7 @@
>  testplan_title = 'IGT test plans'
>  
> +intel_testlist_dir = 'intel-ci-tests'
> +
>  sphinx = find_program('sphinx-build', required: build_sphinx)
>  rst2html = find_program('rst2html-3', 'rst2html', required : false)
>  rst2pdf = find_program('rst2pdf', required: false)
> @@ -44,6 +46,8 @@ else
>  	    }
>  endif
>  
> +testplans = []
> +
>  foreach testplan, fields: test_dict
>  	rst = custom_target(testplan + '.rst',
>  			    build_by_default : true,
> @@ -53,6 +57,8 @@ foreach testplan, fields: test_dict
>  			    output : testplan + '.rst'
>  			   )
>  
> +	testplans += fields['input']
> +
>  	if rst2html.found()
>  		custom_target(testplan + '.html',
>  			      build_by_default : true,
> @@ -63,6 +69,17 @@ foreach testplan, fields: test_dict
>  	endif
>  endforeach
>  
> +custom_target(intel_testlist_dir,
> +	      build_by_default : true,
> +	      build_always_stale : true,
> +	      command : [ igt_doc_script, '--config', '@INPUT@', '--intelci-testlist', '@OUTPUT@' ],
> +	      depends : doc_dependencies,
> +	      input : testplans,
> +	      output : intel_testlist_dir,
> +	      install : true,
> +	      install_dir : libexecdir
> +	     )
> +
>  if sphinx.found()
>  	if gen_rst_index.found()
>  		sphinx_out_dir = meson.current_build_dir()+ '/indexed_html'
> -- 
> 2.43.0
> 
