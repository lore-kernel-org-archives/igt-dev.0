Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51646C83038
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 16:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E750910E2D5;
	Tue,  1 Jul 2025 16:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="foUFjAhP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0757710E2D5
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 16:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751386156; x=1782922156;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+wHArhLIQ8X6LOJbWLKMls1Djn74F5eDK9f0wvi/eZM=;
 b=foUFjAhPutRzgoZv79LrusUbuIfxYDQDL7xspH8P9VZEkxQoRFZPSDOJ
 L9xsHfXau0TzoSmcitqML8zRCEd/VWqvMC2aDoxo5Dk9VUhbkwb/14wU/
 gM/pddzFdXrdaQrNf0ReR9bS0q7GR3wqVOmsTXoIKypR/ujHPV/2Q+h10
 2+oE1OAa/LZUwdhWc3XKYRHg1USPswS29SgecPgzCmAzsYNYffSeVEmLI
 ryF6OY4dVFXwBlsZ0U4+YmzDzL3o4NE2pEf8fFrZ9j9xOj1oTsp1kb2mU
 FH3tPCl2QieXppZ5uU0KVMUJZkdk9aA2vdXO6W4NO3l6DSp68WBW9lkxw g==;
X-CSE-ConnectionGUID: Bn8dHzYuSAmXLQFiFFiH0w==
X-CSE-MsgGUID: 4ywOzmwNTYy/72s3vKxGjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="76210432"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="76210432"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:09:16 -0700
X-CSE-ConnectionGUID: 2bwetq6DQnCikLDQ7OnH9Q==
X-CSE-MsgGUID: W4xuiwVyTaGa5NZEVqrmxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="177481055"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:09:13 -0700
Date: Tue, 1 Jul 2025 18:09:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 2/9] drm/recovery: add iova-fault-stress test
Message-ID: <20250701160911.6rcsripyyuztn5wm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-3-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-3-robin.clark@oss.qualcomm.com>
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

Hi Rob,
On 2025-06-30 at 11:08:56 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>

This 'From: ' do no match your s-o-b below, please fix it.

Please run checkpatch.pl from Linux kernel on your patches.
Few helpfull options could be found in CONTRIBUTING.md

Also improve subject to:
[PATCH igt 2/9] tests/msm/msm_recovery: add iova-fault-stress test

> 
> Add a test which triggers many faults to test robustness.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/msm_recovery.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
> index 433392079bd4..8a83a6f24c41 100644
> --- a/tests/msm/msm_recovery.c
> +++ b/tests/msm/msm_recovery.c
> @@ -195,6 +195,23 @@ do_parallel_test(struct msm_pipe *pipe, int child)
>  	igt_msm_cmd_free(cmd);
>  }
>  
> +static void
> +do_fault_test(struct msm_pipe *pipe, bool stress)
> +{
> +	struct msm_cmd *cmd =
> +		igt_msm_cmd_new(pipe, 0x10000);

Why not in one line? Imho this is better:

	struct msm_cmd *cmd = igt_msm_cmd_new(pipe, 0x10000);

> +	unsigned cnt = stress ? 0x10000/16 : 1;

Use 'unsigned int' here, also

Place space around '/', also make 0x10000 a const or define it.

For example:
	const unsigned int f_cnt = 0x10000;
	struct msm_cmd *cmd = igt_msm_cmd_new(pipe, f_cnt);
	unsigned int cnt = stress ? f_cnt / 16 : 1;

> +
> +	for (unsigned i = 0; i < cnt; i++) {

Use 'unsigned int' here:

	for (unsigned int i = 0; i < cnt; i++) {

Regards,
Kamil

> +		msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
> +		msm_cmd_emit(cmd, 0xdeaddead);           /* ADDR_LO */
> +		msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
> +		msm_cmd_emit(cmd, 0x123);                /* VAL */
> +	}
> +
> +	igt_wait_and_close(igt_msm_cmd_submit(cmd));
> +}
> +
>  /*
>   * Tests for drm/msm hangcheck, recovery, and fault handling
>   */
> @@ -242,18 +259,16 @@ igt_main
>  
>  	igt_describe("Test iova fault handling");
>  	igt_subtest("iova-fault") {
> -		struct msm_cmd *cmd;
> -
>  		igt_require(dev->gen >= 6);
>  
> -		cmd = igt_msm_cmd_new(pipe, 0x1000);
> +		do_fault_test(pipe, false);
> +	}
>  
> -		msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
> -		msm_cmd_emit(cmd, 0xdeaddead);           /* ADDR_LO */
> -		msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
> -		msm_cmd_emit(cmd, 0x123);                /* VAL */
> +	igt_describe("Test iova fault handling (stress)");
> +	igt_subtest("iova-fault-stress") {
> +		igt_require(dev->gen >= 6);
>  
> -		igt_wait_and_close(igt_msm_cmd_submit(cmd));
> +		do_fault_test(pipe, true);
>  	}
>  
>  	igt_fixture {
> -- 
> 2.50.0
> 
