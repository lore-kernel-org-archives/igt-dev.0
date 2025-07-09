Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD8BC83F03
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 08:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC3710E762;
	Wed,  9 Jul 2025 08:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ig43pAZV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905F310E760;
 Wed,  9 Jul 2025 08:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752048766; x=1783584766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d9/xXwsxzoKbE6QMYtG2JLdwRu6+bL8l0pqs6JIs4ck=;
 b=Ig43pAZV/N38g2QTDuENR3G5sYr8q9zuguxTJ1TTyjDWXXagsW3nzkHG
 biWN5yXYGjjQ1zQBkcF8lISvfmD2Wk1hq6yNdjOyLSofzDbEWvWEDrq4J
 0BFKiPwyl9iqNv5AW1MlhoP2DJcg3Def+PSC6iLbHd7f5Tn1t87cULqkb
 +IbHZa6TAdZuoMKZTZ7OXXDj5jN96CVhxevyAKKp64n6Ds2jjBL+FY6aj
 68+0mSJkzboGN0FlXeKV+sPRk7ammdigwYsdtuYSWe3QxLp+8GP7yRfDZ
 bpxtgKzARG/u08UfFTNBf2Pw7Cr9SGX9JLdJJjYe8A0BzVqenJDP9r7cp w==;
X-CSE-ConnectionGUID: zkPAVSV7Sk6MAa/b19+Z7g==
X-CSE-MsgGUID: AFuVnvNmRXC282SEih0qRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53516371"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="53516371"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 01:12:46 -0700
X-CSE-ConnectionGUID: R9diS5C/TG67zQSZC8WVYA==
X-CSE-MsgGUID: NXEt9Da4RbiNXSLfkYXLvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155132460"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.245.151])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 01:12:45 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.BAT: failure for runner: Relax timeout
 reduction on soft lockup (rev2)
Date: Wed, 09 Jul 2025 10:12:42 +0200
Message-ID: <1972516.6tgchFWduM@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <175200737579.145757.3823429970788938737@1538d3639d33>
References: <20250708130437.917619-2-janusz.krzysztofik@linux.intel.com>
 <175200737579.145757.3823429970788938737@1538d3639d33>
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

Hi Bug Filing,

On Tuesday, 8 July 2025 22:42:55 CEST Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Relax timeout reduction on soft lockup (rev2)
> URL   : https://patchwork.freedesktop.org/series/151190/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8447 -> IGTPW_13431
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13431 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13431, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13431/index.html
> 
> Participating hosts (45 -> 44)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13431:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - bat-rplp-1:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8447/bat-rplp-1/igt@i915_selftest@live@gt_mocs.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13431/bat-rplp-1/igt@i915_selftest@live@gt_mocs.html

Call trace looks the same as those reported to 
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14365, please update 
filters and re-report.

Thanks,
Janusz


