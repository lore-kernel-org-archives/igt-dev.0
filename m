Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91702D6A221
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 20:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479DC10E35E;
	Thu, 14 Nov 2024 20:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbzbuFG5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EE810E35E
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 20:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731616233; x=1763152233;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HFkVtzsMkvP7ChBD1r5cM2RELaz65YIg6MKJlbHbZlg=;
 b=jbzbuFG5I/jqUEL+2az7e2X1G1B3nVndq2yNwQUKY0s7afIkhXwfdDDw
 vHVEBR3S6qBUvmOEchF77Bop+me1itWLMBrXh2mtOjpE8XXIcxER2MG32
 YCCy1VT5TkL5nc+XdiIEoT7p+LSJsgnNDVN2eq701R1Tz55HD9we6tU+R
 QQkSw6XBEII7BUgPzcC9vs6BTxt4Eof2BUm5wYg5zDZQP71YOnIVXLpWR
 WS3yYGqz9ZArvpwQffqN3Cq59QVUOUeH9p9/CLZUhbpb16GH+P/lLSx9i
 Z5gvvvDoTW0qky3zxzmnZGvrQZf01yeVy0E1jT8iOVxpI6qHznmpIDs/j A==;
X-CSE-ConnectionGUID: M0wTDqWsQOe72HTvd4ZJ6g==
X-CSE-MsgGUID: nlRglWA1RWq1qeJ6DhQMwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31496200"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="31496200"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 12:30:32 -0800
X-CSE-ConnectionGUID: cwJ9AU9YRLiXl75M39ti8Q==
X-CSE-MsgGUID: ZJU5pS+0T1uVbkAgqDvfGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88315725"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 12:30:33 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 12:30:31 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 12:30:31 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 12:30:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHlPhTftc8CdH0C6Nds4qRbVjor6ga2D9XoQaXPdc5tDyGeBHM1J4y8IE4fsI0GA/fwPJl260b52lgRrNFYynF+vfOpXWb0ZFobbIK4Mf+kDvmtabdmLCXlOZR80ULgJ+Vgt0CN8ADtBwaUdun9JwXO2KA+0bVR6oh0HTXHhwfZgelmPAePi+A3ksalBqoyeufyM5BkJD4kdafcckHKFEU7Z4UfFACeVknGPmBPiLoUn7XIZ/lbA8lD0CmChIXdXkHl3ZKdgWhmcq9698sE07uGzVbPXyd2ankueINH8DuW4yLS8rYQUjOeSt3EudODMrLEoAWZWkR0HWh6TJBsQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRtFWu25LXBPVmaWCu/0jIfC+2RmsuiXq1G/vw0odQc=;
 b=iLfS4Yn7dWTvb7VGHbvSyidk28afZVZMXZtX2Jaihb/noVwAtSLG4MU9cCfcAphu6nVe3MuhGMSUo0o7w+0QGZT4DzR/aZj2VkLr+QXlnHsedqX5ZzQhTYuDeOsQYkPzuXWeB7EeHY94lVpMCQsUnrDL85nD+JpA8MNUZ4KeginIV5q61PDGjT7kh3R08JhZU+FMMtZrJxIEHsVjOtj/nhPeFLLwiZAVVKAZhn5Y/Sx1HMi+5SD9WhqmkNLPEu77gl0NdRohDFfT1y6WV7i9eSfANi+gpGwMRDdwHaprREuMRT6B9jGZm00FARrz3YFY5MEmukqB1c99qyH9wxGTvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MW6PR11MB8365.namprd11.prod.outlook.com (2603:10b6:303:240::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 20:30:27 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 20:30:27 +0000
Message-ID: <350cf6ea-6fb4-4790-9998-73d0184cffd7@intel.com>
Date: Fri, 15 Nov 2024 02:00:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] Fix bigjoiner compatibility checks for
 connector modes
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241112163435.1351560-1-jeevan.b@intel.com>
 <20241112163435.1351560-3-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241112163435.1351560-3-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0138.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MW6PR11MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: 876eabb0-3557-4d6e-b85c-08dd04eb2c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qll3dXdYWkFzNHZ0OWpPRGJZZjlmOFAxTE8rNDZVTTJ4YStreHg4dEVJTTRk?=
 =?utf-8?B?aklvVWUzTUFoVnZ3RGF1R3R1SktsUXR0YmRieWIyUDhIeXc0MSt1UjlDc3pB?=
 =?utf-8?B?L3VIaDJrdkl5R2hFL3BIay94RFY0RFpydmdHdk5yVkVjVnBwMU1udkJBcFFT?=
 =?utf-8?B?TnVKRGtPaXdCbXdPT2F1UXR6WDZXMmxLRm5JUkdYcmJZbURuM0JPQzMwbEpj?=
 =?utf-8?B?ck4wbkE4ZTZrN0tEZlBodXhPc2xEQnZaV1Zub3FtaW1xY2kyUC95Um9PSXA1?=
 =?utf-8?B?bE9RYmppRkp4OEZ0TjZOVW1yQWRYS2lTcmRyTklyRlI0WlBCd0tRaGQwNFZm?=
 =?utf-8?B?YWJ1V3FqSkg3b3lIUDVJTlRuUlQwNmhLNWNIRjRJWVh5MG9yNDVIQXF0K2Z3?=
 =?utf-8?B?TWpnZTFDaFM2MjE3Y0x0ejVPd2ZiWHpkdDVCakF1N2gxMStVckVSeCtCM3FV?=
 =?utf-8?B?LzZxYUlDenorNVZmV0N3c1UwR3B3UWhBV0k4RWNvRUpIM2ZYMnJHMnZmSWw2?=
 =?utf-8?B?ZEUwK1JRSFZpUi9WZ01wZW93d2d3NmJBVWs3blZkMjBLOWRRMWlydHlCK1Bw?=
 =?utf-8?B?dXNlNFFlb0d2a2ZSYW1SUXdEcXpSK3lRMHEyQjcxZ0k0MHRFRFBUcS9WRzNZ?=
 =?utf-8?B?RGhqSVBHOTMwZlduOGg0WmtSQmtWZzhCc01ETzliZVJ3eGhJdTlhaW9aVFlY?=
 =?utf-8?B?S2JqZzVxZEY2d1UyTHNNK2FXNEFySTlsS2FncG95aDhKNWQ5SlMzRzh4RUMr?=
 =?utf-8?B?ZkFVRytmWnJQQ2hENFFDMWRyN052UnBjT2laVzkwN21ubVltYzcwQ0tlbVc3?=
 =?utf-8?B?ejhZaEh0VTdZWE8wVjk2S2NqTWhLWEE2Z3FteG50TUx1RUtsRXlueXQ0NVVS?=
 =?utf-8?B?d2szcENtL0p1ZThhNHBuRWh2ZDVZRGJXZWZMa2xhck16OEdKV0FrZXVnKzhl?=
 =?utf-8?B?UnZKb1NwaW9JWjRaMmYrUE5uWUdvVUZaUE5PVEhPcVF2SkNpQUg3RmpRRnJR?=
 =?utf-8?B?dTIyZnhOajczSmh2KzlLbW5LQS9HNm5JYnhrR0pMQWNPZ24xSURKQ2p0ZzV3?=
 =?utf-8?B?T0VxK0orNExTcjQ1Q3VMTFE4UXRTcGtnQm84R0JFL05ZWG1Fa0F6VmZzWWJQ?=
 =?utf-8?B?aGpJL2ROaDNCSzQ2WDNhdWtPOGpSUkJCa3pvblBvamlvcXFMbEhJOW1VUEVZ?=
 =?utf-8?B?YXAxVVRIaExBZmUyaGx5aEVvVEZCUnIwWU9LUi9ZNHdrSy9ZNWZWM0JFVVFk?=
 =?utf-8?B?NkZ0WXVKOU0xSE1HR0d3ME1tL2pUQUIrUFFpLzF2dlhnN1p2dmpIQ0tLTkV3?=
 =?utf-8?B?citOUnR6ajlla0Ivc3hjZ2kwSzhvUmhLNThMUFl3eEhoaElnMnBCUG15MHhF?=
 =?utf-8?B?dmZUL3VmUjFveE9PM0VZMFRSaE5vdXQ4TFkydWV2QkdMeHJ2UnpvV0JVTGJI?=
 =?utf-8?B?R1ltdytUTnZLa0wxcVNONEtac05NV2FMU2NycCtPellJSkJPQkpXa29RVmJS?=
 =?utf-8?B?d0ppaDJleVF3QllHNWRtTUswRGlCTGxPa3l5anlXQ2xVdDNjbnJZa2hLU09i?=
 =?utf-8?B?RGFQNmdZQlYxckhaZVRaVytaRVVxbXgzZWxuZTBjWlJnbWl3VC9ESmxGbktI?=
 =?utf-8?B?OHU3b2NhMnkxQmJOU3Fib0F2OWQvbGM1bHN2Z08yTllZNDBZNGppNkhGblA2?=
 =?utf-8?B?dDV6WHNEUlZ6OHB1T1F6RTZuN2F6anQvTVhONHBhc3FObU9YK3czN1ByUlh3?=
 =?utf-8?Q?+pHdzcEwA09//VGk3A1ZURNoTNR1IuVKogzE0/G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1VHajF4cWovUDBmSEl6czIvVDBRY29Ic0RKQUFyemhQV0xraUp6RXduVm9E?=
 =?utf-8?B?MDNwVXhjTWZIdmo5eC9XekNQREF2SytyVGVOL2lRNTM4WVkxRnMzYk0rWTBV?=
 =?utf-8?B?RXNVcWQzTjVFTytUWHdNQjVxTGRRS1MwM21ZWjQ1dkhxN2ZWUGZzVFMvYWNV?=
 =?utf-8?B?NjMyS29XcWNsQm1wc21iUi8xYUpuTzFhNDhZU3JKRytzYTR4WUhibERHbWxS?=
 =?utf-8?B?bE9XVVhmV2xCbjI1K2Z6UGZycVZLT0o0U2VZQ2FPQjBDMHowRjBONWJJdldU?=
 =?utf-8?B?T1pJcThZdGE5bitqVnp6Q09wNGxwS3hNV0lNNW53OWhpdis1NHFxVEkxU1VM?=
 =?utf-8?B?VkkwZmdxUnlFb1YzcjZaa3lLVy9HdXZvczl4cSttMUdGZVJ0blF3ZUNzOWUv?=
 =?utf-8?B?TFlLbDU5R2VUSCthRGRhMU92eUs0UW1sRnFCMTd6VTVXdlVQZnd4dWNYSzJY?=
 =?utf-8?B?blpRNGxOWERrZ1ZCRk81c1V2QzdaOFNSbnZTeFVYcUVFOFk1dlZMcENkR3lx?=
 =?utf-8?B?aUg4L05NOUpDWTE4eU5VbC9tYml3ZjNmamJtMHJ3RS9OWkJsR1JMM2ZMdXFu?=
 =?utf-8?B?Y1N0MlhjMk5uSzdROVJrVjNKVUIvWEZyWHlsVzUvOVVyOGNWWW5PUjFVc3NI?=
 =?utf-8?B?OHB3RUFRUmZmMjd6clEwY1pTZ2xmNTl3T3p0TVdkaStGRHU1UGIwUWU2Z0t1?=
 =?utf-8?B?ai90Z1dQNG1kK0d6UkIrRWEzdThBZEZIdDFDRTNPNzRhdjBGZm9xaXAyNXo5?=
 =?utf-8?B?bkFqRTUzOXRWeFZXR3pIOFpQU2hyRVJPQ3ZmVmVIR0pEUTRUdHg0blJIdG1m?=
 =?utf-8?B?aHJlY3V3d1lVSTZoampndEZvTWZKenJzMmxVd0o4V09nSkdPTXhPMDg0dDl2?=
 =?utf-8?B?d3VCeG0yRTlGS1ZnazlMc2JES3FIY2NDUCt5SGxlRDl1RUEyOW5GNWVOU2Fq?=
 =?utf-8?B?YUlyeVQrcnVYaytTb0ZWeTk1aTRGTmhwdnFDODc2ZDdrekpqamdOTDBkNW1m?=
 =?utf-8?B?VGMxQ1pDZTlZRkREalh2b25URlFLQURRT1ZheG5YbHBlcUZ6S2FsVUxiQUZZ?=
 =?utf-8?B?ZFdEc1E3TGRMb0xSVmVMNmpmZWVNd2svQytTYU9vbS9IZk1sUnk3M016Q1Fl?=
 =?utf-8?B?dHRUSDNMazMyOGYrZ0l5NnJlS1F2WnRsQ1dTWm1sU2FUUjF6Yk9vK2c1NzFE?=
 =?utf-8?B?SHRHaVF0THdLK0poc1NrVkhLTEVMVm5iMFBiSGN5c0IxdEJhbFFYRWxacTZK?=
 =?utf-8?B?NXZIRExXMFBUbVhUcGxDTjJ5N2lsUnJPbk5ZWHpSOEFBdmFsNTJHUElvRFI0?=
 =?utf-8?B?VFNsSnBESTJjemRTR25QZ0ZBOHNxd2RUVDNvc1pNZSs0VFpsUVZFVTlscHND?=
 =?utf-8?B?ejg2VXBpTk5ZeUltMU9zanZwWnIzVXM2VjNBYWhnOGxDeitUNzRWUTZCWGNO?=
 =?utf-8?B?RFZCRm1uZ214RFJ1aEI1NG5jdUtDNk1YUEcxMHRXWnFLK0dMUmpQcG1xa2Yw?=
 =?utf-8?B?MGQ0WHVYT2orblFZNDZPQUtySVZ1aVVCV3MwWlFEMmc3SW1GUFVwUVdoclQz?=
 =?utf-8?B?U0Vob0dDTTZPV0Y1ck1TeHRhWkhRMTdJOG9zam5zc0RnNzd1b0V3UElPc3Bh?=
 =?utf-8?B?WEx4cm91NDh3NUg1SjlBeHdQeDRzOWdxMUhiTWJvRGVralJsL3BLR2FiYjNz?=
 =?utf-8?B?ZEtRN0JUSEcweW11WDhrN29qNWxVandiWkNwYWlrcUZia0g2QkpVQzFqdHdR?=
 =?utf-8?B?T09rd2R5bG1wQWlEODQ1bTZlMEx4MEpia0FOWWJtYXlDRTNQZUI1L2QxTXpy?=
 =?utf-8?B?djRac081bmNHV09xQWg0RzZKZTNwNUszWHpNSS9KWXNsVkVWdys3cVZLNGJj?=
 =?utf-8?B?L29OdVdVUjlwMDBmQWYwMzVnUklzUE92VlRpY2I4YWhiTnhyeDhZWmZYeHpk?=
 =?utf-8?B?TGdoelo3eW13SzFxMzhDQWQyb3FFbUoyeVRQU3B6enFsRnJ4RnBWc3J6VEp1?=
 =?utf-8?B?UWx3aU54a2ZmWUhZTEN0V28xYW1MdDJ0SkRVb3hjOHdyc3N3RHVzakZkaXJQ?=
 =?utf-8?B?cHVXQkZDbXFHWlkvNE80ZjZGdk8xQ3YrdkZiazJrazl5b0xtdHEvTmloeUFi?=
 =?utf-8?B?Y0NQMGVXVGlCRFpOdkFQRnBsMnZoandlU2lsc0J6WHE0bUJraFpnZzczdXJ4?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 876eabb0-3557-4d6e-b85c-08dd04eb2c97
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 20:30:27.1563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPUVVyX4UryXM0mkbHSyotDFeqzfdqbG0x0QJQQ0VENzauxO+vrkUbW74vgGI+cViiDD8sJyktNTELShxP2KSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8365
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

