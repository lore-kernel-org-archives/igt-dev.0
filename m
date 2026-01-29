Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC9AD358D1
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 08:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA2410E813;
	Thu, 29 Jan 2026 08:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlXgpqSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D74210E807
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 08:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769674763; x=1801210763;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MUYRUC2/Iypv7/2fulaEnzdsVjr1Iz6hYNBODc6nLX0=;
 b=OlXgpqSgMm3uxYXV7reGfEaSppVgO+Qwinr+VHZWNtxoCWK7dKLIHXHy
 SEU7KdXrhcIWAAJOrRqnbykd0anSEMYg0ehe8b65huu1GdjsrdQebzbNx
 8et65WJFOgxEypWuEvAvgm53eGiioOtRXOXo+Ffnh4BZT+M+yljq/Sme9
 QhqXvGCdTvtiWY8pawrA8cjoRW6S9W5bisHpX/2FrxqvVKrHHPU7UNCdM
 +ey7xBIOntpsorCwhSnfzaDvA7trouAaB/WSyqtXbiMn6SPmLySxGMBv7
 HN/yeUwTDS4t0uip/3LvyMrKeZC/lKuwcvfidqKaI1Kt8LCIWGrYiMZrv w==;
X-CSE-ConnectionGUID: +qFrOq1gQGuwUntyboeGgA==
X-CSE-MsgGUID: Mh3ugKA8Tn+llTHoVa+6sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70619619"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70619619"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:19:23 -0800
X-CSE-ConnectionGUID: grn0syNIQ7eEmadXmtSzDA==
X-CSE-MsgGUID: 2ATCsI6CRLClMV7MOvRgIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="231432666"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:19:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:19:21 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 00:19:21 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:19:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bc1yQLGjMJhSV8gNX028hGDVtFIJMMOJ7kDGmJUYLMfY6ySw6q0ggEnwh2LBDNdDqycYfCSv9G1QzlURd4v6lg5hI7iym1SULGpCi0GURizEPAXgWyRVOH5zXEHmN8e/Mk+P0TM3u1wjBofH8/KWgJnn6RHafkKRROL5+1TtRzqkFQv8DiG1N5o48ZxIpgIwwLo7WXPsF1CnbJnO9vwqoO3aqyOUWN4j4gBOa4Mz0vZhGgsjtGasjNlcQlDqDF+a7A2sHObdJD8+rps/IGFfiPpZLbYLIpvuUgRWtl2aojvsqVPzHvQ2F2Q2VReguc9etAHEeMKUubRfU/kwGqKhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcVvHoizVGjNC/Rq+HnuZtKqcda9Xsnl75BuDYxZoCw=;
 b=vHu1lKU+56H2gJz3++0FM+jHsUF1cd93inK3q+8EmRMBPx3sy4m8ts6rNxyEXS4NR/U1sFXlwyCmQJktQY3xwLPqbDrAPqsyH9cPhtT/NYS0hykJmx+/VL4gyh+mZwnkDpOk5/mEs0UzHTYD08QqvNiS0Kq8HJT8L9zaTxnJO6F9GEAptKXjRVp+vsFTbDXUl6W2qzbbPEG9qPinaoBGJQvcvmolKbiDKhR3rZSyn3QXhY5Ny0V45vtwJ6d2x5uSlVi4hkHD4yQi0uAjM3Uj7zd3e01NJ5hoQUPtWJ/ADZvYn9jEUxBpmt3BesLK92ExDTUTgZsAJzxzRXjOCU5KuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA3PR11MB9087.namprd11.prod.outlook.com (2603:10b6:208:57f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 08:19:13 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 08:19:13 +0000
Message-ID: <3df22e2b-1c12-41b1-a89f-e25f6c962061@intel.com>
Date: Thu, 29 Jan 2026 09:19:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 01/10] lib/igt_sysfs_choice: Add helpers for
 sysfs enumerated choice attributes
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
 <20260128180819.1373376-2-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20260128180819.1373376-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::14) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA3PR11MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: fc4e1dc5-f515-47ee-2711-08de5f0f1610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7142099003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0VxTHdEL3hkVVJLV2tIMTcxZW1tNWJabFdaZ2NwQmVLTjZ3MEZIWG5Sd1hN?=
 =?utf-8?B?aklYS1pqeTZFRHBkZkQwcTVpTHIvaGJGNHZyUmdKSi9EZDdCWVZOUXNUR3Fp?=
 =?utf-8?B?aEowYUVnWVZQYXQ0Q1Vnb2VjR3IvN1BXenYzTVhOTitrWC9QcW95UkpHWk1a?=
 =?utf-8?B?a2Vub0tPVmpMZERrdldCZFBRVGVRT1hBUHdESDZFODFpeHdzVEw0Z0c1R2la?=
 =?utf-8?B?OE5RUXhIMUY4MFRlUEhwVHJwZS9yRWdxU0lIMjVnRHFYYmdUbnJKbTJ3cXlH?=
 =?utf-8?B?WUJmSVV3c2dLM3pRTHVoNHpQbHBaY3h0QVdtSWhnTXR6TnBBWGhCYjRsZExk?=
 =?utf-8?B?VEF6RWdkTUJjSVJoL1g4N3lCSi9PWnBIMVplNDRmUDdmcnBNalpZdmNCNXQz?=
 =?utf-8?B?MVNHVm80Unl4ZzlDM0Z2anVNQ09RRmtQcG9JQ3hmd2hMWHYwUDZaRHRSYUpt?=
 =?utf-8?B?VFRyaWFVTjczWWwxaWtScjF4OE1oVG10QWlhS2cxSkJEMnU3b0hyYlNiYzYw?=
 =?utf-8?B?eTk5UGhpZ2ExQ0hwcWE0S2tEcmpPUkxXN1ErYVUzMGgveUx1aEhFMEVkMTg1?=
 =?utf-8?B?MzJPcWJadEdWend0VFlWZkVJdXZKR0h3RnZoUXNOM2pNOUJkMmZEK2FuUWZM?=
 =?utf-8?B?ME5OWTdXLzRxMWRLcUZGNmRlSDhXMy9nUlRKNDRxWVNRZUhtWlF5eXdnVm0v?=
 =?utf-8?B?WG84NEVWNWFSVWgxV1RudU1Lc1NOb1VCNWRvRDUzVHpkS012OVNUZXAvVnB2?=
 =?utf-8?B?bmJLTFpHaW5md2dwaE5xQW9MNWZQSmtKakN6QnR0NC9mRUNhZFdOSnVNWUo2?=
 =?utf-8?B?b0FiY0xTQWtHOTRiMmphaysySFZxSVdzUU1uWTNJWUJKSHRiQnFnY2szalhQ?=
 =?utf-8?B?RThUSUs0dEFnMXl3ajVCdjkrcXd6dlMycUpsV2UxeVczUytXanpadldkV2V0?=
 =?utf-8?B?UHU5dUwvaTVMdStSazgxY1Y4bFRhdGtsZjg3Ymdnc21qTTNaM093N2ExSkU3?=
 =?utf-8?B?azJpYWMxUWFlMHphNXM1TDFtUzBDNXZBeTY1QTliK3ozUE5mZWlkMHdpZk5H?=
 =?utf-8?B?bStvekNnaUd4TklPMGJrTmpUc1dCNUM4YW5iaENyUjVNc0RFRmlNOHhMY0lj?=
 =?utf-8?B?U2kvREdjNTFzcE9nanRONU43V0xQOHg5Z28vcDl0eDJhRlF4dzk4OTNSVTBI?=
 =?utf-8?B?Rk1FNUhSQWd2NEtDMG11SmtPL0V5d2ZGWHBpSFJMWTRpR3p4M2JCcTNOTlFy?=
 =?utf-8?B?UFkzZnJ4Wnp0MndpbXM3UlRoS1UvanlCK0VPN0s0Zjlna2FzNVlaWWNDTWIy?=
 =?utf-8?B?TWtBeEV6ZWxNVnN3djN4bnFGUE1rRjd3VWhDZFBIR0ZSOVA2d2NDQTluTFdD?=
 =?utf-8?B?bVAycDRabkoyazFIdzExNjhDRnZPbzY4Y24rZnhqUE0ybHZ3d1h1SUV1MTdp?=
 =?utf-8?B?ZUNNYTRoYWZqTkxwTGtOSit5SUFEb3hKRFNHOEtzVHpHb3UrRHJHd3RqeTBP?=
 =?utf-8?B?SWI1VEFWREpnb3FSa1A0UnhHNmJXZ2FScFRQYXhkV1VWUU5adnFxYkM1b0tz?=
 =?utf-8?B?cEdrSWM4QWZoWWJIdU5EMlZyMG56MkNLM09EUzBEeTRFNFNFRGw5MXp2YzBD?=
 =?utf-8?B?MTAxTHllM3ZWODFCOS9QZEhaa1hHY2FESkN3aU9QcHBWWnZtMUU0UkcyUElP?=
 =?utf-8?B?WDdJYXgyTUoxRnJBSFRtZndDZEJUT3JJdWpPZzBWT0JyQ2lJOXRySFZHd1ND?=
 =?utf-8?B?SUxjenV0c0tqUVVyeDVBMTFjY3FxY1BMeFNlWndiNVpqYUJ0ZkJiVWQ3MklT?=
 =?utf-8?B?L0JpdXdvTENHaGRGN3E2bDA2UGVpcVZjVFF5bVl1K3gxdm9lYS9mSnVRRmRm?=
 =?utf-8?B?NmdzTTIvYm13V3huZVlUUWZ1NHVPUkkwVDg3UndxYVlJaGwycDRhQVBiazNF?=
 =?utf-8?B?UUZQMXYwdHA2R29zYkxxQ1N6YzNSL2NRdTJ2UE9YeVcwUjR4dmFJWTRHdmsw?=
 =?utf-8?B?ZnF1WVo4SVk4NUFZL2dsZnNGUkxTSllKQTl4Z2drT1RKYWVDY3g0cjZuWkNW?=
 =?utf-8?B?WmdwSDB0QkNRc1B4cU5uOHNQdEdaUWx5eVo1SGhsR2FKbmRrTXZEdGpjeUFw?=
 =?utf-8?Q?NtYw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7142099003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0ZxRUZ1aHFhNEdxRzhmWnBZNk9LRzgvbGl4UW16aGNpTGkvbjRrOFJ1Z2lJ?=
 =?utf-8?B?czVHUURtSFIzSjhXenNnKzJUWVVCN1dmbWI0eEpPT1YyR2o3SmRIdHFsNFpu?=
 =?utf-8?B?Q0tyWUs4WUdodkZBZ2lVMW5DNFl0QkU3ZDdRVUZQaDZOK1REMHBQN0F1VjRm?=
 =?utf-8?B?VnFSRlpmYWg4Z0lOWEZxZHAza3RFcjFKSTN5TmhuR3gyenZIbjEvRE96YXRw?=
 =?utf-8?B?cGVuL0F3UnFoNW5ZaEY4ZG1ySldCNitOOStXVTVCelcvaWhuanA1WEx2aFVJ?=
 =?utf-8?B?WElFWXVRZlJZTGJicnVjZGtIeTdlcm9jQnpDQXd4WmpqRjBlUjBxa2JaWjhH?=
 =?utf-8?B?U05EY0lORUZsUXZIVk1qZlFKanZiUEp5RCtJdVY0b0pTeXF0ekN1RDNUeHVm?=
 =?utf-8?B?bTRYbWw0MW5wbjluaWNLcDhFSHJGOUthUVo5YzNoTXkvWUpCNURNOHg3RTB2?=
 =?utf-8?B?VHJpTFhkRWdwRDNnUXJ6WkxCYzNid1ZXdlJPOTgwMlk5d0NDTGVXUWZ4cmMr?=
 =?utf-8?B?WnVLQXM0dmx4Mi9rVGZDNlR4aWpaQnpTRER2Wm5rSnVaWHlwc1FBeVR3dzdP?=
 =?utf-8?B?ZEU4dEJiakJLQmRxU3hxZXNoaFFSNTJuaTU2clV1WUd2TmpoQ0gybGhNQU5O?=
 =?utf-8?B?YzI5Nml6cWhuaGJ1Q0dlc0tFRmJuUFFkeXZUVlNZbjh6dUdxWWtJbjQyaTZ3?=
 =?utf-8?B?RjNWYnNCWW05dEJkcG1KUU5GVWRndDJwR0tETlh4STRVT1VWMXZsQnN5QVJj?=
 =?utf-8?B?Y2Uvb1RYL0d2Y0dDa1UxMHZ4MWhvZkJucmNzOHZkZXdGSUQ3R05lZVZzR1Zt?=
 =?utf-8?B?TDZxdS9TOXl3b1BnQXlTaWRENWxHczVrWXhkbGs5clJXdFRMWi9VdHBKZUxj?=
 =?utf-8?B?Nmh0TllZeHg1RU9xcjFlNVlFdzg4VW55VXY0SjhwZUh3Uktyb0RCSkdzelFY?=
 =?utf-8?B?OGh4REIrdXRNL3F2MVNQWnU0cEFsK3h1RG5EMlFDYXN6L2JidTBvdmtHcTJj?=
 =?utf-8?B?VUxaMFFwOU9oVFhqVmhYTnBhQ1FtUFVLU0VRd0J4UTVWZkZka2xuRVc5d014?=
 =?utf-8?B?RHR4WlhuaFVOOUNqeTNGdGJRNnFUbW9KTG41b3dSMmtSaTFmMEhTaXllOTBo?=
 =?utf-8?B?V0g2QlBrdlR0UGdOUkR3MWlubmdGSGZYTnZLYThNa3VJR1ZqOVR3SWU5a0E3?=
 =?utf-8?B?NzVtelhFSHFDZ2lxV3RZWm84NnRDdE5KTlhldDNrTU55NlQ2cGNUbnM1L1VR?=
 =?utf-8?B?Mm1pMUxJR3hpYzg3NnFlczhBaThVUU1TZzRJOGNmTlRaMVpKaGZmOWVla08z?=
 =?utf-8?B?elhoWjh5RThhNms0Tk1Uai9CcnovU21aKzlBbklOV0NZR1NSR3I4aGpYaVRw?=
 =?utf-8?B?OEYwL3ZRZlRLMEtEcnJVZmIwS01sa3NGQnFsdUZPaW1HWFY3K3NONFJyNURu?=
 =?utf-8?B?VkduaXlWd1BEMDJLSkFsQStnYzVSblh3aGg1OFNGbWJ6RnVjNW1sSDd6Z0lR?=
 =?utf-8?B?YWR0ZXdFTEkwblY5U3J3amRWc05FYXdLRG1SbW0zQjRQeStlUWRkNnl1b1Nq?=
 =?utf-8?B?UG5aVThyVm1ZZHgvd1hOUlhHZU9QSWpZS2FzWXdOVDYyUnMrcXNzOGxocEN4?=
 =?utf-8?B?WWg4R3JLaHljWFg3YzJqampBcUhNRkhDWDR5QzVYSWN2TVlXb3E5NkNCSFJM?=
 =?utf-8?B?ZldjUFRWRXBnUDIrOGFXb2FHVUd1M1ZYc1hoUytXaXpPRjhLS1VvWWRQY0to?=
 =?utf-8?B?d015REk1V1E4bG0wd09ENDZmTDBZbzZXZzZSSGVMQkxuTTF4NWNZMHJBVFd6?=
 =?utf-8?B?d1JkY1JEM0toelFMK1hDdkR6OUs1TW9CbnJhV0pERWpCMmhRdk80YVpUT3JY?=
 =?utf-8?B?ci9JbmN6blNBdHlmd2R3bWdBR1l5dW52elg4V1pjUytNOGwraUZTeVpVNkQy?=
 =?utf-8?B?NDBWVXNDZUxEZVo5UVVCd3VJeDJhVEZCNGFlOTBDcGtxWnpNYytCdzdvUWxJ?=
 =?utf-8?B?WkZ6aFowYjlHUGd4Q1BXdXBTWHVYN2lTK2cxbGhHbHRqVWJCbXlEQVJ5ODdV?=
 =?utf-8?B?bWkxYlV2SHhRdEI3M211OHZUZDdBdWJwU2ZqcFlGd2ZzWk9mMDY2QkxDTDBU?=
 =?utf-8?B?eHZvUVlINFpuamhSc2xtSkZ4dUFkL2drT2ZpY0plRjlldW5mMUp3SURRSmZP?=
 =?utf-8?B?aytPZXBUSHYwZlZvdGcrOENWRmFXZVB5Q2d4NzhMcG5zb2FBa2cydWUxRkFY?=
 =?utf-8?B?aXRkNzNDOWhxSEdxYTBRYkhFZEdoWEdZMjVDL0ttNDVubGFmamFHOXQ1VkVQ?=
 =?utf-8?B?ZEduR2pkWTV2TWs1SlYrNFZpaUFZdkFtYzZOUHF6RHZyQmJFYWRjZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4e1dc5-f515-47ee-2711-08de5f0f1610
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:19:13.5071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3hlKEMjvrUN51C9G9PYzIZ2Zl+kRupt0HZFWUkKZAmFCzj2sbXjs+btLSRHZHAH5MzJ1CWw1HUyQ/0b4ERhnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9087
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


