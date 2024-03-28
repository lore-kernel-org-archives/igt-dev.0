Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE23CC54E64
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 07:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EA510F3B4;
	Thu, 28 Mar 2024 07:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j5bpYio7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3088A10F3B4
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 07:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711609574; x=1743145574;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=buIbyHK7mYaphNSHvJeNdflnyANQZPLhAouFmXqAwZs=;
 b=j5bpYio7l9isCPyVEAYpsDTV08FwrzK9YwuzMfBR2f07wwowbP65yE9Y
 eg10mmyJbg0OTl0+dmqcO58/IzSsBy8ZHm+s3UvdHC3NeL7QnB+EWHG6B
 uEDFjwE6XYgIV32z937c7OOqO0tkp5ULFh01vR+w1otV5MrUlrXrc0l6i
 AmPhHeeEwmpg4JAjPLuVfxf2mkx9KP66tJi2rl5EkwQhyHwzrFE/fIb9v
 D32z5p8rxbO7MSmT5y7G4iATl0yDWcUdkLfd4vFiPn+iz0HWGb0eyPu85
 jaLPXGbfJKkiKW5C7IxgrXAx6286erhO+X86QGuJRT5pTkRJAK8XzHyQJ Q==;
X-CSE-ConnectionGUID: vwIOkwEvRZ2QtBuTooGMWg==
X-CSE-MsgGUID: o7ZFTELTQVKF7F5hE3SI2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18180700"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="18180700"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 00:06:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="47535803"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 00:06:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 00:06:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 00:06:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 00:06:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 00:06:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BM9GVIAJ9zdd3cx1OPDT4RGa9z+THajdUVjFTRpNlwLtFE/WE8gq6bkxxhvqSAF3xl9GQF57sm1DS4oXC7sbcxz1Sf+Y5mgswjDUpdcT3pwnotnwyZ7DaN56KDa4SSpA+saOOa+xXmS4V7M2TofyFHtXnpN3quHLO0+vMRkmLjLWM50HUs/eKJt90sSncLn1HehTFv+blqLPPIqywJSPRJFm6M5+IAjKtz6aE2Uit4Phnp4HI883rIeu7GtehvdddjusMfq/NICfzs9YEfRf9ofhUVxMILd/7iOlx67nX9IaGnpOMH7+ZTmVj9G6gi0YnOrQCjwTbbw8OyEWukOmCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGsRZDc6eJIwitoGCe/mMjKSxW/Qn1YzS+41IDcH1vk=;
 b=M6aJTIGB5KpOei8+7kaNeCG6bPaw8KDsQyiCq5Qorgi042cexAQIvuCDxmDD31TTev7P9svA2LAM5OKISrkPBmtETTbV6EAKb7wia2JuNbvrxYjv27Vzji8OQBFdvSM6p7sDtsxtkmUB1k36B6B/y1zsPPA+vipOZa1Oa8YptH/iR6znXJcu6R+eVUXeuRhSiuK9mbQ1snz2vtKp62wb5G4RihxPwIAHa1iaCvQydnsqC/YfjdduPJBy3l3DmNXAH8A9CkGggaM5DceiZmxOXvJVk2JVAHCyBkN42FdG5k/zbE3wsOIY1jnDdLlVyMSdtZtPMdKlbRKR4gxTpy433g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 07:06:09 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 07:06:09 +0000
