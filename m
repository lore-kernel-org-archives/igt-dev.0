Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD71E77188
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 08:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E5310E3B3;
	Thu,  2 Jan 2025 08:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhnuNrs0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E80B10E34C
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jan 2025 08:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735805510; x=1767341510;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LisbYT8iZPgIsq9ENhtKQatn/hrkOPIUHnrRDKuP8LI=;
 b=DhnuNrs0F/iGsKtGfn1OfiliylBmEwFk6SvGhO1V+jBlmi6qmAGrsDLb
 fiPp19gXUp5OSh7IVfuUR4dcdiRC/5hRnaAGNK9rq0dra/jTlNTxqRzYM
 k9ZpSQmBlxuWdidtCudGgGfhLrU2vkzXQlnMwAr2vglzUPJgic74ccZwb
 z50dCYFvjww6wkMMxk/cRCLdwF/fN07R7WolYtM1MOUKCBD4S7LK+6f+6
 GgGlPvVGd75PCWKdrDc5nTdDF3+9lrAYHDpS+2V8EUM5vdIhr9itxl8aU
 /WTzIc/GzcecgWSCr5Zskq6G7WvZmybuUg328bwi8kzUDhL7o0zVDNe8/ A==;
X-CSE-ConnectionGUID: riydDm/GRpOI5PH8NFu6VA==
X-CSE-MsgGUID: 1afAQBImReW1PJP2wH+Wgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35937558"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; d="scan'208";a="35937558"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 00:11:45 -0800
X-CSE-ConnectionGUID: SB7O9gSNQR6O/8rIi+bBQg==
X-CSE-MsgGUID: zCwYWSO3SJGn2BTwiG5J/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; d="scan'208";a="101876310"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2025 00:11:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 00:11:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 00:11:28 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 00:11:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Az0WyBEtFxHE2XnpzJpKt30Wj5C4lT5PgNmCihqqTsv4mQMrnYpssPdMKQDyhMTWSUFn9s3372nrkrsraFYcISiCGIoAZtRqc2lA5xcdha7+VBiwGwjj5Y0LqyQk5ZP3vgiFfvsS/R+e66w6GtOlyD3uqFHCg8vSzlx+AT6PFlbBbZ63hNL37uJ6rrWrR9hDjjhWmDMSr0quZhA6PdaIOPviDkFb48JNK0X1IsXfSGeVtmUpUqARO98a2Zxty9F0q5Nd7KSdIkv2oQaSocy8BZDmizeoci12lnGLkMy5wK19Oafbg69EcxAc00Yw9Chx8UcEUnlV5bJweFaK20e5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2FVpjGYXXVE6Chyh9sSpwjVf7sga1k3CpWbMkr2XfM=;
 b=WHO5Oiy8zcBhLG1ZqNCpF5rDrgv7nQu/dlQAHZYEPmIZB2A7+hFAK8u2EzYaiszxbpo06fpi/j8IryMDlRw6gz/jlTAT7s4A854MSBvO7Ua/Nj9RytFIFZSXMylkIGjRvnXsPJkQAZ5fTsKZBtvne3cUK/x+9KsGCE8sz0WNqWM4tjpdtPXX3uPfobbqXqDIMg0C/je0GJY3OnmkuZd2hwi73fZir1iMWKDxUBjWzU+Pok0PiCB8wYgKOYwWAZntIaaWXq+U3t9rqZJDceATcgAHp6ZKcaSNAAt4eOYuv57TUhC1MFmWO2OWs+lT5VirkELL7/9ZVOYg3wZjeEgksQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 08:10:41 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8293.000; Thu, 2 Jan 2025
 08:10:41 +0000
