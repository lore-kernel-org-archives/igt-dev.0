Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B4CC5AC67
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 11:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0F910E6FF;
	Tue, 11 Aug 2026 11:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dz3K6M55";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6D610E27F
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 11:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786449216; x=1817985216;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6unCOfvUdpg1cACJuZcFkZA6PuzQbbFwVapF3iy+7S0=;
 b=dz3K6M55vVrSZji6UshYmYq9O0RMG8xo4UgVMYb26nG9wwhgbJwcEt8E
 MbF1wgyLsyNa6DUiWxPDQDELbmIczGxKfnIIdVl7Zl+1+nJuQHq5vr0iY
 7Wk3AJtJylLC5VuXqyb12EGWJ3VXF0kptJD+8VKET4ZIGAD18qhZCeJeW
 xTt1jXpYNokkMO8xz4IycHH6ssEp5K/1u+a+J8BnZ/JKQaWn5hMwbEXsJ
 BJivXg0+qRquOAfbl39lubMrczNQXJoMJO2xeUn9s52jnv74I/9yuTZPq
 T0ZNVyVYyLru92ULIqGsiCbM0awyFrA9BDmohGkWQTj955/feYBefzJ9I A==;
X-CSE-ConnectionGUID: 0tHZgWFpT/Cl5dxelRRUKw==
X-CSE-MsgGUID: gdASoIRrQRe1RwuOmrwKqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="74510943"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="74510943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 04:53:36 -0700
X-CSE-ConnectionGUID: kL4CEx24Tgm7E5MfY+IQaA==
X-CSE-MsgGUID: 0ZLScnZjSxyoSMHtl/h39g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="301537423"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 04:53:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 04:53:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 04:53:34 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 04:53:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtqBKTvFfCxQAk6eUpRbF4WdsY9WpTVj6UaXQcX5p4K79K0NVPcfC1Zj4WVWjqmSDlRHTXsFBVT1qa7NVy8I/F4x5vA3VvevMSU0uHXw5fUnE9wKZa9Hw/Ff8n6Id79eZIbd+0J1DUS9ntM0d9dVHtymkniZVcvbx345KdqcUwNrFjl/LxyKEiQqQHd7dOwMJ9e74CI4OS56869qH9vMowHUgaUpdgL2FmIqYFq/k4iPrubpW68MlP2/6Eb/FcHtvJmNkBCeZi8xgoZtM1krOc7nYFGgJ39dJE4zvhio3SumX9SjFx7vtsq5g0Ri/hCvM7Zx5RK4D/M1xAeFAeXKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RTaOQ2Zzx49NZKjZHIxOzTbl8YQtglAwNol5oPMzMs=;
 b=g6+zwgwokuiqShqnN59SsJcKWSsybLIK0oxZYLerpckwZvi088rZVriUxtjfJrmeCyjVt6SIRdRjgqmUwdTI4SGalokwthDyQdwfaoV0/6HzDOC3RWp/PJja5EpOeB1IUrxt5HtRxjxzX20m3RXz0XaAEKZjYiKA67JnMfQIPSH79qspm04yl8miKOnhILJAT1suFVqBfaX6UsmlbGFSU6IV29RoTn+hstHNf/t0gp/sUIk4L4Hq15UJEyulvd+B6hMpC7jssjkZSTumMoWBhIiuJpvN02hrKFSmiLOvTTM/aeaba9l/fR6h2aIb9sQtIMR1HOWoT5Yf53jgHENDGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 IA0PR11MB7861.namprd11.prod.outlook.com (2603:10b6:208:3de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 11:53:29 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 11:53:29 +0000
Message-ID: <0118cf0a-a1cd-4654-997f-c61696244693@intel.com>
Date: Tue, 11 Aug 2026 17:23:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] lib/igt_drm_netlink: add get_error_threshold command
 support
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>,
 <raag.jadav@intel.com>
