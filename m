Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C541093179
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 06:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD38410E4B8;
	Fri, 20 Mar 2026 06:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g7BKNMTt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5BC10E4B8
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 06:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773988318; x=1805524318;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BDMhIHleQJJPM2qzrb48XFu8U7wcWGxZL9AbmJXM/Gk=;
 b=g7BKNMTtVTTZ3iAVYnkQ5bEzW64Y2sowvy9r+QLqHLgBUJIvNQb9bmd9
 Wr0KMSw4O3uwS7a0J2DFBww0r4ZABTNpvKw10HOjFzWNv9+QQ+2SfiY/K
 pboDvd9EH5HXIfBStX8ItKYJ+eppZokmeb8JWzrE8CiB/mZZVCF7vf12w
 Qb3xa9CzLCZErkRm4BC9twM5AqTqKg7rSVbVJqd3WJ1o/yyL5OdSLuyt8
 bhDj9wwOL4fTGl+pktQsivtfE7iwlVHQ2MjtMZB1icqV59QWLeU7GeiOI
 4Iv5Sos8ESpb1i9bSKT7oi4GSAHgZdc6Q9v8sKhPMrvrD+wUsff98fcFn g==;
X-CSE-ConnectionGUID: 4ih0NHb/SgSywKovGb21xA==
X-CSE-MsgGUID: I+qnroA3TRSOfYnH82+H3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75255945"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75255945"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 23:31:57 -0700
X-CSE-ConnectionGUID: KZL1KX6+TXm1MVru/vCHuQ==
X-CSE-MsgGUID: fvwaSaXmTLuQCSRGgCYeGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="222418563"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 23:31:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 23:31:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 23:31:57 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 23:31:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vrkz0w5jRPSiY00EHlB0YsmzSec3zZg545b78E2Pqtbl+LKFzTL9VyKIMYTrjsN4nc+gJvXYPMnbcCOg067YkzxgSG4fyZvblSFOlZlobMakr5yvyzNJZFQFwMKo9KJFfHDzkKKCJxXayl7O7EmReTvDJpOs5Pfea6s1LtiYaG4IEvDL2Ynq3zvz88hdTdAleKmLm9GYg73Ui1Odv8i667XE/mbhwlmXjtSTmPQY2EQOR/aHIncvm5yrPa4ueA5YE/3bZDIOlLeRPI73dGfga9xwucDarq/MwvsSpNs5UNoUWqNhk2g6tP6E5T7/DODZLAf+RkLV9SjjAlhhnxHTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNQyFfZz2nCBeG6gN1vauvuqk/+kfzpSduU8pgrSHIU=;
 b=ZodKl1rW/0Bt861aEJMKuccpoAfgjZY1TfPAmbEaMVfyxNmBPN0w5uQPNH4J4KsP/d7WMPpqtHgqX3+UMqXFoolarV6dyNb6kJuOFJmREHfa5bFXndpYVqsC2DJx+n1/idnd8laVsDs3QP29iSORk7FR2UMwJO3U+LoK3ZDcuu/XHsxIA2WksvPi/fU7bl0tlA4SPSYxHrJKwIi1mV/KO3BJR5ZAGPdcgfj7o2E//L5+WbymgaGxa4gs4QqEgEJjMejsWl10zTSfOxZr1D6FUUmZMBSe0vk4sV7Ni0Ax0nHB/iCP8BebWYhtaB4r4o805a9u7RIpwKCxHyiangjDdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by PH7PR11MB7099.namprd11.prod.outlook.com (2603:10b6:510:20e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 06:31:54 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 06:31:53 +0000
Message-ID: <e19b3713-4095-4fe1-ae25-920195a0be04@intel.com>
Date: Fri, 20 Mar 2026 12:01:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] kms/feature_discovery: Add VRR capability
 subtest per output
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20260121001324.118542-1-ramanaidu.naladala@intel.com>
 <PH7PR11MB6796402811960601C074E56CE596A@PH7PR11MB6796.namprd11.prod.outlook.com>
 <82ebd2b2-f1b2-4130-aa1d-e911d9ad4194@intel.com>
