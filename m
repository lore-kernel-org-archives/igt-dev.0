Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01C2C54798
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 11:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8C710E45E;
	Thu, 29 Feb 2024 11:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B32ekame";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744AB10E45E
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 11:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709204924; x=1740740924;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M1d4CIb0vHCjtN2N2FucHxYkfxGoM3Svp/rfn6bU0YE=;
 b=B32ekameB16IwrXaYuHosW2L1Dnor2ZkktQnhSMAbwaKFfhv5Ry6ZzWO
 9LZktGP8lF0KbW4oua46F20IQtirsJXLV6AkCntPy5TldEwVmq81Vauya
 sksYXZ7ugGbCTvlR8u439gSt7tnB3bjmZYSGyXLJ3Ox3CGi5gXvGoqQ/L
 VXEj2UntpvbEAv0H1C6F8AcWRJJXKKkOnx1k4nWzuW05S3OkgXBtUBcs5
 jQoCkofbzMZzl9CIK3fKpHPwpWM6j4SO8ONj5god//qOlZDZCmRMNLFFQ
 nCahT+Vr5bZjK50U41MvCXSdvkzq0YgI6LdsbiWtY+L9bgmmPeBNEnvlF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3831372"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3831372"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 03:08:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12404454"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 03:08:43 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 03:08:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 03:08:42 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 03:08:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgUIVwrI8tV0YkyvcU3OeeshYXahDKSWT58HTxeSmq9Baee6neLMbYnxvnQdSUdTKxH96XjXnQrQa3tNveRe9BevohBpPYxnvmAQS4pcf/aF5+AD28Jr4CVtCGlfiiHxF+2XLPkoGa/oPE/tsf04aRvSuStpnho8pnxTKJx7DPrmfpuY5Bnh536Aye8vgTWZ/xaCnpSUAQf+G7boCuBJzn7xxK1hdYKLcPLIxgJt31SUscdfvukXbSi8PFJglBYbCnVM/eMDLL0diKhxTZ+dOLZ2sFcFJRfmVUJRGCuKvCNYg0VSlXFBj0WAvfTxWuQ4Qey9GfnVvikEbVTyr4lMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgWjJp7pPZj2IoIKvI7/a27WIyw/cdF+ul9owAUgCNs=;
 b=FiW131ZZMtOLWEhlkU7ThCsusqn3rrF/kt7hPkFwWVXfKOzc/6pDogquX3eiN0ETwbnu+ZHZVHpFAoL7RBqN7SG2YR1pa+IQJjuWxUdWlHJ55xmLYWwunYEvwgEiLLJToNvpXwH62F8Xr1K/NAyXReX3NzmfIOxK9DRjjC3af0jJLkBGfKyE6ba0UDvfqj9pE/Sdx6vsFHbhUZqyvdwQKT4eM2mA7qnjdTxpg8vJG/YbMD+L6M9D6/gbOhvjza8FtrIMJk91VCShfcY9u4PT4zR6DLZzMXMH7maxj3AZLElZVAjRD++UXhFDlv1fxIms3qT8oydWI9yAqrzTy78eDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 DS7PR11MB7860.namprd11.prod.outlook.com (2603:10b6:8:e9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.22; Thu, 29 Feb 2024 11:08:40 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 11:08:40 +0000
Message-ID: <2317c854-708c-4c18-b484-098c5b619033@intel.com>
Date: Thu, 29 Feb 2024 12:08:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_compute_preempt: Add
 compute-preempt-many
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Janga Rahul Kumar
 <janga.rahul.kumar@intel.com>
References: <20240228162118.14654-1-nirmoy.das@intel.com>
 <20240229071427.onbhjsiyw6mclstx@zkempczy-mobl2>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240229071427.onbhjsiyw6mclstx@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::16) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|DS7PR11MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e7b8f4-fef8-4ef1-2d7d-08dc3916c900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cwksUb5wafjABQPGb6Ne9TxluSLmPlacbPYL5BhnXitCGzbhZtoYeVPMEME7Mo77qxyb48m19dwWHo5sn7sH+Q1CucNqo0EjuELHpxoUBZ0d81tVk+DEPtvtZGlsJaI/R8+4X/4uPlix3Fpp39SlY+JRKyQMRbaEEYN5YCP1SAz5yyNZoV1BPD6nwS8esAWOJzWurofnjsOS28QXnKkTQJlb483SIdvE8Z5azy0PNg/nowfM6xypR2+ImuzmqEm24W3tUBqIILXhieghl5NJt0lKCXsTIlUtTDIhPQM/ESdv7ij0kIRN9mzkmsSARhfo9CWGV1y07lZKiTlbIciJqjjjItm4VB8C/suEzb3bWfmNSrO8A9+xf8SatyqkE1Rrq8MG8qT6eViLtZGF65WwWrsGIyHWdy0aH7eowuveOy39lzlyVx97VpV3dMGEOjIPFTFVy8Bzw0OkEou7mljo1XKL2+wtRfFYgJU/p4gpaD5Ecm/DKXdNwWRq9A8GHok+C8T/+pf+O4jmhEPO7/y1T4WAwz7x71ASOkZwMpnQCQe1nqfoDOMNWodLPNPnp0Cve+ob7dRTrMAQX1jKYkGFcernTj2OeV6MwwLZMCgTeAnrEXzRIMbhKJ3F98yW/GBud+HGKZUrurPBDBoQmeB3zA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkxaQjVJSGZiQzl4c2lyeDExdE8wWmxMZlZDUXhidzU1QVJHeFVjMjc0aEJz?=
 =?utf-8?B?Nm8rQzhSRktRSVJrbGNRY1oxeW5Ddm1JN1hMc1lzTVBOYkZsNDdDNlM1YUxk?=
 =?utf-8?B?ZWZmd0JwVUpodzFJWWErK2dzbzljUzNnQ3JObFkyc0V5dlFIam02emNEUlpt?=
 =?utf-8?B?OEdFS2ZSVERDaHJFWGlEdkVUZzdENS8vaGdJRnBMOFhiR1pMSVdRUmNXM295?=
 =?utf-8?B?UzRpb09SOUFIYkpod3BtNWNpYzl0L1VsMFlRYXl6L2loWWdKeWdkRFQ4VHR1?=
 =?utf-8?B?WE51RGlQQ1FQWFlwUDI5T3k0eU1BaVhPc3U2MzNPTnlPWUZaY2FUczZGNktS?=
 =?utf-8?B?VkpiNlJ6T3hNdnlJaThrS0RaZWY3dmZtbzFRa2V4QkdKWER5VmdPeUN4eUY5?=
 =?utf-8?B?NUlON2dPdFQ5VlNubHpLUi95dlRpT2tHeTFITVFzbUYwTm1OSXY0QXZUT0Q0?=
 =?utf-8?B?a1hPTnNockl6UGErUWJDcEZBK2R4MHhjcVlNbnh0UGs4K2t5RmM4UU1vWVV4?=
 =?utf-8?B?TkdRV3FIeUJhVEVQU0lsZDNCNG9xSFZBZUNrdGtCQ3ovTFNud0VTMDRtb0Zu?=
 =?utf-8?B?Vk1rcVpMODRGS1U3b05JU04zUXd1dnQ5TVFCaXNSZ3RCNEgxQStySHUyc3pj?=
 =?utf-8?B?TytQM1FwVXpZdWYzdWVONElyaElXSW9obndqb2dBNllrZ2cvVXVtSXZMUGVz?=
 =?utf-8?B?dGt3UFd4azlkelZ2V08rN0l0V3JpaDUveStpRDBhaHQrRFdZREc1K2RQcXJM?=
 =?utf-8?B?Q0pneFh5U3lrNjBqT1l0RFRGSE9SZFQ5SGRPSkVLbkpHdFFXQ1Yzb09qQUVi?=
 =?utf-8?B?Zlh4VTFDWE55VFF6MnZQbUtqM1UwKzRIbmh5WlV0QTAwYkcwWFlqcXpQbTZL?=
 =?utf-8?B?eURXTmpHaUhWTWVlRE9yQ3BhVitSMU85cDBLcnVBdGRwMEJXREo0RnRsV0Nv?=
 =?utf-8?B?eW1DUmxoSjdoMUxyOVRDLzdQcEswSkp0eFZJcnZFM3lMR2RHRzJYNkVoVHRM?=
 =?utf-8?B?K1JCWnVueVdyM1orQzhWZGM2MmNieTRHZmIwb0o3TkY1WlgxM2NHMlJkcXpO?=
 =?utf-8?B?dHYrdTVkVnFmNmpHbE52QWt5VEQzUktvYlJDcHBmb2tJMi96NVU3UWdSMkpU?=
 =?utf-8?B?WkRDVUpydXhwZ1pma2w3ZVdCYVhDTHV2K0ZjRGk5bW80NVdEZ3hVMzFoK2JT?=
 =?utf-8?B?WGdPendLdXk5YmhHakRzemtxNzh2aGJNRit2RElxYUdmTzlqK3RBNC9kREpQ?=
 =?utf-8?B?ZlBUL1ZKUEljUjZjSFZqTlU5bHJLaE1qRzdSS0o0YVI2bThLZTFqQm5VSnJZ?=
 =?utf-8?B?Tkd2VFllK3daY3BSREdiU2lKRnFLT2daQ2VKNzh3ellzUDdYZXdFYU0zVm1E?=
 =?utf-8?B?bWRGZzBIOXp5UG9pcmVvbEhXc2ErWnpKbjVsQ0g5MTZ0Z1hKM285alpseisy?=
 =?utf-8?B?YmVMMjFXalIySUdIRzQ5SXJCQ2MwMlA5NXczSkt5cFFNSHJ3VXllQ2hiSHpa?=
 =?utf-8?B?SFNCQlA0YWVnK0wvZ2NNOXpVSGh6YURza29WQUpnNklDeXIrMkR3WThKRFRX?=
 =?utf-8?B?Smh3OGk1eldqTmQ1ZlhlakNKbjhRUzU4Q1Joc0oxYXpaR000N0RnOVpFbmE1?=
 =?utf-8?B?MGlIbWhFMW9VSWlaRVdwUHY4SDltVW9XeEhaSGdVUmR5aGQvSE1PejdjWlYy?=
 =?utf-8?B?NkpKbWlSaTlROFoxOVVRNGFjL1lyY2ZyekN6aXNxN0JXN1NoRkJ3V2dXRnky?=
 =?utf-8?B?d0tXa0ZJUkJxSUFPUHE0SFRvTVhieG53MFNyRUdRU0ZwL0M4TXMrV0FZblVo?=
 =?utf-8?B?NmVkc0lpVStXUXdnZTd3WTdTRG5ibUxMK3FTZWJGYkprVC9XM1g3akVORnNV?=
 =?utf-8?B?K2ZSeUJrMnRhSnMxU3U3Wkl2b2hQMHgyRDRxMU9QS0tEZmh6YXQzQnFGc0t2?=
 =?utf-8?B?dXVOSkwycXlGSzJaRzZ0TjcweEhrTnVJMmZ3ZGpYOHJtR21iMWQ3eGt6YXpU?=
 =?utf-8?B?MXpYeGh0em1nV215OU5hdEJHV2drSUlpUUdnSkVaUUJLaDhFR3JJZjIzZ29S?=
 =?utf-8?B?UzRTZ3hXdWlEeURqZ0lQMHFCbzBnSHNkVzRNRWJ2Q0gwTVRMMzRLSkZFSjJP?=
 =?utf-8?Q?rlgL7sfPeNnPC/HkFgZoZaapt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e7b8f4-fef8-4ef1-2d7d-08dc3916c900
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 11:08:40.6166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: keEvKTD1a+SPeaVCLodzsg3LSQBpkJbHp1Ir739aIXA+5BHZIGL71Qac4txbsukuu9ijFZF+sKFXsHmDuKNCrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7860
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


