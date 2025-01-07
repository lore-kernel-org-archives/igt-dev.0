Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1428E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674CA10E32A;
	Tue,  7 Jan 2025 20:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HF51qqgS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE3B10E32A
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736282428; x=1767818428;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FD2rzeXpBdxlakFi3jfzJZQj3rVV+GY9pVsXdSu36zo=;
 b=HF51qqgSDyVQ0p9jqoj4QLJapdDplrkcqOtS89OZj8Em4VKW8avaqEHz
 RNZ9yRXtlB9ZBZIIdz0w0FBhF7vPb1NNhHwVegijdQ2gPg1g3s4iXxqiy
 A5cdrn+Jy4YNkU1sk/D6bzyDxA8Murs03u+i4hPKxrFmsfar6CZUez7Y5
 oYNGnnFbfFOAaMxXb9lGbHVkO8H2Y8Z++gHpy1UbH2UUF4Vwij5m4WU1W
 YmhKT1vOqiwLYQ8fRqMSlhcNwGZwjYhv/C7dEnsSVoIm+iqxmNfUTWTb0
 Fwfah4y0tDVNoEID4jyga8XKyzxJ3keSqigFZjqcxvbPeQwkVa12ll9tA Q==;
X-CSE-ConnectionGUID: Z2iYJ54cQea0aeqtVj2omA==
X-CSE-MsgGUID: 3U3EdDyfRXO3hqLgqxqezQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36648786"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36648786"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:40:27 -0800
X-CSE-ConnectionGUID: 4HRho4jDQYSTpFmvgcrWiA==
X-CSE-MsgGUID: pfC+WHqPT0i04JwmMJHzgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106893135"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 12:40:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 12:40:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 12:40:26 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 12:40:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxinS9yC9OeElRU/A0CscDkDiN1AmuK9jdCIrKShTC9jd64ESQ0Nm+YkO6qLNDk/GjcLqjlLGwvyaAgMWoP3+Kq5d1s/L4ssXupRdw+OTwTifonOGFc6CQF9+nbFaS/qS9QrQnxrRGEGK8iAjGj1CL44i/spV2rFsL6KQyhWFOZDIYm2+b6c3nkMkX+Kd9/QuqDGLap0JIyl/M+oetVq32UbVo0FJ8R0CqA5seAi5ilaNU6dOtaziG/Qd+pIwpXOtr2kTRh2PQwK75iIJiMXtRHy+GeFiwscnW/8kjs2iuPxuKGX7Njz+kf3FS7IgZAjZjnkSwNbvJ/ePLPGqr9GZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FD2rzeXpBdxlakFi3jfzJZQj3rVV+GY9pVsXdSu36zo=;
 b=k+JDeB6Rl9egEGylij3C+NYGpzcYbRhBbLVLIT6Y5ZXzqcAcBpnC9AOf+FVF75YqF1gBkULA467urRcy8W3hLBBvIR7Ha46WsULkUlaYYlWeO5awUYUbL/FUzIP+oeUJgfEf8dWubiNGjkf1TkrzBxxry+3XSAJC68LybUEFo8dSy8Z7m8+IGLAEaGYOWgkAgrz14k5q8H6QfocvDN7UDCX/ZtzSWVd/Xk9Y9Nj4RlzdNTeL9lR7Nux6CQ2YsmX0SElMhCcUdup8Cl0t5TufK1bX5ecnw/2Hdn5ZDjgg09FKPNsHSsfuzX2/Qwur+/PhGTfhpYMfWiCll53iHlXbfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BL1PR11MB5320.namprd11.prod.outlook.com (2603:10b6:208:316::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 20:39:43 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 20:39:43 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v2 7/8] tests/intel/xe_drm_fdinfo: Stop asserting on
 usage percentage
Thread-Topic: [PATCH i-g-t v2 7/8] tests/intel/xe_drm_fdinfo: Stop asserting
 on usage percentage
Thread-Index: AQHbYUKtkr+7rgCo40avaey4pDYwYLMLxeZQ
Date: Tue, 7 Jan 2025 20:39:43 +0000
Message-ID: <CH0PR11MB544402AE8396F722609DB794E5112@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250107202615.1306306-1-lucas.demarchi@intel.com>
 <20250107202615.1306306-7-lucas.demarchi@intel.com>
