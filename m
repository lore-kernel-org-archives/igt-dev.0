Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49594E77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 05:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF85510E23D;
	Wed,  8 Jan 2025 05:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+Rgsp4N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9731210E23D
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 05:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736313846; x=1767849846;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KiWdKTEHipUVNa3hzenYbQ7cyHdUCsYAu1fphGXzrSk=;
 b=W+Rgsp4NYS1pdIXi0i+dcB5Lyb6keMNR9fzxv9fSJZiv9tNqN14gs3G0
 P/tAK7QBpPCe2f/e02Ey9FlqyDaRVsB54FhvoAz4692UNCrlMy31W36T8
 bANkbTXweEuEUrUdlvJCHb+J2sXiQofCJQwlelMUZhjEP3Ajipify5jSe
 KhNm9op/wMoSSZKTGuEmMKbLEfgkSDofrapoZfWZMDSVyNRn9XOqJLjy+
 jChWwMaGXJprVBsR3xudKFT22oxUk4QraoQgnh6Y+6Vmk9VWcT7Vgt5UK
 VoUI4YELFSxggWcQxdwf1+g9cR5ACntq2tpVfWLL21J0dXsGovR4XCv1X A==;
X-CSE-ConnectionGUID: DqDqnlHdR667sAIATmsbWw==
X-CSE-MsgGUID: dqLI4/KER8WBFJCNvxWwQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36741415"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="36741415"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 21:24:06 -0800
X-CSE-ConnectionGUID: hAnzpWyWTd2/a8AL2mnWPA==
X-CSE-MsgGUID: tOlOW8pZSQCYU+UJBhot2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="108040020"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 21:24:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 21:24:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 21:24:05 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 21:24:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFS/I7wsS8UQ2cixDC0MzYblWGNboc47ePEiiD1yvH7rEmmVKevIrMTXUUJm/bojy8N7X5SGTp2NXwIIayrjvFvX4RbUXxMxBS7jZotLQB0HoR/XKD3ehflsHgMvz87/25JHwHExToozytsmmG7M3P9/SGkyBilwAoPIgVPGDFo344Dpalz5y6sGRg9pj3FmkoaNlvKK9bBiOlAhTdkAHj4a3Ou6bBoQR+9ExNZkQG+Uhf7DFfCZP5xq3hLRuIQciRNyVN13ZkV8YLJ8TpqqUYYHdSJXY2fW/h/U3GOGinsDTH69PbLzK9b7lQ2TLG7lVOnvNyXAtfhnIqYVHJtxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHgUh6brDmJieLq6hSPiWfgYkHQR4jCBNjl5UmuVTKA=;
 b=LLJTTnAFvctx6BPtHwieZOvziubQHM3oFuwUsTQCOz+Q0PwWONqss3yn+XkzQDl60kGRuUEAgJTdj8OMgVZHh4ocVuVFZ9BiieVPLzgz+kn5dOs9tn9LZbCeH6buI0hGOrSf9NdNGK/RpTNUoRa4E67L4+JNhNkm5tAo48tned7sRZRTOh+Ef4LLIGWtX95DQx54by5fRJnK2EKbD1TQcdN3pXMSz9owT9Ls49nGaGfqymeMslQ97yZlGsC5YfhE+NNqSXDiwTGphi4VgvAL1BKKXbgNhm3+q0fkeC1k2TAm8bEARNNXRSdt81t0VvnHg7LaEVlJLBLimMQEWu0ETg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 05:23:36 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 05:23:36 +0000
Date: Wed, 8 Jan 2025 10:53:27 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Senna, Peter" <peter.senna@intel.com>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>, "Knop, Ryszard" <ryszard.knop@intel.com>,
 "Lattannavar, Sameer" <sameer.lattannavar@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "gregory.f.germano@intel.com"
 <gregory.f.germano@intel.com>, "Taylor, Clinton A"
 <clinton.a.taylor@intel.com>, "Yu, Jianshui" <jianshui.yu@intel.com>
Subject: Re: [PATCH RFC i-g-t] lib/igt_kmemleak: library to interact with
 kmemleak
