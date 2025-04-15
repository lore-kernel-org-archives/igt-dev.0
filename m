Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83454C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 11:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4F310E72F;
	Tue, 15 Apr 2025 11:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXUzx6CB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC2610E72F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 11:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744715034; x=1776251034;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XjFHWr46+Uldmh9QxawP/z3229hwFBOqlarmO1Xhto0=;
 b=PXUzx6CBTdd0EW4GqJyFNDKplx54rp+JUd6EqKJnurrPHt0J7qOfcvJX
 w733ik4lq26ezseWc4ADVph+a1XbSv5+vXQiFCnUMLP99DULrlGv36p4H
 S5VBV8YVVxtSN+vvtIEX2Pqnj9ftdimBiul/K8Q1xHExA0Uvrm/hYFe+h
 BznzeiMDymdk49psVoJSTtntCilwGTknpwNCZImHttQMsQ+e4uSKQ92RK
 HcMZDL7rIXSWVeg5zdR7yyKckapyzHk//iqa8z3eFjyniVdOd6Xaia1Pn
 SAKnIPT3nsbYTTWKqi960LmmI9c7nCaQnQeFUnGlQC5lDGFBFk36wCSQI Q==;
X-CSE-ConnectionGUID: 3PCNXE5jTiGUb+c6ChqiBA==
X-CSE-MsgGUID: y7pm37PcTxKzisYPH1dvOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57601215"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="57601215"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:03:54 -0700
X-CSE-ConnectionGUID: zBAcOU5FR0aPy8C2wP1AIA==
X-CSE-MsgGUID: IbHc+hH6SOCtN8ILHIQbkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="161070778"
Received: from wisniew1-mobl1.ger.corp.intel.com (HELO [10.217.180.232])
 ([10.217.180.232])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:03:03 -0700
Message-ID: <5f7a5299-4879-484b-b7b0-29bbb9ff6515@intel.com>
Date: Tue, 15 Apr 2025 13:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] tests/xe_eudebug: Implement faultable
 variations of some testcases
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
References: <20250415101340.13275-1-jan.sokolowski@intel.com>
 <20250415101340.13275-2-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250415101340.13275-2-jan.sokolowski@intel.com>
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

Hi Jan,

