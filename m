Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D39CC3064D
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 07:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886D610EA4F;
	Thu, 27 Jun 2024 07:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOdduJQo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACE410EA4F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 07:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719472867; x=1751008867;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=havg5PaBoVX030TQCQE6ZpYf51apKGBZ2KojIlQeZ28=;
 b=ZOdduJQo0xgM5SgQOYPyaspFKk4KPPx4qUBpaDkCw0iwTMZtOZPIgHvC
 IbmeU9wJaByXZvNkTNW0s2n/IHuVN4kZ9dX2I68AY0q5AaaCeyXQd2j+D
 Bzs04KT9Hr1eNAawwbkBLPf4zzL9l8bLwM1bnbpxQGl2KuCABMeWTQi9c
 GZAoIVMb2cy7dD1lcgg2iHgjvHxrIdT9zDWpYJg5EBsRk+c2hcsG1x3TQ
 tgzUcKDCG1no1X1XZ4sx3YsFbgBdrqfwrnWLNpG6B2n3+0ErBilWDSQC9
 uctxcmP5t3OOsfPwng5Ul4K0Zpimazhsf40F0LRTy3MLbOJMrcehJDRJD Q==;
X-CSE-ConnectionGUID: KaUGRm0QSRGwmvZg94oa/w==
X-CSE-MsgGUID: hUdAxkNqQaus3nSMTN+pSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="39087551"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="39087551"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:21:07 -0700
X-CSE-ConnectionGUID: 31V7m/YcQUuOp9+myA5oVg==
X-CSE-MsgGUID: BgTxxfjZTwOv+JtHTSkk2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="44249779"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 00:21:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 00:21:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 00:21:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 00:21:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvz/BA1WelaCJdDH/IZRMRyWlyCvnIDalH3xrDGErHrvKeMMb2tUP9dgJgHbgHwoUcfMl0gXV9wbWLDJEG5z4x/3d51I0WGADYOkKeW+z50wxqGhssznmiDOeeBv0OoAoqDhLq/RsrBkTmOPFd0bUdjzI/gXSI+w7VfAha39t/x1BTEcoKxNDcXQsxlBA83+mQUBCKXrNXjwuGBxZCP8MtzBrOwJcPoNA1O4B0py0VeSi5oEhY4auGfTp2KzHdGC+0nPP1pi4Jg3M7DaGBm2Td6RojkbONhtBBFaP3o7LAM060ki/lYpYPGHyvQQa0c5YpHXCyG9FnJfSAieb6gPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXyOXliXipTySAEUBh8BBze9LZRFqGODxAi9+hOMFJE=;
 b=BLYq6o5yOBekg2TgWe+uV5fLJB2v0XhOoF2NmGnuVniXNfsQJL8DR8WhGEWwBIdGZ4sncBz0OrAteZD86/xH9bvrRWMr2msgyW28mCDJse9GMJv1SJ7lKW5ILr4d5mgGs2TOTkxb2uyQimSiGRWkRRLilFOITXpMu9TUXDdIjbwIF+2JtbO4oGPNHn8yym1pSj/ADIk07y7p585f8T9WSvFig+Qlq82IrsG1YKbdAqQedZ0IalOdOBmX2flOXGzpE2d3BRtChk+9jY/iLGso5ThJl9ejLNfQyfPIZTLYi7TGmoBt6abLqKUQDMKmFAdDxaY8LmerMOUiS47iBpKH9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ0PR11MB5167.namprd11.prod.outlook.com (2603:10b6:a03:2d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 07:21:03 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 07:21:03 +0000
Message-ID: <a0bf4c0a-e6ad-40d1-bd77-cf333f1c814b@intel.com>
Date: Thu, 27 Jun 2024 12:50:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t V6 6/8] tests/kms_flip: Force joiner support in bigjoiner
 checks
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
 <20240618082248.4070611-7-bhanuprakash.modem@intel.com>
 <DM4PR11MB63127477EE32B49DEA29C12090D72@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <DM4PR11MB63127477EE32B49DEA29C12090D72@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ0PR11MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: 3516ca9b-ef96-4d88-ba7f-08dc9679b3f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q09tVWNFKy9UVUZTeXRiZlBucG5EZVQ5bDkzMTY3UytUVmlxVVVzVTFvd1po?=
 =?utf-8?B?Z2tTVmR6TXZxY2drRm5waW5zdUUrTEV6OFMzelArMC85bkhpbXp5cmNBazVB?=
 =?utf-8?B?S3drdXRiOGFON1hJRDFuZDVqT21xcFpGNThOeVBIYmlJcTArdGRQRVpIcVVS?=
 =?utf-8?B?U3VDY1pCdk02REFablRGUTBjeG1pUXl6TU8yK0VJVk9BdTl0VVpubjdMREJ4?=
 =?utf-8?B?SGRvc3I3d2d6Q0Z3cFo0T0NDTk55NXFMSE4wc1k2QmtwYjl2eDMwWXIwNnlt?=
 =?utf-8?B?Mzd2Y0tSVmYxNEt5ajRnY2JrckxuUE9pV2NCeEU0NXdNYzVnK3grQjR0ekNQ?=
 =?utf-8?B?blNDakpzVmZHSTk4YTV3TEdGcnVYd1RFdklIejNGMityRTdHQnJRRmpQdTdF?=
 =?utf-8?B?dlE5dzZCcDRmYW5JK2tqUWNRWmV0OFZkaVhxZ1FHSGR6SjhDVXBPSzNQdDJE?=
 =?utf-8?B?Qm15citpVlpSWnM1REloMHVia1Z4NmZEV0lXN1RmNzdGR25OWDNlMzNSWlJa?=
 =?utf-8?B?eENacFZpVVFKVVBzZjVjUkJ1MVVkcjg4RWQreEVUdDJmWUUydDczQnNLN21k?=
 =?utf-8?B?UktydTBIUHk0aWN5ZGZLc1BWM05XY2JZWSt0MG9WUkpkbVFpUHJ4bXZFTTgv?=
 =?utf-8?B?MnIwTlliNGpMWlN3NVVkOEtwdHkydUY5Z3JNeGk4WCtFcUlyOG9TNWEzZDZJ?=
 =?utf-8?B?SGNiVXV3cGhlczgxbWZST1NYVmlva2gzM0EwMHVuUHVVM2s1YUE3Z05vYXh5?=
 =?utf-8?B?NEwyWjRQOHErV2F2QmZyK1ZrdDQyUmZyZjRyMjZLb1ZLa09DQ1h3djhrMmNM?=
 =?utf-8?B?Um9sZ0xVTCtrZEh1dk52L2ptYmp6dU93amlDM3E1UVo5MDJNYzNkdnUxSnVD?=
 =?utf-8?B?N2VFZ2VzcjNxV2dLaW5xamlnOGE2eG5MQXJWL20wTE12ZnZHRXQxU1Fyb1hj?=
 =?utf-8?B?TmZMcXlmUU5ESDJSbW1ndC81bERlSlNycG9mR1JobERKWFlOTlM3cnNNdnB4?=
 =?utf-8?B?OHhLQ2tzTUVvaEdnbXpBekY3U2ZiSHZsUzFBYWJJWXo3VUFOVVd2R1g4NkRy?=
 =?utf-8?B?OXRMclNxOXBJOCtPTHA3bkdwRkx1LzgzRkZqNm5wUFdYZXZteXlvdW9OVXFI?=
 =?utf-8?B?VDZkSUgvNDAxaVgwam44ZG5yWnA4Y1R0dVBPZEl2dHRWN2ZlTFRnbFpoUSto?=
 =?utf-8?B?NG5TbFoxdEE1RG1nTFVUS1NqQTdhVWx2cVZiZldUaFZzdWJwMG55MkR1dnNT?=
 =?utf-8?B?SXlUMVRwMXliSHhBNGVraHcralovYy9DV1pyQzBOc2RQVGlnZ25SMEVCak1y?=
 =?utf-8?B?SElDQmlzelY3ZWRCelRtU1N3bkEvdWRWZVNFT2lsazY4RytRRXpCYkFZSFhp?=
 =?utf-8?B?cmxsQzRYMVpqRmpxSmU3clRnU09KakwxSHZvalNBUlFuMURlSHI0a2Y5OFNB?=
 =?utf-8?B?MHZ5eHRGM1FhV0dFdHVTcXB2QmVqaHhLeWRjUTBiV2FTckdlR2xFeGcrdlBC?=
 =?utf-8?B?amc0Y0I5dGg1TnpJMDl1dnUxNHladnZHNzdUdDVEZGsvTUE2K3FVOVpMU2Vs?=
 =?utf-8?B?bUw1Z2R6aXBCa2FXVEhuNGxFRk9BMVkyc1c4MTNGNXMzVkpYeEhMSXhUbkRs?=
 =?utf-8?B?Nm1vWTlFZUs5c3dmS1hsRnNnSHorMlg2VWxheVdwNXZGOVJEK1BHKzRUS3hI?=
 =?utf-8?B?RzJlZXRITHRwS0RBeUd6NHphRWJJV0NJS1Zjci90aDZDU2VPaWw1Y0RMWlk4?=
 =?utf-8?B?dU5HLzU4MS9BTVBiVGd1WWwyeTRlSEovYXpoNWJKSDZET0xXWk5vSFBYMFFG?=
 =?utf-8?B?aWhTOWo4TDdLRUZwUTd6QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azY5Z2UzYmpJVXFUdVpKbk1PNDg3ZUdjSXZsVFQ3bDNwenpUSU5kdDJFZjQz?=
 =?utf-8?B?MFBPdXRScldETlhWa04zQU9GVEJUMDhwYW9KV2JlR1hpemVwbEZrS1RRNUZF?=
 =?utf-8?B?bVorZStxMFZYUnJVREZjVDFnSjYzcGRUZ2k0bWZKTlExR0tvTldJVk93SXhq?=
 =?utf-8?B?ZDVJbE5WcjhhU0JPbjRialFCZ1hUSlhuTnBXcTBoM2VncFRGczVCajJSUUU0?=
 =?utf-8?B?V2JjdlJRQ1pRYW0vU2UwNHV4TmJwQVMrS3Y2MFBlK1c2NEpDSmhmWGpBQkYr?=
 =?utf-8?B?WTdVaW5Td0dZV1duVFRzcE9NVDQ5c3FkaU51YmM2eWJEQjluSkVXSHFUcXlu?=
 =?utf-8?B?UHpyN2xPSkRXYWNrUDRnYmwzaG1PUGdVUy81b0lQVnFoblNNV1hXY3RXUkVI?=
 =?utf-8?B?NUhaaS8zZjYrZXBhSitFc29kVlc3Y0E1NTNpRGhJV0RUNFZwZHpodnRNSFZq?=
 =?utf-8?B?amFYeENjTmJYVjd6WFd5a21DVytrMEJQejRhb3lGV0tkUFl5QkY4RnlDREp1?=
 =?utf-8?B?YmFNM0JRdVZhakhRL2JXYXRCNmNkc1ExWUpSR2Q1K28ycTNYVGxSZE1Icm5C?=
 =?utf-8?B?WUF5T0pKMExMcUQ0SkNZTHJNSmFpYmFFd2hjb1lzWjNnaUZTU085RW5mSW1p?=
 =?utf-8?B?Y1k4R1F3ZjNId0IrRGpzcmhBL1YxVVhPamZZckNFRTNLSHdCT3MxMW9PL2FK?=
 =?utf-8?B?TlFacG1ZQmUzN3J0aHltR0dxKzRZYzlUZk02azlJdERnbmtWM1ZKTXJwNHBj?=
 =?utf-8?B?NjVhU0xoVnhISFgzaC9GNXlYdVF5ZXcyd3ZVc1hub0tndlI2cklHaC9PeDRh?=
 =?utf-8?B?cUp5TlYycUwvR0REZHg3N2wrYzVuK2RhTlNJK0tDbmpCd3o4Z1BGakl6dXN4?=
 =?utf-8?B?bE5Tb3JpYnlJMm4xQmR5UThMZjVoL2NPRlJNbWtPbkhCRGdQOFVuY3FkbjF1?=
 =?utf-8?B?Vjg5Y0FWYzZvOXZwZWRYZmM3OTRSOEgyM1F0SkowL3lJcXdLVGptZ1c5d3Yv?=
 =?utf-8?B?MXVlc2x3cDVuSGVYak5vaDI2eUM0allPNmVOYmdid0F0clV4S0gvcHgxMXRh?=
 =?utf-8?B?NmptOUd1RjFST1MxNnVYY3BIbTNvVWs2LzZWb3hOOVFMNDk2bVV1TXZOTjZZ?=
 =?utf-8?B?UGtldGpObUtaN2N2OUgwY0tPOUphRUNiT3dmcXRoN1NjbFhubjRZbHBHRWEw?=
 =?utf-8?B?cUk0dFhzekloQW9BZkljSkVueUhwaW1iQnRjaE9CWjFMcTNFWHZCalBLVnNk?=
 =?utf-8?B?SkxBMGtxUHNDYU5KNWczMnNqMVF2Mmx6TDlFdkc0YXB3b3dYTHVOakVST3dL?=
 =?utf-8?B?Vk96Z1B1M2U0d1FacTZQdmpBbkFwT2VrRmVFdjIvMU0vUWVWb05vVzUwMVVY?=
 =?utf-8?B?cktzRHlNNWdCTU1uLzNWTnhzTjhyNFROTFRXYmV3ZnJNSTI5NmFrOEpEVjBS?=
 =?utf-8?B?dG9UWWkvUWthekwzV0FMdE1WdWNVVSthQXdVTUx0VEZmV0xUbnJ2eklsY3hU?=
 =?utf-8?B?TnMrNjNHK1BKQ0dLRzRySUZmTGowWk0vSU43ekFHTEZGdjRlNlBRYTQ3UjFp?=
 =?utf-8?B?SmxPLy9kMzdiT1FqbUJoYjdrYXZ5K3pCcDhTT3lrM2xiQVpzZGM1UzlWNFFo?=
 =?utf-8?B?d04zTmtTVThMUkF0V2VFSitVQmJlMG5IMTgxUHA3clZ6YUNzYmJ5QXdUQjdk?=
 =?utf-8?B?c1ppUlJYRm9nVEYxZDFMSFdMZldPdUZmQVpJMHp0NkNVRDdhWEtkMFRQc0hT?=
 =?utf-8?B?WFZmR3hkanNoanpualdxdFVTTjBpakVCcy9zZEFZaVVJVUVVbEhUU2tWcWEy?=
 =?utf-8?B?NDVYR0VTc2h3U0FNaVFEQ1YrM3QxN1FlVndEYnFqOUVEcEJaaHYzN0wzZkRY?=
 =?utf-8?B?OU1aajdQUnp1RjlENzZ2M3dDZTI1ZmtWK2FUYnVuQ3lmOU5TUVBPbk5DajM4?=
 =?utf-8?B?N2ZNYkM2SCtpOWNvWDhpRFJyY2xMNkNIc3NwYll5a1A4dFMreFlSR1g0R3ln?=
 =?utf-8?B?dER1amxFeStuMFR1OWtsaThyQkdzWWlvdGpLbTRIN0dLUVpnWDBnN2RhM09K?=
 =?utf-8?B?SFVFdXFjVzV6S28xZnRDcVR5UzZFcjlXSG1od1VaOWk0OUN2d1laVTFLcmRs?=
 =?utf-8?B?V0diMjA0azZUQjV3M2o0THFpQk5JSkxVSEdIMmxqMkZrbGt1TnFSWkpPVEJB?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3516ca9b-ef96-4d88-ba7f-08dc9679b3f3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 07:21:03.8118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXXwyGPBY3z6sZmL9b0Qm3ObnQ/P0PVvp1U7oYacU2pDe3XU20oflcWA2TOXYkNqvKkKYR0TCCdGcM2Usp+4+AXUq7Kd08Cvr2U8YpMpN+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5167
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

