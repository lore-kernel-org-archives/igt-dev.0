Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C6BC30653
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 08:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7663B10E5FA;
	Tue, 25 Jun 2024 08:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crFNjhnp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B1810E5F3
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719305065; x=1750841065;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=S93WXf8rcVHr820yrk4EZ5Iv+PcL/OlyNoricRD8y/4=;
 b=crFNjhnp1D6SEe8Tndwib5P6jbz/+CeDHf4sHPa7J2w8ZrrN0oDGz3SR
 W0eqtgoWlrQMtOmiSyyulZ9dzN/b+g7oISzuglQYOVbf/2iMngBSAHXjI
 pV7zn17Kg4uHMeLmSncsUsnyVBu9SsdfKD0tcCPdAEvyAx9FBuwxJJQMu
 zzOuUb8Py7Ge2nQ+kE/4ydRw3apGcdbugCLugISWBg/QKslJvcmNiRJr4
 8c7qtN+NQk9yc6IozZyctFNLIedjg7SteuPtGfWM42cRa9lfD/yaYavNu
 lXWrI7VQAzEeuGN73r/4RA/oMTP6Yuj2stWd6S5QhgkRJWVQgTpkjQqNt Q==;
X-CSE-ConnectionGUID: FA+UIM5qRz2j/aS7TXMAgg==
X-CSE-MsgGUID: 2RFcCVetRnOiZVCBQHrzMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="12233776"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="12233776"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 01:44:09 -0700
X-CSE-ConnectionGUID: AJPuXjIwTX+II2uUzdNH0A==
X-CSE-MsgGUID: WZFpHyI9TiKMt4q+5PaRoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="47956444"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 01:44:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 01:44:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 01:44:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 01:44:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 01:44:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUO99gx2JQTfGXuLEgiBkez0x57BApP9uPSBm1FuIlzIZkw1Pi7Ys5qvs4qsvoLQKuCWDogpiJ0Db5IbHSeE2pAf9rEvpnfvlwG8V+w4j13vD4s30BXOcH/KcEnjrZMoD5n3E1mvjTaK9hp+l+/0/UeR+Q/1pn1vMfh1sF3rLfFD5i6ThyAL8fQUmSDuUPkxnKCn3J9K3FC1hCqMwBO6VB+Zv3rz+/GjvJQK2egFgkKcTUMEajM6I1rFF1cAv1GESLWjuiME1L97Yx5dYi3stBmRxU64gVG1M67GlP6SVK7zNAkEVpF9V7zVD0h1oSN5O0mcvGWl0ulVb6enDLJlWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S93WXf8rcVHr820yrk4EZ5Iv+PcL/OlyNoricRD8y/4=;
 b=Z8hAXqaey0mpOozdqHzd6eKQgdHQbIIGe+1fkepVxWvIgTZTTe0ufPrsSNxhqmiIoIZ6yySZO6CB+VK9E422cN9wkX/xTTChl3NzYptwaS+EWFZkxdP72/cUua65z8VGH1gNRcwXvQx4+X+wARAIuyStT4g1Jm2mGyde7YnpVKrJafiBCpoEUEOnPg7ds2yb9QeMaA1y3gKgXSMPU294ozFqDH26fQNS+g/pOeBbAQv/o+R4+/B2U6C38rCmGQ6sKD0T1GOrU8+s7ryTwf0KK/Oh1o3FItKMx+PU4epvmGSARazka09L/FQMEjcYHy4gtKnHDZ0q0eKiEIwY3mLtAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 08:44:04 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%2]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 08:44:04 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/1] lib/gpu_cmds: Fix hardcoded buffer size
Thread-Topic: [PATCH i-g-t 1/1] lib/gpu_cmds: Fix hardcoded buffer size
Thread-Index: AQHaxitWyvE78CvKr0umVKU5LRxTD7HYK1KA
Date: Tue, 25 Jun 2024 08:44:04 +0000
Message-ID: <8727ec4e0b1347fe03070f5f6b9ee1401b43cd7d.camel@intel.com>
References: <20240624113949.6846-1-dominik.karol.piatkowski@intel.com>
 <20240624113949.6846-2-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20240624113949.6846-2-dominik.karol.piatkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|CO1PR11MB4787:EE_
