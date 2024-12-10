Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CCCE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 11:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CEB10E88D;
	Tue, 10 Dec 2024 11:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OKfiwDMv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9624410E87C;
 Tue, 10 Dec 2024 11:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733829969; x=1765365969;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qbeyO9b4VeIXJ1mfuFtyqpxR42UYzSPPu9ok1QARDL8=;
 b=OKfiwDMvlEfW+Vz6oobhan05GxpUSoiEzdQmWuwhUQW7q5RUBZjtrhrY
 VmB8WNDDdBTUIy0YB748Gxifd8Og39FdRKyDmnAc/CrZF3bNFnCTypSt0
 DrIgBU5hO90jBh+VIvAmeRclpQ9B8CfXG9dHdSNN9c33F25qDOznOH6DO
 BS5gpoqwf+WD2kLA0GQ1ga59OTFnSMgJdHIcVLiR7eiFqwg/lroqIe5Ia
 iNkLcro9v8ET3rh2JrRJ8v/W6mnOGeyld7RAnWRnZ3WFaoCXLhbu1qqLo
 TMUG47xAssejlCFbj04CFSZqO26S748O4Lhf4QqxS+atWY/Y293CDEQD+ A==;
X-CSE-ConnectionGUID: 8F63AvdFSQO9+fkCgDVrfA==
X-CSE-MsgGUID: HTzK6ca1Ty+azfmk0qQrMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34070066"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34070066"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 03:26:08 -0800
X-CSE-ConnectionGUID: RUFPT+GUR4K7iSa87NBIBQ==
X-CSE-MsgGUID: k5HdKfo1SWKP1BMgKt3ZYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="132766982"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 03:26:07 -0800
Date: Tue, 10 Dec 2024 12:26:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_mmap: fix assert_caching on small-bar
Message-ID: <20241210112604.bul5ppvf6ceef6e6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241122164730.326543-1-matthew.auld@intel.com>
 <173248033595.2570888.7980536342800332664@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173248033595.2570888.7980536342800332664@b555e5b46a47>
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
On 2024-11-24 at 20:32:15 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_mmap: fix assert_caching on small-bar
> URL   : https://patchwork.freedesktop.org/series/141710/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15732_full -> IGTPW_12180_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**

Unrelated to xe test change, no need for respin.

Regards,
Kamil

> 
>   Serious unknown changes coming with IGTPW_12180_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12180_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12180_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ccs@large-ctrl-surf-copy:
>     - shard-rkl:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-7/igt@gem_ccs@large-ctrl-surf-copy.html
>     - shard-dg1:          NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@gem_ccs@large-ctrl-surf-copy.html
>     - shard-tglu:         NOTRUN -> [SKIP][3] +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-6/igt@gem_ccs@large-ctrl-surf-copy.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@vecs0:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-6/igt@gem_ctx_isolation@preservation-s3@vecs0.html
> 
>   * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>     - shard-rkl:          NOTRUN -> [TIMEOUT][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_rpm@gem-idle:
>     - shard-dg2:          [PASS][7] -> [SKIP][8] +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-5/igt@i915_pm_rpm@gem-idle.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@i915_pm_rpm@gem-idle.html
> 
>   * igt@i915_suspend@debugfs-reader:
>     - shard-rkl:          [PASS][9] -> [DMESG-FAIL][10] +1 other test dmesg-fail
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-3/igt@i915_suspend@debugfs-reader.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-3/igt@i915_suspend@debugfs-reader.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x85:
>     - shard-rkl:          [PASS][11] -> [DMESG-WARN][12] +56 other tests dmesg-warn
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][13] +8 other tests dmesg-warn
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-256x256.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][14] +5 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_plane@pixel-format:
>     - shard-dg1:          [PASS][15] -> [INCOMPLETE][16] +1 other test incomplete
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-18/igt@kms_plane@pixel-format.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@kms_plane@pixel-format.html
> 
>   
> #### Warnings ####
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-dg2:          [SKIP][17] ([i915#11078]) -> [SKIP][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@device_reset@cold-reset-bound.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@device_reset@cold-reset-bound.html
> 
>   * igt@gem_pxp@hw-rejects-pxp-buffer:
>     - shard-rkl:          [TIMEOUT][19] ([i915#12917]) -> [FAIL][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-buffer.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>     - shard-dg2:          [SKIP][21] ([i915#2575]) -> [SKIP][22] +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@perf@non-zero-reason:
>     - shard-dg2:          [FAIL][23] ([i915#9100]) -> [SKIP][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@perf@non-zero-reason.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@perf@non-zero-reason.html
> 
>   * igt@perf_pmu@busy-double-start:
>     - shard-dg2:          [FAIL][25] ([i915#4349]) -> [SKIP][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-4/igt@perf_pmu@busy-double-start.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@perf_pmu@busy-double-start.html
> 
>   * igt@perf_pmu@most-busy-idle-check-all:
>     - shard-rkl:          [FAIL][27] ([i915#4349]) -> [DMESG-WARN][28]
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-3/igt@perf_pmu@most-busy-idle-check-all.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_flip@2x-plain-flip:
>     - {shard-dg2-9}:      NOTRUN -> [SKIP][29]
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-9/igt@kms_flip@2x-plain-flip.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12180_full that come from known issues:
> 
...cut...

> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/index.html