Message-ID: <Z34Lz0Zd4X_mfGHf@bvivekan-mobl1>
References: <20241216184642.133454-1-peter.senna@linux.intel.com>
 <CH0PR11MB54444E8ACF985B488C2E0C01E5112@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH0PR11MB54444E8ACF985B488C2E0C01E5112@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: PN2PR01CA0190.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::15) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CH3PR11MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f66196d-a084-4061-0edc-08dd2fa499f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0xzRkJkaG14MUFWQ0ZaZmdyUkVFN3ZxSlFzU2E3c3h0eitTbndHUnhNTGlZ?=
 =?utf-8?B?aDZCWEpweW1GWGN6aldXbGRRMVUxRm9FN2JKQ0JNZHZJRlZDVEY4TjlyeFFL?=
 =?utf-8?B?cXBKaktFYUI2UE5ObVBuTFRNLy8reXIzN0VydmNVNEgwN0FFVmNWVUVyZ0RG?=
 =?utf-8?B?aWNBVytOempOS2E3Q2hLMWxQcGRQTGgyV0NxNWF3cmZHWmdrMFh3LytRVkx6?=
 =?utf-8?B?ZjQwZTZVVzRXbmJiOVJFaEFQdXh0d1Jwazd1Tnp5UU1jc3p2QmM0c0x2Skdt?=
 =?utf-8?B?NzV1YkxWMkk3QTBIUlU1Z1ROYXB4L3hJOUtuKzV0YndCbFQvUmh2R0xXd2Iy?=
 =?utf-8?B?MG1vY3FSWEdlWFl6WjNTdDRrYXhUaXJWMjREN2svTUp1WmpDaFFGSWxTK0w0?=
 =?utf-8?B?czRsZG9FWjJvV2pEMkNOTFBXdThsOHZVYXpOTkEyN1U0RTRJY1JWNW1iVlB3?=
 =?utf-8?B?OXNzMlg2TjgxeWErZkVHK0dSSWllU2VjT1dUK1FPOFF2YlJES2Yvenc4d3Rp?=
 =?utf-8?B?bTl4eVdxQUdyK0ZuYVNmYTU1SGFJcCtNUWhrR29JUlBNZDR6bGhjS1BONzZK?=
 =?utf-8?B?N1lLS1Vqc1JFSGIxbmI5bkZFQVJEdkREbENEdDRPVWJlZXQ4bEVITnhjOU9U?=
 =?utf-8?B?MjZqVm9WZnJYRGV3RW56UHBoVEpqK3d4dkJJQ2wwbGh1TTdHYmNoK2dKa0RH?=
 =?utf-8?B?TUdveW50MEpid1c2dUwydGxoSU8xZ1NRS0ZkSHhDYS94VzFEaS9BaXU0NzFJ?=
 =?utf-8?B?emtmdXprc3B0Z0VMUTRJYnZwNlVGa1hJWWVjQTJFZndrdHN3ZDUvamFtZzEy?=
 =?utf-8?B?a09JWGExbzcwQjVkdVU4Rjd4TS9FRS9OU1J1UE1VeVUwZTRnaTByTjVBb1g1?=
 =?utf-8?B?UmFQbnFlaDg1aWRlMG9GUVRJWUhPQVI1dmxNTFFwMDF0UEsrVlpiTndoRm4x?=
 =?utf-8?B?aERtM0FYODVlUm1aSzd3RjZ5K0dZcVVPRk5RK3I3ZEp6WDRpNnV3d015WHVY?=
 =?utf-8?B?M2V0SnA5SDFhRStxd3ZvcFhxK2VUMHVWWk92ZG4yL1Y1d0l2a3UySGZEWFRM?=
 =?utf-8?B?UEFoWldtT21VSUlQc3hrTWRiVUhTbXpsQ1VvelJiMkFoR3hhV0d1UitTdUoy?=
 =?utf-8?B?V01jV0dncHRLdTJEZGdJS2ViWXpEbWJ4ZDNJUlAxaHRwNEtISFJ3QWVNTW1q?=
 =?utf-8?B?L3YyeERRZUUvMU8vYm9KYmhxN2NrOFZKRVFsK1pXUWJmdXZkcXcvYk82TEZ5?=
 =?utf-8?B?c1BPeEg0U3VvSHgva1ZoV21wRkZMMlVaLzhqRWw5bXBVNk5TQ3RhSzFLWk56?=
 =?utf-8?B?TnRFTE9iZGZzbWRTVjlVTDN2YVB6QjlrK05kMjJMbXVOUUdML2pPRU1xMFdF?=
 =?utf-8?B?TTNKZ3NUKzg0WisveE1NZkx6Qk5ZV3N3UWVjL0VSZTBIU21jQXFlVUZXZnRa?=
 =?utf-8?B?bnkweEpBMTBuZ2JYaTljbStmOWIxL3lSSjlqVitsa0ZEUVZTN3R4blU4aW8y?=
 =?utf-8?B?TDMxajJKZTBqdStvdTFwYzRiT3BiclVyUGg0ampZdHVBYkJMVmxPbHhqanhD?=
 =?utf-8?B?SDkyY1hKL2w1aVRCTmFLbEVKQzdkNXFzdGx4M3Zpd0JMYWU3SG02Z2twRjVM?=
 =?utf-8?B?cVhVdGs4SU1DNDdjc0Z3bUoxSm1jYVFYdklQYTNrejc2bVowdzAwR01KTjR5?=
 =?utf-8?B?WGcrYUN5Sk1GbGROUS9QQ0xldS9jdGdFZS9COUNwYTR6dVR3WTFYQWtEYnZH?=
 =?utf-8?B?N0FSNFBkSzcxZ1lJQlFjay84U1pwd0RSUURiOTBhNkliU2FyS0Z6M1dTL1Mw?=
 =?utf-8?B?Q05PdHpjNHdMaEJXZjNNVXNzZjZPcC9IcGpwZnd6dzJZaTRXSDZnTXVBdWdh?=
 =?utf-8?Q?RDnp1tgPrPQCF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3hJNkZZUlVsU2dBaHVMMDI4L0hjY0p4Z3F5VW1pc0ljblJJK2cwSUorLzhz?=
 =?utf-8?B?dTlGN3V2Tm5mN0pBUkxId0p3c2NPMnJHc1p5TlZ3UVFkeXZhMjhOcTUvYTBz?=
 =?utf-8?B?azJhbG1hd24wQ1l2eFkwSkFSM2tqclVGYXkweXRMcTVmdlNXK1FOU0NOVE9t?=
 =?utf-8?B?Y2UyRlkzNzJZYlZocjVhNE9ILzVxYWxrQWtXNUVtK0FJUStRaGMxVVMwa2kr?=
 =?utf-8?B?elJ5T0p6U2hzQ3gzRjQwL1hyYUM1aXN3UFUyakFmdExEM013SEkzb1NlTWtw?=
 =?utf-8?B?aWl2cFN0RjJMUFhqaDluQ3JHS1puNGN3MjY5ZDBhbVBtZXJ1bFhVcWpXWTh1?=
 =?utf-8?B?R1NVelBEYW9NdGdzR2l2V1V6ZHpHRzhzVktvWHEzdjdaU0oyUXVHQU9WUmFQ?=
 =?utf-8?B?Q2hydXNzT1Rrd1dxUmdQU0I4MU9qSG5BZUttZDJ2VmxXQUd2T1cwQ2NFNy9X?=
 =?utf-8?B?dHRQamVaREdxWkk4b1JYaUk0VkNYSjJzdGpRS3Q3dGtkZWxDQnhENTlvSmRt?=
 =?utf-8?B?WUJqeVpQbWI4N1l0cEt2RTQrY1k0Z1hMd1JzK01TczZQOGZlQ09iTVpGNzdW?=
 =?utf-8?B?UGdabzFxbCtqZklTOTVtekd3THZQNzJIWmpDcHFZa1Rnd0xTaFZ5UHFPSVR3?=
 =?utf-8?B?eWtZSm9Vb3lpVXhpRm96RFhNUExhQW9oY0FVbytLeW14aEI5K01NeDk5TERk?=
 =?utf-8?B?b2RBNnRMK2xsaW5Pc2QvRFQxcG1kQ2IrNTdsVUY2QnRmYWYwbVNDV3VIdVFz?=
 =?utf-8?B?cEMwc3pTZGZhOWxyY041clRFZ2kraGtVUksyVUxVUmxOcUZEd29DaVAwY2pi?=
 =?utf-8?B?MmlNT0Fva3BINkdnTHdjZjJ4UkpVdWhhL1NJT3psQTNSMTFqa1pSZVY5UUkx?=
 =?utf-8?B?N0x5WlJxZkVjY0RObGI5TmIvQnhJQWcrcUJLdWRuckZJMU95U3JEMjJPdEt3?=
 =?utf-8?B?ZTN2MktnTWg0U3M2S3VHN0N5MXBOamJEZFVSbXFMeHZoM1FGU29XYUN5MU1S?=
 =?utf-8?B?VGxOQitxOEtHMUFmYnlGRkhKRktmME1RR0h1WklCVDAvbXpsNjRGWUtpUzND?=
 =?utf-8?B?KzQ4bGVxSCt2RXZHbUxORStWWGRlWGFvcUtUV2hkZjFhZVc0OFJKRGFFc2NM?=
 =?utf-8?B?NWEzT25yeDZwcGxqM29vWXpCM3ByNFVMcXlWcGx1Qks0RG1RK0RkRTRJWkw2?=
 =?utf-8?B?K2M3VllMZVBFWkl0ck1DRzQyRC9uWW1iMTFCd0tJWWQrY1QwSWM0d3Exak5W?=
 =?utf-8?B?d2l2QmM3QkRvOHZ5M2JoR2g1VzdFZVVnVXEzMGhBenpYd0JlbnZ4YUNFNW8w?=
 =?utf-8?B?UlR2Ti9jK1BzdTRjNWRKTFZ2bXY5SHJZY1JNdFg2b2hlUmpnaHgzZHZ0RE43?=
 =?utf-8?B?TzFTV0lVOFVzbVVrd0RaalgzNmFrZHNUM0FYWDZuY3gzWWRVR1owdWUycUEy?=
 =?utf-8?B?TkIwZlg0aE92cEtkbFBtcVVUWlljSlN3ekIyaTdJZm5xM0JLanhON2lvL2NM?=
 =?utf-8?B?TmgrbW1xWThmVzZnUWh1Uk8wTlVmb3pVVThFZ1lCc25taVNDazJJeFo0Y205?=
 =?utf-8?B?Y3BHRWJDaFZkVmloeCtEZFlmTUtRRFgybnI0SUo3bHNhREpJV2xMQ1ZMTnFD?=
 =?utf-8?B?S1JIenJxOGdjMUthWENuYlFpQ3VSalRXMWdCTmxYSTJSRkZYQnpvRU5DcGha?=
 =?utf-8?B?K3RlaGduUkZiRG92ZHpMVG43WlBBbW1VdWttbHdCSEIyVU5Dbm83aG0yTnhx?=
 =?utf-8?B?UjZRWHhSYUpKVytzRzlGNUNCdFhiZzVkR1lGR2x5ZEhIREdZR2pUbVE5QUNi?=
 =?utf-8?B?WS9wQmR5VGl5OTdXMkcxY1A4aG0vTHNNN3FYd0xwaWpncEYwdHNGUU9Bb0FW?=
 =?utf-8?B?S1hGS1NCcFlGVS9hblQ0ZktkT0NQRUNMdW45RExOc3RyUERoWXlobmV6ekh1?=
 =?utf-8?B?MU9zN0hzT0VEOWFFRDlIdDZqZDdNeEFqeFR0bTR6UC9GR1Z2SHVzcUFOeTZQ?=
 =?utf-8?B?Rk9naHNCNlpMM0FKZzF3WlVTN2gwL0l0QVovN2xDbUU1VXlJbXlQQTBVaVlj?=
 =?utf-8?B?WDV2M0ZRSTFiRkdoT1RrMmhlaVVreGdIYVlXZW42RVE4M2dIKzNXRUYwUGhW?=
 =?utf-8?B?M0pkdVZ2YzU1dk55Mys4WkNjZWtWa0V1a3VLTGV0Ymd4VlpNblVVVGNxSmZa?=
 =?utf-8?Q?wVQHCzC7hNL6Q32UOzV3OWU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f66196d-a084-4061-0edc-08dd2fa499f6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 05:23:36.4532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CWRn8FS5NJQJO7485ArP1x46nf1u3jf2O5pty8qfpoc6B1Ql24nK3r12eomQDK/3r9SE1W1hkcdqEQg16O+kNnPZ2YZpq8gUsRPr6gj7hlKY1pQVYYp+JqLr+kZwzG3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
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

