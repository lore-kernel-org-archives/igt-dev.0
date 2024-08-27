Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98DDC52D6F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 07:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E6010E2A6;
	Tue, 27 Aug 2024 07:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LaCcp643";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A17310E2A6
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 07:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724743472; x=1756279472;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VX6YUC2EsdBsak68/Dy7xsjSH/NcDdtsTFuQFgucJDw=;
 b=LaCcp6430BSmnTEwUCfPg/r5wDeWggHq8syIhKr7i31yA+T6k7VlJi/b
 ZOo9/784Vk9TxdTsHPI6eO+DMDia5G6YuqwLkPaEq5/mmOarKCb4cSoTf
 kzXbYPqnkFnc3uh1pnHkk3zb+0JkV5Rdc8ahDkqPPZXieWxZBB3rb12eL
 AyJI7QZEk2XViLAYIX6V5vAwKIZWDCFBprdFlk9UJhQ34cMeK+lq0TjPn
 bhfiYKZjAnGi+gN1VDb5GZKVRTDdiz+eBY2NEFu5pFjbLv1LeNW4IxjAn
 czHOcOCT2YrPT4LkbSlSOOqiRWNnTkUpo5iHIvOvlp64P43bBuwMGGvvP Q==;
X-CSE-ConnectionGUID: nGYbp2jQQWej13vM2Lz+YA==
X-CSE-MsgGUID: AzzrmNwGQs+pvoWWsAt77Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26102941"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="26102941"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 00:24:31 -0700
X-CSE-ConnectionGUID: C+QVE4BmQMK4KtZzQDiUvA==
X-CSE-MsgGUID: FRKXxqvgSXS0vA25/7DE6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="67111983"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 00:24:30 -0700
Date: Tue, 27 Aug 2024 09:24:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH i-g-t] test/amdgpu: fix unknow test issue for amdgpu
 queue test
Message-ID: <20240827072407.hqiwzgxsmhipdgyd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240827051932.74382-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240827051932.74382-1-jesse.zhang@amd.com>
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

Hi Jesse.zhang,
On 2024-08-27 at 13:19:32 +0800, Jesse.zhang@amd.com wrote:
> Queue reset does not exit properly when executing unknown subtests.
> Because other processes are still functioning.
> 
> It should exit the other three processes
> (test, background, and monitor) for this case.
> 
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> 
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  tests/amdgpu/amd_queue_reset.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
> index 60208e085..85408e3ff 100644
> --- a/tests/amdgpu/amd_queue_reset.c
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -70,6 +70,7 @@ struct shmbuf {
>  	int count;
>  	bool sub_test_completed;
>  	bool sub_test_is_skipped;
> +	bool sub_test_is_existed;
>  	unsigned int test_flags;
>  	int test_error_code;
>  	bool reset_completed;
> @@ -148,6 +149,7 @@ skip_sub_test(struct shmbuf *sh_mem)
>  {
>  	sem_wait(&sh_mem->sem_state_mutex);
>  	sh_mem->sub_test_is_skipped = true;
> +	sh_mem->sub_test_is_existed = true;
>  	sem_post(&sh_mem->sem_state_mutex);
>  }

Do you re-implement igt infra?

Regards,
Kamil

>  
> @@ -327,6 +329,7 @@ static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
>  	sh_mem->good_job.ip = ip_good;
>  	sh_mem->good_job.ring_id = ring_id_good;
>  	sh_mem->sub_test_is_skipped = false;
> +	sh_mem->sub_test_is_existed = true;
>  	sem_post(&sh_mem->sem_state_mutex);
>  
>  	//sync and wait for complete
> @@ -405,6 +408,7 @@ shared_mem_create(struct shmbuf **ppbuf)
>  	shmp->sub_test_completed = false;
>  	shmp->reset_completed = false;
>  	shmp->sub_test_is_skipped = false;
> +	shmp->sub_test_is_existed = false;
>  
>  	*ppbuf = shmp;
>  	return shm_fd;
> @@ -1128,7 +1132,6 @@ igt_main
>  			create_contexts(device, &arr_context_handle, const_num_of_tests);
>  		else if (process == PROCESS_BACKGROUND)
>  			fd_shm = shared_mem_open(&sh_mem);
> -
>  		igt_require(fd_shm != -1);
>  		igt_require(sh_mem != NULL);
>  
> @@ -1136,7 +1139,6 @@ igt_main
>  			process, sh_mem, const_num_of_tests, info[0].hw_ip_version_major,
>  			&monitor_child, &test_child);
>  	}
> -
>  	for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
>  		reset_rings_numbers(&ring_id_good, &ring_id_bad, &ring_id_job_good, &ring_id_job_bad);
>  		for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
> @@ -1154,6 +1156,10 @@ igt_main
>  			}
>  		}
>  	}
> +
> +	if (sh_mem &&( !sh_mem->sub_test_is_existed))
> +		set_next_test_to_skip(sh_mem);
> +
>  	igt_fixture {
>  		if (process == PROCESS_TEST) {
>  			waitpid(monitor_child, &monitorExitMethod, 0);
> -- 
> 2.25.1
> 
