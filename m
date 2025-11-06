Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CC2CCFA19
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 22:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0030610E9E1;
	Thu,  6 Nov 2025 22:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJPIbYIU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E58910E9E1
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 22:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762467231; x=1794003231;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zSstgfBMUJ4mIfaPE58A/tQsrt8wsgEoQ4h/yAUtEOw=;
 b=GJPIbYIUv1DISKl8gHrZ7cB7EKKZW+UB4jXbJdK/6NtbMtnF0h0TBeQK
 vksOzcRbMZ3cHA05rD14eRy/3GJvEKbuv6xsJcCoEQT4Pit4sYPumAK3x
 KipIzAksIFFZiaB3WRI/QE086mAJY8r8AzwFgkFyXcK7HQOecFJu8L9jp
 3PjkoH/g8c2DcjQYPT619sOA/lcS0nTu9ZOMKCx5tdhP8NgeUM1+MdrCu
 3kMR+1lqEoJdJg2zh9GRr+8g++VwXL+8WvvpNrQK5B5xmJ/lkjFJljM93
 QxOCViBzD05/PitHUDdspDkLrHaxFmfdyjda5Xev4fkElcwCCh4J7fa1U A==;
X-CSE-ConnectionGUID: Whcj/SYoRCaT/PkhVBe9Dw==
X-CSE-MsgGUID: LuEsGApgTTmXp/UB8PvlZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="63629071"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="63629071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 14:13:51 -0800
X-CSE-ConnectionGUID: zAzvawTRSSK6w4KCK098LQ==
X-CSE-MsgGUID: 2MDy0TyLTMW9vxi3ypxrzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="191975573"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 14:13:51 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 14:13:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 14:13:50 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 14:13:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+UvEyXKwbn2X7IXVi3v2hNOwKpgO6fcsdbLUBOqt1PElEoB93Ttp6CgQkr612eeSkcLfdrvHFcfaZSS0bVw+PR5d3pcHSPn62EX+Du9rkIan28tHiYz6+/SbctS1vth7UPrTQEJ+h1e1E4/3azEESxhfmcPpJhU10jefExWYVMaFny+++a5vwDMAyi+1hKaqKU2xfNpgEcajCpb3SFm12MdxhzKJioVQoLGEjsG1AWAD1CAlBenC2Ve1IpyLKh/rMR3rfckKLYZJzL+jRv3Vfslmn9pEa5FcpI7CmSwNxBtpUKv6rUos5dULGbU0tq5vbazsAwuPiFtrxkdhEPHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubm1tpJnFrhIspIahCompJu2x5spSu5cL418vZ5HBG8=;
 b=yqejfNPrftGGLSO6xxoqtoeKALcuk+9XMwYUJS6Lve0LiFa/5c0vtlmXx2H4N+kkTSM+oyY/vp9RyVUyNt6AU1pYndAzLUmSqEgaEKBxF9qcBA+Rb088LzemuwyxvsE7VmOnNe/8CWZws7rviR2lBl+XVscr//+fnYunYNN1Pnmuv2O70sLPWyfUGfUznfQvrw8HZK7tppylgNBGQkbNEMTfHNNKeTumJTd4wClGTogKlMjqqnxlHSIkdLPhVdTeML3EtpsHMSf3hOgac+3zIu71z4hGPsXsaFFNlYKchJtLbWdNZg1WqljX+2EtzTmPTUb9DGDwq1sZCBBlyfyMMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW6PR11MB8368.namprd11.prod.outlook.com (2603:10b6:303:246::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Thu, 6 Nov
 2025 22:13:48 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Thu, 6 Nov 2025
 22:13:48 +0000
