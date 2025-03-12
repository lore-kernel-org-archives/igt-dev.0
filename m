Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF78C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 13:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB11810E6F8;
	Wed, 12 Mar 2025 13:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRdsr5nI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F20110E6F8
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 13:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741785804; x=1773321804;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=AMWnEsy5z4166dQ3W/5WDALPGDq79K9KB3N/4WC2TJA=;
 b=kRdsr5nI3FFl6zRtl13NomCYdM4ueebPntBS2zee/6isYHgOg8y6yfiQ
 jfWXtv1qyboJpIfqEJlYcsCzKRfMsfkP1M6r9vp9aNB4f0PvIfxfHTcA7
 Q02f6TkG0FO08BazV9n7U6ITKaca4+/Z6E+oPIVVh1b175AksiYJsBfvp
 H4C2/p1VL8qjtUUGLvckknzZeJwwzKgeSdwKdIRbgdT75E6MBzt3i3d+m
 oyugtmj4xRqD2R6JkK3N2HfrQV6LahmZ5lei7orkoC9Eyfp5Wp7NOu66B
 ooqWY3L+5Pa6jjDFGfDVBwn44BXyyMQ9WL+GCMeNXpFaId1uiWccOOCKX g==;
X-CSE-ConnectionGUID: koTr1ZRGRCOrryAhM4T1IQ==
X-CSE-MsgGUID: gXTDxg6WRaOabQcyk1jvjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="30446644"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="30446644"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 06:23:23 -0700
X-CSE-ConnectionGUID: +CdFwyx5TYeCO8FHAXej7A==
X-CSE-MsgGUID: wruK9fE8R+6pJ4bOBwmkbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120855898"
Received: from unknown (HELO localhost) ([10.237.72.193])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 06:23:22 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, Christoph Manszewski
 <christoph.manszewski@intel.com>, Jan Sokolowski
 <jan.sokolowski@intel.com>, Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH v2 i-g-t 3/3] tests/xe_eudebug_online: Add
 set-breakpoint-sigint-debugger test
In-Reply-To: <87msdql7ig.fsf@mkuoppal-desk>
References: <20250311135529.5425-1-dominik.karol.piatkowski@intel.com>
 <20250311135529.5425-4-dominik.karol.piatkowski@intel.com>
 <87msdql7ig.fsf@mkuoppal-desk>
Date: Wed, 12 Mar 2025 15:23:18 +0200
Message-ID: <87jz8ul6wp.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Mika Kuoppala <mika.kuoppala@linux.intel.com> writes:

> Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@intel.com> writes:
>
>> Add a test that sends SIGINT to the debugger thread with random timing
>> and checks if nothing breaks, exercising the scenario multiple times.
>>
>> v2: Count correctly timed SIGINTs and assert that they happened (Mika)
>>
>> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@i=
ntel.com>
>> ---
>>  tests/intel/xe_eudebug_online.c | 96 +++++++++++++++++++++++++++++++++
>>  1 file changed, 96 insertions(+)
>>
>> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_on=
line.c
>> index 472013fe1..0ec1f2156 100644
>> --- a/tests/intel/xe_eudebug_online.c
>> +++ b/tests/intel/xe_eudebug_online.c
>> @@ -1506,6 +1506,98 @@ static void test_set_breakpoint_online(int fd, st=
ruct drm_xe_engine_class_instan
>>  	online_debug_data_destroy(data);
>>  }
>>=20=20
>> +/**
>> + * SUBTEST: set-breakpoint-sigint-debugger
>> + * Description:
>> + *	A variant of set-breakpoint that sends SIGINT to the debugger thread=
 with random timing
>> + *	and checks if nothing breaks, exercising the scenario multiple times.
>> + */
>> +static void test_set_breakpoint_online_sigint_debugger(int fd,
>> +						       struct drm_xe_engine_class_instance *hwe,
>> +						       int flags)
>> +{
>> +	struct xe_eudebug_session *s;
>> +	struct online_debug_data *data;
>> +	struct timespec ts =3D { };
>> +	int loop_count =3D 0;
>> +	uint64_t sleep_time;
>> +	uint64_t set_breakpoint_time;
>> +	uint64_t max_sleep_time;
>> +	uint64_t events_max =3D 0;
>> +	int sigints_during_test =3D 0;
>> +
>> +	/*
>> +	 * Measure the average time required for basic set-breakpoint variant,
>> +	 * so sleep_time range is correct.
>> +	 */
>> +	igt_nsec_elapsed(&ts);
>> +	for (int i =3D 0; i < 10; i++)
>> +		test_set_breakpoint_online(fd, hwe, SHADER_NOP | TRIGGER_UFENCE_SET_B=
REAKPOINT);
>> +	set_breakpoint_time =3D igt_nsec_elapsed(&ts) / (NSEC_PER_MSEC / USEC_=
PER_MSEC) / 10;
>> +	igt_info("Average set-breakpoint execution time: %" PRIu64 " us\n", se=
t_breakpoint_time);
>> +	max_sleep_time =3D set_breakpoint_time * 11 / 10;
>> +	igt_info("Maximum sleep_time: %" PRIu64 " us\n", max_sleep_time);
>> +
>> +	ts =3D (struct timespec) { };
>> +	igt_nsec_elapsed(&ts);
>> +
>> +	while (igt_seconds_elapsed(&ts) < 60) {
>> +		uint64_t event_count;
>> +
>> +		sleep_time =3D rand() % max_sleep_time;
>> +		igt_debug("Loop %d: SIGINT after %" PRIu64 " us\n", ++loop_count, sle=
ep_time);
>
> This worries me. The loop count increment is inside of this macro and
> even if it would work now, please change it to:
>
> if (loop_count++ =3D=3D 1) in below.
Argh, if (!loop_count++)

>
> With that,
> Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>
>> +
>> +		data =3D online_debug_data_create(hwe);
>> +		s =3D xe_eudebug_session_create(fd, run_online_client, flags, data);
>> +		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPE=
N,
>> +						open_trigger);
>> +		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXE=
C_QUEUE,
>> +						exec_queue_trigger);
>> +		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM,
>> +						vm_open_trigger);
>> +		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_MET=
ADATA,
>> +						create_metadata_trigger);
>> +		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_=
BIND_UFENCE,
>> +						ufence_ack_set_bp_trigger);
>> +		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_=
ATTENTION,
>> +						eu_attention_resume_trigger);
>> +
>> +		igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
>> +		xe_eudebug_debugger_start_worker(s->debugger);
>> +		igt_assert_eq(READ_ONCE(s->debugger->event_count), 0);
>> +		xe_eudebug_client_start(s->client);
>> +
>> +		/* Sample max events without SIGINT */
>> +		if (loop_count =3D=3D 1)
>> +			xe_eudebug_client_wait_done(s->client);
>> +		else
>> +			usleep(sleep_time);
>> +
>> +		event_count =3D READ_ONCE(s->debugger->event_count);
>> +		if (event_count > events_max)
>> +			events_max =3D event_count;
>> +		else if (event_count > 0 && event_count < events_max)
>> +			sigints_during_test++;
>> +
>> +		igt_assert_eq(pthread_kill(s->debugger->worker_thread, SIGINT), 0);
>> +		close(s->debugger->fd);
>> +
>> +		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_A=
CTIVE);
>> +		WRITE_ONCE(s->debugger->worker_state, DEBUGGER_WORKER_INACTIVE);
>> +
>> +		xe_eudebug_client_wait_done(s->client);
>> +
>> +		xe_eudebug_event_log_print(s->debugger->log, true);
>> +		xe_eudebug_event_log_print(s->client->log, true);
>> +
>> +		xe_eudebug_session_destroy(s);
>> +		online_debug_data_destroy(data);
>> +	}
>> +
>> +	igt_info("%d correctly timed SIGINTs in %d loops\n", sigints_during_te=
st, loop_count);
>> +	igt_assert_lt(0, sigints_during_test);
>> +}
>> +
>>  /**
>>   * SUBTEST: pagefault-read
>>   * Description:
>> @@ -2426,6 +2518,10 @@ igt_main
>>  	test_gt_render_or_compute("set-breakpoint", fd, hwe)
>>  		test_set_breakpoint_online(fd, hwe, SHADER_NOP | TRIGGER_UFENCE_SET_B=
REAKPOINT);
>>=20=20
>> +	test_gt_render_or_compute("set-breakpoint-sigint-debugger", fd, hwe)
>> +		test_set_breakpoint_online_sigint_debugger(fd, hwe,
>> +							   SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
>> +
>>  	test_gt_render_or_compute("breakpoint-not-in-debug-mode", fd, hwe)
>>  		test_basic_online(fd, hwe, SHADER_BREAKPOINT | DISABLE_DEBUG_MODE);
>>=20=20
>> --=20
>> 2.34.1
