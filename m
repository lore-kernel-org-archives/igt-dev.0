Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06685C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 15:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF72F10E1DE;
	Thu, 13 Mar 2025 15:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="joulxHV1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5BC10E1DE
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741880006; x=1773416006;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=dENCgECngElMtvtPl8mBktRBSmMuUBmvcBkAOuvMJVA=;
 b=joulxHV1jJxBtxQX5z5dNSELkynKrfUqsumGHO7QkKRRQh8+ZgMnXgg8
 AMViQV+cqav1C0k7+tY0eqnFhLUpJ7eKqHdJjWSm/5mBl4cpkFGSKr2Ve
 bTn2Gpf5q4H2SrYe93e/j3ybhvilYKQ2Mn9mXQBOsWIHfzSkmtXfWwYap
 o+JXkYOaVI0qrAZplWkFzM1umLfjlx979ycygYvr26BIwB51NcVPAOUsQ
 M+STHW/vZjMxXtG7jInmcwZvD53+W36pAYipfWiJEb4W8r7NBnP5s5iqE
 EuUCZ9omcO7VpUyFFwYktJCmH0eyZ7vcP54x37KqjJfTKZ4GqC5mQLmD/ A==;
X-CSE-ConnectionGUID: f/eVaXPpQcObZ70rLMvHIw==
X-CSE-MsgGUID: QSfHEMJGSyGR5N2qR5m8Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="45776233"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="45776233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 08:33:22 -0700
X-CSE-ConnectionGUID: CRgfBeEAQ8O6LqeqtOJJ4A==
X-CSE-MsgGUID: ZdYVL7AQRRaLb2G3gypaqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="120718266"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 08:33:20 -0700
Message-ID: <8f9da08ec9c86b63a1c0919295d417c718d90317.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 11/11] lib/intel_compute: Make array size a
 dynamic parameter
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Thu, 13 Mar 2025 16:33:17 +0100
In-Reply-To: <20250311152321.16497-12-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
 <20250311152321.16497-12-francois.dugast@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Tue, 2025-03-11 at 16:21 +0100, Francois Dugast wrote:
