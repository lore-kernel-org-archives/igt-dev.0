Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACF6C10F16
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 12:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3999D10F743;
	Mon,  6 May 2024 12:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1foNkIm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E75F10E9D9
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715000183; x=1746536183;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YBFAz/v1Bvo5NLMiwJ0izC1/XedPZ9embJwUqepOTxA=;
 b=b1foNkImoXn17WCfrUupaXAjZqmq4ei0hW/ZnRvuozTW16SJb1Hg3fS7
 xP4ShxD35SitQGcUjK0U2cixH0YYsjUha35gvf8WOs5ZrO34DDQ31qPdk
 pmvdZfbnDYM12dTVK72euCxjYdNjHI5a/a/5joxaw99CMKStNS0nnEb8y
 FFKOToPdnyb6P+BiyVwDgVqqVruYi/sKEbsU9Qd1pXgmpGuyQ0ThFXsv6
 DqWKZJiizJyQF+MjMYXWK7NrB5upDLitl3oc+fJxEnV8gW0uu8YlpJAWD
 4WO7gRZ6gQ98kQGnBz3l0DvEJb9zt1R3P0uKhNDrBaGnmAx0nCch4+aKH w==;
X-CSE-ConnectionGUID: Y9LMBvsARACXQfKczM2+5A==
X-CSE-MsgGUID: Ua43OfVhSfO9AUd0EZMuwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14525689"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="14525689"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 05:56:22 -0700
X-CSE-ConnectionGUID: /B2ec1jPRPGHJQw96g9uGA==
X-CSE-MsgGUID: qP5jQZlgRNGzd6CqYw16gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28249934"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 05:56:20 -0700
Date: Mon, 6 May 2024 14:56:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Vignesh Raman <vignesh.raman@collabora.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v1] tests/meson.build: Generate test-list for cross
 build
Message-ID: <20240506125603.hntrxppbjqjl5xf3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20240502064309.56280-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240502064309.56280-1-vignesh.raman@collabora.com>
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

Hi Vignesh,
On 2024-05-02 at 12:13:09 +0530, Vignesh Raman wrote:
> test-list.txt and test-list-full.txt are not generated for
> cross-builds, and they are required by drm-ci for testing.
> Commit 485bcb98 disables generating .testlist files for
> cross-builds since the binaries cannot be executed, but
> test-list.txt and test-list-full.txt generation shouldn't
> require that. So generate them for cross-builds.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>


It looks like we need a better documentation for this
and also what is a use case we want to solve, see:

build/tests$ wc *txt
    3   389  6134 test-list-full.txt
    3   388  6115 test-list.txt
    6   777 12249 total

looks like there is a little (one test?) diff between both.

+cc Petri

Patch itself is ok, so
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/meson.build | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 65b8bf23b..758ae090c 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -468,15 +468,11 @@ subdir('vc4')
>  subdir('vmwgfx')
>  
>  gen_testlist = find_program('generate_testlist.sh')
> -if not meson.is_cross_build()
> -	test_list_target = custom_target('testlist',
> -		    output : 'test-list.txt',
> -		    command : [ gen_testlist, '@OUTPUT@', test_list ],
> -		    install : true,
> -		    install_dir : libexecdir)
> -else
> -	test_list_target = []
> -endif
> +test_list_target = custom_target('testlist',
> +	      output : 'test-list.txt',
> +	      command : [ gen_testlist, '@OUTPUT@', test_list ],
> +	      install : true,
> +	      install_dir : libexecdir)
>  
>  test_executables += executable('gem_concurrent_all', 'intel/gem_concurrent_all.c',
>  	   dependencies : test_deps + [ libatomic ],
> @@ -485,13 +481,11 @@ test_executables += executable('gem_concurrent_all', 'intel/gem_concurrent_all.c
>  	   install : true)
>  test_list += 'gem_concurrent_all'
>  
> -if not meson.is_cross_build()
> -	test_list_full_target = custom_target('testlist-full',
> -		    output : 'test-list-full.txt',
> -		    command : [ gen_testlist, '@OUTPUT@', test_list ],
> -		    install : true,
> -		    install_dir : libexecdir)
> -endif
> +test_list_full_target = custom_target('testlist-full',
> +	      output : 'test-list-full.txt',
> +	      command : [ gen_testlist, '@OUTPUT@', test_list ],
> +	      install : true,
> +	      install_dir : libexecdir)
>  
>  test_script = find_program('igt_command_line.sh')
>  foreach prog : test_list
> -- 
> 2.40.1
> 
