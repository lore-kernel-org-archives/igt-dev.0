Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECFACD1284
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 11:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D337910E6C5;
	Thu,  4 Apr 2024 11:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGOA+Zo2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B645310E6C5;
 Thu,  4 Apr 2024 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712230354; x=1743766354;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Iq8d15F9LhlvM4MJA8XCbr0tNRBneXLYLui2jH2sn8g=;
 b=IGOA+Zo2Rtrs3bjcRuyWscVmYEdGQ6eqkxGdSHevhCpP/HOZBuykg0J3
 ekaUarsnW1a39eKAm2St1VJLj9UkTM7aRmo5mW1jKVJID3MFrvqLgqoK3
 rcq2OsTn86uffClVt1utvm3t2qCw9C9jjRmLVWhhtrigzTLEphwUzcK7t
 xF8ir+dEpOxY7/RAmyDhxFkUqDY9B1/qQKmZaKhyVNjirtTF5tWle8l3V
 wFms88FSDJNg9RToqOWsTASIZCdtDC8BVOmjETBvEBj9+NN7eXE2hES1l
 HNPTFk3SlT+vbDBANJej//l1q93mSvU/ynFCPRi+CCD36yjkj07OmjnVm w==;
X-CSE-ConnectionGUID: sPWeGUeqRRyTHwWtxZG1Qg==
X-CSE-MsgGUID: PQF73hk6TKOwEJ+Vr9pXuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11278950"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="11278950"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 04:32:32 -0700
X-CSE-ConnectionGUID: 9FAIhJEoTM6JpVaaW3dEIg==
X-CSE-MsgGUID: IK2eU91yTCi+QSI6zBj+Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="19197668"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 04:32:31 -0700
Date: Thu, 4 Apr 2024 13:32:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 scripts/doc_to_xls.py: fix spreadsheet generation
Message-ID: <20240404113209.yih66eceqljkrayp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240402085702.830658-1-mauro.chehab@linux.intel.com>
 <171209787413.1155664.6530730622035947059@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171209787413.1155664.6530730622035947059@8e613ede5ea5>
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
On 2024-04-02 at 22:44:34 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: scripts/doc_to_xls.py: fix spreadsheet generation
> URL   : https://patchwork.freedesktop.org/series/131921/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14515_full -> IGTPW_10964_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10964_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10964_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10964_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][1] +8 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/shard-rkl-4/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@i915_pm_rpm@gem-idle:
>     - shard-dg1:          NOTRUN -> [SKIP][2] +6 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/shard-dg1-13/igt@i915_pm_rpm@gem-idle.html
> 
>   * igt@i915_pm_rpm@system-suspend-devices:
>     - shard-mtlp:         NOTRUN -> [SKIP][3] +8 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/shard-mtlp-2/igt@i915_pm_rpm@system-suspend-devices.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/shard-mtlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-edp1:
>     - shard-mtlp:         NOTRUN -> [DMESG-WARN][5] +15 other tests dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/shard-mtlp-3/igt@kms_flip@flip-vs-suspend@b-edp1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [DMESG-WARN][6] +15 other tests dmesg-warn
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][7] +16 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-tglu:         NOTRUN -> [SKIP][8] +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/shard-tglu-5/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-rkl:          NOTRUN -> [SKIP][9] +7 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][10] +12 other tests dmesg-warn
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/shard-dg2-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [DMESG-WARN][11] +11 other tests dmesg-warn
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/shard-dg1-13/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-3.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-rkl:          [DMESG-FAIL][12] -> [DMESG-WARN][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14515/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_setmode@basic@pipe-b-hdmi-a-1:
>     - shard-snb:          [FAIL][14] ([i915#5465]) -> [FAIL][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14515/shard-snb7/igt@kms_setmode@basic@pipe-b-hdmi-a-1.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/shard-snb7/igt@kms_setmode@basic@pipe-b-hdmi-a-1.html
> 

These are unrelated to change in script/
No need for re-run, patch is already merged.

Regards,
Kamil

...cut...
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10964/index.html
