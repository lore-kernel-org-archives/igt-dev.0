Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4926BC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 21:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F4210E1E0;
	Thu, 20 Jun 2024 21:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IwrXFWz+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5682010E1E0
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 21:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718920377; x=1750456377;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jRTfIioQ8Vqhj4A7uHYPA5ZtE5E1n7AxFiUaY42pzkg=;
 b=IwrXFWz+cMUBSP6sV0TRF0uaiZlQCqfTejVOeLKjl620s66cy6BIUvWb
 skaEzGyAjkCujmnzi09oucjjQHznTbChJQ1RAPefX46HAyb2GqcBwc4t0
 m5TAZzg6WUToez4yYNIhNkVq6093ZGejWc2gnNWd9hTI86+P91fx46so+
 QnwdaLBNSqahj3RST/G3qXWEDoBWsz+GinrF6Kh+rF1xfchWknrGXpWKg
 kYwHivzsfY8aWAFSKVifQf/7hwgcT5QmT0G+ASQu0PuhDLvVyu0/5VuWS
 fNqSrh4E4Cd+nDZwJXZnpuFC3QVHn0O3N/89JAoqKfNW27JgrIoPBot/j Q==;
X-CSE-ConnectionGUID: KVKtpU6fT9G0huBUSKYa9w==
X-CSE-MsgGUID: JuB2rNbxTZWtw9cRvROIjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15762165"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15762165"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 14:52:57 -0700
X-CSE-ConnectionGUID: S2//LgruQWmwEMD16ImU0A==
X-CSE-MsgGUID: p+aREA/NQZiTGgFDMnbNYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="46727944"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 14:52:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 14:52:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 14:52:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 14:52:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaUCsRCUeeM8drvHy2T6hIQOmHlQtmszjQUI9MNpKJ5EwNkTOUeRFH2ln4+NfL5knRqaJgfxoBgLHqor1ywQNEIcdxr1A0lFeQ1JxTZoL7pnhwO/S6Fcs/RLBSNnKSi21VO9AjdV+s9L2McLU9fz7dw5S92zbKPbD+jK7UZVdJE1IhOioo7eL+hUMt+0m6pwS+K0qZIhEkk2ourr5rZYOGP/inuAyrAt4ErmrH32ogdf/BdiUGCUEsp6jkRNofgvMXKVBSy4iK7F7SFVciSEkQuKdk/7QE/oBY1s7U0Aav6uGsvIK0FTEk1imUi99EyUEHp9irfVxEeBLOjhTIoazQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RF/XfUEBwxXxuAevEKnAnbCZzXaB3rbF7S+a9jl5J0c=;
 b=g5NfF98HHRDvQGNmG1CJm7UQ2e86zrYeWV3ijP7tCsz90n9cZN1YlDmV+FM4Lt2RzfnsY9XumNhZ4g3xRK37kOrzlYQ4R+CRKuJmsOF8rK5V237OYpccX057a7L+jg7e5NQo8qUOn3OuUzuYUh/okF0D4QhtEYXibE13rdIIVvaz8Ax57p0XYO7KvBdKux63i8TWVLxvh0LAgwKVJ2+NduxDXG6ePO3yCTSTwfVoJ+OW9vhqqc1/t5QPgUttCQw0cL5qVm9Lhs8geltVdF5dmQiFX9HDC8rSYD3wMZO3j/n76io+lj7qgy0owuk7Bis0RpUnmEB8eJGtDvVlKSHWow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN0PR11MB6301.namprd11.prod.outlook.com (2603:10b6:208:3c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.18; Thu, 20 Jun
 2024 21:52:54 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 21:52:54 +0000
Date: Thu, 20 Jun 2024 14:52:51 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 05/28] lib/xe/oa: Generate LNL metrics/registers
 files
