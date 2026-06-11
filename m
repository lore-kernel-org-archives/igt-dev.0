Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403F5CD98D2
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 08:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFDC10ED93;
	Thu, 11 Jun 2026 08:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7Z77oL1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588B010ED93
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 08:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781167257; x=1812703257;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ca2oREnu64GanWvM0ViivyVl4MThv1/sn3kofwpuBuw=;
 b=L7Z77oL1FjTgJBD2Z3ylOeFHHxUmtXmW1PCBiNfMkovszeRsz8irYpfA
 rzOGDkCq8JKyuYrAU2InKA1odZOv+YvP7HEi32K5Pp2eCSVeebFw0PBdi
 r5Cugq24Q2SN5fpiubWsg2OvwIKwfVUG1wDOyOCN1P9Fz0tmN2H0b1UUR
 bmr+frAQmMYxkLT3Sxa1tDdSQq0jpEP4fc1ZwzC4CQh1oyDFQ5U//AbmI
 xPJoMTrmnlg9e79/Y5zo5YyDDlA6bOAfb/4n7MyVjbwA2ym/xH+uPmXwv
 EJt615q5YB+lOHYhLhvx6CtA7QtDsKAn93GhBlgAm5VQ/p2noYalRLyd4 A==;
X-CSE-ConnectionGUID: OnkbzkYSTEOcM6UdJnioVQ==
X-CSE-MsgGUID: zurcZFXtTgup893B44Ufng==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92651880"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="92651880"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 01:40:56 -0700
X-CSE-ConnectionGUID: PWKH/J+BRHCj5rSzyr2xfw==
X-CSE-MsgGUID: 0b1wWI3PQdGkhvzukXp8Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="245296636"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 01:40:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 01:40:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 01:40:55 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 01:40:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwdcDXVHJ0JF0I5cqCkB1kdXHSOIQVgfGR0gIO05aJHqA1cc0Z+knLUPeCG+PYPTuepRBh6W61XpHQthl7YYwKriB2DQFb2CTtNsNfK6HaLV3Tbdt1bDIUkSekrbqndgEQ8wJZdj/wTtqLW6+aoA7R96PVxn8NozG17FWpINpSJoEnBQzTfVZ5Z9/gD4Ej0G1q9hajEKRKm3O/55+yKFDkN7BbG1vNdi3vtXr0/MKhwxnyTWutP1kp4L49YfgTKmCERn/M2wlzWv3njNsZWLZ+bWuZLi4FW6Npzk+OX6AF+NJzqDoZR1BY3Ns29NuFn5YaR4Kl9sI39+eVzAeubLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8Na7xaztil05yuJkJA+0FtBE5KhD0ntTNGjjanmLy0=;
 b=fHJtgLSmmtHnmwN2EykkfF5El7JflTu84l3wPoVcOw/9q7L56PjN5zbncZTXUf6yT2RlCVVhxAuPrDxCG7YQhbul3BRgM075m4sRcAhvbL5II82O5R6r7+kaPAZIRowFLolreNgJnX2jmEtvmqcGFw0eUIbK+7FGvf4cSAMUXjCYcgCn8rJrPnLCQCr+mOvIldlgOaXOCVcs0F8lbV0QibqXRyKSMkrcpGp5rMgsHRecrN3hdIZyO0kS6Ob3Yah+lE/6h9y7pOKklGM/bsL3sPX4qt3KYKI4M44HJJAYw8o7H1DM4nj5enS/aTBPmM1zLMs8SPMs1EobrbD7fwdRKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by BL3PR11MB6316.namprd11.prod.outlook.com (2603:10b6:208:3b3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 08:40:48 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%7]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 08:40:48 +0000