Message-ID: <cde93ef1-86d2-4e5a-aee4-51f7e4741b61@intel.com>
Date: Thu, 2 Jan 2025 13:40:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v2 5/9] tests/kms_sharpness_filter: Add filter-tap
 subtest
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241231130241.69689-1-swati2.sharma@intel.com>
 <20241231130241.69689-6-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241231130241.69689-6-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::34) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f6a346-3209-4029-9bcf-08dd2b04f2ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUl4Ykg3Yks4V0laMVlLUC9wbFdBNjFhdEN2Z3IwVG1IVXNoUk42aUVGdTZv?=
 =?utf-8?B?MFdSS2lHN1cwMWRVSFI2eUh2L2NIQWM3N3BWVTBtNGt6WXgxL2xyS0JoSUQw?=
 =?utf-8?B?K3ZuZGhyREwzWk9CanJXdWhtUTlmZ1ljOWpwZjBZaVNtbUdOSFVicWxJRS8r?=
 =?utf-8?B?cTlXdTdkbVdlS0hONWUvY3czMnNZc2dPSnF3TGRxazM2Q0lQYm9od2FzT0ls?=
 =?utf-8?B?V3BHYk9wQ24rMjExMC90bGxmQ2x4ejZMMk1FMjBKK2RFb0JDWkh0UysvZFNu?=
 =?utf-8?B?aXN1WmZmWm4xaFBjN2ZnL01KUS9lR29BZE5BaTFteHMvV1llTjNlR2JHcE1J?=
 =?utf-8?B?ZlpqSnh4RlFPUkh4Y1VNT1A5bjZOQ3FUeXA5dVdUNi9GeklGeUYwTEgzSUlD?=
 =?utf-8?B?R0tJakt3MmNKYXd2elpuRWlYT3Bvbk9GRHY0Y0pxZFNjZnZRTUNCM2pBdSsv?=
 =?utf-8?B?S2tqRGNOeEdSUUcrWTM1TTBCcEdJTkI5UW9JdzRtTVBKMi8xQmt2c3BNYWFl?=
 =?utf-8?B?eVMvVVczOXA2QWJ5d3dzSGVXeGsvT0Y0a0NBS1M0VDRodWxHUHFZYmxPOUV1?=
 =?utf-8?B?OHlyYWgyL290djNneFE3ellnTUh2cElZak1xa1JRUXVGZlkzWTJRTkc3S2hZ?=
 =?utf-8?B?M0FBa21YWnFDWFJXNW91UFpCUTVmWG1hN1RBcjlUZGZidldncEhLdmNqYjYv?=
 =?utf-8?B?MUwzbXQxMmlvcnZZMnBVblJaazNyajgwR3QwNC9BTDhwN3Yvdkh0cG05dFVn?=
 =?utf-8?B?anl2akRoMkc5dEdES0tMV3k2TXc3VGNYVk9iVjRFT3d5NTkxcWFCMDlKMTND?=
 =?utf-8?B?Y2J2WjZBQmFKZTlMMDZDdjZ2b01Ta3VyeW9VNENJK013WEpmTW4yT2lCM1lz?=
 =?utf-8?B?ai8ySHZOandvd3ZkV3hiMEtCNEx3SHRydXFSV3VZeFFFOEtzcGJrMDZuc0hy?=
 =?utf-8?B?emVRL1FoY20vQTBsdzAveWpSZ3ZSSWpQbU9GcllyRW1sRlJQMHBYRDZvaE1u?=
 =?utf-8?B?Q3lMSzdKMmhkMmJjME9CdFc2b2QwZExhRHdIbUloczhMaHFUU1JrVDJKNE8v?=
 =?utf-8?B?ZlVWL0ZoVmY4NHh6ZHEvZk04R2l0Qmx6YWNyMzRFenc5MG1KbUNFcG9UK3JD?=
 =?utf-8?B?VVhDN05uYURxaWIzQzNDamZYQlptcEFqS0p1RzRobXJrVEZEUkRuZ0JuV21K?=
 =?utf-8?B?bHdYdDBUUEM4dHdUSDBpdFB3cUJzSjkwZFpTMjREMUk0OUtrVmQ4QVVNQ1FB?=
 =?utf-8?B?ODdzUHloYlIveWFMTmdsMEJmZ1pPZmxkWG5CQlJjM1I3UjlrcDFsazBzaFN4?=
 =?utf-8?B?azVBT3lsY3V0SWxuSWdhWC9Hd3dVSXEwTnVyb1VmOWx4Ukh5VmJXLzRkSmhl?=
 =?utf-8?B?cEtJcGFseURyM1ZDT0g4RXd4VFBtT3RDNnBLQkpweVVoM0tQZVpmWHV2bzdr?=
 =?utf-8?B?S1ZSOXhZbWJRTVp0MkdtSmlweXlYM1BtODVMVTgzWkVqdXNYWEdUQVozRzBN?=
 =?utf-8?B?S3BabmNrSC96d0pIT3A4NXVja25Od2s3MDBpaG8veElKc0o2NWY0dzVwSjk0?=
 =?utf-8?B?NXNxK1YvMUJoMWVKdUJhSjhicFZxUnU3OEZMeDRxZHVPakpWWk9hQ3Bpb0Mz?=
 =?utf-8?B?a2tUSGNvUHZ0SVM4bFdmM210K3IwVVVPVTJEZk1mV3BUb0loaGRBRzVDSXhJ?=
 =?utf-8?B?VmJhbkYvemY4RlE1bnBPOGpuRWpuZ09SY0NJOVVVcWNpWko3ZHE1d2ZJQUhu?=
 =?utf-8?B?WjVRTzhjcTFiSXdnVWprL3c3V3ZRaElFYk5HTDdBM1dhSkh0Ym9SNXMxa2wr?=
 =?utf-8?B?dFRNbXNiVWc1VkxGL1h6cmJ2UGI4YTZyUEc2ajBuSm50TWNzSkVLbXI3STJD?=
 =?utf-8?Q?xLa/T0571nor+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTNwK0V1L2J2SkVvNmw5UGJsUFN2UFpqR2ovWkFYRXM4cWRsM0xyU0xCWjQx?=
 =?utf-8?B?ajN2ME4raXdnaGVYSkZjVWM0SnYvOTR3WmFNeDlMdUNpV0toNkxVcFBRblZk?=
 =?utf-8?B?TnNvdTBFZ2toUU5yMzhBZTBvUmVSWERZMkttbHpYMkZBL0twRFNsQm5INzJx?=
 =?utf-8?B?d2k2a1RBa2F3eVlhYXQ4aFo5Y0FMbjNWL0dzenduMEdaczI0OXRjUWFlNEpF?=
 =?utf-8?B?c0dWckkySi9jTmcvMm1xTkcxWUltd1ErRUI3V2V2WXptK0hVOUloeVQ1Lzh4?=
 =?utf-8?B?RjUrNGZpUW8xdCt4cXU2dnA1K0owT1lzZnNCSUV4L2ZWeUpSZGo1c0xwVzRp?=
 =?utf-8?B?N3FiaXVqOVZQc09aQmo5OFVTeW03dkExS3dKUXRzMDBKbnNBSUNCOXdIZi91?=
 =?utf-8?B?K1M0Y2RITStKcEc2bHhRTmtKR0lYSXc5TVg0d3ZlVzFGeVFHRk9EM3ZIZFFD?=
 =?utf-8?B?WXY5NXlBdEZrNmxRUXRocFNlMjA1UVNDNE5rU2ZZdW5xdDg0UTd1c0xpN3Jn?=
 =?utf-8?B?Y3pXWFZJb2tZMjFHc3JHTE1UaUZmUE41NHNhYjVTRGRmYkp2MXk1SGpPVDNS?=
 =?utf-8?B?MEMyU2FiSVNBcW9rVk8rbHo5K0Uwb0FCZkNXVDJjVFFSaHFKMld2YjZ3M2ZV?=
 =?utf-8?B?UjlIdEc2VnhsK2h0NkhLcDNBYWVHMHU0WjF3UEZkTXJSNXNIN04wMjFhOC9l?=
 =?utf-8?B?eDh4d3ZRMWorSjdUdGwxZElwM1dvVTE3OEJDVEE2ZzZ2dEhONWh2WlVVWGJ6?=
 =?utf-8?B?cHdSc2lGTDEwR05IT2hadzc3UGtJbnB0eGltRm4rTWN5ZW16STQvMUUwdDRz?=
 =?utf-8?B?UUhXQi9Memk4NkZRdGJNYzcwYnBGTkI5ak44VWJDTWJFNk81cTFEc3dqWUZT?=
 =?utf-8?B?ZWVQOGNaRTBlQjdNdHZpSTl1R0VtcEhUdzFvVVhDYzBVU1dKUTloUjkzSVRz?=
 =?utf-8?B?SXdCZi8xSzVCemJwYVM2UkFvR0htZ1czKy81OEdFUnBUNk9raFBrbW03QmVS?=
 =?utf-8?B?TkV1elF4N1NyVmIwQXdHbFZmVkE4M0lvREN5RG5YRFZscjdVSmdXUWtLTkI5?=
 =?utf-8?B?endac09qYWRlcFVhQ1JuUUhjcHBSajhJamxnaGxNQ0FWQW93dDc3N0gxUGdX?=
 =?utf-8?B?Yjc5YktaNHFVZEtjUHlaQm4yaVNYRTZTK0pIRi8wcWJtU0F5T3c2NndZbEFT?=
 =?utf-8?B?KzdzbGxTeEZqYUpyNDFndThCeFhqSUVleHZqU1JTc1hqdHJNK3V0Q2gwU0dx?=
 =?utf-8?B?ODU2bTRsSjdmUDFTam1PM3hYTmk1OFZ3M0hadEF2ZUdRRGdVSDJHc05CTTFw?=
 =?utf-8?B?aW9mUEZHaUQ5Q2pKRHF0aUpFZmhqWW1Ldml2dmY5SE5tTm4zVTZhTTdDM3N4?=
 =?utf-8?B?b2NiSnh1d2pZTHZzTmZGL2FIcDdXRlN2WHVoS0RqVnlJMXAxczhFUWgwZER3?=
 =?utf-8?B?ZjNZVmV5Y3ZmdWd5bVVoY1VIcFFpazRuY1IrQTdWcGg5VVhJbDBHeHFzT3Vr?=
 =?utf-8?B?ZXFjTVM5a3NWcXdmQy9YV3AxdjM1bCtMbW1NUGZ5UjAvK1pLMzJhOWhlRDFp?=
 =?utf-8?B?Tk1hMlhJaTNHVWJYYVVzYnMxakVVUkMrZUhwa3BZc3Zrdk5zWTlpMTdBN1JN?=
 =?utf-8?B?eXNVRkFPWGE0aU94N1VPOENxQ3B1cG1KSFp1Sm5rbElOaVpETjVoZzUwWndS?=
 =?utf-8?B?M2R4Y1pXcmRMODg2M0VPeURrcjJpa3hIZ2hmRTVKcjEwaExTaEFrZitjUk43?=
 =?utf-8?B?NkhWVHB5WFpESERlZjNBS1dDQUhhaUJuOHVCOVhnRXlNRkRiWjY5NXRkVTZL?=
 =?utf-8?B?MUNXOHdWTzMyaHp0SWsrcHdyVDhFQWFOT083cUZjaXNuRklIN3Z6bWVHMzE0?=
 =?utf-8?B?WjQvRmtSR2xrbVNtalFRUHRQdzZNTjdJbS80aWE5NSsyVHpuSnpuZEJBeHJE?=
 =?utf-8?B?WE5IZk13MmI3MVZTeDM0SVJseTRJemJ0SHZlVG9YNkpHZVdTZ01uRktjeVg3?=
 =?utf-8?B?aGhER0tjNkRDR09iT2dITlhiaVI3WEkyc2YwQ1NORnBzN1FWcmk3ekJLdCtX?=
 =?utf-8?B?Q3htbk90bUhtbkg0VnhJbEsvUEpHZFlLRGc0RFA4dUVXcTBLeUxrNXljU1Zt?=
 =?utf-8?B?MzYwblFWMUg3OHlwRUI2c2hGWFM5YlM5OEc5Y1lMbUkxdlBVNDhBYTdOc2lW?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f6a346-3209-4029-9bcf-08dd2b04f2ec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 08:10:41.5434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKHrkEocwVjXxL2atEcrMJH06RUhYEGv1sdcWy1sOlxRbiWxCixBSjUMFuq+Jo57m0/3MbvjPir8QczVk28Bdh6H6XfZ40JMAkcnvHpp+3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7551
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


