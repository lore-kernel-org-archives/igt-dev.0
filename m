Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5FAC2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 09:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD8710E1D3;
	Thu, 15 May 2025 09:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDXyiQaN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA0F10E1D3
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 09:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747302041; x=1778838041;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DR/KibvCXARDSw9UQ/3Wli7Op+cy0wXg0sz9mCaCcHg=;
 b=BDXyiQaNpZcMPsdhdC2jXVWZvOO6IsgJ2Eq7yWtexfzPpGq4eQD2xo6O
 J1nCzHT53koLP5Ay+DWpQAUtn3X/l0dvE8cLquomiV6gLjM6dBIErs4GQ
 faCEvSKd0Z4F4AC+3u/sX306bh8myi8xtwKmtRCDzrqelKqiOqg7ruc8m
 jQsaOXxRFdARfB9GcFMQmnLvBYC6hY52AuREqvFlrkD+abOWyHUB4GmMX
 AQJtQTOwKeSaHbRjL7lRl2LWj5EXVaEEH1e38WkzT7VHkPk+0p9Oe/zE/
 3dzL/Si94N33y5dTuMLFhdZRgSXlrjvYiYa7lV31KjYTg9BERyMumI3Y4 Q==;
X-CSE-ConnectionGUID: eXeJYikQTAy/BPk40prOQA==
X-CSE-MsgGUID: wQjrBXe7TgyFOQ9a0/fm8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="36847676"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="36847676"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:40:41 -0700
X-CSE-ConnectionGUID: 2nLhIpL8S1KhBJ7U4XOD7g==
X-CSE-MsgGUID: aH9qSCjNTIulB5KDCiHGvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="138214617"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:40:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 02:40:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 02:40:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 02:40:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHEzl6IKVZP1BXJfcLVu/Bo7vLfZI8NjP9ss3vPRQz7caCFYos+J9F3IXRupioZWXw1LDF2HJc3hepIGPD4f8QWppGQc9ATF0tydVbMNV3Z3s9BP7sqU1F+wFcYJd+ZGBtZ65BR39VjUbVTwwYpwVUpVOUiVnXgMVrsnTotVLY+B+IHZUfjkUKLj73E7JDyi+v2zowzN/akCn9k1QX1i3z9AkHW2d8idReM8csP4Tna8WraPUGFjgJ7R6hSUQGco5PrjtJfcOs5+F/zp4mJpZd5MCrMtv3eR6Ze78pWHJXQFFpHmD97jpaABHNuRl5E6iNYA2qru8PLnNqhmn0UUtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+0aYuEsUmq23ftMNDHRtbn9am1pt/0hDqlo+pmof38=;
 b=PuoAnoiFkZ/8Ke1WtDZpMi+t7h06t880UFh7+hIcl/HH+0qDIvo8ktzzKUuyTtag7aszcJ16JxPaVFT5yh7s1fKczXdjiMc3K7PxGb0z+NQrNnFavwlYaTo4pwF2hBBG2iwY5RIimiLcCxeMDQWLEzsOGJn8fhrT3AkbP8Af/9GXwhcbbepnIT6CtusFN4cb4a+qlZ7Cv2v36Jx5bMSXZ7k+9kEJbS2HBUabKcNEvt0j5itA1elnPk0P8e71nXMZFrIhZPrNza0VNEpOFooKctcBoyqJwFMuUPm7ZgBaofsYQXjEP5EzUv5fc/izSjSg+YSRwtgbVVyuRqlQMbdE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by DS4PPF10012BF96.namprd11.prod.outlook.com (2603:10b6:f:fc02::a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 09:40:25 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 09:40:25 +0000
Message-ID: <b4ea0fdf-d181-4fda-adc3-b83989ca0086@intel.com>
Date: Thu, 15 May 2025 11:40:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/1] tests/intel/xe_render_copy: Skip tests on
 renderless cards
