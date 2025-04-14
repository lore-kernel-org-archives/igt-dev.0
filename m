Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B9FC369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 11:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4842A10E51C;
	Mon, 14 Apr 2025 11:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3UBGHNz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC48510E0DB
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744629852; x=1776165852;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hFrHh7IxI2Tms2bGcnZjV+vLgfZiBBF8Omjtd9Uq6fo=;
 b=W3UBGHNzSoVYEPCXaSw3nTmMRH0CdEuW+ZLOYPRmJF4ClCxlhrRGkhD5
 dsLmNo9vfC4nPPFltu20nDF/BDYoWQiVk+ra/FQBOvlfhDayFBUqHQZgQ
 Bv9pHMv3VZlRDuY5P3qJFZeFfbF5VSMBqxs2wuzA0mycl4PFj7u5KKTyz
 WZ3w9uuKQaxodSI4CRle8iRofD+auJ/UX+U3eiemZdXyku16nZCYv0yV/
 1NUy7spwSCpDs6GeCZKD5jz0QAoyNyFWg/JfKex1v0qlqBH/4M3EZI8nH
 /RDKGZKbnEUPIPC3rlvjwEI2EwupmkLglkGi8VAvShj73r9joNkR22Prc w==;
X-CSE-ConnectionGUID: iC7XaiVkRW2CJC2zafkAKA==
X-CSE-MsgGUID: JWOOq0xRSjWuW7oHHQ27DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49751002"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="49751002"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:24:06 -0700
X-CSE-ConnectionGUID: J13LalSdQfqpCT0uJK3ifQ==
X-CSE-MsgGUID: w5nN4PAYSu6NPkyUC2GZEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="160777035"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.206])
 ([10.245.246.206])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:24:04 -0700
Message-ID: <9156b86d-39c1-4ebf-b2ba-cf184458684a@intel.com>
Date: Mon, 14 Apr 2025 13:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tests/xe_eudebug: Implement faultable
 variations of some testcases
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
References: <20250401090651.298768-1-jan.sokolowski@intel.com>
 <20250401090651.298768-2-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250401090651.298768-2-jan.sokolowski@intel.com>
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

