Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0791FD591A5
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 16:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AF410E68C;
	Tue, 19 Nov 2024 16:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaXQBlOs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE9E10E68C
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732034963; x=1763570963;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HKH82dMKB2dV73r3zGPSk2X3GgEsViKa2hYH3x9+YOk=;
 b=AaXQBlOspYZ5EoJhgRDLKcg1GgUaf7YNqKonyDK0u2FA5OI4RJE6hFa5
 BsUm0Y3XMgLPHGJMjro3cewXBS+ctc5C7szsfELZztm71wVBys9B0nP7X
 CKfvFN3RGeVNiHbPhWG/GzP7ynbg2ycuW7XGccevtfg1FAxMkPvvrXQay
 TVIe3uHEjxK7yek6ICSXs7a5v6fSwHiGOXLYiBzR0w/J3NEOa94fx9Cc8
 G35J7gTDUEfh7KaIR6guibN7p6u0L3gsgoNZMyKyPh91jN056jfRyjpFr
 OARt8+huYD+JRCjXP7M8I05O73k9pe9mbrxGk7eR9Oo1BDETCQrq7btcR A==;
X-CSE-ConnectionGUID: Sn0Tm3zdRxumLld2/3pxvA==
X-CSE-MsgGUID: d3ACDBk1RK6Z3VrTDc81vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43452776"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="43452776"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:49:22 -0800
X-CSE-ConnectionGUID: Bv9ROEniSAqdxEVEyP8hsw==
X-CSE-MsgGUID: 92XXWzLJTwewzPMYgU3Qrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="94070984"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.74])
 ([10.245.244.74])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:49:20 -0800
Message-ID: <7b6ec309-ed43-4b34-ba5c-694a9c8a715c@intel.com>
Date: Tue, 19 Nov 2024 17:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_eudebug_online: Add read/write
 pagefault online tests
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-5-gwan-gyeong.mun@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241115141132.866838-5-gwan-gyeong.mun@intel.com>
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

Hi Gwan-gyeong,

On 15.11.2024 15:11, Gwan-gyeong Mun wrote:
> Add read and write pagefault tests to xe_eudebug_online that checks if a
> pagefault event is submitted by the KMD debugger when a pagefault occurs.

For some reason when running the test with the '--debug' option it seems 
like there are events missing in the debugger log. I haven't been able 
to spot whether that's a problem on the kmd or igt side, but that seems 
only to be the case for the page fault tests.

Yes, the test passing despite this... is not good. That inevitable igt 
event processing rewrite is nocking on the door. But the debugger log 
itself should report all events the debugger has sent - so that needs 
some attention.

> 
> Test that read (load instruction) and write(store instruction) attempt to
> load or store access to unallocated memory, causing a pagefault.
> Examine the address causing the page fault and the number of eu threads
> causing the pagefault.
> 
> Co-developed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>   tests/intel/xe_eudebug_online.c | 219 +++++++++++++++++++++++++++++++-
>   1 file changed, 215 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 0ef0d8093..eae0eb520 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -36,6 +36,8 @@
>   #define BB_IN_VRAM			(1 << 11)
>   #define TARGET_IN_SRAM			(1 << 12)
>   #define TARGET_IN_VRAM			(1 << 13)
> +#define SHADER_PAGEFAULT_READ		(1 << 14)
> +#define SHADER_PAGEFAULT_WRITE		(1 << 15)
>   #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
>   #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
>   #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
> @@ -45,6 +47,7 @@
>   #define TRIGGER_RESUME_DSS		(1 << 30)
>   #define TRIGGER_RESUME_ONE		(1 << 31)
>   
> +#define SHADER_PAGEFAULT	(SHADER_PAGEFAULT_READ | SHADER_PAGEFAULT_WRITE)
>   #define BB_REGION_BITMASK	(BB_IN_SRAM | BB_IN_VRAM)
>   #define TARGET_REGION_BITMASK	(TARGET_IN_SRAM | TARGET_IN_VRAM)
>   
> @@ -61,6 +64,8 @@
>   #define CACHING_VALUE(n)	(CACHING_INIT_VALUE + (n))
>   
>   #define SHADER_CANARY 0x01010101
> +#define BAD_CANARY 0xf1f1f1f
> +#define BAD_OFFSET (0x12345678ull << 12)
>   
>   #define WALKER_X_DIM		4
>   #define WALKER_ALIGNMENT	16
> @@ -123,6 +128,9 @@ static int get_number_of_threads(uint64_t flags)
>   	if (flags & SHADER_MIN_THREADS)
>   		return 16;
>   
> +	if (flags & SHADER_PAGEFAULT)
> +		return 16;

