Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD54CCD4F3D
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 17:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF4E10E03D;
	Wed, 20 May 2026 17:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HV9UC5C7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CAB10E03D
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 17:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779299543; x=1810835543;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pWHRHHvwtojrwmdblclxsnnmaHe8YleO44VY4yslWk0=;
 b=HV9UC5C7xo5jRj8mJuwQfaW+fOGxyDR/el2Is8ZZ5WARo8KTGg0gMZF0
 nEaizi7PtG5DgQX4X1TW8UMrOpuBWAnqBYq6PYiDQ+qEMVL+TezrgtYmP
 Qrxrx7TndfuDRPIbdecyGUXZi3fqCpiHiS4QQhlM5toQ/2ufcuvaM7hpz
 g/uOfkLM1eC9Why2IFLU38V9EbH3n/E/JaG4grGPyHQq5+vjiSoQi41pj
 7ojDH63W3HE4R4vNRvOHiN77NOolkbinUFv1OcRbtbqPV/BSd/9SX7Mxr
 /94GNAu6acXcb6FQmCb9V8ZodFr+jCDoG9a64ReVqL/XhWSuK/PNU2DAt w==;
X-CSE-ConnectionGUID: NxsXw5yKT+KRZ8wCtWCOAA==
X-CSE-MsgGUID: xEkeXZ0dT1SfZPQncRAmGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80241959"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80241959"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 10:52:22 -0700
X-CSE-ConnectionGUID: ZL7LS8pUS/KvGPwQCAc8XQ==
X-CSE-MsgGUID: s+xcRQQsRNer5dsFxPNn+Q==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.99])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 10:52:21 -0700
Date: Wed, 20 May 2026 19:52:18 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] lib/intel_compute: Improve executing
 large-buffer compute on pre-Xe
Message-ID: <uq4xsp24g2xhajxbt4mhoz5odin55vbwhpvgpuha6jvmjixd7b@gllbk3hwb626>
References: <20260520090034.463367-4-zbigniew.kempczynski@intel.com>
 <20260520090034.463367-6-zbigniew.kempczynski@intel.com>
 <ag3aeztTvOOxk-MF@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ag3aeztTvOOxk-MF@fdugast-desk>
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

