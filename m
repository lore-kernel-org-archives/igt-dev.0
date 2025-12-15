Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16F2D5B85A
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 17:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE8910E68A;
	Mon, 15 Dec 2025 17:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XnHh2ADe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E689410E680
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 17:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765818214; x=1797354214;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iRzgiNs9prjBtTSTycvrmg37i5Az715JvyiJLo9Zjf0=;
 b=XnHh2ADevBsvv/jyFqc5Xm7kx8g/9TrcoYa3BrFmYm1YyjpYkRjiAAF3
 45RQRGMuV05f+0xnZBrvNarVWNqxQdWnONH9/Tpg+pBBXdivPa8AmI7tQ
 FJK0PHQpc/GHqY8tvBI6BZjndYhp3UtwlTrYdtzaDFEk1pgd4Ty7QIV8m
 KpBT1YLJMRLALITQqi4PIZln0Q4WGBQbsCSRmB4CTI8RCXGc1STErFMuL
 o/kWGb0tseb9rOaxCi5RAYYImI5drgsq0Z7VnaP3JTliHJFGYEPQD1fd6
 ZddlqjZkPp+W7koC3SpLD8c59zFq2CjrNROl7Fz3O2/Pr0jszkzXBgqM/ A==;
X-CSE-ConnectionGUID: cyttXm3lRwqzqhPdN5/K0g==
X-CSE-MsgGUID: uePEu21CQ4OKck7UZDAFjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78842925"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="78842925"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:03:33 -0800
X-CSE-ConnectionGUID: sA8TWoy0QUy/Cxs2AHcHSA==
X-CSE-MsgGUID: ae0ZOe4xS++0ozD3KvjWaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="198275940"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO [10.245.246.116])
 ([10.245.246.116])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:03:32 -0800
Message-ID: <b7fa7eba-99c3-4dd0-b90e-787d36412a4a@intel.com>
Date: Mon, 15 Dec 2025 18:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/xe/xe_eudebug: Make sure debugger drains
 events
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com, maciej.patelczyk@intel.com,
 jan.maslak@intel.com, zbigniew.kempczynski@intel.com
References: <20251211164020.1065880-1-mika.kuoppala@linux.intel.com>
 <20251211164020.1065880-2-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251211164020.1065880-2-mika.kuoppala@linux.intel.com>
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

Hi Mika,