x-ms-office365-filtering-correlation-id: 74c078c6-c028-4675-0272-08dc94f2f82c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|366013|1800799021|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?WUlhMWx1Sk16QjBTSHBORHE2bmUyMUFSYklOclFGZmtPY2ZwRnVaSXZ4WHJm?=
 =?utf-8?B?WklFWkNvYjJuTlErU2hUYkJwcEhkTU5nVXFEaXFwTlo3T3BhNk9zZUFXL1ZB?=
 =?utf-8?B?clRKbXk2UzFPNklFRnZBVlZwajZCTUFlaVhnL3lPdi9ZZU5yV2xuaWx5WGRj?=
 =?utf-8?B?Q3pFVnpyWjM4REtSZEgrVCtBZ3BQVDd3K3N6RkNodS9TdWhoMnc3bkM1RXJw?=
 =?utf-8?B?KzNvZW5RM2VFU0t3Qkc4WEFONGl6WjRhNG1JcURWQ2thYitCeU1Ca0lWY0oz?=
 =?utf-8?B?c0FRdy8rNnZUUHZ1ckxhY0IvUGNYMUwrZGNBbDZWL0phczdBUkRCRm1sWFBo?=
 =?utf-8?B?cU9pZ0FhdG8ybEVvMkpKSDVqSThLeXFpV0ZZSTJYYzBORmp4SmhNN21lRHI1?=
 =?utf-8?B?RFlaa0lOWi9uWm1ET3dURGdyK0lQS2Z3NGdDckt1bVNYemh2T0o4WjJqS3A5?=
 =?utf-8?B?QkI3dnVkNlUyVDBEOGtCd0NBVVlBUXBySHkxRkRxaHplSW9iQ3dVTDBTQXBF?=
 =?utf-8?B?RkdXR25iVGM0K0pBVnREd3VmNDc3QVF6dHUvM3c3WHhHYVVhK3VoZHRMOTlO?=
 =?utf-8?B?SHBTWmV4U3J3VTJuNW9EdnFoY1hHMlhvMjNJcWU0K2tUY2hKejdONjZqMktK?=
 =?utf-8?B?RU1ZMlNVZTdibTUrQmMyWjlrOCtmbGJBQWhHMElMZUxHSEZuT2E4S0NFTUhy?=
 =?utf-8?B?UW9ta2RUc1pvL295N1ZONS9CWlF2V2QzUStyeWRMUGR4bXBWNDVCQ0lTd05h?=
 =?utf-8?B?U0JrbmNBakpWSGd1Uk9ONFpoOHJGUzZXTzdrV1NUMFdDNVNuRTJpQnJxR0Zx?=
 =?utf-8?B?KzR5TitKVTFLV1ZwVmNwd3dPTXRqa0NBelFyall3MUxzOVo1MW5YRzVSMnNK?=
 =?utf-8?B?UzNwbUNXaTltRUxtL1NSZzJ4aXFkcnZ5QjR6TWd5Mm5MaUNLN0s1MVkxZmpv?=
 =?utf-8?B?TEFYOXBadTArdW9UWHlRbHVJVGM4SEFBdEt1QTVIMGRyTFZkNnR3cGtGM1Y0?=
 =?utf-8?B?ZU8zWVBmdzRlYlBRV1FpMXpZdkRIRTA2NlZRaTZ5ZE5sTjdVUkR2eks2T0ht?=
 =?utf-8?B?SytOeE9YUExIUGROK3hhUzdvUHFTOFRhZE5WUENldXFsUzc4VWl0Z0F6WWMv?=
 =?utf-8?B?Qjc5Z1JNOTRJU0hZVmRFb0dzQlQ4K0FXREJOUXRUYk9ITEJrbXVOQXppZXA3?=
 =?utf-8?B?UGdrcFhVUDFVVVU5OW9KZmxaelAwSU1XWENha0xxL3M2SzdERkFFOEk4bSsr?=
 =?utf-8?B?RTJaYzhSK3VsT1N5bzcvQWptYkJhZDRxSmh1RnJON0FtWUs2Tll0WXc0KzZD?=
 =?utf-8?B?Z3VFM3NkaVZQTzVRbWdHVGdOTFJxeU9HemVDeUFETGdIWk1qY2g3MkhDL3JT?=
 =?utf-8?B?b0hSeVBESzhnYnNyNGorcXZEVUJHeTJrSWR6cnBabURaaWE1QnVGenVWZEhJ?=
 =?utf-8?B?dUNVOEpiRVRVaEwzdVltR29la2V6dnF0aVpHdEhBRWlORzR2L2J5VjhpZGJT?=
 =?utf-8?B?ckswaFJKSXYydzV4Mm5sZ3NTdmVKWG9VaG9zYnJXd1dvV0k0dVNmbjYyS2ta?=
 =?utf-8?B?dFU5ZTF1Tm5iTkpEMTFBSnIwSHRqM1RiWUM0VENxekN3My8vVmZXdEdlMmZw?=
 =?utf-8?B?b3lrOVZGcWpaV1YrazRBSjdJWStvd01sS3Q1UmZibWhvMXR3bUkyM3M0bld0?=
 =?utf-8?B?QklwZnBkN01DelYxZ3MyUVZDU3JPWnFOUnAvaFdxMU5uS1pCekplVFFGZWpp?=
 =?utf-8?B?eStEbldya1lZQUdkZ0ZmNFM5OE1mVVlwZjhFb1RFeFAraTVITThqejIzKzc4?=
 =?utf-8?B?MVZHMnIrWGhkak1uKzBjN0ljaEdQN2hHRXJRK1A1WWVOSmRrTGFHMzE4Q1Fo?=
 =?utf-8?B?SWNVRjUxeDJFNXRoR05kQ3lwMkd1NVczelY3TUh3cjNDQXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dm9ITzBzOUxXY1JFSUMvdWo1MUxONDJiaUhjMDFRZFFMNHVBTE44U0tadXFW?=
 =?utf-8?B?NUhUanBoYUhmK2FCYWdkcHltWXczakhRMkdlT3c5VXMrQkw5c3IzNm1IUmll?=
 =?utf-8?B?N1BkdjN3dS9GQ3N4L0NWdnhUemFKc2N0cU9nYVhjTjNsYkRVRnVtc2pVTkxq?=
 =?utf-8?B?dzNmTituQ2NhdllBNTNtbkc2eEp5ZkwzeHF3M2xLMTF5U0tKOXZrb2JsTWtL?=
 =?utf-8?B?Q2NLQ2VrajBGY3dvZ2Rvem9CclV6Z1YxajgxSnU4b0dHZGZyQS9wU0t6OFNn?=
 =?utf-8?B?bEhvM1JXY0d4WnJOcVlRZnZOcTJMd0EwL1VOUDhlZkJ2SlhHS1AyMjJJY0dK?=
 =?utf-8?B?OG1xTFJGZWEvbUdsV0pLeWdDa3p2ZndEMUZYYXpSNmg0UUwrWS85eVVxNndQ?=
 =?utf-8?B?Z2RvSFNkYnR3Q1IyTUtJaXFDR0J3SmZGQU5lNjlGKzM0WjM5TlkzeXRnL2pJ?=
 =?utf-8?B?YmRqZVlibTB0SzJCVUJzb0xzRGJNKytmSnNRbE9qSWh5RHVGQ1dwOG9nMW0z?=
 =?utf-8?B?d3FpY2c0dlJkTnBKYUZNODYwQnVJRmxXLzVmdVBpMDIwaTNhdEdXZUhZQUdw?=
 =?utf-8?B?Y0F2dVFob2NrQS9FMCtsNSthSWpkL2JNU3F0OXpiRncxZ0JTeFloeWplOFdw?=
 =?utf-8?B?SkZGcXRDSVJ5R2hvSm1XbXUyWi9ob3BrYXVyV1dqZXhUNVdNV3RyRHBBMlFP?=
 =?utf-8?B?NVNOamRYVzhYSVBFSGtmM2psWThGRGxuZnR5MEZmb1ZmME1ZQkpYcitJdjk3?=
 =?utf-8?B?UWg5TlBSM1RXc3lsY1gxODBvbzVEczhGeWN0NnJ2WE92a0p6RHRpcWtBRmwy?=
 =?utf-8?B?R1ZEMW4xK01mZ1RDWVlialg4TzRXS1IzdWppb093VVNxb0huczkvVkpzQUlN?=
 =?utf-8?B?NnN3bDZDSkl4RUNrTkRKdE8xMEs4VDNaVXhadFVnU01rZmY0L0F6RUZkMGdI?=
 =?utf-8?B?RHhsaklBWlR6WnNoZVJnT2lPZWZUTWhDazk0OFpVSTloOXhyRXR6MEZXVkRr?=
 =?utf-8?B?dlpPRTN4RjhJcDV6QW1QTGRMbFZGZndRZVRDWmFreHJPNzFQMjRGa3IycCtr?=
 =?utf-8?B?Q0hJY2h3dzBtWmViTStkb1V2NHpwRU5mN2ZRM0ZEZ203Y3Bvc1ZjRXhMU1BC?=
 =?utf-8?B?QVhBZGhIa1NFOW1QT010K0NINHp2Y0FYSXVhbEppV3kyNkpoZTkrc3R4Z3g0?=
 =?utf-8?B?QnAyMkp3RkxLaG5YN3ZubUFBclVoOHVrbjdsV0VRRkI1L3RlNEtlelk4RVY0?=
 =?utf-8?B?bisvMVNFVzlNaDI1RkEwYzJBTlpGa3FSaWVDWXdlSXRnVEs2TlY3aThFaVI5?=
 =?utf-8?B?NlNNNGlNaTgreWlKR2tFTXgzRlhTZGlxTzFyMk8wT3lROEltSGNkV3BRVnA2?=
 =?utf-8?B?VHJqSUxxYlhSYkJXdmtvam1YdDlGclRzNk5VMDZzRW40UmV3SHVDanFXTU8w?=
 =?utf-8?B?aWRhdTczNTNQMzZFa24za2xLTTEzZStlMTZ0WkxnNHhjRHh2K2FHK3pYRjFs?=
 =?utf-8?B?ZkNxWmxuZVltY0lRdlJabWRMMEJxYzRxWERnVlZ0ZTZ5dUUxTGo5bzlpazU3?=
 =?utf-8?B?cjU0UlpxS3lJcVpMWXhDcDllVjd5T3Arc2ZQc0VaVXJhM2NpSnlSVGs3RGZQ?=
 =?utf-8?B?VHJBNk1oN3UwMTQvd3JGdWZyOWR2TUF5TzRyVHNORzR1dTdhRDlhZVovUGV2?=
 =?utf-8?B?b0lUYy9zVGxraW1lZGxwc2tESHgzTlhRR3p4dWE1SWY3NW5MZW8xTngxdlBz?=
 =?utf-8?B?UlZzRmZaZlRqSVdGaCsyKzdkVmZxUEs5NWVKV2ZsRGdUNlBIbWVHMTNZeEhq?=
 =?utf-8?B?ak4ydE5SdU1KZ2g1QXNqQzlhaTdra0JKM0hkb1hraTdrRzVXdGRtTjJ0THVC?=
 =?utf-8?B?WHFhQjE1MVFHVFFEL0NjM1V2KzdlR0EwNWxjK3FkYUcvL0VYWU1iWjVLUW95?=
 =?utf-8?B?WG52bDRXVGVtOENHaVhCazY2Z2Y3S29SU3kwQmZxVGd3UUQzRFVyVzh2cHBC?=
 =?utf-8?B?VTdocVh4MzlhYUZhUEJMZWsrOHFmdWQrYWVKVnB1QlNod1dVTSsyRG9xeW0v?=
 =?utf-8?B?RzZDSzlkd0plNkpBd2tRdEFibzBaci8zWmZCbmhNOXdmNXMxRGF0c1dyNFB4?=
 =?utf-8?B?MmlUYjFXWUZPaWxxTThCYWZZclR1U2NtT1plTXh0bmFFMHRtWXBZYXA0ajEr?=
 =?utf-8?Q?tS4Sf0gUCMBObJgFGecy/ZU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C8AAE28C27CF844B4C75AA53485F606@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c078c6-c028-4675-0272-08dc94f2f82c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 08:44:04.6221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6C3DaRtc4UZEYM6R2GS3cgI9QUL6F+BWIhaVjDFcxNAg+Ebnnwt2vjN2AI/OvZQ2DgnB6qfqILTa+0EnnCf7QRpX2YIel4fjC/r3xaiCWY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4787
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

