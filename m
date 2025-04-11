Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FA4C369A8
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 12:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B2210E25A;
	Fri, 11 Apr 2025 12:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljKVE2qc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2072A10E25A
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 12:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744374060; x=1775910060;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W2jqTI1KsqZOLGaAcWluVZVyVlDVS9Rf7fT4yCoZxhg=;
 b=ljKVE2qciq0YysUj49IePtqcOoWm528AG1e4aFqOcSGoMXBHQhKclaMZ
 oYrgP8++0zKyok3NLCgTA9ZK4AuUOTilFVKzQKbQaJFlSITioGs8oe1JB
 GjIs2ZwcI2JqTWd6Eup59nKR5i/wkw5x7AYLb1/TbGQ74sRrY4tRE/icY
 Zg7sgvX8ZCqzs855d0U1QzJVrGGWgFUxBsA0WAkdYGSzq2UUdH9QRzoAX
 oPYttnXq1JC9E8pZvndqMWZE/+STrhC/3/AlnklL+wKdud6XXKBbKqM3G
 QIfqP0QNg2SQL+wPvmOoIXuMU0kxRHneCTqbxq72vU4bZel9IOpNhDCNN A==;
X-CSE-ConnectionGUID: pfO8KjlXSF+cDxPg24Eqcw==
X-CSE-MsgGUID: uRF8TCGiQPmKloZ1hSYeeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45813794"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="45813794"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 05:21:00 -0700
X-CSE-ConnectionGUID: v4tnr2z6Szi96OrkCNjgJQ==
X-CSE-MsgGUID: qXCA1MbzSGeBjdMs19wNlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="129051479"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 05:20:58 -0700
Date: Fri, 11 Apr 2025 14:20:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, dominik.karol.piatkowski@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Message-ID: <20250411122042.xnzmy4wtdx6fqvs2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, dominik.karol.piatkowski@intel.com,
 kamil.konieczny@intel.com
References: <20250410091715.2611957-1-sobin.thomas@intel.com>
 <20250410091715.2611957-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410091715.2611957-2-sobin.thomas@intel.com>
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

Hi Sobin,
On 2025-04-10 at 09:17:15 +0000, Sobin Thomas wrote:
> This test validates that invalid string inputs are correctly rejected
> by engine sysfs write. It ensures that the property values remain
> unchanged when invalid inputs are provided.
> 
> v6: Fixed string termination logic in generate_random_string. (kamil)
> 
> v5: Fixed documentation and fixed error.
> 
> v4: Added subtests to test large (4k) random strings (kamil).
> Replaced igt macro.
> 
> v3: Fixed the test logic. Fixed the tabs
> 
> v2: Added error check for return values for igt_sysfs_scanf and
> igt_sysfs_printf. Removed the changes for fault injection in
> tests/intel/xe_fault_injection.c
> 
> v1: Initial changes for checking error string.
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>

This is repeated s-o-b, please do not add them twice nor more,
no need for resend as this could be corrected at merge.
Btw please do use script checkpatch.pl from Linux kernel, it
can spot such issues as in this case there are more - whitespace
errors (also could be corrected at merge with help of script).

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Please wait for Xe.CI.Full results and if a fail please check
them and reply with Cc to bug filing. After that it could be
merged.

Regards,
Kamil

