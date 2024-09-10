Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FB1ECE564
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 07:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1EB10E72C;
	Tue, 10 Sep 2024 07:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fdYdIpym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E91D10E72C
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 07:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725954128; x=1757490128;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=r+f/eMsV8UE0NdXBkRRpT7pKVq4TL/5xGTiUuw3OfaI=;
 b=fdYdIpymrPPbVljNg2pGp1qoFSrhftJqlxh6+Wz+vM84gVz6A2ex6mu4
 SqS74Mq2MomdQb9kSfT7CdRcUhZrM0qeRtaqNmPCVxmPQomQp2zYNOXkY
 jLSAk7Rwj9AxB7Qr3jSYQtAmPD/eUbsJj34MC6jV7RczgQ6vRkK11lfKq
 8fqOa8DFWKyI1VeZOMOWE4AregFpn5+d9sc1z2L1wKAbxUp5TQnlZCVGs
 VZ3elDfp/ztQ+lcaGtQEXuHXM40I6WlWhCEV1J92PDKVaOa/bKmvQzCYQ
 4PGL7D9Pcy8HLF3b0M2gvpYbz9pTzZKWx9JGcr4zmfctjJbwA3+JGSH66 A==;
X-CSE-ConnectionGUID: 9GnpweS+Ttm2GyFLfzUZlg==
X-CSE-MsgGUID: wggje97SRkWF+fkk4hpOXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24878806"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="24878806"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 00:42:08 -0700
X-CSE-ConnectionGUID: f7iRysmtTeaNrHsjagKC0w==
X-CSE-MsgGUID: j4OM3BjQS4+ftz5oCBs6CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="67688219"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.213.87.71])
 ([10.213.87.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 00:42:06 -0700
Message-ID: <6e3a3404-402c-4414-8043-609d0257f52e@intel.com>
Date: Tue, 10 Sep 2024 13:12:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/5] tests/kms_plane_scaling: Add informative
 logs for single plane scaling operations
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240905145038.1569226-1-ramanaidu.naladala@intel.com>
 <20240905145038.1569226-3-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240905145038.1569226-3-ramanaidu.naladala@intel.com>
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
> This will adds informative logging to the kms_plane_scaling test
> Logs indicating which output is being tried for scaling. When a
> required scaling operation is not supported on a particular output
> and the test is moving to the next output.
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 5c5837a51..f03a73a5e 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1359,6 +1359,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				for_each_pipe(&data.display, pipe) {
>   					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
>   						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +							igt_info("Trying on %s\n", igt_output_name(output));
>   							if (!pipe_output_combo_valid(&data.display, pipe, output))
>   								continue;
>   							if (get_num_scalers(&data.display, pipe) < 1)
> @@ -1370,6 +1371,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   									pipe, output);
>   							if (ret == 0)
>   								break;
> +							igt_info("Required Scaling operation not supported on %s trying on next output\n",

Nitpick: s/Scaling/scaling
Please make this change in all igt_info()
With this fixed.

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

> +								 igt_output_name(output));
>   						}
>   						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>   							      "Unsupported scaling operation in driver with return value %s\n",
> @@ -1385,6 +1388,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				for_each_pipe(&data.display, pipe) {
>   					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
>   						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +							igt_info("Trying on %s\n", igt_output_name(output));
>   							if (!pipe_output_combo_valid(&data.display, pipe, output))
>   								continue;
>   							if (get_num_scalers(&data.display, pipe) < 1)
> @@ -1397,6 +1401,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   									pipe, output);
>   							if (ret == 0)
>   								break;
> +							igt_info("Required Scaling operation not supported on %s trying on next output\n",
> +								 igt_output_name(output));
>   						}
>   						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>   							      "Unsupported scaling operation in driver with return value %s\n",
> @@ -1412,6 +1418,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				for_each_pipe(&data.display, pipe) {
>   					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
>   						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +							igt_info("Trying on %s\n", igt_output_name(output));
>   							if (!pipe_output_combo_valid(&data.display, pipe, output))
>   								continue;
>   							if (get_num_scalers(&data.display, pipe) < 1)
> @@ -1424,6 +1431,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   									pipe, output);
>   							if (ret == 0)
>   								break;
> +							igt_info("Required Scaling operation not supported on %s trying on next output\n",
> +								 igt_output_name(output));
>   						}
>   						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>   							      "Unsupported scaling operation in driver with return value %s\n",
> @@ -1438,6 +1447,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   			for_each_pipe(&data.display, pipe) {
>   				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +						igt_info("Trying on %s\n", igt_output_name(output));
>   						if (!pipe_output_combo_valid(&data.display, pipe, output))
>   							continue;
>   						if (get_num_scalers(&data.display, pipe) < 1)
> @@ -1448,6 +1458,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   											 output);
>   						if (ret == 0)
>   							break;
> +						igt_info("Required Scaling operation not supported on %s trying on next output\n",
> +							 igt_output_name(output));
>   					}
>   					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>   						      "Unsupported scaling operation in driver with return value %s\n",
> @@ -1462,6 +1474,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   			for_each_pipe(&data.display, pipe) {
>   				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +						igt_info("Trying on %s\n", igt_output_name(output));
>   						if (!pipe_output_combo_valid(&data.display, pipe, output))
>   							continue;
>   						if (get_num_scalers(&data.display, pipe) < 1)
> @@ -1472,6 +1485,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   										     output);
>   						if (ret == 0)
>   							break;
> +						igt_info("Required Scaling operation not supported on %s trying on next output\n",
> +							 igt_output_name(output));
>   					}
>   					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>   						      "Unsupported scaling operation in driver with return value %s\n",
> @@ -1485,6 +1500,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   			for_each_pipe(&data.display, pipe) {
>   				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +						igt_info("Trying on %s\n", igt_output_name(output));
>   						if (!pipe_output_combo_valid(&data.display, pipe, output))
>   							continue;
>   						if (get_num_scalers(&data.display, pipe) < 1)
> @@ -1495,6 +1511,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   										     output);
>   						if (ret == 0)
>   							break;
> +						igt_info("Required Scaling operation not supported on %s trying on next output\n",
> +							 igt_output_name(output));
>   					}
>   					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
>   						      "Unsupported scaling operation in driver with return value %s\n",
