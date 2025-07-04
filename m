Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEF3C83030
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 08:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F123710E994;
	Fri,  4 Jul 2025 08:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="garhoKIE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB8A10E973
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 08:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751616312; x=1783152312;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hvylcKrUqqZZrtBwAa3ZJMRPGAsjKADVZZrqjWYFNOA=;
 b=garhoKIEbUjMQfsCeIdZoTVgxUQ2iN0IF+i6nxt+blMtYrsqmEDo+1Lp
 Zo48nrjpFY7kneZmXrcKEqj62pKaXM/n6zNlYwUdCEfuxYU6uRrG6Uwl8
 23Ao/wTjrja/QeemuEpmnzD9sAPXxGOCRFnTUMI7sh0cQKxVGkgrO0P5t
 K+3WZyX7/H0rK35lgx0ps6GnOP9UakT6jyhF4IfirVO2+YiMi9YIlzCYY
 vWed6F1t3KmuP6h7SpAgKqtn8OC5gvnTmsnA91wHGOjtr1VBUmaxKDpQP
 PPf5VvZIvfa2Ia4b9Kv6xxxJpQ4ob13HKHkSLBze3/cDg/eEzZtRZAskZ Q==;
X-CSE-ConnectionGUID: 9CazT6wiTF+YuP+qtj1VXA==
X-CSE-MsgGUID: GgD5BApIRNWuh1LQM4iSqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76495632"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="76495632"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:05:12 -0700
X-CSE-ConnectionGUID: ecDSwU8VTJWmk2psyZuDqQ==
X-CSE-MsgGUID: zEXSfi/LRP2HbsLh9WosVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="158857986"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.42])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:05:11 -0700
Date: Fri, 4 Jul 2025 10:05:07 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] lib/intel_compute: use post-sync write to
 detect command level preemption
Message-ID: <ihd2zrpbiwlf4zo4hmxhwd7l4tntz6zebk7vog3w56p7z7cuqt@dslkuoecjwtt>
References: <20250703063032.553963-5-zbigniew.kempczynski@intel.com>
 <20250703063032.553963-8-zbigniew.kempczynski@intel.com>
 <aGeKjDZeLvwxOTFA@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGeKjDZeLvwxOTFA@fdugast-desk>
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

On Fri, Jul 04, 2025 at 10:02:20AM +0200, Francois Dugast wrote:
> On Thu, Jul 03, 2025 at 08:30:36AM +0200, Zbigniew Kempczyński wrote:
> > At command level when long job compute walker is finished we might
> > be immediately switched to short job. This defers signalling of long
> > job user-fence giving false impression this job is still ongoing.
> > 
> > Add post-sync write to compute walker to allow detect this situation
> > and fail if command level preemption occurred instead TG preemption.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> 
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Thanks for the review.

--
Zbigniew

> 
> > ---
> >  lib/intel_compute.c | 23 +++++++++++++++++------
> >  1 file changed, 17 insertions(+), 6 deletions(-)
> > 
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index 9549b58fdf..6126bdb3f7 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -53,6 +53,7 @@
> >  #define OFFSET_STATE_SIP			0xFFFF0000
> >  
> >  #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> > +#define POST_SYNC_VALUE			0xabcdabcdcdefcdefull
> >  #define MAGIC_LOOP_STOP			0x12341234
> >  
> >  #define THREADS_PER_GROUP		32
> > @@ -63,6 +64,7 @@
> >  #define ENQUEUED_LOCAL_SIZE_Z		1
> >  #define DP_SS_CACHE_FLUSH		(1 << 12)
> >  #define DP_PIPELINE_FLUSH		(1 << 2)
> > +#define WRITE_IMM_DATA			(1 << 0)
> >  #define WRITE_TIMESTAMP		(3 << 0)
> >  
> >  /*
> > @@ -1557,7 +1559,7 @@ static void xe2lpg_compute_exec_compute(int fd,
> >  					bool	 threadgroup_preemption,
> >  					uint32_t work_size)
> >  {
> > -	uint8_t wb_mocs = intel_get_wb_mocs_index(fd);
> > +	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
> >  	int b = 0;
> >  
> >  	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
> > @@ -1617,7 +1619,7 @@ static void xe2lpg_compute_exec_compute(int fd,
> >  	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
> >  	addr_bo_buffer_batch[b++] = 0x001ff000;
> >  
> > -	if (sip_start_pointer) {
> > +	if (sip_start_pointer && !threadgroup_preemption) {
> >  		addr_bo_buffer_batch[b++] = XE2_STATE_SIP | 0x1;
> >  		addr_bo_buffer_batch[b++] = sip_start_pointer;
> >  		addr_bo_buffer_batch[b++] = 0x00000000;
> > @@ -1665,12 +1667,12 @@ static void xe2lpg_compute_exec_compute(int fd,
> >  	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > -	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | wb_mocs << 4 |
> > -				    DP_PIPELINE_FLUSH | WRITE_TIMESTAMP;
> > +	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | uc_mocs << 4 |
> > +				    DP_PIPELINE_FLUSH | WRITE_IMM_DATA;
> >  	addr_bo_buffer_batch[b++] = ADDR_BATCH;
> >  	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
> > -	addr_bo_buffer_batch[b++] = 0x00000000;
> > -	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = (uint32_t) POST_SYNC_VALUE;
> > +	addr_bo_buffer_batch[b++] = (uint32_t) (POST_SYNC_VALUE >> 32);
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > @@ -2117,6 +2119,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
> >  	struct bo_dict_entry bo_dict_short[ARRAY_SIZE(bo_dict_long)];
> >  	struct bo_execenv execenv_short, execenv_long;
> >  	float *input_short, *output_short, *input_long;
> > +	uint64_t *post_data;
> >  	unsigned int long_kernel_loop_count = 0;
> >  	int64_t timeout_one_ns = 1;
> >  	bool use_loop_kernel = loop_kernel && !threadgroup_preemption;
> > @@ -2165,6 +2168,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
> >  	input_long = (float *) bo_dict_long[4].data;
> >  	input_short = (float *) bo_dict_short[4].data;
> >  	output_short = (float *) bo_dict_short[5].data;
> > +	post_data = (uint64_t *) bo_dict_long[8].data;
> >  
> >  	bo_randomize(input_short, SIZE_DATA);
> >  
> > @@ -2195,6 +2199,12 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
> >  	bo_execenv_exec(&execenv_short, ADDR_BATCH);
> >  	bo_check_square(input_short, output_short, SIZE_DATA);
> >  
> > +	/*
> > +	 * Catch command level preemption instead TG preemption. For TG and WMTP
> > +	 * post sync can't be visible at this point yet.
> > +	 */
> > +	igt_assert_neq_u64(POST_SYNC_VALUE, *post_data);
> > +
> >  	/* Check that the long kernel has not completed yet */
> >  	igt_assert_neq(0, __xe_wait_ufence(fd, &execenv_long.bo_sync->sync, USER_FENCE_VALUE,
> >  					   execenv_long.exec_queue, &timeout_one_ns));
> > @@ -2205,6 +2215,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
> >  	((int *)input_long)[0] = MAGIC_LOOP_STOP;
> >  
> >  	bo_execenv_sync(&execenv_long);
> > +	igt_assert_eq_u64(POST_SYNC_VALUE, *post_data);
> >  
> >  	bo_execenv_unbind(&execenv_short, bo_dict_short, entries);
> >  	bo_execenv_unbind(&execenv_long, bo_dict_long, entries);
> > -- 
> > 2.43.0
> > 
