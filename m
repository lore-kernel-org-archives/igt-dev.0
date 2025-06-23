Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55241C7115D
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 08:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086A110E0F6;
	Mon, 23 Jun 2025 08:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yi7V/n5x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814C510E0F6
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 08:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750666145; x=1782202145;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aDmUFl0AxCr2sx4sWY12AP90FUO+Nw/Uw07+9hikkIE=;
 b=Yi7V/n5xLgV+RaReZH8IKH8vDVv12SH6fNcP8odj/Icm4HdC8zxCpwYC
 vneSKOYQDhIQePt//xgpOWxW00XHW1UqJt/Lv2gTLHZB6AI3gPB1IFB36
 mR+AT1NXWQo+2QkWggRSAnBRe35+2i+C67FCq3ccNQzsHRCUTLqip/Y10
 mU+ItOMrtQg6ZaRGssIti7xwuiyk8cGJ5mqrbAWXUftHTNFXNex9oyvht
 koye9YKn5eksidd3BGiA6lJsujqD7lGeEyiKR2Pnuuz5u7L8VKPH1uw6A
 r4NbtDr5xK18Tl8v/oUHbwnOpbr08IbY+OpJY8y2ISP/4OgRPqWABOV6l Q==;
X-CSE-ConnectionGUID: E8IJxDEmTHWj3fffWeY90g==
X-CSE-MsgGUID: WxMXTp7NQmyHJ/VuKSBuRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52729385"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52729385"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 01:09:04 -0700
X-CSE-ConnectionGUID: wiHXvx8wS8u6np0wl/Tm7A==
X-CSE-MsgGUID: wnhaue+7TJmHkqe2uim0Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="157308620"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 01:09:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 01:09:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 01:09:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 01:09:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLnUNul3JM8thim9QkZOywJFJuDqmV4SEa/K7hdpeJgcybVHNfwgPZLAUVxYFMheizf+0Iw66uMB8koxkla2MAJxOeOfYpsbarsWi5sle6HNqZDcdc7mgxDB7P87+2A6Z3cpl994qR28z1Bq+63GAc0Rw/WEotV9QXEzqVL1h+BpjUaQO6cBicD/yWB5rK3/hqAPWr+aLCQozCxXv/RaNrntuN6oyGxmD7bDvIB2BR7SxQLd1+ST5opu8E06MBzYDIFpwlk6JWy4oaofP7s7mpF0w+oSBHwQQi+rmziSmQhPb4G3esf/Y7UWag8dTaf3TfIFcU1pjLINLQUEebH9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDmUFl0AxCr2sx4sWY12AP90FUO+Nw/Uw07+9hikkIE=;
 b=O7mZbYzpLxo2vlhiMOrF+/BjlId0JrFSxKpD2sGKvF+b8CiGDiuP2IIIm0zV1lmLKqYeh66OOzS2s2XPFq4adsjXFaRyhcw9WC/CKtNiNEIKfgRnmYoQlR/D2Y0SqVQh07OGcQPeCROW/X0NYezqBjPbYwgwiKMfmg0P+hAmdTSZ46Vy9V7ZO7kV6Mbdv6gDzFKr10KZRTMa2RX81nsM0xIMkbIDwgcXCrYyA0RigJoxTrgo+7GkdTH4DV28gLAsmeZa1j1TuIeNcFdkSrq7/7zizMAEHEoi/mLDFIupn2G9Psl3q3NPAPRz8+6q27asPFWGuLHN9hSJtOLX2K3x7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 08:08:34 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8857.020; Mon, 23 Jun 2025
 08:08:34 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v14 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