T24gTW9uLCAyMDI0LTA2LTI0IGF0IDEzOjM5ICswMjAwLCBEb21pbmlrIEthcm9sIFBpYXRrb3dz
a2kgd3JvdGU6DQo+IFRoaXMgcGF0Y2ggZW5hYmxlcyBidWZmZXJzIGxhcmdlciB0aGFuIG9uZSBw
YWdlIHRvIGJlIHN1Y2Nlc3NmdWxseQ0KPiBzdWJtaXR0ZWQsIGFsbG93aW5nIGZvciBsYXJnZSBz
aGFkZXIgZXhlY3V0aW9uLg0KPiBCYXNlZCBvbiB0aGUgZmluZCBieSBEb21pbmlrIEdyemVnb3J6
ZWsuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEb21pbmlrIEthcm9sIFBpxIV0a293c2tpIDxkb21p
bmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9ncHVfY21kcy5j
IHwgMTIgKysrKysrLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9ncHVfY21kcy5jIGIvbGliL2dw
dV9jbWRzLmMNCj4gaW5kZXggMzc4ZmE5MTY2Li40ZjI3ODFlN2MgMTAwNjQ0DQo+IC0tLSBhL2xp
Yi9ncHVfY21kcy5jDQo+ICsrKyBiL2xpYi9ncHVfY21kcy5jDQo+IEBAIC01NjYsMTMgKzU2Niwx
MyBAQCBnZW44X2VtaXRfc3RhdGVfYmFzZV9hZGRyZXNzKHN0cnVjdCBpbnRlbF9iYiAqaWJiKQ0K
PiAgCS8qIGdlbmVyYWwgc3RhdGUgYnVmZmVyIHNpemUgKi8NCj4gIAlpbnRlbF9iYl9vdXQoaWJi
LCAweGZmZmZmMDAwIHwgMSk7DQo+ICAJLyogZHluYW1pYyBzdGF0ZSBidWZmZXIgc2l6ZSAqLw0K
PiAtCWludGVsX2JiX291dChpYmIsIDEgPDwgMTIgfCAxKTsNCj4gKwlpbnRlbF9iYl9vdXQoaWJi
LCBpYmItPnNpemUgfCAxKTsNClRoZSBzaXplIGlzIGluIDRLIHBhZ2VzLiBpYmIgc2hvdWxkIGJl
IGFscmVhZHkgYWxpZ25lZCwgYnV0IGFueXdheSBJIHdvdWxkIG1ha2UgaXQ6DQoJaW50ZWxfYmJf
b3V0KGliYiwgQUxJR04oaWJiLT5zaXplLCAxIDw8IDEyKSB8IDEpOw0KDQpXaXRoIHRoYXQsIHlv
dSBjYW4gYWRkIG1pbmU6DQoNClJldmlld2VkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWlu
aWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQoNClBsZWFzZSBhbHNvIHJldmlldyB0aGUgcHJlbWVy
Z2UgcmVzdWx0cywgd2hldGhlciBmYWlsdXJlcyBhcmUgbm90IGNhdXNlZCBieSB0aGlzIHBhdGNo
LiANCg0KVGhhbmtzLCANCkRvbWluaWsNCj4gIAkvKiBpbmRpcmVjdCBvYmplY3QgYnVmZmVyIHNp
emUgKi8NCj4gIAlpbnRlbF9iYl9vdXQoaWJiLCAweGZmZmZmMDAwIHwgMSk7DQo+ICAJLyogaW5z
dHJ1Y3Rpb24gYnVmZmVyIHNpemUsIG11c3Qgc2V0IG1vZGlmeSBlbmFibGUgYml0LCBvdGhlcndp
c2UgaXQgbWF5DQo+ICAJICogcmVzdWx0IGluIEdQVSBoYW5nDQo+ICAJICovDQo+IC0JaW50ZWxf
YmJfb3V0KGliYiwgMSA8PCAxMiB8IDEpOw0KPiArCWludGVsX2JiX291dChpYmIsIGliYi0+c2l6
ZSB8IDEpOw0KPiAgfQ0KPiAgDQo+ICB2b2lkDQo+IEBAIC02MTAsMTMgKzYxMCwxMyBAQCBnZW45
X2VtaXRfc3RhdGVfYmFzZV9hZGRyZXNzKHN0cnVjdCBpbnRlbF9iYiAqaWJiKQ0KPiAgCS8qIGdl
bmVyYWwgc3RhdGUgYnVmZmVyIHNpemUgKi8NCj4gIAlpbnRlbF9iYl9vdXQoaWJiLCAweGZmZmZm
MDAwIHwgMSk7DQo+ICAJLyogZHluYW1pYyBzdGF0ZSBidWZmZXIgc2l6ZSAqLw0KPiAtCWludGVs
X2JiX291dChpYmIsIDEgPDwgMTIgfCAxKTsNCj4gKwlpbnRlbF9iYl9vdXQoaWJiLCBpYmItPnNp
emUgfCAxKTsNCj4gIAkvKiBpbmRpcmVjdCBvYmplY3QgYnVmZmVyIHNpemUgKi8NCj4gIAlpbnRl
bF9iYl9vdXQoaWJiLCAweGZmZmZmMDAwIHwgMSk7DQo+ICAJLyogaW50cnVjdGlvbiBidWZmZXIg
c2l6ZSwgbXVzdCBzZXQgbW9kaWZ5IGVuYWJsZSBiaXQsIG90aGVyd2lzZSBpdCBtYXkNCj4gIAkg
KiByZXN1bHQgaW4gR1BVIGhhbmcNCj4gIAkgKi8NCj4gLQlpbnRlbF9iYl9vdXQoaWJiLCAxIDw8
IDEyIHwgMSk7DQo+ICsJaW50ZWxfYmJfb3V0KGliYiwgaWJiLT5zaXplIHwgMSk7DQo+ICANCj4g
IAkvKiBCaW5kbGVzcyBzdXJmYWNlIHN0YXRlIGJhc2UgYWRkcmVzcyAqLw0KPiAgCWludGVsX2Ji
X291dChpYmIsIDAgfCBCQVNFX0FERFJFU1NfTU9ESUZZKTsNCj4gQEAgLTEwMjYsMTQgKzEwMjYs
MTQgQEAgeGVocF9lbWl0X3N0YXRlX2Jhc2VfYWRkcmVzcyhzdHJ1Y3QgaW50ZWxfYmIgKmliYikN
Cj4gIAkvKiBnZW5lcmFsIHN0YXRlIGJ1ZmZlciBzaXplICovDQo+ICAJaW50ZWxfYmJfb3V0KGli
YiwgMHhmZmZmZjAwMCB8IDEpOyAgICAgICAgICAgICAgICAgICAgICAgICAgLy9kdzEyDQo+ICAJ
LyogZHluYW1pYyBzdGF0ZSBidWZmZXIgc2l6ZSAqLw0KPiAtCWludGVsX2JiX291dChpYmIsIDEg
PDwgMTIgfCAxKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vZHcxMw0KPiArCWludGVs
X2JiX291dChpYmIsIGliYi0+c2l6ZSB8IDEpOyAgICAgICAgICAgICAgICAgICAgICAgICAgIC8v
ZHcxMw0KPiAgCS8qIGluZGlyZWN0IG9iamVjdCBidWZmZXIgc2l6ZSAqLw0KPiAgCWlmIChpbnRl
bF9ncmFwaGljc192ZXIoaWJiLT5kZXZpZCkgPj0gSVBfVkVSKDIwLCAwKSkJICAgIC8vZHcxNA0K
PiAgCQlpbnRlbF9iYl9vdXQoaWJiLCAwKTsNCj4gIAllbHNlDQo+ICAJCWludGVsX2JiX291dChp
YmIsIDB4ZmZmZmYwMDAgfCAxKTsNCj4gIAkvKiBpbnRydWN0aW9uIGJ1ZmZlciBzaXplICovDQo+
IC0JaW50ZWxfYmJfb3V0KGliYiwgMSA8PCAxMiB8IDEpOyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLy9kdzE1DQo+ICsJaW50ZWxfYmJfb3V0KGliYiwgaWJiLT5zaXplIHwgMSk7ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLy9kdzE1DQo+ICANCj4gIAkvKiBCaW5kbGVzcyBzdXJmYWNl
IHN0YXRlIGJhc2UgYWRkcmVzcyAqLw0KPiAgCWludGVsX2JiX291dChpYmIsIDAgfCBCQVNFX0FE
RFJFU1NfTU9ESUZZKTsgICAgICAgICAgICAgICAgIC8vZHcxNg0KDQo=
