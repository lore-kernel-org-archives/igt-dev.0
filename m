Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0DECD98F8
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 08:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BAF10F4B8;
	Fri, 19 Jun 2026 08:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JquNAVlw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9837F10F4B8
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781859196; x=1813395196;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CITF0XDBgTR6mCAO1/AYzerr4uYmtkt+B1GDKJkw7sE=;
 b=JquNAVlwDTlCjBXZCRTNr4N0DYTIiLT4Tl2oZxXESFzeydlKmesk8fm6
 6a1bE+Gt83qDdTJD7EdorHH26nHijVbUNALYc1k1clTsbkT7EuPKI/iTj
 F/NmfPikIiwYpJEq+zPIoeEdJ6vAH7Q+DWNjj8bNyi3DuNJ9sCpgCNa21
 +aAjgqZnWpAG6ZS/4vZL/Y8SV0sU6AthpfX8gfEJnJZ3ypBNUe4YG6+8O
 X60O8omLHrd/4Ymf+KmsKE188M+SyFQZHhPUTlkdmGSFkB65N1wfbOD5i
 8HGctoQqtZDsB/LYzXK0W4vtGgiB9btg7qqzqzytrd0Nr8AFzEsdSziZB w==;
X-CSE-ConnectionGUID: o7IHfoemSeWXTfSm77IYPA==
X-CSE-MsgGUID: KTi1R+VuTBmKupy5HbtLGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81686915"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="81686915"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 01:53:16 -0700
X-CSE-ConnectionGUID: YpWrrZ9PSC26VqyrTu1w0Q==
X-CSE-MsgGUID: xlXBSxp0TDapFiahNnfYgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="248657090"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 01:53:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 01:53:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 01:53:15 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 01:53:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnXtbClC3gYjzm+R3/b6wH74ldNrbjPG38zDWe0qbXC+wFL08BdX+R4h/0gXxURVtcwfLerarQteP2y7WEBuKO/km1bskHA2VYcpJMNrrikqkuSPnkUjv4NYyam40jw5+M7kEJfc0TyCPhJAknU47nstvkenEOF1ynzwSTDTGSCM+0SyQH4clB5gE0TA4NEhXb1vJio08AxbRaydjOn91K6SmXS48Kk/P1nsehcCiGHBGlJ/afmS6HPatbIOXQZqfAPKyxFeVQe/zX8GPmmulEinFOuHEZvzFw2AiiQM+GgbQrOZ3MGPzJaUB82udD/yaWHqxypIhxFa+850us8/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bonjF3MJpRifUMtC09b/vbVHKhoiz4qo9sEqk3cPo0=;
 b=QjPE2JcOZQc9aJNPn7yCuOwR+YXE8f7wO8/5tpBTwYIbrBsl1YNIwx1SsKKWuN2eNwqWWcRlgeJVgSL/jnbp6wfKNc69xUf7riYfo/s3R461FbDjd7lectP4AvWzOagrnNv1tvArXyOov8zhYWuyWUDo2sfYO3gf0Vw+tqUBG9tRQ3obfpzFLIuc6jEViO+CypjSn7/EtYFmhiBbzpPL5csDw9AlRCWQuJy+rUMbcpV4EwHoeIm13vLcSJlRTg14z2886pnwuP2snhH5jwf/+uXbVY8t7rPcEYnpEfNHN06CKDeZd2O2gQdPdS11SuI39hUrFngMxzBvHEi3nABrhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CO1PR11MB4961.namprd11.prod.outlook.com (2603:10b6:303:93::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 08:53:04 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 08:53:04 +0000
Message-ID: <62cd8d5a-75f2-456d-81e4-0431444f4ba3@intel.com>
Date: Fri, 19 Jun 2026 14:22:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/xe_pmu: Fix gt-frequency failure with raised min
 freq
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260616193656.2131881-2-sk.anirban@intel.com>
 <11d084b2-d028-478d-a48a-e0ef21975b76@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <11d084b2-d028-478d-a48a-e0ef21975b76@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0230.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::14) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|CO1PR11MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: 9660eed9-218f-40cf-9727-08decde02c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: QPxweqzRcSqp71NEc94PM++L6MKDt5/LGiuLXbfZXMwjIEhuESr7Sp+3SGxpeN5cRFzjLBo7muclWZxK8AAie/b7BPms+QgAVcUcg0pbjzMrvyV1BMVdOw5kwzqMII0/TI/g7KFzsCNDspt2ujGHdhX3HRkLrjn3N6Fy5tF1BAq3RG/zyAW4JEUufDcjEV82ijhBd2+WHUL8/DbYC64DyaXM89L4mas5drj9VNoR9Bwk4mOtNx4C6oNkjokusnai1Q8pxLJbk0Unhm5nCVa3KvP5DECLgCuGKn8CSwe2HUIMiBKgGOZuR0wsKh7mQdWAvFdPgJizV+XN1MKYH3A8ySgYw1+1OKQv7FBmPRjHjQBSes8ww76+V5fU0eDvE/NF79vnSU9s2rt8jWQiJMbG5GMoZsuLNgJzB7oVwHD21uDGcaxSs1v1An5L+75ZUrxVJ8+9wSylP/yD9n5x+c5vypFBfGUePxlQIlCjOkFGsh26ozxzl7jraeX3MukmXyF0PPFHn6j8hC8r6OecPsZeOjFB56BSxcWeCpPnG7xYTtDZY8d71tcKeDK52I1Jn0BgWytaFGUkAvZ5CNwlLlxIeKdQLXhEh6ZkivR/1Lebou8/Dz0Skb43n24OPtAVen47
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MENZekowdmJ3c08zcnBFeThmMzQ2NkFlMThHaFgwLzVNY0ZVVnA0SzFLRnBy?=
 =?utf-8?B?UGxWc2ZxSnUwZktoM1Ewb0RsVjZhd1k2OGJsajhSL3RvL2FDQUE1MGh5MC9X?=
 =?utf-8?B?SFQzeWFMVmROa0VRL3BYRmFGMlF3UU1mcU1XL2ZOS1FEV3djRmhxaTNGa1J0?=
 =?utf-8?B?S2N0UTNCdmpkVkg2NTlRak1rZGlnc1B1bElHOUxYRGNLZWRPN2xPNmdqYkk4?=
 =?utf-8?B?d0VYU3BaMmt0QkRXRi9QZ3NRZHhDb3RiZGtSVDBFME1EeTZVN2dWMFpmckVW?=
 =?utf-8?B?T1FaSFNBNnFPc2loQVhFQzg1b3EySTVmaXVTS0NIN0pUbVNhV2w2QVYrUFpw?=
 =?utf-8?B?SzRkNzRBT2dVcW9SVDdqQjV3dis3SUp3MHdDcTdxSXlBZ2FBL3pINnhGckxL?=
 =?utf-8?B?Q01pM05yalJ3QWpWNXpKV0hOMjZrN0h5b1JRbW5oUXBFZTdwQU9ORExXVU4v?=
 =?utf-8?B?dlVIclJYOE04RXlrMCtYZFJnelFObFJxUHpkaGpvZDFpeGtyMHNwdGowa3JQ?=
 =?utf-8?B?ZDgybDlBcXczY08zVG9kNGxULy9qR1UrWWV5T0tEb2l2a3VXck9rM0dZOVls?=
 =?utf-8?B?MTJMZTd4MWJEenozcHhkcHZRUnl2Q2FuU0MzTTdsR0V1OEx0cnRJVWNLL0Z1?=
 =?utf-8?B?ZXFoVENlYVhwbGJWZTluRTRUb1VaemN2bWJJYWR2amdnaE9xNVlzZmpqTGRC?=
 =?utf-8?B?eWltdXFVQUhsaHA4V0p2WEJ2R0N3OGdCRnQ5MWc5alZhQkJRSzRZNHdTaHVP?=
 =?utf-8?B?SDRsNXJVcVEvL0N1MktscXJpbWdqZVBwblc1dkRZKzd3YzYxSEh2UDdYN2lD?=
 =?utf-8?B?STNybkhBd2ViZzFCWVFxRkt3QjROWmYwbUJlUUVoaGdhT3J5MlJObGVMcVZG?=
 =?utf-8?B?WnBBUFVocmpaMWR3OEV3dkxQYnBWRFU4UE1kZzdYcjRSTm5oT3o0QUlyS1Bq?=
 =?utf-8?B?SGNnRUhTM1EraEVFdk1GbDdUbS80Z1pWVlNYcnJyYk5xRW1SUFIydmJWSFM3?=
 =?utf-8?B?cHVodmRPKzRxY1NCSW50czMwYklYSzhtOHo1OHd1TmVhNTN0eWhqQ3Q2VkJP?=
 =?utf-8?B?Rm5UZEZGQU45dnJWTktudlNTK3hKUFAvZjFkczc0eGR0OFRENG9sTlltb1dl?=
 =?utf-8?B?enZOUXFrL29lMW9ORnJ5MFdkaGtIQ1M4OW8xSzhJM2YrMXZlQk1COUtPWWhs?=
 =?utf-8?B?MkF0eTVwK3pwRG9IMVFuOXFqYWdsVmJha1hmcTRmaFprN0JkL01HSG9LRzVD?=
 =?utf-8?B?MGRxRlBjZmRCQkNINDNaVFgvZERJaFFUeU54d2p3OThvMkJ0bTcyeUY5ZVA5?=
 =?utf-8?B?RmJhZTRjYk94QXJ0T3JVZTRFc0dsYVRDVXBXdFVJMEZQOStUK3Fkc3U1c0c2?=
 =?utf-8?B?MlcrS3ZyMXR0bnFTaDhNVStLdEZ1WGdaeFN4SFZFbnRHcnoxYjNZZlpRVWhj?=
 =?utf-8?B?dXFCaFM3RTNnaUl3WHNtN2xkbm8wSGtUeE1rS0RrOElxa1Yra3ZKRzRHTlBk?=
 =?utf-8?B?ZzN1bGlXUXFFR2c3bnBYSmlNUDF4T0I1WSsyakp1TCsvNWNnNDQvV1ZqTzNq?=
 =?utf-8?B?WkpPYjljREtsK0JaTTVqVzdFU3o0WXo0YWdRK2ordHlZb0VlZnZNajh0SVRP?=
 =?utf-8?B?ZXhBWjMyOStnUjRkb2w4ZFdUSyt0eHlwZ3NaZUtzWTBaVUVESkRXRS8wRDJP?=
 =?utf-8?B?aUxUcmt0OE1KWnVNS1AyYVNhNE9RVTFJUHBUeWViVFRuayt4dWpvQllCWS9w?=
 =?utf-8?B?aEU2ZEIxemFqUHdqbkdqL2pDT2w1MDAwNXhhQlNyaWhKUmlXZ2JrY3pTYzJq?=
 =?utf-8?B?V1NRYmJBcUpIV0JCSkVFVVVXVWdyeGtNbXpvK1NUaGZkL1RaUTNRMi9aQlZv?=
 =?utf-8?B?NERkVVNlZ3VNMko4WVZwb0pMUUtabXBuZFhMVlc3UlRGemlBL0dJVE9BK2R3?=
 =?utf-8?B?RWVxbUFoUXhKVGxWTU9LVG43ZzAzdisyQUJsNnhRZlI2Sjl1cy9CRUtuK2xu?=
 =?utf-8?B?dm1sU3pna3h4VzEvbHd5VkFHa1JERVlSanNwL0J4c2hMQTJhZ0xZczBQWVh2?=
 =?utf-8?B?MTJLcUNlSytOeXVYOWlhcjRtUEZQVXVCWjZxRFFCNG1HVXdaVzA4aGtvK25C?=
 =?utf-8?B?eW8vS3lNMDFScjhrM2lBeHhnVzNtS2hCREYzVWZsS3M5SC9wVGk1RUF6RDAw?=
 =?utf-8?B?Qks4Y045c09JZVFyL1o1bllXdjFMbXFNS0d6SkoxdmhaRng1NGZOQlRGYTli?=
 =?utf-8?B?d2lsR3p5S1BXRXFodTgrWEo4czRPY1B5ckZPYzNwWVoxd0ZSYmNKNlhBZ0xJ?=
 =?utf-8?B?cWU0MzdFZTZqc29IWFpyL3lJYmI1aWpVd1FUREt3NXJaUGVMVnhxQT09?=