References: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
 <20260729121959.603890-4-ravi.kishore.koppuravuri@intel.com>
 <anZm7vt-fj_qtHph@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <anZm7vt-fj_qtHph@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0090.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::14) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|IA0PR11MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ba59b9-7d0e-42b7-ea5f-08def79f28e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: RaBeTJVs9BZFa6pia6NOf0tE9y6JEEyoHs2jsFf30ygm29jlMrex534GnO5lVB3qyN2R6Ejhj0iTM7QXcdeNdwgEv/9mdeb+Unk5XrmxD7k1q0jrh2kYQryKuSFldOT3SO0IKMbRsHzSLCboAiCpXrVNX2QvMbc//sKWcv8AtsFvUVTBgTc7yaCnOeHDaQX9cHKYSgaCqSkXjsOZf/6JJ2lmzMNxrzoyDdk5H2aUC83Xs2l1/mmMuuiXT9ubgj+86NBUDtNsp2aOz3gQcFgihNmVSxrwCTI8OrLiqyfMCZkGFFtn2kZCrRry5ZT2Tmflf0EQ0UeLFeIXRpWCDv41GPWaUUV79286vliLoJuSD4FFyT2XjmT7ROcIv/afFxdLjUXiANtfLUa1l/s44RMLJ9HUZewf4Mke/p8yPijX0w/iQ0Oc3Y9QfBc/8LeXo+1RdaZ52fuHPHuOI6VPLTIxNLZIBwt3rEnyyPnncF4GGfUaf48FrsjAaWNxl7NpDw/uoZ9Dv/kz3eo8f7ltW7mc41JAZwoCcwfbcGjlf649r02aN6X7vVyc6UQpLiQH2+ZIy/h0iJ2Uh8AkPtIwdcEoDTsaXvxdp0Bx27JvcwO2ZdNixk9NpEMBBFUKnnKV9sCFsMejOIiErikRafAQJJNHLHSo4+FxyEKMiVL8tFJJq3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjRQbFdIQW1NOGljVkV2VVpscGdxZU5ydUVDdXgrM0tRQVVrUERvcnVpRFVw?=
 =?utf-8?B?TUdmMzRyQXRCZ2RQYS9IMmZtdUZQajlSYnZRVDJ6aTMvcVUyZnRYb2VrSWdH?=
 =?utf-8?B?SUpXdkloeFVxVHY1d292Q3RyYWdOOU5weFNhMit3T1JqVXBqZlRCWEdIZDRq?=
 =?utf-8?B?cDNNbFJueGt6dzJqUWVvTEZTTEpMTzJ6dUk0MlBRUXlpY0s3WFNQU1lxVTla?=
 =?utf-8?B?Y0E5V2Z6ZFZsb2RLSStyRkoySWdQOExGOVFlM3FJVmoyb1pTODYrU2RYdUpt?=
 =?utf-8?B?NSt3Tm1xZkFYVkI3eDlKUVpHeDBmWmkyaVI2NGlmejhWRUNxQ3Y0QjJ2TlJh?=
 =?utf-8?B?NGR4YXVkSEx1bjM0ZmZRek9iZG83bHZ3Zy9Wam5kbWszbThIZHd3SkIvL0Nv?=
 =?utf-8?B?bnVUc0tHM0tzamwwRElUTmhrZXdZY202N3lFN21wQ0tmeVVLUVdJVkU0NDJ2?=
 =?utf-8?B?K1pJZXUyVCswT0Rac25WUXdlclcydUhYV3VqNGU2UDl4QnNENmo5MmpQRUZR?=
 =?utf-8?B?MHZldXNJMUd3TDZOUndCTE1NdFl2TnljRnR6OHBjRzRVbWhrcWhnNFA3bHZI?=
 =?utf-8?B?OVNUMU5tQ05jUFVUaUJ1ZVM5UC9CaVczZjNVclFuNkx4SlM0R2V2WE9KNU9B?=
 =?utf-8?B?YTRaWlVyQUpXNjR6RUJHTjc5WTk5djRtQzQrN0JqclBLZmk3aFQ2RzRlelg2?=
 =?utf-8?B?Um9LMTg2eXhjdjRZUWtMYWhCWis1VmM0SHBaRGNUQ1YyMXRSSVFLV0p1NXA3?=
 =?utf-8?B?OTlPVXlNVnpqS0hCSXBnbDVScmJOc21QcDdyWVVWclBBZGpEVzNhSDhTcXJ4?=
 =?utf-8?B?NWxNdUtuSWtHMjNndWo0cFJsVnNBWEloVFhiNFkxV1Y1YzRrTWhJdnJsR0tX?=
 =?utf-8?B?S09ZYThTZHIzOGxlSHJ3RkRYd0xSV0t3UkZqRFkzQXZTcVQ5OGFWVTJJMERL?=
 =?utf-8?B?ZFpxaTVnZ0VaNFZNbmxZYWlwdTZkWU1lWUlyUDlqaVY0THlzWjVRSWhoU3JU?=
 =?utf-8?B?eGJ3ZEFaa1BEVGRrSU0vZlErdzlWc0crd2RhU0h0amVibFJwMFZ5akFGcXJa?=
 =?utf-8?B?ZmR6bzJyVllKZ3pzOGZ2V2F5MXZpL2l4RVVYclNSWmFBR1JkcjFYNXgzYk41?=
 =?utf-8?B?b3llNUp5NUxBNktqV0dLV1pPQ2tUbGpPUXQxNzJkdVE5YUhmTGhiYlFrWWRt?=
 =?utf-8?B?MjZ6ZGFoS09STzcxdUEyeklMcnJINXp0S3RTdlIzczlFVXZnMzNDRGFia0FK?=
 =?utf-8?B?QUtadlhzNlY1NUhWK01DUFdxSk8wSUwyZGVTMlJHSEwzSm5SWEloK3lnZUxF?=
 =?utf-8?B?S1QzcHVjZCtaQzExVHcrM3ZlNU9JK1hDaXFBVW5qVVFuR0IzZlRpc2NzbVFw?=
 =?utf-8?B?WGVjdzMxeFlmNWFpa0swdm4vMHR1MVU3aXRQSkNqSnNGN3FCd2szU1VCU0ll?=
 =?utf-8?B?Qi93Q3ROZEYyWEpzM2VhZWtxUDJibEJxanJCVE91M253b2liYnh5bnNHbm96?=
 =?utf-8?B?bGNreU9MUGJ2Tit1dGxFa0Y0OXdsMm94NkFhekx5ZEJaNDN4T09xemxLbWVl?=
 =?utf-8?B?eWpCdWdxaERMdFhIaFJIZk5sVWUzRW5WV1VPaHpiemlyVkFhU2dkYjYwaXpD?=
 =?utf-8?B?ejVjK2xjM09vZkxxeXkvQVlwaE9LMjFVZzBPYlJkamVDak9hY0lXbkpvNCtZ?=
 =?utf-8?B?Umo0eW5rOUhkWFJXSTVMRTZoMmkweEV4b0llZmRIU1MraUptaGNXekZtdEtQ?=
 =?utf-8?B?UC9yOVF6QUNKVnNiVXNHdEpPSEM0VVFRaTVHNFU2cTRoRXVlQWtucWE4VDVw?=
 =?utf-8?B?WUV1SENUQm93UWRyT1FnRzBVV3JKanRuSVZsdWdXaGhXeE55UklGVkhwMStD?=
 =?utf-8?B?MGZZeWY2ajlISzRpSUFmVkxJaTE0R3FpLzl6Y2h6STc1S0hVOHZ1dEtONWNq?=
 =?utf-8?B?T3hCSEtBSkFMaURIQ1RMOUhHdDBrZVRNVDFjWWE5TjR4ZW8xV2RoRi96ZHND?=
 =?utf-8?B?VHo0QnZDYmgzeThTMzFQWlZUYkJjaTRIS1VPN0phM3lZYXlYTS8xTkVvTGx0?=
 =?utf-8?B?d3ZNdzBic21KUjdTWEhkUmt2UG1KMko4R29sQUhHQWNKNHBwMzhyeHhDT25a?=
 =?utf-8?B?U2M5elZHaHBFVC85QVpMN0ZZSTI0cVF2b2Z5eUlZMjBXYVdRWU9FZUFseDlh?=
 =?utf-8?B?cGtaYTRzdXY1RWZNMzZkaGxvcDZWUUg2T2tzSVZPeW5oU1BHOGF2SXhCZkNK?=
 =?utf-8?B?MmxhcTBUZG1VdURreFJseUE5U2hqRm1WbGo2QmN6VkJFdU1aTGRJSEdsNFA2?=
 =?utf-8?B?cmpaSFd0ZGRCa0h2SXdkRzZ6NDNhNlhaSVJTck0raXc3ZzRobWZqUlJjVWJX?=
 =?utf-8?Q?YSvbiHREfBooBC+D4adf1cUtVE+CYEw8cFspN?=
