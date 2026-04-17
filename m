Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56BAF8E4A5
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 05:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6858410E28E;
	Fri, 17 Apr 2026 05:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUkhqdWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E1710E28E
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 05:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776404176; x=1807940176;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dHZpx2pkJRa3As3ukbVuOdSJBAOpyAM/jidf6PAmaSI=;
 b=nUkhqdWHRr6vuXRucgAFJa1zl1Rr/y2AV6wExamMulSoka3ZHx+IyxtY
 QM6GDRDArHMAO99fEFIrXcVL06D439aBg/cwX4sRM+6Au8dGjrL9aVEhf
 puMo0PrTQbVIVBJlSk2bq7yUyLIVRCFk/7ujSqHdks1Rs2VN+owK9gXPw
 C7teagIT0X6XzMhiwVgV2hDnrkYCuAjwf/2yXiUnwxq6NH9EZ5ikz8ZqI
 qzDcJ4Nxkr/fm7s1b8O02OLg3coktiwixcGaJvMyWsDnpuAjSXdxtK8vs
 gmXg60+Q94+vshUxmRu2dDj8QySbs8VjjsCruIBehKO7y5MomgIuSrYGG g==;
X-CSE-ConnectionGUID: BnPzOK0AQzK89vNta2NMbQ==
X-CSE-MsgGUID: +0inDCJUSb2h1osuPvVKEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="102876869"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="102876869"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 22:36:16 -0700
X-CSE-ConnectionGUID: yD50Fx7sSCip7LjHAYYwZw==
X-CSE-MsgGUID: v2C4ZaK/Qqqolvom9mnTiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="224438351"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 22:36:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 22:36:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 22:36:15 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 22:35:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltqOVziJKq7lduC7ExtzUlysW+GXpXx4nod0L1EkfF1nAFZ4Uy//4KvnU87ot5lVpa5PyqfZpH4qQ19qPgswvu97ziMgVnn3LQdHiDHeF5YPUVP1uVv4QQin4oN7P0est2NyL8Dfv7wZC/K7df9AMeCSVDPeIwRAKDTgFMOpQCsB3TxeMWhiKoz+KXyG5CWiJYRDocaZbEEYvdGia7pxqdwT4AMFmgpirVjI4S9qn+ZnGoz7KjAidQ7zdA/NaMbbnGBsG7QCjzH7FHweETAoGIx5E3R6b2FkVufyQZgIC3LDFNs8BaepB4F8lQ/MjWc9IanJfyBHgWoPMyHJ36HIkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63h/zqJwIpy2hGoL4w0rbvT73EkhDNVr0TikxHZ0sqw=;
 b=E+zr1IJRzxkMJt6OP4LVhKZuHbvnqarxk23uPL7DffWzNHbZM5LdL8AlrPU1Z4a4JVDv2QiP+JGptyWrathnPv3DpRUn/N4vhDvJ0Gvs3c591L0V+MlGyjQnpgAWGSHqLBKzbyGtlj24vsXQkE0Q4A9MLfjW6xS1DfrwexAlZmmFn5QpaKW4jVImmIZg6ghQj8wTbW2PRK3FarsNbTeMp75SfnvkEtbROuWawKDh3XLcIxEqvju/faRK8H/3Y/54bXR0HYGVYjFyrB+griIVJNUj43qXv3kM2YU8cyJ+UAO56JR/U7LUd0dy8fC01bSvmAt6sb41dUcTWNeMpLUdQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 05:35:41 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%5]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 05:35:40 +0000
