Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7A9C98302
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 05:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889E710E7F2;
	Wed, 23 Sep 2026 05:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZNZjgnrS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB39410E7F2
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 05:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790141155; x=1821677155;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bm8avNIF136975hkuuCaZ2ECdjGPXd91dA1UQKaljPU=;
 b=ZNZjgnrS3AqpFQxxqnRfjlZH4xzzqPtPSV7R2UP/Fe4b3cmstDqiWxD8
 8UdOVOeI32HxB3fMqPZ/oLlSOIeTENCkwSBuwu3+5fNsWU0yW+irdbqlf
 ub8FNwIQSfldzep6wlLR6BURtpyhMM/IqSAjkTQ9WtU6LHLwq8WNHxS/6
 jjR8Em3RRIPbsvzpOcE/wXtHrDLj2r9j1pQnXZnmTIBnrTntyOVsX7wSr
 1VeUqAvfb6o8qa1zv0Bx8U2RGkQRRpcYldJ8RTNgYP1Xnu6eBYLygKh+4
 lKYlB2QfgUEjwRRY2ntgnWlFRlepiXDcXK4txRvHHSQ7KKcSFeVM66gri w==;
X-CSE-ConnectionGUID: /pXUWWVTSWit/B4AwVukTg==
X-CSE-MsgGUID: 96mRLP+7RkiWM2wVdfQmcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="108299592"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="108299592"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 22:25:52 -0700
X-CSE-ConnectionGUID: c/LtEl2RSs2XS1okZHALjw==
X-CSE-MsgGUID: U9mA8yOoRLe0xMGSLJYT/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="301368934"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 22:25:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 22:25:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 22:25:51 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 22:25:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kN3KBDVHV4+E2OAe+N6jyQmKofQU7k1mTJG+qB9WdyoHjldG/uOj1AjUs9rictM8Jgh+XE2ZaBdDzk1oWdyBFGV3zSroBOcoFBoLlUEuVEQc5XVOS8ZGuGQjxVj3CYYTC6hAhvFANgugBOSxvuOG00QKhix5JifntL45v+TTPXCvP9PT3r2gH+N66kOaFutsyJkih4c1GYnpxzNq0qUKC9uHQrMFAPi8ty7sghYfBLDFGiGCpVMITebaBilzkrIokMUOfTnhvp2U4YiCkgTJzk1QWvYBijMweq5PP1Tsp/NSI+7iYC7hyOEUyKg2fS3ieGOkF/iGgfUgFix15ffcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Mzj1Y15u/d7LHcD0rEGA0m3SUBCKcKp2Z1i1zwDMFk=;
 b=ag+O/8VwzRk4SGAIvGeT7RquVVJyNk6n8HuSGp0aiZB6W2SiruAtJt/cUBmHiVdbn/j7+ZJPJqMP83pSLY6ZnDvYkzezBkzKI4zpGRW/evVAwMK965f1B0gCwqM7wPJrcbkG9wgyGnkDOH0tjmO8PPpRuDsm/MpSS4YONUwXqyIhoq6l17P9JWZahUZpgnAbYmCzHkbmI7lMH89LIUJqvzsbS+XMpmKO1qkLoXHwwYgu/sxM//yAJdX76rpVw9ONGMw5REOs3ke/Vqm8F730t670PsVHRVRh1tJUhqQgwUbgtadgAkS54fN39O53e/2Qt6VAHCDQW4FF6on6ddifdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8600.namprd11.prod.outlook.com (2603:10b6:510:30a::18)
 by MN0PR11MB6009.namprd11.prod.outlook.com (2603:10b6:208:370::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 05:25:49 +0000
Received: from PH7PR11MB8600.namprd11.prod.outlook.com
 ([fe80::b93:cb17:6e06:2580]) by PH7PR11MB8600.namprd11.prod.outlook.com
 ([fe80::b93:cb17:6e06:2580%6]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 05:25:49 +0000
Message-ID: <5a5c41f9-ddfc-46c0-9006-b6ee5ce8638e@intel.com>
Date: Wed, 23 Sep 2026 10:55:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tools/xe-perf-recorder: Wait for
 mmio-trigger-report
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260905012055.494831-1-ashutosh.dixit@intel.com>
 <0f298bf3-1a08-4210-a7c7-fd8e0db89947@intel.com>
Content-Language: en-US
In-Reply-To: <0f298bf3-1a08-4210-a7c7-fd8e0db89947@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0282.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::7) To PH7PR11MB8600.namprd11.prod.outlook.com
 (2603:10b6:510:30a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8600:EE_|MN0PR11MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7a6c1c-ff07-46dd-9859-08df193320b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: eRdKQPuTHYj8FrIy+3EHPV+PYel8G0odKMZ8PnAlRhkCLKGaD6RWl3nJVINuSNQMUycHGcUJ+I8t3cHXSYqm05MUrqNrIDGO3yz74gmlEcYRlf8VGUxTIU8x/6sERd5QLQrZzbyFxSuxeo/fKZNmIfMhKPokbzQsqzmDFbiA5Bb2YMxlErqip8vZfDGM6KXiEXw4k/h/+69F9I0MNx+l3+HO7K7V8Oxsm+iuSLMNfSItUTQh2q6e0uzUBIC/hUPN1yww04TNFS4clHWEfyYk0wjV320D+i5Y+t05Rp+gxbKmBud78qQiH6BTWI47aSY+Ra9gSok6oEKN8SlqFui9MIkOM77fVOHt2ZFNZHKQfb/5yiZudqQSppEOgdYZhsM7LBY4eZzUQID2ou4JRROl+/6TZVa0PKMlZ1BPWGrmVYKVgNM8okBztEVI6pkhwaSjg/rPI81nTwPhL/Kgun//tkNLgRhYtbmKBAIxQ1aSJUf9ng2g3IFY/t51R03Vq8GLKJ8vm6h6+YT64HYAJMIaGrBb/M33w/Jf1UN4R34g7T/hxQ4pxrU203r6p2zbWHyq83ZYUrhcP6OJzI69tYN1sFIVDo3FjsjlV6K+8XZ0EDErkFqLaRenUNDIUTJJ1ylhoOLE824M0ku2VHooDeGI85G0QRNo1BlfKaGycLNgTzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8600.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3JFQUM3VWVOQkh4UENWWE9kRUV3dWc5cnFxWVZJNmRFNnFqMWZrT3kvSzc5?=
 =?utf-8?B?NWZOVitPcUNYR3dsOXpnSWZyK202R0V2UHljeFByOHR2cWttWG5zNmJXREdz?=
 =?utf-8?B?Y1diRzZSbUUzbFZkWGJmbUFUem16bUoza1R6Z09GK1dza2NsckpXTWtXeUJu?=
 =?utf-8?B?ditkRXFPYmpUWk9KTk44Z3JYaHFLVEQyamFTU2MwYWFRaDJpK21TdDJnQ0dh?=
 =?utf-8?B?T2QvblRDbkhYb0lvV0ZQdWVkbjdDMkczM3FZaDV2WXN6K0d3dDE2SmZpbnY2?=
 =?utf-8?B?NjVBUjhEMElnMHdPcGc2aVQwQkY1d21aaTNNZEdqY21jbTdBUGVyZ21NYjhs?=
 =?utf-8?B?WVRKYk02QzNNaDgvY0JTc0xMVXNpU3BWS2huQlJvMjBQT0ZaN1VRakRzSVVh?=
 =?utf-8?B?Y3RRVTFkZWdQUStxaTZmTUwzQW1KRktHYkZCQ3JtSXNFUVp4L0ZWOFdvbVo2?=
 =?utf-8?B?T0FycHVuT1dwdmY0djZWai9VUlZ2ZVhmUjMwSHhxdUFBV3ZWc0JFQzlUb3F4?=
 =?utf-8?B?bWt5YzZxb09NdTVhZHdRSmdZbE9zS3JqK3BLWVdhN3dBMko3Y3J3NTFsNTEz?=
 =?utf-8?B?Wmwxa2RMeXMvWXpQU3g5ODJaUW9SWERWaXZCNnVPN05TSnBuNTc2RUY5bHF3?=
 =?utf-8?B?b2daQWMvK3o5WDVyY0t6MHpqTEtualZQcEdna0FLM1VzbXpzN2E3RHNVNnlo?=
 =?utf-8?B?VFRIekhKcDJvRUs1Ty9kZjZyU3EwSEg2TGZna3ZqeVdXb1YwckVYc3VHQkY5?=
 =?utf-8?B?TWhjYVJKb0Y2bHpQK0lyWFJYUkpOcTRpTkU4WDV5U0xnQXZ6RlJwVFo5dllL?=
 =?utf-8?B?WXc5YlVrd0JOV1lIckEvTExlSitLMXp6SndXekd4Nzd3NU5HcmVBTmtvZjU2?=
 =?utf-8?B?WXlUcTF3VmFSMmJ3NGlIdG82SndSNzNjU0x5VWV1VHIzRVlSQjU1aE4yRUR2?=
 =?utf-8?B?VGdHNldxR2Q1UldoVE9SVVJYYzhRcG4rektvZTdVY0xGaERONURYSXBMU1A2?=
 =?utf-8?B?YUFkQXZxKzVia0ZKYXpBMjFMaUpCMzhhT0xwZ2F4SjR2RlVpZXRFTjljbXZu?=
 =?utf-8?B?c2tpd3pNVC9WOEpubHE4Ui8zUkNqZWJZejJhT0lHZHZqNDIySW5DLzN2YWVQ?=
 =?utf-8?B?RDgyNFQvU1F6VFkreWR1TVJpMkdSNkJzNHlzVTIwc3FsdGNSNFhPRUJ1cnQ2?=
 =?utf-8?B?NWRnZUtzZGN1c1M5czNGWW8yVU5vQUl3VkFIVUhLZ3hhSit1dk1iQzBaRlZT?=
 =?utf-8?B?bVBqVWpTUDU0NGMrRElXZFRYREc2TThtNndnR0ZRS0JCalhuNENDRVhhU2l2?=
 =?utf-8?B?a0hINm4zcjJsZ2FKdDI2MVUzRXRKcHdocWhIc0ZMS0xvQmdpaGUxOFlkckV6?=
 =?utf-8?B?YnFJSXZGZnhFVWlIRU9mMUhkV1UzT3dCOTM2SVpZU1J0VEdiTEtzUDQ0Y2dG?=
 =?utf-8?B?TTRXaVQrZm5maGk2MCtGRnhQeVhSYTYwSytGUEVJZUZhNmtyRjZlNC8xWWtS?=
 =?utf-8?B?QzNmREZaTU9nWFM5V0U4RVZXcWVGRnZzTndRb2VjTHR1MEhndkgxeFdTbnZh?=
 =?utf-8?B?YVR2Q0VRaWRJZVJRVWZYMnI2VFdzd3FNNDFDZnI1ZWNNZ1JyZnRZOFpuN3JS?=
 =?utf-8?B?VWxxRkpkeVk2VWNGbjEvUFJpcXdWZWJlUk8reW5jbTNtY3g4dUZBSzdDYkc4?=
 =?utf-8?B?clJzRFBieG9rcnZTanJ6bitDcWJNWW5xSFJSK2xiR1RBS094K2hXMG5ta2M4?=
 =?utf-8?B?bWdiU1l2dDc4bGN3Y1dSRzhjb0RmSklpaThsMlo0NmdrazQraDEzcGVkdVVn?=
 =?utf-8?B?eHBseTdqRHROd3RKRTlneWh0clU1M3FMNnlld1Z3b3pOWS9rdFhaYnRyZURG?=
 =?utf-8?B?UVNjVVBYd1ZkSjFibllXM1J0aHlCcjZIZUwxYjN4aFJVVzcyTGZQbUd2VUdM?=
 =?utf-8?B?ZE41M0ozYmhqNUJuZzh3azhHaHp4OXpJQWJiOWxmK2VydDBCdEtnODBrbzBI?=
 =?utf-8?B?VmVpLzV3eUg5aVJpclQwekVnbjVqMTZIbUdIdlc4dHdBOTYra25IMkV6VFM0?=
 =?utf-8?B?WURkc0c1d01LZmhwWjdqcUpSRnJUNDI1YnkwV2ZwWEtLZmxDQVhVOXhMWlNk?=
 =?utf-8?B?ZkhMZ0NkS2ttTlR0NXAzRXhSNzBlSFhNVE5IZDdPZmF2TjRVWkxDdWdLSXNG?=
 =?utf-8?B?VEplb29uVE1LNG1lOHdKTVBIcFFOQlVJOEgwRHZad1k1Y2p0aDEwcGp6bUl1?=
 =?utf-8?B?cmNNVVZHUEkwMnVXbkVLaDFLa2orSkJOdmkrTTRMRjQ0OGpJcWVxTkY4UTRn?=
 =?utf-8?B?Rk00Qk55TXJYUGppUThxUGZ6dTZURWZLTjBBTHFsTXB3cGpCSkg5cDUyendi?=
 =?utf-8?Q?BibXiPDX2VKE4GYw=3D?=
X-Exchange-RoutingPolicyChecked: OPqwkZZxZvgUbsOpe1cbLQTeEdepRHdoOdIZoklQPmxgL1Uby9d8j7ktpq2g8KaJ8ELlUejb1kNSzZQl+AYAjTRp7vkjh/3wjp33hTVOI16rf6lvpWO06iUEddBvmKM4VjZ8EPC+Ik35yYn+9Y8o1uCTprTPZAv+e525noZWGcH6aYggHpa/dt5ov0whvw9MMbCn+XUk9/mEDGdfcCB8ve1eiWxQOlnlUTQpe6mKtwvMXwoePMSRM0/TD05IzZrpb1ctCvt9CC0lmKlMZVTFQrbAO4+/jzzEhY1oyU/1AIGkQ8VKZQYt2zKB74OX56wMaHSxKsBr1uXtie6LhtY4yQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7a6c1c-ff07-46dd-9859-08df193320b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8600.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 05:25:49.4221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mksPIQztvjXMiZI79hsf25IGm5DGS7RmQh2Y/P6zZEyzawqHkLQFU8cZqKU7q5MuGsWnfeBWfSYFh1BLXEq5kwCwYa0QmV/HbVW/SIK41Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6009
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


On 9/21/2026 12:10, Shekhar Chauhan wrote:
>
> On 9/5/2026 6:50, Ashutosh Dixit wrote:
>> After mmio trigger is issued, we should wait till we receive a report 
>> with
>> the context id issued in the mmio trigger.
>>
>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> ---
>>   tools/xe-perf/xe_perf_recorder.c | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)

Plus (other than my last comment, read below), I tested this patch and 
it works fine:

$ sudo ./build/tools/xe-perf/xe-perf-recorder -m "RenderBasic" -o 
/tmp/v2.record.renderbasic
Device name=pantherlake gen=30 id=0xb081 oa_unit=0 gt=0
Writing recoding to /tmp/v2.record.renderbasic
Using correlation clock: monotonic
Opening perf stream with metric_id=1 oa_exponent=14 oa_format=11
Received trigger report with value 0xc0ffee01
^CReceived trigger report with value 0xc0ffee02
Exiting...

So, we're not breaking anything with this change.

-shekhar

>>
>> diff --git a/tools/xe-perf/xe_perf_recorder.c 
>> b/tools/xe-perf/xe_perf_recorder.c
>> index e13eef5190..cb7ca67bdb 100644
>> --- a/tools/xe-perf/xe_perf_recorder.c
>> +++ b/tools/xe-perf/xe_perf_recorder.c
>> @@ -370,6 +370,7 @@ struct recording_context {
>>       uint32_t vm;
>>       uint32_t exec_queue;
>>       struct intel_bb *ibb;
>> +    uint32_t mmio_trg_val;
>>   };
>>     static uint32_t oa_unit_mmio_trigger_reg(struct recording_context 
>> *ctx)
>> @@ -642,13 +643,15 @@ check_mmio_trigger_report(struct 
>> recording_context *ctx, const void *report)
>>       const uint32_t *report_32 = report;
>>       uint64_t value;
>>   -    if (report_reason(report_32))
>> +    if (!ctx->mmio_trg_val || report_reason(report_32))
>>           return;
>>         value = (fmt->header == HDR_64_BIT) ? ((const uint64_t 
>> *)report)[2] : report_32[2];
>>   -    if (value == 0xc0ffee01 || value == 0xc0ffee02)
>> +    if (value == ctx->mmio_trg_val) {
>>           fprintf(stdout, "Received trigger report with value 0x%" 
>> PRIx64 "\n", value);
>> +        ctx->mmio_trg_val = 0;
>> +    }
>>   }
>>     static bool write_stream_data(struct recording_context *ctx,
>> @@ -712,6 +715,18 @@ static bool write_perf_data(FILE *output, struct 
>> recording_context *ctx)
>>       return false;
>>   }
>>   +static void write_mmio_trigger_data(struct recording_context *ctx)
>> +{
>> +    struct pollfd pollfd = { .fd = ctx->perf_fd, .events = POLLIN };
>> +
>> +    while (ctx->mmio_trg_val) {
>> +        poll(&pollfd, 1, -1);
>> +        assert(pollfd.revents & POLLIN);
>> +
>> +        write_perf_data(ctx->output_stream, ctx);
>> +    }
>> +}
>
> On a write failure, write_stream_data() bails out in the middle, and 
> some reports are dropped without being checked for the trigger value.  
> If the trigger is one of them, this while loop spins forever.  I think 
> we should use a return value (maybe a bool value) and bail out when 
> write_perf_data() fails so the error reaches main() instead of looping 
> forever.  Something like v1.
>
> Rest looks fine to me.
>
> -shekhar
>
>> +
>>   static clock_t correlation_clock_id = CLOCK_MONOTONIC;
>>     static const char *
>> @@ -797,6 +812,9 @@ static void emit_oa_trigger(struct 
>> recording_context *ctx, uint32_t value)
>>       intel_bb_flush_render(ctx->ibb);
>>       intel_bb_sync(ctx->ibb);
>>       intel_bb_reset(ctx->ibb, false);
>> +
>> +    ctx->mmio_trg_val = value;
>> +    write_mmio_trigger_data(ctx);
>>   }
>>     static void
>> @@ -815,7 +833,6 @@ read_command_file(struct recording_context *ctx)
>>           FILE *file;
>>             emit_oa_trigger(ctx, 0xc0ffee02);
>> -        write_perf_data(ctx->output_stream, ctx);
>>             while (offset < len &&
>>                  ((ret = read(ctx->command_fifo_fd,
>
-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

