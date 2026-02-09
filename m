Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A2EE81BAE
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 12:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8CA10E3CC;
	Mon,  9 Feb 2026 12:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J2n5SUOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9389B10E3CC
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 12:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770640087; x=1802176087;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=ris1Dyybym56ZRXfR2Afgopzaq98LzFv8Aj7GdAjSAw=;
 b=J2n5SUOQb5R8ZIONt7Xb+5Wz82egtY+KcGwR1XUf0sPqM5kv/kxwG5nK
 a/57Mt3TxUSdwcXbjrjA7RUibcu5FG6IAFdZOcgBUz2jlKo2PYWfU6rEz
 X+tp+Y9v/pELNghsf/O4T/zM07RCHd+CwHlIwx6fv71TB7NZVzH0c3mSZ
 FBCcmfW93EqvlzTrTohh1j8esI+/MOjN2O85EAnFoG6uGkf/RWPXrEuTq
 YC//Ylw4FR0ak4zBcMGQwsGAy8+8qWcXC6lgJe+dyHIvzNVg9GgJRTJ+N
 nKQa57Z55aZVObH1ZJIX7TpOltUAJRhuUvv5ZCXlPc4/krttRjpJ3mpPP A==;
X-CSE-ConnectionGUID: 8aFDudFSS0aK/3m+bQEG+w==
X-CSE-MsgGUID: hkGn+V+eSLSUnNzHrj3LNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75598500"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="75598500"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 04:28:06 -0800
X-CSE-ConnectionGUID: S+aXgDAhQkilZNOkcYaAEQ==
X-CSE-MsgGUID: cF+3uqSFRjCJxNXpU7OQUg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 04:28:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 04:28:05 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 04:28:05 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 04:28:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=megsm9fkoPJASLQ0U7uFeojcqwG+KWycreKykz0S7jc7f3wWGdat2wM0LHAG0aT0Csdbj687K4zd+BlJ1+XAM4qd3Y+oxcn+HZHQwE32LvB/+DTlyTt4Sc6hxvYnHnvrBLu55UkVevUe/4yoM56UBuo5BYPf86uMVSKVuSXhsOjgBZbd+dJbrdapq8VgOCh3i4FobEuhn2Qp+XaMqP1XokbDkFeU/B6LIHGBbbDgXczFo4O4Pqpfd4wk4Imk9d/wPt49p7hLCH0oZjFrift2QSLDY5BM0ugKcbDlG56kMY6tUduFUL1bOXgHNmoJNxB7nlVf+eF3QkkazAmhHuA6qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSIUIG97KZbcaHvMFe6z1p75A324WudJ7i1l4fRRFzE=;
 b=PE+M/O278rVJeJNLgV+L4zKiurGOq7WLJc1dtojbK1bYO0ISCIhD7ncxxqz0MTvEqZPzwtZ8zMQ5YznZLAAh/MQkiRHNT2AEjN7aqjOOSU+ifhz5n3qk/lwXp2cbHlAObw6sEVvOU8AVLv3SRz7Vd3nPgUnoBWPQGuHIEIrsJdwsjNpPrFPp9ILrVZHRBXML97zdVVRpcmvaXwq/4FPa7VNKCqV1p7JnA425uC50zvIDA8iRsAsJD86odz+P2UIjL8/vJ6BJ8suXKPQS3+FGCKbzQ1xlBFH4FHqXkYFl3/ZQGTRdRdz42uFaGYMiqQ5EnnKUQ81lA15xBrvkbc6r5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB7203.namprd11.prod.outlook.com (2603:10b6:610:148::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 12:28:03 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%3]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 12:28:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 13:28:13 +0100
Message-ID: <DGAFJ1S14QEP.2ZFLOW6QKXKZR@intel.com>
CC: <jeevan.b@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
Subject: Re: [PATCH i-g-t v7 3/3] tests/chamelium: Rename connector_test to
 connector_subtest
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260203034546.1516152-1-mohammed.bilal@intel.com>
 <20260203034546.1516152-4-mohammed.bilal@intel.com>