Content-Language: en-US
In-Reply-To: <82ebd2b2-f1b2-4130-aa1d-e911d9ad4194@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::9) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|PH7PR11MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 9face027-9f79-4713-c4fb-08de864a6028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: gkvK/O1l2uzFFBZE1zw3EfdbKo7yaWeAEeIxasVWURTSzKlkFcMUsB8Dt3ZXd4WTXEZtFoMKRAN92cKdsRd8rYhlbr7wmc/FkIO+Pxq0D1fGw8dXP9sT/byUstUi6HHWVOy6UH2zfXfQ0RSm4dkTPrAaYeg7O4SB4rT9TGFZYKipqNNTZCzw41N6prHVlbYHYU/AN9+rpq6xvSDEL5k/sceK82Sy0Kx/z0JgZB06X/XHCJza12JCHcPuhfBgOXrkpePELlMrt5Es/KWOb7BUdNv55GQFt6UqVMkIhipN0EcbZxvPUb8fnKVBiSS0w7vt/htqqaTUBEL8F/ywGKDEe4L5QiLuoY3ENBi7+Ge3rrjdXhTi2ElREM1NoNbzmdQHuvjURYywLk6gA9mZCdayQTvovj1CNrG0MuH+iMQpskCW5ehtPU8DwSIm9zjgN1Ahr0NhwCInmySP9MpehFdmhs43xd3iVt6Xn28NMh4KpWgmXe8trdevnIU7ZMwRG25vScgZbzoIA8FKKJXzXt/0qJlBQzvqer6NH+f5vfQa1ADLdWPh8O6HQwX3UvvETHvdrhkWesQPxIDyXwT6WJW5HjLRXjGD6SMo0ZSek2DXnyQzfCv1nx7vDxjokdyHgeDLv5KraYcuRjLNt8kEAdh9yeFT7LvJTNjIpJ+9LdISD0QAxilojjot8Mum5ePUzk+y5Z9Hj12/JHFup3n8N34d9MHpBolVlb8rQorvntG+wvE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXYvRFlGcEszajU1MHB3T2ZHaVg1cmVJdTVCUVcwWkwzMWtaSnFBdEhIeXpi?=
 =?utf-8?B?SkZrd2VJbkFQc05lMmpPSHNOUFBTNElJR0pRbGdVdldpazlRdzNqVU0vUzBn?=
 =?utf-8?B?NmZ2b09WdE96c1JFa0VZVlZWTnFCNzhrZW0yWWNmdDR0bmpQTG9IbWNuMHZF?=
 =?utf-8?B?UG1kSzZwNGVadHhoaVIzeDhZdmdkTzNBUE9hZDhiNXk2S3dqQVlhTlc5clhi?=
 =?utf-8?B?Tjh3OCtSSXhlYkxJR2lzRHp1eFJSd0R3Nzl3QnZZSmJmbURMTmJCU1lPbEs2?=
 =?utf-8?B?bE9OT3JsVTI1aEtyQXhHejVCM0l6L1VUdjdKMVJPNHlLUmVmTEJ6NTFLQ0Zu?=
 =?utf-8?B?YklFM3h5UVJucDVCckpha0RlZE56UVNyanlqZjJtNTVLR3RISXMwRU9ac1dN?=
 =?utf-8?B?VWtndlFRbVdOUFdzcnRDNG1QUVB4bWp5NUxNenlhNFZ2RHc5YzhkSlpYaEtR?=
 =?utf-8?B?UVl1MVhiQnpmaFdLcHVjTE12WXNjbFhReXN6RXBaNUlkVDl3WEI2MFFpS0RF?=
 =?utf-8?B?NjJHZWgxM3U1S1JuaHRhS1poMytHaEpWRHNJOHJXM3hIakVqWGYwejFuY254?=
 =?utf-8?B?NUVjVzFnN1RwejNTb3ZKalFNNEpVblNCbGJTOWxOQVFpYU9UeHNvblQxWk52?=
 =?utf-8?B?bmMrZDhtRlZJSkcvQUZ5cVBXRVJsbmc5cUdDZHlaWUxwTTFzT0NTbEx1di9s?=
 =?utf-8?B?cmVINnJiWXVZVkp5MFNFaEp3NHdLTzRzWk1QK3dlQzJobFNPclNsM1owNWM0?=
 =?utf-8?B?ZXdySUNaMldyTnRTZURJYXlFUERsdUh2NHVDcnZzdzYvS1BjR0ZPUTFDemZX?=
 =?utf-8?B?RHpVYys2NU5kczUybmNVQm1BWm9NMzRXc2VJUlpzMUVZb0llM3BXSnJaSlV4?=
 =?utf-8?B?OTRrbFlDK2lzZVNWS3ZSZlNrNE9CY0NuNDZNWEo2bUlZV0V0Q3QxUC9QN1Zw?=
 =?utf-8?B?aGpjejBNTUw2ZkE4YUFTRUFDdWsvOEFDbXVnMnFjelEzY2dGeXkzN1hsejdH?=
 =?utf-8?B?VTNNcy9EcFJ1bUl0WDVIYnllNzdmZ1JWUHowZE5VdlVwZjFQRGtOdGd1MHNF?=
 =?utf-8?B?UlFlYnQ4MEZ1TnNXQks5M3R4TllWYzJPQi8zR0J2SytnTnFiU21hWVhCOGVz?=
 =?utf-8?B?cnhsbmQ4eW1tLzJ1UUh5RTMydFhVS3cxUW5ZSHpreEhPVzdIUkpDdUpSbmtM?=
 =?utf-8?B?RmxLYnJBcFlHUS9sUlZGdlhwL0RtNG00WXhDR1RrR1NKb3VER1U1akg1NUc1?=
 =?utf-8?B?eG85bDh1TzcyRnlnS1dOazJGZ29YRTc3Y0NQc2c1NmN0Vk9pcjJscFRDZUNQ?=
 =?utf-8?B?Yi9hdUhMeUZSRG81KytHeGI0VFprZFBJR3FCTWVmQzA1OXd5Tm1Ncm5VcjBD?=
 =?utf-8?B?V0lpZU84YVJ6eW11bnBrZGlZR2JsUWU2cC9QRjJaTVlwOVVINXdWRDk0TnVa?=
 =?utf-8?B?ZnBiU2g1dGVFaGdWVnhUbzhHWXlaVTRZbExrYkJIU1hPTTlEUG43N2NyUis2?=
 =?utf-8?B?VzhySS9wYzdFTXFLYzVRQ3hUSk9LamVQYWJwemM1dmpiUWJ4K2FibEhDMGF4?=
 =?utf-8?B?dFoxaDNtbVBUSGxIYngyNW5rYStpenRoOFk4bVRZNnpQQk10bG9GZFRya1RB?=
 =?utf-8?B?dVNkMjdqN0pKQ25FTlZ2TjZDSVpKdkVRZ0tnK0xqUWZGZldMRG9QVXFtRVFx?=
 =?utf-8?B?SzF6OUpmWFFmNjNPL2V3elFxZjF3anU3RW0vUlhmdlZLaXgwRExhcHFQOC9V?=
 =?utf-8?B?ODRwM04rT0pyOVQ1L0VwdHRPbXQrWUlVWnBZb1pWcGlVbW50dmlkcUpySjRq?=
 =?utf-8?B?Zmo1V1czWXNaQjBqWXB1RGcrM0F4aGJHdW5NY3gvNWkxM2h0d2FCSFlZYnQ0?=
 =?utf-8?B?WnRqK1ltcFBEeWVOWHpPc0xTejNROERGWVdMN3VOcTVpdmloNzVKRXlnLzFt?=
 =?utf-8?B?RlZuSE9oZmRlZ29GQzFkbGFoWTZkR3JrQnlPeTc0RXgrU1JKRzdBc093WkRT?=
 =?utf-8?B?SzVHTHVjTnplMlE4amRkVlZmYnRTUVZPTG8xRGlKZzJJMHJrSUJkenpvNXpR?=
 =?utf-8?B?c0JIb0phbURpeUxxOExrL0RESXRycHRtN2dWN253bHZFaWNZSEsxck1NV0F1?=
 =?utf-8?B?TXdqaDV0d3NlaWJpVUFvclpuVXBpUUxnMEV3QXJacW5DSDg1VDhObm42VjFZ?=
 =?utf-8?B?UDR3VmM5elhUQW04emk4NXlMaEtHTHRUVkdhOVNETXlXYUNFeDFDSUwxaUNi?=
 =?utf-8?B?Q0F6cW9jZTdGZWlYd0ZnUWxUV041T2ZPU3FGR2UxU0tSSTJ5RVN5bkZkRzNn?=
 =?utf-8?B?QXVWU0JOdVYySWRFUU9UbmN6V3daMlVtcURRbGFGT0NFRFFUdHFLZEdMOGVv?=
 =?utf-8?Q?0sUU4bRjIbmC2y1A=3D?=
