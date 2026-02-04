Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6395AE9D41E
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 18:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5C210E15E;
	Wed,  4 Feb 2026 18:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfqeA0w7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E99710E15E
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 18:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770228299; x=1801764299;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=fnURAQqgpttBVBvmxC3D07OE4g4V4LAOcrmXJ30Ugxw=;
 b=SfqeA0w72FFvd+4lEPU6WEjUaukYTKNJwitWYWJ96+kHlR4tZUoioIE+
 0unBP2sFZl31wXpH8IZ4cyrKL56IncqXbDT5TdRj+leEqIHeALP+aXTxU
 Wy4hkN3x0hJ7W9pPOh0JtnMcviAPw4ueOP9gTBJF8Ao0TncruDcWwgAaq
 c08Otq6nXgaFn8S805xlasGlnnx6ct6cFwsFMkRfa6RONRF+1lRjB4kaZ
 2gDaOo6ahgCfImAxZPT3maLi0HJdpKmoPc+6C2kVDPhuj+zs+XNGM6d7m
 L3iJ/3asFF0hWdATs6FlIVV1UszifRymJVgS2ZuIBaN2zZDEaG948M9Gw w==;
X-CSE-ConnectionGUID: U2U2aZxCT5C5iIg0KNC3Mw==
X-CSE-MsgGUID: EyuSyVpzSQyIW/Vmiqvftg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70440681"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208,217";a="70440681"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:04:59 -0800
X-CSE-ConnectionGUID: c6LuMIg4R/Wg96kmgw+G2g==
X-CSE-MsgGUID: CvFwguvgRr2VCP4B2aU/Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
 d="scan'208,217";a="209523640"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:04:59 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 10:04:58 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 10:04:58 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 10:04:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cm+AdYj03rr8zvecXFbhz7VaPsqwvBQYUQ8FgcUCc+xgGdRGVlgVUsBjqbtkHyPPDejowPmnE+WEsLjty0slrzUU0p+8E8Jvm8EZnDc8ckvAymXAbBGb1BLk/fXRStnLkGIwr6dP0y7dY3QDIQIxIYa63clgYuDVh8suyUrPctA2DjXrbHC7GwEpR/QlYNtYY+wUHdeEJStdoMiosat/u0GtmuCJ3E7FT5A0/u3BYIuqhllRZ1YWH7NdnPLxRKPY4EqrUnVi9AXWULU5YAefCvKkM08Yl87PNeZj2os0o+AkKs/n5ziDrhrDXp0imnyZAgCga3o0ISAPrabs3LLKmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDg6xioRuFOrJ6ROCXLm7DKU3bhHJ6lBb7e4b49KE0E=;
 b=dwG+FDyzFfwEQNdd6oPT65kBo8KSnsUFwI6raBfEuuaPu3qtfDCenQASFs0E98idShTDJWsBkmxUh2xeQnsQIF4GZmDnujtMsNB1sN5Xhj2KrD058mqtGHa+sfjEBevYFU1c+7E0E95sH2WGvlpX83qK43Cpbs0r/Sr+3ragpfSDXOo2rRywYDI2kR7zGr68gfSRgdNXVxiYy57TjBqk6hSR38ibjsSUxCPN0OlcNfZa6P3029OgDiQDtIf/7L9+goW5multuq1IrED4tIqbHgY5wN96pXSqjm8tMbXN3ap75/kZ4UvTbfX3d61dLkCw/t/6UtFfPFvS9PvY0G3YKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20)
 by SJ1PR11MB6107.namprd11.prod.outlook.com (2603:10b6:a03:48a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 18:04:47 +0000
Received: from BL1PR11MB5253.namprd11.prod.outlook.com
 ([fe80::c721:b1ce:dcb1:11e1]) by BL1PR11MB5253.namprd11.prod.outlook.com
 ([fe80::c721:b1ce:dcb1:11e1%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 18:04:47 +0000
Content-Type: multipart/alternative;
 boundary="------------iwjsouawCXcHxNWLPbR2BZ9G"
Message-ID: <a622d980-e485-49c8-b5fe-d3d89bd147ec@intel.com>
Date: Wed, 4 Feb 2026 23:34:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_plane: Skip unsupported modifiers
To: <igt-dev@lists.freedesktop.org>
References: <20260204083913.1048566-1-pranay.samala@intel.com>
 <20260204083913.1048566-3-pranay.samala@intel.com>
 <3d6f8947-4066-4734-9cb8-b4173e72d5db@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <3d6f8947-4066-4734-9cb8-b4173e72d5db@intel.com>
X-ClientProxiedBy: MA5P287CA0205.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::14) To BL1PR11MB5253.namprd11.prod.outlook.com
 (2603:10b6:208:310::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5253:EE_|SJ1PR11MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: aaed5625-ac06-4757-1d61-08de6417e1e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHJ6MDRFTHI1bjI4cUVaUS8wL1BiUCtXR0FIdk52UTU1N2lIWXJNUyt6MnVq?=
 =?utf-8?B?aTdoYWpDc1JIamZDVDBsT0xIM0RaMUxjNXFwVE5zRGlHdERodkRZNFBxNnVt?=
 =?utf-8?B?a3RiNGsrUXJCVFNJanFEdG1xYmtCdmxVeUNYZkhqaWlaMzhVZFdtM1dvUmd6?=
 =?utf-8?B?SDVvQVVCUHFLUXhyWFZPcW13VzBmSkh3S002aDRRMnl3Mk9UU1UxRDU2KzA0?=
 =?utf-8?B?Q3NTRURWZHdlWG9RdjhDdFFyanRsM1ZaSVZWMVV5WWxreGt2WGdPMHpadGZM?=
 =?utf-8?B?bk1hNnVRbWJtQ1pLOHdmMXNLcnkzYWFEcXVyT2krUytvQ3hORTJ6VDdqdUpE?=
 =?utf-8?B?OUNXTVphZUF0WXVkOU5HaG1FVUU1akNLZjJUemRhZWlLeWxWY3NGOFh1bFha?=
 =?utf-8?B?RU42SG4yVlluQWRBb21XL2NwM2lNMjloS2dVTllqc1lCMWp0T0gvRDlwVHBI?=
 =?utf-8?B?UFVlVzdWZmhpVVl1Z1pHUlRoNFNRUDlTbFFnc3pBSU40ZWdjZVZCbndrUHRL?=
 =?utf-8?B?S1hLOFdmUitHR1RKVXpYbXVyaDRYMHg2OEh2b1Z1UzFMSzZ0dDRvQlV4WFRG?=
 =?utf-8?B?WVVoZVRKWG1OVC9MSHhVRnRvVHZqY3hyak9YMmVRNHBqY2NhMFFDM1BwUHBr?=
 =?utf-8?B?NHQyaUQ2a0Q0eVRyWmJaSGJpSDZVVGorM3V4Y3pOT2xIUGNXYkZ6aFFDUUhB?=
 =?utf-8?B?U0VQYmhNYXljWHJqYVlVS2FWSUlEMmRUUnd6dEhqQWdDbElyc0VMZlVvRGxx?=
 =?utf-8?B?YlFFalZHbWFGYlh4TDBkN0dDejg5L0REM2hqVE9ORWpTSDRpZEswbmRPZ2x1?=
 =?utf-8?B?ZCs4VXYzck83TTdYRzRMWUZMUUdzN2RjZCtQeWhKN1RoeE1sckorRHFjdkc2?=
 =?utf-8?B?TW1DVDdGc3o4cXNIbDdjTkFwOVVaMDB0MHJSWUpRcjZvUC9qRnpGYm0wWXJB?=
 =?utf-8?B?bGxqNTJYaDc1YW5JYzdkemZmbkRrbEdNU3BrbTVBb2lQckhVbkw1OE12ZDVm?=
 =?utf-8?B?VnFlemRoM3BrMG9nYmRQbEJnQU1GK3AvSzVhS3N3YkFBclEwQ0NGTU5LeVN6?=
 =?utf-8?B?cUxUTFgvYlQvcTZVWEkycEUwazRQeWN4enZKcElWTjdRKzY1ZmFoOHQwNXJB?=
 =?utf-8?B?cjRXTzgwblBCcHZkamI2dS9VTWRNWHlhSEdIeXlsSTNtMXdBWWhWR00xWVVt?=
 =?utf-8?B?eDV2RmdnQWdWT2xBMUxZZUEzb1dHZGpmSTZEQ2xzcFRGWG90b2d5a2s3bFZr?=
 =?utf-8?B?bStkV1lRc2U5bVlRR3FuVGMzTjBVeFhrRDFpUXlaRkdhS2phL1BTWG1XZUxs?=
 =?utf-8?B?T2tRcURUcjE5TU9FOVBRY0RPVnhPSFVlRVhiQXdvUWQ2eWg1ZGY3RWtYeUp6?=
 =?utf-8?B?QjFGdDMrZkRVcml1b2ltcDA3RXlobHV1YnB6a2VJTFZKbEdDS0NhempObmZY?=
 =?utf-8?B?NVJsUlQrVTdIeEFBTUVXb0JWNzhROExCVG5HRFZXM0lsaDNjVjlMTk1CaFJE?=
 =?utf-8?B?S29kZkxCVWZSVktzemV5akpFME5QSWladXRaSk0rdU1tZk55dUlFZTA3bklR?=
 =?utf-8?B?RGU4bFFmSWNCY0EzenEvQTl2ZnZzMEE4SjdBRy9ObEk2T0hjYUdCVEVlSy8z?=
 =?utf-8?B?N2dWLzFIZ1VMUi9ocGNCQXBYWGVEeG00OGgzTlRCcm8vRmdUZkI2NUtibFd0?=
 =?utf-8?B?ZXFxRXF3WFdkTkF2TnpOMkQ0d09qb0FuYXFJY3VGLzdFM1ZtSm9OcHVZa0pu?=
 =?utf-8?B?NDVpVW1td3RoRjJCY1MveWVyZHE1RnVIcDFZWGxqNzN2dUExbHZ1bGY3NFg1?=
 =?utf-8?B?N0U3a2w5b25UNy8rdnpkWEpKc0doK2NVbUV0ZWJnSTZPYndaZXJuQ3VDRjMz?=
 =?utf-8?B?QXVTdThmQ1UxME9IMjFRWTNLbnROaDdndTQ3bmY3NGp2STQxb2ZzUlhxa3VR?=
 =?utf-8?B?ZlRXOTVjaTh1SkJlWWJHakNFRUk1VUYxZ0VGb1hvc05MaGhrOWU1dG94UmRu?=
 =?utf-8?B?SnZidkE5NFN1SFFETUJxS1VSNVZhR0hodm0rbGdyWlkyZHlYNUFkdGJvQWVz?=
 =?utf-8?B?NTIvZmRtM3V5a0xCYnZpZ3FQT1gwZS9UYzVzOUlRQzBKVDB6MGthSitUS08w?=
 =?utf-8?Q?sCXU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5253.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm9NMXBpcURFTkZUclZoOUpVS1JaeDFrckJ4UWhFWmt6c1hwL2t3bVFockE1?=
 =?utf-8?B?Zk9PNTBkengvZWlVV1BDR1JhL3c2djUranBqRlRyZlFSZktkTFNjSmZoVUFs?=
 =?utf-8?B?UWZKTm1TN01VMkxIcUV4MUE0VjROOC8wT1EySlFmQWtBcklRdm00RmU5WGxY?=
 =?utf-8?B?ZHk3S0xXbzBSbGRyd0pNdi94WU0xcDJORjI1YTlnR3J6K2tUS29oNDdMbGM1?=
 =?utf-8?B?Ylg2UUxNZkFvZk1DNDhyNnU4U0VsdHJMUDgvYWtNZFhQS3p2amhpYVUzK2JF?=
 =?utf-8?B?UDZRMzY1R1YvMjVCMmNyWCt4bVpMcmdqQUp0Wm1YQUNKaVVLL2dtbldVSDY1?=
 =?utf-8?B?QmtTei92UzFzZlU2dUFOTHhzK3dFL05IZTRHazV0RTJGcjhqUFFkM0NQMG1X?=
 =?utf-8?B?V0Q1T1lrTm9Ua2RyNDNtYWRuMFMzb2U3QldnV0F1NXdEVk1XR3dDaVF6Ritr?=
 =?utf-8?B?NFNEeXZXYXhIN3ZMeit2OVZZSXdCRFgvVlJYektJMkNyeUtsZ0UzUzBkYTI5?=
 =?utf-8?B?Y3VSVVFwUDdyUUFTTU0xc1REeG1sVVpGcy91Vm5Id2dVSVJMa0FmVFQ4SEg3?=
 =?utf-8?B?UDBDZjcvWDhhNUN0RXdkY3UwUTVlVWdCbGNWOXAwZzd5ZTNydzNZUlloSEho?=
 =?utf-8?B?T0VBRDQweTBUKzc4SEg3d0JUWmVub1A2akkrMGhJMGJ4K2x2OTFKbVgzM0l2?=
 =?utf-8?B?UE8za3Z4RWNsQ3F4alg2SWhxRXJvbmpsaWdTWnh1b3BESFpQS0tTODVXQTlT?=
 =?utf-8?B?UzZKZnQ3a2loTm80b1VRZXY5K2d6Tml6NlJXWlZPeHRzMlpQZHZPd2YvMitt?=
 =?utf-8?B?N0FXbkkxb3FRenhMYU5Zd24vb2VOeFhkZVJEd0EwbisrTWRhazdCNlNNY3Qy?=
 =?utf-8?B?amtxOURIR0JUdzRFZjdhbWtQZ3ZPcjZrc1RMekVhTVdqYWNyNytYNVRqeU05?=
 =?utf-8?B?TDd6cklRVDk1SFcvUlRGVHJ2UmEvRlFpa1BpS3hGdEk0Nk55UkI0aWh1WUVH?=
 =?utf-8?B?K0luNTkvaXNZbEllZ3ZQYS9XUk5Ra2toUnZZcFpweXM2YTRXWnM5Yy9pMkp2?=
 =?utf-8?B?WVVGSUV1bmRxTFErTkZIZExjRlEvN1lhZUI0b0ZGZUlIRlJyS2d3UjlycXVD?=
 =?utf-8?B?YlRWNmZkWUs4VDRTdzczdjYzMVpkM0NJQ3VYRGNCVm1TSWxDdVFGQm9iQ1dr?=
 =?utf-8?B?TFFQQW1QNFVYR0JRVy9GMlZnVE56aGRGN3B6REcrYmpZeXRub0VZYXlWTnNl?=
 =?utf-8?B?SnVKUjZrYjVuOHZPWHBwZzkwaW4yZ0w1b3pwdUhBOGwvZms1bVJUNEFJSHNz?=
 =?utf-8?B?SDVlMGx3bWk4blo0TU9TV3NySkROWFRyMXBRdEMxeXp3V0s4YTJRUXpSNGV0?=
 =?utf-8?B?SkJTWVpKeHVralpLaXkrZUwvR0xhSUpHMnBKaEpPdlIvS1lzd0E1Yzc3YzFP?=
 =?utf-8?B?OWdhQlR4eDhOYlRKUWx2L3ljSTZyZDFjUmM0L2VpSjRlb3VRNzdJMkZRV21x?=
 =?utf-8?B?d2FmbEdFT3pLZDU5NXhGYzltS01wbzRFNHJGMk04N2Fla0R2cWxLYnQ0cjhE?=
 =?utf-8?B?RCtpM0U0SmtmN21TZXBETUdGeThzaVRSZjF5YTdpMkhVOUYyd3E0NEZiU2FU?=
 =?utf-8?B?WjlQeE1BMnQ1Z3Bsc2pybEhrdWtzQnhWRWFURkVkMUxEaDBVRDdraXVva3kw?=
 =?utf-8?B?aWowa3VYNG1TS3VhVWtYYm12WUZxVjZXZk9EakNXcjJhWkpHemJ1bHdNVjFD?=
 =?utf-8?B?d3d2dldmc0FRRERPdzFrektLNUlkZXdTN0dtVXRmWVpVb0R5czNXVDdROHpK?=
 =?utf-8?B?bzVpMzY0ZU1ndVVPZ0x3SDNqaHlpWkI5dEpjOG82S2FhN0pYTVUrZjNMZkNQ?=
 =?utf-8?B?T2lFV1g0WGNRMFlSWlNSNlltazdvU1ZxNFNCbFBtYmtyK28rZCswNzlCZXB5?=
 =?utf-8?B?dzJiNEllak13dEt1bjNaUkpQYXBjRGRYZVhjdXZvd2ZOWXQ2dUh3ODZrMGtU?=
 =?utf-8?B?RFlhblVpaGFQZVNkaS9Vb2Nid3h2ZXhRaldJQzVNVHJJREpmZVlEKzFzR2JM?=
 =?utf-8?B?MTZneDdLWTdZSitYZnIyTmdCWU5ocllRMEJzTUkwZHN0R0Y5N2FrTTlBalgr?=
 =?utf-8?B?MncvME96NDZVYmRIQmo4MTZ5NkFzMlVuWUQwUEkxbmVKd0FPMlFnUlRMZE1J?=
 =?utf-8?B?ZWtvZjZ3TjVoME9RakNFdnl4ME4vbDZMdmlneDFGZXdOMlVPUzNvZ05YaEJl?=
 =?utf-8?B?ODI4TVcyTEFXU1dSMzJ6Y01URWJUOFpUSDdTU0xmTmcxOE1PYjM4MkdjY01T?=
 =?utf-8?B?VFBnWjBGVVRKT3p5Z1FVV1BzbUkvRU9zMXBGNUJiVGlSVnBQRjdWZ0VMazlq?=
 =?utf-8?Q?qqkAihliasCtvXCg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaed5625-ac06-4757-1d61-08de6417e1e4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5253.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 18:04:47.4274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXAs1z5vdHHUrhJgwhGtqdD2jJ93cAeFiw36bkJBzktWvzDB3hT1jdpLNVxeu+ukXvLf50Tpm+Kq1Q5K9fiy7UbTt7RxLFakkrUrLHMvgGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6107
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

--------------iwjsouawCXcHxNWLPbR2BZ9G
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Santhosh,

On 2/4/2026 4:10 PM, Reddy Guddati, Santhosh wrote:
> Hi Pranay,
>
> On 04-02-2026 14:09, Pranay Samala wrote:
>> Skip modifier subtests that are not supported.
>>
>> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
>> ---
>>   tests/kms_plane.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
>> index a7b1bf25d..69d06d627 100644
>> --- a/tests/kms_plane.c
>> +++ b/tests/kms_plane.c
>> @@ -1495,6 +1495,10 @@ run_tests_for_pipe_plane(data_t *data)
>>       for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
>>           igt_describe("verify the pixel formats for given plane and 
>> pipe");
>>           igt_subtest_with_dynamic_f("pixel-format-%s-modifier", 
>> modifiers[i].str) {
>> + igt_require_f(igt_display_has_format_mod(&data->display,
>> +                                 DRM_FORMAT_XRGB8888,
>> +                                 modifiers[i].modifier),
>> +                                 "Modifier not supported\n");
>
> This looks to be a redundant check here , as the same is handled in 
> test_format_plane.
Both checks must stay. The cursor plane only supports linear formats, so 
without the modifier check, |test_format_plane()| would incorrectly pass 
non‑linear modifiers, causing false positives.
>
> igt_skip_on_f(!found,
>               "Modifier " IGT_MODIFIER_FMT " not supported on plane 
> %d\n",
>               IGT_MODIFIER_ARGS(data->mod), plane->index);
>
> Thanks,
> Santhosh
>
>>               data->mod = modifiers[i].modifier;
>>               run_test(data, test_pixel_formats);
>>           }
>> @@ -1504,6 +1508,10 @@ run_tests_for_pipe_plane(data_t *data)
>>           igt_describe("verify the pixel formats for given plane and 
>> pipe with source clamping");
>> igt_subtest_with_dynamic_f("pixel-format-%s-modifier-source-clamping",
>>                          modifiers[i].str) {
>> + igt_require_f(igt_display_has_format_mod(&data->display,
>> +                                 DRM_FORMAT_XRGB8888,
>> +                                 modifiers[i].modifier),
>> +                                 "Modifier not supported\n");
>>               data->mod = modifiers[i].modifier;
>>               data->crop = 4;
>>               run_test(data, test_pixel_formats);
>
Thanks,
Ramanaidu N.
--------------iwjsouawCXcHxNWLPbR2BZ9G
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Santhosh,</p>
    <div class="moz-cite-prefix">On 2/4/2026 4:10 PM, Reddy Guddati,
      Santhosh wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:3d6f8947-4066-4734-9cb8-b4173e72d5db@intel.com">Hi
      Pranay,
      <br>
      <br>
      On 04-02-2026 14:09, Pranay Samala wrote:
      <br>
      <blockquote type="cite">Skip modifier subtests that are not
        supported.
        <br>
        <br>
        Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; tests/kms_plane.c | 8 ++++++++
        <br>
        &nbsp; 1 file changed, 8 insertions(+)
        <br>
        <br>
        diff --git a/tests/kms_plane.c b/tests/kms_plane.c
        <br>
        index a7b1bf25d..69d06d627 100644
        <br>
        --- a/tests/kms_plane.c
        <br>
        +++ b/tests/kms_plane.c
        <br>
        @@ -1495,6 +1495,10 @@ run_tests_for_pipe_plane(data_t *data)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int i = 0; i &lt; ARRAY_SIZE(modifiers); i++) {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;verify the pixel formats for given plane
        and pipe&quot;);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic_f(&quot;pixel-format-%s-modifier&quot;,
        modifiers[i].str) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        igt_require_f(igt_display_has_format_mod(&amp;data-&gt;display,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_XRGB8888,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; modifiers[i].modifier),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Modifier not supported\n&quot;);
        <br>
      </blockquote>
      <br>
      This looks to be a redundant check here , as the same is handled
      in test_format_plane.&nbsp;<br>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Both
      checks must stay. The cursor plane only supports linear formats,
      so without the modifier check, <code>test_format_plane()</code>
      would incorrectly pass non‑linear modifiers, causing false
      positives.</div>
    <blockquote type="cite" cite="mid:3d6f8947-4066-4734-9cb8-b4173e72d5db@intel.com"><br>
      igt_skip_on_f(!found,
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Modifier &quot; IGT_MODIFIER_FMT &quot; not supported on
      plane %d\n&quot;,
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IGT_MODIFIER_ARGS(data-&gt;mod), plane-&gt;index);
      <br>
      <br>
      Thanks,
      <br>
      Santhosh
      <br>
      <br>
      <blockquote type="cite">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;mod =
        modifiers[i].modifier;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_test(data, test_pixel_formats);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        @@ -1504,6 +1508,10 @@ run_tests_for_pipe_plane(data_t *data)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;verify the pixel formats for given plane
        and pipe with source clamping&quot;);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        igt_subtest_with_dynamic_f(&quot;pixel-format-%s-modifier-source-clamping&quot;,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; modifiers[i].str) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        igt_require_f(igt_display_has_format_mod(&amp;data-&gt;display,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_XRGB8888,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; modifiers[i].modifier),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Modifier not supported\n&quot;);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;mod = modifiers[i].modifier;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;crop = 4;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_test(data, test_pixel_formats);
        <br>
      </blockquote>
      <br>
    </blockquote>
    Thanks,<br>
    Ramanaidu N.
  </body>
</html>

--------------iwjsouawCXcHxNWLPbR2BZ9G--
