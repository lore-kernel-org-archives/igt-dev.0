Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4452CCD4855
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 08:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FA610E261;
	Tue, 12 May 2026 08:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hn7yxFUK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4D610E261
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 08:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778573972; x=1810109972;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3Smsp4d18wsTTIDzlpKzCPf3V8jMd8SQESPEcMjBL2E=;
 b=hn7yxFUKpVhctdibXM+1M+PuSEyO9UZzxCxfsphYHqew94lpvpcPnXRR
 uzMryVJ0f1Yn7XPwSrfuUvjrjwz2nD7OTxXhk13wjN/ld+Q1Epq7QDvQb
 rWKU8TyyxOU/mTX/jl5hFlvHb3gYhwhBny6nV/NsKwdxTYjA+m5GAgLRB
 x16W+C3dEg8oC/dMb7qeBuMluWQrvwsNihSA8j1kwAProY3oJf6akwzWB
 b++YmFQfawBc/aG1TyHntUO0XGBGGK7u+hGfDj/v/j86A/ro+LFnK2O+0
 AqFhzUMvhxoYqJk6OCkXWTrRpPBqXphNdv9E0z88lYlRBHlpFLQWqceOW Q==;
X-CSE-ConnectionGUID: bXAPMsFpTI+0Jw9dBHgUZA==
X-CSE-MsgGUID: zPrKAxyzSOunwQLmMboNhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79372989"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79372989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 01:19:32 -0700
X-CSE-ConnectionGUID: /XSC9fugTjCYyC2LWpa7tA==
X-CSE-MsgGUID: gPBRY2yOQym6dZN03rLjTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="241693859"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 01:19:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 01:19:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 01:19:30 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 01:19:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjKPglEXoadSeqpTvvWl9LJjbg3s9aQzYaHqIVkmPvdShVSHdyUENr8haC8QJr9+bRGN1AgK6ohdEgVR13piFbotPWpgxYyKvZJMKydZOw5/IWmEpAKu5n2gRCzW2q8qBeHU7yfdrf1z6tyfxwlYIrXkmxYnb7wfs9RP4TdfDa8i+T4nOZhPmpMg2K11367HE+FLZWl2f449gyAzmSB+3EugLS0CByWm/B2OahB7krdVnsViMnMVcc4N40oZTJDqjsv9CGx3JLr9JaDgqPzE7rOrjdbya4TcGApMcFGl7vzasKP/0lz7VzH0dcq3x95C1QSzUxSn9A3XuuI3BKvkFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fzp7Jr04tVpynB6LDXl4WxhZs0n1T3jEWuLAR4rYIg=;
 b=cYpusCGdDrxD6SNKj39QZHQXcgI9dvmzCttc3VVf5Iqvj4wdoV6fnCDwQyP6l7+F8NapkCcCTCBuMDfH3kt6iwW+uGGcLnvPISKoGCJYQH1T1znZh0XBUi1RtY4ObIN3GxMAm16Z8vlt91yLYzfbzwwAyyLPFI5svh+CuBeExFiCc/y0QttPWWci/fq+gqVZjLNz5OOV4WJkMwP2GMOGDi12An1DYQ3QNw8koK6yhKyVYBTk7QDGCKvy/aH6l80HGCV+0nN1EVBYTCLcynGAHtQ1ssL1dmSW4AGetrG/5826czAheYpl3ghQXD2sFuuxXsmM7I5i707lEW9HXHnN3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:19:22 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 08:19:22 +0000
Date: Tue, 12 May 2026 10:19:18 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Test
 madvise(MADV_DONTNEED)
