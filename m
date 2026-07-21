Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A1DC4452B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 17:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F96D10E302;
	Tue, 21 Jul 2026 17:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZo0PRTC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F75410E391
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 17:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784654361; x=1816190361;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UuDOZgULTGBBVJV81nLjjhLf8NTfNHWjvuIcqJRqaUs=;
 b=IZo0PRTChEm/WyeSwJMJqkCl71rob9VGqikrNSGDkYQwKTwApQIZC1oh
 ciJ+yR90Yw7WlOcna7do1AA/YgO1pCCjhvLtSMp692yhYzqhvJrMnXr9m
 EA22o0/wfPwTkSiXCFjCUN90t0OddUys338LgCsayE4rmG1HAQJlRobCP
 jXTBtj4vcVCeH0UX2mFTzDKOWDvwnO8B/qLzOak98WJZJyWBTCiVMDMuF
 Wo5BFPrZjA2dCircVPmrPwFaqHMZVLF47RQW/k6TbGaFVhFM9gTkcpNqD
 GzI8UKDFMwgudj4xE4cLc/40a9m4vj6RgFIqtb5oxMne8GHR2FDCZ24MW w==;
X-CSE-ConnectionGUID: ZkWards2R5WE5SAHURTlag==
X-CSE-MsgGUID: dU4USdz6RQOKjdxVEavtTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="87797566"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="87797566"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 10:19:20 -0700
X-CSE-ConnectionGUID: Ghpco1ylTweaUfpFmFhbww==
X-CSE-MsgGUID: PmyYjmYUR/e8qTktdE2XhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="257894756"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 10:19:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 10:19:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 10:19:20 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 10:19:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfMZXj4ZydSdryVvFLNrqol9hOF17cdo5IoAZAloVuAMAcJG6DhcgIaOAusCz4saIEnGQCklayv171OEAYTrU3wByZuxi/yiqrh+N0qs0hi/zSf22fBceC1lwwZpgLsuKD7RUG9LlS5XBhBw+0Tbcs7AdnhcrIaNnbiPj3QdGL7Xn7MyMsTaZV7LvYbJCzMhgrzNgquCwy+KpCyZ+/jZn44L8kL72TG4+Em4extvHsA7XeoiEqpGImsmDstnWsJOPKkDMWTjGK8/DOSuwCYyBOdIb37ZrQs8UZCrO8miEEn+YVCBWXoE6pfKM4w8Z5zOU/5Oe6rI3hm0/KbYzr7yQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yR/yxgu00qauag/JR7pIanQKxVhTQUcOK+cpx9nfYSg=;
 b=uYpY4GBsBcy7cZmSzL9ssxTOqGq8IExcSjQ/i2NmF6DHqPAKe8Lo0whC/MDabBrUhjWX3LvGi+6FdNVRfxcgrUFtP2cZ2I0ywJJyPidP85vqgt0TwSs82/SW8Oajecj2yjtyObuhgwEjtfm/wlemu8p0p4zx8xDHF0M8w2E4n/on62z6GF6fTFsicL9AigrAFsN2n/MqgFYg4u9se82eEVyf2tPiNHokKxWiH7y5WmKDn3O4NvStD/tTyoG85Tfyzmg4iZaEovjcRKdbrrlQTqvqUufQHkdXBFpB+sR9d4VX9hYeAFnjJf893sCjeZ2xm6yrAYv1QS/vWoKW/lh+jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ2PR11MB7474.namprd11.prod.outlook.com (2603:10b6:a03:4ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 17:19:17 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 17:19:17 +0000
Date: Tue, 21 Jul 2026 10:19:15 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] tests/intel/xe_oa: Do not assume OA buffer is
 prefilled with zeroes
