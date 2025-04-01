Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD194C36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 13:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3875910E57E;
	Tue,  1 Apr 2025 13:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDCvAOLo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AB210E57E
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 13:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743513685; x=1775049685;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MoR2uaKzUQNNlQOf2dSXcPBnkLs7o1e0Ck8LZyOpvRQ=;
 b=BDCvAOLoJa7HfCwJvYn+vcjYu4LEjis3iBwY30s68H4gEfvCwxwI+GDR
 y+fu/zlSXUQMw2VHP9cdF8qubrkQ0RRl2VKAFoORDBR9uWv1elUbwV94a
 OXH97sgw1PTwu0k1z+ml7vqREqXpdKea86/AQrb1d2iBKPwr7ZCEiZWw2
 6YDrlVr10r0OpzN6sh1q3iuHQtPDyofj5cgI+e35CGX6Fo0uI1DfEU9sU
 pjC016usHPb5uAF5+EL94q0TU2zBGdIs7RsgwlqYktafBIOngMXsclZhJ
 BDfpxxaFo1+YqS9hzya80DbVESVhw91fu2onQL6XyUrJUghPXyT4/jy2K g==;
X-CSE-ConnectionGUID: s2kaEWloQjyB3qS4uYrQ8A==
X-CSE-MsgGUID: buJ2HCgPRnCbWIjJ19N28Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="56204301"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="56204301"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 06:21:20 -0700
X-CSE-ConnectionGUID: o8kPAaRhQQaEnIWUrBsWIw==
X-CSE-MsgGUID: UVWdneVkT4WD4iCIUUyrfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="130520296"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 06:21:18 -0700
Date: Tue, 1 Apr 2025 15:21:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 dominik.karol.piatkowski@intel.com
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Message-ID: <20250401132116.cipzcybnd7kir2tf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 dominik.karol.piatkowski@intel.com
References: <20250331142749.1821941-1-sobin.thomas@intel.com>
 <20250331142749.1821941-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250331142749.1821941-2-sobin.thomas@intel.com>
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

Hi replace_with,
On 2025-03-31 at 14:27:49 +0000, replace_with Sobin Thomas wrote:
> From: Sobin Thomas <sobin.thomas@intel.com>

one nit about configuring your mailer, please remove 'replace_with'
from it, now in a header there is From: with:

replace_with Sobin Thomas <sobin.thomas@intel.com>

and this should be just:

Sobin Thomas <sobin.thomas@intel.com>

Few more nits in addition to what Dominik Karol already wrote.

> 
> This test validates that invalid string inputs are correctly rejected
> by engine sysfs write. It ensures that the property values remain
> unchanged when invalid inputs are provided.
> 
> v2: Added error check for return values for igt_sysfs_scanf and
> igt_sysfs_printf. Removed the changes for fault injection in
> tests/intel/xe_fault_injection.c
> 
> v1: Initial changes for checking error string.
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_sysfs_scheduler.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
> index 4fc764f82..594c51d44 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -10,6 +10,11 @@
>   * Sub-category: SysMan tests
>   * Functionality: scheduler control interface
>   *
> + * SUBTEST: %s-invalid-string
> + * Description: Test to check if %s arg[1] schedule parameter checks for
> + * min max values.
> + * Test category: Negative string test
> + *
>   * SUBTEST: %s-invalid
>   * Description: Test to check if %s arg[1] schedule parameter rejects any
>   *		unrepresentable intervals.
> @@ -121,6 +126,29 @@ static void test_min_max(int xe, int engine, const char **property,
>  	igt_assert_eq(set, default_max);
>  }
>  
> +static void test_invalid_string(int xe, int engine, const char **property,
> +				uint16_t class, int gt)
> +{
> +	unsigned int saved, set;
> +	char invalid_input[] = "999abc";

If we start to test it, why not allocate more than one page here
and fill it with gargabe from rand() ? I mean letters from a....zA...Z
That big overflow attempt could be a separate subtest, also with all
letters and/or digits.

> +
> +	for (int i = 0; i < 3; i++) {
> +		igt_assert(igt_sysfs_scanf(engine, property[i], "%u", &saved) == 1);
> +		igt_info("Initial %s: %u\n", property[i], saved);
> +		if (igt_sysfs_printf(engine, property[i], "%s", invalid_input) > 0) {
> +			igt_critical("invalid value %s can be set to property %s\n",
> +					invalid_input, property[i]);
> +			continue;

Better to assert here, did you run this on real hardware?
Please test it yourself with igt_runner and as standalone run with

sudo ./xe_sysfs_scheduler.c --r invalid-string

> +		}
> +
> +		igt_assert(igt_sysfs_scanf(engine, property[i], "%u", &set) == 0);
> +
> +		//Check if the values are unchanged.

Please use rather C-style comments or remove this line:
		/* Check if the values are unchanged */

> +		igt_assert_eq(set, saved);
> +	}
> +}
> +
> +
>  #define MAX_GTS 8
>  igt_main
>  {
> @@ -130,6 +158,7 @@ igt_main
>  	} tests[] = {
>  		{ "invalid", test_invalid },
>  		{ "min-max", test_min_max },
> +		{ "invalid-string", test_invalid_string },

This should be in alphabetical order, so before 'min-max'.

Regards,
Kamil

>  		{ }
>  	};
>  
> -- 
> 2.34.1
> 
