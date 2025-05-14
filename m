Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E812FC3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 22:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8089A10E02F;
	Wed, 14 May 2025 22:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nv2Q8gdy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16F010E02F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 22:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747261924; x=1778797924;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HNxZp0XzWgPSqdtWuJmVVna52yAVZP6JRrSpyROkGd0=;
 b=nv2Q8gdyLCxV1B5xA5aP0zKNZ/ZBYUloUHjMixBUN8cC2qrnB6371L67
 qfvTA5YTA0/mlTYdyqyWLi7G9ogNyHeW/EMhzoTfxmsoH2WQXmju73m0a
 3INLwy/lLwh4OMnWmh+KHcC7cw6+GR2AG629i1hrBxt6+BYjgTe0xfXm6
 Aa22apHuXzNgZwv93E4oH0I2bKdjuIBP70o53MCxlTYc0yO+NxE61EcVt
 Goe4d5dFjpAsc0JaAR2lTqvG7HrBS+2ejbh7R2vJen7ApY2sO3kO0D/uz
 yFXCBl47OvQPlj2bReLoNtHVLxeCkmDSd6ONbUjr8h3+ttDkbFZIHE5FQ Q==;
X-CSE-ConnectionGUID: rHnEQpHzQha7JlD3aDwy/Q==
X-CSE-MsgGUID: 7NwcDKenSxOdSk2gGeoXFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60585040"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="60585040"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:32:02 -0700
X-CSE-ConnectionGUID: li4PjjObT3uQWx3wYCSGkA==
X-CSE-MsgGUID: 3lf8mtmiQreof66yixRrlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="139082738"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:31:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:31:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 15:31:58 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 15:31:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9cjSun3ZkD7auTlsSg7c9YWam/vluGZN36ickRIC1Y8drycHgbKm7n+eHZyqrpRzLK2dVh7XDY+FkPT9s/fL4Rb2cH6g0N+di8ns1RCldlpSTn079vnY/jeiAylYi7FVADwLk7m5wS1gJpyowkYg8bczX3CFTbRdII6CrlGAeu0PD3/Q+NFNYbZWMBTegsmqhUhnmrH7nuICeN0A+61o8VQ8t/DEKA4bcC8s1F+Cvc2dsDvPmJ3V8/7xicIfCOk5XCnOFalO/y7akd1iUkwzb4ofCM8LMtsVPsLPanGsYX7X71xY2I34ZKN3Fucyb+NVRT7JFxsuFkygYn+Eu++DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Laro6/V5Q032nazk8AWshnLiICv4vGM5vy0VrFqs6lo=;
 b=Oh48RS+hMXPbFCuYaA8yJITsP26tZP6DaoKcJ6mk1ud59CRGpLH5NP5zPeCQXBn1jVvpsNLYHQW7nMrIEPxYnFDeVdtvpUcF62AT1z5GWnkeU4ggL2jbrdA/rGHllMe8BUPn1RPRfhFZ62rjjbE/xql0vpQri9H9bxb1ZwgC3ithlzdCWR38knFXuTWbMpZqV6/zImjC8yHCskv/pa81xjTZfvt1lF8JlhVa9g2NeTFS4xdRTsqDQCncW3kIcYM5tEtvCwLV7S5ozhIWsRrupzSiE5Kh/GiJ48fllUyTPoL+Aj659VCmBgWUBbq143O65TlRoe/fxhfJiuLRPN/oyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by PH7PR11MB6956.namprd11.prod.outlook.com (2603:10b6:510:207::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 22:31:54 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 22:31:54 +0000
Date: Wed, 14 May 2025 15:31:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_oa: Skip non-zero-reason subtest in
 simulation
Message-ID: <aCUZ2GWoF6Afxqxc@unerlige-desk.amr.corp.intel.com>
References: <20250514220225.1132066-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250514220225.1132066-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR07CA0038.namprd07.prod.outlook.com
 (2603:10b6:a03:60::15) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|PH7PR11MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: f0509507-778f-4767-1b23-08dd93372110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1VYejR6ZnRIQU5kTXBXSFJBSTVseGdFRE1mOGdpM0RLMFdtY1NoRWFOSk5v?=
 =?utf-8?B?YTh6WWI4NXVsR01HTWMxdmV6c3Q4R0JGNWVaT2dQSEtKWmd1cHBjSkZ2ZW1q?=
 =?utf-8?B?T2Q1a1FlSXJGdmUzZEVVRTRUOGpFMjVDa1NSaTVGSS9OSzRyYzF0Y3R0RjJl?=
 =?utf-8?B?N0JrM2VhbENOa0t1SWhJaXIrWGRKZ29EejIyQ2d5SjY4MjhYV1ducDUwUjZn?=
 =?utf-8?B?TjdzMnNxNE1lRTRRYlFkaXJ5VlBUNGpTU2lJc0F0WE5UQloyK0ozWHViUjNo?=
 =?utf-8?B?c0RCY2tBYUxJRy9ZSnk4ZEZUYXAwTmZCU0luYXdxS2YvNG96TWpEOFRLRFEw?=
 =?utf-8?B?QkY1MUxmMkcyemIzMVhjTVpvTEw5MllPWXlXNjdKUjlWTU1FRnpFMXRnSUNv?=
 =?utf-8?B?UXA2MjcxWVJqaVlPWjlYU1laZG1Pa3pEUWFwWUlJTGM5S0FobVBQSW5QRW9H?=
 =?utf-8?B?WmpjOHpsOVNPeStObitZYVp6QlRvZFBtRitVZ3lpQ3MxdEhGM0FqanlKK3Ev?=
 =?utf-8?B?aHBNZHNIcHRlNEZ4ZmFKNW05OWZDQWp4aG1Ga3pDSWJkYW9XUUlHYXZpR1ZQ?=
 =?utf-8?B?d0p3TTdrWnBNWDhuSDVYNFVyNjdSV056NzJqTmV1YkpKQ2VEMlhaSWN3MUxj?=
 =?utf-8?B?U1RFYTdRTWNEdDlWVWZ6em5DSVNTTkVtcG56U3Q2SENHd3BoWUJmSHdyRzEr?=
 =?utf-8?B?Z2ZCOFpKOFFNTnJtUGMweXUxdHUrWEh5WFNmZUhvLzcxSVRpYjdjYi9DSUlE?=
 =?utf-8?B?V3VNd3RMcW1BbWRocVVGVitEb3hGWW91bnUzSTQ4NTUrb2Zmbk9rTjNQZUFE?=
 =?utf-8?B?c0xmVmRtU2QxSGdxQXE1cnp5WVM2UCtHeXprMDN4U0RhQzhyRlRDdUp3N1ZL?=
 =?utf-8?B?eFlSUHRybE16dG1TNHRMajVYckJKcm5RbGF4VXR2RDQ3VVF3a2tKVEFRUytU?=
 =?utf-8?B?aDQ3UVg4OWd5SXloK2VPOWt0SWZGdUs2QytyYmVZdlNiWTZ0Wk52ZmRhdFkw?=
 =?utf-8?B?bGtmVk81dHkzZG5NcVhtQXA5OXpRcnUwdW1jK2VLMEQ4Zi93b0JxUDFKN1lo?=
 =?utf-8?B?THJ0VG9XdDhHd1k2c1NqbUc3TjJyeWpRZitkam5lWWdKWEdleTJFL0cvcWRC?=
 =?utf-8?B?a0cwbGdKbzMyTi9lTS9NNUJXZ1QyOWdYS004UTFGU3RmNUtpdk0wczVveHl0?=
 =?utf-8?B?bmdkT2ErcXBiWlBGSC9MZTdlcndXWWtmMzh5ZURsMk1FZ3JMWGV3STI3ODlD?=
 =?utf-8?B?QlR5NHkvNk9acWpXWllMVGl5eWZFWTlBQ2RrS0x0QlpHT3JHbldqNiszRHVX?=
 =?utf-8?B?Q2dhblo0VmZzUWlUL25PcjFHS2hUcnVzdWR0M253QUNaRi9QdDFPWVZJNlZl?=
 =?utf-8?B?RzFkcW8ycm15cXpISlJJcUlQS0JxWmUwcVpvWnVTUk1rZnFlV3NmRTNsM0tt?=
 =?utf-8?B?UUdWL2l4S2F3RmtNc0dDbENEWFNKaEFNdkpVd09SUkpEYXVyNWRVVmoxc2pF?=
 =?utf-8?B?eG5rMlMzL1RqYXJpLytVS0xTcmVWaWNXVGl2dWFwL1FIMzl5a0tTSWc0ZGpF?=
 =?utf-8?B?eHd4cmVKekcvR2pGV0ZKWFN1VlVXRE1aSzl4cFNGVTBKZ1B1U2JmWVJPQVJk?=
 =?utf-8?B?YWt3TFJRV2dnQVYwZVQxK28xbXl4SzVTbVdhQ0JyN2FIanp3eWV5ZmljSzZD?=
 =?utf-8?B?aTZOT3VkYnI0U3pld1dHaE8xdzdDYUZUQmFyVGRUOXVINmZOd2dReHBRajFS?=
 =?utf-8?B?SnN6OWRDWFp5ZVFMNlVrQVlGQ3dUbW9vMExqNWRyR2V1c0o5Z0xMZ1pDUS9S?=
 =?utf-8?B?Y1NTdjNHdVhHaldOVXJkODZlYmZBN0NlRkQrRnNxNTdQUUpheDQ3UjlySXpW?=
 =?utf-8?B?ZmNKUXFucFZNOGVPRWdrTXJ3cDRXN1B2SUVUZ2lZbzFCd0Izd2dQZVhwVkZ5?=
 =?utf-8?Q?ejjLwNXW2a0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmI4bW9kbk0wYkF3MjBqMlRLcGUwVjBhcmp4UzR0RjdMYThUdFJCVkM2ZEx2?=
 =?utf-8?B?V3B4alBZZTZaOTFpQUVjc0NJcFlsZHVEUEZwcXlrNTFjSVJhSDd1TUhERWtD?=
 =?utf-8?B?SmVRZVA3dWg2K21HM1IxUzR2b2VUMWxxRUpGbko3WUJHbDdxL0EzWHVtM1ph?=
 =?utf-8?B?dktsZTJmT2lJYnhpVzdSbVA5ZDJocHVWWENYSTk5VlF0UUFnTDhhSWxIWTZK?=
 =?utf-8?B?bDdJMVVJWENlaDBLTEtXb0ltZGV2ZG41d2gvNG9tK1NvQkwxQ3JScm1nMTVJ?=
 =?utf-8?B?aXVYbmxqVlhGeG1VcTRienFtQlQ2YjRrUDhmZ0UvS1orNVVoYjdGWXVUbnVn?=
 =?utf-8?B?cE5Bdno5TktQVmcyd3ZRRDZ2RENXVGl0Wm11b091dnJmcmVBVncvdkdiaWRu?=
 =?utf-8?B?WDlURFJjM3F2ZG4xWlQ3Z1VhbkRVaEhZbzhIZVNSbjYzUFN3M213MmdneE1y?=
 =?utf-8?B?TVRjK1RTckFNbnhRSzdqTVdJd0F6Y3BEQ0dTaGJLNjZtb1lvZ1h3YzN0SkFK?=
 =?utf-8?B?NG1VNVM5bXArdGMxMFlMbWZmL01mbCt0MDFHYlphZTFYUi9tRGhQNW4zV0Q0?=
 =?utf-8?B?N1VheklCQzJYU3lna3MyRnFCOWhLZVNNMVkzMkd1VTZxejdZQTgwWHVjNkVT?=
 =?utf-8?B?cGNET0ZjL3hMRWdjOGxHVm5vQ1ExVUMwZzZUbmxjODFHTXpxWXU1ZFVEUFRW?=
 =?utf-8?B?VnlOd3d4Und0R1NKNngwSWlpSEo2L2RRZEEvMmptdXNEcGJ1OEJjajZPYk92?=
 =?utf-8?B?UVQ1dithdHFUWVlTNTBWM2pQd0pEY0JoTkd2N3I3Y3RUaWR5ZlVqekRKR0Nj?=
 =?utf-8?B?ZTVXc3NDeWpCVHEveFNpVHRsamcxQWZ4VDM4ZFY0QWMyb1JoUEVjYmhWWFgy?=
 =?utf-8?B?Yk5tUnFGNEp3TDROYVg1RlprN2pqT25nbzhYeGM0dUszaHF4OFpXUDBkY29l?=
 =?utf-8?B?OW1TS2NybExKZ0lnWXFwdUhvcDF4VTBWQlNmU2x2RTg1VUhlaVJhWUVaQlQv?=
 =?utf-8?B?cmx5YmYzeUtYcFlpSXJXZGNUQlJDMkIvWEkwUHRRMERCaXZ3QXdrdkJGRzBv?=
 =?utf-8?B?M3VYOWtzTjJDaEtONHVYemJhQmk4cXRSK05UMFkvZStWSDZ5ZTZDN2UwWnN1?=
 =?utf-8?B?WmNSVERFMStubmZiZzhPRUlKWkd4WGlyL3A4d3J3UEhKQ2hnTGF0ZTl1cHdQ?=
 =?utf-8?B?L3M1b0QwdFNXOFhIQTN0ak1jSGZnUTJ3dlppODFxSkVJbXkyb3RDc1RZM0g0?=
 =?utf-8?B?dTJ5L0h1RitteVJpdW9GSG9UenZ0aHB4ZHJYYjdXbUZpTmpYN2FMRERCNGxJ?=
 =?utf-8?B?MzVDTUQrSEN4dWR0VEpWVHFhSWZaQkhRcWo4Y29zYy9nWWFLQ1VtZnJ4eHht?=
 =?utf-8?B?UWlNcGVhVGhzWHJuOGxybExIc3FHWHExakZOZmRwYW9BRGZ5V3pXRHhoWG9z?=
 =?utf-8?B?WlRBY1dvQmpqRUV6M0lxOUV0SU91c3gvdDg5ZjRQNExmL05wbUErMUxkM3Bv?=
 =?utf-8?B?SmcwdXg2a0txMnJBU2hPZ2ZEUDdwNHRGV3BHMERDNjhzaDlaOHJ2SnZwakFT?=
 =?utf-8?B?SWlOZmtJUzM1bDBkOGI4S1pacE12YWZtbXNacmsvTy81cU9VTjFGQnhMVXJr?=
 =?utf-8?B?T1dPQ3d5Tk81c0JGaStBMm9ZM2piUmZOUDBtN1oyUGJ2bE12MG9VWmhBTlAw?=
 =?utf-8?B?aXAwa25VR2xKamY5eVJSemZpNy9JQytmVlRPbUFEZjBwbVJwR3orK2FReEVP?=
 =?utf-8?B?c3RjSndaTVprZlBFNVN0TWVleTRzaUxVZEp4VFk2WUF4alkzUG5HTUJiTHBM?=
 =?utf-8?B?Q0l4VXNrb1A2V3J4Qzl4cGFTVUVxUFpEMGljb2NjYTJQcWZyWlk1MDhoSzhs?=
 =?utf-8?B?djYxcFJveHBESVlMUHJ5UHh6SzRzczhZSGhuT3hLVktucTdCS0cxU1VkSUJh?=
 =?utf-8?B?dExKS0xWcERKWkhkeE9WSGMwWnlIYzZkVnZVSXdtQzRiTGsrMlRqZk5UOEdw?=
 =?utf-8?B?MEgwODhqMEYvckNTaHJUTjNYeWZ0RTBSRCt2dmtBeEt3M25TK1JRUmtoVnhS?=
 =?utf-8?B?YThaeFh3R0d5RXRlL0V5Nm5mL0lCd3dRanFjTUdDbDBycHhVcktRY3RjeXRp?=
 =?utf-8?B?ZC8rZXpYUStvTWZVOEVXMnpyWSsrUUlENzdmb0NiM1k0cExUUjBoVk5GM0pY?=
 =?utf-8?Q?TQXSLLnFMMSYAKqr3+9e0uc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0509507-778f-4767-1b23-08dd93372110
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 22:31:54.5300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bmi4IQmBXDau3qE1AG+FWMRpipcpnFkIhMfmfUF4X7iacU4+VT3pQOBJwBJgQG6gE7DjDk7C/pKm0hlUqasoHxy0Iitv5xaiGMVxYMraw7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6956
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

On Wed, May 14, 2025 at 03:02:25PM -0700, Ashutosh Dixit wrote:
>Filling 16 M OA buffer multiple times is too long for simulation,
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_oa.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 48e6d6fd36..1576479d98 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -4970,6 +4970,7 @@ igt_main
> 	}
>
> 	igt_subtest_with_dynamic("non-zero-reason") {
>+		igt_require(!igt_run_in_simulation());
> 		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
> 		__for_one_hwe_in_oag(hwe)
> 			test_non_zero_reason(hwe, 0);
>-- 
>2.48.1
>