Message-ID: <84e251ef-45bd-4783-812b-810ad1827913@intel.com>
Date: Thu, 28 Mar 2024 12:36:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/kms_big_joiner: add tests for force
 joiner
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240325165136.1265895-1-kunal1.joshi@intel.com>
 <20240325165136.1265895-5-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240325165136.1265895-5-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::19) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV8PR11MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b7316a3-b2c7-4bc5-b42d-08dc4ef58b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8U6SA4OHeyWuZmAOubfZ8IpPoXMeLsfqaJaryXy0DDqeg3FTa/KddaOrH9OaXJk42RNvEMayGC0Nv0FRDpkJvPj05ag1MYqyaXg+NudzRdi1Tp8P7t32Nk3GSCI3gCKgVASFdcBpv004auRzkpznsT2LE6xKvwe1X6GilXJ9OUAqCeIE5AwSmHD+A4/I41Z6YRs/HXTG1mVM2bOhEdi2RZ6MUSW+ncF7bZHEnwAcczuPHkBLYvR51mh960IJ5vzAdYHmncfYDkN6YQFMOIXKOSCHW+h5QHZniD0h5Qptqvq7L0/5aBWg213nEkhu9AcuAAQsDGw8Ec5ofmQvufLpB3Hcp1yFq5KOtWdPoLLSCvByMMp7j+5zY3ZPduQA05E83gJIW1JGG1+aFVsYv9mr9k7eu6/UpExjsjxt1O+sS6zlN8BGcf6yl6sxNJbwCbcjFs0h7E97mBdjy0GP1gg2daORndYWwluiGDMXXiPn1fPZdbvwzTlwCNQLoGts2iNInlCN+rzEtuGrnONwpst1SbhbOs9i3iAnqEcLxp/prdYW1AUZpz90XdkjFP8tVTJQuCMXvlq6UhuvmtU9GYhj8BZMoU1yxiv2qt5dx16C+8DJqvY94AAUiyKkxv5I6owSMBHu+QwU9IwF+QO7dlbUcat6QlR7btbfeXw9bbb/HTg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm5WZ085cy9XcmFBUEM3QW5CZ1JHNFh6K3dHMjMyZmJwTlZoMUFuS2MxSnFB?=
 =?utf-8?B?dzJ4WERaTjJKb2NGZHhqdmE4MzdZbEhZVjdNeWVuclB5K2xKNUR4L0R4Sk04?=
 =?utf-8?B?ZHArQVBETWxacHVvdXN6RGRuNkJMVHNTS2hkV1hUSFpJdENRd3BKZ1Q5UTE1?=
 =?utf-8?B?L2tuckRTL3BhcGljN2pKMWl3eGJqQkcrTjZoRXV0dGdPREdrYkFCNjdWV1M3?=
 =?utf-8?B?MDNYQkEyaERuY0E1Um9pdXJWU2lyVE15dUh2Tlh1NngzelNVZVAweWY1UUM3?=
 =?utf-8?B?S0w5VWNYdVlySFJJcFNyS0J0NmQwM01MOGZtQXBaOFBkeTJVY2RVblhrVXMr?=
 =?utf-8?B?VjlrSmx2SnQ2eHVpN0FMbmVMbzE3ZzF4czVUOU9jSUVTNTJPSitHVU5CeXMw?=
 =?utf-8?B?RGJZUlJIQThWcHBUU3pjQlVvcStWcVVOZDVjSGxmMmhMbzZVeHZTR09OUGxx?=
 =?utf-8?B?RmlibWVPV3JpSmVLbzBVS1I4MndaTFc1SUlTejN5cEE0d0x4Q1hkNEtFUk5x?=
 =?utf-8?B?c1UwL0RpUTJ3N3djY1dqZFYxWXMrWXBadXNiMUoxUEFaNnJHOGVycnB6cC8v?=
 =?utf-8?B?V1RTOGdoTFFvc2tNTnVWak9iejE3bFVIM3JtNWVCVEF1SHZrZUc3NWNXWGVm?=
 =?utf-8?B?SXJleGRlNkRlQ1p3dDRHeTk2VXpXeDhQWlE4Wm1uRzF5MlRzWjc5Uk4ybFdU?=
 =?utf-8?B?Rng3ZCtMK0FoREllY1I2RXBGQzRLRE1IanJnOGtuUFNaajhIdEFlUHdkZDU0?=
 =?utf-8?B?SmJnekkrS0NVVGVITENnWUsxS211WmdITFZKN2lGZS91SW9Oc2lVNkZHWUN5?=
 =?utf-8?B?UGlKdUhyMmRseE5yS1hBK0F0aG9PN0tXNGw0UjFrRmpMc0d3OEJyaWwvakY4?=
 =?utf-8?B?bmNWM1IvbnlIVjFNMjdXQ21yZ25xZ3pSeTViVW1ONzJVR2ZRRVVYM2hrQ3lI?=
 =?utf-8?B?dWQ4NExVK05mb2FzUUw4R2VsRWNoQkRseU83Q2dkdjdLRldvM1A2SDVFK05C?=
 =?utf-8?B?UHNPKzhleVNnWmFMTU03Qk1ZMm5PWVNBeVYrYXZaL0JnMkVKcmgzaFdqYWhh?=
 =?utf-8?B?YjFscFo2bTBpdkVBY2V2anZQZVNVVk5tRytwakpVZkxKRW5qcVRYYXpabFpR?=
 =?utf-8?B?RUJXK0dKNVl0U3hzNWJMdU9sSCtIek85bnltUDBBTllWc3hMcnFmMTNPdEU5?=
 =?utf-8?B?K3BsQk9CV1hQTk44VFVYNUZ6VjB6WG5BMEtZaWtoeFJYRWtRSFN1VjlMOEJu?=
 =?utf-8?B?NGw0b0RtU21mWTA5RVNvSUE3U0Y5R3ZpNXMvNno5WXFlbjNOVmttTWZrVkZO?=
 =?utf-8?B?WUVYTkVlYUhIRVo2bUpzNnZFbmFvQVFnWWNYMDdSTTZCcGZsWXFVOHdJRFcw?=
 =?utf-8?B?cHJCNWJFaFFNWWRQbjZVdUF1d3NzMTBDdkpGY2tMUWwyTS90M0VrYTQ1STZN?=
 =?utf-8?B?UDI5K1NRUWJjdHFiUlM4OTdMODl1Uk9iTUdTdjV2SEZPcHNzSXFsdUo5bkZi?=
 =?utf-8?B?SmhMckZuQTY1MHJRUkFaK2Q3NDh2MXpYVDJKNUozZCswd2l2YmFwTW5RVEEr?=
 =?utf-8?B?RW1jcjR5OGpLTktUME0xV29sSVR3enUyUEJuU0FiU20rZ2RublM3bWVxaWF6?=
 =?utf-8?B?NzhqVGFOM08yOG5rMG9vaTEvc2xxZGVxeE5FRk50WlVISlBzNUtwUzdEUWhr?=
 =?utf-8?B?Z01SSFlrMlNOZ1RRQ09rdC9Ea2dwa2VBdlNmamhNdTEyeE9YV1ZMbys1dzV5?=
 =?utf-8?B?dnRkdGE3TVh2OHB3N21wSy90azM5RVZKR1NiTndHUDNiRk1SbVNvaUFwNE51?=
 =?utf-8?B?ajlOOTN1QlhuK1Q1Si9xaDhYaGtjMHc4ekxudHAzdGZ4U1hwK043bWptUG5M?=
 =?utf-8?B?QXYvMi9jVmJyd0MxSm1ONUdQK2ZPN01CTWs3ZU5DMXlHRzBnb0hwSWdYUWl2?=
 =?utf-8?B?VzBLcGVKSXZKM2dqNEwrV3I5QlMyVGdSMzFXMkd6R0N3QllUU3hVd0tiZ3ZL?=
 =?utf-8?B?L2RFeWRDTTdJSHZEb1JtcjI2YmdZT0FKR2xScmcrVlRhcEQySDVpSThGY2M0?=
 =?utf-8?B?MHk3MEVXdnJvYW5BR01FemJtNWtCNDdiQ3BuUG5GNlpYdm9idHdiaHc0N0pq?=
 =?utf-8?B?bFArVXB4cUhYWEd4RGNiekRPbHRPWm9YKzZrdGZmRS9MbFh3cE00NTJvb3lQ?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7316a3-b2c7-4bc5-b42d-08dc4ef58b91
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 07:06:09.7337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5DQV/YCvCFP+JTJmL0DT3nrh2oJGK4PgLCOq9LY2c2C6pmwKMCTeI26T+BVPHGebYSImWPf+m5FVJXTCfuvHQrOwnX+Hi3eWB2XZWJxmdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
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