On 1/28/2026 19:08, Marcin Bernatowicz wrote:
> Introduce igt_sysfs_choice, a lightweight, fixed-size, no-malloc helper
> for parsing and formatting sysfs "choice" attributes of the form:
>
>      "low [normal] high\n"
>
> The helper provides parsing, lookup, formatting, mask conversion, and
> intersection utilities for consistent handling of enumerated sysfs values.
>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> ---
> v2:
> - Corrected date
> - Fix documentation formatting/description.
> - Make igt_sysfs_choice_to_string() return error code instead of NULL.
> - Use names_sz consistently.
> - Make igt_sysfs_choice_format_mask() return error code instead of NULL.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   lib/igt_sysfs_choice.c | 439 +++++++++++++++++++++++++++++++++++++++++
>   lib/igt_sysfs_choice.h |  52 +++++
>   lib/meson.build        |   1 +
>   3 files changed, 492 insertions(+)
>   create mode 100644 lib/igt_sysfs_choice.c
>   create mode 100644 lib/igt_sysfs_choice.h
>
> diff --git a/lib/igt_sysfs_choice.c b/lib/igt_sysfs_choice.c
> new file mode 100644
> index 000000000..5ce2a2b70
> --- /dev/null
> +++ b/lib/igt_sysfs_choice.c
> @@ -0,0 +1,439 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#include "igt_sysfs_choice.h"
> +#include <ctype.h>
> +#include <errno.h>
> +#include "igt_core.h"
> +#include "igt_sysfs.h"
> +
> +#define IGT_SYSFS_CHOICE_MAX_LEN 256
> +#define IGT_SYSFS_CHOICE_MAX_TOKENS 16
> +
> +/**
> + * igt_sysfs_choice_parse() - parse sysfs enumerated choice buffer
> + * @buf: NUL-terminated buffer with sysfs contents
> + * @choice: output descriptor, must be non-NULL (can be zeroed)
> + *
> + * Parses a sysfs enumerated choice buffer, e.g.:
> + *
> + *	"low [normal] high\n"
> + *
> + * into a token list and the index of the selected token.
> + *
> + * Parsing rules:
> + *  - tokens are separated by ASCII whitespace
> + *  - exactly one token must be wrapped in '[' and ']'
> + *  - surrounding '[' and ']' are stripped from the selected token
> + *  - empty tokens are treated as malformed input
> + *
> + * On entry, any previous contents of @choice are freed.
> + *
> + * Returns:
> + *  0        on success,
> + *  -EINVAL  malformed format (no tokens, no selected token, multiple
> + *           selected tokens, unterminated '[' or ']'),
> + *  -E2BIG   on too many tokens or too small choice buffer size.
> + */
> +int igt_sysfs_choice_parse(const char *buf, struct igt_sysfs_choice *choice)
> +{
> +	char *p, *tok_start;
> +	bool selected_seen = false;
> +	size_t num_tokens = 0;
> +	int n, selected = -1;
> +	bool is_selected;
> +
> +	igt_assert(buf && choice);
> +
> +	memset(choice, 0, sizeof(*choice));
> +	n = snprintf(choice->buf, sizeof(choice->buf), "%s", buf);
> +	if (igt_debug_on(n < 0))
> +		return -EINVAL;
> +	if (igt_debug_on((size_t)n >= sizeof(choice->buf)))
> +		return -E2BIG;
> +
> +	choice->num_tokens = 0;
> +	choice->selected = -1;
> +	p = choice->buf;
> +
> +	while (*p) {
> +		/* skip leading whitespace */
> +		while (*p && isspace((unsigned char)*p))
> +			p++;
> +		if (!*p)
> +			break;
> +
> +		is_selected = false;
> +		tok_start = p;
> +
> +		if (*p == '[') {
> +			is_selected = true;
> +			p++;
> +			tok_start = p;
> +
> +			if (selected_seen) {
> +				igt_debug("choice-parse: multiple [selected] tokens: \"%s\"\n",
> +					  choice->buf);
> +				return -EINVAL;
> +			}
> +			selected_seen = true;
> +		}
> +
> +		/* walk until ']' or whitespace */
> +		while (*p && !isspace((unsigned char)*p) && *p != ']')
> +			p++;
> +
> +		if (is_selected) {
> +			if (*p != ']') {
> +				igt_debug("choice-parse: unterminated '[' in: \"%s\"\n",
> +					  choice->buf);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		/* terminate token */
> +		if (*p) {
> +			*p = '\0';
> +			p++;
> +		}
> +
> +		if (!*tok_start) {
> +			igt_debug("choice-parse: empty token in: \"%s\"\n",
> +				  choice->buf);
> +			return -EINVAL;
> +		}
> +
> +		if (num_tokens >= IGT_SYSFS_CHOICE_MAX_TOKENS) {
> +			igt_debug("choice-parse: too many tokens (>%d) in: \"%s\"\n",
> +				  IGT_SYSFS_CHOICE_MAX_TOKENS, choice->buf);
> +			return -E2BIG;
> +		}
> +
> +		choice->tokens[num_tokens] = tok_start;
> +		if (is_selected)
> +			selected = (int)num_tokens;
> +
> +		num_tokens++;
> +	}
> +
> +	if (!num_tokens) {
> +		igt_debug("choice-parse: no tokens in string: \"%s\"\n",
> +			  choice->buf);
> +		return -EINVAL;
> +	}
> +
> +	if (selected < 0) {
> +		igt_debug("choice-parse: missing selected token ([...]) in: \"%s\"\n",
> +			  choice->buf);
> +		return -EINVAL;
> +	}
> +
> +	choice->num_tokens = num_tokens;
> +	choice->selected = selected;
> +
> +	return 0;
> +}
> +
> +/**
> + * igt_sysfs_choice_read() - read and parse a sysfs enumerated choice attribute
> + * @dirfd: directory file descriptor of the sysfs node
> + * @attr: attribute name relative to @dirfd
> + * @choice: output descriptor, must be non-NULL
> + *
> + * Reads the given sysfs attribute into a temporary buffer and parses it.
> + *
> + * Returns:
> + *  0 on success,
> + *  negative errno-style value on read or parse error.
> + */
> +int igt_sysfs_choice_read(int dirfd, const char *attr,
> +			  struct igt_sysfs_choice *choice)
> +{
> +	char buf[IGT_SYSFS_CHOICE_MAX_LEN];
> +	int len;
> +
> +	len = igt_sysfs_read(dirfd, attr, buf, sizeof(buf) - 1);
> +	if (len < 0)
> +		return len;
> +
> +	buf[len] = '\0';
> +
> +	return igt_sysfs_choice_parse(buf, choice);
> +}
> +
> +/**
> + * igt_sysfs_choice_selected() - Return selected token string
> + * @choice: Parsed choice
> + *
> + * Returns:
> + *   Pointer to the selected token string, or NULL if no valid selection.
> + */
> +const char *igt_sysfs_choice_selected(const struct igt_sysfs_choice *choice)
> +{
> +	if (!choice || choice->selected < 0 ||
> +	    (size_t)choice->selected >= choice->num_tokens)
> +		return NULL;
> +
> +	return choice->tokens[choice->selected];
> +}
> +
> +/**
> + * igt_sysfs_choice_to_string() - Render a parsed choice into string
> + * @choice:   Parsed choice (tokens[] + selected index)
> + * @buf:      Output buffer for formatted string
> + * @buf_sz:   Size of @buf in bytes
> + *
> + * Formats the given @choice into the string:
> + *
> + *	"low [normal] high"
> + *
> + * Tokens are emitted in the order stored in @choice->tokens.  The
> + * selected token (choice->selected) is wrapped in '[' and ']'.
> + *
> + * Returns:
> + *   0        on success,
> + *   -EINVAL  if arguments are invalid,
> + *   -E2BIG   if @buf_sz is too small.
> + */
> +int igt_sysfs_choice_to_string(const struct igt_sysfs_choice *choice,
> +			       char *buf, size_t buf_sz)
> +{
> +	bool first = true;
> +	size_t pos = 0;
> +	int n;
> +
> +	if (!choice || !buf || !buf_sz)
> +		return -EINVAL;
> +
> +	buf[0] = '\0';
> +
> +	for (size_t i = 0; i < choice->num_tokens; i++) {
> +		const char *name = choice->tokens[i];
> +		bool is_selected = (choice->selected == (int)i);
> +
> +		if (!name)
> +			continue;
> +
> +		n = snprintf(buf + pos, buf_sz - pos,
> +			     "%s%s%s%s",
> +			     first ? "" : " ",
> +			     is_selected ? "[" : "",
> +			     name,
> +			     is_selected ? "]" : "");
> +
> +		if (n < 0)
> +			return -EINVAL;
> +		if ((size_t)n >= buf_sz - pos)
> +			return -E2BIG;
> +
> +		pos += (size_t)n;
> +		first = false;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * igt_sysfs_choice_find() - find token index by name
> + * @choice: parsed choice struct
> + * @token: token to look for (plain name, without '[' / ']')
> + *
> + * Performs a case-sensitive comparison of @token against entries in
> + * @choice->tokens.
> + *
> + * Returns:
> + *  index in [0..choice->num_tokens-1] on match,
> + *  -1 if @token is not present or @choice/@token is NULL.
> + */
> +int igt_sysfs_choice_find(const struct igt_sysfs_choice *choice,
> +			  const char *token)
> +{
> +	if (!choice || !token)
> +		return -1;
> +
> +	for (size_t i = 0; i < choice->num_tokens; i++)
> +		if (!strcmp(choice->tokens[i], token))
> +			return (int)i;
> +
> +	return -1;
> +}
> +
> +/**
> + * igt_sysfs_choice_to_mask() - map parsed tokens to bitmask + selection
> + * @choice: parsed choice struct
> + * @names: array of known token names
> + * @names_sz: number of elements in @names
> + * @mask: output bitmask of supported names
> + * @selected_idx: output index of selected token in @names, or -1 if selected
> + *                token is not among @names
> + *
> + * Builds a bitmask of known tokens present in @choice and identifies the
> + * selected token, if it matches one of @names.
> + *
> + * Unknown tokens do not cause an error; they are ignored and not
> + * reflected in @mask. This keeps the API "loose": tests can still
> + * validate required choices while tolerating additional values.
> + *
> + * Returns:
> + *  0        on success,
> + *  -EINVAL  on bad input parameters.
> + */
> +int igt_sysfs_choice_to_mask(const struct igt_sysfs_choice *choice,
> +			     const char * const *names, size_t names_sz,
> +			     unsigned int *mask, int *selected_idx)
> +{
> +	unsigned int m = 0;
> +	int sel = -1, idx;
> +
> +	if (!choice || !names || !mask)
> +		return -EINVAL;
> +
> +	for (size_t i = 0; i < names_sz; i++) {
> +		const char *name = names[i];
> +
> +		if (!name)
> +			continue;
> +
> +		idx = igt_sysfs_choice_find(choice, name);
> +		if (idx >= 0) {
> +			m |= 1u << i;
> +			if (idx == choice->selected)
> +				sel = (int)i;
> +		}
> +	}
> +
> +	*mask = m;
> +	if (selected_idx)
> +		*selected_idx = sel;
> +
> +	return 0;
> +}
> +
> +/**
> + * igt_sysfs_choice_format_mask() - Format a bitmask as a space-separated list of names
> + * @buf: Output buffer
> + * @buf_sz: Size of @buf in bytes
> + * @names: Array of token names indexed by bit position
> + * @names_sz: Number of elements in @names
> + * @mask: Bitmask of available tokens
> + * @selected_idx: Index to highlight with brackets, or <0 for none
> + *
> + * Builds a space-separated list of all bits set in @mask, mapping bit positions
> + * to names in @names. If @selected_idx >= 0 and that bit is set, the token is
> + * wrapped in brackets, e.g. "low [normal] high".
> + *
> + * This function is best-effort by design:
> + *  - If names[i] is NULL, it is formatted as "?".
> + *  - Bits beyond @names_sz are ignored.
> + * Empty @mask results in an empty string.
> + *
> + * Returns:
> + *  0        on success,
> + *  -EINVAL  on invalid arguments,
> + *  -E2BIG   if @buf_sz is too small.
> + */
> +int igt_sysfs_choice_format_mask(char *buf, size_t buf_sz,
> +				 const char *const *names,
> +				 size_t names_sz,
> +				 unsigned int mask,
> +				 int selected_idx)
> +{
> +	bool first = true;
> +	size_t pos = 0;
> +
> +	if (!buf || !buf_sz || !names || !names_sz)
> +		return -EINVAL;
> +
> +	buf[0] = '\0';
> +
> +	for (size_t idx = 0; idx < names_sz && mask; idx++) {
> +		int n;
> +		const char *name;
> +		bool highlight;
> +
> +		if (!(mask & 1u)) {
> +			mask >>= 1;
> +			continue;
> +		}
> +
> +		name = names[idx] ?: "?";
> +		highlight = ((int)idx == selected_idx);
> +		n = snprintf(buf + pos, buf_sz - pos, "%s%s%s%s",
> +			     first ? "" : " ",
> +			     highlight ? "[" : "",
> +			     name,
> +			     highlight ? "]" : "");
> +		if (n < 0)
> +			return -EINVAL;
> +		if ((size_t)n >= buf_sz - pos)
> +			return -E2BIG;
> +
> +		pos += (size_t)n;
> +		first = false;
> +		mask >>= 1;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * igt_sysfs_choice_intersect() - Restrict a choice set to tokens common with another
> + * @dst:   Choice to be updated in place
> + * @other: Choice providing the allowed tokens
> + *
> + * Computes the intersection of the token sets in @dst and @other.
> + * The resulting @dst contains only tokens that appear in both choices,
> + * preserving their original order from @dst.
> + *
> + * If the previously selected token in @dst is still present after
> + * intersection, its index is updated accordingly.  If it is not present,
> + * @dst->selected is set to -1.
> + *
> + * Returns:
> + * * 0        - success
> + * * -EINVAL  - invalid arguments
> + * * -ENOENT  - no common tokens
> + */
> +int igt_sysfs_choice_intersect(struct igt_sysfs_choice *dst,
> +			       const struct igt_sysfs_choice *other)
> +{
> +	char *new_tokens[IGT_SYSFS_CHOICE_MAX_TOKENS];
> +	const char *selected_name;
> +	int new_selected = -1;
> +	size_t new_n = 0;
> +
> +	if (!dst || !other)
> +		return -EINVAL;
> +
> +	selected_name = (dst->selected >= 0 && dst->selected < dst->num_tokens) ?
> +			 dst->tokens[dst->selected] : NULL;
> +
> +	for (size_t i = 0; i < dst->num_tokens; i++) {
> +		char *tok = dst->tokens[i];
> +
> +		if (igt_sysfs_choice_find(other, tok) < 0)
> +			continue;
> +
> +		new_tokens[new_n] = tok;
> +
> +		if (selected_name && !strcmp(tok, selected_name))
> +			new_selected = (int)new_n;
> +
> +		new_n++;
> +	}
> +
> +	if (!new_n) {
> +		dst->num_tokens = 0;
> +		dst->selected = -1;
> +		return -ENOENT;
> +	}
> +
> +	for (size_t i = 0; i < new_n; i++)
> +		dst->tokens[i] = new_tokens[i];
> +
> +	dst->num_tokens = new_n;
> +	dst->selected = new_selected;
> +
> +	return 0;
> +}
> diff --git a/lib/igt_sysfs_choice.h b/lib/igt_sysfs_choice.h
> new file mode 100644
> index 000000000..b354c774a
> --- /dev/null
> +++ b/lib/igt_sysfs_choice.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#ifndef __IGT_SYSFS_CHOICE_H__
> +#define __IGT_SYSFS_CHOICE_H__
> +
> +#include <stddef.h>
> +#include <stdbool.h>
> +
> +#define IGT_SYSFS_CHOICE_MAX_LEN    256
> +#define IGT_SYSFS_CHOICE_MAX_TOKENS 16
> +
> +/**
> + * struct igt_sysfs_choice - parsed sysfs enumerated choice attribute
> + * @tokens:      array of token strings
> + * @num_tokens:  number of entries in @tokens
> + * @selected:    index of the active token in @tokens, or -1 if invalid
> + *
> + * This struct represents a sysfs enumerated choice attribute, for example:
> + *
> + *	"low [normal] high\n"
> + *
> + * After parsing, @tokens point to "low", "normal", "high" and
> + * @selected will be 1 (the index of "normal").
> + */
> +struct igt_sysfs_choice {
> +	char    buf[IGT_SYSFS_CHOICE_MAX_LEN];
> +	char   *tokens[IGT_SYSFS_CHOICE_MAX_TOKENS];
> +	size_t  num_tokens;
> +	int     selected; /* index into tokens[], or -1 */
> +};
> +
> +int igt_sysfs_choice_parse(const char *buf, struct igt_sysfs_choice *choice);
> +int igt_sysfs_choice_read(int dirfd, const char *attr,
> +			  struct igt_sysfs_choice *choice);
> +const char *igt_sysfs_choice_selected(const struct igt_sysfs_choice *choice);
> +int igt_sysfs_choice_to_string(const struct igt_sysfs_choice *choice,
> +			       char *buf, size_t buf_sz);
> +int igt_sysfs_choice_find(const struct igt_sysfs_choice *choice,
> +			  const char *token);
> +int igt_sysfs_choice_to_mask(const struct igt_sysfs_choice *choice,
> +			     const char *const *names, size_t names_sz,
> +			     unsigned int *mask, int *selected_idx);
> +int igt_sysfs_choice_format_mask(char *buf, size_t buf_sz,
> +				 const char *const *names,
> +				 size_t names_sz, unsigned int mask,
> +				 int selected_idx);
> +int igt_sysfs_choice_intersect(struct igt_sysfs_choice *dst,
> +			       const struct igt_sysfs_choice *other);
> +
> +#endif /* __IGT_SYSFS_CHOICE_H__ */
> diff --git a/lib/meson.build b/lib/meson.build
> index 1a569ba52..83569e8d2 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -44,6 +44,7 @@ lib_sources = [
>   	'igt_stats.c',
>   	'igt_syncobj.c',
>   	'igt_sysfs.c',
> +	'igt_sysfs_choice.c',
>   	'igt_sysrq.c',
>   	'igt_taints.c',
>   	'igt_thread.c',
