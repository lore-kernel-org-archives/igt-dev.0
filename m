Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5EBC021A6
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 10:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB82110EC34;
	Fri, 14 Feb 2025 10:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEoaLDNf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E874110EC34
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 10:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739528469; x=1771064469;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YAFHwMRZmrW+JWhZFz5X0v526eXISUMdr10C1KMONp4=;
 b=GEoaLDNfDyso8wA/FsM1zBNHVNOsr7w38rXHlBCZml/xYmX+0xnok8mr
 2YNyRsOwU9i9+GvfyrfQ9Ji8E1xeJl862Ulbf0BD4aXLmEuRYHfdlha/3
 E8tU5FkqRYC68IDB7j19cLpHrftBOr+Hw2xjdDdX8MX/e1eR9ki+3cZrH
 lpS8LquThc6XKwJTBbY5cqV1iFAH2uK3Iuc9i/ot/PQUt555YEDaKJG3Q
 SEprbJy9Nk1dfk1uFYkqTiHbMuDPpFiM304vQjesqtOm19lSBQ7x5MjQh
 JKd5oEDtBBY3Eap/TUv3RBdSRsj6JhLKz8mM/ylK5Uy/NrjjRd95mTprv Q==;
X-CSE-ConnectionGUID: q7HqYKiMStumFbYtwaPKtw==
X-CSE-MsgGUID: 70B3Vy4oRJu9zkzNzCa03A==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51670988"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="51670988"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:21:09 -0800
X-CSE-ConnectionGUID: w3f7KzDAQjeNZG40pnSiGg==
X-CSE-MsgGUID: LeP/hFuaRcW8AR3ciV8GrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="113400719"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 02:21:08 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 02:21:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 02:21:07 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 02:21:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppZJJLIn1lPtIxkO2RDzIr8KRXGdKTKNka70+U1A+E7b1xcC2uOL1CuLmoiKCy1HXDzpj8Cdty/jeVOnGEbJT6Qr+/a6Tfu7dUAMRaleuTHOpJXf0YpwnTpo6t51YjYJQDHTIILQ0CXEJSvxzii0+WsOlYXwe4wf1hMiB+9DW56yZitPZiM+duuOe4uHFZY+O7H8ouFhgdKW8fCyeHallu1SI1hD6xblvCAb9IQZJAEA/jiAARiSvfZ83SLc5myqKml50wd1rUd6rAyw5ia9QntrMjTyPn3esX0nIY/oEnecusCpnYpFvQAREyws+yLuqck2qnSihsMDOVphDJAYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAFHwMRZmrW+JWhZFz5X0v526eXISUMdr10C1KMONp4=;
 b=yf8WNBqeYdAXNBl5ZFdx4AR+n35VSGMFP/IpfLNKQKl34Rq6YvbkvHDgc4Gged/NjZHcEQjyXkBQBgIqopvqWDOFNURELfBldcNjuMB33WSCnFI9/scq7WIZV3LNh75DBnDT8jRCaad90P0UCJBS2eXKO2BnQtZeVurUks2p2bGxmhtu9FbYq+zzAQH68MtGiACumnlluk2MZOsAWYytptSgXgfUDXtUGdEV/PsLC5pIqK5cCcRkTEwcKIo8RSyH5DnfKn+PnYpALucAHlsx1f1oy0c3npOMJeAyqcIjjjyBaK8wrgMexMh4MFGkDuGL4MaMyvwecdBO4attlox5aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SA1PR11MB6735.namprd11.prod.outlook.com (2603:10b6:806:25e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Fri, 14 Feb
 2025 10:21:04 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 10:21:04 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, "Kolakowski, Jakub1"
 <jakub1.kolakowski@intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Winiarski, Michal"
 <michal.winiarski@intel.com>, "C V, Narasimha" <narasimha.c.v@intel.com>,
 "Piorkowski, Piotr" <piotr.piorkowski@intel.com>, "Lis, Tomasz"
 <tomasz.lis@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v2 i-g-t 5/5] tests/xe_sriov_scheduling: Get job timeout
 from sysfs
