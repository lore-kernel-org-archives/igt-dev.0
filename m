Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9ADC02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 03:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4492610E2C0;
	Fri, 17 Jan 2025 03:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ThjS9fVT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004EF10E23E;
 Fri, 17 Jan 2025 03:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737085404; x=1768621404;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g0FW91D5MerDa6nuB1zJ92fC8x5xDE9IJkT5A2uHfEk=;
 b=ThjS9fVTwL9aKdokfm815POSBbGI4cu/boRdj6bqPLcBQC7Z+GHH6D9i
 4yf7GUi5NopyFEK7LGu/i5LprcrymOsOPFbJnpahrBr2JQQq1Y48Q3h/X
 Y6XF25sRNSfWLgWFHU+r/2U8FJPATIiaKjWovhB68bEYJdf/M7HaElX2H
 3MmkhjUEeZ0krRzn3VuWu4+ASrtBNSEju+YjHTQqpfWXDZJozZtrVRc3F
 CGuwgN3PGpalQ+VHW0zs9XiHxawTDICXdZKqR6vbJXoQuFtyjwdkw8lZe
 +DivRqhm1wVT+2zbsT7RARMQo/ZCeHEclwanlyLVrkX+blYFL5GrakE3/ A==;
X-CSE-ConnectionGUID: BnVL4keBS56iDTQkyqzKpg==
X-CSE-MsgGUID: Eor81gCfRUWY8oHWN5IJ/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37385338"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="37385338"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 19:43:24 -0800
X-CSE-ConnectionGUID: TEKEPG0vRAGH4F3+xGgj8A==
X-CSE-MsgGUID: iAPQDwzyQZOcJO6lWBGseQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106568088"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 19:43:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 19:43:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 19:43:23 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 19:43:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iG1EdygifU/6ecjjv+R5EOnUtp6iTM/X1o8dL81erMUV8EWnCI3v+nv/tjvbci/uhXz3z7CKYcSlZ9R//PV/xkYEsqChBRZHF3y33TA7FdM7ghVrcUQ2Spqt+0FcB380sJHNckQEIOTIhTxl6JtrOsUKdGDggxPdpvVq/LgmVDJW0PKK86MXzF4hxIGJAL0/lZvYDq8vAb3FZkvv7CRBpfKCFbwYcKmz+WBdw56FQ6tI8iU3h9A5v9quUoUmNlE93i+hWd8pH2eAV3eUjrItrvb5QDLQZxA8ic2TA6gk2LJ/tVBrC0te6znQ4fz8CKDnR839jxnC54n7a4ClkyYLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0FW91D5MerDa6nuB1zJ92fC8x5xDE9IJkT5A2uHfEk=;
 b=NyhAr6JkiamdDsKZ3K1Ex0tkrMtRflujO6crLUxVCEmzDPn6ctphSOQbgKIwpyP7XKr+3L7qWfsTkqeGOhtwIQzEF12/F1WmpGEGlEYW3wJYKkBrDHKHUFx+fFQLEbRW54NEBoHeXqXIIgY/BTV43z4Mvqv1QAbIEiHp2aYn7SDtKYl8TybeynzhA8TYMDd4Ay2GOpdayi7LxGqw+3czz1GGgfoKR0F+5o20nb+MulZVLoTWj0FMqDucNyLBXiyjUTk1PRQSzBTHw2mtd8NyDvND0hKlzCeFfkciICSCnKk+ue1ir4MnlEQl396NCkfOQDPEDSVoep8oqmj2jYgcFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 03:43:15 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714%6]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 03:43:15 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgSW5pdGlhbCBQVEwg?=
 =?utf-8?Q?support_(rev6)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBJbml0aWFsIFBUTCBzdXBw?=
 =?utf-8?Q?ort_(rev6)?=
Thread-Index: AQHbYqKAr3Ech+4D/kSwvtOPdQybLbMX+4QAgAJiR0A=
Date: Fri, 17 Jan 2025 03:43:15 +0000
Message-ID: <PH8PR11MB67538A8CFDEF3CCB47D89FBAF21B2@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
 <173643279483.1645445.6728014542556156152@b555e5b46a47>
 <20250115151604.uddp3le3gtmfzoic@kamilkon-desk.igk.intel.com>