On 15.04.2025 12:13, Jan Sokolowski wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Implement fault variation of tests, which are accessing the memory via
> debugfd, by creating a vm in FAULT_MODE.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>   tests/intel/xe_eudebug.c | 98 ++++++++++++++++++++++++++++++++--------
>   1 file changed, 78 insertions(+), 20 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index d1583fd84..3d030cf23 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -65,6 +65,7 @@ static void test_sysfs_toggle(int fd)
>   #define VM_BIND_DELAY_UFENCE_ACK	(1 << 8)
>   #define VM_BIND_UFENCE_RECONNECT	(1 << 9)
>   #define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 10)
> +#define TEST_FAULTABLE			(1 << 30)
>   #define TEST_DISCOVERY			(1 << 31)
>   
>   #define PAGE_SIZE SZ_4K
> @@ -1274,7 +1275,7 @@ static void test_race_discovery(int fd, unsigned int flags, int clients)
>   			igt_assert_eq(sessions[i].client->seqno - 1,
>   				      sessions[i].debugger->event_count);
>   
> -			xe_eudebug_event_log_compare(sessions[0].debugger->log,
> +			xe_eudebug_event_log_compare(sessions[0].debugger->log,

This looks like some artifact (it was not in v2).

>   						     sessions[i].debugger->log,
>   						     XE_EUDEBUG_FILTER_EVENT_VM_BIND);
>   
> @@ -1464,16 +1465,19 @@ static void test_basic_sessions_th(int fd, unsigned int flags, int num_clients,
>   static void vm_access_client(struct xe_eudebug_client *c)
>   {
>   	struct drm_xe_engine_class_instance *hwe = c->ptr;
> +	uint32_t vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
>   	uint32_t bo_placement;
>   	struct bind_list *bl;
>   	uint32_t vm;
>   	int fd, i, j;
>   
> +

Reduntant whieline

Anyway, I don't think there is a need to send another revision, it can 
be fixed when merging.

Regards,
Christoph

>   	igt_debug("Using %s\n", xe_engine_class_string(hwe->engine_class));
>   
>   	fd = xe_eudebug_client_open_driver(c);
>   
> -	vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	vm_flags |= (c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
> +	vm = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
>   
>   	if (c->flags & VM_BIND_OP_MAP_USERPTR)
>   		bo_placement = 0;
> @@ -1587,6 +1591,11 @@ static void vm_trigger(struct xe_eudebug_debugger *d,
>    *      vm fd, concerning many different offsets inside the vm,
>    *      and many virtual addresses of the vm_bound object.
>    *
> + * SUBTEST: basic-vm-access-faultable
> + * Functionality: VM access with FAULTABLE_VM
> + * Description:
> + *      Fault variation of test basic-vm-access.
> + *
>    * SUBTEST: basic-vm-access-userptr
>    * Functionality: VM access
>    * Description:
> @@ -1594,11 +1603,18 @@ static void vm_trigger(struct xe_eudebug_debugger *d,
>    *      vm fd, concerning many different offsets inside the vm,
>    *      and many virtual addresses of the vm_bound object, but backed
>    *      by userptr.
> + *
> + * SUBTEST: basic-vm-access-userptr-faultable
> + * Functionality: VM access with FAULTABLE_VM
> + * Description:
> + *      Fault variation of test basic-vm-access-userptr.
>    */
>   static void test_vm_access(int fd, unsigned int flags, int num_clients)
>   {
>   	struct drm_xe_engine_class_instance *hwe;
>   
> +	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
> +
>   	xe_eudebug_for_each_engine(fd, hwe)
>   		test_client_with_trigger(fd, flags, num_clients,
>   					 vm_access_client,
> @@ -1739,16 +1755,28 @@ static void vm_trigger_access_parameters(struct xe_eudebug_debugger *d,
>    *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
>    *      with bo backing storage.
>    *
> + * SUBTEST: basic-vm-access-parameters-faultable
> + * Functionality: VM access with FAULTABLE_VM
> + * Description:
> + *	Fault variation of test basic-vm-access-parameters.
> + *
>    * SUBTEST: basic-vm-access-parameters-userptr
>    * Functionality: VM access
>    * Description:
>    *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
>    *      with userptr backing storage.
> + *
> + * SUBTEST: basic-vm-access-parameters-userptr-faultable
> + * Functionality: VM access with FAULTABLE_VM
> + * Description:
> + *      Fault variation of test basic-vm-access-parameters-userptr.
>    */
>   static void test_vm_access_parameters(int fd, unsigned int flags, int num_clients)
>   {
>   	struct drm_xe_engine_class_instance *hwe;
>   
> +	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
> +
>   	xe_eudebug_for_each_engine(fd, hwe)
>   		test_client_with_trigger(fd, flags, num_clients,
>   					 vm_access_client,
> @@ -2214,10 +2242,14 @@ static void *vm_bind_clear_thread(void *data)
>   	struct vm_bind_clear_thread_priv *priv = data;
>   	int fd = xe_eudebug_client_open_driver(priv->c);
>   	uint32_t gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
> -	uint32_t vm = xe_eudebug_client_vm_create(priv->c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	uint32_t vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
>   	size_t bo_size = xe_bb_size(fd, batch_size);
>   	unsigned long count = 0;
>   	uint64_t *fence_data;
> +	uint32_t vm;
> +
> +	vm_flags |= (priv->c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
> +	vm = xe_eudebug_client_vm_create(priv->c, fd, vm_flags, 0);
>   
>   	/* init uf_sync */
>   	fence_data = aligned_alloc(xe_get_default_alignment(fd), sizeof(*fence_data));
> @@ -2427,14 +2459,21 @@ static void vm_bind_clear_ack_trigger(struct xe_eudebug_debugger *d,
>    * Functionality: memory access
>    * Description:
>    *      Check that fresh buffers we vm_bind into the ppGTT are always clear.
> + *
> + * SUBTEST: vm-bind-clear-faultable
> + * Functionality: memory access with FAULTABLE_VM
> + * Description:
> + *      Fault variation of test vm-bind-clear.
>    */
> -static void test_vm_bind_clear(int fd)
> +static void test_vm_bind_clear(int fd, uint32_t flags)
>   {
>   	struct vm_bind_clear_priv *priv;
>   	struct xe_eudebug_session *s;
>   
> +	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
> +
>   	priv = vm_bind_clear_priv_create();
> -	s = xe_eudebug_session_create(fd, vm_bind_clear_client, 0, priv);
> +	s = xe_eudebug_session_create(fd, vm_bind_clear_client, flags, priv);
>   
>   	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
>   					vm_bind_clear_test_trigger);
> @@ -2463,11 +2502,15 @@ static void vma_ufence_client(struct xe_eudebug_client *c)
>   	const unsigned int n = UFENCE_EVENT_COUNT_EXPECTED;
>   	int fd = xe_eudebug_client_open_driver(c);
>   	struct ufence_bind *binds = create_binds_with_ufence(fd, n);
> -	uint32_t vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	uint32_t vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
>   	size_t bo_size = xe_get_default_alignment(fd);
>   	uint64_t items = bo_size / sizeof(uint32_t);
>   	uint32_t bo[UFENCE_EVENT_COUNT_EXPECTED];
>   	uint32_t *ptr[UFENCE_EVENT_COUNT_EXPECTED];
> +	uint32_t vm;
> +
> +	vm_flags |= (c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
> +	vm = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
>   
>   	for (int i = 0; i < n; i++) {
>   		bo[i] = xe_bo_create(fd, 0, bo_size,
> @@ -2644,12 +2687,19 @@ static void vma_ufence_trigger(struct xe_eudebug_debugger *d,
>    * Description:
>    *      Intercept vm bind after receiving ufence event, then access target vm and write to it.
>    *      Then check on client side if the write was successful.
> + *
> + * SUBTEST: vma-ufence-faultable
> + * Functionality: check ufence blocking with FAULTABLE_VM
> + * Description:
> + *      Fault variation of test vma-ufence.
>    */
>   static void test_vma_ufence(int fd, unsigned int flags)
>   {
>   	struct xe_eudebug_session *s;
>   	struct ufence_priv *priv;
>   
> +	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
> +
>   	priv = ufence_priv_create();
>   	s = xe_eudebug_session_create(fd, vma_ufence_client, flags, priv);
>   
> @@ -2774,17 +2824,31 @@ igt_main
>   	igt_subtest("basic-client-th")
>   		test_basic_sessions_th(fd, 0, 1, true);
>   
> -	igt_subtest("basic-vm-access")
> -		test_vm_access(fd, 0, 1);
>   
> -	igt_subtest("basic-vm-access-userptr")
> -		test_vm_access(fd, VM_BIND_OP_MAP_USERPTR, 1);
> +	igt_subtest_group {
> +		uint32_t flags[] = {0, TEST_FAULTABLE};
> +		const char *suffix[] = {"", "-faultable"};
> +
> +		for (int i = 0; i < ARRAY_SIZE(flags); i++) {
> +			igt_subtest_f("basic-vm-access%s", suffix[i])
> +				test_vm_access(fd, flags[i], 1);
> +
> +			igt_subtest_f("basic-vm-access-userptr%s", suffix[i])
> +				test_vm_access(fd, VM_BIND_OP_MAP_USERPTR | flags[i], 1);
> +
> +			igt_subtest_f("basic-vm-access-parameters%s", suffix[i])
> +				test_vm_access_parameters(fd, flags[i], 1);
> +
> +			igt_subtest_f("basic-vm-access-parameters-userptr%s", suffix[i])
> +				test_vm_access_parameters(fd, VM_BIND_OP_MAP_USERPTR | flags[i], 1);
>   
> -	igt_subtest("basic-vm-access-parameters")
> -		test_vm_access_parameters(fd, 0, 1);
> +			igt_subtest_f("vma-ufence%s", suffix[i])
> +				test_vma_ufence(fd, flags[i]);
>   
> -	igt_subtest("basic-vm-access-parameters-userptr")
> -		test_vm_access_parameters(fd, VM_BIND_OP_MAP_USERPTR, 1);
> +			igt_subtest_f("vm-bind-clear%s", suffix[i])
> +				test_vm_bind_clear(fd, flags[i]);
> +		}
> +	}
>   
>   	igt_subtest("multiple-sessions")
>   		test_basic_sessions(fd, CREATE_VMS | CREATE_EXEC_QUEUES, 4, true);
> @@ -2813,12 +2877,6 @@ igt_main
>   	igt_subtest("basic-vm-bind-ufence-sigint-client")
>   		test_basic_ufence(fd, VM_BIND_UFENCE_SIGINT_CLIENT);
>   
> -	igt_subtest("vma-ufence")
> -		test_vma_ufence(fd, 0);
> -
> -	igt_subtest("vm-bind-clear")
> -		test_vm_bind_clear(fd);
> -
>   	igt_subtest("basic-vm-bind-discovery")
>   		test_basic_discovery(fd, VM_BIND, true);
>   