In-Reply-To: <20260203034546.1516152-4-mohammed.bilal@intel.com>
X-ClientProxiedBy: WA2P291CA0040.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::24) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH3PR11MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf6dc9e-daf5-43a6-27a8-08de67d6ab89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDdoTmM2RE0wRGNDM2UyNHU4b0VaVEQ4Kys5RUFRd3hJMStxNWdkaC9va0xS?=
 =?utf-8?B?WFg5KzFWdnpBazBuWFVvR2RlNDZvQ3dJSUpSRnMwS29aMnhwcWZHeTlqVnQ3?=
 =?utf-8?B?NE5jV2Zad2k1VlpGS1hXeWdEejYxd0pFbjdqYUlBY1owOTBDclRhOVhKSnJK?=
 =?utf-8?B?ZGdON1NRK1c3YjU3RHZQajR6SGN5Z3pVSkNsTTNzdGJCZW1tNVhMdy8wdENz?=
 =?utf-8?B?VHpUMXJVVWV4UTdvdjA1TUttaTM4U0llbDFqU0EzbmZvSjZ5TlhrMTFMMkE4?=
 =?utf-8?B?R3IxY3pLTVRuaE9LcXBZOWl1Q296Z05rVFB1ZWVNdXVJdHhJTG85TERpcHlp?=
 =?utf-8?B?UjdOc1pSNy9WbHMwMUxjWThXMEZrRFVSNGhPbVVseHN2eU5ONzVnL1lOVXhU?=
 =?utf-8?B?elhrL3VFREZwTFRiRjJEcVNlUTlXVGxRc0Ivc1RKVnZja3NJMGZOWTNIc0Fy?=
 =?utf-8?B?aEZkcURIZ0NBTzFPbnplbDE1RUNJMERobVlBVCt0NnpwcnhWSVRvZHRCU3FS?=
 =?utf-8?B?TGNGYStYYUtNQ1hGc01reUZIZjczQ0NrN0RKOHBXOERKMlVaM0UwNXVCYmdB?=
 =?utf-8?B?OE0rM3dnQ1NuWFBiMWtKRlpFbDd0Um5ObHk1a1RaUk8yYnhjTnZ4NG5pcEti?=
 =?utf-8?B?MFZhNnl2aERxOGtQK0R2TkRIclhBN2J4ZEVYamRVWTV3QzgwUmlHb3Q2d2dy?=
 =?utf-8?B?QlVWVTNERWpIRUdpaUROeGhONkloVmZrRWN5SWVzNjVFbDhSOVZqRlhHcEpK?=
 =?utf-8?B?a3N1R3hiYmtNVUU2bXFsTVRtbXUrbko3OG5FSUM1L2t0YTZUMm5DMjFUTkZ2?=
 =?utf-8?B?THpIcVgwQU9Cczk5ZytaQjRKb0txdFZwT0RRMGFsVnAxS0ljd1MyQjIxZld0?=
 =?utf-8?B?OXdNaEpWRUJUS29uOGdhYXhHcDMwdVk0SUZLcFFRZG1iN1g4OC9jYW83aTky?=
 =?utf-8?B?QjdSdHJqMWE1SnIyYlVFNEgzNHJDNlo4bHdIMWh4enJzM092U21yb2tlb0Vh?=
 =?utf-8?B?UFlmb3R1NEUzNVRvUUVnQ3pRNlVQbWdCaHMwZyt3NldmMGxOZ1FrenZ5QXlV?=
 =?utf-8?B?M0R1b3E4Y0pFNWd4NUhTN0hiaUZORkdZSUIvVEx0N3M0R0FWcWZnaWJCajJQ?=
 =?utf-8?B?U2t6dE9yYzF5N0psL1M4eU9vaVRkQWpFZGpDVUtGNUdMdTRHZ0NwLzhkV05x?=
 =?utf-8?B?SGRyR3VpK05nTUFsN0hDMzM5UXhuREFqdFpYdWhONmZDTUdRdjlrSXZiSzR6?=
 =?utf-8?B?cllZY3lmaFB0K0VZZjZVNFdFRGZ4KzYzeks1NzNXYmF1S0VHZmJ2SGdyaVEr?=
 =?utf-8?B?amRDSmozbkM0WG8rWUU1MlovOUUySUVqS21lWDN2aFAwVURpUDhlSTh6WDVQ?=
 =?utf-8?B?czRmYTd0K3ZLMFpTa2dLY2xvUlV3eVJHUXhndWh0d0E5TWwyeFkxNVhIWUg3?=
 =?utf-8?B?WHlsYmdYTmVwWGdQOFJmLzBVTFF5MkV1RXZza3NDblU2VmtmTzkwQVFCbE5m?=
 =?utf-8?B?Y1FNV3NoTm9RSHZkMUphOG9MY1N2NzA4YSt2RFpkK25Fd3ZrS3BWRmdFQ1Az?=
 =?utf-8?B?VUREb0RRUFNPelNlS3pCbDJiNEVSNDQvUXZzN3dCRi82aGhZV0xlWHMzWENm?=
 =?utf-8?B?ZVlXQzNWczNydVBRNm9YM0Rqc0Rua1lqQ1NyMTNaWkNtalhKMHRLdlNxOVdi?=
 =?utf-8?B?VEI2M254QmV5Ymp6TytlRUczMzFZamtLcjJ2aFBuSXFjRXRURkZkNnFxZFJq?=
 =?utf-8?B?VWF3RlBPcnU1S0ljdzNoQU1aeTZhU1pUcEgvU01wWEd0N0xVQzF3ZkFNWjVs?=
 =?utf-8?B?bG5UYkMwTFhhMFdnMFRsYmxVM1NOM2dSRlAwY251Qk5iUmRFak9USGFVa0Fn?=
 =?utf-8?B?Qld2UDRxV1FmTXJ6TEh6T2F3Z1lja3NvV2kwdyszcmoyY2I2QUI1ZEZOMHQv?=
 =?utf-8?B?N2huVm94K2N0S3hrNnlhZnJUSTBoOFNuY0RBS0N6bjFpUXJjMStrRUtNbE5m?=
 =?utf-8?B?MEVOaGRmMktnZmVoRnNwNmV3aHg2UVNXOUtPeWlwZW5RRnBMSlhsbGpxUlA0?=
 =?utf-8?B?Qys4NEg0T0R1cjBOMWI3c0ljR1J5dTVSZGI1YW96NXlDNzl2YTVtVTU3MjFW?=
 =?utf-8?Q?ux/U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG1hSXI3bjNxNG9KOHVkU2JnaHM3ejFUUFgwWTlFWExNYkdFWW1YOGRPQWMv?=
 =?utf-8?B?QXRFOG1JUHBWWHVPRlh2MHRSTVR6cStLZnVwSjRzbXJGa0lpU2h0L09ISklZ?=
 =?utf-8?B?dk5jRndHbnN4cWEwdnlwdmpIZkVZb3MrYVdnYTV1blh1ZkNuTU80M2RzUkgx?=
 =?utf-8?B?M1BiUjF3V0JVeVhFMFJGVFEydTQyd2l1clZNZ084Ym5wWnA1ZWdiQzh2NXpL?=
 =?utf-8?B?L1lzSFB3bTZZZ2FVSEsrWmtSK1BsRE0zYnFYcmFKZHJRV09XYkMzdVlOalhs?=
 =?utf-8?B?TVkvZmxORWs2dE0zKzVZeCtOVnR2TFRLUFIybmQzamFuRCt4MWRzRWNCNlJ5?=
 =?utf-8?B?Z1BvMjBONXdwaEdqZDZ1L1p3R2RTR2tubGJ2TGdhZ0p5UXBRTEd5dFpOem5o?=
 =?utf-8?B?YjNJM2FNa1FjWHNpYmlkb2hodXZOYmFwaDAwR3ZONzV2SnA1NlJ0b21jSWxv?=
 =?utf-8?B?UEpIajNDMVBXTTIrOGluS05rUTJLOEpZUWUybEtINVFTWTl4WjRQUE9vNmM3?=
 =?utf-8?B?MStuSzRXZ2RyNlNTNnUwK1VGUUxXTllyakFCWFMyTTlTc0VmellhWmNQS2Jh?=
 =?utf-8?B?aG51eWhQcENZc0p0bkpmTXh6M1pjSlM1Rk9zRC9uSUd6WW4xQlZmUjNmMnJv?=
 =?utf-8?B?QTRDVTRMWUdZVE5pdUdic0xHWC9adFhJa3NwUmVHZUQ4ZUxhVkxWT1VZdXZ2?=
 =?utf-8?B?ZHYzc1V2QXdXZytZWFQ3MHJnY2xQSUVzeDNjeTJZaThTd3ZMT1NkTGx1aUVU?=
 =?utf-8?B?SUhUbjIvRUc5Rkt2aUtObkxLazd3S2RwbGtVak1Bb040RWUrbW1yTWQzR0hS?=
 =?utf-8?B?TXU3aUVieW9IK3NITWR1U3BkWUVidFU4ZFd3TVdkRDMyR2cyM0xjNDBMMjRz?=
 =?utf-8?B?V1RlZ1EwNFkzbFdOZU8rRms3dlZrb2g3eDBrZnM1NXFic0NWMG1hU3YyQW1K?=
 =?utf-8?B?OHBwZEdXMlRhZUNWN2JrN3BMVEFTejBZa0grK2dKT01oNEpqQ2Z4UVFCbklz?=
 =?utf-8?B?cU1yYmxXdEd2bGF1bUJZNG5rZEc4cXBvaUpUOGMxbjVNRTBKZGZlNUh0clZN?=
 =?utf-8?B?dXk3OFNZUEpvKzh5eUx0OUtIUTJvYkhaNHE1VXRJK0VaVDErSVQ3Z1N0b1VB?=
 =?utf-8?B?RXB5cy8yQXJlMjJETjMweEJKZVg0TzFXcWRiczl6Q2dpRFd4RHVsOGM0QkRK?=
 =?utf-8?B?QkNsb2M1NjJ0K1EwNitudVB0Y2p4WFNjQzNTbGw5SmZVSi9Da0NrN3FaZTNq?=
 =?utf-8?B?NDI0aE1UL1N5Ny8wNzRWRlFYdDdaV2RqUlN4NUFrK1dLdlJpT2ppNktEV1lj?=
 =?utf-8?B?TG9wY3N2T1dTT3FvaCs0ZlhsVTM1NFN2NkNVZmtBTjNydTR1V2JMWGtxMVhK?=
 =?utf-8?B?bWFnS21DaXdSZTl6T2ZTck9NRmMzWHlrdTFORFBPblZyeXowVHBsS2ExYVpC?=
 =?utf-8?B?ekN3cTBxSHR2OTZBaVppVUdrQ240Y2RkRXdOekxUeUtCb0ZyNXp2VUFDUmJM?=
 =?utf-8?B?dGhYeWJiaG9MektESkpuZm0wT3BmRHUvQm5ZSisyQTFqOHNCeHhtNWdOc1NZ?=
 =?utf-8?B?eVdsUE1wNmFRYWxFRWpETGN3Z055RHJKZnBtMUpoU2paVnVnVnhraThtRUtC?=
 =?utf-8?B?d3FJQzNFQUhDQit0SitsTEVYY3VHZlNncTFBU01kM01CYkRtM3dnWEdhYnND?=
 =?utf-8?B?RU52Z1N0Rk9vQXpFd3JLb25WRTYxUmRlY3FJM0RSLzNmNTBwWDVYTU4yeWVE?=
 =?utf-8?B?RVI5N2F1MDQ1L3FGaWxrVmpNZFI2Q3ZnRmQvVXllUGdMbk5kTG83bnQrZGdP?=
 =?utf-8?B?N2QyTnlUL3JVdDJZYWlINDc4UWlGZDhTMWdEUDMwemMzNlV4OXhzak85NDBG?=
 =?utf-8?B?emtudHFEVVhCT1diY2c5NmRxbW5ZVVlMdE9TMmVvVFBzUm4zV1lldUh0MFRG?=
 =?utf-8?B?YTV6NGJjMTVRK1luUWs5c3RTeHdLaDhJK0hNM0RCVXQyNEplblhKS1R2TDdE?=
 =?utf-8?B?cFRFdWh2ZmlyRzJuemRHSFhNQm02VHI3cTlISUpHQ2tndjByUTFZRkFJdmJp?=
 =?utf-8?B?QUMveUdWcFNIUXp6WFhtdHUrNXVsYkwweFV3eE1wRVc0Si91b2FqaWdxc0Fw?=
 =?utf-8?B?S1dSOE9hamFZUWc0SmxPbnovekRQdG9XV3RoVVBpWXNIdDVGTm1SenFOaG9Y?=
 =?utf-8?B?bGlkSzVjQXJEVCtSRFBONWVwRjI3aFlnOUZORkhkclgwaUFqczlGYUVFelRM?=
 =?utf-8?B?cmNhZXZxV3YvUHBNM1QySnRkUEJ2MHpCd0dlSEFPRVlIajlRMjBJVWxrQTZI?=
 =?utf-8?B?Z0VMTVRrQmN2ekxmbjQ2WEk3UmdPdS91OGtpTG5uL01vZ3IrQU93c0NHbEs0?=
 =?utf-8?Q?FQNpKLl22JkIpd3c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf6dc9e-daf5-43a6-27a8-08de67d6ab89
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 12:28:03.3315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vD0h3OUpfhiHf3bdbt2JniDRAXZaJ2P0trXubMj/Ign/xUgP2dLpZGPDoSqfJPeqcgYtcEX04ZoAwyiOHv0VZzwriThaLrMK/Pedeytmx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203
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

