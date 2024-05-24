Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E701C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 08:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECE910E3DA;
	Fri, 24 May 2024 08:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKh3v2Z8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71CE891D9;
 Fri, 24 May 2024 08:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716539258; x=1748075258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Dy4N8Z98aFCuQMip4+WuQRukYWQqPFG9lZMblbv/72Q=;
 b=oKh3v2Z8N00j1h4kJxnQAtIp+ONhYHixKcCGiSTjdQOfhz5mvBs3pp/7
 MDuH/kC9Qz7DnoZJpQ0J/lTMVDC0KnYdiv1GHTpYR12Oa+43UsUA5fGWQ
 8qu+oExoD1/aq8LFPNRWt2stj3tRiT+YyKW4wUZvfX926s3cVC9mBHAyj
 cvXRy00jAVZwgyYLxMSl2Vk24LpfWs9esEYGn5we7uxBxbTdFRyP4El3/
 gcUiYHPU3GjrZz6KPTzyhh4G0o9HkMme0nNDK4Qj+qHMohXYMYIEYI9i/
 onftbuUadx08ZAiMAGbyk7J6XxT9ZEMVlLrKCK73i0wvtVzvrs0MzMIXa A==;
X-CSE-ConnectionGUID: DD25ON9rT9GrLqwYSfKpxA==
X-CSE-MsgGUID: z7Db+R+IQHGlGp3yJKVmhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="24314570"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="24314570"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:27:31 -0700
X-CSE-ConnectionGUID: ECe5UVluT82K/INz5jkaJw==
X-CSE-MsgGUID: 2ngvshMLSGytfL4fwB4N/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="34042085"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 01:27:30 -0700
Date: Fri, 24 May 2024 10:27:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 Introduce SR-IOV VM-level testing tool
Message-ID: <20240524082717.xubc6ltamq6heguz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240523075156.181339-1-adam.miszczak@linux.intel.com>
 <171653032888.2171858.13655760592258601811@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171653032888.2171858.13655760592258601811@8e613ede5ea5>
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
On 2024-05-24 at 05:58:48 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Introduce SR-IOV VM-level testing tool
> URL   : https://patchwork.freedesktop.org/series/133950/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14808_full -> IGTPW_11180_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11180_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11180_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11180/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11180_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14808/shard-snb4/igt@i915_pm_rps@reset.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11180/shard-snb2/igt@i915_pm_rps@reset.html
> 

Unrelated, patch add new tool in tools/

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_14808_full and IGTPW_11180_full:
> 
> ### New IGT tests (22) ###
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [10.65] s
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-hdmi-a1-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [10.58] s
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank@bc-hdmi-a1-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [10.57] s
> 
>   * igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [14.01] s
> 
>   * igt@kms_flip@2x-plain-flip-interruptible@ab-hdmi-a1-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.24] s
> 
>   * igt@kms_flip@2x-plain-flip-interruptible@ac-hdmi-a1-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.18] s
> 
>   * igt@kms_flip@2x-plain-flip-interruptible@bc-hdmi-a1-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.17] s
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check@ab-hdmi-a1-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [10.93] s
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a1-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [10.85] s
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check@bc-hdmi-a1-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [10.83] s
> 
>   * igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.63] s
> 
>   * igt@kms_flip@blocking-wf_vblank@c-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.75] s
> 
>   * igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.20] s
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
>     - Statuses : 1 pass(s)
>     - Exec time: [9.01] s
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
>     - Statuses : 1 pass(s)
>     - Exec time: [9.02] s
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
>     - Statuses : 1 pass(s)
>     - Exec time: [9.01] s
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
>     - Statuses : 2 pass(s)
>     - Exec time: [7.76, 7.93] s
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@d-edp1:
>     - Statuses : 1 pass(s)
>     - Exec time: [8.96] s
> 
>   * igt@kms_flip@flip-vs-modeset-vs-hang@c-hdmi-a1:
>     - Statuses : 1 pass(s)
>     - Exec time: [14.01] s
> 
>   * igt@kms_flip@flip-vs-modeset-vs-hang@c-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [14.02] s
> 
>   * igt@kms_flip@flip-vs-suspend@c-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.90] s
> 
>   * igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.61] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11180_full that come from known issues:
> 

...cut...

> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11180/index.html
