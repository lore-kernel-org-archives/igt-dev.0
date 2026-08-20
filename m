Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B766C5DF88
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 11:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8001A10EFF3;
	Thu, 20 Aug 2026 11:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQJRao69";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD6E10E1B1
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 11:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787224269; x=1818760269;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ivUyWu2me22SeETJ5EZsaFkmw3LnTN8krzfI57xxoqI=;
 b=lQJRao69PxHhGaJQtujnb1+SJYsxxh64d2Q02IlNBXBqTOkwH3e0N9/S
 XibgpbOZjB1jZ2VovlMY1+XC1PBMFTDTO/AnOGdZ6hZxNVYVde0GgpKye
 CrZMYRYmBwXUhwguOPzDm0UuJSTpqfCZm8z/AFHz3SPFNHcQ5Ayv5CetO
 yrQg8cwcsYJLwRpK33K4lUpyqH7XJu2ZW7ekskCCZbzMI2uyIRH0bfKIv
 iRvbsrzKKa5aKE8odABnvGX8bif/4KrOmLm1jo3rg2ZEq1QIzPAtfejUD
 3KZaHo6aiL8Dl0a45h5IP5/A2Bu8+IvkacCz8HWglu8MPiYQ3SSQYTb8B g==;
X-CSE-ConnectionGUID: Z1Cy35MUR9OF6Q4YBbPv2w==
X-CSE-MsgGUID: kzjWEtltTTyqgFFJYFF8Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="99278358"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="99278358"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 04:11:09 -0700
X-CSE-ConnectionGUID: X6WBLIyCTbKpJA02oDu8Ug==
X-CSE-MsgGUID: o69Y2vcLS5Ow06N8QtoM5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="270223992"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 04:11:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 04:11:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 04:11:07 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 04:11:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r75hZ79gPWSRti/iYRVcAXQC3/t8Nlw/SGntzoESm6JMJFf1pHt4GdwHMB5b4OSbWrdEWf2+QmIQRo5ySGIC7P0lcc+90gXjytPQaBB+XsrvWxdFoqafkJ1QMy2vBVjHoqmb0j3LzLsA7N4daENAwr4yadhu8mAcry9IBEAZY2VzjA+F+BOJ6Mc7zujdEfzV321YadwFlq9jG9veh75MTxXi+99Wq9ClbcBrj/NdJkgwFAYQnPHeAtnUYsC5+apsJ0/j8dA4sBa6dX7+3ksHLNusNKjCmrw97hMYq7lu+8OsIWcXGvPo7NvxnHjYDaROIJC1ieVwolycgGtL5eyppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRn/M8jjTSW4hF4nUQRpeDQqAWMuAnRqanzdYEKzb68=;
 b=q9uoA8dYB9/a77NW2lalI89XgIu+TWA64yghpZoiSoTwdP7sNHttVarN6GGiZFNimFsr75pNgsGbU3HoeYbdx0z2sJtJ1Ed43Szv7PjpmwtBj1Nb5yP4dxKfDFHepMMJlAWxnvX7zK9BY9dPDE15WAebcghEmkCybnLVeN4ncMrPX4pqaL9+YPWlffF4OD5N0FoJ37wteQWiQ8e5yhGfEUUlfP2+V3RsaYsVwMKRDhOJXX/QxnMqOMX+dDYEEA3nWOpIwJT73ExriqiE9rWPOiJCsrWY3zPEs4m9kO4oXyCmvcy8mREE+eUTc8YiSApLRYeDyht5KUI8o8hgFJW7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 11:11:05 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 11:11:05 +0000
