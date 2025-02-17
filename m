Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A801C021A9
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 14:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD8D10E4F0;
	Mon, 17 Feb 2025 14:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cnBIGqzB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA85F10E4F0
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 14:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739802032; x=1771338032;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uI5UmrsO4j73ie17NfDHVM8nhboFEsVV6CQn+9lb3jE=;
 b=cnBIGqzBLu86vOFvS56Rncl95SmjA8T/NcqwCeqqmtkrr9d3rRuUUnp7
 ZpqRyJBj5MLh7aUxjBXZka36LjL1oby0paKenwyfeNQfh9crWpyVqGV6H
 j26AaCdEdWKLjgWONT+PActvAPKjOn1BMGBrWjiS4hhiybwX/f/Wfr+W+
 aVHKOAZuYjxAu1958dNarfPis+HNGGfUqYwSgnffm1px+ofnHu/f8Ev+S
 FUcKoooRoegUjqohwS0NturW/OcA2pcSHkC+RnKt65+m/1bhV2TwmEX5E
 3rt1EKBq0kU2qvRcGP8H3G+IglbCg3SLSqHAMtUwv4BQpFMjgjEEYJrGQ w==;
X-CSE-ConnectionGUID: lK46XlslTTqd69K9eTWybA==
X-CSE-MsgGUID: MKv3FAHNTP+foF8igNo7Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51892833"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="51892833"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 06:20:31 -0800
X-CSE-ConnectionGUID: bJz6Id3ZTgCfyHw4cRkn7A==
X-CSE-MsgGUID: tjgCQNcaQyWT9G1PfhFbaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118268478"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 06:20:30 -0800
Date: Mon, 17 Feb 2025 15:20:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, matthew.d.roper@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_multi_tile: Multi-Tile support in IGT
Message-ID: <20250217142027.vstw3rm6w5yndqy2@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 matthew.d.roper@intel.com
References: <20250215011155.196896-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250215011155.196896-1-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2025-02-15 at 01:11:55 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>

only few nits, first please keep description to 65 columns
(or max 80).

> 
> Added functionality to check Multi-Tile available in system or not. Belonging to each Tile%d
> GT%d gathered. Checked GT%d belongs to which tile%d in multi-tile/single-tile platforms.
> Added functionality to check if any tile%d not provided by driver or missed.
> E.g.tile available in platforms in order tile0, tile1...tileX in serial order, If
> tile1 tile2 tile4...tileX populated than will get Warning tile3 not available.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  include/drm-uapi/xe_drm.h   | 169 ++++++++++++--

Change for drm-uapi should go in separate patch, see git log.

>  lib/igt_sysfs.c             |   3 +-
>  lib/xe/xe_query.h           |  50 ++++-
>  tests/intel/xe_multi_tile.c | 432 ++++++++++++++++++++++++++++++++++++
>  tests/meson.build           |   1 +
>  5 files changed, 620 insertions(+), 35 deletions(-)
>  create mode 100644 tests/intel/xe_multi_tile.c
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 56163eb91..8b0869ce2 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef _XE_DRM_H_
> -#define _XE_DRM_H_
> +#ifndef _UAPI_XE_DRM_H_
> +#define _UAPI_XE_DRM_H_

This shouldn't change, see README.md about how to bring uapi
changes into igt.

Regards,
Kamil

>  
>  #include "drm.h"
>  
> @@ -118,6 +118,12 @@ extern "C" {
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>  
[...cut...]

