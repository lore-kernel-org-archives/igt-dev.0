Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B372FC0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 13:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCD010E04F;
	Wed, 29 Jan 2025 13:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KTObc9y/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A853F10E04F;
 Wed, 29 Jan 2025 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738156787; x=1769692787;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=gfF/OBOBapaS3HaXvreF/DBtsDUuWhrgtBwZml+v8rI=;
 b=KTObc9y/tJ7sjFiyMyDf4FpV6cZL80P1hJw4dHL7td2/wKW1yYh4oVly
 O6EDEWp6JEyXuanOVYMXpNI4kkx1P65taKDwsCv4oZQf2/OrWSf5sYNTr
 Nvvg403HUEd4eski9817XQkqQfaVhHfcgJxvR2LMBgjbwJTOQ3l5ULm5P
 km1/+jdkT+YT+PzVU1POBLUC6ES+shqCSmeR3VwWmyS/dDPcwEkE9ey74
 DJiT2UUFI2Bo8f4zyMAtjklRu3LV1YbRYw1xy12HFM8U5uqdXz+70jxAR
 xJgepoK7vsiHSzFhPoZPIHznnZhbOElBCI3uymj2b5sevgSMW4yoONXR1 A==;
X-CSE-ConnectionGUID: cuM6Ww8bRcC2MoBnv86u4g==
X-CSE-MsgGUID: ZsnDQRnrTY2QOra+FK3JYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38573478"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="38573478"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 05:19:46 -0800
X-CSE-ConnectionGUID: Qhc9hzTpRbWfRrahZqPCFQ==
X-CSE-MsgGUID: hjdMV597QPy0WS4/75ZWtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="109619524"
Received: from nwochtma-mobl.ger.corp.intel.com (HELO [10.245.83.54])
 ([10.245.83.54])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 05:19:45 -0800
Message-ID: <437ae65f-b434-44b4-b91a-0b6c9978295f@linux.intel.com>
Date: Wed, 29 Jan 2025 14:19:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Integrate?=
 =?UTF-8?Q?_kmemleak_scans_in_igt=5Frunner_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <173814993873.2353200.11583681237015847203@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173814993873.2353200.11583681237015847203@b555e5b46a47>
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


On 29.01.2025 12:25, Patchwork wrote:
> == Series Details ==
> 
> Series: Integrate kmemleak scans in igt_runner (rev2)
> URL   : https://patchwork.freedesktop.org/series/143996/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16035_full -> IGTPW_12508_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12508_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12508_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12508/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12508_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@in-flight-contexts-immediate:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16035/shard-mtlp-1/igt@gem_eio@in-flight-contexts-immediate.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12508/shard-mtlp-7/igt@gem_eio@in-flight-contexts-immediate.html
> 
>   * igt@gem_softpin@allocator-evict@ccs0:
>     - shard-dg2:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16035/shard-dg2-1/igt@gem_softpin@allocator-evict@ccs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12508/shard-dg2-8/igt@gem_softpin@allocator-evict@ccs0.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-dg2:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16035/shard-dg2-6/igt@i915_pm_rps@reset.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12508/shard-dg2-10/igt@i915_pm_rps@reset.html
>     - shard-dg1:          [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16035/shard-dg1-18/igt@i915_pm_rps@reset.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12508/shard-dg1-12/igt@i915_pm_rps@reset.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-tglu:         NOTRUN -> [ABORT][9]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12508/shard-tglu-7/igt@kms_prime@basic-modeset-hybrid.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-mtlp:         [SKIP][10] ([i915#12316]) -> [ABORT][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16035/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12508/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
>     - shard-mtlp:         [SKIP][12] ([i915#9808]) -> [ABORT][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16035/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12508/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

These are unrelated to my change. Please fix and rerun.

[...]
