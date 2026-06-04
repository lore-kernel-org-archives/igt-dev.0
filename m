Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4BDCD6E68
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 07:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A9D113D21;
	Thu,  4 Jun 2026 07:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWCfS9ae";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A1A113D22
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 07:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780557735; x=1812093735;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u+eO9bqqnkrA8LzN8IbMQlylq4IFqvCXZc+oMmEsuhY=;
 b=jWCfS9aefWegAKGHFpsECLFWo+II+HPr7KcerIxYq05AxJMZLH09gHDk
 Mc3JUoD69YI905laQhjK0nKY0Gh9uf3O5SANJp3afMVGwkqddoqPn4icC
 H3Y9XkuiPpoC1Z+fPir3oElZVmyy+fiNLUctNG6yJjKkg+jS3M2bXHbUc
 PnQRnP/GkQhgV4eno4qmSiIg58r8x+FdMTQuEfjsVOtW8+fqc/F3aN98k
 kJip7OARGbXvVE/g8v91WKI/MXYpONLTT9aXNyLu8ioNX+nd6GClXnSsh
 XbMaoVofGPUJHv6C/4AT92xEEoq7gu9lOCR0DGNtKq9WxhcLFpDRX1uDY w==;
X-CSE-ConnectionGUID: Pr5BrNirSM68EU4qv/G6YQ==
X-CSE-MsgGUID: tzOU8RQ4TGmXvdE/Pmh3xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="85268034"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="85268034"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 00:22:14 -0700
X-CSE-ConnectionGUID: BoiY3W2+R+KinLrfqwWWdQ==
X-CSE-MsgGUID: ZWAofANgR9y4B25y4rlUBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="249390009"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 00:22:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 00:22:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 00:22:14 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 00:22:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2qDyuBj11xi6sLomkLqgAqjdz3xo5AvvaVWtYVxHKpQwsHvuew48wkWgpgaY2crwzR0ariRNf3c92Xj9muvhYeLs09m9wlT/fw2JvHNXqNUUBGrUgXkJ0GHwaCIwe2PkGnzNGYExpqKbMU9PpxjQay45Oom9Tcr/5uVzJrV4UE0TEY77OLATiBlSmegi/saTlsbRcNjXEirA/RadVPlD1TbH/eiVW8sZzGMLpH2QXPVQ/yuvhJVSEy/BjDeLhfZpueq33Nci5UGIw22JNuK2Rf0VMgu1tMl8ao5MXnc1WM5H5N8/1Dm0pxP5gxQMb7CrRnayFO9M5GPwPKT9Lu9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeqW/Qvv9FHFhWHPlXYd5rifsWf76PkS2FIB58KHdCE=;
 b=oIdFo7nli+AzvEal358n/oEQsf75XppPCg5zEVPS3QmIyUAAHBXHVTn0ai4Eaf40qwaRksUyLzF9uzia1Dl59MfjEQyIuYlbMsZA0blEmIQcTQ2SsmWQ6HGESxm79HL921cYEO5sOymYd6DSqwk6DDdx3uhVgnEUdMa6aLO1fHgGZjxeaywqYSk3Xm7JjuhlXJ2/t0TspA1rS+mKOW/9KE6isVEs0Gw9DDA6zJO6UqKZ3hIN29OJJR1scCFEjnyIhsEC+lSkiFiRJuNGA361fQ3uyrKTkbvsw4EUr/pqYRyHfaAX+F/7JOgPz0U/6/zHd85nd9mo8XbilNbSjuC4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SN7PR11MB7044.namprd11.prod.outlook.com (2603:10b6:806:29b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 07:22:10 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 07:22:10 +0000
Message-ID: <760d09d4-34ae-4e27-89e6-021f3bf1df14@intel.com>
Date: Thu, 4 Jun 2026 12:52:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 3/3] tests/intel/kms_pipe_stress: use
 ARGB8888/LINEAR for cursor framebuffer
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260602162422.3360253-1-sowmiya.s@intel.com>
 <20260602162422.3360253-4-sowmiya.s@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260602162422.3360253-4-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::13) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SN7PR11MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cab6bb9-d68f-4c6b-8077-08dec209fdba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: UJ3XnraEnFMYhLNAGRVoqP5f15iiaW5nES9RlAieumhU6xCaBNqaK7c5vNJXSr37GwfNgGUK43cDmIwIVKfPyxfIS6lohRMMwYavophX7mRq//70pAXoHLs4q5Zm3fOSA2V3WR9kzvcppdPr6k5pC2hoOXB9c0D8tMs56TWBodi69P0gblZ+3+VpIlb0u+DQUu9o15C2SHijSatRF+JWmgfLUKEUQhpiKK0cARwl+qmWqZbbkxPxU7sXtxQFNGCRcexCVos8Cnjnp8QbALNwjFCPj0OaWFDRk/cM5tNFa9wgTAoaW8Ma43s/+FAzxffxZuZj+Qb/PixqPBSiCpet18NpR7nG5sK9g2BTx2zDLU0Rdui83fk3of9SQ0hLdO+fFEeskPgx6upoGkpt+9LyZY9nYKbXPE2qKmyF05/1qJuJfZql+xzZZEeoT8WhFUYOI85D4qoOy2nvi4og+gjWKlpA1hBt3kBfpmjFRsXGjGpsfeqDsymQhAVQE2Z9W4WWkJE7Mo2u26f77B+vkZa4MolulXOQCM1ryfV5wDhmGcIoimWwteeIhMgX5hqhf+PTQf4gydup6CN8/EM9rfMShjCOAR1+IJbPUFf0kMqTFF0q14e72S1xSl6M8iZruuh9JHBeHqt/30w3IiEes+tqlEuBgQ1bMePf2whDbuSqtF5Y4lmGU/zx5hjz3ObHBEp8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUtzNDdENTVySlgzY0U2REx1MWFNSWxJOVcrRDVHeHllbm5pVm1PUzRrdUsv?=
 =?utf-8?B?NWpWMG5VdTRSKys2MzdVMEpvSlY2WFBNLytSQTM1bWM2QzYrZ3dReHRqSVZT?=
 =?utf-8?B?TzRRYmk0aFBheU9GSnJLOEIyWS9EZmFjSk9Hd2dtL0VwZG1UVWd2NG1BaHNi?=
 =?utf-8?B?V1ZuNnNoMm04UnBPY2xJUFRGSHQxQzFJVGJ5OEZpUzYzU1pVZFlhd3FKb3Ft?=
 =?utf-8?B?MWFMeVZSTVc4OFR0eHo1UzNJczZJY0RBRlhSVGtOaDNMU0hWUm5qTlo1QzVZ?=
 =?utf-8?B?Sk9NTHZrWXd6R2FHYWo4Y2RxUEphS0tpNnJqTExDSWhJREl2enZYUDlMSStw?=
 =?utf-8?B?S3BvaVpaRm1mb3pyNVF1T3NYb0xIVjFFcGd4eVNXMXJLdmhpbk9jbFNjbEFm?=
 =?utf-8?B?cXNMVGNoMTRKV003d0N6cFlaRVNFdWppT0I1RjEvdHhvbkhONzZpc3lqakJR?=
 =?utf-8?B?bllXQUtQNSsxa3lHL3RMRTRUa0ROSzBXWU9hamRUeG9NS214SHdFNmpOS001?=
 =?utf-8?B?SVF3MjF1dlF0aEhpNFZMeERlK1Q2MXlLbmg5Mjk4QVpHR29mM1M0bzFiYVZv?=
 =?utf-8?B?am1QTVdSZ3BXMkppbEVLWnV5eE9EaGtZWFA1MDhZL3pPcUNRNy9Ed1BId2tl?=
 =?utf-8?B?alNLZWtjb0FIRCtFUGpZd2VVb0tVU0RhRm0zeU5YekhmblhQN0lwVERQaUph?=
 =?utf-8?B?TmhVYklVeWtWOVJkR1RsNC91NUMwYUs3UjEvV2dWSG9BNUNPamtOdWdPZ1ZR?=
 =?utf-8?B?WHoxLzNweGZaLys0WnBPMmdhVU85aHk1V0JxNU9UWW9oVDZmc2RtYjE5VS9X?=
 =?utf-8?B?cHo4bmZDUWlEbCttYnZyTjBTSTZLaVF1NmtWbnk5NTExS2t2T2M2cEhDaDcx?=
 =?utf-8?B?aHZMUG1CVDRyTWFuaTZZSUE1MlA4M2hQMnEyaTJVZHRnenB0elhmTWNsN0RS?=
 =?utf-8?B?VTUrOWM3QlBvcGp2c1UvNXh1WllkNDQwTzZWSThkbEZNU0Z1eTl1anM2SXZa?=
 =?utf-8?B?dm1zemZJa0F6ZWs2TUFYUmtDMGhtcVJRUnJyZU45bi9WY3h1MHdYNXZnZnJs?=
 =?utf-8?B?eTkvdi9qRjhYMGhqZktCbmVySjZwbE1hcVc1TkhaV0diaTYvKzdVNnI1S29G?=
 =?utf-8?B?bWN4V25vZ2lhYnVFTXpMYnc3V1JMejNVL2U2WjE1OExXaGJEMmNYOU1XeEZu?=
 =?utf-8?B?ekU0MFlwSmMvL29DVGY3bXNiQksyWEU3NXJRYzlMYVNlemFhbkxKMGZZcFU3?=
 =?utf-8?B?VmNzTUsrRjhpK3hHaWJyL3Mzc2NsTkQxU0RlRkhVZWVmK21NTFk0bVRkcjUx?=
 =?utf-8?B?QytWblIzZW1DaUd0NVQ0VjhtMDJFT1ZnM2gyRlB0UEx5UktyTVdlWlhkczdY?=
 =?utf-8?B?T0FNKzJvRXBJcVpMMXMwM0tOT0FrWXNqd3dEM0hmbzlwUlBMMk01ZzVxVnlk?=
 =?utf-8?B?dDVGWXdRcGpQZEphMU1lekhoZlJPTDFqU0VERGRoV1ZNZ1FkMS9LWDNTa1lR?=
 =?utf-8?B?KzF3TEdoZFBnc0cxWUw2ZG80R0x6SXpRTDAvUDBPaEMzaWQ1UVJZUW9nWUVk?=
 =?utf-8?B?VUlHNFpGUFhqNEpaeEFZRE5FZ0RKbXBjUlFMSnFMcTZ6WnFNeHBlQXZsWnMr?=
 =?utf-8?B?YVhISGZaaDVkVG84MEJzSHF1SWxtUTZHOVRJV3Z4Vld1b3RVMHJFU0F1Y1Y3?=
 =?utf-8?B?QXc5bEhITjZjVTIxSGdzMmxteDIzVVlQZWdEQzRQRk9sK25wdE10QXY5bms0?=
 =?utf-8?B?RExWZUk4NjZDZ2QyNTdIQlc4VytzY2JFaUtYSzZQemg0Wm1aU0pFZVE2QUNo?=
 =?utf-8?B?dmY2T25uOW9GMjdpRFpkRFZUMncwcEU5ZWE4cEkrVE1IY2cwRXI1U1g5c3k2?=
 =?utf-8?B?RjkxTEp6a1kyeENrejZrV0lpcVA2WFByMlUrRkU3YkZRY1hmejNhTUFOb1A2?=
 =?utf-8?B?aG5xeFY0OTcydk5STWU4ZEFZbkN2cm1LVUdZVFV1aWhkeW1weDNjNkYzTm16?=
 =?utf-8?B?WURYRkkvUjVDcFAvQXFxMHJyYmcwUS82U1BJUDZETVRGdnNtK3czMFFnRnRO?=
 =?utf-8?B?V21sSk9hTkw1RURxVUZyUjlUT0hQMWg4WTlYa0tZd0NBWFV1Zm5sWXMrZWtr?=
 =?utf-8?B?TE9HWjlqTEZEV0M2ZXdpTzdFV3ZMbkdBcjlNVGdCZDhyNFc0UFdVa04xejBk?=
 =?utf-8?B?aE5Wb1FnbS9SWmJUTWZqeUNYTW9FRGttZ0JGZTVJZTN4Qkh0VjJXcENrQ0N3?=
 =?utf-8?B?dHp3R1dMWDAyekszdFZGZlVsNS9SdEN5SmlSL0xZUGMwR285SmlDQ2xpcWFT?=
 =?utf-8?B?Y2N0OU1WV2kyTEc2QVFCZWszWE9rNDJiZHVqRUVQYnhQZ2FFWWVSaHZocURM?=
 =?utf-8?Q?pU5h4l1amRSV3RvlHhEcE1baWNUCIaHFBFPxN?=
