Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D49C5B552
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 18:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EEC10E5CF;
	Tue, 10 Jun 2025 18:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jSo9PK28";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFC510E5CF
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 18:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749581136; x=1781117136;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4iKEydQicy3543U604QMYAzzBrLbD6L1LL7YPExsQao=;
 b=jSo9PK28sLnFt1M+pddfTyIyxOAyWxd5y/360uxyXdKIlBiGGr6ovggq
 upPnxAGDJTipWNbXJYqw542DLWm8Jok8+66ZU95OfUCtJjbhCAtWnA3Qa
 /UzWyfpCPGYObsZdK4JpsMeAWSKNOvb83p4w7kW1/I23aeS1U8xeYnRRD
 SRgKX97gArjXzdMPYsJt7gyBLKNhy4wMUj9TngpWB+ulL0RbSb+61Qrkw
 SfySjavC97xfcOKTtohPKBmQ812eZ37IlvfSPJA9LlkeQxobBEonUnGQk
 pSUblEyFQkaSDagXRZiwh/y6PwjR3vj4mBsgI4kWWP15S/vhcYzgK1NiF g==;
X-CSE-ConnectionGUID: lR8mcG5YQ5+yW9tIe3hwpQ==
X-CSE-MsgGUID: KNMXhUo1QBiv7VF0sgzzDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51795542"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="51795542"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 11:45:34 -0700
X-CSE-ConnectionGUID: SUVtfDiCRBqhQ83jLRhu6Q==
X-CSE-MsgGUID: wk1VR3z7T2WjMnIY3wPVug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="146845809"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 11:45:32 -0700
Date: Tue, 10 Jun 2025 20:45:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, lucas.demarchi@intel.com,
 francois.dugast@intel.com, rodrigo.vivi@intel.com,
 john.c.harrison@intel.com
Subject: Re: [PATCH v4 2/2] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Message-ID: <20250610184512.pjhv2igdg6dif7gd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, lucas.demarchi@intel.com,
 francois.dugast@intel.com, rodrigo.vivi@intel.com,
 john.c.harrison@intel.com
References: <20250606183519.78736-1-jonathan.cavitt@intel.com>
 <20250606183519.78736-3-jonathan.cavitt@intel.com>
 <76070095-aafe-4627-b400-80072a8b02f2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <76070095-aafe-4627-b400-80072a8b02f2@intel.com>
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