X-Exchange-RoutingPolicyChecked: gdpaF5/tDpZcL4oHleBEIAPcWX/F3AB4Nlkl38Fmao624ONDeIDboActnNt8v9WIcdQqDVC6y64cOcp0PtQZB3KTlpzRUgucGmQbJkOryFm6UUpnSHwetBJs+lLn7xJvutDbJ8ZaBJrmlPWsKUlTD3qjas4tGI9HBwcFYmHms8Tk5vPGKvdXyI+i6vFcJwKWe2tq+G01t2rmwkZwLhFVN2peaRWYvNzbSUZuP5Vcr/wcPPWgtLNw7MPJL651SL8Pr1q2ztUsWEx7dxpxKIte+LzQp3xRK7KiIPyLMxm4j0RDZLpc1PHEYFVr1R15EGfnZRuQUN8t4poo5mRIbjjQAg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ba59b9-7d0e-42b7-ea5f-08def79f28e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:53:29.5131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCxt0Av69wi8DKIbgZxaiDymkWMD2UPxuEj7T70bEc9FF/6KatqcxiYsWaasXiTCAX3SV8xs8gdQR7MOiBYS4SPEqu8H+0aFP3FbVmR57clHh2HSIiqUSLLabPMm1h6c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7861
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


On 08-08-2026 04:44, Harish Chegondi wrote:
> On Wed, Jul 29, 2026 at 05:49:54PM +0530, Ravi Kishore Koppuravuri wrote:
>> Add support for GET_ERROR_THRESHOLD to fetch the current value of error
>> threshold
>>
>> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
>> ---
>>   include/drm-uapi/drm_ras.h | 18 +++++++++++++
>>   lib/igt_drm_netlink.c      | 53 +++++++++++++++++++++++++++++++++++---
>>   lib/igt_drm_netlink.h      |  2 ++
>>   3 files changed, 70 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
>> index 218a3ee86..60611833b 100644
>> --- a/include/drm-uapi/drm_ras.h
>> +++ b/include/drm-uapi/drm_ras.h
>> @@ -33,18 +33,36 @@ enum {
>>   	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>>   	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
>>   	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
>>   
>>   	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
>>   	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
>>   };
>>   
>> +enum {
>> +	DRM_RAS_A_ERROR_EVENT_ATTRS_DEVICE_NAME = 1,
>> +	DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID,
>> +	DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_NAME,
>> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID,
>> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_NAME,
>> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE,
>> +
>> +	__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX,
>> +	DRM_RAS_A_ERROR_EVENT_ATTRS_MAX = (__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX - 1)
> The above enums are not used anywhere in this patch?

Same response as mentioned for previous commits. This file is the UAPI 
header file directly taken from the Kernel (as it
is, not modified anything here). In my opinion, better not to alter 
anything in this header

>> +};
>> +
>>   enum {
>>   	DRM_RAS_CMD_LIST_NODES = 1,
>>   	DRM_RAS_CMD_GET_ERROR_COUNTER,
>>   	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
>> +	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
>> +	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
>> +	DRM_RAS_CMD_ERROR_EVENT,
> DRM_RAS_CMD_SET_ERROR_THRESHOLD and DRM_RAS_CMD_ERROR_EVENT are not
> used in this patch?
>>   
>>   	__DRM_RAS_CMD_MAX,
>>   	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
>>   };
>>   
>> +#define DRM_RAS_MCGRP_ERROR_NOTIFY	"error-notify"
> Same here. DRM_RAS_MCGRP_ERROR_NOTIFY not used in this patch?
>> +
>>   #endif /* _UAPI_LINUX_DRM_RAS_H */
>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>> index 4d543275d..036660a6a 100644
>> --- a/lib/igt_drm_netlink.c
>> +++ b/lib/igt_drm_netlink.c
>> @@ -43,6 +43,21 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>>   		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
>>   		break;
>>   	}
>> +	case DRM_RAS_CMD_GET_ERROR_THRESHOLD: {
>> +		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>> +
>> +		ret = genlmsg_parse(nlh, 0, attrs,
>> +				    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
>> +		if (ret < 0)
>> +			return NL_SKIP;
>> +
>> +		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD])
>> +			return NL_SKIP;
>> +
>> +		ctx->error_threshold =
>> +			nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
>> +		break;
>> +	}
>>   	default:
>>   		return NL_SKIP;
>>   	}
>> @@ -94,6 +109,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
>>   	}
>>   
>>   	switch (cmd) {
>> +	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
>>   	case DRM_RAS_CMD_GET_ERROR_COUNTER:
>>   		ret = nla_put_u32(msg,
>>   				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>> @@ -141,6 +157,7 @@ int init_app_context(struct app_context *ctx)
>>   	ctx->node_id = UINT32_MAX;
>>   	ctx->error_id = UINT32_MAX;
>>   	ctx->error_value = 0;
>> +	ctx->error_threshold = 0;
>>   	ctx->family_id = -1;
>>   
>>   	return 0;
>> @@ -155,6 +172,7 @@ void cleanup_app_context(struct app_context *ctx)
>>   	ctx->node_id = UINT32_MAX;
>>   	ctx->error_id = UINT32_MAX;
>>   	ctx->error_value = 0;
>> +	ctx->error_threshold = 0;
>>   	ctx->family_id = -1;
>>   }
>>   
>> @@ -206,10 +224,8 @@ int init_nl_socket(struct app_context *ctx)
>>   	return 0;
>>   }
>>   
>> -int get_error_counter(struct app_context *ctx)
>> +static int validate_inputs(struct app_context *ctx, uint8_t cmd)
>>   {
>> -	int ret;
>> -
>>   	if (!ctx || !ctx->sock || ctx->family_id < 0)
>>   		return -EINVAL;
>>   
>> @@ -222,6 +238,17 @@ int get_error_counter(struct app_context *ctx)
>>   		return -EINVAL;
>>   	}
>>   
>> +	return 0;
>> +}
>> +
>> +int get_error_counter(struct app_context *ctx)
>> +{
>> +	int ret;
>> +
>> +	ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
>> +	if (ret < 0)
>> +		return ret;
>> +
>>   	ctx->error_value = 0;
>>   
>>   	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
>> @@ -233,3 +260,23 @@ int get_error_counter(struct app_context *ctx)
>>   
>>   	return 0;
>>   }
>> +
>> +int get_error_threshold(struct app_context *ctx)
>> +{
>> +	int ret;
>> +
>> +	ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ctx->error_threshold = 0;
>> +
>> +	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	igt_debug("Retrieved error threshold: node_id=%u error_id=%u threshold=%u\n",
>> +		  ctx->node_id, ctx->error_id, ctx->error_threshold);
>> +
>> +	return 0;
>> +}
>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>> index e539bc030..fae9b0e06 100644
>> --- a/lib/igt_drm_netlink.h
>> +++ b/lib/igt_drm_netlink.h
>> @@ -23,6 +23,7 @@ struct app_context {
>>   	uint32_t node_id;
>>   	uint32_t error_id;
>>   	uint32_t error_value;
>> +	uint32_t error_threshold;
>>   	int family_id;
>>   };
>>   
>> @@ -31,6 +32,7 @@ void cleanup_app_context(struct app_context *ctx);
>>   void cleanup_nl_socket(struct app_context *ctx);
>>   int init_nl_socket(struct app_context *ctx);
>>   int get_error_counter(struct app_context *ctx);
>> +int get_error_threshold(struct app_context *ctx);
>>   
>>   #endif /* IGT_DRM_NETLINK_H */
>>   
>> -- 
>> 2.34.1
>>
