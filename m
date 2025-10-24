Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663B4CCD1AB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 08:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BFF10EA06;
	Fri, 24 Oct 2025 08:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wem16ORX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F04510EA0D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 08:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761292815; x=1792828815;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9hOpHFSUFTDzzNP/unzzBgwusXMgC0VybsgNrDUFsF8=;
 b=Wem16ORXk5WQmf8mwllcxagJ5yyEYL2RHtLBXzJD+0CPoejMPVgHRQYO
 +N885Zi2nmtRRis8uME4Y7tgHgzsNWBDvGa8KcLum1jki89C7K6VE07pA
 z34LFsm4venQxbHubnl153mzzCN1TH3uUFAb7EQudG0KW2tV9tyCMA2fR
 A0Zjx6JvmwCIwS0j2AVSSayaYZNLKmFqugstcb/UVVcV5Ntg+iG8pwzA1
 nf2VIRYDhE9M/TVuipJDOUtrpEhHl20U4blEReZR5BrhINVwGE4bCFZcl
 +bP4MAQnnghGRB1Y/Egq60X2OGAdnHEHmLs6TYv4AFmDArUA+6szFwwpD Q==;
X-CSE-ConnectionGUID: oWn3aLfXQ72xJ78wlDPoag==
X-CSE-MsgGUID: 86MxS79QRIiBjjHE/Ze5hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63377729"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="63377729"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:00:15 -0700
X-CSE-ConnectionGUID: jdehL4K/Q32KTnX322A2Ww==
X-CSE-MsgGUID: tw3Aa5xATB6UzGSYBWo8pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="183597004"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:00:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 01:00:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 01:00:14 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 01:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldhIK4efupajJvaT4Qh05Usi/HldnNf3YimtvKAO0J2Mvj7b/Tv2EIhUn1stsWx1lkFUdJ6VTkXWRT6edGwbckqdAoef6saqrxn2Yx5bDctGlXmpqOdmWY5XC9cQYhKeEA0WYPq4WSAPhViI6Z9mAi8HU69QErytV3in1q+n5BUme5KQ2JteOdQVIfiAfWKg6kiPL1cZBL67vKU5/xJLWUQrIx6XSlkue08uwfuT4mqUfpSxk7myLz/F4cagNncxiHEZM0WJimx1pN/Oefz/GelwA+iLxTstRATtu0rWJXy8jPoPHGFpmX8npUYg0dn7DCtvzufXLFbGSsntOkTwRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hOpHFSUFTDzzNP/unzzBgwusXMgC0VybsgNrDUFsF8=;
 b=uW5wevHhXATSUUd1j/ziEmVZ6MB/6rJzsZATqTz3myu8Gvqwde7KGi79Vmb3YphAjzTYHUAhOIF9N6bD4POkDwlbqYeJJRW70M2llEBOO7+F3d1QUwMB4CNkT//WzlhBBcAFuxNn6S4RM6dfjbNbkh9M6Zx5nB/NTI64p8xr3ltTjtIHVgmxHGlSgKhYkcg+H7ai5DKcW/tV1VDAiDxy/5Rp6rKLffvEq44x912NFpTfd+s+3bJOS5NU+Y3rhOBWze0tk1xkeTvZT4YmLozuYl/8ev6brXtm56t50Tkpt/3Pm/yvz7ogtBY6HO+b1gAJcqyKZirt5mRK6DzZa2Vnpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH8PR11MB8014.namprd11.prod.outlook.com (2603:10b6:510:23a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 08:00:12 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 08:00:12 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH v5 i-g-t 4/5] benchmarks/intel_latency:Add
 xe_vm_create_destroy test
Thread-Topic: [PATCH v5 i-g-t 4/5] benchmarks/intel_latency:Add
 xe_vm_create_destroy test
