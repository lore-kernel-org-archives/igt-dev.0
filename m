Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6570DE7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 07:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0947110EDBF;
	Thu,  5 Dec 2024 07:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YahEQpYz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0B210EDBF
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 07:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733383997; x=1764919997;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gnNLiyqshuT2McFhk5/zDGQSUIaeuZyff+CfIhtOXp8=;
 b=YahEQpYz1/sWDpgpY77eGJjGSFasdnsDzFxyMUPSlSaJcLrmpUCcQT7Z
 cLKXpwXcfQXoiNPmNbv6EsrvShOZOfqSUjgaxQRChumw77bS4IQMgJ8wD
 YGqemSqcSLmHfbGTg0oE9Dxv+IFzkXrTNs11tqKWpatoqu+W+94xUDpjv
 fmvBuxCApB/zIttDyox0JYwiP9nBl6ndyvgOb3uhywVKrwNKSpgpEscg7
 d7Dufp1AmlSWHPLCj5boYSmNiPDHRAgUbmVokfODkz2G0Gii60Yw7PANx
 wH1H9jcgPbQpUMOr6UOzoMpV3EQNGcfAoZiQROH9eW2Z4X/p60vrVMtO6 Q==;
X-CSE-ConnectionGUID: ZQorNSclQHWu6fNSr4O0cw==
X-CSE-MsgGUID: wAoNUpB3SXauYron4aWHjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33419765"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33419765"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 23:32:29 -0800
X-CSE-ConnectionGUID: JQ793jzeQvilg1lRFOPtoA==
X-CSE-MsgGUID: zTH2dWB3RhSOlW0iclQbRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="94477119"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2024 23:32:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 23:32:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 23:32:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 23:32:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKPn2erlS4CLacu/XVydUpXQwRD1HCHc0QlIpTyMkp5pUf1gZ2pveBk4h/0URxRdrwbw3AnatpOYNUF5dmZD3BvFe14VrABttoEAwSg+aseIiD8Gm26lsGKeZEpEa7+B2tX0TNWJEEqKcT12Ai5Lk7mGT5lvJmzEX3zIGKZuUl4zzzXMNt+sOBZKjIBBYK8IA7Otg8AXJ+2T6v67inkyvkN3/pdqPlK9jDZCwZkrXONpJ0Kp/9olWquyEK6Q808dmImqA9SnDOvk2Ywq1Gh2TfwRsbv/vUGiKkTMlOgmeMr/sidQlM0vTkHkWXDsnKnxztocfkbY1r8FhfQLX/Eptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnNLiyqshuT2McFhk5/zDGQSUIaeuZyff+CfIhtOXp8=;
 b=kpIlBufheKxfnwxHnjmbzzQXhknSRJhcBoLcGuisiODPQQJrtFrSPB+RaZWG4CW+r7C02562Jrwy+QKL31a2KaOzh5AqlUeyVCCzi/SXaC2Uq2Nuz/SRh8HpPcuX8qf3go0iCIF4zMIxo3qV8mtjKvKgnfWN6rk+hdIcR7VmHKU37p5NjKD+NlzXyPcMGXPX46S3gA9pmZ+dUGxW7YA1eH+fGjCUJkuqxYG0cP1S/rAypUBPhcw0TcS8tdSwOqxaaBn2hIEwtb9VLl5GAbI+mob0p1phNTm39hc/bTsUWvl0vzrekNLMHznucVD0vU8wOy5L9HbCOncaQJdvgpha2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by DS7PR11MB6293.namprd11.prod.outlook.com (2603:10b6:8:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 07:32:23 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 07:32:23 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel: Don't abort the test on the
 unavailability of sysnode
Thread-Topic: [PATCH i-g-t] tests/intel: Don't abort the test on the
 unavailability of sysnode
Thread-Index: AQHbRYzjFg2bbdvqkUehXtF+iyy9r7LWae2AgADY13A=
Date: Thu, 5 Dec 2024 07:32:23 +0000
Message-ID: <BL1PR11MB55251B5C28ED3A218265C5C384302@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20241203140626.514454-1-pravalika.gurram@intel.com>
 <20241204182955.w7skyymuuwjd4jkc@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241204182955.w7skyymuuwjd4jkc@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|DS7PR11MB6293:EE_
x-ms-office365-filtering-correlation-id: 458fa0a0-2e7c-450c-684e-08dd14fef5ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TUdaRjFmbDF4MkZsUVcrZzdNM3NpKzRFUjRXYzdFR2dwUUxBS0VOTW15RXNv?=
 =?utf-8?B?L0xMcC9nUFlIU0F2TlJIdFdxTkxZalAxY1JtbFJ6M0dGNC9wTXZCb3dTMjd4?=
 =?utf-8?B?a2VwOS94OHIvLzFYeDJROC9SeUZNVWVObloxMVN6VUNKN3N1QmJncEpRc1lT?=
 =?utf-8?B?R09Ia0dYekp1QzZiVkQzUVNmeXR1cXEzMVBGaTFhSi81aEJoejgveXgxSDJ3?=
 =?utf-8?B?RW5zdVZ3NVRZSjE5ZUIxcTV2VU9LSHNGenNMdFJkQUF2S0o3RHllT1UwK3BZ?=
 =?utf-8?B?TjVZTVFTdkxieHFEeFpjdDVrYnU2dm5XVEEzM0psOTNMcnhVcjdUdzJ3UzI0?=
 =?utf-8?B?cFJJYm1DWjdsUXIzeDBsTDZqdXNXZzVBTGc4emw2S043alBicVE0N1NQSWxJ?=
 =?utf-8?B?RU9sVW1wdkpQZ3hkcWZsQmg0ZnRCalZMa2c3dEx0RnhubndsTjJZQnpHK2dY?=
 =?utf-8?B?ZVhUYzh0WlhrNmpHU3h5ZHdQZUVPVUQyYzJwZmM4UVlLbEUvZ0NaT1RKakgr?=
 =?utf-8?B?QnE1amY3eis1dHE1Ukw4QWZZOXYxQ2xyR3ZCOGtFZHYvRjd3Q0JIMU5vQkdC?=
 =?utf-8?B?WGQyWnJmMlJCV0d1T2dvdVN0VGtDcmFPRFgxK09FMzUraFJzejJuWGlBdFNM?=
 =?utf-8?B?aEdiZHdyeGFQVmNzTUR5OVBYYTJlR2h3Unp4cmJXaTFIYTJKby8wbWNEL1Fh?=
 =?utf-8?B?d0t0ck9mSUg1cDNXTmphQW9Kd3FJVmJjeXJCTFhENzFVbzg5SmZDcHRkYllK?=
 =?utf-8?B?NjZjL2FHanhMeTg3TXM1VDNtVXlQYkxoc2txRUxlbmgwbzB6K3Q4QUo0alFI?=
 =?utf-8?B?WEYyeFRZUnVtSDZxMFl6SlFhaXJ5ZjRGQTNKZkJrSDJBM0ZaVlB6RGJoWWJi?=
 =?utf-8?B?SzMxMVY5WU83M1pOOWV4T1NSaTREOEVRZ0ZPNTdsKzRHYW1DRzNLRmFkSTVh?=
 =?utf-8?B?eldxS0p3QXBud2lDVXJGbE1LYThHZkxlUnM5N2RMQ21wTFkyb3p5RkxSTEN6?=
 =?utf-8?B?M0RwYnlEUUhNcnN0aVpHRWQvNGd1cEIra0NMN1pwYzFJVWhBOVAzTWxOK0Vq?=
 =?utf-8?B?aittcFM3SFcvUWFHS0NLai94a014TWlaSFEwK0lNc21OV0dIdnQrVjY2YkVH?=
 =?utf-8?B?am5RREhNYWlRUFVray9jTUdTNjRrTGdPTGUrejdSaEE0Tk9vMnY3NTR1c0Vj?=
 =?utf-8?B?b0E0VmtBenZDMEdjdjJNQ01BbmRNOVEvTVZXSFZjcDRpVUpkaDlUNmJ4NE9n?=
 =?utf-8?B?WTlJTGJkTUVjL0NRRWRiS1Q4a2cwdlJ1UEhJSVFWYmRTa3hlemZ0QXh5WW5B?=
 =?utf-8?B?Mk5iejRXeTIrVHpZck9udXVveDFRdnZ5bGRUTm41TEc5cmorNW1YOVNRM3VB?=
 =?utf-8?B?bm5rYXpuWjB0TGlqbXFwUkNTOFI5a1FHTlpIcm8rL1pYOUprcDN4TUxDRnVB?=
 =?utf-8?B?VWFTdmdENVdGRDJwRm8zaU1RcDV2WnZFU0wyeGZaR3VscERFNUtjeWZMSUpY?=
 =?utf-8?B?aXVQdGF5MElzZkhHR0RpQktIVGxSbUdQN1dvRFVLcnRQOTRlcXhNcFVXWEE5?=
 =?utf-8?B?UGZ0RFhVNUxLRnhBb0tySXM0YkI2WkNwMXNteStCMFk1NnJSSHgrUWJrNkxT?=
 =?utf-8?B?RXdiUzFaeGdXeWxGSWw2UmpwNzBlbHh1djhpZGJzTGRveExrNHNwTGwvVW5S?=
 =?utf-8?B?MWpoM0w1ZFY1WjZOOUJ1bDk0dEs4a2JCVzZYcVRFUDJtZUxiakJrYVBsL2hM?=
 =?utf-8?B?RDY2UTJ1UVpoTForZEhvcHBna1NuRXFVcHpBOWt6T3duMzJHYWYxOEQwSjVl?=
 =?utf-8?B?cmdMTUM5SUdDbzJ6SERIQm5VR2pDWGJlNGdibngyVHkxZXdlVm1xZ25qM1pI?=
 =?utf-8?B?YktpaHpUaFR0WlE3dm41NytRYmJ5elFLaWZwZjlSdjNIaVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2x0bTdDVlFmcEZTQUhRcW5lc0lZb0VMblgzUTg0K1drMEdqZWNnL1RHTEVL?=
 =?utf-8?B?OERrTHhFb0xMOWUvYVp1cktwTGdkY2FDKzM2VjFPWk0zOUF2TlFWNFpreFBk?=
 =?utf-8?B?WHZ2Q2t5N2h2MkNBdkErcXhHUEJzbHcxQmNJWitDNm8waEtaQ3laRllWd2NQ?=
 =?utf-8?B?bVY3ZitpR0ZIVEJSVkF3cVNtTzZEQi9mQXRjUFBCQjN3MFl2L2k5U3BPZWxm?=
 =?utf-8?B?NUtKYWUyby8wc1R2TU5pQlhmK1lvZHJ3Y1JTSkZMZWtDcHArYVVZMks4ZG5l?=
 =?utf-8?B?dTMxNmFINFZ4MTRUN3FOamx3V3MxOHNZVnRkOU1MTWRyRWJnQ2o2WGw4ZzhO?=
 =?utf-8?B?Zm9pTFhtMzR5c3prUGpFRzkrMnBRT1doTEpOOTFNSjRTNldZeHdlNGFKSUVu?=
 =?utf-8?B?Rm9zQ3ZoNE4xaUFQTlFabWJLd1RZTHhzS3JsZUhhemNRSHNRQ2lLaHRKcnRk?=
 =?utf-8?B?WlF1OFg1RitCQUZjSXRZUFV5Si9ZOE84U1JqenF2d3crV2t6RWFrbU16d3FB?=
 =?utf-8?B?N3dmSUd4R2pRQ0pWVGRDbEVTRk9RTVFVVDBwUVZtcDBtbWdFUzVRaStxd20v?=
 =?utf-8?B?Mmoxb2d3M3hpZ2l5NytvWmdyUXorbkxNODFCRnBZTjJneEgrS3JrYUcxeXho?=
 =?utf-8?B?dXgvRUVIaHdHbTZiRk9hZkNYVlNaMHhUR2dwdTBka0xKWDBjdEpJWGZmS01x?=
 =?utf-8?B?Qi8zVUJVT01XL0NXU0pPSktybW1RUURmWWtmQmU1bjRTUHJaRjFPNFFubEdt?=
 =?utf-8?B?aGRXVVR0dlZXUzZRbms4WktMS3l2enRoT3l4cVZGQm10Y0NDMGJPV2pGbWZC?=
 =?utf-8?B?RGxtdU16QzlEQjZKTlEreVJWR1hYMWFHTkZ5MFlyVndjQUtWTkMzWTAyOG5J?=
 =?utf-8?B?MmdnWUE5NW9YVUZETm0rWlVVWHFCWks1YlN2cVJCYVpNdEJ1Ym9hb0NQODRp?=
 =?utf-8?B?QkEvSVE0NzVlYkVZY0thZ1h1SU9wWnVKKzNxRytpY1VwZ21sL2NkZ25PRUlz?=
 =?utf-8?B?TVJBL2pMZjdFNThIWk9NdFc4UzVNaHRSVkdlQXIySmN5Nm5PRDhDZUF6UHVL?=
 =?utf-8?B?S3FPdFZpWmJQLzdxY0EwTndWQ3A4OWFCVkpLbGxPdWdCbmlPemtCYXl1Qnly?=
 =?utf-8?B?dmZsdm5iWkNGNWdxYVA3MTNuZE5nNlp2Wi9hNHlsZDhndVc3UG1pdll4Q09U?=
 =?utf-8?B?Z0lZUDNmSGRqa09nN1ViMGZEcTI4M0xQRG9BaFZBa2JBTVQ1a3p4UnBONitY?=
 =?utf-8?B?OFR4bXRzcjVhcVdSTVhxMS9jTmJTK1E5SkFJSjVUbXlpY1NENzVQRDRZUkM0?=
 =?utf-8?B?VmZ3VHp5bW5TSTd4aHgvUG5HSm5vaEFxa01xNExqL0RwRXozODZ2MXB2QWRl?=
 =?utf-8?B?Rm0rWjg3RTFJdk1EN3E1SGkxT2VORGdxVi9OVEZ6VTR0dzEyQ0djaTVJZG5j?=
 =?utf-8?B?VkVGdHZzVktEN1c2MFMzdzRJSkY4UWd6QWFKVkR2eTBGMjhSQkxYRkE4S0U3?=
 =?utf-8?B?Q3Mvc3JpY2FOQ2Rha0g0Zy9BNGl1TDN3TDFSSFNzT3JNbjZEdU8yeS9RMVNu?=
 =?utf-8?B?Mnh0clJnbmNnQVBSbEplL3J5UlJ3VGhZYTBkT3Q3YUlJZUpSU2U0UnhkWUg1?=
 =?utf-8?B?bzRzTHJQZGhsN2FUbURCZ1RTNXpBbnErSmo2eWZ1blptY1NWWWNnSlA4ZHl2?=
 =?utf-8?B?NFp6K21qVXoxUzdpS3N0OHVsaFhBcmpsclBaKzFwOUJMeXBwTk1CL1hTQ2Zi?=
 =?utf-8?B?ZUx4YjNiRVEvd2NhNlJuS3pCeDR5RGNhUERGNitYZkV2MUtkd3BHQ0pKSWdr?=
 =?utf-8?B?Y0plVVdJcTFVVmJUOUkxQmV0cklqb2I4b1VaWGNRSDYxcFJMNVZaMDh6VWNo?=
 =?utf-8?B?bjdpNkcwbGhpUS92bFpXcHNReStHTmRraW1ycnlrZk1XZklIdzF3R0k3eERj?=
 =?utf-8?B?WEtGTUpvcFVMS0dJRmZMTWVEaWFCSlloL2FXL0Y4WWs4NmUyRG41ckxBQ2hE?=
 =?utf-8?B?eXBoSnB5YkhJWUIzTmUyNFRtenZwcVBLS3VIMitXS2ZpakpmRzdPQlRNZE16?=
 =?utf-8?B?TWtnOEU4b0V3VlU0OWFVa2lLU0kvSVpLM2s2ZDRhRmtXenZCOHpDQXFJQVBP?=
 =?utf-8?Q?ZcxJCzUFdkx33ITDAagFWMQtt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 458fa0a0-2e7c-450c-684e-08dd14fef5ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 07:32:23.6420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N092IVeNnqXVwYHGnWOOj94dC+qM1c/GYJ3+rnIjYC2jvhrRhSefo3S+E6MGqrzI9pCZcXyslRPTPgmr5aqBtegvd9ocf9u3CAZ4Q1EI4Ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6293
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgRGVj
ZW1iZXIgNSwgMjAyNCAxMjowMCBBTQ0KPiBUbzogR3VycmFtLCBQcmF2YWxpa2EgPHByYXZhbGlr
YS5ndXJyYW1AaW50ZWwuY29tPg0KPiBDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdF0gdGVzdHMvaW50ZWw6IERvbid0IGFib3J0IHRo
ZSB0ZXN0IG9uIHRoZSB1bmF2YWlsYWJpbGl0eSBvZg0KPiBzeXNub2RlDQo+IA0KPiBIaSBQcmF2
YWxpa2EsDQo+IE9uIDIwMjQtMTItMDMgYXQgMTk6MzY6MjYgKzA1MzAsIFByYXZhbGlrYSBHdXJy
YW0gd3JvdGU6DQo+IA0KPiBJIGZvcmdvdCBhYm91dCBuaXRzLCBmaXJzdCBpcyBzdWJqZWN0LCBp
dCBpczoNCj4gDQo+IFtQQVRDSCBpLWctdF0gdGVzdHMvaW50ZWw6IERvbid0IGFib3J0IHRoZSB0
ZXN0IG9uIHRoZSB1bmF2YWlsYWJpbGl0eSBvZiBzeXNub2RlDQo+IA0KPiBpbWhvIGJldHRlcjoN
Cj4gDQo+IFtQQVRDSCBpLWctdF0gdGVzdHMvaW50ZWwvcGVyZl9wbXU6IENoZWNrIGF2YWlsYWJp
bGl0eSBvZiBzeXNub2RlDQo+IA0KPiA+IHVzZSBjYWxsb2MgdG8gYXNzaWduIE5VTEwgdmFsdWUg
aW4gZmFsc2UgY2FzZSwgYmVjYXVzZSBpbiByZXN0b3JlIGNhc2UNCj4gLSBeDQo+IFN0YXJ0IHdp
dGggY2FwaXRhbCBsZXR0ZXIsIHMvdXNlL1VzZS8NCj4gQWxzbyBpdCBpcyBub3QgTlVMTCBidXQg
emVybywgc28NCj4gDQo+IFVzZSBjYWxsb2MgdG8gaGF2ZSB6ZXJvcyBmb3Igc3lzbm9kZXMgbm90
IHByZXNlbnQuDQo+IA0KPiA+IGl0IHdpbGwgcmVzdG9yZSB0aGUgTlVMTCB2YWx1ZSBpbnN0ZWFk
IG9mIGdhcmJhZ2UuDQo+IA0KPiBIZXJlIEkgZG8gbm90IGdldCBpdCwgeW91IGRvIG5vdCB3YW50
IHRvIHdyaXRlIHplcm8gd2hlbiBhbiBlcnJvciBoYXBwbmVkIGFuZA0KPiB5b3UgZGlkIG5vdCBy
ZWFkIGl0LiBEbyB5b3UgaGF2ZSBhIGNhc2Ugd2hlbiBvbmx5IHNvbWUgbm9kZXMgYXJlIHByZXNl
bnQsIGFuZA0KPiBzb21lIG90aGVycyBub3Q/DQo+IA0KV2hlbiBzeXNub2RlIG5vdCBwcmVzZW50
IGl0IHdpbGwgaGF2ZSBhIGdhcmJhZ2UgY29ycmVjdCBzaW5jZSB3ZSB3ZXJlIHVzaW5nIG1hbGxv
YyBiZWZvcmUNCmFuZCBpbiB0aGUgcmVzdG9yZSBmdW5jdGlvbiwgd2UgYXJlIHJlc3RvcmluZyB3
aXRoIGHCoGdhcmJhZ2UgdG8gYXZvaWQgdGhhdCBhbSB1c2luZyBhY2xsb2MgaGVyZQ0KDQo+ID4g
dGVzdCBzaG91bGQgbm90IGJlIGFib3J0L3NraXAgb24gdGhlIHVuYXZhaWxhYmlsaXR5IG9mIHN5
c25vZGUNCj4gDQo+IEkgYWxzbyBkbyBub3QgZ2V0IGl0LCB5b3UgYmFzaWNhbGx5IGp1c3Qgc2tp
cCB3aGVuIHlvdSBjYW5ub3QgcmVhZCBhIG5vZGUsIG9yIGFtIEkNCj4gbWlzc2luZyBzb21ldGhp
bmc/DQo+IE9uIHdoYXQgcGxhdGZvcm0gZGlkIHlvdSB0ZXN0IHRoaXM/IFdoaWNoIHRlc3RzIGZh
aWxlZD8NCj4gQ291bGQgeW91IHBvaW50IHRvIGdpdGxhYiBpc3N1ZXMgeW91IGFyZSBmaXhpbmc/
DQoNCkluIGHCoGZldyBwbGF0Zm9ybXMgIkJMQiBFTEsgSUxLIFBOViIgdGhlIGZvbGxvd2luZyBu
b2RlICJycHNfbWluX2ZyZXFfbWh6IiBpcyBub3QgcHJlc2VudCB3aGljaCBpcyBtYWtpbmcgDQpp
Z3QgdG8gYWJvcnQuIFRlc3Qgc2hvdWxkIG5vdCBiZSBhYm9ydGVkDQoNClBsZWFzZSBoYXZlIGEg
bG9vayBvZiB0aGlzIEpJUkENCmh0dHBzOi8vamlyYS5kZXZ0b29scy5pbnRlbC5jb20vYnJvd3Nl
L1ZMSy02NTg2Nj9maWx0ZXI9LTENCg0KUmVnYXJkcywNClByYXZhaWthDQo+IA0KPiBSZWdhcmRz
LA0KPiBLYW1pbA0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFByYXZhbGlrYSBHdXJyYW0g
PHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICB0ZXN0cy9pbnRlbC9w
ZXJmX3BtdS5jIHwgMTggKysrKysrKysrLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvaW50ZWwvcGVyZl9wbXUuYyBiL3Rlc3RzL2ludGVsL3BlcmZfcG11LmMgaW5kZXgNCj4gPiBi
ZmEyZDUwMWEuLjg3ZGRmZTFhOSAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRlbC9wZXJmX3Bt
dS5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwvcGVyZl9wbXUuYw0KPiA+IEBAIC0xNzg2LDcgKzE3
ODYsNyBAQCB0ZXN0X2ZyZXF1ZW5jeV9pZGxlKGludCBnZW1fZmQsIHVuc2lnbmVkIGludCBndCkN
Cj4gPiAgCXN5c2ZzID0gaWd0X3N5c2ZzX2d0X29wZW4oZ2VtX2ZkLCBndCk7DQo+ID4gIAlpZ3Rf
cmVxdWlyZShzeXNmcyA+PSAwKTsNCj4gPg0KPiA+IC0JbWluX2ZyZXEgPSBpZ3Rfc3lzZnNfZ2V0
X3UzMihzeXNmcywgInJwc19SUG5fZnJlcV9taHoiKTsNCj4gPiArCV9faWd0X3N5c2ZzX2dldF91
MzIoc3lzZnMsICJycHNfUlBuX2ZyZXFfbWh6IiwgJm1pbl9mcmVxKTsNCj4gPiAgCWNsb3NlKHN5
c2ZzKTsNCj4gPg0KPiA+ICAJLyogV2hpbGUgcGFya2VkLCBvdXIgY29udmVudGlvbiBpcyB0byBy
ZXBvcnQgdGhlIEdQVSBhdCAwSHogKi8gQEANCj4gPiAtMjQwMywyMyArMjQwMywyMyBAQCBzdGF0
aWMgdm9pZCBzYXZlX3N5c2ZzX2ZyZXEoaW50IGk5MTUpDQo+ID4NCj4gPiAgCW51bV9ndHMgPSBp
Z3Rfc3lzZnNfZ2V0X251bV9ndChpOTE1KTsNCj4gPg0KPiA+IC0Jc3Rhc2hfbWluID0gKHVpbnQz
Ml90ICopbWFsbG9jKHNpemVvZih1aW50MzJfdCkgKiBudW1fZ3RzKTsNCj4gPiAtCXN0YXNoX21h
eCA9ICh1aW50MzJfdCAqKW1hbGxvYyhzaXplb2YodWludDMyX3QpICogbnVtX2d0cyk7DQo+ID4g
LQlzdGFzaF9ib29zdCA9ICh1aW50MzJfdCAqKW1hbGxvYyhzaXplb2YodWludDMyX3QpICogbnVt
X2d0cyk7DQo+ID4gKwlzdGFzaF9taW4gPSAodWludDMyX3QgKiljYWxsb2MobnVtX2d0cywgc2l6
ZW9mKHVpbnQzMl90KSAqIG51bV9ndHMpOw0KPiA+ICsJc3Rhc2hfbWF4ID0gKHVpbnQzMl90ICop
Y2FsbG9jKG51bV9ndHMsIHNpemVvZih1aW50MzJfdCkgKiBudW1fZ3RzKTsNCj4gPiArCXN0YXNo
X2Jvb3N0ID0gKHVpbnQzMl90ICopY2FsbG9jKG51bV9ndHMsIHNpemVvZih1aW50MzJfdCkgKg0K
PiA+ICtudW1fZ3RzKTsNCj4gPg0KPiA+ICAJLyogU2F2ZSBib29zdCwgbWluIGFuZCBtYXggYWNy
b3NzIEdUcyAqLw0KPiA+ICAJaTkxNV9mb3JfZWFjaF9ndChpOTE1LCB0bXAsIGd0KSB7DQo+ID4g
IAkJc3lzZnMgPSBpZ3Rfc3lzZnNfZ3Rfb3BlbihpOTE1LCBndCk7DQo+ID4gIAkJaWd0X3JlcXVp
cmUoc3lzZnMgPj0gMCk7DQo+ID4NCj4gPiAtCQlzdGFzaF9taW5bZ3RdID0gaWd0X3N5c2ZzX2dl
dF91MzIoc3lzZnMsICJycHNfbWluX2ZyZXFfbWh6Iik7DQo+ID4gLQkJc3Rhc2hfbWF4W2d0XSA9
IGlndF9zeXNmc19nZXRfdTMyKHN5c2ZzLCAicnBzX21heF9mcmVxX21oeiIpOw0KPiA+IC0JCXN0
YXNoX2Jvb3N0W2d0XSA9IGlndF9zeXNmc19nZXRfdTMyKHN5c2ZzLA0KPiAicnBzX2Jvb3N0X2Zy
ZXFfbWh6Iik7DQo+ID4gKwkJX19pZ3Rfc3lzZnNfZ2V0X3UzMihzeXNmcywgInJwc19taW5fZnJl
cV9taHoiLA0KPiAmc3Rhc2hfbWluW2d0XSk7DQo+ID4gKwkJX19pZ3Rfc3lzZnNfZ2V0X3UzMihz
eXNmcywgInJwc19tYXhfZnJlcV9taHoiLA0KPiAmc3Rhc2hfbWF4W2d0XSk7DQo+ID4gKwkJX19p
Z3Rfc3lzZnNfZ2V0X3UzMihzeXNmcywgInJwc19ib29zdF9mcmVxX21oeiIsDQo+ICZzdGFzaF9i
b29zdFtndF0pOw0KPiA+ICAJCWlndF9kZWJ1ZygiR1Q6ICVkLCBtaW46ICVkLCBtYXg6ICVkLCBi
b29zdDolZFxuIiwNCj4gPiAgCQkJICBndCwgc3Rhc2hfbWluW2d0XSwgc3Rhc2hfbWF4W2d0XSwg
c3Rhc2hfYm9vc3RbZ3RdKTsNCj4gPg0KPiA+IC0JCXJwbl9mcmVxID0gaWd0X3N5c2ZzX2dldF91
MzIoc3lzZnMsICJycHNfUlBuX2ZyZXFfbWh6Iik7DQo+ID4gLQkJcnAwX2ZyZXEgPSBpZ3Rfc3lz
ZnNfZ2V0X3UzMihzeXNmcywgInJwc19SUDBfZnJlcV9taHoiKTsNCj4gPiArCQlfX2lndF9zeXNm
c19nZXRfdTMyKHN5c2ZzLCAicnBzX1JQbl9mcmVxX21oeiIsICZycG5fZnJlcSk7DQo+ID4gKwkJ
X19pZ3Rfc3lzZnNfZ2V0X3UzMihzeXNmcywgInJwc19SUDBfZnJlcV9taHoiLCAmcnAwX2ZyZXEp
Ow0KPiA+DQo+ID4gIAkJLyogU2V0IHByZS1jb25kaXRpb25zLCBpbiBjYXNlIGZyZXF1ZW5jaWVz
IGFyZSBpbiBub24tZGVmYXVsdA0KPiBzdGF0ZSAqLw0KPiA+ICAJCWlndF9yZXF1aXJlKF9faWd0
X3N5c2ZzX3NldF91MzIoc3lzZnMsICJycHNfbWF4X2ZyZXFfbWh6IiwNCj4gPiBycDBfZnJlcSkp
Ow0KPiA+IC0tDQo+ID4gMi4zNC4xDQo+ID4NCg==
