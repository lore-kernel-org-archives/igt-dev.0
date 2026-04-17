Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046B3F43697
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 12:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8590A10E2B7;
	Fri, 17 Apr 2026 12:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0GA2PBJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B5010E2B7
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 12:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776429277; x=1807965277;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uN+2CenZvtCmZJH/CarxCLLbtPr/vItTYHahGZ4Qvek=;
 b=H0GA2PBJvEexxNopNmb779PFDG9r4E8cp2qxj4vmaqPqdyjJ6jrCwyfX
 fGxPvoVjaxTIA9I6Y4ngqwzYsUvWYa3DMegWIHzrZcNSI66QbVgNKxy14
 mV/TFI2X4q4bs75Va/IoAxPHvAdVyYGBuKPrvTaE6kKv5r/trE5Lq7Fsw
 th2i6TERWvQktoZIM1QBasRntiNQLkgDSA//NTm5T1WC5bJBSQjQOAGz3
 z5zfNSc7GNFHGMtlUgQqHfqKOqnZh0B5KNdN0e6H05S5k7UYftgBtAvuR
 0dh8U/PO6EU5DSEVNkj4FsZ2chYvAGy97FrLn2TD21wnnRj5mO1qNzgpK g==;
X-CSE-ConnectionGUID: rZSf8LeuTpq0nSu7j0gnMw==
X-CSE-MsgGUID: wkl+o/vVQdeXrrxAZA+ghQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77516193"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77516193"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 05:34:34 -0700
X-CSE-ConnectionGUID: uuSkkeApST+A//fDcUvXpw==
X-CSE-MsgGUID: g0zkEip2Rjytm70VCkbJSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="235986491"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.245.176])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 05:34:34 -0700
Date: Fri, 17 Apr 2026 15:34:31 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
Subject: Re: [PATCH v2 0/7] Remove deep-pkgc subtest
Message-ID: <aeIo15_JaYs0A_Y7@intel.com>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260417083506.33404-1-mohammed.thasleem@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, Apr 17, 2026 at 02:04:59PM +0530, Mohammed Thasleem wrote:
> Remove the deep-pkgc subtest as it depends on other display IPs which makes
> testing unreliable. Current validation uses Package C-state counters that
> are affected by unrelated system components and requires platform-specific
> checks that vary across different platforms.
> A redesigned test with proper display IP isolation will be implemented
> in a future patch.

What is the actual plan for that? How would it even be implemented
and when should we expect to get it?

> 
> Mohammed Thasleem (7):
>   Revert "tests/intel/kms_pm_dc: Ensure eDP detection before skipping
>     test"
>   Revert "tests/intel/kms_pm_dc: Add polling for deep-pkgc"
>   Revert "tests/intel/kms_pm_dc: Update test duration to 4 seconds"
>   Revert "tests/intel/kms_pm_dc: Update VRR handling and eDP output
>     check"
>   Revert "tests/intel/kms_pm_dc: Add time unit macros and update delay
>     calculation"
>   Revert "tests/intel/kms_pm_dc: Add a new test to validate the deep
>     sleep state during extended vblank"
>   tests/intel/kms_pm_dc: Remove unused pkgc functions
> 
>  tests/intel/kms_pm_dc.c | 98 -----------------------------------------
>  1 file changed, 98 deletions(-)
> 
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
