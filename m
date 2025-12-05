Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C634D339AE
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 18:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B7110E279;
	Fri,  5 Dec 2025 18:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyIQIRST";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D6A10E279
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 18:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764960314; x=1796496314;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eJ3mX/R5dhZI/iIWmcB1uf4TtusTpQnd+JkAvy5BfUY=;
 b=nyIQIRST3zZwngBXcQr7RbdN2iyZHi6CTm7kmcEOvig3CFJyOf0qUz/Y
 /5hvkDCTw7fUPitolp6bBVb+QKXcLes/3dfQh79AZioWMxwVzHJSKrqT1
 IE8QbGhXvYvlOxbB9HTX2rotlw0SOxnZfPTqa4pAXo3Mk9erCGrw+cGBZ
 lf5SgQeB8N2VUBzmpmXQaYIoLCYxSyISWItRDkBGx/vpfh2xGaReJKSH5
 K1Tqex7zjQq9M1zGV0isbDqGNMX6wx9z2VtMZTBc2wBhErzQqFvVDGMHx
 y6gD6biPzn9iWR/Puu8KZCPCmhwhVRx0Jm4HDdeooqdkrFpJF02bJZBf/ w==;
X-CSE-ConnectionGUID: k9bDYUCDTsOWQPcaEoB/Hg==
X-CSE-MsgGUID: gl/C8JOQRbm4Ke5FioQ6Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="92476832"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="92476832"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:45:14 -0800
X-CSE-ConnectionGUID: LYAm/Xw8R6CsKGUXG3XHig==
X-CSE-MsgGUID: hPgyCUQFS/G6TDWpjp7jnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="194661979"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:45:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:45:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 10:45:13 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:45:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KacIRjuNV1309a76YKUifaCYdsnvkK8MFj0wVMiDz+arFQB6v3o918IDoTqY7w44XhXCQkjMd3IZoVPjeOuOKmsO1nYuqiwfc9/WBBefMJK5j6godwV0gAF6xLiLoLeINlJHv6fy6AOIEmdZc0YFov76syMGJI3I8C0Y5SniTEbVZMtpX8VIWxx7EsIAM/uOHytyg8illLkE6jw5lkeB2INu92JDoV7gUTu/E1/afbrrysTbE8NZXfYd7uYc0MoHw2RMVDMvjIjfYGI3YE1J9jSkiL/xp1JSzCs2s2RHaqozXfPsqyzKgG8U6YyzVwtx1W3F5tObbHx/CuGhhDQiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJ3mX/R5dhZI/iIWmcB1uf4TtusTpQnd+JkAvy5BfUY=;
 b=ogxab3EYcOEqz5A6yp7HDI5nBfagFz+lkax1gagNDsTHmtJ2/9p5RSmO2O7kN99I64Cz9RAz1QuNcffmVUIhs6aRyxdZf/l7bKlpyiOn6c5EqfOdveqA0rPGjJyImKPlPlkZi87Oj3a5f2xJ8jeUmZWUF5UbX+pFcWR+lraFAHEz8Q56T53YHmvlVNDLteliWXOt5cfpYe6c+m2Z9qs3nUVZA9s61bsgyI6syaKQ0peIWkOyyIDMQ+bfAo6VMoELIcx2eYy5jSYrnkeXOtLkHGyGJ8LTKZqPZa0OjtZrLD5ecyHv+FTsX4RdRDu+4LBtSi+aYkRw3zJ5wQuHUjaPoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH3PR11MB7392.namprd11.prod.outlook.com (2603:10b6:610:145::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 18:45:08 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 18:45:08 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 14/19] lib/xe/xe_spin: Add switch point for preemptible
 spinner
Thread-Topic: [PATCH v2 14/19] lib/xe/xe_spin: Add switch point for
 preemptible spinner
Thread-Index: AQHcWpr+rXXh9jw7R0WnsRnD3zAsXrUSDaSAgAAK74CAAWDEgA==
Date: Fri, 5 Dec 2025 18:45:08 +0000
Message-ID: <eb2c510e27f5facd0f2c86266ecfd53e2f025fde.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-35-niranjana.vishwanathapura@intel.com>
 <8cb0874f3e5bac4a8226b8d6cae25c21fd4acfd6.camel@intel.com>
 <aTIAR9boDHPtzkGg@nvishwa1-desk>
