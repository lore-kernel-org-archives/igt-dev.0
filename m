Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57B9C52D7C
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 11:26:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79ECE10E8C7;
	Fri,  9 Aug 2024 11:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGxbHTbh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F9210E8C7;
 Fri,  9 Aug 2024 11:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723202771; x=1754738771;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sC2lc7+rQaVEtvwHH7PjPICLbCmLhXUAvqp8KK7BvFs=;
 b=dGxbHTbhbpb2JnpYErR+18aj+0Mmy8wXneva4PeL3YIY7A9OFbWArTrP
 Kjn4cmr7eI3Tac4RtE2lZAMZYe/0zqqFf/M32MQB+os+yCdjLCXnHHK2c
 e1fJfhW/x+vAOO+ApRmCs0kLItxyU6GYffl1I3MfGVbN5jxPDKyYfnIsh
 T8crXvwwJCSYubVOcCh5As50PDyKf+9DO7ojSUni2egoJz7kYNgSj9lqB
 tRxp3ivHYgWJjbNSk2Fb+U+Tux6wz80f8VU5h/v5ze2YWSale+yHI10H5
 iAyymw/fOAO+J200ndZAM460ecO3TKzABudHMbxnYE3ssRla8L3vqhJX6 w==;
X-CSE-ConnectionGUID: GXFSH//KScaP2DWQxrejgA==
X-CSE-MsgGUID: /IOJymN5TGGRGtgQFjUKng==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21345783"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21345783"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:26:05 -0700
X-CSE-ConnectionGUID: 0yuIeFPZR3Cu7IXT3Eo1fQ==
X-CSE-MsgGUID: o30dh7QOR8G6vudBCpoJqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="58104633"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 04:26:04 -0700
Date: Fri, 9 Aug 2024 13:26:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?Q?=3A?= Allow dynamically ignore dmesg errors or warnings (rev4)
Message-ID: <20240809112601.gubgdzwvo3na7sol@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240808164759.133621-1-kamil.konieczny@linux.intel.com>
 <172317990541.551530.8909957205244803539@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172317990541.551530.8909957205244803539@2413ebb6fbb6>
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
On 2024-08-09 at 05:05:05 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Allow dynamically ignore dmesg errors or warnings (rev4)
> URL   : https://patchwork.freedesktop.org/series/136494/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15198_full -> IGTPW_11545_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11545_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11545_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11545/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11545_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_softpin@evict-active-interruptible:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15198/shard-mtlp-8/igt@gem_softpin@evict-active-interruptible.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11545/shard-mtlp-2/igt@gem_softpin@evict-active-interruptible.html
> 
>   * igt@i915_pm_rps@thresholds-idle-park:
>     - shard-dg2:          NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11545/shard-dg2-2/igt@i915_pm_rps@thresholds-idle-park.html
>     - shard-dg1:          NOTRUN -> [SKIP][4] +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11545/shard-dg1-13/igt@i915_pm_rps@thresholds-idle-park.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
>     - shard-snb:          [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15198/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11545/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf@psr2-pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [ABORT][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11545/shard-mtlp-1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf@psr2-pipe-b-edp-1.html
> 
>   * igt@kms_psr@psr2-cursor-mmap-cpu@edp-1:
>     - shard-mtlp:         [PASS][8] -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15198/shard-mtlp-3/igt@kms_psr@psr2-cursor-mmap-cpu@edp-1.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11545/shard-mtlp-8/igt@kms_psr@psr2-cursor-mmap-cpu@edp-1.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-tglu:         NOTRUN -> [SKIP][10]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11545/shard-tglu-5/igt@kms_vrr@lobf.html
> 

These are unrelated to xe_wedged test and runner changes.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_15198_full and IGTPW_11545_full:
> 
> ### New IGT tests (20) ###
> 
>   * igt@gem_userptr_blits@mmap-offset-banned@fixed:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.0] s
>
...cut...
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11545/index.html