Message-ID: <agLihiLvH1Yy4vQT@fdugast-desk>
References: <20260424081647.516473-1-francois.dugast@intel.com>
 <oug4lkibyyxne5y4bdqg2wy4b5e2y2ko3wk5r7ss7235v2kgd7@76i7mljhpbkh>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <oug4lkibyyxne5y4bdqg2wy4b5e2y2ko3wk5r7ss7235v2kgd7@76i7mljhpbkh>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0234.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::25) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: 87250bb8-f59d-4760-ae5f-08deafff2be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8142099006|11063799003|3023799003|17092099009|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: Q4mH6NTB2C6GA3ox0xnQReIlmnEvXjCKTaWU9+S6mHqWV9w8G4MTUWzfhPiYjvt2W/YTegDsES5i1yyTQLzLpXVnBjgpFG7nmVRlgmCCz6GZPfhEhoy0xRzGhLUOrib08MfLrfBIgeMySmGaWOBajedDBidrPBFd9btXc06WA650NPA4CHQ+6F+IyxiDW5wPtDHKba7YZeGzJxMMnqw5SMTVcgsYsR6uq3vVC1C0QzYEO4TqHJ0LYJBUsgxM4v5FgGC5DiQqDce67inACku5h4anZauTTbXIfZf7Q3slMj8CF/OvU65JAYNvFzjrHT5RMO+sjgAlUx7d27YxhkWl6N963PwsoBvqHnGwLB/TxDmcIV2OaDe8AsGqHNZPUn8n/FVa82dxdZatR1/Zr8dvnXDxZHPMy0G7DPlhuJgzi1BX1Myhe0v2wwp/82eRJc2S1DimevjK9fiDS8SS/t8hpCFu9RPnnc+CHWISVRMvpfJkXmEyaUuYXh0yo5WSgesPQNXFl9vhyQMNDawJFdDhnHitfpotfITXeRGGVnVmRPEa6OIzMTrVRPe+qMcEitP4cSKIhDgGk+CU+5KdONEs+KIE/3KCRRKWID4ECOVatbxsmToIM9IBj9GgAVU/CNREuofkrzFqPiprwCfJofcbwUiAr8kxFpCkhavXcj2qJplpRQHtPnaOUTcQt2aMvowR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8142099006)(11063799003)(3023799003)(17092099009)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVZKNnRja1pheGZsS1lXYmJnOVpPemY1Ukh4RzNoZCtMVC9kMmhpM2NidFpj?=
 =?utf-8?B?bk13Qy96T2J3ekdHK3Y2ZmdHVmhPV2ZIUEpOM2pqUWJEZTIrVkRGMUo5am5a?=
 =?utf-8?B?SU9YYzV2WS8rZ2NMcmRERy96eFB4bG1iQU9JTWkrQ2V0emNWLzZNb051R0tQ?=
 =?utf-8?B?MGpxcEswRFZ5aDIwMUtSRTIySVh3aGZuTDR3VXRmRXczU0pUR2pxYkJ0OTlS?=
 =?utf-8?B?aGQ1TDBPbUF4L1E2blM2bStjaDg3RWpNQVI2L1ZCeDBrVW5NcldaTWhMOWoy?=
 =?utf-8?B?Wk0zaG4vNytMdk03WGdpWHE4Q0ZOTG1YRWE3NkVVQ0RpcTZNbzFjd0FaWHNx?=
 =?utf-8?B?VGpPMTh0ZEYyQWw3NVRINFJFS0FwcUYyUkpPUXJtenVKOXB0ZjVpYlJDT2V1?=
 =?utf-8?B?a3FVVlZlTXo5Qk5LRGZVd2h5aCtyNFNGQjBOSHhDcVA2L00rQ3o1c1FDWmRr?=
 =?utf-8?B?YWoxcEluRGxFMFR2R2JXV0V5V3dNY1VBNTMzRHNqZDVFa0hYZGszY1pneVZM?=
 =?utf-8?B?cmJXcEhjUFhDR2MvYmlZclZRTjdnRW9kMllpT05xRWdjSlk2blg2NjliVGFJ?=
 =?utf-8?B?Qkcwb016SFpUeW5pVFBLSjNGQVZUQ0MrTWtNUEhVbmg2K2I2RU5GQTNqOGRm?=
 =?utf-8?B?NmhYWmJ1U2w3UFZoSFNOR0I1L2tQdlRQRDRxN1R2eTNqc205amxTM09SME01?=
 =?utf-8?B?cEFSKzA0bnZCd2JBVGtXajhwR3VsL2hoT0xvbEdEUkZMRy9lS3RHeDRBZ1dK?=
 =?utf-8?B?QTZKbnVWQjA1MzRnb0dRdHlHeVk4NU05VFFjeTB3SG9pT2pEaGxxZFJqcnY0?=
 =?utf-8?B?ZHlKek9XbUhESENldEFFNUtPSjU3VEJ5SFlQY1lzRU9pRFdvaHZCOVh3NkxV?=
 =?utf-8?B?ZEJrbFdYWVN4Si83REVWVXpTUGxNRGUxY0UxV0x3T2ljaHJxa3p0aTNQZVF3?=
 =?utf-8?B?dU1SYVlYd0k2N09QS0lSZ2dOLzRnUFZwNE1pSFdEOXlGWUl4K1JObEpiSldj?=
 =?utf-8?B?WW16U2JZUDJaNVVudFlwbFQySFA0ekFUMkdqaURBVjhWdFJvem96a3h5V2Vh?=
 =?utf-8?B?d24rUldTcjZrYjV6T2E0OXUwVHM2MjVDZk1jL0FzeDlJT3grVWcxeVorV280?=
 =?utf-8?B?QkZlL0hSNExFS0dIdGplOEZsblAvWXJLMUkxaWVMQi9lOHJJbzVmSFJoZ2JG?=
 =?utf-8?B?TmFqSjdoMDZkWTVUK09GRXNqcmlCdWVTaE9mcXpVOUNwZjJvaUFFTnh4N2lu?=
 =?utf-8?B?RU1QNi9ZUnlJOGNHc09NNWtMQ1lmcE9UdEozMTd5dnN6YXM3dDNMSHdUb0kz?=
 =?utf-8?B?SzdCQ2hyQUVVRHN5RUhBbk5CY3l3RVY1SCtMUld4OUhta1gyNWFyZGM3NEJV?=
 =?utf-8?B?TGJtK3lKZGFNVkxwbis5MFFSd1ZRQ01oYzlrV0dmNlM4L1B6RHI4aWFMb1F2?=
 =?utf-8?B?QWxXWi9JcVRBWWQ5QlNYQy95NFM5S1ladGsxVjkvVWpZelJndjBhMXVwYlI1?=
 =?utf-8?B?bmJJdUhVOHZSa29ncHRScG85cUEvN3ZNdUFxY2pLemJmaVllQVRhU0JXVy9u?=
 =?utf-8?B?N2pNb0RxVlRoWUNqWURxMUhwbytjVitlbW02bEwyOXdPeE1KdklkbkN0MDk5?=
 =?utf-8?B?NFZ1WkhQcEExVFM0RSs0Sk5hL0VMK2padlJiNnk0M3I3ZjJTUWt3cmVEbC9v?=
 =?utf-8?B?cHdGWk9CdGk5ZklZSGRzNTFUVmhTZEFMem9na3VlM0RtMFNoNVRxTm1zNjJN?=
 =?utf-8?B?K2E2QVVnOG1BSG91Y3EvZnh4TWRKemNzNzZINzJLS1UzYXdsREZvNDRtR25I?=
 =?utf-8?B?Z2pwZVR4VmpaSTM3TmkrQmFrVXZ1WDcxemJvY05TeUF0em0rbkZuTU1Xemh0?=
 =?utf-8?B?Q0ZvVk0rNVYzQzQwMmVHRTViOVIzaDRjbXlzV3ZoZ1RpRzJDS2RQV1RGVXhI?=
 =?utf-8?B?YTRKLzFldGQwbFlqK21SOGE2VHIzeGFlQ2xqY3J4REJFMmI4cUFtUTd2eVph?=
 =?utf-8?B?aDVVaFdqdmpXTGZtdEMrTlZGb2p0VTZ5MGFsQ0IxdXhGaWtKWEZnTU9sVFVx?=
 =?utf-8?B?Y2EvVnRQS2tDcnMzaEdhM1k0eDdTY281Y0hCMmd6bFhkTjdhbHpyU1dUYjE3?=
 =?utf-8?B?NTg5SUZxRTJCOFRtbDBnaWpkdHd4RXMxSUN6UllqdmF2K1NDd0xLcmVUUVl1?=
 =?utf-8?B?a2hSVFIwMXF0ZDVLN1hKMzZ0UEgwemlzSGxkM08yV3VNTXpVQWRRcTI1UXB2?=
 =?utf-8?B?RW9Ba0dDZU9xNG9zTDdRUkVBc2E3S0U2dkJYL3o4TGpFdGp1bm44S1lRRWdY?=
 =?utf-8?B?OCtGQjFXeWVLd1BNZUYvU2hpSUlkOHJkK0JTSE9XWUpvT1RSRjFpdWI1L1BD?=
 =?utf-8?Q?XR0bwseU+Ui9oy8I=3D?=