X-Exchange-RoutingPolicyChecked: lAEKZYeRUeNNh51P0wQzXYlSdZNdUt0nEwMKIU2E2hpaFHgIh9Jl2cb6YJEPnsTROC21uTCAx0b/3y0AU4Td9/3yn6Iu1RxpFXqFsrqvgF+5CfKSn8V6FiMT9DtDw5hsRuZo6AOG7ZUxzVjGfONGrX2e0ko4DeeJr/+KF2rbWYm0SyiTamT9bkthbcDnSE1ML8fcSAKbOIiXHxj1JrvFMcVNXxivcToqbPzpiDH1LmnrViX7GE6DXaqRy7nD5jPBNoihSKeckcCKzNhbADTvLru78+c94lqLTjE3pcCoiiadfazWGQP3zpBzmhypvQ42cR+uH6oNfMLktk/uK13WcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9660eed9-218f-40cf-9727-08decde02c97
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 08:53:04.1867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHjU7y+4GYrYhjUduPUnyZ95dYRLUTtpsN7P83TdkAYnis1oTR1lH7Qu2PhawnE/iSxy0ODsaWyc4vxoYJSHwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
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

Hi,

On 17-06-2026 11:02 pm, Belgaumkar, Vinay wrote:
>
> On 6/16/2026 12:36 PM, Sk Anirban wrote:
>> The gt-frequency subtest can fail when the min frequency has
>> already been raised above RPn before the test begins. Using that
>> value as the original minimum prevents the later min_freq write
>> from enabling the GuC ignore_efficient_freq parameter, so min_freq
>> can keep moving toward RPe.
>>
>> Save RPn as the minimum baseline instead, ensuring the min_freq
>> write enables ignore_efficient_freq and the final restore check
>> returns min_freq to RPn.
> It'll be good to mention RPe fluctuates dynamically based on thermal 
> conditions, so better to test with RPn, which is fixed.

