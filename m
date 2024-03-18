Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE32C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 10:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803BD10F344;
	Mon, 18 Mar 2024 10:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nz+Q6Fnu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B486110F344
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 10:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710756475; x=1742292475;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yWq+4qnGN0BgEp/540X6HKRNKSv+6W6YPhTdmXb5hGs=;
 b=nz+Q6FnuE2dUCHRBia0et5TMfK/E+ExxaktJ1zjh/wEzF/WtliyfDzuI
 Gqsk6chCFCCdu/2gWMdxmAPYY1rBea4Nlmp64m5glBdqo31JO6HnD2/rK
 CcSPPHmQxOyqwvDmSIjjfyILq8AecwbrIfT8JbWODObi8/+MREQp/8NhE
 0NqAt7FbpAHgfQByVPUfJ6Kmup3j8O0zvn7GAAcfGtzEw+gdh09JFnj9F
 4600Ry/4zAJylgJHenj1YHfVri+1hyjWBAGz3JnlQJ6G81RrrTkXGc+HA
 ef9Hb6hLm56gOeyIa79L0jBFNgqKRwezWsYWuJTB1aacDRCC6qwYr8gPh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="30996573"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="30996573"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 03:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18100645"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 03:07:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 03:07:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 03:07:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 03:07:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxVfJE+U/n/1KetVqZUcT57p8HDJK3j5gWXH3iZ/bdaUhcSNmyqv9xMiXtfCA7prkN7b2yCjxV/aWTunNEIsYvV3RILbLIhDo3TWZMHnEqdRfLjK1RasOFSyr5y9fDSyk/YaEF3XkM9dUStus+6vKrkPJSO/LPC606QaPTinRCwfgjbbGc0c1DrcZDr3zcx7aLBMCXfyfyRBAw1YNAWPhtqaMvdsPJ8zDEln0QzA42GEuHV1AhYg8UwZ1QqR6MM337W6Bb7bnv81IGFP+R5eLeMZ1mAdyaQJDequvWPUF+d9X4ntVX+jDtdJAGNoRcn6SBXXLPz4WlU6aabzWMhAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d0O91wnXIYM2XNmLU0chVdK2ACB+b9+OgQnIoJii1g=;
 b=ROI8DQRzPqFmu2T8j7ptNrWmswWLuxiGJfguRDWSlAjTJ4OYGEu4xGCdr+nWZR3JRQxpJqTVGYgrJfkhNUjbxPfVt02jKrV0QNmFIIUX86F3AhV0/PD0dmDgxYjKFB2PuLuf4bbAMK2m3u/y0cEaOwroWzeHSSz/P24r+0tmfHcKgsiljMSrlA/+WytnfaBsIg+4FiISXTvanHmc1s679m0i21XJ7asf/5Edd/w5uw0LRWZz0WdBFQHAN/nUXxt5cij2dUNszP1DNgKrcgOODalkHUHA3ThkjS1tpGPBpGd+r4bfJvjgq5aXYZcUcsUQ2gPstCT87UiPBydcH4sKiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SN7PR11MB6776.namprd11.prod.outlook.com (2603:10b6:806:263::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.10; Mon, 18 Mar
 2024 10:07:51 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7386.015; Mon, 18 Mar 2024
 10:07:51 +0000
Message-ID: <ac4edcc3-af19-4cc8-9d0c-1eb2e35ee570@intel.com>
Date: Mon, 18 Mar 2024 11:07:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/intel_compute: Do not assume engine class
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Janga Rahul Kumar
 <janga.rahul.kumar@intel.com>
References: <20240314213748.6323-1-nirmoy.das@intel.com>
 <20240318095537.eivmsosxvp7t7ea6@zkempczy-mobl2>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240318095537.eivmsosxvp7t7ea6@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR01CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::19) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SN7PR11MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: ed58538c-dd79-420e-d109-08dc47334558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qg/Dy21FsH+EF78bsRcO8OUY++mjIPuP8W1Cv59vJOeS15i1sYHOvej/IUP29McSA+H9aAeX7/RTI/wlRq0vVM6fRWvOGHiEtPq4uZh89d8FGaHGdGS8IaL6USnS+k1zgauptc5t3GumqjdXP6FVqd3Xxm8ypRRxZVBgvly+Kj6A3OZRH/2ADYvc5xxonAhxV83J0VnIYAfo5IkWWDtsJvpsM/oSvDKfO//rwVJt8uHi4U04Mmn6hasOsAiBjHMmgajJ0RqRejnGQtySv94kXngkxHK9CT35thd0xKBP+0URiFSSMjgujCrtKguVkotK6HOd72I4SOKneaYyv/yr1SyKKTzx7hCjfdCKj8X1Uwfav6vo2BdPqas9y6hMD6UthXLDoScKciKgVC6to+w6XnNDWeGhV8uWVulRKFyKg6IPxRc37MZ0R921zq8/r+blD2O451vRHtAGqq2GSPOFbiVnyXplWQMGg7gDwGV8rhQPVfaz9x8CEr9etERiwlqd1Qa5TmiU+DRFIjnCDwEqVJ2i1YXITUYnX4Gr+WpULsNfKIl3a6wGtTlP00xa6vTJ3gNoM6AfcbYoATOlm5LsOS/9Ts2Ic0+1ICR51wsPQ7UujUlxWz31dcrYAG+FU/C6xveBpbDX1ocjbZ4v5OCimHNlustetEON5c/RgdyEY4k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0hMck1lT25pT1pWdysra05XTG01L0s5d1dvYVpFMG44R3puRnE5MTVGM1pq?=
 =?utf-8?B?a1BXTjNQRUlpQmlDTnhyQWgxUjhydU1UaGZCekZtellUQXNSUk01ZlhxVkdX?=
 =?utf-8?B?Q240Nk95b2E0ZTRNbUZwdkYxN2xoT1pyT2p6VGlEVTdsWU1hU1BnUlFjMFBR?=
 =?utf-8?B?WHdMT2hpb3k0SXJ1SmV5WnNoSFYwWHF0aWRaR3FkOG9HU1RDYzdpbkl0MVZX?=
 =?utf-8?B?bS8rREc0T2F0aXYzTjJONUFobHR6K3BVcXBBTmMrcTF3OVdsbHlWZ29KNzB2?=
 =?utf-8?B?VmZDMGdMU25mdzdiQ0xuWW9qNVJ2TjVwL3RBSjRuWmY2OHZ6ckkrOTdZYU9G?=
 =?utf-8?B?b2xuS1k1RE9QclZ6VDhESGtTa1N4VENPVG1zdStGZFVtSk1BcThSMTF1dTdB?=
 =?utf-8?B?Tk15ejl0WkdQZkpEUkc0S2NGS0ZaNjVXamxyYUVVcFh1L2Z1bzJvUEZGbld3?=
 =?utf-8?B?b3VaNjFPUXd5ZklGUHpneGFHSllyZGtLT1V5VVF4OU5vdjRDbTdKckNTZzZZ?=
 =?utf-8?B?T0dlVFVBTWJuaHNlODhVWFhLcUM2KzZneVd2NGZIcHBBcDlMbDFYcllvTXVZ?=
 =?utf-8?B?a0NPbnBadW1pZnA5NmtzTG4xclNYZ3c3UlRGOHZES2NyRGM3ZWpiTFRTVmFz?=
 =?utf-8?B?NVU0TzQ2SVA3N1l4NVM2cEEwQ1MveldGQVNseFZvWEUwUFJYQWRNSUdJL0Fs?=
 =?utf-8?B?eFZtc3RtaHBuYXVPK045UjIzM0huNzB1N1BpVWh5alhvLzN1UEtJdTZpa1J1?=
 =?utf-8?B?b1BPc2h4LzJTelBmUXNIcnprTDFrbTI3OEVEOUlQbHpuaXBnYlJrK2pSTWx1?=
 =?utf-8?B?RXFNNTAxQ25HSE9QdjZmU3RFbmhKaDdnUWdQWlphdXRYM293eWo2NHh3TWd4?=
 =?utf-8?B?VkJZc1pVTTdZSEhENjBKNHBEVG5MYlJKUTIvMDR0TDRYdWtvYm43cnlBcXhp?=
 =?utf-8?B?NXVPMEZ5WkgrazJkbzN2Y000Vjh6a2Z2TmkxNFFpOEdiM0VpelY5TjhKY2xl?=
 =?utf-8?B?cEJhdWJZWlo1WlMxbkhLMTYrYkFMb1ZqWEh1YkEvcUxKcmFEV24zU1FWN0FZ?=
 =?utf-8?B?RWF1WVM3akRDb0hHdFptanJxLzlSSzRFeENDckw2T3lKd3MxVFN6SjUwNWJ4?=
 =?utf-8?B?dEUxekE3c1ZHM296SHhUV29xR2tpOS9QeHl6cmZUUTBuNEdnTXNNSjAzQjV5?=
 =?utf-8?B?Z2lIVmFsM3FDRlR1eGRqeHZ1emxKMjBRUFRRWEhYM0hYRHBUOENQQmNEWHNa?=
 =?utf-8?B?Mk9zRHJuTjNENHJqMXppRThBSGRwNjJwM1BtMDhlak5tUmYySytiSzd1MUp3?=
 =?utf-8?B?YTgzSjFHcmtwcCtjYmRmRHdKemh4QlFPMHNFOUIxMFI4SDdNdzZ4dlpsd216?=
 =?utf-8?B?YnZKOVBydU51Z0JjV0NsTHBMYjlKTkxlK3k0T2cwKzdPcXJFSVk5L0o3NCsw?=
 =?utf-8?B?cUVWUWk2Z3ZUSnU5MWx6TGdnSUI5QWFJR2pyV3k2MGUrRmV2TU9VUjRaeGNw?=
 =?utf-8?B?Ym8wUGlBbXUyUXUwUWlLMmtGb1YzeGlSSXJnUjY4RGRHQ1hjSmpCdi9YWTE3?=
 =?utf-8?B?azV4MXdBcTJaQTJ5eVg4OGVtY1p5QUJudnE1Y0xZN2RqeC9OSllQOVcwbGpH?=
 =?utf-8?B?UGlSR2JUeDBhTlJ4TEIwakErcG9zRnpEZWYrMDlOMkRRS0cwSmJOa3RKQ2NQ?=
 =?utf-8?B?dWxOVVZiUHpmMjZQczZmc0ZyMHNmVkd5elY0SThvNCtyZ3plbFEzZ05lWW5v?=
 =?utf-8?B?VlRPbnZqbG5DSWVQQmJSL0Q3NjBpV2lRODY5ZHZBR011eHYybm0ydjBic1Ay?=
 =?utf-8?B?OFN1QjM0bWFpdSt4Ylk5bDg3WTZMNWxWYUVUM0RJbnRjTGJmN2pWT0psMWJL?=
 =?utf-8?B?TERmcHNsM2J4aFNHUmdBa1h4R2RWczVTRlNMNEdhK0FoRXpTK1V6TEw0MTJ0?=
 =?utf-8?B?T0JleStEdUdGVTYrcm1GRXB5Y2FkR240Q1RTalFGeEQrRFZWUmoydjZ2YkZt?=
 =?utf-8?B?ZEZLUUFISW9aMFBqcWdOWkthYlVwdVIwR3c5RFZsdllVa3pnaUw1elR2WUZy?=
 =?utf-8?B?SnRJZkF0b1dBMkdBZ0tQRFoxSG9Kb1BJSkR4Sm84cFB0UVREeFd0OTVHbS9q?=
 =?utf-8?Q?jEg0BVzBOmRZad4pvnVw/++MN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed58538c-dd79-420e-d109-08dc47334558
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 10:07:51.4265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JI8KPdmxQ0lhfmxNB+55qOyIet333sn06xxVwLNq1EsikuHKPqVH+U6Uhfkm7pwfvhXV3HLVYhslntyJA6gnbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6776
X-OriginatorOrg: intel.com
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