X-Exchange-RoutingPolicyChecked: FkaTY8UjO9mxPVuglgFXucgfbORP4Y+9En80BTQecD0Bcffk4zJCk8pTevSiWvg386mkKlY2b/6QKzOdiPSn1qAK78sBv54y9+TvSPao/3C8e7b3ENkSrBndyaDUvrseSJllEA4csqhFsihz0msNSz5AaY3ArGF9THiZcn2wyzqxks4fQooXaHwrtzcHk+xZ77pfLgJ5kBOuTSRrIpksz+zHldrRtXBRtzwWSHRYM4WCCev1cxw2TE8lbvGWMGDuAebgDfpvewJz+5l9ZN04QL+vaakwj/jcCHkUocWQeYJuYtRb6IjfJ50r6uxMNkT4gSy/niahUFT56Ift3ueSog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 87250bb8-f59d-4760-ae5f-08deafff2be1
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:19:22.2341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8byaVdeDMvEn8Jldag+KV/j6NtIyinHgci+VpiUNfleQxP3FiDEwff8/12lZaIAmmlZBFLeLn3YIWFEx62zNVjKDF2pTHZoiEQqE6EzHOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
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

On Thu, May 07, 2026 at 09:21:54AM +0200, Zbigniew Kempczyński wrote:
> On Fri, Apr 24, 2026 at 10:16:47AM +0200, Francois Dugast wrote:
> > Extend the compute test to make use of madvise(MADV_DONTNEED) on the input
> > array before reading from it after computation, so that its effects can be
> > checked by looking at GT stats or tracing for example with:
> > 
> >     sudo bpftrace -e 'kprobe:xe_migrate_from_vram { printf("%llu,%d,VRAM->SYSTEM\n", nsecs, tid); }'
> 
> This probe is not triggered for 'dontneed' tests, at least on BMG
> and drm-tip.
> 
> To be honest I don't like the fact we need to run external tool manually
> to check is the test really doing what it is supposed to do.
> 
> Functional tests should directly return success/fail/skip but here we
> always return success. For local testing it is fine but from CI point
> of view it's fake test.
> 
> I think proper solution would be to execute bpftrace in separate
> process and parse its output. Sth like:
> 
> 
> 	int ret, p[2];
> 	char c;
> 
> 	igt_assert_eq(pipe(p), 0);
> 	igt_fork(child, 1) {
> 		char end = '^', fail = '!';
> 		close(1);
> 		dup2(p[1], 1);
> 		igt_system_cmd(ret, "bpftrace ...");
> 		if (ret)
> 			write(p[1], &fail, 1);
> 		write(p[1], &end, 1);
> 	}
> 	alarm(5); // just in case
> 	while(read(p[0], &c, 1) > 0 && c != '^' && c != '!')
> 		igt_info("%c", c);
> 
> 	igt_waitchildren();
> 
> In case of missing bpftrace we need to ask CI team to add it to
> the image and skip if executing binary will fail.