On 08.01.2025 01:47, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Peter Senna Tschudin
> Sent: Monday, December 16, 2024 10:47 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Senna, Peter <peter.senna@intel.com>; Gandi, Ramadevi <ramadevi.gandi@intel.com>; Knop, Ryszard <ryszard.knop@intel.com>; Lattannavar, Sameer <sameer.lattannavar@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Saarinen, Jani <jani.saarinen@intel.com>; Piecielska, Katarzyna <katarzyna.piecielska@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; gregory.f.germano@intel.com; Taylor, Clinton A <clinton.a.taylor@intel.com>; Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com>; Yu, Jianshui <jianshui.yu@intel.com>; Peter Senna Tschudin <peter.senna@linux.intel.com>
> Subject: [PATCH RFC i-g-t] lib/igt_kmemleak: library to interact with kmemleak
> > 
> > From: Peter Senna Tschudin <peter.senna@intel.com>
> > 
> > Adds a simple library for interacting with kmemleak ispired by
> > 'tests/amdgpu/amd_mem_leak.c'. Also adds unit testing for the
> > library.
> > 
> > To use the library include "igt_kmemleak.h" and:
> >  1. igt_kmemleak_init(NULL) /* Returns true if kmemleak is active */
> >  2. igt_kmemleak_clear()
> >  3. /* Run your test */
> >  4. igt_kmemleak_scan()
> >  5. if (igt_kmemleak_found_leaks())
> >        igt_kmemleak_cp_leaks_file(*dst)
> > 
> > CC: ramadevi.gandi@intel.com
> > CC: ryszard.knop@intel.com
> > CC: sameer.lattannavar@intel.com
> > CC: lucas.demarchi@intel.com
> > CC: jani.saarinen@intel.com
> > CC: katarzyna.piecielska@intel.com
> > CC: matthew.d.roper@intel.com
> > CC: gregory.f.germano@intel.com
> > CC: clinton.a.taylor@intel.com
> > CC: balasubramani.vivekanandan@intel.com
> > CC: jianshui.yu@intel.com
> > Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> 
> I'm not particularly well-versed in kmemleak, but nothing about this patch seems out of the
> ordinary.  Though I can still offer some small style-related suggestions.
> Also, do you want a reviewed-by for this?  I'd give one right now but I don't think I should be
> Acking RFC patches.
> 
> > ---
> >  lib/igt_kmemleak.c       | 154 +++++++++++++++++++++
> >  lib/igt_kmemleak.h       |  69 ++++++++++
> >  lib/meson.build          |   1 +
> >  lib/tests/igt_kmemleak.c | 291 +++++++++++++++++++++++++++++++++++++++
> >  lib/tests/meson.build    |   1 +
> >  5 files changed, 516 insertions(+)
> >  create mode 100644 lib/igt_kmemleak.c
> >  create mode 100644 lib/igt_kmemleak.h
> >  create mode 100644 lib/tests/igt_kmemleak.c
> > 
> > diff --git a/lib/igt_kmemleak.c b/lib/igt_kmemleak.c
> > new file mode 100644
> > index 000000000..02ee0361d
> > --- /dev/null
> > +++ b/lib/igt_kmemleak.c
> > @@ -0,0 +1,154 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include <ctype.h>
> > +#include <libudev.h>
> > +#include <stdio.h>
> > +#include <sys/time.h>
> > +#include <time.h>
> > +
> > +#include "igt_core.h"
> > +#include "igt_device_scan.h"
> > +#include "igt_kmemleak.h"
> > +#include "igt_kmod.h"
> > +#include "igt_list.h"
> > +
> > +/* We can change the path for unit testing, see igt_kmemleak_init() */
> > +static char igt_kmemleak_file[256] = "/sys/kernel/debug/kmemleak";
> > +
> > +/**
> > + * igt_kmemeak_init:
> > + * @igt_kmemleak_file: update the path to kmemleak file to enable unit testing
> > + *
> > + * Check if kmemleak is enabled in the kernel, if debugfs is mounted and
> > + * if kmemleak file is present and readable.
> > + *
> > + * Returns: true if kmemleak is enabled, false otherwise.
> > + */
> > +bool igt_kmemleak_init(const char *unit_test_kmemleak_file)
> > +{
> > +	FILE *fp;
> > +
> > +	if (unit_test_kmemleak_file)
> > +		snprintf(igt_kmemleak_file,
> > +			 sizeof(igt_kmemleak_file),
> > +			 "%s",
> > +			 unit_test_kmemleak_file);
> > +
> > +	fp = fopen(igt_kmemleak_file, "r");
> > +	if (!fp)
> > +		return false;
> > +
> > +	fclose(fp);
> > +	return true;
> > +}
> > +
> > +/**
> > + * igt_kmemeak_cmd:
> > + * @cmd: command to send to kmemleak
> > + *
> > + * Send a command to kmemleak.
> > + *
> > + * Returns: true if sending the command was successful, false otherwise.
> > + */
> > +bool igt_kmemleak_cmd(const char *cmd)
> > +{
> > +	FILE *fp;
> > +
> > +	fp = fopen(igt_kmemleak_file, "r+");
> > +	if (!fp)
> > +		return false;
> > +
> > +	if (fwrite(cmd, 1, strlen(cmd), fp) != strlen(cmd)) {
> > +		fclose(fp);
> > +		return false;
> > +	}
> 
> Maybe we can reduce the number of fclose calls by capturing the fwrite return value:
> """
> bool igt_kmemleak_cmd(const char *cmd)
> {
> 	FILE *fp;
> 	size_t wlen;
> 
> 	fp = fopen(igt_kmemleak_file, "r+");
> 	if (!fp)
> 		return false;
> 
> 	wlen = fwrite(cmd, 1, strlen(cmd), fp);
> 	fclose(fp);
> 
> 	return wlen == strlen(cmd);
> }
> """
> Though that's not strictly necessary here.
> 
> > +
> > +	fclose(fp);
> > +	return true;
> > +}
> > +
> > +/**
> > + * igt_kmemeak_scan:
> > + *
> > + * Trigger an immediate scan on kmemleak.
> > + *
> > + * Returns: true if sending the command to scan was successful, false otherwise.
> > + */
> > +bool igt_kmemleak_scan(void)
> > +{
> > +	return igt_kmemleak_cmd("scan");
> > +}
> > +
> > +/**
> > + * igt_kmemeak_clear:
> > + *
> > + * Trigger an immediate clear on kmemleak.
> > + *
> > + * Returns: true if sending the command to clear was successful, false
> > + * otherwise.
> > + */
> > +bool igt_kmemleak_clear(void)
> > +{
> > +	return igt_kmemleak_cmd("clear");
> > +}
> > +
> > +/**
> > + * igt_kmemeak_found_leaks:
> > + *
> > + * Check if kmemleak found any leaks.
> > + *
> > + * Returns: true if kmemleak found any leaks, false otherwise.
> > + */
> > +bool igt_kmemleak_found_leaks(void)
> > +{
> > +	FILE *fp;
> > +	char buf[1];
> > +
> > +	fp = fopen(igt_kmemleak_file, "r");
> > +	if (!fp)
> > +		return false;
> > +
> > +	if (fread(buf, 1, 1, fp) <= 0) {
> > +		fclose(fp);
> > +		return false;
> > +	}
> 
> Same comment as with igt_kmemleak_cmd above:
> """
> bool igt_kmemleak_found_leak(void)
> {
> 	FILE *fp;
> 	char buf[1];
> 	size_t rlen;
> 
> 	fp = fopen(igt_kmemleak_file, "r");
> 	if (!fp)
> 		return false;
> 
> 	rlen = fread(buf, 1, 1, fp);
> 	fclose(fp);
> 
> 	return rlen > 0;
> }
> """
> Though, again, this isn't strictly necessary.
> 
> > +
> > +	/* fread() did read 1 char */
> > +	fclose(fp);
> > +	return true;
> > +}
> > +
> > +/**
> > + * igt_kmemeak_cp_leaks_file:
> > + * @dst: path of destination file including the file name
> > + *
> > + * Copy kmemleak file to dst.
> > + *
> > + * Returns: true if copy was successful, false otherwise
> > + */
> > +bool igt_kmemleak_cp_leaks_file(const char *dst)
> > +{
> > +	FILE *src, *dest;
> > +	char buf[1024];
> > +	size_t n;
> > +
> > +	src = fopen(igt_kmemleak_file, "r");
> > +	if (!src)
> > +		return false;
> > +
> > +	dest = fopen(dst, "w");
> > +	if (!dest) {
> > +		fclose(src);
> > +		return false;
> > +	}
> > +
> > +	while ((n = fread(buf, 1, sizeof(buf), src)) > 0)
> > +		fwrite(buf, 1, n, dest);
> > +
> > +	fclose(src);
> > +	fclose(dest);
> 
> I think these two fclose calls should swap places for style reasons, but it's also
> not particularly important.
> 
> > +	return true;
> > +}
> > diff --git a/lib/igt_kmemleak.h b/lib/igt_kmemleak.h
> > new file mode 100644
> > index 000000000..a65f31810
> > --- /dev/null
> > +++ b/lib/igt_kmemleak.h
> > @@ -0,0 +1,69 @@
> > +/* SPDX-License-Identifier: MIT
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef IGT_KMEMLEAK_H
> > +#define IGT_KMEMLEAK_H
> > +
> > +#include <stdbool.h>
> > +
> > +/**
> > + * igt_kmemeak_init:
> > + * @igt_kmemleak_file: update the path to kmemleak file to enable unit testing
> > + *
> > + * Check if kmemleak is enabled in the kernel, if debugfs is mounted and
> > + * if kmemleak file is present and readable.
> > + *
> > + * Returns: true if kmemleak is enabled, false otherwise.
> > + */
> 
> I don't think we need comments like this for both the implementation
> and the header file.  The former should be sufficient.
> 
> > +bool igt_kmemleak_init(const char *unit_test_kmemleak_file);
> > +
> > +/**
> > + * igt_kmemeak_cmd:
> > + * @cmd: command to send to kmemleak
> > + *
> > + * Send a command to kmemleak.
> > + *
> > + * Returns: true if sending the command was successful, false otherwise.
> > + */
> > +bool igt_kmemleak_cmd(const char *cmd);
> > +
> > +/**
> > + * igt_kmemeak_scan:
> > + *
> > + * Trigger an immediate scan on kmemleak.
> > + *
> > + * Returns: true if sending the command to scan was successful, false otherwise.
> > + */
> > +bool igt_kmemleak_scan(void);
> > +
> > +/**
> > + * igt_kmemeak_clear:
> > + *
> > + * Trigger an immediate clear on kmemleak.
> > + *
> > + * Returns: true if sending the command to clear was successful, false
> > + * otherwise.
> > + */
> > +bool igt_kmemleak_clear(void);
> > +
> > +/**
> > + * igt_kmemeak_found_leaks:
> > + *
> > + * Check if kmemleak found any leaks.
> > + *
> > + * Returns: true if kmemleak found any leaks, false otherwise.
> > + */
> > +bool igt_kmemleak_found_leaks(void);
> > +
> > +/**
> > + * igt_kmemeak_cp_leaks_file:
> > + * @dst: path of destination file including the file name
> > + *
> > + * Copy kmemleak file to dst.
> > + *
> > + * Returns: true if copy was successful, false otherwise
> > + */
> > +bool igt_kmemleak_cp_leaks_file(const char *dst);
> > +
> > +#endif /* IGT_KMEMLEAK_H */
> > diff --git a/lib/meson.build b/lib/meson.build
> > index 640513e6c..24423ef37 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -96,6 +96,7 @@ lib_sources = [
> >  	'igt_dummyload.c',
> >  	'igt_store.c',
> >  	'uwildmat/uwildmat.c',
> > +	'igt_kmemleak.c',
> >  	'igt_kmod.c',
> >  	'igt_ktap.c',
> >  	'igt_panfrost.c',
> > diff --git a/lib/tests/igt_kmemleak.c b/lib/tests/igt_kmemleak.c
> > new file mode 100644
> > index 000000000..f5bf5ca07
> > --- /dev/null
> > +++ b/lib/tests/igt_kmemleak.c
> > @@ -0,0 +1,291 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include <ctype.h>
> > +#include <fcntl.h>
> > +#include <stdio.h>
> > +#include <zlib.h>
> > +
> > +#include "igt_core.h"
> > +#include "igt_kmemleak.h"
> > +
> > +const char *kmemleak_file_example =
> > +"unreferenced object 0xffff888102a2e638 (size 80):\n"
> > +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> > +" hex dump (first 32 bytes):\n"
> > +"   00 00 00 00 00 00 00 00 0d 01 a2 00 00 00 00 00  ................\n"
> > +"   f0 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> > +" backtrace (crc 2df71a7e):\n"
> > +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> > +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> > +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> > +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> > +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> > +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> > +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> > +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> > +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> > +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> > +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> > +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> > +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> > +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> > +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> > +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> > +"unreferenced object 0xffff888102a2ed18 (size 80):\n"
> > +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> > +" hex dump (first 32 bytes):\n"
> > +"   38 e6 a2 02 81 88 ff ff 0d 11 2d 00 00 00 00 00  8.........-.....\n"
> > +"   f2 7c 03 00 00 c9 ff ff 58 ea a2 02 81 88 ff ff  .|......X.......\n"
> > +" backtrace (crc ec2a8bdc):\n"
> > +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> > +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> > +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> > +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> > +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> > +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> > +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> > +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> > +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> > +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> > +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> > +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> > +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> > +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> > +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> > +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> > +"unreferenced object 0xffff888102a2ea58 (size 80):\n"
> > +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> > +" hex dump (first 32 bytes):\n"
> > +"   38 e6 a2 02 81 88 ff ff 0d 01 a0 00 00 00 00 00  8...............\n"
> > +"   f6 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> > +" backtrace (crc f911c0d1):\n"
> > +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> > +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> > +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> > +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> > +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> > +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> > +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> > +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> > +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> > +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> > +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> > +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> > +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> > +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> > +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> > +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> > +"unreferenced object 0xffff888102a2e428 (size 80):\n"
> > +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> > +" hex dump (first 32 bytes):\n"
> > +"   58 ea a2 02 81 88 ff ff 0d 01 35 00 00 00 00 00  X.........5.....\n"
> > +"   fc 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> > +" backtrace (crc cb8aaffd):\n"
> > +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> > +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> > +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> > +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> > +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> > +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> > +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> > +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> > +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> > +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> > +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> > +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> > +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> > +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> > +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> > +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> > +"unreferenced object 0xffff888102a2e008 (size 80):\n"
> > +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> > +" hex dump (first 32 bytes):\n"
> > +"   28 e4 a2 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  (.........-.....\n"
> > +"   fc 7c 03 00 00 c9 ff ff c8 e2 a2 02 81 88 ff ff  .|..............\n"
> > +" backtrace (crc 7f883e78):\n"
> > +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> > +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> > +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> > +"   [<ffffffff81c2b9e5>] acpi_ps_get_next_namepath+0x1f5/0x390\n"
> > +"   [<ffffffff81c2cc15>] acpi_ps_parse_loop+0x4a5/0xa60\n"
> > +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> > +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> > +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> > +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> > +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> > +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> > +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> > +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> > +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> > +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> > +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> > +"unreferenced object 0xffff888102a2e2c8 (size 80):\n"
> > +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> > +" hex dump (first 32 bytes):\n"
> > +"   28 e4 a2 02 81 88 ff ff 0d 01 73 00 00 00 00 00  (.........s.....\n"
> > +"   00 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> > +" backtrace (crc 338c016):\n"
> > +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> > +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> > +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> > +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> > +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> > +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> > +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> > +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> > +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> > +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> > +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> > +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> > +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> > +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> > +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> > +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> > +"unreferenced object 0xffff888102a2e378 (size 80):\n"
> > +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> > +" hex dump (first 32 bytes):\n"
> > +"   c8 e2 a2 02 81 88 ff ff 0d 01 0d 00 00 00 00 00  ................\n"
> > +"   01 7d 03 00 00 c9 ff ff 98 e7 a2 02 81 88 ff ff  .}..............\n"
> > +" backtrace (crc 665fb8a7):\n"
> > +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> > +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> > +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> > +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> > +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> > +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> > +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> > +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> > +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> > +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> > +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> > +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> > +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> > +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> > +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> > +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> > +"unreferenced object 0xffff888102a2e798 (size 80):\n"
> > +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> > +" hex dump (first 32 bytes):\n"
> > +"   7c8 e2 a2 02 81 88 ff ff 0d 01 98 00 00 00 00 00  ................\n"
> > +"   1b 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> > +" backtrace (crc b7a23a1c):\n"
> > +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> > +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> > +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> > +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> > +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> > +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> > +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> > +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> > +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> > +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> > +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> > +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> > +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> > +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> > +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> > +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> > +"unreferenced object 0xffff888102a2e0b8 (size 80):\n"
> > +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> > +" hex dump (first 32 bytes):\n"
> > +"   98 e7 a2 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  ..........-.....\n"
> > +"   1c 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> > +" backtrace (crc 14d67a9c):\n"
> > +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> > +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> > +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> > +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> > +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> > +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> > +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> > +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> > +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> > +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> > +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> > +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> > +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> > +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> > +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> > +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170\n";
> > +
> > +static unsigned long crc32_file(int fd)
> > +{
> > +	unsigned long crc;
> > +	char buf[1024];
> > +	ssize_t n;
> > +
> > +	crc = crc32(0, Z_NULL, 0);
> > +	while ((n = read(fd, buf, sizeof(buf))) > 0)
> > +		crc = crc32(crc, (const Bytef *)buf, n);
> > +
> > +	return crc;
> > +}
> > +
> > +static void test_igt_kmemleak_cp_leaks_file(void)
> > +{
> > +	char dst_file_path[256] = "/tmp/igt_kmemleak_dstfile_XXXXXX";
> > +	int fd;
> > +	unsigned long crc;
> > +
> > +	fd = mkstemp(dst_file_path);
> > +	close(fd);
> > +
> > +	igt_assert(igt_kmemleak_cp_leaks_file(dst_file_path));
> > +
> > +	/* Test that both files have the same size */
> > +	fd = open(dst_file_path, O_RDONLY);
> > +	igt_assert(fd >= 0);
> > +	igt_assert(lseek(fd, 0, SEEK_END) == strlen(kmemleak_file_example));
> > +	close(fd);
> > +
> > +	/* Test that both files have the same content */
> > +	crc = crc32(0, Z_NULL, 0);
> > +	crc = crc32(crc,
> > +		    (const Bytef *)kmemleak_file_example,
> > +		    strlen(kmemleak_file_example));

Did you miss the changes to compare the CRC?

Regards,
Bala

> > +
> > +	fd = open(dst_file_path, O_RDONLY);
> > +	igt_assert(fd >= 0);
> > +	igt_info(" dst_file: %s\n", dst_file_path);
> > +	close(fd);
> > +}
> > +
> > +static void test_empty_file(void)
> > +{
> > +	char tmp_file_path[256] = "/tmp/igt_kmemleak_test_XXXXXX";
> > +	int fd;
> > +
> > +	fd = mkstemp(tmp_file_path);
> > +	igt_assert(fd >= 0);
> > +	close(fd);
> > +
> > +	/* Set the path for the unit testing file */
> > +	igt_assert(igt_kmemleak_init(tmp_file_path));
> > +	igt_assert(!igt_kmemleak_found_leaks());
> > +}
> > +
> > +static void test_non_empty_file(void)
> > +{
> > +	char tmp_file_path[256] = "/tmp/igt_kmemleak_test_XXXXXX";
> > +	int fd;
> > +
> > +	fd = mkstemp(tmp_file_path);
> > +	igt_assert(fd >= 0);
> > +	write(fd, kmemleak_file_example, strlen(kmemleak_file_example));
> > +
> > +	/* Set the path for the unit testing file */
> > +	igt_assert(igt_kmemleak_init(tmp_file_path));
> > +
> > +	/* Test igt_kmemleak_found_leaks() that should return true */
> > +	igt_assert(igt_kmemleak_found_leaks());
> 
> test_empty_file and test_non_empty_file could probably be consolidated into a single
> "test_file" or "test_kmemleak_file" test with a Boolean determining if we want to write
> to the test file or not:
> """
> static void test_kmemleak_file(bool write)
> {
> 	char tmp_file_path[256] = "/tmp/igt_kmemleak_test_XXXXXX";
> 	int fd = mkstemp(tmp_file_path);
> 	igt_assert(fd >= 0);
> 
> 	if (write)
> 		write(fd, kmemleak_file_example, strlen(kmemleak_file_example));
> 
> 	/* Set the path for the unit testing file */
> 	igt_assert(igt_kmemleak_init(tmp_file_path));
> 	
> 	/* Test igt_kmemleak_found_leaks() returns true if written */
> 	igt_assert(igt_kmemleak_found_leaks() == write);
> 
> 	close(fd);
> }
> ...
> igt_simple_main
> {
> 	test_kmemleak_file(false);
> 	test_kmemleak_file(true);
> 	test_igt_kmemleak_cp_leaks_file();
> }
> """
> 
> > +}
> > +
> > +igt_simple_main
> > +{
> > +	test_empty_file();
> > +	test_non_empty_file();
> > +	test_igt_kmemleak_cp_leaks_file();
> 
> It might be better to separate these out into their own subtests:
> """
> 	igt_subtest_f("empty-file")
> 		test_empty_file();
> 	igt_subtest_f("non-empty-file")
> 		test_non_empty_file();
> 	igt_subtest_f("cp-leaks-file")
> 		test_igt_kmemleak_cp_leaks_file();
> """
> 
> Though looking at it a bit closer, I see that test_igt_kmemleak_cp_leaks_file depends
> on the completion of test_non_empty_file to run properly?  Maybe we should separate
> the test out into chunks?
> 
> Let me try prototyping it here:
> """
> --- Original file up to end of crc32_file function is unchanged ---
> 
> static void init_kmemleak_file(bool write)
> {
> --- Same as test_kmemleak_file from earlier suggestion ---
> }
> 
> static void test_kmemleak_cp_leaks_file(void)
> {
> 	char dst_file_path[256] = "/tmp/igt_kmemleak_dstfile_XXXXXX";
> 	int fd;
> 	unsigned long crc;
> 
> 	init_kmemleak_file(true);
> 
> 	fd = mkstemp(dst_file_path);
> --- Rest of test is unchanged after this point ---
> }
> 
> igt_main
> {
> 	igt_subtest_f("empty")
> 		init_kmemleak_file(false);
> 	igt_subtest_f("non-empty")
> 		init_kmemleak_file(true);
> 	igt_subtest_f("cp-leaks-file")
> 		test_kmemleak_cp_leaks_file();
> }
> """
> 
> -Jonathan Cavitt
> 
> > +}
> > diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> > index df8092638..bcbea9ba4 100644
> > --- a/lib/tests/meson.build
> > +++ b/lib/tests/meson.build
> > @@ -15,6 +15,7 @@ lib_tests = [
> >          'igt_ktap_parser',
> >  	'igt_list_only',
> >  	'igt_invalid_subtest_name',
> > +	'igt_kmemleak',
> >  	'igt_nesting',
> >  	'igt_no_exit',
> >  	'igt_runnercomms_packets',
> > -- 
> > 2.34.1
> > 
> > 