On 3/18/2024 10:55 AM, Zbigniew Kempczyński wrote:
> On Thu, Mar 14, 2024 at 10:37:48PM +0100, Nirmoy Das wrote:
>> Let the test decide what engine class to use instead of
>> a lib function deciding it for tests.
>>
>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   lib/intel_compute.c      | 20 +++-----------------
>>   tests/intel/xe_compute.c | 21 ++++++++++++++++++++-
>>   2 files changed, 23 insertions(+), 18 deletions(-)
>>
>> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
>> index 9d3b97efe..c96e60027 100644
>> --- a/lib/intel_compute.c
>> +++ b/lib/intel_compute.c
>> @@ -81,24 +81,10 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
>>   	execenv->driver = get_intel_driver(fd);
>>   
>>   	if (execenv->driver == INTEL_DRIVER_XE) {
>> +		igt_fail_on(eci == NULL);
>>   		execenv->vm = xe_vm_create(fd, 0, 0);
>> -
>> -		if (eci) {
>> -			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
>> -								   eci, 0);
>> -		} else {
>> -			uint16_t engine_class;
>> -			uint32_t devid = intel_get_drm_devid(fd);
>> -			const struct intel_device_info *info = intel_get_device_info(devid);
>> -
>> -			if (info->graphics_ver >= 12 && info->graphics_rel < 60)
>> -				engine_class = DRM_XE_ENGINE_CLASS_RENDER;
>> -			else
>> -				engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
>> -
>> -			execenv->exec_queue = xe_exec_queue_create_class(fd, execenv->vm,
>> -									 engine_class);
>> -		}
>> +		execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm, eci,
>> +							   0);
>>   	}
>>   }
>>   
> I don't like this. You're moving logic which is common for compute
> users outside, giving possibility to pass invalid queue.

