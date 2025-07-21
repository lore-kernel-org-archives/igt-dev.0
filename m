Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B37AC83F25
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 13:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E194310E280;
	Mon, 21 Jul 2025 13:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W2qniiXV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0C010E280
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753104763; x=1784640763;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l0Xqe0hGdvN9nkM4QmlJXWt3+iD2f9we9bm+TcB4FsE=;
 b=W2qniiXVJn7Uasmya0DtLxwc06HDn2hdZKpL1mWiZMhY3ZdRY/pxvgNA
 E8irjtvQAVD9L7hE/zX7nCX4vZrxpMXq6NgGZzc8WY94ufkj4zfx4T2gL
 3MsUY23QOzG5Ff45NEHBHUigHEs4id5zuP5fUAAHT7NK9NYRJRDhli+4w
 Dt7anHxr13Q2Pr/NRorOpa/rETh4c8hRyCj09EQi5DZV5ZG+VzSMkkDYV
 +m+ZniRrsSMVDr/8coAN0EjDHUdUdpz6hROZIlTXcSCTiTd60oPvAN8aF
 +JF9IAtihf+d7odw/wrDywC8YS+DM+yCGFXoqs3JJawXwcZdrMOBLC3N2 Q==;
X-CSE-ConnectionGUID: HWAKiMDmReOsF872FwhDow==
X-CSE-MsgGUID: DLhP+SYtTWavRT8XKKlBFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="58979531"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="58979531"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 06:32:43 -0700
X-CSE-ConnectionGUID: YR0sjXxDSoqCmtsoXfr95A==
X-CSE-MsgGUID: fA8nT/PySBWXmgifGtBZCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="164329084"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 06:32:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 06:32:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 06:32:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.55)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 06:32:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kC7oRIc8a8J4yEQY3OPzsTx1S88d9rM/pFA7GYViXpabOXry4SnPQA7PRkJwpzS57a2i0rrcXNNwNHkdRF3xe3FYrz97YRAaEDa3e9X0wcipMoYiaLlM6Uw7+QuJnJ8qWI50zqJqlB2Djv0SjvjjKsjC5qz1ficXsr1IEUk8n2aI+hUxZsBp7oa1j3XdyJSShW49fStzUte2z7toVQMUwwJEA061OwjjatBB+pLfCdGrp9qmr/Sn394IvALv2ZDzitpFJvxFjMpDh/1A05nhABLUMXTtmDiBbpWy1S2go9hCNoQPmLpDS/BP8iY/kC53RugL/MnoW7wOoS9Y4zPgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUyZN4dvUNZyq1tCIR5Tx+N4fvriompgJiovoL+0Fpg=;
 b=E0N+rbfej2M7je6OlEORotQr0OGP4GKBCtwiOLaQEUavMJJno2Q9tNfu8H0REgV8jaP8x7fazp8VUOKtgSIPv6kgn87pA+CL4GmzSBuvPwHHPCsHD/Xo8XfuI2UWXTLuISx6Y7s04+LKLyEfowoZ2YjG1z0BZJEa90ihILtGmNRs7iN68s4Kgn+NZJht4tP0JO5qhtgbAB+TZColzz3QUGjy7MFr15MMm09mB586gY0kfECvxrd3LQDR9uUPI4quxHzO3r/wk+y/4arwnut5879AcgR5IMue/JIJ5I3bAn3jWRGU1NRGUKZfBSm81uFowpnt+ZuJxJgs/ubAXYad+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MW4PR11MB7008.namprd11.prod.outlook.com (2603:10b6:303:227::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 21 Jul
 2025 13:32:39 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 13:32:39 +0000
Message-ID: <845729e3-bd73-4b8e-8f61-66bfbd6950bc@intel.com>
Date: Mon, 21 Jul 2025 19:02:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tools/intel_dp_compliance: Enabling XE driver
 support
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <khaled.almahallawy@intel.com>,
 <jeevaka.badrappan@intel.com>, <kamil.konieczny@intel.com>
References: <20250711065645.3074530-1-disantkumar.isvarbhai.mistry@intel.com>
 <aHEgUdUwMW_xfUWJ@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <aHEgUdUwMW_xfUWJ@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MW4PR11MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: c7bd0cb7-392a-44d0-e1e8-08ddc85b0f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3VaY2dNbkw2aVdXbU1BNjFDeFB5a0lHWFQwQXo1bTZIbkRaQ0dTc281Mkpr?=
 =?utf-8?B?UE8vbGgxSXZ5aUhMZHBjZUtpMTlHWGtkUXMyalJqY0dGVkMrTXFVa3hqNzJx?=
 =?utf-8?B?Q3NUejZoZDZuUnJuZDB2c3NYRTdweGNJK0NxZDl2bmQyWWY1R21RZi9aN1lT?=
 =?utf-8?B?UEtGMDFKViszd3R6UXZWeWlZWkt4NGNMTHFNSnkrWis4eTcrZ0RaZU9kRlhE?=
 =?utf-8?B?NDR1aVhZeGVuYWYxbklMRm13bTU2MU12b2MxUEhHZ1ZGSEVBTlc3RE1KdXd6?=
 =?utf-8?B?N0czSjdDVW9MdklibEtpRi81WkZwNUFmandKbmFqamxHRTl1ZDM1WU9oMFNu?=
 =?utf-8?B?SjZSVHI1S0pxb2lxYzRXbldzYXQ2aWQrWU5IS3dlOFBJdklkZlN6d3p2ek9p?=
 =?utf-8?B?bW1RTjdMS3pTY0w0OXo3Zmt5V2ZESitvYVY4S24rTkI2WnYrK3BaQTdZSlZq?=
 =?utf-8?B?SFExaTh3dGxaOVAyUWpiSjhyUWM3Tit4cXpPVXdqOGMxYXhCYXVQNno2bmF1?=
 =?utf-8?B?amI1VTBWK1QwMC9zbmkveFA0ZWtDRWZRN0htUjE5SmlscS80NEEwcGR6S2xY?=
 =?utf-8?B?a3hKam5HNk1abVlBWGNoR1k1aXVVam44VUtlWHJ2QmF1aG1NNmZQTXNZbHRF?=
 =?utf-8?B?Ujh3TU5Uakl6dTEzVGJBY3RaSER6WWIxeHdxa054dzYzK2pjSjlhZW5BMnJU?=
 =?utf-8?B?bkR5UHpockN1WEJUMG9RdGVoWjN5TlIzaVRaSFltOTZiR3FUK0diOXZreE0v?=
 =?utf-8?B?cDJRMjNFVUR4TDljSEU4TGpyeThrVFhQdUhQaSt6d2NCeGJvem45eUxkUkZn?=
 =?utf-8?B?cUU5SWFMWDY3bEtnTTIvaW5FNmdFQlFLb2ErcStJRllHbnM5T3F0QnZPTjJD?=
 =?utf-8?B?M1drM3g4am9VVk83N1llc2VNMUJicmFXeDlQVm1zYStCZWttMk5YOTc3Ykxr?=
 =?utf-8?B?R3BpdzhSdXJ3N2paTSsyZUtnT3ZpNDd6ZzVXSVp2TTg1K09TbUNSVUZHSkNI?=
 =?utf-8?B?YVdDQWRxODhSWW04SWlSME1sZXZ6MVozMzN1ZmtmWlQrQUhFTXlYSTZiWmZ3?=
 =?utf-8?B?MTlzUjNEUTNPMlp5aEN3WXJDTGVuZVM1WWFLTnhtQy9LaFdLdmpTUDF2aC9a?=
 =?utf-8?B?bEVEMnhtbWUrVk5XN1c3dmx3bXpwWmNaaUFHVEFQRkVSa2piRk5tTXZOb2tl?=
 =?utf-8?B?YWVwQXU5RG9xeUQ3TW5DTitRem9BdXY1VFlXbHBUbFg1bjFvNW8rVTJEd2kr?=
 =?utf-8?B?UStYQWVzMTVWTm5SSWRHY1o4b0ZzUEFzNUFENXJGV0MwZUthaXJpT21LWTJ5?=
 =?utf-8?B?OEttY1FnN1F3TUlBelpYRUY0bUwwR1VaREQrTytkQlpPWkNreUFmNDZ6MnBY?=
 =?utf-8?B?RG05WnYyOUdaODdURGhUa3o2TXIzMzhJbjZHZHVxelIvR0hZUmtXV2taeXhL?=
 =?utf-8?B?aTV6dTBqQklNWDFvRWlnZXNZVjRwUW9HT0hTSllHL1NiQzRVQWZPYlRYd29J?=
 =?utf-8?B?bUlFLzdza3VxdnRVMnkxOWRQSmxXWGpvcDN1WXhrd3FYb01xS1VDWCtBS0VK?=
 =?utf-8?B?NERSQ3lLdDNzcHFYTFE2eGZtOFFBOUVycW10eSsxZXR3NzNjVHZCTldRTkFW?=
 =?utf-8?B?M0hZa3lxOWxLZXA4SkZyNFRQZU5JUFJZVjVVb2htZzVZK0pvaHVIN0pKSlRO?=
 =?utf-8?B?ZXpTY3dPVG5ZcE1wdnJYeitUN3N0SWllclNNMjhzdnNNZ3Mwa3c4MkRXNkR0?=
 =?utf-8?B?ZmFMYXMwVU1PNFA0TDBack1ZbEp0SWlpNERGeHkwSzN1aHRJcFVDRHR5YnFL?=
 =?utf-8?Q?YZrMCDHbkaXUeO/Vjy6E3rR7qKQMKmw9ym+QY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1RWaldiMkp6VW5DaXlOQzFxbGFLU2NpVlhGbUNKaCs5Ny9JR2dJaWVHeEw5?=
 =?utf-8?B?cFRjMEljZzd2TUk2N21EZURwTEVIMGNMcnVJb2NINzRJT0cvNUptZmZUNkpi?=
 =?utf-8?B?am5VM0FuT0tVUEtoV0hxKzBCS0ZWZ2hOYi9QdmVqYkdkSjRiVnJUVThVWGZ5?=
 =?utf-8?B?RFpYVXlwVEhnUEE0WGdNZ2kzaGJEODFGc1dQK1g2Wk5PYk00ZThWbW5rTENP?=
 =?utf-8?B?Wk1BaWFLK0xzdkNaSW5jNUNiZGVvOE42MnM0eW1sNmg3WUsrNk9tWUlIdHdj?=
 =?utf-8?B?RGxQdVZRVFpDdExXbjd1dklxdDg3dUJDaHVVMXZRMWM5ZERUY0R6eFhqY3p2?=
 =?utf-8?B?bDkzK0VlczVhNXZkV0ZLN3RTZ2o3RUlTSzQwNkY3U01uOUpjU255aWt3VEZy?=
 =?utf-8?B?VkpqdnNZZlJEdjFDY2lCL0c4YkNFSzFnV2R5Tm53UmVXOFVYTVRzZ29sb1NG?=
 =?utf-8?B?R1pBUzNHSk45SmVpQ1h5akdvQTQyNUhic3F5eUV0ZGxPUUw5c0JQZW9sc3U0?=
 =?utf-8?B?NVNaMnlJY05oTDlsL2dOK0oySFZBU1JsU1FMN01zcHVXUmNOdUxHOGF4amR5?=
 =?utf-8?B?bzZuRExFVmM2cm5CR2xiTThrWTFma09rTUdibW52ZVBTMEhHNjdtd2piSlFp?=
 =?utf-8?B?amZnM1QvV3p0RmluajlvRUZDUFo2dGlubG1LL3JmNEZzMkUwVG9HMFIwKzlz?=
 =?utf-8?B?MmxHOXg4akpLenYyQ2cxZWkrekc4M3A5QWJWaUovM0F2b0xTKzFsdGpudWdW?=
 =?utf-8?B?YkNsTklwa01NZkwwQ0YrM3NXQ0FOODBZWXlUZmpkenlsREx5VHZnZjVvUFNM?=
 =?utf-8?B?V1lJQmdqNG8vdHh2Qjd3eGhHSE9KamNLUWM2U1AvZ3AveEFhWHJtditnOTBU?=
 =?utf-8?B?Z1hxemsvS2htS3VoV0F0dDdxTG14QVhMQlN2STVwL09KUnhCVzV1QzB4d2g1?=
 =?utf-8?B?V3lLMzVzWkZWZnNjK09yMEowYVRBSkhYOUpoaHJjOVdaV2tkYzQzek40czVQ?=
 =?utf-8?B?c0laQlYxeHdlNjBNVElXVGtxOFBEL3Z2eXdVM2JIKzdBYkhXNE9BSnFuVVBx?=
 =?utf-8?B?dHpEcmpFVk5NVS9ZUXRCK1R2Y2JoemZOOFNBcDJWNkxjcEdPaUdkVmt3bjVj?=
 =?utf-8?B?akNadk10RzN5WmlVRmZkc0JLN014OUFpbVYzUEl6NzROYlgrUmlWWmxRVnRs?=
 =?utf-8?B?MHpmNHFaM1hvSnM3MlpkZkxiTlIydU4yWjdyQ2tlV0VGZTBTK3RhL2VrSTlk?=
 =?utf-8?B?MXFFZnVZRmJtbWR1UHpZeUJ5MUZiQ2JYeDBRYUdLRUpSK1Z6YnYvM2Fqek84?=
 =?utf-8?B?OC9hUktFOGdEYnZPUVpkeWJVWUVVcHdYSjFRM2RpVzRzTm91MVl2TG1mcVFH?=
 =?utf-8?B?MlFDaGgyS0pGb0RDakloRG4vaVV2YjVZMFNLT1M4QVdSWjNrMWJRZllZTTVy?=
 =?utf-8?B?YWk5L3k2RTV6WkVGdmY3ODlGSUJKYnhwUUo1Y2phZ1czcndKVzY3Q083QlBo?=
 =?utf-8?B?dW5RT3dxTnA5c1J4aEtRMlBXb2tEckVmWDdGVURkaitEWUxUeWdFMVBUUGNk?=
 =?utf-8?B?d0N6RGxUbHlheXNIbWpXVVN6Rm9zUVFNOUU2cUxMaWorSUtONXpLbjVaeWhE?=
 =?utf-8?B?OG9jSEJUMFpZUjhVeXgzaEJtMWV3THNwV29jZzltOFZSLzVmakFsN2JOcmVZ?=
 =?utf-8?B?ZWtLcDl1Nk1HcGs2MnVWcWwrS0ptanZHU2MyL3lweUhWMDVzTjhuRGNLU0Fo?=
 =?utf-8?B?V3oyWUEvd3hTOTJiMG9XbWUzeFlXT1BiSjFMVTJIT3hGbWo3aXhxQWFZZHcy?=
 =?utf-8?B?akQ5SHlwUWt0ZGtxbDJEeEhJYmQxSnUzOVpEbW1vUE5RbEtoTmJhZGRrdW9U?=
 =?utf-8?B?aHg0Z0svNHRDT3dKRlJ4aFJ0dVhtSjVpc1YyeDlHTi96OFhSSUZReG1xK050?=
 =?utf-8?B?ODN1cGtBWU53WkZhaEJuMHllL3VZSmN0MTdHK0w2TzdkUmJocmpxdzZ1dVR0?=
 =?utf-8?B?dGY2LzUwN2lxODZvTDVJTExzQk9SODlYU3E5L3ZrVzZ3ekpjQnhkK0tHekZK?=
 =?utf-8?B?YUdpVDBOU05XckQrNFdDWXlOTlpaeEdSSkQ1WkRQTG11ZndOaG5OdzFEYnhZ?=
 =?utf-8?B?ZUNmN0pDUlJzNFRQZzVCWFlHWDlqOVNmWnYrMVRvb2tFTkt3Mk93dXM3RG5q?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7bd0cb7-392a-44d0-e1e8-08ddc85b0f82
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 13:32:38.9382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggp4LPK/XMVC3VriI+Ms7Iak/FesF8VaUMmtukAqFgoJjs/IhCkrH8qWdBls5/b53sB+S2e3iqiWnvPIkn4ARA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7008
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


On 11-07-2025 08:01 pm, Ville Syrjälä wrote:
> On Fri, Jul 11, 2025 at 12:26:45PM +0530, Disantkumar Mistry wrote:
>> i915 and XE driver have different api for mapping buffer. Enabling XE driver
>> support by selecting XE driver specific map buffer api for XE devices.
>>
>> Signed-off-by: Disantkumar Mistry <disantkumar.isvarbhai.mistry@intel.com>
>> Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
>> ----
>> v2:
>>   - Updated commit description
>> ---
>>   tools/igt_dp_compliance.h   |  1 +
>>   tools/intel_dp_compliance.c | 50 ++++++++++++++++++++++++-------------
>>   2 files changed, 33 insertions(+), 18 deletions(-)
>>
>> diff --git a/tools/igt_dp_compliance.h b/tools/igt_dp_compliance.h
>> index 226a13662871..89bab0e6b8f8 100644
>> --- a/tools/igt_dp_compliance.h
>> +++ b/tools/igt_dp_compliance.h
>> @@ -33,6 +33,7 @@
>>   #else
>>   #include <glib.h>
>>   #endif
>> +#include "xe/xe_ioctl.h"
>>   
>>   extern int drm_fd;
>>   
>> diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
>> index 99196a450b45..60f064442396 100644
>> --- a/tools/intel_dp_compliance.c
>> +++ b/tools/intel_dp_compliance.c
>> @@ -350,6 +350,14 @@ static void dump_info(void)
>>   	igt_dump_crtcs_fd(drm_fd);
>>   }
>>   
>> +static void *map_buffer(int fd, uint32_t handle, size_t size)
>> +{
>> +	if (is_xe_device(fd))
>> +		return xe_bo_mmap_ext(fd, handle, size, PROT_READ | PROT_WRITE);
>> +	else
>> +		return gem_mmap__device_coherent(fd, handle, 0, size, PROT_READ | PROT_WRITE);
>> +}
> Can someone please introduce some sanity into lib/ so
> that we have a *single* api to do common things?
Hi Ville,

