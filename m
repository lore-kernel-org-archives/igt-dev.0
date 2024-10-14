Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0137CFC52C
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 09:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2F110E362;
	Mon, 14 Oct 2024 09:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFDskyvX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D8910E362
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728899592; x=1760435592;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/warWgy+5SwjAJZgX4fyGdr7NKb5iTj4FVG0ptzHnF4=;
 b=NFDskyvX5g2bz/77Dprw3muXd8MVuhdYSTQbln3/4uQzjLCfGEjAQ2sD
 pUbh8Aj+5AqY4LQI3MolmX9noUN4n4ZjA6Rd5k1ENhTTJKt8zH7rCPC8X
 8WMRRhinFh1DS3a1Yhi7uSGeGzhzsz2PrRXhTW8+7IiXhwCnBm8pUumG2
 QYCGs1unlzDisNPodVAApc4JISPfhFvgotuPXWvl7Ykm9nm9guCe5AL3Y
 lBsdVtZxNxTbPrLIBS+xz63ih1EkfrAQg5MlzhExD8WHtZiv0Di67ldi3
 l02Q6AJTO1KwTzqstZ8lbpT1oyx2FUstDBckRf9CDaedBrRdqRBX6cacN w==;
X-CSE-ConnectionGUID: YaN0bnRbS42sxt3jvyyzYQ==
X-CSE-MsgGUID: PiQQAt+HQY+Ii6HgY8xFHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28424411"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="28424411"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 02:53:12 -0700
X-CSE-ConnectionGUID: 8XV7CGrJRMuq3eenCdHnIw==
X-CSE-MsgGUID: gvrVxPhkRsaiGrc7jfBOyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77393909"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 02:53:10 -0700
Date: Mon, 14 Oct 2024 11:53:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH] tests/xe_exec_sip: increase timeout margin for tests
Message-ID: <20241014095308.exz65mo6hv57ubdp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20241011-xe_exec_sip_increase_timeout_margin-v1-1-7adc68a3fbed@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011-xe_exec_sip_increase_timeout_margin-v1-1-7adc68a3fbed@intel.com>
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

Hi Andrzej,
On 2024-10-11 at 15:36:22 +0200, Andrzej Hajda wrote:
> In case engine reset happens 4s timeout margin sometimes is not enough and test
> fails. It happens mostly on LNL due to devcoredump creation.

Could that mension about 'devcoredump creation time' be also put in comment
in a test?

> On CI it does not pass 5s, lets increase it to 8s to be on safe side.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>


With or without it,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_exec_sip.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
> index 2294468c2983..50265c0c6a45 100644
> --- a/tests/intel/xe_exec_sip.c
> +++ b/tests/intel/xe_exec_sip.c
> @@ -274,8 +274,8 @@ static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
>  
>  	vm_id = xe_vm_create(fd, 0, 0);
>  
> -	/* Get timeout for job, and add 4s to ensure timeout processes in subtest. */
> -	timeout = xe_sysfs_get_job_timeout_ms(fd, eci) + 4ull * MSEC_PER_SEC;
> +	/* Get timeout for job, and add 8s to ensure timeout processes in subtest. */
> +	timeout = xe_sysfs_get_job_timeout_ms(fd, eci) + 8ull * MSEC_PER_SEC;
>  	timeout *= NSEC_PER_MSEC;
>  	timeout *= igt_run_in_simulation() ? 10 : 1;
>  
> 
> ---
> base-commit: cc3fa4e36bb0445565f40f989540b9deacb92e12
> change-id: 20241011-xe_exec_sip_increase_timeout_margin-a64bcb49752d
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