Message-ID: <9f40b788-295d-4c54-914f-6ac8daa2171c@intel.com>
Date: Thu, 6 Nov 2025 23:13:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_pmu: Update preempt timeout when
 sched_is_idle
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>
References: <20251106210418.258032-2-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251106210418.258032-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0199.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW6PR11MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d6ba12-28c5-4902-89e7-08de1d81c238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3o5bFY5SjR6eTA4TGdnZWFsT21LYVU4enQ3eWI1dms0V2ZtdGVnTTRlOW0r?=
 =?utf-8?B?b1ZMdFd0VnVKQ2loWmxNV1FQbmZwZEQyd3BIeitQRmd6QklxR2s1NzFaKzMz?=
 =?utf-8?B?NEZwbFpMNnE2QklYNjFNV0VvQTdnUlAwVzhGL29udW5CdHcwMGp1Y2syUXFK?=
 =?utf-8?B?U2tZOHVVY0h0alNGcElLanRYUUpKT1RrSDZtbnVHTkdjY0VhaUpVVXZGSHVy?=
 =?utf-8?B?VVlYSFl1NmJ1aks2WVdyUjNPbzJDcjJMMlhWdUYzVFJpclppY0hndVovUitV?=
 =?utf-8?B?bi9seUlDa01OaUJMTWIrcTE2Mzk2NVczcVFQcmkyMUJ4czg1amI4TkdIb0wr?=
 =?utf-8?B?ZlRtVmxMVjdlaUEvQlNVSDZNYjZjd2w0SXRMWHpMb0diR2puOEsxOTVILzVZ?=
 =?utf-8?B?clVaOWJHVHNNSlNYdzNBcmhRSWFQcGVHTE9HUlNpRERqc1U2Y1VDbFZFOXN4?=
 =?utf-8?B?eU9WZmFGZ2VnSVc5U0JxOEFodE5GSVh6ZDByRXJRKzNxNWtBMXZvWUpURXdy?=
 =?utf-8?B?VTVGYWZmbnFmK3R4Q1RhM04vMVd6QSs5MWtYM2lvb2Y0REI2SVhUSU1zZnF1?=
 =?utf-8?B?UnV3OE1LQ25HVHhscEhYRTFuU2hMWDdWUFVCV0JGSDlwcDVJQld0OWQzWkVJ?=
 =?utf-8?B?TjVuUmZ0dnh3MEFBU0lZeXE2NWJQemljVHNQd05sY3RtNHF6bWNxQ3ZsZHI4?=
 =?utf-8?B?OHBXOG44OGxLV3JmQXlESGVlTmdVR05jQi9TODd0dU83K0pSS2xBVEJUVGNq?=
 =?utf-8?B?ZnF5T29veXA0VGFnSmUrdGsxYjJPRkJudWtFM0MyYjJwdXB3NmFTMkxJaHRZ?=
 =?utf-8?B?eEFHNU9CcTU3a1VybWZNTjNVSElkaUFjVDJDekkvTXZkQlFBUzZhNDZ2TWk0?=
 =?utf-8?B?b3RtNk5Oa2pwYVRZR1JoaHNOSVFpMHM0QXlpRXRGOW8zS2xVaUxSNTBVQmpj?=
 =?utf-8?B?SXQzYXM2VlZ0MkZUUjVBWXBCeTRzN1M0ZGpXVDdCYVh0TUMrd2dKTkliTlVX?=
 =?utf-8?B?a0NuUjd3MkdrTWdNeUpXSWo0cEJJMnJaRFJLb0ptbmRXdXdiWndVckdrVUgv?=
 =?utf-8?B?VTVFUVVDdU5UdHp0cERCOFEzV0pTU2VSWGFOMnBSNWdpUzBIVnpKQjdoQnVl?=
 =?utf-8?B?ZHlTWjhicjBZd1lHcFBBWEp5V3B3bmJZdnNjOGVaV0tNYkpENFdCR1JBUDNr?=
 =?utf-8?B?YTJ2clI5ZGw4cnZBZ2NETWZLTTF3Y2RiSlFtb2tJSUg4U2cvMXY4ekwzVklw?=
 =?utf-8?B?cjdLMksvSlYzTXEweE9oZU16ZjVhTDdWTVdLc0JoQWx1aEY5TW1FNzQ3RWpw?=
 =?utf-8?B?RHNCTVlRV04vZ2wwOW92YnFZVUJEUldINnU0MTVjOVhQMS9HUTdsM2FUbmJr?=
 =?utf-8?B?UHJrNGRUanlFM01wVS9SR2lCdFdlVGlKNkRBS0NSbmFuYWhxSUJCck0vNFds?=
 =?utf-8?B?SXlVVktJV3VRUzFyaUtGbnB6Q2lKM2FJYm5YMVAxRC9sWldOd01MeEdQNktO?=
 =?utf-8?B?ZWlzWERPcVRNK2JJeEtpQURTbWZ2RXFMN05FSFBWaS80YUJ5eHFBdTMrODN3?=
 =?utf-8?B?YUV4R1hlYkRzY2pnRFlXMTJFcDk2UkxMN2U5ZDBXWGZTeVpCOGlOZHZiaFN0?=
 =?utf-8?B?cGl4SWZjS1lvcFVqcnF4MTNiSllUMFhobVNybVl5V1kvS0Z3Q0RPTnI1WVQ5?=
 =?utf-8?B?T3lyWHFMNGpZZWNBNHFYRkpNVy9UQWo1QURmOHNPV2pFWEpmMFJHNy9aaGZS?=
 =?utf-8?B?YS9lN0VSLzV0UWduYnZDT3MwVDNmQnNpYW5tb3k1ZFc5S0JHZ21zbEh4Smlt?=
 =?utf-8?B?YVcyUFIrWkh3Rm9nUmczbWoraXlrbGlNZHRYTFRlTEgxT0pRcTVML3J4Y2dq?=
 =?utf-8?B?c0hNaU1JeVlWUlQ3TTNFWnNPaWZZaVVSc255eGFHMnlyVmRVZ2Nva3I4OTNU?=
 =?utf-8?Q?IGrpoXzRgQMea0vCM8WCSbIYyHZ3pHQ3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkJoaXBkbkU2MXd3ZGlmalJFTE1pY2ZTeEpvSzJqRkZRUWVTZmdndTEvUE9q?=
 =?utf-8?B?cDU2dk5JTFI3VXNMcmRubHl3V1BKYldVRy9jbTIxN0Z4YXp3YThLRXZucDdK?=
 =?utf-8?B?MjBzOHJXY3VwTkd1R3hjTVhCbkQyREFsNVNrUkRDeERDU3ArSk5MMXpWbTlY?=
 =?utf-8?B?Qkk3VjZkcTBwcnZPNTVoczhIR1I4a1FpdjlMaWp1TDBqR0V1allBN2xsZWF2?=
 =?utf-8?B?TC91YmFmK05kS2RwRWFtRzhuNzg2NW9XaWQrUERLUklOQnFjTHhHbjFZNENL?=
 =?utf-8?B?VlJZaG9XNmJZTHVxcjloSzMwVzA5aUR5RU50VGdQdGhveGhacmhXUkVXMUp1?=
 =?utf-8?B?ZUFkMDRxSDJnenJOY1JzeWhFME9IZ0NhT2Q5WW1UdjBwc3lGRDRYT09RZVpq?=
 =?utf-8?B?azdOZzNBVlhQT3hpN2Q5UXdrUkRyZlJoY3lRejN1cC9nWTJrZVdLWUdtajAw?=
 =?utf-8?B?RG1pbDZ5R0lSS0xvTnE1Z1N6THFJN0VvQUNnRHR1ODJERGRuQ1I3UTJTY09W?=
 =?utf-8?B?NUtXRzNHdVA3b1dZMHoyUzBJKzdPaC9kKzExUzR5VlZ6eU1QU2ZoR3o3eHl4?=
 =?utf-8?B?TGo4VWs2SzFlU0xNeldEMDdqakRyOXhCY1VqY2VaSGNuaUxwSWVnaTNBSmFr?=
 =?utf-8?B?a251SkRBTUlLdVYyZklQSFpQV2tYbVhFS0lFT1lPZXZXVnk2dm12K1Q0LzhH?=
 =?utf-8?B?T1RRVkdXWjh1aFdiNWE0clE0a1B4a0Q5clFBUnNQNlR4U3dLYzQwVllhQ25G?=
 =?utf-8?B?MW00bUxDc3F0NktzS1crR01JVGtZQnNEbFRSZjVBbkovaDJVVmo5NGZhZGZR?=
 =?utf-8?B?TWNsR2ZxeW8zWUdpWGxDc2lIUjZVRVAzcW1wa0VQQUphRnNreFJ0cVo1RGQy?=
 =?utf-8?B?cCsxbVh0VE5nbFExdk0wYU40Q3B4c0k1eFgvQTR1MnJLSDI3SS9Na0RQUm5L?=
 =?utf-8?B?WHdSWFYrOHh2SXNwTkJtZnR6a0k5a0ROM1lWbVQvU3JISWdmRzFTby9qbm1u?=
 =?utf-8?B?MHZ0M2xsKzRDUGk3OU92dmlMZURRZ2RsUndCeGxNblc3bk52VXF4czkrWVMv?=
 =?utf-8?B?YTlLQVVVZEpMNGFLSjMwdTEycDZTYzRZamhHODNQbXJhOWYwVTljTnV5UzBu?=
 =?utf-8?B?aGd5Z25pWGRoT3lwYnlHTmJFQXFlYitMci82TXpMYWh3WHhMNmJYZHNqMVpP?=
 =?utf-8?B?ZjR3Y0FVd09JNkZkc2k3bzNQMG1ZWDV2RHBPczFrVm1tT3NDRDJrS3N3ZXB1?=
 =?utf-8?B?aEx6NFZnbGY2RjZQL0NzM0hsMXdYcERtWmlPVmdZM1hSVlM3UzFOdTlmSmZC?=
 =?utf-8?B?bzJSTjNNSkhBeG9VdDdIb2RzK0NwV2pNN3R2TTdBbVlpNDBDMmRqY2Q2cGJV?=
 =?utf-8?B?YTVpSW1WTlAvT0lSQ1l6eEJHNzBac2JTRU5VeXJOcTJuMWJzbldRUzVVTnl1?=
 =?utf-8?B?QXZ1TStKcXRaMmJKcG1uVVNWdzRhQkVHN1FZVm9zc0ZBYU56cm80VGZicTkv?=
 =?utf-8?B?NGFLbWUzcys5dkZGc0V3ejJWaVhnc0taWFlDUnZVMk4wZUQydkpXVFZrRWV6?=
 =?utf-8?B?NnBWVExFRnNqc3FrSDRTMlJQNndPRHRFZmNaS3NHMmlXTDRBbVExbityaUhX?=
 =?utf-8?B?SnpkdldmSWpsQ0R5QVR6SmZGYUtNN3pKOXZiT0crU3FiYXl6cmFTcFEzdmtU?=
 =?utf-8?B?QU1BOVhhNHhMK0dxbExuTHlaSm9GR1ZrcEM2MGlPSkM4WXFrdU42WVNkakdE?=
 =?utf-8?B?MFRWVm9RWHFHbSthQlpoWFljWU55QnI3Y1pYS05maU9pWStEK014WW53U2c4?=
 =?utf-8?B?U1dGSEd1UElYZC9sTVpsQkVoWUxzQjYyUHVPRGVaMWFLb3VLTnFMenA1Z1ds?=
 =?utf-8?B?K1hTNHRtRytwV0pJbzdKcGpyL25iemhENU5POTFYejdsSitScTduL2tXZkZ3?=
 =?utf-8?B?eFcveHdlRFZFZVRxTnNPTjNsZ0JoemNmLzZEOTFEVmZ3RElUU0t6cEE1WEV6?=
 =?utf-8?B?OTd6SVRteHM5Mi9VQXlhWjZCdmNSYTJ4ZkxZUnl4MHZseTc5V01wdi9OMW9I?=
 =?utf-8?B?V3IxMkRFSUNMYWRaUmoyZ3NFMmgra2R3NmQ4R0NlalU3c2xtdzZOTHdORzNo?=
 =?utf-8?B?cUhWNE1SMHBEb0RRT1J4VTg1b3JJVlNWN2V3UXVXelN4N2dhcnpGSklSMGI3?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d6ba12-28c5-4902-89e7-08de1d81c238
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 22:13:48.3215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ik0gLGSdZBsDORNJCvVlTqyTofT6A2589TtC2fhEqywu4uNjF7Oq694BjrjFqWM0Dx/qZuLRt/TkAk8+dyOYuai3sP+RRcAQSaAfqOJR2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8368
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