On Wed, May 20, 2026 at 05:59:55PM +0200, Francois Dugast wrote:
> On Wed, May 20, 2026 at 11:00:37AM +0200, Zbigniew Kempczyński wrote:
> > Missing STATE_COMPUTE_MODE instruction in the pipeline causes undefined
> > behavior which can be observed when input/output buffers size exceeds 2M.
> 
> Great finding, thanks for looking into this!
> 
> I confirm it does fix compute-square-userenv-large-buffer on ADLP.
> 
> > 
> > Update pipeline, shader and data to reflect changes in arguments passing
> > due to use latest version of ocloc compiler.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  lib/intel_compute.c            | 74 +++++++++++++++++++++-------------
> >  lib/intel_compute_krn_square.h | 36 ++++++-----------
> >  2 files changed, 60 insertions(+), 50 deletions(-)
> > 
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index 680675982a..40e57e68b8 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -61,6 +61,7 @@
> >  #define THREADS_PER_GROUP		32
> >  #define THREAD_GROUP_Y			1
> >  #define THREAD_GROUP_Z			1
> > +#define PREXE_ENQUEUED_LOCAL_SIZE_X	512
> >  #define ENQUEUED_LOCAL_SIZE_X		1024
> >  #define ENQUEUED_LOCAL_SIZE_Y		1
> >  #define ENQUEUED_LOCAL_SIZE_Z		1
> > @@ -513,6 +514,13 @@ static uint32_t size_thread_group_x(uint32_t work_size)
> >  				   ENQUEUED_LOCAL_SIZE_Z));
> >  }
> >  
> > +static uint32_t prexe_size_thread_group_x(uint32_t work_size)
> > +{
> > +	return MAX(1, work_size / (PREXE_ENQUEUED_LOCAL_SIZE_X *
> > +				   ENQUEUED_LOCAL_SIZE_Y *
> > +				   ENQUEUED_LOCAL_SIZE_Z));
> > +}
> > +
> >  static size_t size_input(uint32_t work_size)
> >  {
> >  	return MAX(sizeof(float) * work_size, 0x10000);
> > @@ -538,7 +546,6 @@ static size_t size_output(uint32_t work_size)
> >  static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
> >  				 uint64_t addr_input,
> >  				 uint64_t addr_output,
> > -				 uint32_t end_value,
> >  				 unsigned int loop_count)
> >  {
> >  	uint32_t val = 0;
> > @@ -547,11 +554,15 @@ static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > -	addr_bo_buffer_batch[b++] = 0x00000200;
> > +	addr_bo_buffer_batch[b++] = PREXE_ENQUEUED_LOCAL_SIZE_X;
> > +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
> > +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> >  
> > -	addr_bo_buffer_batch[b++] = 0x00000001;
> > -	addr_bo_buffer_batch[b++] = 0x00000001;
> > -	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = PREXE_ENQUEUED_LOCAL_SIZE_X;
> > +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
> > +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  
> >  	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
> > @@ -564,11 +575,6 @@ static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  
> > -	addr_bo_buffer_batch[b++] = 0x00000200;
> > -	addr_bo_buffer_batch[b++] = 0x00000001;
> > -	addr_bo_buffer_batch[b++] = 0x00000001;
> > -	addr_bo_buffer_batch[b++] = 0x00000000;
> > -
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > @@ -579,7 +585,8 @@ static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
> >  	 * Then it lefts 32 dword gap filled with zeroes. Pattern looks the
> >  	 * same for tgl and dg1 (apart of number of values).
> >  	 */
> > -	while (val < end_value) {
> > +
> > +	while (val < PREXE_ENQUEUED_LOCAL_SIZE_X) {
> >  		addr_bo_buffer_batch[b++] = val | ((val + 1) << 16);
> >  		val += 2;
> >  		if (++curr % 16 == 0)
> > @@ -597,8 +604,11 @@ static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
> >   */
> >  static void create_surface_state(uint32_t *addr_bo_buffer_batch,
> >  				 uint64_t addr_input,
> > -				 uint64_t addr_output)
> > +				 uint64_t addr_output,
> > +				 uint32_t surf_size)
> >  {
> > +	uint32_t w = 0x80;
> > +	uint32_t h = surf_size / w;
> >  	int b = 0;
> >  
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > @@ -617,10 +627,11 @@ static void create_surface_state(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > +
> >  	addr_bo_buffer_batch[b++] = 0x87FD4000;
> >  	addr_bo_buffer_batch[b++] = 0x04000000;
> > -	addr_bo_buffer_batch[b++] = 0x001F007F;
> > -	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = (h - 1) << 16 | (w - 1);
> > +	addr_bo_buffer_batch[b++] = 0x00e00000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00004000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > @@ -633,10 +644,11 @@ static void create_surface_state(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > +
> >  	addr_bo_buffer_batch[b++] = 0x87FD4000;
> >  	addr_bo_buffer_batch[b++] = 0x04000000;
> > -	addr_bo_buffer_batch[b++] = 0x001F007F;
> > -	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = (h - 1) << 16 | (w - 1);
> > +	addr_bo_buffer_batch[b++] = 0x00e00000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00004000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > @@ -649,6 +661,7 @@ static void create_surface_state(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > +
> >  	addr_bo_buffer_batch[b++] = 0x00000040;
> >  	addr_bo_buffer_batch[b++] = 0x00000080;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > @@ -706,7 +719,8 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  				       uint64_t addr_surface_state_base,
> >  				       uint64_t addr_dynamic_state_base,
> >  				       uint64_t addr_indirect_object_base,
> > -				       uint64_t offset_indirect_data_start)
> > +				       uint64_t offset_indirect_data_start,
> > +				       uint32_t work_size)
> >  {
> >  	int b = 0;
> >  
> > @@ -714,6 +728,8 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = 0x00002580;
> >  	addr_bo_buffer_batch[b++] = 0x00060002;
> >  	addr_bo_buffer_batch[b++] = PIPELINE_SELECT;
> > +	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE;
> > +	addr_bo_buffer_batch[b++] = 0x00180010;
> >  	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM(1);
> >  	addr_bo_buffer_batch[b++] = 0x00007034;
> >  	addr_bo_buffer_batch[b++] = 0x60000321;
> > @@ -735,9 +751,9 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = MEDIA_VFE_STATE | (9 - 2);
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > -	addr_bo_buffer_batch[b++] = 0x00A70100;
> > +	addr_bo_buffer_batch[b++] = 0x02FF0100;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > -	addr_bo_buffer_batch[b++] = 0x07820000;
> > +	addr_bo_buffer_batch[b++] = 0x04000000;
> 
> What are those changes?
> 
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > @@ -747,7 +763,7 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > -	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS | (16 - 2);
> > +	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS | 0x14;
> >  	addr_bo_buffer_batch[b++] = 0x00000001;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00040000;
> > @@ -756,7 +772,7 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = (addr_dynamic_state_base & 0xffffffff) | 0x1;
> >  	addr_bo_buffer_batch[b++] = addr_dynamic_state_base >> 32;
> >  	addr_bo_buffer_batch[b++] = (addr_indirect_object_base & 0xffffffff) | 0x1;
> > -	addr_bo_buffer_batch[b++] = (addr_indirect_object_base >> 32) | 0xffff0000;
> > +	addr_bo_buffer_batch[b++] = (addr_indirect_object_base >> 32);
> 
> Why, don't we need that in dg1_compute_exec_compute()?

DG1 doesn't contain appropriate workarounds on xe and thus it is working
on i915 only. So gem_compute contains only simple compute-square with
64 element buffers. I don't want currently to invest time for extending
this test on DG1 so leaving dg1 pipeline as it is is fine for me.

> 
> >  	addr_bo_buffer_batch[b++] = (addr_indirect_object_base & 0xffffffff) | 0x41;
> >  	addr_bo_buffer_batch[b++] = addr_indirect_object_base >> 32;
> >  	addr_bo_buffer_batch[b++] = 0xFFFFF001;
> > @@ -794,7 +810,7 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = 0x8000000f;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > -	addr_bo_buffer_batch[b++] = 0x00000002;
> > +	addr_bo_buffer_batch[b++] = prexe_size_thread_group_x(work_size);
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000001;
> > @@ -833,7 +849,8 @@ static void dg1_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  				     uint64_t addr_surface_state_base,
> >  				     uint64_t addr_dynamic_state_base,
> >  				     uint64_t addr_indirect_object_base,
> > -				     uint64_t offset_indirect_data_start)
> > +				     uint64_t offset_indirect_data_start,
> > +				     uint32_t work_size)
> 
> work_size argument is unused.

Right, initial plan was to extend this as well and then I remembered DG1
is supported on i915 only. I'll send v2 with this code removed.

--
Zbigniew

> 
> Francois
> 
> >  {
> >  	int b = 0;
> >  
> > @@ -962,9 +979,10 @@ static void compute_exec(int fd, const unsigned char *kernel,
> >  
> >  	memcpy(bo_dict[0].data, kernel, size);
> >  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> > -	create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
> > +	create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr,
> > +			     execenv.array_size * sizeof(float));
> >  	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
> > -			     IS_DG1(devid) ? 0x200 : 0x40, execenv.loop_count);
> > +			     execenv.loop_count);
> >  
> >  	input_data = get_input_data(&execenv, bo_dict, entries);
> >  	output_data = get_output_data(&execenv, bo_dict, entries);
> > @@ -974,13 +992,15 @@ static void compute_exec(int fd, const unsigned char *kernel,
> >  					 ADDR_SURFACE_STATE_BASE,
> >  					 ADDR_DYNAMIC_STATE_BASE,
> >  					 ADDR_INDIRECT_OBJECT_BASE,
> > -					 OFFSET_INDIRECT_DATA_START);
> > +					 OFFSET_INDIRECT_DATA_START,
> > +					 execenv.array_size);
> >  	else
> >  		tgllp_compute_exec_compute(bo_dict[6].data,
> >  					   ADDR_SURFACE_STATE_BASE,
> >  					   ADDR_DYNAMIC_STATE_BASE,
> >  					   ADDR_INDIRECT_OBJECT_BASE,
> > -					   OFFSET_INDIRECT_DATA_START);
> > +					   OFFSET_INDIRECT_DATA_START,
> > +					   execenv.array_size);
> >  
> >  	bo_execenv_exec(&execenv, ADDR_BATCH);
> >  
> > diff --git a/lib/intel_compute_krn_square.h b/lib/intel_compute_krn_square.h
> > index ad9f719762..9a368bdff9 100644
> > --- a/lib/intel_compute_krn_square.h
> > +++ b/lib/intel_compute_krn_square.h
> > @@ -14,23 +14,23 @@ static const unsigned char tgllp_kernel_square_bin[] = {
> >  	0x61, 0x00, 0x03, 0x80, 0x20, 0x02, 0x05, 0x03, 0x04, 0x00, 0x10, 0x00,
> >  	0x00, 0x00, 0x00, 0x00, 0x66, 0x01, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
> >  	0x00, 0x80, 0x00, 0x01, 0xc0, 0x04, 0xc0, 0x04, 0x41, 0x01, 0x20, 0x22,
> > -	0x16, 0x09, 0x11, 0x03, 0x49, 0x00, 0x04, 0xa2, 0x12, 0x09, 0x11, 0x03,
> > +	0x16, 0x08, 0x11, 0x03, 0x49, 0x00, 0x04, 0xa2, 0x12, 0x08, 0x11, 0x03,
> >  	0x40, 0x01, 0x04, 0x00, 0x60, 0x06, 0x05, 0x05, 0x04, 0x04, 0x00, 0x01,
> >  	0x05, 0x01, 0x58, 0x00, 0x40, 0x00, 0x24, 0x00, 0x60, 0x06, 0x05, 0x0a,
> >  	0x04, 0x04, 0x00, 0x01, 0x05, 0x02, 0x58, 0x00, 0x40, 0x02, 0x0c, 0xa0,
> >  	0x02, 0x05, 0x10, 0x07, 0x40, 0x02, 0x0e, 0xa6, 0x02, 0x0a, 0x10, 0x07,
> >  	0x70, 0x02, 0x04, 0x00, 0x60, 0x02, 0x01, 0x00, 0x05, 0x0c, 0x46, 0x52,
> > -	0x84, 0x08, 0x00, 0x00, 0x70, 0x02, 0x24, 0x00, 0x60, 0x02, 0x01, 0x00,
> > -	0x05, 0x0e, 0x46, 0x52, 0x84, 0x08, 0x00, 0x00, 0x72, 0x00, 0x02, 0x80,
> > -	0x50, 0x0d, 0x04, 0x00, 0x05, 0x00, 0x05, 0x1d, 0x05, 0x00, 0x05, 0x00,
> > +	0x04, 0x09, 0x00, 0x00, 0x70, 0x02, 0x24, 0x00, 0x60, 0x02, 0x01, 0x00,
> > +	0x05, 0x0e, 0x46, 0x52, 0x04, 0x09, 0x00, 0x00, 0x72, 0x00, 0x02, 0x80,
> > +	0x50, 0x0d, 0x04, 0x01, 0x05, 0x01, 0x05, 0x1d, 0x05, 0x01, 0x05, 0x01,
> >  	0x22, 0x00, 0x05, 0x01, 0x00, 0xc0, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00,
> >  	0x90, 0x00, 0x00, 0x00, 0x69, 0x00, 0x10, 0x60, 0x02, 0x0c, 0x20, 0x00,
> >  	0x69, 0x00, 0x12, 0x66, 0x02, 0x0e, 0x20, 0x00, 0x40, 0x02, 0x14, 0xa0,
> > -	0x32, 0x10, 0x10, 0x08, 0x40, 0x02, 0x16, 0xa6, 0x32, 0x12, 0x10, 0x08,
> > +	0x12, 0x10, 0x10, 0x09, 0x40, 0x02, 0x16, 0xa6, 0x12, 0x12, 0x10, 0x09,
> >  	0x31, 0xa0, 0x04, 0x00, 0x00, 0x00, 0x14, 0x18, 0x14, 0x14, 0x00, 0xcc,
> >  	0x00, 0x00, 0x16, 0x00, 0x31, 0x91, 0x24, 0x00, 0x00, 0x00, 0x14, 0x1a,
> >  	0x14, 0x16, 0x00, 0xcc, 0x00, 0x00, 0x16, 0x00, 0x40, 0x00, 0x10, 0xa0,
> > -	0x4a, 0x10, 0x10, 0x08, 0x40, 0x00, 0x12, 0xa6, 0x4a, 0x12, 0x10, 0x08,
> > +	0x2a, 0x10, 0x10, 0x09, 0x40, 0x00, 0x12, 0xa6, 0x2a, 0x12, 0x10, 0x09,
> >  	0x41, 0x20, 0x18, 0x20, 0x00, 0x18, 0x00, 0x18, 0x41, 0x21, 0x1a, 0x26,
> >  	0x00, 0x1a, 0x00, 0x1a, 0x31, 0xa2, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
> >  	0x14, 0x10, 0x02, 0xcc, 0x14, 0x18, 0x96, 0x00, 0x31, 0x93, 0x24, 0x00,
> > @@ -41,24 +41,14 @@ static const unsigned char tgllp_kernel_square_bin[] = {
> >  	0x00, 0x00, 0x78, 0x02, 0x61, 0x24, 0x03, 0x80, 0x20, 0x02, 0x01, 0x00,
> >  	0x05, 0x1c, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
> >  	0xa0, 0x4a, 0x01, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x31, 0x01, 0x03, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x70,
> > +	0x31, 0x01, 0x00, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x70,
> >  	0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
> > +	0x20, 0x42, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x4a, 0x12, 0xe3,
> > +	0x61, 0x00, 0x04, 0x80, 0x20, 0x42, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x2b, 0x54, 0x3c, 0x84, 0x61, 0x00, 0x04, 0x80, 0x20, 0x42, 0x01, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
> > +	0x20, 0x42, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
> >  };
> >  
> >  static const unsigned char dg1_kernel_square_bin[] = {
> > -- 
> > 2.43.0
> > 
