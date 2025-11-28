Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C52CFD376
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 04:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D23610E81B;
	Fri, 28 Nov 2025 04:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXwTXoRG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15D710E81B
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 04:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764305268; x=1795841268;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R++KUZe8/wnIvKwXilB2AqelP99Yfw31jXzIfio28oU=;
 b=JXwTXoRGp3qYva/J1YyUmUDKRrn9FggDfh55RSTHPHIMVwobxLCzQT13
 Po6/DVCGLHK9pFP81g2Yv9QQZQmaGszT4KVODh1pW+qFqsPjsL8opPkL0
 1ccq2/eChqp1h4xElnRDci/SoGos0eRfH43dfaykYffDN/1s205z6zt43
 Jr070JU+D7t9NLCvgFDMcXSZeJoMdciO91Hw4xEQaAYte/tjkLB4HVNwX
 JeW7gsSSc1WYoxqN6jXiU01KYJy55sXod7s+Ptgrgw/7xly5E4xPmkmle
 SinOBqjnWwxg9ocSc2b2eQU3oZRoCALREz/czLN/bDiqLXHgAi5MK8SE2 w==;
X-CSE-ConnectionGUID: JSQWKBgLSJSO0EVpruVrAw==
X-CSE-MsgGUID: BwI08FycSf6FEJmLGq7iLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77445666"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="77445666"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 20:47:47 -0800
X-CSE-ConnectionGUID: tn4j8zIYSeuV2b44/qFsOw==
X-CSE-MsgGUID: oztzliBySEqOscnAyxsmuA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 20:47:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 20:47:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 20:47:45 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 20:47:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWzJ/jOaoGetgOefAXV9Gpqr1NVZoPvRDhNVOB499nb88IpS8zGV4XnXjYqjRGQCbbwe7oFLEVPfx3s7wawM4prASmOiD208xrL/CCdJwrE/VrD5SeGFnNG02S9VQyUyspsFHBl5ElLeWYQ+qJgWrs3lpPPQdUkngji7lsBxdPJ5c0S/sCjRFaAmjtO7oDspaSLt3vKjIsTgZ7q8Ufcgw7NNL8gxB5xf8IWRfjb39jK/lAoUofiWxumlUpvAzMncbXEtXQeG8h/YkF29FG3CzvGX2Fd0aWicY4ihDzd8G2DyFUSlG98+AKIi2cdE/3NNIF4lStenY8+0UVTdPIEodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QghpIhgg1k0EPEabgcY3viBSLkEnHM1ZQGHNtH5SFk=;
 b=LgXAdJZYWjoJO7JPNbfS6qa6zLGD3KWFtAOw1bK+JpOVMelDYqBJu9u6V+T5yduGFVd5nVWhxZ9OJ339t5r/7nKfvn7yvqsirgmBwYsxxNgmkUZU4dSXNrWVG7F3eLf82DBVwLY/M0gOnBC8bmeP4exClDw90DRQMFdYlC4iZjoy88K0mS5N2CtV9KlucLQinV0QNOs8hzIL69EF4nObUNRfoFRTy9Gy5YEH/BREWBP0TcKt0m5y6cLc9RGGa7+630Re7+iUteqNtHquLDe7VdSuibwIXmrv1GnAGKGMUARTTxMr4MT85gfvjOfd9J+E70z/U7dDCrcBsE1NPQc8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by LV3PR11MB8674.namprd11.prod.outlook.com (2603:10b6:408:217::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 04:47:42 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 04:47:42 +0000
Message-ID: <e098c0fc-1e40-4137-9dbc-d6bac708c5ef@intel.com>
Date: Fri, 28 Nov 2025 10:17:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] tests/intel/xe_pm_residency: Add subtest for
 ASPM Link state residency
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>, <raag.jadav@intel.com>, <sk.anirban@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20251119095154.2501720-1-karthik.poosa@intel.com>
 <20251119095154.2501720-3-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251119095154.2501720-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0030.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|LV3PR11MB8674:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3b5fda-f18b-4b5b-cfd3-08de2e3943bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clJpY3NRcThicUhpNTZMejI5ejM0dnpJbDcvdndrQmJITFJPZUNqanlFM242?=
 =?utf-8?B?NE1sVENkSU94TEpKbkpPbjAxaUFaOHE1UjVCSDhZbyt4Y2FueDErejNNK3Fp?=
 =?utf-8?B?WWd3WXlDems2S05sM1dMZFNvSWFnNi93eERPWWdjT2JVNCtiMVZvaElpYWZx?=
 =?utf-8?B?NDlScm15UmpSZzJQYmE0VTV4d1ZuU2lhQVExWFZmL01zTnZYZThtV0VPZFhp?=
 =?utf-8?B?eGc3K21PZnNXRW9GRUJLdVFhT1ZnSTFqRExyRnl0SzJCciszaVpWSEd4eXV6?=
 =?utf-8?B?OVBPNHNSWW1NamFUbkR2Z2E4d0ROZHA0YkdPQjlkRURkcE91dmdZY3JRUHdp?=
 =?utf-8?B?c3RsdXVyeFEycWxKRExoZW9XTVlOdCtNVk83THZGVjNPR3IyQVBMUHgzc0J4?=
 =?utf-8?B?RWVIK0VrWFNOL1FYQnZPLzBJdG5sVndDSnZ3aWFjcHpRWlJMYmUyeXJUeS8r?=
 =?utf-8?B?YXNxcGcxREJGODAwdkZ1MXpTUTZsdENqVE9TRGZVSGllZmVUaHJSTjFtNjc0?=
 =?utf-8?B?QVYyWDhFcjludGpYSG5DNFhGM2c5bVRZemVMUW5zc2g0amhNRWlCYmNBQVg2?=
 =?utf-8?B?VVhFc1BZMlhJSGFxSHJRKzArVm9KS1crRzR0SStJaEZtOVJkTms1M2V6dlB2?=
 =?utf-8?B?N0ZZcnRYL0RxY3Jpd0hldkpWQXc0Rm5ZR2M4WlBnbHk1Nm5XM0JHNnhkZ1JM?=
 =?utf-8?B?VGhhekJIcTZCZzZGckxYbld0OStneGtrcDYrWlRFS3cxUDQrUXZiYnFsNEJW?=
 =?utf-8?B?YmRxVXdsUDM5N1FZYkwwdDVWU0t6WVBnUnRyNTJiNjB2ZnQrY1BLRFYzMjNU?=
 =?utf-8?B?c1EyMWQrSzVmZlJhNnN1YUs2R2g2aXFsWnpZNy8wNmwwdElTb0tPVVRHOFpL?=
 =?utf-8?B?Q0xuWjdyZUlINWhlYmlaaElidk5IcXFUTFJ0WVVIbjZoQUxsNGZTRXc0WXhh?=
 =?utf-8?B?RTUwZGJTMVhDRGF0UThtTEt1Z0hlWDhCK0Z1WHkrMXB6dUNoQldEd2FTWDFv?=
 =?utf-8?B?ZWtxZHVRaTNPWVFQRExuVUQ2MDh4eXJGaDRrOS9LZkJYb2x2Y1gzVG9OUHdk?=
 =?utf-8?B?WVd6K0hCWnJJRGNub0tiUDUyYWU1Y1NKaHBsRGFxVFFvdThXeENIT3p0UDBL?=
 =?utf-8?B?V2ZkN3l1Z3h6OXN0aitnZk1RN1UzZ0hqbC9mYnJWS2tOSHRndHhSaldNcGtY?=
 =?utf-8?B?YmRQUmhuYlhUZ0NQdEt3SlZhWmpFK20rL0tML2dCYzhjaExMeUhNVXJwUlpU?=
 =?utf-8?B?QjFXLzcyM3VQamFhcXpvdlVPZndyOUZMTi9kOU1xYTBwOUtySmdId2U5RklY?=
 =?utf-8?B?U1hQOWZiaEgyMDMrOWhjZEcraGlsREhJWHc5enNvTmlIb2R5VzhJSFdwZ3lL?=
 =?utf-8?B?Mks4WTFnRnhudXNHS0hBV1RONm1LVjB0NlJhV0VJODZML25EeU9IVjFuYnJt?=
 =?utf-8?B?U1pqZkVWeG9Ra1FXVFZlTnBBd29zaWdpaDR4QThmbUt1TisrT1pEd2E3NXlS?=
 =?utf-8?B?anVydXVPalRCL0JRaXVXbG13dTMvQUFPaVl6V05GamZPTGVrUENmNzVuWXhG?=
 =?utf-8?B?WC9XbHVZZ094Q1ZwdkJPNFcxRXlBQkp1TXBTUWRlaFZWNGJrMHl2NUhabi9F?=
 =?utf-8?B?c2luK1MxcUQrMGJCaHM3S1J2U2lBM3BTdVhkUVNQMWhqL2NaR1R2TFArc21V?=
 =?utf-8?B?OHI0MXErWEg4bjdNb3JNMVMvcWNUSk1uUnZDYjBGMmhxRVUwZllub2I0VUEx?=
 =?utf-8?B?eWlza0V1bnl4QUFtS1BTRENzYWpHck1wcmh2OERPT1lYNUQ5VldGUllMeGxF?=
 =?utf-8?B?Y2FoR21oeFBaanAyRFJ0VlI1SmZYbjd1RmJKckN2MHdJV1FCR0pPZEFxVE1W?=
 =?utf-8?B?MmcxR2VOV2Q0aUo5VUtEdWtHNFRZL0J5dWZGeWQxQjFmQ3ZkQmNZWjFyRDJC?=
 =?utf-8?Q?wTDM3jnpV5xGL0DwlXZb6BjltZ43cYiy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGZGY1BHRy84S3pKdDcyQnI4ZlNKRWlVMlhjRWlmWUlTbkFmUjlvR0M3UXRy?=
 =?utf-8?B?c3hQWmJidWF2cXczRmhqV1c4T3VwS3BXTFpSTnlORTZ1S1dLRjR6UysrbUtM?=
 =?utf-8?B?S0htZGh3Sk9TbS9ZQkVsLzVoRVZxdkhyQjRrSkoyRzlmY2JLT1hjMlBwa1o4?=
 =?utf-8?B?cXVFWDM4ekhYelpUSlRsOExVSkpDZWFWTlpJSm9JMk92Uk9xd3Y1RGI4Tk93?=
 =?utf-8?B?Q2hjV1FOODFKRW1lb0M0bzBranluN3NYN056bmhjaWgvSEl1RU54L0hNZjVk?=
 =?utf-8?B?cmttWXREbWRZbXplU2pic2FjS21YalNUSzRJcHY0alhBNEhSa0dpbzJZVGdJ?=
 =?utf-8?B?NGxDYm1WS2ptUXdCYWZES3ZKWmhnTG5uNVJ5di9UekV0ZFZSZjBtcEZ3L3pm?=
 =?utf-8?B?QnRMMnA2OEtpTEdFRkJsYWJPNEdMNm1aMXcrVTlYamVJTkZzV0FjeWhpTEVz?=
 =?utf-8?B?Z1ROdlVqUnlUYW9VRjB4MExKRFZHNkU3ajlHUEVtZFhCMmdOb2lUUjZHVVZo?=
 =?utf-8?B?TVBVQXdyRDNLSGtqL2dJay9UQXpoelIwWXgwMHNwbm4wVXpxZEFVZHFsWEFS?=
 =?utf-8?B?TkE5d0RXamJBSm02OTUxME4xQk5VVE4weGFBbnFuZy9iM0l0aHIyNXQ5bVlS?=
 =?utf-8?B?MWEyTm51K0U2Y3poYU5DM0tTa09JWGlnMnZ6UHBBcHYyU0J1RUxsNUJmQ1dP?=
 =?utf-8?B?Zmx3bi9oTG1DQlVub0R5Q0ljcFNQbElvZmlKYnlEaUNXUlc0Ylgwb0xTQ08r?=
 =?utf-8?B?ZUx5SEMvODZBVkNyRHVNa2R2dVJsdWtlcHBsZjBMNzBKQU9wQTI5OGZHZTRn?=
 =?utf-8?B?L0xiNWd2L1BVU3M5K0RwckVYL2t6N3hkMG1DamdKaGphQW8wSGFDODNLRG1D?=
 =?utf-8?B?UzJqMUh6YnJjY0dyY0MvVlJ1T21QSi9QNmpyeDYxTFNSSStpYVFaL1RseGFz?=
 =?utf-8?B?QkhXRU5vUFlQdjNKUmFCSXVFLzRtYWFDTWFNTXBYNE1hUjJsNW5ua2FCRXFC?=
 =?utf-8?B?eEpDbklBNmUrUU5WOW84c2xNdzl5d1dYR2Y0ekZOTDdPVVJxWHFjZU9rOUlp?=
 =?utf-8?B?ejV4SGlLems5MlljN2EwemZNTFFscisyS0l1QkdsRkZwcTNGeHJJZlA3dm11?=
 =?utf-8?B?clZTMFNwY2lnM1dXN0lhbGNYK2hxdk13alBHM1hLYWRNK1NWQTFGSnFlZnNs?=
 =?utf-8?B?RE16aFB6QS9RRTh3QjFkeGZDdGEvM3o2S3FLQlExclpHc1Rkekkya0IwaFZy?=
 =?utf-8?B?dzBXalVHN2VuYlV2dy9uYWltaW9xSjZvTlY5STZ6R1FoOEN0RnhlQk1UVlF5?=
 =?utf-8?B?ZTJla1BlZXRLeWQ5MmZxZHltSU4xWkVubFFQN1FRVmR6QmNEQWhLYUViWEl2?=
 =?utf-8?B?ZTBEOHdoMkVjVnpWaXVrWUZvNVZidHB2Z3d4L2tXejFCbkRVMEtqV1NxY240?=
 =?utf-8?B?M3EvRm5lZEdHbHprTEsydy9KZUJsSTlkdUo3VWhTdXFGUzNvU05lU05BTTJL?=
 =?utf-8?B?cmcxM2tJaHRKQ2ZHdVlwdVlrRFJ0RWxDcDRtWEg4TzJVWWNKUXNmcTNES01a?=
 =?utf-8?B?QWx3Ri9kSjJJbEJYbFB6RXI0SU54WUpUemhueDBjMkw4azNRL0wvNVNSaHJU?=
 =?utf-8?B?Lzd2YjB1ckszQXJzUzRiWFFFUStWL3hveDVtVFpkbStCb3FabExMK1NLNmRp?=
 =?utf-8?B?d0w3YVVtOFR0SG94SEhLeTZSNEo4Skk5UTNMd0tRcGtnK3J5UWxjZ3BZYlZD?=
 =?utf-8?B?RFlja0lQNWY5aGdGRm91ZERQc3ZzbUVEOE5vbjdrUGY2R1l5KzRRcGEvZU41?=
 =?utf-8?B?eWczZ3YrNW00d0E4bHd3aFNoTmNpanhvUGdMN2k0UnlBWWRUbVdiWndJY0Np?=
 =?utf-8?B?OThScStTTVJCZE02ZVF3b0FicnZWbzAxaHZLamNpRUt4RE4ybHIyYXF2dWJQ?=
 =?utf-8?B?V3JmNm9nb3NRbTVudkNDSWROMVdRZTVMbG5vQTBHSUFUeFBuaHBwK3VTV2Ir?=
 =?utf-8?B?TVFzNU1VSWtETU1kRTZmWGNOS3ZteTZpckxxbUxsK1lmUS93MWFEc3cvdndh?=
 =?utf-8?B?cFFzSWdrUWFnakJTVklaUXovZ2JiVHk1bE1HcTlhSC8vOSttUnN5VGVLdklk?=
 =?utf-8?B?WkxEUFJxcHVYNzV2R0crOUdYOWJRNElyejNCY2JkWUJrdmloT1ZWUkJlYVhN?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3b5fda-f18b-4b5b-cfd3-08de2e3943bb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 04:47:42.2362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2O8T0u9+i16fz84ZBnhSZs80wNdAeTeYs7CzMxH02E+DbezcvzaQHzGSfdQa9f6eu780+htfv98cJjPwSBlmDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8674
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


