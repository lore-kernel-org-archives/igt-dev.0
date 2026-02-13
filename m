Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32B9EF48DB
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 07:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479B710E79D;
	Fri, 13 Feb 2026 07:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ifb6vJJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F69E10E79C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 07:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770966532; x=1802502532;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gOwKRQeRQtPs1vDBXEBaB/LXmNi1Xg3clfnozQ0ziS8=;
 b=Ifb6vJJ3cNzzESadzKO34mPkL1ubfTVWfuXY4TeHMNryt+mJfrQZxtbS
 65ztmVlZsmdkikfaNN0WMeJjK4bK9WAV78T8RpOxhoYqeCx/C/ahVkb0I
 hlY3pjs/zCccrowUYfV+ffflPJ8mi10Ki26bNN0va8DhufJeyyeDkhfjI
 yLpnPuLt1+5amXLaVc/I+CVIBUJZYPfBnx6mfeqpLH7g1XPPQQwPYB4ax
 yuufZVmUcYrhej79fAJlN1j112CGRWcZloLa9AMlAWvGbgRwgJhlgdXXP
 riQyllr+iMzX6GWnnqjbopCAKAEyjhdsj9GPCUfEWUQt46sx2H5qPho6i g==;
X-CSE-ConnectionGUID: USvy7HczTSC8Fp9IBoqhzQ==
X-CSE-MsgGUID: s6TOiCJuS9eyrqUKBOuXmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71348321"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="71348321"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 23:08:52 -0800
X-CSE-ConnectionGUID: xrRqbnrzTiaTn9+6AeoTGA==
X-CSE-MsgGUID: 5oUu/S7ART6dwIU5z8mflg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212682775"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 23:08:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 23:08:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 23:08:50 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 23:08:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAIFZMficmESxNmZtVUlZHhMEtRXaSOMc79MrggTmbZ0T/NDRFBZPprK8yOtfQ+qBQdXAVUoY6MrzC8ouYsLquWEUt4TlX9EHt6XiBcq50Xo+s2PJ29+lZN9L684RLE0vvXEJQL6BvX6kiHYqKBv4xNMhFObFd2xjsVTWVzf673hbenxQkR3uvUSmc/5VhY+0NR/veyLKEflzqe/cT3/Z7GrrMo0/Gf4RpWff9BGIpHe8EFTzrdzVqJH49QMOhWwc1cuzPj5bFTLh4ZwulGXy2qvqDYKXSVMBGgeUTUpr2/Lfz3D/epRTM4OsVLZpM3F9EeSHfeMsGkz+0Kgt/sv2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgzS3sABVcWq9qTQNUehlsYBnphcD0Naw04M+lWsHUk=;
 b=EMNbYqq8ZhYizO8HolUgLV3nc5JPJp0lbSkvZbcusXDgefR6RZmxj7DeVy+yGUk9jg+pLbg6FHaxGweS0PNRttr+keGl6dFe9PDGmH72ut4J0PkhzCC6ZSCQ59xEteKgacTBh0hfhY1YmRTD14GylF86pOLb/sAaspnMIa0FzA9VGKarnHfRsJ9TYHEzhDeOx4CFogBuX9Tm+aIIzNGfta01iCjW6RhWrk6ZUYxnIvDej5vutLerFOyhV+zKhK8HyaPWpnTrDQNoKxj2YyXtR1pYc+h+1vowTWnx6P83ndiWJEmcFxjJH1yCMkq5SoTK1U5rh8eXOI9DK+O0vamLQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB7110.namprd11.prod.outlook.com (2603:10b6:806:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 07:08:41 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 07:08:41 +0000
Message-ID: <bcfaa59c-d085-4796-a3fd-0bd31de687d2@intel.com>
Date: Fri, 13 Feb 2026 12:38:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 0/9] Add writeback changes for intel-supported
 formats
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "S, Sowmiya"
 <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20260204171819.292327-1-sowmiya.s@intel.com>
 <edac5f23-8a49-4594-adeb-367ace502dbf@intel.com>
 <DM3PPF208195D8DC7E8F714D7B83D39BA4CE365A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <DM3PPF208195D8DC7E8F714D7B83D39BA4CE365A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0196.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::10) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: e796bcb2-af1c-4819-4930-08de6aceb7a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUpGdVppV0V0SGFReXRzNjgvc1VhbnlGb1llQUtlaEsrS29TcGUySUU2Qm9E?=
 =?utf-8?B?UUVXQXZvSy9JK3ZwN2hGODFSTHJGK2lGYmNRaXN0d2JNekJCVFI4VHFwc1Ri?=
 =?utf-8?B?RVBsUkcrZWtMQ0xrUERjZ0hkbnNrWi9ERzlpdDRtdEplSko5bElJa0RPczNS?=
 =?utf-8?B?SklPZGhLdXA2SlRFUTBzMU5jVEIrN21WMjJ3TE5EV1V5T0pzL1MvbnRXdFR3?=
 =?utf-8?B?VUVLY2cwUThHOVhXbWQ2U0pzN0tYK2NLMVJPQWJjMlE1SmlJQ0FOVlloNHRR?=
 =?utf-8?B?WEQ5ZUUzY2tJYm91NXRQaE0waEtINW1MaVMzejJRV0plcUZoVWdXSmxXeVg3?=
 =?utf-8?B?SmQ5VE02OFNmYkgzMk5hVm95MGxjK3Bjb1ZrK3kyTW1Qd3RUV3dvMWdHQzRW?=
 =?utf-8?B?ejdEY3EzK3FZbDN4T1lJbWl5SEwrd0hqVm1DeWVjQUN5ZzhaVXVxcWhmaUJ1?=
 =?utf-8?B?c0xuQW5uekY5SHZuRjFtdDlodVVoQ0xWcFowTnNvV2VocEI2eW16YWpybkRv?=
 =?utf-8?B?K2VBa0hsd0RncWVOOFZua1N3c0pOODFDN3k1dm5uM0l2UVd2TEJvMGRzYjhV?=
 =?utf-8?B?L2l0SUtST3M4eHFuK21GSjVsRkZUUU1YaUFPWVo1bWNmenYrOHVCK1RTNGlG?=
 =?utf-8?B?TFdWNzd4eVRhR3VXMVlGczU3WU5CMXdFL2lWVmgvVlR4Qlk1Z2JQd2ZJbkQr?=
 =?utf-8?B?akFoNndSWkVneTBvSG1kWnVyNjZ2RHFzVUp5YTJRajhYLysxUHZ5N1RtQmpK?=
 =?utf-8?B?ajJ0dExFSmNQZnROUG1Xd0RpVGt1NnVVVU83UkFGYUVWc3MxWlllaDRlSC9i?=
 =?utf-8?B?N0M4a0hLV3BkcDR4RjdUNFdYV1BFc3ZlRFhHcWhXQ1JpK2RJdVdiRTkvVE55?=
 =?utf-8?B?TFNHZEdtYy94N2NQQVA4OXUreGhsUFlvc25JWGl0Y3c1dkxTbVN4SEVYeEhY?=
 =?utf-8?B?UThVdTZINXVWbWJKSS90MzlOaDdUTlQrZW0xYXJMMFA5dnlXejNpbldORTNX?=
 =?utf-8?B?QS9lUC9WTjg4U3cwVUxHb0ZkdEllbEtTY0dWNm8zb3pHRjZaWkZhcFdhd280?=
 =?utf-8?B?emdMM0R0T2lJdlJWbGoxKzM3dzFsbkloam1XdnBBZjlYR3JOaXU5WXJSYmhh?=
 =?utf-8?B?VlF5Mjd5Zkw1Q3FCV2F4S2R2dCtJWlFLeGxvS1UwYVpKM1M3RDYxYkt2TzI0?=
 =?utf-8?B?OGQrb0N3L0pMUlpZR3lpT3M5VkQzWlpyMW8vUGJrMFVrTWRsN29YL0EwNVhx?=
 =?utf-8?B?MVpJN3VKcE5kTlBLSWNWcDVWMEd0alBMekU0cnQxSEg2M3NETy80QXpRN0JN?=
 =?utf-8?B?Mkx6MGdIZFBZb3U4Z1VtSGVBS0llc3UzWmVCVXFtdGVYelpCN1pxK296UjYx?=
 =?utf-8?B?MFhFU0R2ZWdWZFlGWW0rZlUzMFd4WmZHMHlpSVQ5N2ErenF4ZVFoZGYzODR0?=
 =?utf-8?B?L3NQREtKdWVFS1JYK1E2Y3lJbHh3M3VBeXFBSmZzVndmSjF0ek1Eb1VnVFpV?=
 =?utf-8?B?K2lIbUdoWTdPZzUvTlgrKzFsanpsOHJGeHZrUWM5R0JtR01ISFMzOEZBZ2pY?=
 =?utf-8?B?cjVvYStQV0RKUy9ZVzExWDhPREVEa21pdHV6SGJsZWZlbitzdVRTT2NQSEJo?=
 =?utf-8?B?a2UvSHdlbEh1NDdUTGg4d0RCMzBkVWVMb2NxQUE4MkpKWVp6ZHd0T1pGczA0?=
 =?utf-8?B?cFdmTFhGSyt3bGEyV2ZXUGFtdlhPNWp4alZhN1JBTXVibnN0b0N0Q3BKU01F?=
 =?utf-8?B?VXVaL2dIUnBBOHdBZVF2R1dOTDVRdHlJanN5ZTA4b3EwMTNtQkZZd1hBUjl1?=
 =?utf-8?B?Wm9OUHBBdDZNM3RWR3UwRjN1eEZFYVM5K3h4NUdnSGczZjArbmlQV0R2U2I5?=
 =?utf-8?B?U08vcDNsOW1nMDdpVnlvY3g3ODlPTGxTdVJCOS9EQXF4UjhlT2Rhd3BydUJk?=
 =?utf-8?B?L0x5NUcvMmRjVUQ2bnVjb0FadDEwMEF1V1VZSk1weWxxMHRxMU1xKzFUdWFt?=
 =?utf-8?B?VklHYXdRZGpER1RUY1dPWmoyOG15KytlUHJ1NzE1SGdsTkpxL3ZWMmh6NzB6?=
 =?utf-8?B?OXFsc2xPT0VVWDJLTE1PM213dTZITnFKUGp4eXJaSFNDdmhUZVF6NmF4cmtV?=
 =?utf-8?Q?nP7Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3JUOC9ZUnVkUW5ydWxROFJJaU5kdTM5aFNGZEJUbDl2ZWVKQXFiWWl0Zmxi?=
 =?utf-8?B?cGdzbDBpS0E0YUlES3NLZFVnZ2R6K2VlRERGeG9kQlZVSTJYeGR1d1pVZVVR?=
 =?utf-8?B?eGxVTU1IaDJldno1bDdpb1k1MW50dk5xQkY2N0VpNG5WNFFHdS9lNitFVS9n?=
 =?utf-8?B?MzVNbXVQTHFac0JNMTF2VG03YjJsaTJuUWRITTZkeWJmdFVXUzF4ZEhsWHR0?=
 =?utf-8?B?cEd5SmxEZWQ3ZDhhZkx2SXZZNWNudWx2ZXN4Y2NDakI5T1Y0ZmpFU3F5MjVV?=
 =?utf-8?B?cjJYUFZiUDY1WXVqakwzenNoM1NIZ1pFQXhyMDVFTDRiMHViVWhPbXNnZmlV?=
 =?utf-8?B?VlI0Wkw4RnEzcThMMWlsdk5BdHB1djN0VHcyUjlFNFI2LzVQK213SWhzUXJD?=
 =?utf-8?B?WHNMeVhMMUhRSjVrQ3MyaGxRNnFBcHIyTyttbkl6aW5sNTJnZEV0VGY1R0h3?=
 =?utf-8?B?b2xqZFRHaUZtcWJTMnVkOU45MmFCbVZ6YWcwZHNpSWJScVE2SlJoS1FSUW13?=
 =?utf-8?B?dDdYRVAxWExHcC9lbGFYajg1Mnh4SmxWY2t5RytjUTdIRE05VTFvN1NLUktQ?=
 =?utf-8?B?bXYwd0R0TmtMNGFQN21vNVRKZFRUV0Jxc1ZwM04vUFh6WStDN01jL0d2dnRz?=
 =?utf-8?B?UnZiZ283SEdlemt4cGhldThyTjZYNk5hdU1RUk5yZVM3OXN6OUhoZGp4WEJs?=
 =?utf-8?B?R1cxUkxmckw2L285RENVZGdxdk9LamxyOFJmWWhEQlNmRk9uWVVlU1VOd0FB?=
 =?utf-8?B?QUpqKzZZeXZURjZOQnBwYjBPQVFXWDZseFNjSlo2RDJ6dTF0eTNXdC83UFF1?=
 =?utf-8?B?QlVJZzlTYnFLbmM0QjlkbDNoaG1wbjVQMEY0L084Z2xaVVVxOUQ1RUVPalJm?=
 =?utf-8?B?L05pYXAzWXBhTzJhNlBjemExc0ZDVkRRVkpScmlvY2Y2eCtKSnpBaFB5L1NQ?=
 =?utf-8?B?bmRPUWZ3enM0R0g5TFA5aFEwMkd4bTY3S09rSVpJalVqQ2cyVXVRZlI4K0ZL?=
 =?utf-8?B?c0xSOEt3Y21QZnhxYkIzVTVkaHdOSWNKY0ZpTC81SUIrZ3ZMZEtUZ2NNM1dX?=
 =?utf-8?B?THZxdXVFemUxM0NoU20zOTVkQjhZbFFFaVd3Vis4RDlVQnMyVDdMVHRCaHdJ?=
 =?utf-8?B?YnQ0OWZNbHFTbUhsbEpyTXhnMWREdWo1dE02NmhidCtnRHNvck1vTFljZHhT?=
 =?utf-8?B?NlgrM2ozekFGWXE2MEhPWEIyS0RZNXJBVFFjL09VNHJ0UHRZWHdJTjM3MVFH?=
 =?utf-8?B?cmFZdXZhUWxZZDFQWFpQaEdkZmNManBOeXF5TE90SnRub21idnBnOUtERDRv?=
 =?utf-8?B?Y01idlpoVjV6NWlMcFdIVWZFUXdjbWlmR0tLZTRUMStvOElsM1ViU0hMbWtu?=
 =?utf-8?B?ZVZnYWhRWnRWeHJIRzZkREJxSHJvVDB4OHR4eXN2d3ZZTFhYdW5zcW1yeGxr?=
 =?utf-8?B?L3N5RzdvZzd0ZU42enJVTFlXQVlkYys5MWZmd3lpNk9rMFErSXoreU15Q2x6?=
 =?utf-8?B?RU5Tb205SExza05RZndaTWRhR0dXU2U2RmpHRnFVM3lqclRyWmExNUpKYm56?=
 =?utf-8?B?RHJOcitXeENrSjBjMWcvYkRZK3RsZzEvbTQ0M2wrMkdwSkRhY0poTmlLNTcz?=
 =?utf-8?B?NFZScE95MlNrTzc1OTd2WTZWa1ppTHh3K1pkLzZlUW83UFdVcVpnQWVVUzV4?=
 =?utf-8?B?SWI5UHpFMWQ0K0lQQVcyUXpjcDc5Zjh3WkJJL05leHFDK2xHUE9IS2FHUjFF?=
 =?utf-8?B?R3RQcVRIb2dHU0tDWnpiZXFTTW9hanlIRGd4SkV2UFJVMHh2dVo3d2ttd0VG?=
 =?utf-8?B?YVg0bFNiTlowVXA2K3lPc2hUc2FQT3U1L2hTRW1oMHRNK0RKaTV2Smt4eFhp?=
 =?utf-8?B?VXNVNHpIQnpzMnBMUlVuVFdlSHNyQjlRSkZkZGx0NE5qWUFVdFhXNjl5dWxj?=
 =?utf-8?B?cHBLYjhyTTNoU0lvQzhrNzRoalhiaEFDaE1qOWRPb0tOVmsvRExsMHd2Risw?=
 =?utf-8?B?cTBaTlFza0I0TE5wbjN4c01BNW11ZEhBUTdKaTh4VkF1d1A1OGhjYVBpUlJ2?=
 =?utf-8?B?TEdtbHJUZURJZW5sQVcwQUV0RkQrT2NxTXNoeFlrOEdNUmIwMUFOeW9jK2Nu?=
 =?utf-8?B?MlZDOUVMT0dTbFNaSVJqTGpDMG1BWjBBeDQ1ZFBCV3QreGVCem54RGJTVUNu?=
 =?utf-8?B?dTBWazBiNTl4aUVKV2hZS2JuS29sWUpuOUFqTVJDcWdjb0x5RTVPdVl5RGNm?=
 =?utf-8?B?ZXNFZmxZYysvT3VZZCtNL0Y2UFhnanpFWkFORFZnc3RVajRHUUkwUXdPeWFh?=
 =?utf-8?B?UVJsMDJYZjQ1VkFZWmdaZjhvcWlCM2hyS2hQb1lPWEhjYk9UMHovUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e796bcb2-af1c-4819-4930-08de6aceb7a1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 07:08:41.5402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViXovVqDXsfOLWNGlhYcAiz9nAkan0jA5L/8aS91tzA4f8C6W1dc2n34Up/ptmBPWcBCr4IYVbK5cOdN/0Lodg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7110
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

