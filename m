Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34D4CCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 12:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DDB10E3FA;
	Tue,  4 Nov 2025 12:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6itBM9n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C232310E3FA
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 12:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762258789; x=1793794789;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2wmWMREpgiZFvzxOhlZaMWiTn9pTNcUmFDbkYaKcfDY=;
 b=J6itBM9nrAuwokbBpma8NRWyWQWgP0LxFAK7R6in9+IaG7agAIp9gCS2
 z6tLz7wP9MjaL+QOxgbW10CCgGBvzeVt64aqn93y6lFuBNM6UwVa8U698
 vYmxRahdUd0pCwUtufNKAJ0i2EzpWGbDQHcoWFl7geDPAVER1HeiGcPqR
 kotCwVtf1REfaR4IITSfpqi0H2irD+70NXTT6KaPX1Qo50T4umZLCuJmA
 kCbqF0eMyngcdTQbeAymOOIT8WisX0d1gK/Ty0M0EA7SciqeplLuR94OG
 9sIv/opftiPFv50ngI/RZTv6h/dtPImM5HYeXV9BUycDKVqDJnJaFYYxo Q==;
X-CSE-ConnectionGUID: ghxj5cCBRnChE6pvzDWRBw==
X-CSE-MsgGUID: Izz15YCISMyKZUGAwEjhiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64501240"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="64501240"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:19:48 -0800
X-CSE-ConnectionGUID: VFM0E81fRfeL24H2QUyTrQ==
X-CSE-MsgGUID: ijZki6oNRN2GQJGjqSgnng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187094339"
Received: from cmanszew-mobl2.igk.intel.com (HELO [172.28.180.197])
 ([172.28.180.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:19:47 -0800
Message-ID: <d93a9ea1-f408-4f04-83db-a64c38ef8e6f@intel.com>
Date: Tue, 4 Nov 2025 13:19:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 7/7] lib/xe/xe_eudebug: Don't take timeout for
 debugger stop
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com, maciej.patelczyk@intel.com,
 jan.maslak@intel.com, zbigniew.kempczynski@intel.com
References: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
 <20251014093848.2394531-8-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251014093848.2394531-8-mika.kuoppala@linux.intel.com>
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

On 14.10.2025 11:38, Mika Kuoppala wrote:
> The worker expects certain poll intervals. Forcing stop in arbitrary
> granularity will wreck the assumptions on poll timeouts for worker
> graceful exit.
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Regards,
Christoph

> ---
>   lib/xe/xe_eudebug.c             |  8 ++++----
>   lib/xe/xe_eudebug.h             |  2 +-
>   tests/intel/xe_eudebug.c        | 16 ++++++++--------
>   tests/intel/xe_eudebug_online.c | 12 ++++++------
>   4 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 68ab9dc320..c3a3207aa5 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1252,7 +1252,7 @@ static void debugger_destroy_triggers(struct xe_eudebug_debugger *d)
>   void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d)
>   {
>   	if (d->worker_state != DEBUGGER_WORKER_INACTIVE)
> -		xe_eudebug_debugger_stop_worker(d, 1);
> +		xe_eudebug_debugger_stop_worker(d);
>   
>   	if (d->target_pid)
>   		xe_eudebug_debugger_detach(d);
> @@ -1389,9 +1389,9 @@ void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d)
>    *
>    * Stops the debugger worker. Event log is sorted by seqno after closure.
>    */
> -void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d,
> -				     int timeout_s)
> +void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d)
>   {
> +	const int timeout_s = 3;
>   	struct timespec t = {};
>   	int ret;
>   
> @@ -1715,7 +1715,7 @@ void xe_eudebug_session_run(struct xe_eudebug_session *s)
>   	xe_eudebug_client_start(client);
>   	xe_eudebug_client_wait_done(client);
>   
> -	xe_eudebug_debugger_stop_worker(debugger, 1);
> +	xe_eudebug_debugger_stop_worker(debugger);
>   
>   	xe_eudebug_event_log_print(debugger->log, true);
>   	xe_eudebug_event_log_print(client->log, true);
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index 2a0110fe92..f1a2da4d84 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -194,7 +194,7 @@ xe_eudebug_debugger_create(int xe, uint64_t flags, void *data);
>   void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d);
>   int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d, struct xe_eudebug_client *c);
>   void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d);
> -void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d, int timeout_s);
> +void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d);
>   void xe_eudebug_debugger_detach(struct xe_eudebug_debugger *d);
>   void xe_eudebug_debugger_set_data(struct xe_eudebug_debugger *c, void *ptr);
>   void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d, int type,
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 4a2c436350..59aca526e6 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -1015,7 +1015,7 @@ static void test_basic_discovery(int fd, unsigned int flags, bool match_opposite
>   
>   	xe_eudebug_client_wait_done(c);
>   
> -	xe_eudebug_debugger_stop_worker(d, 1);
> +	xe_eudebug_debugger_stop_worker(d);
>   
>   	xe_eudebug_event_log_print(d->log, true);
>   	xe_eudebug_event_log_print(c->log, true);
> @@ -1155,7 +1155,7 @@ static void *discovery_race_thread(void *data)
>   			igt_assert(READ_ONCE(s->debugger->event_count));
>   			}
>   
> -			xe_eudebug_debugger_stop_worker(s->debugger, 1);
> +			xe_eudebug_debugger_stop_worker(s->debugger);
>   
>   			igt_debug("Resources discovered: %" PRIu64 "\n", s->debugger->event_count);
>   			if (!s->client->done) {
> @@ -1225,7 +1225,7 @@ static void *discovery_race_thread(void *data)
>   		if (READ_ONCE(s->debugger->event_count) != expected)
>   			sleep(5);
>   
> -		xe_eudebug_debugger_stop_worker(s->debugger, 1);
> +		xe_eudebug_debugger_stop_worker(s->debugger);
>   		xe_eudebug_debugger_detach(s->debugger);
>   	}
>   
> @@ -1304,7 +1304,7 @@ static void *attach_dettach_thread(void *data)
>   
>   		if (random() % 2 == 0) {
>   			xe_eudebug_debugger_start_worker(s->debugger);
> -			xe_eudebug_debugger_stop_worker(s->debugger, 1);
> +			xe_eudebug_debugger_stop_worker(s->debugger);
>   		}
>   
>   		xe_eudebug_debugger_detach(s->debugger);
> @@ -1343,7 +1343,7 @@ static void test_empty_discovery(int fd, unsigned int flags, int clients)
>   		igt_assert_eq(xe_eudebug_debugger_attach(s[i]->debugger, s[i]->client), 0);
>   
>   		xe_eudebug_debugger_start_worker(s[i]->debugger);
> -		xe_eudebug_debugger_stop_worker(s[i]->debugger, 5);
> +		xe_eudebug_debugger_stop_worker(s[i]->debugger);
>   		xe_eudebug_debugger_detach(s[i]->debugger);
>   
>   		igt_assert_eq(s[i]->debugger->event_count, expected);
> @@ -2190,7 +2190,7 @@ static void test_basic_ufence(int fd, unsigned int flags)
>   	}
>   
>   	xe_eudebug_client_wait_done(c);
> -	xe_eudebug_debugger_stop_worker(d, 1);
> +	xe_eudebug_debugger_stop_worker(d);
>   
>   	xe_eudebug_event_log_print(d->log, true);
>   	xe_eudebug_event_log_print(c->log, true);
> @@ -2485,7 +2485,7 @@ static void test_vm_bind_clear(int fd, uint32_t flags)
>   	xe_eudebug_client_start(s->client);
>   
>   	xe_eudebug_client_wait_done(s->client);
> -	xe_eudebug_debugger_stop_worker(s->debugger, 1);
> +	xe_eudebug_debugger_stop_worker(s->debugger);
>   
>   	igt_assert_eq(priv->bind_count, priv->unbind_count);
>   	igt_assert_eq(priv->sum * 2, priv->bind_count);
> @@ -2715,7 +2715,7 @@ static void test_vma_ufence(int fd, unsigned int flags)
>   	xe_eudebug_client_start(s->client);
>   
>   	xe_eudebug_client_wait_done(s->client);
> -	xe_eudebug_debugger_stop_worker(s->debugger, 1);
> +	xe_eudebug_debugger_stop_worker(s->debugger);
>   
>   	xe_eudebug_event_log_print(s->debugger->log, true);
>   	xe_eudebug_event_log_print(s->client->log, true);
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 4c6c31da3a..e1516c202f 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1712,7 +1712,7 @@ static void test_preemption(int fd, struct drm_xe_engine_class_instance *hwe)
>   	xe_eudebug_client_wait_done(s->client);
>   	xe_eudebug_client_wait_done(other);
>   
> -	xe_eudebug_debugger_stop_worker(s->debugger, 1);
> +	xe_eudebug_debugger_stop_worker(s->debugger);
>   
>   	xe_eudebug_session_destroy(s);
>   	xe_eudebug_client_destroy(other);
> @@ -1831,7 +1831,7 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
>   
>   	xe_eudebug_client_wait_done(s->client);
>   
> -	xe_eudebug_debugger_stop_worker(s->debugger, 1);
> +	xe_eudebug_debugger_stop_worker(s->debugger);
>   
>   	xe_eudebug_event_log_print(s->debugger->log, true);
>   	xe_eudebug_event_log_print(s->client->log, true);
> @@ -1938,7 +1938,7 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
>   	xe_force_gt_reset_async(s->debugger->master_fd, debugee_data->hwe.gt_id);
>   
>   	xe_eudebug_client_wait_done(debugee);
> -	xe_eudebug_debugger_stop_worker(s->debugger, 1);
> +	xe_eudebug_debugger_stop_worker(s->debugger);
>   
>   	xe_eudebug_event_log_print(s->debugger->log, true);
>   	xe_eudebug_event_log_print(debugee->log, true);
> @@ -2052,7 +2052,7 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
>   
>   	xe_eudebug_client_wait_done(s->client);
>   
> -	xe_eudebug_debugger_stop_worker(s->debugger, 1);
> +	xe_eudebug_debugger_stop_worker(s->debugger);
>   
>   	xe_eudebug_event_log_print(s->debugger->log, true);
>   	xe_eudebug_event_log_print(s->client->log, true);
> @@ -2163,7 +2163,7 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
>   
>   	xe_eudebug_client_wait_done(s->client);
>   
> -	xe_eudebug_debugger_stop_worker(s->debugger, 1);
> +	xe_eudebug_debugger_stop_worker(s->debugger);
>   
>   	xe_eudebug_event_log_print(s->debugger->log, true);
>   	xe_eudebug_event_log_print(s->client->log, true);
> @@ -2497,7 +2497,7 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
>   
>   	for (i = 0; i < n; i++) {
>   		xe_eudebug_client_wait_done(s[i]->client);
> -		xe_eudebug_debugger_stop_worker(s[i]->debugger, 1);
> +		xe_eudebug_debugger_stop_worker(s[i]->debugger);
>   
>   		xe_eudebug_event_log_print(s[i]->debugger->log, true);
>   		online_session_check(s[i], flags);