X-Exchange-RoutingPolicyChecked: Sh0x4ibMVtIoZlZqTaibEWxadIed9SbIxfTb+YWictc8kIl0URb5cXQ4ivPilUrYJJA3Q0FOxxp5570l6tHm2KYxTEWnnIm081btFnK2zU7FdDLScoGuWvQExk3o8NXwG2B9/8xDgLvI/Y5X3BlnUcfjGsPWdV4pC3xFZ7XgtRMnNM2DwlhH0Jd46IGZmJ/09G0hkhg3HmIT3oTL6Eh07D4Hd08V6ch6VrEHuAfbjK8toVgQtuOAwJdkIyyQVJzSz8HepLBZtzRRYm4O0ur3KTJ6oyYIEvn8zNixfvglbn96RK9LCmWUUAaNwoO9c+3RVTNW3SsiysMw9kIav/DBdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cab6bb9-d68f-4c6b-8077-08dec209fdba
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 07:22:10.2065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifjbYbGT4gxNyl5DvTNQj3eRSisLEallD7k95vi1vzRerDGZhQ44zL80R+RINgDVrWELSJ9RA8B35tQoray4SNUQk2o8BwfXiLSN6fpkDuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7044
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



On 6/2/2026 9:54 PM, Sowmiya S wrote:
> Cursor planes on Intel hardware accept only

nit: s/accept/accepts

> DRM_FORMAT_MOD_LINEAR, regardless of the overlay
> format and modifier used by the test variant. Using

and DRM_FORMAT_ARGB8888, unlike the formats and modifier
used for primary and overlay planes in the test.

Other than that LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>


> data->modifier (e.g. 4-tiled) caused -EINVAL on the
> cursor commit.
> Bspec: 69833
> 
> v2: Add bspec reference in commit message (Swati)
> 
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_pipe_stress.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index a84433b9d..5362fe9f3 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -736,8 +736,8 @@ static void create_framebuffers(struct data *data)
>   		if (!data->cursor_fb[i].fb_id) {
>   			igt_create_color_fb(data->drm_fd,
>   					    cursor_width, cursor_height,
> -					    data->format,
> -					    data->modifier,
> +					    DRM_FORMAT_ARGB8888,
> +					    DRM_FORMAT_MOD_LINEAR,
>   					    1.0, 0.0, 0.0,
>   					    &data->cursor_fb[i]);
>   		}