To: <igt-dev@lists.freedesktop.org>
References: <20250515071832.63953-1-jan.sokolowski@intel.com>
 <obhwrhwzmfqvxffzp5nhre2cu5down63cwr2lz2oq5bgqilckj@bi7wbphge2hf>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <obhwrhwzmfqvxffzp5nhre2cu5down63cwr2lz2oq5bgqilckj@bi7wbphge2hf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0178.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::20) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|DS4PPF10012BF96:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4af2c9-8bfc-41ea-cd24-08dd939484d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDdNcU94dUxJUStoN2VQR3UrZXVqTmJqQnVZbm9uUFU0M0haYkRoQUdWUVBp?=
 =?utf-8?B?N1NRWS9WMVhDbWJKeEhkbTBqaWkvVXFpRDlXL1dFRXVraEJxUFUrM3pPY1Mz?=
 =?utf-8?B?aFkrcWJVS1pKNXc3L1hMdGdZV2JRNE5zR201bHkyd0g3Ylc1VDFHQkdrU3FC?=
 =?utf-8?B?QWp4aUpqRGI3aGJpejhWU3h1aklkSUJFWE9hOGF4eDRKY2NnaDRRWUMxNTl5?=
 =?utf-8?B?MW82dEpHTnNVc1M2UVRkVmN6VytTWFRobUU0WVJRbm01bG5KVHkxRXpLYmkx?=
 =?utf-8?B?L0E0YUhJa0k1eEExRUZ0eTRQL1p5OVpTekNyVGlXV3dnUHVuOUF1eXp1WlRF?=
 =?utf-8?B?dmFjQzVXQmV0WE1nWEx6cXpaWkF4d2hsWU5rblFVTExEUzR2YkZWQzdCbjc2?=
 =?utf-8?B?aDY3VXNJODFxaE5pTHpyaGVvZ1JqSWtXaEwyeUVmOXRXVGVGUDRVUmhkMkJq?=
 =?utf-8?B?ZXZlbmo0M3hXcG1IenlCMjJ5R29FRVBDc3lERWh3Y0dWNDlreC9VMkRkYTVu?=
 =?utf-8?B?VG00cjk0OHNiNHUxMk9UcjF0MHhybVhYNTF6c2FtR1ZQTlFwQU5SZWxFWTZY?=
 =?utf-8?B?T0pqWTFjY0NDSWlBMTlHWnBBaEpiWDFYelkyRG9tZlQ4Q2hhZVRiR3EwbFFI?=
 =?utf-8?B?ZjNsQnpYaSt6VEFESE9DNG11eFV1bEJTdWxIbnZ5bVNDeDhrc05zRjE5WVI0?=
 =?utf-8?B?TDJLV1JjcW45RTNrSzFod1hjT3lyMDVLeXh1U0dZcDA1dDZBU3dWYTRlRWhj?=
 =?utf-8?B?UDFUeUVtSTNjYm9aekZaeC9ObWVPM2tHZ05DOUNMUmtTbkNucTNvOXBqR1p5?=
 =?utf-8?B?MWgxQlVaZSsxR1YvR1BWS1NveFdpUFkxRXoyK1dYRmFOZldCOERHYjd5UVY5?=
 =?utf-8?B?N01RNGpxcnJFb2ZpdjJHTFczalRGRXcwTmNNTDdMYzZEYW9HYWN6RDJZZ3kz?=
 =?utf-8?B?SEgrTEpzTDM4eXpVTUNFcmt1dWpYWHZtUjROaFVuT1JWTy91eU8yczhYR1py?=
 =?utf-8?B?TW8rTVI3Y1dib05YSXBoRWhnVmRobGM5SlhidlJEcWhuYUVlS0MvQU1WMzBE?=
 =?utf-8?B?UlNZR3hLK25scHMzZXFVbVNETWdKTDAzbS9PNnhtYkRoaVh1KzBxVk1PTDJl?=
 =?utf-8?B?aEwrUUhkVkJnalJzZ0JXUnVYMHRFOUVwV2ptUGxpOCtUSWQ1aXVxUXlzWUdC?=
 =?utf-8?B?SkVKamszTGxOZkt1UWpOeGljVkpQVGJvNGdBZjg0VEUyUXVwSmUvNlFncEI1?=
 =?utf-8?B?cVhnK3JpUHhMUmdndUFVU2VvcXhES2RYck9aeXk1TlhKNElCZ3R5Q1Bralh3?=
 =?utf-8?B?ZXNaOFNVeXdteVl1dVgrOXpQemdnY1NhZ0h5ZitldkZWT3RSNWlZMzFob1VB?=
 =?utf-8?B?RjlwbUI5b2RkRFpMTFlKRWR1NmV4eHk1R3A5b2RxQTU2V0U3S2JuU0QvMUFG?=
 =?utf-8?B?UzlyTGdGZ2JrWlBBZHE4R0tqcjYwUXJaM3o2N0FPc3cxb25udWtZK0tFdWhZ?=
 =?utf-8?B?VzJqUGw5T0RYNDRnamtJZzNCTVFpa3IvMGpXL3NPUHlmMk1IYTNZeHk2Qmtp?=
 =?utf-8?B?aGE0TjQrd0w3OURaaG1GQnFhSjFiL0ZTNHJIMTIvWSthK3E2K3VlWTY2UWlm?=
 =?utf-8?B?TjlSOUZwYVRpckFwWEhZQjFDQU8rWlFabnNpUWNXb0NrZFg5OHRXRTE2TDlR?=
 =?utf-8?B?Zk8vWWY3UVc4K2ZNcjdHT2VWK2VFLzhDWC9WZnI2d21jWkViWTFCZUM0c0x2?=
 =?utf-8?B?ZWRoQ01yR3RmQmdMKzN3a2NMMUJiczVGRnNtUWN3RG5tdXRZMzlVWjB2Y2F5?=
 =?utf-8?B?dW9iV3Uxcjk2RVZlUmpuMEJyZ0h4eXp1YlNLNjk1eEt0VTIrazBVSVBvRW9z?=
 =?utf-8?B?S3BGb1F1clJNV3FkZFBpYS9MVnp5YzAwL1VwekZ4b3A3cHpieThDdXV3QUlH?=
 =?utf-8?Q?PbevVdxb8Yw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHdNZCtBQ3pNS24zTkJVSld0R2ZUcWNJZlVEcmxJRlJNUXlRNElPbzlDSTU3?=
 =?utf-8?B?QXplZENMZUp1dlBObGNqUEJpVndteUdmZEVXUG9VVlF5M3piUDQ5S1MyTlVl?=
 =?utf-8?B?M3RGaXpMZjdCNENtbStqYUpha1UwOWx4NGVKYncrV2E5eDk0OFF1U29TWnBa?=
 =?utf-8?B?YXJGMVZrTzZQczY5QXZLOXcwU1N4d3VVR094cDNxZGJ2bnhsSmNvNTU3VmZP?=
 =?utf-8?B?MHBZN1NoOHhlbXZ0bjZObGd1Nm9haHdaQTQyREo1YmNLb1VlbVVnclRnZncx?=
 =?utf-8?B?SDBZMU9wZkpueUQwZWtOamVSVW90MGZzb0k2d0ZXdjVyTzg2TzhFRHBvVFZa?=
 =?utf-8?B?K0xQYmpkZGpqdnN5R0tHalJGZWdSNWxoQlREamRMUTRSd3BlWHFHOEltZWth?=
 =?utf-8?B?RWhBR0hEbnNScU0wT3hUOUdpUXZMaitoM1hScE1POTFyaCtHRjd6Y0wrWmxm?=
 =?utf-8?B?cmV2NHFMb2w1V0F0RzFublJIOGIrN1ZCZ3R2YXJlK3M1VkNpRWtxeVBvdHlH?=
 =?utf-8?B?UEo2ZEg0S0VwVmErbHU0SUEvY25LWnJjK0tmaXROSTB4K1NZZ3N0bWVtd1g5?=
 =?utf-8?B?d1hMZm1odTUrL3lHRW8rZlJZTlpBVkxOdHp3ZEtGc2tCbHRuclhhYmpEUnY2?=
 =?utf-8?B?SkpoMW1rVVJzYnUzQkxKdk42R0ZLODdPa2w5ZGhYY0tnTFp5K1N2MVdwM2Ir?=
 =?utf-8?B?ZFF6Ky8yT0Uydm5jbnZDVVNKNFViQzFVbW5CNFVyQ1BiYkF0TGlCcHRIWHZJ?=
 =?utf-8?B?NU41dzdPRm4wNUkvTGFQdDJkMTNuUG5OQ1ZIQk5uK1gxTjVFRFZsdEpBcjlu?=
 =?utf-8?B?NjVwVjQxdGlUZ3I0MmFoamxtQmlyUUczRDdFSmZIU0czMDhSYmRjdDQzRjVZ?=
 =?utf-8?B?b1VLaEpoQUI5dU12K2hHcGIvaHc5UUtRVXNUSU5aTEx1V3JQZXROemlkZzUz?=
 =?utf-8?B?ODYzY1hLbklFc052YXlaVWZUTnI4ZVdLdUFNRWxSQTZYTXJ3MmVDMUQrbTlE?=
 =?utf-8?B?Y3pjZVJ2U1lCRDBSYTBrZ3B0cEdoQTVyUmNwQlEyZVNkQXcxY1NCU3dFZzV0?=
 =?utf-8?B?eUJHekNVdzlkcFhOQ0x5UEVLcHVLS0NHUGN3Z0FNUmxvbE5EVkF3ZWRGaUEy?=
 =?utf-8?B?ZlBKWXlWdlp2ZW5ZVTRCR2h5bWtvOWhoSXFEOVBQYzdhbXNhWm1Wa1VlVml0?=
 =?utf-8?B?UUtDTlM3TEVuRUJZTmI3RmZLems5ZUJWazdGdjhQR2FTaU1WYTh5MDEwMUZX?=
 =?utf-8?B?aHNLV2FhNXMrejFybFcxcXVPOTlTUnZ6RUJGaHh6RmJ0cm10RGNaazcycVRq?=
 =?utf-8?B?S3hvVjRDbmJET0lCZGlNcWFTczdROE82Wk4xM05Ud0VEME44dkYzaVFuWGM3?=
 =?utf-8?B?RWJTelcwdEhPK084OFJ6MGxIRGxLZ0NTckNERXZDSWdyekszdmFCQTc3d3V0?=
 =?utf-8?B?TVNZYlh3YkQrWWZMWWNaQ2N3LzhnVmszNDlrUWlHTDR5T05xamZLNitLV0Zu?=
 =?utf-8?B?aEdqTnROREt0cENmTVdQM3NjZ3dwbnNLd0tYS3NyS0lVc0hhbVd6dTRzRnZV?=
 =?utf-8?B?aGJUMUZaUFlPVkJGM3Rua0RhNXlRSHcyZXczSWpzRTlLR3V2aDR1R05HOHRB?=
 =?utf-8?B?aVhEVnkwSlJpWnlBT2F4RlFQcUVXOGc3Ym00c1RTMklVbldBcGhvZjI0eTlZ?=
 =?utf-8?B?SURkUkN3NWt6MVFkUXF4VkducUg5QktnY0NxTkpUdzZBMzRZalh1QlJZRVlp?=
 =?utf-8?B?R0dqNFk0bnNZQ3RsZWFnaXJtbUtnakdCeVh1MUxQU0x4NFhVRDdmY004V3JD?=
 =?utf-8?B?akdiWitwd1hxcjF6L2ZLblhIbmswa0I1N0Rad2FQRXY5Kzh6TTVmcVlrM3B2?=
 =?utf-8?B?RlBJdkh1VVpWaE5maTFkWEIvTEgxMWJJMndUQ252TW1hTHN4NXpqL1UvU29K?=
 =?utf-8?B?RTRSMjFxclV6WW1ETm5MeUp5RVVnSFIvSi9pcDdwRG1pRnYxcDg4MGwxOXJX?=
 =?utf-8?B?NVcyZ2hwY056NU9zRXFGS21qME44c2ozNmVxZUdaK0s0S2RjTWZJR3cwVmxV?=
 =?utf-8?B?RWhYQUdzYjZKc1BTV3dTK3p6YTYxY3RKbVp0QWhDRmhzNjMrZy9UQ1E1Mjcr?=
 =?utf-8?B?ZWtVMDBpZHZBSEg0UFdqWjVqaXNWWUVCM01qVTBDVW1zYmRzd1RqdlQ3MEhk?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4af2c9-8bfc-41ea-cd24-08dd939484d1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 09:40:25.1429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMRKzwyTwlNPVxClpLEA4I18Q+Hw1ITuXhS+Rh4GIhzX+vdsA4WBrKoQ4FCdtMd6U5MMUhSX+zgANEScCDFhBwUnCGeNWx4uxf5XqQ0mXk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF10012BF96
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


On 15.05.2025 10:55, Zbigniew Kempczyński wrote:
> On Thu, May 15, 2025 at 07:18:32AM +0000, Jan Sokolowski wrote:
>> As some cards (eg. PVC) don't have render,
>> these tests will fail by definition.
>>
>> Skip render tests on cards that don't have render.
>>
>> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
>> ---
>>
>> v2: made the check general instead of targetting only one card.
>>
>> ---
>>   tests/intel/xe_render_copy.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
>> index fadfd162c..d420191d6 100644
>> --- a/tests/intel/xe_render_copy.c
>> +++ b/tests/intel/xe_render_copy.c
>> @@ -697,6 +697,10 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
>>   
>>   	igt_fixture {
>>   		xe = drm_open_driver(DRIVER_XE);
>> +
>> +		/* As some cards don't have render, we should skip these. */
>> +		igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
> Ok, that's another good choice.
>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>
> --
> Zbigniew

I agree,

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>


--
Maciej

>
>> +
>>   		bops = buf_ops_create(xe);
>>   		srand(time(NULL));
>>   		set = xe_get_memory_region_set(xe, DRM_XE_MEM_REGION_CLASS_SYSMEM);
>> -- 
>> 2.34.1
>>