In-Reply-To: <20250115151604.uddp3le3gtmfzoic@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|DS7PR11MB7905:EE_
x-ms-office365-filtering-correlation-id: 18b59bb4-38b4-4ba1-b196-08dd36a91317
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?ZUNDY2pxZkg4dG9FMXo3NkhZRFhHOTd4OWJOSFVxa2JHSS8wYzdCcGRlY0Qz?=
 =?utf-8?B?MVY3RFBoYW1TOHdJTXBOdVk2aW5Iemp0UG0vWnczLzk3Q1VtRUpBYldKMVY2?=
 =?utf-8?B?dGNOVVZzSjY0REFHZFg3T2daRUdvdFFhMkttL3hyVWFPY3JKV0lDRDQ0U2F3?=
 =?utf-8?B?QSs4VENrdW5MVHpaSHd6dldFY0tNc1pOTm1kTFRTS1doNVRRaFZXZHN6TWpk?=
 =?utf-8?B?MzBmdVhFYnNwSlNOUlZWbGtycks4UXRHdkphMjlMaXltR2dEQVNmVWhENTV3?=
 =?utf-8?B?bUxIMTBlMWoyWmEzaTZqajdZbjRrTGNsMjN4UVlreURtNkg1L0Zsb2NoTC9B?=
 =?utf-8?B?T25xeDdkcHpUbERyc1lQUTh5VFFpRG9BQVlJVkF0NGF4S29kS1BWSGRGYWpn?=
 =?utf-8?B?a0cxOVFlcitmZVQ5R1NsNkxIamR2UEdWNzZUQ3hvS2FwM0NaaUNUdGRyc1c1?=
 =?utf-8?B?bU10d2R4bW9vV1VEWXIyUlM5Ym5YcVg0MS9LdTZVbFBxTlhwM0JBUkxUWXE2?=
 =?utf-8?B?emRuWG11RDVjSHg0cThSV3pESEdWUmpXdTNFUjd3UUdFY25qNUplOXZNWUkx?=
 =?utf-8?B?Y2k1d05lVU9MSWY0WVJKcDFNUmV5a25VckR2bENDRXhobmJpblZOL202ZjZt?=
 =?utf-8?B?US9mSVlxdExYTEFaVTlvQUpzY01hWEU1OWNOTzZaV3k1QVBodmxqMk1XSG8w?=
 =?utf-8?B?ZmdWMnovRXczQkFkSmdCNXhnWGR1bXREMm1td0dHV2l3K0lqY3NkaU8zcGtG?=
 =?utf-8?B?YnVzeHgrMTIvdnN4ZkQ3RTd0aktNVHB2SlROelg0b0haWDgreWladWRWZTFH?=
 =?utf-8?B?WExXcHVZYUdYd09LODI0d2pUM1ROSFhLVUQ3VlliZ0ZhdEszeHBQV25LenRM?=
 =?utf-8?B?T1lnY1NEOEI2NkNPS1RHYzZIZmFqZnBRQnZEY053b2syR2hOaTRJN3k0ME1r?=
 =?utf-8?B?aXZhbU1KMm83dzFKaXdDZzYrMlN5dG5ab1JmV1lZK1lwN1F1aklaVDc4MEQy?=
 =?utf-8?B?MlpjL0NnNVhwRkdobWtsdHhyTCtSVUxwTFNwd2djU0U2bWNMaUJaM2NWeG1h?=
 =?utf-8?B?cCtndjVtaHhSdjMrbFkxSmF5RXp1VXFTTkVmcTRjR1B6S013VVhzT1R4dkZM?=
 =?utf-8?B?M2szWisvRnJ2RDM0SC9EdWVrYy9BN3lHYTBRRUlFbVFKLzdvVDJrZGpjNUMx?=
 =?utf-8?B?elhJUzQ2SitaZG5nS0NnQjBYVmtIU3FqTlFsTjBSSlhzTy9xY2MwUXlaTm1R?=
 =?utf-8?B?MlRERTVUU2pKTlVISXFXZGpUNU55dCtIT0VSRFVLbzBLaFRkeE1ZZnVFclpw?=
 =?utf-8?B?OTdydlhaVXlmclRNZ0tCSmFxMENiYkZDWXJrL2pFcXEvdWpYMGVoQmF4aGd4?=
 =?utf-8?B?YTdFbG1vRWtLSndVamFsR2I1cXRaYUJTaVQyQUxmQVVNWUhRUitEMWtKb1k5?=
 =?utf-8?B?RVFJWG5kNGY0ckhWcEZlbW4rUW1vUDRkRVVPMXJJUWZmbUxlbUgzQ1hlLzQx?=
 =?utf-8?B?dEV2dExQalFNd2VZa0UwNnBBUmQ3bnZYNU5iYVJxUUpxVWJwYkJEYjZPNEUw?=
 =?utf-8?B?cW5mL3FVVHRtVDM3d0U4MzJXZkpKT3V4UjlUdW1FYlIyN0N1SHVqRUNpZmVr?=
 =?utf-8?B?YXVmWVhRa0NXemQxUkU1VnB5WkNTQWVJN2FYV3ZqK2paa0NweGZGN1J0dnhr?=
 =?utf-8?B?ZTIzNjlTQXk3V0N6VDQra0tNWlEzaGhrM1N6eHBhelBhYXVYTktBVDFkMDd1?=
 =?utf-8?B?ekhkN2dSTkx3QUhFUDdpQ2dFc3ZtKzlya0JFZ2hIeDAwNGF6dlFkVndJdjBo?=
 =?utf-8?B?RkUvUlNFbHZyUEhTUzZvd2xVOEh3OFp3MXpkQXJoWXJrSFB0SFJVemN3Z242?=
 =?utf-8?B?cys5SXc0aGRoVW9sVHM2Y0VSaVNHbUkrdGRwODZaZTAwVVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NC95TXhKcEJFUmF6U0NnTXVFUUkzNW5yNzFXZFZjU2g1RWhrWjFoNGdKVC9j?=
 =?utf-8?B?OE5NalhMZGdURG9oKy9kd3BqK3RaankvNjlwaXVoT3E5d3JNblpqNjEwT3pq?=
 =?utf-8?B?NU1iT3p6b0NGVUlHVnNldExnM2lyU0d3M0lLVnVJTjhlc095MUlWbXgwdVUx?=
 =?utf-8?B?ZHpYMEo5RzFQTjVDYUo3YW9yUDRLTGI2c3hMaGhhbERpTGdYYjV0blBQd1F1?=
 =?utf-8?B?cWNjOVhSS3k3a0dWRW9KaVRZQkFtcmwzc0Y0UUR1b1h2MDhPdm1XWXhsalMv?=
 =?utf-8?B?NmVISmw5Q2QwTVZFQWM2NmVHc01CSWxaWGNVRFY5aURGdGxXTTU0VWQwTE8y?=
 =?utf-8?B?UnVwVTZSbHNZTUtaMHM2V3VyVzY5SEtISnhLL1hFUHpuOWM2TG5WTW01OGVa?=
 =?utf-8?B?bHYzQzNKT0pEVVVVVUo5SmpGbHVxbE1kNVpsNWFndEFHOFA0ejhkeXJwS0ZF?=
 =?utf-8?B?QU15MGJLS2RMZURlbHJ2ZkdLSXFNZEJpNFM4VlArMlJOZXpTaHNURGMxTStF?=
 =?utf-8?B?UGNxWjh5c3o2bFhSbEJQcHkzRWx2d1ZMenJzSFRoQlpiclI1R1ByK0pGOGZh?=
 =?utf-8?B?aVVIWjRobWUzWVI0ZC9nMytFTTUrd1JNNGFQK0VBajc0Wkh2Q2JnM2srbnBR?=
 =?utf-8?B?T3JOYm1pU3NPUG92MG1KWkpiS3p3UFNuRFZyM2JBeTBxblhHZnhGOU9yNmYw?=
 =?utf-8?B?bDl5eUpodWtUQm44cU5WM2FhaklTell4VFR5dGpKL2dmSHE1WUFwNjRqbTFZ?=
 =?utf-8?B?Z2JkSFhwS3ZkbWxaOWV4c2hWVEVYLzN0aWNYdXZ1ZVA5aVBsbXZ5dDFSNG9L?=
 =?utf-8?B?TGtiVGtDUG9Ba29Bd0haVkRlVVdPY2dxNERmYTIxd3BRT0hOd2tzMXhQbVRr?=
 =?utf-8?B?bW4yZEpjK1FLYmR3UzZpZW93MWVqS0x4NnUveHdYQTNjUG1Rbjc0LzZJR1Jp?=
 =?utf-8?B?akpzQzhMc1NKNWNvcnQwNnFCb0ZyR25sb0pMWGIrSEFHZ2F3OXRlZG5JWC9q?=
 =?utf-8?B?ZG5nQ2xiN2ZUdDdxVXhlcDhPMkJlQ3dFSnpvYnJVZ010djJVM2ttTHc3N2to?=
 =?utf-8?B?Q2pwdGJ3ODZZZTBwQkNkNlpkVW5RUzhyazZwNjBLend6Qmg2UXFYVFovcDVI?=
 =?utf-8?B?R2VlZ3lEMTUyNUlsU01OSERQdmE1MGYxSW15YXNBSkxsb1QzU3ZoSFBqUjMr?=
 =?utf-8?B?eXczUFhlcTRrYUduY2dhdWE2TlFOWFNJNWdIS3NzZnZRTTlHVnBJWThzK3Js?=
 =?utf-8?B?elJUUlJVS0lKWW1YVjRJTllVK0VrTFpjL0tGcGtGcnFNUjlFOGh5WGJYRUl2?=
 =?utf-8?B?bENNRjBGUDYrcFJJU0VzMDkxODhQNFlIWDdtSm5uWWlTL29FNy93dDA0a0xM?=
 =?utf-8?B?MHRPVHBocFlPQ01qMk5KZjFmYWRwYnNISTF4eCtHazFUcTF0Uyt1MU5kOGJ3?=
 =?utf-8?B?NWo4a1JJdll3NmVuYjFkVkhHRUlTRldHeTBmcmtJMXZpeHc0UmJWOG1YcjU0?=
 =?utf-8?B?NzkwOEV3UjFDWlZ0YWtobGY4MmcvQlAvUFFKS1J1SWpDREV6N243dk93RTha?=
 =?utf-8?B?dEpnd2R5T2lhcm5vQmdNUGxMdHpMN3NUNnF1WEY1bC9ZZEU5cGhvNU9FM3Bm?=
 =?utf-8?B?djlRZkN6VWtlSXAwVExqRmk3dTZSTTNEekVwSzNWWi96Q3JJU3RiZDZhcTJn?=
 =?utf-8?B?ZG9UWE9Fditxak9sRFZWdWNwdWtjajYvSVZnL1pKK3ROR0N1RS9BTGRSUHNF?=
 =?utf-8?B?T2R6ZllYd05qZ1VyZVdMM0twWldPM21GeU0xVW9kNnJueFJoR0o1aDF4bVZQ?=
 =?utf-8?B?NlFhaEo2Ulg1R1FqR0VMTHdZQ1hCWExFbmFoWFhXc05RRW95aytsSTVPZ3hH?=
 =?utf-8?B?U0gya243V3VQNWRIS2Z4RlZOamVRV1ZMalA0L0pLSHJTTEdjUjhrcWpwM1Va?=
 =?utf-8?B?TE5QS1VWSU96TUZnTkJHTEgrQkQwcGFWRzFKNThNbzJNdDFCQW11d3FCNzIy?=
 =?utf-8?B?MTJ6QnliUG1aOWRyeDcrQ1dLejR2RmZmWEwzOWdISExWV1FGMTd1ZnhYQ25B?=
 =?utf-8?B?Mm0vSmhZcG9vL3duTXh3b1lPTDI2aXdJdlVVSzVVNjNhaTV4aGg4MFhwVHR4?=
 =?utf-8?B?SjZRNkFSdGNTbytqNloybzlobExhVnJpcFpmci9RVkN5T3BJM2h6akJndWpV?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b59bb4-38b4-4ba1-b196-08dd36a91317
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2025 03:43:15.3688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0aQ/68hVkd+TluCuNAZzttH5oJxQsHTRNxX4rKYK1vEPTX7w7EQQrAqqu5oS7KOqSjrvt79SU3WicaD/E20DHmfHo5PnzdA+UdmoDSvP+nQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQxMzI1LyAt
IFJlLXJlcG9ydGVkLg0KDQpYZS5DSS5GdWxsIC0gQWRkcmVzc2VkIGZhaWx1cmVzLCBYZSBjYW5u
b3QgYmUgcmUtcmVwb3J0ZWQuDQppOTE1LkNJLkJBVCAtIFJlLXJlcG9ydGVkLg0KDQoNClRoYW5r
cywNClRlamFzcmVlDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNp
LWluZnJhIDxpOTE1LWNpLWluZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBC
ZWhhbGYgT2YgS2FtaWwgS29uaWVjem55DQpTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgMTUsIDIw
MjUgODo0NiBQTQ0KVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogVGF5bG9y
LCBDbGludG9uIEEgPGNsaW50b24uYS50YXlsb3JAaW50ZWwuY29tPjsgSTkxNS1jaS1pbmZyYUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5CQVQ6IGZhaWx1
cmUgZm9yIEluaXRpYWwgUFRMIHN1cHBvcnQgKHJldjYpDQoNCkhpIGlndC1kZXYsDQpPbiAyMDI1
LTAxLTA5IGF0IDE0OjI2OjM0IC0wMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQoNCmJlbG93IHJlZ3Jl
c3Npb25zIGFyZSB1bnJlbGF0ZWQsIHBsZWFzZSByZS1yZXBvcnQgYW5kIHJlc3BpbiBpOTE1IHRl
c3RzLg0KDQpSZWdhcmRzLA0KS2FtaWwNCg0KPiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4g
U2VyaWVzOiBJbml0aWFsIFBUTCBzdXBwb3J0IChyZXY2KQ0KPiBVUkwgICA6IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQxMzI1Lw0KPiBTdGF0ZSA6IGZhaWx1cmUN
Cj4gDQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gSUdU
XzgxODMgLT4gSUdUUFdfMTI0MTggDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0KPiANCj4gICAq
KkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBJ
R1RQV18xMjQxOCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4N
Cj4gICANCj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5n
IHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIElHVFBXXzEyNDE4LCBw
bGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBt
b2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4
dGVybmFsIFVSTDogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAv
SUdUUFdfMTI0MTgvaW5kZXguaHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoMzggLT4g
MzcpDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBNaXNzaW5nICAg
ICgxKTogZmktc25iLTI1MjBtIA0KPiANCj4gUG9zc2libGUgbmV3IGlzc3Vlcw0KPiAtLS0tLS0t
LS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBt
YXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfMTI0MTg6DQo+IA0KPiAjIyMgSUdUIGNo
YW5nZXMgIyMjDQo+IA0KPiAjIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4gDQo+ICAg
KiBpZ3RAY29yZV9ob3R1bnBsdWdAdW5iaW5kLXJlYmluZDoNCj4gICAgIC0gZmktY2ZsLWd1Yzog
ICAgICAgICBbUEFTU11bMV0gLT4gW0FCT1JUXVsyXQ0KPiAgICBbMV06IGh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgxODMvZmktY2ZsLWd1Yy9pZ3RAY29yZV9o
b3R1bnBsdWdAdW5iaW5kLXJlYmluZC5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI0MTgvZmktY2ZsLWd1Yy9pZ3RAY28N
Cj4gcmVfaG90dW5wbHVnQHVuYmluZC1yZWJpbmQuaHRtbA0KPiANCj4gICAqIGlndEBpOTE1X3Nl
bGZ0ZXN0QGxpdmVAZ3RfaGVhcnRiZWF0Og0KPiAgICAgLSBiYXQtYXJsaC0yOiAgICAgICAgIFtQ
QVNTXVszXSAtPiBbSU5DT01QTEVURV1bNF0NCj4gICAgWzNdOiBodHRwczovL2ludGVsLWdmeC1j
aS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MTgzL2JhdC1hcmxoLTIvaWd0QGk5MTVfc2VsZnRl
c3RAbGl2ZUBndF9oZWFydGJlYXQuaHRtbA0KPiAgICBbNF06IA0KPiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNDE4L2JhdC1hcmxoLTIvaWd0QGk5DQo+
IDE1X3NlbGZ0ZXN0QGxpdmVAZ3RfaGVhcnRiZWF0Lmh0bWwNCj4gDQo+ICAgDQo+IEtub3duIGlz
c3Vlcw0KPiAtLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIGNoYW5nZXMgZm91bmQg
aW4gSUdUUFdfMTI0MTggdGhhdCBjb21lIGZyb20ga25vd24gaXNzdWVzOg0KPiANCj4gIyMjIElH
VCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBJc3N1ZXMgaGl0ICMjIyMNCj4gDQo+ICAgKiBpZ3RA
aTkxNV9zZWxmdGVzdEBsaXZlOg0KPiAgICAgLSBiYXQtYXJsaC0yOiAgICAgICAgIFtQQVNTXVs1
XSAtPiBbSU5DT01QTEVURV1bNl0gKFtpOTE1IzEzMDUwXSkNCj4gICAgWzVdOiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MTgzL2JhdC1hcmxoLTIvaWd0QGk5
MTVfc2VsZnRlc3RAbGl2ZS5odG1sDQo+ICAgIFs2XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI0MTgvYmF0LWFybGgtMi9pZ3RAaTkNCj4gMTVf
c2VsZnRlc3RAbGl2ZS5odG1sDQo+IA0KPiAgICogaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUB3b3Jr
YXJvdW5kczoNCj4gICAgIC0gYmF0LWFybHMtNTogICAgICAgICBbUEFTU11bN10gLT4gW0RNRVNH
LUZBSUxdWzhdIChbaTkxNSMxMzM5M10pICsxIG90aGVyIHRlc3QgZG1lc2ctZmFpbA0KPiAgICBb
N106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgxODMvYmF0
LWFybHMtNS9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91bmRzLmh0bWwNCj4gICAgWzhd
OiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjQx
OC9iYXQtYXJscy01L2lndEBpOQ0KPiAxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91bmRzLmh0bWwN
Cj4gDQo+ICAgKiBpZ3RAcnVubmVyQGFib3J0ZWQ6DQo+ICAgICAtIGZpLXBudi1kNTEwOiAgICAg
ICAgTk9UUlVOIC0+IFtGQUlMXVs5XSAoW2k5MTUjMTMzNTBdKQ0KPiAgICBbOV06IA0KPiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNDE4L2ZpLXBudi1k
NTEwL2lndEByDQo+IHVubmVyQGFib3J0ZWQuaHRtbA0KPiANCj4gICANCj4gIyMjIyBQb3NzaWJs
ZSBmaXhlcyAjIyMjDQo+IA0KPiAgICogaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJvdW5k
czoNCj4gICAgIC0ge2JhdC1tdGxwLTl9OiAgICAgICBbRE1FU0ctRkFJTF1bMTBdIChbaTkxNSMx
MzM5M10pIC0+IFtQQVNTXVsxMV0gKzEgb3RoZXIgdGVzdCBwYXNzDQo+ICAgIFsxMF06IGh0dHBz
Oi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgxODMvYmF0LW10bHAtOS9p
Z3RAaTkxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91bmRzLmh0bWwNCj4gICAgWzExXTogDQo+IGh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI0MTgvYmF0LW10
bHAtOS9pZ3RAaTkNCj4gMTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJvdW5kcy5odG1sDQo+IA0KPiAg
IA0KPiAgIHtuYW1lfTogVGhpcyBlbGVtZW50IGlzIHN1cHByZXNzZWQuIFRoaXMgbWVhbnMgaXQg
aXMgaWdub3JlZCB3aGVuIGNvbXB1dGluZw0KPiAgICAgICAgICAgdGhlIHN0YXR1cyBvZiB0aGUg
ZGlmZmVyZW5jZSAoU1VDQ0VTUywgV0FSTklORywgb3IgRkFJTFVSRSkuDQo+IA0KPiAgIFtpOTE1
IzEzMDUwXTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8t
L2lzc3Vlcy8xMzA1MA0KPiAgIFtpOTE1IzEzMzUwXTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMzM1MA0KPiAgIFtpOTE1IzEzMzkzXTog
DQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1
ZXMvMTMzOTMNCj4gDQo+IA0KPiBCdWlsZCBjaGFuZ2VzDQo+IC0tLS0tLS0tLS0tLS0NCj4gDQo+
ICAgKiBDSTogQ0ktMjAxOTA1MjkgLT4gTm9uZQ0KPiAgICogSUdUOiBJR1RfODE4MyAtPiBJR1RQ
V18xMjQxOA0KPiANCj4gICBDSS0yMDE5MDUyOTogMjAxOTA1MjkNCj4gICBDSV9EUk1fMTU5Mjk6
IDE0ZTBjNGE4MjQ3Yzk1MTRkYzU3YjIyMzE2MDJmYjZkOTQ1NTgwMmIgQCBnaXQ6Ly9hbm9uZ2l0
LmZyZWVkZXNrdG9wLm9yZy9nZngtY2kvbGludXgNCj4gICBJR1RQV18xMjQxODogMjMwNTJhY2Uz
YWMwNGZkMDIwM2I1NzM3MzYyNTViYTQ5MTljNjNkMyBAIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gICBJR1RfODE4MzogYjJkYmM2ZjIyODE1
MTI4YzBkZDVjNzM3NTA0ZjQyZTFmMWE2YWQ2MiBAIA0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMuZ2l0DQo+IA0KPiA9PSBMb2dzID09DQo+IA0KPiBG
b3IgbW9yZSBkZXRhaWxzIHNlZTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTI0MTgvaW5kZXguaHRtbA0K