On 2/29/2024 8:14 AM, Zbigniew Kempczyński wrote:
> On Wed, Feb 28, 2024 at 05:21:18PM +0100, Nirmoy Das wrote:
>> Add compute-preempt-many which should exercise multiple
>> mid-thread preemption at a time for multiple contexts.
>>
>> v2: move igt_fork within the test(Zbigniew).
>>
>> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   tests/intel/xe_compute_preempt.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
>> index a4e0e1454..0aeb10547 100644
>> --- a/tests/intel/xe_compute_preempt.c
>> +++ b/tests/intel/xe_compute_preempt.c
>> @@ -22,6 +22,11 @@
>>    * Description:
>>    *      Exercise compute walker mid thread preemption scenario
>>    * Functionality: compute openCL kernel
>> + * SUBTEST: compute-preempt-many
>> + * GPU requirement: LNL
>> + * Description:
>> + *      Exercise multiple walker mid thread preemption scenario
>> + * Functionality: compute openCL kernel
>>    */
>>   static void
>>   test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe)
>> @@ -48,6 +53,20 @@ igt_main
>>   		}
>>   	}
>>   
>> +	igt_subtest_with_dynamic("compute-preempt-many") {
>> +		xe_for_each_engine(xe, hwe) {
>> +			/* TODO: This subtest fails on RCS engine */
> Hmm, aren't compute engines separated from render engines now?

Yes. I was thinking of running the test on both compute and render 
engines. But the job gets timed out on render engine when I use

more jobs. Playing around with timeslice value helps but not completely.

>
>> +			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>> +				continue;
>> +
>> +			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
>> +				igt_fork(child, 100)
> I'm curious - why arbitrary number 100 was taken?

I have picked a bit good looking, high enough random number. Long 
running workload duration will depend

on the HW it running on so ideally I think It should be measured 1st and 
then find number of parallel workloads that fits within a jobtimeout value.


>   Regardless
> answer code looks good to me, so:
>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Thanks,

Nirmoy

>
> --
> Zbigniew
>
>> +					test_compute_preempt(xe, hwe);
>> +				igt_waitchildren();
>> +			}
>> +		}
>> +	}
>> +
>>   	igt_fixture
>>   		drm_close_driver(xe);
>>   
>> -- 
>> 2.42.0
>>
