Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBB5ECE582
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 08:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBE110E73F;
	Tue, 10 Sep 2024 08:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vp4ECIKZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE1010E73F
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 08:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725955766; x=1757491766;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=/dC1kCvHwwxuFNVOMRkleV2gMJBOLFzpYm6ZQPZqlxM=;
 b=Vp4ECIKZpRUP9S1lDRh1N9T6vgJLYhuVJa1aDLC5YvQwvB22k4UXZv5X
 f/GT9mAQeBwG1jZvXz+zbAsLYchWAxHC4jBmynWRBpOzO0xX6U9HCs2fd
 uA3cofKSwGFb2CHwF65sYzX2Bopap1bkhTNnL2cpdfA1w7ReUhcojSTtc
 1c+0eoP78iTl6Wvo3ClbqdwZNWBdb+tNVsvfm7sRR6DSNUDLZvndQifek
 qCD7vpOrnmGaSKboKewU5xqyU8jhLJDA39T8fsJfVJAkrT5BauZ4eqynu
 n4y4GwAWibwBOjWj5GnRGmnaabpdynA2jq6tsWW5uZoZzrN/FHZGWG/we Q==;
X-CSE-ConnectionGUID: vpJkVmR/QlaPm6xIgTfhbw==
X-CSE-MsgGUID: yjEOmBlNRm6B4kMshPNJYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35260101"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="35260101"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 01:09:26 -0700
X-CSE-ConnectionGUID: j2Wx4cq8SvWcj1SLyxT2Gg==
X-CSE-MsgGUID: MVaHEpNySaW4VJtGNARikA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="67694269"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.213.87.71])
 ([10.213.87.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 01:09:25 -0700
Message-ID: <54893d8f-5b9d-467e-9043-32a7951f0d98@intel.com>
Date: Tue, 10 Sep 2024 13:39:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/5] tests/kms_plane_scaling: Return error code
 in test_planes_scaling_combo
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240905145038.1569226-1-ramanaidu.naladala@intel.com>
 <20240905145038.1569226-4-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240905145038.1569226-4-ramanaidu.naladala@intel.com>
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 05-Sep-24 8:20 PM, Naladala Ramanaidu wrote:
> Change the return type of test_planes_scaling_combo from void to
> uint32_t to return error codes. Modify the loop in
> scaler_with_2_planes_tests to break on successful
> test_planes_scaling_combo execution.
> 
> v1: fix crash issues. (swati)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 37 ++++++++++++++++++++-----------------
>   1 file changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index f03a73a5e..5d69eabf4 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -933,7 +933,7 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
>   		      fb);
>   }
>   
> -static void
> +static uint32_t
>   test_planes_scaling_combo(data_t *d, double sf_plane1,
>   			  double sf_plane2,
>   			  enum pipe pipe,
> @@ -997,13 +997,14 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
>   							  pipe, output, p1, p2,
>   							  &d->fb[1], &d->fb[2],
>   							  test_type);
> -			if (ret != 0)
> -				break;
> +			if (ret != 0) {
> +				cleanup_fbs(d);
> +				return ret;
> +			}
>   		}
>   		cleanup_fbs(d);
>   	}
> -	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE, "Unsupported scaling operation in driver with return value %s\n",
> -		      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +	return ret;
>   }
>   
>   static void
> @@ -1524,25 +1525,27 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		for (int index = 0; index < ARRAY_SIZE(scaler_with_2_planes_tests); index++) {
>   			igt_describe(scaler_with_2_planes_tests[index].describe);
>   			igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
> -			for_each_pipe(&data.display, pipe) {
> -				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> -					if (!pipe_output_combo_valid(&data.display, pipe, output))
> -						continue;
> -					if (get_num_scalers(&data.display, pipe) < 2)
> -						continue;
> -
> -					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -
> -						test_planes_scaling_combo(&data,
> +				for_each_pipe(&data.display, pipe) {
> +					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> +						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +							if (!pipe_output_combo_valid(&data.display, pipe, output))
> +								continue;
> +							if (get_num_scalers(&data.display, pipe) < 2)
> +								continue;
> +							ret = test_planes_scaling_combo(&data,
>   								scaler_with_2_planes_tests[index].sf_plane1,
>   								scaler_with_2_planes_tests[index].sf_plane2,
>   								pipe, output,
>   								scaler_with_2_planes_tests[index].test_type);
> +							if (ret == 0)
> +								break;
> +						}
> +						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +							      "Unsupported scaling operation in driver with return value %s\n",
> +							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>   					}
> -					break;
>   				}
>   			}
> -			}
>   		}
>   
>   		for (int index = 0; index < ARRAY_SIZE(intel_paramtests); index++) {