Message-ID: <59150a2c-3219-45bd-861e-c7a01802bc94@intel.com>
Date: Thu, 20 Aug 2026 16:40:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] tests/kms_vrr: add CMRR fixed and video mode
 subtests
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260812130738.1242659-1-ramanaidu.naladala@intel.com>
 <20260812130738.1242659-3-ramanaidu.naladala@intel.com>
 <IA1PR11MB63486F731CF5A3EF585F3170B2A52@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <IA1PR11MB63486F731CF5A3EF585F3170B2A52@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|IA1PR11MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c2c2f38-c4b4-4abe-aaa8-08defeabba3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|18092099006|11063799006|4143699003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: ZjFL1zfWEddI8HUfhEYFTD8UFM8QKOmuSOcKrcVJcb0/LCwkz/I2XKutRK8LSVpU1fXQMea7Z5Kq7POszrd7N+T5DIXovlU/QsmMucU7N9t6SDlomHDT/tTYrtMDED5kiLbg/3JpX0WUEEr9vUg4MrqQvanpp2m67/NHM/Wy1zMr4GO87Vaqvt7ST7MCt4sSoJJPDC3MZtdN3Ot7HGz6mwbWQurklfl6IpZKpTU9jRDFSodU58M6owRFoi3ntjJs3o7iz3eboLT5m1sOe8M2g2n4lz0JIiz6jlN1B6KT1XAAnp9JvXvjUI2IGhBy7f88xuEY4opsdCu0QFPjogzws1SwPdYpyU7jOvIgAN3DU7zW2BO/iumKkxgBhC6x27MY3MFJcDmaGR5CMbv0oMrkgrZBVDhibhdXpQD78lw6o2IOHE9BnrpPe8ObPWA5iQoDh1b4L+GpQuDh2SXM+lo32nPVVaFZavAVFVgTB9KYxtR1cf0VF1t2bVkODQfVzOYsjQHyunTDfmP0zyNc+x1PFYsCb6YREQcEW93c2RNFteh8nZAbJEquuwc/G4RXmv2JTOO7dzAcjJAeWmtYnlLJl2Qu7n4BnDb9CTyFqDk7/Q6LhRhCA91YE7MDdNfFl3EbAdiDM/O6ucCuwj3TcvgN+qHl4oH4SlJCC9g+AHxWyDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(18092099006)(11063799006)(4143699003)(56012099006)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVlzUW9nd3B4aytTQ09Cc1JobjE1RElFaDQ2SmI4cVhxeVNGS2trTFduai9M?=
 =?utf-8?B?b0xqL3hVekFXL2NJTEc5Nm0wT0RvbkM4UXJpTnloWGgwT2JSNlphUC8xMC9E?=
 =?utf-8?B?S3dyUTE3MVZlcE1rTDBjRjhHN0JNdGxGcncrYUMwdmxtUmxCbitDY1p1a0Ry?=
 =?utf-8?B?SGU4SkhiR2JMdVVjbmNiWHpMZjNBTTlhdXNnbzhxMEdscUZMbGtJczVuNEl4?=
 =?utf-8?B?S29TeFlZeWYwMjVDNEtMUDJuSit3N015d0Nxa1M5VWt3U25uOEYzdUU4Y2R1?=
 =?utf-8?B?eTNJTFczanJWNHhCYi84Q2wyWHFSenNWQjFScGk3eGhFajJhTmovSnB5cTF3?=
 =?utf-8?B?ZTA2OWV3b2RTci9nS1RMVjdBeStWbU94MmJMSWpSMWY1L0p0QUV0REdEM1JY?=
 =?utf-8?B?ZDEzanVNMXRTblZXb3c5NjJqU2g0S1hZaFN5c0tlMVlYUysrZkxpOVJDRE1K?=
 =?utf-8?B?NHdSM1ZjbUlCTzhjUnMyNkpsZ29CNnBCZGtpTmFXMjJtR24rMjhITGZxVGtX?=
 =?utf-8?B?ekVMbFl1STRLRG50WkNlVW1ieDRTMkpCYlNlRlhSKzM1OW9ZZHdqUVc0UDB4?=
 =?utf-8?B?RzlaRTFJb3BDSDFOWlVmOUZOdkViUzFhcHZDTENubHhOZWtEQnlMbDhpLzR4?=
 =?utf-8?B?K21mUC8wYTJoUEV4Tnl3a2lNRWFkbjhraEZFUnZ5ZEZ1MHB5c0ZscWRhZG83?=
 =?utf-8?B?Zy9nMHdhU1RYR2duUzBka3VwQWxsdzkxQzZtMUNXN1FaWGFyTThFZ1FLVVl4?=
 =?utf-8?B?V3ZLb3dGaGFkNDkrcmNCVEJXQ3ZadlJCM0lNMGJzYXZLeXRCMWQ1UmhSUUxE?=
 =?utf-8?B?T2hqSkhHMkhpY0VvdXl3Kzk0dWF2QksxRWE4V2NVSjJHYXJ3Uk9RTENHUjBF?=
 =?utf-8?B?UTE4VCttWnJVMHNPZDhNSS8zZUlDSm1ZRC9sdDRNWW4yc1NEaFpMUWtPUVZz?=
 =?utf-8?B?Y0ZvYXIxZTVHRVNnWlorZVFhc2lIRWV6Sjl2V1ZRcmxvazNONEM4T2h0eEdx?=
 =?utf-8?B?bnN5cFM0clI1VEpsQ2d5eld6VU5mcU5sWDdibWwzOEtselVoUTRSMFlpQUxa?=
 =?utf-8?B?bEU1SUM1TXdPdC9qTkMvUWRjZWZuSktidUFOYU53eWozMCtGNTdGMkcyRW1z?=
 =?utf-8?B?V0RFNmd2dzdmcVJrL3ozUW9EbisxQURpZXRHRVNPR1EzYlFBdHBST1Z6WWZ6?=
 =?utf-8?B?ei9lSmEwRWpXRDFWWS9BK1h0c3dBbTAvcXV5V3JsVi9FTWxSc1pWK2taRkx2?=
 =?utf-8?B?SzJWdjkwVENOUk5kc3RSSTluRVVocFZXUXd6emVVOXQvVTVpUkFJNlZwbGo2?=
 =?utf-8?B?Tkcwb0RVY3F1RHNuRFY2WlAzY0tXUHNJWG1VMWEweS83V3VGejB3R3k5TXRR?=
 =?utf-8?B?bUdoTnhZL3BVeFFycmNIRVJwQmpaOFRkcjlwRVBFYkYzVnQ2bHU5RkZUcVBz?=
 =?utf-8?B?NlJmOEdITnVDYWFZdmdZaVpVV25nT3E5bk1IVWYwckltM2dMbU05RitqZzY0?=
 =?utf-8?B?YkYwL1dIeTVKSC9XSWRiYUFmd29BM1h1OVBQRkNBbkJxZHBKVlh1MGVIWndQ?=
 =?utf-8?B?T2Q1K08rcVgvRGFRd1gydCtsU0NrVHcxZVZQcWFBL0IvOXpWV0ZrdWU1bVVL?=
 =?utf-8?B?R0ZoWkNFRnB3Y25hMFFQQWliMlRMZGdqSXNDYUpKU0lxaFpiMmo3YllPeTdS?=
 =?utf-8?B?Z1dNZHBhRUxzWG1hcHptRHVIK2tZbWh6UnE2MGJrVFF5d1Y2b1ZCSlc5ZWJK?=
 =?utf-8?B?aFYxeWQ5OEo2ejNFTWloLzRIQ241VzFYZUZBbCtpSVp1aFJXK3R6VDAwQmV2?=
 =?utf-8?B?bFVJd0N6bTcwSkYvV0JCY0dBd3RkTnhJaFJGdk9TUnhaVkJXWDZ5N2dwOHlp?=
 =?utf-8?B?UTZaZGhYU21DN1dqRFBwQVVCaml0ek83Z2FZVGw4MFdUMWxpQ2htSGJSbTdx?=
 =?utf-8?B?enB5NmF0VnlJTElia1hvdzVyd1Fkblk4aUc1b3RDc0NaWDJZem1rclVWajhv?=
 =?utf-8?B?eVdyNDlIa3NSMU1RNGZhdDN5SEFkY0xyVDdNTUZ5SzBEZVNTSVhoTnFmeW1H?=
 =?utf-8?B?d085YjR2UXZpQnNNUTZqd2p6VGNQRHRZUHdGWTdmUCtjMHdHdzBWR092TDBh?=
 =?utf-8?B?cE91WFdCNlh0RW1rdmV1VEhrZzIrRDd1M3NjRFgvdG0vL21DdG9uOG5VdUVh?=
 =?utf-8?B?M0VqS0g0UXhpVG16c0xZM21GZlFpUkNJa1RVR3M2U2dOTUtiTlBLK1RlN2Zq?=
 =?utf-8?B?VFg5dngrb2IwamNBUlYwS0srUFMwNjJPd0xpQXcxNHRTdTJ4YnRtRXRvME90?=
 =?utf-8?B?Vkt1bGd5a05WbTh6VUo3VW53QU9xdzlmZDRMTFU2Nkd4cUhqd2o3QWdCNmNs?=
 =?utf-8?Q?7VlKG0yAEay5P1Tc=3D?=
