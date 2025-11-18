Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB94CED24E
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 09:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B2810E45C;
	Tue, 18 Nov 2025 09:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kX45rn8e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CAA10E45C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 09:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763458015; x=1794994015;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Q82k4jWs8K9abbtG9xPmtusU290xA6Km6U61y+8L/Mc=;
 b=kX45rn8ed+F7+HlY7s8zkCivE/8dgfnqcd/0l9elE99SH6ZrvkHyDrGE
 e+yg0aAnfPcU+7h/5jpeyvu/WC+0idwV2e8XKBw5FLdmwuxDC06AZWuAj
 K/t7fUXj45WSSmby19nQigZe0CvOVYEvr7Czch+5ezjfHtV5dlPXnad7W
 x6okR1pD0A5gNCxt+G73uZ9iupRx0x5UzyMxTwchYpvMX/NLzmbnDlbcO
 apk+A+e0ihOz933VAvsuNK2epuTrHIoyITxJiM5wTUBk/KQQeclmjU7mE
 qIfuOLbRPHpGFwTIFWOtzO7Ux0p8UyS3vShdIaI6X/+lrNUrtvdup3GZd A==;
X-CSE-ConnectionGUID: zjjh1aRjSu2aTWQR2lWzlw==
X-CSE-MsgGUID: /DHzP/YARzeuRgu3T5kwPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69326103"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="69326103"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:26:55 -0800
X-CSE-ConnectionGUID: 3kEFQBf/TCW5PpH71p8WMg==
X-CSE-MsgGUID: vGSC078lRyW+utG4JzHT1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190374143"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:26:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 01:26:52 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 01:26:52 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 01:26:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLV6zyZVFRB+dKmZP4SJ08fKk5EHFR1z/mzKrywELozWLVj7lc/dssK8NBStoeEp7keJEAYk8Ex0wQH9S3YFi+/DdR5OQuuiOvQANTjA9PWwM00dm9SRVY6n5cpwj7YmIG3K0+r7cbYBp3CtYdVuk78eul2rptJpOKMXR14U+YhRkUJxwQD/WHQ5mQcWzocMwh45uJmAceJKxTej+9MoUPKExoZ+Z6MROCWMAvsVJEWE+qNtBgrI2B0D+fdy5QA/gJPecf3vjZTLsHbpzSzK5y0kcCTddwX/5edwYiSF6Aj9EUp7EBlfDNqwMgVHSshONW5x2ij6r9PcpDrZwYex+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q82k4jWs8K9abbtG9xPmtusU290xA6Km6U61y+8L/Mc=;
 b=FHVB7j8762URsiGvZx4HkLaqPh+SQ0t9h4WiPi/Dng+nS5d88V4MLqCazu3uu8uFOuSiSE6mhawlaSIliI+tYlYw3UA0F78Hs08vf5gwh0fPZXKqhlSMk6AIVLkDRGNHxip4Gy8W0f+3yioQ48foixss8Gwytj4jIkSgllEeLs4C9Bdf6dTD23M1tkN7mGxXEwyA00T0qjdk/NQ0RB/VEWeWr5d5oRt9g5ismFGOUSkO3wSuODv1o3XxZPKnY5md5aX1iBXK4NuEwtg2aQp5BNXRQLDTUdN7TOyhsGuN/ePbn8DLvOIipSk8+TCZ4AvN4f2U9IbUWAofCcVF1dWtUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DM3PPF818092190.namprd11.prod.outlook.com (2603:10b6:f:fc00::f34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 09:26:49 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 09:26:49 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v7 04/10] tests/intel/xe_multi_gpusvm.c: Add SVM
 multi-GPU atomic operations
Thread-Topic: [PATCH i-g-t v7 04/10] tests/intel/xe_multi_gpusvm.c: Add SVM
 multi-GPU atomic operations
Thread-Index: AQHcVLs7d04AjjZKqUms0yzRxyJeu7T23cKAgAAstoCAASb6AA==
Date: Tue, 18 Nov 2025 09:26:49 +0000
Message-ID: <620bd116f9f3d159f4b67268ae353beafa61f962.camel@intel.com>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
 <20251113163308.633818-5-nishit.sharma@intel.com>
 <556b427ab266daec61e90f9f6db863dc5d19a279.camel@intel.com>
 <4e88d41e-e65e-4fa8-b910-30de1f8a3ce2@intel.com>