On 1.04.2025 11:06, Jan Sokolowski wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Implement fault variation of tests, which are accessing the memory via
> debugfd, by creating a vm in FAULT_MODE.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>   tests/intel/xe_eudebug.c | 96 ++++++++++++++++++++++++++++++++--------
>   1 file changed, 77 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 76870805c..d61ab373f 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -64,6 +64,7 @@ static void test_sysfs_toggle(int fd)
>   #define VM_BIND_DELAY_UFENCE_ACK	(1 << 8)
>   #define VM_BIND_UFENCE_RECONNECT	(1 << 9)
>   #define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 10)
> +#define TEST_FAULTABLE			(1 << 30)
>   #define TEST_DISCOVERY			(1 << 31)
>   
>   #define PAGE_SIZE SZ_4K
> @@ -1445,16 +1446,19 @@ static void test_basic_sessions_th(int fd, unsigned int flags, int num_clients,
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
> @@ -1567,17 +1571,31 @@ static void vm_trigger(struct xe_eudebug_debugger *d,
>    *      vm fd, concerning many different offsets inside the vm,
>    *      and many virtual addresses of the vm_bound object.
>    *
> + * SUBTEST: basic-vm-access-faultable
> + * Sub-category: EUdebug framework

I think this may be dropped since we have this label for the top level 
test doc.

> + * Functionality: VM access with FAULTABLE_VM
> + * Description:
> + *      Fault variation of test basic-vm-access.
> + *
>    * SUBTEST: basic-vm-access-userptr
>    * Description:
>    *      Exercise XE_EUDEBUG_VM_OPEN with pread and pwrite into the
>    *      vm fd, concerning many different offsets inside the vm,
>    *      and many virtual addresses of the vm_bound object, but backed
>    *      by userptr.
> + *
> + * SUBTEST: basic-vm-access-userptr-faultable
> + * Sub-category: EUdebug framework
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
> @@ -1717,15 +1735,29 @@ static void vm_trigger_access_parameters(struct xe_eudebug_debugger *d,
>    *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
>    *      with bo backing storage.
>    *
> + * SUBTEST: basic-vm-access-parameters-faultable
> + * Sub-category: EUdebug framework
> + * Functionality: VM access with FAULTABLE_VM
> + * Description:
> + *	Fault variation of test basic-vm-access-parameters.
> + *
>    * SUBTEST: basic-vm-access-parameters-userptr
>    * Description:
>    *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
>    *      with userptr backing storage.
> + *
> + * SUBTEST: basic-vm-access-parameters-userptr-faultable
> + * Sub-category: EUdebug framework
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
> @@ -2185,7 +2217,8 @@ static void *vm_bind_clear_thread(void *data)
>   	struct vm_bind_clear_thread_priv *priv = data;
>   	int fd = xe_eudebug_client_open_driver(priv->c);
>   	uint32_t gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
> -	uint32_t vm = xe_eudebug_client_vm_create(priv->c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	uint32_t vm_flags = (priv->c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
> +	uint32_t vm = xe_eudebug_client_vm_create(priv->c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | vm_flags, 0);

Nit: that's quite a long line and since we add a 'flags` variable we may 
set it in one go with a line break and then just pass flags to vm 
creation. Or we could do the 'test_basic_sessions' approach from above 
and move the optional fault flag setting and vm creation to the code 
part. Same nit for this pattern which repeats below.

All in all - LGTM, with the above addressed:
Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Regards,
Christoph

>   	size_t bo_size = xe_bb_size(fd, batch_size);
>   	unsigned long count = 0;
>   	uint64_t *fence_data;
> @@ -2397,14 +2430,22 @@ static void vm_bind_clear_ack_trigger(struct xe_eudebug_debugger *d,
>    * SUBTEST: vm-bind-clear
>    * Description:
>    *      Check that fresh buffers we vm_bind into the ppGTT are always clear.
> + *
> + * SUBTEST: vm-bind-clear-faultable
> + * Sub-category: EUdebug framework
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
> @@ -2433,7 +2474,8 @@ static void vma_ufence_client(struct xe_eudebug_client *c)
>   	const unsigned int n = UFENCE_EVENT_COUNT_EXPECTED;
>   	int fd = xe_eudebug_client_open_driver(c);
>   	struct ufence_bind *binds = create_binds_with_ufence(fd, n);
> -	uint32_t vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	uint32_t vm_flags = (c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
> +	uint32_t vm = xe_eudebug_client_vm_create(c, fd, vm_flags | DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>   	size_t bo_size = xe_get_default_alignment(fd);
>   	uint64_t items = bo_size / sizeof(uint32_t);
>   	uint32_t bo[UFENCE_EVENT_COUNT_EXPECTED];
> @@ -2613,12 +2655,20 @@ static void vma_ufence_trigger(struct xe_eudebug_debugger *d,
>    * Description:
>    *      Intercept vm bind after receiving ufence event, then access target vm and write to it.
>    *      Then check on client side if the write was successful.
> + *
> + * SUBTEST: vma-ufence-faultable
> + * Sub-category: EUdebug framework
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
> @@ -2742,17 +2792,31 @@ igt_main
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
>   
> -	igt_subtest("basic-vm-access-parameters")
> -		test_vm_access_parameters(fd, 0, 1);
> +			igt_subtest_f("basic-vm-access-parameters-userptr%s", suffix[i])
> +				test_vm_access_parameters(fd, VM_BIND_OP_MAP_USERPTR | flags[i], 1);
>   
> -	igt_subtest("basic-vm-access-parameters-userptr")
> -		test_vm_access_parameters(fd, VM_BIND_OP_MAP_USERPTR, 1);
> +			igt_subtest_f("vma-ufence%s", suffix[i])
> +				test_vma_ufence(fd, flags[i]);
> +
> +			igt_subtest_f("vm-bind-clear%s", suffix[i])
> +				test_vm_bind_clear(fd, flags[i]);
> +		}
> +	}
>   
>   	igt_subtest("multiple-sessions")
>   		test_basic_sessions(fd, CREATE_VMS | CREATE_EXEC_QUEUES, 4, true);
> @@ -2781,12 +2845,6 @@ igt_main
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

