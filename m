Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C9BD2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 09:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD55810E194;
	Tue, 20 Jan 2026 09:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XomVMQYQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431E710E194
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 09:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768902449; x=1800438449;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Hg/LsbUAYChNRXWCbpANa6yBbnTqNszOEBI3NAu/514=;
 b=XomVMQYQothX7PJcaXYT4OOeP5MQYJqJhYxp9aguLLHb+YTmhX8PDsib
 b4uQ3HsaMk+TAn0jAUI9AckJSboo+u1lewFoa5NB/JSThrLyC5qzBLXEQ
 0JkEEZSl2zNEBM58nCEYJHoIvtZMGluip/Ci/pzlDC8vRfyA5dy03azLh
 l9wOZp6cyyhLVSLak2B4M3AtBYBiOIkoIbPQ5LQk7EF+8mXpRD+4Q9qAY
 T1Fb7TWqNiIbRWzPJRzivZPfqBdzsMnNwJZ7EIVC+OLjlg04QzLOzUNNX
 KMAh1UIdr4hGZWJGKxbM1245daAJ9YCYEO/hfRCEs15ZxTIrtxZ4f8qt1 w==;
X-CSE-ConnectionGUID: 0DUJ0fezSwiPaakBaGRyKw==
X-CSE-MsgGUID: JZGggrZDT2OtzJB+faA9qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81216135"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="81216135"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:47:28 -0800
X-CSE-ConnectionGUID: KjnxBSdTTTS2KahNs+DNHA==
X-CSE-MsgGUID: euJrqqTlSlaIJWIdKE1/Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205225803"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:47:28 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 01:47:27 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 01:47:27 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 01:47:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YiNRDQGqyDyX8R4Z7vpcgH1vpu5142sfjnR//BVr24CR9kEF3cCbga3PuwRp7IgmR9QGfNSKCjCBbENHp/wMkWPCwsomK/Dje2IP5tBIyVPKukZMRI4akxA5uisBb/dsGHNIHAr/2a+/KpI/oTjilvcIt4bawjaUwfAYQ2UkiNYbLSMNjJdWLXbMths2Y4ESfQSlvO+jO0Xznr2qcgguJZxVx+unnRQdw3ra3gBVJUnig9iWM/9ZlYL6V9KAb7GAh0/IUY92akcNIahgBes9NGBPxj4UjHGRLo7M0NOfCruxU0FD1qXiIds9lE9eileTdALq62IhTmOK5k9RtNORhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1RVoAhJG/v4UyCaKD0nbBQE0RwAltsRSjYUmKsqr/k=;
 b=hfsFaeKoo+q2FjypPmMl/3kCmIaDj0fDTk3URxAA+YLPpvLS5BM+uwKOikYeWDbTfT3leO0fe/N1cdG3GFlpJdzm+amAhB9oKgYdqIbxapS/z3yQQGnwUcW5IOooDbjoCvYlpE+2oea689hE7iKm88fcTMe56YqSnh6gF7JVntpklzglga78NKdwDtkYBpFR5BWN1jLfFnHBwprxDb1+znI5omf0c9VSQE7IFFyqhsUm8zaT/s/L0iTnSpmB9xirR4pYXozPadhG0tNMO8gd3OSqv8jM658HVjfpQj2azVM4eOpjF4LFjSDAqnNbjvjQLj1GC+33iZbNbKVWuSD+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB5940.namprd11.prod.outlook.com (2603:10b6:a03:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Tue, 20 Jan
 2026 09:47:24 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 09:47:24 +0000
Date: Tue, 20 Jan 2026 10:47:20 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 3/5] lib/intel_compute: Add xe3p SIP support
Message-ID: <aW9PKMYD_pTDPyxL@fdugast-desk>
References: <20260119171013.442579-7-zbigniew.kempczynski@intel.com>
 <20260119171013.442579-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260119171013.442579-10-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0100.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::8) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b89ae6-c95b-43d5-6294-08de5808ea2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWxKbG56emVzdytVTzFQeW83dHRTSHBsaGFhaHJ2bEJNbW9hS09wRVNwYmVt?=
 =?utf-8?B?SytjbEpPL05pOGQyRFdoMlBuVzlaenduWkFMK0xjeE15VkQwaGJWNDNUQkNF?=
 =?utf-8?B?THhBRlF6QlI5UERvT25TTmY3Uy9wYXoxOEF4ZnVqdzFtTEpNRDVNV3NrSVVs?=
 =?utf-8?B?WVVET0hTYUdFUEw2TGZUZk45b0FZWlUycVZNSHdBNGFVTlZRWVFJaG5JcVpC?=
 =?utf-8?B?YVZZdVpPbmJna0ZqcFhQZDRZNTdPdWpNWnlDTkJ5ckVDNzdpUzVJNCtTWlJj?=
 =?utf-8?B?aXZWYWJ1cHQrTDBwQm4rMTRwUUJINVFiMHJXTnJ0bjluOVR0bkFXQlI5QnBq?=
 =?utf-8?B?K1NNK09Uc1BuQ1U3MDFGZnJMeFpydkZaRy9rQ2c4dkNBRk9PQUdieVRxUUox?=
 =?utf-8?B?ZWd5ZEZoZ01TUjBJcnJiR2VFMFgvbHVPcWNnbmR1U1RPNXVvelVaYitndVRS?=
 =?utf-8?B?SThsZEhBMmdxanpvUWF4ajByTGx5bWtCTU8vRXI2WDhPSGx2eDJaVGVBYmtw?=
 =?utf-8?B?d3I4RUlFTmlQZWFPQndEQ1MrZTFzSVFIcEkrSkxSRFh0UFFKSlJCbmxzSUlN?=
 =?utf-8?B?eld2MUhSNEFyalU4eVUrbDVUampMYmVFVXhkcS9keVVMY0F5dFdhMGZVWVVH?=
 =?utf-8?B?WWMvV1ZUbEpRcEFKb2prcU8wZGhtaFlWOWRNd2tYVmNLS2F5NGVLSHlGMHZO?=
 =?utf-8?B?ZXl2WTlnYnF3L2FaRmVSNzNtb1kzTFp0N1BBUlRlUk4vR0RKV05vZUFBMXBj?=
 =?utf-8?B?RUZBbklIemlxdUZKRkVBK3JTWnltY2lKTDZvM3Q5RFMxUk9meS96M0dRVzNO?=
 =?utf-8?B?cVhFMS8wNXBxRFF4ZGlnTkhwNUhmQXFzdFFGWVBRZXBzditsalBmYkIzVnhM?=
 =?utf-8?B?TkJza1B6NXBOaE5qWUw0cmY1cXJYZEIzSXNjQS9rWEJKMXBmSDVBUnEwbFg2?=
 =?utf-8?B?R2F2NU56Z2pGdWwwQ0Z3dUpoNDFONGRnMm9oWGQwZWxsTHJWOGljY2pQSTZn?=
 =?utf-8?B?N2JqK1FlQ2piaHZ1UThJeStCWkZRRmFCY0UvWlUySXQwZHI1dDVPM1diY01s?=
 =?utf-8?B?MER5L3pFcG14WHJqaGFuZkZBVk9Rd0RDcjVHN2dUZm5Xd2g1WmVLbDFxUXBE?=
 =?utf-8?B?bUNtUkJTRnZxMjFIcVpJbURoR2RqWG5uaWZQWXhRQklNT3Z5STZRM2JUZXFW?=
 =?utf-8?B?MklTc0wvSWhjVzJNTVpYRWdMeDRrcWpsZVpZQm0xSlNiSVVad3VHL3FEaUxD?=
 =?utf-8?B?UEc4YlhDVU1EK2ZDZU5NUXZzbEpqUGVqd3JMUzA1RXQ3RG5JcHFNbEtCZHV1?=
 =?utf-8?B?NXVmaVc1b0tDQjdWZ0hOZGpLc0lKM0ZWVng3NWdNY2ZGZjVCd0R5WHlSN0wz?=
 =?utf-8?B?SStXUUlEcjA2SGlRMU9BN0N4NUFES1BjWGNqc2llNXVQZHVBY0V5dmxQRTlZ?=
 =?utf-8?B?RWZUNk5ab2pZNGdUczRHY0l6RnlSWklSbmxJN2wxV1poQTdBVndYZzdUOUIz?=
 =?utf-8?B?NTNaSjlyaGpmSG5Yci9HTUFtRWdXN213bExKMVhtdDhZcFVvNXIwM3hNSkRP?=
 =?utf-8?B?QXZPNVRNcmw4MnpSSUtIeW1WRDZVTFNuV2pYNldSMDNMNkFjRTB4WDZ6TmU5?=
 =?utf-8?B?cGRWN3FFRHBTYnJmTkVpSjMrZEhpUWlmUWE5cnlYU2J1TnYzV3Ivc1JmMFgx?=
 =?utf-8?B?WlQrTmhkZFFGL3ZvNmZrOW92MGYrSnF5L2xxeG04VTcyd0ZlUWFobFVVRGtk?=
 =?utf-8?B?aHR3L0xnVWtNTGJEcTFkV3R5T0VsZDJzNGxDbm0yZGxGMS8wV20vek9ON1Ny?=
 =?utf-8?B?Nlgxam85TGVxMkRHWGZKTTJnZmlkd2QxRU1RTytnT1lCbnpuTkJNcVp6bFVp?=
 =?utf-8?B?V3FMQmRtUCtBcW1jcExtQXh5czBxUTRTaTRldlU2RVZaWDdZNGQyTWxEOGlw?=
 =?utf-8?B?UW0zMWZrYi9aQ2MyMk1MUG1KaHNPZVNRY25MNzhNZWxYQXVnb1phNmVYRDhm?=
 =?utf-8?B?ZTVuRUcyZkdBdWEzWjdZZ1BIbFdXZFFlTERoTUltVEdoTURZaGFkTmJCSzRy?=
 =?utf-8?B?TEZKTlI0WERLQkdkeXBRTEZFQVEwdjdpa1J6cnFFMEZwRUJubTQ4QUtiNmpX?=
 =?utf-8?Q?WRBA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TndibjNaV0podndhYnhwRklqZnNjVCtkZm5IaVc2aUZjY3p6aTZvY2Zib2lC?=
 =?utf-8?B?NVdCaDlrY3dRRyt2cFFwUlpnd3VvcmpVZHkzNTJPR2xMV04zQWVzK2xaY2Jz?=
 =?utf-8?B?L2ZKR1NvOG8va09YRldvWTlxNDU0ZEpjSWZZYWc3eFgxb2c5RWtaUVNQaWFm?=
 =?utf-8?B?b2IveFpqNVJVRkFyazFmemVvdzVKL0tzZnBZUHBmTFZNVGJNSDN0bmtmZWNi?=
 =?utf-8?B?YVR4U0VjMVZIeGtTY1loQjNhSVRBMURPbWZIVVdKSXc5QXE3Q2ZubUFNNWtm?=
 =?utf-8?B?WmxUQlZPUEs5MkFnTktsSms1TEtybjl2NXloZkJNMisrbVoyWnRvQUxVTVY2?=
 =?utf-8?B?ZmFFQ2tHL0ladmx2NmpCUlBuRGlSTHMyV3h4eVpHa1R1VUpCN2dnQ0RnSXlR?=
 =?utf-8?B?RkRPQ1RSTk5EanBNeU1xTHZZM0hhS0ROaUJQRkpCdWpTZURqQ1pLYVp5WTVT?=
 =?utf-8?B?bHk4NytobHpoNFdrWmhxVjlqaUgyNFhzNmlCSXhNcktYbVh0cS9zckxteGNF?=
 =?utf-8?B?d0l4bmxKVXFPdlpPQUVKRTF5OGJVYVBQenA2ajZDeGpLRmE0Sk5pV3YrN1hp?=
 =?utf-8?B?ZWVIR0ZDODkyODRYdWZkUkFjaXVYaTY2VDBsdGF3aUJqQWN5WXpzVmZEUWtn?=
 =?utf-8?B?UG9mNTJYdldVSklIOFloT1plMExOUFdjZ2pVRTc2eGNtaDBOYVRCRjdBM2Zx?=
 =?utf-8?B?ajh5STJlZ3VXUTh3Y0ZuVWg1OFVCTkE3TXpKeWJFbkFxTW5NdWhUbjNtL3ND?=
 =?utf-8?B?MDJHOUVGdHlJVWticDV2UG5EcGFIQTN6SnlDS1FERDZZMGo1SHA3ZmR2bEhC?=
 =?utf-8?B?TmdBZU04TjRkM3RpZlJ4aWw2ZWdWeWRzNHRkcUNnZFVQNVlmWk1lWFF3N0lY?=
 =?utf-8?B?eU5yalAxUGoySTMwUFAwanE1YkNDSEd1RUdVOW96eVlsZkw5blFkOHdOdzZk?=
 =?utf-8?B?OEthY2NhMjh0U25BY0hzTzY0OSt4ckdEOGZ2bHZCdnBpQkgzUXp6NXRJeWFN?=
 =?utf-8?B?QTVkelFOVWdCUUk3NHJCOW5LSXQyU1RFeExuTmd0UWNTYkpqQkpjQ1pNOEtl?=
 =?utf-8?B?Ny9uZERMbHJEcldmSUg5dHVBMmVUeTgyeFRJTURDWlZ1Sk45N1orYWd4Yjd5?=
 =?utf-8?B?VTVqMUNZeVduSmt2dG9BR1F4M2hWUDhHTjhIMUxMdFc5M3lVN0tDK3Z5SWRD?=
 =?utf-8?B?UXhSMlk1WHZNQWYvbTZTQnJpM2ZLa1JIL1QwZVBLeTZFUVBHUVA5OGZFQWgr?=
 =?utf-8?B?S1M4Zi9SS0pJZW15U3FPSTRsTWUzUE00L2ZlNXdGQm5ta20waDZROGFHYmFv?=
 =?utf-8?B?bWFoRzBJNVpYemhEQmh2ZVFKbHl1SXcwQzEzM0Q0elpDa1NoQ1VTRSt3TlVi?=
 =?utf-8?B?TDQ0ejFhbytwRWlSTSs1a1BTQnBub3R5ODVzUHpIakZ6aXJpRjEybEN4MCtY?=
 =?utf-8?B?RzBkWXdzTDFlekl1WDhQdENneWFKUjZpaDlDVElRbloxbktkN052MTJ3dTdk?=
 =?utf-8?B?b2tjTGloYzhYTUtmNytMM3d2cHdnTG5idzJGNy9JcVpjbjc5YTIzNktlU2tZ?=
 =?utf-8?B?YlpKTkVrTXRidHdsQWkxa0dVVWtQRDk0Mk9hbTR2SkpZUGlPTEVVekJCNFZE?=
 =?utf-8?B?KytIQkZlSWhnZzlSV2ZqaE5EQW8xZmhpdnpuSW8wRGtKUitNSUNleHZrRTM2?=
 =?utf-8?B?Q1RtWEpNSkRqek5IcDhqdUh5QUNTa0hOVUZCZ1RRRU9RTXFhTHdzeVQ0TmRi?=
 =?utf-8?B?V1RDVC9RUm15eTdtZWd2QnlSNnJWaWhZSVVIa0pKcjRoSjJ1N3hiejNWbDR2?=
 =?utf-8?B?blR5a0pUZndUd3dmMFNONkR4WW1KRFBJYUZBeFZhUXB1ZlR4WWNFTlhyd2s4?=
 =?utf-8?B?bUdzclZCaFgxS2pPSFZpUVBUYnlhNnNUdG1tY0ozZnpVTy9NVjNycmhHVVJ3?=
 =?utf-8?B?UmRTQWwyMyt4NHhxSDBXMUdzTkpONTlBNTlMMWREWjkxVlFMUVl3RG9hOGQv?=
 =?utf-8?B?elBzL29oWmZlbW1LeUY0M3lvMlNsMzEwbWN4d2VXa0hZdWE5ZzdWQjY2NHNH?=
 =?utf-8?B?QzZ3cXpxYjM4NHBmeXQwT2dJMTd3cUlYQVJpalNNQWV2THo4VzI0bkFvTmls?=
 =?utf-8?B?dDlncHhCeFJoR0dFY3hPZ1ZxenRZa3ZjYW5qK0ZjNlp3RU15UVJGQ0FlUFFS?=
 =?utf-8?B?WkFJNE5OTElER3RZYU53b0g4YlptRUF6emZWTmdDdGRRMXphL0MyeElhUmJ3?=
 =?utf-8?B?UVZra0JKeWZkWDU2K0tWNGR3ZVhaTHZVdzQzMGYvVEg2REZ0aisyeWpGcVJx?=
 =?utf-8?B?dDVhdVVxMEpQb3M3U3pBcVZvS2xKTE82VzVhSDMzYUNnODJlZDErMUNyTUxh?=
 =?utf-8?Q?kvYEeJ7NGCCOh87U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b89ae6-c95b-43d5-6294-08de5808ea2a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:47:24.5760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLryuY4+Z03Fnhg0v7M3wODTeZb8DDH2z0/twgMAOcryH+vcWWZ4gnUNv6L3wmH+PyIha8BmFVTIzkdUNfV5AjWlVutOYRiouf1z82Bdr9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5940
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

