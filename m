Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBEBCD3431
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 13:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F226410E707;
	Wed,  4 Sep 2024 13:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNYfPHLi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3193910E707
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725457793; x=1756993793;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=K4+Y02b+Ap3nFavzJ13Uo9Hnw+YrNqRnkFskU/7VIrI=;
 b=YNYfPHLiFzgOsMFBRGtinKt2qNddiecR7wvQjsjgLiXO8TspooT2+/eB
 888IuHPwdQgajR/rcFE9QJglkRRD6uOuuPVgKgfwBXZL0Nk2U70qY7fEn
 AOclXxsb+aUZ3Vsh7UFaYK2QA0Qx4MDZDuX5pW5hNc0Y8LnhFctVk3IBF
 m1H7asuBPCvuo+8tv0KvPw9qQBxJqFtnwgESeM3tvoVqlLIZ0mcpndtLf
 aip2jzRlR1cChhP0gOYRz3QJ9pTpVaVY2kGCRctpmmDi9uSRML5IYLArz
 vJjre9x5kDMKDhCWJKYAuaS4zwpofQud1Wu5wbKp2/1dXniv5K41LLIS5 w==;
X-CSE-ConnectionGUID: C+IRnCs4T/+t369a0qKVvQ==
X-CSE-MsgGUID: /0fl3iCSTqGzNJYazcarMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="41591878"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="41591878"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 06:49:53 -0700
X-CSE-ConnectionGUID: lgz/n5/7SuekZ2luBWcd+A==
X-CSE-MsgGUID: RvDC+y1FQMyi6LgBevtfFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="69438765"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.80.70])
 ([10.245.80.70])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 06:49:51 -0700
Message-ID: <cc7b54e5-70a3-4e72-9909-e64aa0559100@intel.com>
Date: Wed, 4 Sep 2024 15:49:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5] tests/intel/xe_exec_fault_mode: Don't return
 early
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, Matthew Brost <matthew.brost@intel.com>, 
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20240904084504.32546-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240904084504.32546-1-nirmoy.das@intel.com>
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



On 04.09.2024 10:45, Nirmoy Das wrote:
> Tests that are causing pagefaults should wait for exec to queue
> ban/finish otherwise pending engine resets because of on-going
> pagefaults would cause failure in subsequent tests to fail.
>
> Not all execs will generate page faults and in such case reading ban
> property is not enough but the signal should either -EIO or 0.
> so read that instead.
>
> v2: specify timeout reason and iterate over exec_queues(Andrzej)
> v3: increase timeout
> v4: check for signal status to be -EIO/0.
> v5: code rearrangement and other minor fixes(Andrzej)
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   tests/intel/xe_exec_fault_mode.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 1f1f1e50b..9cc51b7d3 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -324,9 +324,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>   		       bind_exec_queues[0], NSEC_PER_SEC);
>   
> -	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
> +	if (flags & INVALID_FAULT) {
> +		for (i = 0; i < n_execs; i++) {
> +			int ret;
> +			int64_t timeout = NSEC_PER_SEC;
> +
> +			ret = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> +					       exec_queues[i % n_exec_queues], &timeout);
> +			igt_assert(ret == -EIO || ret == 0);
> +		}
> +	} else if (!(flags & INVALID_VA)) {
>   		for (i = j; i < n_execs; i++)
> -				igt_assert_eq(data[i].data, 0xc0ffee);
> +			igt_assert_eq(data[i].data, 0xc0ffee);
> +
>   	}
>   
>   	for (i = 0; i < n_exec_queues; i++) {