In-Reply-To: <4e88d41e-e65e-4fa8-b910-30de1f8a3ce2@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DM3PPF818092190:EE_
x-ms-office365-filtering-correlation-id: 3366b5a2-0469-4c7c-1c67-08de26849a31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dXFsbWpVVzZiaXpqd1liR2QxSnhONUNLYWVXbHY0d0d3TWRQU1JHT1BncExt?=
 =?utf-8?B?bUlvOUpzR0xRalBEOUNEV1ZmcElVQ0wxUWRtTDdpUSs1VWJSWHhjS0ZqUmtV?=
 =?utf-8?B?eHhPcVp3U0RTVFlHK2I3VDAwOUN0NWtzbldpN25LaVFnME1tWWlMVGxVUjVq?=
 =?utf-8?B?bnFoemhKVE1nc2g1VWh1bHF2dkFTdm9GL3kyOGxoaUZISDVDenFONkNCSWJR?=
 =?utf-8?B?VHVXY0hteHFKNlZIZFY2d0pXclFjY1BwcmcrYWllWXZYTWtxbk1sVHB2NmxJ?=
 =?utf-8?B?UXo2SnVWeVNpN1FPUXRRdkRQMXoyNnN0UWJ2WDROZ21WcG1HVlhrbnliU2Ux?=
 =?utf-8?B?OURMeTZIcTBycWJkVGR1MlRYZUNjWktGMjVOQ202blNFT2tVN3JNR1ZoREs4?=
 =?utf-8?B?WXUvR0pMUVdGOFMrWElBTWVNQ1Q5K3VUZFNUYlJEQ2dSOENkMTRMTDhUTWU3?=
 =?utf-8?B?ZUppWWJlRnBMRzZmYjlWdWNFVHQ0N3VrTlZRMjBFY1NvMklaOW95MnluclBN?=
 =?utf-8?B?a3FIa2hQSVB6VndXQWN0aTdDdDdQWEQvU3BWOVl1R1FjS0hOZmVwbVZkUExI?=
 =?utf-8?B?eWttVzhXZWhVSXVVM3NmL3h1VUsrK1RMMWJTTDd5cm5kL0JFbUdwbStybnRy?=
 =?utf-8?B?QWQvbE4vakZYbXc5Z1VyWVo2Tm1PdDQ1RzR5RGtnMUdPK3RmN2RGT3ZicGVH?=
 =?utf-8?B?NEJYcFVMTjNyUGFJaHlzdGZDTHNpTzA2SUhKWXpVYlhTK3dPT29RQlZ4Lzk0?=
 =?utf-8?B?c3RaN09PQS9LdmZtSzRvYTYzWExCMXFlbmY1VUVYdUFUYlQwTUlpTHJpN01m?=
 =?utf-8?B?VVBCRnQzVm9WZ1FUZUZyTG1aUkZFMHdnemZOWVZtZjJkSW1uRzN1RGRTRGZw?=
 =?utf-8?B?MmZGWFJaOFZ1VmNJYnhibXJlVWZrTTBvUzNWZlVWeXB5SDRaaFhUejFPSkJP?=
 =?utf-8?B?MTJXRnpGTCtFSVIzWitKekxzM1p1NW15eVFYeFZQOXhKRWlJN1JoN2lpUEht?=
 =?utf-8?B?clF1WVZpNmNBZUFhR0w0ajBidXZFc2ZoME4rQ2hMVWY4eGduK1Uyb0Y0S0s1?=
 =?utf-8?B?ajNhTkpLejQ4UGFnRXZmOGd0ek55TUNoQmxkUU1Oa1Z4UUpYUjZxcDJVbTdl?=
 =?utf-8?B?SStTb1R3Y3hkb0hQU0JWTE5oQWcyNWpqbFZKK25WaVB0QjFOOWlYU1RGckFp?=
 =?utf-8?B?Q2VZb05QaE11L0RhYUR0blZodldVdjdyOXNWcU51ZTdBMUhqYlJvaWk1UjdT?=
 =?utf-8?B?VjZyQ2twN3JzcldoQTNoQTM4c0tnbHhXRmJaVFJqZUVnQ1V6d3VRejJrSDkw?=
 =?utf-8?B?REhrSG9Oa213SnFEOEdxTElRQk9hN3k4SlVDQ2hDRE1MUHM4dlFCV2FpZmNq?=
 =?utf-8?B?SngyUkp1UGVGSW1DZlk3VlVWUDRzcFBQQTZQcDc0NzdjbVBqd1pFWFBXZHRT?=
 =?utf-8?B?V043Q1J5U0dOcFo2R216RU5ONjRSdFR1QnBQaHh6Tkp0eWVJRUZKeWFmejFt?=
 =?utf-8?B?N2ZLNlo4QVFTR1EzTXRlR3BXeFZqekhBelFxd2hVRU1LQTRUOWt4RlpmbXFr?=
 =?utf-8?B?UjV0RDlSaHlzMDM3TXA3dmtRNnpkSk1BWlFJYm9FYjZaVlFaNEw4OVpYQWtT?=
 =?utf-8?B?NEozMHgrZitBTWU5YlJNaklJRHp5anpJVGNlOXVQNGlwOWFZYlJkSktBdlI3?=
 =?utf-8?B?cnVpWDhGajFYU2ZPc2o5bVlFL0ZKSzZ1VWM0T2ZPR3dMVXBkY1NsOC9xN00z?=
 =?utf-8?B?Z3NWWWh2SGhENGRmWjFnNzF0ZDNBVmlqMDZ1RVFWVWdwbUJjVHZxc1YrZWhp?=
 =?utf-8?B?S0h1SVZ1VW1GNEpXREs1VWpLZzZscnFadTlQTkpMTjBtNnhNbjdzb1czcGdj?=
 =?utf-8?B?MzdpWlc4MVRNNjlWdzhDWXRtNXJFMVJqOTZJT3ZVSUxPU3MrYmFndFVkSXVL?=
 =?utf-8?B?N094b2ZORFRtZmNUa3BLZjRnZWpOY2xyVVpJY0xwb2MxRmdObkh5V2twUWxa?=
 =?utf-8?B?VExxQ3k1eVNRT2R3RUwwSFVPNWFWZUpqSlBxWVN6UGsrYndTdWhDdE9GcWZo?=
 =?utf-8?Q?tnhmYy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXdNazdJQ3BDa003UGNnQStIMVdxZXdweHlycmtmaG9BRGszUkVCOTRrV2c3?=
 =?utf-8?B?bk1hcW51a2pER21wWllYMGF4aWVVMFJSN0xDYjNrYVlOMVBSdUFhT0tSMzVE?=
 =?utf-8?B?cFZpVEQzaCt2SUVZTFAzMERlOHhXVTRUQ3UzSm02YW4rRmFWclQwOTdpTkFX?=
 =?utf-8?B?R3hJOERTTWlnVzdYMVNLcFJhb2FaRVdLUkpTZ0hyQm1BRURFeVhvUTJ6K2lr?=
 =?utf-8?B?MGQ4N1dKQVRQK0xYMEd6cktWUHJIQyt1MkRxNndMZ3NxMnU0VkQ5Z0pQWWdE?=
 =?utf-8?B?Qk5QV2lnTDIzNUNqbTNwNmdEQUhTcXlNc0ZQMkVKOWNJaXI0MDZuSktOeGxu?=
 =?utf-8?B?V1hzSWJTbVBkM05DYklmamN2STZsRlJBQ3ZYdXZFcVk0cEl6TEJUWHRsY1Yv?=
 =?utf-8?B?ajV5MWM3dWpGdjhOU2d6NGdXRXlmQllSNm5DeEcvK0FiMHVwbzlZek1NK3Bt?=
 =?utf-8?B?MkIrSTRuQVliTzhkOGpidWk4WWtIMFdQSDhXTTlhMlQ4K2k5YzdkTldEREsz?=
 =?utf-8?B?UEdlVjZ1aFNjcVpHRWJmdVFBSkxMVjhqMjNudW5zWDZJbENGcUxrd1hjcllV?=
 =?utf-8?B?Vi80RWFWWllxL29FQzJ0WFJlTytwRmZ1RWdaSE1Vc21xOVBqS2ZRTjV4ZlZj?=
 =?utf-8?B?allNZ3J2UFY4Y1JuUmYxNERjRERKb1Jyd1hTdkZHcnpPbEtLOG00eHBrcDhW?=
 =?utf-8?B?amdtV0RHQmswUWJaciswUkxGNW90aGpYY3BXNCswRVpkUUErNkVUYlh2Rngv?=
 =?utf-8?B?UFVsZlgzU2Jscnp0NXEwNHhteU9XVVMwZjN0clJRd3FsSW5Ga3dkZnZCWlNt?=
 =?utf-8?B?ZjVoNU5lQjlsdnVndUtGeStkOERxcWp0YzAzWjBjbnVIRzk3WHI3bW1JUHN5?=
 =?utf-8?B?V3A0TmxTYk42RWk0U3NLRnVGc2lRK1JxWXpXZnJweFpmSlhpbDlPNXZqOGtN?=
 =?utf-8?B?N0dQWGI4TVlRQUdOeVlrRGUwMmhaaHVRZ2pBbGJaekJJVyt0N0Y4ZzY2R1Zk?=
 =?utf-8?B?WkNpQk9tMEJyZGIxKzJMcXZRNmZ6b2s0MGw5YmgxTjJXcnZSd2dId2NUWlda?=
 =?utf-8?B?VmVXOUVxanQ2eWxPM1p5UHJaVHBPSlVaV3c3MTdHUWlnRnQ2OERuYmdSQ2R5?=
 =?utf-8?B?d0xIYnVMRWxSMnNYZTR5djgyVm9zQUZIbWRhdmJzSFpPVzJtVzVpbjgxK01F?=
 =?utf-8?B?clNXQnBBbUFTRE1sV0h0bU5CVnFPWk45S2tFbHd0dmlLSkROQVVtZkFFV2xL?=
 =?utf-8?B?b091U2lYRUp1OW94RHpPTkhDRVh5dk1KMUQyYjhBNmNsNDVqbHE3ME9DQk5X?=
 =?utf-8?B?bm9TbEwyMHJhVVlmRjdhTytwVndVZlRwdCtibmNJZTk2ODhJZ1UyUVpBRnUv?=
 =?utf-8?B?K0UzMkU1RHRQQnYvdkFZdko5eWw4WCtReGVXZXJaUGxOR01VQTJ2ZEFCY0ll?=
 =?utf-8?B?aFMyQzNIMTdIdnQ0RUJWbmlIVEN6cDJMc3dGbFcrZ2dlNGl0WmRLVjBVVUQw?=
 =?utf-8?B?L1lQSWQ1UTJTSFJxaTJ1UGY2TlhOM2hQY3E0TG9JM0UvSWljNmdSeTlJRmFK?=
 =?utf-8?B?eWhvaUZCVGd0MDZvNnh1Ri9KNHFDSU9Ebkl2SXo2MFFhU2lzRUc3bFI3KzAz?=
 =?utf-8?B?RlNPRk9RUVhvc1RRZmlWeWxYc0M4T3ZIVHFXRG03Y0VyYlRHc0x5aDBDSEVw?=
 =?utf-8?B?dTI4Z29hcFBzTUh4QkFFNkNPb2IxNjc3d2tMTjlwdzBBamd1ODBUTTdlczMr?=
 =?utf-8?B?R1h3b29ZcjE1Uk8rS3A1VlRISnh5ZVg0R0VYNSt6L09aaFlRenVkU3owOTdY?=
 =?utf-8?B?V0lKbCs0ekthWG5USzgyclZKY00rWDdpYWpNOWdVYjdqemRsbTh4Tkh6Tll6?=
 =?utf-8?B?MDQrM1VwcWQ2T2VtT1BJemp6d3ltcWpjRlUzYUc1SldDTE42cTRENWFGbzFl?=
 =?utf-8?B?ZEUvNElYbVVZWnBESHNSaTRPYkxJb0ViNTFId3VDZ2J6RTlwSzFFT2kvYWNL?=
 =?utf-8?B?SWdNTUswY3ByVkRZT0xDSmlPTUJnNmtnbTU2MExwMVFEUGpjWmloS2crM0JG?=
 =?utf-8?B?TTZrVXp4K2tkbHVUdDFEZ1NLcTRnYVNnWjBWREJoNk8reUcyblBQckRVNEpz?=
 =?utf-8?B?ODIzM1ZUbkdTRy9mMHh1NGdZa2xXUGlhcUJOUTRmSElUZENCN3JYYnpNU3dP?=
 =?utf-8?Q?EokV4BZdEHu3WvIwziLxq3X2OMly3VBcswU5cDm0IGh0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A0D9F3659B391419BBA5439D3B8C84F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3366b5a2-0469-4c7c-1c67-08de26849a31
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 09:26:49.7061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uoOb/361Y02k2XHrVQXrdY8zvhOQ9zjNYZOC2/PHz564K78g2L78gN71XRl/PaTEbgj6XK+l1p6+cXWsRSl/arBzABUHRrYAq081dzPwZRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF818092190
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

