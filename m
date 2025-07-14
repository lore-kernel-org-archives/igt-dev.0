Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ECFC83F1B
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 05:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1255210E1EF;
	Mon, 14 Jul 2025 05:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZuNPGeL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8D510E1EF
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 05:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752470178; x=1784006178;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=y9wMt5IWw1CSSkXzzYdROekcNzkNI2xFQ7EGueZfrW4=;
 b=QZuNPGeLwNWaMkYhM5+bhimKT6kxh0XzySsY/FQDd5ThDB6NKhVTjO/S
 d2mTo9gLtsvU9HPn3VHwlg79p0rXpAixuoaSg0QY3kIIWOeFVxGXteM6c
 WsQWCL2yvC/Ng81AyMwD2brawJgEV2tgbeuD/O0bnfL/nOUXH3z/kya50
 CSHkRRErbAiGLX/nwPJlAz8R3jQS9ivJmST5XtSIh0JFyceApp5BKhR4T
 Hb14lZ9ZINEHknQUWFluommGPO2ptrof/elxzOZXJhSGzWH4VNiILemuz
 TI3RpboVdxNk6ghEP/rZfGChR4uK5x4KeWqONSyDQLtS3SGuToyUMngAY Q==;
X-CSE-ConnectionGUID: eO9OHMIzTPq+zcnQulpjzw==
X-CSE-MsgGUID: MMN81DJ6T5CJYYGUSuy3dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54783039"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="54783039"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 22:16:18 -0700
X-CSE-ConnectionGUID: 8wePWkUoSlCMKYEGyVYXXw==
X-CSE-MsgGUID: sOY2FXpcRnewahnabZ5YqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="187840195"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.98.39])
 ([10.66.98.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 22:16:16 -0700
Message-ID: <ba74e594-f6a0-44a1-8305-e68dcd144d61@intel.com>
Date: Mon, 14 Jul 2025 10:46:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] tests/intel/kms_link_training: extend test for eDP
 connector
To: "B, Jeevan" <jeevan.b@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Deak, Imre" <imre.deak@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>
References: <20250625123402.3929358-1-kunal1.joshi@intel.com>
 <20250625123402.3929358-4-kunal1.joshi@intel.com>
 <DM4PR11MB631210A4501E81F227AB75519046A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <DM4PR11MB631210A4501E81F227AB75519046A@DM4PR11MB6312.namprd11.prod.outlook.com>
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

Hello Jeevan,

On 30-06-2025 13:14, B, Jeevan wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal Joshi
>> Sent: Wednesday, June 25, 2025 6:04 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Deak, Imre <imre.deak@intel.com>;
>> Murthy, Arun R <arun.r.murthy@intel.com>
>> Subject: [PATCH 3/5] tests/intel/kms_link_training: extend test for eDP connector
>>
>> Extend kms_link_training test for eDP connector.
>> non-uhbr-sst subtest expected to and skip expected for rest of the subtest as of
>> now.
>>
>> Cc: Imre Deak <imre.deak@intel.com>
>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   tests/intel/kms_link_training.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/kms_link_training.c b/tests/intel/kms_link_training.c index
>> fb9b42608..3793fb84b 100644
>> --- a/tests/intel/kms_link_training.c
>> +++ b/tests/intel/kms_link_training.c
>> @@ -260,14 +260,18 @@ static bool run_link_rate_test(data_t *data, bool mst,
>> bool uhbr)  static bool test_link_rate(data_t *data, bool mst, bool uhbr)  {
>>   	bool ran_any_output = false, is_mst = false;
>> +	bool is_edp = false, is_dp = false;
>>   	igt_output_t *tmp_output;
>>
>>   	igt_skip_on_f(!is_intel_device(data->drm_fd),	
>>   		      "Test supported only on Intel platforms.\n");
>>
>>   	for_each_connected_output(&data->display, tmp_output) {
>> -		if (tmp_output->config.connector->connector_type !=
>> -		    DRM_MODE_CONNECTOR_DisplayPort) {
>> +		is_edp = tmp_output->config.connector->connector_type ==
>> +			 DRM_MODE_CONNECTOR_eDP;
>> +		is_dp = tmp_output->config.connector->connector_type ==
>> +			DRM_MODE_CONNECTOR_DisplayPort;
>> +		if (!(is_edp || is_dp)) {
>>   			igt_info("Skipping non-DisplayPort output %s\n",
>>   					tmp_output->name);
> Can we get the igt_info aligned with the change.
>
> Also can we change something like below : -
> static bool is_dp_or_edp(igt_output_t *output)
> {
> 	uint32_t type = output->config.connector->connector_type;
>
> 	return type == DRM_MODE_CONNECTOR_DisplayPort ||
> 	       type == DRM_MODE_CONNECTOR_eDP;
> }
>
> Then in loop :-
> for_each_connected_output(&data->display, tmp_output) {
> 	if (!is_dp_or_edp(tmp_output)) {
> 		igt_info("Skipping non-DP/eDP output %s\n", tmp_output->name);
> 		igt_info("----------------------------------------------------\n");
> 		continue;
> 	}
Sure will have this changes in next series,
Will float the changes together once i get some more feedback.
Thanks for reviewing.

Regards
Kunal Joshi
>>   			igt_info("----------------------------------------------------
>> \n");
>> --
>> 2.25.1