Nit: could be merged together with the above.

> +
>   	if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
>   		     TRIGGER_RESUME_PARALLEL_WALK | SHADER_CACHING_SRAM | SHADER_CACHING_VRAM))
>   		return 32;
> @@ -179,6 +187,16 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
>   			gpgpu_shader__common_target_write_u32(shader, s_dim.y + i, CACHING_VALUE(i));
>   		gpgpu_shader__nop(shader);
>   		gpgpu_shader__breakpoint(shader);
> +	} else if (flags & SHADER_PAGEFAULT) {
> +		if (flags & SHADER_PAGEFAULT_READ)
> +			gpgpu_shader__read_page_fault(shader, BAD_OFFSET);
> +		else if (flags & SHADER_PAGEFAULT_WRITE)
> +			gpgpu_shader__write_offset(shader, BAD_OFFSET, BAD_CANARY);
> +
> +		gpgpu_shader__label(shader, 0);
> +		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
> +		gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
> +		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>   	}
>   
>   	gpgpu_shader__eot(shader);
> @@ -217,6 +235,17 @@ static int count_set_bits(void *ptr, size_t size)
>   	return count;
>   }
>   
> +static int
> +eu_attentions_xor_count(const uint32_t *a, const uint32_t *b, uint32_t size)

Nit: the current checkpatch line limit is 100 characters which means 
this would fit in a single line.

