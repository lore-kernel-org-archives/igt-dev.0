Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4D2C021B5
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 16:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494E010EA92;
	Fri, 21 Feb 2025 16:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U41LSgGl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD5110EA92
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740156069; x=1771692069;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NUpmLV0a+A/4Qj+95Ko41ppvHLXobhl8m8ec3Z8mc/s=;
 b=U41LSgGlTyNMO7hAtYZthgDWkiN/maUSu/RqjdzsHvQPqOvD+vUcK0n+
 /3fNlzv/Kn4j+3K/QBGzGyJrqa7Kw9rH5a0d6gLqjs5lsW3Vj/UpTOCWE
 vZp1Xcc1koFRW1Pngm9KjQEKgMrTaA14WlTGzG+LyqjCvBeC+Q9VXKdPe
 AwzmzhhvnDHCBpkrJNyYXdjKlVWkKIrRceSHLBKg3CGNGeRV0vShDWGMX
 gbszMySRU9s8fqInz+yoewey8UpJ/w2farix27Dty4LbL7pOuplToZrsP
 xXu1HYh6Hv1G48N/diYnGP2Fi/24Iq1/ICmX5fp0tQuQvO/p54Y5FOred Q==;
X-CSE-ConnectionGUID: lBpNSZV4Qd2Uxtd0CY2aGQ==
X-CSE-MsgGUID: AkjSl9RTS+miOmP3BO8Nww==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41185123"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41185123"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:41:09 -0800
X-CSE-ConnectionGUID: 0Tu5FHJmQVyYw4VSrSk3qg==
X-CSE-MsgGUID: k8Ndj98uQwOf+M56+JQa0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="138634422"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:41:06 -0800
Date: Fri, 21 Feb 2025 17:41:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 santhosh.reddy.guddati@intel.com
Subject: Re: [PATCH i-g-t v3 1/5] data: Move PNG images to new data directory
Message-ID: <20250221164104.i7nqywrzydkzf36c@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 santhosh.reddy.guddati@intel.com
References: <20250218215349.1063788-1-ramanaidu.naladala@intel.com>
 <20250218215349.1063788-2-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250218215349.1063788-2-ramanaidu.naladala@intel.com>
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
On 2025-02-19 at 03:23:45 +0530, Naladala Ramanaidu wrote:
> Placing png images inside "tests/" directory seems wrong, as these
> are not source files. These images should ideally be in a directory
> with other non-exec files, so creating a new "data/" directory to
> store such non-exec files.
> 
> v2: Update commit message subject (Kamil)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
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

Are you sure this is ok? I tested it and PNG files where placed
in /usr/local/share/igt-gpu-tools/

while I would expect them in
/usr/local/share/igt-gpu-tools/data/

Please look for 'registers' folder used in intel_reg tools,
it is installed as /usr/local/share/igt-gpu-tools/registers/
and has there its files.

Regards,
Kamil

> diff --git a/tests/pass.png b/data/pass.png
> similarity index 100%
> rename from tests/pass.png
> rename to data/pass.png
> diff --git a/lib/meson.build b/lib/meson.build
> index 9fffdd3c6..a248eb629 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -240,6 +240,7 @@ foreach f: lib_sources
>  	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
>  	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
>  	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
> +            '-DIGT_IMGDIR="@0@"'.format(imgdir),
>  	] + (iga64_assembly_sources.contains(f) ? [ '-ffat-lto-objects' ] : []))
>  
>      lib_intermediates += lib
> diff --git a/meson.build b/meson.build
> index 2f663dc03..38311f6e3 100644
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
> index f8a0ab836..83986ee87 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -514,11 +514,4 @@ if not meson.is_cross_build()
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
