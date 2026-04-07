Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C475FB5192
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 05:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A0910E09D;
	Tue,  7 Apr 2026 05:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlRWgGe2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C78F10E09D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 05:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775539307; x=1807075307;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nOKyDui9vuc0CGh28wItQJypG2FVfaKixAOdxEHBifM=;
 b=WlRWgGe2pfBDCnlDxa5it0OqzQkwbXvyXsPhaGIWQvB0vyAmM6keX1pV
 dRDeYYwIRijkFaQJF84GGAROliqOtyBmQz7NtCvquJ/8zadRD2GrAk7Iw
 nG/TCb4r6jF1Zhgtuz9GEE328i6DEzPAjBBcEIUUIiufAhO5Mqg9MciRD
 5DKlHPVOzX7tJe9mgNH5fkvjkxsDzTby4iPJPNMufAGfWrccS8egppogl
 Mld/tfy+LHs6+WXRAXgkGBhGZyxZgAX9d0M/7FWr4VZ4YZDOxTpd7LZKj
 RUcvqD5XKB+2QNJNm8NeCWzEDKCvV/OHBj/rDa7PHmdwYKOQ8CzZzfU+c w==;
X-CSE-ConnectionGUID: xa8LBTPST6uh1cUYp3r2CQ==
X-CSE-MsgGUID: 8baS9cqvRuKLsoTnM9lSAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76683412"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76683412"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:21:46 -0700
X-CSE-ConnectionGUID: IiAmdchrQqCJpjH41QZ8xw==
X-CSE-MsgGUID: ulPz/nYCQrSrU4Iz6risdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="232945922"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:21:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 22:21:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 22:21:45 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 22:21:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpggvxohWrOAYw/Fw3QTRI+lLZYjztxPIQ9eBAo++0bW0kcIZcvacPioXXnXOlFNgPnmbzW87EtsMJoHL382aUMYz88VX8SHESnQwKy6hsfQ428tPNmhDKa3O0CBdGcfLp8IpZep/ESj+DssrQC1wDmsPyL7dLwMU5cs2WqYASLyf1rSkjWocMMd1CpKM/FUKAMoMGfFxgB9oIOlsBUxA36XM6MygFyYVotDn9j16ELyNAY6chKNBa1hrxmB2DwYgj3084CXXv+vcbyT18saWlJVzUlg6n7fqC/ZYj9S866FR66wKglfFpjt+gCOrcjyUWQkpLER9KhNIE+PHl0Xtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZ8vYibpe79nQPYhYOQZjclZXTvmuQJVJRojs7g0zsY=;
 b=eyM0ZffN2+s0iocRCJtHUr8VN1wC2hGaboa1o6Z0SRb2jStQjwDDSPmIQWUCfz9dqhQ6kckc6AIgAp88eGiLUwDZc6JvzPvnYh7PzDZ4pVg/1RS07aWfMlkVHok67Rp7iNl+8PRCvoPwCit/4XjrPQJaIe2jh85cb+kAaNtWKSWGsqgQlRy3B57gtKOMjYZ9IJOa9NnFt9FAIaeRlvo/BETg2m/mGsxuAEJxqP2HH+79HfCcBdCtQmd5N/l4HtBshScp+A4HZYq9buVe2EKgpfGfMocpMLn/0tYO14LpEs7iGd0wzK2Vy1vJxItL9HKXdr4QfMRuwScOpWVMbaYvKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CY8PR11MB7314.namprd11.prod.outlook.com (2603:10b6:930:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 7 Apr
 2026 05:21:43 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9769.017; Tue, 7 Apr 2026
 05:21:42 +0000
Message-ID: <9736c12f-c2a7-48c2-b017-a8e5ec6862ba@intel.com>
Date: Tue, 7 Apr 2026 10:51:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_backlight: Setup output before
 reading writing backlight
To: Suraj Kandpal <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260331073400.1316874-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260331073400.1316874-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CY8PR11MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c1476b-0b2b-4d23-2ddd-08de94658dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|1800799024|366016|376014|56012099003|18002099003|22082099003|20052099010;
X-Microsoft-Antispam-Message-Info: MYGjNDRn1ywN3z/G9KJsArQdf7MYdGqKKE5VSCBbPjj1HYxz4ONHiKzryXPmLaZPBy1oGhaQrmO8P6nmOvXfWKDsigx/390r7aQPaDIlFZRa3kZez6EVwKdm5saEjOpPaRWQNN86/s0puHi6hKRTlOHt7fTjq0pinKP4xDtsFmct/H2zHmFbGME4stTiW2QsAv6Mc6nB6pWNQUmEA9Ar3eaKq+iulNoSHaMeQO+A7wRbQDgVG54yAa2Nf4YGXDeqlnqjFDPNzaXeLm4mLF3qBZZ1wmh/oU4SFaH9lZ1y3hWLZ1Z0rPqSZDTTX8/j7aiAzfZysJ5zb61vekzNc2PZf1veVP+r6xAatVyxc953YfR2BQjQe+KR7x+cDirailgRKrge5jJjhnqfLOMs5cFHViyKXvdvjl4cP7smUKS6hu8tsfaJat1BtSHbIbhEXwKr3v5SRU8lj24Clj05BMoElHwy0j1h01Iwkn7ljiZ8+DFxnZoPMx992cMut51nYBxfZJ3OValNcr6iYwRwhpL7I8M/0e2/EzYpFOauykTUSasZI6IexMcpYRbnOMUYyvRHai0MpmGTM/2Tqu2bgvovxfcYkwn7DaE9N9VLL3okAC1Nt6Og7VbpP/AkG6WPnQb6/aresEyr1NJCdoJxLUpT6VPyngzSn9R10YFyWvbdZ69m9M0e9VhKK6/e17gsPi0hUUded49uZtZq/tDuTe+Pas/chno8pBjxqMC6WqmrzHQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003)(20052099010);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHc5UnVLUENOR0c4RWdGVy9xMW93RStmRjAyT3lnU0dCektQZ0RiR29JK3ZL?=
 =?utf-8?B?bGRGdWFtT2NkcHRlL1dSR1l1K0RmOHlOb1NCeWs4bGczMzcwb0toVG5xUUY3?=
 =?utf-8?B?bGtkZzVoV01TR0VLRXVtK3Z5VW84QUhpcVVmVFloSlRyZFVIWnpnWGpMNXhw?=
 =?utf-8?B?SHJFbjVPTCthWTMvdkVXaHN6TWlSalNDcktvbjMyVFkyaThUSlZVNml3bHRO?=
 =?utf-8?B?Vnl5UTg2Q1hSZzNUUlR1RTJERW5xVWF3bTFoNTRFaStmYXk2blpzSE1aT1J2?=
 =?utf-8?B?SkpqbURUNVpXTFVhc3BKUHluajJuOHFNdVZXWUp0cktyWWF5eFBERjRha0Zz?=
 =?utf-8?B?MU9qN3pPSVYrbVI0Q1BZWmRTeWRZbE5jYkdTQ1U3eWVrb2RycGZrZm9McXlj?=
 =?utf-8?B?V2dBdmRtOWF3TDhzUXN1dTNERlhBV1I2Rkl5RkpJN1BaekVybG52T3VwODZN?=
 =?utf-8?B?RzBmdGVuTFhIbU8yVHZDQTgybUZ6OEdBMkJQM3NLOHIzSFduOEcySm1OWDZP?=
 =?utf-8?B?WG1udS9ITFovWDRmeCtOS3UvN2RldTl3andoVi9vOU1ZY3R0QzNQNDAvd2dj?=
 =?utf-8?B?dTU0NkU2NWhiRWlSN0FsMHlUVmN4enp5UjhyVXFIWGZqNEt6ZkZnLzVCTXhK?=
 =?utf-8?B?Y3pKeXh4S3VBR3ZRVlZxOE01TmgzczJIUWxFVUxLWGlBOWJNa0h1T1ZrNGsy?=
 =?utf-8?B?cmtHYVV6SnovcnFkTzZZQ3pUeXpCMTR2bSsrN2pJd3E2R2xlRkQ4a2dlVDN3?=
 =?utf-8?B?QnBFVGVIaGs1Y0x5bW9DVHk5QmJWSEllejhrbzg3RFk1K3NMTW03QU05RWNB?=
 =?utf-8?B?OXNhd0ZMR1V0V3BHdVpFWG81bUsrRTlhMFhQa2R6T2toLzh0ZitxbEdCSHZW?=
 =?utf-8?B?MWF5QXFidXZhNENDVHprOU1aa1NKMzV6bnVsTEZhNEY4QVQ3QjR2RlpMck50?=
 =?utf-8?B?V09PVGtBajRNb1MxWWVEVnFOL1NHS0dGWnZxV2FIejBsZE5oMmhGYWVVVWhJ?=
 =?utf-8?B?MFl4OEJseVhJNTNQcm4ybGNjdlpLTWpva1dLMllSZEdrd1R5MkpFNk9hd2FP?=
 =?utf-8?B?elpkWElMZ2IxcDdhc0prZVc5RUZ2SFRlZS9CUVF1SGhxclA1R1JNYTloTjVV?=
 =?utf-8?B?aVpiZi9uemVCTnNKNTRWOWg4L2pIRXlzRnZLZnMwZGpaRHh4UEJyaCtTeHRY?=
 =?utf-8?B?Wk9NVjZMMGJhMWpZQ09FU29iMVpTTEpRby9pVm1iYkplV0ZWb2dheDdQdVE3?=
 =?utf-8?B?c3JqSWdCMnVCMWN2Yy9sRHJvbko3c2NGRjY1MHdpSjVpRWltckdhNUhJcWJQ?=
 =?utf-8?B?WGV6Z0Y0R3BrOUhFbUp1QWdWMXZWZDVoUkxaMVNabVMzVFlKMkUvVVVTUHA0?=
 =?utf-8?B?WjhQZnFMNlR2ekJyM2h5bEYrcW1rV2tCOVNkOVY0QnFTUFFSakxrdDM5QVpS?=
 =?utf-8?B?ajcyMWFRS3VHQXFVQTNIVmlPL2liUGlxREZoUDJJblhhem1IVjRGOTdmakRO?=
 =?utf-8?B?dHZoaHhNTFk5QlNhSHRLamFwbitqeE51eldQRWtJRSs4THl2OHQrZXI3WGYr?=
 =?utf-8?B?V1hjOGY2bFQwWTVraDBHWGZWR1p6MFhia3RhdHNETE5kOVRNb3hsY1dEQlpP?=
 =?utf-8?B?UFBhQXlGaEF4UzVMMTUzSjErbzNYQ0Mzb21JdTBLMzltaVFycWtwbTdXdjNk?=
 =?utf-8?B?WmxXNzJjcEhQY0R1UjZjeElPaWZVNDRjdTBUaXhhVXFEZ3lVanZYL1BoK0F1?=
 =?utf-8?B?OVUrUTlsTFZrVkFSZm5lei8yQ3I3WHRsZkdWZWUrY0RQRGNScEJWRUVKVGhK?=
 =?utf-8?B?WDQ5YnIyWE9UZXZndmRpWVk2THRCMkl6V3JCaldPUWQ2aTZyZVZpeUtWaUhQ?=
 =?utf-8?B?Z1RrN25Qd2RUeUhBeVYxSmIwUU1tU05MU0JDb0x1TVVHbnhUY0N4RGxQT2pX?=
 =?utf-8?B?K2NzQlUxT1ZROUNyanVENEdKb3p1UnE3U2RiSWdnRlFaY1hWdC9zYlZML1VY?=
 =?utf-8?B?eVBHcEZzTmJKM2FCa2IrRHBnYnIyOWR3emZsdXdhRlE4ajY2VlQ1SVhkcEpS?=
 =?utf-8?B?V092WHpoRitBM2hYZ0c5ZmZtdlQxRFJ6aU1oazJZcXdUOFdoVkNGNzNPWURC?=
 =?utf-8?B?VkM4Wjg2eEtmRXorMXJ2bDVDNkZzaloxcnRQYVRyajZWY3NZdUpJYVU0aWNO?=
 =?utf-8?B?OGFESUlEMThIZmVIMWVtYVphd0g0cW5qeVkyVk9adEFaM0NiUDdWZ0p4OUJX?=
 =?utf-8?B?Zk4yZzAvVEpTSG9MdmI1VkFxQXRaalMzT0FjS2N2M1RiM29NbFZubm41b0dB?=
 =?utf-8?B?SmZWaFFWNFhOQTh4RytvV2Q4ZDNDSnNBYWNVRjQrWHh1Vm03UUR4UT09?=
