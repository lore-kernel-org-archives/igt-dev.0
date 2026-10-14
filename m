Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF227CC6B1A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 15:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C7E10EC4E;
	Wed, 14 Oct 2026 15:02:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD0210E9BD
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791990085; x=1823526085;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dCOARGQoLwj1L86BJhuGgRv+DrAxvwhUiaVlxOtNo2M=;
 b=jLIEsG2NG02g5rXt6XgI/HTzoFX/qSgOR+iB6ozNVQYnhm4fO6fdBQJq
 PHirJWljEBOYekFA32D0oWgxnCv7SO66glLb+Hv+ELEzkBXXhC0MxR8cs
 tS9cgDJHtZ2F/2kpeVFI2Kc2McWZHtERKPHT2Afucw7Fq0rUYbDVglBIx
 RkpawrfZM8sldxrZiqTU9ZSIHAnZk8FiLemDkSaW48clIoJc2k2eY23DW
 /RM/fRfFtBPMY27ob8o99wCKE5np2DDyieOQy4gS6G+B8wdxgBlkw15S7
 WkoNikq2BYZ379SZs0GhLEZaWk9zHskbOxi7jdhJjuHvjZetsuMTXzRR+ Q==;
X-CSE-ConnectionGUID: Xyn9DEGOQY6F3ucjZoGdyA==
X-CSE-MsgGUID: X3jhPECUTs6TctWsmibGWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="749416"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="749416"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 08:01:24 -0700
X-CSE-ConnectionGUID: 2UBLUAQvQYKFzM1/VRuOeQ==
X-CSE-MsgGUID: sRbhh8m/RKyVhZksRLF8Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3291436"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 08:01:23 -0700
Date: Wed, 14 Oct 2026 17:01:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mark Yacoub <markyacoub@google.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t v2] meson: Bump meson version to 1.3.0
Message-ID: <20261014150119.6xmcgji5c75lrssp@kamilkon-DESK.igk.intel.com>
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

Hi igt-dev,
On 2026-09-24 at 12:24:04 +0200, Kamil Konieczny wrote:
> Bump meson version to 1.3.0 and update minimal version used in
> fedora Dokerfile. Also, update some old deprecated functions with
> a new ones.
> 
> v2: update fedora dockerfile (Kamil)

I will postpone this after there will be debian container with trixie.


Regards,
Kamil

> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Mark Yacoub <markyacoub@google.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/206
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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
