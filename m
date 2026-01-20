Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC60D2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 10:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E6310E5B1;
	Tue, 20 Jan 2026 10:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azDwECRc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3578810E5B1
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768905654; x=1800441654;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bRs2PpP1vizEb2gT7L54An1BhxzuFeobZdqE2++YDjA=;
 b=azDwECRc9KWfGUwM3VNc3keuOdHGS9x2DCHbv4BYRr/ITflwpxra2NFU
 bqrMl/tsn/bqJBYdUV641QHoMULautAbomOa1+XTCtL8XUAtdMq17NQtt
 P9E4wK47hUWagnK/VA6DcKCU3oTVrGukDoO18br4PchZrFv+LcZbsq+cM
 RpE8G8sPM1eDF/fanyxCGTcrXT0rwB0BOathChp+Zt3rVpYgwNLFMioIU
 plcn3o7MhJeYbqkzYVAcvgXtk1K/sIHXNcX6yJ5vL4xekw3PavUZotrwN
 m3GBz8X6yemvCkv1XoP/WEjq1uCWO54vEWpQxixYZkeJnicxqvJSG4Bse g==;
X-CSE-ConnectionGUID: vRlc0BFIRoqFNFADXRoZ8w==
X-CSE-MsgGUID: SaL5ODuqQ921Mu06KwPt0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70017415"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70017415"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 02:40:54 -0800
X-CSE-ConnectionGUID: XmVvTNUWSw2Pixc9lSIkvw==
X-CSE-MsgGUID: xtvYF05tTCSvsrONrOsXuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205711869"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 02:40:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 02:40:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 02:40:52 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 02:40:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mh3MZyu10ubMA7FlpnlSaIJNtPbWQQZGHYCueLUzULVTv+HLD5xxLhI54OXAXLZsNNHHxg5SPN71Sk3o/Ntix0PmT8dmXCkXpr+4Q91kTI1VFe94GZwkiBzMG0YMt01ukbqHIufO0j1Knvjks3DfkUQUkZdXQ9hjfpHCeXMoZC1j0nKiY3Z/IolICarl4BGyZY2q6gxsw8bX0g7aMZ+rciwNf3vX7nPbxxwUcEHp3tT1W9RjYwmwQF4zf+t+r7iLUaB2r2VmtHO/kLxYYaLZMA2JiVAl76TTxGDj0JcFF9pclKSd/TLfraFxAA13XpkM+gGNHtmhSiy2+8h94LR6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bI4mvPs3CEVSHG1sBgWPtadUcYTuA0MgMnvGGQ03emU=;
 b=pMXc/6MncEmX7vVCHVhWA+ksV1MmQlor/6TrIwftsKQhaQKPZzlXYJ51PYFwpomtfaT+JUHVJIcgTlUh4BB0uyY8II46AGF5SrlK7hKfYfDzrV75G87sORDmbtoh3ehptmWAa0FkHMrKZ/S/mK1waEGtrO8zubcANWWD9rqTLGVZFt68gmLSh1d9UR/RGsW8UEyML2p8bMO8acsmHbOA+qAhYthsmyw7zHd9jhg6fCy+INFcNN4y36k6+LEva4yW1XrwJDWcleFUsVffSrzo/Wj5fwivJxct5J6w+71C9AADW/wkuTU+UlJLlUphHC5vQ1AKF9nf2VJsHAx72aPnlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB6075.namprd11.prod.outlook.com (2603:10b6:208:3d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 10:40:50 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 10:40:50 +0000
Date: Tue, 20 Jan 2026 11:40:43 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 2/5] lib/intel_compute: Add loop and loop-count
 shaders for xe3p
