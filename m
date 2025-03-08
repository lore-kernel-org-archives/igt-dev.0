Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1621C28B28
	for <igt-dev@archiver.kernel.org>; Sat,  8 Mar 2025 07:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDD610E207;
	Sat,  8 Mar 2025 07:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bE5n1HMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644F210E207;
 Sat,  8 Mar 2025 07:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741420136; x=1772956136;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=QYWD4UK77Y3wq/EwMcI/0jmpcs9zJBf8V89J3B3421w=;
 b=bE5n1HMlFEzIOTQQOwqmOtpWn0u76gbJ7JrkZ4LXwNebbVQgzod9WD11
 43bDtluhNqqArFlojoMKOCR64TRzbKtqyMA/3F0pcY0DJYogSVe6P6ITP
 8IwuiHdHZ1ow/Lxj12zpddFPuOdVWGxVX81ucdSLMXM8K6gPhcZJzZ05z
 8reSBNeTSIV2k/Rx0JbQFc0xWx20228XSf+aMEZH1r9q25DdQFUA8xp1z
 B7PVTzWpxdrUQPttzdHyVC72uS8fvaaQVXz8mkclf4XX9Ez0j7BCSBjlO
 zW0IaBKVy07fPK9/gAnQCmgRFSfv72y1JTaDbtFFSgMJAd/4vObcNsiKA A==;
X-CSE-ConnectionGUID: NSlpK1wGS1aagOdhFqK3+Q==
X-CSE-MsgGUID: Kg0qNIBcSDm8L5U6+ecDmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42350782"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; d="scan'208";a="42350782"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 23:48:55 -0800
X-CSE-ConnectionGUID: O3hYDSsEQTaXYfFTzNqJQA==
X-CSE-MsgGUID: 88DHO2yTT6+SMX0B4/epDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120427396"
Received: from jledworo-mobl.ger.corp.intel.com (HELO [10.245.114.21])
 ([10.245.114.21])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 23:48:53 -0800
Message-ID: <bb67e199-1a8b-4051-a76c-8dd168793feb@linux.intel.com>
Date: Sat, 8 Mar 2025 08:48:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Integrate?=
 =?UTF-8?Q?_kmemleak_scans_in_igt=5Frunner_=28rev6=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250307093426.90479-1-peter.senna@linux.intel.com>
 <174139828756.4949.16053114640855089800@18a75f3d1eae>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174139828756.4949.16053114640855089800@18a75f3d1eae>
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

On 08.03.2025 02:44, Patchwork wrote:
> == Series Details ==
> 
> Series: Integrate kmemleak scans in igt_runner (rev6)
> URL   : https://patchwork.freedesktop.org/series/143996/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8265_full -> IGTPW_12726_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12726_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12726_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12726/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12726_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_mmap_offset@mmap-unmap@smem0:
>     - shard-snb:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8265/shard-snb2/igt@gem_mmap_offset@mmap-unmap@smem0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12726/shard-snb4/igt@gem_mmap_offset@mmap-unmap@smem0.html
> 
>   * igt@i915_pm_rpm@debugfs-read:
>     - shard-rkl:          [PASS][3] -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8265/shard-rkl-7/igt@i915_pm_rpm@debugfs-read.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12726/shard-rkl-4/igt@i915_pm_rpm@debugfs-read.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - shard-rkl:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8265/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12726/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 

These are unrelated. Please re-run.

Thank you,

Peter

[...]