X-Exchange-RoutingPolicyChecked: jl8upaTTtqqnAygPtDh+BeOSYYM5/oJootGvagufEPU5OGtTCNAB+YizsDp/lr+tvXxtKWRxYdHF95+6nr24UOYdvQexrjRQGcyV1o0BBOKHXM9HM4YjoTMl6LZJJz0d9khrQDdjyZv9L2FKcIRBbill0wmXqGc2D2c/tEKCrrYfw93FvRyttp9Q880/QYU8JmLxp21LTer6LRRwFBzYD2D08BwZv+kAdDQ0SRUc5jgrt4kHrv7wOdjzewrDu2Tl570hFIsTYJKryGZtZwztQmP3gDY0SILhSUz50oVHse6zHyckti/7fbWXJ8zZWMH9z0WhRs8aoZj7tcOBmcjHew==
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c1476b-0b2b-4d23-2ddd-08de94658dae
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 05:21:42.6887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHSE4GXc8HWZaryC0wJqAb4Zy91I8jdlgaxcT/MXeWp0Rsdiqe0rhq/LQij3SdnwTqj5nB3ha0l36PzYOsjHHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7314
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

Hi Suraj,

On 3/31/2026 1:04 PM, Suraj Kandpal wrote:
> Currently many pm backlight tests assume that panel will stay up until
> unless we tell it to go down or AUX transactions are happening.
> That is not the case, some panels when they detect that there are no
> changes or commits going in, it will go to a lower power state. This
> causes issue in this test like AUX suddenly timing out (mostly in
> fade tests where each backlight change has a 10ms sleep and many
> steps giving panel to internally go in low power state). Also since
> changing backlight has its own interface it does not count as a commit
> hence does not contribute to the panel staying on.
> Also trying to change a backlight when panel is not up does not make sense.
> To solve this setup the output and do a flip to make sure panel is not
> down to simulate a real life use case on when backlight is changed.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   tests/intel/kms_pm_backlight.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index daa70c716..1e1e0fdbd 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -84,6 +84,24 @@ enum {
>   
>   IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
>   
> +static void setup_output_and_commit(igt_backlight_context_t *context)
> +{
> +	igt_output_t *output = context->output;
> +	igt_display_t *display = output->display;
> +	drmModeModeInfo *mode;
> +	igt_plane_t *primary;
> +	struct igt_fb fb;
> +
> +	mode = igt_output_get_mode(output);
> +	igt_create_pattern_fb(display->drm_fd,
> +			      mode->hdisplay, mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_LINEAR, &fb);
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, &fb);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +}
> +
>   static void test_and_verify(igt_backlight_context_t *context, int val)
>   {
>   	const int tolerance = val * TOLERANCE / 100;
> @@ -133,10 +151,12 @@ static void test_fade(igt_backlight_context_t *context)
>   
>   	/* Fade out, then in */
>   	for (i = context->max; i > 0; i -= context->max / FADESTEPS) {
> +		setup_output_and_commit(context);
>   		test_and_verify(context, i);
>   		nanosleep(&ts, NULL);
>   	}
>   	for (i = 0; i <= context->max; i += context->max / FADESTEPS) {
> +		setup_output_and_commit(context);
>   		test_and_verify(context, i);
>   		nanosleep(&ts, NULL);
>   	}
> @@ -154,6 +174,7 @@ static void check_dpms_cycle(igt_backlight_context_t *context)
>   
>   	igt_pm_dpms_toggle(context->output);
>   
> +	setup_output_and_commit(context);

This is not required for the dpms subtest as we already ensure we're in 
'IGT_RUNTIME_PM_STATUS_ACTIVE'. With this removed,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>   	igt_backlight_read(&val_2, "actual_brightness", context);
>   	igt_assert_eq(val_1, val_2);
>   }