Thread-Index: AQHcRJbGgFMaDCm7kU2NXLHkrSHMKrTQ7o4Q
Date: Fri, 24 Oct 2025 08:00:11 +0000
Message-ID: <CH3PR11MB843419D7D403F4498687D34F8DF1A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250917121626.67917-8-gajendra.uttamchand@intel.com>
 <20251024033118.15674-7-gajendra.uttamchand@intel.com>
 <20251024033118.15674-11-gajendra.uttamchand@intel.com>
In-Reply-To: <20251024033118.15674-11-gajendra.uttamchand@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH8PR11MB8014:EE_
x-ms-office365-filtering-correlation-id: 8e71c074-64d7-4ca8-884e-08de12d35bb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SmhNbmxqV3htdEE3ZUMydXpEY3hWTFJyK09sWXN5MHNKcFJUcml6bnJpZ2Rj?=
 =?utf-8?B?V2owQnhLcWYzdVZldUc5YWRodmlHWVJHWEpvelNVajBsNVdWTnhOUU90Qkls?=
 =?utf-8?B?TGxLTlI4QkdYNHU1UGI3VFNMQTM3WkFDVWF5d1F2c0hHc0o0QnZ3aC9ielJy?=
 =?utf-8?B?OHBqZmVpK0NTNVp5dTZ3emtzWjl1VzlyYjdWRUNEeURFUXk2d21rQzFpWDZy?=
 =?utf-8?B?OHZCMVB5LzF2SE5mTytaS3l5L0pHc2FPR01wRUg5d3AwNWlLaUdJMXRXN2FG?=
 =?utf-8?B?NHRuT0V2SytUZzI3YUlFSzc3ZG9ka3dMR1VjTjAySnVlbkF1ejZNQ0dJVXh1?=
 =?utf-8?B?QW1qSHRxamlpSWpoUmNKdTVYbWlQWnNrUHVLQzBVbm56SkJ6ajhrQnBmNlU3?=
 =?utf-8?B?Y3hPVUJVY01Od0JIQVp1b2d0RFpxSXBtZ3ozZEVnKzBYc3o1Rit1clJ4M0Fh?=
 =?utf-8?B?anJJTVk4ek9lYzFYMUh0SGtaWUdLVDRTSEMwOWQzTFZVU3MrYVNta1o3V2s5?=
 =?utf-8?B?UUdnNXY2TElZcFg2V3duc0tabWFqMWhnNGVOeWYrSUxrUW1MTjZSSFZtQTJC?=
 =?utf-8?B?TmVLNkxOcjFXd2V6Q001QS93TGxPUGdiVExTQXd2bkpqRVRVY01OdnpjeHFq?=
 =?utf-8?B?Zkd0UmRCTm9vaGxEUnBEb1A5SWVlVHB6QUk4SVN1cEFHanJaWVM5SGw0akV6?=
 =?utf-8?B?NHRCRGVYWmdNdzNsWjhYaUYxZzRPZTVXTms5VEtxWXJpOTFJSUFidDFQTk9G?=
 =?utf-8?B?bzl6eDFUVXEwSEU2TlFBSWRJNU41T1ZhNUpVbU51RU9MYWNBdHNhNm96Mjky?=
 =?utf-8?B?UWJNNlkzb1hKVmlkdUh6YjVWYWh0dFRlZ0tJa2I4TjhJQVM3VUllTE9Cc0dE?=
 =?utf-8?B?MnJwK0ZSSmQrL3hNeFhJN1NOQVFZQkZNVjQwSWxnc09mYmpsbm43N2hVUDRV?=
 =?utf-8?B?Wmp2Vy8xOEtJRURoUWJVU2tBZzdhWUNDRW4wTE1vM0xRZUlUSkM0RndBVDM3?=
 =?utf-8?B?T2kvalJoZGNTcjFxYXJNTlF1Z20yWHA3OG1Dc1NMNUpXWjJnaHJiZFNnVU92?=
 =?utf-8?B?cllrdks1emh3S0FWZGFtWFZ2MWhPTUZ4ci9oT014WnFyejRETkFuTHRtMFU4?=
 =?utf-8?B?a1ZpaWJxSkdDTmx6Rkw3aUtKRlBkREFIQ1BLVUd4UnBrWm50KzdicCtMdGtr?=
 =?utf-8?B?WFo1ckcyTkpGdkpzUHBJalpmTnBIMHZoc0NlS1o0dHBMT3BVNXp5UzVFZ2lG?=
 =?utf-8?B?T1NvclRHdkdDWXZHVXpCNzlGVWxYNlZib29vU3ZQNWZhUDR0bVFXOHg2Qnla?=
 =?utf-8?B?c0I0TFRnL01iVFJRdWhUbWljSFhpczVEZ2wzZHVNWDIvT2xPUGticDJFdG1M?=
 =?utf-8?B?bXc3YVNqVzJqM3g2WW9jQkthQmsyWDhhenJwWTJaOElXRTU5bkpwV1R1NW5W?=
 =?utf-8?B?ajVqZE51MzlCOEt6R2JJVGJYY1R3UFgzaHlxdjExaGZOMzdQbGh4Nk45VGp6?=
 =?utf-8?B?MTFTVWUwcGxBS2NhOC80NitGaE9samVuMkhDYXFKcy91UW1GMHJxbVdqV1cx?=
 =?utf-8?B?RFJaSWZwcGswOWtkMVBlTlV5dUZuc2N2V3ptZmMzNFdMQ21lWjd3KzFyaUxu?=
 =?utf-8?B?cTlia0pkcGlnbTFVQUdYdnRtY0VjdnUvTGZ1U2lwSjFYQWVEN0l2U3lkYzBG?=
 =?utf-8?B?TFlybWtVcW5nQmpmeVBZV1ltaHp5UjVBQndnWml3aG5TaE83L3hlWE93VXUz?=
 =?utf-8?B?TXpzZGV5ZDRxM1ByTmdqK3QreEpWc2RyY2RUaXh4WEwrTDZVUWR0OW9nOWJt?=
 =?utf-8?B?V1ZvL0o4SmpZTHJIbitmNnlaejAzZGJlKzlock41REFhM0NUdnlXTEdZc1lB?=
 =?utf-8?B?K1UvKzdxaWtjSzRZaXUxYnlNaXJHZklUNzh2WUUzM1pySExRNjFUbGtDUXY1?=
 =?utf-8?B?UzJMMFM5b3p3T3BxUVFzWlBnSmQzaUhxZ1Vnck1mUllCV0hvUE95SVV5aHRI?=
 =?utf-8?B?TXEyQU1YbStIemoyRVdicTlZWXBsakhDL2FrMmZjSm1rcDRoZGdZOFN5Y21x?=
 =?utf-8?Q?kgvmK1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NURiVDhxemU0RVZFZytPRTdjR2VyMUh4VTYvenpINjAxa09kcUNDUk95QkFp?=
 =?utf-8?B?aHZ6ZEx2aDM0U1VjTC9uT1lrQko5Vit2K1NqZkNwQXRmeE1pT2ZzbWp0UEYx?=
 =?utf-8?B?OS8wcHBKWnZaNFRyaS90R1h6bWlpcnRoY2ZPUng3cUxLM2FPMVhXZGp2cFBX?=
 =?utf-8?B?ODdBZkYxejhYc0tkcDRhK1JUaktudzBWZEVkMklpLzBiTDBUMWZjaEtxdkoz?=
 =?utf-8?B?ODNWdjhRL05meHk3bWpUQW4xNUdza05UeVFZOVFFaUVEdWFpNUFsSzlXeUlL?=
 =?utf-8?B?T3RmRkg0d25UNFVUMkhSWnJvaGRUb0Z4WWJ6Yk9XSDJzazlreUpoZjQ1QnEy?=
 =?utf-8?B?empiazBHamJnLzYwTHNIYU9LakJBeXgzZ1pQdTZwdE90KzFpK2wyQldtNVoy?=
 =?utf-8?B?U3V1eUFOQ0VvbWllZEl6Y0VQYkQydEt0Y2MySkZrZmQ5QysvSVRHQUZDTlJj?=
 =?utf-8?B?TDBLOGc2S081NWxGNlk1RC9pVW9SelE0TCtRdVpyRkRkQnQ1QVVMTTRjTGlE?=
 =?utf-8?B?T2h5N05iRTJoRTByaHhYakg3WVkva2N2am13L0FiQmRGMElnSkhBMm5kallZ?=
 =?utf-8?B?c1ZFUkNpeU1EeS9Ib1VrSGw1WkNDZGIrSmpseWZoMXJjRFF3T0tDZjVVaC84?=
 =?utf-8?B?WVkvOVhOOEJnd1FoT0g4R3F1bEtwRFRTcXZvUHpWTnJjM29VYWFyUE1tZDF0?=
 =?utf-8?B?L1luWGNZUCtqVG0vWGJFcS9scE1JN3lGbTIwSG9oUTBVRlE2SFc1aEo3UzlV?=
 =?utf-8?B?MW9wSXd1Kys4V2l5djVhbUN2L3N3T2R2RmRTYXN6azJwK24zU3B3eTQrai9l?=
 =?utf-8?B?M2R6ZUFCeEZ4Rm8vU0phMnhVNFc0Zm01WU95aGMxRS9JOXFaY05HME5GTk5y?=
 =?utf-8?B?THo0U2V4UzZweTcyVXlBZkFEbGtDZHNRRzBMU2kyajZBV0xSY0xKeElieEJh?=
 =?utf-8?B?QkNkcmVKMDhDUjBHSW9sM0UwTlBOZnR4b3J0cEJGZlFKc1lrK3EvQ0ZzWThj?=
 =?utf-8?B?VWJuUXJTNERnZGorY050ckkvcG52NmdUQVdrSlNLSUNkZ3E0OXI1TURwUWxv?=
 =?utf-8?B?Skl1YTNLU3lzMysyWFE2VS9ITWlIbHNRQWpWcTlHZmRGSVBUYndyZjdGd0VE?=
 =?utf-8?B?eXlrVHNHNThUdzM4YTQzYVpyM0xJMnA5MTM2L0xsT3ZhQWlCcGxCRXBMeDRX?=
 =?utf-8?B?WmdOeVNFdG9Ca1QzL3puSHRyakNyZkwwcTB6QnUwMXJvUlAzdkFocForOTVt?=
 =?utf-8?B?ZzFoMW15YlNHZ1h1bWdlem96cjJqT1VQOVF3WXRyMVlwSHhQY3RZeG9ZUkNX?=
 =?utf-8?B?SDZCWjUzRzZma2grdGNBbW1kRUtObTNXN3p2Z01SR2wxN3NaVzhEV2xTL1dl?=
 =?utf-8?B?ajJlV05wNXdzWkZiMjBFN1lwTmN5YWVtbzJNakNzMHd6OEhRckxKSFNXUGtJ?=
 =?utf-8?B?YytwblFzQUtrT2R1eUxWenRRUzdpQ0hrT0JFb1dMZ1pSVTJKRmZOVW4xc05v?=
 =?utf-8?B?NzZuMkdUQTJVMjNtV25jUjE0SzhjckJQVUMwVkdhS1ZGU0hxRE1NUWQrZ05x?=
 =?utf-8?B?VDB3bnNYanRZa0Z1RjNxN3ZkSEdNb3lzd3AzeGpZUzBiUTBCRGs3TE50TzNE?=
 =?utf-8?B?cTlvMjc2YnlwTzM5YTBrTUZEYlREeFZWMjBLK1BZaGhYS0IvVVNWRW03eFJF?=
 =?utf-8?B?cGhoZ1ZaZ1NYYWpQSXJCdGZzOEg1QjJGOWRUcHRmRU51elN2MkwyUlZZcEJ2?=
 =?utf-8?B?RGwrRkFpRlRBM1FOUFBXUmJWbW9BTFpvek9TNE45TGVUY25kemZDY3NGWnhy?=
 =?utf-8?B?UnlpWXZ2SmJKWlprRFlSZXhRK3pEdEIzMy9iMmFmamJFcUh4NDRFVUJJR3Bj?=
 =?utf-8?B?ZVQ2Y0VTTldybEkvUmhhbFJoUlpEVzQxODNxbWJaNjV2bnQrK0tDSUxrakp5?=
 =?utf-8?B?eDBSNUJaeUNERlpxV0JCUk5Dd09jaGh6YmZ3eU9PVFlkK3pEYU5wNXVkbE9V?=
 =?utf-8?B?WUYvdWo5Vm9nL1VzWnJWUWxpcmVhekNjUi83SW1wdC82YStPb1c1TitBc3l0?=
 =?utf-8?B?enREY3l2K1dPVlhrVkx1Z3JmeDA4VXc3WE1JQjZaT05ZTFJoS3ZMYk9sTytC?=
 =?utf-8?B?WXdjdTNncWdoSnNlK082bVlTYkN6UHN0cThzeHRIejVENGNkL1ArZWNXN3Ry?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e71c074-64d7-4ca8-884e-08de12d35bb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 08:00:11.9266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L+PS+m46QQav70eixY+eTPX3IPkVoN3ABrxfsnbFI5fUvDYnuji9MdL6njRt4koEIBqOhYnOBfFIqtVluEUu4X8FGU/HVGG/CgVyqmLygBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8014
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVXR0YW1jaGFuZCwgR2Fq
ZW5kcmEgPGdhamVuZHJhLnV0dGFtY2hhbmRAaW50ZWwuY29tPg0KPiBTZW50OiAyNCBPY3RvYmVy
IDIwMjUgMDk6MDEgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBLb25pZWN6bnksIEthbWlsIDxrYW1pbC5rb25pZWN6bnlAaW50ZWwuY29tPjsgRGFuZGFtdWRp
LCBQcml5YW5rYQ0KPiA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT47IFV0dGFtY2hhbmQs
IEdhamVuZHJhDQo+IDxnYWplbmRyYS51dHRhbWNoYW5kQGludGVsLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIIHY1IGktZy10IDQvNV0gYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5OkFkZA0KPiB4ZV92
bV9jcmVhdGVfZGVzdHJveSB0ZXN0DQo+IA0KPiBBZGQgVk0gbGlmZWN5Y2xlIHBlcmZvcm1hbmNl
IG1lYXN1cmVtZW50IHRlc3QgZm9yIHRoZSBYRSBkcml2ZXIuDQo+IE1lYXN1cmVzIHZpcnR1YWwg
bWVtb3J5IGNvbnRleHQgY3JlYXRpb24gYW5kIGRlc3RydWN0aW9uIGxhdGVuY3kgdG8gaWRlbnRp
ZnkNCj4gVk0gbWFuYWdlbWVudCBvdmVyaGVhZC4NCj4gDQo+IERlZmF1bHRzOiAxMyByZXBldGl0
aW9ucywgMTAwMCBpdGVyYXRpb25zIHBlciByZXBldGl0aW9uLA0KPiAyIHNlY29uZHMgcGVyIHNh
bXBsZSwgc2luZ2xlIENQVS4NCj4gU2luZ2xlLXRocmVhZGVkIGJ5IGRlZmF1bHQgdG8gbWVhc3Vy
ZSBwZXItb3BlcmF0aW9uIGxhdGVuY3kNCj4gDQo+IENyaXRpY2FsIGZvciBhcHBsaWNhdGlvbnMg
d2l0aCBmcmVxdWVudCBWTSBjb250ZXh0IHN3aXRjaGluZyBhbmQgaGVscHMNCj4gb3B0aW1pemUg
bWVtb3J5IG1hbmFnZW1lbnQgcGVyZm9ybWFuY2UgaW4gY29tcGxleCBncmFwaGljcw0KPiBhcHBs
aWNhdGlvbnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBHYWplbmRyYSBVdHRhbWNoYW5kIDxnYWpl
bmRyYS51dHRhbWNoYW5kQGludGVsLmNvbT4NCj4gLS0tDQo+ICBiZW5jaG1hcmtzL2ludGVsX2xh
dGVuY3kvbWVzb24uYnVpbGQgICAgICAgICAgfCAgMSArDQo+ICAuLi4vaW50ZWxfbGF0ZW5jeS94
ZV92bV9jcmVhdGVfZGVzdHJveS5jICAgICAgfCA3MiArKysrKysrKysrKysrKysrKysrDQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBi
ZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kveGVfdm1fY3JlYXRlX2Rlc3Ryb3kuYw0KPiANCkNsdWIg
eGVfdm1fYmluZCBhbmQgdGhpcyB0ZXN0IGFuZCByZW5hbWUgaXQgdG8geGVfdm0uYyBhbmQgcHV0
IGJ1c3kgY29uZGl0aW9uIGZvciB2bV9iaW5kIGNhc2UuIFNvLCB0aGF0IGJvdGggY2FuIGJlIGV4
ZWN1dGVkLg0KPiBkaWZmIC0tZ2l0IGEvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L21lc29uLmJ1
aWxkDQo+IGIvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L21lc29uLmJ1aWxkDQo+IGluZGV4IDkz
OWEwMWJmMi4uZmQ1MjIyYTRhIDEwMDY0NA0KPiAtLS0gYS9iZW5jaG1hcmtzL2ludGVsX2xhdGVu
Y3kvbWVzb24uYnVpbGQNCj4gKysrIGIvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L21lc29uLmJ1
aWxkDQo+IEBAIC00LDYgKzQsNyBAQCB4ZV9sYXRlbmN5X3Byb2dzID0gWw0KPiAgCSd4ZV9leGVj
X2N0eCcsDQo+ICAJJ3hlX2V4ZWNxdWV1ZScsDQo+ICAJJ3hlX3ZtX2JpbmQnLA0KPiArCSd4ZV92
bV9jcmVhdGVfZGVzdHJveScsDQo+ICBdDQo+IA0KPiAgbGF0ZW5jeWRpciA9IGpvaW5fcGF0aHMo
bGliZXhlY2RpciwgJ2JlbmNobWFya3MnLCAnaW50ZWxfbGF0ZW5jeScpIGRpZmYgLS1naXQNCj4g
YS9iZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kveGVfdm1fY3JlYXRlX2Rlc3Ryb3kuYw0KPiBiL2Jl
bmNobWFya3MvaW50ZWxfbGF0ZW5jeS94ZV92bV9jcmVhdGVfZGVzdHJveS5jDQo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMC4uMDRkNThkZThhDQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L3hlX3ZtX2NyZWF0ZV9kZXN0cm95
LmMNCj4gQEAgLTAsMCArMSw3MiBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1J
VA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uDQo+ICsg
Ki8NCj4gKw0KPiArI2luY2x1ZGUgImlndC5oIg0KPiArI2luY2x1ZGUgImlndF9zeW5jb2JqLmgi
DQo+ICsjaW5jbHVkZSAieGUveGVfaW9jdGwuaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9xdWVyeS5o
Ig0KPiArDQo+ICsjZGVmaW5lIE9CSkVDVF9TSVpFICgxIDw8IDIzKQ0KPiArDQo+ICtzdGF0aWMg
ZG91YmxlDQo+ICtlbGFwc2VkKGNvbnN0IHN0cnVjdCB0aW1lc3BlYyAqc3RhcnQsIGNvbnN0IHN0
cnVjdCB0aW1lc3BlYyAqZW5kKSB7DQo+ICsJcmV0dXJuIChlbmQtPnR2X3NlYyAtIHN0YXJ0LT50
dl9zZWMpICsgMWUtOSAqIChlbmQtPnR2X25zZWMgLQ0KPiArc3RhcnQtPnR2X25zZWMpOyB9DQo+
ICsNCj4gK3N0YXRpYyB2b2lkIHRlc3Rfdm1fY3JlYXRlKGludCBmZCkNCj4gK3sNCj4gKwl1aW50
MzJfdCB2bTsNCj4gKw0KPiArCXZtID0geGVfdm1fY3JlYXRlKGZkLCAwLCAwKTsNCj4gKwl4ZV92
bV9kZXN0cm95KGZkLCB2bSk7DQo+ICt9DQo+ICsNCj4gK2ludCBtYWluKGludCBhcmdjLCBjaGFy
ICoqYXJndikNCj4gK3sNCj4gKwlpbnQgZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsN
Cj4gKwlpbnQgcmVwcyA9IDEzOw0KPiArCWludCBjLCBuOw0KPiArDQo+ICsJd2hpbGUgKChjID0g
Z2V0b3B0KGFyZ2MsIGFyZ3YsICJyOiIpKSAhPSAtMSkgew0KPiArCQlzd2l0Y2ggKGMpIHsNCj4g
KwkJY2FzZSAncic6DQo+ICsJCQlyZXBzID0gYXRvaShvcHRhcmcpOw0KPiArCQkJaWYgKHJlcHMg
PCAxKQ0KPiArCQkJCXJlcHMgPSAxOw0KPiArCQkJYnJlYWs7DQo+ICsNCj4gKwkJZGVmYXVsdDoN
Cj4gKwkJCWJyZWFrOw0KPiArCQl9DQo+ICsJfQ0KPiArDQpXaGF0IGlzIHRoZSB1c2Ugb2YgYnJh
Y2VzIGZvciB0aGUgYmVsb3cgY29kZT8NCj4gKwl7DQo+ICsJCWlndF9zdGF0c190IHN0YXRzOw0K
PiArDQo+ICsJCWlndF9zdGF0c19pbml0X3dpdGhfc2l6ZSgmc3RhdHMsIHJlcHMpOw0KPiArDQo+
ICsJCWZvciAobiA9IDA7IG4gPCByZXBzOyBuKyspIHsNCj4gKwkJCXN0cnVjdCB0aW1lc3BlYyBz
dGFydCwgZW5kOw0KPiArCQkJdWludDY0X3QgY291bnQgPSAwOw0KPiArDQo+ICsJCQljbG9ja19n
ZXR0aW1lKENMT0NLX01PTk9UT05JQywgJnN0YXJ0KTsNCj4gKwkJCWRvIHsNCj4gKwkJCQlmb3Ig
KGMgPSAwOyBjIDwgMTAwMDsgYysrKQ0KPiArCQkJCQl0ZXN0X3ZtX2NyZWF0ZShmZCk7DQo+ICsN
Cj4gKwkJCQljb3VudCArPSBjOw0KPiArCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklD
LCAmZW5kKTsNCj4gKwkJCX0gd2hpbGUgKGVuZC50dl9zZWMgLSBzdGFydC50dl9zZWMgPCAyKTsN
Cj4gKw0KPiArCQkJaWd0X3N0YXRzX3B1c2hfZmxvYXQoJnN0YXRzLCBjb3VudCAvIGVsYXBzZWQo
JnN0YXJ0LA0KPiAmZW5kKSk7DQo+ICsJCX0NCj4gKwkJcHJpbnRmKCIlZlxuIiwgaWd0X3N0YXRz
X2dldF90cmltZWFuKCZzdGF0cykpOw0KPiArCQlpZ3Rfc3RhdHNfZmluaSgmc3RhdHMpOw0KPiAr
CX0NCj4gKw0KPiArCWNsb3NlKGZkKTsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gLS0NCj4gMi40
My4wDQoNCg==
