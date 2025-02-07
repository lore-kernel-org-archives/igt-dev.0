Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A046C02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 14:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B6C10E1B4;
	Fri,  7 Feb 2025 14:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fr2ZSZV8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8C710EB35
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738940184; x=1770476184;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DjqjOBalLz7iKS3vxfkYW1H2C7QR9DYmpDijAoFKOPI=;
 b=Fr2ZSZV80QWyezYjW5rbQqbLcLoa0xRnpDqOx9QH3J9QJFx0ekt5Vevz
 RhelXMsaUTiz48lr13CpOQN1rt9Rl0IQkorT2hUEGNhk5RaeSr62q0TAr
 ClDiTD2QDMImtid0bBWf9clfK9ZqVEvNLCRuzwIijkSCG4ZEyEqmFSmPb
 xoSuWRgtx+/qdwh1lvaZYTR4bIiwwhgN00yueycTYZfC9UZFCRoc+Eb7L
 WQI17wwko0MRSa3pQL1KG0Sze9VJzJL5Lx88YWITadYwpKOFET6j1PDpu
 fbZQymxDt+n9iEcjdvMYLRvlZewNfyk49TrOzvsZJBXjLQjZXeBReZSOE w==;
X-CSE-ConnectionGUID: d/ijUP9LTnC/dLtc6ergXg==
X-CSE-MsgGUID: +3aQ1ST2Rbis6VDAD6EFsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43343321"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="43343321"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:56:21 -0800
X-CSE-ConnectionGUID: N6UIkHMBTq2q+5QgcSJuqA==
X-CSE-MsgGUID: 60bL+dnVRwS4p2MFKcVn6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="111370236"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 06:56:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 06:56:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 06:56:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 06:56:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3QZ4yH14V3L3cQwuxjeioXXlG3dhbknUY11xwdc5R4tiqcTsCznGoJLS0YTSKV/ucTDpZvcGEMTtTbsUS4SYf+rdc+qFzyz3CxZ1X5NpBV2RfAP0Il49nl3Ejl4X2nCd+rK5vFJFotOJUkDVIlJabuCBy94HIsljESaNpxqrIbGpZmaAJxV2zszZRWwtVxpv7ws+DSv1tMXDIbY3x60WnqNr+NZwyeJegHWIDOggyMf8C6RIFBzHBqhwUlPYIyqYiw79XQQqO//ihz6wayZVT3FzQBJm0o8BnjkDRIrSkb/iFgORBtWSeKq7ZyZ1sDTV9ETJka88pFm2rHpQ1bRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKEgWths13NKG1IGv+tPRBoI5DIqj65K4nErJ/2Uxbo=;
 b=NsgOoX5EQUZ1mnvXxffv8GZu6slxdcne7aIfcaGyNTnhNcM7uQhMH+QYPfExQYwF7x9+xqCFfONbV80lhKd5Np+x98cxyx+Q45VY8e6GT0hEycLo48594RZeAMKzCfP4dBlg3+C/uZgwj18dhnQ06pYJHsU5+o/8uICbmhB7l1Vyxs9Oeo3BzEThttPO9D10eAEIxT2gUfFDIhAY230VmRBvcQoODMwPyfZZV7N4fEJY8F2+Sbxj8CPo6Sa1+OmZ/8zZl2n5QuyQwf/F9YbIlKl9nBssQFa/673zifcnk7JzHIZ3QIn3kbyoLz8stOkQV9heYpsbIFM0btknH75Oew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ0PR11MB6792.namprd11.prod.outlook.com (2603:10b6:a03:485::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 14:55:49 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8422.009; Fri, 7 Feb 2025
 14:55:48 +0000
Message-ID: <ed3f14eb-0d24-43c6-ad11-ea957b4dc0a4@intel.com>
Date: Fri, 7 Feb 2025 20:25:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_dc: Ensure eDP detection before
 skipping test
To: <igt-dev@lists.freedesktop.org>
References: <20250206155947.973010-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250206155947.973010-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::6) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ0PR11MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 531d1af7-8175-4272-c7b6-08dd47878204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm5kaHRLZEdnUVIvVkp1bmsyaG13Yk8wTHJseGw2Z2lFL3NzSzVnc2Z2N1Fh?=
 =?utf-8?B?UmpQUFdWZjk3NlJaUkxlUlpBRktMbHI4K2FyNlNRMlhlalBmRDNOeUZWZ3Rr?=
 =?utf-8?B?NWEwcEdSUDVJU01MdDYvM1NKbzFkQUI5NjJ5dWM4VDBxQ04zRkpnTlJDSjJY?=
 =?utf-8?B?Wjk1dzgxckhzUnVZZTRGUmZvck9PNzhhR05zVzhjVFBmVGlVM0JRWndmRDhK?=
 =?utf-8?B?UWN0RW1hL1dZOGxRd2Q4Y2RINitsQkpmM09LK0pJQ2Z0dTg3Q3BBUy9tTE1M?=
 =?utf-8?B?bzA2b3A4Q0FVM3h0UDlCUkp6Zk1BcTlJcVMxY1Zmb0tnWFV0WUdYS2RQMWNo?=
 =?utf-8?B?Q3BmdmF4MUNseENOWU1pU1cwRG8zNlBhajVpbXd5NEx3dDhrSm1RNWk5Z0s0?=
 =?utf-8?B?ZHpqU3pMUk56dWNqMDNFMzFCdzJENHh0THBhK014MkxUZmh2Zm8xb0hZZjRT?=
 =?utf-8?B?cDNlTkZDdjFLQnVXRUdoMVpwclMwd0dqZ0c0dEUySmwvWjJINEUwclgxNTNi?=
 =?utf-8?B?YVpIdEk0a3c4ejFwZGQ2NWRNRlBoVUZsSFV5cXR0R1dxbHRIcmlUVDlOcDZ3?=
 =?utf-8?B?RVdMOEJOeFBQb2NSUkxXQW1LamNBdlRZUm5Jc2duNnkyOXM0ZEFTdlVqdGUw?=
 =?utf-8?B?QXRQVnV4Y3FOUXlaWDVLUkE5SzJEeC9FTzV2ZktsUURiblNjU0NZaGUzOGpT?=
 =?utf-8?B?TCtkcUZwTjVRRFNXKzhSZm9EN0dvTndpN3A3RVFHY250b3Qwd3JIMitleDJR?=
 =?utf-8?B?UEpNa241dDF0UmRMbENCNG40eUFXNFhBYUZzd2trSVVaSmlHUUczU2ZWZ3R1?=
 =?utf-8?B?TWt6eHZTQWJYK0pSMGtGeWdLeVB6VXNLZGZLVTMzRW1RaXR3N1dTVUJCYnJ2?=
 =?utf-8?B?dzh4ZExMcWRCZHR5d2Z6dmNjM203dFUzcUtWZjN5WWQwbjRhODhLNmZCTkY4?=
 =?utf-8?B?OWZhQUxiNkV5cUhKbDNFSW5GRGptTGxXcWlMT0pjYVRoSDFhc3BnREtJaHZJ?=
 =?utf-8?B?ampPRHhTUU90Tm9mUkFaQlQvUllJQzZUL1A3RU5DN2VjTnNyV2tZS2luTWpU?=
 =?utf-8?B?OUt1SmM1UFF2VG50VzhFbU1xN0hWVVZQVElpQTlNYlBUdlpRY2VCUnBCeHhx?=
 =?utf-8?B?UEh4cVhWTkxRTytINkZzb3NjWUZEWXJnMzNPajJqM1lhK2tJakY4cXZRbVBG?=
 =?utf-8?B?U1JCUDExT3Y5Y2wycHU2Q25sYkRSbVZpNzJMOFBNanVOVWEyRWhmSTBuWDZr?=
 =?utf-8?B?Mk9JL2d5REQwenM3WitSRkljOVNLa2xqUUZKZTlDRTk1bnBESHVlUTN4Q2lU?=
 =?utf-8?B?TnVGamJ4RFNSeFRqTGdxeFk3SURaanNNMjA0eUdiN1VONG1kQmxKeTRtTlJq?=
 =?utf-8?B?RXZtNVRrK004dUliK0VETHhaOTVNd2ZxU29vNWJaNEhHOUhlRHhjTWFSSDZW?=
 =?utf-8?B?ODd1TlQvK3JJSHMwQmpXNk1RS09IejRScUR0dTBuano1OTBMaEVMMUUwVktV?=
 =?utf-8?B?Nm1oNGgwRmVSa3k0bXJyQksrbVI3VXp4MmliZXExYUpMS1ZmSy9oR2gzZTFC?=
 =?utf-8?B?djFZak9vL0NDSE91VHB3dXpGZGtheW5ZeWh2dXNuRXdCUFluRFUrd2hNTndl?=
 =?utf-8?B?eTU0Qm5rYng2ZENzS0Jaa1JLK0RWYnZCK3dMSmp3ZG12SnZhSXZyZHdhR2px?=
 =?utf-8?B?cVExSWtuZDJhWDVlSFQ4WGFNdFZVY0Q5MTQ2UnM0YlEzcnNoWXhWTmQ1UEpG?=
 =?utf-8?B?aVI1UHBIYVdGQlBVdTUxbWhINnVLNzh3VHBTQWlPVXZMNXJTYmlFWmY2UXJK?=
 =?utf-8?B?WS84MVRveTlndTcrKzFsY2NHT0ozWkRqM0N1dEU4K2tIUTBUWjRiOGExWlhw?=
 =?utf-8?Q?cShwl7B505fue?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUR2bHZVdkVlYkhpdHE3YU9xNEtTcHlqNHJsdzJNd011L1F3YVhBVWtSRVB1?=
 =?utf-8?B?OC9QQ3B3Vytsc2JuQmZRZHcwUkxUUmJHU1VwdnFUaUc5Y3dsd05RMkorUzRh?=
 =?utf-8?B?ekdGSkltYjByaTdoL0ZHSGtHNm01WlB4SkFyeVZxaWY1azRodlZGRTIzdE5s?=
 =?utf-8?B?WmdxZmlVbENlVld3dVZ3bENEMWpFR1lLRXBNZVlQOXhDbXNBZ0lGYTgxWUhO?=
 =?utf-8?B?dDBjemlkd2YrNEJ0UHdaOHZtclN2bW9hTGxaOWpSOE1YU3lXaldJdmJoRFBR?=
 =?utf-8?B?ZTBjUUdkSnhNOERaRm9pREMxRFhDcGtscmI0cHg3QkR0a2JneVRvWW9tNW50?=
 =?utf-8?B?YVFoRC8zL1JqWm8wSGlYUGt6UjdvNDAzQ0VhcjIrTzdFNEhrYWpGMEhKZDQ1?=
 =?utf-8?B?UFdnYmQzanhRejMzWWhOdWZYZGpPejlFb3JZZTFmWXY2Lzd2Z0x6bzJ5K29i?=
 =?utf-8?B?ZVBXTVpEVEFwYVRiWkJySXlmMDY0SW1VVVN4TEJRaFZVNzlGNDFTWFZwZGM5?=
 =?utf-8?B?NUNOWTZGN2ZtTHR5WGFZVkJxQ2xTL2UvVVdrdW16dy8yZ09MWmRZbmJSOWVM?=
 =?utf-8?B?ZkgzTnFLdlVoQ3VpekE5SG5mMTByV1NKdTl5MloxMTAycFEyK05YVTlTU0xt?=
 =?utf-8?B?dW56c09pdS82Z0ltZHdSMWY0Rys3ek0vRFNIVzdoNnpBTm9WMmtHTVZZQmh2?=
 =?utf-8?B?L2RzRnBqdnVlSldoRXhuRmNPODJFZU1yaEtBMHYvSEsxQjNaTm5WdEdYOFYy?=
 =?utf-8?B?NmJ6R09nbDVDMTU3b1JWWjBic2JzN1hzNER5LytvM3oxRFZFSUdDR3Z2R0JZ?=
 =?utf-8?B?ODhXdTM4YnMxOTVQWHBMYnV2dlRRR3RnRVFHZTFBc3orYUNESGFodTJhdU1p?=
 =?utf-8?B?OEYyak9QZys0VXRIU1I3RWp4Mm1wL3hmelIvRWhLNi9mS0R2WDJTZFZmRmJl?=
 =?utf-8?B?Tjg3RFlyRzBzdlZnUDM0WHNvRzJORUhRVHNHbC9yaDBZZFcxR0ZSM3V0SWQ5?=
 =?utf-8?B?WlAwT1pXTU90dW9GOGxFQTQwUzhVd2NqNmltU09Db1p2ckNSMVZkanoyMjRH?=
 =?utf-8?B?eG03VjdRRHdIUmhjc1JuNFhTUG9pME1ZWW1Cam1kNUI3byt1STNGQWRMR0tQ?=
 =?utf-8?B?MTVCcUdMbzlZWStWNWd5QmRHL05UVzVwVVZrZ29oa1BaRlpFQlpxbjZ1UFpR?=
 =?utf-8?B?cFBBMDdRa3B0a1BPcndNbFdmc0pYRTREa0RjQ1dMTkNYR1hQeldWMGxZcHJP?=
 =?utf-8?B?MjlMZENlNUVvYURRWmwrMU9Hb2tSQU1QS1Bxd3BnckVPaGx0Z2ZyWGxuaGh4?=
 =?utf-8?B?S0RBVk5VODdINWF0bnZNWVo4MTcrVlFCaWxyZlUwdDI2UGVRck44bWVJcnIx?=
 =?utf-8?B?T3h1UUwzZU9YQ0lpdUY1MXVGalU4LzVBaExVSDQxZFlzdmc3NEpFNURadHJL?=
 =?utf-8?B?Y2RxZlpibHBHNUtnSWpZNnBUeEtBMVREQlRWbE9jTno1VkFLVXJWSUIrbFhN?=
 =?utf-8?B?Vk0wZlFiclBqaGx5SGNwMUZIa3pGWDNDQnNpT0t6aHZRUXhKcldpWWZpNGlB?=
 =?utf-8?B?RURCZE51T2Q4N3M1azBEK0ZVaUhsVGU4anJPaXdyRHphNEs0TkhuMmZSampR?=
 =?utf-8?B?cDM2UkUzLzB2cVU4cDZnL3l2OG50V09jRG5NeExlcFpGOFROYStwUFJES0h4?=
 =?utf-8?B?eFBva3NVaUExZm1aRUx6ci9NMUNTcXYzdTFlOGlHZFBBejhUL2l4aURhS3Qx?=
 =?utf-8?B?OFBCQWFJREJWekpsQSs0VHJDZGU4dlJ4S3ZGdlFyYUtlVGNjcVc4U0dQWkN4?=
 =?utf-8?B?Z2YyUXNJY0FSdUhva216M2RiV3RlbW1ncXBsbkttVkJvYnRtc0lHU3N3WnN6?=
 =?utf-8?B?TkRScXJqK2NSUzM2SDFhR0tjSjRZNHh6ZUVTcnBMNUYrbjROMFpZc3N5Rnhq?=
 =?utf-8?B?T2pKa1hvSm1mekkwc2dMRDc1SXdlbW1vUkdaUUVSUHA5UmFwUVhsSkZXRm1m?=
 =?utf-8?B?VFdNMkt2Vi8wUUJnTG1BWEVPaTBXQkRML2FkTE9JMEdjZSsyWFd4UFcveWRE?=
 =?utf-8?B?VG5IbDBsdVdqWUhxaWYvUWF2KzZiWDdQRUlDVjM2T3IwcFJ5clgzNEVHVWU3?=
 =?utf-8?B?STVidmFWZGhTWGZ3dFJlSXVKb3lvY3ZScEw0c3RQcURhTnhoSDFmZDk5aFFN?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 531d1af7-8175-4272-c7b6-08dd47878204
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:55:48.8243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uCnoGhUrMlcprdsugcyreD9O1jobnlUCesXGGwf8OCi/TBvc4Ud1kEEPzOM8OJgcfWMzDLGkzomBySXvDr7pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6792
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