Message-ID: <ZnSks63WU35bjwf5@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0299.namprd04.prod.outlook.com
 (2603:10b6:303:89::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN0PR11MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee54ae7-636a-4a14-d1eb-08dc91735680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWVkQXVSUnowSWFLazMwYWt4T1Jnc3REZ2lpd1JKTU5oN3pUWVNsTW40MFVh?=
 =?utf-8?B?VEorSDVvd0hjRURxTGI4VkFxN2MyelBOcGxOUVhlM3VyRGx0VU52R2VmS1Nx?=
 =?utf-8?B?VHphOTlUWFVWV0VKRFdlNjEyRXRwdERsMHM4Y1R4OTZwa3JVWitmZ1JFSjBC?=
 =?utf-8?B?U2R3MTRKWTI1MlljM0V5Mlp0bmFmc3AxdStjd09ySU56Z1ZuL0lnR0NUeFVx?=
 =?utf-8?B?TmI5MEp2aVd0YlB0aTQ4TkNlSFd0YXhUKzVud0w4ak81UEh0OFgrNWJoZnBq?=
 =?utf-8?B?akZUOE9IUlJwZ1hBVVJxV1p2d0twajcyOEVyZWluNnVSamJmdXdsbnRaOU94?=
 =?utf-8?B?SWVVOG5ZL1FOVEhJSVpQcjM2allnZnJjU3QweDA3QklWaXNnZ1VoZE81Mmw3?=
 =?utf-8?B?am9VT29wNXlBWFZ3QXJpaHB1SzN3Zy9keFB0U1ZjemRXb2RpTlVRRmRyNEtW?=
 =?utf-8?B?YWJPcGFTZUJkc3NJKzh0djRsWDNhQ3E5Y0hueS83bkVsUndyWWhxbHBySHRp?=
 =?utf-8?B?cDFtU2NHQkpFS1pnby9YRjFlWXdSNlhyY2h4ZEFleEMyTyt6ZWNDeVhWc3N1?=
 =?utf-8?B?NjB1TXNrME1ZMms3bXZwcnBVWjBjSi9kQ1gvcXF0T21DNkpSTzllcStlUlls?=
 =?utf-8?B?bitHRTJXVmQ1cWlyYUkyU3F4L095N3YxQUNmVkg2YWpPa2RkNHQyTHY1d1Yy?=
 =?utf-8?B?a2lxcG1Ha3JzRGgxUVZRZ0hXRjdtUzBPS25UVGJPbHl3Wk92QUZGMG05cW5I?=
 =?utf-8?B?VzhpcjBEdEUyVTFORVh1cUZhVVVueEwxNUVKUUdvd3F1QVhDKzJBNFB4UGMr?=
 =?utf-8?B?WHhNRk44R2c1eEdXNlgyVU9SUndqV2IzdWErT09PalJGQUNra241MllHVlZm?=
 =?utf-8?B?SE5nK0N4eGxYVWVpdDBibTlVNTd3aEgzR0RDdVhpZGZONklZaHdvZm93WEd1?=
 =?utf-8?B?N0pqWm9zQnRjcGFlRjZpM1krZ1JkZ01vbUQ2LzRUNjRZZ2MwM1c0OVp1dXph?=
 =?utf-8?B?ajBGQXdleFI1Q09DZ1c0QWtKdjlKcmgwMEZob3VCK0NoSGVjQ1RsSHo2Vmta?=
 =?utf-8?B?cy9kU0R5ejNhUXdkSWd0Z0RGR2M1Q29IOU9CcVNWM3dzSElaM2RqaCtrN3Yw?=
 =?utf-8?B?d1F0bGhPWVFzUUEzWXI4RnBhUVl0S2tnT01tdFEvVjFrbG9La1F3bC94OEFa?=
 =?utf-8?B?bFVXSHNYbTdJUnhkN2FMdlBIb013M0haT2pkeGV1WUpRT2QvWGllQXpwTWJp?=
 =?utf-8?B?K2ErT3dIYmptVy9nb0F3WjFHZTBrVHNmOXBpRlpmNklMTWNvMXMxelJPYTdK?=
 =?utf-8?B?Y2RIeE1NNHJMZjB6NUFwUlRncHVxQXE0dWVVRkdKM3ZXUWpKQmlNak4zeDNS?=
 =?utf-8?B?c0lHbFVZQmV3Ykx4dlE2T2tCRTA5S1QxV3NxYjVaWlE2MUpEbUk4Q3FmV2xs?=
 =?utf-8?B?bThLMnVSUTJHekcwQnlZMmpFbERyWUlDYTM5T0F3RUZuV2Z6WlVVS3lCL2dF?=
 =?utf-8?B?YWV3TzBrVDB4M2FTY3g3U3Axcjh6YVp0YjJOVVlKcHRwa2ZiM0xMQU5HaFBt?=
 =?utf-8?B?ZUNoaVQzRUtoV3d2dTk2UEhVVTFPMHF2SmdCTitISmRZMUtjZ0lMWHdiRFJO?=
 =?utf-8?B?aUEwZURSMlBneVN5OHFMS1hVQ3NYOE52YmtOMXZHcWJ0UWMzVmFMSmkwZDV6?=
 =?utf-8?B?YUFDZi9ZRGRUOUFsS3ljTm5oanF6SXhwbFZiRHRuRG9GcGMyRGxYSkZMKzJI?=
 =?utf-8?Q?ZQJIuw1a2eKPXkz1vznlkxsCCORTjTxTlAjrZHD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uzl5clZoczZWamRTdUErbFA2NDd2NHgxbHhCalVWSW5RY3FjVU5wTlJMZEZS?=
 =?utf-8?B?RVN0SkcrNEhqMmJqbThyOG9venA4U0sybVVKWVZmd0VVazdoR0g2Z2RqOWhT?=
 =?utf-8?B?UEVSd3BOd250cWRvcTFqb3B6S1hZTG8wVkhpYzBCalRrY0d6R002Y2NVQnBC?=
 =?utf-8?B?c0d3YzdBNXg0VG41U2t0bDFjWVplejYxaThxWUpvWEczYzNQU2Rvck95TXAy?=
 =?utf-8?B?VEJtem9tQkdpMWEyemtuTittT1o1a21ZQTB1Vjd1UkxObmhhdENHbXo1ajFz?=
 =?utf-8?B?Zjcrc1AvT2Q1Yk9CYVRJUEZyMEdITW00S0QzZjZjd0dwS08xNGVkZU96MUlR?=
 =?utf-8?B?SHN0R21kYXRzdXZaV21tVXE0LzR2bUVGOEIvbEhtMmxmQnVBUUJXYmhGNCtO?=
 =?utf-8?B?aEp1azB5RkFXUVEzZFZiSG90eGxHdmZDdVpoejhYUWxGaXFzNzVPTm9Cakxl?=
 =?utf-8?B?MnJNZ1o3Sm9EZFBJRDVLbFBVSXJ5YUtYU0pYK3ppMFhuZW96cmFBZjBLREgv?=
 =?utf-8?B?RUIxUnpiZ0wxelNPcVp3RkwzbEdJZ1l4aVFaKysrL2FUVDhtYng0OW52cFNL?=
 =?utf-8?B?bkw4Y2x1VnVZWEdEUnNQajl5L2FrK3pQZDNQOVVuVTZaSVBHY1RiR09MVVhn?=
 =?utf-8?B?dUhzVGg2TWVJeGJma3Izek9IY3l1K3V3NjMzc0pyMXZrT1NkZEpzYS94d3pL?=
 =?utf-8?B?Yk9KRGhHNVp1KytnWXRLNGp1VytFTHZvNTJBUDgwTEdjSUR4aTJhTWhrZnNr?=
 =?utf-8?B?WG5PelVpYS9wSlk5UEs5cWJLSEZnMTlITDE0R1JsdHBjanFnNm40ZG9vOXMv?=
 =?utf-8?B?TVoyNG80L2pVNDZXV1NIZWNpYlI0UU00dHJVckw5MnpRMmgrRHd1amtxOEts?=
 =?utf-8?B?TVd6d2xzRGcvMlJkdEtlSHJNaXBQM0JUdXZCQlNCRmhQc1pHYmFyMnJDVE1H?=
 =?utf-8?B?cVFWZ09UcXhUckJvNng4b3VNUHQxNUpjbWRDdURjTkc2TVRYMmtWSmlKbHdh?=
 =?utf-8?B?cmhZUit4Uis2Mm1xdFYzdGJ2ZFhnUDJuZVpZRGRFeXFNZWVXcEs2OE5kaGNF?=
 =?utf-8?B?Q0huWVZ3ZXBsaEprWnNSU0pNLzM2S1NUbDBmRzkxSUhiNkJzV3RoeVFRMFFa?=
 =?utf-8?B?VmNvdVcySmd3TFh0YlBrTnBEc0dvRm5JdDBLQmN3ZXZ6akU4Mk5PZXFUNnZN?=
 =?utf-8?B?VGhvM2Q3Vlc3YlFDcjUyTU5DaGh5RFZnMmYxRzhlT3JTZU16b3pybTBHSC95?=
 =?utf-8?B?ZzNDeFNyb1pNOHNxbDNHcU1pYTZDZ2t3SkVKWGhRVVF5UWkzb3IvMXhTR1ho?=
 =?utf-8?B?aGtEYy9hbjJLWFlyZEFzVFZJVnVnSm1iUVJ2TnZ3eW42b3pCQVRwUGtIb3NY?=
 =?utf-8?B?OWNsdWliRTIvODQxSUVsMno1aUd5dWM0VWhpZ1NmSUZGSldGSlVPYXdXbUZq?=
 =?utf-8?B?SUpPcHRGemhEeEJLVjJYbFZiNWtOdWFiVUJ1NHNKVCszS05sVXV3STAzS2U2?=
 =?utf-8?B?Z1YrQXJmbWpBSHRJNlJ0TnZoUGgrMVcvcVhDSUlhUGdlekJ0dnpLZmt0T3NJ?=
 =?utf-8?B?ekVGUWkrZThMY0NjNGZTb0FMcVVkTTArYU5jVUNhK1JGelVpSlRUWjI5ZGdw?=
 =?utf-8?B?TC8weW0rTzFtdEczblpGb0VSMVZaSnI2KzREU05Ha2Q5QzBEREcvc2tGS2JX?=
 =?utf-8?B?b1FKZ0w4c3ZyeTg0U1UrRGZqdlpjTkJlOUxaUXNnUzMweGUyaHNRM0tSZFlX?=
 =?utf-8?B?THo2NTZ1cS9nQkp3bjRQejBCaXpUTGhmMzdWZWM3QVAxcVNrME80dnlyV3Vu?=
 =?utf-8?B?VFdybnVBUVE5bzArQ0dNaFAyRUZnZDlNT2xCZVZ6Sm1jb2F5RmVuQlU3TWti?=
 =?utf-8?B?RHM4MGkxVnM5K0VrYVRoUlJud2xEMk9tYm5YSGxHZmVTMG1RdU9RYzNabXRJ?=
 =?utf-8?B?aTR1N3Zyd25pSEEwaXptUlNBMzVwb0FBTjcvazh5ZTNFK2pIbHc4aHJJVUNv?=
 =?utf-8?B?a3Btd2FBNlB3Qnhiams3UVIyR3Q1ckZxV1k3b200SDhTd0FVUFRXZk1yLzNT?=
 =?utf-8?B?NThtdVpTc0cwalI0bExWeDBQQnJjRXlRS1hCT1YxODJUaG9IRXMrSmpueW5N?=
 =?utf-8?B?QkRTbDNqWVlReG85NWFNWVhVZU1vbzk4SWh1bVRpaDN0SmVNQlI3SGpVTlVF?=
 =?utf-8?Q?OmOcUwdTc/Rzc5a07NOQao0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee54ae7-636a-4a14-d1eb-08dc91735680
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 21:52:53.9976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wazd/SEMywSG6XL2vmJHIwBMnDNQ0/bLhZqYJ9RsGIpYQi8waL4q6fqtwQoIbWyE3UGzZEhBQbiJaUbhNPbGSFuuKoZHSvfpi6e6Q3EBlkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6301
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

On Thu, Jun 20, 2024 at 01:00:30PM -0700, Ashutosh Dixit wrote:
>Generate metrics/registers .c and .h files with the XE_OA_FORMAT_PEC64u64
>format (called 576B_PEC64LL) used in MetricsXML_P31.xml.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> lib/xe/oa-configs/oa-metricset-codegen.py | 19 ++++++++++++++++---
> 1 file changed, 16 insertions(+), 3 deletions(-)
>
>diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
>index be9483af02..ea0d13cc97 100644
>--- a/lib/xe/oa-configs/oa-metricset-codegen.py
>+++ b/lib/xe/oa-configs/oa-metricset-codegen.py
>@@ -116,7 +116,7 @@ def generate_metric_sets(args, gen):
>         if gen.chipset.startswith("acm") or gen.chipset.startswith("mtl"):
>             if set.oa_format == "128B_MPEC8_NOA16":
>                 c(textwrap.dedent("""\
>-                    metric_set->perf_oa_format = I915_OAM_FORMAT_MPEC8u32_B8_C8;
>+                    metric_set->perf_oa_format = XE_OAM_FORMAT_MPEC8u32_B8_C8;
>
>                     metric_set->perf_raw_size = 128;
>                     metric_set->gpu_time_offset = 0;
>@@ -128,7 +128,7 @@ def generate_metric_sets(args, gen):
>                 """))
>             else:
>                 c(textwrap.dedent("""\
>-                    metric_set->perf_oa_format = I915_OA_FORMAT_A24u40_A14u32_B8_C8;
>+                    metric_set->perf_oa_format = XE_OA_FORMAT_A24u40_A14u32_B8_C8;
>
>                     metric_set->perf_raw_size = 256;
>                     metric_set->gpu_time_offset = 0;
>@@ -138,9 +138,22 @@ def generate_metric_sets(args, gen):
>                     metric_set->c_offset = metric_set->b_offset + 8;
>                     metric_set->perfcnt_offset = metric_set->c_offset + 8;
>                 """))
>+        elif gen.chipset == "lnl":
>+            c(textwrap.dedent("""\
>+                metric_set->perf_oa_format = XE_OA_FORMAT_PEC64u64;
>+
>+                metric_set->perf_raw_size = 576;
>+                metric_set->gpu_time_offset = 0;
>+                metric_set->gpu_clock_offset = 1;
>+                metric_set->a_offset = 2;
>+                // metric_set->b_offset = metric_set->a_offset + 38;
>+                // metric_set->c_offset = metric_set->b_offset + 8;

Above 2 lines can be dropped if unused

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