Message-ID: <81f2259a-a5a4-4c55-bd2a-ed720e09500f@intel.com>
Date: Thu, 11 Jun 2026 14:10:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/xe_madvise: Skip purge tests under low RAM
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <pravalika.gurram@intel.com>
References: <20260610080206.1470008-1-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260610080206.1470008-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0191.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::14) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|BL3PR11MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: f13db0f7-1f75-4ea4-d296-08dec7952308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: nUWIFpsvhqNxG1ImGtKnJZu9hFAAaSIzc3NTF9nmo33zwwmrNbz67Yxu6JsWP+PWY9OZsNrIU2tgG0RtFYV+s18ezqwLEgRzujcgtrJSpmJtx4OVHp+AEfK2aS8R9rNd1fQ5/d8fHxbzGyJfYHVcQQhA24xZOUysqi2TaAhQoDVWSwYc4GCn2aS6h2BVqBm0dyCWzZxTqg3B1Ovg932ib2QzuAyk1In7hh/LILPRMzq3xz+YtWFVjNwD9I41M8pyFgcy/5u7ISQNPUGR+YMvlqFlEwr4yrNiW2zgxPWbJxrdAySYzdpKj2vZ578t7u/jFQtyf2aLvXG1MFxIuhD383Y0KzFC5Qb5BV30XqA2AcBVqGjcRRMaUmP1gdW7N4bh4NNgZ8/Fle7fJGIynVEZyu5gGZ73rpf1183k5lsacCpGSbSII8Vh1lDR5o+Hd61lXu5RgWh+XanLMjyNkuto9wizGaumctT+QE45FGFmsecA7x7YQA3Y/2aAnoXXKSIn0vKiNhZZP1PpW81XWbO7mF7Mywo4o54/72G02VwlV1c8He/tGN6zFVy28Tp6oFNI+wQgPp1TErCWhafjTPOLH7eMUb/jSVuMxIwebN/Zrmai4xWce/cMl0v01hzXUzM2Mp4OB1sdFgQmZIv24Cfd1s1HCDtAonZKv+dM41CIRLG+LW02OVj+b1k8GiQKhpgJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGZ3dUJmZ0JnZjlqU0RDcEFKa1MrNEM0WUF1L3B6a3gyM0I0eGhncWczUHE3?=
 =?utf-8?B?bXdWQUdKeitpVFFSYlFOckllbk4zK1RXZVllQXdqWWQ4MUZhU1BROVZ5MUZY?=
 =?utf-8?B?WUtLaVovWTlSUGYrUW1LWWhtMll1UTZYU3VTclR2djd2Uk8vZGtJSm5zamxH?=
 =?utf-8?B?bU0vS3d6QjN1ZWJmMjZRRDl3OTlmRG5ZQ0IxNjZ3emZicGRJZUo1ZEFEdys0?=
 =?utf-8?B?R05meWJrSjZLYXVhMlgvbjV5R0tBYU1XTWJUTFR2dWVKM0xweDJNS0Z5N1g0?=
 =?utf-8?B?akNOM0NxbDhxbDk3SHhXYnNNOGo0RGpwME9FWDF2L3dNWitSTE12UkFYcXly?=
 =?utf-8?B?Uk9IZDNKRitqK0dOTlNrb3psaFZTd3V6My9vckpDdEE3V2gxY0dZaDZlSGJT?=
 =?utf-8?B?eHk1WlFPOStrN3Z3T1JObFJJa0p2UjErUmlQRnEvcEdPNk1hOXdkQ013dkRm?=
 =?utf-8?B?RitSejQxeXVodFNBMXJ6L1lRb1UzbGtSbHdlVUNjT090S1I5akpTcjk5TmpW?=
 =?utf-8?B?aFdGdUtJbVN5TTI0UG1IL0RzY0YvdGFxNlM1QU5ZNXdScTVmRWJldzFzc2xW?=
 =?utf-8?B?YmhPcVl2WWVKdUFIY3Zsa0ZOREZad3c2TFdBRmJNSEpYcGVBTUFVeHIwNUxj?=
 =?utf-8?B?ejdCZ0x3Z1RqYkFiQ3VzY0NuTzdJWlZqdEtwSm1CRmE3cVUxUVBGZDFWMzRN?=
 =?utf-8?B?eGo1U2dtQldoRlNwTkFZVTA1RHBkbmovWVFJc2tNNVVNNUtnRkpucGdCcXZE?=
 =?utf-8?B?c3hTRmV2OXVlNUFhRy9zSS9vaU9jSTd3SnRvSFo0WlFoUWpBUXJLSmMwcjlz?=
 =?utf-8?B?cWt4blBibmFpSm1LcEh6Zk5vUHVLRWY0aitrSHJqY1NrK0NnazJIYkYzR3dI?=
 =?utf-8?B?Q3RFWHBuclBPbExTbDZ5TjdvVnJsT252akl1TU5rMVlsK0g1Nmw3UEVUQmlS?=
 =?utf-8?B?dU1ESXlrUXE4UWxIalI5M2xjUDhOTHNVQ3lFZHk1dzUzOUxxd1NjcU1Vckpw?=
 =?utf-8?B?aXpJTEVNbGZmalhZemRlVjRBcjBpZzNjWDB0TlFybi9SWktrLy9RdE1KbjJX?=
 =?utf-8?B?aWRpaGdWOE4wTHBxOEQrNTh3ZldIczhzWWFURDRnTWIvWFNpMVBhdHAyaDBa?=
 =?utf-8?B?VlFqblZkK3JHSGwxYllMVE14cllISXpjUkNJVTVMd1RSY3JBM2NaVEdxeE45?=
 =?utf-8?B?d3NtYWpPYzhPclZUdVpIMjlJZU00aHVmRmdaaUJtR1o0N0NiY1gyNVIyUEsr?=
 =?utf-8?B?RWxXS1FBWXRmZkkwQk53Z0l0dnQ3RHc1MTIxRFpyeHFmVjZPbFN6d1FaVWVP?=
 =?utf-8?B?M1ZuQ3Nmd1Y1WHo5R1ZyVG93d3YrZ1VzQUxmek1TdjdheDcrOWVHdENXWUkx?=
 =?utf-8?B?eGkzMThDNWxSTWxYQ1Btem5xWkhIbkl5YWdGdzF6VEpNK1o2Sm1qbjRNTWxl?=
 =?utf-8?B?dDU2ajd6V1F3YWtzNXZjR3pBa2ZNK0JleWs2YmphcmZpQU8xZDV2aFZWd1hJ?=
 =?utf-8?B?U1FiZFI1U284aE01YUVoaE41MXViK2xsdmo5U3kvK20yaWdhdGQ2cks2WEJV?=
 =?utf-8?B?aW93bjJDSUVWdDgxQzIreEFYOFBJVGkxcjFHNTZDNDVnVk44YXNyOFlDOHNu?=
 =?utf-8?B?T1ZDSzk0d1BWZWcvTEFVRHNEY3FFR3MySUluZlYyeG9xVzlRMWoxNUhTK05X?=
 =?utf-8?B?U3I0TmNSSHA1Mjl5djEwaHdxa1huWW56bFIrUWo2eFJqcWtBNjJGenRKeVlJ?=
 =?utf-8?B?enFEQXNZL3dhdVV5K3R2S1lxci81RS83TTlCRnFLTklGVDQ5Zkg1STBZbGln?=
 =?utf-8?B?cDlmNGVwZk1yV1U1bVJkNlJyWDl2QWFucGsyUGNrZitPTThDL2xEZEVqM2s1?=
 =?utf-8?B?NWhRTFRSMnBmbWpUVU91Z0pHdFA4eDFDNHBIL0dmYm9ZOEM5WlFnZmRnVEhM?=
 =?utf-8?B?RDRBS2QzWHEyb0NNMm95Y1hOaS9aUHNZd3ZRUlFKK2VLbFJ5TjVUNUhtT1k3?=
 =?utf-8?B?S1ZXS0QxekgzeDVwNmlWS1VWaVhxcVhYK0ZUdEJGREJQNW1Bdm9NajRNalBM?=
 =?utf-8?B?ejlydnMwM2Izb29QUU84SS8xU0hVajFHeXNGRDlHL1JhNk5yRkVkcjZkUnNo?=
 =?utf-8?B?dElyeHppL1I2a09tc3oxRjlaOHBCUHFqeUR1ckh6NlYydFlDeldjbzExaDRZ?=
 =?utf-8?B?K1BvSTBEWjNESExBK3BzWXYwMmJpcHhJak4wcWdPOXdHSFFDQ3BkZUhQT2x0?=
 =?utf-8?B?VDlmcHNCNWgvcTNkYUpWUzAvR3hkUjdnRURtcmNtK1dnb0c0MnkxamlmL0hP?=
 =?utf-8?B?bXM2Um1DUjNxeGhTWm1iK3paL2FXWDY1MUE0R1JOa05jRjgraDZqQT09?=
