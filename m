Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37064C021B5
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 04:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A2510E051;
	Mon, 24 Feb 2025 04:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUmQFyGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB1C10E051
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 04:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740371101; x=1771907101;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XoAwOoPDLnT2rOrBn0jy+SbQuYUAslT6IPqxTt4a/Cs=;
 b=iUmQFyGPAElNy5u5MVX6QzonV6bF0k6CdAdvslq+QkQSyKM2P6KLL8aw
 6gBpgU6dTRsIHJCXssyRPoM9prTRxUaq0CDVub09xK5BhU+fthI9OQli0
 0/g2BoBkP/ySWLHtLRUTox9HPgutjTj3+pYddH6tAuQmoiJ9VwniFFq2G
 8cdTyGEEK9RXhRqxIfd3fAMgOpON7VoMoNPHYSs6yZInu/ecEXtUmyn7o
 AKoQeNB7KpFitXEj/rFzcRnHDqS20ijQFnTEIhAK0lCEKVgVdKP8hMVeY
 ckoT2Zb7wDFWrh0yIRnuokOHKm/KrL8A7nkmDXaHgsiY5Vn+LI5ijjEfm w==;
X-CSE-ConnectionGUID: IEgdPyFcQ2W2FVGHJ5/gmA==
X-CSE-MsgGUID: U5XjAp2yQP+D8bKByuxd2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41375746"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41375746"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 20:24:57 -0800
X-CSE-ConnectionGUID: KhIdJS+yR7qsUYgtgjdUBg==
X-CSE-MsgGUID: 6GCi5W7zQRCNEM+hqy+kDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="120918332"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2025 20:24:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 23 Feb 2025 20:24:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 23 Feb 2025 20:24:57 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Feb 2025 20:24:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJ182fkgR66BXOIz59VOc4iv+708ZfjyQ7u/u+a476fihVxMLuJNpPeHk+KJaALY9wdbGNUJ+ZNuSqYs/TeMUUAFr/SZnqxX3xU4hXMQC9yTcHEZCXWnTXUYlHpZ7VtDASPbmx8eDZSG26VMFlvh8vQbpEHef/ZUxWiAY9r3HAbJRpj5je6ZW63kFKkH17UPBSpuS2EB+KxXXB5uPXp3J7Zr5LdAU61m2IuOjmGnM9x1Gxwo+jjxKo7f+dCB2vi+HcloFZEFuvfzUOeuCkR4kGdQvob0WbPHsji1r5obPRDJz9FajBponfgwN3HMCej9KPX02LRHQLPKLwTqyk3upA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoAwOoPDLnT2rOrBn0jy+SbQuYUAslT6IPqxTt4a/Cs=;
 b=SHDotNmD4to0lzkeIC3Rfc6R3ga0LvVBkWkvbP7ONaQj212FERnmSjJ9N3QNOFLYJn9zpWBI2LmLgXQNDRBNRriKRVO25/M4uoQRKmyltl59nYo3Ym6CvAceqeIB1HRDGzGnc+Qf4Jy7UZL6xHW2Wysyn1fzBIFMD6B914A6ePOkgb2fXsW8kbShl1+zkGoTAMZVhOfgSMC957KLwh9V3Mhcx07o7tm3nfx3ZBuV51B6DZ6/34MLB+4XwuwlXSRARvxX81WGxjC/9vvFsDKtc7rrFVrmgdH8n/1FaJbDMiw9hm1QaalrgrIDr2Y44O7V1MJiRPAR/XniSiD9k8TCAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6301.namprd11.prod.outlook.com (2603:10b6:208:3c3::8)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 24 Feb
 2025 04:24:51 +0000