Hi Daniele,
On 2025-06-09 at 11:22:17 -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 6/6/2025 11:35 AM, Jonathan Cavitt wrote:
> > From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > 
> > Currently, numerous fault messages have been included in the dmesg
> > ignore list, and this list continues to expand.  Each time a new fault
> > injection point is introduced or a new feature is activated, additional
> > fault messages appear, making it cumbersome to manage the dmesg ignore
> > list.
> > 
> > However, we can safely assert that all dmesg reports that contain
> > *ERROR* in their message can be ignored, so add them to the dmesg ignore
> > list.  This unfortunately does not include the device probe error
> > itself, so that must be added separately.
> > 
> > While we're here, we should also assert that any errors we see are only
> > coming from the target PCI device.
> > 
> > v2:
> > - Only ignore error-level dmesg reports (or, at least, reports with
> >    *ERROR* in them), and device probe failues
> > - Add PCI data to regex (Michal)
> > 
> > v3: (Michal)
> > - Revert name change
> > - Add change log
> > - Remove fixes tag from commit
> > - Rename ignore_faults_in_dmesg to igt_ignore_dmesg_errors_from_dut, and
> >    move to lib/igt_core.c
> > - Minor code fixes
> > 
> > v4:
> > - Return ignore_faults_in_dmesg to tests/intel/xe_fault_injection.c, but
> >    keep it renamed to ignore_dmesg_errors_from_dut (Kamil)
> > 
> > v5:
> > - Pass preexisting pci name instead of attempting to regenerate it on
> >    each run of ignore_dmesg_errors_from_dut (Daniele)
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: John Harrison <john.c.harrison@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >   tests/intel/xe_fault_injection.c | 60 ++++++++++++++------------------
> >   1 file changed, 27 insertions(+), 33 deletions(-)
> > 
> > diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> > index 7a14ad1729..3166d95f55 100644
> > --- a/tests/intel/xe_fault_injection.c
> > +++ b/tests/intel/xe_fault_injection.c
> > @@ -64,28 +64,17 @@ static int fail_function_open(void)
> >   	return debugfs_fail_function_dir_fd;
> >   }
> > -static bool function_is_part_of_guc(const char function_name[])
> > +static void ignore_dmesg_errors_from_dut(const char pci_slot[])
> >   {
> > -	return strstr(function_name, "_guc_") != NULL ||
> > -	       strstr(function_name, "_uc_") != NULL ||
> > -	       strstr(function_name, "_wopcm_") != NULL;
> > -}
> > -
> > -static void ignore_faults_in_dmesg(const char function_name[])
> > -{
> > -	/* Driver probe is expected to fail in all cases, so ignore in igt_runner */
> > -	char regex[1024] = "probe with driver xe failed with error -12";
> > -
> >   	/*
> > -	 * If GuC module fault is injected, GuC is expected to fail,
> > -	 * so also ignore GuC init failures in igt_runner.
> > +	 * Driver probe is expected to fail in all cases, so ignore in igt_runner.
> > +	 * Additionally, all error-level reports are expected, so ignore those as well.
> 
> I would remove the "all" in this sentence, to make it sound less like "we
> know all the errors that are happening and we're expecting them" and more
> like "some things are going to throw errors and that's acceptable".
> With that:
> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> No need to re-spin just for this change, you can do the change while merging
> if no one else has any comments.
> 
> Daniele
> 

Thank you all, I merged this with small edits.

Regards,
Kamil

> >   	 */
> > -	if (function_is_part_of_guc(function_name)) {
> > -		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> > -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> > -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT .-ENOMEM");
> > -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed: -ENOMEM");
> > -	}
> > +	static const char *store = "probe with driver xe failed with error|\\*ERROR\\*";
> > +	char regex[1024];
> > +
> > +	/* Only block dmesg reports that target the pci slot of the given fd */
> > +	snprintf(regex, sizeof(regex), "%s:.*(%s)", pci_slot, store);
> >   	igt_emit_ignore_dmesg_regex(regex);
> >   }
> > @@ -234,7 +223,7 @@ inject_fault_probe(int fd, const char pci_slot[], const char function_name[])
> >   	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
> >   		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
> > -	ignore_faults_in_dmesg(function_name);
> > +	ignore_dmesg_errors_from_dut(pci_slot);
> >   	injection_list_add(function_name);
> >   	set_retval(function_name, INJECT_ERRNO);
> > @@ -291,7 +280,8 @@ static void probe_fail_guc(int fd, const char pci_slot[], const char function_na
> >    */
> >   static void
> >   exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
> > -		const char function_name[], unsigned int flags)
> > +		       const char pci_slot[], const char function_name[],
> > +		       unsigned int flags)
> >   {
> >   	uint32_t exec_queue_id;
> >   	uint32_t vm = xe_vm_create(fd, flags, 0);
> > @@ -299,7 +289,7 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
> >   	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
> >   	xe_exec_queue_destroy(fd, exec_queue_id);
> > -	ignore_faults_in_dmesg(function_name);
> > +	ignore_dmesg_errors_from_dut(pci_slot);
> >   	injection_list_add(function_name);
> >   	set_retval(function_name, INJECT_ERRNO);
> >   	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
> > @@ -330,11 +320,12 @@ simple_vm_create(int fd, unsigned int flags)
> >    * @xe_vm_create_scratch:	xe_vm_create_scratch
> >    */
> >   static void
> > -vm_create_fail(int fd, const char function_name[], unsigned int flags)
> > +vm_create_fail(int fd, const char pci_slot[],
> > +	       const char function_name[], unsigned int flags)
> >   {
> >   	igt_assert_eq(simple_vm_create(fd, flags), 0);
> > -	ignore_faults_in_dmesg(function_name);
> > +	ignore_dmesg_errors_from_dut(pci_slot);
> >   	injection_list_add(function_name);
> >   	set_retval(function_name, INJECT_ERRNO);
> >   	igt_assert(simple_vm_create(fd, flags) != 0);
> > @@ -391,13 +382,13 @@ simple_vm_bind(int fd, uint32_t vm)
> >    * @xe_sync_entry_parse:		xe_sync_entry_parse
> >    */
> >   static void
> > -vm_bind_fail(int fd, const char function_name[])
> > +vm_bind_fail(int fd, const char pci_slot[], const char function_name[])
> >   {
> >   	uint32_t vm = xe_vm_create(fd, 0, 0);
> >   	igt_assert_eq(simple_vm_bind(fd, vm), 0);
> > -	ignore_faults_in_dmesg(function_name);
> > +	ignore_dmesg_errors_from_dut(pci_slot);
> >   	injection_list_add(function_name);
> >   	set_retval(function_name, INJECT_ERRNO);
> >   	igt_assert(simple_vm_bind(fd, vm) != 0);
> > @@ -415,7 +406,8 @@ vm_bind_fail(int fd, const char function_name[])
> >    * @xe_oa_alloc_regs:		xe_oa_alloc_regs
> >    */
> >   static void
> > -oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
> > +oa_add_config_fail(int fd, int sysfs, int devid,
> > +		   const char pci_slot[], const char function_name[])
> >   {
> >   	char path[512];
> >   	uint64_t config_id;
> > @@ -445,7 +437,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
> >   	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
> >   	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
> > -	ignore_faults_in_dmesg(function_name);
> > +	ignore_dmesg_errors_from_dut(pci_slot);
> >   	injection_list_add(function_name);
> >   	set_retval(function_name, INJECT_ERRNO);
> >   	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
> > @@ -564,27 +556,29 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
> >   	for (const struct section *s = vm_create_fail_functions; s->name; s++)
> >   		igt_subtest_f("vm-create-fail-%s", s->name)
> > -			vm_create_fail(fd, s->name, s->flags);
> > +			vm_create_fail(fd, pci_slot, s->name, s->flags);
> >   	for (const struct section *s = vm_bind_fail_functions; s->name; s++)
> >   		igt_subtest_f("vm-bind-fail-%s", s->name)
> > -			vm_bind_fail(fd, s->name);
> > +			vm_bind_fail(fd, pci_slot, s->name);
> >   	for (const struct section *s = exec_queue_create_fail_functions; s->name; s++)
> >   		igt_subtest_f("exec-queue-create-fail-%s", s->name)
> >   			xe_for_each_engine(fd, hwe)
> >   				if (hwe->engine_class != DRM_XE_ENGINE_CLASS_VM_BIND)
> > -					exec_queue_create_fail(fd, hwe, s->name, s->flags);
> > +					exec_queue_create_fail(fd, hwe, pci_slot,
> > +							       s->name, s->flags);
> >   	for (const struct section *s = exec_queue_create_vmbind_fail_functions; s->name; s++)
> >   		igt_subtest_f("exec-queue-create-fail-%s", s->name)
> >   			xe_for_each_engine(fd, hwe)
> >   				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VM_BIND)
> > -					exec_queue_create_fail(fd, hwe, s->name, s->flags);
> > +					exec_queue_create_fail(fd, hwe, pci_slot,
> > +							       s->name, s->flags);
> >   	for (const struct section *s = oa_add_config_fail_functions; s->name; s++)
> >   		igt_subtest_f("oa-add-config-fail-%s", s->name)
> > -			oa_add_config_fail(fd, sysfs, devid, s->name);
> > +			oa_add_config_fail(fd, sysfs, devid, pci_slot, s->name);
> >   	igt_fixture {
> >   		igt_kmod_unbind("xe", pci_slot);
> 