Message-ID: <aW9bq2_SFfVyNvGr@fdugast-desk>
References: <20260119171013.442579-7-zbigniew.kempczynski@intel.com>
 <20260119171013.442579-9-zbigniew.kempczynski@intel.com>
 <aW9JGuP0sz_byoUD@fdugast-desk>
 <ficlczjpkevwdrpasrnola6bjczhurctmjjegbzxmdijmy4kdm@o2wr7nko7ktt>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ficlczjpkevwdrpasrnola6bjczhurctmjjegbzxmdijmy4kdm@o2wr7nko7ktt>
Organization: Intel Corporation
X-ClientProxiedBy: DB9PR06CA0025.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::30) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec92ac9-26d7-4f7e-7817-08de581060e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3FXQjB1NUpVVVpBVUxoUmplTEVoa0dTVlFvY0hEUERPT29IM3hvaWJoeXZL?=
 =?utf-8?B?SzVLLzR2emFKSHBoWDYxZ3ZWbFNBeis3dXVVT1NqQjVBSmdDNGhLTjVvQk15?=
 =?utf-8?B?eTNndFpsRlBIeXQ0cExKL1VTckhGMkxzN1VEcjhVRkFHVWFVSUFkZmpWTVhC?=
 =?utf-8?B?c2NBK09iVFlJN29WRXFXOEtnTlAxVlU0T2ZMcmx3UzJvazRBOWFMYWZBWGpq?=
 =?utf-8?B?UmQ0dFdhNFc4ZHdWY0JtNTIwZjJ0dEZFbDFGbTNNR2d3MlRxVnVjaVBqbVRY?=
 =?utf-8?B?ZHdUR2MvMlU3bjdyNjYydUhnaklaR1J0ZjRSYVNpR3hacThKak1RQ2lOQVhC?=
 =?utf-8?B?R3NoZy9OaUF6RXEvVFRTeTYrN2EvWjA1bjdtTTJlOC9qTkt6TGozWU8wTnJs?=
 =?utf-8?B?WjU2UnVpQnMzZ2cwTGdVc2laeDlBeHJ6VGQvdWxITFB4bS96eFRKM1hPdndM?=
 =?utf-8?B?SmxLZ24rUnlwcXRKOGU3WkEvWXRKOHNaZ0RXSjRvbTk1amhzd0JYaDI3WHg5?=
 =?utf-8?B?MUVUNStJbUx3WDdidUhiTWpESzJaSW5vVERmdnd0SXlBWHlxaldnV0IycWhv?=
 =?utf-8?B?Q0E5YWoxZW5IUWFXR3VxV0xaYWFobll3Q0M0SDZpWkRuVS91OG1BdnpwOU9l?=
 =?utf-8?B?YWV1N2VBU2R6b0RrcjEwamhEWkRvMlZNcllpM29OSDJOcXVNcWMyTDNHbUNx?=
 =?utf-8?B?c09yM0JFUDFvVmxFR1ZLZEE0SElVMFU4djdsZUFacmlhSHIxcTJYNnRjcnlz?=
 =?utf-8?B?dmxSQXFVZ0lJMDFBYk5SdFI2eDhCak1va0JOaVN5V3JyZWpHVGd1bGFCVldP?=
 =?utf-8?B?WWNRWGJhR0tLb2ZBaVU3M2NyL0pJZXNlcmhIemxBYUJQTVk4Ly95ZjBDWDM0?=
 =?utf-8?B?eVJQWUpka3Zlci9GWTBaTHA1MWF2ZTdDeXNmZXIrc0puaDF2UUlJZlc5L0Ju?=
 =?utf-8?B?R051TVVYSjFkTHloTmdXTllBUUdkY1kxbmJvM3VDdTl5S0VvZERGQ3NJNzIz?=
 =?utf-8?B?MEtqWTlac3JjckYrZGNXZjdNa2dubmcwRlFYZWE5MzlDOGNsMHY0NG54RzJi?=
 =?utf-8?B?VDhRMFdiTWpwSEQwNFkzNWUwQlpBWFMrYUtrU0hNeUczZjdxWS9iVWkyS1pH?=
 =?utf-8?B?YVI0MmxBQlF0V1ozU0UvV2JaSEZsUjJlOGlRVWlvV1FjeEIreDV3WGJGcWJi?=
 =?utf-8?B?djg4N2hTWGVrdTg5TTgzV0R3UEo3WVM5T1h0Tkx1U1dQMVROQncyU2FMTUhp?=
 =?utf-8?B?VWxRRU8rYVdWRzNGT2JWQmI4cS84a3hKcEFRL0tDWU42UEQvdmJjYTFqaGEy?=
 =?utf-8?B?WXM2R2dreVhlUFluY0s5Ykh6eTdSSUp4UEN6ZS9sOXBLKytGNDFQSVlrUHVG?=
 =?utf-8?B?MG1Pby8wdjMzb0JQVTYySzNwUzdEN3JuUzB1eTdWcFd4WHpRWTA1RnpMZjU3?=
 =?utf-8?B?V0hXdHZGeDl1STdJMU8wczZndmNKY1NMeFRCelF3NkhCd0VFWVpkU2RPR0Ro?=
 =?utf-8?B?dC82M0Q4SEQ5T2wyZ2JSWTFkRGI5TE90VXVMOHU2ckYxbnFLSzV1TzVabDZW?=
 =?utf-8?B?MThzNHNNR0dtZ2p0VHI1ZUcyeVdtdGFhM1AzWVA0Wk5GcUMzTmxYeFY2SmhT?=
 =?utf-8?B?MnFKNG1UZ0VrbmRWeDJHaml1N1dOSUk4Ny9TQ1NPMVJhTXROa0JJVkt6RmR6?=
 =?utf-8?B?YlNVb1VSMDV5RGFWWGxRYmRtNlZhVWUzZVc4eTFTQ3owTktFUDBEOWFBdXhm?=
 =?utf-8?B?bVorZ2J0K0FEWlhOVlc3V0kzaXlic1EzTHFUNzRqQm5NdUR1TUF1WkZQQ3VN?=
 =?utf-8?B?V1AwNXFjczFEMm9NMSt5TFcrcTZVdmwzdytXS1EwZ3dLMHZmWXNjeDhRSy9n?=
 =?utf-8?B?ei9ZaW1uQ0RuU1QvbVhOYVl3d1R0UE5salV6Wi90NnhGZzQ3WTV4REFDSWxh?=
 =?utf-8?B?M21rTWE5UW5XUC9CRDF0eDlRMkdIMEFndzljMlArbStacXFrVHN6V1Q1VXRr?=
 =?utf-8?B?WUZVVkgwT1Ryb0QwblJMcWdqamY4N3dpRWFQd1BNYnlQWjJXMjhoU0tsNUND?=
 =?utf-8?B?Vk9ROTdQemJVaGFzdDFiWjVGMmk0QkxTa1BIVFBkc2xhVDJ2N1puRzUxdWJC?=
 =?utf-8?Q?bTDc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEgyUlk2MzZyUjlPQUlOR004YkVHQXRVR3BPQ09EWVdDUlRGOWNET1d0RTBy?=
 =?utf-8?B?dEVHU1F0R3VnaWNKVmdBVG5vL3g0bVc3NTMwMXNRMENIYzA1UVFMcEllc0pN?=
 =?utf-8?B?UXNXbEw4NEZtNWVTaGFKYW5TcU5vOE5hQzdGWEZsVGRYUmx2QWJCdHRSNGs5?=
 =?utf-8?B?NHlTMmlpS2JwVzdFelA4QU1ISldCY2kxZVNCM0o2MUlhRGdBakZGWjhMc3da?=
 =?utf-8?B?UXo3NjBtNHZrTk5lU2pxVzdkNWdlTlJ2SGs0K043OUZQWmpFSkk4ekhnYjAy?=
 =?utf-8?B?Y2VlRER4a3VmZytwaXNENkpKZFhjdE5haG9kZ2hMVGl4STBMODBITnBudlI2?=
 =?utf-8?B?Z2J0TERIVS9FTXJRdHBqdDNBODR2KzcwUG5pdHlRNDFDelJmWmRuUDVXYXl6?=
 =?utf-8?B?RW1kKzZYUndMQ0Y3a2xGd2UrZ3MwajlMWkJkMEk1T2hSZUZZTFpQaUtzcEdM?=
 =?utf-8?B?eUpVQWwvaXIyNlBvQ2VoQ3VQdk8xM0svKzlpTXN5VERJUTJoRjRPOXhJZS9h?=
 =?utf-8?B?c1dFME5HMUxlMks4UFI3QUYvVVFjdnp0YTk1b1RvTE1JbDByQTlRYTJqQnlj?=
 =?utf-8?B?ZkRIVHJwWWkraS82YnZLWERFVEdDZkVna29GZVJyWWZCWHpwNVl0alJzem0w?=
 =?utf-8?B?YnZVUzFWRXEvVFlLajF5MjBvbEFuZDNiWXo0b3NnL2wvVnRLZmFpeDB3MXJz?=
 =?utf-8?B?Q0s4RTBZY1Uzek5idzg5RFp3cTFaNSs1bi85eFkwZ1JRK1lVQ095czdaVkh6?=
 =?utf-8?B?ejc4NmVwemY4akJFb3R0OUtqK2pNeFN5YWswUXNod3h4QldwcHhBUnUwdzFp?=
 =?utf-8?B?RmJ5b215Q0ljbEpzb0JzaktKU29ROHBFTGt0cGpGUHd2eE1rV2VJSFJHLzBH?=
 =?utf-8?B?emE3dUtQbEdQcUhneitvZWg1MDF1K0JLSjdUVkFBN1B0dDVXZlJQTElJdEZX?=
 =?utf-8?B?WVVUSUZLRmpNQVEzRVdVNHNSSFBOMGJTRkExQVVBMjBjL1ZuUkpSbFBVemFi?=
 =?utf-8?B?WjA5R2lpNjZLQytHYkNHL2FzKzFpRU5EdXlvOEx5RzZLRGVRVzd2YnBpaDhX?=
 =?utf-8?B?bER5WUVTcFkyNEVJa2FWWFd4cXZGUVAydTd1WmhQNm9TZ1NWejZIVFJvbmxW?=
 =?utf-8?B?cTFBYXQ2WVlMSEowQWVZVEFnamU5WGZ6MzVXakRaOW5Oemx3Lzc5RGptTlJL?=
 =?utf-8?B?WXZ0UGxYZmFoSnZzWGd1WVduU3k5eEJGRHFGVnloMGJUTVpJQUJCUVU3TUdH?=
 =?utf-8?B?clVlQVZSa0xvcnN5d0pIRnM0dTZrQ0drQ1haM0pPaTBraXAvdUtrOWlhcHdh?=
 =?utf-8?B?d2tPdHdKRWJJendka3AxSThCbnF0WjZKQTZmSW1yaTZaMVRYY2FoREVURk9k?=
 =?utf-8?B?Z3EwSzlGemNybjhGb0RaVkZIcUt6UjR6SUFLKzM3QkYyMTN6SXJKOFozOTdN?=
 =?utf-8?B?bFcwSzJHbWVlNWJYbUtoMW9kUkJGVXdscU5QWjZQb2p6QkpTVHM0aTNkOCs1?=
 =?utf-8?B?N2pSd21SeGo3c29Jb3k1ZXdHSVJrcFZ4Um4xMlZRN2ZwOWswTmJ6YkZuK05i?=
 =?utf-8?B?WFFKa0dmbEpUVE40cWNoT1h4N3RSK0lhaW5MQ1dXYzh6MldBS1F3RnBkYk5m?=
 =?utf-8?B?YnJ0SGloTFh0Q0dTMnhTU0ZiTWdUYW80akdsd0svWEZHd3piR0tZOXEvL2dY?=
 =?utf-8?B?azM2bWYrUnNuMXdTeWs4ZU1WdEdJMmFiTVB5Z00wcmdUUEJ6UXkrNy9kZVRr?=
 =?utf-8?B?a0IzRjBUUHpWT1hYVUYyZ2RSeWh4bStDMHVoSTM1aVlGMkcxZWlEZEN6SmxG?=
 =?utf-8?B?NUJkbEpzZlpqN2lZTmh2cXZuTXQ0RTdxNmZnQlB3Mmd4V3dqR0hxMjVBb3R0?=
 =?utf-8?B?QzRGMkZGKzVQSjliR1BMQUREMUtYL1BYTWpQNnpJRGlqTXZlaTVvRTNudHN0?=
 =?utf-8?B?TEdMbmM1OTR0VnpVVnpwV05SdzBGNFh0TStZTTI2NWU1SXNKNnVsV21Kc014?=
 =?utf-8?B?cSsvZWpiKzdKcDkrWS9yeDd1ZXdWME91U3RNdkJZUHdhd2NWLzhQY0JLdWVP?=
 =?utf-8?B?b2M5UFRrMXhtVjVNZ25wcjRsb2t6R3V4dUI3WE12OGZpWnBrc0JwVmtuWitr?=
 =?utf-8?B?WGRZZEc5cHNtRlRkLzJaQ3VxdFl2WHFyWmo2ZzZDeEUzRmN0VVB3RDZ2Y3Ny?=
 =?utf-8?B?VmV6WGQ5UkcyRVhWM24zalVIZUpxMXczTURqMm4weVBoQjFjOWRnVVdHRkJQ?=
 =?utf-8?B?QWJOc0lyUDZrd1FoaldBR0dNa2tIN1M0WUxVVFNlZGR1S1JhNkdxVkh4NFZp?=
 =?utf-8?B?Qm9kM1pHL1B5YUE2S0laZy9RWVJJdmRuTVJhcVA2b1dOVmVzZzFoa3NiSVg4?=
 =?utf-8?Q?oBo5mJVJvQSfYJtc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec92ac9-26d7-4f7e-7817-08de581060e1
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 10:40:50.2450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0EMVwReSb65QV5mtT8L4iSo5UCtR10tE1tWGJ32hjrYjSPZ27VIE/NlbA4dgzf30VuJ4BS4V7OlAASKfp8muVSSedSQ7FQ/Rszt7TUHQmME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6075
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

