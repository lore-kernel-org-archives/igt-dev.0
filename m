Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2101FC02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 09:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A1810E514;
	Tue, 21 Jan 2025 09:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frbi9sZ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D1F10E513
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 09:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737450849; x=1768986849;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nTQTuqqC53OunQsESPyzyn90SZ2WmABA1GQI3sQbp64=;
 b=frbi9sZ4APjMG5nXwZOVwnVjcPAINjQz2svHejFAzVMIqv+Licf8moJi
 3loanqb9pUbydDk2FdBowbubs/puQC2FJhsNW42Mp27mFcUVbx9QXcy/V
 e/rbvg4i+V5/WlzafpsYh7JtZBy9cI6HwbPhpxV3eTGzatYDYCXVt9LWu
 tm+UZ5AoKn7fTLkeGCbE0rNBH6uO7ap8DVeDZi8PKPVl8yLrEbtQb4B7+
 gINOdFA1bXYQ37N1nZAfNlmK052iOSbpiKUO+OLOPab35r7wN2KMlqQ65
 v6cgZDOjFxZ+/r4sO52RB462WikmrT2NPVr1yWW2qQ8d1IOwCm/C3Jjp2 Q==;
X-CSE-ConnectionGUID: 6WVy6NpqTnO3KfdXFCPqxQ==
X-CSE-MsgGUID: sDm31sTjTUujOnSORc3Lhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37729855"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="37729855"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 01:14:08 -0800
X-CSE-ConnectionGUID: j61gazngTVGbyu90eyCO/Q==
X-CSE-MsgGUID: c78xO9qgRY+5IfPzmScciQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144011206"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 01:14:08 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 01:14:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 01:14:07 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 01:14:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N74hU741LGNx2vD5f+o9vcl2a+VsFbnPuw25YzHS8SlE2fzZ4FrbTKxNFQ1I1Q7SFujTpCZRIhwPaEEPNXeGCvnICFq5zK9XVCzR6Xip4f6FP6dfLWy6guJ8gtxszU3TFi1GSP6xGP2coHgb5MNK4aIz41i+YfCynO8t7sQpuY7kvYW0MzA2K4tj7ktlgSSmm1uT/MRJHWCgczrfDoJSXZ1RiWIjmWfbcpnun30JpWwbe5GANmvl1bFG+x+AP4PORBut6fLsmIcBHWuR4BM55U4HvetVELACQNrjqjTOPIqfIUixGDTR7AfINjHyIE5sN4aMMsyimX1gcX1Gq6YSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTQTuqqC53OunQsESPyzyn90SZ2WmABA1GQI3sQbp64=;
 b=fEaANxOUFYlSt+ehrMJwludv2ufVA98K02aJHEbr3is4xmTde7R5wN1/EvZNRr6vOnQoLkuHJZFMOQCmprLy+uCqnFm25LeoEtbw1Y+fk/UyCem6/JBcYIyBG2T5IOdfjEMZZdpshFpM9OJxGaL1MSFJPmza5tp3ZRtAsrHNSF9U3ZPBewUDxdWiNdf+6+wZVZz+70peOj9g2TNUixzwgc89PN+XTPsNfcA6/tcF2syRhkttiF5sBfb9RIdBXUuWJEFP7D5OU8igu3IONU2H8Ja+s/BMnpYpHEF1NMC1qv7tIlBsSnEdz9lUBagcK56ZpbfZNbal2vP8Qf1cHdAN6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by CH3PR11MB7392.namprd11.prod.outlook.com (2603:10b6:610:145::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Tue, 21 Jan
 2025 09:14:05 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 09:14:05 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH 1/2] lib/igt_facts: Make igt_facts_test noreturn
Thread-Topic: [PATCH 1/2] lib/igt_facts: Make igt_facts_test noreturn
Thread-Index: AQHba8zbyKUINRLeDEa2ltqrYPq7g7Mg4zWAgAANdzA=
Date: Tue, 21 Jan 2025 09:14:05 +0000
Message-ID: <BL1PR11MB55257D034ACCBD6FF163A80584E62@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250121063207.71737-1-pravalika.gurram@intel.com>
 <20250121063207.71737-2-pravalika.gurram@intel.com>
 <21d050fd-f30f-4759-86b7-343d3f7b1015@linux.intel.com>
