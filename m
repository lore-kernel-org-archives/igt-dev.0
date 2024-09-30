Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD57FCF6497
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 10:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8CE10E3E6;
	Mon, 30 Sep 2024 10:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQqO9niV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5881010E2E3;
 Mon, 30 Sep 2024 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727693505; x=1759229505;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kYmgH0wWN6ijXMc4/lOK0Yl/SA9GtSNP8tAB30gmWys=;
 b=YQqO9niVWCHVVUKznuQl/xtxehimeNahVCNOReeCrzjCkKbyWdbbnjy4
 y9b2pfNMqQHpxpNfr91j/JEXJLdkJ9PmrgRpF52fJPC/jy/LX2l/H0nAq
 ey/UASHNQQ+2l/vdFd9Q4Wl4yLPhH/ZvkaxWEdzacur8KVLb+WPuVaKUY
 W2T5zmfC+b0scDj+CBrxQ6aNXf/8Y+xhBD2gbK+nRJoZSo0g80pxvrmCH
 uF6mAW01Mth6NpvNWg0jspo4e+rQK4x5sWqd3xFSaK5llyQJWyhXS8wfX
 3b3OimPltJ0S2uP9OwVR3OtBLGtS2vhxymb9P8I1iVqK+QV19mAUpbKSL g==;
X-CSE-ConnectionGUID: SMOIMGd9T+O/xu7NLd+YJA==
X-CSE-MsgGUID: 9ZftYydTQe6yiw0fnRS40Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26283190"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="26283190"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 03:51:45 -0700
X-CSE-ConnectionGUID: YDzbyiWcRg+4CnIlr2iDSQ==
X-CSE-MsgGUID: cQJ3w3X/TsKm8y+sIY38jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="110744350"
Received: from morganmc-mobl.ger.corp.intel.com (HELO [10.213.199.177])
 ([10.213.199.177])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 03:51:45 -0700
Message-ID: <cccd11e9-fe1e-4cb6-bbf7-82c4bb2b1d42@linux.intel.com>
Date: Mon, 30 Sep 2024 12:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?xe=5Fpm=3A_one_suspend/resume_cycle_for_all_xe_engines_=28rev4=29?=
To: I915-ci-infra@lists.freedesktop.org,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <5cdb17b6-7045-40c7-89b1-b55b6eff6623@linux.intel.com>
 <172751200335.1131165.9379578556745596604@2413ebb6fbb6>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <172751200335.1131165.9379578556745596604@2413ebb6fbb6>
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

Dear I915

On 28.09.2024 10:26, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_pm: one suspend/resume cycle for all xe engines (rev4)
> URL   : https://patchwork.freedesktop.org/series/139093/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15454 -> IGTPW_11832
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11832 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11832, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11832/index.html
> 
> Participating hosts (37 -> 35)
> ------------------------------
> 
>   Missing    (2): bat-dg2-13 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11832:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - fi-hsw-4770:        [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15454/fi-hsw-4770/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11832/fi-hsw-4770/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@sanitycheck:
>     - bat-dg2-9:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15454/bat-dg2-9/igt@i915_selftest@live@sanitycheck.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11832/bat-dg2-9/igt@i915_selftest@live@sanitycheck.html
> 

These are unrelated to my change. Please update the filters.

[...]
