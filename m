Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342ECC3271E
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 18:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD6910E1AD;
	Fri,  5 Jul 2024 18:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gh2BkOEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E7210E1AD
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jul 2024 18:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720203884; x=1751739884;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O+vjJS77775XYVz4RmXhUphYOfY7mkE4nnD5rImVhc4=;
 b=gh2BkOEFmEGNVxXH6k27jUCB8LY3EuTQDAhcfg33QXeYyBy7vZmr1i4g
 EVV7H4+TCnkm8Rab2tDyLG0KwKrRJtXQ36R88bpebsTCwyJOlNkjemiaS
 NtQsXK/uLfllBu+dfajGNwtoLeP6IcWKigJXTcTOeDpiHoBnNC2rpOaob
 y3Cz7GpQb+kLMI+Q/yhcfQAAkM801e03uLpuPt58Sm4ehQwynzHZNCFdJ
 HM2IPwLxk43n5x1BAWLvw18SqCeK/N+hUiwl2XqHEmzIu8bF+cZ4zX3aZ
 eh2BbwJcVRdtYwg3zkNkYBsUGwhW/kTTFA4ikrlviIQDwbYP60c37uVNz Q==;
X-CSE-ConnectionGUID: N0PxuhecSTKvqg2eqf3HqA==
X-CSE-MsgGUID: te+1vIhcTO+AhhZWkt2WTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17453778"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="17453778"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 11:24:43 -0700
X-CSE-ConnectionGUID: 3Hf8vlNJTQCqiOMWQDP3vQ==
X-CSE-MsgGUID: zAoXwqlmTgiKcTvUuz4hnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="46901691"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jul 2024 11:24:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 5 Jul 2024 11:24:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 5 Jul 2024 11:24:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 5 Jul 2024 11:24:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 5 Jul 2024 11:24:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eyri5NQHU0xbIqnLOYlJ82qZmrVQs+jDi3T4u72VwEcFoRiO+bLIWjWIZCUMlZua7L/EnPa9509yuJKjI9dv2X3xaxwjE/7ySpLIGb5FCSvejRBFgOLnKfcr9/+REMdBZtswirubmiucb237Tugj5WnroHQXTkNL1FTHiACYrinCCweywcTV1n4mcCV3NR9cNH/bBHR9h1+QwEcdaWSRX4k61tYHt+Xj86tUS6M2cKLlKj9OiJAYQwL/D/UASpMwwXeo8kjozQx+pQfvLRnbmC9Ba3ISHHmQfddKoWu5/Vt/V3mXKca9Xcqhy6i6TIrlbE69hBIDGBsuIr+btheGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+vjJS77775XYVz4RmXhUphYOfY7mkE4nnD5rImVhc4=;
 b=Uu5nYful2uQmXp5RZ7uL4wL5/pi7GPgtGVBoFNv8CQ8EVasjpseAxUetwq903PL0xqjsfy33vX9tykx1/usosdBiXk4ix2Fv6LyohNKRke1/4AxkdeZcC5raYFM5ukmpwzypsAuBKK8Rl/mwMVKjNEs3kQ8eIkww1m+rmkmWcNLLalcbrEEV+iF0wgfFo6iZLyE2zEtGCXxK5BlHoOzMWS2x93mreSWp/M+wfm6KjTT5MP2IyPmW6iYrwq3tWOZAQ+hXk2MmrBGw3i+0w1bsxEXJkQJyViCDiUKKdWsBS1OLeoQkHj/T/GohYgs3lC6u4yZ2E6hYxeBquTUtfhYHtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Fri, 5 Jul
 2024 18:24:39 +0000
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d]) by SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d%4]) with mapi id 15.20.7741.017; Fri, 5 Jul 2024
 18:24:39 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Miszczak, Adam" <adam.miszczak@intel.com>, "Bernatowicz, Marcin"
 <marcin.bernatowicz@intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t] tests/intel-ci/fast-feedback: Add SR-IOV tests
