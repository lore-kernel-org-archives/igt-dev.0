Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145E9C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 15:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D6B10E24B;
	Wed, 22 Jan 2025 15:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzWVnlXf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1660310E24B
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 15:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737559351; x=1769095351;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p3jYhu0X00LH6lbodFdueoXQQ1KG8rkbR2QqEmUssXo=;
 b=nzWVnlXfL/gAJn41+73MUR34XcBTAk7QYOeW+zZSE/x8P2/h3sTjfCxu
 G1pespoNiDAA6ZWFyYyijTXtLGsFtfuVc861umZ7eLCxexYBJwXnk/BUt
 3DnY75teEQKs+M4cR/OP9rI++n302L4uEjvA2o/Nx1TTQ+SbgJHtUecsA
 487UYrFkyCMKvVGnr17TWT59U3TU2LZ1vvEDCe35M+LbI7KofvLTX1eIa
 4D4vTW/cJ0o6ols9UQ9yw6syi8PNAhFF3Od8ZKT8F/x81UshVMi71VIsN
 v+Uhe4p3/IUZ61Z6APkzb9GmQGhD2kVzlcIFzy4y3DwDpCqQi8CTdBsuY w==;
X-CSE-ConnectionGUID: 2Sn2K4diSGmPrpj0XXvjYA==
X-CSE-MsgGUID: CXli+HhURZ6m8xryGdXMgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37230476"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="37230476"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 07:22:31 -0800
X-CSE-ConnectionGUID: gLlgfX5PRsOsbrbbmwbxiw==
X-CSE-MsgGUID: 7H3sidaeSXCQQOq2siFYEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112152374"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 07:22:29 -0800
Received: from [10.245.80.89] (mwajdecz-MOBL.ger.corp.intel.com [10.245.80.89])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7AC3D2FC50;
 Wed, 22 Jan 2025 15:22:27 +0000 (GMT)
Message-ID: <af7389a2-ce8c-45fe-8206-18e17fe7b8f1@intel.com>
Date: Wed, 22 Jan 2025 16:22:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] tests/intel/xe_fault_injection: Inject
 errors during xe_guc_ct_send_recv
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
References: <20250122073808.16288-1-satyanarayana.k.v.p@intel.com>
 <20250122073808.16288-3-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250122073808.16288-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

late comments cont'd

On 22.01.2025 08:38, Satyanarayana K V P wrote:
> Use the kernel fault injection infrastructure to test error handling
> of xe at enabling of VFs stage when executing xe_guc_ct_send_recv()
> so that more code paths are tested, such as error handling and unwinding.

why xe_guc_ct_send_recv() was not added to the probe_fail_functions[]
like it was done with xe_guc_mmio_send_recv() in patch 1/2 ?

also maybe it's worth to clearly say that 'enabling of VFs' is just a
provisioning step on the PF, without probing any VF driver

and if the goal of the test-case is to validate a 'enabling of VFs'
scenario, why we don't add some other critical functions used during
that phase, like GGTT/doorbells/LMEM allocations?

> 
> Error can be injected using:
> igt@xe_fault_injection@enable-vfs-fail-xe_guc_ct_send_recv
> 
> v2: Updated guc_fail_* to enable_vfs_*
> Added igt_skip_on(!igt_sriov_is_pf(fd)) to skip test when run without
> enabling sriov.
> 
> v3: Fixed documentation build error
> ERROR: Missing documentation for igt@xe_fault_injection@enable-vfs-fail-xe_guc_ct_send_recv
> ERROR: Unneeded documentation for igt@xe_fault_injection@guc-fail-xe_guc_ct_send_recv
> 
> v4: Fixed review comments.
> Updated igt_skip_on to igt_require.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 62 ++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 3a0e2aa29..f92f955cd 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -19,12 +19,14 @@
>  #include "igt_sysfs.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_pat.h"
> +#include "lib/igt_sriov_device.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
>  #define INJECT_ERRNO	-ENOMEM
>  #define BO_ADDR		0x1a0000
>  #define BO_SIZE		(1024*1024)
> +#define NUM_VFS		1
>  
>  enum injection_list_action {
>  	INJECTION_LIST_ADD,
> @@ -281,6 +283,55 @@ vm_bind_fail(int fd, const char function_name[])
>  	igt_assert_eq(simple_vm_bind(fd, vm), 0);
>  }
>  
> +static int sriov_enable_vfs(int fd, int num_vfs)

looks like a good candidate to be moved to lib/
see below

> +{
> +	int sysfs;
> +	bool ret;
> +
> +	sysfs = igt_sysfs_open(fd);
> +	igt_assert_fd(sysfs);
> +
> +	ret = __igt_sysfs_set_u32(sysfs, "device/sriov_numvfs", num_vfs);
> +	close(sysfs);
> +
> +	return ret;
> +}
> +
> +/**
> + * SUBTEST: enable-vfs-fail-%s
> + * Description: inject an error in function %arg[1] used when xe interacts with guc to make it fail
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_guc_ct_send_recv:               xe_guc_ct_send_recv
> + */
> +
> +static void
> +enable_vfs_fail(int fd, int num_vfs, const char function_name[])
> +{
> +	bool autoprobe = 0;
> +
> +	ignore_faults_in_dmesg(function_name);
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +
> +	autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
> +
> +	if (autoprobe)
> +		igt_sriov_disable_driver_autoprobe(fd);
> +
> +	/* igt_sriov_enable_vfs can't be used here as it is causing abort on any error.
> +	 * Since error in this test is expected, we have written our own static function here.
> +	 */

hmm, if igt_sriov_enable_vfs() can't be used as-is, then instead of
adding local static function here, better option would be to add to the
lib something like __igt_sriov_enable_vfs() that will not abort

then we will be able to keep a 'VFs enabling logic' in one place

> +	sriov_enable_vfs(fd, num_vfs);
> +
> +	igt_assert_eq(-errno, INJECT_ERRNO);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +
> +	if (autoprobe)
> +		igt_sriov_enable_driver_autoprobe(fd);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -319,6 +370,10 @@ igt_main
>  		{ "xe_vma_ops_alloc" },
>  		{ }
>  	};
> +	const struct section enable_vfs_fail_functions[] = {
> +		{ "xe_guc_ct_send_recv" },

what about adding failures at:

	xe_ggtt_node_insert
	xe_bo_create_pin_map
	xe_guc_id_mgr_reserve
	xe_guc_db_mgr_reserve_range

> +		{ }
> +	};
>  
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
> @@ -335,6 +390,13 @@ igt_main
>  		igt_subtest_f("vm-bind-fail-%s", s->name)
>  			vm_bind_fail(fd, s->name);
>  
> +	for (const struct section *s = enable_vfs_fail_functions; s->name; s++)
> +		igt_subtest_f("enable-vfs-fail-%s", s->name) {
> +			/* Skip the test if not running with SRIOV */
> +			igt_require(igt_sriov_is_pf(fd));

shouldn't we just try to *not* define this subtest if not being a PF?
something like:

	if (igt_sriov_is_pf(fd))
		for_each_section(s, enable_vfs_fail_functions)
			igt_subtest_f("enable-vfs-fail-%s", s->name)

> +			enable_vfs_fail(fd, NUM_VFS, s->name);
> +		}
> +
>  	igt_fixture {
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>  	}