>   I vote
> to not merge this.

Yes, I waited for that :) Let's ignore the patch. I am fine with having 
a default eci if user doesn't pass anything.,

>
> --
> Zbigniew
>
>> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
>> index 42f42ca0c..cb98b00d5 100644
>> --- a/tests/intel/xe_compute.c
>> +++ b/tests/intel/xe_compute.c
>> @@ -163,9 +163,28 @@ test_compute_kernel_with_ccs_mode(int num_gt)
>>   static void
>>   test_compute_square(int fd)
>>   {
>> -	igt_require_f(run_intel_compute_kernel(fd), "GPU not supported\n");
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	const struct intel_device_info *info;
>> +	uint16_t engine_class;
>> +	uint32_t devid = intel_get_drm_devid(fd);
>> +
>> +	info = intel_get_device_info(devid);
>> +
>> +	if (info->graphics_ver >= 12 && info->graphics_rel < 60)
>> +		engine_class = DRM_XE_ENGINE_CLASS_RENDER;
>> +	else
>> +		engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
>> +
>> +	xe_for_each_engine(fd, hwe) {
>> +		if (hwe->engine_class != engine_class)
>> +			continue;
>> +
>> +		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe),
>> +			      "GPU not supported\n");
>> +	}
>>   }
>>   
>> +
>>   igt_main
>>   {
>>   	int xe, num_gt;
>> -- 
>> 2.42.0
>>
