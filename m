Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0DBE77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 15:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0837610E0D4;
	Wed, 18 Dec 2024 15:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HInoeo8J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2843A10E0D4
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734534094; x=1766070094;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zT9zEXLItaoNdJS7LdrLbet+vHXzutjv7lDRvC8xe3I=;
 b=HInoeo8JZuda3MTfyXAaYGF56AUP7XEM4eZRC1snNX3CmEaafMGULTPt
 QyV4wDV29lAuPd2meNrTw38hBGvBs+BF9wMcaJaEX0PtcWFNonu5OtvUz
 bTrZrQImp5FdyYDulTxJWBVmc/nMbswlq8uuTJKuonen5u2FLnW9brksp
 fHQvaniHeM6Bf4ukLBPiXux5IP/Zuu1FLKxBaSO9pi3GE1siCcNslyVjR
 uALDWACM04SbjfpBSxtx4JyYsW5nNWbDUwJv4EkdA11WpPMrjvfL/CYbM
 u4qQmOOkE4LhHv8vDf74F+d68zzZO5DcCVl6t0NHwKYyqq0mQ65KOg6t1 A==;
X-CSE-ConnectionGUID: YMUmw2SfT/6SCbugkpxApQ==
X-CSE-MsgGUID: 0CylyIrVSPS/sPIqv3xF1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35228808"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35228808"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 07:01:34 -0800
X-CSE-ConnectionGUID: /JMRjoeKSz2O0L1EXnqBjQ==
X-CSE-MsgGUID: rBjJ1+lwQsOH7ggfZb9O2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97727181"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 07:01:32 -0800
Date: Wed, 18 Dec 2024 16:01:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] intel-ci/xe.blocklist: Block the updated shrink test
Message-ID: <20241218150129.um4kmk2ptv44owue@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
References: <20241218142407.2558613-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218142407.2558613-1-nirmoy.das@intel.com>
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

Hi Nirmoy,
On 2024-12-18 at 15:24:07 +0100, Nirmoy Das wrote:
> xe_bo_shrink_kunit, sub-dynamic test is now updated to be a subtest
> in the kernel so update this blocklist accordingly.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe.blocklist.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index e29e745a0..189cc25a7 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -31,7 +31,7 @@ igt@kms_selftest.*
>  ##################################################################
>  # Exclude slow KUnit test which should run as manual test
>  ##################################################################
> -igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit
> +igt@xe_live_ktest@xe_bo_shrink
>  ##################################################################
>  # Exclude all other non-Xe tests
>  ##################################################################
> -- 
> 2.46.0
> 