Hi Jeevan,

On 06-02-2025 09:29 pm, Jeevan B wrote:
> Ensure all outputs are checked before skipping the test, preventing
> premature exits when an eDP is available later.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 39 ++++++++++++++++++++++++---------------
>   1 file changed, 24 insertions(+), 15 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 9551cc6b9..aaf057b68 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -640,30 +640,39 @@ static void test_deep_pkgc_state(data_t *data)
>   	time_t delay;
>   	enum pipe pipe;
>   	bool pkgc_flag = false;
> -	bool flip = true;
> +	bool flip = true, edp_found = false;
>   
>   	igt_display_t *display = &data->display;
>   	igt_plane_t *primary;
>   	igt_output_t *output = NULL;
>   
>   	for_each_pipe_with_valid_output(display, pipe, output) {
> -		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> -			igt_skip("No eDP output found, skipping the test.\n");
> -		/* Check VRR capabilities before setting up */
> -		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
> -		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
> -			/*
> -			 * TODO: Add check for vmin = vmax = flipline if VRR enabled
> -			 * when KMD allows for such capability.
> -			 */
> -			igt_pipe_set_prop_value(display, pipe,
> -						IGT_CRTC_VRR_ENABLED, false);
> -			igt_assert(igt_display_try_commit_atomic(display,
> -								 DRM_MODE_ATOMIC_ALLOW_MODESET,
> -								 NULL) == 0);
> +		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +			edp_found = true;
>   			break;
>   		}
>   	}
> +
> +	igt_require_f(edp_found, "No eDP output found, skipping the test.\n");
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
Why do we need to loop through valid_outputs again? Lets store valid 
outputs (eDP) in an array and loop only through that.
> +		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +			/* Check VRR capabilities before setting up */
> +			if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
> +			    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
> +				/*
> +				 * TODO: Add check for vmin = vmax = flipline if VRR enabled
> +				 * when KMD allows for such capability.
> +				 */
> +				igt_pipe_set_prop_value(display, pipe,
> +							IGT_CRTC_VRR_ENABLED, false);
> +				igt_assert(igt_display_try_commit_atomic(display,
> +									 DRM_MODE_ATOMIC_ALLOW_MODESET,
> +									 NULL) == 0);
> +				break;
> +			}
> +		}
> +	}
>   	igt_display_reset(display);
>   
>   	igt_output_set_pipe(output, pipe);
