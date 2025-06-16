Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A2AC71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 17:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E3310E338;
	Mon, 16 Jun 2025 17:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHAZ14Xe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2776110E338
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 17:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750094520; x=1781630520;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FNQVDy2CV9qiSp2B3zp1uCm8u6liwWB3Xxl159zjV1s=;
 b=BHAZ14XeqBPJgNxYzZWhpv5q7D5NW14XxG7V7bo/Qucv9vFuXFVo0dsX
 62o2X5RWfCzqydBihDgEXy6WSRDfsJaZuIauXuN9dN6Mi45RDaZvQmsS4
 zx9khQ0jXngE/xkVm1UNedjmreoAM8BUxG5VeEkf4TGo38MqgMZl67nM5
 R7fO7FSv/I6L13CEoiB+qO2mk9QjW/BJauHxoVZ+HohSzu2cCnW7T1JT6
 iX6usUv1CRq6iM1r5dYdiq5fUHp0Z7q/kaP5SoeQWKOpkC3gp69+hvL/V
 D8lcGFeFXsLIWj6gW1WggfEjA+em+Gqrf2PICCIhGyBeGwoHAWqKfGz8l w==;
X-CSE-ConnectionGUID: AT6mbbyYQBOz9MbjXT1dsw==
X-CSE-MsgGUID: FrNJ9/zxRPusmjns4+XlVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52390173"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="52390173"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 10:22:00 -0700
X-CSE-ConnectionGUID: u3sKQK4HQt+OzXvVpuMJuA==
X-CSE-MsgGUID: FFFtOLviSyG7rIzXnDGeFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="148902205"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 10:21:59 -0700
Date: Mon, 16 Jun 2025 19:21:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH v1] tests/kms_vrr/cmrr: Skip display config when commit
 already failed
Message-ID: <20250616172142.ffb6pzfra5svvxkl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 igt-dev@lists.freedesktop.org,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
References: <20250616052920.3418160-1-mitulkumar.ajitkumar.golani@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616052920.3418160-1-mitulkumar.ajitkumar.golani@intel.com>
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

Hi Mitul,
On 2025-06-16 at 10:59:19 +0530, Mitul Golani wrote:

small nit about subject, it is:

[PATCH v1] tests/kms_vrr/cmrr: Skip display config when commit already failed

imho it should be:

[PATCH v1] tests/kms_vrr: Skip display config when commit already failed

Btw this could be fixed at merge, no need for resend.

Regards,
Kamil

> Don't prepare display pipe when commit already failed for tweaked
> display mode. In this case display commit may already been rejected,
> and still test tries to set display params on the same. If corresponding
> CMRR mode is not found and tweaked mode is already failed to commit then
> better further operation should be skipped.
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>  tests/kms_vrr.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index d371d9d7f..01e5f73c0 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -920,13 +920,15 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>  	}
>  
>  	igt_output_override_mode(output, &mode);
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  
> -	prepare_test(data, output, pipe);
> -	result = flip_and_measure_cmrr(data, output, pipe, TEST_DURATION_NS * 2);
> -	igt_assert_f(result > 75,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
> -		     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh), result);
> +	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
> +		prepare_test(data, output, pipe);
> +		result = flip_and_measure_cmrr(data, output, pipe, TEST_DURATION_NS * 2);
> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
> +			     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh),
> +			     result);
> +	}
>  }
>  
>  static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
> -- 
> 2.48.1
> 