Thread-Topic: [PATCH i-g-t v14 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
Thread-Index: AQHb35RAO814OPjXXESZb2wUlbvWfrQQWzswgAAPLYCAAAIlAA==
Date: Mon, 23 Jun 2025 08:08:34 +0000
Message-ID: <SJ1PR11MB6129BB12ED5CAABC698C0E7EB979A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250617142707.490235-1-santhosh.reddy.guddati@intel.com>
 <20250617142707.490235-6-santhosh.reddy.guddati@intel.com>
 <SJ1PR11MB612984BBBEC9F5DAD579E12DB979A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <789801cc-6f76-4203-8de0-cc120cbb4a3f@intel.com>
In-Reply-To: <789801cc-6f76-4203-8de0-cc120cbb4a3f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH8PR11MB7992:EE_
x-ms-office365-filtering-correlation-id: 34e71579-b0ed-47ce-9633-08ddb22d265c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bVpEM2cveWxBdittMUFxZ3ZmYjhQb0VTWCtOY081YzhkTU5MRnVPcWZRa3gy?=
 =?utf-8?B?aW05S1ZtbCszMHBVSStQbE05dldGdk1SUTJOT292MUVrdmp2aE9NbU9BRkU3?=
 =?utf-8?B?N0ErMG1vdmZvMCtrNEJRdHhQcDg4ZllZNWNrOG9EdXYrWUx4aFJhbCtJRkt0?=
 =?utf-8?B?bVdUVys4eEdRR1d4M3NWV1JMSzI1U3ZiTEJNOFljdUtob0ZNYXgwQTFiMHg2?=
 =?utf-8?B?Y3NQaGhVSU1vWGtKWGZlQ2tYYm5MMmNOY2FLZjA2OTdpZkZiUW5XaXZPRk9O?=
 =?utf-8?B?cG9PdFlEUW9oSmxtQ1AyWlF0MWRzajJYUVVnRGR6QXdYNExRWlI1VjdSSGxI?=
 =?utf-8?B?RmtQaVE3UjVOV0MzaTI0ZmRvMXBNWFhJS3FBUGRORXBHUldIaERuZEI3RGx5?=
 =?utf-8?B?TW1OaFlrM0lURTh3NW45MkR6SllRM21hTU50ZDgyZ1NjbHp6K1Vkc0dURnRF?=
 =?utf-8?B?dFhWMDZ1VjAvWW05Qk93bGZDN2U3U2F2RHpYWmVzSmFFTnRuSGJPMlRRaCtv?=
 =?utf-8?B?QUdXU1FPSEdEL3VrRmtPQXdQK2YxNUszS1J2L1VNaFUxNEdOUk1JUEgxMUxi?=
 =?utf-8?B?MXNzaE9DVDhibk1kcksrRUlZSFFyeSt1MnoxNGc3cTVPUkw5QU1ZWUNCY3Fj?=
 =?utf-8?B?SDVTY3ozNCtmTDl3T1JDbEVnTkZ4N25pTUdtSmZVN2o5eS9QVHBwZmJ0bk12?=
 =?utf-8?B?bi91S1RTUE9SWGFkbGJkekVSODJGZDR6UTBsVUdVTGRZc0dIVysvekEwck4r?=
 =?utf-8?B?SUd5bDBUM0ttVFNla0JSb2puSWIxZ21GYVpaZ2Q4c05tNzFFUjJnYmZxUytS?=
 =?utf-8?B?ZTZxRzV1T1ZyNi9vTC9JQVFrc3VBeWZTWHBPM0w2VENZaWZDbHFMeHdTeXFL?=
 =?utf-8?B?dDNyYkxCeDR4QkxMSGdjbUp4eEwxUzFvODJvS000Z1ZidGpqZ2YwUldyVUl3?=
 =?utf-8?B?UkdmMUo0dFRxelpITmI3Q01DRWZsQ3ltc0ZvcHVicHRhNFZkY01HeURDWGN4?=
 =?utf-8?B?Y3VKa3RtUURZVCt5QjI0bTlyb2lWaENsb2tEYVdHdnFuVndUQWpKZWo0L1Zw?=
 =?utf-8?B?bXBwNDFGQkdpdW44bVhhY3JuUFBFVGtEc25JZW9SMjV0N2I3OUlQT0VOSzU3?=
 =?utf-8?B?SzIvMUN6cnRWL3d0TGFvUkliQXV5NVVWUmVWakdaTzNVdHZlamV1VHFBSlU3?=
 =?utf-8?B?eDk3VmRRcTNIaHMvVWlUME1Vby9rTDg2VFJneDBTVXdva0xWVUQ2SGVXOEdU?=
 =?utf-8?B?WDM5aStjNUJTNGIzK2xQc3lqcnRkSU9kRnU0MUo2QWhBZEE2R09RWEsyRVZQ?=
 =?utf-8?B?aVlDeFo0NmFkWkNycVRPTUM3RjJvdTRJTnNVUWVWZGJtK2llbWVDWFcrR3Fz?=
 =?utf-8?B?VnNvRWZOTXNNSGVMSGlxL09MOHJVVDErUmpsa0JHa3R6YXJwaDF6SVFIZGds?=
 =?utf-8?B?cnpWcTFzUWwrNm5xbjVXRHJjUE5XOFc2NjVhR1lWWUJkOEpBdUNpb0NvR0NF?=
 =?utf-8?B?V1k2YUdqUDdnanhtVHh1UHFlUDRGeEFGSkZvSStZckJOQlZmdWNQc1JaaFFy?=
 =?utf-8?B?QXZ3YTl2R2FCbytCVUFKK2NTZm85bVpPdTdnZU84TkJOQ0xRdkFBT01iMHVo?=
 =?utf-8?B?YkdaajhHWGx3QzlneUlXeE5rNUZWSjdaaTJGSnMrRGJnbkNIdVV5THNOdlRh?=
 =?utf-8?B?MFBzMEcyOTJOdkFhV3AzQnVIR1dXSmJPRW43cDlIcjJaclZsV2FLSjVzUC9w?=
 =?utf-8?B?d2NqQU4xbUVaSDJuenZSRVNBSmE5MzVacEFxNTZDVWpuTmZsK0ZjQ256NWc4?=
 =?utf-8?B?SitFTklOSXJTdDJsUnp5Q2pVdllESlozL1dDNFVTbld0NXBFVDZYa3dCYjNt?=
 =?utf-8?B?dmZwcS82TE1rTGVDT2tCbytDa0JjQmtLTTZ5ZXFFVTMwUERFNmtDUjQxSW1q?=
 =?utf-8?B?QjhJbXB0cjkvOHlBbWVvM2pHMDFZZTJyNzVGZWhnODlxc1B0aHdpNk5HcW5p?=
 =?utf-8?Q?OQwB/UPhsRMy5OqxKTzDJ52i+U/JtI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2JzdFBKTWMySmdYL3RTd1pkbStUZG0yRjBCY3BuS3BodVV1NjlvLzQ4WGlP?=
 =?utf-8?B?blBQeVlTZUFZMUtyRTVJRVRPTjUzMWVNS2R2ZjBTUGhNNkZwSjBONkVQZFBz?=
 =?utf-8?B?SUh5U1BXYmxQMjZyMmFnTkVJTXVQb3JRbU1QSldhUzBnM3VmVjJNVkN0dEVG?=
 =?utf-8?B?d0JqMytSWm9jMnh5bElIY2VWNEFvYmdtY0NEcjV1aGs4aUJ2Q0lKZEdLY2g4?=
 =?utf-8?B?ZlhMU3NIYitOM0lmY0ZVaGdsRml2Und2QXdqUVVseTJXVnRDN1A4MUE3U2tD?=
 =?utf-8?B?ZitYQS9rV21xZWc1UGlHRlErZitRQVN1d1hWUjVSa1NxMTJuWXQ2alFqTXpi?=
 =?utf-8?B?R3huQUVOUGhwTTFUZGdHcnZ6d2NwbC9jQ0JPWGkxR2hZZ3BlbzNuelNHaDJh?=
 =?utf-8?B?bVYzc3BMd0c1d1VxQk1SL25aRDZHbXRQQnlkYlJLMUVhM21JbXJTQjg1bENP?=
 =?utf-8?B?WHB5ZXZhVENiYlhwKzJaUitqajZxUDlGV0lXWmNvbHlvdXJodTVhSjdXbGJi?=
 =?utf-8?B?ZjdXRVYrR0dpblVDYUdPYVdGR25oc1pvaXN1NWtPYVhGZm1zRGlDT2E0L25Y?=
 =?utf-8?B?ZXZqbUUzL2xkYm5Kd09MdURFOVp3NmJ5TWxiNDZGUjJnS29tc0xhUnBEd0h0?=
 =?utf-8?B?dmsvdUkzS0Q2ZjNmbklTOHVSb1FBWFVERkM5U2hCblFZcVArY0FMMWlsZEdR?=
 =?utf-8?B?aHdEQU9CZ2ZzUGNRSENmNnYvaEZxcWNNU3VXeDd5YXlQNVdxeHcramNvdUwy?=
 =?utf-8?B?NS9hekt5SFlqZVBlZU1PbkUzWkpvb0o3Q0kwSWwwdkJNVlhIVXN1L2ZrNnVa?=
 =?utf-8?B?REo1RThralBuZ3pqcytCQ09KOWVLU2l2V1YrUzEyUjVDanhKYUlhOEhDZnJU?=
 =?utf-8?B?dW1MbnBRQTFhV1Y2UVp4ZUxnNjhEeXpNLzQ1R3U5ZmE1SStETEtzRVYvMlcz?=
 =?utf-8?B?RGxvcUpqQUg5SjNkb3pmRWdzTFFiVDlOamk2ZVNuWUhGSUxhajBvblM0YWc4?=
 =?utf-8?B?cTlVVXc0aFA1d3ZnL0dreDJnYXQzT3duRkFwc3dvQnpQTFM1NmVOaFlEQVpB?=
 =?utf-8?B?R1JIMTJlbUtpYTdRU1dZSGM1YlV1YVFXZWV3M1p3T1RITkRhS3ZKN2RDdEM1?=
 =?utf-8?B?Y1k1amFXMDV0NjJFRHdKWUl2c0c5TWhNMEJjeUpTM1VDajZGdEhkakV3Y3lp?=
 =?utf-8?B?cDE1cmdtd3J0SzN0QldGMkRQT0dNWjZic0IwblZhYlNDeVFBR2Yxd2kwbFpG?=
 =?utf-8?B?Vzh5MEpud1h1R3hndTl1dDFNb1IyQnVxb3A5OHVaNCs5bzMybjRDUFZkYXBS?=
 =?utf-8?B?MjVFR0JRK0FGY3M2b0hDaHhyeGM4bjQvZnBLcFU0ZTFzOWp2OTEzUjI2QXlj?=
 =?utf-8?B?MnhDYzRicmVtZVc4N0x6aTlaTHVQN0VsbVV5cFRSbmtJWmw2QVBXU1dCaWts?=
 =?utf-8?B?dFlkdGhRaGNIUlQxUERuQU1oMlZ4WDhaeEFUSXFtQXE2cS94VTY2TE9uRFVT?=
 =?utf-8?B?NVVQRUdhKzFqa2x5ZkpVN0s0Nm1oK21KT3JXcENiRG9tdWd5UmhzdHovMmV5?=
 =?utf-8?B?c1VSREZEMHV4eGlXbkE2MjVvbmdJd2U4WWt3UUx1bFkzVkh0cGlrR0EwUFpQ?=
 =?utf-8?B?U2lLN3hMdnFhSzNCZzNFNXBTUEI2K2lZTWNqQ0JUdmVJekYzMlF1S2lQRVBF?=
 =?utf-8?B?NENyL0FrdVRGRDFTRWRvTGlQNG1sakMwcm0xY3BzeFZrdFk2SmpLeWJUTUxk?=
 =?utf-8?B?MXlkWHFyUXVVUDJpb21xWVJpaENPWERhcCtxbzhaa0xPdU1pbnB2b1U2N2lB?=
 =?utf-8?B?TXI3TERtelVMZ1FYZEdTSU1HaHM2ZERGenBHRlBkRi9URHN4SkhOOWk2aFM1?=
 =?utf-8?B?QkovWE9ybXVqYnVObHF4cmpSei9Rc3JZV2Yyc0FiUjYwTUdGL3dVY3FTSzZr?=
 =?utf-8?B?c2xTQ1A4VFU2V2REUU12dmwvQk5IbjFnSDVCNTVURXMwYW9ZcHByQnhBcXky?=
 =?utf-8?B?YTdmUFB4MTg1T3FEMXBiSS92OW5HTWF2WTNEdWsxdG4rQmlZM1RNbGdrZ042?=
 =?utf-8?B?eDBVVmVVekNXdzhBNitkWkhSWHFWWHd1alkyc2JwUFZ0VEdxK2d0RXl4SGFt?=
 =?utf-8?B?L2Rlakl0V0h1NmFWOXZ0bkh5UkJmbDVmdlArcDd1dXFTdWVnZHc4dzB5QUJ6?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e71579-b0ed-47ce-9633-08ddb22d265c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 08:08:34.3086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qK6A/A/d6+6XQBeFDm+IwiL0k7emdLYWqPqP16GObXAXKFEBSX2pWx5uJCHpZQ3UmsuOUOK+XjqTRSRi8bMNWkzVecP5UI6joOO68+PYl1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmVkZHkgR3VkZGF0aSwg
U2FudGhvc2ggPHNhbnRob3NoLnJlZGR5Lmd1ZGRhdGlAaW50ZWwuY29tPg0KPiBTZW50OiBNb25k
YXksIEp1bmUgMjMsIDIwMjUgMTozMCBQTQ0KPiBUbzogQm9yYWgsIENoYWl0YW55YSBLdW1hciA8
Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT47IGlndC0NCj4gZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogQiBTLCBLYXJ0aGlrIDxrYXJ0aGlrLmIuc0BpbnRlbC5jb20+OyBN
dXJ0aHksIEFydW4gUg0KPiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggaS1nLXQgdjE0IDUvNV0gdGVzdHMva21zX2FzeW5jX2ZsaXBzOiBTa2lwIEFzeW5j
IEZsaXBzIHdpdGgNCj4gTGluZWFyIE1vZGlmaWVyDQo+IA0KPiANCj4gDQo+IE9uIDIzLTA2LTIw
MjUgMTI6NTYsIEJvcmFoLCBDaGFpdGFueWEgS3VtYXIgd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBSZWRkeSBHdWRkYXRpLCBTYW50
aG9zaCA8c2FudGhvc2gucmVkZHkuZ3VkZGF0aUBpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IFR1ZXNk
YXksIEp1bmUgMTcsIDIwMjUgNzo1NyBQTQ0KPiA+PiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gPj4gQ2M6IEIgUywgS2FydGhpayA8a2FydGhpay5iLnNAaW50ZWwuY29tPjsg
TXVydGh5LCBBcnVuIFINCj4gPj4gPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPjsgQm9yYWgsIENo
YWl0YW55YSBLdW1hcg0KPiA+PiA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT47IFJl
ZGR5IEd1ZGRhdGksIFNhbnRob3NoDQo+ID4+IDxzYW50aG9zaC5yZWRkeS5ndWRkYXRpQGludGVs
LmNvbT4NCj4gPj4gU3ViamVjdDogW1BBVENIIGktZy10IHYxNCA1LzVdIHRlc3RzL2ttc19hc3lu
Y19mbGlwczogU2tpcCBBc3luYw0KPiA+PiBGbGlwcyB3aXRoIExpbmVhciBNb2RpZmllcg0KPiA+
Pg0KPiA+PiBTa2lwIHRoZSBsaW5lYXIgbW9kaWZpZXIgc3VidGVzdCBvbiB1bnN1cHBvcnRlZCBw
bGF0Zm9ybXMNCj4gPj4NCj4gPj4gVjI6IFJlbW92ZSBwbGF0Zm9ybSBjaGVjayBhbmQgdXNlIGlu
X2Zvcm1hdHNfYXN5bmMgKENoYWl0YW55YSkNCj4gPj4gICAgICBVcGRhdGUgdGhlIGNvbW1pdCBt
ZXNzYWdlDQo+ID4+DQo+ID4+IFYzOiBGaXggY3Jhc2gNCj4gPj4NCj4gPj4gdjQ6IEhhbmRsZSB0
aGUgY2FzZSBmb3IgbGluZWFyIG1vZGlmaWVycyBvbiBwbGF0Zm9ybXMgd2hlcmUNCj4gPj4gSU5f
Rk9STUFUU19BU1lOQyBpcyBub3Qgc3VwcG9ydGVkLiAoQ2hhaXRhbnlhKQ0KPiA+Pg0KPiA+PiB2
NTogTW92ZSB0aGUgbGluZWFyIG1vZGlmaWVyIHN1cHBvcnQgY2hlY2tzIHRvIHJ1bl90ZXN0IChD
aGFpdGFueWEpDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFNhbnRob3NoIFJlZGR5IEd1ZGRh
dGkNCj4gPj4gPHNhbnRob3NoLnJlZGR5Lmd1ZGRhdGlAaW50ZWwuY29tPg0KPiA+PiAtLS0NCj4g
Pj4gICB0ZXN0cy9rbXNfYXN5bmNfZmxpcHMuYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykNCj4gPj4N
Cj4gPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19hc3luY19mbGlwcy5jIGIvdGVzdHMva21zX2Fz
eW5jX2ZsaXBzLmMgaW5kZXgNCj4gPj4gZTE3NmIyYTI4Li4wYzhmNGFmYWUgMTAwNjQ0DQo+ID4+
IC0tLSBhL3Rlc3RzL2ttc19hc3luY19mbGlwcy5jDQo+ID4+ICsrKyBiL3Rlc3RzL2ttc19hc3lu
Y19mbGlwcy5jDQo+ID4+IEBAIC03OTksNiArNzk5LDM1IEBAIHN0YXRpYyB2b2lkIHRlc3RfY3Jj
KGRhdGFfdCAqZGF0YSkNCj4gPj4gICAJaWd0X2Fzc2VydF9sdChkYXRhLT5mcmFtZV9jb3VudCAq
IDIsIGRhdGEtPmZsaXBfY291bnQpOyAgfQ0KPiA+Pg0KPiA+PiArc3RhdGljIHZvaWQgcmVxdWly
ZV9saW5lYXJfbW9kaWZpZXIoZGF0YV90ICpkYXRhKSB7DQo+ID4+ICsJZW51bSBwaXBlIHBpcGUg
PSBQSVBFX0E7DQo+ID4NCj4gPiBUaGlzIGFnYWluIHRoZSByZXN0cmljdCB0aGUgY2hlY2sgb25s
eSB0byBQSVBFIEEuDQo+IA0KPiBBcyBmb3JtYXQvIG1vZGlmaWVyIHN1cHBvcnQgaXMgb3V0cHV0
IGluZGVwZW5kZW50LCBQSVBFX0EgaXMgY2hvc2VuIGhlcmUNCj4gc2ltcGx5IHRvIGVuc3VyZSBh
IHZhbGlkIG91dHB1dCBpcyBhdmFpbGFibGUgZm9yIHRoZSB0ZXN0IHNldHVwLg0KPiANCj4gVGhp
cyBjaG9pY2UgaXMgaW50ZW5kZWQgdG8gc2ltcGxpZnkgdGhlIHNldHVwIGJ5IGNob29zaW5nIGEg
a25vd24gZ29vZCBwaXBlLg0KPiANCg0KVGhpcyBpcyB0cnVlIGN1cnJlbnRseSBidXQgdGhlcmUg
aXMgbm8gZ3VhcmFudGVlIHRoYXQgdGhpcyB3aWxsIGFsd2F5cyBiZSB0aGUgY2FzZS4NCg0KV2hh
dCBhcmUgdGhlIGRpc2FkdmFudGFnZXMgb2YgcHV0dGluZyB0aGUgbG9naWMgaW5zaWRlPw0KDQpm
b3JfZWFjaF9waXBlX3dpdGhfdmFsaWRfb3V0cHV0KGRpc3BsYXksIGRhdGEtPnBpcGUsIGRhdGEt
Pm91dHB1dCkNCg0KUmVnYXJkcw0KDQpDaGFpdGFueWENCg0KPiA+DQo+ID4gUmVnYXJkcw0KPiA+
DQo+ID4gQ2hhaXRhbnlhDQo+ID4NCj4gPg0KPiA+PiArDQo+ID4+ICsJZGF0YS0+b3V0cHV0ID0g
aWd0X2dldF9zaW5nbGVfb3V0cHV0X2Zvcl9waXBlKCZkYXRhLT5kaXNwbGF5LCBwaXBlKTsNCj4g
Pj4gKwlpZ3RfcmVxdWlyZV9mKGRhdGEtPm91dHB1dCwgIk5vIG91dHB1dCBmb3VuZCBmb3IgcGlw
ZSAlc1xuIiwNCj4gPj4gKwkJICAgICAga21zdGVzdF9waXBlX25hbWUocGlwZSkpOw0KPiA+PiAr
DQo+ID4+ICsJaWd0X291dHB1dF9zZXRfcGlwZShkYXRhLT5vdXRwdXQsIHBpcGUpOw0KPiA+PiAr
DQo+ID4+ICsJZGF0YS0+cGxhbmUgPSBpZ3Rfb3V0cHV0X2dldF9wbGFuZV90eXBlKGRhdGEtPm91
dHB1dCwNCj4gPj4gRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSk7DQo+ID4+ICsJaWd0X3JlcXVpcmVf
ZihkYXRhLT5wbGFuZSwgIk5vIHByaW1hcnkgcGxhbmUgZm91bmQgZm9yIG91dHB1dCAlc1xuIiwN
Cj4gPj4gKwkJICAgICAgZGF0YS0+b3V0cHV0LT5uYW1lKTsNCj4gPj4gKw0KPiA+PiArCWlmKCFp
Z3RfcGxhbmVfaGFzX3Byb3AoZGF0YS0+cGxhbmUsDQo+ID4+IElHVF9QTEFORV9JTl9GT1JNQVRT
X0FTWU5DKSkgew0KPiA+PiArCQlkYXRhLT5tb2RpZmllciA9IERSTV9GT1JNQVRfTU9EX0xJTkVB
UjsNCj4gPj4gKwl9IGVsc2Ugew0KPiA+PiArCQlpZ3RfYXNzZXJ0X2YoZGF0YS0+cGxhbmUtPmFz
eW5jX2Zvcm1hdF9tb2RfY291bnQgPiAwLA0KPiA+PiArCQkJICAgICAiTm8gYXN5bmMgZm9ybWF0
L21vZGlmaWVyIHN1cHBvcnRlZFxuIik7DQo+ID4+ICsJCWZvciAoaW50IGkgPSAwOyBpIDwgZGF0
YS0+cGxhbmUtPmFzeW5jX2Zvcm1hdF9tb2RfY291bnQ7IGkrKykgew0KPiA+PiArCQkJaWYgKGRh
dGEtPnBsYW5lLT5hc3luY19tb2RpZmllcnNbaV0gPT0NCj4gPj4gRFJNX0ZPUk1BVF9NT0RfTElO
RUFSKSB7DQo+ID4+ICsJCQkJZGF0YS0+bW9kaWZpZXIgPQ0KPiA+PiBEUk1fRk9STUFUX01PRF9M
SU5FQVI7DQo+ID4+ICsJCQkJcmV0dXJuOw0KPiA+PiArCQkJfQ0KPiA+PiArCQl9DQo+ID4+ICsJ
CWlndF9za2lwKCJObyBsaW5lYXIgbW9kaWZpZXIgc3VwcG9ydGVkIGZvciBhc3luYyBmbGlwc1xu
Iik7DQo+ID4+ICsJfQ0KPiA+PiArfQ0KPiA+PiArDQo+ID4+ICAgc3RhdGljIHZvaWQgcnVuX3Rl
c3QoZGF0YV90ICpkYXRhLCB2b2lkICgqdGVzdCkoZGF0YV90ICopKSAgew0KPiA+PiAgIAlpZ3Rf
ZGlzcGxheV90ICpkaXNwbGF5ID0gJmRhdGEtPmRpc3BsYXk7IEBAIC04MDYsNiArODM1LDkgQEAN
Cj4gPj4gc3RhdGljIHZvaWQgcnVuX3Rlc3QoZGF0YV90ICpkYXRhLCB2b2lkICgqdGVzdCkoZGF0
YV90ICopKQ0KPiA+PiAgIAlpZiAoZGF0YS0+YXRvbWljX3BhdGgpDQo+ID4+ICAgCQlyZXF1aXJl
X2F0b21pY19hc3luY19jYXAoZGF0YSk7DQo+ID4+DQo+ID4+ICsJaWYgKGRhdGEtPmxpbmVhcl9t
b2RpZmllcikNCj4gPj4gKwkJcmVxdWlyZV9saW5lYXJfbW9kaWZpZXIoZGF0YSk7DQo+ID4+ICsN
Cj4gPj4gICAJZm9yX2VhY2hfcGlwZV93aXRoX3ZhbGlkX291dHB1dChkaXNwbGF5LCBkYXRhLT5w
aXBlLCBkYXRhLT5vdXRwdXQpDQo+ID4+IHsNCj4gPj4gICAJCWlndF9kaXNwbGF5X3Jlc2V0KGRp
c3BsYXkpOw0KPiA+Pg0KPiA+PiAtLQ0KPiA+PiAyLjM0LjENCj4gPg0KDQo=