On 12/31/2024 6:32 PM, Swati Sharma wrote:
> Add subtest to verify that sharpness works with different
> resolutions (implicitly different taps). Select different taps
> based on the following conditions:
>
> TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
> TAP 5: (mode->hdisplay > 1920 && mode->hdisplay < 3840) &&
>         (mode->vdisplay > 1080 && mode->vdisplay < 2160)
> TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160
>
> v2: -Fix test description (Ankit)
>      -Fix tap selection conditions (Ankit)
>      -Change iterator (Ankit)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_sharpness_filter.c | 81 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 81 insertions(+)
>
> diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
> index 2bc87374e..d1d6558c5 100644
> --- a/tests/kms_sharpness_filter.c
> +++ b/tests/kms_sharpness_filter.c
> @@ -37,6 +37,10 @@
>    *
>    * SUBTEST: filter-toggle
>    * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
> + *
> + * SUBTEST: filter-tap
> + * Description: Verify content adaptive sharpness filter with resolution change, resolution change
> + * 		will lead to selection of distinct taps.

Perhaps rephrase to:

Verify content adaptive sharpness filter with resolution change, which in turn will lead to selection of distinct taps.

>   */
>   
>   IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
> @@ -47,10 +51,15 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
>    * is seen without corruption for each subtest.
>    */
>   
> +#define TAP_3				3
> +#define TAP_5				5
> +#define TAP_7				7
>   #define DISABLE_FILTER			0
>   #define MIN_FILTER_STRENGTH		1
>   #define MID_FILTER_STRENGTH		128
>   #define MAX_FILTER_STRENGTH		255
> +#define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
> +#define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
>   #define NROUNDS				10
>   
>   enum test_type {
> @@ -60,6 +69,7 @@ enum test_type {
>   	TEST_FILTER_FORMATS,
>   	TEST_FILTER_STRENGTH,
>   	TEST_FILTER_TOGGLE,
> +	TEST_FILTER_TAP,
>   };
>   
>   const int filter_strength_list[] = {
> @@ -69,6 +79,11 @@ const int filter_strength_list[] = {
>   	(MID_FILTER_STRENGTH + MAX_FILTER_STRENGTH) / 2,
>   	MAX_FILTER_STRENGTH,
>   };
> +const int filter_tap_list[] = {
> +	TAP_3,
> +	TAP_5,
> +	TAP_7,
> +};
>   static const struct {
>   	uint64_t modifier;
>   	const char *name;
> @@ -99,6 +114,7 @@ typedef struct {
>   	igt_plane_t *plane[4];
>   	drmModeModeInfo *mode;
>   	int filter_strength;
> +	int filter_tap;
>   	uint64_t modifier;
>   	const char *modifier_name;
>   	uint32_t format;
> @@ -151,6 +167,32 @@ static void cleanup(data_t *data)
>   	cleanup_fbs(data);
>   }
>   
> +static void get_modes_for_filter_taps(igt_output_t *output, drmModeModeInfo *mode[3])
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	int total_pixels = 0;
> +
> +	/*
> +	 * TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
> +	 * TAP 5: (mode->hdisplay > 1920 && mode->hdisplay < 3840) &&
> +	 * 	  (mode->vdisplay > 1080 && mode->vdisplay < 2160)
> +	 * TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160
> +	 */
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		total_pixels = connector->modes[i].hdisplay * connector->modes[i].vdisplay;
> +
> +		if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
> +			mode[0] = &connector->modes[i];
> +
> +		if (total_pixels > MAX_PIXELS_FOR_3_TAP_FILTER &&
> +		    total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
> +			mode[1] = &connector->modes[i];
> +
> +		if (total_pixels > MAX_PIXELS_FOR_5_TAP_FILTER)
> +			mode[2] = &connector->modes[i];
> +	}
> +}
> +
>   static int test_filter_toggle(data_t *data)
>   {
>   	int ret = 0;
> @@ -239,6 +281,34 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   				continue;
>   			}
>   
> +			if (type == TEST_FILTER_TAP) {
> +				drmModeModeInfo *modes[3] = { NULL, NULL, NULL };
> +				int num_taps = ARRAY_SIZE(filter_tap_list);
> +
> +				igt_assert(num_taps == 3);
> +
> +				get_modes_for_filter_taps(output, modes);
> +				for (int i = 0; i < 3; i++) {
> +					data->filter_tap = filter_tap_list[i];
> +					if (!modes[i])
> +						continue;
> +					data->mode = modes[i];
> +				        igt_info("Mode %dx%d@%d on output %s\n", data->mode->hdisplay, data->mode->vdisplay,
> +						  data->mode->vrefresh, igt_output_name(data->output));
> +					igt_output_override_mode(data->output, data->mode);
> +
> +					snprintf(name, sizeof(name), "-tap-%d", data->filter_tap);
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data->pipe_id),
> +						       data->output->name, name)
> +						test_sharpness_filter(data, type);
> +				}
> +
> +				if (data->limited)
> +					break;
> +
> +				continue;
> +			}
> +
>   			switch (type) {
>   			case TEST_FILTER_BASIC:
>   				snprintf(name, sizeof(name), "-basic");
> @@ -381,6 +451,17 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
>   	}
>   
> +	igt_describe("Verify that following a resolution change, "
> +		     "distict taps are selected.");

We cannot directly verify if distinct taps are selected or not. We can 
verify that sharpness works with different resolutions and (indirectly 
different taps).

With minor changes in documentation, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> +	igt_subtest_with_dynamic("filter-tap") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		run_sharpness_filter_test(&data, TEST_FILTER_TAP);
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
