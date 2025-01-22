Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D6EC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 08:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB7110E68D;
	Wed, 22 Jan 2025 08:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kr6tpWZT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C961910E68D;
 Wed, 22 Jan 2025 08:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737534319; x=1769070319;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=dQbNEtwzBTHtG1dbloAsOORISb9EkTyRfcrupZkq8V0=;
 b=kr6tpWZTmFpmaPVgKI9gIa61sUqg1bdzqznHORvvV6OOL8sqlGD8F0RH
 rEWEQnvsnNOopXFST/wCxnh8M3doW63kT4KoBw167UVzFN84HTGmD4JUb
 6zWbIEclLgudQGFW5aX5dZYlHyDGcGFvm7uhU1+BPSbFhYg0zaVj857AD
 /VsPuru+p5e8C26L/C36mB10YUnDb4LTulhcjmSfDIg15m2vxc6SHmFwf
 9q9LNW9mLWPUJ0YhEK9Mijg66Jcblk0JrmZygKn8gbPD1iymFRSonZDbf
 hIeNcmmC+2lETYeNHx5pz9hMJ0JP40BYM5T1sWkCvVF0yhZLb5t3Q77Zm Q==;
X-CSE-ConnectionGUID: T6882JXGRhyNpLSagASuaw==
X-CSE-MsgGUID: HPxDP4eeR7OM798jqqobWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38081146"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38081146"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 00:25:18 -0800
X-CSE-ConnectionGUID: o4y/rasRShWGeqwuaMjBMg==
X-CSE-MsgGUID: 5gTmVBkSRt613K9m8yBQyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="107672005"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 00:25:17 -0800
Message-ID: <be67441d-74c4-4d24-afe6-e4f4bad1a121@linux.intel.com>
Date: Wed, 22 Jan 2025 09:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Integrat_?=
 =?UTF-8?Q?kmemleak_scans_in_igt=5Frunner?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
 <173750861737.2837194.5013051827516821568@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173750861737.2837194.5013051827516821568@b555e5b46a47>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear I915,

On 22.01.2025 02:16, Patchwork wrote:
> == Series Details ==
> 
> Series: Integrat kmemleak scans in igt_runner
> URL   : https://patchwork.freedesktop.org/series/143791/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8202_full -> IGTPW_12473_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12473_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12473_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12473/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12473_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_madvise@dontneed-after-mmap:
>     - shard-dg2:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12473/shard-dg2-7/igt@gem_madvise@dontneed-after-mmap.html
> 
>   * igt@gem_workarounds@reset-fd:
>     - shard-mtlp:         NOTRUN -> [ABORT][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12473/shard-mtlp-4/igt@gem_workarounds@reset-fd.html
> 
>   * igt@i915_pm_rpm@system-suspend-execbuf:
>     - shard-rkl:          [PASS][3] -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8202/shard-rkl-4/igt@i915_pm_rpm@system-suspend-execbuf.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12473/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [FAIL][5] +2 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12473/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
>     - shard-rkl:          [PASS][6] -> [FAIL][7] +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8202/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12473/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
>     - shard-mtlp:         [PASS][8] -> [ABORT][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8202/shard-mtlp-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12473/shard-mtlp-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_psr@psr2-no-drrs@edp-1:
>     - shard-mtlp:         NOTRUN -> [FAIL][10] +1 other test fail
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12473/shard-mtlp-2/igt@kms_psr@psr2-no-drrs@edp-1.html
> 
>   * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][11]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12473/shard-rkl-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html
> 
>   * igt@perf_pmu@busy-accuracy-2@vecs0:
>     - shard-mtlp:         [PASS][12] -> [FAIL][13] +1 other test fail
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8202/shard-mtlp-6/igt@perf_pmu@busy-accuracy-2@vecs0.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12473/shard-mtlp-3/igt@perf_pmu@busy-accuracy-2@vecs0.html

These are unrelated to my change. Please fix and rerun.

Thanks,

Peter