On 19-11-2025 15:21, Karthik Poosa wrote:
> Add subtest aspm_link_residency to verify PCIe ASPM.
> Active State Power Management (ASPM) is a power management mechanism
> for PCI Express (PCIe) devices that aims to save power while the devices
> are in a fully active state.
> This test uses link state counters from debugfs - dgfx_pcie_link_residencies
> to verify this.
>
> v2:
>   - Add dedicated function to get pcie endpoint upstream port. (Badal)
>   - Read residency counter as unsigned long long int instead of
>     unsigned long int.
>   - Print residency counter before sleep also.
>   - Don't assert if sysfs not corresponding to aspm_link_state
>     is not present. (Badal)
>   - Run workload before validation of aspm link residency. (Anshuman)
>
> v3:
>   - Move igt_device_get_pci_usp to separate patch. (Kamil)
>   - Move reading of residency to separate function. (Badal)
>
> v4:
>   - Add description about PCIe ASPM in commit message and code. (Kamil)
>   - Add a NULL check for the return value of igt_device_get_pci_usp().
>   - Resolve compilation warnings about using variable as format string
>     to sscanf.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 160 ++++++++++++++++++++++++++++++++++
>   1 file changed, 160 insertions(+)
>   mode change 100644 => 100755 tests/intel/xe_pm_residency.c
>
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> old mode 100644
> new mode 100755
> index 1749d6467..583d66bee
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -37,6 +37,27 @@ enum test_type {
>   	TEST_IDLE,
>   };
>   
> +enum link_state_index {
> +	LINK_STATE_ASPM,
> +	LINK_STATE_ASPM_L1_1,
> +	LINK_STATE_ASPM_L1_2,
> +	LINK_STATE_PCIPM_L1_1,
> +	LINK_STATE_PCIPM_L1_2,
> +	MAX_LINK_STATES,
> +};
> +
> +struct link_state_info {
> +	const char *filename;
> +	char state;
> +	const char *parse_str;
> +} link_state_sysfs [] = {
> +	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
> +	{ "l1_1_aspm", 0, "NULL"},
> +	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
> +	{ "l1_1_pcipm", 0, NULL},
> +	{ "l1_2_pcipm", 0, NULL},
> +};
> +
>   /**
>    * SUBTEST: gt-c6-on-idle
>    * Description: Validate GT C6 state on idle
> @@ -64,6 +85,10 @@ enum test_type {
>    * SUBTEST: cpg-gt-toggle
>    * Description: Toggle GT coarse power gating states by acquiring/releasing
>    *		forcewake.
> + *
> + * SUBTEST: aspm_link_residency
> + * Description: Check for PCIe ASPM (Active State Power Management) link states
> + * entry while device is in D0.
>    */
>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>   
> @@ -255,6 +280,24 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
>   	munmap(done, 4096);
>   }
>   
> +static void do_exec(int fd, struct drm_xe_engine_class_instance *hwe)
> +{
> +	unsigned long *done;
> +
> +	igt_info("Running on %s:%d\n",
> +		 xe_engine_class_string(hwe->engine_class), hwe->engine_instance);
> +	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +	igt_assert(done != MAP_FAILED);
> +	memset(done, 0, 4096);
> +
> +	igt_fork(child, 1)
> +		exec_load(fd, hwe, done);
> +
> +	*done = 1;
> +	igt_waitchildren();
> +	munmap(done, 4096);
> +}
> +
>   static void measure_power(struct igt_power *gpu, double *power)
>   {
>   	struct power_sample power_sample[2];
> @@ -370,6 +413,109 @@ static void cpg_gt_toggle(int fd)
>   		powergate_status(fd, gt, "down");
>   }
>   
> +
> +static bool check_link_residency_entry(int fd_xe, const char* filename, uint8_t aspm_link_state)
s/aspm_link_state/link_state/
> +{
> +	int fd_debugfs_dir = 0;
> +	int ret = 0;
> +	char *ptr = NULL;
> +	char path[256] = {0}, buf[1024] = {0};
> +	uint64_t residency_pre = 0, residency_post = 0;
> +
> +	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
> +	igt_assert(fd_debugfs_dir >= 0);
> +
> +	ret = igt_debugfs_simple_read(fd_debugfs_dir, filename, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "cannot read pre %s.\n", filename);
> +	ptr = strstr(buf, link_state_sysfs[aspm_link_state].parse_str);
> +	igt_assert_f((ptr != NULL), "cannot find residency string %s\n", link_state_sysfs[aspm_link_state].parse_str);
> +	if (ptr != NULL) {
> +		sprintf(path, "%s%%llu", link_state_sysfs[aspm_link_state].parse_str);
> +		igt_debug("searching for-%s\n", link_state_sysfs[aspm_link_state].parse_str);
> +		sscanf(ptr + strlen(link_state_sysfs[aspm_link_state].parse_str), "%lu", &residency_pre);
> +		igt_info("Link residency before %"PRIu64"\n", residency_pre);
> +		igt_info("Waiting for link to enter idle....\n");
> +		sleep(5);
> +		ret = igt_debugfs_simple_read(fd_debugfs_dir, filename, buf, sizeof(buf));
> +		igt_assert_f(ret >= 0, "cannot read post %s.\n", filename);
> +		sscanf(ptr + strlen(link_state_sysfs[aspm_link_state].parse_str), "%lu", &residency_post);
> +	}
> +
> +	igt_info("Link residency after %"PRIu64"\n", residency_post);
> +	close(fd_debugfs_dir);

I was suggesting to add igt_get_link_state_residency().

residency_post = igt_get_link_state_residency();
sleep(5);
residency_pre = igt_get_link_state_residency();

We can drop check_link_residency_entry() and move above logic to 
test_aspm_link_residency();

> +
> +	return (residency_post > residency_pre) ? true : false;
> +}
> +
> +static void test_aspm_link_residency(int fd_xe, uint8_t aspm_link_state)
> +{
> +	struct pci_device *pci_dev;
> +	int fd_pci_usp = 0;
> +	char name[PATH_MAX];
> +	int ret = 0;
> +	char path[256] = {0};
> +	bool aspm_entered = 0;

I recommend restricting this to ASPM states only, so please add an 
assertion here:
igt_assert(aspm_link_state <= LINK_STATE_ASPM_L1_2);

> +
> +	/* Get upstream port pci_dev */
> +	pci_dev = igt_device_get_pci_usp(fd_xe);
> +	igt_assert_f(pci_dev != NULL, "Couldn't get pci device of upstream port\n");
> +	igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n", pci_dev->domain,
> +		  pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	snprintf(name, sizeof(name), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +	fd_pci_usp = open(name, O_DIRECTORY);
> +	igt_assert_f((fd_pci_usp >= 0), "Can't open link directory upstream port %s, ret %d\n", name, fd_pci_usp);
> +
> +	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
> +	igt_assert(igt_setup_runtime_pm(fd_xe));
> +	igt_disable_runtime_pm();
> +
> +	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
> +	igt_require_f(!faccessat(fd_pci_usp, path, R_OK, 0), "%s is not present\n", path);
> +	ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[aspm_link_state].state);
> +	igt_assert_f((ret > 0), "couldn't read residency for %s", path);
> +
> +	/* Save current state of all available link sysfs entries and enable only the one needed. */
> +	for (int i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
> +			igt_info("%s not present to save\n", path);

This isn’t required, or you could use igt_debug instead.

> +			continue;
> +		}
> +		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
> +		igt_assert_lt(0, ret);
> +		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
> +
Enable outside for loop. Could you please wrap save restore inside 
separate functions and disable everything while saving.
> +		if(i == aspm_link_state) {
> +			igt_debug("Enabling %s\n", link_state_sysfs[i].filename);
> +			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '1');
> +		}
> +		else {
> +			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
> +		}
> +		igt_assert_lt(0, ret);
> +	}
> +
> +	aspm_entered = check_link_residency_entry(fd_xe, "dgfx_pcie_link_residencies", aspm_link_state);

