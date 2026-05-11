Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17B4CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 05:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC4110E471;
	Mon, 11 May 2026 05:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdI5t9Lc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A85D10E471
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 05:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778476515; x=1810012515;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wOaEEGQy7nVFUKvKNBxY7BuiqdYFgixohsOgGRsv98s=;
 b=XdI5t9LcWB5BWWgjSdV0N4bhyBlj0CfHeTcQuzOcjXiyR/s8qsVzPrV3
 om06Sn1MbHaKZ07p7/L5kysNhocYjUjG9Me/8T0XLNDETr33Hw4Occ+WI
 qZj7+JxY87DaIXg6gCynA93i7+vKoT0axSPfcsjjg6nXRVFCfnl9ZNFhs
 r6uxD+Z8EvDYGEdRng3+84LwCsOgZtXyIFXrPjpS9Bs9SmaliY0nfQfKJ
 mdO2aHF++VYeGvtbY+Jruuu41ujthqfZdQbxaSWm2Awyl+YNz+/kOwvPr
 U7swfHiHtyhA3uW3wXX0aAXXfHmuqRjKEDLHs8qBj5kP2/1LBon6AjS7Y g==;
X-CSE-ConnectionGUID: qfMZAoWaS3KZYebAhLHoYw==
X-CSE-MsgGUID: Qj4XGKN9Qoa37coKiX7EwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79378880"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="79378880"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:15:14 -0700
X-CSE-ConnectionGUID: 8ZTElvR3T0e2wwY0EF5xmA==
X-CSE-MsgGUID: MdFtZjHfTRu+2leNwImsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="242343292"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:15:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 10 May 2026 22:15:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 10 May 2026 22:15:14 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 10 May 2026 22:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+wOBV2IZ8h8yQjcHkagAzYhOKSjfnMOrzmxsrtyoMQAcbS3s9KWlrAWzYNkYeoaZRVK8Kgxq4Xt/WWgY9dT8/VggxIimc9jr2VEHH7++jAU1NSVhogDLry9b6O390kBaWDFBOCrhtZYiMrNjTWLjMIXBxnxdxVlEH6WB5yeGDluv4uTKsU8QkLTEwdflMBQbX9jD8S0Zf/n/a0JB8aTjU4/Ps+aWxxMsEA+XdNXAVN7hYYmLFyJGPmzBKJKDfWXvnnBoovHSA+Jm7BEiPb/6AwM+G3ZYY27+HorPj5D6m+kLIuqUb4tgWfHRHXEAnY28PFUNJkneBzhajmC7yQNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIVXgYo3YxjrgWxJI/CxwkyUiKzhLCfs+iit6WwHHl0=;
 b=MQwV8CBlU1/r/jt5NHaXWr1ijlsFNZfxryY/Y2F8FlbR2lERxWqUTjwAn85qyNkN+fl4ozCqC/M/8HQ7OXvF01MGdUayB2ZYLHG9uePliXA8eMv5N6dnRdFFPqQgsMhJ9a6RG1FjPV5MBZJUkfHf6qI1JGWX0x2bTbEi19jiVlzeI/Zwonx89csJrTIgSSe73A2jPGpLWtqPk27WtzdpPrYddtzhN94Nl/crZfUMsmuRhWKn2tkaGsYBbSRW0Naydf2zq8Qrxq2UBDBEZgvBA16/6hrMijMG9cSYx4U69lOb038OdZ0k8rq6+DxAWU04OfmwUjjX7GJKkDG2uJmIiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by CH3PR11MB8708.namprd11.prod.outlook.com (2603:10b6:610:1be::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 05:15:12 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%7]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 05:15:12 +0000