We already have this part of lib. Though static.
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_fb.c?ref_type=heads#L2889 

>> +
>>   static int setup_framebuffers(struct connector *dp_conn)
>>   {
>>   
>> @@ -361,15 +369,17 @@ static int setup_framebuffers(struct connector *dp_conn)
>>   	igt_assert(dp_conn->fb);
>>   
>>   	/* Map the mapping of GEM object into the virtual address space */
>> -	dp_conn->pixmap = gem_mmap__device_coherent(drm_fd,
>> -					dp_conn->fb_video_pattern.gem_handle,
>> -					0, dp_conn->fb_video_pattern.size,
>> -					PROT_READ | PROT_WRITE);
>> +	dp_conn->pixmap = map_buffer(drm_fd,
>> +				     dp_conn->fb_video_pattern.gem_handle,
>> +				     dp_conn->fb_video_pattern.size);
>> +
>>   	if (dp_conn->pixmap == NULL)
>>   		return -1;
>>   
>> -	gem_set_domain(drm_fd, dp_conn->fb_video_pattern.gem_handle,
>> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
>> +	if (is_i915_device(drm_fd))
>> +		gem_set_domain(drm_fd, dp_conn->fb_video_pattern.gem_handle,
>> +			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
>> +
>>   	dp_conn->fb_size = dp_conn->fb_video_pattern.size;
>>   
>>   	/* After filling the device memory with 0s it needs to be unmapped */
>> @@ -391,15 +401,17 @@ static int setup_failsafe_framebuffer(struct connector *dp_conn)
>>   	igt_assert(dp_conn->failsafe_fb);
>>   
>>   	/* Map the mapping of GEM object into the virtual address space */
>> -	dp_conn->failsafe_pixmap = gem_mmap__device_coherent(drm_fd,
>> -						 dp_conn->fb_failsafe_pattern.gem_handle,
>> -						 0, dp_conn->fb_failsafe_pattern.size,
>> -						 PROT_READ | PROT_WRITE);
>> +	dp_conn->failsafe_pixmap = map_buffer(drm_fd,
>> +					      dp_conn->fb_failsafe_pattern.gem_handle,
>> +					      dp_conn->fb_failsafe_pattern.size);
>> +
>>   	if (dp_conn->failsafe_pixmap == NULL)
>>   		return -1;
>>   
>> -	gem_set_domain(drm_fd, dp_conn->fb_failsafe_pattern.gem_handle,
>> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
>> +	if (is_i915_device(drm_fd))
>> +		gem_set_domain(drm_fd, dp_conn->fb_failsafe_pattern.gem_handle,
>> +			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
>> +
>>   	dp_conn->failsafe_size = dp_conn->fb_failsafe_pattern.size;
>>   
>>   	/* After filling the device framebuffer the mapped memory needs to be freed */
>> @@ -428,15 +440,17 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
>>   	igt_assert(dp_conn->test_pattern.fb);
>>   
>>   	/* Map the mapping of GEM object into the virtual address space */
>> -	dp_conn->test_pattern.pixmap = gem_mmap__device_coherent(drm_fd,
>> -						     dp_conn->test_pattern.fb_pattern.gem_handle,
>> -						     0, dp_conn->test_pattern.fb_pattern.size,
>> -						     PROT_READ | PROT_WRITE);
>> +
>> +	dp_conn->test_pattern.pixmap = map_buffer(drm_fd,
>> +						  dp_conn->test_pattern.fb_pattern.gem_handle,
>> +						  dp_conn->test_pattern.fb_pattern.size);
>> +
>>   	if (dp_conn->test_pattern.pixmap == NULL)
>>   		return -1;
>>   
>> -	gem_set_domain(drm_fd, dp_conn->test_pattern.fb_pattern.gem_handle,
>> -		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
>> +	if (is_i915_device(drm_fd))
>> +		gem_set_domain(drm_fd, dp_conn->test_pattern.fb_pattern.gem_handle,
>> +			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
>>   
>>   	dp_conn->test_pattern.size = dp_conn->test_pattern.fb_pattern.size;
>>   
>> -- 
>> 2.49.0

