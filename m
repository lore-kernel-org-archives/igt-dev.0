Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1ACC02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 12:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4557F10E506;
	Mon, 10 Feb 2025 12:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcTg39ad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FC710E0F0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 12:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739190200; x=1770726200;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Y/bYzHsbm+i3jgf1LrYFFLLhxE6pI8OrMOdwwFjCqWk=;
 b=EcTg39adz49qneA/S/z4XCIoqhJgEjPRyMKFWI7Ob6oo6P+uDJ2Mu5L4
 nsV1NT+bsfSDTX3VkuIVIjVwm8MzWleva0XZqocS0WpzXQh7QCZYhCdVc
 R5kHY4cdGERzJTvoDQ5/oIr4SdMH2PIo4/lo0j+0FwOFmaSXaU0JKTsAw
 PRmDW8m+ccWHisn+oSlvtK9rJEO/cIKj4TcdqTM0E1vHTDrBiAJc1TGah
 49KQZiwGMgYFvmQL5JowYycpbRiVQQPJC4+KrkwMGSPty3I0gon0H+wXW
 /JU59DRvT8rZ7hMuH69rnb0Z2XVub+PM0kGE3tGoJB7ZvchGqD5jMCE3n A==;
X-CSE-ConnectionGUID: khQ8KOE5SMStSVCpq1hQXA==
X-CSE-MsgGUID: ygSrBs8IQJyZpohBUrcPRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="42607927"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="42607927"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 04:23:19 -0800
X-CSE-ConnectionGUID: Kp1K4xylS+iGxxQz3Z9IFA==
X-CSE-MsgGUID: 5729Eaf3RWCJNTN5Q7j3vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135424139"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 04:23:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 04:23:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 04:23:18 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 04:23:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPsSGMgGUH9A9TrD0JIwhfbr9QZUgtSUiiX/1fBhamC0UZLTB3srhYrc1T9j7E+tCl0DFMz3zwWquH2F9DaUy24zdI4okwtWTSkW+FMWUE0KmOw51AiupnJ7tCUdI/4TeBHEYQplOrVLYmYbI5rk410nlJ0C2T5bYZj3An7EgnM/vQw43eG9Ho5QLcUUKebZWQ4RlHmAEbufoFf1p7TFU/vOZFqycGkRKY+qsQTHIle0Ml5ji+5IowizJAaBlQrjjMdBWKPgnDcs7XrhTd7dOwu4VPYpQFlDTO0G7PkGOdAerw3AbpxTHTKex+/CjnKAq8//U7TmCqJckjKW71MfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3yoBUnvpiwtKjDlgTQP4BSh2C+ipxYrr12r1K290es=;
 b=j/rPr9j6f3YWvjBNAQ+M/CNwfNdBzC+k5gkXnPG4Gzq9OSnUB/EvFpM+7yTuvCvQaBXk7AyuoRa6oMelvpHO3w9Mr7a9PHOucv3u9PsAmoQqlslPN8d9G/e66ypg3KjOL8tmNiOa30/YhqeM6VavrhG8j8Q8UmLcgk9e8uROmPTOZEyiyJsgru8dnHpI1mP3jT7fPN966gK4J4iXMGdatsf3i6gEc02eY2gBng15JLq/kynta4VT/UjliTIR8Djq4rJ+kEJpCRwkwx/8JRfIKFutBweBSgPq5yV/uukVhT9TJ9T8DQcFbINB87Rm06yMPS1C2I8X3sC30VIeGzb89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) by
 DM4PR11MB8158.namprd11.prod.outlook.com (2603:10b6:8:18b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Mon, 10 Feb 2025 12:23:10 +0000
Received: from DM4PR11MB5993.namprd11.prod.outlook.com
 ([fe80::a32b:dcc1:6314:b7b4]) by DM4PR11MB5993.namprd11.prod.outlook.com
 ([fe80::a32b:dcc1:6314:b7b4%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 12:23:10 +0000
Message-ID: <a57ad29b-62f6-4ea5-9fbb-14ad35811530@intel.com>
Date: Mon, 10 Feb 2025 17:53:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: fit modes in mst bw
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250116061749.2082287-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250116061749.2082287-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::14) To DM4PR11MB5993.namprd11.prod.outlook.com
 (2603:10b6:8:5c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5993:EE_|DM4PR11MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: ea97ed0f-36e9-4320-e7ed-08dd49cdaea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enZwSEdWbTZNNDE3eEdTamxLb3d1bitCRWhRRDlmWExmQzZGdjQ3Q0VvYTI4?=
 =?utf-8?B?WmdVNVViM0dVaDBLRCt3ZDVuTEdybStZT3AxZ2l6SkhKYlN6ZU83MkJvVXVB?=
 =?utf-8?B?cStPdWNjcnJvWXQyQmkwU084R0w5NlVaVndLcUdWeGx6azJBOEhmem8wNEVz?=
 =?utf-8?B?dytQbG51KzdkQ1dzalRsUGdVZ3lkT2oxVFRVdGJ4U1oyZytwK3NpQjg0c0R1?=
 =?utf-8?B?YzdBYkIya3pqRkYrVUhDMFc3Z1NSYkpTTUFPVWt6U1RVazdHZGo5VU5ZTDhQ?=
 =?utf-8?B?TG1OK28zdng2bXhjNGcrTno1NFR3WVRmdzU5VTg2OU5ibk1EUTBtNm1GdXJP?=
 =?utf-8?B?ZVJ0ZlRicjFSUzhIdFZXVGxHcDFZSDAyZGg1L0ZhVXdlSkRJdUw4N0xUY0Ir?=
 =?utf-8?B?VnVUTUlVMFRseXYyTDZpTXpWZHRpSXFQZUJyazJ5QlBaUERJK1RWYW9uWnJM?=
 =?utf-8?B?SFZUQmtYMU9KMW5uVmxTSjgxZjhlUGNLL0VRZFVaK091SXNqQy91bVhqQk84?=
 =?utf-8?B?NWptM3paeW8rWFVVajdYWUtzVlZBSDZMR2Z3blJ6SW45bExDdTV4OVJWS3RH?=
 =?utf-8?B?azExZml2eGM1UWdIYzliZVlVMDM2ZGhSQWFrcVBqTHBuZC9RaExYbFZNdFBN?=
 =?utf-8?B?cy9ZV2UrT05PY3VPN2JVM0dDblczeFZSd25aQnZJNU9Tdm54Q3MzQnNZbndB?=
 =?utf-8?B?ZGNERllNN1kzMFZPZHBDUmErRHN1NWU0NFV4Nkg2bktJbllIaVlHRE1IckJW?=
 =?utf-8?B?MjhyaVp3ZkttUXcvSWpWd1RidGZ4djRVUlBqUWxHSFcrU2dzNndGRWFTOUM2?=
 =?utf-8?B?RXh0NDk5NHJ0N2szLzY4Mkp0bE85QnRMckJxdTVqM09pZlNpUkRURzJWalVw?=
 =?utf-8?B?NEpkMGdYbG1HaVZxUFZCaDVCSmZLQXhPWnFyWnVMZi9yRlkzdkRTeDVsakNN?=
 =?utf-8?B?cm9tQWNrbmk1VWdqMmNIeUozMTIvVUNIMDlBN0NHZG5aV21oM0o3RWNMTkhV?=
 =?utf-8?B?VTYxZTJuTk5JMmI0aEJ4c0s3RCtaQ3lIUjlvTHVTbElJTyt6bmwrYTRrNzZV?=
 =?utf-8?B?NWtCTVpJQ292cytDMVhreEh1bnZOYjYxRjJSY294RlZOYmZOWlUvZzFMcEQ5?=
 =?utf-8?B?Vm01c2FhY2h1aDJjR0VkU0xuNE5rZnZ4amk1MWUxYTEzWjRVK2xkQlZ5SFk2?=
 =?utf-8?B?dDFONndhUmxsNzhsbFBVYWk3V3Y3a1dycnloem52UjU1VitmUDJPZTN4eGE2?=
 =?utf-8?B?TWl3bUJ6RzI1Q3V6b3RFUFBqTFcwOEsvZm1xeUFRM3YzLzJkKzVSWEFVL2Fu?=
 =?utf-8?B?ZFN0VHFXMUxDcUNGNnFrM0tYNkNhMExPTlp4VkcycitKZk81NEF2cXBGUkFV?=
 =?utf-8?B?L05ZVXVEZWpaeUdMZ3Nib1VwS0FxemdXeVh2blI4bHhTWUQzV3dTdEUvRXBo?=
 =?utf-8?B?UktscFpXMDc1cUpHSm1RRHBtRm5kbE9TanFDclFQRFBxZ1FKN2xGN09Dc0g1?=
 =?utf-8?B?QnlGT3pWaHlodWZlYm9hNk9tYUVGNW0rOVVHcHAvOUVlNzlFbjRlODU0S003?=
 =?utf-8?B?YjRrVjM3NExLc3pkTzFNNUVXd2tYYmc1SXFxdVp4L0pWL0lvOGliZGt0cWRo?=
 =?utf-8?B?ZFo5aC9VeWJUU1AzQjU0VzlkeXNadHE0RWZFcW50Vkh1enF0Y3pyU3kwWXBQ?=
 =?utf-8?B?elFVRC9mUGsxNXRZdmhZUEtGVllveWZBUkdYeHhOZEtXVFFadmV1ODN6RDdC?=
 =?utf-8?B?Y3lvbkhPSDF0V2FpQ2p3WHlEckx5amllT003c2VVU1hLYlB5eUJQYlBmczRD?=
 =?utf-8?B?RmpmRk1vbTFsVFJoVmxEQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5993.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTVkY1lIQmdqNUowR1lTck5qekZCSWpEdm9zZWZWUzlyQ1NzaGNIaGlpNllI?=
 =?utf-8?B?Nk5rYnRhUmdURjQ0OStXZXo2RzgyQUNlQU0vV0FQaWlaZGNCdzlkemlIMml0?=
 =?utf-8?B?YjZhTUNoSUJRb0VXR3NVdkVzMzdleHhHZmhpMGdYVlRDd0VhN0lpOFZSZVhr?=
 =?utf-8?B?SGZrUGZwRUJ4d2QzSVBFZklhWWYwWUltNm5yZll1a1dodHNwbU92V0p1eFQz?=
 =?utf-8?B?YWVpWjZISnR6WkhNTEkwc1VQeTZqR3pMemcwWkRFTEtXT0l6STJjUVc0bUo1?=
 =?utf-8?B?Z043WXdTdnZTcGZ1c2VjQkl3eEljayttVUs3UXpzYnBXaU1jWStreXBsN3Nl?=
 =?utf-8?B?MGxNcjJrVkNYSEhxdUErdko1eG5ETWg1UmNhNFBTS0VnMXJDeGlRYmgyM1J0?=
 =?utf-8?B?WXFBRUlrbnI1VExMaVd4dUlTUmVDeEhSYXFXT203VHh1Z0dNM1NsekJXcEUw?=
 =?utf-8?B?NXErQUtUd25oeFJqSTNiaTdjdlhWWmwxamdBV21JYjNJKzRJeWNFZURBWWlv?=
 =?utf-8?B?MmF1WHo2SHJvYzFsSjdBV0FLL2ltdVE2d0tYMitqQXJhaFFTSnk2Vk5pdHVL?=
 =?utf-8?B?MmJ5bzEwOTFncmdndDdvTjNqTlMyN2RIZ3orNXFWaFEvdGx2ZDZIeDdPY3Zu?=
 =?utf-8?B?YkhDVEJKcTVmMlF6S29XL0pValEyT0t6NmRLeGZ6akxZbnZKSFBnN09DYlBQ?=
 =?utf-8?B?eTJmQld6QzR0QnRXdFMzWGkvUm5tMzZneGZlTzhHVTJTb3hwZmJUZndTV0Ro?=
 =?utf-8?B?RDhiK2ZnSW11RGlISnFsZUpSM3VOTEFPSVRZSkZDcHdaVVNKTnduMDFGODdr?=
 =?utf-8?B?aHd0aGlFOFhtdUMwVGNHMEZ6UlRjcUNxTExmOSsxVWlBSFhoOFlOUm9KdGVQ?=
 =?utf-8?B?ZDRLWWIxbUVQbmxHeC9Fb3R4RXJXc2lkNHJRSWZJcUxzZXcvWDBJMXJzaWVR?=
 =?utf-8?B?a1QvbGZJcy8ySktiWjhOS1dmMzQ5MVFGUXE3TnRtVldrdWhwd3I3bDJ0WWN4?=
 =?utf-8?B?UDBrWUJ1OXlodlBuTTRjck1SRGx3dHlKOW1zZEJCZnhVdHFTY3ZXbThoOFRx?=
 =?utf-8?B?NVpPV2xiblRiL0FnYmV4UmlGcXlQUFlHUGRsVlhUWGVVeWlrMWNsUHVJZHhB?=
 =?utf-8?B?WUFYQjdIV09rVTNmK2UvOUZtZUE0Njc0Qmt4QVdKcXM2WkRBWkhNSzFjVlZs?=
 =?utf-8?B?UHZXYnRaZzJIanhqa2FwWHl4dC9PejY4NStrdzQzNUROSERvcTBzNmx6SHFH?=
 =?utf-8?B?OWh3ZGJKK2hzeWo2SjcrWDlmNy9hVzRoWGVSeGFwOVhvYlRJOW93OWl2Nmpt?=
 =?utf-8?B?UXdid3Z6SEloSnFYYjJZL25yQ1BRTU9DWWtaenNpRlV4dGZmeXVubGxpWVdp?=
 =?utf-8?B?L1VkdzZ5aDRPR0VCckNjY2J1WWEzL2N4MzhUVVkyb1dlTUVmeDdOdXBaSm1C?=
 =?utf-8?B?bi8zZzc4bk9KS2VvMnFScHJHdFFZa2xtYUN4VDRyZmk1UGNIc2tobjN1T2Fw?=
 =?utf-8?B?VXFHZTZSeXBpUUFxcXhMeVc5dm9iNExjOTBpbkhnSHp3Y2Q3dkhOSUNQakg4?=
 =?utf-8?B?QjAreG1iNkg2VHU0akNvMWdBZFREd25wcGhqS1c2MlRJVUpacEl0MzNvK2RR?=
 =?utf-8?B?RDVLc3VSTWc1OUVyNEwwVS9DUVozK20ydXNWM3pDSlROcEViaklZdCtLdTVI?=
 =?utf-8?B?QU9vZlRmNzM2WjZ2eXlFSWE4cWcxV0xBandKSlltZ2QzK3hvdjlyOWNWTTQ3?=
 =?utf-8?B?clRmdDE4cTBWdExKWEJraGxMYVBadWNqRG9hTUZiQWxaZ21KNFQ1OWlNa2JG?=
 =?utf-8?B?Vi9vODE5L0RxbXFwR0JXdGtxQ1g3dHczZDEvRG5oL2Z1QnhnbFgxVVJOYXlH?=
 =?utf-8?B?czhOS25QWVpqVkFkN1p1akJzUjJDOUNXY2poaGtQd3J5TlQ3SEYrUXZvVi9m?=
 =?utf-8?B?SWx0ZXluVVFrTFlxdGJiRDF5VGtNT2lROVZoQnpyd2YxM004Qk40NnRsK3Az?=
 =?utf-8?B?SjRIbDJhUVpFcGs1UTl5YnpFVm1TLzFacG16ZVhtRVp3VE5sckpxSlcrdDdR?=
 =?utf-8?B?djZrM2lGNEdxcy9haytEMTNHQ0JhWGxMRld6NkpzY2kzcVhxR0MxUTkrQ1ZI?=
 =?utf-8?B?KyszUjVjcFppRG95dDVJUit6Z2grcThiQ0l0VzQwL1J6aDdSVGE2R3F6dTZ4?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea97ed0f-36e9-4320-e7ed-08dd49cdaea2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 12:23:10.6854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/G8jcXbdnVwK/m74syMO3YbFPl+7ynWIdN/dznJVJCPlXDaS23ma5smvT+9x4pk1p1hhPn52DrOjC1yubAaGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8158
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

Hi Kunal,


On 16-01-2025 11:47 am, Kunal Joshi wrote:
> Instead of checking only currrent modes,
> find combination of modes in mst topology
> that can be accomodated in current link bw.
>
> Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2633
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/kms_display_modes.c | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index e41c60cc0..a582ba1a9 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -60,6 +60,22 @@ typedef struct {
>   	int n_pipes;
>   } data_t;
>   
> +static bool fit_modes_in_bw(data_t *data)
> +{
> +        bool found;
> +        int ret;
> +
> +        ret = igt_display_try_commit_atomic(&data->display,
> +                                            DRM_MODE_ATOMIC_TEST_ONLY |
> +                                            DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +        if (ret != 0) {
> +                found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
> +                igt_require_f(found,
> +                              "No valid mode combo found for modeset\n");
> +        }
> +        return true;
> +}
> +
>   /* Get higher mode supported by panel. */
>   static drmModeModeInfo *get_highres_mode(igt_output_t *output)
>   {
> @@ -279,7 +295,6 @@ static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
>   	struct igt_fb fbs[2];
>   	igt_display_t *display = &data->display;
>   	igt_plane_t *plane[2];
> -	int ret;
>   
>   	igt_display_reset(display);
>   
> @@ -306,8 +321,7 @@ static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
>   	igt_output_override_mode(data->mst_output[1], &data->mode_mst[1]);
>   
>   	igt_require(intel_pipe_output_combo_valid(display));
> -	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> -	igt_assert(ret != 0 && errno == ENOSPC);
> +	igt_assert_f(fit_modes_in_bw(data), "Unable to fit modes in bw\n");
Don't we have to check 2nd condition? errno == ENOSPC?
>   }
>   
>   igt_main

