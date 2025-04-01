Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29299C3601A
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 08:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11DE10E512;
	Tue,  1 Apr 2025 08:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dml/L0oh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6270D10E512;
 Tue,  1 Apr 2025 08:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743496378; x=1775032378;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=lealPgRz9jxi2m9I6AtWVuE1v8Y+2UrX6jachS0r2ME=;
 b=Dml/L0oh2r+6dTdty5Db42dkyT7RKlSYfvc+8sCdYohKFKpJDfRxumCf
 aaNGNKI+XODd76rDdAkdHyFvzaDovfVdV1n321SclqDadxLHlpRppWOpd
 j80v9Y0ZUIQKi4tBjNkviQQu2C/TjcH8mt8Y+c9UAW3qAGeXOk5y2C5TZ
 LLnbn3oS5kVT07gmqL8pymFOGibqotiB2CHOzIi4tOXvdSlDiBHj9aHnC
 i6rciF1rX4aUHgj4pe80nl4ylUCra0U9xISnpitPyyJo4Ae+WoSkdSSek
 XuvEAwYwuFpOFDdyhnnW/RAvc4v1Ssw1eJQ68bUHdQSBBl2E/hx5MKcJ+ A==;
X-CSE-ConnectionGUID: Ww6HzBwnQca3BYS8ZKaJLQ==
X-CSE-MsgGUID: PZ2KuMp5QxW7cYNQ3X0ILg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44979116"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="44979116"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 01:32:54 -0700
X-CSE-ConnectionGUID: AgnmF8D0SsyRODqe8/76vw==
X-CSE-MsgGUID: S90aUF3OS0mADrQWcNEHnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="163552900"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 01:32:53 -0700
Message-ID: <7db3db71-2d7a-46a3-b078-5e70ff358189@linux.intel.com>
Date: Tue, 1 Apr 2025 10:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/inte?=
 =?UTF-8?Q?l/intel=5Fsysfs=5Fdebugfs=3A_Unify_sysfs_and_debugfs_testing_=28r?=
 =?UTF-8?Q?ev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250331180538.57393-1-peter.senna@linux.intel.com>
 <174345303947.21282.16998098774139701799@e6b6f09ec485>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174345303947.21282.16998098774139701799@e6b6f09ec485>
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

On 3/31/2025 10:30 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/intel_sysfs_debugfs: Unify sysfs and debugfs testing (rev2)
> URL   : https://patchwork.freedesktop.org/series/146940/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8294 -> IGTPW_12891
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12891 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12891, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12891/index.html
> 
> Participating hosts (43 -> 42)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12891:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-8:         [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8294/bat-mtlp-8/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12891/bat-mtlp-8/igt@i915_selftest@live.html
> 
>   
These are unrelated to my change. Please fix and rerun.

