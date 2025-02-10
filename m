Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A22C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 10:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C1A10E0E0;
	Mon, 10 Feb 2025 10:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJui9fhm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4FD10E0E0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739184778; x=1770720778;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vYwwHBZFPGRy5B04xd8dup8exRyi3jtp5vZhWHRh7oM=;
 b=XJui9fhmi54NaZLq6IW0sIY7+N2xDb4yqc7pIa6fErDXecsl6TX24ihq
 mwpY5arg2wiszAJUJBkg62XqDVTgugKyfRHkSpFq4FBVPujjOPeYOqXae
 yNFTFbQqUSocsEDXjZCc3l3EFqdkBy+Mzz6akd+ONseJ/jxQ+qqHZUTzT
 enGUyaJBhM30L1RhDRh1ok0NIWVaW2JFq02pncrFvnlWH/dU+cudcRiAk
 JuR4IOo/tAD0Z2HpEz/jJQ1B1pKnsEKzCNIUMyN4Br01MHW3sS3s6rH5F
 2IiYdSEdGGIAxTuD9wv2KcoxAV1Ul+vN8emzRL8v5x5c4lUPmzD8h/ZmY Q==;
X-CSE-ConnectionGUID: Hy4QvqMDQR+QakIT+xGV3A==
X-CSE-MsgGUID: uy1fk9WHS3GtmtMNmQBQFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39645993"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="39645993"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 02:52:57 -0800
X-CSE-ConnectionGUID: 3J+ZPGGQROyjF7bn8RIZQw==
X-CSE-MsgGUID: vFPPLG+mTZWeHbimdU6EUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="117218801"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.99.135])
 ([10.245.99.135])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 02:52:55 -0800
Message-ID: <705dd045-3444-45ce-b9ba-c78191b63aff@linux.intel.com>
Date: Mon, 10 Feb 2025 11:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/4] tests/xe_sriov_auto_provisioning: Add
 subtest to verify VF's configuration
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
References: <20250207094031.15942-1-lukasz.laguna@intel.com>
 <20250207094031.15942-5-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250207094031.15942-5-lukasz.laguna@intel.com>
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



