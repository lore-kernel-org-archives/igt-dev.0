Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A974AC98317
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 12:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEA510F4DF;
	Thu, 24 Sep 2026 12:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gUcOB3qM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF0B10F4DF
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 12:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790251652; x=1821787652;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Fp1SNeC9HVwuG7bYMEHibhC2pJhIuWoe+BacmHntfWE=;
 b=gUcOB3qMp5pr3gfkOdHSxVZ80NReRVZQXUg0FPPoPbB3DQNRg9wgtDAj
 D6sYBTPiTEZIFwzIquFFXqWpH4vDc/7/jfGnPKzQLysCR/6VfqnQ2Nwdt
 2yH8jB6kyg0RZXPXQrEy22y05+MkfJdxUms6qv30SCivox0S7pzWciZ9D
 lSTflrgdhjgUyYgp/KI+UwzIpg8mVWVHklEoQgQvuQfCWWv7GIogvLU/O
 Uxf2D0ojtPXTD24hn+clk0/6aQNKlFU/DBTlzjEyYvutgteKg/4MPfR+Z
 l0LCsiDsRhsyybIttpFCmvXy/d1Q4x+/JJ81dSowYzyS2l+2A+JimZ/5/ A==;
X-CSE-ConnectionGUID: rb0e7ryETjuo/uVK/3Iqiw==
X-CSE-MsgGUID: GDEyzCD9RwK8VlKlwgtb5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89924621"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="89924621"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 05:07:32 -0700
X-CSE-ConnectionGUID: 1TdIzWKgTv+gTMx+b7YUPQ==
X-CSE-MsgGUID: i6WfZBjCTeuLBZmKF3/ADQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="301935039"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 05:07:30 -0700
Date: Thu, 24 Sep 2026 14:07:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mark Yacoub <markyacoub@google.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t v2] meson: Bump meson version to 1.3.0
Message-ID: <20260924120710.nuk3bhzmmuimwa6w@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mark Yacoub <markyacoub@google.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260924102404.86580-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924102404.86580-1-kamil.konieczny@linux.intel.com>
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

Hi all,
On 2026-09-24 at 12:24:04 +0200, Kamil Konieczny wrote:
> Bump meson version to 1.3.0 and update minimal version used in
> fedora Dokerfile. Also, update some old deprecated functions with
> a new ones.
> 
> v2: update fedora dockerfile (Kamil)
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Mark Yacoub <markyacoub@google.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/206
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

I will postpone this to next year as on debian bookworm there is
older meson 1.0.1. I will return to this after bumping up debian
to trixie. Sorry for noise.

Regards,
Kamil

> ---
>  Dockerfile.build-fedora     | 2 +-
>  data/meson.build            | 4 +++-
>  lib/meson.build             | 4 ++--
>  meson.build                 | 2 +-
>  runner/testdata/meson.build | 7 +++----
>  5 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
> index a65f1030d..26d069d55 100644
> --- a/Dockerfile.build-fedora
> +++ b/Dockerfile.build-fedora
> @@ -46,6 +46,6 @@ RUN dnf install -y findutils
>  
>  # Meson version switching shenanigans
>  RUN dnf install -y python3-pip
> -RUN curl -o "/usr/src/#1" "https://files.pythonhosted.org/packages/43/9a/e0bcec70d290986c6265d32e0a2d16ace7ef38f58aa5a65308967129d094/{meson-0.52.1.tar.gz}"
> +RUN curl -o "/usr/src/#1" "https://files.pythonhosted.org/packages/aa/2c/75bcc2722460ef94a9eb3231f6b3466d04a1766ddcd7d660a11ee1cee53a/{meson-1.3.0.tar.gz}"
>  
>  RUN dnf clean all
> diff --git a/data/meson.build b/data/meson.build
> index 9490d20ac..8898c27e3 100644
> --- a/data/meson.build
> +++ b/data/meson.build
> @@ -1,3 +1,5 @@
> +fs = import('fs')
> +
>  image_files = [
>    '1080p-left.png',
>    '1080p-right.png',
> @@ -5,7 +7,7 @@ image_files = [
>  ]
>  
>  foreach img : image_files
> -      configure_file(output:img, input:img, copy:true)
> +	fs.copyfile(img)
>  endforeach
>  
>  install_data(sources : image_files, install_dir : datadir)
> diff --git a/lib/meson.build b/lib/meson.build
> index f3e6d9669..66558d5d3 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -218,7 +218,7 @@ if libdrm_amdgpu.found()
>  	if llvm_mc_prog.found()
>  		add_project_arguments('-DAMDGPU_LLVM_ENABLED', language : ['c'])
>  		lib_sources += ['amdgpu/shaders/amd_llvm_asm.c']
> -		message('Found ' + llvm_mc_prog.path() + ' enabling runtime AMDGPU ISA assembly')
> +		message('Found ' + llvm_mc_prog.full_path() + ' enabling runtime AMDGPU ISA assembly')
>  	else
>  		lib_sources += ['amdgpu/shaders/amd_llvm_asm_stub.c']
>  		message('llvm-mc not found: using stub implementation (tests will skip)')
> @@ -295,7 +295,7 @@ foreach f: iga64_assembly_sources
>  	iga64_codes_targets += custom_target(name,
>  		input: [ f + '.gen.iga64_codes.c', libiga64_asms.extract_objects(f) ],
>  		output: name,
> -		depend_files: [ 'iga64_macros.h', generate_iga64_codes.path() ],
> +		depend_files: [ 'iga64_macros.h', generate_iga64_codes.full_path() ],
>  		command: [ 'env', 'IGT_SRCDIR=@SOURCE_ROOT@', generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT0@', '@INPUT1@' ],
>  		console: true,
>  	)
> diff --git a/meson.build b/meson.build
> index 980fb6421..b05385795 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -7,7 +7,7 @@ project('igt-gpu-tools', 'c',
>            'buildtype=debugoptimized',
>          ],
>  	license : 'MIT',
> -	meson_version : '>=0.52.1')
> +	meson_version : '>=1.3.0')
>  
>  if get_option('b_ndebug') != 'false'
>  	error('Building without -Db_ndebug=false is not supported')
> diff --git a/runner/testdata/meson.build b/runner/testdata/meson.build
> index 1f8225918..574067cdb 100644
> --- a/runner/testdata/meson.build
> +++ b/runner/testdata/meson.build
> @@ -1,3 +1,4 @@
> +fs = import('fs')
>  
>  testdata_progs = [ 'successtest',
>  		   'no-subtests',
> @@ -17,10 +18,8 @@ foreach prog : testdata_progs
>  					   install : false)
>  endforeach
>  
> -configure_file(input : 'test-blacklist.txt',
> -	       output : 'test-blacklist.txt', copy : true)
> -configure_file(input : 'test-blacklist2.txt',
> -	       output : 'test-blacklist2.txt', copy : true)
> +fs.copyfile('test-blacklist.txt')
> +fs.copyfile('test-blacklist2.txt')
>  
>  testdata_list = custom_target('testdata_testlist',
>  			      output : 'test-list.txt',
> -- 
> 2.55.0
> 