Message-ID: <43a40a9a-7571-4257-bd1b-0ccf45d98d92@intel.com>
Date: Mon, 11 May 2026 10:45:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/pciids: sync with kernel commit e68a60f9e6a6
To: <himanshu.girotra@intel.com>, <ramadevi.gandi@intel.com>,
 <aditya.chauhan@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260511045955.23541-1-himanshu.girotra@intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <20260511045955.23541-1-himanshu.girotra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0182.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::17) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|CH3PR11MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a14e96-76d5-4c9e-a10a-08deaf1c4735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 3pUqezZ+aQjrTyW9EbtMIJjSecQXpL7wNvBrvs2U6U3NanjS9VPpsdYM2qYFMzEZO9e2ky28jaajE8R3U1+k9IxTYCATuEDBkaeg6MHFVdKxgtLG1oLsiMaa1lLcS+L/ZcyW9r8DJVFmYbqQ56atLyM/H9cl4XddryIuj5+TpixYnOohYdeLOjFyxK9oaaPh82N5QVTntOBVO0FQWSRXnuNifB/xngAnPCPIFwgFYtKAWe3gg+6HalMZBZo1RP0NvKT9DEA+KkFxHQJXMSJI//nu9CCO89xg3ajxBKpZ1ypyN1B0HAxAQtDSfgE0iO0LtaDcvnLpWvNgr7+pFT7akE96GOqP5V5JHcwMBp1u8v/MId4nKSqqL8M+vuvGfS9JXat1Hft7SEGFH+DqSHIWUyM3lQgpIa1462JEzxz9lmvJyvw6eM9oOsW+f+aZ299YRyFLamQnxhVTc1qjZcPy2/isMhS8pfKsB6QG8GvrZryPqS36WMtMYqjq+OhCpodeHZoskLFIgER3zXYMihGEKq/QaPqJgU9LUYRLECQBeNm/h2g7nM2/x3ao0yTkP0UEB79ru3q70j9pyXj67Qs6wSC3r4lfdPAvAhNJrYDdGNa1XVWrVX3osiOe1dDxFKshfjgFxvYhitV8MHnbQvxe7eqFxsSz05SvqLoj9WsjZ1/Q0KJU6zzqjT3XodVGi+qh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGIwaGVMWG4rSmEzQ3hndTFFSGMvcEVLcnBBa0ZwYmY1anNoTzZpbTB4UjBM?=
 =?utf-8?B?bHlSNEFWRnZDWjVVT1RvZDNpVkk0am85L3paQWY0bFlKc1AzWnZWWmxuMUww?=
 =?utf-8?B?OUZ3Q0FMazdMaTRFVWoyYkdTYXlNaDQvSmN1cGFIeTBIZHVhSXdJdVEvL09n?=
 =?utf-8?B?L2xpYjFvaWJ6OTY4M1FRdmtwTlh6QnpGczJqdlU3L0xTc1BSNUh5ZkpSQlRC?=
 =?utf-8?B?L0p0TFA4VVBIZlcyMmtkblFDaU1KaW52ZVNSWjltdEFBckM1SktzZk8wQUJ4?=
 =?utf-8?B?QzRjWWl4MFFad0hNaDQxd2ZHaUl1VFA3dG1odkpsWGh6NHN1UHVESUl5WFpB?=
 =?utf-8?B?eG01SWhFK01WckRuZFpqT1dxQndIRGErOTduOWpaSjNzSWRQZmxkbEwrOS8y?=
 =?utf-8?B?QU9wV1FvWm1RTHBTYithUDlHMkhlSjlPMlBWY05uZEhhUHp2VGpZb3FxdUph?=
 =?utf-8?B?emhnN0FMck1TYlg2Si9UclRwNjFXMDlCcHVqS0FTUEIwczVtK01VUlNROE1l?=
 =?utf-8?B?RkxzR1gram9IeGIyRHRZbUQzekZKeFE4Yjg4UmR2UUV1REJqcU1IUHZHR3hP?=
 =?utf-8?B?ZUtEaXZBTXVzTGdCSFNqQzc0ckMzY21rR0JrYW9FRitjV0wrZFptd1kyYmpy?=
 =?utf-8?B?QTFzVmIvczliQWx4NStLblZJK05FN1VNU2FxVVZFdHJhNm5Ib2hQMWNiQlVi?=
 =?utf-8?B?Z0hNeG1ydkorUGE5S2wyK0ZiNktvNFN3S2ttaTl3emF1QkNqNjB4ZFdMbFZh?=
 =?utf-8?B?NE5uVlRiaG1rSE45b0g5Um53bHhVNHFPV1lsL1YwQWJ3Nk5WRTFWQzMyUVpw?=
 =?utf-8?B?UlJVNCt3RGlVcFVVRDZjY0dHdzRkbjJBckRXYWhXRTFRQ2llQUl6dmtpYU8z?=
 =?utf-8?B?aWh2eDdRMnVORlkraXlHbldRSzVpbzI4WmlsRDZTWUY2ZmlmU0luanFpY0VI?=
 =?utf-8?B?NXZBcHkrMzUrdWI1TWpMejExZkwwUXBmdmUzMW9UaUtYcUdJYnhyWVNQbmFZ?=
 =?utf-8?B?RS8ydUtSeVgrbWRmWEdZVVZYNU5rZGY3MTBKTExuQ0p6WWFWUnNnTHhta2hF?=
 =?utf-8?B?V2hRa0g2L25HL05uQUpMYVAycFB1Wng5dkRUWDA0WUZDbUh3dzFSRjR3YTBL?=
 =?utf-8?B?Rk9UWG9QVGhrWUlzQ2YwTU9yd3gyL3UyOGF0Zm9rZ3g5bEJPRGJ2a2Z3WHBD?=
 =?utf-8?B?MVlZSHh1MjYvenhRQStxVkVjeEE2aCtWekp4SWNuOW02QTE3UTBFdEkvemRV?=
 =?utf-8?B?cm54c1ZTQS9WTDdLa0xiMVBiamtEbWtnNjhvSlRMZXc1Q29LUTJ2Y1BGNmZB?=
 =?utf-8?B?REtSVDk4ZVJDNExVY2szNWpzcG5nckJuWjZUQjhBNU15MklhUHVCakZuNEVX?=
 =?utf-8?B?NzJqbDRBcmhVNGxZbW1Lai9kd01RNUNYR3VaYTdBZEJqSlRHSGZBMm56TDlx?=
 =?utf-8?B?MllmdVJCT3hzSkZta2owaEp3OGFsZFNlNThyZDFiaEdtemMrUFVrQXVteU5Y?=
 =?utf-8?B?QkJublFXMFUvWDV6TGZBS2VhYjZPSWcwT3pnWWM5dys0czVzcFlMQnVkeEt2?=
 =?utf-8?B?MDFXbitGWm43V1VOTVI0Z3RvR1ZOa29maEFvdUZpNWVHekhHVFdWOEtQdU1W?=
 =?utf-8?B?ek5hMEMwKzFTVXIxUmUyVUk5N2dWSUJMNG5IQXJObElKNDlGWjVVWG1xdVFZ?=
 =?utf-8?B?N0tSdGRwczc2SEFFMk45L1RlVm9XYlB4YVVtUU5VTFhCeXE4d2hUbm1oRmZC?=
 =?utf-8?B?VDdndHdSV0NzOUdiSVViMU9tazYrNUdpZHNzbzRlQjlDT29lbXhMRVd3amRI?=
 =?utf-8?B?cFYxNWtPemNzUWZubzd5UktOZXJKNWkySW9DRjJxaXdtRnJVVEFTNWtwcGJG?=
 =?utf-8?B?N0RnYTM0WW9QbldyRFgzajlXMDBnbGxnc1Z4V1F0K2ZzRkd3dzYvZFNHUWZB?=
 =?utf-8?B?aXkxN0JRam5WYUlRRlJkNlppTmVsd0FLQTdnUGQ1WHMzNU9NNVAyZmRJOTZC?=
 =?utf-8?B?K1BMb3JpRXp6NGtQYTgrVXRlK1c4N0NWNmZqTkZnWmpsSnR6bEVkcjNuNVZr?=
 =?utf-8?B?T3crOHlaUm9OeDAzZWNESy94Nnc5TnRaVlo5eUVIczloWVZEdWVjREh5VHdO?=
 =?utf-8?B?WExBSkY3RTJINVkzejg0M1lwNzZGYVVKRTNxNEJEalpYRlhrWnFXSlNhaTB0?=
 =?utf-8?B?S0Z4cG9zRFJmMjU4d0ZzUzRVejJlL2xpcEZPbG5oelFXRk4ybkxaVmJSeWw1?=
 =?utf-8?B?bW01RmhXYzRDbHN1RS92R1dzWnRNczBqVm5CS2dnYnJCRzREWUpWSnBMU3M5?=
 =?utf-8?B?dmljOEd2ZWFSeEtBenJ2eUJHcjh2WmtKcWxQMEdzWWRuWjU0eGZXQT09?=