Thread-Topic: [PATCH i-g-t] tests/intel-ci/fast-feedback: Add SR-IOV tests
Thread-Index: AQHazTYr5i5sPKqE0UuXQWO0QOtQ6LHmoD+AgAHUoTA=
Date: Fri, 5 Jul 2024 18:24:39 +0000
Message-ID: <SJ0PR11MB6696E2C77703CE5EFED14F2AACDF2@SJ0PR11MB6696.namprd11.prod.outlook.com>
References: <20240703111221.616274-1-jakub1.kolakowski@intel.com>
 <047f72ab-e531-4d0d-8c6c-31d11c3b7ba6@intel.com>
In-Reply-To: <047f72ab-e531-4d0d-8c6c-31d11c3b7ba6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6696:EE_|BN9PR11MB5324:EE_
x-ms-office365-filtering-correlation-id: 5128b9e7-7531-4e66-c9f2-08dc9d1fbb89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?a1V3SFUwTC9OWXJ2cUd4dDdXVUoyaStYdU9DY3Z4R2NPK0Y0aUhjQk56NGNU?=
 =?utf-8?B?ZnphTG9SSDRCODlmSlUzZ011SnpTa1M3MTBEclBXcWpZblFCMnkwRERwVk5E?=
 =?utf-8?B?aHROemRibEJrTDBVdzVzZ243MDZwQ05zblhMdmQrOUZscEYwNzNlRFJFMzZo?=
 =?utf-8?B?bVg4dlUvSlpDazNsMW1CaC9vOHZUL3B2TXhsVm1MdzdYNm1wNHl3VUdQSkNu?=
 =?utf-8?B?MlZYL2lzdjNuTHRXTFk0aWhhZ3R6VWVKTkY1VndLcHBQc3ZlTTNLTnpWVHRh?=
 =?utf-8?B?WURFNi9FajhML0NKUHZMYzhLZ2NnZjhZVkwrWFovS3Q4cmVVT0xoNFYzT2cz?=
 =?utf-8?B?cStuY0MxaGZQV2NCbGllbWxHZkhhM2tLZXllelVudHgzOUduSW1NTFI2WUNp?=
 =?utf-8?B?bWM4alRLZDU1L0VSekdqejF2VGpleHFvUGhZNEVBWmlXWWwxRndvbFo0NzlB?=
 =?utf-8?B?ZmRKTVlNckFrQlBZcU51UlpjQUpySGZRcFF4SHdRUkR2Y3ZrbzJGRCtqemU2?=
 =?utf-8?B?KzhKQllRcUNJeFAzUmtqc1FJem5zNHRvOUFVNnNtUmg3WmpQc1BYNjNDc0Vj?=
 =?utf-8?B?Wk5nb3llbUhuU1VYN1lqdmtjUitQTm5xOWVWR1VXQTM5TVpTQTNjdmtBRWQw?=
 =?utf-8?B?N3hYNzJLdkhtUW8rU2pVcG8wRmI4bEk3RjRSN2VhbmxOK2s1RVZrRmxEMjh4?=
 =?utf-8?B?a0hXUWJTVmYrZEdhZ2cyeklsb2dNSFJhcUd1ZFplVGxVa1Z1bXh6eGNDNXZx?=
 =?utf-8?B?cGpaVGo5ZHcyRE14enpxL1BXQStITHltOHN0WFE0bTZxV2pHaGplZ2JxZlJ6?=
 =?utf-8?B?cDE1emR1Si93V1VjQW4yanFkbVQ3MHBTeXBOVGdYOWora2t2U3h1dGJTYSt3?=
 =?utf-8?B?cXNoUHpYRE1aOVg2YjBKV3Zockc3ek5iVm9NKzhuZlJoWjZLVzkyTGJIQnB5?=
 =?utf-8?B?bVFhSGM2WWdRRlZ1a1ZsUlRsUTdQRWx0bHJvOUFnSkFwRzJCb1VzYlJ1TE1X?=
 =?utf-8?B?dU4ydUY5NHJTQTQrZjNoK09sVXErYUp0ejFwd2hmVmRKM3JvcXpWRVZnQk01?=
 =?utf-8?B?TlNxQ0oybHRPbGxYWTZsSEJ0cTQ1V0ZhWTJ4R1Vad3RscHFQQlArNkVxS3Rp?=
 =?utf-8?B?eGVselJVckQ5dVFRZ2ZmSlF2S3Fic01SZGFLZkFQZlZNZE9Kb2kxQnRhZ04v?=
 =?utf-8?B?ZmVYZFhyNllhY3dPMGNNZlNpTFY4MXpQL2Zxb3VqdmlKVmM1ZFVhQzBld1Rm?=
 =?utf-8?B?UURBVjVoQTlqZTQ2N1pPTGwvNWRuV01MQ29sWU8zYzVLNU51Y0F4SzdLb3pH?=
 =?utf-8?B?VmJCUFAxSGo1alpiczloSkFoZlZuTVg5ZUxvRm95ZHZSWkJGUDk1K1pGUkYv?=
 =?utf-8?B?bkVhRWtHRFFubjBMMjVEN3hpSGhuMW1mZXlTK1VGZnhLTjUvZWhXU2hHbnk3?=
 =?utf-8?B?aG1NTGZid3M3TkRRUFFjdXh4Wkk4VmpBUi9nSFJWQVI2bkVlN0V2ZW9Qb3B6?=
 =?utf-8?B?c0xhMzhNUHNPOW9DS1JES0UvK0JGYy9kZGlMa2VhZEJNSEhWN2orQzY5L1Ni?=
 =?utf-8?B?M3RibXNrbjJEbU8xSzN1RVZicWUyR2JEU09YQ0dKS3JZVU1RY25lT2pHQnVR?=
 =?utf-8?B?VnJMc0JrRXg5eTVKY0gzSUQ3Nytub3d3bTZiZWp0Zy92K3E2RVZMVEJwWFgz?=
 =?utf-8?B?M0duUnBlZURoUklFZlhYY1BFQ0w1dW1KYktkdlluSWhTRkc2MFNnaVRwNUpr?=
 =?utf-8?B?VzhLRWNLMHovTmE2WTRoMXorQ2lKQmNhNHZrWGY1NzBjNHJIR2Z4SXlnU1Fo?=
 =?utf-8?Q?JmGPEdlemYpiJy12aGK4A+NoseuXjV/oRXACM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6696.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFNPN29CME1hYVpUbjR5d3pvYm5ucmtpUTRFUTMvM3dIajFkd2lrRWVzRUJj?=
 =?utf-8?B?Vk82NmsrUGwyMFFrTk5UemlIT0ZUeE1Cb0hEKzJta2o0dmtUUHhLWjhiekV1?=
 =?utf-8?B?elZuMmZnVVNXSDlXenVvMnhDZEgxeEhsUmVXaEtlOUxOakNXbStRdHVmaDJ2?=
 =?utf-8?B?T3IrSHp4VmY0bnNEazhFRjZXUDQ0Z244TGk4Z3dZWkpZNEczR1I5bm9TanBm?=
 =?utf-8?B?T2wzZldweHZPWTR0Qzdrd0tTMHppTTdlWlA2RG4yTVZvckFpRDNpL2p2Zkd2?=
 =?utf-8?B?cDhNV01TcDRiSHIwYW9RRDY3NitRL0F4VDh1WjlGeWwwbGp1TFRzTnU4Mi9D?=
 =?utf-8?B?QWlUeWRGaTl0V3Y0QVRSNTE1U3c4M0lsWllIcDRHdFQzOUhDN1lpVi9acU1Q?=
 =?utf-8?B?VTIyMFVUWkt4WHplOFUxV0JwMHBuTkxLTzErM3A5dkpVNWpOMmZBZWxGR3Zp?=
 =?utf-8?B?Q09NWDB6eWpxNUx0RDRuZHhydi9DOGhNNXRzTnRySjNkMXNHZ1JEZWpQUUdP?=
 =?utf-8?B?bmVoYWJZT1hFOCtkYkVNWS9sQVlJYjl5aVloK1NUdHBqTjlZRDI0THVDS2po?=
 =?utf-8?B?VnhERGxsNXRxb215UWwzL3BSUmREQTNSa0tzdDNrUnpnRGZrTStUKzdTbFZI?=
 =?utf-8?B?UWg3ckNVY3FZUHUyRGZTMkRlRktrVXRPOUhXdThwdW9ZWUs4OVQrOGJZZ3o4?=
 =?utf-8?B?TFc3QnQvbWJUWXZMTEQzR25Vdk5wOXdWa0xWYkJuMnNLMEpuRnNvSXlTZGpJ?=
 =?utf-8?B?MUpKZEY1NlMzN1VFbk5oNHEzZG1odkRyL2NRTDlCSzl6TmdWN2tIQ0dhcGZk?=
 =?utf-8?B?ZXVvYWFvQzd4bm9ad0FkeU1JNWJxMlhTMk5FOWE4MjBXTWVFQWtmdlJGWXBE?=
 =?utf-8?B?RzE4OGZraHdHNVJObnhWWHEwc1YzdFN6Z29xUi85QkdMTkdvMGZNVVpyQXFp?=
 =?utf-8?B?ekxMZ3hwSFc0NXlRMG92K2svU1dtYmtYTDJhMmZqTmVCeEdhOHFUZ2t6NEoy?=
 =?utf-8?B?YmRJQSttUnpvUmdTZy81WWRrQ1VTQmVyME9pWmdrQkIyUzlGdXhZampETUJo?=
 =?utf-8?B?ZGluSmF3b0NOVXAwVjF2c0lHdFVtbGhaY081cWEyNVVxK2tJQmFYdlVjMGZw?=
 =?utf-8?B?ZU5wK3J2cHlLNjBPckRVY2c5T1I2Q1hHSUVmeGlPZGtsQjJEK3ZZamRJeEtO?=
 =?utf-8?B?S0Ixd2xzaFNqaCt5eGFhSlpyOWZRUnIrQ0ZaOHFLa0Y2QU5EaXRQZ1FKc2VH?=
 =?utf-8?B?R2ZWd0toWTJya3pOYXNpNU53VGNZK2tDRUE3MStWSzM3SFBqdHR5cEtsZW1s?=
 =?utf-8?B?eWpNN2h4c3NKRmd0K3owZGFMdXJIQ3U5MDRqOEluc25HNnE2SXlDWWlpL3gr?=
 =?utf-8?B?RkdxZTJPMWNDTlpZZHd4S055K0dkOGNnVkFRZTZPRGtTTSt0RnhzQ0NYbTQr?=
 =?utf-8?B?dWYvVVEwa283Sm12OGRCNUFTTGFhdVVETXVscWdxdElNT3NYVjBoZ29VSzVw?=
 =?utf-8?B?QnJqWGxTWk1KTVdLUWZpeVljUWtTSk8wMWxkQWM0UHdJejVNMS80VGNBOUQ5?=
 =?utf-8?B?Qy9NVGNIb3puUFVPVkIzOHk1VnJ3UlNENEdrZlBEaXBiQmVTRDUvTmF1T1ZR?=
 =?utf-8?B?NnVqMWx5TTNPSjFmSVRiQ0FEajJtVXR6NHQ0eHV5cWZmSzV6ak5JWVRuWGUv?=
 =?utf-8?B?bFZvbXY3dlpoSllPSnAwNzJBdnlWSjJCY1Q0TzBmNXl3NHJQdnkrT1pOWlkv?=
 =?utf-8?B?UFRhdTJyYUVsLzZETFNsMTNKdGd1OTMwNmxHQzcxanVsODF0U2s1L0hOVHZh?=
 =?utf-8?B?bVpvMktPVEdyaFV6eXJKVWRFOXBmM01qdVRNeDF6Qk1rcXJ1cksybTE1c2tN?=
 =?utf-8?B?dDBWNkxMN2hWcHRySXRMenNKM3J6TGFVaVJvZERSeTRwdFJwcm9iaGZNSGdr?=
 =?utf-8?B?dWlPY092U1hVYTIrZEpYV0lHdFRWSDYzZm9CcFdDdXR6SENBdCtZTmVsWnd4?=
 =?utf-8?B?aWUwczVFN1orWC8yUmwvb0JxWGFGVm45cXZINFdEQ1N0UVk0ZkduRkNtY2Qz?=
 =?utf-8?B?NTRtU1YzMlJZV1c4RktjZ3ovdVpGRGo1TzJtMGxOcmtLZ3RSa0Nna25BS2xN?=
 =?utf-8?B?SFJnUDFmcC9GZ1o2QW5weUVmMmM2M3Fyb1Y0eXg3OXpTRERhSHo3WnRkWWVW?=
 =?utf-8?B?VFdQVXA3K2ZTa0Npd1AwSWprL2NuNFhJRXQvWnNRWGlSa0o2aHJOZWVCNmdD?=
 =?utf-8?B?VU1Pa3NiZlJuNFF6MXQyd2ZQOFhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6696.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5128b9e7-7531-4e66-c9f2-08dc9d1fbb89
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2024 18:24:39.5579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ffKo6pfrGXPetz0ZCt0M3ZS3hwXFRW0KuVlelZbWp30JFef+Io4WY80vR1irOu7C9XP+usTixziy0HMi7XgC5shZCU0m6GYjV9EYMTXU1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
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