T24gTW9uLCAyMDI1LTExLTE3IGF0IDIxOjIwICswNTMwLCBTaGFybWEsIE5pc2hpdCB3cm90ZToN
Cj4gDQo+IE9uIDExLzE3LzIwMjUgNjo0MCBQTSwgSGVsbHN0cm9tLCBUaG9tYXMgd3JvdGU6DQo+
ID4gT24gVGh1LCAyMDI1LTExLTEzIGF0IDE2OjMzICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVs
LmNvbcKgd3JvdGU6DQo+ID4gPiBGcm9tOiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1hQGlu
dGVsLmNvbT4NCj4gPiA+IA0KPiA+ID4gVGhpcyB0ZXN0IHBlcmZvcm1zIGF0b21pYyBpbmNyZW1l
bnQgb3BlcmF0aW9uIG9uIGEgc2hhcmVkIFNWTQ0KPiA+ID4gYnVmZmVyDQo+ID4gPiBmcm9tIGJv
dGggR1BVcyBhbmQgdGhlIENQVSBpbiBhIG11bHRpLUdQVSBlbnZpcm9ubWVudC4gSXQgdXNlcw0K
PiA+ID4gbWFkdmlzZQ0KPiA+ID4gYW5kIHByZWZldGNoIHRvIGNvbnRyb2wgYnVmZmVyIHBsYWNl
bWVudCBhbmQgdmVyaWZpZXMgY29ycmVjdG5lc3MNCj4gPiA+IGFuZA0KPiA+ID4gb3JkZXJpbmcg
b2YgYXRvbWljIHVwZGF0ZXMgYWNyb3NzIGFnZW50cy4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+DQo+ID4gPiAtLS0N
Cj4gPiA+IMKgwqB0ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYyB8IDE1Nw0KPiA+ID4gKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+ID4gwqDCoDEgZmlsZSBjaGFuZ2Vk
LCAxNTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gPiA+IGIvdGVzdHMvaW50ZWwv
eGVfbXVsdGlfZ3B1c3ZtLmMNCj4gPiA+IGluZGV4IDY2MTRlYTNkMS4uNTRlMDM2NzI0IDEwMDY0
NA0KPiA+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gPiA+ICsrKyBi
L3Rlc3RzL2ludGVsL3hlX211bHRpX2dwdXN2bS5jDQo+ID4gPiBAQCAtMzEsNiArMzEsMTEgQEAN
Cj4gPiA+IMKgwqAgKsKgwqDCoMKgwqAgcmVnaW9uIGJvdGggcmVtb3RlbHkgYW5kIGxvY2FsbHkg
YW5kIGNvcGllcyB0byBpdC4NCj4gPiA+IFJlYWRzDQo+ID4gPiBiYWNrIHRvDQo+ID4gPiDCoMKg
ICrCoMKgwqDCoMKgIHN5c3RlbSBtZW1vcnkgYW5kIGNoZWNrcyB0aGUgcmVzdWx0Lg0KPiA+ID4g
wqDCoCAqDQo+ID4gPiArICogU1VCVEVTVDogYXRvbWljLWluYy1ncHUtb3ANCj4gPiA+ICsgKiBE
ZXNjcmlwdGlvbjoNCj4gPiA+ICsgKsKgCVRoaXMgdGVzdCBkb2VzIGF0b21pYyBvcGVyYXRpb24g
aW4gbXVsdGktZ3B1IGJ5DQo+ID4gPiBleGVjdXRpbmcNCj4gPiA+IGF0b21pYw0KPiA+ID4gKyAq
CW9wZXJhdGlvbiBvbiBHUFUxIGFuZCB0aGVuIGF0b21pYyBvcGVyYXRpb24gb24gR1BVMg0KPiA+
ID4gdXNpbmcNCj4gPiA+IHNhbWUNCj4gPiA+ICsgKglhZHJlc3MNCj4gPiA+IMKgwqAgKi8NCj4g
PiA+IMKgIA0KPiA+ID4gwqDCoCNkZWZpbmUgTUFYX1hFX1JFR0lPTlMJOA0KPiA+ID4gQEAgLTQw
LDYgKzQ1LDcgQEANCj4gPiA+IMKgwqAjZGVmaW5lIEJJTkRfU1lOQ19WQUwgMHg2ODY4NjgNCj4g
PiA+IMKgwqAjZGVmaW5lIEVYRUNfU1lOQ19WQUwgMHg2NzY3NjcNCj4gPiA+IMKgwqAjZGVmaW5l
IENPUFlfU0laRSBTWl82NE0NCj4gPiA+ICsjZGVmaW5lCUFUT01JQ19PUF9WQUwJNTYNCj4gPiA+
IMKgIA0KPiA+ID4gwqDCoHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gew0KPiA+ID4gwqDCoAlib29s
IHN1cHBvcnRzX2ZhdWx0czsNCj4gPiA+IEBAIC00OSw2ICs1NSwxNiBAQCBzdHJ1Y3QgeGVfc3Zt
X2dwdV9pbmZvIHsNCj4gPiA+IMKgwqAJaW50IGZkOw0KPiA+ID4gwqDCoH07DQo+ID4gPiDCoCAN
Cj4gPiA+ICtzdHJ1Y3QgdGVzdF9leGVjX2RhdGEgew0KPiA+ID4gKwl1aW50MzJfdCBiYXRjaFsz
Ml07DQo+ID4gPiArCXVpbnQ2NF90IHBhZDsNCj4gPiA+ICsJdWludDY0X3Qgdm1fc3luYzsNCj4g
PiA+ICsJdWludDY0X3QgZXhlY19zeW5jOw0KPiA+ID4gKwl1aW50MzJfdCBkYXRhOw0KPiA+ID4g
Kwl1aW50MzJfdCBleHBlY3RlZF9kYXRhOw0KPiA+ID4gKwl1aW50NjRfdCBiYXRjaF9hZGRyOw0K
PiA+ID4gK307DQo+ID4gPiArDQo+ID4gPiDCoMKgc3RydWN0IG11bHRpZ3B1X29wc19hcmdzIHsN
Cj4gPiA+IMKgwqAJYm9vbCBwcmVmZXRjaF9yZXE7DQo+ID4gPiDCoMKgCWJvb2wgb3BfbW9kOw0K
PiA+ID4gQEAgLTcyLDcgKzg4LDEwIEBAIHN0YXRpYyB2b2lkIGdwdV9tZW1fYWNjZXNzX3dyYXBw
ZXIoc3RydWN0DQo+ID4gPiB4ZV9zdm1fZ3B1X2luZm8gKnNyYywNCj4gPiA+IMKgwqAJCQkJwqDC
oCBzdHJ1Y3QNCj4gPiA+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gPiA+
IMKgwqAJCQkJwqDCoCB2b2lkICpleHRyYV9hcmdzKTsNCj4gPiA+IMKgIA0KPiA+ID4gLXN0YXRp
YyB2b2lkIG9wZW5fcGFnZW1hcHMoaW50IGZkLCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICppbmZv
KTsNCj4gPiA+ICtzdGF0aWMgdm9pZCBncHVfYXRvbWljX2luY193cmFwcGVyKHN0cnVjdCB4ZV9z
dm1fZ3B1X2luZm8gKnNyYywNCj4gPiA+ICsJCQkJwqDCoCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZv
ICpkc3QsDQo+ID4gPiArCQkJCcKgwqAgc3RydWN0DQo+ID4gPiBkcm1feGVfZW5naW5lX2NsYXNz
X2luc3RhbmNlICplY2ksDQo+ID4gPiArCQkJCcKgwqAgdm9pZCAqZXh0cmFfYXJncyk7DQo+ID4g
PiDCoCANCj4gPiA+IMKgwqBzdGF0aWMgdm9pZA0KPiA+ID4gwqDCoGNyZWF0ZV92bV9hbmRfcXVl
dWUoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1LCBzdHJ1Y3QNCj4gPiA+IGRybV94ZV9lbmdp
bmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gPiA+IEBAIC0xNjYsNiArMTg1LDM1IEBAIHN0YXRp
YyB2b2lkIGZvcl9lYWNoX2dwdV9wYWlyKGludCBudW1fZ3B1cywNCj4gPiA+IHN0cnVjdCB4ZV9z
dm1fZ3B1X2luZm8gKmdwdXMsDQo+ID4gPiDCoMKgCX0NCj4gPiA+IMKgwqB9DQo+ID4gPiDCoCAN
Cj4gPiA+ICtzdGF0aWMgdm9pZCBvcGVuX3BhZ2VtYXBzKGludCBmZCwgc3RydWN0IHhlX3N2bV9n
cHVfaW5mbyAqaW5mbyk7DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIHZvaWQNCj4gPiA+ICthdG9t
aWNfYmF0Y2hfaW5pdChpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50NjRfdCBzcmNfYWRkciwNCj4g
PiA+ICsJCcKgIHVpbnQzMl90ICpibywgdWludDY0X3QgKmFkZHIpDQo+ID4gPiArew0KPiA+ID4g
Kwl1aW50MzJfdCBiYXRjaF9ib19zaXplID0gQkFUQ0hfU0laRShmZCk7DQo+ID4gPiArCXVpbnQz
Ml90IGJhdGNoX2JvOw0KPiA+ID4gKwl1aW50NjRfdCBiYXRjaF9hZGRyOw0KPiA+ID4gKwl2b2lk
ICpiYXRjaDsNCj4gPiA+ICsJdWludDMyX3QgKmNtZDsNCj4gPiA+ICsJaW50IGkgPSAwOw0KPiA+
ID4gKw0KPiA+ID4gKwliYXRjaF9ibyA9IHhlX2JvX2NyZWF0ZShmZCwgdm0sIGJhdGNoX2JvX3Np
emUsDQo+ID4gPiB2cmFtX2lmX3Bvc3NpYmxlKGZkLCAwKSwgMCk7DQo+ID4gPiArCWJhdGNoID0g
eGVfYm9fbWFwKGZkLCBiYXRjaF9ibywgYmF0Y2hfYm9fc2l6ZSk7DQo+ID4gPiArCWNtZCA9ICh1
aW50MzJfdCAqKWJhdGNoOw0KPiA+ID4gKw0KPiA+ID4gKwljbWRbaSsrXSA9IE1JX0FUT01JQyB8
IE1JX0FUT01JQ19JTkM7DQo+ID4gPiArCWNtZFtpKytdID0gc3JjX2FkZHI7DQo+ID4gPiArCWNt
ZFtpKytdID0gc3JjX2FkZHIgPj4gMzI7DQo+ID4gPiArCWNtZFtpKytdID0gTUlfQkFUQ0hfQlVG
RkVSX0VORDsNCj4gPiA+ICsNCj4gPiA+ICsJYmF0Y2hfYWRkciA9IHRvX3VzZXJfcG9pbnRlcihi
YXRjaCk7DQo+ID4gPiArCS8qIFB1bmNoIGEgZ2FwIGluIHRoZSBTVk0gbWFwIHdoZXJlIHdlIG1h
cCB0aGUgYmF0Y2hfYm8NCj4gPiA+ICovDQo+ID4gPiArCXhlX3ZtX2JpbmRfbHJfc3luYyhmZCwg
dm0sIGJhdGNoX2JvLCAwLCBiYXRjaF9hZGRyLA0KPiA+ID4gYmF0Y2hfYm9fc2l6ZSwgMCk7DQo+
ID4gPiArCSpibyA9IGJhdGNoX2JvOw0KPiA+ID4gKwkqYWRkciA9IGJhdGNoX2FkZHI7DQo+ID4g
PiArfQ0KPiA+ID4gKw0KPiA+ID4gwqDCoHN0YXRpYyB2b2lkIGJhdGNoX2luaXQoaW50IGZkLCB1
aW50MzJfdCB2bSwgdWludDY0X3Qgc3JjX2FkZHIsDQo+ID4gPiDCoMKgCQnCoMKgwqDCoMKgwqAg
dWludDY0X3QgZHN0X2FkZHIsIHVpbnQ2NF90IGNvcHlfc2l6ZSwNCj4gPiA+IMKgwqAJCcKgwqDC
oMKgwqDCoCB1aW50MzJfdCAqYm8sIHVpbnQ2NF90ICphZGRyKQ0KPiA+ID4gQEAgLTMyNSw2ICsz
NzMsMTA1IEBAIGdwdV9tZW1fYWNjZXNzX3dyYXBwZXIoc3RydWN0DQo+ID4gPiB4ZV9zdm1fZ3B1
X2luZm8NCj4gPiA+ICpzcmMsDQo+ID4gPiDCoMKgCWNvcHlfc3JjX2RzdChzcmMsIGRzdCwgZWNp
LCBhcmdzLT5wcmVmZXRjaF9yZXEpOw0KPiA+ID4gwqDCoH0NCj4gPiA+IMKgIA0KPiA+ID4gK3N0
YXRpYyB2b2lkDQo+ID4gPiArYXRvbWljX2luY19vcChzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpn
cHUwLA0KPiA+ID4gKwnCoMKgwqDCoMKgIHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmdwdTEsDQo+
ID4gPiArCcKgwqDCoMKgwqAgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVj
aSwNCj4gPiA+ICsJwqDCoMKgwqDCoCBib29sIHByZWZldGNoX3JlcSkNCj4gPiA+ICt7DQo+ID4g
PiArCXVpbnQ2NF90IGFkZHI7DQo+ID4gPiArCXVpbnQzMl90IHZtWzJdOw0KPiA+ID4gKwl1aW50
MzJfdCBleGVjX3F1ZXVlWzJdOw0KPiA+ID4gKwl1aW50MzJfdCBiYXRjaF9ibzsNCj4gPiA+ICsJ
c3RydWN0IHRlc3RfZXhlY19kYXRhICpkYXRhOw0KPiA+ID4gKwl1aW50NjRfdCBiYXRjaF9hZGRy
Ow0KPiA+ID4gKwlzdHJ1Y3QgZHJtX3hlX3N5bmMgc3luYyA9IHt9Ow0KPiA+ID4gKwl2b2xhdGls
ZSB1aW50NjRfdCAqc3luY19hZGRyOw0KPiA+ID4gKwl2b2xhdGlsZSB1aW50MzJfdCAqc2hhcmVk
X3ZhbDsNCj4gPiA+ICsNCj4gPiA+ICsJY3JlYXRlX3ZtX2FuZF9xdWV1ZShncHUwLCBlY2ksICZ2
bVswXSwgJmV4ZWNfcXVldWVbMF0pOw0KPiA+ID4gKwljcmVhdGVfdm1fYW5kX3F1ZXVlKGdwdTEs
IGVjaSwgJnZtWzFdLCAmZXhlY19xdWV1ZVsxXSk7DQo+ID4gPiArDQo+ID4gPiArCWRhdGEgPSBh
bGlnbmVkX2FsbG9jKFNaXzJNLCBTWl80Syk7DQo+ID4gPiArCWlndF9hc3NlcnQoZGF0YSk7DQo+
ID4gPiArCWRhdGFbMF0udm1fc3luYyA9IDA7DQo+ID4gPiArCWFkZHIgPSB0b191c2VyX3BvaW50
ZXIoZGF0YSk7DQo+ID4gPiArDQo+ID4gPiArCXNoYXJlZF92YWwgPSAodm9sYXRpbGUgdWludDMy
X3QgKilhZGRyOw0KPiA+ID4gKwkqc2hhcmVkX3ZhbCA9IEFUT01JQ19PUF9WQUwgLSAxOw0KPiA+
ID4gKw0KPiA+ID4gKwlhdG9taWNfYmF0Y2hfaW5pdChncHUwLT5mZCwgdm1bMF0sIGFkZHIsICZi
YXRjaF9ibywNCj4gPiA+ICZiYXRjaF9hZGRyKTsNCj4gPiA+ICsNCj4gPiA+ICsJLyogUGxhY2Ug
ZGVzdGluYXRpb24gaW4gYW4gb3B0aW9uYWxseSByZW1vdGUgbG9jYXRpb24gdG8NCj4gPiA+IHRl
c3QgKi8NCj4gPiA+ICsJeGVfbXVsdGlncHVfbWFkdmlzZShncHUwLT5mZCwgdm1bMF0sIGFkZHIs
IFNaXzRLLCAwLA0KPiA+ID4gKwkJCcKgwqDCoCBEUk1fWEVfTUVNX1JBTkdFX0FUVFJfUFJFRkVS
UkVEX0xPQywNCj4gPiA+ICsJCQnCoMKgwqAgZ3B1MC0+ZmQsIDAsIGdwdTAtPnZyYW1fcmVnaW9u
c1swXSwNCj4gPiA+IGV4ZWNfcXVldWVbMF0sDQo+ID4gPiArCQkJwqDCoMKgIDAsIDApOw0KPiA+
ID4gKw0KPiA+ID4gKwlzZXR1cF9zeW5jKCZzeW5jLCAmc3luY19hZGRyLCBCSU5EX1NZTkNfVkFM
KTsNCj4gPiA+ICsJeGVfbXVsdGlncHVfcHJlZmV0Y2goZ3B1MC0+ZmQsIHZtWzBdLCBhZGRyLCBT
Wl80SywNCj4gPiA+ICZzeW5jLA0KPiA+ID4gKwkJCcKgwqDCoMKgIHN5bmNfYWRkciwgZXhlY19x
dWV1ZVswXSwNCj4gPiA+IHByZWZldGNoX3JlcSk7DQo+ID4gPiArDQo+ID4gPiArCXN5bmNfYWRk
ciA9ICh2b2lkICopKChjaGFyICopYmF0Y2hfYWRkciArIFNaXzRLKTsNCj4gPiA+ICsJc3luYy5h
ZGRyID0gdG9fdXNlcl9wb2ludGVyKCh1aW50NjRfdCAqKXN5bmNfYWRkcik7DQo+ID4gPiArCXN5
bmMudGltZWxpbmVfdmFsdWUgPSBFWEVDX1NZTkNfVkFMOw0KPiA+ID4gKwkqc3luY19hZGRyID0g
MDsNCj4gPiA+ICsNCj4gPiA+ICsJLyogRXhlY3V0aW5nIEFUT01JQ19JTkMgb24gR1BVMC4gKi8N
Cj4gPiA+ICsJeGVfZXhlY19zeW5jKGdwdTAtPmZkLCBleGVjX3F1ZXVlWzBdLCBiYXRjaF9hZGRy
LCAmc3luYywNCj4gPiA+IDEpOw0KPiA+ID4gKwlpZiAoKnN5bmNfYWRkciAhPSBFWEVDX1NZTkNf
VkFMKQ0KPiA+ID4gKwkJeGVfd2FpdF91ZmVuY2UoZ3B1MC0+ZmQsICh1aW50NjRfdCAqKXN5bmNf
YWRkciwNCj4gPiA+IEVYRUNfU1lOQ19WQUwsIGV4ZWNfcXVldWVbMF0sDQo+ID4gPiArCQkJwqDC
oMKgwqDCoMKgIE5TRUNfUEVSX1NFQyAqIDEwKTsNCj4gPiA+ICsNCj4gPiA+ICsJaWd0X2Fzc2Vy
dF9lcSgqc2hhcmVkX3ZhbCwgQVRPTUlDX09QX1ZBTCk7DQo+ID4gPiArDQo+ID4gPiArCWF0b21p
Y19iYXRjaF9pbml0KGdwdTEtPmZkLCB2bVsxXSwgYWRkciwgJmJhdGNoX2JvLA0KPiA+ID4gJmJh
dGNoX2FkZHIpOw0KPiA+ID4gKw0KPiA+ID4gKwkvKiBQbGFjZSBkZXN0aW5hdGlvbiBpbiBhbiBv
cHRpb25hbGx5IHJlbW90ZSBsb2NhdGlvbiB0bw0KPiA+ID4gdGVzdCAqLw0KPiA+IFdlJ3JlIGFj
dHVhbGx5IG5ldmVyIHVzaW5nIGEgcmVtb3RlIGxvY2F0aW9uIGhlcmU/IEl0J3MgYWx3YXlzDQo+
ID4gYWR2aXNlZA0KPiA+IHRvIGxvY2FsLg0KPiB3aWxsIGVkaXQgdGhlIGV4cGxhbmF0aW9uLg0K
DQpHcmVhdC4gSSB0aGluayB0aGlzIGdvZXMgZm9yIG1vc3QgdGVzdHMsIGFjdHVhbGx5IHNvIHBs
ZWFzZSByZXZpZXcgdGhpcw0KY29tbWVudCBmb3IgYWxsIHRlc3RzLg0KDQpUaGFua3MsDQpUaG9t
YXMNCg0KDQo+ID4gDQo+ID4gPiArCXhlX211bHRpZ3B1X21hZHZpc2UoZ3B1MS0+ZmQsIHZtWzFd
LCBhZGRyLCBTWl80SywgMCwNCj4gPiA+ICsJCQnCoMKgwqAgRFJNX1hFX01FTV9SQU5HRV9BVFRS
X1BSRUZFUlJFRF9MT0MsDQo+ID4gPiArCQkJwqDCoMKgIGdwdTEtPmZkLCAwLCBncHUxLT52cmFt
X3JlZ2lvbnNbMF0sDQo+ID4gPiBleGVjX3F1ZXVlWzBdLA0KPiA+ID4gKwkJCcKgwqDCoCAwLCAw
KTsNCj4gPiANCj4gPiANCj4gPiA+ICsNCj4gPiA+ICsJc2V0dXBfc3luYygmc3luYywgJnN5bmNf
YWRkciwgQklORF9TWU5DX1ZBTCk7DQo+ID4gPiArCXhlX211bHRpZ3B1X3ByZWZldGNoKGdwdTEt
PmZkLCB2bVsxXSwgYWRkciwgU1pfNEssDQo+ID4gPiAmc3luYywNCj4gPiA+ICsJCQnCoMKgwqDC
oCBzeW5jX2FkZHIsIGV4ZWNfcXVldWVbMV0sDQo+ID4gPiBwcmVmZXRjaF9yZXEpOw0KPiA+ID4g
Kw0KPiA+ID4gKwlzeW5jX2FkZHIgPSAodm9pZCAqKSgoY2hhciAqKWJhdGNoX2FkZHIgKyBTWl80
Syk7DQo+ID4gPiArCXN5bmMuYWRkciA9IHRvX3VzZXJfcG9pbnRlcigodWludDY0X3QgKilzeW5j
X2FkZHIpOw0KPiA+ID4gKwlzeW5jLnRpbWVsaW5lX3ZhbHVlID0gRVhFQ19TWU5DX1ZBTDsNCj4g
PiA+ICsJKnN5bmNfYWRkciA9IDA7DQo+ID4gPiArDQo+ID4gPiArCS8qIEV4ZWN1dGUgQVRPTUlD
X0lOQyBvbiBHUFUxICovDQo+ID4gPiArCXhlX2V4ZWNfc3luYyhncHUxLT5mZCwgZXhlY19xdWV1
ZVsxXSwgYmF0Y2hfYWRkciwgJnN5bmMsDQo+ID4gPiAxKTsNCj4gPiBJZiBncHUxIGhlcmUgZG9l
c24ndCBzdXBwb3J0IGZhdWx0cywgd2Ugc2hvdWxkbid0IGV4ZWN1dGUgdGhpcy4NCj4gU28gdGhp
cyBjb25kaXRpb24gaXMgYXBwbGljYWJsZSBmb3IgYWxsIHRlc3RzLiBpZiBmYXVsdCBub3Qgc3Vw
cG9ydGVkDQo+IHhlX2V4ZWNfc3luYyhncHh4LT5mZCwuLi4uLikgc2hvdWxkbid0IGJlIGNhbGxl
ZD8NCj4gPiANCj4gPiANCj4gPiA+ICsJaWYgKCpzeW5jX2FkZHIgIT0gRVhFQ19TWU5DX1ZBTCkN
Cj4gPiA+ICsJCXhlX3dhaXRfdWZlbmNlKGdwdTEtPmZkLCAodWludDY0X3QgKilzeW5jX2FkZHIs
DQo+ID4gPiBFWEVDX1NZTkNfVkFMLCBleGVjX3F1ZXVlWzFdLA0KPiA+ID4gKwkJCcKgwqDCoMKg
wqDCoCBOU0VDX1BFUl9TRUMgKiAxMCk7DQo+ID4gPiArDQo+ID4gPiArCWlndF9hc3NlcnRfZXEo
KnNoYXJlZF92YWwsIEFUT01JQ19PUF9WQUwgKyAxKTsNCj4gPiA+ICsNCj4gPiA+ICsJbXVubWFw
KCh2b2lkICopYmF0Y2hfYWRkciwgQkFUQ0hfU0laRShncHUwLT5mZCkpOw0KPiA+ID4gKwliYXRj
aF9maW5pKGdwdTAtPmZkLCB2bVswXSwgYmF0Y2hfYm8sIGJhdGNoX2FkZHIpOw0KPiA+ID4gKwli
YXRjaF9maW5pKGdwdTEtPmZkLCB2bVsxXSwgYmF0Y2hfYm8sIGJhdGNoX2FkZHIpOw0KPiA+ID4g
KwlmcmVlKGRhdGEpOw0KPiA+ID4gKw0KPiA+ID4gKwljbGVhbnVwX3ZtX2FuZF9xdWV1ZShncHUw
LCB2bVswXSwgZXhlY19xdWV1ZVswXSk7DQo+ID4gPiArCWNsZWFudXBfdm1fYW5kX3F1ZXVlKGdw
dTEsIHZtWzFdLCBleGVjX3F1ZXVlWzFdKTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArc3Rh
dGljIHZvaWQNCj4gPiA+ICtncHVfYXRvbWljX2luY193cmFwcGVyKHN0cnVjdCB4ZV9zdm1fZ3B1
X2luZm8gKnNyYywNCj4gPiA+ICsJCcKgwqDCoMKgwqDCoCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZv
ICpkc3QsDQo+ID4gPiArCQnCoMKgwqDCoMKgwqAgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3Nf
aW5zdGFuY2UgKmVjaSwNCj4gPiA+ICsJCcKgwqDCoMKgwqDCoCB2b2lkICpleHRyYV9hcmdzKQ0K
PiA+ID4gK3sNCj4gPiA+ICsJc3RydWN0IG11bHRpZ3B1X29wc19hcmdzICphcmdzID0gKHN0cnVj
dA0KPiA+ID4gbXVsdGlncHVfb3BzX2FyZ3MNCj4gPiA+ICopZXh0cmFfYXJnczsNCj4gPiA+ICsJ
aWd0X2Fzc2VydChzcmMpOw0KPiA+ID4gKwlpZ3RfYXNzZXJ0KGRzdCk7DQo+ID4gPiArDQo+ID4g
PiArCWF0b21pY19pbmNfb3Aoc3JjLCBkc3QsIGVjaSwgYXJncy0+cHJlZmV0Y2hfcmVxKTsNCj4g
PiA+ICt9DQo+ID4gPiArDQo+ID4gPiDCoMKgaWd0X21haW4NCj4gPiA+IMKgwqB7DQo+ID4gPiDC
oMKgCXN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gZ3B1c1tNQVhfWEVfR1BVU107DQo+ID4gPiBAQCAt
MzY0LDYgKzUxMSwxNCBAQCBpZ3RfbWFpbg0KPiA+ID4gwqDCoAkJZm9yX2VhY2hfZ3B1X3BhaXIo
Z3B1X2NudCwgZ3B1cywgJmVjaSwNCj4gPiA+IGdwdV9tZW1fYWNjZXNzX3dyYXBwZXIsICZvcF9h
cmdzKTsNCj4gPiA+IMKgwqAJfQ0KPiA+ID4gwqAgDQo+ID4gPiArCWlndF9zdWJ0ZXN0KCJhdG9t
aWMtaW5jLWdwdS1vcCIpIHsNCj4gPiA+ICsJCXN0cnVjdCBtdWx0aWdwdV9vcHNfYXJncyBhdG9t
aWNfYXJnczsNCj4gPiA+ICsJCWF0b21pY19hcmdzLnByZWZldGNoX3JlcSA9IDE7DQo+ID4gPiAr
CQlmb3JfZWFjaF9ncHVfcGFpcihncHVfY250LCBncHVzLCAmZWNpLA0KPiA+ID4gZ3B1X2F0b21p
Y19pbmNfd3JhcHBlciwgJmF0b21pY19hcmdzKTsNCj4gPiA+ICsJCWF0b21pY19hcmdzLnByZWZl
dGNoX3JlcSA9IDA7DQo+ID4gPiArCQlmb3JfZWFjaF9ncHVfcGFpcihncHVfY250LCBncHVzLCAm
ZWNpLA0KPiA+ID4gZ3B1X2F0b21pY19pbmNfd3JhcHBlciwgJmF0b21pY19hcmdzKTsNCj4gPiBT
YW1lIGNvbW1lbnQgaGVyZSBhcyBmb3IgdGhlIGZpcnN0IHRlc3QuDQo+ID4gDQo+ID4gL1Rob21h
cw0KPiA+IA0KPiA+IA0KPiA+IA0KPiA+ID4gKwl9DQo+ID4gPiArDQo+ID4gPiDCoMKgCWlndF9m
aXh0dXJlIHsNCj4gPiA+IMKgwqAJCWludCBjbnQ7DQo+ID4gPiDCoCANCg0K