On 2/9/2026 2:04 PM, Kandpal, Suraj wrote:
>> Subject: Re: [PATCH i-g-t v8 0/9] Add writeback changes for intel-supported
>> formats
>>
>> Hi Sowmiya,
>>
>> Could you please add a patch in this series to unblocklist kms_writeback on CI,
>> so that we get the results for this subtest before merging this series.
>>
> Currently all tests will skip since our kernel still does not have support

Then IMHO, its better we hold the series merge until we've kernel 
patches ready as we don't get any value with this currently.

We can get this merged (together with the unblocklist patch added) to 
get some premerge results, when we're close to the merge of the kernel 
series.

Thanks and Regards,
Karthik.B.S
>
> Regards,
> Suraj Kandpal
>
>> Thanks and Regards,
>> Karthik.B.S
>>
>> On 2/4/2026 10:48 PM, Sowmiya S wrote:
>>> This series introduces validation for writeback functionality across
>>> newly supported formats specific to Intel platforms.
>>> existing functions with limited format support were retained for
>>> compatibility. After validating new formats introduced by the
>>> platform, additional format support was added to the writeback test
>>> suite. Subtests leveraging common framebuffer creation logic were
>>> consolidated and dynamic subtest generation was implemented to
>>> efficiently handle format-specific variations.
>>> Add negative test cases to validate format and mode.Refactored
>>> existing test cases to improve efficiency.Add helper function to get
>>> the default format.
>>>
>>>    lib/igt_fb.c          |  39 +++++++-
>>>    lib/igt_fb.h          |   1 +
>>>    tests/kms_writeback.c | 211 +++++++++++++++++++++++++-----------------
>>>    3 files changed, 162 insertions(+), 89 deletions(-)
>>>
