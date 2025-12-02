Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A0BCFD376
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 08:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CC110E5B1;
	Tue,  2 Dec 2025 08:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZM1D4s+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5175A10E5B1
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 08:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764664025; x=1796200025;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=3o9MyhU/lgzdNB96msWDfcdtfCsqqwKhHtak7U5Bro0=;
 b=ZM1D4s+5gAth7LoivUKT4YSj3ogH2awtN0F2XFVCf2aBLqTnbKZXX5ih
 wc7bLErdeyGpsBQtVwAMGqyomkYUDVJG5bkTCanMmelEr2mYPhYe8vlWn
 hLm5tKFOKG6lwWpvYZ/dvcqsQzQXxGOHcm1Lq4EfJg8i0RU9brZocLHEq
 cvyP0CwfgM+z1unNBf50ixjA6s9s2Pc0ImW4Pw8Uletgw1xKyOdhenH/0
 qWodxypozUa0vaShAU8qIyDuVj+vjngXp0aqXR1CUzTHJXWrwciy02VJh
 MaPYJMUz+bYrX90VP8fkSFADFTODXI627fNlkTWSbuCRItMPaH+RH0Epn w==;
X-CSE-ConnectionGUID: VXkqxEndQr6JCOeUFk5H7Q==
X-CSE-MsgGUID: iFCptl59SxyEbpPWAPaVbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66335642"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66335642"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:27:05 -0800
X-CSE-ConnectionGUID: UE1+UJUoS/adbVpfVsZr0g==
X-CSE-MsgGUID: QVLJBw1kQ22eWOLub85P+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="194748969"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:27:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 00:27:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 00:27:03 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 00:27:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6IMJJG5dw4sCNhlWvyRIX3z4sSx4u8qVmoogr3kJptJYSdfRAwzSEcvlrVt2y+FcSspOtdaFwCpjYsTOryA+h8Mcrx6tA5+a5gFYg0Wcq+t0WuvbYcsLaTjeuXekgb6ROqTeBUip+nxQMMLzzFEr+vA9OL7dKhgcjGylBvICw0e8hQ0iX3JUKKlaPESEV9Qs1chBhOVHqZkC8BdKIF35WMagWXvTqC5vjBMFR7ArQMIYH2iQqnryaQ/0xkXMfdPsQeUHP3wmIAgEnWH5SlzuQQFOsEgoqG+1e8qrW85rMx16arRVvpcstEcO8jYA6PSQ5NytFrQmW65rUVZanKqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3o9MyhU/lgzdNB96msWDfcdtfCsqqwKhHtak7U5Bro0=;
 b=ER7z3GNh44GuQDjx6XYET0AkIF6S/1C9iGGI2gwIykRWA1iPmxOyyHH7KOQAhvpFBJPf+4RicdsADcSoI07RgR2/dcpQcS+FbaKY2hpEVwUVhyZLlmGwu/mQkjGm4xpHsp7fMMXqoDAmsJNQEUsHE22XQ359TFnkgBo9HAKo1EJ+iewwdf1gRboAdMdSvRkmXXnIbBwvFpKPabFRT0MddOLTgUX2jV8WPMpfTMK3gAE61xIgWWvfejakOII2kEVYYoMdS4jueUWrlPMIreB2ztZ0KNVUS2FLJWEkDUfdE6bTdG2L502zPuEpRla9SwoPQq1ycYoDDfQyNOhwYBZeJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 IA0PR11MB7404.namprd11.prod.outlook.com (2603:10b6:208:430::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Tue, 2 Dec 2025 08:26:56 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 08:26:55 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>, "Gurram, Pravalika"
 <pravalika.gurram@intel.com>
Subject: Re: [PATCH i-g-t v9 06/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU performance test
Thread-Topic: [PATCH i-g-t v9 06/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU performance test
Thread-Index: AQHcYqEwEeM4QaBzm0SRIoLelFkkJrUOBY8A
Date: Tue, 2 Dec 2025 08:26:55 +0000
Message-ID: <06934cf42513d397614c2530af68249e8a38a6fd.camel@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251201090201.326595-1-nishit.sharma@intel.com>
 <20251201090201.326595-7-nishit.sharma@intel.com>
In-Reply-To: <20251201090201.326595-7-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|IA0PR11MB7404:EE_
x-ms-office365-filtering-correlation-id: 741689b7-2d93-4c2b-5a01-08de317c8dd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?RFJ4ZUgyZkRMMnpNMDk1MXFiS2g5MXFYMVdxUE1XNG1Jdk15OW82VkRVdVN3?=
 =?utf-8?B?NCtzS0N2TVNmYnVMS0JhVVphNGZONndibW92VkFqbno0Zmo3Z3dxQmw1N1Jp?=
 =?utf-8?B?OERLNHM2Tk9FQTV4NFhDQ2VabWpkbkRaaFFHOXFRWkRyRVVPalBZSUlUQnd2?=
 =?utf-8?B?N2lEV1hDeFVHeG44Unh5SGE0QXVWMjRMWnhTaEIxbjc4Um96bUwzM2tSQXJk?=
 =?utf-8?B?YThzc2FudVIvVVhWcmVkOHkySzlxQ1IvRC9UTjZhOFo2Q0xBWVlWZGYrVU95?=
 =?utf-8?B?U3hGVXVxcFF2VldpakRsUVloSzlSemY1dkxWdkJPVkRzRTRsbSthaWVmZmd3?=
 =?utf-8?B?WlRuaWRjSExSaGM5NUpkUEhleGpzeTVSWm5VREJXZUd4NTV1Tm9vazd2bnBS?=
 =?utf-8?B?TTRuZEdRamcxVUVYaDZRdXErOXREdzNGeVFSMWs2bTZhbFBob2hONTg1RGlh?=
 =?utf-8?B?SmYrMDZlemJMTlZJd1pjSmFBNHFjVXdiRnBSZXF2enZBSUpoM1AzL09GR0oz?=
 =?utf-8?B?cGxGSWlCdmx1TVhoQTRXTllVRkI3cUhDeUVQMExIM1NFZ1JqQmZQaXVWMktu?=
 =?utf-8?B?bzFkeHNVbFpIeGh4dGdaNzF4bDBxREJFMlplTkNyUlk3NjFPb2RVQktYUGpW?=
 =?utf-8?B?WDFCbmxtM3RoVEJRZVVmZFIvTnVIVmptaHk1aEZYWWtUQUVWZWtDd05BSTFr?=
 =?utf-8?B?ZUx4VnZQdExwN1pJWjdQQ2ZoK3R2T2lDSzI4RHFzMytJbUw0SDJsN3l5YXhs?=
 =?utf-8?B?amROMWlRZXdjNndzd2ovK1FuQVhjRVd2TllFZkIzTGhDb1UrTTFrZmFKODZN?=
 =?utf-8?B?VGFzMjhrSmtEWEtoRUh4K0ZhbUhXL3ZhZzhvc1V2R2tJMUNEQU5MdkJEV3RM?=
 =?utf-8?B?WjdFakdjd0s0Umk2TnF5K0tLOUIwcDcxQ1kxa0pFUmpWcjVqbGtQaUVCOVUw?=
 =?utf-8?B?TXR4VVl1L2lzU0VEWllvWkZXOUJwY3ZjMXEwUWxNSVhpaVBOcG90MDhSTmdC?=
 =?utf-8?B?MmZnbEQwQ2xOMkw0bEJZRmthR1FCdTU4SThyT3NCZ29lWjJPUzZFUkkwdkwz?=
 =?utf-8?B?bHprOE1MVFUySWUxYzBuUXk3bUFJMi9CZ0FZWnZwc1lIUGhoc3UwcWZmUWhq?=
 =?utf-8?B?dllqSThvWEVQWVJDYWNVeXNvd3lKQ0hJSW8rUDBqckV2cGR3cTVGYTM1T2wv?=
 =?utf-8?B?R2FwYTdzTmxkQ3kyWGpzR2thdFpsRzNBRFJjOVhwcDVLeU5rVnE0MVhkb2ZE?=
 =?utf-8?B?SDhQaHFPbTJiTW8wZ3prMlZrRzhya3c0SS9jRlBSL01yTXNxL1RJVTJoQlYz?=
 =?utf-8?B?Ly9zQXc1S25RNGxDM3pxN1VIbDlrUC9ySldTS1B5V3B2eWtDNmFHcER3Y2c1?=
 =?utf-8?B?MFoxNGdnVlF4cFppMHJiQVFZU1RUMW9LamZnN0t5b2hvNEptQXVmUnNvSkhu?=
 =?utf-8?B?UjJYcU55MmNpWXMrMDFkQWtFRFp1SVljYkVRelZJMVVaamhxWUkwWUpOcTBB?=
 =?utf-8?B?VVErZE9yRG5UcVF0Y0p0SjBqazdjSVUrYWdZdGZvWHAyclB4MWg0U0M3THJ5?=
 =?utf-8?B?c0ZDb2xDQ0lETEZYYXM1RGtmK2paOXVPVk5oV0RpbE50MzljVk1jTXRja0NX?=
 =?utf-8?B?cnJ2U0xKcWNQaVhPRjRZbmJTQTdSU3cyb3hmNk9rQ2U5Y29IeDlscTZvWXEy?=
 =?utf-8?B?d3l5bTdPS2MyV3BpU20yZ1YwQ285dzhnUkpNbzJsQWdRSkZuOWNaR05yN0d2?=
 =?utf-8?B?ZUErYU5pbjV5K1YvQkJnV2RaU09qbXNMSGdDVDZhQXFaOHRidVRMMXZMT3Q2?=
 =?utf-8?B?eDBmY1hzd3pnc3ZVYTB1cFZSOWVIckxPN0EzMzRFTFlydTV2c3kyYjdsUGJ4?=
 =?utf-8?B?Z3BORG1OU09UL0dUM1dBMzF0VVREZUd1UTFyTHV1VWFNUEhreUNYRkNyMVRn?=
 =?utf-8?B?RjZiRXVNUjNhUzBtcDY2NlZwdWNISGpDMUNBRjlmUUxkK1cvS1Z3SUZxNWR2?=
 =?utf-8?B?WHRnQ3d1MzhSSnVtMTlNb3YxWlBxOSs4eFFWK2FLUUdVYjdUL2FCRDhHVVIv?=
 =?utf-8?Q?mp2Ssl?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjE3bXZ2QnFxdjhIenZEa1U4Z0VtUUR5bkxrUytoaWl4NEdpa1MwZU9Ed0Fj?=
 =?utf-8?B?QXlkSzd4dUZlWHphMFc1U0YzaDRTc25QM2k1WGRiMWdvOUlHY0NKU3VzRXVy?=
 =?utf-8?B?SzNKTkI5Rmc0WVZaYzJSOWtqMXMvMllUTENBa1JUZGc0YUxFZ09MVXZwc0FH?=
 =?utf-8?B?L3E5ZFBDdklWamVCTG0yNzV5blVNTFpVSGtxYUZuZFNoWkl1ZUZaZHl1aW1W?=
 =?utf-8?B?ZGhsN3RqckhXemdHc1NJTkFPQ3A0aHd4emkzdVEwYk1ldnhKeERLMzBBMSts?=
 =?utf-8?B?TkxnRkxHaDQ3T3ZWMGszcGpHQVo4TjQvV1piaTNvQVVCSjFIYnpnT1dscUxT?=
 =?utf-8?B?VGxQd0Q5Q25KU0JRSFRlL0o1ZTlvbTlFN3d2VGtQQ0l6eDZnWkNnQUp1MWNP?=
 =?utf-8?B?ZERpa3hxajRRZE45cmFJV3lOcGJmaXhWQlMzTzFMTUZyZ1VTTU1yWUlrV2U3?=
 =?utf-8?B?ay91dkdScUw5aGN6b2FtRjJrK0xxeStaMW1wcmt0NTM4RG5RUnZHdTdjRWk5?=
 =?utf-8?B?Q3JxWGx1bWFUSnYyakd3WUtidG5FSUFNTDZwU0ZxOHU4eE8vRU9SaDBGNnE4?=
 =?utf-8?B?NG1ld2FpeDRLMGJwckthR2tTZmF1emFLcGNaRG5RU3o5bm5abS9Tc3h5Z2lS?=
 =?utf-8?B?OWVndUtlQjQ2WHIyVktkdnRSYXM5NmcvTlZTaGFsc0orRlBaRXJ6NjFuT3JL?=
 =?utf-8?B?Y0hxMHRBbFlkbmZ1bC9zaFEwTlV5blFyZ3lFaXgyZENnMWo3RGhzQWxEUm5a?=
 =?utf-8?B?c1FCM1hQYkpIVzdpanUrWm83YWdKa0xLQ3lhUTcrcGxYeUNUbnlMSWU5eVlP?=
 =?utf-8?B?ZU5yRDZYV2xqajRucm5ZcnoycW0xOExudFg2VmR1MmV0TDNaNjY5Z3JwYUdw?=
 =?utf-8?B?UTZIWDgzWktCWWMyWCtKck5tQ2dBQm1zWHgxVzNGNDhVUlV0SzJyTTRGT2tv?=
 =?utf-8?B?TTI2K1FhdWorMDdUSnZoQmN2S0dFbUl2bUx5S0cwa1h1YjVLTkFoeWNKc1NJ?=
 =?utf-8?B?Zm1MTXN4d1dSbHMvbTFYTVhVRXRyN2I3ZGhLYzhwNVZjZHJrQk4wR3RKRFFY?=
 =?utf-8?B?eUNDTTdTdE9lT2tIbktCM3hZYm96Vi81cjhoOUloMmRJdE1NdThFckR2UnBq?=
 =?utf-8?B?VWYwbzVub3BwZWg2c1ZqUjdvbGJidE1KdHVoWEV0QUtBWWg0VXMvb0hXeE1W?=
 =?utf-8?B?M2toVWg3OHJPdFI2aFVCdk5yRUtnVFlDNVJieUVpQ2tIYUFtM2tjYjNkNFVx?=
 =?utf-8?B?N2V5ZVdKNmhNaE01VWhuNXRBVjVTN1N6TmNkMTl4dkJZNVpTQWhRalNHZVNC?=
 =?utf-8?B?REhwOStObzcyeWxVUDlxU0VpWnFyaE1QT1Zic3BlMEd1RXdqNVZsMzJjQUV3?=
 =?utf-8?B?UGhtdEVmSWpwMFl0MzRnLy9FVVZlQmVmTXRlQXdkK3BxVlR3SWVJeWEya0pF?=
 =?utf-8?B?OG5lMDUvMjI5eGVpcENjUGVsMWd3TDA0SUZ0TjRtMUpiZWF3SEkyQ2ZmVkdK?=
 =?utf-8?B?WG5hMnRreGcxNDZMWnlhelhyTGUwQkxpbTVROXJUcEJRRHJYMmZNSzlUdVVr?=
 =?utf-8?B?TzlrOHRMam1TOU1NR05SNkZXSVZ5RUNBQndHTEV0U3ZBeVJCS0NUUUJHd0dn?=
 =?utf-8?B?TEhTdjM2VjFFTlhEdEpybWlneGJhSkNmZW1tK2ttL1lhTDEzOTd3eThiWGtG?=
 =?utf-8?B?d25hMVVxNXFRSDVtV3F6ZEZSTmR2NXBPUjFxN3FtRG55L0twVU1uNUkyZVFx?=
 =?utf-8?B?QjhsYnNFNCthYmVBT0dOTUJkTlgrVkJYbkZHZW9waEwwTFZDbWVrQXczR3Rq?=
 =?utf-8?B?Qk5ZcklRdVBrZVR2QS9tZWdzWitNdlVhRHI0cjEzNEg4aGNiMGM1SERrSFk0?=
 =?utf-8?B?d3FWdFZMd29ZMU5uV0pmMFlNT09RQXk3UTVYT1BuMjdsZFgvczlBWFdSZWd2?=
 =?utf-8?B?bFFkOU5qZVBjanBOOEs4VnJzMFVISEpnVHNHQThESUtnRG5vV1JsNnZoNU8w?=
 =?utf-8?B?a0FqNTZFRklGMndTUTc4bS9VSTVlNjljVEpxRm5acXlLaVpwS2QyZkxHOVFH?=
 =?utf-8?B?Q1E0bi82bDc2SkNVSFFjQU1iWm1pUEhlZ3FJNmhXbVpWS2pldnhSdmpFUmJB?=
 =?utf-8?B?SGprbjQ1ZzNFRzVsMVdvYk9ET09iQk8zZVFXY0hMbExxbDRqczRPNzJrOUNT?=
 =?utf-8?Q?Xqg1rcUvGZsFYACJqTjofJS9mkCzeLV2hWHP0qnNSiXT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1291E819449A934E971B142A63A998F4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741689b7-2d93-4c2b-5a01-08de317c8dd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 08:26:55.8630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w/2tk7hvT/8beB7XIl6BeapNO9ojS6b7MHJLe2mVYWM8QC2qq2wUwugKAabpwrxTgAtXYhnEhyeny9ItThHJIQumx9S7j+X5M7vFOsZ1dxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7404
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

T24gTW9uLCAyMDI1LTEyLTAxIGF0IDA5OjAxICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBUaGlzIHRlc3QgbWVhc3VyZXMgbGF0ZW5jeSBhbmQgYmFuZHdpZHRoIGZvciBidWZm
ZXIgYWNjZXNzIGZyb20gZWFjaA0KPiBHUFUNCj4gYW5kIHRoZSBDUFUgaW4gYSBtdWx0aS1HUFUg
U1ZNIGVudmlyb25tZW50LiBJdCBjb21wYXJlcyBwZXJmb3JtYW5jZQ0KPiBmb3INCj4gbG9jYWwg
dmVyc3VzIHJlbW90ZSBhY2Nlc3MgdXNpbmcgbWFkdmlzZSBhbmQgcHJlZmV0Y2ggdG8gY29udHJv
bA0KPiBidWZmZXINCj4gcGxhY2VtZW50DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaXNoaXQgU2hh
cm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgdGVzdHMvaW50ZWwveGVf
bXVsdGlfZ3B1c3ZtLmMgfCAyNDQNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyNDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX211bHRpX2dwdXN2bS5jDQo+IGIvdGVz
dHMvaW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gaW5kZXggNjE2Njc5NWIzLi5lZmUzZGIwOTkg
MTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX211bHRpX2dwdXN2bS5jDQo+ICsrKyBiL3Rl
c3RzL2ludGVsL3hlX211bHRpX2dwdXN2bS5jDQo+IEBAIC0xMyw2ICsxMyw4IEBADQo+IMKgI2lu
Y2x1ZGUgImludGVsX21vY3MuaCINCj4gwqAjaW5jbHVkZSAiaW50ZWxfcmVnLmgiDQo+IMKgDQo+
ICsjaW5jbHVkZSAidGltZS5oIg0KPiArDQo+IMKgI2luY2x1ZGUgInhlL3hlX2lvY3RsLmgiDQo+
IMKgI2luY2x1ZGUgInhlL3hlX3F1ZXJ5LmgiDQo+IMKgI2luY2x1ZGUgInhlL3hlX3V0aWwuaCIN
Cj4gQEAgLTY0LDYgKzY2LDI2IEBADQo+IMKgICoJVGVzdCBjb25jdXJyZW50IHdyaXRlIHJhY2Ug
Y29uZGl0aW9ucyB3aXRoIHByZWZldGNoIHRvDQo+IHZlcmlmeSBjb2hlcmVuY3kNCj4gwqAgKgli
ZWhhdmlvciBhbmQgbWVtb3J5IG1pZ3JhdGlvbiB3aGVuIG11bHRpcGxlIEdQVXMgY29tcGV0ZSBm
b3INCj4gc2FtZSBsb2NhdGlvbg0KPiDCoCAqDQo+ICsgKiBTVUJURVNUOiBtZ3B1LWxhdGVuY3kt
YmFzaWMNCj4gKyAqIERlc2NyaXB0aW9uOg0KPiArICoJTWVhc3VyZSBiYXNpYyBjcm9zcy1HUFUg
bWVtb3J5IGFjY2VzcyBsYXRlbmN5IHdoZXJlIG9uZSBHUFUNCj4gd3JpdGVzDQo+ICsgKglhbmQg
YW5vdGhlciBHUFUgcmVhZHMgd2l0aG91dCBwcmVmZXRjaCB0byBldmFsdWF0ZSByZW1vdGUNCj4g
YWNjZXNzIG92ZXJoZWFkDQo+ICsgKg0KPiArICogU1VCVEVTVDogbWdwdS1sYXRlbmN5LXByZWZl
dGNoDQo+ICsgKiBEZXNjcmlwdGlvbjoNCj4gKyAqCU1lYXN1cmUgY3Jvc3MtR1BVIG1lbW9yeSBh
Y2Nlc3MgbGF0ZW5jeSB3aXRoIGV4cGxpY2l0DQo+IHByZWZldGNoIHRvDQo+ICsgKglldmFsdWF0
ZSBtZW1vcnkgbWlncmF0aW9uIG92ZXJoZWFkIGFuZCBsb2NhbCBhY2Nlc3MNCj4gcGVyZm9ybWFu
Y2UNCj4gKyAqDQo+ICsgKiBTVUJURVNUOiBtZ3B1LWxhdGVuY3ktY29weS1iYXNpYw0KPiArICog
RGVzY3JpcHRpb246DQo+ICsgKglNZWFzdXJlIGxhdGVuY3kgb2YgY3Jvc3MtR1BVIG1lbW9yeSBj
b3B5IG9wZXJhdGlvbnMgd2hlcmUNCj4gb25lIEdQVQ0KPiArICoJY29waWVzIGRhdGEgZnJvbSBh
bm90aGVyIEdQVSdzIG1lbW9yeSB3aXRob3V0IHByZWZldGNoDQo+ICsgKg0KPiArICogU1VCVEVT
VDogbWdwdS1sYXRlbmN5LWNvcHktcHJlZmV0Y2gNCj4gKyAqIERlc2NyaXB0aW9uOg0KPiArICoJ
TWVhc3VyZSBsYXRlbmN5IG9mIGNyb3NzLUdQVSBtZW1vcnkgY29weSBvcGVyYXRpb25zIHdpdGgN
Cj4gcHJlZmV0Y2gNCj4gKyAqCXRvIGV2YWx1YXRlIGNvcHkgcGVyZm9ybWFuY2Ugd2l0aCBtZW1v
cnkgbWlncmF0aW9uIHRvIGxvY2FsDQo+IFZSQU0NCj4gKyAqDQo+IMKgICovDQo+IMKgDQo+IMKg
I2RlZmluZSBNQVhfWEVfUkVHSU9OUwk4DQo+IEBAIC04MSwxMiArMTAzLDE2IEBADQo+IMKgI2Rl
ZmluZSBNVUxUSUdQVV9BVE9NSUNfT1AJCUJJVCgzKQ0KPiDCoCNkZWZpbmUgTVVMVElHUFVfQ09I
X09QCQkJQklUKDQpDQo+IMKgI2RlZmluZSBNVUxUSUdQVV9DT0hfRkFJTAkJQklUKDUpDQo+ICsj
ZGVmaW5lIE1VTFRJR1BVX1BFUkZfT1AJCUJJVCg2KQ0KPiArI2RlZmluZSBNVUxUSUdQVV9QRVJG
X1JFTV9DT1BZCQlCSVQoNykNCj4gwqANCj4gwqAjZGVmaW5lIElOSVQJMg0KPiDCoCNkZWZpbmUg
U1RPUkUJMw0KPiDCoCNkZWZpbmUgQVRPTUlDCTQNCj4gwqAjZGVmaW5lIERXT1JECTUNCj4gwqAN
Cj4gK3N0cnVjdCB0aW1lc3BlYyB0X3N0YXJ0LCB0X2VuZDsNCj4gKw0KPiDCoHN0cnVjdCB4ZV9z
dm1fZ3B1X2luZm8gew0KPiDCoAlib29sIHN1cHBvcnRzX2ZhdWx0czsNCj4gwqAJaW50IHZyYW1f
cmVnaW9uc1tNQVhfWEVfUkVHSU9OU107DQo+IEBAIC0xMzEsNiArMTU3LDExIEBAIHN0YXRpYyB2
b2lkIGdwdV9jb2hlcmVjeV90ZXN0X3dyYXBwZXIoc3RydWN0DQo+IHhlX3N2bV9ncHVfaW5mbyAq
c3JjLA0KPiDCoAkJCQnCoMKgwqDCoMKgIHN0cnVjdA0KPiBkcm1feGVfZW5naW5lX2NsYXNzX2lu
c3RhbmNlICplY2ksDQo+IMKgCQkJCcKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGZsYWdzKTsNCj4g
wqANCj4gK3N0YXRpYyB2b2lkIGdwdV9sYXRlbmN5X3Rlc3Rfd3JhcHBlcihzdHJ1Y3QgeGVfc3Zt
X2dwdV9pbmZvICpzcmMsDQo+ICsJCQkJwqDCoMKgwqAgc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAq
ZHN0LA0KPiArCQkJCcKgwqDCoMKgIHN0cnVjdA0KPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3Rh
bmNlICplY2ksDQo+ICsJCQkJwqDCoMKgwqAgdW5zaWduZWQgaW50IGZsYWdzKTsNCj4gKw0KPiDC
oHN0YXRpYyB2b2lkDQo+IMKgY3JlYXRlX3ZtX2FuZF9xdWV1ZShzdHJ1Y3QgeGVfc3ZtX2dwdV9p
bmZvICpncHUsIHN0cnVjdA0KPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+
IMKgCQnCoMKgwqAgdWludDMyX3QgKnZtLCB1aW50MzJfdCAqZXhlY19xdWV1ZSkNCj4gQEAgLTIy
MCw2ICsyNTEsMTEgQEAgc3RhdGljIHZvaWQgZm9yX2VhY2hfZ3B1X3BhaXIoaW50IG51bV9ncHVz
LA0KPiBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpncHVzLA0KPiDCoA0KPiDCoHN0YXRpYyB2b2lk
IG9wZW5fcGFnZW1hcHMoaW50IGZkLCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICppbmZvKTsNCj4g
wqANCj4gK3N0YXRpYyBkb3VibGUgdGltZV9kaWZmKHN0cnVjdCB0aW1lc3BlYyAqc3RhcnQsIHN0
cnVjdCB0aW1lc3BlYw0KPiAqZW5kKQ0KPiArew0KPiArCXJldHVybiAoZW5kLT50dl9zZWMgLSBz
dGFydC0+dHZfc2VjKSArIChlbmQtPnR2X25zZWMgLQ0KPiBzdGFydC0+dHZfbnNlYykgLyAxZTk7
DQo+ICt9DQo+ICsNCj4gwqBzdGF0aWMgdm9pZA0KPiDCoGF0b21pY19iYXRjaF9pbml0KGludCBm
ZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90IHNyY19hZGRyLA0KPiDCoAkJwqAgdWludDMyX3QgKmJv
LCB1aW50NjRfdCAqYWRkcikNCj4gQEAgLTM3MCw2ICs0MDYsMzkgQEAgbWdwdV9jaGVja19mYXVs
dF9zdXBwb3J0KHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8NCj4gKmdwdTEsDQo+IMKgCXJldHVybiBy
ZXQ7DQo+IMKgfQ0KPiDCoA0KPiArc3RhdGljIHZvaWQNCj4gK3N0b3JlX2R3b3JkX2JhdGNoX2lu
aXRfNGsoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0X3Qgc3JjX2FkZHIsDQo+ICsJCQnCoCB1
aW50MzJfdCAqYm8sIHVpbnQ2NF90ICphZGRyLCBpbnQgdmFsdWUpDQo+ICt7DQo+ICsJaW50IG1h
eF9jbWRzID0gKDQwOTYgLSBzaXplb2YodWludDMyX3QpKSAvIDE2Ow0KU1pfNEsNCj4gKwl1aW50
MzJfdCBiYXRjaF9ib19zaXplID0gQkFUQ0hfU0laRShmZCk7DQo+ICsJdWludDMyX3QgYmF0Y2hf
Ym87DQo+ICsJdWludDY0X3QgYmF0Y2hfYWRkcjsNCj4gKwl2b2lkICpiYXRjaDsNCj4gKwl1aW50
MzJfdCAqY21kOw0KPiArCWludCBpID0gMDsNCj4gKw0KPiArCWJhdGNoX2JvID0geGVfYm9fY3Jl
YXRlKGZkLCB2bSwgYmF0Y2hfYm9fc2l6ZSwNCj4gdnJhbV9pZl9wb3NzaWJsZShmZCwgMCksIDAp
Ow0KPiArCWJhdGNoID0geGVfYm9fbWFwKGZkLCBiYXRjaF9ibywgYmF0Y2hfYm9fc2l6ZSk7DQo+
ICsJY21kID0gKHVpbnQzMl90ICopYmF0Y2g7DQo+ICsNCj4gKwlmb3IgKGludCBqID0gMDsgaiA8
IG1heF9jbWRzOyBqKyspIHsNCj4gKwkJdWludDY0X3Qgb2Zmc2V0ID0gc3JjX2FkZHIgKyBqICog
NDsNCj4gKw0KPiArCQljbWRbaSsrXSA9IE1JX1NUT1JFX0RXT1JEX0lNTV9HRU40Ow0KPiArCQlj
bWRbaSsrXSA9IG9mZnNldDsNCj4gKwkJY21kW2krK10gPSBvZmZzZXQgPj4gMzI7DQo+ICsJCWNt
ZFtpKytdID0gdmFsdWU7DQo+ICsJfQ0KPiArCWNtZFtpKytdID0gTUlfQkFUQ0hfQlVGRkVSX0VO
RDsNCj4gKw0KPiArCWJhdGNoX2FkZHIgPSB0b191c2VyX3BvaW50ZXIoYmF0Y2gpOw0KPiArDQo+
ICsJeGVfdm1fYmluZF9scl9zeW5jKGZkLCB2bSwgYmF0Y2hfYm8sIDAsIGJhdGNoX2FkZHIsDQo+
IGJhdGNoX2JvX3NpemUsIDApOw0KPiArCSpibyA9IGJhdGNoX2JvOw0KPiArCSphZGRyID0gYmF0
Y2hfYWRkcjsNCj4gK30NCg0KSG1tLiBJdCBsb29rcyB0byBtZSB0aGF0IHdlJ3JlIGNyZWF0aW5n
IGEgNEsgYmF0Y2ggYnVmZmVyIHRoYXQgd3JpdGVzDQoxSyBvZiBkYXRhPw0KDQpJc24ndCB0aGUg
aW50ZW50aW9uIHRvIHRpbWUgdGhlIHdyaXRpbmcgb2YgdGhlIGRhdGE/IEkgdGhpbmsgbm93IG1v
c3QNCm9mIHRoZSBsYXRlbmN5IGlzIGNvbWluZyBmcm9tIHJlYWRpbmcgdGhlIDRLIGJhdGNoIGJ1
ZmZlcj8gV2hhdCB3YXMgdGhlDQppbnRlbnRpb24gaGVyZT8NCg0KL1Rob21hcw0KDQo=