X-Exchange-RoutingPolicyChecked: Li/gNm6YZBFEujP73T39t/1rJxMuJe7VruEwdXLODaRoLvzNIzioLhnHvO0oK18fHwTI8LPeSLGFNrFTwOvMwg/SPRA0x0vHg7CbNou3PiWRuE4AbDuS4tmBT9pw4WYBjfFyASUOVGWXJvA2JgUNb71OwCovozKjHbfskpzt2dwK+SrU2NXm9wyJ+5kP7nTck4spff/L7AWbB9quoQIzyBd7K8YJuZJ4vdUiAa/elc0x3Esnc/66GVxwRXN22k1Tq7hOYQCO+TDFjoWpBXaMljU14zinXOiWhtgENFnTf6WzCMYR3e0+AeCuHiYWZWjn0KpWRuhmHcW172gZ5t/jjw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2c2f38-c4b4-4abe-aaa8-08defeabba3d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 11:11:05.3503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukVMfzEY/HVSxubGzCWrlVZSjSIGJ/KvQy86RNyfYVMzd94RDGDNWHfaoYnp/dKYu5nueJLwF+tqPp3GJnJ1/fKSFoEFi6gAmjcgpvHh1go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
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



On 8/19/2026 10:30 PM, Golani, Mitulkumar Ajitkumar wrote:
> 
> 
>> -----Original Message-----
>> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
>> Sent: 12 August 2026 18:38
>> To: igt-dev@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Golani,
>> Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>; Naladala,
>> Ramanaidu <ramanaidu.naladala@intel.com>
>> Subject: [PATCH i-g-t v4 2/2] tests/kms_vrr: add CMRR fixed and video mode
>> subtests
>>
>> Add test coverage to validate Content Match Refresh Rate (CMRR) behavior
>> across both fixed and video timing display modes.
>>
>> This introduces a shared helper library to support refresh-rate mode selection
>> and parsing, along with two new test cases covering fixed-mode and video-
>> mode scenarios.
>>
>> The new tests measure actual display refresh timing during CMRR operation
>> and compare it against the expected target rate to verify correctness. Video
>> mode coverage validates behavior across standard video timing rates, while
>> fixed mode coverage targets display modes that fall outside the standard
>> video timing set.
>>
>> Each test cycles through the relevant refresh configurations, applying and
>> resetting the appropriate settings between measurement passes to ensure
>> consistent and isolated test results.
>>
>> v2: Fix test issue.
>> v3: Address review comments. (Mitul)
>> v4: Fix test issue.
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_vrr.c | 204
>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 204 insertions(+)
>>
>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 27f18e8d0..ab6bc66d9
>> 100644
>> --- a/tests/kms_vrr.c
>> +++ b/tests/kms_vrr.c
>> @@ -32,6 +32,7 @@
>>   #include "igt_pm.h"
>>   #include "igt_psr.h"
>>   #include "i915/intel_drrs.h"
>> +#include "igt_vrr.h"
>>   #include "sw_sync.h"
>>   #include <fcntl.h>
>>   #include <signal.h>
>> @@ -80,6 +81,14 @@
>>    *
>>    * SUBTEST: lobf-dc3co
>>    * Description: Test DC3CO entry during LOBF.
>> + *
>> + * SUBTEST: cmrr-fixed-mode
>> + * Description: Test to set a fixed CMRR target refresh rate and verify it
>> + *              is correctly applied.
>> + *
>> + * SUBTEST: cmrr-video-mode
>> + * Description: Test to set standard video timing refresh rates via CMRR
>> + *              and verify each target rate is correctly applied.
>>    */
>>
>>   #define NSECS_PER_SEC (1000000000ull)
>> @@ -103,6 +112,8 @@ enum {
>>   	TEST_LINK_OFF = 1 << 10,
>>   	TEST_NEGATIVE = 1 << 11,
>>   	TEST_FORCE_RR = 1 << 12,
>> +	TEST_CMRR_FIXED_MODE = 1 << 13,
>> +	TEST_CMRR_VIDEO_MODE = 1 << 14,
>>   };
>>
>>   enum {
>> @@ -580,6 +591,184 @@ flip_and_measure(data_t *data, igt_output_t
>> *output,
>>   	return 0;
>>   }
>>
>> +static
>> +uint64_t wait_next_vblank_ts_ns(data_t *data, igt_crtc_t *crtc) {
>> +	union drm_wait_vblank vbl = {};
>> +
>> +	vbl.request.type = DRM_VBLANK_RELATIVE |
>> igt_crtc_get_vbl_flag(crtc);
>> +	vbl.request.sequence = 1;
>> +	do_or_die(igt_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK,
>> &vbl));
>> +
>> +	return vbl.reply.tval_sec * NSECS_PER_SEC + vbl.reply.tval_usec *
>> +1000ull; }
>> +
>> +static void
>> +flip_and_measure_target_rr(data_t *data, igt_crtc_t *crtc,
>> +			   double vrefresh, uint32_t cmrr_mode) {
>> +	uint32_t i;
>> +	bool front = false;
>> +	uint64_t last_vblank_ns, vblank_ns;
>> +	uint32_t err_frames = 0;
>> +	uint64_t frame_times_ns[TARGET_RR_SAMP_COUNT];
>> +	uint64_t exp_time_ns;
>> +	uint64_t total_frame_time_ns = 0;
>> +	uint64_t avg_frame_time_ns;
>> +	double  avg_refresh_rate;
>> +	double  expected_rr;
>> +	uint32_t valid_frames = 0;
>> +
>> +	exp_time_ns = igt_kms_frame_time_from_vrefresh(vrefresh);
>> +
>> +	do_flip(data, &data->fb[0]);
>> +	(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
>> +	last_vblank_ns = wait_next_vblank_ts_ns(data, crtc);
>> +
>> +	for (i = 0; i < TARGET_RR_SAMP_COUNT; i++) {
>> +		front = !front;
>> +
>> +		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
>> +		vblank_ns = wait_next_vblank_ts_ns(data, crtc);
>> +		(void)get_kernel_event_ns(data,
>> DRM_EVENT_FLIP_COMPLETE);
>> +
>> +		frame_times_ns[i] = vblank_ns - last_vblank_ns;
>> +
>> +		if (frame_times_ns[i] > (exp_time_ns + (exp_time_ns / 2))) {
>> +			err_frames++;
>> +			last_vblank_ns = vblank_ns;
>> +			continue;
>> +		}
>> +
>> +		last_vblank_ns = vblank_ns;
>> +		total_frame_time_ns += frame_times_ns[i];
>> +	}
>> +
>> +	valid_frames = TARGET_RR_SAMP_COUNT - err_frames;
>> +	igt_assert_f(valid_frames > 0,
>> +		     "No valid frame samples collected\n");
>> +
>> +	avg_frame_time_ns = total_frame_time_ns / valid_frames;
>> +	avg_refresh_rate = (double)NSECS_PER_SEC /
>> (double)avg_frame_time_ns;
>> +
>> +	if (cmrr_mode == CMRR_VIDEO_MODE) {
>> +		expected_rr = (double)(vrefresh * CMRR_NUMERATOR) /
>> +			      (double)CMRR_VIDEO_MODE_DENOMINATOR;
>> +		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= 0.02,
> 
> Please confirm this bound holds on real hardware, or justify it.
> 
>> +			     "CMRR refresh rate mismatch: "
>> +			     "measured avg_rr = %.3f Hz, "
>> +			     "expected_rr = %.3f Hz\n",
>> +			     avg_refresh_rate, expected_rr);
>> +	}
>> +
>> +	if (cmrr_mode == CMRR_NON_VIDEO_MODE) {
>> +		expected_rr = (double)(vrefresh * CMRR_NUMERATOR) /
>> +			      (double)CMRR_DENOMINATOR;
>> +		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= 0.02,
>> +			     "CMRR refresh rate mismatch: "
>> +			     "measured avg_rr = %.3f Hz, "
>> +			     "expected_rr = %.3f Hz\n",
>> +			     avg_refresh_rate, expected_rr);
>> +	}
>> +
>> +	if (cmrr_mode == CMRR_DISABLE) {
>> +		expected_rr = vrefresh;
>> +		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= 0.02,
>> +			     "CMRR refresh rate mismatch: "
>> +			     "measured avg_rr = %.3f Hz, "
>> +			     "expected_rr = %.3f Hz\n",
>> +			     avg_refresh_rate, expected_rr);
>> +	}
>> +
>> +	igt_info("Average RR (Hz): %.2f , Expected RR (Hz): %.2f, error frames
>> = %d\n",
>> +		 avg_refresh_rate, expected_rr, err_frames); }
>> +
>> +static
>> +void test_cmrr(data_t *data, igt_crtc_t *crtc,
>> +	       igt_output_t *output, uint32_t flags) {
>> +	uint32_t found;
>> +	double rr_from_mode;
>> +	drmModeModeInfo mode;
>> +	drmModeConnectorPtr connector;
>> +	int j;
>> +
>> +	igt_require_f(cmrr_supported(data->drm_fd, crtc->crtc_index),
>> +		      "CMRR not supported\n");
>> +	prepare_test(data, output, crtc);
>> +	set_vrr_on_crtc(data, crtc, true, false);
>> +
>> +	if (flags & TEST_CMRR_VIDEO_MODE) {
>> +		for (j = 0; j < igt_vrr_standard_video_timing_fps_count; j++) {
> 
> compares int against size_t, Use size_t j (or unsigned).
> 
>> +			found =
>> igt_vrr_get_mode_with_video_timing(output,
>> +
>> 	igt_vrr_standard_video_timing_fps[j],
>> +							&mode);
>> +			if (found) {
>> +				rr_from_mode =
>> igt_vrr_mode_line_refresh_hz(&mode);
>> +				igt_output_override_mode(output, &mode);
>> +				igt_info("Override mode:");
>> +				kmstest_dump_mode(&mode);
>> +				igt_display_commit2(&data->display,
>> COMMIT_ATOMIC);
>> +				igt_target_rr_debugfs_write(data->drm_fd,
>> +							    crtc->crtc_index,
>> +							    mode.vrefresh,
>> +
>> CMRR_NUMERATOR,
>> +
>> CMRR_VIDEO_MODE_DENOMINATOR);
>> +
>> +				flip_and_measure_target_rr(data, crtc,
>> +							   mode.vrefresh,
>> +
>> CMRR_VIDEO_MODE);
>> +
>> +				igt_target_rr_debugfs_write(data->drm_fd,
>> +							    crtc->crtc_index,
>> +							    mode.vrefresh,
>> +							    0, 0);
>> +
>> +				flip_and_measure_target_rr(data, crtc,
>> +							   rr_from_mode,
>> +							   CMRR_DISABLE);
>> +			}
>> +		}
>> +	}
> 
> The TEST_CMRR_VIDEO_MODE loop reassigns found every iteration, so after the loop it only reflects the last fps in the array,
> which typically has no matching mode.
> 
> Two issues:
> 1. there is no post-loop guard, so on a panel with no standard-timing mode the
> subtest passes without testing anything, it should igt_require a skip instead;
> 2. you can't reuse found like below fixed-mode branch does, because here it's overwritten rather than latched,
> requiring on it would falsely skip even when earlier rates were tested.
> 
> Please add a dedicated "bool tested" latch set inside if (found) and igt_require_f(tested, "No standard video-timing mode found.\n") after the loop.
> 
> "bool tested = false;
> ...
>      if (found) {
>          tested = true;
>          ...
>      }
> ...
> igt_require_f(tested, "No standard video-timing mode found.\n");"
> 

Or just.

  if (igt_vrr_get_mode_with_video_timing(output,
                         igt_vrr_standard_video_timing_fps[j], &mode)) {
             found = true;

>> +
>> +	if (flags & TEST_CMRR_FIXED_MODE) {
>> +		found = 0;
>> +		connector = output->config.connector;
>> +		for (j = 0; j < connector->count_modes; j++) {
>> +			mode = connector->modes[j];
>> +			rr_from_mode =
>> igt_vrr_mode_line_refresh_hz(&mode);
>> +
>> +			if (rr_from_mode - mode.vrefresh > 0.04) {
>> +				found = 1;
>> +				igt_output_override_mode(output, &mode);
>> +				igt_info("Override mode:");
>> +				kmstest_dump_mode(&mode);
>> +				igt_display_commit2(&data->display,
>> COMMIT_ATOMIC);
>> +				igt_target_rr_debugfs_write(data->drm_fd,
>> +							    crtc->crtc_index,
>> +							    mode.vrefresh,
>> +
>> CMRR_NUMERATOR,
>> +
>> CMRR_DENOMINATOR);
>> +
>> +				flip_and_measure_target_rr(data, crtc,
>> +							   mode.vrefresh,
>> +
>> CMRR_NON_VIDEO_MODE);
>> +
>> +				igt_target_rr_debugfs_write(data->drm_fd,
>> +							    crtc->crtc_index,
>> +							    mode.vrefresh,
>> +							    0, 0);
>> +
>> +				flip_and_measure_target_rr(data, crtc,
>> +							   rr_from_mode,
>> +							   CMRR_DISABLE);
>> +			}
>> +		}
>> +		igt_require_f(found, "No non-video-timing mode found.\n");
>> +	}
>> +}
>> +
>>   /* Basic VRR flip functionality test - enable, measure, disable, measure */
>> static void  test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output, @@
>> -591,6 +780,7 @@ test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t
>> *output,
>>   	uint64_t rate[] = {0};
>>
>>   	prepare_test(data, output, crtc);
>> +
> 
> 	Please remove extra line.
> 
>>   	range = data->range;
>>   	vtest_ns = data->vtest_ns;
>>   	rate[0] = vtest_ns.rate_ns;
>> @@ -1147,6 +1337,20 @@ int igt_main_args("drs:", long_opts, help_str,
>> opt_handler, &data)
>>   		}
>>   	}
>>
>> +	igt_subtest_group() {
>> +		igt_fixture()
>> +			igt_require_intel(data.drm_fd);
>> +
>> +		igt_describe("Test to validate CMRR in fixed mode.");
>> +		igt_subtest_with_dynamic("cmrr-fixed-mode") {
>> +			run_vrr_test(&data, test_cmrr,
>> TEST_CMRR_FIXED_MODE);
>> +		}
>> +
>> +		igt_describe("Test to validate CMRR in video mode.");
>> +		igt_subtest_with_dynamic("cmrr-video-mode") {
>> +			run_vrr_test(&data, test_cmrr,
>> TEST_CMRR_VIDEO_MODE);
>> +		}
>> +	}
>>   	igt_fixture() {
>>   		close(data.debugfs_fd);
>>   		igt_display_fini(&data.display);
>> --
>> 2.43.0
> 