SGkgTWljaGHFgiwNCg0KSSBoYXZlIGp1c3Qgc2VudCBwYXRjaCB3aXRoIGNvcnJlY3Rpb25zIGFw
cGxpZWQuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBXYWpkZWN6a28sIE1p
Y2hhbCA8TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+IA0KU2VudDogVGh1cnNkYXksIEp1bHkg
NCwgMjAyNCA0OjIxIFBNDQpUbzogS29sYWtvd3NraSwgSmFrdWIxIDxqYWt1YjEua29sYWtvd3Nr
aUBpbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IE1pc3pjemFr
LCBBZGFtIDxhZGFtLm1pc3pjemFrQGludGVsLmNvbT47IEJlcm5hdG93aWN6LCBNYXJjaW4gPG1h
cmNpbi5iZXJuYXRvd2ljekBpbnRlbC5jb20+OyBMYWd1bmEsIEx1a2FzeiA8bHVrYXN6LmxhZ3Vu
YUBpbnRlbC5jb20+OyBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRl
bC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIGktZy10XSB0ZXN0cy9pbnRlbC1jaS9mYXN0LWZl
ZWRiYWNrOiBBZGQgU1ItSU9WIHRlc3RzDQoNCg0KDQo+IE9uIDAzLjA3LjIwMjQgMTM6MTIsIEph
a3ViIEtvbGFrb3dza2kgd3JvdGU6DQo+PiBUaGlzIGNvbW1pdCBhZGRzIFNSLUlPViB0ZXN0cyB0
byBmYXN0LWZlZWRiYWNrIHRlc3RsaXN0IHNvIHRoYXQNCj4NCj4gbml0OiBub3Qgc3VyZSBhYm91
dCBJR1QgcnVsZXMsIGJ1dCB1c3VhbGx5IHdlIGRvbid0IHN0YXJ0IGNvbW1pdCBtZXNzYWdlIHdp
dGggIlRoaXMgY29tbWl0IiwgZnJvbSBbMV0NCj4NCj4gIkRlc2NyaWJlIHlvdXIgY2hhbmdlcyBp
biBpbXBlcmF0aXZlIG1vb2QsIGUuZy4g4oCcbWFrZSB4eXp6eSBkbyBmcm90euKAnQ0KPiBpbnN0
ZWFkIG9mIOKAnFtUaGlzIHBhdGNoXSBtYWtlcyB4eXp6eSBkbyBmcm90euKAnSBvciDigJxbSV0g
Y2hhbmdlZCB4eXp6eSB0byBkbyBmcm90euKAnSwgYXMgaWYgeW91IGFyZSBnaXZpbmcgb3JkZXJz
IHRvIHRoZSBjb2RlYmFzZSB0byBjaGFuZ2UgaXRzIGJlaGF2aW91ci4iDQo+DQo+DQo+IFsxXSBo
dHRwczovL2RvY3Mua2VybmVsLm9yZy9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sDQo+
DQo+PiB0aGV5IHdpbGwgYmUgZXhlY3V0ZWQgaW4gQkFUIHJ1bnMuIEFkZGVkIHRlc3RzIGFyZSBh
Ym91dCBiYXNpYyBzaW5nbGUgDQo+PiBWRiBlbmFibGVtZW50IHdpdGggYW5kIHdpdGhvdXQgYXV0
b3Byb2JlLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBKYWt1YiBLb2xha293c2tpIDxqYWt1YjEu
a29sYWtvd3NraUBpbnRlbC5jb20+DQo+PiBDYzogQWRhbSBNaXN6Y3phayA8YWRhbS5taXN6Y3ph
a0BpbnRlbC5jb20+DQo+PiBDYzogTWFyY2luIEJlcm5hdG93aWN6IDxtYXJjaW4uYmVybmF0b3dp
Y3pAaW50ZWwuY29tPg0KPj4gQ2M6IEx1a2FzeiBMYWd1bmEgPGx1a2Fzei5sYWd1bmFAaW50ZWwu
Y29tPg0KPj4gQ2M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVs
LmNvbT4NCj4+IC0tLQ0KPj4gIHRlc3RzL2ludGVsLWNpL3hlLWZhc3QtZmVlZGJhY2sudGVzdGxp
c3QgfCAyICsrDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4gDQo+PiBk
aWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwtY2kveGUtZmFzdC1mZWVkYmFjay50ZXN0bGlzdCANCj4+
IGIvdGVzdHMvaW50ZWwtY2kveGUtZmFzdC1mZWVkYmFjay50ZXN0bGlzdA0KPj4gaW5kZXggYWE5
OGIzN2U2Li5mYzMxMmExMjMgMTAwNjQ0DQo+PiAtLS0gYS90ZXN0cy9pbnRlbC1jaS94ZS1mYXN0
LWZlZWRiYWNrLnRlc3RsaXN0DQo+PiArKysgYi90ZXN0cy9pbnRlbC1jaS94ZS1mYXN0LWZlZWRi
YWNrLnRlc3RsaXN0DQo+PiBAQCAtNjUsNiArNjUsOCBAQCBpZ3RAa21zX3Byb3BfYmxvYkBiYXNp
YyAgDQo+PiBpZ3RAa21zX3BzckBwc3ItcHJpbWFyeS1wYWdlLWZsaXAgIGlndEBrbXNfcHNyQHBz
ci1jdXJzb3ItcGxhbmUtbW92ZSAgDQo+PiBpZ3RAa21zX3BzckBwc3Itc3ByaXRlLXBsYW5lLW9u
b2ZmDQo+PiAraWd0QHNyaW92X2Jhc2ljQGVuYWJsZS12ZnMtYXV0b3Byb2JlLW9mZkBudW12ZnMt
MQ0KPg0KPiBtYXliZSBpbnN0ZWFkIG9mIG51bXZmcy0xIHdlIHNob3VsZCBzZWxlY3QgbnVtdmZz
LWFsbCB2YXJpYW50Og0KPg0KPglpZ3RAc3Jpb3ZfYmFzaWNAZW5hYmxlLXZmcy1hdXRvcHJvYmUt
b2ZmQG51bXZmcy1hbGwNCj4NCj4gYXMgb3RoZXJ3aXNlIHRoaXMgY2FzZSB3aWxsIGJlIGZ1bGx5
IGR1cGxpY2F0ZWQgYnkgdGhlIHRlc3QgYmVsb3cgKHdoZXJlIGF1dG8tcHJvdmlzaW9uaW5nIG9m
IG9uZSBWRiB3aWxsIGJlIGV4YWN0bHkgdGhlIHNhbWUsIGp1c3QgYSBWRiBkcml2ZXIgd2lsbCBi
ZSBwcm9iZWQgb24gdGhhdCBjb25maWcpLCB3aGlsZSB3aXRoIG51bXZmcy1hbGwgdmFyaWFudCB3
ZSB3aWxsIGNoZWNrIGF1dG8tcHJvdmlzaW9uaW5nIGZvciBhbGwgYXZhaWxhYmxlIFZGcw0KPg0K
Pj4gK2lndEBzcmlvdl9iYXNpY0BlbmFibGUtdmZzLWF1dG9wcm9iZS1vbkBudW12ZnMtMQ0KPj4g
IGlndEB4ZV9jb21wdXRlQGNvbXB1dGUtc3F1YXJlDQo+PiAgaWd0QHhlX2NyZWF0ZUBjcmVhdGUt
ZXhlY3F1ZXVlcy1ub2xlYWsNCj4+ICBpZ3RAeGVfY3JlYXRlQGNyZWF0ZS1leGVjcXVldWVzLWxl
YWsNCj4NCg==
