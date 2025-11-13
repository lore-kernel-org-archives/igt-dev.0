Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529E0CD5BC2
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 10:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A63D10E78D;
	Thu, 13 Nov 2025 10:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6FUU30g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D58410E6D8;
 Thu, 13 Nov 2025 10:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763031550; x=1794567550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hDZcbrum0ngaACPac93ZCoTD4wk8nx1NE6lI0l4MRgw=;
 b=b6FUU30gqOXgJi06kfPZaEt4LY1szx1wKPwlsMLGGTiO8o6lfStl0kV2
 xDCxzPilN6su39u+etoMRlqp0hEGIC6EQKCxdAJHGv7tFwnF6b6HQN2B9
 ZcNNzB0zyfwgHBp4XGvT6fnSK4c+X+T1LyeVO87L9Y112EPOYBcbk9MGu
 7qWuaqTSOE+Ce5EZjHVELbCEAUeliYWinO1PbdAArIE/jOjJmXRIbWk2E
 QTov0OpWVHQukuxhl2GKdWHjCOPypI7g6ZwCq7FzSk4/5GEYYG5PUsZJS
 25ep/xU9f4acwa/q9rZag7NUvWjvs+FmG+S5AcViuqzWijcAPTfy/5bn3 w==;
X-CSE-ConnectionGUID: cWaSIwh1THqIXB3CFpIkxQ==
X-CSE-MsgGUID: GA7Tp/uHQNa60LV+/m2QRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65201965"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65201965"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 02:59:10 -0800
X-CSE-ConnectionGUID: 6LCbhKDWTNCzpfSsvjlAqA==
X-CSE-MsgGUID: U8GzcVS7Q8GWj25K2o9hMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="188745468"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.158])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 02:59:10 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.Full: failure for
 tests/gem_lmem_swapping: Run smem-oom helper loop in background
Date: Thu, 13 Nov 2025 11:59:06 +0100
Message-ID: <13158851.VsHLxoZxqI@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176302360206.48346.2771500328291882681@10055242dc62>
References: <20251112104913.701052-2-janusz.krzysztofik@linux.intel.com>
 <176302360206.48346.2771500328291882681@10055242dc62>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi I915-ci-infra@lists.freedesktop.org,

On Thursday, 13 November 2025 09:46:42 CET Patchwork wrote:
> == Series Details ==
> 
> Series: tests/gem_lmem_swapping: Run smem-oom helper loop in background
> URL   : https://patchwork.freedesktop.org/series/157429/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17531_full -> IGTPW_14044_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14044_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14044_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14044/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14044_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_addfb_basic@legacy-format:
>     - shard-dg1:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17531/shard-dg1-18/igt@kms_addfb_basic@legacy-format.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14044/shard-dg1-13/igt@kms_addfb_basic@legacy-format.html
> 
>   * igt@kms_plane@plane-panning-top-left@pipe-a:
>     - shard-mtlp:         [PASS][3] -> [FAIL][4] +2 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17531/shard-mtlp-3/igt@kms_plane@plane-panning-top-left@pipe-a.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14044/shard-mtlp-6/igt@kms_plane@plane-panning-top-left@pipe-a.html

The above two tests are in any way related to the change under this pre-merge 
testing, which can only affect gem_lmem_swapping test, nothing more.  Please 
update CBL filters and re-report.

Thanks,
Janusz

> 
>   
> New tests
> ---------
...


