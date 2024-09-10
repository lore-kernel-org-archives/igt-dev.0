Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976FEECE582
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 08:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5131310E743;
	Tue, 10 Sep 2024 08:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gV00/gXR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B965F10E743
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725955971; x=1757491971;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=vTbxQpFjXh2RoqdgGyIyB+diIBp0NqrOBqtAMG/iMrQ=;
 b=gV00/gXR26G95ytzHTV0ARAlk9I2R2OUBEy1438ErAiBO83Z9Bsb22kL
 KmAVzjkh+w8Se9sgozifsFFc9QqES/zIHwgrlgV9OZgaHWwhNmIKLfE1d
 Dx48PbCUxGTmHZq8/p6zwTOcduRw4YAIwi/OFN/C7T33QkL4aBU4nxt6G
 oLEb8ZfKH6ivFVMBqTf7XcyAIzv4ruChnk6JmwGqcGnWXya27BUUrTEcW
 0u5HL7Yv0YZkbuPLqGoRoM2F4M7S3yjfEi5AjL6agGL8Z0cIfK1fVpVcL
 rsmv7AFW/RUNBTHydl1hSyOvpsePYG8MDBRbskLNavBHDB91IU1Eh5x7z Q==;
X-CSE-ConnectionGUID: p0+1COxaRRKZGBkb6nNiXg==
X-CSE-MsgGUID: A8kx+zcfQN+BDqjI8Y0STA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28467228"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="28467228"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 01:12:51 -0700
X-CSE-ConnectionGUID: oGm0gjStQDKCGM+37UVs9Q==
X-CSE-MsgGUID: GfV0zkEcTzC8FJjd0Y6PSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="97764805"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.213.87.71])
 ([10.213.87.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 01:12:50 -0700
Message-ID: <dfd25e93-994a-4825-af0d-b5d5399f66a6@intel.com>
Date: Tue, 10 Sep 2024 13:42:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 4/5] tests/kms_plane_scaling: Add debug logs for
 output scaling attempts
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240905145038.1569226-1-ramanaidu.naladala@intel.com>
 <20240905145038.1569226-5-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240905145038.1569226-5-ramanaidu.naladala@intel.com>
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

Hi Ramanaidu,

On 05-Sep-24 8:20 PM, Naladala Ramanaidu wrote:
> This will introduces additional debug information to the
> kms_plane_scaling test. The new logs provide clarity on which
> outputs are being tested for scaling operations and indicate
> when a required scaling operation is not supported.
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 5d69eabf4..04264d35d 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1528,6 +1528,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				for_each_pipe(&data.display, pipe) {
>   					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
>   						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +							igt_info("Trying on %s\n",
> +								 igt_output_name(output));
>   							if (!pipe_output_combo_valid(&data.display, pipe, output))
>   								continue;
>   							if (get_num_scalers(&data.display, pipe) < 2)
> @@ -1539,6 +1541,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   								scaler_with_2_planes_tests[index].test_type);
>   							if (ret == 0)
>   								break;
> +							igt_info("Required Scaling operation not supported on %s trying on next output\n",
> +								 igt_output_name(output));

s/Scaling/scaling

With this fixed,
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>   						}
>   						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>   							      "Unsupported scaling operation in driver with return value %s\n",