> +{
> +	int count = 0;
> +
> +	for (int i = 0; i < size / 4 ; i++)
> +		count += igt_hweight(a[i] ^ b[i]);
> +
> +	return count;
> +}
> +
>   static int count_canaries_eq(uint32_t *ptr, struct dim_t w_dim, uint32_t value)
>   {
>   	int count = 0;
> @@ -636,7 +665,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
>   		}
>   	}
>   
> -	if (d->flags & SHADER_LOOP) {
> +	if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
>   		uint32_t threads = get_number_of_threads(d->flags);
>   		uint32_t val = STEERING_END_LOOP;
>   
> @@ -746,6 +775,43 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>   			data->single_step_bitmask[i] &= ~att->bitmask[i];
>   }
>   
> +static void eu_attention_resume_pagefault_trigger(struct xe_eudebug_debugger *d,
> +						  struct drm_xe_eudebug_event *e)
> +{
> +	struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
> +	struct online_debug_data *data = d->ptr;
> +	uint32_t bitmask_size = att->bitmask_size;
> +	uint8_t *bitmask;
> +
> +	if (data->last_eu_control_seqno > att->base.seqno)
> +		return;
> +
> +	bitmask = calloc(1, att->bitmask_size);
> +
> +	eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
> +		       att->lrc_handle, bitmask, &bitmask_size);
> +	igt_assert(bitmask_size == att->bitmask_size);
> +
> +	pthread_mutex_lock(&data->mutex);
> +
> +	if (d->flags & SHADER_PAGEFAULT) {
> +		uint32_t threads = get_number_of_threads(d->flags);
> +		uint32_t val = STEERING_END_LOOP;
> +
> +		igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
> +				     data->target_offset + steering_offset(threads)),
> +			      sizeof(uint32_t));
> +		fsync(data->vm_fd);
> +	}
> +	pthread_mutex_unlock(&data->mutex);
> +
> +	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
> +						    att->exec_queue_handle, att->lrc_handle,
> +						    bitmask, att->bitmask_size);
> +
> +	free(bitmask);
> +}
> +
>   static void open_trigger(struct xe_eudebug_debugger *d,
>   			 struct drm_xe_eudebug_event *e)
>   {
> @@ -1015,7 +1081,7 @@ static void run_online_client(struct xe_eudebug_client *c)
>   	struct intel_bb *ibb;
>   	struct intel_buf *buf;
>   	uint32_t *ptr;
> -	int fd;
> +	int fd, vm_flags;
>   
>   	metadata[0] = calloc(2, sizeof(*metadata));
>   	metadata[1] = calloc(2, sizeof(*metadata));
> @@ -1025,7 +1091,7 @@ static void run_online_client(struct xe_eudebug_client *c)
>   	fd = xe_eudebug_client_open_driver(c);
>   
>   	/* Additional memory for steering control */
> -	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP)
> +	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c->flags & SHADER_PAGEFAULT)
>   		s_dim.y++;
>   	/* Additional memory for caching check */
>   	if ((c->flags & SHADER_CACHING_SRAM) || (c->flags & SHADER_CACHING_VRAM))
> @@ -1045,7 +1111,11 @@ static void run_online_client(struct xe_eudebug_client *c)
>   							   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
>   							   2 * sizeof(*metadata), metadata[1]);
>   
> -	create.vm_id = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
> +	vm_flags |= c->flags & SHADER_PAGEFAULT ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
> +
> +	create.vm_id = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
> +
>   	xe_eudebug_client_exec_queue_create(c, fd, &create);
>   
>   	ibb = xe_bb_create_on_offset(fd, create.exec_queue_id, create.vm_id, bb_offset, bb_size,
> @@ -1245,11 +1315,14 @@ match_attention_with_exec_queue(struct xe_eudebug_event_log *log,
>   static void online_session_check(struct xe_eudebug_session *s, int flags)
>   {
>   	struct drm_xe_eudebug_event_eu_attention *ea = NULL;
> +	struct drm_xe_eudebug_event_pagefault *pf = NULL;
>   	struct drm_xe_eudebug_event *event = NULL;
>   	struct online_debug_data *data = s->client->ptr;
>   	bool expect_exception = flags & DISABLE_DEBUG_MODE ? false : true;
>   	int sum = 0;
>   	int bitmask_size;
> +	int pagefault_threads = 0;
> +	uint32_t *ptr = NULL;
>   
>   	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
>   					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
> @@ -1265,6 +1338,16 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
>   			igt_assert_eq(ea->bitmask_size, bitmask_size);
>   			sum += count_set_bits(ea->bitmask, bitmask_size);
>   			igt_assert(match_attention_with_exec_queue(s->debugger->log, ea));
> +		} else if (event->type == DRM_XE_EUDEBUG_EVENT_PAGEFAULT) {
> +			uint32_t after_offset = bitmask_size / sizeof(uint32_t);
> +			uint32_t resolved_offset = bitmask_size / sizeof(uint32_t) * 2;
> +
> +			pf = (struct drm_xe_eudebug_event_pagefault *)event;
> +			ptr = (uint32_t *) pf->bitmask;
> +			igt_assert_eq(pf->bitmask_size, bitmask_size * 3);
> +			pagefault_threads += eu_attentions_xor_count(ptr + after_offset,
> +								     ptr + resolved_offset,
> +								     bitmask_size);
>   		}
>   	}
>   
> @@ -1279,6 +1362,9 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
>   		igt_assert(sum > 0);
>   	else
>   		igt_assert(sum == 0);
> +
> +	if (flags & SHADER_PAGEFAULT)
> +		igt_assert(pagefault_threads > 0);
>   }
>   
>   static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
> @@ -1302,6 +1388,55 @@ static void ufence_ack_set_bp_trigger(struct xe_eudebug_debugger *d,
>   	}
>   }
>   
> +static void pagefault_trigger(struct xe_eudebug_debugger *d,
> +			      struct drm_xe_eudebug_event *e)
> +{
> +	struct drm_xe_eudebug_event_pagefault *pf = (void *) e;
> +	int before_threads, after_threads, resolved_threads, pagefault_threads;
> +	uint32_t attn_size = pf->bitmask_size / 3;
> +	uint32_t *ptr = (uint32_t *) pf->bitmask;
> +	uint32_t offset, before_offset = 0;
> +	uint32_t after_offset = attn_size / sizeof(uint32_t);
> +	uint32_t resolved_offset = attn_size / sizeof(uint32_t) * 2;
> +
> +	before_threads = count_set_bits(ptr + before_offset, attn_size);
> +	after_threads = count_set_bits(ptr + after_offset, attn_size);
> +	resolved_threads = count_set_bits(ptr + resolved_offset, attn_size);
> +
> +	pagefault_threads = eu_attentions_xor_count(ptr + after_offset,
> +						    ptr + resolved_offset,
> +						    attn_size);
> +
> +	igt_debug("EVENT[%llu] pagefault; threads[before=%d, after=%d, "
> +		  "resolved=%d, pagefault=%d] "
> +		  "client[%llu], exec_queue[%llu], lrc[%llu], bitmask_size[%d], "
> +		  "pagefault_address[0x%llx]\n",
> +		  pf->base.seqno, before_threads, after_threads, resolved_threads,
> +		  pagefault_threads, pf->client_handle, pf->exec_queue_handle,
> +		  pf->lrc_handle, pf->bitmask_size,
> +		  pf->pagefault_address);
> +
> +	for (int idx = 0; idx < 3; idx++) {
> +		if (idx == 0) {
> +			igt_debug("=== Attentions before ===\n");
> +			offset = before_offset;
> +		} else if (idx == 1) {
> +			igt_debug("=== Attentions after ===\n");
> +			offset = after_offset;
> +		} else {
> +			igt_debug("=== Attentions resolved ===\n");
> +			offset = resolved_offset;
> +		}
> +
> +		for (uint32_t i = 0; i < attn_size / sizeof(uint32_t); i += 2)
> +			igt_debug("bitmask[%d] = 0x%08x%08x\n", i / 2,
> +				  ptr[offset + i], ptr[offset + i + 1]);
> +	}
> +
> +	igt_assert(pagefault_threads > 0);
> +	igt_assert_eq_u64(pf->pagefault_address, BAD_OFFSET);
> +}
> +
>   /**
>    * SUBTEST: basic-breakpoint
>    * Description:
> @@ -1383,6 +1518,77 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
>   	online_debug_data_destroy(data);
>   }
>   
> +/**
> + * SUBTEST: pagefault-read
> + * Description:
> + *     Check whether KMD sends pagefault event for workload in debug mode that
> + *     triggers a read pagefault.
> + *
> + * SUBTEST: pagefault-write
> + * Description:
> + *     Check whether KMD sends pagefault event for workload in debug mode that
> + *     triggers a write pagefault.
> + */
> +static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *hwe,
> +				  int flags)
> +{
> +	struct xe_eudebug_session *s;
> +	struct online_debug_data *data;
> +	uint32_t val;
> +
> +	data = online_debug_data_create(hwe);
> +	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
> +
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
> +					open_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
> +					exec_queue_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +					eu_attention_debug_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +					eu_attention_resume_pagefault_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
> +					create_metadata_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
> +					ufence_ack_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
> +					pagefault_trigger);
> +
> +	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
> +	xe_eudebug_debugger_start_worker(s->debugger);
> +	xe_eudebug_client_start(s->client);
> +
> +	/* wait for workload to start */
> +	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
> +		/* collect needed data from triggers */
> +		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
> +			continue;
> +
> +		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
> +			if (val != 0)
> +				break;
> +	}