Message-ID: <89da6c6c-6db6-4ad2-86a0-bba80eb4d2d8@intel.com>
Date: Fri, 17 Apr 2026 11:05:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/xe/oa: Add support for 192B_MPEC8LL_NOA16 OAM
 format
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260417033334.933419-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20260417033334.933419-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::10) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SA0PR11MB4637:EE_
X-MS-Office365-Filtering-Correlation-Id: d37987ef-ba8e-4059-141d-08de9c432954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: iq6zZICPcjV8XaQcplZ2R6zzsSXPDF0bQlFILANIch5KfPkWIB8HR5bU9fqi6IfZkTKPFGZmJe5ugx90CEzLZ0gznkh31y6uiXsFYQFEGm+58ahLG6oq2ij+1cMOUIF/58tWeoN/Ee8Lf2GiMaLkXl4bjqdaLNMhf7tqQLKzNc9m6NMl8e3FHbN+Z/jtJN/T8oDklKnd7h47AtOVPvvy4aRKjSZd8RpIKDprZ4LV65vpqSu4zFY2MVauJDk/eIUJEvimzXwlOtvrNaXp7bEWChkQGJBRuEBVZTecknkN+upLcXmb9Zm3tbPsLAPaT5PrAmfdh91QFgpac/osFKnIDbgQhbFnVgX6JlpafyCK7gjGaHzAmPUoUI9hzqvfS3FNMP3EBIN/k1skZpOlcZB0Vo/br64ehFSGPM0LV/gUz1hu410DUi6przgPOo3h59l6GAHkUFRYVsGpDLbIr/tsAg3cXtJUbWDyIxl83lR+7CtKAue5uBailIER16tvxjiuzMbOvf3ML0ZPLJT9j5g78WfhEhbst0dwvC1NiEb0hbaU7GFO1BOyWrhHmmO9T62pqVV/iFnsPes7odjpEQMBsRidpNmDIxR57SgTZvN42GErY3twN0vFJQrYsvSCRPtXadL0tCXUSlXShPsQ1m0ec919Nl/R261CCUSz/cStKy4t6caJekI9DUpNqdfKPBuxAgtY2RH+CjmXA6SWImaAVZBJMl2jPySunrgTUNQnPMQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGV1ekpOVS81TmFNWHVERE9zYi9aTTh1bUlSZ2prR1B5cjRBUTN6ckdNUG4y?=
 =?utf-8?B?TEpneWpqZTQvWjhlNDBValJpVEJKNS9EUVMvaXBaV2hTUEhIS1B2eVBoeEFk?=
 =?utf-8?B?bnk4R1Q3aG02UGFkMDlFRXlCM05zWE5YZnV3STJhZHdkRmRkcy9qS1A4SFJZ?=
 =?utf-8?B?aHBMK0pjeCtYcHdWZitvQy9EUEFPWFhwSHFZMWJvWjJnQ3hCbEJhZE52YWNu?=
 =?utf-8?B?RWxFMDBpWW1xZGpUd3hSYWlxbnlMM2tsSE1aazZPeXg1TEVJOFFEUGdCVzRm?=
 =?utf-8?B?Ny9mb0w3SmJmTU9tY1dvczhGdk1iZmhUT3NFZUNRczIrVVZtS1loSC95SUhF?=
 =?utf-8?B?V1gvTlhvdzROV1BxNUo5Z2FTeisxM0ZGWHUweWdWSm4xa3NUaTZ4OGlpRGZB?=
 =?utf-8?B?M08vS1FNVVRWMVpVMkdmQmFkbG9HTkpUK2NCcHMxUG51c0VxSnd5TkU4aFQx?=
 =?utf-8?B?T1ZGcHE2SHcydmpUbTdEeUpldmJxSGNPd3NCdDl6UGhKSTZ3dnhkZ3FDMUpk?=
 =?utf-8?B?Zk5JZWxseWcxZVpWYkVKeVAxbXc5cjV3R3dLQXZEdDJDM3NCaUgwdk16RHdt?=
 =?utf-8?B?Q2kyZWtpOGpza2dhdFhzTjdZeitHZnU5ejFsYXZsSUFvNERYWEt3cVhJZWZL?=
 =?utf-8?B?RXMzNU81bGFkREpSNkhXcjgwYVBjYWxwajRTVUUyTzhWbXdiR0lHbW5NWHZW?=
 =?utf-8?B?aFd6VVhWelh2QVBjM09SQVNXV0VFN2xLVDhaK2RwbVk5Mkw0enppWEZSVlk2?=
 =?utf-8?B?SUVlN2RLN0g4VFIrZkVoaXEvWnJkbllBSnBFTVVYTEI5K3BiR0xFMTNhdWpO?=
 =?utf-8?B?UHRTTHJYU3ZxaVM1SW5SSS9kbXBObUtPNUZ0cER0NVFWNzFwZTUwcGpzYVFJ?=
 =?utf-8?B?VW56M1laNEZwZGtIOS8vSjA5cnZNaHpsSkE3UHdTbzJGOERnbE1FZXdRaGIw?=
 =?utf-8?B?U2NaUTJxTGpWUnZOOE9MNjZnY29hUXRNbTBoYjJUSythTEs3bEZmM0orWEYz?=
 =?utf-8?B?MXdFbms4SVFKMFllL2lndis3WkFwZUN4SkJzK1Qwa2pJVFBRNHNkVnZNcFNs?=
 =?utf-8?B?L3E3cXR2VGNMaDlwYjF3dEt4VGtiay8wVEFMSlNMaHNrSFFWQ2tBdVVTVGtQ?=
 =?utf-8?B?NEtIMmNya2tIQitxdFNrV25RYllLMmNiVWsxWnJ4MHI3TzhMR0I3eWV4VEp1?=
 =?utf-8?B?cEMrbFNNbEZZT3dIYkRkdUNCWmhkQzNSdG53VSthTEpVemgzQ2JQUmpNOXFj?=
 =?utf-8?B?OTUyeVJNQUR4RVlyUGxSTHY4OXF3azYyWC82QjFOSTJWdmluS3VjbGYzcU1t?=
 =?utf-8?B?NGNGM0ppMGpoRm5HSFYrZU9pWlhZUzhOc2lOQlVxVERSYkRYdUMydDA5RTB4?=
 =?utf-8?B?ektuU1JnSlMzbysrVzNFeW54VFJxbVhhd1FDZ3pvU01CczBGeGRMT1h2RWtT?=
 =?utf-8?B?YjZLN1VvazNJQzhEL29CWTlQN2JUeFJmQXZjUE9LZWt6SkliQzgzK0RuZmxQ?=
 =?utf-8?B?bGpvbWRsTDErU1poWUYySjE2aStZb21XOUkxU1V0UTJ4RnhJOWJ2Zm1sQnBU?=
 =?utf-8?B?Y3haQW5STjRqV2NyRXVoMTMrZU9NUmRWZWtjMjZ5T2hGYjh6clk5V1kyNlBU?=
 =?utf-8?B?bFowSjhHdkRsYkl3dlFrQmhxQUYwOHczUmVYcUF0aWNqTG1RN0pVQnBMdWo4?=
 =?utf-8?B?Mi9CR1M3TjMzRGordUVteGJLWnZPZlRFcVIyTmxNN3BxNTNUQ1AzUHJCdEFt?=
 =?utf-8?B?dzdzWVRJYTVYZDUyS3RER1licUdGb2hyUlVZNXFkVitqZnE4TEVTeE1mVzBw?=
 =?utf-8?B?QTREdXFNODV3encxZ2twZ0tTUkRFclBjOEJTK215aGxQQ0JmcGR0UlF2S1NW?=
 =?utf-8?B?VTYzdmZjbDBCNnBtUS9YVjI1VjBVL3RyMGROVEJ6SitEcUJRUll6WFhrQXlQ?=
 =?utf-8?B?akZlWHY2bkE4TmNNbDBTS2c1VzBLd0p0QitlUWw1MmxvOURwQ1BhdTJDOHFH?=
 =?utf-8?B?RGlObkp4cmpmbFA0eWVlNHc3dVlpTmwrZWU5MlZnS2V2VHpQNGVmZTNXWUp5?=
 =?utf-8?B?bzhWejNFQzlVelpCcjNGOEtqV2QyR3ZFSEVVYUNtT0x5M2dXL0pWdE5kWTNZ?=
 =?utf-8?B?KzFpKzRWQTQ4Q2pySS9IOWZLWGh5dEZ1blY3VmN2NUpEZnZxLyt6YnpSUVZw?=
 =?utf-8?B?WmhHdnBIMGtPVDh4cVFHOXFkOXBXOXNnODk3cWpsRnp0RjI0ZEZzZ0hWTWRr?=
 =?utf-8?B?Q1FVRXJsMGhTUHI0WkVPbnJkK3VYb0ZBcktzNGlQZE1WMmxTUEZkaHFYQXBj?=
 =?utf-8?B?VGt5dFVwWVBQalZLU3JwYVFzcU1Rb3FjZXkzdWdLeWNKUUhjTDg2NWFCZzlJ?=
 =?utf-8?Q?C581u+npliscfaLU=3D?=