On Tue, Jan 20, 2026 at 11:29:29AM +0100, Zbigniew Kempczyński wrote:
> On Tue, Jan 20, 2026 at 10:21:41AM +0100, Francois Dugast wrote:
> > On Mon, Jan 19, 2026 at 06:10:16PM +0100, Zbigniew Kempczyński wrote:
> > > Upcoming changes for WMTP and TG preemption require loop and
> > > loop-count shaders. Introduce them in separate patch for easier
> > > review even if they are not directly used yet.
> > > 
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > ---
> > > v5: add missing loop_noopt.cl (Kamil)
> > > ---
> > >  lib/intel_compute_krn_loop.h       | 36 ++++++++++++++++++++++++++++++
> > >  lib/intel_compute_krn_loop_count.h | 34 ++++++++++++++++++++++++++++
> > >  lib/intel_compute_square_kernels.c |  4 ++++
> > >  opencl/loop_noopt.cl               | 15 +++++++++++++
> > >  4 files changed, 89 insertions(+)
> > >  create mode 100644 opencl/loop_noopt.cl
> > > 
> > > diff --git a/lib/intel_compute_krn_loop.h b/lib/intel_compute_krn_loop.h
> > > index 3a52691cde..1f92ed33f2 100644
> > > --- a/lib/intel_compute_krn_loop.h
> > > +++ b/lib/intel_compute_krn_loop.h
> > > @@ -80,4 +80,40 @@ static const unsigned char xe3lpg_kernel_loop_bin[] = {
> > >  	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> > >  };
> > >  
> > > +/*
> > > + * Opencl code is in opencl/loop_noopt.cl
> > > + *
> > > + * To work properly it requires to use uncached reads, so ocloc has to
> > > + * be called with: -options " -igc_opts 'LscLoadCacheControlOverride=1'" arg
> > > + *
> > > + * To reuse compute pipeline for xe3p loop.cl can't be used but loop_noopt.cl.
> > > + * For loop.cl IGC optimizer notices output is not used and gets it rid of.
> > > + * Artificial write to output[0] prevents compiler from doing that.
> > > + * Starting offset should be shifted according to .ze_info section.
> > 
> > To prevent duplication we could also use the loop_noopt.cl version for
> > all existing tests, right? Probably not worth the effort but asking for
> > understanding.
> 
> Yes, we can use loop_noopt.cl for xe2/xe3 but it requires recompiling.
> But this is not so fluent, we have pipeline ready for exact kernel
> version and sometimes according to compiler change new kernel might
> require changes in the pipeline as well (that's why we don't have
> loop for xe yet, something changed and compiling square/loop fails
> with current pipeline for xe).

Yes let's keep it that way.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> 
> --
> Zbigniew
> 
> > 
> > > + */
> > > +static const unsigned char xe3p_kernel_loop_bin[] = {
> > > +	0x61, 0x00, 0x00, 0x80, 0x30, 0x43, 0x61, 0x60, 0x00, 0x00, 0x00, 0x00,
> > > +	0x00, 0x00, 0x00, 0x00, 0x33, 0x22, 0x01, 0x80, 0x06, 0x18, 0x00, 0x05,
> > > +	0x0c, 0x04, 0x28, 0xf0, 0x00, 0x00, 0x00, 0x96, 0x61, 0x80, 0x10, 0x28,
> > > +	0x02, 0x00, 0x00, 0x00, 0x66, 0x09, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
> > > +	0x00, 0x80, 0x00, 0x02, 0xc0, 0x04, 0x00, 0x40, 0x61, 0x09, 0x14, 0x00,
> > > +	0x60, 0x01, 0x05, 0x07, 0x04, 0x01, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,
> > > +	0x01, 0x82, 0x8c, 0x34, 0x00, 0x00, 0x00, 0x00, 0x41, 0x61, 0x01, 0x80,
> > > +	0x60, 0x06, 0x05, 0x03, 0x54, 0x05, 0x00, 0x06, 0x14, 0x02, 0x10, 0x00,
> > > +	0x61, 0x00, 0x84, 0x68, 0x06, 0x05, 0x00, 0x00, 0x33, 0x23, 0x03, 0x80,
> > > +	0x02, 0x00, 0x00, 0x04, 0x0c, 0x06, 0x02, 0xf0, 0x00, 0x00, 0x00, 0x94,
> > > +	0x70, 0x83, 0x14, 0x80, 0x60, 0x86, 0x01, 0x00, 0x04, 0x04, 0x00, 0x16,
> > > +	0x34, 0x12, 0x34, 0x12, 0x20, 0x00, 0x00, 0x94, 0x00, 0x40, 0x00, 0x00,
> > > +	0x00, 0x00, 0x00, 0x00, 0xd8, 0xff, 0xff, 0xff, 0x61, 0x00, 0x84, 0x68,
> > > +	0x0b, 0x05, 0x06, 0x00, 0x52, 0x00, 0xb8, 0x28, 0x09, 0x03, 0x04, 0x07,
> > > +	0x61, 0x1a, 0x10, 0x00, 0xa0, 0x0a, 0x06, 0x0c, 0x04, 0x0b, 0x00, 0x00,
> > > +	0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x10, 0x02, 0xa0, 0x0a, 0x06, 0x0e,
> > > +	0x04, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x10, 0x00,
> > > +	0xa0, 0x0a, 0x16, 0x0c, 0x14, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > > +	0x61, 0x12, 0x10, 0x02, 0x20, 0x02, 0x16, 0x0e, 0x14, 0x0b, 0x00, 0x00,
> > > +	0x00, 0x00, 0x00, 0x00, 0x33, 0x24, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00,
> > > +	0x24, 0x0c, 0x00, 0xf0, 0x14, 0x09, 0x04, 0x90, 0x33, 0xc5, 0x00, 0x80,
> > > +	0x01, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00,
> > > +};
> > > +
> > >  #endif /* __INTEL_COMPUTE_KRN_LOOP_H__ */
> > > diff --git a/lib/intel_compute_krn_loop_count.h b/lib/intel_compute_krn_loop_count.h
> > > index ecad7fe256..7b4542cda7 100644
> > > --- a/lib/intel_compute_krn_loop_count.h
> > > +++ b/lib/intel_compute_krn_loop_count.h
> > > @@ -90,4 +90,38 @@ static const unsigned char xe3lpg_kernel_count_bin[] = {
> > >  	0x04, 0x00, 0x00, 0x00, 0x0c, 0x12, 0x20, 0x30, 0x00, 0x00, 0x00, 0x00,
> > >  };
> > >  
> > > +static const unsigned char xe3p_kernel_count_bin[] = {
> > > +	0x61, 0x00, 0x00, 0x80, 0x30, 0x43, 0x61, 0x60, 0x00, 0x00, 0x00, 0x00,
> > > +	0x00, 0x00, 0x00, 0x00, 0x33, 0x22, 0x01, 0x80, 0x06, 0x18, 0x00, 0x05,
> > > +	0x0c, 0x04, 0x28, 0xf0, 0x00, 0x00, 0x00, 0x96, 0x61, 0x80, 0x10, 0x28,
> > > +	0x02, 0x00, 0x00, 0x00, 0x66, 0x09, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
> > > +	0x00, 0x80, 0x00, 0x02, 0xc0, 0x04, 0x00, 0x40, 0x41, 0x22, 0x17, 0x00,
> > > +	0x60, 0x06, 0x01, 0x20, 0x14, 0x02, 0x00, 0x06, 0x54, 0x05, 0x10, 0x00,
> > > +	0x61, 0x00, 0x14, 0x00, 0x10, 0x01, 0x06, 0x13, 0x04, 0x01, 0x10, 0x00,
> > > +	0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x14, 0x80, 0x60, 0x86, 0x01, 0x00,
> > > +	0x44, 0x05, 0x00, 0x15, 0x00, 0x00, 0x00, 0x00, 0x40, 0x1a, 0x14, 0x00,
> > > +	0x60, 0x06, 0x05, 0x06, 0x00, 0x20, 0x10, 0x01, 0x04, 0x13, 0x00, 0x00,
> > > +	0x20, 0x00, 0x00, 0x84, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > > +	0xe8, 0x00, 0x00, 0x00, 0x61, 0x81, 0x84, 0xa0, 0x03, 0x00, 0x00, 0x00,
> > > +	0x61, 0x00, 0x84, 0x68, 0x08, 0x05, 0x00, 0x00, 0x33, 0x24, 0x03, 0x80,
> > > +	0x02, 0x00, 0x00, 0x04, 0x0c, 0x08, 0x02, 0xf0, 0x00, 0x00, 0x00, 0x94,
> > > +	0x70, 0x84, 0x94, 0x80, 0x60, 0x86, 0x01, 0x00, 0x04, 0x04, 0x00, 0x16,
> > > +	0x34, 0x12, 0x34, 0x12, 0x20, 0x00, 0x80, 0x84, 0x00, 0x40, 0x00, 0x00,
> > > +	0x00, 0x00, 0x00, 0x00, 0xa8, 0x00, 0x00, 0x00, 0x61, 0x00, 0x84, 0x68,
> > > +	0x0a, 0x05, 0x06, 0x00, 0x40, 0x00, 0x84, 0x68, 0x03, 0x03, 0x10, 0x00,
> > > +	0x33, 0x45, 0x03, 0x80, 0x02, 0x00, 0x00, 0x09, 0x0c, 0x0a, 0x02, 0xf0,
> > > +	0x00, 0x00, 0x00, 0x94, 0x61, 0xa3, 0x10, 0x00, 0xa0, 0x0a, 0x06, 0x0d,
> > > +	0x04, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x10, 0x02,
> > > +	0xa0, 0x0a, 0x06, 0x0f, 0x04, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > > +	0x61, 0x00, 0x10, 0x00, 0xa0, 0x0a, 0x16, 0x0d, 0x14, 0x0a, 0x00, 0x00,
> > > +	0x00, 0x00, 0x00, 0x00, 0x61, 0x12, 0x10, 0x02, 0x20, 0x02, 0x16, 0x0f,
> > > +	0x14, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x1a, 0x54, 0x80,
> > > +	0x20, 0x02, 0x01, 0x00, 0x04, 0x03, 0x00, 0x52, 0x44, 0x05, 0x10, 0x00,
> > > +	0x52, 0x85, 0xb8, 0x28, 0x0b, 0x09, 0x04, 0x06, 0x33, 0x23, 0x15, 0x00,
> > > +	0x00, 0x00, 0x00, 0x00, 0x24, 0x0d, 0x00, 0xf0, 0x14, 0x0b, 0x04, 0x90,
> > > +	0x20, 0x00, 0x40, 0x84, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > > +	0x40, 0xff, 0xff, 0xff, 0x33, 0xc6, 0x00, 0x80, 0x01, 0x00, 0x00, 0x00,
> > > +	0x0c, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > > +};
> > > +
> > >  #endif /* __INTEL_COMPUTE_KRN_LOOP_COUNT_H__ */
> > > diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
> > > index 4d69f270e9..155a3f0df4 100644
> > > --- a/lib/intel_compute_square_kernels.c
> > > +++ b/lib/intel_compute_square_kernels.c
> > > @@ -90,6 +90,10 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
> > >  		.ip_ver = IP_VER(35, 11),
> > >  		.size = sizeof(xe3p_kernel_square_bin),
> > >  		.kernel = xe3p_kernel_square_bin,
> > > +		.long_kernel = xe3p_kernel_count_bin,
> > > +		.long_kernel_size = sizeof(xe3p_kernel_count_bin),
> > > +		.loop_kernel = xe3p_kernel_loop_bin,
> > > +		.loop_kernel_size = sizeof(xe3p_kernel_loop_bin),
> > >  	},
> > >  	{}
> > >  };
> > > diff --git a/opencl/loop_noopt.cl b/opencl/loop_noopt.cl
> > > new file mode 100644
> > > index 0000000000..92fbee279d
> > > --- /dev/null
> > > +++ b/opencl/loop_noopt.cl
> > > @@ -0,0 +1,15 @@
> > > +/* Must be same as MAGIC_LOOP_STOP in lib/intel_compute.c */
> > > +#define MAGIC_LOOP_STOP 0x12341234
> > > +
> > > +__kernel void loop(volatile __global int *input,
> > > +		   __global int *output,
> > > +		   unsigned int count)
> > > +{
> > > +	int i = get_global_id(0);
> > > +
> > > +	while (1) {
> > > +		if (input[0] == MAGIC_LOOP_STOP)
> > > +			break;
> > > +	}
> > > +	output[0] = i;
> > > +}
> > > -- 
> > > 2.43.0
> > > 