Sure, I will update that.

Thanks,

Anirban

>>
>> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/issues/8344
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_pmu.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index fb4b871e7..4bbc801a1 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -903,10 +903,8 @@ static void test_gt_frequency(int fd, struct 
>> drm_xe_engine_class_instance *eci)
>>       unsigned long config_rq_freq, config_act_freq;
>>       double min[2], max[2];
>>       uint32_t gt = eci->gt_id;
>> -    uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
>> +    uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "rpn");
>>       uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
>> -    uint32_t current_min;
>> -    uint32_t orig_rpe;
>>       uint32_t vm;
>>       int pmu_fd[2];
>>   @@ -956,9 +954,7 @@ static void test_gt_frequency(int fd, struct 
>> drm_xe_engine_class_instance *eci)
>>        * Restore min/max.
>>        */
>>       igt_assert(xe_gt_set_freq(fd, gt, "min", orig_min) > 0);
>> -    orig_rpe = xe_gt_get_freq(fd, gt, "rpe");
>> -    current_min = xe_gt_get_freq(fd, gt, "min");
>> -    igt_assert(current_min == orig_min || current_min == orig_rpe);
>> +    igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min);
>
> LGTM,
>
> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
>>         igt_info("Minimum frequency: requested %.1f, actual %.1f\n",
>>            min[0], min[1]);
