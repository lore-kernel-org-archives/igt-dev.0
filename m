Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A54CD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 10:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97BD10EFE3;
	Wed, 20 May 2026 10:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWJIwllS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0818B10EFD3
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 10:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779271872; x=1810807872;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Myd+aD4D+WFMz/QfoIcDm9CgLM7cRR7I5IGjIkQLWZk=;
 b=jWJIwllSjBmVUcKkX0eLVHxQIuwLM8bVGfG9LlOMsCzcI3EmHjvOmuqV
 eEI5o85mq1/bfKKsgnOXaiw2GQxvme5s793ZuJ/eZK1W5b4QSn5Wkk3zi
 C0M0VhUyPR44UZHyNzkgGohbnLiRaf2+BscUaRPwKsnQIkmdFTIdIDYz/
 MFOZJtXST8ASalAYgN2O72zj6su+wNAF/OGkDv7s+nsK/5FHM6vhVoypj
 2YixZx/ndVUAZw1F+ElfWcYXBZuAdpStSuzn1dTlE3DN4jNedIWN8+vli
 dp6vADrDDWVzkoM/uoD2nwYoRa4mnjydg/d2Zsb9FqtB8wciyIBvW3Go6 g==;
X-CSE-ConnectionGUID: RtFSV7bOTaChfzQq5j2VMg==
X-CSE-MsgGUID: pAxcWuHETkSBbAP6y8+1pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91270486"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="91270486"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 03:11:11 -0700
X-CSE-ConnectionGUID: Qk7fzXi8Qne79c2nxOZnZw==
X-CSE-MsgGUID: kJJnb3yBRwKeTAAmhndifA==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:11:10 -0700
Date: Wed, 20 May 2026 12:11:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Clear stale
 forced LT failure counter on timeout
Message-ID: <20260520101108.eol3elzmz3pmthzm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20260519082054.1971395-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519082054.1971395-1-kunal1.joshi@intel.com>
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

Hi Kunal,
On 2026-05-19 at 13:50:54 +0530, Kunal Joshi wrote:
> When force_failure_and_wait() sets force_train_failure=2 (LT_FAILURE_REDUCED_CAPS)
> and triggers a retrain, the kernel consumes the counter once per
> intel_dp_link_train() call. With MAX_SEQ_TRAIN_FAILURES=2, the first call
> happens inside the modeset triggered by force_retrain. The second consumption
> depends on a queued link_check_work (delay=0) firing and completing a second
> modeset promptly.
> 
> However, on external DP connectors (where this test runs), the second
> intel_dp_link_train() call can fail to execute if:
> 
>  - A long HPD fires between the two retrains (common on marginal links,
>    USB-C docks, TBT connections). The long HPD handler sets
>    reset_link_params=true, which triggers intel_dp_reset_link_params()
>    during detect -- resetting seq_train_failures to 0. When the queued
>    link_check_work then calls intel_dp_needs_link_retrain(), it sees
>    seq_train_failures==0, link status OK, and returns false. No second
>    retrain occurs.
> 
>  - The second retrain's intel_modeset_commit_pipes() fails due to lock
>    contention with a concurrent modeset triggered by the same HPD event.
> 
> In both cases, intel_dp_reset_link_params() does NOT clear
> force_train_failure, leaving the debugfs counter stale at a non-zero value.
> The test then times out polling for it to reach zero.
> 
> Previously this caused an assertion failure, aborting the entire test.
> Instead, clear the stale counter by writing 0 to the debugfs and continue.
> The test's subsequent assertions (wait_for_hotplug_and_check_bad, link param
> verification) will still catch if the fallback genuinely did not occur.
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_dp_linktrain_fallback.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 661af7d16..dc9faa216 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -255,8 +255,27 @@ static bool force_failure_and_wait(data_t *data,
>  	if (check_condition_with_timeout(data->drm_fd, output,
>  					 igt_get_dp_pending_lt_failures,
>  					 interval, timeout)) {
> -		igt_info("Timed out waiting for pending LT failures\n");
> -		return false;
> +		/*
> +		 * The initial retrain was processed but not all forced LT
> +		 * failures were consumed within the timeout. This happens
> +		 * when a long HPD fires between the two kernel retrains:
> +		 * the long HPD handler sets reset_link_params which resets
> +		 * seq_train_failures to 0 during detect, causing the queued
> +		 * link_check_work to see needs_link_retrain() == false and
> +		 * skip the second retrain. The force_train_failure counter
> +		 * is not cleared by intel_dp_reset_link_params(), leaving
> +		 * it stale.
> +		 *
> +		 * This can also occur if the second retrain's modeset fails
> +		 * due to lock contention with a concurrent modeset (e.g.
> +		 * one triggered by the same HPD event).
> +		 *
> +		 * Clear the stale counter so it doesn't corrupt subsequent
> +		 * iterations of the test loop.
> +		 */
> +		igt_info("Forced LT failures not fully consumed within timeout "
> +			 "— clearing stale counter\n");

"— clearing stale counter\n");

Please use minus '-' in above text:
s/— clearing/- clearing/

Regards,
Kamil

> +		igt_force_lt_failure(data->drm_fd, output, 0);
>  	}
>  
>  	return true;
> -- 
> 2.25.1
> 