On 3/25/2024 10:21 PM, Kunal Joshi wrote:
> add tests for force joiner

Need to addwhy we need to use force joiner, and the subtests added.

>
> v2: check status after forcing (Ankit)
>      take out commoon code (Ankit)
>      fix missing force_joiner (Ankit)
>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_big_joiner.c | 102 +++++++++++++++++++++++++++++------
>   1 file changed, 85 insertions(+), 17 deletions(-)
>
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index b57996212..fd6baccc3 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -44,9 +44,14 @@
>    * SUBTEST: basic
>    * Description: Verify the basic modeset on big joiner mode on all pipes
>    *
> + * SUBTEST: invalid-modeset-force-joiner
> + * Description: Verify if the modeset on the adjoining pipe is rejected when
> + *              the pipe is active with a force joiner modeset
> + *
> + * SUBTEST: basic-force-joiner
> + * Description: Verify the basic modeset on force joiner mode on all pipes
I think we need to document that force bigjoiner will be used to test 
bigjoiner funtionality with a non bigjoiner panel.

Where the config is already having, bigjoiner, force bigjoiner wouldnt 
be used.

With the above documentation changes, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>    */
> -
> -IGT_TEST_DESCRIPTION("Test big joiner");
> +IGT_TEST_DESCRIPTION("Test big joiner / force joiner");
>   
>   #define INVALID_TEST_OUTPUT 2
>   
> @@ -79,6 +84,19 @@ static void set_all_master_pipes_for_platform(data_t *data)
>   	}
>   }
>   
> +static void toggle_force_joiner_on_all_non_big_joiner_outputs(data_t *data, bool toggle)
> +{
> +	bool status;
> +	igt_output_t *output;
> +	int i;
> +
> +	for (i = 0; i < data->non_big_joiner_output_count; i++) {
> +		output = data->non_big_joiner_output[i];
> +		status = igt_force_and_check_bigjoiner_status(data->drm_fd, output->name, toggle);
> +		igt_assert_f(status, "Failed to toggle force joiner\n");
> +	}
> +}
> +
>   static enum pipe get_next_master_pipe(data_t *data, unsigned int available_pipe_mask)
>   {
>   	if ((data->master_pipes & available_pipe_mask) == 0)
> @@ -105,7 +123,7 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
>   	return master_pipe;
>   }
>   
> -static void test_single_joiner(data_t *data, int output_count)
> +static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
>   {
>   	int i;
>   	enum pipe pipe, master_pipe;
> @@ -116,7 +134,7 @@ static void test_single_joiner(data_t *data, int output_count)
>   	igt_fb_t fb;
>   	drmModeModeInfo *mode;
>   
> -	outputs = data->big_joiner_output;
> +	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
>   
>   	for (i = 0; i < output_count; i++) {
>   		output = outputs[i];
> @@ -137,7 +155,7 @@ static void test_single_joiner(data_t *data, int output_count)
>   	}
>   }
>   
> -static void test_multi_joiner(data_t *data, int output_count)
> +static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
>   {
>   	int i;
>   	unsigned int available_pipe_mask;
> @@ -149,7 +167,7 @@ static void test_multi_joiner(data_t *data, int output_count)
>   	drmModeModeInfo *mode;
>   
>   	available_pipe_mask = BIT(data->n_pipes) - 1;
> -	outputs = data->big_joiner_output;
> +	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
>   
>   	igt_display_reset(&data->display);
>   	for (i = 0; i < output_count; i++) {
> @@ -177,7 +195,7 @@ static void test_multi_joiner(data_t *data, int output_count)
>   }
>   
>   static void test_invalid_modeset_two_joiner(data_t *data,
> -					    bool combined)
> +					    bool combined, bool force_joiner)
>   {
>   	int i, j, ret;
>   	unsigned int available_pipe_mask;
> @@ -190,7 +208,8 @@ static void test_invalid_modeset_two_joiner(data_t *data,
>   	drmModeModeInfo *mode;
>   
>   	available_pipe_mask = BIT(data->n_pipes) - 1;
> -	outputs = combined ? data->combined_output : data->big_joiner_output;
> +	outputs = force_joiner ? data->non_big_joiner_output :
> +			  combined ? data->combined_output : data->big_joiner_output;
>   
>   	for (i = 0; i < data->n_pipes-1; i++) {
>   		igt_display_reset(&data->display);
> @@ -223,7 +242,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
>   	}
>   }
>   
> -static void test_big_joiner_on_last_pipe(data_t *data)
> +static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
>   {
>   	int i, len, ret;
>   	igt_output_t **outputs;
> @@ -232,8 +251,8 @@ static void test_big_joiner_on_last_pipe(data_t *data)
>   	igt_fb_t fb;
>   	drmModeModeInfo *mode;
>   
> -	len = data->big_joiner_output_count;
> -	outputs = data->big_joiner_output;
> +	len = force_joiner ? data->non_big_joiner_output_count : data->big_joiner_output_count;
> +	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
>   
>   	for (i = 0; i < len; i++) {
>   		igt_display_reset(&data->display);
> @@ -257,12 +276,14 @@ static void test_big_joiner_on_last_pipe(data_t *data)
>   
>   igt_main
>   {
> +	bool force_joiner_supported;
>   	int i, j;
>   	igt_output_t *output;
>   	drmModeModeInfo mode;
>   	data_t data;
>   
>   	igt_fixture {
> +		force_joiner_supported = false;
>   		data.big_joiner_output_count = 0;
>   		data.non_big_joiner_output_count = 0;
>   		data.combined_output_count = 0;
> @@ -290,7 +311,10 @@ igt_main
>   				data.big_joiner_output[data.big_joiner_output_count++] = output;
>   				igt_output_override_mode(output, &mode);
>   			} else {
> -				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
> +				if (igt_has_force_joiner_debugfs(data.drm_fd, output)) {
> +					force_joiner_supported = true;
> +					data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
> +				}
>   			}
>   			data.output_count++;
>   		}
> @@ -313,10 +337,10 @@ igt_main
>   			igt_require_f(data.n_pipes > 1,
>   				      "Minimum 2 pipes required\n");
>   			igt_dynamic_f("single-joiner")
> -				test_single_joiner(&data, data.big_joiner_output_count);
> +				test_single_joiner(&data, data.big_joiner_output_count, false);
>   			if (data.big_joiner_output_count > 1)
>   				igt_dynamic_f("multi-joiner")
> -					test_multi_joiner(&data, data.big_joiner_output_count);
> +					test_multi_joiner(&data, data.big_joiner_output_count, false);
>   	}
>   
>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
> @@ -326,13 +350,57 @@ igt_main
>   		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>   		if (data.big_joiner_output_count >= 1)
>   			igt_dynamic_f("big_joiner_on_last_pipe")
> -				test_big_joiner_on_last_pipe(&data);
> +				test_joiner_on_last_pipe(&data, false);
>   		if (data.big_joiner_output_count > 1)
>   			igt_dynamic_f("invalid_combinations")
> -				test_invalid_modeset_two_joiner(&data, false);
> +				test_invalid_modeset_two_joiner(&data, false, false);
>   		if (data.combined_output_count)
>   			igt_dynamic_f("combined_output")
> -				test_invalid_modeset_two_joiner(&data, true);
> +				test_invalid_modeset_two_joiner(&data, true, false);
> +	}
> +
> +	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-force-joiner") {
> +			igt_require_f(force_joiner_supported,
> +						 "force joiner not supported on this platform or none of the connected output supports it\n");
> +			igt_require_f(data.non_big_joiner_output_count > 0,
> +				      "No non big joiner output found\n");
> +			igt_require_f(data.n_pipes > 1,
> +				      "Minimum 2 pipes required\n");
> +			igt_dynamic_f("single") {
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +				test_single_joiner(&data, data.non_big_joiner_output_count, true);
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +			}
> +			if (data.non_big_joiner_output_count > 1) {
> +				igt_dynamic_f("multi") {
> +					toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +					test_multi_joiner(&data, data.non_big_joiner_output_count, true);
> +					toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +				}
> +			}
> +	}
> +
> +	igt_subtest_with_dynamic("invalid-modeset-force-joiner") {
> +			igt_require_f(force_joiner_supported,
> +						 "force joiner not supported on this platform or none of the connected output supports it\n");
> +		igt_require_f(data.non_big_joiner_output_count > 0, "Non big joiner output not found\n");
> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
> +
> +		if (data.non_big_joiner_output_count >= 1) {
> +			igt_dynamic_f("big_joiner_on_last_pipe") {
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +				test_joiner_on_last_pipe(&data, true);
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +			}
> +		}
> +		if (data.non_big_joiner_output_count > 1) {
> +			igt_dynamic_f("invalid_combinations") {
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +				test_invalid_modeset_two_joiner(&data, false, true);
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +			}
> +		}
>   	}
>   
>   	igt_fixture {