Thread-Topic: [PATCH v2 i-g-t 5/5] tests/xe_sriov_scheduling: Get job timeout
 from sysfs
Thread-Index: AQHbfX6/VLOjWbMFoUeviIBgLv59fbNGmSrQ
Date: Fri, 14 Feb 2025 10:21:04 +0000
Message-ID: <LV3PR11MB86959291580E8F412D59D23DF9FE2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250212184757.586071-1-marcin.bernatowicz@linux.intel.com>
 <20250212184757.586071-6-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250212184757.586071-6-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|SA1PR11MB6735:EE_
x-ms-office365-filtering-correlation-id: 789adcea-8849-47d6-484f-08dd4ce149b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R21lU3I5N2Rscm4xR3dMWk9vZkwyMFNQT1NWY2dDYVRUdlNvd2ZNT2xwRmti?=
 =?utf-8?B?OXpwd0FWMzdzaHVtVjhRYmdUOVQveTdQTHg4OGxVOStNTU1VWTFRd2RJM0Z5?=
 =?utf-8?B?bFRQb3ZxcFQ1VThmOUdPSlJVRzFobkNRTVRydmxTM05ZYWwrc3FGN1ZvL0lL?=
 =?utf-8?B?V3BtaHRlSnhZV2t4MEVHZFk0ZW0wTXVvTFhUSWljTE1JZEZ2aWE2MmxHaHlq?=
 =?utf-8?B?NFM3a3N0cDA2Q09henU0RkIvbzg3T2JIQVBBQUFEREQ2M2Viazc1bHRVMzNI?=
 =?utf-8?B?dmhvMUIvVFlRY3lTN0hwNm1rK3QwVE1aa1N0ZWtGazlYV0Ftbm11RmZPTyt1?=
 =?utf-8?B?azN6S0w4ckxyRm1iaTYrR0lKbzhEazdrMkp3VzdLZE5UTDhnNEZXQWFJZ2l4?=
 =?utf-8?B?UnZ6NUhvUDJLVHk4bzZvR1NVV0lMOFFBb2RLSzRJcURqV29uU3dVR0VKL1JL?=
 =?utf-8?B?YkU5dzN4ZTFQQVluZGRiZzJ0ZzN5cW1GSEFWSWJHZ204VC8xWnZnWC91WHlM?=
 =?utf-8?B?eUgycGREVWdHLzBEWUdyL2lBejQybnNPVjBlZ1lIQVV2OXFoT3cxbnUzYlJN?=
 =?utf-8?B?d3dRK2N6OHJ5bCt3Wk5Scm1nYytYemRmcyt6Qm8zbVFsSXljQWppajA1RWFr?=
 =?utf-8?B?SHkyQXB3QjlES3h4R3BWRmRxYXB1WlVUc2ZUN0xGWFk0WFJSbEszQzlDQjU0?=
 =?utf-8?B?VlU5ajhhaVNBVzVnb0dTSnpkTXMvWmR1Smp0SlBJMlY3TzJOZmwwMGFDQU9l?=
 =?utf-8?B?TWZYOGU5K2g0THo1RVhxZEc5QjBDNFdUVkhqejduTi9UNUEzNTVkYkg5WFhS?=
 =?utf-8?B?azRNSVp5NVBqVlFhY0czNnhwTW5IYUdIUk5aOUVtczBMOEhCNDdnaUxoeC9H?=
 =?utf-8?B?ckluSDA5Qkw3eGdMMWV3WllpMXVwYWt2U2w1cXZJS1pPMEV1d05iQldHL0xG?=
 =?utf-8?B?aDUvUlJBNXJXbHlGRUFYWmZyUWt1RC94c2h0K0dMTWdaZkR1anlqRG1DeXZt?=
 =?utf-8?B?MDJpME5VclErNDVjWFJ0N2lYdVFLd0tJZUtCWFFWWUFKQUtYM1dQVHhXLzVC?=
 =?utf-8?B?WldwbFNpN1pINmo0L05ybG9Udk52em43RUVsNmM5ZjFhYmtUbUxXRytXcFEv?=
 =?utf-8?B?OEJrMkFIcUYxQ1ByQTU1VDFOTnBDZklmYVdCZEt0NCtpQkUzUDNFZTRqTEw2?=
 =?utf-8?B?NjZqTHZuL2IvWXVnTDIrUkhRK3VRN25RWU5BSll4VnNaTHpSdi9CUzVIUXVT?=
 =?utf-8?B?bGZpNUkwR25hK3NUS2NSMTJVZVpCMllxOHh5VkV4TnZxZ2NiRDJoYWRXdXo4?=
 =?utf-8?B?d3UxOHlTVVdiZk4rWmVqeTNsdjN4YUp3Q01EakhXckJWcjh2VEw2MnlRTWx4?=
 =?utf-8?B?WFVTK2RheGFJVW1VOHdqOUpOdEQ4VEpNOEZWZ01PYUNyUkNXaXZudS8wWVI3?=
 =?utf-8?B?OE1sL3lIYmpqck42NXNqdW54WmordStCeEc4VkZITGRhU3hWT1BiYUNCNU5Z?=
 =?utf-8?B?c2tEYzdMQjJUQ0RYZUJEem5ibFp0K3YwaFJnNmMvV2RPKyt1eXMxK0FYZ3E3?=
 =?utf-8?B?cW91UE9EZHpybGJod0xEbElXa0JpR2YyZjkxcVphb2hFSDEwaDZkZFhQNHdq?=
 =?utf-8?B?azVDejZ2akg1dGRrZkdxRGNsOUtjVHI2d1RMVmxLUDJMREg3c01nMlpkeWNs?=
 =?utf-8?B?SWVObVN1VVlxVlVvZ2Q1V1VJZEIxUW1GK1JXYlp1WXJlQXg1clZpZnFHSEpS?=
 =?utf-8?B?V0kyZU1EWExJM2htRmxrZU11ZW1lclRSakFIMVpZMHJNcjRLSTVtWlhqUlBB?=
 =?utf-8?B?enR0TklZVlczb2gzU21vYkNVeTJMeEQ2YlBMaG9WNFM4UHRqSUFuMCs2MWJy?=
 =?utf-8?B?Rms3L1JrTHlvUjdKbm9MMWVzRkJlaGdZdnZrdFZEZEZsK2drRFA1NVZpRFQ2?=
 =?utf-8?Q?Sj0MS+vzrgMmZ1taernofDXdts+Czy9P?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nmx5SFIxZWd2UGZqbExpamYxY2Q5aDdHa3o2dGJJb25oQ29ScE9jYjZ2NCsz?=
 =?utf-8?B?QzhINXFMNXFqOFEwTzhDVWE2RWdoTXFDdGR2ek5sNWQrSTFFZnd2TjlUS01Q?=
 =?utf-8?B?TmJHZFA4MWw2WHFkVXpoV0RDUjBzV2ZIUDZPS0Vtbm9mdlNmeWhjajRYZGtM?=
 =?utf-8?B?dHdxSFl4TWo1dVRkbGFLeWNoeXNTc2htdVRSRDZFQ2liYUtreG5vTEwrWWxm?=
 =?utf-8?B?dXJBWWk0L3ZoMnZVVTJFQitRL3NMSC9nUzdEWW5kRDJjZFFXOUlKdDJ5ZzRC?=
 =?utf-8?B?R3YzS01Rdk1KV1ZZaCtXWHB2M2YvMUdoTWVTV3NZQzZpK2xLaDBVWjlQbE1G?=
 =?utf-8?B?VmkrZjJ2ZnZ3RGtueGN6NGpodi84Tzl2K0RYMDgrYTgzV01MK2t0Zk15ZTVQ?=
 =?utf-8?B?Y1pHajBtcW52KzJwNTNRNmZrbHRyZDArN1ZtQnZNamVLK0xaR1N1T3NXOXcz?=
 =?utf-8?B?cTVDTEZqY0hPd2ZYSjdDMHpaeUlOSWVERCtaMzlkZ1NVNmZISHY3Z3hTNkRX?=
 =?utf-8?B?bHJSMkd2RXppOTg1d0pPUWowREFOeTl4L0thanlqQ1BXOUZUV3lGbWhMblh0?=
 =?utf-8?B?L1dNSSt2TkdZWnFyaTA3ZDVFa3l5Nm0vbjdXOWY1dmJxZ1Z5Y0t6UUp5a1pJ?=
 =?utf-8?B?K3Y0a1BhME9nSndlcWEvcktTTWtsTVJMRzJNbmFGQVNSL3BrRDZNN3VvQVE2?=
 =?utf-8?B?TGp3L1NCZ2Q5SkpxdzA3UmUwUTE0anZmNXpOSDBLS3JDRjROTVlsbHJTWjNJ?=
 =?utf-8?B?YlJiRzJCL2U0QmtObUxxVmxmc09ZU0dvL2lzRkcvNFBuOVpmSlJ5Q2VtTnk0?=
 =?utf-8?B?dExobnltR1FzNmZmbEg0KzdiSFdPbXRIbE8zbTlBTEtJRWl5NS9QaFhoa2Fm?=
 =?utf-8?B?dEs4MVZVQ2JWVGhxdXVZMjlWT3BGbVFNWHRDY3BnNGVoVzRrK1RLUW00VG1T?=
 =?utf-8?B?dCsxMkZZNmRNczJCMDg5ell3TS9DWlo2cTNVZUxIWkpMY216dWlVSjA5TSts?=
 =?utf-8?B?UGlDMzB3QnpjQjRvQkpLMEFGRTJmWEJaajhrdkZScUIvN29LVk9YN2U0bFpV?=
 =?utf-8?B?TUZvUFRkdHFWUVVSSWx6TTBZMjY2UmI1LzNGZ241L0lXQjExa2YwclVGdXMv?=
 =?utf-8?B?dm5wd0RaNGVJNUZZeERzcTBrdzhibUNqOU1NTFk0SndiRHdzemtpeVBaVVJo?=
 =?utf-8?B?MjB2cHljazNWaWowZVgyeE5nWXk3ZURqb1p4Q05rVk9kVjZ1aFRCSHlqVjdz?=
 =?utf-8?B?RjI4Zm1vNkJQaHBhK2Q1YUNCTGUxSVhHWE1kdGp0dWZhMjVheHF2MVJZV1c5?=
 =?utf-8?B?U3hwTWZDSUczeXJOVzQ4YzBzSmlKNndZRnVMTjNseXZwTHkvbnFrSXdEMkEr?=
 =?utf-8?B?eGtwd094bTFmSnhZOWFDVUxPdHJJOGZtY1dGc0VISXlteVNUWmRCbFZFSEVm?=
 =?utf-8?B?UXRLNGd2YUhFbXV5ckxpOWU0YXNadFdqbm9jTnhadTAxY0RJb3d0K2V6RkNl?=
 =?utf-8?B?OGd5cHZ5YWpXNnR3c2k0V2h1QzFOWjI5M1JrbWk3aC9EM0NwT2ZPZldHbFIw?=
 =?utf-8?B?dVh1ekVseWMxYnRJN1UzY0xNYytsZ1dWa2d4a01RcERkeWRMSUNOSzUyck0r?=
 =?utf-8?B?RDNUNFZRalBPKysvSkNUbDkwMmFFQ3l1dmRzcjdNSVJYS3RsMzE5c1FNbFA5?=
 =?utf-8?B?Y2xoQzVGTGlmdFlZN1U4NDRkbUkyU1ViS0dTRUl2ZUhYOVU1K29lZ3dHNTdw?=
 =?utf-8?B?K05XK1NOdTY2S0xHMm9ROVFNOVhrZVpHc3lyYWVNT29weUtzVW1qS1IxaTJo?=
 =?utf-8?B?L0tHaElHeTM5c2IxcDdqWDUvL1UrSDZUR0xMNkgwVEpyeDJZZlRKcCs4dmh0?=
 =?utf-8?B?VWJndjBOcWtHV3FhOENkUFdMRytsV0FYblg5ckxQTGN2NFpkbU1uUzYyVkdV?=
 =?utf-8?B?bmlJSWkzR2pyRTJsN0NLdkJpaDBCRmNGVVh1QWVoWGxaOG0yUjg5eloxcXpX?=
 =?utf-8?B?dXZKZnZBemN0djBqT1IwYnJmU1ZYSzNuT0s0ZGlxQktYUFBKWm5OQk9PeXNE?=
 =?utf-8?B?OE05SGg2WjJ4bHpIZzRCMU0yNHF1SFJIMjdrVVZVczZMd01vTHA5RnJOZ2Qz?=
 =?utf-8?B?dWdMalRGRUw0dUJUSnF5a3lVd0Q5Q3puQ0ZaOFpYU1AvcVBNNEl4bGdPZXlv?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 789adcea-8849-47d6-484f-08dd4ce149b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 10:21:04.3860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDwwrdS4oFiXDFQW7KbFf8he/3SEk0FAtS4LehzouZEI9qJRDViPfOiDW/5oopqZ5l0vj5o/H6P7T8Yi46fdZGXlATENDFRSCv//+G+Jgls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6735
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

SGkuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyY2luIEJlcm5h
dG93aWN6IDxtYXJjaW4uYmVybmF0b3dpY3pAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVy
c2RheSwgRmVicnVhcnkgMTMsIDIwMjUgMTI6MTggQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBNYXJjaW4gQmVybmF0b3dpY3ogPG1hcmNpbi5iZXJuYXRvd2lj
ekBsaW51eC5pbnRlbC5jb20+OyBBZGFtDQo+IE1pc3pjemFrIDxhZGFtLm1pc3pjemFrQGxpbnV4
LmludGVsLmNvbT47IEtvbGFrb3dza2ksIEpha3ViMQ0KPiA8amFrdWIxLmtvbGFrb3dza2lAaW50
ZWwuY29tPjsgTGFndW5hLCBMdWthc3ogPGx1a2Fzei5sYWd1bmFAaW50ZWwuY29tPjsNCj4gV2Fq
ZGVjemtvLCBNaWNoYWwgPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPjsgV2luaWFyc2tpLCBN
aWNoYWwNCj4gPG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29tPjsgQyBWLCBOYXJhc2ltaGEgPG5h
cmFzaW1oYS5jLnZAaW50ZWwuY29tPjsNCj4gUGlvcmtvd3NraSwgUGlvdHIgPHBpb3RyLnBpb3Jr
b3dza2lAaW50ZWwuY29tPjsgSyBWIFAsIFNhdHlhbmFyYXlhbmENCj4gPHNhdHlhbmFyYXlhbmEu
ay52LnBAaW50ZWwuY29tPjsgTGlzLCBUb21hc3ogPHRvbWFzei5saXNAaW50ZWwuY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0ggdjIgaS1nLXQgNS81XSB0ZXN0cy94ZV9zcmlvdl9zY2hlZHVsaW5nOiBH
ZXQgam9iIHRpbWVvdXQgZnJvbQ0KPiBzeXNmcw0KPiANCj4gUmVwbGFjZSBoYXJkY29kZWQgSk9C
X1RJTUVPVVRfTVMgd2l0aCBzeXNmc19nZXRfam9iX3RpbWVvdXRfbXMoKSB0bw0KPiBkeW5hbWlj
YWxseSByZXRyaWV2ZSB0aGUgdmFsdWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJjaW4gQmVy
bmF0b3dpY3ogPG1hcmNpbi5iZXJuYXRvd2ljekBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBBZGFt
IE1pc3pjemFrIDxhZGFtLm1pc3pjemFrQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IEpha3ViIEtv
bGFrb3dza2kgPGpha3ViMS5rb2xha293c2tpQGludGVsLmNvbT4NCj4gQ2M6IEx1a2FzeiBMYWd1
bmEgPGx1a2Fzei5sYWd1bmFAaW50ZWwuY29tPg0KPiBDYzogTWljaGHFgiBXYWpkZWN6a28gPG1p
Y2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiBDYzogTWljaGHFgiBXaW5pYXJza2kgPG1pY2hh
bC53aW5pYXJza2lAaW50ZWwuY29tPg0KPiBDYzogTmFyYXNpbWhhIEMgViA8bmFyYXNpbWhhLmMu
dkBpbnRlbC5jb20+DQo+IENjOiBQaW90ciBQacOzcmtvd3NraSA8cGlvdHIucGlvcmtvd3NraUBp
bnRlbC5jb20+DQo+IENjOiBTYXR5YW5hcmF5YW5hIEsgViBQIDxzYXR5YW5hcmF5YW5hLmsudi5w
QGludGVsLmNvbT4NCj4gQ2M6IFRvbWFzeiBMaXMgPHRvbWFzei5saXNAaW50ZWwuY29tPg0KPiAt
LS0NCkxHVE0uDQpSZXZpZXdlZC1ieTogU2F0eWFuYXJheWFuYSBLIFYgUCA8c2F0eWFuYXJheWFu
YS5rLnYucEBpbnRlbC5jb20+DQo+ICB0ZXN0cy9pbnRlbC94ZV9zcmlvdl9zY2hlZHVsaW5nLmMg
fCAzMCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
MiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ludGVsL3hlX3NyaW92X3NjaGVkdWxpbmcuYw0KPiBiL3Rlc3RzL2ludGVsL3hlX3NyaW92X3Nj
aGVkdWxpbmcuYw0KPiBpbmRleCBmZTAzN2MxZGMuLjgyYzUyNWZlMyAxMDA2NDQNCj4gLS0tIGEv
dGVzdHMvaW50ZWwveGVfc3Jpb3Zfc2NoZWR1bGluZy5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hl
X3NyaW92X3NjaGVkdWxpbmcuYw0KPiBAQCAtNSw2ICs1LDcgQEANCj4gICNpbmNsdWRlICJpZ3Qu
aCINCj4gICNpbmNsdWRlICJpZ3Rfc3Jpb3ZfZGV2aWNlLmgiDQo+ICAjaW5jbHVkZSAiaWd0X3N5
bmNvYmouaCINCj4gKyNpbmNsdWRlICJpZ3Rfc3lzZnMuaCINCj4gICNpbmNsdWRlICJ4ZV9kcm0u
aCINCj4gICNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPiAgI2luY2x1ZGUgInhlL3hlX3NwaW4u
aCINCj4gQEAgLTQyMyw3ICs0MjQsNiBAQCBzdGF0aWMgdm9pZCBsb2dfc2FtcGxlX3ZhbHVlcyhj
aGFyICppZCwgc3RydWN0DQo+IHN1Ym1fc3RhdHMgKnN0YXRzLA0KPiAgI2RlZmluZSBNSU5fRVhF
Q19RVUFOVFVNX01TIDgNCj4gICNkZWZpbmUgTUFYX0VYRUNfUVVBTlRVTV9NUyAzMg0KPiAgI2Rl
ZmluZSBNSU5fSk9CX0RVUkFUSU9OX01TIDE2DQo+IC0jZGVmaW5lIEpPQl9USU1FT1VUX01TIDUw
MDANCj4gICNkZWZpbmUgTUFYX1RPVEFMX0RVUkFUSU9OX01TIDE1MDAwDQo+ICAjZGVmaW5lIFBS
RUZFUlJFRF9UT1RBTF9EVVJBVElPTl9NUyAxMDAwMA0KPiAgI2RlZmluZSBNQVhfUFJFRkVSUkVE
X1JFUEVBVFMgMTAwDQo+IEBAIC00MzQsNiArNDM0LDE4IEBAIHN0cnVjdCBqb2Jfc2NoZWRfcGFy
YW1zIHsNCj4gIAlzdHJ1Y3QgdmZfc2NoZWRfcGFyYW1zIHNjaGVkX3BhcmFtczsNCj4gIH07DQo+
IA0KPiArc3RhdGljIHVpbnQzMl90IHN5c2ZzX2dldF9qb2JfdGltZW91dF9tcyhpbnQgZmQsIHN0
cnVjdA0KPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2kpDQo+ICt7DQo+ICsJaW50
IGVuZ2luZV9kaXI7DQo+ICsJdWludDMyX3QgcmV0Ow0KPiArDQo+ICsJZW5naW5lX2RpciA9IHhl
X3N5c2ZzX2VuZ2luZV9vcGVuKGZkLCBlY2ktPmd0X2lkLCBlY2ktPmVuZ2luZV9jbGFzcyk7DQo+
ICsJcmV0ID0gaWd0X3N5c2ZzX2dldF91MzIoZW5naW5lX2RpciwgImpvYl90aW1lb3V0X21zIik7
DQo+ICsJY2xvc2UoZW5naW5lX2Rpcik7DQo+ICsNCj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiAr
DQo+ICBzdGF0aWMgdWludDMyX3QgZGVyaXZlX3ByZWVtcHRfdGltZW91dF91cyhjb25zdCB1aW50
MzJfdA0KPiBleGVjX3F1YW50dW1fbXMpDQo+ICB7DQo+ICAJcmV0dXJuIGV4ZWNfcXVhbnR1bV9t
cyAqIDIgKiBVU0VDX1BFUl9NU0VDOw0KPiBAQCAtNTM5LDE1ICs1NTEsMTYgQEAgc3RhdGljIHZv
aWQgdGhyb3VnaHB1dF9yYXRpbyhpbnQgcGZfZmQsIGludA0KPiBudW1fdmZzLCBjb25zdCBzdHJ1
Y3Qgc3VibV9vcHRzICpvcHQNCj4gIHsNCj4gIAlzdHJ1Y3Qgc3VibV9zZXQgc2V0XyA9IHt9LCAq
c2V0ID0gJnNldF87DQo+ICAJdWludDhfdCB2Zl9pZHNbbnVtX3ZmcyArIDEgLypQRiovXTsNCj4g
Kwl1aW50MzJfdCBqb2JfdGltZW91dF9tcyA9IHN5c2ZzX2dldF9qb2JfdGltZW91dF9tcyhwZl9m
ZCwNCj4gJnhlX2VuZ2luZShwZl9mZCwgMCktPmluc3RhbmNlKTsNCj4gIAlzdHJ1Y3Qgam9iX3Nj
aGVkX3BhcmFtcyBqb2Jfc2NoZWRfcGFyYW1zID0NCj4gcHJlcGFyZV9qb2Jfc2NoZWRfcGFyYW1z
KG51bV92ZnMgKyAxLA0KPiAtDQo+IEpPQl9USU1FT1VUX01TLA0KPiArDQo+IGpvYl90aW1lb3V0
X21zLA0KPiANCj4gb3B0cyk7DQo+IA0KPiAtCWlndF9pbmZvKCJlcT0ldW1zIHB0PSV1dXMgZHVy
YXRpb249JXVtcyByZXBlYXRzPSVkDQo+IG51bV92ZnM9JWRcbiIsDQo+ICsJaWd0X2luZm8oImVx
PSV1bXMgcHQ9JXV1cyBkdXJhdGlvbj0ldW1zIHJlcGVhdHM9JWQNCj4gbnVtX3Zmcz0lZCBqb2Jf
dGltZW91dD0ldW1zXG4iLA0KPiAgCQkgam9iX3NjaGVkX3BhcmFtcy5zY2hlZF9wYXJhbXMuZXhl
Y19xdWFudHVtX21zLA0KPiAgCQkgam9iX3NjaGVkX3BhcmFtcy5zY2hlZF9wYXJhbXMucHJlZW1w
dF90aW1lb3V0X3VzLA0KPiAgCQkgam9iX3NjaGVkX3BhcmFtcy5kdXJhdGlvbl9tcywNCj4gam9i
X3NjaGVkX3BhcmFtcy5udW1fcmVwZWF0cywNCj4gLQkJIG51bV92ZnMgKyAxKTsNCj4gKwkJIG51
bV92ZnMgKyAxLCBqb2JfdGltZW91dF9tcyk7DQo+IA0KPiAgCWluaXRfdmZfaWRzKHZmX2lkcywg
QVJSQVlfU0laRSh2Zl9pZHMpLA0KPiAgCQkgICAgJihzdHJ1Y3QgaW5pdF92Zl9pZHNfb3B0cyl7
IC5zaHVmZmxlID0gdHJ1ZSwNCj4gQEAgLTYzMSwxNiArNjQ0LDE3IEBAIHN0YXRpYyB2b2lkIG5v
bnByZWVtcHRfZW5naW5lX3Jlc2V0cyhpbnQgcGZfZmQsDQo+IGludCBudW1fdmZzLA0KPiAgCQkJ
CSAgICAgY29uc3Qgc3RydWN0IHN1Ym1fb3B0cyAqb3B0cykNCj4gIHsNCj4gIAlzdHJ1Y3Qgc3Vi
bV9zZXQgc2V0XyA9IHt9LCAqc2V0ID0gJnNldF87DQo+ICsJdWludDMyX3Qgam9iX3RpbWVvdXRf
bXMgPSBzeXNmc19nZXRfam9iX3RpbWVvdXRfbXMocGZfZmQsDQo+ICZ4ZV9lbmdpbmUocGZfZmQs
IDApLT5pbnN0YW5jZSk7DQo+ICAJc3RydWN0IHZmX3NjaGVkX3BhcmFtcyB2Zl9zY2hlZF9wYXJh
bXMgPQ0KPiBwcmVwYXJlX3ZmX3NjaGVkX3BhcmFtcyhudW1fdmZzLCAxLA0KPiAtDQo+IEpPQl9U
SU1FT1VUX01TLCBvcHRzKTsNCj4gKw0KPiBqb2JfdGltZW91dF9tcywgb3B0cyk7DQo+ICAJdWlu
dDY0X3QgZHVyYXRpb25fbXMgPSAyICogdmZfc2NoZWRfcGFyYW1zLmV4ZWNfcXVhbnR1bV9tcyAr
DQo+ICAJCQkgICAgICAgdmZfc2NoZWRfcGFyYW1zLnByZWVtcHRfdGltZW91dF91cyAvDQo+IFVT
RUNfUEVSX01TRUM7DQo+ICAJaW50IHByZWVtcHRpYmxlX2VuZCA9IDE7DQo+ICAJdWludDhfdCB2
Zl9pZHNbbnVtX3ZmcyArIDEgLypQRiovXTsNCj4gDQo+IC0JaWd0X2luZm8oImVxPSV1bXMgcHQ9
JXV1cyBkdXJhdGlvbj0lbHVtcyBudW1fdmZzPSVkXG4iLA0KPiAtCQkgdmZfc2NoZWRfcGFyYW1z
LmV4ZWNfcXVhbnR1bV9tcywNCj4gLQkJIHZmX3NjaGVkX3BhcmFtcy5wcmVlbXB0X3RpbWVvdXRf
dXMsIGR1cmF0aW9uX21zLA0KPiBudW1fdmZzKTsNCj4gKwlpZ3RfaW5mbygiZXE9JXVtcyBwdD0l
dXVzIGR1cmF0aW9uPSVsdW1zIG51bV92ZnM9JWQNCj4gam9iX3RpbWVvdXQ9JXVtc1xuIiwNCj4g
KwkJIHZmX3NjaGVkX3BhcmFtcy5leGVjX3F1YW50dW1fbXMsDQo+IHZmX3NjaGVkX3BhcmFtcy5w
cmVlbXB0X3RpbWVvdXRfdXMsDQo+ICsJCSBkdXJhdGlvbl9tcywgbnVtX3Zmcywgam9iX3RpbWVv
dXRfbXMpOw0KPiANCj4gIAlpbml0X3ZmX2lkcyh2Zl9pZHMsIEFSUkFZX1NJWkUodmZfaWRzKSwN
Cj4gIAkJICAgICYoc3RydWN0IGluaXRfdmZfaWRzX29wdHMpeyAuc2h1ZmZsZSA9IHRydWUsDQo+
IC0tDQo+IDIuMzEuMQ0KDQo=
