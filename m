Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D71C36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 16:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B55B10E040;
	Wed,  9 Apr 2025 16:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TldN2wCl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E11810E040
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 16:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744215286; x=1775751286;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JgxbLUSd2AIjXzenmEoiieRoDBJfx4Y/Lr9ac+Yf14U=;
 b=TldN2wClbO3aAHp2yO87Tocl8lGkN/yv3V1BRPyDPmt5qQY79nIUevfW
 XKdRFINQdseRwKFbkHlwo96ZSHXwIBaHi8/hTvIGxnN40YOjNzsS0db/X
 pZv9eX7gi2IJlp/Xont9iPzuZH6ucyCm7d20E0CJitXgcJPimpTu8c7PX
 00xsmpWks2rUrf463zke30iaXhq80UmdAW97Woiuw30bMOPYdB73JqNoo
 d6io7dCpZ8HgZKKvPs+lH7YXjskIph66MyfI/dNjN7XuLy2uOkUspgj9k
 kPNnBpO7zcnMGEjA7FV7p4Ib+aeJYIIkfvRQuZ8Cf3wYYFfRLl+03V21O g==;
X-CSE-ConnectionGUID: 9pIr2vRQR3SjfdUy0GutZA==
X-CSE-MsgGUID: v7eWh+75S4erFCIFT20gcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="56684729"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="56684729"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 09:14:46 -0700
X-CSE-ConnectionGUID: XSb204BVQfyyE2gR1L3gdg==
X-CSE-MsgGUID: TyxusrZPRmmxeIfbibwBjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="132759965"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 09:14:45 -0700
Date: Wed, 9 Apr 2025 18:14:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, dominik.karol.piatkowski@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH v5 i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Message-ID: <20250409161429.n5e42tmnytiyee3u@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, dominik.karol.piatkowski@intel.com,
 kamil.konieczny@intel.com
References: <20250409022217.2292395-1-sobin.thomas@intel.com>
 <20250409022217.2292395-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250409022217.2292395-2-sobin.thomas@intel.com>
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
On 2025-04-09 at 02:22:17 +0000, Sobin Thomas wrote:
> This test validates that invalid string inputs are correctly rejected
> by engine sysfs write. It ensures that the property values remain
> unchanged when invalid inputs are provided.
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
> ---
>  tests/intel/xe_sysfs_scheduler.c | 98 ++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
> index 4fc764f82..c4386ffce 100644
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
> @@ -39,6 +49,46 @@
>  #include "xe_drm.h"
>  #include "xe/xe_query.h"
>  
> +#define STR_LENGTH 4096
> +
> +/**
> + * generate_random_string:
> + * @str: pointer to string buffer that will be having random string generated.
> + * @length: length of string to generate, excluding null termination
> + *
> + * Generates random string that will always contain non-numerical characters.
> + */
> +static void generate_random_string(char *str, size_t length)
> +{
> +	int type = 0;
> +	int digit_count = 0;
> +	int max_digits = length / 4;
> +
> +	for (size_t i = 0; i < length; i++) {
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
> +	str[length] = '\0';

imho this could be dangerous as in all libs len for strings
means 0...len-1

Why not just

	str[length - 1] = '\0';

Regards,
Kamil

> +}
> +
>  static void test_invalid(int xe, int engine, const char **property,
>  			 uint16_t class, int gt)
>  {
> @@ -121,6 +171,52 @@ static void test_min_max(int xe, int engine, const char **property,
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
> +	random_str = (char *)malloc(sizeof(char) * (STR_LENGTH + 1));
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
> @@ -129,6 +225,8 @@ igt_main
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