> ---
>  tests/intel/xe_sysfs_scheduler.c | 99 ++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
> index 4fc764f82..faafabd29 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -15,6 +15,16 @@
>   *		unrepresentable intervals.
>   * Test category: negative test
>   *
> + * SUBTEST: %s-invalid-string
> + * Description: Test to check if %s arg[1] schedule parameter checks for
> + *		invalid string values.
> + * Test category: negative test
> + *
> + * SUBTEST: %s-invalid-large-string
> + * Description: Test to check if %s arg[1] schedule parameter checks for
> + *		large invalid strings (4k).
> + * Test category: negative test
> + *
>   * SUBTEST: %s-min-max
>   * Description: Test to check if %s arg[1] schedule parameter checks for
>   *		min max values.
> @@ -39,6 +49,47 @@
>  #include "xe_drm.h"
>  #include "xe/xe_query.h"
>  
> +#define STR_LENGTH 4096
> +
> +/**
> + * generate_random_string:
> + * @str: pointer to string buffer that will be having random string generated.
> + * @length: length of string to generate.
> + *
> + * Generates random string that will always contain non-numerical characters.
> + */
> +static void generate_random_string(char *str, size_t length)
> +{
> +	int type = 0;
> +	int digit_count = 0;
> +	int max_digits = length / 4;
> +	int loop_count = length - 1;
> +
> +	for (size_t i = 0; i < loop_count; i++) {
> +		if (digit_count >= max_digits)
> +			type = rand() % 2;
> +		else
> +			type = rand() % 3;
> +
> +		switch (type) {
> +		case 0:
> +			str[i] = 'A' + (rand() % 26);
> +			break;
> +		case 1:
> +			str[i] = 'a' + (rand() % 26);
> +			break;
> +		case 2:
> +			str[i] = '0' + (rand() % 10);
> +			digit_count++;
> +			break;
> +		default:
> +			str[i] = '_';
> +			break;
> +		}
> +	}
> +	str[length - 1] = '\0';
> +}
> +
>  static void test_invalid(int xe, int engine, const char **property,
>  			 uint16_t class, int gt)
>  {
> @@ -121,6 +172,52 @@ static void test_min_max(int xe, int engine, const char **property,
>  	igt_assert_eq(set, default_max);
>  }
>  
> +static void test_invalid_string(int xe, int engine, const char **property,
> +				 uint16_t class, int gt)
> +{
> +	unsigned int saved, set;
> +	static const char invalid_input[] = "999abc";
> +
> +	for (int i = 0; i < 3; i++) {
> +		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u", &saved), 1);
> +		igt_info("Initial %s: %u\n", property[i], saved);
> +		/* Assert if the invalid write is returning negative error */
> +		igt_assert_lt(igt_sysfs_printf(engine, property[i], "%s",
> +			      invalid_input), 0);
> +
> +		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u", &set), 1);
> +		/* Check if the values are unchanged. */
> +		igt_assert_eq(set, saved);
> +	}
> +}
> +
> +static void test_invalid_large_string(int xe, int engine, const char **property,
> +				       uint16_t class, int gt)
> +{
> +	unsigned int saved, set;
> +	char *random_str;
> +
> +	random_str = (char *)malloc(sizeof(char) * (STR_LENGTH));
> +	igt_assert_f(random_str, "Memory allocation failed\n");
> +
> +	generate_random_string(random_str, STR_LENGTH);
> +	igt_debug("Generated random string: %.10s...\n", random_str);
> +
> +	for (int i = 0; i < 3; i++) {
> +		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u", &saved), 1);
> +		igt_info("Initial %s: %u\n", property[i], saved);
> +
> +		/* Assert if the invalid write is returning negative error */
> +		igt_assert_lt(igt_sysfs_printf(engine, property[i], "%s",
> +			      random_str), 0);
> +
> +		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u", &set), 1);
> +		/* Check if the values are unchanged. */
> +		igt_assert_eq(set, saved);
> +	}
> +	free(random_str);
> +}
> +
>  #define MAX_GTS 8
>  igt_main
>  {
> @@ -129,6 +226,8 @@ igt_main
>  		void (*fn)(int, int, const char **, uint16_t, int);
>  	} tests[] = {
>  		{ "invalid", test_invalid },
> +		{ "invalid-string", test_invalid_string },
> +		{ "invalid-large-string", test_invalid_large_string },
>  		{ "min-max", test_min_max },
>  		{ }
>  	};
> -- 
> 2.34.1
> 