On 2/7/2025 10:40 AM, Lukasz Laguna wrote:
> Added subtest checks if configuration data that VF got from GuC during
> probe is the same as provisioned.
> 
> v2:
>   - add missing flag in subtest function call (Marcin)
>   - fix VFs range in subtest definition (Lukasz)
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel/xe_sriov_auto_provisioning.c | 123 ++++++++++++++++++++++-
>   1 file changed, 121 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
> index e13eb3644..c95e8fc08 100644
> --- a/tests/intel/xe_sriov_auto_provisioning.c
> +++ b/tests/intel/xe_sriov_auto_provisioning.c
> @@ -33,6 +33,18 @@
>    * SUBTEST: exclusive-ranges
>    * Description:
>    *   Verify that ranges of auto-provisioned resources are exclusive
> + *
> + * SUBTEST: selfconfig-basic
> + * Description:
> + *   Check if VF configuration data is the same as provisioned
> + *
> + * SUBTEST: selfconfig-reprovision-increase-numvfs
> + * Description:
> + *   Check if VF configuration data is updated properly after increasing number of VFs
> + *
> + * SUBTEST: selfconfig-reprovision-reduce-numvfs
> + * Description:
> + *   Check if VF configuration data is updated properly after decreasing number of VFs
>    */
>   
>   IGT_TEST_DESCRIPTION("Xe tests for SR-IOV auto-provisioning");
> @@ -216,6 +228,70 @@ static void exclusive_ranges(int pf_fd, unsigned int num_vfs)
>   	igt_fail_on_f(fails, "exclusive ranges check failed\n");
>   }
>   
> +#define REPROVISION_INCREASE_NUMVFS	(0x1 << 0)
> +#define REPROVISION_REDUCE_NUMVFS	(0x1 << 1)
> +
> +static void check_selfconfig(int pf_fd, unsigned int vf_num, unsigned int flags)
> +{
> +	unsigned int gt_num, total_vfs = igt_sriov_get_total_vfs(pf_fd);
> +	uint64_t provisioned, queried;
> +	enum xe_sriov_shared_res res;
> +	int vf_fd, fails = 0;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, (flags & REPROVISION_REDUCE_NUMVFS) ? total_vfs : vf_num);
> +	igt_sriov_enable_driver_autoprobe(pf_fd);
> +
> +	igt_sriov_bind_vf_drm_driver(pf_fd, vf_num);
> +	vf_fd = igt_sriov_open_vf_drm_device(pf_fd, vf_num);
> +	igt_assert_fd(vf_fd);
> +
> +	xe_for_each_gt(pf_fd, gt_num) {
> +		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt_num) {
> +			provisioned = xe_sriov_pf_get_provisioned_quota(pf_fd, res, vf_num,
> +									gt_num);
> +			queried = xe_sriov_vf_debugfs_get_selfconfig(vf_fd, res, gt_num);
> +
> +			if (igt_debug_on_f(provisioned != queried,
> +					   "%s selfconfig check failed on gt%u\n",
> +					   xe_sriov_shared_res_to_string(res), gt_num))

  CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis

> +				fails++;
> +		}
> +	}
> +
> +	close(vf_fd);
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	if (flags && !fails) {
> +		igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_sriov_enable_vfs(pf_fd, (flags & REPROVISION_INCREASE_NUMVFS) ? total_vfs :
> +										    vf_num);
> +		igt_sriov_enable_driver_autoprobe(pf_fd);
> +
> +		igt_sriov_bind_vf_drm_driver(pf_fd, vf_num);
> +		vf_fd = igt_sriov_open_vf_drm_device(pf_fd, vf_num);
> +		igt_assert_fd(vf_fd);
> +
> +		xe_for_each_gt(pf_fd, gt_num) {
> +			xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt_num) {
> +				provisioned = xe_sriov_pf_get_provisioned_quota(pf_fd, res, vf_num,
> +										gt_num);
> +				queried = xe_sriov_vf_debugfs_get_selfconfig(vf_fd, res, gt_num);
> +
> +				if (igt_debug_on_f(provisioned != queried,
> +						"%s selfconfig check after reprovisioning failed on gt%u\n",
> +						xe_sriov_shared_res_to_string(res), gt_num))
> +					fails++;
> +			}
> +		}
> +
> +		close(vf_fd);
> +		igt_sriov_disable_vfs(pf_fd);
> +	}
> +
> +	igt_fail_on_f(fails, "selfconfig check failed\n");
> +}
> +
>   static bool extended_scope;
>   
>   static int opts_handler(int opt, int opt_index, void *data)
> @@ -242,9 +318,17 @@ static const char help_str[] =
>   igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   {
>   	enum xe_sriov_shared_res res;
> -	unsigned int gt;
> +	unsigned int gt, total_vfs;
>   	bool autoprobe;
>   	int pf_fd;
> +	static struct subtest_variants {
> +		const char *name;
> +		unsigned int flags;
> +	} reprovisioning_variant[] = {
> +		{ "increase", REPROVISION_INCREASE_NUMVFS },
> +		{ "reduce", REPROVISION_REDUCE_NUMVFS },
> +		{ NULL },
> +	};
>   
>   	igt_fixture {
>   		struct xe_sriov_provisioned_range *ranges;
> @@ -264,6 +348,7 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   			}
>   		}
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +		total_vfs = igt_sriov_get_total_vfs(pf_fd);
>   	}
>   
>   	igt_describe("Verify that auto-provisioned resources are allocated by PF driver in fairly manner");
> @@ -298,7 +383,6 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   
>   	igt_describe("Verify that ranges of auto-provisioned resources are exclusive");
>   	igt_subtest_with_dynamic_f("exclusive-ranges") {
> -		unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
>   
>   		igt_skip_on(total_vfs < 2);
>   
> @@ -315,6 +399,41 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   		}
>   	}
>   
> +	igt_describe("Check if VF configuration data is the same as provisioned");
> +	igt_subtest_with_dynamic("selfconfig-basic") {
> +		if (extended_scope)
> +			for_each_sriov_vf(pf_fd, vf)
> +				igt_dynamic_f("vf-%u", vf)
> +					check_selfconfig(pf_fd, vf, 0);
> +
> +		for_random_sriov_vf(pf_fd, vf) {
> +			igt_dynamic_f("vf-random") {
> +				igt_debug("vf=%u\n", vf);
> +				check_selfconfig(pf_fd, vf, 0);
> +			}
> +		}
> +	}
> +
> +	for (const struct subtest_variants *s = reprovisioning_variant; s->name; s++) {
> +		igt_describe("Check if VF configuration data is the same as reprovisioned");
> +		igt_subtest_with_dynamic_f("selfconfig-reprovision-%s-numvfs", s->name) {
> +
> +			igt_require(total_vfs > 1);
> +
> +			if (extended_scope)
> +				for_each_sriov_vf_in_range(pf_fd, 1, total_vfs - 1, vf)
> +					igt_dynamic_f("vf-%u", vf)
> +						check_selfconfig(pf_fd, vf, s->flags);
> +
> +			for_random_sriov_vf_in_range(pf_fd, 1, total_vfs - 1, vf) {
> +				igt_dynamic_f("vf-random") {
> +					igt_debug("vf=%u\n", vf);
> +					check_selfconfig(pf_fd, vf, s->flags);
> +				}
> +			}
> +		}
> +	}
> +

LGTM, with one indentation correction,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   	igt_fixture {
>   		igt_sriov_disable_vfs(pf_fd);
>   		/* abort to avoid execution of next tests with enabled VFs */

