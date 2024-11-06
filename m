Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB654D44D4A
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 10:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D1D10E62F;
	Wed,  6 Nov 2024 10:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mxw3POeW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC3010E62F
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 10:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730890419; x=1762426419;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=i50v6qIY3znb9Gm3S/cnWPUym5o/PakumFZdYuhTH9o=;
 b=Mxw3POeWicKc6PGHatbzG2fRu7cqcFgfvnsI9ry6kmgT8EPju+TsHEwB
 O89HAQ+2rptlX1C9q61QztfevswEEDkr//O7tCMs7tteoIJ1s8039cL6X
 S0fl0VvtAfj5bO/wQqjHB4JqmTYEZ4c1tf1uivOxK4i+P3nYsdHA0enE+
 QXcZSCeec1MOW2isYD4DVXK6pdCZg9VEt4ENaPvJvIeD+K4a4aS0U2vL1
 iohHGG0IVa+7chKAUGBR5Cm/maj0exOSfnnaJusTeBuEtmi/kMVYhyhon
 v5OiJNZlGlhYyfefbWqTnPI+bCWoeix4htgNAQhTBV7QR9Ab/m1T9z6b5 A==;
X-CSE-ConnectionGUID: FdMl6FZ3RXeXOHIL6wDlWA==
X-CSE-MsgGUID: sAPZElAiS0uVfvaRobm2eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30788545"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="30788545"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 02:53:38 -0800
X-CSE-ConnectionGUID: gWNpFxYTQ5CPn//WL5obGQ==
X-CSE-MsgGUID: h1cpUJI9TjmDqSVh4ht5WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="84582311"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 02:53:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 02:53:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 02:53:37 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 02:53:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fz/D1L653N6InRODhJS/0tKiW9xRloT0LoVXwmYDojweLFvvJxVa3zk7WCnjI3/4lVnkyMHW/oFLhpERdYUuUggZQH8wevCiExR6rvetOd0ZZJO7xRjp4oSar+YTu0RsoPUJmReKquSJaYogHw/wOdH1lrlJSgWS0w7ea3IiG9PWCj5TZYsG00J6NZ9OssIvdZuf0VskNtawRUgPsWOsa3rsgupBYGt+Es7zoI+TZfdnJvczXwjuAImJm2xhaaLgKe3VOGGFVP0PjY9/ckOifK/LVW4Vp8LGtuowmKVMvDeMy+bnjeTft/VAmnda8gfWMm2YQBxbsoGyTpMGl87dxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeZqzT0xvq8huwSzMpP5Y62YNlLMA7pkvGITthFHpDk=;
 b=EZ4yhMT2FEy7nVpyWNzfv2DDRcK0gVqLET3csO8oCird1tQZA/5NBgc4FKdEsfDknm2YsnDmDiHWuPREAmKzDpMWoF7iN4F1ikkfFnJRajG/Z0CSuIn3TXmebE9P2vZ7cE+cg3DGrB8zKELTzAF5fYQtUW/AgFbZM1PN90iDbY1oFwkUS1/Y5dG6TomHr0fqZLABQc3OW9rsPli7bYtc14KOgeAu21qd1MDDTuMJ4z3t1xVvKTV7iY6fXsSU5ipV5kxf1wHTlrjCM1luiPEHa2BMyLEIu7hU1N+yPAhNDT8BQjvHuqGUIlcCznETNNvKdXtupPpfzPsH3LhxEvrN8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CY8PR11MB7106.namprd11.prod.outlook.com (2603:10b6:930:52::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Wed, 6 Nov
 2024 10:53:34 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 10:53:32 +0000
Message-ID: <6cbcc3d6-b153-4a8e-b3bc-eaeb70610846@intel.com>
Date: Wed, 6 Nov 2024 16:23:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tests/kms_rotation_crc: move plane rotation
 requirements into helper
To: <igt-dev@lists.freedesktop.org>
References: <20241104194415.563277-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20241104194415.563277-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CY8PR11MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: 6adee218-9e88-4de3-c605-08dcfe514171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTZkcEsrV1VjV1NKdDNSOUhPNGx1ajJIWFp5OHAydHNCeTJncGxrRkFId0cv?=
 =?utf-8?B?WlZnbG9yV0tHSlpXcFZHTVNqN1g0VHBXdkprSzQwOVU1K1pmRXFEaDdtWlE4?=
 =?utf-8?B?YUhNeVdZbDdWdG1MR011VXVJbExGZGcva3RLeElhQjMxcVZQVWhycUowaDZY?=
 =?utf-8?B?MHlXc0lIYjJKVkFHMExBTU5iUkVLK0cyWHpkY2RTQ3h6YTFHZjhtVnpZVlBU?=
 =?utf-8?B?MWVjQTI5ck5tTzR2K09SRFpXb3V4UUtsdW50ZmpMaEk4L1B5WDF1T0RGYVB3?=
 =?utf-8?B?RWdLeldOL2o0SUN2SThPWWZCemZJRVlRT0JITFNDZTRJTG9MOC9aa055aGp5?=
 =?utf-8?B?V2d2ZlQ2dnBWTXc3NDhvVXlrbW9MSGxxZXJKemNZOC96MTMwdnlMdk5sblBW?=
 =?utf-8?B?cjY1aGpMVmxFZTNtdDh6UmpuYWZaaE5yQVFoTEs4ZjlaU2QvR2F3T1RmU1Nh?=
 =?utf-8?B?VUxJZmlsR0ZXYnhCeXB0WmdsWXNEUXVSSHBCS1FJcndNWHgva1QvTmVVWGsv?=
 =?utf-8?B?dEFRblIvTjJrcGlua05BWmhmcHpZaXU2SlJWMEVPVDREalZyTktEV29ZenJQ?=
 =?utf-8?B?RjdHWFV1VEFSb0NwWWZNSkVvWEZROWpQbHQzVjFPQTgwamdJclB2T2VOQkgr?=
 =?utf-8?B?bys0dDVaVytHN3Mwa3p6MnlxeWlhaXFNQ3kyZ1ZoZ1NVN3lsU1ZOaFUybmxl?=
 =?utf-8?B?RlF4MVdLdmRZak9MTFJKSVVUNDFqUCtEdVFmWTdFM0NwMDJkeTJKREFxY01O?=
 =?utf-8?B?QWhjTldZM0xXSWt2alZRTzhUZHBFTTcvSXpRWDByOG42Tks4aEdLNjJjajRu?=
 =?utf-8?B?RlJRTlhKTlRaaVE0NTM4d0FKaHZjU3hvK1k1R0RQeEpjU2ZxQUgwSnNuOHhQ?=
 =?utf-8?B?ekh2czJwNW4vYklwMU5TM2NiaWtrLy9LZDY0WXJSTEw3L095QXdmWFZ3WjlY?=
 =?utf-8?B?V20zU1o3WnpOZjNXZXpoQ25IZEdiY1U3Z0FibE1DWDBkZTdueGhQRWdQYmZ3?=
 =?utf-8?B?UExkNzhtZXk0SUtRcVA2eDZrZ2RCUHdwMjV3S0xmRWtaM2NzV0RDSUQ5STlY?=
 =?utf-8?B?K2p4Y1UvRFZHTTV6bVdjSGp0OE5yeGN3ZVFMTzVhWUpWZEF0OGVVVUs4cnNj?=
 =?utf-8?B?QjNJSmJPdktKOHJoQTVGM25Kc1c0aHRhSWx2UzNuelZtaTRMUS9qYkFqZU5W?=
 =?utf-8?B?UVdwZ0V1dmlieTN2YXgyL0FHeE42L0FqOTltdnA2VUNCNUdCZHMxMzNhTUVp?=
 =?utf-8?B?aWVxTi9KcEdPZThzZ1ZBTHA0Y0txRWM4d25Udi9vNnZPaHdidVBxUk45MVRy?=
 =?utf-8?B?VnRDYzdrQm5ZWE1oQ0dSdHBWSWsrejBrS0E0N1poNXpOSWpma2hmemJ6d3VN?=
 =?utf-8?B?dngxeHF6UTRsY0djRUVpQzVLaXE2aWdieG54UytvUDVtdXN1Q1NLV3JSTVBk?=
 =?utf-8?B?dFFrME0zV3dKM01xR2hCb3Y3ZUQvUlhwYmhtd1Y4M3dsUTlPbzAxTVFYVWlI?=
 =?utf-8?B?aUo3clBGUUhDeUk1ZGtsOWRxM3VBSW1jUXBtaDNZU3hWN29yOEdHUk5PWmUx?=
 =?utf-8?B?Y2pnYi9OZFZweWpkK1dEQTZCcXEweVYyWlBYVkg0YjZjOEI3T3lJVkVaT1V6?=
 =?utf-8?B?VEVBS0NQNUdRbVVLRERCMnFBVUludlVUbVhvRE1ydFlWbHd5d1FodVRxWDNS?=
 =?utf-8?B?cTRKam9iRnVhZlZwdXJxR2FPRVBrZW5TMjFJdHFaZXRsZ2hBWkVTT1BlSmZu?=
 =?utf-8?Q?wMoGpi/AcLe04BMPVDC8e+290+bSGjIDocutP76?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjJWeTNBelF2ZWxvc0JOekt0Vlk2bGlKeC8raHVFeFEvOWZVelRyVmE2S1Ar?=
 =?utf-8?B?eTYzUU5sUWZRNEFDVXZrNmx1TTFBYWZaVGx1WDV0MEtmV2lOb2lUb3pYOGpC?=
 =?utf-8?B?OWttdTBITThPZTRvZW0wMnduR2h0ZmxjcllnRmJhaXZMdzZiOURjZDdRWDZI?=
 =?utf-8?B?U0twd3BCZ0FLdmpMeVhpaklMZUtRWWxwbGVDQ1NxZzBqSGNqdUtCL2liK0NK?=
 =?utf-8?B?NUxyQ3lacVhTQlNJeG4rY0ZDMFNTZEdvVzFwQktJV3EvUGpVN2d4eXppMFNt?=
 =?utf-8?B?WWFqZXBOVDcvcUJ0L1dlZ3JSRjFUYUhUNG41STE4K21zRy9JWTh3VTc3dUhj?=
 =?utf-8?B?Ti9LQzlnQzVpRDRqZ0NKZDVoSEhZOXFjdDZnVWMxekZHMEdnajdvUmVpR0Vu?=
 =?utf-8?B?aXA4NEFZWFZOeldUNml3di9JcGhYT3RxdFNqUTFPMkpXeWF0UE9LZ1V1T3Zx?=
 =?utf-8?B?Z3JERjVrdWcreFNpK2xVS042S0ZlTHhaSmlvUW5JN1phWWJjaVVubGROZDFX?=
 =?utf-8?B?YUp6Yzhkemx2bHo0bXBFRTVZUjFoY0NCSWRqNklJM2gweUxGSnRoOE1yRkxq?=
 =?utf-8?B?SGNURzhCMW9jc1dadlBVN1hadHFXamtkRUNlUWJMQUh2U3lXSUFDQzk4RnVp?=
 =?utf-8?B?RFZ6ZHBvY3piSk4zdStLNmt6VXNzc1RQeStlK3pUTEx6ZXRackVRVHFjVEFF?=
 =?utf-8?B?Yi9RWHpyWDhrb0o1dWMzc3N0QjgvSGJkYTlqUW1uclNGZTQ2L2NrOEttbmtu?=
 =?utf-8?B?Ykk5TlFYUHZWR24vV3J6cWFLU2U2Mm1tTWVrcklqQ1FvL3h4Sk9GQlF1aTJQ?=
 =?utf-8?B?YWY2T0xHYlRjUXhMT3BBbkxVMURwVUZFblZERTNCcTEyR0tjOXZIUUVCeGtX?=
 =?utf-8?B?UDg0OHJEMW9QU0RhT2V0ZU9mYWNwRWhJdDlFVEdjYW5PNUN1bm5lSjRCRDhy?=
 =?utf-8?B?dWtsL1JhL0lPQ1BBcmdvOGYyQ05SUjBpdWRrNEVHcm5mTXBYZk1YelEvWlZx?=
 =?utf-8?B?WG9OVW43VHJoYk93Q3lVMmhiVUdYSDd1d0hWbnJkZjRhejFObHlPYk5kT0Ro?=
 =?utf-8?B?Y0RLS2J5Z2lHdmNlOWtQVHNmbmptd3lYTHdsYnpMQ3Ivd2YvY2t0TGNiWVUr?=
 =?utf-8?B?VWZIaTlxWlFsYVFYbVpLMHdndjg1eXBCeWd0WnVOd3NJTEdlaFY4MjZYRlpy?=
 =?utf-8?B?cDJLWmFOK3NnZTBjdFAxSVVjZy9TZ053VTA3T1lkVTFCa1lHNi9lQnRLb01F?=
 =?utf-8?B?N0pPTmpWOEFMUEZJVk5ad3ZIYlJjRHArN283V2pHSmNyNmxjeEFaUjZ5d29U?=
 =?utf-8?B?Nk96V0hUTTlKdENEb1pxZ0NqWlNwdEVTOE14Y1BMa0g0NExnUWtLamJVaHFr?=
 =?utf-8?B?eitpSVZmNGxualBvb05yVExJd1B5amRJektqUWhXdy81dnloV0lSOXNOQ3Ra?=
 =?utf-8?B?WkZ4K0xnOG1kc3pUaEtpMXVSVGtFcXlyUVg2Y3J2cEVHRHg0YUlFYW80WDFv?=
 =?utf-8?B?bE53ZGJlQ3NUQUNIUC82VkVpSEJkQnh2TmxOV29kWU1BcWp5bHM2UXM3WmVL?=
 =?utf-8?B?ZnRjd1RwdEJoK1NBV0RobWtZZXpVVTlvM21yUjBpaWtDWllpSExEeHAzSVhk?=
 =?utf-8?B?MnhJQnFaUzVheS9UczBrRXFNZklhUWpBcjRlOVl1L1BpNEZkZ1Fla3BUT2J3?=
 =?utf-8?B?VnRUbStYVEo3ODU2RDVjamI3V1oyWVozUDljOHNiVHI3czBSUW5PNi82R1pw?=
 =?utf-8?B?U1J4TE5ZUm9TRS9MeCtNSm44MFhYUk1WT0JvaUFGeHdYU3JiUDhZMW9MQitV?=
 =?utf-8?B?UnpabVNzMmNIODM3c1owc3lURGVhQ08rMXFGVDNNaGVTSmNBVEpNNFhLUWpS?=
 =?utf-8?B?TzljODNUOFBuc2pWM1JRdm1uNDBYMHpERjhXK3RlWjhUNXlsOXBweC9JZmJy?=
 =?utf-8?B?VlZDM1hqYUhQajVoUkJKZkk1Q1k4ekpJZmNFYzNBVEhIelFxNjdyYVRDRGU4?=
 =?utf-8?B?YmxDeW42UmNscEJKL1drTjZtUkRVTnhlT2xZZlhQVlBDSW1INWg4a1BFWXpp?=
 =?utf-8?B?RlRkQ1FZeTFxc0RiNE45bGdkRjVvNU92WjBNeVl0RVM5TXpMWm1RM0IzWUVX?=
 =?utf-8?Q?/tL8Akj5F+1ozkS2i2AhDHkT8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6adee218-9e88-4de3-c605-08dcfe514171
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 10:53:32.6742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhoG18vYFxngf4J7dpx3kJgKDs7YMHutWC+nsg7xm4PKnwQTzr107UEm1fYMSqKE3UjSM16OxZA8wH05uiPxTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7106
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


On 11/5/2024 1:14 AM, Juha-Pekka Heikkila wrote:
> move plane rotation requirement block into helper function.
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_rotation_crc.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 9888ac6ac..e8b6e4ff2 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -564,6 +564,22 @@ static bool test_format(data_t *data,
>   	return true;
>   }
>   
> +static bool plane_rotation_requirements(data_t *data, igt_plane_t *plane)
> +{
> +	if (!igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
> +		return false;
> +
> +	if (!igt_plane_has_rotation(plane, data->rotation))
> +		return false;
> +
> +	/* CHV can't rotate and reflect simultaneously */
> +	if (!(!is_intel_device(data->gfx_fd) || !IS_CHERRYVIEW(data->devid) ||
> +	    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X)))
> +		return false;
> +
> +	return true;
> +}
> +
>   static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_format)
>   {
>   	igt_display_t *display = &data->display;
> @@ -632,12 +648,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>   		igt_output_set_pipe(output, pipe);
>   
>   		plane = igt_output_get_plane_type(output, plane_type);
> -		igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
> -		igt_require(igt_plane_has_rotation(plane, data->rotation));
> -		/* CHV can't rotate and reflect simultaneously */
> -		igt_require(!is_intel_device(data->gfx_fd) ||
> -			    !IS_CHERRYVIEW(data->devid) ||
> -			    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X));
> +		igt_require(plane_rotation_requirements(data, plane));
>   
>   		prepare_crtc(data, output, pipe, plane, true);
>   