On Mon, Jan 19, 2026 at 06:10:17PM +0100, Zbigniew Kempczyński wrote:
> Extend xe3p pipeline to handle sip for WTMP tests.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_compute.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 05ea92c7db..75cf1beba6 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1920,6 +1920,7 @@ static void xe3p_compute_exec_compute(int fd,
>  				      uint32_t *addr_bo_buffer_batch,
>  				      uint64_t kernel_start_pointer,
>  				      uint64_t context_data_base_addr,
> +				      uint64_t sip_start_pointer,
>  				      bool threadgroup_preemption,
>  				      uint32_t work_size)
>  {
> @@ -1960,6 +1961,12 @@ static void xe3p_compute_exec_compute(int fd,
>  	addr_bo_buffer_batch[b++] = context_data_base_addr;
>  	addr_bo_buffer_batch[b++] = context_data_base_addr >> 32;
>  
> +	if (sip_start_pointer && !threadgroup_preemption) {
> +		addr_bo_buffer_batch[b++] = XE2_STATE_SIP | 0x1;
> +		addr_bo_buffer_batch[b++] = sip_start_pointer;
> +		addr_bo_buffer_batch[b++] = sip_start_pointer >> 32;
> +	}
> +
>  	addr_bo_buffer_batch[b++] = XE3P_COMPUTE_WALKER2 | 0x3e; /* dw0 */
>  	addr_bo_buffer_batch[b++] = 0x00000000; /* dw1 */
>  	addr_bo_buffer_batch[b++] = 0x00000000; /* dw2 */
> @@ -2115,7 +2122,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
>  	xe3p_compute_exec_compute(fd, &idata,
>  				  bo_dict[4].data,
>  				  ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> -				  XE2_ADDR_STATE_CONTEXT_DATA_BASE, false,
> +				  XE2_ADDR_STATE_CONTEXT_DATA_BASE, 0, false,
>  				  execenv.array_size);
>  
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
> -- 
> 2.43.0
> 