X-Exchange-RoutingPolicyChecked: DJSIpidlky95UzIeLZT8D5Bj+bDIX2UILjG2U3eJEvL/B8hCyCCqroCCulWayIrt70XKrNxr1mYUzUbg5ORNWjE6tpFLsXc5b5YreNBbO7GIxVrrN4Zzq8K41UbHwn25SvYr38+IoHzIJ987tMf36wJkuPHrqBjDKULbH6zFarnStVdT8Xcm5/gSg3vqjqpKNubYQ86A5kQCSHrhG6kYgMhOrT1AqFRH8XlHvjJ5O1auFbbng3bnJUxYorxuNYqCVgFJUuXPTFx+spIxFoYQX+UboLwwyl9XyM8t0nEclWhxU4DGevASaasqXMmlsfd5Fj+b5LOkAriHtUcOw1kAtw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d37987ef-ba8e-4059-141d-08de9c432954
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 05:35:40.7529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnUL4S3jjAr/d5ZTOA/WDjkpoheqHZL7FkW3m+jUc3nkB2Rqn8ajdDZ9+yKefINm8ZJnJm3kTRyi0+NeBGHuBQkHlLVufc7/xaA9N7JImiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
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


On 4/17/2026 9:03, Ashutosh Dixit wrote:
> Support for CRI 192B_MPEC8LL_NOA16 OAM format was previously missed
> out. Add it.
>
> v2: Fix B/C counter accumulation (Shekhar C)
> v3: Fix other places where 192B_MPEC8LL_NOA16 OAM format is used (Shekhar C)
>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   lib/xe/oa-configs/oa-metricset-codegen.py | 13 +++++++++++-
>   lib/xe/xe_oa.c                            | 26 +++++++++++++++++++++++
>   2 files changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
> index c5c7a2c8d4..b44d4d73af 100644
> --- a/lib/xe/oa-configs/oa-metricset-codegen.py
> +++ b/lib/xe/oa-configs/oa-metricset-codegen.py
> @@ -139,7 +139,7 @@ def generate_metric_sets(args, gen):
>                       metric_set->perfcnt_offset = metric_set->c_offset + 8;
>                   """))
>           elif gen.chipset == "lnl" or gen.chipset == "bmg" or gen.chipset == "ptl" or gen.chipset == "cri":
> -            # See intel_xe_perf_accumulate_reports for the offsets
> +            # See intel_xe_perf_accumulate_reports for the offsets (value of idx variable)
>               if set.oa_format == "128B_MPEC8_NOA16" or set.oa_format == "128B_MERT_PEC8":
>                   c(textwrap.dedent("""\
>                       metric_set->perf_oa_format = XE_OAM_FORMAT_MPEC8u32_B8_C8;
> @@ -151,6 +151,17 @@ def generate_metric_sets(args, gen):
>                       metric_set->b_offset = metric_set->pec_offset + 8;
>                       metric_set->c_offset = metric_set->b_offset + 8;
>                   """))
> +            elif set.oa_format == "192B_MPEC8LL_NOA16":
> +                c(textwrap.dedent("""\
> +                    metric_set->perf_oa_format = XE_OAM_FORMAT_MPEC8u64_B8_C8;
> +
> +                    metric_set->perf_raw_size = 192;
> +                    metric_set->gpu_time_offset = 0;
> +                    metric_set->gpu_clock_offset = 1;
> +                    metric_set->pec_offset = 2;
> +                    metric_set->b_offset = metric_set->pec_offset + 8;
> +                    metric_set->c_offset = metric_set->b_offset + 8;
> +                """))
>               else:
>                   c(textwrap.dedent("""\
>                       metric_set->perf_oa_format = XE_OA_FORMAT_PEC64u64;
> diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
> index b2f447c944..891f4868a5 100644
> --- a/lib/xe/xe_oa.c
> +++ b/lib/xe/xe_oa.c
> @@ -875,6 +875,30 @@ void intel_xe_perf_accumulate_reports(struct intel_xe_perf_accumulator *acc,
>   
>   		break;
>   
> +	case XE_OAM_FORMAT_MPEC8u64_B8_C8:
> +		/* 64 bit timestamp */
> +		if (perf->devinfo.oa_timestamp_shift >= 0)
> +			deltas[idx++] += (end64[1] - start64[1]) << perf->devinfo.oa_timestamp_shift;
> +		else
> +			deltas[idx++] += (end64[1] - start64[1]) >> (-perf->devinfo.oa_timestamp_shift);
> +
> +		/* 64 bit clock */
> +		deltas[idx++] += end64[3] - start64[3];
> +
> +		/* 8x 64bit MPEC counters */
> +		for (i = 0; i < 8; i++)
> +			deltas[idx++] += end64[4 + i] - start64[4 + i];
> +
> +		/* 8x 32bit B counters */
> +		for (i = 0; i < 8; i++)
> +			accumulate_uint32(start + 24 + i, end + 24 + i, deltas + idx++);
> +
> +		/* 8x 32bit C counters */
> +		for (i = 0; i < 8; i++)
> +			accumulate_uint32(start + 32 + i, end + 32 + i, deltas + idx++);
> +
> +		break;
> +
>   	case XE_OA_FORMAT_PEC64u64:
>   		/* 64 bit timestamp */
>   		if (perf->devinfo.oa_timestamp_shift >= 0)
> @@ -910,6 +934,7 @@ uint64_t intel_xe_perf_read_record_timestamp(const struct intel_xe_perf *perf,
>                  ts = report32[1];
>                  break;
>   
> +       case XE_OAM_FORMAT_MPEC8u64_B8_C8:
>          case XE_OAM_FORMAT_MPEC8u32_B8_C8:
>          case XE_OA_FORMAT_PEC64u64:
>                  ts = report64[1];
> @@ -941,6 +966,7 @@ uint64_t intel_xe_perf_read_record_timestamp_raw(const struct intel_xe_perf *per
>                  ts = report32[1];
>                  break;
>   
> +       case XE_OAM_FORMAT_MPEC8u64_B8_C8:
>          case XE_OAM_FORMAT_MPEC8u32_B8_C8:
>          case XE_OA_FORMAT_PEC64u64:
>                  ts = report64[1];

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