Received: from MN0PR11MB6301.namprd11.prod.outlook.com
 ([fe80::9937:be81:6c0:505e]) by MN0PR11MB6301.namprd11.prod.outlook.com
 ([fe80::9937:be81:6c0:505e%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 04:24:50 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/kms_display_modes: Remove negative test for
 extended display
Thread-Topic: [PATCH i-g-t] tests/kms_display_modes: Remove negative test for
 extended display
Thread-Index: AQHbg4NYC11NaUMOBECzK7D6TsevQbNV4Mrw
Date: Mon, 24 Feb 2025 04:24:50 +0000
Message-ID: <MN0PR11MB6301090A5BE2795767CB50A290C02@MN0PR11MB6301.namprd11.prod.outlook.com>
References: <20250220103640.44879-1-mohammed.thasleem@intel.com>
In-Reply-To: <20250220103640.44879-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6301:EE_|CY8PR11MB7268:EE_
x-ms-office365-filtering-correlation-id: dab3efa1-7e12-4173-bcc7-08dd548b2e27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MFozaWJ2RGJ5dVl2VExzTnUxZXZaemlTRXc2ZVE3OTBSMC9BSmNiZW45YWhs?=
 =?utf-8?B?WE8vN2J2MVYzamQzM3BKbUxHZkFKdHVtcVFsV0k4dTBQUHBCYjF4Vkova0I5?=
 =?utf-8?B?VWlyQ2grbUJNeDFPaVVhRjgwdHVwanFrdW1RVUE2bUhKUTFvNkZkbzV3c1N3?=
 =?utf-8?B?RElOQVRjUzgzTFEzcUR5SXo4YmxYNlQ4NmZNbCthVy9lRFJTRUg1cVE2MnRZ?=
 =?utf-8?B?aHpqU2YxWXM4L2dJOVBjZlY2S25EZEFXcGxhNWdnRzRPUFVRdlFlVkhSYzhJ?=
 =?utf-8?B?WkFIU2ZlUWh3Y0RDZHVidGpuaWR3c05ES2dNMW5IODkxcGxlSUVJNkhWaWMw?=
 =?utf-8?B?ci9mbVRKVDZjZkVHdDN1Z3NFSXJZb1NDTHpzdzdNODZ4a1RFOW1PQnZnMThR?=
 =?utf-8?B?TDFZc0lnMldvTW4rcnJQdXFTblovajFkRjAwSFNNRzhJQ1NxK1g1L0JmRHhF?=
 =?utf-8?B?K3ZaYWdvZG4zdmdHOWNvaVYra1RNei8vVTdnbXgyQ280UWN5MVhab1RFdGF0?=
 =?utf-8?B?dy9OWEJHZkFGQTBGTFh4V3AwQjFOU1ZoYlVGWkF4aTQ0ZWk0bWpINnR1UGcw?=
 =?utf-8?B?VTFlbTJYZXpwNDlYTC9NNUZEZEpTNVJ2UWZGdWsxdW91UG4rSHMyMWJxaHRv?=
 =?utf-8?B?S2lMRzU2MzdCcDU0VVNIZ0dBWHowWlBRWjFvQklMY0dyeDNYNGpuTXl3Ymo3?=
 =?utf-8?B?TnZXSmVyOXZTWnJzTmFuL3ZMMjAvK1k0eVZhWTY5L2hyZnh6cXpLRDArOG5B?=
 =?utf-8?B?UDVHRCs4Zm9lZXdpSDA1SElEajNiMEZUbzdIcVQxeFlPT0FHd2k5cmoybi9w?=
 =?utf-8?B?N0U5ZUt3NENoZGR5dGlvZzc3bXRWZ3V4bXpUdXYrdHFZUUVKYmNpdHQxK0RV?=
 =?utf-8?B?ZklVcm5IUTA3a3BHNUpzR0lSUGpnUHdRT3pwc3piTWc4cisyUDJIWFNaM1ly?=
 =?utf-8?B?OUJtZ2s4TUVLb0NGMC9zWmZ6eThtdWtac3FGUmFKNHlxdzg5T3J3WmZaRW14?=
 =?utf-8?B?d1NvU0h3UFpGMi9EVnpFcGpLdTVvU3JLemNOQ2tPdHJJWUVGNjV6UlkwcU4w?=
 =?utf-8?B?RnFpbk5vb2pGSXMrTDhFczRJU2JRTEIvNzIvR0J5dHg0d1dqZHUwSUswWDJ3?=
 =?utf-8?B?L09pMjBXWUxsZERmbi9RbjJCaXFuajhGTkdmcm9ZOXByQXFaK1QzRC9MWklq?=
 =?utf-8?B?d09lSVYrRVdxZzBmQ1hOc3hIS1c0Rno0OTBYeC9JMjBCK2FEQmREZEJxWE9v?=
 =?utf-8?B?Rm00OUVOWGpxZys5ZlZoV3FSY0thREZwNGN6eDZuMlUwNWpEbFhEN3V2RmJu?=
 =?utf-8?B?cEFoRnBkWk92SG0vRlhITWNpZXVtekhNQ0J6SjA1NzV3WkJ6VEpOcWF5UDFY?=
 =?utf-8?B?aXNMaUt2clUvZHQva0hNVlhDS08xVS9xVHVVT2x0bXhLUFY2WXhOdSs3SkFY?=
 =?utf-8?B?UzVGcmFnUTU1aGpmOFVtQ2g1Ym9vRGluYkgwZVMzcXFqS1FYNmlsZ1plaE1m?=
 =?utf-8?B?YzdTQ2txM21hNFg4aU11eHdZdXcxdWdITWpBSjVKVmVSZHA3RzlVd1VKY1lP?=
 =?utf-8?B?QmR2RWRXRkZTV0EvMGlHZlhqQjVxVFRXV09KMDlOT0RRUHJ1QjlpRGROV1Iz?=
 =?utf-8?B?dFRBZythOVVNOENMV2prYURXcHpEeXZVRWVhQWJVUWZ3MUtKTVNrSXBqS01R?=
 =?utf-8?B?aFRhdkpOTDFGUGJmSW9WdlkvNUkyRWpRNlZFdkJkQktpbHB4cjJCL1NWWkM1?=
 =?utf-8?B?MlJnOWM2WlUyRTAwWTVQNXN5N3Z4RFB2TVdKcUVCaWpySXhCVHJXbVJFYll1?=
 =?utf-8?B?MDNoUFZhcmRpZkI1Q21SanFDcDZyQ0QwYVQvWDBPVTVNS1dJKzkrZW1iT09a?=
 =?utf-8?B?UTUzdG90WGJDZU10Ymx6Wm83d0NQSldwWjFJb29ZTUh2YXV2c3hZc21IRjlY?=
 =?utf-8?Q?nv+n9Om21j2zLpbxL9/FAh6ChmnT2CoZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6301.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDM0ejh4b1RENHdSRURXQ0x6WmQwTmRXcXlzNkg2S1dqNU1pby80c1RKQldW?=
 =?utf-8?B?aC9CNXVxS1RZZWorc2lzRlFSU21QaFNvNHhrb2ZjWDVraERrZWQwNnhTbFNt?=
 =?utf-8?B?c3RST3ZablltTG91eE9ocGVGSzJ2QW9TdEl2bmpHT0lEWFhuV3RrREM1eUZn?=
 =?utf-8?B?TnVEL2ZUcVpLalBMVjIxUng5dmJIVXpRR2wzME92UzR0MjRHa0kzTVNDdXV6?=
 =?utf-8?B?UXB4OHRrVGJmd0J6bHluMjFvWGNsd2hzdkhqQ0ZrT0UvM0x1bllLM3pxZW5x?=
 =?utf-8?B?aDFrbGR1ZVBFMXlPZW9LcFl4cFFjRmpXcjE2R25aVzBWTXloMXMrZUZ3cTlt?=
 =?utf-8?B?cEFrL1hseUduaWNhb0FKcDVUYjc1cllrSktUUzV5NGNHNWVzeTh0azFnSVZR?=
 =?utf-8?B?T1ZWRlBuaWcrNmt1VDFMaDVlZnVPYTBwTUVzZXFUclZxQlgzU09pSko4b2l5?=
 =?utf-8?B?bjhMZUZqSXZydjRxcHdlNmpZYUdEdDlySE5NSTJDRWFyVzVuYm1uWmlRdjBa?=
 =?utf-8?B?Q1hXN1ZDVGFwcGhpSmtVQUw1cG1JcXRpRWNiSDk0NXg2NVRBbGh4eGhFbUZp?=
 =?utf-8?B?NlN6a2JjVEQ5MS82NVd5WmxHYW9hS3REMTgwZ3lYMkRzVjFvN1hrU29obGM2?=
 =?utf-8?B?WGpMT3JZOWRpVkl3OVNGZVF0b2l5MmtNVUc0Mk1JaEdnM2J1MWtHc29CbDFz?=
 =?utf-8?B?bjJDazhUVkQvUkVuOHpCN1lsZmt6aGVia2Fic2M4b0MzM201cXJNOHNyVktE?=
 =?utf-8?B?TGxlYnVubFRuUlNxRWx4dFlFd09Wek05SmF2dWRnNmJsL2RXdTFnQ1JaN3dU?=
 =?utf-8?B?NXdUV05qMzVYazFoMDRxbVc1UWVXSjdwWTVKTlArbzhmMEFBdkZWY3VtQUEw?=
 =?utf-8?B?UWRuOFVpNVBhVXhmakw4alJTclFITG5hS0RxRmlvMlViR05scEdJc0ZZejRU?=
 =?utf-8?B?MnRDdzZNdzdURXNseU94aUVyUndQZUpia3h1MmZETWk4YlFudzA1V1orU2U3?=
 =?utf-8?B?TERDbWxwSDVkUThTVVRaZ0UzTVUxN0FuT1FrMTlvb0pXN2tzMzhXN0c5aGFT?=
 =?utf-8?B?S0JDRElxa2lVanpzUkNMbVhNdy82bXJqSmFyZks4aDJuSXZuVGsrRGdZMEFh?=
 =?utf-8?B?TFl6UEVFcnpudGhSRTNkZmNneFd1NGpOQWFVaGtpTVh6WXB6YzVSUWQ4Wjho?=
 =?utf-8?B?S1orWUhaL29oR05mSWxidlV3TDVweE1BWnJlcXFDRldwZGp2ZnZPMlI5WUhF?=
 =?utf-8?B?NFpoRU0vdVNMQVFRZWJ2QWFWckdvdXVjSUNPODh6NWE4OWhzV0FvaThURmZy?=
 =?utf-8?B?aXJFUUZGNVdKVVZ5M1RCci81SXZkVCtQZUR6U09OMXRMMWNvd0dmekRSeEJr?=
 =?utf-8?B?S2FZY0VyaFlONWE4RnNieTVpUmkzM1dNTEtrZEpzVjJNZGhPc3hBbnpiYzcy?=
 =?utf-8?B?V3U0TWxSQnpZQUtKVXBmQnNuUjRUbm5ueENtK2ppbmp3R2xSWVdiYktHeFFj?=
 =?utf-8?B?cnpWSEZNaTcwU3pYcFhyY3dQbTFDVmxoR3R3N0Rtb2h5c1d3KytMRWs5Ui8w?=
 =?utf-8?B?dE8zeDFkS3lYdXZQZHNCQzBsREU3S1oyb3FQR1FwK1dqanMyNkRUSHVUcGp3?=
 =?utf-8?B?Q2hsWlM5OHk4NlFzeURpSEhYVjEwSzhDSjRDYm9ySXFlYWNNRmFsWUFocWJE?=
 =?utf-8?B?dm00NkNLNVBWYU9EZDBad0RwZWxrOWtrZXR5NnFxU3ZLWkxOcGhYOEdNOHZI?=
 =?utf-8?B?RDdDRHE2OHJqa1Z6M1YzZWxyUlRhL1VPbzdURUhJQy9Vd0JGTWVjZTBhSk45?=
 =?utf-8?B?OVBUaTNiaGtSUCtHcys0SDFoRjVEWk9SeTJuTjBoQytqS2VDZUxmWkpqSTBk?=
 =?utf-8?B?MGZ4Q1owNFVwbk10ZGJ2VVFwTHFHSTltK1pFTUdQM2FIa2tOaDl6cXl0dFp1?=
 =?utf-8?B?MnFkZ1NzUDRxNHc0MlpYWk1xUlUzTGYrTUJVdm1yVHlZZWtWdVQvWnV2YXlR?=
 =?utf-8?B?RVVqcWVrZWlCZEhWamNQL2Jucy94VldHejF0MVRhaXBUaGF2VExaQ2tCZjY5?=
 =?utf-8?B?aThFWm5IdnF1eWgrNC9DRmltMHBYMG8rN2ZBU1JZZW5qUzVZTXdYcHBsKzhw?=
 =?utf-8?Q?WQKI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6301.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab3efa1-7e12-4173-bcc7-08dd548b2e27
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 04:24:50.7399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xfVZXBdYVX++OdXr1/rFAOqecGtOtLnramTJ9Lo335eDb80ZSXL7qMb08GyeGCLEpoYfKDfaWsA2f6I7e7/KhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
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

V2lsbCB0aGlzIGhvbGQgZ29vZCBmb3Igb2xkZXIgcGxhdGZvcm1zIHN0aWxsPyANCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaGFzbGVlbSwgTW9oYW1tZWQgPG1vaGFt
bWVkLnRoYXNsZWVtQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDIwLCAy
MDI1IDQ6MDcgUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBC
LCBKZWV2YW4gPGplZXZhbi5iQGludGVsLmNvbT47IFRoYXNsZWVtLCBNb2hhbW1lZA0KPiA8bW9o
YW1tZWQudGhhc2xlZW1AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIHRlc3Rz
L2ttc19kaXNwbGF5X21vZGVzOiBSZW1vdmUgbmVnYXRpdmUgdGVzdCBmb3INCj4gZXh0ZW5kZWQg
ZGlzcGxheQ0KPiANCj4gVGhpcyBuZWdhdGl2ZSB0ZXN0IHdhcyBjcmF0ZWQgdG8gdmFsaWRhdGUg
RU5PU1BDIHdoZW4gdHdvIDJrLTRrIG9yIDRrLTRrDQo+IG1vbml0b3JzIGNvbm5lY3RlZCB0aHJv
dWdoIE1TVCB0byBjb3ZlciBiYW5kd2lkdGggaXNzdWUgaW4gTVNUIGNvbmZpZy4NCj4gDQo+IEJ1
dCBpdCB3aWxsIG5vdCBoZWxwZnVsdCB0byBoYW5kbGUgY3VycmVudCBiYW5kd2lkdGggd2hpY2gg
YXJlIERpc3BsYXlQb3J0IChEUCkNCj4gMS40IHN1cHBvcnRzIGEgdG90YWwgYmFuZHdpZHRoIG9m
IDQgw5cgOC4xIEdicHMuDQo+IA0KPiBIb3dldmVyLCB3aXRoIERQIDIuMSwgdGhlIGJhbmR3aWR0
aCBhbGxvY2F0aW9uIHN0cmF0ZWd5IGhhcyBzaWduaWZpY2FudGx5DQo+IGNoYW5nZWQgdG8gNCDD
lyAyMCBHYnBzIG9mIGF2YWlsYWJsZSBiYW5kd2lkdGguDQo+IFRoaXMgcHJvdmlkZXMgc2lnbmlm
aWNhbnRseSBncmVhdGVyIGRpc3BsYXkgY2FwYWJpbGl0aWVzIHcuci50IGJhbmR3aWR0aC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IE1vaGFtbWVkIFRoYXNsZWVtIDxtb2hhbW1lZC50aGFzbGVlbUBp
bnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMva21zX2Rpc3BsYXlfbW9kZXMuYyB8IDEzNSAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEz
NSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZGlzcGxheV9tb2Rl
cy5jIGIvdGVzdHMva21zX2Rpc3BsYXlfbW9kZXMuYyBpbmRleA0KPiBlNDFjNjBjYzAuLjY2ODQ1
NmY0MyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMva21zX2Rpc3BsYXlfbW9kZXMuYw0KPiArKysgYi90
ZXN0cy9rbXNfZGlzcGxheV9tb2Rlcy5jDQo+IEBAIC00MCw4NyArNDAsMTYgQEANCj4gICAqIERl
c2NyaXB0aW9uOiBUZXN0IGZvciB2YWxpZGF0aW5nIGRpc3BsYXkgZXh0ZW5kZWQgbW9kZSB3aXRo
IGEgcGFpciBvZg0KPiBjb25uZWN0ZWQNCj4gICAqICAgICAgICAgICAgICBkaXNwbGF5cw0KPiAg
ICogRnVuY3Rpb25hbGl0eToga21zX2NvcmUNCj4gLSAqDQo+IC0gKiBTVUJURVNUOiBtc3QtZXh0
ZW5kZWQtbW9kZS1uZWdhdGl2ZQ0KPiAtICogRGVzY3JpcHRpb246IE5lZ2F0aXZlIHRlc3QgZm9y
IHZhbGlkYXRpbmcgZGlzcGxheSBleHRlbmRlZCBtb2RlIHdpdGggYSBwYWlyDQo+IC0gKgkJb2Yg
Y29ubmVjdGVkIDJrLTRrIG9yIDRrLTRrIGRpc3BsYXlzLg0KPiAtICogRnVuY3Rpb25hbGl0eTog
a21zX2NvcmUsIG1zdA0KPiAgICovDQo+IA0KPiAtI2RlZmluZSBIRElTUExBWV80SwkzODQwDQo+
IC0jZGVmaW5lIFZESVNQTEFZXzRLCTIxNjANCj4gLQ0KPiAgSUdUX1RFU1RfREVTQ1JJUFRJT04o
IlRlc3QgRGlzcGxheSBNb2RlcyIpOw0KPiANCj4gIHR5cGVkZWYgc3RydWN0IHsNCj4gIAlpbnQg
ZHJtX2ZkOw0KPiAgCWlndF9kaXNwbGF5X3QgZGlzcGxheTsNCj4gLQlkcm1Nb2RlTW9kZUluZm8g
bW9kZV9tc3RbMl07DQo+IC0JaWd0X291dHB1dF90ICptc3Rfb3V0cHV0WzJdOw0KPiAgCWludCBu
X3BpcGVzOw0KPiAgfSBkYXRhX3Q7DQo+IA0KPiAtLyogR2V0IGhpZ2hlciBtb2RlIHN1cHBvcnRl
ZCBieSBwYW5lbC4gKi8gLXN0YXRpYyBkcm1Nb2RlTW9kZUluZm8NCj4gKmdldF9oaWdocmVzX21v
ZGUoaWd0X291dHB1dF90ICpvdXRwdXQpIC17DQo+IC0JZHJtTW9kZUNvbm5lY3RvciAqY29ubmVj
dG9yID0gb3V0cHV0LT5jb25maWcuY29ubmVjdG9yOw0KPiAtCWRybU1vZGVNb2RlSW5mbyAqaGln
aGVzdF9tb2RlID0gTlVMTDsNCj4gLQ0KPiAtCWlndF9zb3J0X2Nvbm5lY3Rvcl9tb2Rlcyhjb25u
ZWN0b3IsIHNvcnRfZHJtX21vZGVzX2J5X3Jlc19kc2MpOw0KPiAtCWhpZ2hlc3RfbW9kZSA9ICZj
b25uZWN0b3ItPm1vZGVzWzBdOw0KPiAtDQo+IC0JcmV0dXJuIGhpZ2hlc3RfbW9kZTsNCj4gLX0N
Cj4gLQ0KPiAtLyogR2V0IHRoZSA0ayBvciBsZXNzIHRoZW4gNGsgbW9kZSBvZiBjb25uZWN0ZWQg
cGFuZWwuICovIC1zdGF0aWMNCj4gZHJtTW9kZU1vZGVJbmZvICpnZXRfbW9kZShpZ3Rfb3V0cHV0
X3QgKm91dHB1dCkgLXsNCj4gLQlpbnQgajsNCj4gLQlkcm1Nb2RlTW9kZUluZm8gKnJlcXVpcmVk
X21vZGUgPSBOVUxMOw0KPiAtCWRybU1vZGVDb25uZWN0b3IgKmNvbm5lY3RvciA9IG91dHB1dC0+
Y29uZmlnLmNvbm5lY3RvcjsNCj4gLQ0KPiAtCXJlcXVpcmVkX21vZGUgPSBpZ3Rfb3V0cHV0X2dl
dF9tb2RlKG91dHB1dCk7DQo+IC0JaWYgKHJlcXVpcmVkX21vZGUtPnZkaXNwbGF5IDw9IFZESVNQ
TEFZXzRLICYmDQo+IC0JICAgIHJlcXVpcmVkX21vZGUtPmhkaXNwbGF5IDw9IEhESVNQTEFZXzRL
KSB7DQo+IC0JCXJldHVybiByZXF1aXJlZF9tb2RlOw0KPiAtCX0NCj4gLQ0KPiAtCS8qIElmIGRl
ZmF1bHQgbW9kZSBub3QgNGsgb3IgbGVzcyB0aGFuIDRrIG1vZGUsIHRoZW4gc29ydCBtb2RlcyBh
bmQNCj4gY2hlY2sgZm9yIGl0LiAqLw0KPiAtCWlndF9zb3J0X2Nvbm5lY3Rvcl9tb2Rlcyhjb25u
ZWN0b3IsIHNvcnRfZHJtX21vZGVzX2J5X3Jlc19kc2MpOw0KPiAtCWZvciAoaiA9IDA7IGogPCBj
b25uZWN0b3ItPmNvdW50X21vZGVzOyBqKyspIHsNCj4gLQkJaWYgKGNvbm5lY3Rvci0+bW9kZXNb
al0udmRpc3BsYXkgPD0gVkRJU1BMQVlfNEsgJiYNCj4gLQkJICAgIGNvbm5lY3Rvci0+bW9kZXNb
al0uaGRpc3BsYXkgPD0gSERJU1BMQVlfNEspIHsNCj4gLQkJCXJlcXVpcmVkX21vZGUgPSAmY29u
bmVjdG9yLT5tb2Rlc1tqXTsNCj4gLQkJCWJyZWFrOw0KPiAtCQl9DQo+IC0JfQ0KPiAtDQo+IC0J
cmV0dXJuIHJlcXVpcmVkX21vZGU7DQo+IC19DQo+IC0NCj4gLXN0YXRpYyBib29sIG91dHB1dF9p
c19kcF9tc3QoZGF0YV90ICpkYXRhLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCwgaW50IGkpIC17DQo+
IC0JaW50IGNvbm5lY3Rvcl9pZDsNCj4gLQlzdGF0aWMgaW50IHByZXZfY29ubmVjdG9yX2lkOw0K
PiAtDQo+IC0JY29ubmVjdG9yX2lkID0gaWd0X2dldF9kcF9tc3RfY29ubmVjdG9yX2lkKG91dHB1
dCk7DQo+IC0JaWYgKGNvbm5lY3Rvcl9pZCA8IDApDQo+IC0JCXJldHVybiBmYWxzZTsNCj4gLQ0K
PiAtCS8qDQo+IC0JICogRGlzY2FyZGluZyBvdXRwdXRzIG9mIG90aGVyIERQIE1TVCB0b3BvbG9n
eS4NCj4gLQkgKiBUZXN0aW5nIG9ubHkgb24gb3V0cHV0cyBvbiB0aGUgdG9wb2xvZ3kgd2UgZ290
IHByZXZpb3VzbHkNCj4gLQkgKi8NCj4gLQlpZiAoaSA9PSAwKSB7DQo+IC0JCXByZXZfY29ubmVj
dG9yX2lkID0gY29ubmVjdG9yX2lkOw0KPiAtCX0gZWxzZSB7DQo+IC0JCWlmIChjb25uZWN0b3Jf
aWQgIT0gcHJldl9jb25uZWN0b3JfaWQpDQo+IC0JCQlyZXR1cm4gZmFsc2U7DQo+IC0JfQ0KPiAt
DQo+IC0JcmV0dXJuIHRydWU7DQo+IC19DQo+IC0NCj4gIHN0YXRpYyB2b2lkIHJ1bl9leHRlbmRl
ZG1vZGVfYmFzaWMoZGF0YV90ICpkYXRhLA0KPiAgCQkJCSAgIGVudW0gcGlwZSBwaXBlMSwgaWd0
X291dHB1dF90ICpvdXRwdXQxLA0KPiAgCQkJCSAgIGVudW0gcGlwZSBwaXBlMiwgaWd0X291dHB1
dF90ICpvdXRwdXQyKQ0KPiBAQCAtMjc0LDQ2ICsyMDMsOCBAQCBzdGF0aWMgdm9pZCBydW5fZXh0
ZW5kZWRtb2RlX3Rlc3QoZGF0YV90ICpkYXRhKSB7DQo+ICAJfQ0KPiAgfQ0KPiANCj4gLXN0YXRp
YyB2b2lkIHJ1bl9leHRlbmRlZG1vZGVfbmVnYXRpdmUoZGF0YV90ICpkYXRhLCBpbnQgcGlwZTEs
IGludCBwaXBlMikgLXsNCj4gLQlzdHJ1Y3QgaWd0X2ZiIGZic1syXTsNCj4gLQlpZ3RfZGlzcGxh
eV90ICpkaXNwbGF5ID0gJmRhdGEtPmRpc3BsYXk7DQo+IC0JaWd0X3BsYW5lX3QgKnBsYW5lWzJd
Ow0KPiAtCWludCByZXQ7DQo+IC0NCj4gLQlpZ3RfZGlzcGxheV9yZXNldChkaXNwbGF5KTsNCj4g
LQ0KPiAtCWlndF9vdXRwdXRfc2V0X3BpcGUoZGF0YS0+bXN0X291dHB1dFswXSwgcGlwZTEpOw0K
PiAtCWlndF9vdXRwdXRfc2V0X3BpcGUoZGF0YS0+bXN0X291dHB1dFsxXSwgcGlwZTIpOw0KPiAt
DQo+IC0JaWd0X2NyZWF0ZV9jb2xvcl9mYihkYXRhLT5kcm1fZmQsIGRhdGEtPm1vZGVfbXN0WzBd
LmhkaXNwbGF5LA0KPiBkYXRhLT5tb2RlX21zdFswXS52ZGlzcGxheSwNCj4gLQkJCSAgICBEUk1f
Rk9STUFUX1hSR0I4ODg4LA0KPiBEUk1fRk9STUFUX01PRF9MSU5FQVIsIDEsIDAsIDAsICZmYnNb
MF0pOw0KPiAtCWlndF9jcmVhdGVfY29sb3JfZmIoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5tb2RlX21z
dFsxXS5oZGlzcGxheSwNCj4gZGF0YS0+bW9kZV9tc3RbMV0udmRpc3BsYXksDQo+IC0JCQkgICAg
RFJNX0ZPUk1BVF9YUkdCODg4OCwNCj4gRFJNX0ZPUk1BVF9NT0RfTElORUFSLCAwLCAwLCAxLCAm
ZmJzWzFdKTsNCj4gLQ0KPiAtCXBsYW5lWzBdID0gaWd0X3BpcGVfZ2V0X3BsYW5lX3R5cGUoJmRp
c3BsYXktPnBpcGVzW3BpcGUxXSwNCj4gRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSk7DQo+IC0JcGxh
bmVbMV0gPSBpZ3RfcGlwZV9nZXRfcGxhbmVfdHlwZSgmZGlzcGxheS0+cGlwZXNbcGlwZTJdLA0K
PiBEUk1fUExBTkVfVFlQRV9QUklNQVJZKTsNCj4gLQ0KPiAtCWlndF9wbGFuZV9zZXRfZmIocGxh
bmVbMF0sICZmYnNbMF0pOw0KPiAtCWlndF9mYl9zZXRfc2l6ZSgmZmJzWzBdLCBwbGFuZVswXSwg
ZGF0YS0+bW9kZV9tc3RbMF0uaGRpc3BsYXksIGRhdGEtDQo+ID5tb2RlX21zdFswXS52ZGlzcGxh
eSk7DQo+IC0JaWd0X3BsYW5lX3NldF9zaXplKHBsYW5lWzBdLCBkYXRhLT5tb2RlX21zdFswXS5o
ZGlzcGxheSwgZGF0YS0NCj4gPm1vZGVfbXN0WzBdLnZkaXNwbGF5KTsNCj4gLQ0KPiAtCWlndF9w
bGFuZV9zZXRfZmIocGxhbmVbMV0sICZmYnNbMV0pOw0KPiAtCWlndF9mYl9zZXRfc2l6ZSgmZmJz
WzFdLCBwbGFuZVsxXSwgZGF0YS0+bW9kZV9tc3RbMV0uaGRpc3BsYXksIGRhdGEtDQo+ID5tb2Rl
X21zdFsxXS52ZGlzcGxheSk7DQo+IC0JaWd0X3BsYW5lX3NldF9zaXplKHBsYW5lWzFdLCBkYXRh
LT5tb2RlX21zdFsxXS5oZGlzcGxheSwgZGF0YS0NCj4gPm1vZGVfbXN0WzFdLnZkaXNwbGF5KTsN
Cj4gLQ0KPiAtCWlndF9vdXRwdXRfb3ZlcnJpZGVfbW9kZShkYXRhLT5tc3Rfb3V0cHV0WzBdLCAm
ZGF0YS0NCj4gPm1vZGVfbXN0WzBdKTsNCj4gLQlpZ3Rfb3V0cHV0X292ZXJyaWRlX21vZGUoZGF0
YS0+bXN0X291dHB1dFsxXSwgJmRhdGEtDQo+ID5tb2RlX21zdFsxXSk7DQo+IC0NCj4gLQlpZ3Rf
cmVxdWlyZShpbnRlbF9waXBlX291dHB1dF9jb21ib192YWxpZChkaXNwbGF5KSk7DQo+IC0JcmV0
ID0gaWd0X2Rpc3BsYXlfdHJ5X2NvbW1pdDIoZGlzcGxheSwgQ09NTUlUX0FUT01JQyk7DQo+IC0J
aWd0X2Fzc2VydChyZXQgIT0gMCAmJiBlcnJubyA9PSBFTk9TUEMpOw0KPiAtfQ0KPiAtDQo+ICBp
Z3RfbWFpbg0KPiAgew0KPiAtCWludCBkcF9tc3Rfb3V0cHV0cyA9IDAsIGNvdW50ID0gMDsNCj4g
LQllbnVtIHBpcGUgcGlwZTEsIHBpcGUyOw0KPiAgCWlndF9vdXRwdXRfdCAqb3V0cHV0Ow0KPiAg
CWRhdGFfdCBkYXRhOw0KPiANCj4gQEAgLTMyOCw5ICsyMTksNiBAQCBpZ3RfbWFpbg0KPiAgCQkJ
CWlndF9pbmZvKCJTa2lwcGluZyBqb2luZXIgb3V0cHV0ICVzIiwgb3V0cHV0LQ0KPiA+bmFtZSk7
DQo+ICAJCQkJY29udGludWU7DQo+ICAJCQl9DQo+IC0JCQlkYXRhLm1zdF9vdXRwdXRbY291bnQr
K10gPSBvdXRwdXQ7DQo+IC0JCQlpZiAob3V0cHV0X2lzX2RwX21zdCgmZGF0YSwgb3V0cHV0LA0K
PiBkcF9tc3Rfb3V0cHV0cykpDQo+IC0JCQkJZHBfbXN0X291dHB1dHMrKzsNCj4gIAkJfQ0KPiAg
CX0NCj4gDQo+IEBAIC0zMzgsMjkgKzIyNiw2IEBAIGlndF9tYWluDQo+ICAJaWd0X3N1YnRlc3Rf
d2l0aF9keW5hbWljKCJleHRlbmRlZC1tb2RlLWJhc2ljIikNCj4gIAkJcnVuX2V4dGVuZGVkbW9k
ZV90ZXN0KCZkYXRhKTsNCj4gDQo+IC0JaWd0X2Rlc2NyaWJlKCJOZWdhdGl2ZSB0ZXN0IGZvciB2
YWxpZGF0aW5nIGRpc3BsYXkgZXh0ZW5kZWQgbW9kZSB3aXRoDQo+IGEgcGFpciBvZiBjb25uZWN0
ZWQgIg0KPiAtCQkgICAgICIyay00ayBvciA0ay00ayBkaXNwbGF5cyIpOw0KPiAtCWlndF9zdWJ0
ZXN0X3dpdGhfZHluYW1pYygibXN0LWV4dGVuZGVkLW1vZGUtbmVnYXRpdmUiKSB7DQo+IC0JCWln
dF9yZXF1aXJlX2YoZHBfbXN0X291dHB1dHMgPiAxLCAiTVNUIG5vdCBmb3VuZCBtb3JlIHRoZW4N
Cj4gb25lXG4iKTsNCj4gLQ0KPiAtCQltZW1jcHkoJmRhdGEubW9kZV9tc3RbMF0sDQo+IGdldF9t
b2RlKGRhdGEubXN0X291dHB1dFswXSksIHNpemVvZihkcm1Nb2RlTW9kZUluZm8pKTsNCj4gLQkJ
bWVtY3B5KCZkYXRhLm1vZGVfbXN0WzFdLA0KPiBnZXRfaGlnaHJlc19tb2RlKGRhdGEubXN0X291
dHB1dFsxXSksDQo+IC0JCQkJc2l6ZW9mKGRybU1vZGVNb2RlSW5mbykpOw0KPiAtCQlpZ3RfcmVx
dWlyZV9mKChkYXRhLm1vZGVfbXN0WzFdLmhkaXNwbGF5ID49IEhESVNQTEFZXzRLDQo+ICYmDQo+
IC0JCQkgICAgICAgZGF0YS5tb2RlX21zdFsxXS52ZGlzcGxheSA+PSBWRElTUExBWV80SyksICI0
aw0KPiBwYW5lbCBub3QgZm91bmRcbiIpOw0KPiAtDQo+IC0JCWZvcl9lYWNoX3BpcGUoJmRhdGEu
ZGlzcGxheSwgcGlwZTEpIHsNCj4gLQkJCWZvcl9lYWNoX3BpcGUoJmRhdGEuZGlzcGxheSwgcGlw
ZTIpIHsNCj4gLQkJCQlpZiAocGlwZTEgPT0gcGlwZTIpDQo+IC0JCQkJCWNvbnRpbnVlOw0KPiAt
DQo+IC0JCQkJaWd0X2R5bmFtaWNfZigicGlwZS0lcy0lcyIsDQo+IGttc3Rlc3RfcGlwZV9uYW1l
KHBpcGUxKSwNCj4gLQkJCQkJICAgICAga21zdGVzdF9waXBlX25hbWUocGlwZTIpKQ0KPiAtCQkJ
CQlydW5fZXh0ZW5kZWRtb2RlX25lZ2F0aXZlKCZkYXRhLA0KPiBwaXBlMSwgcGlwZTIpOw0KPiAt
CQkJfQ0KPiAtCQl9DQo+IC0JfQ0KPiAtDQo+ICAJaWd0X2ZpeHR1cmUgew0KPiAgCQlpZ3RfZGlz
cGxheV9maW5pKCZkYXRhLmRpc3BsYXkpOw0KPiAgCX0NCj4gLS0NCj4gMi40My4wDQoNCg==
