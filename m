Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B2DD7237D
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 11:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915D610E125;
	Fri, 23 Jan 2026 11:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3Uhx0TW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8518D10E125
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769169581; x=1800705581;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8Q5mVRjJhvnuE5smP3ILmukfQJsz0Bg6+iW2eBLG7s4=;
 b=W3Uhx0TWl69uYXPkAFC68z/OY3/o/3xYXKKCmP8buxm3zQ/Foxuw7F7E
 J7mE4Hh3cqz/P/6r0SXuEwRCdYuwUaJPbrhuhNNNttIk1yI/vt3C4CYr3
 JG1A/yVXs22sOsSHNVr9lM1WIQ/CJdmhHQ2jNSLH7Lq8ejrh6tw5F4ePN
 o+ajHmXrKpnf8DO3zsdziM8KZnQj3Uv32bdUBGzZlPBo8ltH7CH7idJ4a
 1FE4ZED8tGLFyGB7rSgpyeRvXW2FF1i4KDXO1UIs5xzD0XTThkjFF8UfC
 BIdofzH0XCvYkFDYCjUqafK1Fd8HS0VgBHE+Uy7BhAFKkU/qme3bmns6L g==;
X-CSE-ConnectionGUID: DEMs0mVCRwGfGlyVUnU46Q==
X-CSE-MsgGUID: /1LHGzPAS1Wb7SBlICXUtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87839944"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="87839944"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 03:59:41 -0800
X-CSE-ConnectionGUID: HHqrGeFQRQSS1ejWj5ZfNg==
X-CSE-MsgGUID: oGbz3WoZQkayg1w6MiG1PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211510319"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 03:59:40 -0800
Date: Fri, 23 Jan 2026 12:59:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Piotr Rudnicki <piotr.rudnicki@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH v2 RESEND i-g-t 1/1] tests/xe_eudebug_online: Extract
 workload start helpers
Message-ID: <20260123115937.psafn2p4arlvgeub@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Piotr Rudnicki <piotr.rudnicki@intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>
References: <20260123093307.166062-2-piotr.rudnicki@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260123093307.166062-2-piotr.rudnicki@intel.com>
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

Hi Piotr,
On 2026-01-23 at 10:33:08 +0100, Piotr Rudnicki wrote:
> Extract duplicate workload start wait logic into reusable helpers
> wait_for_workloads_start() and wait_for_workload_start().
> 
> Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
> Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
> V1 -> V2: Use count++ and implicit array size per review feedback

Still the same compilation error, see my previous reply.

Regards,
Kamil

> 
>  tests/intel/xe_eudebug_online.c | 78 +++++++++++++++------------------
>  1 file changed, 36 insertions(+), 42 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index ff6c5ff19..f60399060 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -470,6 +470,38 @@ static void online_debug_data_destroy(struct online_debug_data *data)
>  	munmap(data, ALIGN(sizeof(*data), PAGE_SIZE));
>  }
>  
> +static void wait_for_workloads_start(struct online_debug_data **data, int n)
> +{
> +	int val;
> +	int count;
> +	int i;
> +
> +	igt_for_milliseconds(n * STARTUP_TIMEOUT_MS) {
> +		count = 0;
> +		for (i = 0; i < n; i++) {
> +			if (READ_ONCE(data[i]->vm_fd) == -1 ||
> +			    READ_ONCE(data[i]->target_size) == 0)
> +				continue;
> +
> +			if (pread(data[i]->vm_fd, &val, sizeof(val),
> +				  data[i]->target_offset) == sizeof(val) &&
> +			    val != 0)
> +				count++;
> +		}
> +
> +		if (count == n)
> +			break;
> +	}
> +	igt_assert_eq(count, n);
> +}
> +
> +static void wait_for_workload_start(struct online_debug_data *data)
> +{
> +	struct online_debug_data *array[] = { data };
> +
> +	wait_for_workloads_start(array, 1);
> +}
> +
>  static void eu_attention_debug_trigger(struct xe_eudebug_debugger *d,
>  				       struct drm_xe_eudebug_event *e)
>  {
> @@ -1928,16 +1960,7 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
>  	xe_eudebug_debugger_start_worker(s->debugger);
>  	xe_eudebug_client_start(s->client);
>  
> -	/* wait for workload to start */
> -	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
> -		/* collect needed data from triggers */
> -		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
> -			continue;
> -
> -		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
> -			if (val != 0)
> -				break;
> -	}
> +	wait_for_workload_start(data);
>  
>  	pthread_mutex_lock(&data->mutex);
>  	igt_assert(data->client_handle != -1);
> @@ -2014,16 +2037,7 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
>  	xe_eudebug_debugger_start_worker(s->debugger);
>  	xe_eudebug_client_start(s->client);
>  
> -	/* wait for workload to start */
> -	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
> -		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
> -			continue;
> -
> -		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
> -			if (val != 0)
> -				break;
> -	}
> -	igt_assert_f(val != 0, "Workload execution is not yet started\n");
> +	wait_for_workload_start(data);
>  
>  	xe_eudebug_debugger_detach(s->debugger);
>  	reset_debugger_log(s->debugger);
> @@ -2082,7 +2096,6 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
>  {
>  	struct xe_eudebug_session *s;
>  	struct online_debug_data *data;
> -	uint32_t val;
>  	uint32_t random_command;
>  	uint32_t bitmask_size = query_attention_bitmask_size(fd, hwe->gt_id);
>  	uint8_t *attention_bitmask = malloc(bitmask_size * sizeof(uint8_t));
> @@ -2110,16 +2123,7 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
>  	xe_eudebug_debugger_start_worker(s->debugger);
>  	xe_eudebug_client_start(s->client);
>  
> -	/* wait for workload to start */
> -	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
> -		/* collect needed data from triggers */
> -		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
> -			continue;
> -
> -		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
> -			if (val != 0)
> -				break;
> -	}
> ++	wait_for_workload_start(data);
>  
>  	pthread_mutex_lock(&data->mutex);
>  	igt_assert(data->client_handle != -1);
> @@ -2237,7 +2241,6 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
>  	struct drm_xe_eudebug_event *e = NULL;
>  	struct online_debug_data *data;
>  	struct xe_eudebug_session *s;
> -	uint32_t val;
>  
>  	data = online_debug_data_create(fd, hwe, flags);
>  	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
> @@ -2260,16 +2263,7 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
>  	xe_eudebug_debugger_start_worker(s->debugger);
>  	xe_eudebug_client_start(s->client);
>  
> -	/* wait for workload to start */
> -	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
> -		/* collect needed data from triggers */
> -		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
> -			continue;
> -
> -		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
> -			if (val != 0)
> -				break;
> -	}
> ++	wait_for_workload_start(data);
>  
>  	pthread_mutex_lock(&data->mutex);
>  	igt_assert(data->client_handle != -1);
> -- 
> 2.43.0
> 
