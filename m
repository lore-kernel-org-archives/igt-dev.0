Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80F7C19F2E
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 14:13:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DD010EB01;
	Thu, 27 Feb 2025 14:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9nPTpeM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC1D10EB01
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740665607; x=1772201607;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vmYOTrsMsrfrXP32igtKDSS96HQ4fNVXvtk6KrcdSTE=;
 b=a9nPTpeMfQdV69fqUot0/r/CfzH0BJcE45fcgGDcEql+j+RohR91f8+C
 PUK7SMGj4H7u66AkkynmLsvbmikMyRWgYBVKFi6AOQmwPj3oF3P+u/3mn
 PM3k4GYXIQ4c9NlUaAMAVH4m+aduYEqZaYuROADUsN34Oefs7irvicXPd
 lB6E1tv3Xw+WR75cKWYFuWbulI/1L+VaAS3uXZBAxoaeDEsl0xZV9AU/d
 KP9m1Y3WFNpifcUDRHiJJ+Y9GW3f6EG+FyyzMH9UabNJhDeiUNZeN23n9
 OFWseEUMdCMIoLRphfeAb8i40D1ARZNOYeNbvjQ+vnkkMGFDEfsAmmrKx w==;
X-CSE-ConnectionGUID: JnJFmI34TgaJrphRDznqDg==
X-CSE-MsgGUID: 42e6H/dWQiOjV3xPfGlmrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41438785"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="41438785"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 06:13:26 -0800
X-CSE-ConnectionGUID: eLqrHFi0SN6owoUh9lsJ/w==
X-CSE-MsgGUID: TIwDRYNMQfKbBsXPZSzc9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="116833262"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:13:24 -0800
Date: Thu, 27 Feb 2025 15:13:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, francois.dugast@intel.com,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: Re: [PATCH v3] tests/intel/xe_fault_injection: Inject errors during
 exec queue create IOCTL
Message-ID: <20250227141322.hdm7xq75qjrzajq6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org, francois.dugast@intel.com,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
References: <20250225073404.252344-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250225073404.252344-1-pravalika.gurram@intel.com>
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
On 2025-02-25 at 13:04:04 +0530, Pravalika Gurram wrote:
> Use the fault injection infrastructure to make targeted internal KMD
> functions fail when executing xe_exec_queue_create_ioctl()
> so that more code paths are tested, such as error handling and unwinding.
> include xe_exec_queue_create_bind only for VM_BIND engine class.
> xe_exec_queue_destroy_ioctl() and
> xe_exec_queue_get_property_ioctl() are not considered as there is
> no unwinding code to test with fault injection.
> 

+Cc Priyanka Dandamudi <priyanka.dandamudi@intel.com>

> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 50 ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 7ae941367..f25ad9b27 100644
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

Please rename these test to some shorter form, like:
 @basic:
 @group-add:
 @compute:
 @bind:

Also note that we should not use underscode '_' in test names.

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
> @@ -318,6 +350,14 @@ igt_main
>  		{ }
>  	};
>  
> +	const struct section exec_queue_create_fail_functions[] = {
> +		{ "xe_exec_queue_create", 0 },
> +		{ "xe_hw_engine_group_add_exec_queue", 0 },
> +		{ "xe_vm_add_compute_exec_queue", DRM_XE_VM_CREATE_FLAG_LR_MODE },
> +		{ "xe_exec_queue_create_bind", 0 },

Extend this with a test name, for example:
		{ "basic", "xe_exec_queue_create", 0 },

> +		{ }
> +	};
> +
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -333,6 +373,16 @@ igt_main
>  		igt_subtest_f("vm-bind-fail-%s", s->name)
>  			vm_bind_fail(fd, s->name);
>  
> +	for (const struct section *s = exec_queue_create_fail_functions; s->name; s++)
> +		igt_subtest_f("exec-queue-create-fail-%s", s->name)

So here it will be:
		igt_subtest_f("exec-queue-create-fail-%s", s->test_name)

You could print info here about what actual function will be tested:
	igt_info("fault injection for: %s\n", s->name);


> +			xe_for_each_engine(fd, hwe) {
> +				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VM_BIND &&
> +						strcmp(s->name, "xe_exec_queue_create_bind"))

Align.

> +					exec_queue_create_fail(fd, hwe, s[3].name, s[3].flags);

s/s[3]/s->/

Please add a comment before this if explaining why
are you restricitng testing of CLASS_VM_BIND
You could also code this if in one piece with
a help of var:

	is_create_bind = !strcmp(s->name, "xe_exec_queue_create_bind");
	if (!is_create_bind || (is_create_bind && hwe->engine_class == DRM_XE_ENGINE_CLASS_VM_BIND))
		exec_queue_create_fail(fd, hwe, s->name, s->flags);
	else
		...document why this is not tested...

Regards,
Kamil

> +				else if (strcmp(s->name, "xe_exec_queue_create_bind"))
> +					exec_queue_create_fail(fd, hwe, s->name, s->flags);
> +			}
> +
>  	igt_fixture {
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>  	}
> -- 
> 2.34.1
> 