The test should be made more readable.

Pseudo code: save_disable_link_states();
enable ASPM ;
residency_pre = igt_get_link_state_residency(aspm_link_state);
sleep(5);
residency_post = igt_get_link_state_residency(aspm_link_state);

igt_assert(residency_post > residency_pre);
restore_link_states();

Thanks,
Badal

> +
> +	/* Restore states of L1 sysfs entries. */
> +	for (int i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
> +			igt_info("%s not present to restore\n", path);
> +			continue;
> +		}
> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
> +		igt_debug("restored %s to %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
> +	}
> +
> +	igt_restore_runtime_pm();
> +	close(fd_pci_usp);
> +	close(fd_xe);
> +	igt_assert_f(aspm_entered , "ASPM Link idle entry failed!\n");
> +}
> +
>   igt_main
>   {
>   	uint32_t d3cold_allowed;
> @@ -444,6 +590,20 @@ igt_main
>   		cpg_gt_toggle(fd);
>   	}
>   
> +	igt_describe("ASPM Link residency validation");
> +	igt_subtest_with_dynamic("aspm_link_residency") {
> +		xe_for_each_gt(fd, gt) {
> +			xe_for_each_engine(fd, hwe) {
> +				if (gt == hwe->gt_id && !hwe->engine_instance) {
> +					igt_dynamic_f("gt%u-engine-%s", gt,
> +						      xe_engine_class_string(hwe->engine_class))
> +						do_exec(fd, hwe);
> +				}
> +			}
> +		}
> +		test_aspm_link_residency(fd, LINK_STATE_ASPM);
> +	}
> +
>   	igt_fixture {
>   		close(fd);
>   	}
