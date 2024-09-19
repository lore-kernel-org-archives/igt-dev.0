Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C68CCF3962
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 18:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417C410E75D;
	Thu, 19 Sep 2024 18:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JW1HdwUt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BEA10E75D
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 18:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726770952; x=1758306952;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zUNapxNRO266JS8f8RcpD357N0lvmUXB0slYHBo3kvE=;
 b=JW1HdwUtgoE/ki/loCXYSVZSNmgq8KVwjSoSwRgorlOoxuWnuPxqkuzX
 PjFEUtZSZGTApDBFHKdigMeQOLMoC1/XJli6FlbbwDd7BLTZuCM8zp/t8
 JAM6oA22He//YiIDgOEv6gpqPlu5aq8t4pVYi1b3AG1rlxi/XVApPEYqq
 HFMstcIXrqe58iZsyc/u0D2O1pBPh7uevFf+Ohp/v75dYWrQbDk2Ns2Bs
 ivbwVSqkKhKfXgSM2YVrD9aYyAXbLwrXrfKUVl9nyKlmui9MnWtuufWRN
 /Smqj+W0HyquqNTBAeX4xt0Di4L4eKSg4sN3TzWKMQIa9aLh910dcjUw5 A==;
X-CSE-ConnectionGUID: TLUZsD5qSyqFUnt9r6kCRg==
X-CSE-MsgGUID: YPHdRJyMQPeWv2Nf4h91zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="51168343"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="51168343"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 11:35:51 -0700
X-CSE-ConnectionGUID: uuRmXYUVQ2a3Bb3tWztm8w==
X-CSE-MsgGUID: a2x2nLvhSbW1DfembRHrZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="70159575"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 19 Sep 2024 11:35:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 19 Sep 2024 21:35:48 +0300
Date: Thu, 19 Sep 2024 21:35:48 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Bommithi Sakeena <bommithi.sakeena@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_pm_residency: Fix while loop in
 toggle_gt_c6
Message-ID: <ZuxvBL2FbkOT8OZp@intel.com>
References: <20240919165950.50879-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240919165950.50879-1-rodrigo.vivi@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Sep 19, 2024 at 12:59:50PM -0400, Rodrigo Vivi wrote:
> From: Bommithi Sakeena <bommithi.sakeena@intel.com>
> 
> Function toggle_gt_c6 has while loop iterating for (NUM_REPS +1)
> times. Correct it to iterate to NUM_REPS times.
> 
> Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tests/intel/xe_pm_residency.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 0e687558b..f4d05889c 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -297,7 +297,7 @@ static void toggle_gt_c6(int fd, int n)
>  
>  		if (n == NUM_REPS)
>  			measure_power(&gpu, &gt_c6_power);
> -	} while (n--);
> +	} while (--n);

Why isn't that just a canonical for loop?

>  
>  	igt_power_close(&gpu);
>  	igt_info("GPU consumed %fmW in GT C6 and %fmW in GT C0\n", gt_c6_power, gt_c0_power);
> -- 
> 2.46.0

-- 
Ville Syrjälä
Intel
