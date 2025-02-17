Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A4AC021AB
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 15:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FE910E25F;
	Mon, 17 Feb 2025 15:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqG/7QTA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E2B10E25F
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 15:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739805242; x=1771341242;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=PVw/Xpd4RYLjaJkjIje8vPWCI6uz/ps0gg2vq3N0oP4=;
 b=UqG/7QTAdgEkOpC22UIBm7ZaN9PgUc0hZ4vgvmTA0HYfcybzoKLvjItY
 sHKCXpYtxc4hH+RNOvXCXZpok7T2+VUR5keFr9WglGAFzLtfgDt+wmtAs
 NlCoQQbVGfSnfHHJSLTRDC9EinoXogc50vpxFbye3IejBh1m7kdvftT1l
 sukO2MCoqYi0E0mopEOEs8Q5p6vZC8hSTCsVsI51oPaV+v5TQHjlghT/M
 w+0XMSBA7Ib6XA7+6SlLpBaCbPPf30sAy5Ks15JYigbD+VSn+yUeCyK4y
 dUra7YUxaVfdgAaz/ILwe8RxBnVUL0Zxp5fOWiYF8cHU6ENbF8kyLj77q Q==;
X-CSE-ConnectionGUID: xwmrPjr1S0iWnqoqmuaJdQ==
X-CSE-MsgGUID: lSq1aSCaSimluZXBAu2kyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40412498"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="40412498"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 07:14:02 -0800
X-CSE-ConnectionGUID: Cj0Klp7uSSuT9dwO2LHfug==
X-CSE-MsgGUID: lcd5bI8ETCikSnLnqNexqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115034898"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.192])
 ([10.245.246.192])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 07:13:59 -0800
Message-ID: <c1ccdc04-1a17-4f3c-97f1-7dd7eb499610@intel.com>
Date: Mon, 17 Feb 2025 16:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/xe_eudebug.c: Add subtests for
 eudebug/SR-IOV exlusion
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Laguna@freedesktop.org, Lukasz <lukasz.laguna@intel.com>,
 Wajdeczko@freedesktop.org, Michal <Michal.Wajdeczko@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20250214124643.20908-1-christoph.manszewski@intel.com>
 <20250214124643.20908-3-christoph.manszewski@intel.com>
 <20250217143612.7wyvfw7ys3jm47th@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250217143612.7wyvfw7ys3jm47th@kamilkon-desk.igk.intel.com>
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

Hi Kamil,

On 17.02.2025 15:36, Kamil Konieczny wrote:
> Hi Christoph,
> On 2025-02-14 at 13:46:43 +0100, Christoph Manszewski wrote:
> 
> please remove file suffix from subject, also fix typo:
> 
> tests/xe_eudebug: Add subtests for eudebug/SR-IOV exclusion

Sure, will do.

