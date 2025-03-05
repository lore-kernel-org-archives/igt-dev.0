Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6A8C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 12:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAC110E75D;
	Wed,  5 Mar 2025 12:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNifORq8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317C910E762
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 12:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741177044; x=1772713044;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AeybTgSbR51wPttj/GYnWYQTJaUEM7DfHPDYjgu5/RI=;
 b=GNifORq8g28kKr3l4UuAnfLTDsYebXsbc5zvdrm30NjrJPeh+8jQka/H
 YzvlGp+g3dMX/DWLbRIGtJwIHm/WTYanVmQvHDRSWX/EmVp8tSUiBJnK2
 0FNWEpcejXLgCAA0hjbaiq/8/3sNf9nvxFLOB4VBaucJZX5sTKcIpCyNr
 3Z2eImE14VlDO5mg86ZmzkE+Duv48KXYkYDQ9UyqAgr9x1LdrX0ryi6Il
 iS7Rmb/G8p2cu5rZVtzXyJymhkjE9SiOBEmVHcOPctKUe+VoO/5Z0MOd9
 r6JyYOWahV6iUQ9mZMxm+8/nl98aksy+nREeXQ5eOz8TDDMiwgKzaTJKJ Q==;
X-CSE-ConnectionGUID: KNSTBhYzRIaJacCyaYOrPA==
X-CSE-MsgGUID: BUYFfxLRSdeRh+D5vvq3qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42272800"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="42272800"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 04:17:24 -0800
X-CSE-ConnectionGUID: si7Z3GWoTCyUKZy1Q6Ozfg==
X-CSE-MsgGUID: yzZ8cQJ4SW20V/uGR8y3aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="141923139"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 04:17:22 -0800
Date: Wed, 5 Mar 2025 13:17:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, francois.dugast@intel.com
Subject: Re: [PATCH v4] tests/intel/xe_fault_injection: Inject errors during
 exec queue create IOCTL
Message-ID: <20250305121720.hbgds4aucrxy4wp6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org, francois.dugast@intel.com
References: <20250305053852.324282-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250305053852.324282-1-pravalika.gurram@intel.com>
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

Hi Pravalika,
On 2025-03-05 at 11:08:52 +0530, Pravalika Gurram wrote:
> Use the fault injection infrastructure to make targeted internal KMD
> functions fail when executing xe_exec_queue_create_ioctl()
> so that more code paths are tested, such as error handling and unwinding.
> include xe_exec_queue_create_bind only for VM_BIND engine class.
s/include/Include/

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> xe_exec_queue_destroy_ioctl() and
> xe_exec_queue_get_property_ioctl() are not considered as there is
> no unwinding code to test with fault injection.
> 
> v2: Added separate case for vm_bind engine class
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 56 ++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 7ae941367..1f107ec93 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -185,6 +185,37 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  	injection_list_do(INJECTION_LIST_REMOVE, function_name);
>  }
>  
> +/**
> + * SUBTEST: exec-queue-create-fail-%s
> + * Description: inject an error in function %arg[1] used in exec queue create IOCTL to make it fail
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_exec_queue_create:                 xe_exec_queue_create
> + * @xe_hw_engine_group_add_exec_queue:    xe_hw_engine_group_add_exec_queue
> + * @xe_vm_add_compute_exec_queue:         xe_vm_add_compute_exec_queue
> + * @xe_exec_queue_create_bind:            xe_exec_queue_create_bind
> + */
> +static void
> +exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
> +		const char function_name[], unsigned int flags)
> +{
> +	uint32_t exec_queue_id;
> +	uint32_t vm = xe_vm_create(fd, flags, 0);
> +	/* sanity check */
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
> +	xe_exec_queue_destroy(fd, exec_queue_id);
> +
> +	ignore_faults_in_dmesg(function_name);
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
> +	xe_exec_queue_destroy(fd, exec_queue_id);
> +}
> +
>  static int
>  simple_vm_create(int fd, unsigned int flags)
>  {
> @@ -283,6 +314,7 @@ vm_bind_fail(int fd, const char function_name[])
>  igt_main
>  {
>  	int fd;
> +	struct drm_xe_engine_class_instance *hwe;
>  	char pci_slot[NAME_MAX];
>  	const struct section {
>  		const char *name;
> @@ -318,6 +350,18 @@ igt_main
>  		{ }
>  	};
>  
> +	const struct section exec_queue_create_fail_functions[] = {
> +		{ "xe_exec_queue_create", 0 },
> +		{ "xe_hw_engine_group_add_exec_queue", 0 },
> +		{ "xe_vm_add_compute_exec_queue", DRM_XE_VM_CREATE_FLAG_LR_MODE },
> +		{ }
> +	};
> +
> +	const struct section exec_queue_create_vmbind_fail_functions[] = {
> +		{ "xe_exec_queue_create_bind", 0 },
> +		{ }
> +	};
> +
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -333,6 +377,18 @@ igt_main
>  		igt_subtest_f("vm-bind-fail-%s", s->name)
>  			vm_bind_fail(fd, s->name);
>  
> +	for (const struct section *s = exec_queue_create_fail_functions; s->name; s++)
> +		igt_subtest_f("exec-queue-create-fail-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				if (hwe->engine_class != DRM_XE_ENGINE_CLASS_VM_BIND)
> +					exec_queue_create_fail(fd, hwe, s->name, s->flags);
> +
> +	for (const struct section *s = exec_queue_create_vmbind_fail_functions; s->name; s++)
> +		igt_subtest_f("exec-queue-create-fail-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VM_BIND)
> +					exec_queue_create_fail(fd, hwe, s->name, s->flags);
> +
>  	igt_fixture {
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>  	}
> -- 
> 2.34.1
> 