X-Exchange-RoutingPolicyChecked: atqa/9aDa58h5DPWI+obK4D87y2YN6pIkJUiM+YxwdmTwywTqb03C1w7MJHOG2o4Nd8m/sDZIzZ8ZXFn9BPgu17iLfV4NcZtCmjuAdqGLi7vZ6Ab0p5moAHMUZ2SUWjC3BXzK+UwmJXBGtWlV3k/fqLMV6AlPLJ2MCDx00eC9A3DwecaViuFmvb1One/k1ND229MM8/y+ZP8v9/SvsUQiiGE/pJNKcQwBknY750exqj6KBuejaHZiy/SwbCFyQBemsGBunp6aL10CGfva4xwWyQvIEMmlieO7pieMVop8BSVmgBu4bjoLaOPzW7J3GY6shBOM/PET+SlLQ5QmNQpuA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9face027-9f79-4713-c4fb-08de864a6028
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 06:31:53.5367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SY0UxL2wuKCSNL6+m0DdYiPCRmFP8rJiQm9eznVSoUL/PcJfT6RUwx7KSOSJFh6rYdnf7Qvlj9Hcm/GlL5epfymGa7d0xqsFMEDJu4TgCjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7099
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

Hi Sowmiya,

On 3/20/2026 11:23 AM, Naladala, Ramanaidu wrote:
> Hi Sowmiya,
>
> Thanks for the review.
>
> On 1/21/2026 10:28 AM, S, Sowmiya wrote:
>> Hi Ramanaidu,
>>
>>> -----Original Message-----
>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of 
>>> Naladala
>>> Ramanaidu
>>> Sent: 21 January 2026 05:43
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Naladala, Ramanaidu
>>> <ramanaidu.naladala@intel.com>
>>> Subject: [PATCH i-g-t v1] kms/feature_discovery: Add VRR capability 
>>> subtest per
>>> output
>>>
>>> Add a dynamic "vrr" subtest that checks vrr capability on each 
>>> connected
>>> output, skipping if the driver or output lacks VRR support.
>>>
>>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>>> ---
>>>   tests/kms_feature_discovery.c | 19 +++++++++++++++++++
>>>   1 file changed, 19 insertions(+)
>>>
>>> diff --git a/tests/kms_feature_discovery.c 
>>> b/tests/kms_feature_discovery.c
>>> index da80ecf66..bf36740cf 100644
>>> --- a/tests/kms_feature_discovery.c
>>> +++ b/tests/kms_feature_discovery.c
>>> @@ -60,6 +60,10 @@
>>>    * Description: Make sure that we have eDP panel with PSR2 support.
>>>    * Mega feature: PSR
>>>    *
>>> + * SUBTEST: vrr
>>> + * Description: Make sure that we have VRR support on output.
>>> + * Mega feature: Adaptive Sync
>>> + *
>>>    * SUBTEST: dp-mst
>>>    * Description: Make sure that we have DP-MST configuration.
>>>    *
>>> @@ -155,6 +159,21 @@ int igt_main() {
>>>               igt_require(psr_sink_support(fd, debugfs_fd,
>>> PSR_MODE_2, NULL));
>>>           }
>>>
>>> +        igt_describe("Make sure that we have VRR support on
>>> output.");
>> Use igt_skip_on_f, so only the current dynamic subtest is skipped, 
>> not the entire test.
>
> Sure, I will update the logic to use igt_skip_on_f.
When converting from igt_skip to igt_skip_on_if it introduced a 
LONG_LINE warning in checkpatch. To avoid this, I am proceeding with the 
if + igt_skip approach instead.
>
> FYI, Using igt_skip also skips only the current dynamic subtest, not 
> the entire test.
>
>>
>> Regards,
>> Sowmiya
>>
>>> +        igt_subtest_with_dynamic("vrr") {
>>> +            igt_output_t *output;
>>> +
>>> +            for_each_connected_output(&display, output) {
>>> +                igt_dynamic_f("%s", output->name) {
>>> +                    if (!igt_output_has_prop(output,
>>> IGT_CONNECTOR_VRR_CAPABLE))
>>> +                        igt_skip("Driver not supports
>>> VRR.\n");
>>> +
>>> +                    if (!igt_output_get_prop(output,
>>> IGT_CONNECTOR_VRR_CAPABLE))
>>> +                        igt_skip("Output not supports
>>> VRR.\n");
>>> +                }
>>> +            }
>>> +        }
>>> +
>>>           igt_describe("Make sure that we have DP-MST configuration.");
>>>           igt_subtest("dp-mst") {
>>>               struct kmstest_connector_config config;
>>> -- 
>>> 2.43.0
> Regards,
> Ramanaidu N.
