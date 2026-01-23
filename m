Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3743D74EC2
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 13:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7651510EAE6;
	Fri, 23 Jan 2026 13:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeLb7DCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D312610EAE6
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 13:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769175949; x=1800711949;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W4siFt02B1MUbAHBUiTDnMpO3sbQHuU4azaGJ+BMn+E=;
 b=MeLb7DCywOd9AlaiGsKf3xo6o7jtku7YdOdRq17qqNf2aZeV3oTHWYVc
 S4+0k2Nf6HZaYS9hHo7y/8ukIRfSEs8FHuzjs3TOxlSOXdpUKgeZWzObh
 BbfFbWacP0mRon4mRod9yC/Vl/V0TkjKKtTnC7PBaFFRzH0WIjI4oTxXX
 6AJG+QbXMNgzgcG3EqdBeq7ztRM2T02V1ip9L2rkWcgkYtQwAbTPIY5tR
 gqWeyrTMT4Vu3FBmukYhW1DzQB6HYLBSZstrE0ND9qGvUWmbg8mm0pUIk
 rzujjiS3qGeECgTWxwe6sq0kh3E0vKS11R03QyxLj6D7n8iWETG+QCJaX w==;
X-CSE-ConnectionGUID: 8chhfzSPSNiuaOtpe6lLmA==
X-CSE-MsgGUID: q8kv+U8qSBu1AFP29rPYwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70478932"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70478932"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 05:45:48 -0800
X-CSE-ConnectionGUID: 1dhCWFP/RfOcEy7ugtr3DQ==
X-CSE-MsgGUID: 3IpkALiOTLqH/xTEhRlA4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206288187"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 05:45:46 -0800
Date: Fri, 23 Jan 2026 14:45:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
Subject: Re: [PATCH i-g-t v5 1/5] tools: Rename tools/gputop to
 tools/gputop.src
Message-ID: <20260123134528.d7px67wm2a35oc7s@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
References: <20260122084526.538837-1-soham.purkait@intel.com>
 <20260122084526.538837-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260122084526.538837-2-soham.purkait@intel.com>
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

Hi Soham,
On 2026-01-22 at 14:15:22 +0530, Soham Purkait wrote:

I guess it is v6, not v5?

> The GPUTOP source directory is renamed to gputop.src

s/GPUTOP/gputop/
> under tools/ path.

imho here a little more explanation why, like:

to compile binary into build/tools/gputop file.

This could be done at merge (unless another version is
needed).

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> v1:
>  - Add meson build files accordingly to generate
>    the binary under tools. (Kamil)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  tools/{ => gputop.src}/gputop.c          |  0
>  tools/gputop.src/meson.build             |  1 +
>  tools/{gputop => gputop.src}/utils.c     |  0
>  tools/{gputop => gputop.src}/utils.h     |  0
>  tools/{gputop => gputop.src}/xe_gputop.c |  0
>  tools/{gputop => gputop.src}/xe_gputop.h |  0
>  tools/meson.build                        | 11 ++++++-----
>  7 files changed, 7 insertions(+), 5 deletions(-)
>  rename tools/{ => gputop.src}/gputop.c (100%)
>  create mode 100644 tools/gputop.src/meson.build
>  rename tools/{gputop => gputop.src}/utils.c (100%)
>  rename tools/{gputop => gputop.src}/utils.h (100%)
>  rename tools/{gputop => gputop.src}/xe_gputop.c (100%)
>  rename tools/{gputop => gputop.src}/xe_gputop.h (100%)
> 
> diff --git a/tools/gputop.c b/tools/gputop.src/gputop.c
> similarity index 100%
> rename from tools/gputop.c
> rename to tools/gputop.src/gputop.c
> diff --git a/tools/gputop.src/meson.build b/tools/gputop.src/meson.build
> new file mode 100644
> index 000000000..ec39f4c7a
> --- /dev/null
> +++ b/tools/gputop.src/meson.build
> @@ -0,0 +1 @@
> +gputop_src = files('gputop.c')
> diff --git a/tools/gputop/utils.c b/tools/gputop.src/utils.c
> similarity index 100%
> rename from tools/gputop/utils.c
> rename to tools/gputop.src/utils.c
> diff --git a/tools/gputop/utils.h b/tools/gputop.src/utils.h
> similarity index 100%
> rename from tools/gputop/utils.h
> rename to tools/gputop.src/utils.h
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop.src/xe_gputop.c
> similarity index 100%
> rename from tools/gputop/xe_gputop.c
> rename to tools/gputop.src/xe_gputop.c
> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop.src/xe_gputop.h
> similarity index 100%
> rename from tools/gputop/xe_gputop.h
> rename to tools/gputop.src/xe_gputop.h
> diff --git a/tools/meson.build b/tools/meson.build
> index 8185ba160..521607a4c 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -70,11 +70,6 @@ if libudev.found()
>  		   install : true)
>  endif
>  
> -executable('gputop', 'gputop.c',
> -           install : true,
> -           install_rpath : bindir_rpathdir,
> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
> -
>  intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>  executable('intel_l3_parity', sources : intel_l3_parity_src,
>  	   dependencies : tool_deps,
> @@ -123,3 +118,9 @@ endif
>  subdir('i915-perf')
>  subdir('xe-perf')
>  subdir('null_state_gen')
> +
> +subdir('gputop.src')
> +executable('gputop', sources : gputop_src,
> +	   install : true,
> +	   install_rpath : bindir_rpathdir,
> +	   dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],)
> -- 
> 2.34.1
> 
