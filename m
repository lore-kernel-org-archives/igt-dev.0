Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083C2C531DC
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 09:36:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB65410E0D6;
	Fri, 23 Aug 2024 09:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQ2ZEnJV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB65310E077;
 Fri, 23 Aug 2024 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724405806; x=1755941806;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v5hXTKWrJFmMofuOFczkDTyettZPugbAJ8lSC/d/W34=;
 b=LQ2ZEnJV8a3FCz5KiWwntUQgZdTn32Ok8875K8VzU0hQ5OBxSk5JKDLd
 CHjGhkUUHLH/9sfjNja4H44EumUDhYIp5aweoJhPNkk4ahDXJAK7bmq3s
 atAJ6D+Vu6zSR2YQ6cT8Vf5Pq86zzgT+VW05335CTk528kBRMSC3eHqtD
 ydhTT3KhgVbFfS8PuKnVShOWHQqaUiX+CDhch8bjWaO8bU+RV70yFk122
 wmg/dsRUPURRGS+KSUNCWfaPOHfk3MuuApS78z4tsYOkTP9JXOCQRrTek
 7a8oNAtRWLrY7akOoKaT5cX0NsMSkW/pqX//GFnONqbQ9MqX6kJVIOBfu w==;
X-CSE-ConnectionGUID: fywl4zv7QhiA4T46Nc0tLQ==
X-CSE-MsgGUID: D0ZNRcPjQFKHQqAyhwerFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22991809"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="22991809"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 02:36:46 -0700
X-CSE-ConnectionGUID: aInc/uGrT+KfZntGYj0OrQ==
X-CSE-MsgGUID: /XiroJBuT1id/PipjEBxVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="66675158"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 02:36:45 -0700
Date: Fri, 23 Aug 2024 11:36:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for Fix
 compilation for musl in intel/kms_pm_backlight
Message-ID: <20240823093625.yiaqsap4jfjorqlv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240821095137.60254-1-kamil.konieczny@linux.intel.com>
 <172426248576.722184.17052576851881639838@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172426248576.722184.17052576851881639838@2413ebb6fbb6>
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
On 2024-08-21 at 17:48:05 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix compilation for musl in intel/kms_pm_backlight
> URL   : https://patchwork.freedesktop.org/series/137557/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15269_full -> IGTPW_11609_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11609_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11609_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11609/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11609_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_linear_blits@interruptible:
>     - shard-mtlp:         [PASS][1] -> [TIMEOUT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15269/shard-mtlp-8/igt@gem_linear_blits@interruptible.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11609/shard-mtlp-3/igt@gem_linear_blits@interruptible.html
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-1:
>     - shard-glk:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15269/shard-glk8/igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11609/shard-glk8/igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-1.html
> 

These are unrelated to change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11609_full that come from known issues:
> 
...cut...
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7981 -> IGTPW_11609
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_15269: c83ab549ef8f647c3de42793d222a980021a973f @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11609: 11609
>   IGT_7981: f4e2ada1adec484cf506b5ec7e9acb3ae62228f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11609/index.html