> 
> More nits below.
> 
>> Eudebug is not supported in PF mode with VFs enabled and in VF mode.
>> Provide subtests to ensure that:
>>    1. enabling eudebug is not permitted in PF mode with VFs enabled
>>    2. eudebug sysfs toggle is not available in VF mode
>>    3. enabling VFs is not permitted when eudebug is enabled
>>
>> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
>> ---
>>   tests/intel/xe_eudebug.c | 123 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 123 insertions(+)
>>
>> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
>> index 76870805c..c2f32c03b 100644
>> --- a/tests/intel/xe_eudebug.c
>> +++ b/tests/intel/xe_eudebug.c
>> @@ -20,7 +20,9 @@
>>   #include <sys/prctl.h>
>>   
>>   #include "igt.h"
>> +#include "igt_sysfs.h"
>>   #include "intel_pat.h"
>> +#include "lib/igt_sriov_device.h"
>>   #include "lib/igt_syncobj.h"
>>   #include "xe/xe_eudebug.h"
>>   #include "xe/xe_ioctl.h"
>> @@ -2710,12 +2712,133 @@ static void test_basic_exec_queues_enable(int fd)
>>   	xe_vm_destroy(fd, vm_non_lr);
>>   }
>>   
>> +static bool has_enable_eudebug_attr(int pf_fd, unsigned int vf_num)
>> +{
>> +	char path[PATH_MAX];
>> +	int sysfs;
>> +	bool ret;
>> +
>> +	igt_assert(vf_num > 0);
>> +
>> +	sysfs = igt_sysfs_open(pf_fd);
>> +	igt_assert_fd(sysfs);
>> +	/* vf_num is 1-based, but virtfn is 0-based */
>> +	snprintf(path, sizeof(path), "device/virtfn%u/enable_eudebug", vf_num - 1);
>> +	ret = igt_sysfs_has_attr(sysfs, path);
>> +	close(sysfs);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * SUBTEST: deny-eudebug
>> + * Description:
>> + *	Check that eudebug toggle is not available for VFs, and that enabling
>> + *	eudebug with VFs enabled is not permitted.
>> + */
>> +static void test_deny_eudebug(int pf_fd)
>> +{
>> +	unsigned int num_vfs = igt_sriov_get_total_vfs(pf_fd);
>> +	bool eudebug_enable = true;
>> +	bool err = false;
>> +	int ret = 0;
>> +
>> +	igt_debug("Testing %u VFs\n", num_vfs);
>> +
>> +	igt_sriov_enable_driver_autoprobe(pf_fd);
>> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
>> +	igt_assert_eq(num_vfs, igt_sriov_get_enabled_vfs(pf_fd));
>> +
>> +	for (int vf_num = 1; vf_num <= num_vfs; ++vf_num) {
>> +		if (!igt_sriov_is_vf_drm_driver_probed(pf_fd, vf_num)) {
>> +			igt_debug("VF%u probe failed\n", vf_num);
>> +			err = true;
>> +		} else if (has_enable_eudebug_attr(pf_fd, vf_num)) {
>> +			igt_debug("VF%u has enable_eudebug attribute\n", vf_num);
>> +			err = true;
>> +		}
>> +	}
>> +
>> +	if (err) {
>> +		igt_sriov_disable_vfs(pf_fd);
>> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
>> +		igt_fail_on(err);
>> +	}
>> +
>> +	ret = __xe_eudebug_enable_getset(pf_fd, NULL, &eudebug_enable);
>> +	igt_assert_eq(ret, -1);
>> +	igt_assert_eq(errno, EPERM);
>> +
>> +	igt_sriov_disable_vfs(pf_fd);
>> +	igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
>> +}
>> +
>> +/**
>> + * SUBTEST: deny-sriov
>> + * Description:
>> + *	Check that VFs cannot be enabled when eudebug is enabled.
>> + */
>> +static void test_deny_sriov(int pf_fd)
>> +{
>> +	unsigned int num_vfs = igt_sriov_get_total_vfs(pf_fd);
>> +	bool ret = false;
>> +	int sysfs = 0;
>> +
>> +	igt_debug("Testing %u VFs\n", num_vfs);
>> +
>> +	sysfs = igt_sysfs_open(pf_fd);
>> +	igt_assert_fd(sysfs);
>> +
>> +	ret = __igt_sysfs_set_u32(sysfs, "device/sriov_numvfs", num_vfs);
>> +	close(sysfs);
>> +
>> +	if (!ret) {
>> +		igt_sriov_disable_vfs(pf_fd);
>> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
>> +	}
>> +	igt_assert_eq(ret, false);
>> +	igt_assert_eq(errno, EPERM);
>> +}
>> +
>>   igt_main
>>   {
>>   	bool was_enabled;
>>   	bool *multigpu_was_enabled;
>>   	int fd, gpu_count;
>>   
>> +	/* sriov exclusivity */
>> +	igt_subtest_group {
>> +		igt_fixture {
>> +			fd = drm_open_driver(DRIVER_XE);
>> +			igt_require(igt_sriov_is_pf(fd));
>> +			igt_require(igt_sriov_vfs_supported(fd));
>> +			igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
> 
> Move all these igt_require into each subtest which needs them.

But why? This subtest group is for sriov related tests.

> 
>> +		}
>> +
>> +		igt_subtest("deny-eudebug") {
>> +			bool vf_autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
>> +
>> +			was_enabled = xe_eudebug_enable(fd, false);
>> +			test_deny_eudebug(fd);
>> +			xe_eudebug_enable(fd, was_enabled);
> 
> This will not run if test_deny_eudebug() will trigger igt_assert.
> 
>> +
>> +			vf_autoprobe ? igt_sriov_enable_driver_autoprobe(fd) :
>> +				       igt_sriov_disable_driver_autoprobe(fd);
>> +			igt_abort_on_f(vf_autoprobe != igt_sriov_is_driver_autoprobe_enabled(fd),
>> +				       "Failed to restore sriov_drivers_autoprobe value\n");
>> +		}
>> +
>> +		igt_subtest("deny-sriov") {
>> +			was_enabled = xe_eudebug_enable(fd, true);
>> +			test_deny_sriov(fd);
>> +			xe_eudebug_enable(fd, was_enabled);
> 
> This will not run if test_deny_sriov() will trigger igt_assert.

Sure, will move it into the fixture, along with the aborts for disabling 
vfs.

> 
>> +		}
>> +
>> +		igt_fixture {
>> +			close(fd);
> 
> Why closing when just below you will open it?

Well I introduced it as a separate subtest group, I wanted to keep the 
fixtures isolated. How do you propose to handle it? I could create an 
additional top level fixture at the begginging for opening.

Thanks,
Christoph

> 
> Regards,
> Kamil
> 
>> +		}
>> +	}
>> +
>>   	igt_fixture {
>>   		fd = drm_open_driver(DRIVER_XE);
>>   		was_enabled = xe_eudebug_enable(fd, true);
>> -- 
>> 2.34.1
>>