X-Exchange-RoutingPolicyChecked: t3iOiWEHCYpGQtIH4z1/cavi4Yeb1nCSlLjoHRCwzADeajYJ5NC2wN19qYHwayWiM7JSV6OlOauuZlI7og2tzGpVczkqWz5CClt/ahUjvXpoXXCMKUhoS15ck/XkwNlOttzynmXB7GZd3bWGVZy0hn4FXQH8gFmZdT3czk7+X4uYY0FgVgZQxWeqzUcX/JWjzKxQWaDerPETcyw4kOLRSRI8FRgtfAZ087hT3Zo8m5BceBJdswutotxTPm9791Cd6HDKs14oxfuMWoU6iU1Z+NlgmdlZd6tFiS/efVYHQ5rwrJllkLec9E19DrI2Syu4jZP0YmhEtz+PzTpPR+cOMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a14e96-76d5-4c9e-a10a-08deaf1c4735
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 05:15:12.2833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uERWFtsqVsJN3OmMrEz1e0to5l8+pqTBIpnEIN+AMROlimpFYOhOLaGrhUVSbXoY8fSisa64jGdO+Ts/3lINZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8708
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

On 11-May-26 10:29 AM, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>
> Synchronize PCI IDs with drm-next kernel up to e68a60f9e6a6,
> which includes the following changes:
>
> commit e68a60f9e6a6 ("drm/xe/cri: Add new PCI IDs")
>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>   lib/pciids.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 33b91cb2e..e32ef7634 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -898,7 +898,11 @@
>   
>   /* CRI */
>   #define INTEL_CRI_IDS(MACRO__, ...) \
> -	MACRO__(0x674C, ## __VA_ARGS__)
> +	MACRO__(0x674C, ## __VA_ARGS__), \
> +	MACRO__(0x674D, ## __VA_ARGS__), \
> +	MACRO__(0x674E, ## __VA_ARGS__), \
> +	MACRO__(0x674F, ## __VA_ARGS__), \
> +	MACRO__(0x6750, ## __VA_ARGS__)
>   
>   /* NVL-P */
>   #define INTEL_NVLP_IDS(MACRO__, ...) \

LGTM,
Reviewed-by: Varun Gupta <varun.gupta@intel.com>