In-Reply-To: <aTIAR9boDHPtzkGg@nvishwa1-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH3PR11MB7392:EE_
x-ms-office365-filtering-correlation-id: 23275028-fd3f-4790-42b0-08de342e6a37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QTlNY29jeEtrZmRSRm9TbUpXQzMyK29oZlJCQXRzSWxsMEpVOEhHWWZvM29q?=
 =?utf-8?B?bHlFeUk2VktqL095eTVZOGhyUnlMTG5aRzVTN2dQSTZKSS9CNXJXcHZ3ZUZ0?=
 =?utf-8?B?dXJVWk43ODNPalZaQms2Zkd4WXppMTJ3QTRhdmsyM1pzdVRsK0xOOHRsR2pa?=
 =?utf-8?B?bjA2L00zZlYyaXZab2xHcjNtaXJISXdScWRoQzdKR3hlQ1JHUHFzR1RLUkQ1?=
 =?utf-8?B?SUw0TlNyWGt4ZXJjT09Ca1I4TmVwSzEvWUtYWlBXUWZRUGRiNStRM1kxUUpJ?=
 =?utf-8?B?QmRiS1VEQlh3UlBjajBITC9uT2tLcUczYW93d2pYMkhKR2dzRkVJb2gybXJs?=
 =?utf-8?B?RXduNlBkWGQvVFFGbzdFdGFoMUdsdVZKTWVmRzlGdUh2T2NqbTZTZ3FCZFE5?=
 =?utf-8?B?SUEwKzJSY09RbzZYdFlVeTQ4dFZxK0dSWHpVK1NPbWVFdEJ2bEZjRlpYYlhu?=
 =?utf-8?B?T21ZR3RVaHJrMi95UzZCbWdCK0lndkJIMUd1b1pvMEFHR09pWm9GNXpVVVgv?=
 =?utf-8?B?Zi9CVXJBSURNQ05pY2R4NkY5aHIxeEFNUU1HSm15aW9aUTVYZGkvOVJscWtN?=
 =?utf-8?B?UHBmZ3pYc3dWYlR5ZzZKUW5ZTVhJT2U1V1Bkb2JUTWFidCtwYVZsRjlJazA3?=
 =?utf-8?B?NEFzcFdZUXhCdHFuSVhmditTRituUEZWMGFCczBxelVQTzdub2wvODhmZ2sw?=
 =?utf-8?B?QWhvV3NiMkxqS0s3dnh0YVgyd0FRdmRVWnpzdlc5Z0lPbzF1Ukdmb1Q4d3ox?=
 =?utf-8?B?Y3lPZzc1VkQ4QU52WVdWaEZqc1lEYzRDU252MVdReE5yM1VHYyt2NThRbHBX?=
 =?utf-8?B?RmJzaHBNTzBZdmV1Z05ZRkhwNFdKL2NLMG04MHdScGRybjZmNitaOFBKbkJW?=
 =?utf-8?B?bWd4V0Z3b0hWRFR3WjVUVlBscHZHeWRHelZUdWo4YjdVczVxeElwYnIrV3c0?=
 =?utf-8?B?ZExGRExmNm9pTWtEb1ZMSWFkUTlRVUZEYlp2OEZHWXVDSE9rRVdSQWR2bmw0?=
 =?utf-8?B?a3FuVlU5R1VXUXB4L1l4amxMVVJFWmcvdjVVSzhYV3VlMDRTaWxzZjZaK3JM?=
 =?utf-8?B?YTE3NEtZKytjdTVOUC9VU09jWmg4bit4ZUpkMEg2VTdRUlFmcVREaDQ5L1Rs?=
 =?utf-8?B?UXV6bHFBM2ltSWdDazBVb3FsVVllc3M2TG96OWEycndxM0xBQnZwZnVLbkgr?=
 =?utf-8?B?b25OUzcvVlNZT09oaVlVWmd4eS8yRmRzUUd5NlpORTBFbW9LOW1WN0JXSUQz?=
 =?utf-8?B?NjN0RFZGK29hWFpvZ01iSEpPRmM4N2l1eHBlT0ExRGIyWkR5bXpsbENiaFFi?=
 =?utf-8?B?dHM2NnFHZzY2Zm82cmxJZ3c3NXNSQWc1aHAzSE1oVElqWDVjUk1FMURBbk5w?=
 =?utf-8?B?RnpUL3BuV1JHRVVYZjVqQkVOS002R1dpUjU1c0xQZjFMVXVyYmFCendBRFZM?=
 =?utf-8?B?UUZXV2NLeW1BWGdGRzhoMjVkcE82K0MxWFdwUE4zRHk5UHNkaHJJMzl4ZUwz?=
 =?utf-8?B?NU9SQ2s2ZnQvQ0NseXQ0bk8wenNYL2lveGl5UUFRVmRoUkYvSFNGZUhFYmJ2?=
 =?utf-8?B?VjFLYUNmalQwT0tscXdnYTFxUUhFMDZhTHpyZm9FMjZwL3JBMjI1bFFvMXlt?=
 =?utf-8?B?MS9HazliUlovRTBhdStJTEMvTWtSWXU1cjZxb05TbTEvQzdVdkVRQ0t6R0dn?=
 =?utf-8?B?UVhseGFjL1BPVHhta1dxWTV5aitjd1MveDlpbGdsM1JPZHdyTE9KdVNxcWJI?=
 =?utf-8?B?a2Z0TUYxT3hhYUtDbVJuUHhxS3JQVVo2ajFYWDB0dCtlU2svbHFIVEhLYnpY?=
 =?utf-8?B?QzVPMjdNUFV3R2twWjVVbU1uTmwxRVRCYklkUXNCLzU2eGJxVk9rWVBVam8x?=
 =?utf-8?B?OTJhNzlhRmh2NExiTWR0MFZiY0ovOWhHSE5Rdy9mRFpPTUtiVmVoZ0FxbkpV?=
 =?utf-8?B?VnREWDNyOTJybTJ3S2swaFdGdVpXdUhRY3dndytQWkQ0UFdCY215ZzlWZ1BE?=
 =?utf-8?B?M1k5VWlyVVRKc1piTlM4SWc2TFRSVzl6VEw5RUVyeVVXTUFGdTQwQ0JobU0x?=
 =?utf-8?Q?5/jbp+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnJxVmYrUENqaXZCSjJDcnYxWGxrYnYrY0tJZTZQWEIzelhDYjJGNUtOZWdy?=
 =?utf-8?B?ODVOODNHaTBIWHcwSi9QSlEvekUzQnFXQzRPSURQVHM5UTRtalVqTzFMOEQy?=
 =?utf-8?B?eXVuWHZ1SS9ZRVNTcHRkRkxTQ2lUb2dZZXRBckJDRFhlekc0Y00rTzE2TGZV?=
 =?utf-8?B?aU1zL0l2c3l5anc1VlR4NnNHWDczZENkclpWOE03bW4wUno0Qng1OUNaV2xr?=
 =?utf-8?B?VlFiRTl3eXRUYkhmMnJPd00zdG5Ea2E0MFVkZnJ3UHhGaktSN3hEWEFIblNN?=
 =?utf-8?B?TTFtazR6a2xUZURZZEJpSnJDYUVxTDhqcEVKU29HamFjdE54ZVRpcWpVS0RK?=
 =?utf-8?B?VnA0N1laWElQanFjWDgrb0J2dWREcnRwS0t2NFpERVBaUTBHYlQ3RW9PZU8v?=
 =?utf-8?B?Rit4d3NCVitxa0NoK3REMXdib2FGZVl3SXFBK0p0UFV2OGZvY01iWmJOdFZh?=
 =?utf-8?B?RnIxdnpEcGdLT3U1MlhXUWJmbHA0QXlVL0trYlN3aHZybjV4V2dRSkJ6MFBU?=
 =?utf-8?B?dFppd25DM1R0cmZUcGtsT2N5bXM1YThZaWZ3TUVPVzUrMkh0a2RMQXYydnRm?=
 =?utf-8?B?NnhBbTZhNnVDc21INXhRY3JhK0UyNDc1SEk4WkdMWnNQbWRqRHlrcTRud2FK?=
 =?utf-8?B?ODE1Yk1La0FIVFE1WkRjdENZMC85K2NVaVJMYm1nR2tFUVlqTVZVaHgxdkJF?=
 =?utf-8?B?V1o5RzRvMllTWVpJYmxaNC9UTkp2SUdtK2RZTjR3aU11THpJejUvRUdHLzI3?=
 =?utf-8?B?Z3U1MDNvRkN6RHFjUEhSYUF4cStSck9WUzlERnlBS0psbktFOWw3MHlZYlIr?=
 =?utf-8?B?ZUY4OCtoc2VwWldDMWRjWTFlSGlaS29uQ29oRmQ1ODNWWW9rSkxDZUhkZzMx?=
 =?utf-8?B?cWhsbkhkb3lBWFZzZHBxZFpzK2RudzdmMy95Nk9zVHBCd3cxMmRJUGxGV3Ix?=
 =?utf-8?B?b1VrdUE5aVBybDU4NHY2UmJXNTBnbm05UWxvUDNyNzJBb0sxcGpoZVNMVTNN?=
 =?utf-8?B?TVJSclR0QWFQbFQzVjRvMnArWGNLZ1RCZlRhYlNJdFcyTW5oRit6M2NnWnZF?=
 =?utf-8?B?WHc3YUxCQ2I5WWtydDRxRVVJRHdIbjM4eHBmSjY1OG50VFdHTEVRQ1NqbzJO?=
 =?utf-8?B?N0ZHK0hLTjJxcmFuRHl1OERGWk5KUzk0dzA2UDhudlJrMnpkd0pFOWtwdTlR?=
 =?utf-8?B?YnBiYVB1QUxNY3lmcXQ5bndEUW1CVkwycmZLRDg3Q2t6cW1wSHpQcXJCMGZx?=
 =?utf-8?B?RXRRbUlRSWNlTWtpN293aEhJN2JrNGRWQTZrQkliRVpQVzdTbnY5TG1jaVI3?=
 =?utf-8?B?SEYydEo1eC9nb1B0cXZ2NG12SzF3dmVJVHVNUG9DTzFnTVM1RjRpRUIwM0Fy?=
 =?utf-8?B?L0JyUWIvMCtveEtqV2xVcXZQN1p6WDlmeGxnTHlQSm5VL1BCRllIOWdpdkJF?=
 =?utf-8?B?NHd5RW9Hdm5LNzMwRkhkejFnUkZZZjZHZnVpSHhXbmF3QTZJeFRwNDJsc3dz?=
 =?utf-8?B?Y2lUL1k3MFI5bGF5UGM2SHd5VG8xbFBkcEVmTnU5YmNSWFVYMHVDTHlXN2Q5?=
 =?utf-8?B?Q1hvWVFRUElhZkhJSWpZRW5HOWtLRldwMFpHbmQ4YU1uQk5ldUFpV1ZDTEFt?=
 =?utf-8?B?ay9TL0pibFBHR0VXelEvUk1LOVVjQnAyWC92aVhLL0luMlUvcVNHdlpGSGV2?=
 =?utf-8?B?Q0JhMjNJUE50RllIaldCZXBheWlITDd4Lzk1MEVXclFUYU04QVUybEVjRFp5?=
 =?utf-8?B?Vzh5NFRPSS9BRGRPbzgvMGs4WXUraWJuOHh0bVZ0UEI0b3J6MElEdDROcEJP?=
 =?utf-8?B?UnhPYmZjMUgzVmQ1SlVpOVhpV0J0eXFoSGNNRXJkTjZObzlTM21GZmpxejdC?=
 =?utf-8?B?V1F2K3ZsekpwOEpsRmJWeDFvRHR4MHdLRXpZcGMvZTR5alU0RDRBb2M0VFo2?=
 =?utf-8?B?eml3SHJ6NUFVdGsra2tmSjF5V3lSMmx6dnJndlFMNVQ4MEJSVDZPRWIrWVJL?=
 =?utf-8?B?UTdUTmkzNHoyZDcyZ0V0V2dqclc2VWFJRDZHeU9oMFlZZWc1WFhNWlM2b3JL?=
 =?utf-8?B?YXZOb0FLVkJWaFdDZFJEeUJ3UmptQXBEV3AzczlPTUtsd0FwSVhsM0ZrV09Y?=
 =?utf-8?B?S3dQUzcxUThvSkdLNUIzQ2k0d0EyRTRjVVdRTVN5WjhUWVVuZCtpaUFKVmRI?=
 =?utf-8?B?L0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C8F405CDF7FF5488F732EA9B9565A04@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23275028-fd3f-4790-42b0-08de342e6a37
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 18:45:08.7941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FEWIBaug87wPG7MwFFhla/TzqbG9aS9fIM4gqsfeitD3BimWHvQk4TFGJQnnj0OvqUL6mM4m/Fa3JjEY6SV2MRCb8D7KdBM4PSZJK9dkvl8=
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

