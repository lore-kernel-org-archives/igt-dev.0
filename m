Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CADD29FE5
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 10:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B88210E5F0;
	Wed, 14 Jan 2026 10:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZ0Tuwto";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606B110E5F0
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 10:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768387573; x=1799923573;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NqEJSkbPStP/sfAydr9BZhn20NV3hA+2BAwJVP+kFbI=;
 b=mZ0Tuwtoie//U7BKUFN/tFyE5E05rXTdo7hd6Ttg1gaxCv3EGcEFOi3R
 TUQwbaihZIvBzG9VG1N+Nnmfl3tT7FYiOhmHs6MXmjCfwOwEPCNvaxzyV
 GylTO5996J2Q8jS79cOCsjabwWt1voL3dcxEfi9DJPy/E0EVNNHTOT3CJ
 bFAwQob/rzjHU8Vr7HY8GjJcomQL2kyOPNnNu9ithKG5G+bsjI8peILjP
 /HykT6wjKZV3HEjcZZdbMA1l2iQaY17zoYibtg7iDlZbg31Fuw1xbuV7E
 yRKgu+FALr7XezKSxE+tLdh33UdwkRFcA8h8j2TwoCMVdAr7k9tLXX9D/ w==;
X-CSE-ConnectionGUID: JFuLozpET1yXD5be8DK2aQ==
X-CSE-MsgGUID: uUpjlnUeT1CHaPqNO15xHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87098786"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="87098786"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 02:46:13 -0800
X-CSE-ConnectionGUID: MMgOJXB9S3Gfjb/sloXSdg==
X-CSE-MsgGUID: gM1KH0JVRp2QvZ6XBI3Okg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="209491141"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.77])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 02:46:12 -0800
Date: Wed, 14 Jan 2026 11:46:09 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 1/5] lib/intel_compute: Add compute-square for
 xe3p
Message-ID: <bqush6237l7jlol7vt7ukekzv7fgek2bhnofkmw3wcb4qksh7j@r3jpq65pz2j3>
References: <20260105124757.1421059-7-zbigniew.kempczynski@intel.com>
 <20260105124757.1421059-8-zbigniew.kempczynski@intel.com>
 <aWUnQdvdCNZw20Kw@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWUnQdvdCNZw20Kw@fdugast-desk>
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

On Mon, Jan 12, 2026 at 05:54:25PM +0100, Francois Dugast wrote:
> Hi,
> 
> On Mon, Jan 05, 2026 at 01:47:59PM +0100, Zbigniew Kempczyński wrote:
> > Extend support of compute-square calculation in IGT to xe3p platforms
> > like CrescentIsland.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/intel_compute.c                | 234 ++++++++++++++++++++++++++++-
> >  lib/intel_compute_krn_square.h     |  41 +++++
> >  lib/intel_compute_square_kernels.c |   5 +
> >  lib/xehp_media.h                   |   1 +
> >  4 files changed, 280 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index a555f908b1..c3a5cf83bc 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -49,7 +49,11 @@
> >  #define ADDR_INSTRUCTION_STATE_BASE	0x8000000ULL
> >  #define OFFSET_BINDING_TABLE		0x10000
> >  
> > +#define ADDR_STATE_CONTEXT_DATA_BASE	0xA0000000ULL
> 
> Maybe XE3_ADDR_STATE_CONTEXT_DATA_BASE?

Right, will look better. Also migrated it below XE2_ defs.