I think this is redundant. It looks like it copies the 
'test_interrupt_all' function, but as far I'm concerned the waiting loop 
is there to interact with the client thread while the gpu workload is 
running. Since we don't do that here I think 'test_pagefault_online' 
should rather resemble the 'test_basic_online' function.

Thanks,
Christoph

> +
> +	pthread_mutex_lock(&data->mutex);
> +	igt_assert(data->client_handle != -1);
> +	igt_assert(data->exec_queue_handle != -1);
> +
> +	pthread_mutex_unlock(&data->mutex);
> +
> +	xe_eudebug_client_wait_done(s->client);
> +
> +	xe_eudebug_debugger_stop_worker(s->debugger, 1);
> +
> +	xe_eudebug_event_log_print(s->debugger->log, true);
> +	xe_eudebug_event_log_print(s->client->log, true);
> +
> +	online_session_check(s, s->flags);
> +
> +	xe_eudebug_session_destroy(s);
> +	online_debug_data_destroy(data);
> +}
> +
>   /**
>    * SUBTEST: preempt-breakpoint
>    * Description:
> @@ -2344,6 +2550,11 @@ igt_main
>   	igt_subtest("breakpoint-many-sessions-tiles")
>   		test_many_sessions_on_tiles(fd, true);
>   
> +	test_gt_render_or_compute("pagefault-read", fd, hwe)
> +		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ);
> +	test_gt_render_or_compute("pagefault-write", fd, hwe)
> +		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
> +
>   	igt_fixture {
>   		xe_eudebug_enable(fd, was_enabled);
>   
