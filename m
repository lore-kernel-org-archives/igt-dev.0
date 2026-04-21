Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0AEF327C2
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 09:29:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01A710E853;
	Tue, 21 Apr 2026 09:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwK3wxgq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8619410E859
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 09:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776763738; x=1808299738;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6atDj53H7JHTzNV5n9Z+yUGbqhYFwbek19AduA1ci2A=;
 b=RwK3wxgquhFHSZj4Rzh2UT8cs+0oZN9do5Js0kvO7XW5puq4qzA/z/Kw
 YYhrFyrJe6wEWEmcCKixtbI8OPyVp04z/vVQcEisuwJStbJrDFsT7XzE/
 TCOnfzAUIBjhK9lwAetEXe3tXe8LMfPn2YdM1Wrj3vN9fZM0jT0QIGdyJ
 1vTy1BzWI6TNwAuqXns8z1y+OAM0CYj540CLacSWdb2L+67w19bABEIsP
 gXs+3xjO70Ekw8DPEBXGBCAC+oUF5aQQRRl2KiilyumMwC27QmTfP9dRf
 xzhe1LbXNPBOHG7jFTpe3RYQJLzt3qTrAuXBnC3Q11cn5+n2sz8etB8Qd w==;
X-CSE-ConnectionGUID: iFT8I1jqTku+bF6PNCu9dQ==
X-CSE-MsgGUID: tNvupcneSXal43OxCRaZzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="65228501"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="65228501"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 02:28:58 -0700
X-CSE-ConnectionGUID: ZGktxSS6R/ilkL1/U/D+hA==
X-CSE-MsgGUID: cg4+XH1LRx+awqzOEfAmHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="236352336"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 02:28:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 02:28:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 02:28:57 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 02:28:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEiSvJsawiHK9xm3btaM0qtlDcPYm3/ZrloJne/t6V2ELcd0ShPnl/wsDhTxF/OYLrPfpRNwsfkiA2knVpYJKTMGCItO5nN4jnCkjyGzoRYIE3TPpIzNRHe4pYJTWl2RPLFvAPdAFHoFuW/GHzcL4E3GJemDzRwNZ+VbWKLw2bpIIh187dBN+hTVpNVmmmIEl1HVo7UKIUhr31Jtl2hQwlLoYKvpcLV9o+JcTeC6XJ7ujCRkwVn9JBMirb1Jge5vH5yfFdiK35obZNGQKMm08cEBNQ3x1SDHBTQfZgNh389SJ2BfxxgjXFElK2iaW5XEK53pufyxEp45b41bcPAirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZVth7coFpQNVGF6L8Zs4dRsqL/V9KQmcznnZAxg0QM=;
 b=nGDgkEID21GWcte/yJFp7RbZKnRzFAvcQLB5d+o1Lh8oF22As9UBhZ81SqQttFJek2Pgai5VZiKEpEC0rqR3Ybaf4VhO+Pp0p6Uq94lY5xUcy7ozU6EJWgGb5CJvyFZZtj0OBzHoW05xO3Ir+qakr3oXm2A4VoUNZcSdsOKv/8pzVnhfsymsKg7I4FIrOuAA5hlirhF65mCNSMr8fkV47GMsKsHFAJGzLSMPOYQoBmx20oGOYjZqcOcOVoXuaMeLw9KeVbxK4SeKj9Ar3BUolPjsYYwvipTCdi6wxPCCqfsq2KelXF1F8Ed4BTrGp8ApFdUZEmVDwdHNlFbxDlcRTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB7558.namprd11.prod.outlook.com (2603:10b6:8:148::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 09:28:53 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 09:28:52 +0000
Message-ID: <7c28fb05-b496-447b-ae3e-5b21f720b50f@intel.com>
Date: Tue, 21 Apr 2026 14:58:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms: correct index validation logic
To: Jing-Ping Jan <jingpingjan@google.com>, <igt-dev@lists.freedesktop.org>
References: <b4757a01-6cff-4c92-b7ba-5a6578c7c06a@intel.com>
 <20260421064342.2851479-2-jingpingjan@google.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260421064342.2851479-2-jingpingjan@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0138.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: d928af5e-9516-4657-1a13-08de9f8866e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|42112799006|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: SvA4LRjSZ4+LPSM/VN6trgDAAVjA8kzKbhTY+u97NjGqtELluSoxlI7hJE/CmKbZcEJot8oKDnubCDl2a/vdGRnSwSWiFugRMY9KdB/5upG4TseQboiBR0flOYWeE2T9A1uHZ2Dmgbmwh1NXOh0ych+j/SS0mi2VIMgwfvx8oWscaHPWPJks/EulD6VzC71XitjJNfKmHBuETl0qRxE3/P5/cJvhpO0qCOyaW3/9cHLXcNwhpZkPmVvXTQ+Rb7OUbjDj6dEJdyBddb5+nd7OWzZPEyg7T7fzlZMsgkOEa+NEt3aCuLvMnb/PZm3XoBimS9zqmlB8Ja0wxgqhbWiDcJx2EQt9kt1UdjExHy757pHk1o+UhWRbYPm8lP0vmlDQLUX8BizNELn8idDueZDW40GNZRxGY+Sm9YIuEhT/RQXIYXGHthXss853jnmfvv+N84Pe+0U1ojK9W9PI+DeCVkZvUYZf5Z+8A/0EswHCQMajNLmMp38zXFMRbxHWgMAqOsnelxNiEjGY/u+LG8KtRLltn2hnqxVw41rbiw9ym2yg1st9QSevg7w35wBwC4eN+C6vItk+oxY2PJ7OEgXoPVcKB2twqiBG4LtDT7uVuFbJJBhOAqwcvJOTkCcfigx6FMEddUP+GtLTfaqXRm4h3rEsFL4CqrjGw6a2kkaRW9Oe/PbjIB6bc9mmZiHCvb63sVal2fa1xpRG9CBvcI316iDx9vmWHnUoP+IQVIMPJVw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEtDemNRekZoakxHd3hlaWhCYitIZnhBSXZCNkQzTHlGOElhTWZUUlVhRFV0?=
 =?utf-8?B?cFYxcmpYNGFweDNla3pjVjZKZERxODNvN0FHRXhPakF4NmpHZ1I2QmxVMUZL?=
 =?utf-8?B?eTBkOGJadFVzUVU0UVRIY1AxVVY2QkhyUWI5YWM2T2I3VTl2a0svVFBySks2?=
 =?utf-8?B?Q0Zlemp1VDR6TVZmOHJWMmdlQWNRbW5lZTN6L1hSdVFoUENUTGtMYnl4eUlt?=
 =?utf-8?B?czBHeEdORi9sTW10QWpnMWJZU3doa2h6czVEdkdZT2tkZGFIUjIvOHhIb1Zy?=
 =?utf-8?B?aWZNQnlBTFB1eGQyQXZ0dmZXbWJpbkEvZXdvL1FyRFhqZVRwSTVvWXNSL0NP?=
 =?utf-8?B?dXJEUklXWmRJdmRXRThhbytOeTVlZXlEOWNNYk9SeFlidVdrTU1wdGdPQzZF?=
 =?utf-8?B?aDRUWnM4VFhyRmIxMWVzTk90UUFUWGNRUWEvOG01blFrM0x0Z012d1pFVm1B?=
 =?utf-8?B?enlJV3hXeHZLMTNSYnZNS1VNcG1zb0pTT1hXU2I3VUFTM0ZIcDhvR1IySWhS?=
 =?utf-8?B?c3BjdnRuU1FRaW12MjNYRlpOckRZeWRyeG9RS25ZeGZKN0FaVDdTUER0emhq?=
 =?utf-8?B?MlZnaWIxcW1lcVJPQVpzbHBMZ1U1R3RjbVVNeG4yS3BPeHB3MUE3OTJZSitv?=
 =?utf-8?B?dlRCdnRUSlB2eWd1WEp4ZzJzYk5GZy80dlp0dDQ5RE5VMXJlNUFpSUZsbkNG?=
 =?utf-8?B?em96QmhLRWRpZ3N6dVZ6Z1lsVm5YaHdUSWxIWUdRWDg3M2RaMlZBTnJQQStq?=
 =?utf-8?B?bTdvNlB5UzAzNVZJLzV1YmZXRXJzUW5RSlpTVy9JNlpTMHVkbXZpQmEvSkp0?=
 =?utf-8?B?Njl2MmNnKzZYYmFOQlNoZDFlY0p3N3RrNWR5eEtobjZqNkVPcHVZOGdySXpj?=
 =?utf-8?B?ZnFRSjRsQVVjbmc4aTFIRFBLcWhqbmF1VTNFbEx2bEhrcTlmd1Q4eEQwQnRY?=
 =?utf-8?B?bTBTaVJwZjlNblY0OXVJeGppVVhWYXl5a3dVU3BvOUt0QlZzVk1kY0NNU0p5?=
 =?utf-8?B?MU04ci9QaWcvN3VzRFV6TFJYMTNOOHdyUkVDQndmSTI2M2lPc2ZEOUhMQThn?=
 =?utf-8?B?S1pxTVlJQU9lc00vNFdQN054RW5YdDJUcnVaR2lmeC9hRG54Nk1nUnRhTWVo?=
 =?utf-8?B?UXhONTgzbUFqeEFJUE9OK3BSa09UZy9BeVNmcElTZWNsWTZGWmJjSmZuajl2?=
 =?utf-8?B?dGw2K0EzTldycWkrSkxvbXQwNGx6WERCRVNJY1NsUTdmcjVpR1ZtcVBQUU9U?=
 =?utf-8?B?SWkyOThCbjB2cWZuNkNoN0pwd1Exb1k0N1ZZRkRPVXRETUZwSUlqNytMMUdW?=
 =?utf-8?B?UlUxR2ovT3l6M2JraFN3MUc2bTdCMmxsbFdYa01IdExTbWN6L2NyMUpCamVj?=
 =?utf-8?B?K20zQmNSd1NiN1VqYlRBT2dVRVEvVGpyYkpwLzczNXZzem9YSGM0QXo1b0pU?=
 =?utf-8?B?OUxzTVNsMktuanFGNjdWdmN1a2hQV2dHak9pVkYxM2htRHVQc3V5QkpramNB?=
 =?utf-8?B?d09jTElEM2VjQUU1RUtQczIrc014ZkJGWHFDQ0pKSWZ1OEpiZytucTcvOE9W?=
 =?utf-8?B?WVE2QlREdWFPUW5wRFVPUS8yV0l6dkpReE9sUTRBTFY2ZnZxUGFGRWRkTVpX?=
 =?utf-8?B?UFVDZDZIYUc2cjZOWitZQXJnWUk1V2I4K3d2WVFTYTJyOFlBTnFTbDJQcWRK?=
 =?utf-8?B?QXFvRE9TSnBjWGRVVlFqbitZRHQvUFRaSXlEeGlrRVNHbmM0QnZURzlqVC9Q?=
 =?utf-8?B?S09jWnQyOVpITjdRUDVFTCtvbXVPSEJMQXZNQmhxMWx1VzRUVHJPV28rWnZh?=
 =?utf-8?B?b1o3bHpBMjZ3RnJGYTZJRXlNcE1xc00zcjlvTDFrUm1nL1BGQmJrejFocjJl?=
 =?utf-8?B?dXczZjFtZWFUYXYzc0paVENoLzRrRkFPTXNJVVZQb0VEL2lTTDliQmxOL21M?=
 =?utf-8?B?RXEyZ0NYdHZ1N0dXMHVlTDBqUkQzM3hRaVV4bmRXK3czNG1HUHNsaFRKZzZH?=
 =?utf-8?B?cHVESTJOUmpLenJXNjBVZW5mMjZYWUVHN3hLV2hSOGhpcFFMaHk1Tk9Pa1ZF?=
 =?utf-8?B?K2ZUNm1McFJrOVBoR2V1TTV5Z3lYSU5EdVQyNytpN1NXT0dwUmlMa01LSzNY?=
 =?utf-8?B?YkZFaUlKREZGUzVENFFSQlBMTTdOYVF6SWh0NDZFd1NvQTZSVlJVb0tjcEZ1?=
 =?utf-8?B?NnQ4eEtJQ1l2UnJ4c0N0QnZTNk5yMTdrdkh4ODlYLzdadFVSekZ6b3k3ckM1?=
 =?utf-8?B?aDJySUhEQ3kyVldJMEJXWDVHSzBYakZFdm95S2xBa09SWkNScVArQXJzTHcz?=
 =?utf-8?B?Z3ZJbmF5eDByaGFFMXgwb3hNamNhVEVCMy9LbXBNcnBieTJxcVFjQT09?=
X-Exchange-RoutingPolicyChecked: SaBoU9juOYCtYb2LjD0dk4XlxIwWnSKDKuFVsGUEJtmHs1tGdZYRK7DWc+k16oLCT8FfUfxiYR42CoUZ4eFpRuarIYXsOxDAJVtgrJAQq4vgeHjqy8xj7D+Z9DyuRWK0MLS/J24A4G2n9FF/Q8Aq2Dz57On7unwyoZNS1CHXW0ZYwlE+7zcJPrTb0/T3KMaW9CzZYtpU2nKbPG5JH6M3zq4tgEHRVarBOLiLSzN2yZT/p932EfbfPUiomNvHAR2bKCo/GykJ27cOTUaG+M0MSY8/bFQ8YHAxZhWxd7bb19725Gu5jldgjAk0tRAyrTg3Kw39s3elLtNcsG/QP58Swg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d928af5e-9516-4657-1a13-08de9f8866e4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 09:28:52.7172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAs+TbbNf2QjisLRZuRiA3bVysneScIuxwFqiSuNrW0vFz6eLeVbPdAh0FpU2uEtmDixd5XndxG7nISXNia5pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7558
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


On 4/21/2026 12:13 PM, Jing-Ping Jan wrote:
> Based on the original implementation and the comment above the function,
> it appears the expected behavior is for the plane indices to remain
> consistent with those in crtc->planes. Therefore, after swapping the old
> and new primary planes, we must update the index in igt_plane_t to
> ensure it matches the corresponding index in crtc->planes.
>
> Therefore, we should expect the indices of the old and new primary
> planes to remain unchanged after swapping them.
>
> Fixes: ac37e1174cc4 ("lib/kms: Pimp the primary plane swapping")
> Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
> v2:
>    - Add Fixes tag to the commit message.
>   lib/igt_kms.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index bec96f267..405a04640 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2982,8 +2982,8 @@ void igt_display_reset_outputs(igt_display_t *display)
>   				igt_swap(*old_primary, *new_primary);
>   				igt_swap(old_primary->index, new_primary->index);
>   
> -				igt_assert_neq(old_primary->index, 0);
> -				igt_assert_eq(new_primary->index, 0);
> +				igt_assert_eq(old_primary->index, 0);
> +				igt_assert_neq(new_primary->index, 0);
>   			} else {
>   				igt_assert(old_primary == new_primary);
>   
