Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF39FC282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 12:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702BF10E410;
	Mon, 10 Mar 2025 12:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsvEm8WV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9B410E410
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 12:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741609411; x=1773145411;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vETc62WyaJCqbrVPuINKb8UOxN6iuhDKiU2mpOHdCa8=;
 b=SsvEm8WVQtBS42uDo6Vev5ceJIg1fky5b/sttwDD+Qv2FfyYcMNnmKdH
 iCrb0s/TFPsxQx4lzVUH0qEAgPXJbikGTkDszvvqA4PtZYEpPoSOWesVM
 wksZ6DdD/yguBDhT/cTqzHv+5GFA3DK1YgBoPV+5iUwJyDd575SE3hAps
 RL3qGYSdF4lGuDix8XBl4A2s78bj4GUNQMOaWB8VEybPaBoFbn+l72Nev
 TtWmTAWPCYfjORxnsdFz22+fncFfvzGLw2r1MNQJ5gFTKN0GWWrilkpPs
 WDEwaqrZwb892FHXf9+URJTjqP1X66V1WgI6nSf3+h1/ZeIuojz7N328J A==;
X-CSE-ConnectionGUID: K1iiiqujQrqjXV4CYdL+3A==
X-CSE-MsgGUID: tGCCg7QnSfqj+kkWdDTdMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="45394817"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="45394817"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 05:23:30 -0700
X-CSE-ConnectionGUID: L/1iM1U3SIK3qsCM9dE+Lw==
X-CSE-MsgGUID: /BLva7cJSGmtwykqg4kGiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="150926779"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.105])
 ([10.245.246.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 05:23:29 -0700
Message-ID: <b9da5d35-1845-4879-9046-31638db1ee91@intel.com>
Date: Mon, 10 Mar 2025 13:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/xe_eudebug_online: Add
 set-breakpoint-sigint-debugger test
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>
References: <20250224130807.9249-1-dominik.karol.piatkowski@intel.com>
 <20250224130807.9249-4-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250224130807.9249-4-dominik.karol.piatkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Dominik,

On 24.02.2025 14:08, Dominik Karol Piątkowski wrote:
> Add a test that sends SIGINT to the debugger thread with random timing
> and checks if nothing breaks, exercising the scenario multiple times.

I have to admit I don't quite understand what this test is supposed to 
test. The worker loop you are interrupting polls for new events and 
reads them via a ioctl. Trying to understand what this test could test I 
think I found a corner case of our read_event ioctl. We can end up with 
a resource leak and missing event when the interrupt would happen during 
copy_to_user (after the event got pulled from the fifo, and before it 
got freed) but besides the possibility that this case would be triggered 
it would still go unnoticed by this test.

It feels to me like it is more a test for our IGT lib and session 
handling than actual Xe eudebug functionality. But I may be missing 
something here and perhaps a more verbose explanation of the intention 
of this test would prove me wrong.

Regards,
Christoph


> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>   tests/intel/xe_eudebug_online.c | 75 +++++++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 472013fe1..8a97c8066 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1506,6 +1506,77 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
>   	online_debug_data_destroy(data);
>   }
>   
> +/**
> + * SUBTEST: set-breakpoint-sigint-debugger
> + * Description:
> + *	A variant of set-breakpoint that sends SIGINT to the debugger thread with random timing
> + *	and checks if nothing breaks, exercising the scenario multiple times.
> + */
> +static void test_set_breakpoint_online_sigint_debugger(int fd,
> +						       struct drm_xe_engine_class_instance *hwe,
> +						       int flags)
> +{
> +	struct xe_eudebug_session *s;
> +	struct online_debug_data *data;
> +	struct timespec ts = { };
> +	int loop_count = 0;
> +	uint64_t sleep_time;
> +	uint64_t set_breakpoint_time;
> +	uint64_t max_sleep_time;
> +
> +	/*
> +	 * Measure the average time required for basic set-breakpoint variant,
> +	 * so sleep_time range is correct.
> +	 */
> +	igt_nsec_elapsed(&ts);
> +	for (int i = 0; i < 10; i++)
> +		test_set_breakpoint_online(fd, hwe, SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
> +	set_breakpoint_time = igt_nsec_elapsed(&ts) / (NSEC_PER_MSEC / USEC_PER_MSEC) / 10;
> +	igt_info("Average set-breakpoint execution time: %" PRIu64 " us\n", set_breakpoint_time);
> +	max_sleep_time = set_breakpoint_time * 11 / 10;
> +	igt_info("Maximum sleep_time: %" PRIu64 " us\n", max_sleep_time);
> +
> +	ts = (struct timespec) { };
> +	igt_nsec_elapsed(&ts);
> +
> +	while (igt_seconds_elapsed(&ts) < 60) {
> +		sleep_time = rand() % max_sleep_time;
> +		igt_debug("Loop %d: SIGINT after %" PRIu64 " us\n", ++loop_count, sleep_time);
> +
> +		data = online_debug_data_create(hwe);
> +		s = xe_eudebug_session_create(fd, run_online_client, flags, data);
> +		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
> +						open_trigger);
> +		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
> +						exec_queue_trigger);
> +		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM,
> +						vm_open_trigger);
> +		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
> +						create_metadata_trigger);
> +		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
> +						ufence_ack_set_bp_trigger);
> +		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +						eu_attention_resume_trigger);
> +
> +		igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
> +		xe_eudebug_debugger_start_worker(s->debugger);
> +		xe_eudebug_client_start(s->client);
> +
> +		usleep(sleep_time);
> +		igt_assert_eq(pthread_kill(s->debugger->worker_thread, SIGINT), 0);
> +		close(s->debugger->fd);
> +		s->debugger->worker_state = DEBUGGER_WORKER_INACTIVE;
> +
> +		xe_eudebug_client_wait_done(s->client);
> +
> +		xe_eudebug_event_log_print(s->debugger->log, true);
> +		xe_eudebug_event_log_print(s->client->log, true);
> +
> +		xe_eudebug_session_destroy(s);
> +		online_debug_data_destroy(data);
> +	}
> +}
> +
>   /**
>    * SUBTEST: pagefault-read
>    * Description:
> @@ -2426,6 +2497,10 @@ igt_main
>   	test_gt_render_or_compute("set-breakpoint", fd, hwe)
>   		test_set_breakpoint_online(fd, hwe, SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
>   
> +	test_gt_render_or_compute("set-breakpoint-sigint-debugger", fd, hwe)
> +		test_set_breakpoint_online_sigint_debugger(fd, hwe,
> +							   SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
> +
>   	test_gt_render_or_compute("breakpoint-not-in-debug-mode", fd, hwe)
>   		test_basic_online(fd, hwe, SHADER_BREAKPOINT | DISABLE_DEBUG_MODE);
>   