In-Reply-To: <21d050fd-f30f-4759-86b7-343d3f7b1015@linux.intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|CH3PR11MB7392:EE_
x-ms-office365-filtering-correlation-id: 550a52ec-1536-492a-0b7a-08dd39fbf459
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZkU2NTJpY0h1NlhCNzkzTFlVK2p0R0x6MWVSNjJXU2ozQTdHU3cxK1NEblBH?=
 =?utf-8?B?Y1poSkc5TEJtWTdzRVpncVFhS3lMV1BQemp4eWVUT1VSMzVQREN6NVJFcG9p?=
 =?utf-8?B?N09KOURnRERKNU5PelRrYmZTdHVZTmorQWl3Nk9qTk16RUlCYjZYOWJ3cHdi?=
 =?utf-8?B?Rm1NY3hBUlVCUGVLN0ltcE5NL1BaTkdWVC9MOHRpdVdtd3dWMDN1ZWMxSjNG?=
 =?utf-8?B?QzF1SGRtMVRxVG1reUNPRXNmT1kzVWpaa05UQ3RBSmwyRUpUZldkNEdYbUE0?=
 =?utf-8?B?N2h0Q1hMaDhNenZPbUlZak9Kb2ZBU0dIOFVVa0ZyY21DUXl5OGliTFNmeUVZ?=
 =?utf-8?B?YmgreWk3Q1h6OSsyeDd5TlFucThFZW03VWhGcDVvYVFXcXpENU0weXBtNlI3?=
 =?utf-8?B?cFA0MHM4eHV3bUFNT2VUS3FhR1VOU0ZIQUViNmNvT0hLNTlsZ0hWYzlROTFo?=
 =?utf-8?B?bHdQVHVoUFhpWjhpb0NORWkxckNQbTJyeklUeWRQM2sveW15TFptZzRuaitH?=
 =?utf-8?B?bGpRRDUwRjk2VUJNekZpSzN4Wk54bUt1R1JYZnczVkpJakd0U3M4c0FzWnpx?=
 =?utf-8?B?NldxemErQnJjMHN2aVpma2VGbldLYmIwbjBKUnFubmtheFVNOHZtQ3JUeldK?=
 =?utf-8?B?bkF0QUZBa0VtMkgwNlRDMHByN0xPZDN0NitxaXlmN1B2Vk9aY3BEOXZDNGN0?=
 =?utf-8?B?SG9sQ1hzVTd1QnN2MUR2TnZRWE94L296WHJFNjlIRzR0ZVhqcjVtMzlSZ1BZ?=
 =?utf-8?B?S2h5S0lNaHprQU1BNnpmZU5MeTdpbWJ6R3BoVnYveXJWZk10K3M3M2REV3gy?=
 =?utf-8?B?ZUJOSE5WM1E1SzIwb08wQS96MmpOeWQ5bWlNUFpsTll3TUpoMVFLNHIvL3Bp?=
 =?utf-8?B?OEZMSE1BdGFwaU5yTEgzVi9SQXhnOHIvdXFNRE92Ky92NStFWlJSVWxRQ01Q?=
 =?utf-8?B?Q2ZXVUd5UTRLT2g0OCt5L2FJRUVyUjZ1ZCtTaUUrRDhuNkNpNnh3dVR5QVRT?=
 =?utf-8?B?SkIzcTVYclZ2Nm11RGFtekhQak0wQVJDNDZPS2h5eFR2TXdkY0NSVlVPajlR?=
 =?utf-8?B?bFJ0ZjlUN3pQUmlhZDNGbzVpSWxPb3JlRHluQ0VuMHE2aHpkMS9LOEhBRHph?=
 =?utf-8?B?UTBaeU1IQzJMTXEwa3lqRHBOZDZ6ZHd6VkVPUTNKbU9CUTMrcFAvaVlJSUZH?=
 =?utf-8?B?Q0tDVnJScVZLL0RSbldvYy90R1JSQjZaR1N1dy82RmtZTHVwck84a1dONFFV?=
 =?utf-8?B?bUV6MUhRM0UrYmljTUlKK0p1QS9QSXlXN3hUTGcyZFJDTTZjenhuK215SnBr?=
 =?utf-8?B?YlE2MHpLTDhsTElXUk1oNDRDTjhNS01ibVZSZys0MndGNUFQZ0REbm1xVGtw?=
 =?utf-8?B?K2pOeUp1bW9rbWRxcnVpQ081OFV3cUptNUI2Y1l0MXpkd3lyd1V0ZnJHT0hn?=
 =?utf-8?B?ZzZzRHVGRnlsWE1CMGo5cm1lRjRFa3E1QWdCN013NlEyUko0V05tYjRZaEQy?=
 =?utf-8?B?ZTJDTkVwRmpDZjE3U0UyQ1dJQUpheWVBenpCTHNJelI3N0thTHkrT1Y1MlF2?=
 =?utf-8?B?RHZNT2FCYTJFZEVEeHJlRkppSVRCZkJKd0xRWWNPUlNMVG9vVnhRTC93aDVJ?=
 =?utf-8?B?aEVOUlEzRWdqeWZla1A3NzVRQ1RCMUJFV2JrY1gvOTBnMTlQL0lSYVJwMkhW?=
 =?utf-8?B?UXZUVVFSYVBuNFY4ZUM3K0gzYUh6NTlEemhuZTd0YlB4MWovNnhrYzU3Tkdu?=
 =?utf-8?B?T0FtM1dvUTRNb0ZHV0h3cjdkTFNDR25BcE1PZlJpQVBJRU1oMkZVcmV6ZzFN?=
 =?utf-8?B?c0UyS1YrNUJBWG9qR3FvNU5WZndEM2lyNzNMaDV5bGhnMW1BdGZteXJKTzBQ?=
 =?utf-8?B?OVRZUTAxOE1ZdVRWcnFvUWpmRGNjTjJRZmxRRVp2MmhUMFFpUW1SaHlnanla?=
 =?utf-8?Q?fOjhjjYgboeakZthAQW4ak/x6UnKTQdi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWR3ZUVHVmthalRJMkp4ZzJZV3dna2RJblZ4eWtwT3JBK2t5SEwyT09xSy9E?=
 =?utf-8?B?VlRGNjFaVjRpWENkdm9hUTVaVkNBbTNCWlMrbE9VKzFZaW1IQVh4aWF2STVV?=
 =?utf-8?B?aXY3QU9Udi9HSXN5QUNHTk55U2lzeFdRZmw2ek5rMU9YazJGZUtJUGpERjhG?=
 =?utf-8?B?cDltL0UxdWFza1NzWWs0YURPRStYczg1endvbmc4dnhuZTR6Q1dMNi9iL0d4?=
 =?utf-8?B?Wkw2cUNVUm9LLzVVNGsvekNud09ySEtrc3cvVllyYVNvMUt4Y2VINzF3VTZu?=
 =?utf-8?B?Nmlwa2pKeE9QUUhUUjFnbnZOeUVXSm02bmdud1JFVnoxeFhMODc4OGxWNTMz?=
 =?utf-8?B?OGNJTWdXanlKeHBWL0xTVlNvQTZyVUZhQzcyamhQSC90Y245dzhSc1U5R3hG?=
 =?utf-8?B?RjhGN3ErSnorUjg5T2VQNmVSMzMyL3lIelI5Q2d4c29KQmx1MFZrMFE1WURV?=
 =?utf-8?B?NFRZVzdIUGJRUVVoVDFqekxldXVHbnF3UmlsdXk0Nkg5Q1dyQVp2Yk5OeU1u?=
 =?utf-8?B?NGg2NnR4bE80RFFjSm9jUm5FYmc5dHJ3Mjlkdk9aZGlHSzJBVitaWmJFR0lq?=
 =?utf-8?B?NjliUlFDYWFKZGMyKzJxYzlPKy9mZU5VQzMrQU9qVXQybFNnbVRsRTFESFJx?=
 =?utf-8?B?MEE0dFJGRE5GUnI3WklXa21aS0t2UGhDV2M1akNucDNIa0lPOFJzM0NSTjQy?=
 =?utf-8?B?YWVCN1NFeldOWEx5UThNRHFSYmxFOW5qOGlsMXhNMmVBZ29jdGxjSVl6WnJ4?=
 =?utf-8?B?Vy92b1VWRjFMQWNrMjRvQWFDVEJoQWZoRVMyalFvc3p5b3VhY1lqcXU3d3U4?=
 =?utf-8?B?V29vUEtIaWhLMUVSZDl0MGYrNGFtSzEvbGgwNENZTHIzS01BZnJjbm9FVkVq?=
 =?utf-8?B?UlJqZnc3UDFLUC82aW51TWV6VjJEQ1VVeUZUaVdtalZoQmdGcitQbzdqRklG?=
 =?utf-8?B?eTlrVlIyYWRRQ3B5S3N2QlR2bTc5Wkk3Z2NDc2cvRFk5M3pDYVNsNU9ROThk?=
 =?utf-8?B?RTVSL1d1TVQ2ckVLT0xLdzM3dzIvY1VLL2gzUlVpU05WSGtsbVpwZElQdkM1?=
 =?utf-8?B?cm5aTXJLMEErUjlsVjJPQjhjb092VWxMTFFnalJlNFo3NjNHeWVzdWUrUXhX?=
 =?utf-8?B?Q29TSC96RjEzOGdrbTEzamI1M2Qxd3doTHJCVEo1am55UWtHWWN6aTVNQllQ?=
 =?utf-8?B?QTZoemhiMjZTT2VBUGZoQnBkQUdiZW9ITUhNSG04OWM4SzdzcXJzZ0NRZ0Mz?=
 =?utf-8?B?NDhTOWNJYk14WUJsUkxva09Ma21Pbmxvck1NYzNOZ1lRa0JqUFZpVnM0dktP?=
 =?utf-8?B?UjJlZGV3VFBQcGZ4OE5PbG44eXBiT25Ec3dubnZoZGZnaGFaZXZ5aFh3Rmh5?=
 =?utf-8?B?aWlqQjMwdEtPbmdDZk9DWVJBb0xTSXhTQWRrejk4VUJFaFZmcUN6cU1NLzRm?=
 =?utf-8?B?T0F0UVFXQzlLZ3d3WlJ1dnErZmpUUXFrWWs5em9GcW93bVBFSklSSWRYZ3dX?=
 =?utf-8?B?Q0QwU1dQRWIybHU1SmFlNVdoK3p5WklETmJCYm9NUW4zdTdZMit5MU9GcXdU?=
 =?utf-8?B?ZTVQVTBoYlIxblIwOVdiZ3hNSmtMdWNFUkt3aHY5ZXRjSHNxVW1pVDNVR29H?=
 =?utf-8?B?L2tYRVluSVhFYklzalhxMnZQb1V1c2M0RkNqOENKMEZhSzZkQWt3VE1CQUZS?=
 =?utf-8?B?SUhTMFAzSSs5ZzFpOWljMkF3cW50ckQwSmpNZFFTb3VTTWRIV1RBVTlQU0JP?=
 =?utf-8?B?bkNEQWtLNHpIa3ZrUktaSEFJdkUzVlBxNEUyZ0pRWFpaeWxnL2E1d3E3SmRl?=
 =?utf-8?B?b0J0KzJDU0ZpTWF3Z1FVUHhTNWpETmVGajhRRHlPc3JGdUZTTTErV0VSSnA3?=
 =?utf-8?B?WDZSTUR2SSswOUREcHNvRCtMdSs1ZnErejNWZjkrejdDSzgzYkNuQk5qdXpW?=
 =?utf-8?B?MlJLc1hqd1N0WXIrMEdUOFRNMkJqYzJqcERDNithRlF4NWE1K0NQemNSQm1w?=
 =?utf-8?B?L2U1QmphZ1F4UXNBSTV5ZUpKbk5OaUpBdHlXaUQzQitOdHVkSXlCazgyQW82?=
 =?utf-8?B?ZUR6cUEwYUI2M3ZHdXY2Tjk2eS93amVidWVJcDBLNm95a2d0UzFPdko3U2FE?=
 =?utf-8?Q?hvv70PlQu/J469q2PHFJ0/54X?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550a52ec-1536-492a-0b7a-08dd39fbf459
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 09:14:05.5000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F1/wB0H7RNyjp/lH8AZtxU2Lii6EF5LGtMnmsA3hjhZAnyM9AEhglG0Efc1M2yU2o/798dweUK8j9OzCX/i0h8pDPex3IrBmZgxOe98XsSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7392
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgU2VubmEgVHNj
aHVkaW4gPHBldGVyLnNlbm5hQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgSmFu
dWFyeSAyMSwgMjAyNSAxOjUxIFBNDQo+IFRvOiBHdXJyYW0sIFByYXZhbGlrYSA8cHJhdmFsaWth
Lmd1cnJhbUBpbnRlbC5jb20+OyBpZ3QtDQo+IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGth
bWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJd
IGxpYi9pZ3RfZmFjdHM6IE1ha2UgaWd0X2ZhY3RzX3Rlc3Qgbm9yZXR1cm4NCj4gDQo+IEhpIFBy
YXZhbGlrYSwNCj4gDQo+IE9uIDIxLjAxLjIwMjUgMDc6MzIsIFByYXZhbGlrYSBHdXJyYW0gd3Jv
dGU6DQo+ID4gbm9yZXR1cm4gYXR0cmlidXRlIGlzIHVzZWQgdG8gaW1wcm92ZSB0aGUgb3B0aW1p
emF0aW9uIGJ5IGluZm9ybWluZyB0bw0KPiA+IHRoZSBjb21waWxlciB0aGF0IGZ1bmN0aW9uIGRv
ZXMgbm90IHJldHVybiAuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQcmF2YWxpa2EgR3VycmFt
IDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgbGliL2lndF9mYWN0
cy5jIHwgNCArKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9saWIvaWd0X2ZhY3RzLmMgYi9saWIvaWd0
X2ZhY3RzLmMgaW5kZXgNCj4gPiAyZTA0YTdjODYuLmJkNjc0MjA2NSAxMDA2NDQNCj4gPiAtLS0g
YS9saWIvaWd0X2ZhY3RzLmMNCj4gPiArKysgYi9saWIvaWd0X2ZhY3RzLmMNCj4gPiBAQCAtNzQ4
LDcgKzc0OCw3IEBAIHN0YXRpYyB2b2lkIGlndF9mYWN0c190ZXN0X21hcmtfYW5kX3N3ZWVwKHN0
cnVjdA0KPiBpZ3RfbGlzdF9oZWFkICpoZWFkKQ0KPiA+ICAgKg0KPiA+ICAgKiBSZXR1cm5zOiBi
b29sIGluZGljYXRpbmcgaWYgdGhlIHRlc3RzIHBhc3NlZA0KPiA+ICAgKi8NCj4gPiAtdm9pZCBp
Z3RfZmFjdHNfdGVzdCh2b2lkKQ0KPiA+ICtfX25vcmV0dXJuIHZvaWQgaWd0X2ZhY3RzX3Rlc3Qo
dm9pZCkNCj4gDQo+IEhvdyBkaWQgeW91IGZpbmQgdGhpcz8gSXMgdGhlIGNvbXBpbGVyIGNvbXBs
YWluaW5nPw0KPiANCldoZW4gYW0gZml4aW5nIHRoZSBjaGVjayBwYXRjaCBlcnJvcnMgSSBoYXZl
IHNlZW4gYmVsb3cgZXJyb3IgDQoNCm5pbmphOiBFbnRlcmluZyBkaXJlY3RvcnkgYGJ1aWxkJw0K
WzIvODM1XSBDb21waWxpbmcgQyBvYmplY3QgbGliL2xpYmlndC1pZ3RfZmFjdHNfYy5hLnAvaWd0
X2ZhY3RzLmMubw0KLi4vbGliL2lndF9mYWN0cy5jOiBJbiBmdW5jdGlvbiDigJhpZ3RfZmFjdHNf
dGVzdOKAmToNCi4uL2xpYi9pZ3RfZmFjdHMuYzo3NTE6Njogd2FybmluZzogZnVuY3Rpb24gbWln
aHQgYmUgY2FuZGlkYXRlIGZvciBhdHRyaWJ1dGUg4oCYbm9yZXR1cm7igJkgWy1Xc3VnZ2VzdC1h
dHRyaWJ1dGU9bm9yZXR1cm5dDQogIDc1MSB8IHZvaWQgaWd0X2ZhY3RzX3Rlc3Qodm9pZCkNCiAg
ICAgIHwgICAgICBefn5+fn5+fn5+fn5+fg0KWzYvNl0gR2VuZXJhdGluZyBkb2NzL3Rlc3RwbGFu
L2ludGVsLWNpLXRlc3RzIHdpdGggYSBjdXN0b20gY29tbWFuZA0KDQpUaGVuIGhhdmUgYWRkZWQg
Y2hhbmdlcy4NCj4gPiAgew0KPiA+ICAJY29uc3QgY2hhciAqbGFzdF90ZXN0ID0gIlVuaXQgVGVz
dGluZyI7DQo+ID4NCj4gPiBAQCAtNzc2LDQgKzc3Niw2IEBAIHZvaWQgaWd0X2ZhY3RzX3Rlc3Qo
dm9pZCkNCj4gPiAgCS8qIENsZWFuIHVwIHRoZSBsaXN0IGFuZCBjYWxsIGlndF9mYWN0cygpLiBU
aGlzIHNob3VsZCBub3QgY3Jhc2ggKi8NCj4gPiAgCWlndF9mYWN0c19saXN0X21hcmtfYW5kX3N3
ZWVwKCZpZ3RfZmFjdHNfbGlzdF9wY2lfZ3B1X2hlYWQpOw0KPiA+ICAJaWd0X2ZhY3RzKGxhc3Rf
dGVzdCk7DQo+ID4gKw0KPiA+ICsJaWd0X2V4aXQoKTsNCj4gPiAgfQ0KPiBXaHkgYWRkaW5nIGln
dF9leGl0KCkgaGVyZT8NCj4gDQo+IEhvdyBkaWQgeW91IHRlc3QgdGhpcyBwYXRjaD8NCj4gDQpJ
ZiB3ZSBkb27igJl0IGV4cGxpY2l0bHkgc3BlY2lmeSBpZ3RfZXhpdCgpIEkgd2lsbCBiZWxvdyB3
YXJuaW5nIA0KDQpuaW5qYTogRW50ZXJpbmcgZGlyZWN0b3J5IGBidWlsZCcNCls0My85OTldIENv
bXBpbGluZyBDIG9iamVjdCBsaWIvbGliaWd0LWlndF9mYWN0c19jLmEucC9pZ3RfZmFjdHMuYy5v
DQouLi9saWIvaWd0X2ZhY3RzLmM6IEluIGZ1bmN0aW9uIOKAmGlndF9mYWN0c190ZXN04oCZOg0K
Li4vbGliL2lndF9mYWN0cy5jOjc3OToxOiB3YXJuaW5nOiDigJhub3JldHVybuKAmSBmdW5jdGlv
biBkb2VzIHJldHVybg0KICA3NzkgfCB9DQogICAgICB8IF4NCkkgaGF2ZSBjb21waWxlZCBzaW5j
ZSB0aGVzZSBjaGVjayBwYXRjaCBlcnJvcnMNCg0KPiBUaGFua3MsDQo+IA0KPiBQZXRlcg0K
