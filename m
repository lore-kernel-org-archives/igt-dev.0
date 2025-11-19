Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B6FCF34C3
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 15:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5C510E653;
	Wed, 19 Nov 2025 15:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4yM5ldY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A165310E653
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 15:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763565314; x=1795101314;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=aS/QNrvSPCdxFJJRdeIuXun47ewY0TdIwowOhNhlIeI=;
 b=g4yM5ldYECQc+YD3St5LcA/8zNXbwbbx3YtgsU7NeTNyY/W5D6I1EHkB
 1a8/DygzIEE0vpp/rXtolxDwx86evG9OJ9Iqajh573Twe+Tjf6vswBZvK
 pCCf77awE578kHHTZJydCfeJcIaYECRBgXOW4q2gqj3JVuIBm7FYwZ5F0
 87ge0T5o7j/jLxdJ67iGynYKbPOFE8Yix1ldtnGGRKqe2hUIBqwQmEE3o
 F/LdZMawWDrLYSz2GcJB8mG1iN/mZdRoIlfmEoxcTotpYJCTl473lSHed
 y3hQQadkN7MEeQ6XAfpHVQMyAvt1CVI8RhmMedn4dbgImjo2+t7zNpTN3 Q==;
X-CSE-ConnectionGUID: Il6Js5I8SaaAdqD9Y3QXnA==
X-CSE-MsgGUID: jWXmP5tUTkmyJ9qhDeRUjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="88265813"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="88265813"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 07:15:14 -0800
X-CSE-ConnectionGUID: M0AlJtOzQ2q0fMsrFUWFsg==
X-CSE-MsgGUID: Z1WbyTT2QR6ynVRrcZfeRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="214455905"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.59])
 ([172.28.182.59])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 07:15:12 -0800
Message-ID: <251a91fd-5fd9-49a0-b980-b1c51aefbf2e@linux.intel.com>
Date: Wed, 19 Nov 2025 16:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH v3] tests/intel/xe_pmu: Tie preempt timeout to exec quantum
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, michal.wajdeczko@intel.com
References: <20251107151251.6323-2-jonathan.cavitt@intel.com>
Content-Language: en-US
In-Reply-To: <20251107151251.6323-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 11/7/2025 4:12 PM, Jonathan Cavitt wrote:
> When updating the exec quantum in enable_and_provision_vfs, update the
> preempt timeout value to be equal to the exec quantum value.  Also,
> reset the preempt timeout value on test end in
> unprovision_and_disable_vfs.
>
> v2:
> - Multiply exec quantum by 1 instead of 2 to get the preempt timeout
>    (Michal)
> - Compress the vf and pf exec quantum and preempt timeout values into a
>    single define (VF_EXEC_QUANTUM), and operate on that using a
>    PF_MULTIPLIER and PT_TO_EQ_RATIO to generate the requested values for
>    xe_sriov_set_exec_quantum_ms and xe_sriov_set_preempt_timeout_us in
>    enable_and_provision_vfs (jcavitt)
>
> v3:
> - Revert conversion to defined macros and just add pf_preempt_timeout
>    and vf_preempt_timeout as variables (Michal)
>
> Suggested-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Signed-off-by: Jonathan Cavitt<jonathan.cavitt@intel.com>
> ---
>   tests/intel/xe_pmu.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 9525655ba2..bc6688744f 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -974,6 +974,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   static unsigned int enable_and_provision_vfs(int fd)
>   {
>   	unsigned int gt, num_vfs;
> +	int pf_preempt_timeout = 64000, vf_preempt_timeout = 32000;
>   	int pf_exec_quantum = 64, vf_exec_quantum = 32, vf;
>   
>   	igt_require(igt_sriov_is_pf(fd));
> @@ -987,12 +988,18 @@ static unsigned int enable_and_provision_vfs(int fd)
>   	num_vfs = igt_sriov_get_enabled_vfs(fd);
>   	igt_require(num_vfs == 2);
>   
> -	/* Set 32ms for VF execution quantum and 64ms for PF execution quantum */
> +	/*
> +	 * Set 32ms for VF execution quantum and 64ms for PF execution quantum.
> +	 * Set the preempt timeout for the VF and PF to equal their execution quantum.
> +	 */
>   	xe_for_each_gt(fd, gt) {
>   		xe_sriov_set_sched_if_idle(fd, gt, 0);
> -		for (int fn = 0; fn <= num_vfs; fn++)
> +		for (int fn = 0; fn <= num_vfs; fn++) {
>   			xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? vf_exec_quantum :
>   						     pf_exec_quantum);
> +			xe_sriov_set_preempt_timeout_us(fd, fn, gt, fn ? vf_preempt_timeout :
> +							pf_preempt_timeout);
> +		}
>   	}
>   
>   	/* probe VFs */
> @@ -1011,8 +1018,10 @@ static void unprovision_and_disable_vfs(int fd)
>   
>   	xe_for_each_gt(fd, gt) {
>   		xe_sriov_set_sched_if_idle(fd, gt, 0);
> -		for (int fn = 0; fn <= num_vfs; fn++)
> +		for (int fn = 0; fn <= num_vfs; fn++) {
>   			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);
> +			xe_sriov_set_preempt_timeout_us(fd, fn, gt, 0);
> +		}

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   	}
>   
>   	xe_sriov_disable_vfs_restore_auto_provisioning(fd);
