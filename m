Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C0BC02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 09:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8623610E216;
	Tue, 21 Jan 2025 09:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T653M6ta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E0310E216
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737453117; x=1768989117;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=exsp1r/dU5yrICs7RFr3x7YjB/KsLw1MxZJCYZbeFHU=;
 b=T653M6ta6bsejkNySr0wVbdWkFvl4jihCkDOq6xZud0HZfllGPh/tgLD
 h44YtSh4uCfSC1mD1a/QPAcPIS/V/Mib41zmyi8OQ6dIibKQ6UphN7+QT
 2D04Gr9NY04wvzrZJA5dySv8H+xNSHu3gXLjeVT0tpHRdCHK2InM8iorB
 7kuk1odr3myZMGYBDlBlESssyvclUkA0r/HOPXXNlXJ34yDmvMWQpwbj2
 JIE3BHfH1SmyBl8Ew4zY9CUuhFKaADzNgzSaQjbFHRG8s+ook3NaF+27N
 u6PNqIoCaDShZY96Vyp3CqnGvdTpKXgZq4Njbb4ScVgEehGKVcNyyZA8W w==;
X-CSE-ConnectionGUID: JO2/CstGSc679PDF+cDJlQ==
X-CSE-MsgGUID: UaGHrpWdQ9CzELQM2r7Bsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="55407122"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="55407122"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 01:51:57 -0800
X-CSE-ConnectionGUID: My9JcYBBTOGe+haxLih1ew==
X-CSE-MsgGUID: f40SrLolQfGC8ISXjz1aYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111374210"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.18.132])
 ([10.246.18.132])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 01:51:55 -0800
Message-ID: <5c952476-2810-4937-ad16-397c0f2e5c17@linux.intel.com>
Date: Tue, 21 Jan 2025 10:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/xe_fault_injection: Inject
 errors during xe_guc_ct_send_recv
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250120122835.10511-1-satyanarayana.k.v.p@intel.com>
 <20250120122835.10511-3-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250120122835.10511-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 1/20/2025 1:28 PM, Satyanarayana K V P wrote:
> Use the kernel fault injection infrastructure to test error handling
> of xe at enabling of VFs stage when executing xe_guc_ct_send_recv()
> so that more code paths are tested, such as error handling and unwinding.
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
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 63 ++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 3a0e2aa29..81ecc1131 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -19,12 +19,14 @@
>   #include "igt_sysfs.h"
>   #include "lib/igt_syncobj.h"
>   #include "lib/intel_pat.h"
> +#include "lib/igt_sriov_device.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
>   
>   #define INJECT_ERRNO	-ENOMEM
>   #define BO_ADDR		0x1a0000
>   #define BO_SIZE		(1024*1024)
> +#define NUM_VFS		1
>   
>   enum injection_list_action {
>   	INJECTION_LIST_ADD,
> @@ -281,6 +283,55 @@ vm_bind_fail(int fd, const char function_name[])
>   	igt_assert_eq(simple_vm_bind(fd, vm), 0);
>   }
>   
> +static int sriov_enable_vfs(int fd, int num_vfs)
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
> +	bool autoprobe_en = 0;

NIT: maybe just bool autoprobe = 0 ?

> +
> +	ignore_faults_in_dmesg(function_name);
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +
> +	autoprobe_en = igt_sriov_is_driver_autoprobe_enabled(fd);
> +
> +	if (autoprobe_en)
> +		igt_sriov_disable_driver_autoprobe(fd);
> +
> +	/* igt_sriov_enable_vfs can't be used here as it is causing abort on any error.
> +	 * Since error in this test is expected, we have written our own static function here.
> +	 */
> +	sriov_enable_vfs(fd, num_vfs);
> +
> +	igt_assert_eq(-errno, INJECT_ERRNO);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +
> +	if (autoprobe_en)
> +		igt_sriov_enable_driver_autoprobe(fd);
> +}
> +
>   igt_main
>   {
>   	int fd;
> @@ -319,6 +370,10 @@ igt_main
>   		{ "xe_vma_ops_alloc" },
>   		{ }
>   	};
> +	const struct section enable_vfs_fail_functions[] = {
> +		{ "xe_guc_ct_send_recv" },
> +		{ }
> +	};
>   
>   	igt_fixture {
>   		igt_require(fail_function_injection_enabled());
> @@ -335,6 +390,14 @@ igt_main
>   		igt_subtest_f("vm-bind-fail-%s", s->name)
>   			vm_bind_fail(fd, s->name);
>   
> +	for (const struct section *s = enable_vfs_fail_functions; s->name; s++)
> +		igt_subtest_f("enable-vfs-fail-%s", s->name) {
> +			/* Skip the test if not running with SRIOV
> +			 */
> +			igt_skip_on(!igt_sriov_is_pf(fd));

NIT: Using igt_require without negation improves readability

igt_require(igt_sriov_is_pf(fd));

> +			enable_vfs_fail(fd, NUM_VFS, s->name);
> +		}
> +
>   	igt_fixture {
>   		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>   	}

With small nits,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