T24gVGh1LCAyMDI1LTEyLTA0IGF0IDEzOjQyIC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IE9uIFRodSwgRGVjIDA0LCAyMDI1IGF0IDAxOjAzOjI1UE0gLTA4MDAsIFN1
bW1lcnMsIFN0dWFydCB3cm90ZToKPiA+IE9uIFRodSwgMjAyNS0xMS0yMCBhdCAxOTo1NyAtMDgw
MCwgTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSB3cm90ZToKPiA+ID4gV2hlbiAncHJlZW1wdCcg
b3B0aW9uIGlzIHNwZWNpZmllZCwgaW5zZXJ0IGEgTUlfU0VNQVBIT1JFX1dBSVQKPiA+ID4gY29t
bWFuZCBpbiB0aGUgc3Bpbm5lciBiYXRjaCBidWZmZXIuIFRoaXMgcHJvdmlkZXMgdGhlIHN3aXRj
aAo+ID4gPiBwb2ludCBmb3IgcHJlZW1wdGlvbiB0byBoYXBwZW4gaW4gbXVsdGkgcXVldWUgbW9k
ZS4KPiA+ID4gQWxsb3cgdXNlciB0byBjb250cm9sIHByZWVtcHQgd2FpdCBjb25kaXRpb24uCj4g
PiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhCj4gPiA+
IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4KPiA+ID4gLS0tCj4gPiA+IMKg
aW5jbHVkZS9pbnRlbF9ncHVfY29tbWFuZHMuaCB8wqAgMSArCj4gPiA+IMKgbGliL3hlL3hlX3Nw
aW4uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQxCj4gPiA+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ID4gPiDCoGxpYi94ZS94ZV9zcGluLmjCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDMgKysrCj4gPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRp
b25zKCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9pbnRlbF9ncHVfY29tbWFu
ZHMuaAo+ID4gPiBiL2luY2x1ZGUvaW50ZWxfZ3B1X2NvbW1hbmRzLmgKPiA+ID4gaW5kZXggY2Qy
ODFiYTg5Li41MTU4YmIwZWEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1ZGUvaW50ZWxfZ3B1X2Nv
bW1hbmRzLmgKPiA+ID4gKysrIGIvaW5jbHVkZS9pbnRlbF9ncHVfY29tbWFuZHMuaAo+ID4gPiBA
QCAtMTIzLDYgKzEyMyw3IEBACj4gPiA+IMKgI2RlZmluZSBNSV9TRU1BUEhPUkVfV0FJVMKgwqDC
oMKgwqDCoE1JX0lOU1RSKDB4MWMsIDIpIC8qIEdFTjgrICovCj4gPiA+IMKgI2RlZmluZSBNSV9T
RU1BUEhPUkVfV0FJVF9UT0tFTsKgwqDCoMKgwqDCoMKgwqBNSV9JTlNUUigweDFjLCAzKSAvKgo+
ID4gPiBHRU4xMisKPiA+ID4gKi8KPiA+ID4gwqAjZGVmaW5lwqDCoCBNSV9TRU1BUEhPUkVfUE9M
TMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgxIDw8IDE1KQo+ID4gPiArI2RlZmluZcKgwqAgTUlf
U0VNQVBIT1JFX1FVRVVFX1NXSVRDSF9NT0RFwqDCoMKgwqDCoMKgwqAoMSA8PCAxMSkKPiA+ID4g
wqAjZGVmaW5lwqDCoCBNSV9TRU1BUEhPUkVfU0FEX0dUX1NERMKgwqDCoMKgwqDCoCgwIDw8IDEy
KQo+ID4gPiDCoCNkZWZpbmXCoMKgIE1JX1NFTUFQSE9SRV9TQURfR1RFX1NERMKgwqDCoMKgwqAo
MSA8PCAxMikKPiA+ID4gwqAjZGVmaW5lwqDCoCBNSV9TRU1BUEhPUkVfU0FEX0xUX1NERMKgwqDC
oMKgwqDCoCgyIDw8IDEyKQo+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX3NwaW4uYyBiL2xp
Yi94ZS94ZV9zcGluLmMKPiA+ID4gaW5kZXggNzJiMTNlZjQyLi4xNzRjNWY3ZWMgMTAwNjQ0Cj4g
PiA+IC0tLSBhL2xpYi94ZS94ZV9zcGluLmMKPiA+ID4gKysrIGIvbGliL3hlL3hlX3NwaW4uYwo+
ID4gPiBAQCAtNTcsNiArNTcsNyBAQCB2b2lkIHhlX3NwaW5faW5pdChzdHJ1Y3QgeGVfc3BpbiAq
c3Bpbiwgc3RydWN0Cj4gPiA+IHhlX3NwaW5fb3B0cyAqb3B0cykKPiA+ID4gwqAKPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoHNwaW4tPnN0YXJ0ID0gMDsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHNwaW4t
PmVuZCA9IDB4ZmZmZmZmZmY7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHNwaW4tPndhaXRfY29uZCA9
IDA7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzcGluLT50aWNrc19kZWx0YSA9IDA7Cj4gPiA+IMKg
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAob3B0cy0+Y3R4X3RpY2tzKSB7Cj4gPiA+IEBAIC0x
NjcsNiArMTY4LDI0IEBAIHZvaWQgeGVfc3Bpbl9pbml0KHN0cnVjdCB4ZV9zcGluICpzcGluLAo+
ID4gPiBzdHJ1Y3QKPiA+ID4geGVfc3Bpbl9vcHRzICpvcHRzKQo+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBv
cHRzLT5tZW1fY29weS0+ZHN0LQo+ID4gPiA+bW9jc19pbmRleDsKPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoH0KPiA+ID4gwqAKPiA+ID4gK8KgwqDCoMKgwqDCoMKgLyoKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgICogSW5zZXJ0IGEgTUlfU0VNQVBIT1JFX1dBSVRfQ01EIGluc3RydWN0aW9uIHdpdGgKPiA+
ID4gY29uZGl0aW9uCj4gPiA+IGNvbnRyb2xsZWQKPiA+ID4gK8KgwqDCoMKgwqDCoMKgICogYnkg
dGhlIHVzZXIuIEl0IGFsc28gYWN0cyBhcyBhIHF1ZXVlIHN3aXRjaCBwb2ludCBpbgo+ID4gPiBt
dWx0aQo+ID4gPiBxdWV1ZSBtb2RlLgo+ID4gPiArwqDCoMKgwqDCoMKgwqAgKi8KPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgaWYgKG9wdHMtPnByZWVtcHQpIHsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHVpbnQ2NF90IHdhaXRfYWRkciA9IG9wdHMtPmFkZHIgKyBvZmZzZXRvZihz
dHJ1Y3QKPiA+ID4geGVfc3Bpbiwgd2FpdF9jb25kKTsKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hbYisrXSA9IE1JX1NFTUFQSE9SRV9XQUlU
X0NNRCB8Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoE1JX1NFTUFQSE9SRV9QT0xMIHwKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgTUlfU0VN
QVBIT1JFX1FVRVVFX1NXSVRDSF9NT0RFIHwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgTUlfU0VNQVBIT1JFX1NBRF9F
UV9TREQgfAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAzOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgc3Bpbi0+YmF0Y2hbYisrXSA9IDA7Cj4gPiAKPiA+IFNob3VsZCB0aGlzIGJlIHNldCB0byBz
cGluLT53YWl0X2NvbmQgaW4gY2FzZSB3ZSBldmVyIHdhbnQgdG8KPiA+IGNoYW5nZQo+ID4gdGhl
IGRlZmF1bHQgdmFsdWUgaGVyZT8KPiA+IAo+IAo+IHdhaXRfY29uZCBpcyBhbHJlYWR5IHBhcnQg
b2Ygd2FpdF9hZGRyLiBTbywgdXNlciBjYW4gY29udHJvbCB0aGUKPiB3YWl0IHVzaW5nIHhlX3Nw
aW5fcHJlZW1wdF93YWl0KCkvbm93YWl0KCkgZnVuY3Rpb25zIGJlbG93LgoKQWggcmlnaHQgYW5k
IHRoaXMgaXMganVzdCB0aGUgdmFsdWUgd2UncmUgdXNpbmcgdG8gY29tcGFyZSBhZ2FpbnN0IHRo
ZQp1c2VyIHZhbHVlLiBTbyB5ZWFoIG1ha2VzIHNlbnNlIHdoYXQgd2UgaGF2ZS4KClJldmlld2Vk
LWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoKPiAKPiBOaXJh
bmphbmEKPiAKPiA+IE90aGVyd2lzZSBnZW5lcmFsbHkgdGhpcyBpcyBhIGdyZWF0IGFkZGl0aW9u
IHRvIHRoZSBzcGlubmVyCj4gPiB0b29sa2l0Ogo+ID4gUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1t
ZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cj4gPiAKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHNwaW4tPmJhdGNoW2IrK10gPSB3YWl0X2FkZHI7Cj4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluLT5iYXRjaFtiKytdID0gd2FpdF9hZGRyID4+
IDMyOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hbYisr
XSA9IDA7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ID4gKwo+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgc3Bpbi0+YmF0Y2hbYisrXSA9IE1JX0NPTkRfQkFUQ0hfQlVGRkVSX0VORCB8Cj4gPiA+IE1J
X0RPX0NPTVBBUkUgfAo+ID4gPiAyOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hb
YisrXSA9IDA7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzcGluLT5iYXRjaFtiKytdID0gZW5kX2Fk
ZHI7Cj4gPiA+IEBAIC0yMDcsNiArMjI2LDI4IEBAIHZvaWQgeGVfc3Bpbl9lbmQoc3RydWN0IHhl
X3NwaW4gKnNwaW4pCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBXUklURV9PTkNFKHNwaW4tPmVuZCwg
MCk7Cj4gPiA+IMKgfQo+ID4gPiDCoAo+ID4gPiArLyoqCj4gPiA+ICsgKiB4ZV9zcGluX3ByZWVt
cHRfd2FpdDoKPiA+ID4gKyAqIEBzcGluOiBwb2ludGVyIHRvIHNwaW5uZXIgbWFwcGVkIGJvCj4g
PiA+ICsgKgo+ID4gPiArICogTWFrZSB0aGUgc3Bpbm5lciB3YWl0IG9uIHRoZSBwcmVlbXB0aW9u
IHNlbWFwaG9yZS4KPiA+ID4gKyAqLwo+ID4gPiArdm9pZCB4ZV9zcGluX3ByZWVtcHRfd2FpdChz
dHJ1Y3QgeGVfc3BpbiAqc3BpbikKPiA+ID4gK3sKPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3Bpbi0+
d2FpdF9jb25kID0gMTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArLyoqCj4gPiA+ICsgKiB4ZV9z
cGluX3ByZWVtcHRfbm93YWl0Ogo+ID4gPiArICogQHNwaW46IHBvaW50ZXIgdG8gc3Bpbm5lciBt
YXBwZWQgYm8KPiA+ID4gKyAqCj4gPiA+ICsgKiBNYWtlIHRoZSBzcGlubmVyIGRvIG5vdCB3YWl0
IG9uIHRoZSBwcmVlbXB0aW9uIHNlbWFwaG9yZS4KPiA+ID4gKyAqLwo+ID4gPiArdm9pZCB4ZV9z
cGluX3ByZWVtcHRfbm93YWl0KHN0cnVjdCB4ZV9zcGluICpzcGluKQo+ID4gPiArewo+ID4gPiAr
wqDCoMKgwqDCoMKgwqBzcGluLT53YWl0X2NvbmQgPSAwOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+
IMKgLyoqCj4gPiA+IMKgICogeGVfc3Bpbl9jcmVhdGU6Cj4gPiA+IMKgICogQG9wdDogY29udHJv
bGxpbmcgb3B0aW9ucyBzdWNoIGFzIGFsbG9jYXRvciBoYW5kbGUsCj4gPiA+IGV4ZWNfcXVldWUs
Cj4gPiA+IHZtIGV0Ywo+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX3NwaW4uaCBiL2xpYi94
ZS94ZV9zcGluLmgKPiA+ID4gaW5kZXggYzIxOTlkMGFhLi5lYWYyYTQwOWUgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2xpYi94ZS94ZV9zcGluLmgKPiA+ID4gKysrIGIvbGliL3hlL3hlX3NwaW4uaAo+ID4g
PiBAQCAtNjQsNiArNjQsNyBAQCBzdHJ1Y3QgeGVfc3BpbiB7Cj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqB1aW50NjRfdCBwYWQ7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB1aW50MzJfdCBzdGFydDsKPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoHVpbnQzMl90IGVuZDsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgdWlu
dDMyX3Qgd2FpdF9jb25kOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgdWludDMyX3QgdGlja3NfZGVs
dGE7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB1aW50NjRfdCBleGVjX3N5bmM7Cj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqB1aW50MzJfdCB0aW1lc3RhbXA7Cj4gPiA+IEBAIC03Niw2ICs3Nyw4IEBAIHZv
aWQgeGVfc3Bpbl9pbml0KHN0cnVjdCB4ZV9zcGluICpzcGluLCBzdHJ1Y3QKPiA+ID4geGVfc3Bp
bl9vcHRzICpvcHRzKTsKPiA+ID4gwqBib29sIHhlX3NwaW5fc3RhcnRlZChzdHJ1Y3QgeGVfc3Bp
biAqc3Bpbik7Cj4gPiA+IMKgdm9pZCB4ZV9zcGluX3dhaXRfc3RhcnRlZChzdHJ1Y3QgeGVfc3Bp
biAqc3Bpbik7Cj4gPiA+IMKgdm9pZCB4ZV9zcGluX2VuZChzdHJ1Y3QgeGVfc3BpbiAqc3Bpbik7
Cj4gPiA+ICt2b2lkIHhlX3NwaW5fcHJlZW1wdF93YWl0KHN0cnVjdCB4ZV9zcGluICpzcGluKTsK
PiA+ID4gK3ZvaWQgeGVfc3Bpbl9wcmVlbXB0X25vd2FpdChzdHJ1Y3QgeGVfc3BpbiAqc3Bpbik7
Cj4gPiA+IMKgCj4gPiA+IMKgLyoKPiA+ID4gwqAgKiB4ZV9jb3JrOiBoaWdoZXIgbGV2ZWwgQVBJ
IHRoYXQgc2ltcGxpZmllcyBleGVjJ2luZyBhbiB4ZV9zcGluCj4gPiA+IGJ5Cj4gPiA+IHRha2lu
ZyBjYXJlCj4gPiAKCg==