On 12/11/25 17:40, Mika Kuoppala wrote:
> Do not exit from debugger worker until poll timeouts
> as otherwise session can nuke the worker too early
> and some events might get dropped.
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Regards,
Christoph
> ---
>   lib/xe/xe_eudebug.c             | 66 ++++++++++++++++++++++++---------
>   lib/xe/xe_eudebug.h             |  7 ++--
>   tests/intel/xe_eudebug_online.c |  4 +-
>   3 files changed, 54 insertions(+), 23 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 0f09bc8a1..7c2c9505d 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1146,8 +1146,12 @@ static void *debugger_worker_loop(void *data)
>   	sa.sa_flags |= SA_SIGINFO;
>   	igt_assert_eq(sigaction(SIGTERM, &sa, NULL), 0);
>   
> +	WRITE_ONCE(d->worker_state, DEBUGGER_WORKER_RUNNING);
> +
>   	do {
>   		p.fd = d->fd;
> +		p.revents = 0;
> +
>   		ret = poll(&p, 1, timeout_ms);
>   		if (d->received_sigint) {
>   			d->handled_sigint = true;
> @@ -1163,10 +1167,18 @@ static void *debugger_worker_loop(void *data)
>   			}
>   
>   			igt_info("poll failed with errno %d\n", errno);
> -			break;
> +			goto out;
> +		}
> +
> +		/* only exit after timeout to not miss events */
> +		if (ret == 0 &&
> +		    READ_ONCE(d->worker_state) != DEBUGGER_WORKER_RUNNING) {
> +			igt_debug("debugger worker quitting with state %d\n",
> +				  READ_ONCE(d->worker_state));
> +			goto out;
>   		}
>   
> -		if (ret == 1 && (p.revents & POLLIN)) {
> +		if (ret == 1 && p.revents & POLLIN) {
>   			int err = xe_eudebug_read_event(d->fd, e);
>   
>   			if (!err) {
> @@ -1178,10 +1190,22 @@ static void *debugger_worker_loop(void *data)
>   				igt_info("xe_eudebug_read_event returned %d\n", ret);
>   			}
>   		}
> -	} while ((ret && READ_ONCE(d->worker_state) == DEBUGGER_WORKER_QUITTING) ||
> -		 READ_ONCE(d->worker_state) == DEBUGGER_WORKER_ACTIVE);
>   
> -	d->worker_state = DEBUGGER_WORKER_INACTIVE;
> +		if (ret == 1 && p.revents & POLLHUP) {
> +			igt_info("debugger connection hangup\n");
> +			goto out;
> +		}
> +
> +		if (ret == 1 && p.revents & POLLNVAL) {
> +			igt_info("debugger fd invalid\n");
> +			goto out;
> +		}
> +	} while (1);
> +
> +out:
> +	WRITE_ONCE(d->worker_state, DEBUGGER_WORKER_FINISHED);
> +
> +	igt_debug("debugger worker finished\n");
>   
>   	return NULL;
>   }
> @@ -1234,6 +1258,8 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
>   	d->handled_sigint = false;
>   	d->received_signal = false;
>   
> +	WRITE_ONCE(d->worker_state, DEBUGGER_WORKER_INIT);
> +
>   	return d;
>   }
>   
> @@ -1254,7 +1280,7 @@ static void debugger_destroy_triggers(struct xe_eudebug_debugger *d)
>    */
>   void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d)
>   {
> -	if (d->worker_state != DEBUGGER_WORKER_INACTIVE)
> +	if (READ_ONCE(d->worker_state) != DEBUGGER_WORKER_FINISHED)
>   		xe_eudebug_debugger_stop_worker(d);
>   
>   	if (d->target_pid)
> @@ -1380,10 +1406,12 @@ void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d)
>   {
>   	int ret;
>   
> -	d->worker_state = DEBUGGER_WORKER_ACTIVE;
>   	ret = pthread_create(&d->worker_thread, NULL, &debugger_worker_loop, d);
>   
>   	igt_assert_f(ret == 0, "Debugger worker thread creation failed!");
> +
> +	while(READ_ONCE(d->worker_state) != DEBUGGER_WORKER_RUNNING)
> +		;
>   }
>   
>   /**
> @@ -1396,23 +1424,23 @@ void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d)
>   {
>   	const int timeout_s = 3;
>   	struct timespec t = {};
> -	int ret;
> -
> -	igt_assert_neq(d->worker_state, DEBUGGER_WORKER_INACTIVE);
> +	int ret = 0;
>   
> -	d->worker_state = DEBUGGER_WORKER_QUITTING; /* First time be polite. */
> -	igt_assert_eq(clock_gettime(CLOCK_REALTIME, &t), 0);
> -	t.tv_sec += timeout_s;
> +	if (READ_ONCE(d->worker_state) == DEBUGGER_WORKER_RUNNING) {
> +		/* First time be polite. */
> +		WRITE_ONCE(d->worker_state, DEBUGGER_WORKER_SHOULD_QUIT);
> +		igt_assert_eq(clock_gettime(CLOCK_REALTIME, &t), 0);
> +		t.tv_sec += timeout_s;
>   
> -	ret = pthread_timedjoin_np(d->worker_thread, NULL, &t);
> +		ret = pthread_timedjoin_np(d->worker_thread, NULL, &t);
> +	}
>   
>   	if (ret == ETIMEDOUT) {
> -		d->worker_state = DEBUGGER_WORKER_INACTIVE;
> -		ret = pthread_join(d->worker_thread, NULL);
> +		igt_info("DEBUGGER STATE %d FORCING\n", READ_ONCE(d->worker_state));
> +		WRITE_ONCE(d->worker_state, DEBUGGER_WORKER_FINISHED);
>   	}
>   
> -	igt_assert_f(ret == 0 || ret != ESRCH,
> -		     "pthread join failed with error %d!\n", ret);
> +	pthread_join(d->worker_thread, NULL);
>   
>   	event_log_sort(d->log);
>   }
> @@ -1720,6 +1748,8 @@ void xe_eudebug_session_run(struct xe_eudebug_session *s)
>   
>   	xe_eudebug_debugger_stop_worker(debugger);
>   
> +	xe_eudebug_client_stop(client);
> +
>   	xe_eudebug_event_log_print(debugger->log, true);
>   	xe_eudebug_event_log_print(client->log, true);
>   }
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index f1a2da4d8..ef9dacf0d 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -20,9 +20,10 @@ struct xe_eudebug_event_log {
>   };
>   
>   enum xe_eudebug_debugger_worker_state {
> -	DEBUGGER_WORKER_INACTIVE = 0,
> -	DEBUGGER_WORKER_ACTIVE,
> -	DEBUGGER_WORKER_QUITTING,
> +	DEBUGGER_WORKER_INIT = 0,
> +	DEBUGGER_WORKER_RUNNING,
> +	DEBUGGER_WORKER_SHOULD_QUIT,
> +	DEBUGGER_WORKER_FINISHED,
>   };
>   
>   struct xe_eudebug_debugger {
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index ff6c5ff19..e59b99ee9 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1690,8 +1690,8 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
>   			usleep(1000);
>   		close(s->debugger->fd);
>   
> -		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
> -		WRITE_ONCE(s->debugger->worker_state, DEBUGGER_WORKER_INACTIVE);
> +		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_RUNNING);
> +		WRITE_ONCE(s->debugger->worker_state, DEBUGGER_WORKER_SHOULD_QUIT);
>   
>   		xe_eudebug_client_wait_done(s->client);
>   