> 
> > +
> >  #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x9000000ULL
> > +#define XE2_STATE_CONTEXT_DATA_BASE_ADDRESS ((3 << 29) | (0 << 27) | (1 << 24) | (11 << 16) | (1 << 0))
> > +
> >  #define OFFSET_STATE_SIP			0xFFFF0000
> >  
> >  #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> > @@ -66,6 +70,7 @@
> >  #define DP_PIPELINE_FLUSH		(1 << 2)
> >  #define WRITE_IMM_DATA			(1 << 0)
> >  #define WRITE_TIMESTAMP		(3 << 0)
> > +#define XE3P_WRITE_IMM_DATA		(1 << 16)
> >  
> >  /*
> >   * TGP  - ThreadGroup Preemption
> > @@ -109,6 +114,17 @@ struct bo_execenv {
> >  	struct user_execenv *user;
> >  };
> >  
> > +struct inline_data {
> > +	union {
> > +		uint32_t dw[16];
> > +
> > +		struct {
> > +			uint32_t indirect_addr_lo;
> > +			uint32_t indirect_addr_hi;
> > +		} xe3p;
> > +	};
> > +};
> > +
> >  static void bo_randomize(float *ptr, int size)
> >  {
> >  	srand(time(NULL));
> > @@ -1578,7 +1594,6 @@ static void xe2lpg_compute_exec_compute(int fd,
> >  	addr_bo_buffer_batch[b++] = 0xE0004000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  
> > -#define XE2_STATE_CONTEXT_DATA_BASE_ADDRESS ((3 << 29) | (0 << 27) | (1 << 24) | (11 << 16) | (1 << 0))
> >  	addr_bo_buffer_batch[b++] = XE2_STATE_CONTEXT_DATA_BASE_ADDRESS;
> >  	// Split into low and high 32 bits
> >  	addr_bo_buffer_batch[b++] = addr_state_contect_data_base & 0xFFFFFFFF; // Mask the low 32 bits ;
> > @@ -1902,6 +1917,218 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
> >  	bo_execenv_destroy(&execenv);
> >  }
> >  
> > +static void xe3p_compute_exec_compute(int fd,
> > +				      const struct inline_data *idata,
> > +				      uint32_t *addr_bo_buffer_batch,
> > +				      uint64_t kernel_start_pointer_addr,
> > +				      uint64_t context_data_base_addr,
> > +				      bool threadgroup_preemption)
> > +
> > +{
> > +	int b = 0;
> > +	uint64_t kernel_addr = kernel_start_pointer_addr;
> 
> What is the point of the new variable kernel_addr instead of using
> kernel_start_pointer_addr directly?

Likely leftover from development time. I'll use
kernel_start_pointer_addr directly.

> 
> > +	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
> > +
> > +	igt_assert(idata);
> > +	igt_debug("kernel addr         : %"PRIx64"\n", kernel_addr);
> > +
> > +	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS  | 0x14; /* dw0 */
> > +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw1 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw2 */
> > +	addr_bo_buffer_batch[b++] = 0x40048000; /* dw3 */
> > +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw4 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw5 */
> > +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw6 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw7 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw8 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw9 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw10 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw11 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw12 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw13 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw14 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw15 */
> > +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw16 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw17 */
> > +	addr_bo_buffer_batch[b++] = 0xFFFFFFFE; /* dw18 */
> > +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw19 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw20 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw21 */
> > +
> > +	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE | 1;
> > +	addr_bo_buffer_batch[b++] = 0x14001400;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +
> > +	addr_bo_buffer_batch[b++] = XE2_STATE_CONTEXT_DATA_BASE_ADDRESS;
> > +	addr_bo_buffer_batch[b++] = context_data_base_addr;
> > +	addr_bo_buffer_batch[b++] = context_data_base_addr >> 32;
> > +
> > +	addr_bo_buffer_batch[b++] = XE3P_COMPUTE_WALKER2 | 0x3e; /* dw0 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw1 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw2 */
> > +	addr_bo_buffer_batch[b++] = 0x008004A0; /* dw3 */
> > +	addr_bo_buffer_batch[b++] = 0xBE040000; /* dw4 */
> > +	addr_bo_buffer_batch[b++] = 0xFFFFFFFF; /* dw5 */
> > +	addr_bo_buffer_batch[b++] = 0x000001FF; /* dw6 */
> > +
> > +	if (threadgroup_preemption)
> > +		addr_bo_buffer_batch[b++] = XE2_THREADGROUP_PREEMPT_XDIM; // Thread Group ID X Dimension
> > +	else
> > +		addr_bo_buffer_batch[b++] = 0x00000004;
> > +
> > +	addr_bo_buffer_batch[b++] = 0x00000001; /* dw8 */
> > +	addr_bo_buffer_batch[b++] = 0x00000001; /* dw9 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw10 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw11 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw12 */
> > +	addr_bo_buffer_batch[b++] = 0x00010000; /* dw13 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw14 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw15 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw16 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw17 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw18 */
> > +	addr_bo_buffer_batch[b++] = kernel_addr; /* dw19 */
> > +	addr_bo_buffer_batch[b++] = kernel_addr >> 32; /* dw20 */
> > +	if (threadgroup_preemption)
> > +		addr_bo_buffer_batch[b++] = 0x00000002;
> > +	else
> > +		addr_bo_buffer_batch[b++] = 0x00100002; // Enable Mid Thread Preemption BitField:20
> > +
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw22 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw23 */
> > +	addr_bo_buffer_batch[b++] = 0x0C000010; /* dw24 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw25 */
> > +	addr_bo_buffer_batch[b++] = 0x00000400; /* dw26 */
> > +
> > +	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | uc_mocs << 4 |
> > +				    DP_PIPELINE_FLUSH | XE3P_WRITE_IMM_DATA; /* dw27 */
> > +	addr_bo_buffer_batch[b++] = ADDR_BATCH;		/* dw28 (postsync addr) */
> > +	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;	/* dw29 */
> > +	addr_bo_buffer_batch[b++] = (uint32_t) POST_SYNC_VALUE;		/* dw30 */
> > +	addr_bo_buffer_batch[b++] = (uint32_t) (POST_SYNC_VALUE >> 32);	/* dw31 */
> > +
> > +	/* inline data 32 - 47 */
> > +	memcpy(&addr_bo_buffer_batch[b], idata, sizeof(*idata));
> > +	b += 16;
> > +
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw48 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw49 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw50 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw51 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw52 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw53 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw54 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw55 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw56 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw57 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw58 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw59 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw60 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw61 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw62 */
> > +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw63 */
> > +
> > +	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
> > +}
> > +
> > +static void xe3p_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> > +				      uint64_t addr_input,
> > +				      uint64_t addr_output,
> > +				      uint32_t loop_count)
> > +{
> > +	int b = 0;
> > +
> > +	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
> > +	addr_bo_buffer_batch[b++] = addr_input >> 32;
> > +	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
> > +	addr_bo_buffer_batch[b++] = addr_output >> 32;
> > +	addr_bo_buffer_batch[b++] = loop_count;
> > +	addr_bo_buffer_batch[b++] = 0x00000200;
> > +	addr_bo_buffer_batch[b++] = 0x00000001;
> > +	addr_bo_buffer_batch[b++] = 0x00000001;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +}
> > +
> > +/**
> > + * xe3p_compute_exec - run a pipeline compatible with XE3P
> > + *
> > + * @fd: file descriptor of the opened DRM device
> > + * @kernel: GPU Kernel binary to be executed
> > + * @size: size of @kernel
> > + * @eci: engine instance class
> > + * @user: user defined exec environment
> > + * @alloc_prefs: memory allocation preference
> > + */
> > +static void xe3p_compute_exec(int fd, const unsigned char *kernel,
> > +			      unsigned int size,
> > +			      struct drm_xe_engine_class_instance *eci,
> > +			      struct user_execenv *user,
> > +			      enum execenv_alloc_prefs alloc_prefs)
> > +{
> > +	struct bo_dict_entry bo_dict[] = {
> > +		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> > +		  .name = "instr state base"},
> > +		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
> > +		  .size =  0x1000,
> > +		  .name = "indirect object base"},
> > +		{ .addr = ADDR_INPUT,
> > +		  .name = "addr input"},
> > +		{ .addr = ADDR_OUTPUT,
> > +		  .name = "addr output" },
> > +		{ .addr = ADDR_BATCH,
> > +		  .size = SIZE_BATCH,
> > +		  .name = "batch" },
> > +		{ .addr = ADDR_STATE_CONTEXT_DATA_BASE,
> > +		  .size = 0x10000,
> > +		  .name = "state context data base"},
> > +	};
> > +	struct inline_data idata = {};
> > +	struct bo_execenv execenv;
> > +	float *input_data, *output_data;
> > +	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
> > +	int entries = ARRAY_SIZE(bo_dict);
> > +
> > +	bo_execenv_create(fd, &execenv, eci, user);
> > +
> > +	/* Sets Kernel size */
> > +	bo_dict[0].size = ALIGN(size, 0x1000);
> > +	bo_dict[2].size = size_input(execenv.array_size);
> > +	bo_dict[3].size = size_output(execenv.array_size);
> > +
> > +	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
> > +
> > +	memcpy(bo_dict[0].data, kernel, size);
> > +	memset(bo_dict[1].data, 0, 4096);
> > +
> > +	xe3p_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT,
> > +				  0x400);
> > +	idata.xe3p.indirect_addr_lo = indirect_addr;
> > +	idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
> > +
> > +	input_data = get_input_data(&execenv, user, bo_dict[2].data);
> > +	output_data = get_output_data(&execenv, user, bo_dict[3].data);
> > +
> > +	xe3p_compute_exec_compute(fd, &idata,
> > +				  bo_dict[4].data,
> > +				  ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> > +				  ADDR_STATE_CONTEXT_DATA_BASE, false);
> > +
> > +	bo_execenv_exec(&execenv, ADDR_BATCH);
> > +
> > +	if (!user || (user && !user->skip_results_check))
> > +		bo_check_square(input_data, output_data, execenv.array_size);
> > +
> > +	bo_execenv_unbind(&execenv, bo_dict, entries);
> > +	bo_execenv_destroy(&execenv);
> > +}
> > +
> >  /*
> >   * Compatibility flags.
> >   *
> > @@ -1968,6 +2195,11 @@ static const struct {
> >  		.compute_exec = xe2lpg_compute_exec,
> >  		.compat = COMPAT_DRIVER_XE,
> >  	},
> > +	{
> > +		.ip_ver = IP_VER(35, 11),
> > +		.compute_exec = xe3p_compute_exec,
> > +		.compat = COMPAT_DRIVER_XE,
> > +	},
> >  };
> >  
> >  static const struct intel_compute_kernels
> > diff --git a/lib/intel_compute_krn_square.h b/lib/intel_compute_krn_square.h
> > index 2b616f136b..0490a692ef 100644
> > --- a/lib/intel_compute_krn_square.h
> > +++ b/lib/intel_compute_krn_square.h
> > @@ -288,4 +288,45 @@ static const unsigned char xe3lpg_kernel_square_bin[] = {
> >  	0x04, 0x00, 0x00, 0x00, 0x0c, 0x14, 0x20, 0x30, 0x00, 0x00, 0x00, 0x00
> >  };
> >  
> > +static const unsigned char xe3p_kernel_square_bin[] = {
> > +	0x61, 0x00, 0x00, 0x80, 0x30, 0x43, 0x61, 0x60, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x33, 0x22, 0x01, 0x80, 0x06, 0x18, 0x00, 0x05,
> > +	0x0c, 0x04, 0x28, 0xf0, 0x00, 0x00, 0x00, 0x96, 0x61, 0x80, 0x10, 0x80,
> > +	0x20, 0x02, 0x05, 0x02, 0x04, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x66, 0x09, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80, 0x00, 0x80, 0x00, 0x02,
> > +	0xc0, 0x04, 0x00, 0x40, 0x01, 0x09, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x82, 0x00, 0x00,
> > +	0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x41, 0x21, 0x03, 0x80, 0x60, 0x06, 0x05, 0x03, 0x54, 0x05, 0x00, 0x06,
> > +	0x14, 0x02, 0x10, 0x00, 0x61, 0x00, 0x14, 0x00, 0x10, 0x01, 0x06, 0x0d,
> > +	0x04, 0x01, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0x19, 0x14, 0x00,
> > +	0x60, 0x06, 0x04, 0x06, 0x04, 0x03, 0x06, 0x01, 0x04, 0x0d, 0x84, 0x04,
> > +	0x70, 0x19, 0x14, 0x00, 0x20, 0x02, 0x01, 0x00, 0x04, 0x06, 0x10, 0x52,
> > +	0x44, 0x05, 0x10, 0x00, 0x2e, 0x00, 0x14, 0x14, 0x00, 0xc0, 0x00, 0x00,
> > +	0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x80,
> > +	0x70, 0x07, 0x41, 0x60, 0x04, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x61, 0x00, 0x00, 0x80, 0x70, 0x07, 0x61, 0x60, 0x24, 0x05, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x33, 0x43, 0x17, 0x00, 0x06, 0x11, 0x00, 0x08,
> > +	0x14, 0x06, 0x00, 0xf0, 0x00, 0x00, 0x00, 0x50, 0x41, 0x83, 0x14, 0x00,
> > +	0xa0, 0x02, 0x05, 0x0a, 0x04, 0x08, 0x10, 0x0a, 0x04, 0x08, 0x00, 0x00,
> > +	0x33, 0x24, 0x15, 0x00, 0x04, 0x19, 0x00, 0x00, 0x14, 0x06, 0x00, 0xf0,
> > +	0x14, 0x0a, 0x04, 0x50, 0x2f, 0x00, 0x14, 0x00, 0x00, 0x40, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x80,
> > +	0x01, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > +	0x00, 0x00, 0x00, 0x00
> > +};
> > +
> >  #endif /* __INTEL_COMPUTE_KRN_SQUARE_H__ */
> > diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
> > index 3c888ebd85..4d69f270e9 100644
> > --- a/lib/intel_compute_square_kernels.c
> > +++ b/lib/intel_compute_square_kernels.c
> > @@ -86,5 +86,10 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
> >  		.loop_kernel = xe3lpg_kernel_loop_bin,
> >  		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
> >  	},
> > +	{
> > +		.ip_ver = IP_VER(35, 11),
> > +		.size = sizeof(xe3p_kernel_square_bin),
> > +		.kernel = xe3p_kernel_square_bin,
> > +	},
> >  	{}
> >  };
> > diff --git a/lib/xehp_media.h b/lib/xehp_media.h
> > index fb65b8f207..20227bd3a6 100644
> > --- a/lib/xehp_media.h
> > +++ b/lib/xehp_media.h
> > @@ -18,6 +18,7 @@
> >  #define XEHP_STATE_COMPUTE_MODE		GFXPIPE(0, 1, 5)
> >  #define XEHP_CFE_STATE			GFXPIPE_XEHP(2, 2, 0)
> >  #define XEHP_COMPUTE_WALKER		GFXPIPE_XEHP(2, 2, 2)
> > +#define XE3P_COMPUTE_WALKER2		GFXPIPE_XEHP(2, 2, 8)
> 
> Why the trailing 2? XE3P_COMPUTE_WALKER does not seem to exist.

Bspec differentiates CW and CW2 so '2' should imo stay here.

Thanks for the review. I'll send v3 with above changes.
--
Zbigniew

> 
> Francois
> 
> >  
> >  #define BITRANGE(start, end) (end - start + 1)
> >  
> > -- 
> > 2.43.0
> > 
