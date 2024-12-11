Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FD6E7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 09:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E9E10E037;
	Wed, 11 Dec 2024 09:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="de+dNE5U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DFB10E037
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 09:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733909138; x=1765445138;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LzzrUePlgUk0VcdlR5+gJg/ExeHf/njp57aYMa4HWe8=;
 b=de+dNE5UG6I1pLpeYevRvYsY92xLXq5OiYOlfqoTPY8Dm2TQtDi1V+a4
 F+StHzcVW18wNANTp3FaKCSsd/uZalPSs9Thbh0uI7NJgJZhctKEC+9/5
 6PJoFq6iH7HAOkYFFrLGW08kGvc5VYJ+FAgtbr06UUOBH3cRBXIGymwQp
 NrASqwzekAMs+KQVdL/NQyipWkfEmz7InVGs3FP/UOi7YS2zCoe+htsTU
 jVpfnhxZKsRQZUW1Qq1M3a6xaPZFwNjvQSzlaBMQ/Xj2OBjATPXIDtdKZ
 D7vm1YSkjc5ERkxjvTKSGnG7r5XPrZN2SuBup1WiydykxmRj+7YD7CZOs g==;
X-CSE-ConnectionGUID: CG6P/OwkQSiqVVjpjVpj3A==
X-CSE-MsgGUID: KTYrZxK0Si6E+EFMSTIumg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37968225"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="37968225"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 01:25:37 -0800
X-CSE-ConnectionGUID: ii54eDe5T86dDyvYKAPPgg==
X-CSE-MsgGUID: +EKfcq1DS7uT92PU5pP5/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="95441483"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 01:25:36 -0800
Date: Wed, 11 Dec 2024 10:25:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
Subject: Re: [PATCH 1/5] data: create new data directory
Message-ID: <20241211092533.elov6x5tbv7xzyio@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
References: <20241119075259.3048734-1-ramanaidu.naladala@intel.com>
 <20241119075259.3048734-2-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119075259.3048734-2-ramanaidu.naladala@intel.com>
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
On 2024-11-19 at 13:22:55 +0530, Naladala Ramanaidu wrote:
> From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>

This should be the same as your s-o-b like:

From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

As for subject, could you improve it a little?

[PATCH 1/5] data: Move PNG images to new data directory

Or even let it be 'data/images'? So it would be:

[PATCH 1/5] data/images: Move PNG images to new directory

Rest looks good.

Regards,
Kamil

> 
> Placing png images inside "tests/" directory seems wrong, as these
> are not source files. These images should ideally be in a directory
> with other non-exec files, so creating a new "data/" directory to
> store such non-exec files.
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  {tests => data}/1080p-left.png  | Bin
>  {tests => data}/1080p-right.png | Bin
>  data/meson.build                |   9 +++++++++
>  {tests => data}/pass.png        | Bin
>  lib/meson.build                 |   1 +
>  meson.build                     |   2 ++
>  tests/meson.build               |   6 ------
>  7 files changed, 12 insertions(+), 6 deletions(-)
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
> index 000000000..415cf9b6b
> --- /dev/null
> +++ b/data/meson.build
> @@ -0,0 +1,9 @@
> +image_files = [
> +  '1080p-left.png',
> +  '1080p-right.png',
> +  'pass.png',
> +]
> +
> +foreach img : image_files
> +      configure_file(output:img, input:img, copy:true)
> +endforeach
> diff --git a/tests/pass.png b/data/pass.png
> similarity index 100%
> rename from tests/pass.png
> rename to data/pass.png
> diff --git a/lib/meson.build b/lib/meson.build
> index 3d459c7a3..6f8f479ff 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -238,6 +238,7 @@ foreach f: lib_sources
>  	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
>  	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
>  	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
> +	    '-DIGT_IMGDIR="@0@"'.format(imgdir),
>  	])
>  
>      lib_intermediates += lib
> diff --git a/meson.build b/meson.build
> index 64f57f232..5ff646825 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -286,6 +286,7 @@ vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
>  mandir = get_option('mandir')
>  pkgconfigdir = join_paths(libdir, 'pkgconfig')
>  python3 = find_program('python3', required : true)
> +imgdir = join_paths(build_root, 'data')
>  
>  if get_option('use_rpath')
>  	# Set up runpath for the test executables towards libigt.so.
> @@ -381,6 +382,7 @@ endif
>  subdir('overlay')
>  subdir('man')
>  subdir('docs')
> +subdir('data')
>  
>  message('Build options')
>  message('=============')
> diff --git a/tests/meson.build b/tests/meson.build
> index 2724c7a9a..61dc7ed34 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -508,11 +508,5 @@ if not meson.is_cross_build()
>  			output : 'gem_stress.testlist')
>  endif
>  
> -image_files = [
> -  '1080p-left.png',
> -  '1080p-right.png',
> -  'pass.png',
> -]
> -install_data(sources : image_files, install_dir : datadir)
>  
>  subdir('intel-ci')
> -- 
> 2.43.0
> 