> Give the users of run_intel_compute_kernel() the possibility to
> change
> the default size of the input and output arrays by adding a custom
> size in struct user_execenv::array_size.
>=20
> If no value is provided, the existing default value of SIZE_DATA will
> be used.
>=20
> Example:
>=20
> =C2=A0=C2=A0=C2=A0 struct user_execenv env =3D {};
> =C2=A0=C2=A0=C2=A0 env.array_size =3D 1024 * 1024;
> =C2=A0=C2=A0=C2=A0 run_intel_compute_kernel(fd, &env);
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
> =C2=A0lib/intel_compute.c | 144 +++++++++++++++++++++++++++--------------=
-
> --
> =C2=A0lib/intel_compute.h |=C2=A0=C2=A0 2 +
> =C2=A02 files changed, 90 insertions(+), 56 deletions(-)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 068d64b24..b2cba0fe0 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -26,8 +26,6 @@
> =C2=A0
> =C2=A0#define SIZE_DATA			64
> =C2=A0#define SIZE_BATCH			0x10000
> -#define SIZE_BUFFER_INPUT		MAX(sizeof(float) *
> SIZE_DATA, 0x10000)
> -#define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) *
> SIZE_DATA, 0x10000)
> =C2=A0#define SIZE_SURFACE_STATE		0x10000
> =C2=A0#define SIZE_DYNAMIC_STATE		0x100000
> =C2=A0#define SIZE_INDIRECT_OBJECT		0x10000
> @@ -56,9 +54,6 @@
> =C2=A0#define
> USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> =C2=A0
> =C2=A0#define THREADS_PER_GROUP		32
> -#define THREAD_GROUP_X			MAX(1, SIZE_DATA /
> (ENQUEUED_LOCAL_SIZE_X * \
> -							=C2=A0=C2=A0=C2=A0
> ENQUEUED_LOCAL_SIZE_Y * \
> -							=C2=A0=C2=A0=C2=A0
> ENQUEUED_LOCAL_SIZE_Z))
> =C2=A0#define THREAD_GROUP_Y			1
> =C2=A0#define THREAD_GROUP_Z			1
> =C2=A0#define ENQUEUED_LOCAL_SIZE_X		1024
> @@ -91,6 +86,7 @@ struct bo_execenv {
> =C2=A0	/* Xe part */
> =C2=A0	uint32_t vm;
> =C2=A0	uint32_t exec_queue;
> +	uint32_t array_size;
> =C2=A0
> =C2=A0	/* i915 part */
> =C2=A0	struct drm_i915_gem_execbuffer2 execbuf;
> @@ -118,6 +114,11 @@ static void bo_execenv_create(int fd, struct
> bo_execenv *execenv,
> =C2=A0		else
> =C2=A0			execenv->vm =3D xe_vm_create(fd,
> DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> =C2=A0
> +		if (user && user->array_size)
> +			execenv->array_size =3D user->array_size;
> +		else
> +			execenv->array_size =3D SIZE_DATA;
> +
> =C2=A0		if (eci) {
> =C2=A0			execenv->exec_queue =3D
> xe_exec_queue_create(fd, execenv->vm,
> =C2=A0								=C2=A0=C2=A0
> eci, 0);
> @@ -306,6 +307,23 @@ static void bo_execenv_exec(struct bo_execenv
> *execenv, uint64_t start_addr)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static uint32_t size_thread_group_x(uint32_t work_size)
> +{
> +	return MAX(1, work_size / (ENQUEUED_LOCAL_SIZE_X *
> +				=C2=A0=C2=A0 ENQUEUED_LOCAL_SIZE_Y *
> +				=C2=A0=C2=A0 ENQUEUED_LOCAL_SIZE_Z));
> +}
> +
> +static size_t size_input(uint32_t work_size)
> +{
> +	return MAX(sizeof(float) * work_size, 0x10000);
> +}
> +
> +static size_t size_output(uint32_t work_size)
> +{
> +	return MAX(sizeof(float) * work_size, 0x10000);
> +}
> +
> =C2=A0/*
> =C2=A0 * TGL compatible batch
> =C2=A0 */
> @@ -715,10 +733,8 @@ static void compute_exec(int fd, const unsigned
> char *kernel,
> =C2=A0		=C2=A0 .size =3D SIZE_INDIRECT_OBJECT,
> =C2=A0		=C2=A0 .name =3D "indirect data start" },
> =C2=A0		{ .addr =3D ADDR_INPUT,
> -		=C2=A0 .size =3D SIZE_BUFFER_INPUT,
> =C2=A0		=C2=A0 .name =3D "input" },
> =C2=A0		{ .addr =3D ADDR_OUTPUT,
> -		=C2=A0 .size =3D SIZE_BUFFER_OUTPUT,
> =C2=A0		=C2=A0 .name =3D "output" },
> =C2=A0		{ .addr =3D ADDR_BATCH,
> =C2=A0		=C2=A0 .size =3D SIZE_BATCH,
> @@ -730,8 +746,10 @@ static void compute_exec(int fd, const unsigned
> char *kernel,
> =C2=A0
> =C2=A0	bo_execenv_create(fd, &execenv, eci, user);
> =C2=A0
> -	/* Sets Kernel size */
> +	/* Set dynamic sizes */
> =C2=A0	bo_dict[0].size =3D ALIGN(size, 0x1000);
> +	bo_dict[4].size =3D size_input(execenv.array_size);
> +	bo_dict[5].size =3D size_output(execenv.array_size);
> =C2=A0
> =C2=A0	bo_execenv_bind(&execenv, bo_dict, BO_DICT_ENTRIES);
> =C2=A0
> @@ -739,13 +757,13 @@ static void compute_exec(int fd, const unsigned
> char *kernel,
> =C2=A0	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> =C2=A0	create_surface_state(bo_dict[2].data, ADDR_INPUT,
> ADDR_OUTPUT);
> =C2=A0	create_indirect_data(bo_dict[3].data, ADDR_INPUT,
> ADDR_OUTPUT,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 IS_DG1(devid) ? 0x200 : 0x40,
> SIZE_DATA);
> +			=C2=A0=C2=A0=C2=A0=C2=A0 IS_DG1(devid) ? 0x200 : 0x40,
> execenv.array_size);
> =C2=A0
> =C2=A0	input_data =3D (float *) bo_dict[4].data;
> =C2=A0	output_data =3D (float *) bo_dict[5].data;
> =C2=A0	srand(time(NULL));
> =C2=A0
> -	for (int i =3D 0; i < SIZE_DATA; i++)
> +	for (int i =3D 0; i < execenv.array_size; i++)
> =C2=A0		input_data[i] =3D rand() / (float)RAND_MAX;
> =C2=A0
> =C2=A0	if (IS_DG1(devid))
> @@ -763,7 +781,7 @@ static void compute_exec(int fd, const unsigned
> char *kernel,
> =C2=A0
> =C2=A0	bo_execenv_exec(&execenv, ADDR_BATCH);
> =C2=A0
> -	for (int i =3D 0; i < SIZE_DATA; i++) {
> +	for (int i =3D 0; i < execenv.array_size; i++) {
> =C2=A0		float input =3D input_data[i];
> =C2=A0		float output =3D output_data[i];
> =C2=A0		float expected_output =3D input * input;
> @@ -999,9 +1017,9 @@ static void xehp_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> =C2=A0		=C2=A0 .size =3D SIZE_INDIRECT_OBJECT,
> =C2=A0		=C2=A0 .name =3D "indirect object base"},
> -		{ .addr =3D ADDR_INPUT, .size =3D SIZE_BUFFER_INPUT,
> +		{ .addr =3D ADDR_INPUT,
> =C2=A0		=C2=A0 .name =3D "addr input"},
> -		{ .addr =3D ADDR_OUTPUT, .size =3D SIZE_BUFFER_OUTPUT,
> +		{ .addr =3D ADDR_OUTPUT,
> =C2=A0		=C2=A0 .name =3D "addr output" },
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE,
> =C2=A0		=C2=A0 .size =3D SIZE_GENERAL_STATE,
> @@ -1017,22 +1035,24 @@ static void xehp_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0
> =C2=A0	bo_execenv_create(fd, &execenv, eci, user);
> =C2=A0
> -	/* Sets Kernel size */
> +	/* Set dynamic sizes */
> =C2=A0	bo_dict[0].size =3D ALIGN(size, xe_get_default_alignment(fd));
> +	bo_dict[4].size =3D size_input(execenv.array_size);
> +	bo_dict[5].size =3D size_output(execenv.array_size);
> =C2=A0
> =C2=A0	bo_execenv_bind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
> =C2=A0
> =C2=A0	memcpy(bo_dict[0].data, kernel, size);
> =C2=A0	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> =C2=A0	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT,
> ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT,
> ADDR_OUTPUT, SIZE_DATA);
> +	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT,
> ADDR_OUTPUT, execenv.array_size);
> =C2=A0	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT,
> ADDR_OUTPUT);
> =C2=A0
> =C2=A0	input_data =3D (float *) bo_dict[4].data;
> =C2=A0	output_data =3D (float *) bo_dict[5].data;
> =C2=A0	srand(time(NULL));
> =C2=A0
> -	for (int i =3D 0; i < SIZE_DATA; i++)
> +	for (int i =3D 0; i < execenv.array_size; i++)
> =C2=A0		input_data[i] =3D rand() / (float)RAND_MAX;
> =C2=A0
> =C2=A0	xehp_compute_exec_compute(bo_dict[8].data,
> @@ -1045,7 +1065,7 @@ static void xehp_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0
> =C2=A0	bo_execenv_exec(&execenv, ADDR_BATCH);
> =C2=A0
> -	for (int i =3D 0; i < SIZE_DATA; i++) {
> +	for (int i =3D 0; i < execenv.array_size; i++) {
> =C2=A0		float input =3D input_data[i];
> =C2=A0		float output =3D output_data[i];
> =C2=A0		float expected_output =3D input * input;
> @@ -1217,9 +1237,9 @@ static void xehpc_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> =C2=A0		=C2=A0 .size =3D SIZE_INDIRECT_OBJECT,
> =C2=A0		=C2=A0 .name =3D "indirect object base"},
> -		{ .addr =3D ADDR_INPUT, .size =3D SIZE_BUFFER_INPUT,
> +		{ .addr =3D ADDR_INPUT,
> =C2=A0		=C2=A0 .name =3D "addr input"},
> -		{ .addr =3D ADDR_OUTPUT, .size =3D SIZE_BUFFER_OUTPUT,
> +		{ .addr =3D ADDR_OUTPUT,
> =C2=A0		=C2=A0 .name =3D "addr output" },
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE,
> =C2=A0		=C2=A0 .size =3D SIZE_GENERAL_STATE,
> @@ -1232,19 +1252,21 @@ static void xehpc_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0
> =C2=A0	bo_execenv_create(fd, &execenv, eci, user);
> =C2=A0
> -	/* Sets Kernel size */
> +	/* Set dynamic sizes */
> =C2=A0	bo_dict[0].size =3D ALIGN(size, xe_get_default_alignment(fd));
> +	bo_dict[2].size =3D size_input(execenv.array_size);
> +	bo_dict[3].size =3D size_output(execenv.array_size);
> =C2=A0
> =C2=A0	bo_execenv_bind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
> =C2=A0
> =C2=A0	memcpy(bo_dict[0].data, kernel, size);
> -	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT,
> ADDR_OUTPUT, SIZE_DATA);
> +	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT,
> ADDR_OUTPUT, execenv.array_size);
> =C2=A0
> =C2=A0	input_data =3D (float *) bo_dict[2].data;
> =C2=A0	output_data =3D (float *) bo_dict[3].data;
> =C2=A0	srand(time(NULL));
> =C2=A0
> -	for (int i =3D 0; i < SIZE_DATA; i++)
> +	for (int i =3D 0; i < execenv.array_size; i++)
> =C2=A0		input_data[i] =3D rand() / (float)RAND_MAX;
> =C2=A0
> =C2=A0	xehpc_compute_exec_compute(bo_dict[5].data,
> @@ -1257,7 +1279,7 @@ static void xehpc_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0
> =C2=A0	bo_execenv_exec(&execenv, ADDR_BATCH);
> =C2=A0
> -	for (int i =3D 0; i < SIZE_DATA; i++) {
> +	for (int i =3D 0; i < execenv.array_size; i++) {
> =C2=A0		float input =3D input_data[i];
> =C2=A0		float output =3D output_data[i];
> =C2=A0		float expected_output =3D input * input;
> @@ -1274,12 +1296,13 @@ static void xehpc_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0}
> =C2=A0
> =C2=A0static void xelpg_compute_exec_compute(uint32_t
> *addr_bo_buffer_batch,
> -					uint64_t
> addr_general_state_base,
> -					uint64_t
> addr_surface_state_base,
> -					uint64_t
> addr_dynamic_state_base,
> -					uint64_t
> addr_instruction_state_base,
> -					uint64_t
> offset_indirect_data_start,
> -					uint64_t
> kernel_start_pointer)
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t
> addr_general_state_base,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t
> addr_surface_state_base,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t
> addr_dynamic_state_base,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t
> addr_instruction_state_base,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t
> offset_indirect_data_start,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t
> kernel_start_pointer,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t work_size)

Pls double-check indentation / tab usage here.=20


> =C2=A0{
> =C2=A0	int b =3D 0;
> =C2=A0
> @@ -1342,7 +1365,7 @@ static void xelpg_compute_exec_compute(uint32_t
> *addr_bo_buffer_batch,
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0xbe040000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0xffffffff;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x000003ff;
> -	addr_bo_buffer_batch[b++] =3D THREAD_GROUP_X;
> +	addr_bo_buffer_batch[b++] =3D size_thread_group_x(work_size);
> =C2=A0
> =C2=A0	addr_bo_buffer_batch[b++] =3D THREAD_GROUP_Y;
> =C2=A0	addr_bo_buffer_batch[b++] =3D THREAD_GROUP_Z;
> @@ -1398,7 +1421,8 @@ static void
> xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> =C2=A0					uint64_t
> offset_indirect_data_start,
> =C2=A0					uint64_t
> kernel_start_pointer,
> =C2=A0					uint64_t sip_start_pointer,
> -					bool=09
> threadgroup_preemption)
> +					bool=09
> threadgroup_preemption,
> +					uint32_t work_size)
> =C2=A0{
> =C2=A0	int b =3D 0;
> =C2=A0
> @@ -1480,7 +1504,7 @@ static void
> xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> =C2=A0		 */
> =C2=A0		addr_bo_buffer_batch[b++] =3D 0x00200000; // Thread
> Group ID X Dimension
> =C2=A0	else
> -		addr_bo_buffer_batch[b++] =3D THREAD_GROUP_X;
> +		addr_bo_buffer_batch[b++] =3D
> size_thread_group_x(work_size);
> =C2=A0
> =C2=A0	addr_bo_buffer_batch[b++] =3D THREAD_GROUP_Y;
> =C2=A0	addr_bo_buffer_batch[b++] =3D THREAD_GROUP_Z;
> @@ -1576,9 +1600,9 @@ static void xelpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> =C2=A0		=C2=A0 .size =3D SIZE_INDIRECT_OBJECT,
> =C2=A0		=C2=A0 .name =3D "indirect object base"},
> -		{ .addr =3D ADDR_INPUT, .size =3D SIZE_BUFFER_INPUT,
> +		{ .addr =3D ADDR_INPUT,
> =C2=A0		=C2=A0 .name =3D "addr input"},
> -		{ .addr =3D ADDR_OUTPUT, .size =3D SIZE_BUFFER_OUTPUT,
> +		{ .addr =3D ADDR_OUTPUT,
> =C2=A0		=C2=A0 .name =3D "addr output" },
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE,
> =C2=A0		=C2=A0 .size =3D SIZE_GENERAL_STATE,
> @@ -1596,8 +1620,10 @@ static void xelpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0
> =C2=A0	bo_execenv_create(fd, &execenv, eci, user);
> =C2=A0
> -	/* Sets Kernel size */
> +	/* Set dynamic sizes */
> =C2=A0	bo_dict[0].size =3D ALIGN(size, 0x1000);
> +	bo_dict[4].size =3D size_input(execenv.array_size);
> +	bo_dict[5].size =3D size_output(execenv.array_size);
> =C2=A0
> =C2=A0	bo_execenv_bind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
> =C2=A0
> @@ -1605,14 +1631,14 @@ static void xelpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0
> =C2=A0	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> =C2=A0	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT,
> ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT,
> ADDR_OUTPUT, SIZE_DATA);
> +	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT,
> ADDR_OUTPUT, execenv.array_size);
> =C2=A0	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT,
> ADDR_OUTPUT);
> =C2=A0
> =C2=A0	input_data =3D (float *) bo_dict[4].data;
> =C2=A0	output_data =3D (float *) bo_dict[5].data;
> =C2=A0	srand(time(NULL));
> =C2=A0
> -	for (int i =3D 0; i < SIZE_DATA; i++)
> +	for (int i =3D 0; i < execenv.array_size; i++)
> =C2=A0		input_data[i] =3D rand() / (float)RAND_MAX;
> =C2=A0
> =C2=A0	xelpg_compute_exec_compute(bo_dict[8].data,
> @@ -1621,11 +1647,12 @@ static void xelpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0				=C2=A0=C2=A0 ADDR_DYNAMIC_STATE_BASE,
> =C2=A0				=C2=A0=C2=A0 ADDR_INSTRUCTION_STATE_BASE,
> =C2=A0				=C2=A0=C2=A0 OFFSET_INDIRECT_DATA_START,
> -				=C2=A0=C2=A0 OFFSET_KERNEL);
> +				=C2=A0=C2=A0 OFFSET_KERNEL,
> +				=C2=A0=C2=A0 execenv.array_size);
> =C2=A0
> =C2=A0	bo_execenv_exec(&execenv, ADDR_BATCH);
> =C2=A0
> -	for (int i =3D 0; i < SIZE_DATA; i++) {
> +	for (int i =3D 0; i < execenv.array_size; i++) {
> =C2=A0		float input =3D input_data[i];
> =C2=A0		float output =3D output_data[i];
> =C2=A0		float expected_output =3D input * input;
> @@ -1667,9 +1694,9 @@ static void xe2lpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> =C2=A0		=C2=A0 .size =3D SIZE_INDIRECT_OBJECT,
> =C2=A0		=C2=A0 .name =3D "indirect object base"},
> -		{ .addr =3D ADDR_INPUT, .size =3D SIZE_BUFFER_INPUT,
> +		{ .addr =3D ADDR_INPUT,
> =C2=A0		=C2=A0 .name =3D "addr input"},
> -		{ .addr =3D ADDR_OUTPUT, .size =3D SIZE_BUFFER_OUTPUT,
> +		{ .addr =3D ADDR_OUTPUT,
> =C2=A0		=C2=A0 .name =3D "addr output" },
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE,
> =C2=A0		=C2=A0 .size =3D SIZE_GENERAL_STATE,
> @@ -1690,36 +1717,39 @@ static void xe2lpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0
> =C2=A0	bo_execenv_create(fd, &execenv, eci, user);
> =C2=A0
> -	/* Sets Kernel size */
> +	/* Set dynamic sizes */
> =C2=A0	bo_dict[0].size =3D ALIGN(size, 0x1000);
> +	bo_dict[4].size =3D size_input(execenv.array_size);
> +	bo_dict[5].size =3D size_output(execenv.array_size);
> =C2=A0
> =C2=A0	bo_execenv_bind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
> =C2=A0
> =C2=A0	memcpy(bo_dict[0].data, kernel, size);
> =C2=A0	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> =C2=A0	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT,
> ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT,
> ADDR_OUTPUT, SIZE_DATA);
> +	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT,
> ADDR_OUTPUT, execenv.array_size);
> =C2=A0	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT,
> ADDR_OUTPUT);
> =C2=A0
> =C2=A0	input_data =3D (float *) bo_dict[4].data;
> =C2=A0	output_data =3D (float *) bo_dict[5].data;
> =C2=A0	srand(time(NULL));
> =C2=A0
> -	for (int i =3D 0; i < SIZE_DATA; i++)
> +	for (int i =3D 0; i < execenv.array_size; i++)
> =C2=A0		input_data[i] =3D rand() / (float)RAND_MAX;
> =C2=A0
> =C2=A0	xe2lpg_compute_exec_compute(bo_dict[8].data,
> -				=C2=A0 ADDR_GENERAL_STATE_BASE,
> -				=C2=A0 ADDR_SURFACE_STATE_BASE,
> -				=C2=A0 ADDR_DYNAMIC_STATE_BASE,
> -				=C2=A0 ADDR_INSTRUCTION_STATE_BASE,
> -				=C2=A0 XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> -				=C2=A0 OFFSET_INDIRECT_DATA_START,
> -				=C2=A0 OFFSET_KERNEL, 0, false);
> +				=C2=A0=C2=A0=C2=A0 ADDR_GENERAL_STATE_BASE,
> +				=C2=A0=C2=A0=C2=A0 ADDR_SURFACE_STATE_BASE,
> +				=C2=A0=C2=A0=C2=A0 ADDR_DYNAMIC_STATE_BASE,
> +				=C2=A0=C2=A0=C2=A0 ADDR_INSTRUCTION_STATE_BASE,
> +				=C2=A0=C2=A0=C2=A0
> XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> +				=C2=A0=C2=A0=C2=A0 OFFSET_INDIRECT_DATA_START,
> +				=C2=A0=C2=A0=C2=A0 OFFSET_KERNEL, 0, false,
> +				=C2=A0=C2=A0=C2=A0 execenv.array_size);
> =C2=A0

And here..



> =C2=A0	bo_execenv_exec(&execenv, ADDR_BATCH);
> =C2=A0
> -	for (int i =3D 0; i < SIZE_DATA; i++) {
> +	for (int i =3D 0; i < execenv.array_size; i++) {
> =C2=A0		float input =3D input_data[i];
> =C2=A0		float output =3D output_data[i];
> =C2=A0		float expected_output =3D input * input;
> @@ -1919,9 +1949,9 @@ static void xe2lpg_compute_preempt_exec(int fd,
> const unsigned char *long_kernel
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> =C2=A0		=C2=A0 .size =3D SIZE_INDIRECT_OBJECT,
> =C2=A0		=C2=A0 .name =3D "indirect object base"},
> -		{ .addr =3D ADDR_INPUT, .size =3D SIZE_BUFFER_INPUT,
> +		{ .addr =3D ADDR_INPUT, .size =3D MAX(sizeof(float) *
> SIZE_DATA, 0x10000),
> =C2=A0		=C2=A0 .name =3D "addr input"},
> -		{ .addr =3D ADDR_OUTPUT, .size =3D SIZE_BUFFER_OUTPUT,
> +		{ .addr =3D ADDR_OUTPUT, .size =3D MAX(sizeof(float) *
> SIZE_DATA, 0x10000),
> =C2=A0		=C2=A0 .name =3D "addr output" },
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE,
> =C2=A0		=C2=A0 .size =3D SIZE_GENERAL_STATE,
> @@ -2039,12 +2069,14 @@ static void xe2lpg_compute_preempt_exec(int
> fd, const unsigned char *long_kernel
> =C2=A0	xe2lpg_compute_exec_compute(bo_dict_long[8].data,
> ADDR_GENERAL_STATE_BASE,
> =C2=A0				=C2=A0=C2=A0=C2=A0 ADDR_SURFACE_STATE_BASE,
> ADDR_DYNAMIC_STATE_BASE,
> =C2=A0				=C2=A0=C2=A0=C2=A0 ADDR_INSTRUCTION_STATE_BASE,
> XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> -				=C2=A0=C2=A0=C2=A0 OFFSET_INDIRECT_DATA_START,
> OFFSET_KERNEL, OFFSET_STATE_SIP, threadgroup_preemption);
> +				=C2=A0=C2=A0=C2=A0 OFFSET_INDIRECT_DATA_START,
> OFFSET_KERNEL, OFFSET_STATE_SIP,
> +				=C2=A0=C2=A0=C2=A0 threadgroup_preemption,
> SIZE_DATA);
> =C2=A0
> =C2=A0	xe2lpg_compute_exec_compute(bo_dict_short[8].data,
> ADDR_GENERAL_STATE_BASE,
> =C2=A0				=C2=A0=C2=A0=C2=A0 ADDR_SURFACE_STATE_BASE,
> ADDR_DYNAMIC_STATE_BASE,
> =C2=A0				=C2=A0=C2=A0=C2=A0 ADDR_INSTRUCTION_STATE_BASE,
> XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> -				=C2=A0=C2=A0=C2=A0 OFFSET_INDIRECT_DATA_START,
> OFFSET_KERNEL, OFFSET_STATE_SIP, false);
> +				=C2=A0=C2=A0=C2=A0 OFFSET_INDIRECT_DATA_START,
> OFFSET_KERNEL, OFFSET_STATE_SIP,
> +				=C2=A0=C2=A0=C2=A0 false, SIZE_DATA);
> =C2=A0
> =C2=A0	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH,
> &sync_long, 1);
> =C2=A0	xe_exec_sync(fd, execenv_short.exec_queue, ADDR_BATCH,
> &sync_short, 1);
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index dc0fe2ec2..9fdb7fc73 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -55,6 +55,8 @@ struct user_execenv {
> =C2=A0	unsigned int kernel_size;
> =C2=A0	/** @skip_results_check: do not verify correctness of the
> results if true */
> =C2=A0	bool skip_results_check;
> +	/** @array_size: size of input and output arrays */
> +	uint32_t array_size;
> =C2=A0};
> =C2=A0
> =C2=A0extern const struct intel_compute_kernels
> intel_compute_square_kernels[];

With that,
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

It looks like this series is failing CI on DG2 / ATSM but it also looks
like you caught that? (64-bit alignment?)

/Thomas



