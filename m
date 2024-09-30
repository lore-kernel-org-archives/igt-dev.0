Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32929CF6497
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 11:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB52610E3E7;
	Mon, 30 Sep 2024 11:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOaASoou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DBD10E034;
 Mon, 30 Sep 2024 11:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727694719; x=1759230719;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=7oQb+xhYO04PmJYiDNwIFD3qQeYNUDX6Ix3SicRCMSk=;
 b=SOaASoou9QaDToZKyAZ7YJW5gvCJhDQ7vOEwk6B7lxlyt41sW/USgK8U
 tOl7JOdZcyj7Zgv/mB3itT/LveSA2/0LZhsIw15ivGwes8IQSYHdQVdMr
 ppvW5RhKskXPyqkFMYCrAZRADsd+wbe4I2rh3bSvHDpBkwSEFRAFSkVJW
 jn1sHpI1ZVYCNZNX9XJypDsaIwr8PHuRv2rVejX+9iiArrazEpuHnCN7o
 SJNsVZ9Cy1ulaGUvagMZv8SB3SSr3gjDB7svn1TPsnxRHywYKQKeh1ocM
 yyZpPTPKl631ftRBOHQMV8bP+Qo7Iyi95ZWbMMeUZZSuyIW/yhO9PYfnU A==;
X-CSE-ConnectionGUID: uK7qXVZ3SK+38CemO6ucpw==
X-CSE-MsgGUID: Tq5jdpFPTcWWsJ1wrauWDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37336475"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="37336475"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 04:11:59 -0700
X-CSE-ConnectionGUID: LVqi4FoHQemtZFL8wMaXvw==
X-CSE-MsgGUID: teLcGp9WTYaDxcoesTYqrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="77351032"
Received: from morganmc-mobl.ger.corp.intel.com (HELO [10.213.199.177])
 ([10.213.199.177])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 04:11:57 -0700
Message-ID: <ffca202b-48d4-4cfd-85d3-84b20e4c863b@linux.intel.com>
Date: Mon, 30 Sep 2024 13:11:54 +0200
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

Dear I915,

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

These are not related to my change. Please update the filters.

[...]