On 11/6/2025 10:04 PM, Jonathan Cavitt wrote:
> It's necessary for the VF/PF preempt timeout to not be infinity when
> sched_is_idle is active, so update the value to be twice the exec
> quantum during the fn-engine-activity-sched-is-idle subtest.  This value
> is chosen because it's what we've used historically in cases like this.

we should setup PT together with EQ
for this test it should be done in enable_and_provision_vfs()

> 
> Since we only want to update this value when sched_is_idle is active,
> this necessitates a minor rework of how the test is initialized, but
> test functionality is otherwise unmodified.
> 
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  tests/intel/xe_pmu.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 9525655ba2..2150c314b6 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -1192,9 +1192,20 @@ igt_main
>  
>  		igt_describe("Validate per-function engine activity when sched-if-idle is set");
>  		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
> -			xe_sriov_set_sched_if_idle(fd, eci->gt_id, 1);
> -			for (int fn = 0; fn < num_fns; fn++)
> +			int preempt_timeout_us;
> +			for (int fn = 0; fn < num_fns; fn++) {
> +				preempt_timeout_us = 2000 *
> +						    xe_sriov_get_exec_quantum_ms(fd, fn,
> +										 eci->gt_id);
> +				xe_sriov_set_preempt_timeout_us(fd, fn, eci->gt_id,
> +								preempt_timeout_us);
> +				xe_sriov_set_sched_if_idle(fd, eci->gt_id, 1);
> +
>  				engine_activity_fn(fd, eci, fn);
> +
> +				xe_sriov_set_sched_if_idle(fd, eci->gt_id, 0);
> +				xe_sriov_set_preempt_timeout_us(fd, fn, eci->gt_id, 0);
> +			}
>  		}
>  
>  		igt_fixture