My commit message was misleading. bpftrace is used for debugging but I do
not think its execution should be integrated into the test.

Please see v2 which uses GT stats for verification.

Thanks,
Francois

> 
> --
> Zbigniew
> 
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  tests/intel/xe_exec_system_allocator.c | 32 +++++++++++++++++++++++++-
> >  1 file changed, 31 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index 5580099f7..5a6334b73 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -2267,6 +2267,7 @@ static void read_gt_stats_snapshot(int fd,
> >  /* compute flags */
> >  #define TOUCH_ONCE		(0x1 << 0)
> >  #define ACCESS_DEVICE_HOST	(0x1 << 1)
> > +#define USE_MADV_DONTNEED	(0x1 << 2)
> >  
> >  /**
> >   * SUBTEST: compute
> > @@ -2285,6 +2286,18 @@ static void read_gt_stats_snapshot(int fd,
> >   * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer
> >   * Test category: performance test
> >   *
> > + * SUBTEST: eu-fault-4k-range-device-host-madvise-dontneed
> > + * Description: Run a simple compute kernel %arg[1] on a 4KB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
> > + * Test category: performance test
> > + *
> > + * SUBTEST: eu-fault-64k-range-device-host-madvise-dontneed
> > + * Description: Run a simple compute kernel %arg[1] on a 64KB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
> > + * Test category: performance test
> > + *
> > + * SUBTEST: eu-fault-2m-range-device-host-madvise-dontneed
> > + * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
> > + * Test category: performance test
> > + *
> >   * arg[1]:
> >   *
> >   * @once-device:				touch the buffer only once, from the device
> > @@ -2321,7 +2334,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
> >  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> >  
> >  	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> > -	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
> > +	env.skip_results_check = true;
> >  	env.vm = vm;
> >  
> >  	read_gt_stats_snapshot(fd, eci, &stats_before);
> > @@ -2343,6 +2356,22 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
> >  
> >  		xe_run_intel_compute_kernel_on_engine(fd, eci, &env, EXECENV_PREF_SYSTEM);
> >  
> > +		if (flags & ACCESS_DEVICE_HOST) {
> > +			float total = 0;
> > +
> > +			if (flags & USE_MADV_DONTNEED)
> > +				madvise(compute_input, size, MADV_DONTNEED);
> > +
> > +			/*
> > +			 * No functional purpose, just force a read on host
> > +			 */
> > +			for (int j = 0; j < env.array_size; j++)
> > +				total += compute_input[i];
> > +
> > +			if (!total)
> > +				igt_debug("compute_input is zeros\n");
> > +		}
> > +
> >  		free(compute_input);
> >  	}
> >  
> > @@ -2524,6 +2553,7 @@ int igt_main()
> >  		{ "once-device-host", TOUCH_ONCE | ACCESS_DEVICE_HOST },
> >  		{ "range-device", 0 },
> >  		{ "range-device-host", ACCESS_DEVICE_HOST },
> > +		{ "range-device-host-madvise-dontneed", ACCESS_DEVICE_HOST | USE_MADV_DONTNEED },
> >  		{ NULL },
> >  	};
> >  
> > -- 
> > 2.43.0
> > 