Hi Mohammed,

On Tue Feb 3, 2026 at 4:45 AM CET, Mohammed Bilal wrote:
> Remove the old connector_subtest macro and rename connector_test to
> connector_subtest everywhere, consolidating on a single macro name
> while keeping the improved implementation that properly handles
> connector iteration and skipping.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/chamelium/kms_chamelium_audio.c  | 16 ++---
>  tests/chamelium/kms_chamelium_edid.c   | 64 +++++++++--------
>  tests/chamelium/kms_chamelium_frames.c | 42 +++++------
>  tests/chamelium/kms_chamelium_helper.h |  9 +--
>  tests/chamelium/kms_chamelium_hpd.c    | 99 +++++++++++++-------------
>  5 files changed, 114 insertions(+), 116 deletions(-)
>
> diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_=
chamelium_audio.c
> index 030a01051..df8d27c0c 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -859,22 +859,22 @@ int igt_main()
>  	igt_describe("DisplayPort tests");
> =20
>  	igt_describe(test_display_audio_desc);
> -	connector_test("dp-audio", DisplayPort, &data, test_display_audio,
> -		       "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
> +	connector_subtest("dp-audio", DisplayPort, &data, test_display_audio,
The series currently adds connector_test() and then renames it back to
connector_subtest() in a later patch. This extra step makes the history
harder to read.  Please consider introducing the new helper directly as
connector_subtest() and dropping the temporary rename.

--=20
Best regards,
Sebastian