X-Exchange-RoutingPolicyChecked: ZEILhCLTYrGrt4ZdaobIeCf4FSXarhu9mWsnepeBcTbBXhqxwkgaruu7braLkwsbFX+JoCKub4TjCMcnGXujyH1f+wevXyYPnmbMu6Ts5uXApB2ZjAetq0P2ZtgfIcJHNxsOzlsohYGlybAr+Zb1rH7V7ZAPRRWj0srsDafcqDo/nE7eRyD+waNNiInqE1DmE1IEnshLogJU7ufKksoU1kqk9SfXi8wb8nIwsbGFh+mXPk4U4GRu/7HmxHHyTGr/nLs2Lna9lC61+SlBP0wwt3IY8G2GP1pjspS3OiXgGTguwv/NvM0PuxKpfLcq76NPQVXDlW3E/Ce8aQR0m7kHiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f13db0f7-1f75-4ea4-d296-08dec7952308
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:40:48.6113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wghXMAw+r3UMUgpu3M/AjgpMYPosYaKbJyqmLV3PYANn6MhGYvVh4ZfaUWxGiIu4k07G6KXzMHqotkQkp0hJDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6316
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


On 6/10/2026 1:32 PM, Arvind Yadav wrote:
> The purge tests create memory pressure to trigger BO eviction. If the
> system is already low on RAM, this extra pressure can push the machine
> into OOM and kill the test before it can clean up.
>
> Check available RAM before starting the pressure allocation and skip when
> there is not enough memory.
>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index cdb115d7e..f9e2c4735 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -83,7 +83,7 @@ static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
>   static void trigger_memory_pressure(int fd)
>   {
>   	uint64_t mem_size, overpressure;
> -	const uint64_t chunk = 8ull << 20; /* 8 MiB */
> +	const uint64_t chunk = 8ULL << 20; /* 8 MiB */
>   	int max_objs, n = 0;
>   	uint32_t *handles;
>   	uint64_t total;
> @@ -98,14 +98,18 @@ static void trigger_memory_pressure(int fd)
>   
>   	/* dGPU: fill VRAM + 50 % to force TTM eviction */
>   	mem_size = xe_visible_vram_size(fd, 0);
> -	overpressure = mem_size / 2;
> -	if (overpressure < (64 << 20))
> -		overpressure = 64 << 20;
> +	overpressure = max_t(uint64_t, mem_size / 2, 64ULL << 20);
> +	max_objs = DIV_ROUND_UP(mem_size + overpressure, chunk);
> +
> +	/*
> +	 * Pressure BOs are faulted in and kept alive until cleanup. If the
> +	 * system is already low on RAM, this can cause OOM.
> +	 */
> +	igt_require_memory(max_objs, chunk, CHECK_RAM);
>   
>   	/* Separate VM so pressure BOs don't interfere with the test */
>   	vm = xe_vm_create(fd, 0, 0);
>   
> -	max_objs = (mem_size + overpressure) / chunk + 1;
>   	handles = malloc(max_objs * sizeof(*handles));
>   	igt_assert(handles);
>   

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