Message-ID: <al+qEx8CnNBY3Y97@soc-5CG1426VCC.clients.intel.com>
References: <20260717210027.2008255-6-umesh.nerlige.ramappa@intel.com>
 <20260717210027.2008255-8-umesh.nerlige.ramappa@intel.com>
 <87h5ltxxaj.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87h5ltxxaj.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0334.namprd04.prod.outlook.com
 (2603:10b6:303:8a::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ2PR11MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fde8b0-31c6-4a1f-1de4-08dee74c3198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|4143699003|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YttfYHO00ozE52sWDNG1vTbgbsA1yhTyTcyp3bIb45iC6bqknPKtDJhFKap4+s7r0qV/ODiMG7mVQjkAV3OC16znIcpFkGjAgwcZFJTr9y7cslvRvnBzPibjTWBhENCsrwJ0Y+rhsf4fnFr6wGW2mfv8zlC1wcKZkiEkG84CIVIkas9U3U82MzNVisccczJC3cf0HEpFK4tge01QjZRgef5bUznrH1fNzhA6bnjgqB4jPW+jIL4o4iJffINoMcPc2rQQT6MXn2m4u0hr64/6c79HrsNA3tqu2d6dN5uMugqKQC8iAzcqNF43joqjdDf0uElR7M2Htvk1l4KvlVxkgUPkyjwch1HbOAroCDVJO3Xi165IZyOkkviohipk7gNUzz0sGxwOt1AA+prJY/qVtslg5SGfUx7GOXU1gQfhKJ8l61vec36LaS8vcizz+sgLoSEs4eoJ3wTIeiahlrU4XZgZ4KsTeXBFxJWlAfGnviQCBKlhvm7dz/xPbayui8KqgeV9tUf3lYm1DobKthoJgmt4jYY4JshtJ68wGK12eG4pRdXshv1Bvb8WvPZiiKbBWVvJOj2VbEHj26CDG1rhOAq+eSEqF4hMXZcHSgVFJGagm4+OwI1AC3doykZSqAZlienGDTnYGE3vHq/I9Egi5WKjI74cCrhUB7+7gmmMUjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0c0U0lTS3Z6WXRJQ0c3Y3lyUkZUa2tVczduRGpSMTlDUzJJUWU5ZlVOR2Uv?=
 =?utf-8?B?UzVTSmpBRUE2QjRDMnJhNjI0Z2s0K1RJM0pWNURJZHh5M1hETS9qRGw3RVIx?=
 =?utf-8?B?S3hpTVorQmhvQ1hUWjhVc3VkSzh1SGgreUtNZ281VVNpY2VhenBDM3F4V3Zo?=
 =?utf-8?B?R0VFQjNrcS9xbXJHWk5uempHZ3RSdDczWVhDS0lzTFhtYXpKZ2V5RlpOMTVj?=
 =?utf-8?B?N09WR0ZYak1mZWRNcDdJNU9Ob1UzU1VBcXpaMmppakRHZWtRM1dCWDBEL0JJ?=
 =?utf-8?B?bWE4SlVkZ0xUaVRPYndhQ05VbmJqR3VrQ0FlMFB1elR2bWFaby96QzM4bmRj?=
 =?utf-8?B?ZXkxWStrcW9oQ0wva3hMK1FMU2F3dndHSXJNL1FqN0o3Vit6ZHpTMk8xRE9s?=
 =?utf-8?B?eUpiM2JKMDh5cWhRbXkzODFLU00wdGRnLzJxeFN1ZWNFa2FzSG9ReEZYcE55?=
 =?utf-8?B?NVphN3BJbWE2b1FGb0ppWEdDRHFPcHdaZUlYbG1XLysyMHArMHJGY0lJVmRN?=
 =?utf-8?B?RDdlTElKMC8yYjhpMndLY0tEWmNwQjBaYW1adGswdnhobzhlVENqOFlUT1Yw?=
 =?utf-8?B?bmNWa1JVK1JWZjYrUzRPaVlMQkhKTDF2YWhjUkhvdmh0eTdNUnlnUzRZeWdw?=
 =?utf-8?B?M2NHbHRpMVBVZ1Jzcy9FbVhmOFJQekFPeU5OcnRiZEMvOHUwajdjSDErWTRL?=
 =?utf-8?B?Mnh3N1dneHRqOG43T1lNWGc1My85VDVaRjlCSWV6Z3FYNFlMZy9ZZlVjVWhp?=
 =?utf-8?B?OW9aQUxJUFg2Uk9kRHFteXZnUU5YWlhoYllHZk82UnI0eEJHVzgyQys0Rmti?=
 =?utf-8?B?aENlaEpMU0g3bnhCMlRiUFVVaERoMW1lL0MyOGVVNzRZdkRadklydTI4eHVp?=
 =?utf-8?B?Y3NnSGc3UzJORVZ0Y1BYOWhMZGx4dllHVG1iNXloNWZGTkk3aDl2QjdnbTFE?=
 =?utf-8?B?a3hpSXJCRDcxTUIvaUlPUHFlRVhRQndvK09RNHpRbzJFYjBJM0NEbDFMMkJM?=
 =?utf-8?B?akFrYUZYMkhBRVFzRUVpODFpZ1ZuYVRYZWJzRlYzRERURENVb0FFUUVzNE9U?=
 =?utf-8?B?VW96eWFSdndSSVNFVnZDUjMzOTdzSExRZGZjNVExaTVPdDQvSGdSVFVIUEk4?=
 =?utf-8?B?UHh3ZlJEbnl6TS9TUlVPejRDVlJ4V3Y4TkFSOVh3VXJzYURrbXJWNUlZN2VR?=
 =?utf-8?B?MTZUQThweU40aEJUbE5NTzQ4VSs2amdPZG9DMS9pQ2dJY3E5aTFNd0Fmc1Rm?=
 =?utf-8?B?Tlc2d1k4YmZHdHRaWnRPdG5zMityNERLUnBUc1FQZmRyZjl2bmR2N3IvK21D?=
 =?utf-8?B?MWI0K3JkNndRT0Y4VHdJbEpMY2wwdzVTUS9jZzZvaG0rM09nNWNOZ0dOQytO?=
 =?utf-8?B?eGozMm1BYW9yaER4TzhDZEpSZjFUM2o5NkFjSnJaaHlXb21ubCsrYVpoQVNL?=
 =?utf-8?B?alRUa2pRT1NoNnBEOGxaRnpTOXFGY3Q5V1dlM0dXVFd4ZUZsZzBITWpkQkRJ?=
 =?utf-8?B?cDM5R0p6aStZSzllc1lzbGVJcTRIeCszaC9qRlFrU09ubFVzYXZlVHZHT1ND?=
 =?utf-8?B?Sng5M083M3Z3dUR4eDhQdWVpT0RCSTBQUjNzZ2lFY1l1Yi8rY3NBVU9QMjF6?=
 =?utf-8?B?OHhmM1hOZ2tCY2t0S256V21CL1JKUW8rbnJ0SFQrTUd3YzhBUTh0VnlmUUJx?=
 =?utf-8?B?NEJvd3lUZlYwbE1lYlpjRy8wanMyc01pRmpxditlb1p3cldxSkhSMThEcEtQ?=
 =?utf-8?B?ay9OYThzRnBDNjcxRC9aLzRiV3N0VDFIYW84SUh1QzViNUd1SnVXQitOOFZW?=
 =?utf-8?B?R2FBY2dOMkVGVnJNbkpJa3RFTzhpamhuKy9mZ0NSM05tRnBFemw1d3VYZjZU?=
 =?utf-8?B?SjcrS3BWVWxlbE1GSm9qNzRMOXhUSmpleEVPSVYzaUczb0pCbXptaGE2K2tD?=
 =?utf-8?B?S1huRXcrNEtydWlWQllzSEJJM2FJaE1GOWRvSWxTU1puUjU1YUhDQlh3U1c3?=
 =?utf-8?B?ZzRIQ2NsUkNxWGpyaEp4SGdHL1kvb2h5ZjRyRjFSVHE1aXI5aHNPNW5xbUpG?=
 =?utf-8?B?OEtiTFhRelE5WUpuSitZVVlKU2hQUDhnbmtqMzh3T3RzOG1EQlAzV3FZNXUv?=
 =?utf-8?B?NzNvZG9xcTM3eG1hMkhOSmh3VWN1cDZoUGtYRnJ2OS9yOFgxeU03RWowb1Er?=
 =?utf-8?B?UkZkVUVCOWpuRmZyUGlIUzI5elpPY2t1UEs3ZWFnaEtPVlBzTTZVeUwyanNH?=
 =?utf-8?B?bExsekU0U2xBTEFraEZ5ZVIxM1ZQcmlld253S0lhd1RMalhJVG9qelVETmtV?=
 =?utf-8?B?RmFRamVkZDRXWEUyWStvcWZBTXkzRUZJdXZmOVZ1MU1ieHA3ZHpPZUtqK1ly?=
 =?utf-8?Q?rg2Dt/7NMCl8GBeA=3D?=
X-Exchange-RoutingPolicyChecked: AnQuNyipdchc3sLjK6ZxH6+k8AQZxSjpRMhKshSmxcIlUAyJD/C1a9ylx5pGtphCCEiihTqSm0tzvH1fcCk14cs5Qr3ItNtSG3v1TJ80W7KBoSDsA6XPR5J7PCsfQH/kbzggTd4oTIf5WjiK7YM4WGYYfM/YG72PPrb8OAns6mumWJeHQfIvz/tBmj6MTrOx462xPKGWmzS7QNK7RX0U3yc/OTMi7rIl3QQoXyfpUn6Ypk7QzViVAPBNnXYTZzE7l8rRDXRYwvs/8IeoUMPnLIILqJpPlHRlLfYa3IubJCfKbn/3Kn8Zgv3+Y3khdhoLMeYJuejtfM8uXC1Lp+mrNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fde8b0-31c6-4a1f-1de4-08dee74c3198
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 17:19:17.0966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUdcHj1zHHFygrXWtpj83M+5jSvNBBKBXXPhxr/gx9ENAwrheLUDrzSjjjfiU/6vHq/in8smL4A7Vf/UohZYI7SjVjkfiW5EZU9vH+JtddE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7474
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

On Mon, Jul 20, 2026 at 12:42:44PM -0700, Dixit, Ashutosh wrote:
>On Fri, 17 Jul 2026 14:00:30 -0700, Umesh Nerlige Ramappa wrote:
>>
>> The tail address test assumes that the OA buffer is preset to zeroes. Modify
>> logic to be independent of this assumption.
>
>Are we going to stop memset'ing OA buffer to 0 in the kernel? Even

Yes, I am planning to remove the memset in the kernel.

>otherwise, because this patch is a generalization of the OA buffer being 0:
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks,
Umesh
>
>
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 29 ++++++++++++++++++-----------
>>  1 file changed, 18 insertions(+), 11 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index e7e4f5601b61..98f00d377a86 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -4634,7 +4634,7 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_oa_unit *oau)
>>   * format size is not a power of 2. This means that the last report will not be
>>   * broken down across the OA buffer end. Instead it will be written to the
>>   * beginning of the OA buffer. We will check the end of the buffer to ensure it
>> - * has zeroes in it.
>> + * has not been written into.
>>   */
>>  static void
>>  test_tail_address_wrap(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>> @@ -4649,6 +4649,7 @@ test_tail_address_wrap(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>>		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>>		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>>		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
>> +		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>>		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, buffer_size,
>>	};
>>	struct intel_xe_oa_open_prop param = {
>> @@ -4656,25 +4657,31 @@ test_tail_address_wrap(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>>		.properties_ptr = to_user_pointer(properties),
>>	};
>>	u32 fmt_size = get_oa_format(fmt).size;
>> -	u32 zero_size = buffer_size % fmt_size;
>> -	u32 *zero_area, *buffer_end, *buffer_start;
>> +	u32 area_size = buffer_size % fmt_size;
>> +	u32 *area, *buffer_end, *buffer_start;
>> +	u32 *content = malloc(area_size);
>>
>> -	igt_require(zero_size);
>> +	igt_require(area_size);
>> +	igt_require(content);
>
>igt_assert(content);
>
>>
>>	stream_fd = __perf_open(drm_fd, &param, false);
>>	set_fd_flags(stream_fd, O_CLOEXEC);
>> -
>> -	wait_for_oa_buffer_overflow(stream_fd, 100);
>> -
>>	buffer_start = mmap(0, buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
>>	igt_assert(buffer_start);
>>
>> -	zero_area = buffer_start + (buffer_size - zero_size) / 4;
>> +	area = buffer_start + (buffer_size - area_size) / 4;
>>	buffer_end = buffer_start + buffer_size / 4;
>>
>> -	dump_report(zero_area, zero_size / 4, "zero_area");
>> -	while (zero_area < buffer_end)
>> -		igt_assert_eq(*zero_area++, 0);
>> +	memcpy(content, area, area_size);
>> +	dump_report(area, area_size / 4, "contents before");
>> +
>> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> +	wait_for_oa_buffer_overflow(stream_fd, 100);
>> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
>> +
>> +	dump_report(area, area_size / 4, "contents after");
>> +	while (area < buffer_end)
>> +		igt_assert_eq(*area++, *content++);
>>
>>	munmap(buffer_start, buffer_size);
>>
>> --
>> 2.51.0
>>