Hi Jeevan,

On 12-11-2024 10:04 pm, Jeevan B wrote:
> fix bigjoiner compatibility checks by adding drm_fd argument.
> added unsupported config checks for bigjoiner modes in display tests.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_lpsp.c | 4 ++--
>   tests/kms_display_modes.c | 6 ++++++
>   tests/kms_flip.c          | 4 ++--
>   tests/kms_setmode.c       | 4 ++--
>   4 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index 889da42de..74e9d799a 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -166,11 +166,11 @@ static bool test_constraint(data_t *data)
>   	if (igt_check_force_joiner_status(data->drm_fd, data->output->name))
>   		return false;
>   
> -	if (igt_bigjoiner_possible(mode, max_dotclock)) {
> +	if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock)) {
>   		for_each_connector_mode(data->output) {
>   			mode = &data->output->config.connector->modes[j__];
>   
> -			if (igt_bigjoiner_possible(mode, max_dotclock))
> +			if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock))
>   				continue;
>   
>   			igt_output_override_mode(data->output, mode);
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index f1d8ab03d..0950cc483 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -318,6 +318,12 @@ igt_main
>   		igt_display_require_output(&data.display);
>   
>   		for_each_connected_output(&data.display, output) {
> +			drmModeConnector *connector = output->config.connector;
> +			drmModeModeInfo mode;
> +			int max_dotclock = igt_get_max_dotclock(data.drm_fd);
> +
> +			igt_require_f(!bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode),
> +				      "Big Joiner Connector Found Unsupported Config\n");
In this patch, changes related to drm_fd should only come,
above change should come as a separate patch.
>   			data.mst_output[count++] = output;
>   			if (output_is_dp_mst(&data, output, dp_mst_outputs))
>   				dp_mst_outputs++;
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index cbabbe74f..17da10e2e 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1756,11 +1756,11 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>   				 o->kconnector[i - 1]->connector_type_id);
>   
>   		if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
> -		      igt_bigjoiner_possible(&o->kmode[i], max_dotclock)) &&
> +		      igt_bigjoiner_possible(drm_fd, &o->kmode[i], max_dotclock)) &&
>   		     ((crtc_idxs[i] >= (total_crtcs - 1)) ||
>   		      ((i < (crtc_count - 1)) && (abs(crtc_idxs[i + 1] - crtc_idxs[i]) <= 1)))) ||
>   		    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
> -				 igt_bigjoiner_possible(&o->kmode[i - 1], max_dotclock)) &&
> +				 igt_bigjoiner_possible(drm_fd, &o->kmode[i - 1], max_dotclock)) &&
>   		     (abs(crtc_idxs[i] - crtc_idxs[i - 1]) <= 1))) {
>   
>   			igt_debug("Combo: %s is not possible with selected mode(s).\n", test_name);
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index bc7b8fabb..d61cfeb9a 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -736,11 +736,11 @@ static void test_one_combination(const struct test_config *tconf,
>   			 *   - current & previous crtcs are consecutive
>   			 */
>   			if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
> -			      igt_bigjoiner_possible(&crtc->mode, max_dotclock)) &&
> +			      igt_bigjoiner_possible(drm_fd, &crtc->mode, max_dotclock)) &&
>   			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
>   			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
>   			    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
> -					 igt_bigjoiner_possible(&crtc[i - 1].mode, max_dotclock)) &&
> +					 igt_bigjoiner_possible(drm_fd, &crtc[i - 1].mode, max_dotclock)) &&
>   			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
>   				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
>   				goto out;
