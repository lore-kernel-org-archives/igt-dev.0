Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CD0CEACCB
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 14:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749C110E62E;
	Tue,  1 Oct 2024 14:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4UI7vDH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BBF10E17A;
 Tue,  1 Oct 2024 14:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727792196; x=1759328196;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=l0/e9+P1K4yXQbBtVFwcgdj7YXnpa7r8CE9ShZ6OJHg=;
 b=d4UI7vDH3D9GaRc1/GzTfqJuwAFD7INKcYkB+Ps3k6+DP/JNElR+vC2T
 84xRRTWkLXFx6kad8+n0T1HsABu3pVKVd+Hx9ObinoK5XQls9E0PkUEW6
 St2Sar1z0sM2cpHJ6UL/ihLsfbiT62fZ/Y/3Y224JvQGDQtCLNOqCb1N3
 brqLlW1he0zp5fAOAeME+gKb1XGce/G7g+TXbD2plDlMjJfaNUna3JdVZ
 FKJhDlaLR4hVUkHEorF29cU7HK+wW5ovApoTYdLLhvRXXEmJw/7XI/OM0
 +PtTawsDJfy43wPtLXxCE/c2bvfgNj0mDuhxt2WuRZiqtxEyNqPxdlFWx g==;
X-CSE-ConnectionGUID: dRsJTWTXSji1qq7YhYSCYA==
X-CSE-MsgGUID: kw7hT6LgTH2pfxa/N09VMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30722814"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="30722814"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:16:35 -0700
X-CSE-ConnectionGUID: M7kQuB5lTeGwrp+0HQjAbg==
X-CSE-MsgGUID: lKFbbtE+QwWWaPKg038cJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="74096770"
Received: from jodecoox-mobl.amr.corp.intel.com (HELO [10.213.200.59])
 ([10.213.200.59])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:16:35 -0700
Message-ID: <8f07e943-cff1-4d07-a089-f2615976845f@linux.intel.com>
Date: Tue, 1 Oct 2024 16:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?xe=5Fpm=3A_Fix_code_style_issues_=28rev2=29?=
To: I915-ci-infra@lists.freedesktop.org,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <d779e0b6-46c7-4345-b9f9-75fe61e3cb2b@linux.intel.com>
 <172779059101.1142067.2859277679938706136@2413ebb6fbb6>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <172779059101.1142067.2859277679938706136@2413ebb6fbb6>
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

On 01.10.2024 15:49, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_pm: Fix code style issues (rev2)
> URL   : https://patchwork.freedesktop.org/series/139357/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8047 -> IGTPW_11851
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11851 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11851, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11851/index.html
> 
> Participating hosts (44 -> 42)
> ------------------------------
> 
>   Missing    (2): bat-rpls-4 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11851:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@sanitycheck:
>     - bat-dg2-11:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8047/bat-dg2-11/igt@i915_selftest@live@sanitycheck.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11851/bat-dg2-11/igt@i915_selftest@live@sanitycheck.html

These are unrelated to the change.

[...]
