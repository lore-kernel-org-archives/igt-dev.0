Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6948ED3399B
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 16:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3E910E518;
	Mon, 28 Oct 2024 16:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lymg2qw6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8443E10E513;
 Mon, 28 Oct 2024 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730134605; x=1761670605;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6GJnI027S9UQmpKH6h1NtArJpv9eWnp3Bql4rXP1toE=;
 b=lymg2qw6IURW+ADkQhUIAmeQxbZEWT3UC1weibJEkVp6ubdtDItfCkEG
 XoKGcl9rNaHLl0RsvG0K9yBoJNam7YfQjTzjgwwKOezn9mtKeo0FEMEtm
 CydPl8f2YzmwzKqUnbJsccyvhf8ANA1FNoRxyxe6IkeYa1cFzMGxP1o3c
 14QibQofJGbniD8nqqT14oy1qO7dXexXqeBuLRfnnyuHXfDsPKrjlgMrP
 Rr5ML8r+Ffzi/DYJC4hKVXlap5UIAVhw1MpNmMUQFrcM80x61azz+fy0s
 iqx24x/1WJzv6DkIZFYiW/M6inQe85x/MfmEdbPEoJm08uEUjbtoxnjcz w==;
X-CSE-ConnectionGUID: rhY8DLrgRj+3zYJ91p9YxQ==
X-CSE-MsgGUID: /tIViW6WRz6IpXjLj8V+EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="47221415"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="47221415"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 09:56:45 -0700
X-CSE-ConnectionGUID: BkO6/qqPSFeXfBRyknvhsQ==
X-CSE-MsgGUID: ZN0YEECPRpqiF/740+0n+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="82001796"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 09:56:44 -0700
Date: Mon, 28 Oct 2024 17:56:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_vm:Reduce n_execs for bind-array-enobufs
Message-ID: <20241028165641.6no6wkjq7vaobfdn@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241022201130.5724-1-jagmeet.randhawa@intel.com>
 <172963112896.1310194.4985847915738041632@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172963112896.1310194.4985847915738041632@2413ebb6fbb6>
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
On 2024-10-22 at 21:05:28 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_vm:Reduce n_execs for bind-array-enobufs
> URL   : https://patchwork.freedesktop.org/series/140336/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8082 -> IGTPW_11960
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11960 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11960, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11960/index.html
> 
> Participating hosts (45 -> 44)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11960:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@requests:
>     - bat-arls-2:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8082/bat-arls-2/igt@i915_selftest@live@requests.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11960/bat-arls-2/igt@i915_selftest@live@requests.html
> 

This is unrelated to Xe test,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11960 that come from known issues:
> 
...cut...

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8082 -> IGTPW_11960
>   * Linux: CI_DRM_15576 -> CI_DRM_15581
> 
>   CI-20190529: 20190529
>   CI_DRM_15576: d5bac12430b0d4a980c0498b3c946772950e70ee @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_15581: 8a7ac0227c7c3fe2fcb01a933df5b9c49c7f2832 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11960: d44f495790106e3e64d4540a30faa09c9fc4d1ca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11960/index.html
