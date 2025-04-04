Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACDEC36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 15:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F304F10EBE4;
	Fri,  4 Apr 2025 15:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2gEkrmK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634E810EBE4
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 15:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743778960; x=1775314960;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XaLK5/ENhHjsjqw89RxfqDpY9+F0khsWzausnfKelh0=;
 b=I2gEkrmKhaZ4FBf6TYcJBOTIFqZ6Mr+6vlg5440u0WXxI7Z99MpYru4i
 0U2tjnO4/oRB5eQJOeHsrzqJu2rP3L404YH53zGaL+1qjvezhUymv7jx9
 C7M/woQioRVH/LgDRGUEor3iGcw6D3pDiBkbYGAJB28sU5ZZ+nvuH6AW6
 E2E6St6jALwntl2QoatD5Y2/yOpOBTVcHT9vZ1ypJoK92AwJ8fHt7VYuR
 LALQhv2dVX3dmRBKYLgNdoMM0viO1zrS8AVUxateVp8GIEAX/A8S/gw3y
 JMGsJOPwziVlIowEBrBtaWenoGvMKC5sRhG2qakmkmJXWsbz/TqCfrQhp g==;
X-CSE-ConnectionGUID: be2Ls2sGRBehgRTTsiGxeA==
X-CSE-MsgGUID: LWWrrGV2TXmeu1AsmGuoKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45112089"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="45112089"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 08:02:33 -0700
X-CSE-ConnectionGUID: zlUpZoKDQg+CL64SbkL8tg==
X-CSE-MsgGUID: NyAkNvuBTcSkfl2vOBBCWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="127089366"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 08:02:31 -0700
Date: Fri, 4 Apr 2025 17:02:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t v4 1/5] data: Move PNG images to new data directory
Message-ID: <20250404150229.55bswfwymsdn4j65@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 swati2.sharma@intel.com
References: <20250325210146.3338454-1-ramanaidu.naladala@intel.com>
 <20250325210146.3338454-2-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325210146.3338454-2-ramanaidu.naladala@intel.com>
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

Hi Naladala,
On 2025-03-26 at 02:31:42 +0530, Naladala Ramanaidu wrote:
> Placing png images inside "tests/" directory seems wrong, as these
> are not source files. These images should ideally be in a directory
> with other non-exec files, so creating a new "data/" directory to
> store such non-exec files.
> 
> v2: Update commit message subject (Kamil)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Thank you for changes, I verified and ./meson.sh install
did a copy of .png files to system-wide igt folder:

Installing /opt/builds/data/1080p-left.png to /usr/local/share/igt-gpu-tools

They are also at build/data/ folder so

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  {tests => data}/1080p-left.png  | Bin
>  {tests => data}/1080p-right.png | Bin
>  data/meson.build                |  11 +++++++++++
>  {tests => data}/pass.png        | Bin
>  lib/meson.build                 |   1 +
>  meson.build                     |   2 ++
>  tests/meson.build               |   7 -------
>  7 files changed, 14 insertions(+), 7 deletions(-)
>  rename {tests => data}/1080p-left.png (100%)
>  rename {tests => data}/1080p-right.png (100%)
>  create mode 100644 data/meson.build
>  rename {tests => data}/pass.png (100%)
> 
> diff --git a/tests/1080p-left.png b/data/1080p-left.png
> similarity index 100%
> rename from tests/1080p-left.png
> rename to data/1080p-left.png
> diff --git a/tests/1080p-right.png b/data/1080p-right.png
> similarity index 100%
> rename from tests/1080p-right.png
> rename to data/1080p-right.png
> diff --git a/data/meson.build b/data/meson.build
> new file mode 100644
> index 000000000..9490d20ac
> --- /dev/null
> +++ b/data/meson.build
> @@ -0,0 +1,11 @@
> +image_files = [
> +  '1080p-left.png',
> +  '1080p-right.png',
> +  'pass.png',
> +]
> +
> +foreach img : image_files
> +      configure_file(output:img, input:img, copy:true)
> +endforeach
> +
> +install_data(sources : image_files, install_dir : datadir)
> diff --git a/tests/pass.png b/data/pass.png
> similarity index 100%
> rename from tests/pass.png
> rename to data/pass.png
> diff --git a/lib/meson.build b/lib/meson.build
> index d01c90df9..bd0e48e77 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -241,6 +241,7 @@ foreach f: lib_sources
>  	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
>  	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
>  	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
> +            '-DIGT_IMGDIR="@0@"'.format(imgdir),
>  	] + (iga64_assembly_sources.contains(f) ? [ '-ffat-lto-objects' ] : []))
>  
>      lib_intermediates += lib
> diff --git a/meson.build b/meson.build
> index 6a580bd7e..4f98b5a5f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -291,6 +291,7 @@ vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
>  mandir = get_option('mandir')
>  pkgconfigdir = join_paths(libdir, 'pkgconfig')
>  python3 = find_program('python3', required : true)
> +imgdir = join_paths(build_root, 'data')
>  
>  if get_option('use_rpath')
>  	# Set up runpath for the test executables towards libigt.so.
> @@ -386,6 +387,7 @@ endif
>  subdir('overlay')
>  subdir('man')
>  subdir('docs')
> +subdir('data')
>  
>  message('Build options')
>  message('=============')
> diff --git a/tests/meson.build b/tests/meson.build
> index 2f5406523..265347563 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -523,11 +523,4 @@ if not meson.is_cross_build()
>  			output : 'gem_stress.testlist')
>  endif
>  
> -image_files = [
> -  '1080p-left.png',
> -  '1080p-right.png',
> -  'pass.png',
> -]
> -install_data(sources : image_files, install_dir : datadir)
> -
>  subdir('intel-ci')
> -- 
> 2.43.0
> 