Thanks for the review, please find my comments inline.

On 27-06-2024 12:34 pm, B, Jeevan wrote:
> 
> 
>> -----Original Message-----
>> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
>> Sent: Tuesday, June 18, 2024 1:53 PM
>> To: igt-dev@lists.freedesktop.org; B, Jeevan <jeevan.b@intel.com>
>> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Joshi, Kunal1
>> <kunal1.joshi@intel.com>
>> Subject: [i-g-t V6 6/8] tests/kms_flip: Force joiner support in bigjoiner checks
>>
>> As we recently introduced the option (through debugfs) to force the bigjoiner,
>> needs to extend the support in bigjoiner checks to handle the force joiner.
>>
>> V2: - Fix connector name
>>
>> Cc: Kunal Joshi <kunal1.joshi@intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/kms_flip.c | 23 +++++++++++++++++++----
>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/kms_flip.c b/tests/kms_flip.c index d352ee14c..cbabbe74f
>> 100755
>> --- a/tests/kms_flip.c
>> +++ b/tests/kms_flip.c
>> @@ -1730,22 +1730,37 @@ static void run_test_on_crtc_set(struct
>> test_output *o, int *crtc_idxs,
>>   	/*
>>   	 * Handle BW limitations on intel hardware:
>>   	 *
>> -	 * if mode resolution > 5K (or) mode clock > max_dotclock, then ignore
>> +	 * if force joiner (or) mode resolution > 5K (or) mode clock >
>> +max_dotclock, then ignore
>>   	 *  - last crtc in single/multi-connector config
>>   	 *  - consecutive crtcs in multi-connector config
>>   	 *
>>   	 * in multi-connector config ignore if
>> -	 *  - previous crtc (mode resolution > 5K or mode clock > max_dotclock)
>> and
>> +	 *  - previous crtc (force joiner or mode resolution > 5K or mode
>> +clock > max_dotclock) and
>>   	 *  - current & previous crtcs are consecutive
>>   	 */
>>   	if (!is_intel_device(drm_fd))
>>   		goto test;
>>
>>   	for (i = 0; i < crtc_count; i++) {
>> -		if ((igt_bigjoiner_possible(&o->kmode[i], max_dotclock) &&
>> +		char conn_name[24], prev_conn_name[24];
>> +
>> +		snprintf(conn_name, sizeof(conn_name),
>> +			 "%s-%d",
>> +			 kmstest_connector_type_str(o->kconnector[i]-
>>> connector_type),
>> +			 o->kconnector[i]->connector_type_id);
>> +
>> +		if (i > 0)
>> +			snprintf(prev_conn_name, sizeof(prev_conn_name),
>> +				 "%s-%d",
>> +				 kmstest_connector_type_str(o->kconnector[i -
>> 1]->connector_type),
>> +				 o->kconnector[i - 1]->connector_type_id);
> Is printing this necessary ??

Here we are not printing anything, but extracting the connector name 
from o->kconnector.

- Bhanu

>> +
>> +		if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
>> +		      igt_bigjoiner_possible(&o->kmode[i], max_dotclock)) &&
>>   		     ((crtc_idxs[i] >= (total_crtcs - 1)) ||
>>   		      ((i < (crtc_count - 1)) && (abs(crtc_idxs[i + 1] - crtc_idxs[i])
>> <= 1)))) ||
>> -		    ((i > 0) && igt_bigjoiner_possible(&o->kmode[i - 1],
>> max_dotclock) &&
>> +		    ((i > 0) && (igt_check_force_joiner_status(drm_fd,
>> prev_conn_name) ||
>> +				 igt_bigjoiner_possible(&o->kmode[i - 1],
>> max_dotclock)) &&
>>   		     (abs(crtc_idxs[i] - crtc_idxs[i - 1]) <= 1))) {
>>
>>   			igt_debug("Combo: %s is not possible with selected
>> mode(s).\n", test_name);
>> --
>> 2.43.2
> 