In-Reply-To: <20250107202615.1306306-7-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BL1PR11MB5320:EE_
x-ms-office365-filtering-correlation-id: aa58acee-fa7e-471d-d047-08dd2f5b6a93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Z3YzbHpYUFpmY3QrbjM2dEtoQnpZeVRYYjdVL0JIcll1TWU1V05aTmFUaE9W?=
 =?utf-8?B?U0dwNXUyM2ZjZlUyZHZiWjlFWjI4SFJGV0dIdW9ydkpWa2NOMzBEOXFzZTZT?=
 =?utf-8?B?cVVKRGI3MXRYNzhXbmQxU1NlU2lFV3VWM1o4UXRtYkIyekZDQ2tFejBWWDZB?=
 =?utf-8?B?Sm1TVlBPcXhUbDN6VzNGTCt5b1lJWmFGV3czWm1iZGlIb3lneDh0bWZrMkht?=
 =?utf-8?B?ZVpBSi9kV3JtdjRPOFEwSFFRTkt3eFNiUmdvTjYzT2NLdTBDTjlWOUp0ODJO?=
 =?utf-8?B?OUNZLzJKTTZLU1VEYU5TT1FOa2xkUUxPUHp5eUdLZ05yLzZnMUZvU3I1RXk5?=
 =?utf-8?B?aktVU2oyalZXTUhUdEJMVklUNGtrUlBEN1JYWU9MQnFDQXhhNHRQTC9hSHZJ?=
 =?utf-8?B?bGFJcmRWZnExMVZPU2xoYjIwNXRyc1BhK04zdEFSbDlQMWhDTW1FYzRJRjVF?=
 =?utf-8?B?ay9JM1hxNFRGZlhjNnE0TjhMaGp3dy8rK0lXUVhIUTdJdTNIa3U0RlQ3cGdP?=
 =?utf-8?B?dVpWdTFhQkVnSERRelplcklzVVFVeElOeHl0ZzlUeWx3MHZQeW9pUFZQQTNo?=
 =?utf-8?B?bXdzbXdGZWNQMkZzczFQZVUwYWF3Zmc3OVdCcWVyVXZNazFqUzhxTlp1NWhV?=
 =?utf-8?B?SDJZTnlXM1grTjJCYk9oWVJiSlNSVVA3TXNHSGMxZGl4ZHQ4dXkwTmd2bVl5?=
 =?utf-8?B?c3Vta1JubFRxSWFEa2E1dWZOT0RpcUpoWVRJaFhUYTc0dkk2bnhKYVNxSkhO?=
 =?utf-8?B?MERKTGVDc05IR3JjSllRUnpuQk9XR2RsSUJpMUZ1aVZvRHM4VmR0WXVJZ0Rh?=
 =?utf-8?B?TTlCQjcyVW9takZkT2dJa3E1QzhjREo3R0pGU1E1MkZuQ1liZ2RjbDhCY3Qy?=
 =?utf-8?B?dVFiM2I4a1U5V3N4NzU5K3lFemR6MHlUeFg4TmdRUjRRSEt1Zm1UbU5Sc3hT?=
 =?utf-8?B?ZGNqVnErY3ZjRmtyVFdjc0N6eDRyWWVOekcwYTVRMVByRXFKQ3hHYzRlRE5V?=
 =?utf-8?B?ZkpOZU4vY0JvTG1HV2MzZmpTNmtPM0llS0V4M0U1b1lEWEdVUWZKQjAzcVIw?=
 =?utf-8?B?T1owYXQvNnROZHJCeGpPN3NEcjVXQjNIYjE0amZtMDRyZUNILzlqTHY0OEN2?=
 =?utf-8?B?TGJLWTBIQkFoU2Z3c05OWUVUUEtyZlpubCt6V2VBY3lsaHU5MVRXaCtqY3Vm?=
 =?utf-8?B?aUF4aHNYWlNlOVBTSWFFeTJaUWNEMlVtbFErcXdNaGFScUdsdTZtN005VTky?=
 =?utf-8?B?UXU5UTFOTUcxc0lGa3hxNEYwRjVJbUxoZEtHOXhqMm1RczY4RXZuWGtqUmxz?=
 =?utf-8?B?K2pBYVhOMUt6WVVOR2lyMnZpWWpCaURpWVp3QlNjM2RUbE9EZ2d5T3RXWTcx?=
 =?utf-8?B?dTdsZkVkbjkrUFdjTW5HT3REWndBaFBrSWdmQ25Bc2Z4ZDVZaDdMajdpYnJk?=
 =?utf-8?B?LzUzWVhEWU1tTXQvMW1KWEdJcWVkL0d1WVZYb3NCMXMycUVPcWxrci9KNlpO?=
 =?utf-8?B?am9EcTNZZC91SXVJVDhvZ3daaHVwcFNkTUpnek4vRzJ3bEwzc2s4VVNnRGIz?=
 =?utf-8?B?Qm0zVTFIb0VMNWtTcm83M2hTdURHUk5zU2JwamNpK3hYRUsxWncrQ0FyajZX?=
 =?utf-8?B?V2w5dkw0SHBDMUhtMmY1dksrRzB5QVBvNlFGQjNsOThoQVBteVhMTjRFTDVo?=
 =?utf-8?B?UGovWjFmOTRROFRnSUtSMmFENzA0RlMxQ3QxMmlsVDNqTlJVL0YzODdtODM4?=
 =?utf-8?B?WGcxcnF2Z0RoOXFScDlNS3lGL0JFY3ppS0xmaEMxc3Q1VVhFYXgvb3pxR0ZD?=
 =?utf-8?B?VWNHU1JSelNCSlA1bHlIVkl2TzM1K1VUL2crTFVuMUJaWExWMGlIOU1Fbk5q?=
 =?utf-8?B?ZTVHdk1hekNTRVFzUXFyYkhmL09EcDlRa1o5U3AxRnNwYllTUE5CNVV3RFox?=
 =?utf-8?Q?h0PklF7yEbxWc+MRREFjN/4jYsELHxhj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmZWSDV4M20yRnQxQndPbWh5QU1VZ3hIR2dwV0dlMklsR3B5RXpkNk5BOHJB?=
 =?utf-8?B?Mm9YNi83VTNWZzBKNTFLOWhxOUw3ZDBTQzc2L2RiUG13bUdjRmt0TmhsRE4y?=
 =?utf-8?B?WHFMTmpNMlFPZnpqdm9uUFR4Y3JUOFAybVJNUW12Syt3NHB2UDd5eERhNWNF?=
 =?utf-8?B?K01TTXZBRmhiVnkyL2lCeGZacm1QU0lxYThkZUhodEdCaWNrZDgwdEp3QkVy?=
 =?utf-8?B?dXFqS2NOOHFkUmlySVEwWkUzejJ4alFDUGNkZXFyTk1lQ2tNaGFlbit0L0RB?=
 =?utf-8?B?U0Ivc3NsMm5BQjlhdGdMQ25GWmxJRDJCQ0llQURZK25MMlZxZ0Y3STZzVTFz?=
 =?utf-8?B?MXZxN3NtQ1hhU0drWngrTW5hTXdrMGM4Z0tYaklMbDdHUmI1L3dnUDd3dkFS?=
 =?utf-8?B?aFhFdDZRdWhlOGxZOTl5aVcyR3dzV0lMUEpuR0dqU29aaXYwbnBqUmtJV3Uv?=
 =?utf-8?B?OWFoRzkzRVcxQlJ3c0dmeDI4cVYwSDJLYkRKbVFyVHhEbm1PNWpQZzZHTC9E?=
 =?utf-8?B?RGljR1FCR3lmNlhQdFA5cnBNS0VaTmYzRHVhRXBkUFJiZi9WR01vdjJLZE5R?=
 =?utf-8?B?U2E3SlFVRjRwamdvZTNmY0VoT1dKTHlTWnBkeC9SRFk1ZThpdXlaT3lWM0Ra?=
 =?utf-8?B?ZnptSFFOYk5PcWFrSzl2MklyUk11cU5FTFpVTkh6TDZlRzhqMFF3WDFmNjF4?=
 =?utf-8?B?OUZRWXM1b1BNc1BSZnpQcHo3RTZ3V0JSZlMxeEJBV3NPYVBURFM5YzJzQ0tG?=
 =?utf-8?B?b2dzS2w4MmNjYmpPOVVidEVPMEdmN2tyOC9FV3VWUjhBeDBtN0tDbjBoazBo?=
 =?utf-8?B?ZXh5dkhJQzZQc3JOKy9JVUZYQWtqUWtQQWU1OE5pTE1mNmwwQVZMY1E5cklZ?=
 =?utf-8?B?WENwMzZqZ3ZWL2R1c3A5bEFzOGovMCtLZG5QdEdBSjYwYjZTaHJZc0tFdVNq?=
 =?utf-8?B?d214OXJoNWlTNEs3MnJVL1NvOWFiM2gxdXVTcndvTFdnSzRuRVp4UGZ5a3ht?=
 =?utf-8?B?OEZYSUVNWHdsY2t0a3F1a0crRmZheWozVDMzVmpIUDMyaFk4K0R1YXdRYkZV?=
 =?utf-8?B?a1J5NE5yaHBiaS9XMmJuSUZpMjNqKyswbTRibFhIcDlHRnVNS0k3bUdmMFJG?=
 =?utf-8?B?QWJVbHJOODg5VkxFYnVyWWR6YjYwTjV3aDVJVDBORUVGNkZQMitzWHRpYktZ?=
 =?utf-8?B?UzJiVUl5eXlDV0hpU0ZQZnlGUjZibE1PNitrM2RYb3ZGN1Y4bzliYlZYMDEx?=
 =?utf-8?B?emxxZFRtem9hWVVHWUhYU3JMeFdwWE5rRjVsV3lmb3U3WDdkakU3U2FDUTIz?=
 =?utf-8?B?ZThqRnNKL3lXYlQwU0pZOWZVV1F5UWtQbGQrbXprYjFkdWszdUFQbnlrdGlN?=
 =?utf-8?B?S3NmdEk0TTdpTkdLN1Z2WmF4WGQrYUdrVE03OWNMMjhVZSthT2M3MGlmY3Jl?=
 =?utf-8?B?QXVEcXUybXNaQy9PWWkwNFJpSXJPM1pBNFB4UCtvU2ZKNnlmK2NCdklQWGtT?=
 =?utf-8?B?b0M5L0ltZmo5UERSeVJIVEs4S0w4U3RoRUlqMGdNVmxYV1JPQlBWN1F3NTM4?=
 =?utf-8?B?T1lxZk0wSW53akI3dmMvdXRzeFlUNHdmdXBCQ3NXLzVBL0tuWTNKOG4zWlJx?=
 =?utf-8?B?YmxSdkpiUFRCaGhMSTV3NzRWUE1kUXFSSmZvakJ5UU5McW1kbVVMTWczYVRm?=
 =?utf-8?B?R2gyVS9PZDlmdTNmb0xiZC9JMTNoTnNIaVJrWWZ0dmF5YUV3Z0sweHRYVlc5?=
 =?utf-8?B?b0JxZEx2bXlsdzFJdDVPNmI1ejQwVDk0WG9RRWQ2c2hWVVlBS3ZIOXpmc3NE?=
 =?utf-8?B?TVRRSHNqbkkxVWJGZ3d0SGpLVEMxOHZ3aG1scGhyZFJXTWZBakhJL1Rab1hP?=
 =?utf-8?B?ek96Q2pBbEhGYzh2UlM4bEpJRnVvZklacmh1a2xGU1Nxc2JiYmRoMTBNSjc4?=
 =?utf-8?B?UHhRbG9hbUVhTGFIVmhkZ2VlMmVGMW5qcmRlK3Q1UGxDT2h1VEtma0lRZDZV?=
 =?utf-8?B?eVVkT1FJMi91ZTA0a3Raa3h1bjhBbHhGSVlMb2xkbFc3K0NPc0xYQnJ0ME5D?=
 =?utf-8?B?MnpqZWlEMUNnbUhEd3liQ0VuN3lEN0FkVnRveWdnZnJxWGgvalJMNU4yckl3?=
 =?utf-8?Q?x7iaWqTBhggHX+8SD6b3XoZcq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa58acee-fa7e-471d-d047-08dd2f5b6a93
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 20:39:43.2916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /XbQ16bhAX0csAaWDieoXQtt3b5IgKyAmeFQh1UGJ+hpUaNPyAomKk/a0DIZgdMUCxC5JF8pSuZmnm7lRj/APvBY7le+6V/IO1kC2UCEByo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5320
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2Fz
LmRlbWFyY2hpQGludGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDcsIDIwMjUgMTI6
MjYgUE0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IENhdml0dCwgSm9u
YXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBEZSBNYXJjaGksIEx1Y2FzIDxsdWNh
cy5kZW1hcmNoaUBpbnRlbC5jb20+OyBOZXJsaWdlIFJhbWFwcGEsIFVtZXNoIDx1bWVzaC5uZXJs
aWdlLnJhbWFwcGFAaW50ZWwuY29tPg0KU3ViamVjdDogW1BBVENIIGktZy10IHYyIDcvOF0gdGVz
dHMvaW50ZWwveGVfZHJtX2ZkaW5mbzogU3RvcCBhc3NlcnRpbmcgb24gdXNhZ2UgcGVyY2VudGFn
ZQ0KPiANCj4gSXQncyB1bnJlbGlhYmxlIHRvIGFzc2VydCBvbiB0aGUgdXNhZ2UgcGVyY2VudGFn
ZSBjb25zaWRlcmluZyAyIGRhdGENCj4gcG9pbnRzIGFzIGl0IHN0aWxsIGRlcGVuZHMgb24gdGhl
IENQVSBzY2hlZHVsaW5nIG5vdCBwcmVlbXB0aW5nIHRhc2tzIGluDQo+IHRoZSB3cm9uZyBtb21l
bnQuIE9uIGEgbm9ybWFsIHVzZSBjYXNlIG9mIGEgdG9wLWxpa2UgYXBwbGljYXRpb24sIHRoZQ0K
PiB2YWx1ZSBub3QgYWNjb3VudGVkIGZvciB3b3VsZCBzaW1wbHkgc2hvdyB1cCBpbiB0aGUgbmV4
dCBzYW1wbGUgd2l0aG91dA0KPiBtdWNoIGlzc3VlLiBGb3IgYSB0ZXN0IGFzc2VydGlvbiwgaXQn
cyBiZXR0ZXIgdG8gY2hlY2sgdGhhdCB0aGUgdmFsdWUNCj4gcmVwb3J0ZWQgdmlhIGZkaW5mbyBp
cyByZWFzb25hYmx5IGNsb3NlIHRvIHRoZSBvbmUgc2F2ZWQgYnkgdGhlIEdQVSBpbg0KPiB0aGUg
c3Bpbi4gSXQncyBzdGlsbCBhbGxvd2VkIHNvbWUgZXJyb3IgYmVjYXVzZSB0aGVyZSBhcmUgYSBm
ZXcgR1BVDQo+IHRpY2tzIG9mIGRpZmZlcmVuY2UgZHVlIHRvIHRoZSAqKkdQVSoqIHNjaGVkdWxp
bmcgdGhlIGNvbnRleHRzLg0KPiANCj4gdjI6DQo+ICAgLSBGaXggcGFyYWxsZWwgdGVzdHMgZHVl
IHRvIG5vdCBjaGVja2luZyB3aWR0aCBhbmQgb3RoZXIgbWlub3Igbml0cw0KPiAgICAgKEpvbmF0
aGFuIENhdml0dCkNCj4gICAtIEZpeCBuZWdhdGl2ZSBkZWx0YSBjb21wdXRhdGlvbg0KPiANCj4g
Q2M6IFVtZXNoIE5lcmxpZ2UgUmFtYXBwYSA8dW1lc2gubmVybGlnZS5yYW1hcHBhQGludGVsLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRl
bC5jb20+DQoNCkxHVE0uDQpSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5j
YXZpdHRAaW50ZWwuY29tPg0KLUpvbmF0aGFuIENhdml0dA0KDQo+IC0tLQ0KPiAgdGVzdHMvaW50
ZWwveGVfZHJtX2ZkaW5mby5jIHwgNTMgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2RybV9mZGluZm8uYyBiL3Rlc3Rz
L2ludGVsL3hlX2RybV9mZGluZm8uYw0KPiBpbmRleCAzOTUxOWZhNTIuLmY5ZWNhMjVlZCAxMDA2
NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZHJtX2ZkaW5mby5jDQo+ICsrKyBiL3Rlc3RzL2lu
dGVsL3hlX2RybV9mZGluZm8uYw0KPiBAQCAtMyw2ICszLDggQEANCj4gICAqIENvcHlyaWdodCDC
qSAyMDIzIEludGVsIENvcnBvcmF0aW9uDQo+ICAgKi8NCj4gIA0KPiArI2luY2x1ZGUgPG1hdGgu
aD4NCj4gKw0KPiAgI2luY2x1ZGUgImlndC5oIg0KPiAgI2luY2x1ZGUgImlndF9jb3JlLmgiDQo+
ICAjaW5jbHVkZSAiaWd0X2RldmljZS5oIg0KPiBAQCAtMzcwLDM2ICszNzIsNDMgQEAgc3RhdGlj
IHZvaWQgYmFzaWNfZW5naW5lX3V0aWxpemF0aW9uKGludCB4ZSkNCj4gIA0KPiAgc3RhdGljIHZv
aWQNCj4gIGNoZWNrX3Jlc3VsdHMoc3RydWN0IHBjZXVfY3ljbGVzICpzMSwgc3RydWN0IHBjZXVf
Y3ljbGVzICpzMiwNCj4gLQkgICAgICBpbnQgY2xhc3MsIGludCB3aWR0aCwgZW51bSBleHBlY3Rl
ZF9sb2FkIGV4cGVjdGVkX2xvYWQpDQo+ICsJICAgICAgaW50IGNsYXNzLCBpbnQgd2lkdGgsIHVp
bnQzMl90IHNwaW5fc3RhbXAsDQo+ICsJICAgICAgZW51bSBleHBlY3RlZF9sb2FkIGV4cGVjdGVk
X2xvYWQpDQo+ICB7DQo+ICAJZG91YmxlIHBlcmNlbnQ7DQo+IC0JdTY0IGRlbiwgbnVtOw0KPiAr
CXVpbnQ2NF90IGRlbiwgbnVtOw0KPiAgDQo+ICAJaWd0X2RlYnVnKCIlczogc2FtcGxlIDE6IGN5
Y2xlcyAlIlBSSXU2NCIsIHRvdGFsX2N5Y2xlcyAlIlBSSXU2NCJcbiIsDQo+ICAJCSAgZW5naW5l
X21hcFtjbGFzc10sIHMxW2NsYXNzXS5jeWNsZXMsIHMxW2NsYXNzXS50b3RhbF9jeWNsZXMpOw0K
PiAgCWlndF9kZWJ1ZygiJXM6IHNhbXBsZSAyOiBjeWNsZXMgJSJQUkl1NjQiLCB0b3RhbF9jeWNs
ZXMgJSJQUkl1NjQiXG4iLA0KPiAgCQkgIGVuZ2luZV9tYXBbY2xhc3NdLCBzMltjbGFzc10uY3lj
bGVzLCBzMltjbGFzc10udG90YWxfY3ljbGVzKTsNCj4gKwlpZ3RfZGVidWcoInNwaW5fc3RhbXA6
ICV1IHdpZHRoOiAlZFxuIiwgc3Bpbl9zdGFtcCwgd2lkdGgpOw0KPiAgDQo+ICAJbnVtID0gczJb
Y2xhc3NdLmN5Y2xlcyAtIHMxW2NsYXNzXS5jeWNsZXM7DQo+ICAJZGVuID0gczJbY2xhc3NdLnRv
dGFsX2N5Y2xlcyAtIHMxW2NsYXNzXS50b3RhbF9jeWNsZXM7DQo+ICsNCj4gIAlwZXJjZW50ID0g
KG51bSAqIDEwMC4wKSAvIChkZW4gKyAxKTsNCj4gIA0KPiAtCS8qIGZvciBwYXJhbGxlbCBzdWJt
aXNzaW9uIHNjYWxlIHRoZSBidXN5bmVzcyB3aXRoIHdpZHRoICovDQo+ICsJLyogRm9yIHBhcmFs
bGVsIHN1Ym1pc3Npb24gc2NhbGUgdGhlIGJ1c3luZXNzIHdpdGggd2lkdGggKi8NCj4gIAlwZXJj
ZW50IC89IHdpZHRoOw0KPiAgDQo+IC0JaWd0X2RlYnVnKCIlczogcGVyY2VudDogJWZcbiIsIGVu
Z2luZV9tYXBbY2xhc3NdLCBwZXJjZW50KTsNCj4gKwlpZ3RfZGVidWcoIiVzOiBwZXJjZW50OiAl
LjJmJSVcbiIsIGVuZ2luZV9tYXBbY2xhc3NdLCBwZXJjZW50KTsNCj4gIA0KPiAgCXN3aXRjaCAo
ZXhwZWN0ZWRfbG9hZCkgew0KPiAgCWNhc2UgRVhQRUNURURfTE9BRF9JRExFOg0KPiAgCQlpZ3Rf
YXNzZXJ0X2VxKG51bSwgMCk7DQo+ICAJCWJyZWFrOw0KPiAgCWNhc2UgRVhQRUNURURfTE9BRF9G
VUxMOg0KPiArCQkvKiBGb3IgcGFyYWxsZWwgc3VibWlzc2lvbiBzY2FsZSB0aGUgYnVzeW5lc3Mg
d2l0aCB3aWR0aCAqLw0KPiArCQlzcGluX3N0YW1wICo9IHdpZHRoOw0KPiArDQo+ICAJCS8qDQo+
IC0JCSAqIFdlIGFyZSBzdGlsbCByZWx5aW5nIG9uIENQVSBzbGVlcCB0aW1lIGFuZCB0aGVyZSBj
b3VsZCBiZQ0KPiAtCQkgKiBzb21lIGltcHJlY2lzaW9uIHdoZW4gY2FsY3VsYXRpbmcgdGhlIGxv
YWQuIFVzZSBhIDUlIG1hcmdpbi4NCj4gKwkJICogUGVyY2VudGFnZSBlcnJvciBiZXR3ZWVuIHZh
bHVlIHNhdmVkIGJ5IGdwdSBpbiB4ZV9zcGluIGFuZCB3aGF0DQo+ICsJCSAqIGlzIHJlcG9ydGVk
IHZpYSBmZGluZm8NCj4gIAkJICovDQo+IC0JCWlndF9hc3NlcnRfbHRfZG91YmxlKDk1LjAsIHBl
cmNlbnQpOw0KPiAtCQlpZ3RfYXNzZXJ0X2x0X2RvdWJsZShwZXJjZW50LCAxMDUuMCk7DQo+ICsJ
CXBlcmNlbnQgPSBmYWJzKChpbnQ2NF90KShudW0gLSBzcGluX3N0YW1wKSAqIDEwMC4wKSAvIChz
cGluX3N0YW1wICsgMSk7DQo+ICsJCWlndF9kZWJ1ZygiJXM6IGVycm9yOiAlLjJmJSVcbiIsIGVu
Z2luZV9tYXBbY2xhc3NdLCBwZXJjZW50KTsNCj4gKwkJaWd0X2Fzc2VydF9sdF9kb3VibGUocGVy
Y2VudCwgNS4wKTsNCj4gIAkJYnJlYWs7DQo+ICAJfQ0KPiAgfQ0KPiBAQCAtNDM3LDE0ICs0NDYs
MTcgQEAgdXRpbGl6YXRpb25fc2luZ2xlKGludCBmZCwgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xh
c3NfaW5zdGFuY2UgKmh3ZSwgdW5zaWduZWQgaW4NCj4gIA0KPiAgCWV4cGVjdGVkX2xvYWQgPSBm
bGFncyAmIFRFU1RfQlVTWSA/DQo+ICAJICAgICAgIEVYUEVDVEVEX0xPQURfRlVMTCA6IEVYUEVD
VEVEX0xPQURfSURMRTsNCj4gLQljaGVja19yZXN1bHRzKHBjZXUxWzBdLCBwY2V1MlswXSwgaHdl
LT5lbmdpbmVfY2xhc3MsIDEsIGV4cGVjdGVkX2xvYWQpOw0KPiArDQo+ICsJY2hlY2tfcmVzdWx0
cyhwY2V1MVswXSwgcGNldTJbMF0sIGh3ZS0+ZW5naW5lX2NsYXNzLCAxLA0KPiArCQkgICAgICBj
b3JrID8gY29yay0+c3Bpbi0+dGltZXN0YW1wIDogMCwgZXhwZWN0ZWRfbG9hZCk7DQo+ICANCj4g
IAlpZiAoZmxhZ3MgJiBURVNUX0lTT0xBVElPTikgew0KPiAgCQkvKg0KPiAgCQkgKiBMb2FkIGZy
b20gb25lIGNsaWVudCBzaG91bGRuJ3Qgc3BpbGwgb24gYW5vdGhlciwNCj4gIAkJICogc28gY2hl
Y2sgZm9yIGlkbGUNCj4gIAkJICovDQo+IC0JCWNoZWNrX3Jlc3VsdHMocGNldTFbMV0sIHBjZXUy
WzFdLCBod2UtPmVuZ2luZV9jbGFzcywgMSwgRVhQRUNURURfTE9BRF9JRExFKTsNCj4gKwkJY2hl
Y2tfcmVzdWx0cyhwY2V1MVsxXSwgcGNldTJbMV0sIGh3ZS0+ZW5naW5lX2NsYXNzLCAxLCAwLA0K
PiArCQkJICAgICAgRVhQRUNURURfTE9BRF9JRExFKTsNCj4gIAkJY2xvc2UobmV3X2ZkKTsNCj4g
IAl9DQo+ICANCj4gQEAgLTQ2MCw2ICs0NzIsNyBAQCB1dGlsaXphdGlvbl9zaW5nbGVfZGVzdHJv
eV9xdWV1ZShpbnQgZmQsIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpodw0K
PiAgCXN0cnVjdCBwY2V1X2N5Y2xlcyBwY2V1MVtEUk1fWEVfRU5HSU5FX0NMQVNTX0NPTVBVVEUg
KyAxXTsNCj4gIAlzdHJ1Y3QgcGNldV9jeWNsZXMgcGNldTJbRFJNX1hFX0VOR0lORV9DTEFTU19D
T01QVVRFICsgMV07DQo+ICAJc3RydWN0IHhlX2NvcmsgKmNvcms7DQo+ICsJdWludDMyX3QgdGlt
ZXN0YW1wOw0KPiAgCXVpbnQzMl90IHZtOw0KPiAgDQo+ICAJdm0gPSB4ZV92bV9jcmVhdGUoZmQs
IDAsIDApOw0KPiBAQCAtNDcxLDEzICs0ODQsMTUgQEAgdXRpbGl6YXRpb25fc2luZ2xlX2Rlc3Ry
b3lfcXVldWUoaW50IGZkLCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqaHcN
Cj4gIA0KPiAgCS8qIGRlc3Ryb3kgcXVldWUgYmVmb3JlIHNhbXBsaW5nIGFnYWluICovDQo+ICAJ
eGVfY29ya19zeW5jX2VuZChmZCwgY29yayk7DQo+ICsJdGltZXN0YW1wID0gY29yay0+c3Bpbi0+
dGltZXN0YW1wOw0KPiAgCXhlX2NvcmtfZGVzdHJveShmZCwgY29yayk7DQo+ICANCj4gIAlyZWFk
X2VuZ2luZV9jeWNsZXMoZmQsIHBjZXUyKTsNCj4gIA0KPiAgCXhlX3ZtX2Rlc3Ryb3koZmQsIHZt
KTsNCj4gIA0KPiAtCWNoZWNrX3Jlc3VsdHMocGNldTEsIHBjZXUyLCBod2UtPmVuZ2luZV9jbGFz
cywgMSwgRVhQRUNURURfTE9BRF9GVUxMKTsNCj4gKwljaGVja19yZXN1bHRzKHBjZXUxLCBwY2V1
MiwgaHdlLT5lbmdpbmVfY2xhc3MsIDEsIHRpbWVzdGFtcCwNCj4gKwkJICAgICAgRVhQRUNURURf
TE9BRF9GVUxMKTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZvaWQNCj4gQEAgLTUwMiw3ICs1MTcs
OCBAQCB1dGlsaXphdGlvbl9vdGhlcnNfaWRsZShpbnQgZmQsIHN0cnVjdCBkcm1feGVfZW5naW5l
X2NsYXNzX2luc3RhbmNlICpod2UpDQo+ICAJCWVudW0gZXhwZWN0ZWRfbG9hZCBleHBlY3RlZF9s
b2FkID0gaHdlLT5lbmdpbmVfY2xhc3MgIT0gY2xhc3MgPw0KPiAgCQkJRVhQRUNURURfTE9BRF9J
RExFIDogRVhQRUNURURfTE9BRF9GVUxMOw0KPiAgDQo+IC0JCWNoZWNrX3Jlc3VsdHMocGNldTEs
IHBjZXUyLCBjbGFzcywgMSwgZXhwZWN0ZWRfbG9hZCk7DQo+ICsJCWNoZWNrX3Jlc3VsdHMocGNl
dTEsIHBjZXUyLCBjbGFzcywgMSwgY29yay0+c3Bpbi0+dGltZXN0YW1wLA0KPiArCQkJICAgICAg
ZXhwZWN0ZWRfbG9hZCk7DQo+ICAJfQ0KPiAgDQo+ICAJeGVfY29ya19kZXN0cm95KGZkLCBjb3Jr
KTsNCj4gQEAgLTU0Nyw3ICs1NjMsOCBAQCB1dGlsaXphdGlvbl9vdGhlcnNfZnVsbF9sb2FkKGlu
dCBmZCwgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZSkNCj4gIAkJaWYg
KCFjb3JrW2NsYXNzXSkNCj4gIAkJCWNvbnRpbnVlOw0KPiAgDQo+IC0JCWNoZWNrX3Jlc3VsdHMo
cGNldTEsIHBjZXUyLCBjbGFzcywgMSwgZXhwZWN0ZWRfbG9hZCk7DQo+ICsJCWNoZWNrX3Jlc3Vs
dHMocGNldTEsIHBjZXUyLCBjbGFzcywgMSwgY29ya1tjbGFzc10tPnNwaW4tPnRpbWVzdGFtcCwN
Cj4gKwkJCSAgICAgIGV4cGVjdGVkX2xvYWQpOw0KPiAgCQl4ZV9jb3JrX2Rlc3Ryb3koZmQsIGNv
cmtbY2xhc3NdKTsNCj4gIAl9DQo+ICANCj4gQEAgLTU4OCw3ICs2MDUsOSBAQCB1dGlsaXphdGlv
bl9hbGxfZnVsbF9sb2FkKGludCBmZCkNCj4gIAkJaWYgKCFjb3JrW2NsYXNzXSkNCj4gIAkJCWNv
bnRpbnVlOw0KPiAgDQo+IC0JCWNoZWNrX3Jlc3VsdHMocGNldTEsIHBjZXUyLCBjbGFzcywgMSwg
RVhQRUNURURfTE9BRF9GVUxMKTsNCj4gKwkJY2hlY2tfcmVzdWx0cyhwY2V1MSwgcGNldTIsIGNs
YXNzLCAxLA0KPiArCQkJICAgICAgY29ya1tjbGFzc10tPnNwaW4tPnRpbWVzdGFtcCwNCj4gKwkJ
CSAgICAgIEVYUEVDVEVEX0xPQURfRlVMTCk7DQo+ICAJCXhlX2NvcmtfZGVzdHJveShmZCwgY29y
a1tjbGFzc10pOw0KPiAgCX0NCj4gIA0KPiBAQCAtNjYwLDE0ICs2NzksMTYgQEAgdXRpbGl6YXRp
b25fbXVsdGkoaW50IGZkLCBpbnQgZ3QsIGludCBjbGFzcywgdW5zaWduZWQgaW50IGZsYWdzKQ0K
PiAgDQo+ICAJZXhwZWN0ZWRfbG9hZCA9IGZsYWdzICYgVEVTVF9CVVNZID8NCj4gIAkgICAgICAg
RVhQRUNURURfTE9BRF9GVUxMIDogRVhQRUNURURfTE9BRF9JRExFOw0KPiAtCWNoZWNrX3Jlc3Vs
dHMocGNldVswXSwgcGNldVsxXSwgY2xhc3MsIHdpZHRoLCBleHBlY3RlZF9sb2FkKTsNCj4gKw0K
PiArCWNoZWNrX3Jlc3VsdHMocGNldVswXSwgcGNldVsxXSwgY2xhc3MsIHdpZHRoLA0KPiArCQkg
ICAgICBjb3JrID8gY29yay0+c3Bpbi0+dGltZXN0YW1wIDogMCwgZXhwZWN0ZWRfbG9hZCk7DQo+
ICANCj4gIAlpZiAoZmxhZ3MgJiBURVNUX0lTT0xBVElPTikgew0KPiAgCQkvKg0KPiAgCQkgKiBM
b2FkIGZyb20gb25lIGNsaWVudCBzaG91bGRuJ3Qgc3BpbGwgb24gYW5vdGhlciwNCj4gIAkJICog
c28gY2hlY2sgZm9yIGlkbGUNCj4gIAkJICovDQo+IC0JCWNoZWNrX3Jlc3VsdHMocGNldV9zcGls
bFswXSwgcGNldV9zcGlsbFsxXSwgY2xhc3MsIHdpZHRoLA0KPiArCQljaGVja19yZXN1bHRzKHBj
ZXVfc3BpbGxbMF0sIHBjZXVfc3BpbGxbMV0sIGNsYXNzLCB3aWR0aCwgMCwNCj4gIAkJCSAgICAg
IEVYUEVDVEVEX0xPQURfSURMRSk7DQo+ICAJCWNsb3NlKGZkX3NwaWxsKTsNCj4gIAl9DQo+IC0t
IA0KPiAyLjQ3LjANCj4gDQo+IA0K
