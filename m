Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317E0107638D
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 17:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A7910ED9C;
	Wed,  1 Apr 2026 17:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhWzN3Zq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DCC10ED9C
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 17:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775066058; x=1806602058;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mScA7Rr1Xg9ZcvEcLyEZJRWzx8+Sed21H9mZNE7VomQ=;
 b=bhWzN3ZqX0fps7iAcnfRkYWci2pZrJhosKEhMA8CB1QTIU30L6M3a5TU
 gbjDhjpi211DaefMxccl7d3GeoasEYe0CccA+cxOiWgdYqKp5jm9O2wDC
 RUud7bxx6Pstr1kqZoIGJWmrzEbc4A7xzv6is8XWLi8zpvnf0FophMp6h
 6xoH094ZvDHs2epyFUBqoFFcQHvGTHgCZeCUeG+pGohm9iWRSTd7bLFJR
 7ZTRv8UCNWlS9V152X7mv9CNyY6Tj7s6aOQplODT7UTPwi5FQK2N+vIMu
 Wzs5Jzc02cVUr41YVpgttzg51qz8paUmh1IKUK5hAxzKyXRrRgPxbAlS8 g==;
X-CSE-ConnectionGUID: RKyUz4m4TrujEj1dQRWmSQ==
X-CSE-MsgGUID: MbEVE2lpQWWoaYk43TgoBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75994707"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75994707"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 10:54:18 -0700
X-CSE-ConnectionGUID: XtnziJtcSf2Y1W6WPCqBxg==
X-CSE-MsgGUID: ZYF+DKLHTkaExaYc+f417w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="249956250"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 10:54:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 10:54:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 10:54:17 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 10:54:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4cI5WQ5UK6OTbCw13fYyvqo0/aqjYbKnfsT3WKj7zHNAgTYhwINnqHNolnEq4Tggr0EwTpIobT5pZ2gXQVvFpC6wr9Ka0DevMNiT0OkntN2CQgnzdT8hsOCn8xRGgMA/cr/2Xw3bbSW4To4HoGa/4LtEmEQgENsCqSr3etg4lWJNjVNhmoDuLeIMsCzHPwCw7FFjeM6xb1RdY+owHqmnQ3RwMdMRw1jkhV0jmFY0wYNNWAYirsHBPwTTYhe8ikBHOD/b71/sXOr3i8hV/bLJ7Gmk4YNYYMCKKophpw2hBCJjCbT1SR6Zg9EdhOytCvZO5WLQjxxCJUKW88QZ3pRQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrJr9V6+weOSdK7wTnKFa0ZppDFo1QRlqow4nTUFFBc=;
 b=U+XQVfWwBkUyfM1v8bLPrZ4QDui14mdyW+I1MmwOqgdLRjCzbTzLcGMYp+2TQbhLBWRHrNCCJ2HcL/HDbXEnDfzCjm+Hh7PhRpNhgnU6BwURkEI4NOvC77AqNKJKFD7FXgtou7NCZRbGWA1CbycBdaxQcyXRxhMqWNE5S03Y1grKKO14f9tTEUknfdtDthz4qDMYIpVbWasnLwpjUczajM7FzPet0ShpLu8p0xskKgysUSkCQ06KiyF99fWXHWHEaH948R5usOk7LeatpFNKDEZnD6l9DejCpwrDdbXDBZ0qV84Ssa98kaaSMUbBJUehyG60K4ouc/89GhiqWJYHCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 by CH3PR11MB7249.namprd11.prod.outlook.com (2603:10b6:610:146::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 17:54:14 +0000
Received: from PH7PR11MB8033.namprd11.prod.outlook.com
 ([fe80::3aa3:869a:aaf2:c8dc]) by PH7PR11MB8033.namprd11.prod.outlook.com
 ([fe80::3aa3:869a:aaf2:c8dc%4]) with mapi id 15.20.9769.017; Wed, 1 Apr 2026
 17:54:14 +0000
Message-ID: <b19b1853-6f32-4b45-b807-072e8514ed42@intel.com>
Date: Wed, 1 Apr 2026 10:54:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 4/4] tests/xe_pat: Verify PAT entries contain
 expected values
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20260401135343.2874239-6-zbigniew.kempczynski@intel.com>
 <20260401135343.2874239-10-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260401135343.2874239-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::10) To PH7PR11MB8033.namprd11.prod.outlook.com
 (2603:10b6:510:246::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8033:EE_|CH3PR11MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: 8160a422-ffae-45ed-8bdb-08de9017afe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|42112799006|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: D2TpowrIJsm9m6U3koGTfddMp4833moipIk2XqhcYvMxK6TJJ7dw8PL7HC+p1FzR2r/9EO2tNtuYrRdeOVt9f7IqUuLIzbwauj3zT0QXdiGWva4OwJBYvR68otte4jR6FiSCGcI/yHwXz8hY9xSuJXI3H3CbUuoRFdhljlQl8/89UWhZxfCfLM8ggQqwjeDk+vfpD03kGa0cDXcyuKC+BA9IrBmkZSObERVLxiLvHSx8EOzIl4Ijj57OvpIJgkzjHw9bloeiAVPb4602ZZcH0KIBaI3keMtjtKPB7db6JRI4tlQMDRDqR02A8NfihLZm6jo81j6c1MlIK5zw+kBEU3CJsyk5oYoiT9qSqnbiF8vqIe/p/oKYpw+V7svV+NeaeC37AkXCD20dq9Uq3O/OMQxtC9wq8CF4pgljhc09aR58rzafEK3oS3mfdvx0HPusyupAjalFeNklGVwZKFPHClSW+B3T0ZzDGbkPyNQfOvf+zEN62pnZUz8je60heNrrGIIL/bc12vutJw4bECa5FR7VEOOJsf2RqNtZuODGLEmrsXfaqTPPRKVPog/mH7MIUSKwvcfyneAk+cKndCmKGObgGnS1IqH8+rAZxpRpRoKg9P9xb8vEaB6pGkKQE2Al+Pqn7uP2gsDnKXV/8e7XytmuIlKH5Jm7LbnklqKhgghEWELpzXKAYdcBFilVD1iAaFf370nlXP/6ttkMnO2alghGdKLu3du+/q/KyPwhX9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8033.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlUya2hCUTIyUnJHT1ZBM095WmdRcS95Ri9nYzBmYWpiSzZSclZHZFNQeGVJ?=
 =?utf-8?B?Z003QnFlcVZSd2RCNHdLZnRJQW9SSkYrUXZrWnRxbXd0TFgrNEQ2RDlpSUhR?=
 =?utf-8?B?dWM4K1FtdVQ0L01mYlB1Q01WWldEa2Rhbk9RQkFqZDgrVHZWSEIyajFuRms2?=
 =?utf-8?B?U1hmRlBtbU5kVE5sbjFxWEdVdGR4cXE1ZVMzMU54dnJwT0tZTmVVSXhKSU5N?=
 =?utf-8?B?c0JKZnFRTXJDdmtWajJPWE1yN2cxcGNxS3pta3dMNE5NSE9VOE5TTzRiaisw?=
 =?utf-8?B?Mm1TZ0k4MXllT0RLbjdhVzVpYnF3NEVCdFBveHJsUHJyVFd2UTd2V2pTY1Q4?=
 =?utf-8?B?REliUUpPaHA0S09vMGxsRWlWdVo2bFVLM2wxTUpqUHZTTVd0UE5MWEdkMWVP?=
 =?utf-8?B?N3FsakFnMjlrOUM5RnlSMDA1ZDRBb2FEcjBwOVhobWg5enVvOFdEa2llaWxB?=
 =?utf-8?B?bnpyQWM5Y3NqdEM4UjlrSmsvREFVSHFSQlRmRjB1dno3VTNzcjRhOWFQeW5t?=
 =?utf-8?B?N0JwQ2lPRENlRHFGVjF5QTBHNWJEc2ppcmdDU1hGNkpCQk5CTlBlblhnUG5H?=
 =?utf-8?B?UndUdlYrejlJTEtSbWJSVzBKc0pWcnZCQVBkem5yM2g1TldFa20vcDZZNXNJ?=
 =?utf-8?B?NmNTTGJCVHA1clNJVFlhUVdWODF1NHFpc0p3UGNHN2dvZnQzWnM2QkMxWk5U?=
 =?utf-8?B?L2grWDNSb0hHYWJUbmlxUWQ5RWlRZXdTZHVlMGY5UWVTMFBRVC85MFNkQ2o3?=
 =?utf-8?B?bzBGQlJDRWgyMnNEdmcrVldtRWVjQ0hVbnhiYml4ZTJxcTZrSEFEdlptcUZ3?=
 =?utf-8?B?UWRZZUtFaHdFbzdOVE8wYlN0QTRTZVNrU1dPTHdwZGd1QTNkRnVoTVo0YXdE?=
 =?utf-8?B?OTMydlJyWkFOeGR2bk1FWkZvMDJkUkxVTjVRcFUyMXRVQXhEUDJvTE9aOVpv?=
 =?utf-8?B?Umx0VGRoamd5NU55Zlh0WFNsOGFwakhuSmdPUHJmVmEraHRCb2Z3UUtnT3Av?=
 =?utf-8?B?QUp5akpTZGpBWG41Tm41M3NvWU9BcTJOVEZiREkrV3c3dlhaaStxYUI1ZGxa?=
 =?utf-8?B?TnJlQUZyamlpNEgxQk9XREZqTnhLTE81S0g4UFM1bEZHeWxyS2lsTEVLdGlS?=
 =?utf-8?B?M3RLLy9EM09PcmRqaURmTWpOVFNmSEEyenIzTkcxckk4R1F6VGt6S3kySzRh?=
 =?utf-8?B?TXVTbElnRVBueW1JYTNmOXBOQ0lrNXNzQmlyZXZ3bHBJdGp6VWVmZGlVSnBV?=
 =?utf-8?B?cWVHM2RSL29BNlgzMzh5NXFmRTZFZmVvSG91QmUxK01weFF1d3FmOVYxN2pI?=
 =?utf-8?B?UUNTTFhycEg1TWJyLytUL09nTGVLM0lHUGh5TjdQTzIwNktmdEZqOEtwMzBU?=
 =?utf-8?B?YXBEZjltaVZyZ3ZFMERRaVk2eUlUalNwamwyamFMWDJnRXpzOTlVZlRVWk92?=
 =?utf-8?B?UW5lZkVYR0M1WkJJdm1JalhFKzNCYUt4RkVRUThhV1Y1WGRHTlBIT2lMNmIr?=
 =?utf-8?B?Tld3aHFGcUpzUWtHZnVMaDVXQmFvd1lmU0syZXFNeVdncDRvYTdzS3lOc3h0?=
 =?utf-8?B?ekFHMk9GV1RKWTNyYmVhQmU0Y0JhN3pLVmUrd241eG82RVJMZjVZc1p0Q0J6?=
 =?utf-8?B?c1B4UDZTYyt6YTF3aVhxZDA3b01QcGthT0RyZ1pxSFNjQ3FrL3pEam5oTE16?=
 =?utf-8?B?N1BnNCtkQzE1SHRxa1R5K2pneVk0Qkw3MXRteXhudmNoL3lCVVA1bWZydTVy?=
 =?utf-8?B?ZEc0emNSMXVaUUtsZmY0SG8vUkd4eXIrZytWZEFKRm81S05SQ24yK0VlMFZ3?=
 =?utf-8?B?eXNLZFZpSTJZc050b0pnMlVSNGVLNmdoVUVvVDFzbTFhTEd6QWtVc21CaGtT?=
 =?utf-8?B?MkZ3TGhiV1FLdkZuT0RTeXE4aVFCZ1RJUi82dW9ZRFV5RUxocmFNenJPNllh?=
 =?utf-8?B?WW5wbUo5R3dzVVVXbEU5U3IwMTFNS3RoRWJhMWE2WCtrekIyRXZSMkI5OUxB?=
 =?utf-8?B?dVU3ejYzbzZaMHFab1o3Q3VqMUlhZUoydHU1VWVQK0ZyM0luczFINmFwbklr?=
 =?utf-8?B?U0tWdzdVTTFMWkhudFF3RFdZNEplaE9uQ0ViSnRMQ2MyNFlaVGExR0ZJRFE3?=
 =?utf-8?B?SWhHSU9lMHZaempLZmlKSWpTeDVRdHMwM1gvalU4K2Y1TVJxMGJXTTVWOGJh?=
 =?utf-8?B?TU15eXJ4YUtqcXhFZU0wMGp1bW0wdjhpdis2citydGhGQUxsdGk0SGJzYlF4?=
 =?utf-8?B?SU9hUGRwbldHRWlOR2pXR2t2Z1BFUUFxYUw3UXZGNEhWQWNNL1BPTkVZeVF3?=
 =?utf-8?B?eC9wWHZyU3AvaEZXYXY2bVl5THdKVDNkVjFBQ2Z5TFEzeDNUcTBUQT09?=
X-Exchange-RoutingPolicyChecked: XROE2ACeK4/5MQWkqvZtffJuoq4/pz9nqi4S2rEA2rkYxjMyrQdoSZsdLlMIaK+Ppse33OxSBbQEsiVNakaik0M5G2ren1o5mRmPjl4Lkc0eEWD/g6nWTHEqosDHTl4oWV/qunp8ir5YAJ1kmCdT79j5WKeioQjqHmL83NrvsdUGJkITU4O3mvjfXMXWnto49baKEbBGMGJKwhEksdz5GoYxmyx5X6Fgr+SgFJCiz1Yshm9N546fEKYIthIVI9CHg08wWjrsWptroihzc8Z/BV2YUQCUfMHTpVT8Wo088PxnxV8vGip+kD2yUyUoHTDMnF6ZUieOx0MEWQBX+VH6Mw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8160a422-ffae-45ed-8bdb-08de9017afe3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8033.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 17:54:14.4092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hib1shNKtx79cyuOWGg0Kd7GfYKacvCGsOhupbIINwdsKc7pmpGUpSiOa3Z/JgIJUQ1k4k87BYmO6oX3KU2lhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7249
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


On 4/1/2026 06:53, Zbigniew Kempczyński wrote:
> Debugfs exposes PAT entries for different GTs so verify they
> contain expected values. Verify they are correct also in reset
> and suspend scenarios.
>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: X Wang <x.wang@intel.com>
> ---
> v4: Test is rewritten to support PAT + PTA + ATS entries.
> v6: Skip on !pf and assert in case of problem with access PAT (Wang)
> v7: Skip on vf
> ---
>   tests/intel/xe_pat.c | 85 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 85 insertions(+)
>
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 2e2d7e01e7..81c28677ac 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -19,6 +19,7 @@
>   #include "igt_fs.h"
>   #include "igt_kmod.h"
>   #include "igt_map.h"
> +#include "igt_sriov_device.h"
>   #include "igt_syncobj.h"
>   #include "igt_sysfs.h"
>   #include "igt_vgem.h"
> @@ -238,6 +239,81 @@ static void pat_sanity(int fd)
>   	}
>   }
>   
> +enum pat_test_opts {
> +	PAT_CHECK = 1,
> +	PAT_RESET_GT = 2,
> +	PAT_SUSPEND = 3,
> +};
> +
> +/**
> + * SUBTEST: pat-sw-hw-compare
> + * Description: verify debugfs 'pat' reflects 'pat_sw_config'
> + *
> + * SUBTEST: pat-sw-hw-reset-compare
> + * Description: verify debugfs 'pat' reflects 'pat_sw_config' after gt reset
> + *
> + * SUBTEST: pat-sw-hw-suspend
> + * Description: verify debugfs 'pat' reflects 'pat_sw_config' after suspend
> + */
> +static void pat_sw_hw_compare(int fd, enum pat_test_opts opts)
> +{
> +	bool matches = true;
> +	int gt;
> +
> +	igt_skip_on(intel_is_vf_device(fd));
> +
> +	xe_for_each_gt(fd, gt) {
> +		struct intel_pat_cache pat_hw_config = {};
> +		struct intel_pat_cache pat_sw_config = {};
> +		int hw_entries, sw_entries;
> +
> +		if (opts == PAT_RESET_GT)
> +			xe_force_gt_reset_sync(fd, gt);
> +		else if (opts == PAT_SUSPEND)
> +			igt_system_suspend_autoresume(SUSPEND_STATE_STANDBY, SUSPEND_TEST_NONE);
> +
> +		hw_entries = xe_get_pat_hw_config(fd, &pat_hw_config, gt);
> +		sw_entries = xe_get_pat_sw_config(fd, &pat_sw_config, gt);
> +
> +		igt_debug("[GT%d] hw_entries: %d, sw_entries: %d\n", gt, hw_entries, sw_entries);
> +
> +		igt_assert_eq(hw_entries, sw_entries);
> +		igt_assert_lt(0, hw_entries);
> +		igt_assert_lt(0, sw_entries);
> +
> +		for (int i = 0; i < hw_entries; i++) {
> +			uint32_t hw_pat, sw_pat;
> +
> +			hw_pat = pat_hw_config.entries[i].pat;
> +			sw_pat = pat_sw_config.entries[i].pat;
> +			if (hw_pat != sw_pat) {
> +				igt_debug("[GT%d] Mismatch of pat register vs sw config "
> +					  "- index: %i, entries: %08x <> %08x\n",
> +					  gt, i, hw_pat, sw_pat);
> +				matches = false;
> +			}
> +		}
> +
> +		/* Check PTA if was explicitly programmed */
> +		if (pat_sw_config.pta_mode != UINT32_MAX &&
> +			pat_hw_config.pta_mode != pat_sw_config.pta_mode) {
> +			igt_debug("[GT%d] Mismatch of PTA_MODE - pta: %x, pta expected: %x\n",
> +				  gt, pat_hw_config.pta_mode, pat_sw_config.pta_mode);
> +			matches = false;
> +		}
> +
> +		/* Check ATS if was explicitly programmed */
> +		if (pat_sw_config.pat_ats != UINT32_MAX &&
> +			pat_hw_config.pat_ats != pat_sw_config.pat_ats) {
> +			igt_debug("[GT%d] Mismatch of PAT_ATS - ats: %x, ats expected: %x\n",
> +				  gt, pat_hw_config.pat_ats, pat_sw_config.pat_ats);
> +			matches = false;
> +		}
> +	}
> +
> +	igt_assert_eq(matches, true);
> +}
> +
>   /**
>    * SUBTEST: pat-index-all
>    * Test category: functionality test
> @@ -2152,6 +2228,15 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>   	igt_subtest("pat-sanity")
>   		pat_sanity(fd);
>   
> +	igt_subtest("pat-sw-hw-compare")
> +		pat_sw_hw_compare(fd, 0);
> +
> +	igt_subtest("pat-sw-hw-reset-compare")
> +		pat_sw_hw_compare(fd, PAT_RESET_GT);
> +
> +	igt_subtest("pat-sw-hw-suspend")
> +		pat_sw_hw_compare(fd, PAT_SUSPEND);
> +
>   	igt_subtest("pat-index-all")
>   		pat_index_all(fd);
>   
Reviewed-by: Xin Wang <x.wang@intel.com>
