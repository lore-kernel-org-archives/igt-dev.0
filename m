Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B5DD591A9
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 17:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00EC10E270;
	Mon, 18 Nov 2024 17:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSXtTbgR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E7F10E270
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 17:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731951463; x=1763487463;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XxU9+zh2Y8/jbii1Zq2tura3z8A7/BvIguk11sNhNM4=;
 b=CSXtTbgRsCXx+asKi0BzE5FSfSvmPvV6LFdJn47wVO8ZKGVdX0HqFNFD
 Ntpd/ZxE9uixpTQz7GqvZN0Mj8Bfxg+G+T5nPKEB5rBn54rDra1vNgXv9
 0zTYiwgsTMLVpg+YYhvHNMIdkScOcJd2B5raNF1J6Ge3tb62XtckMmJO9
 9tzA9ufefpCHeQ0lrv3r6t84ESsrmDlCMjSY5eN9liZAUMytvUeV7ZE3I
 AKiOFbSF+YB2ga5I4FONc2G82Y2YbGwMoklfQD3h17BV8vIX/D1zNLtWn
 SAL14KIUoMk40QjgCYyHISyv0rVTUmViDLPUo420b/hpxkLTI7vvgeefz w==;
X-CSE-ConnectionGUID: TbFJfspRQ4ai8QTpo4C5Kg==
X-CSE-MsgGUID: 3utfKyPBS9G7UEwrmOWBkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42559926"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="42559926"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 09:37:42 -0800
X-CSE-ConnectionGUID: 6lmtialIQEO6b8hH4omzuQ==
X-CSE-MsgGUID: HGP1I7HCSKSasJN69YKjzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89217431"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 09:37:42 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 09:37:41 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 09:37:41 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 09:37:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0oS6AUgMnmCIzkpv/00BR9yIMQXkPV9C9/jnOMcMaQr6Vk/fZAsb1pK/Sxa9+qm0B9WHl/uSs37HkqwMc94OiwVrhSDQ2bxAx8MLyMvaIxfJuDcUfXrD78SeUi1fmbtFFtyr5sXWpcaEwMdDV0FNNEN5+soj6CKvAI9Z7g9twtmw9hpoh01ykDZlidoYRM4Gbd0EJ1lQMMTC6AM+PwX7Sd0v2ANi9p7qGSE4DvG52FqKWDDKVnsPB6xl9GYxa4bOFCIxYlN8iNRaWmjMRQ/PR4DGcHKmXcERVpNV8j9xjklUJUTZOzaDGGQWphI8gRzmSo18FIyNy7MxD0dEIvqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxU9+zh2Y8/jbii1Zq2tura3z8A7/BvIguk11sNhNM4=;
 b=snseEo0XUyXbvRwcBlGBlJjGQ10SISNI/fJsxhK7Na+Raqbgfkp5yEMK+uRtX4K05keqzzU5FFk6Cgv6v2Ep6NxYfty7yi764uInmQiWpW9FMvBRqqkI8kk+uL6Qa7aBZztEbcxycPZ51sJ8BKWPrt/GanB+s6a9akEzaBl33hCqDLgFKuXenjUlHbclHgW+RQGof8LpR8ECgAb5ch/A/JN+SG66/l8DCl8H3CKsJqU3kBNA4N/0mKT0FiqueNrXF00qcLx5hLFlqNM0hWtGLR74c41WA6Mym14aXqJc/EBGN/8i/JSvSCO7kZQ4+X7A/2/mVQraDr6/3fZLQClvbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by LV8PR11MB8581.namprd11.prod.outlook.com (2603:10b6:408:1e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 18 Nov
 2024 17:37:09 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 17:37:09 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nerlige
 Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t] lib/xe/oa: Re-instate TestOa metric sets in LNL/BMG
 XML's
Thread-Topic: [PATCH i-g-t] lib/xe/oa: Re-instate TestOa metric sets in
 LNL/BMG XML's
Thread-Index: AQHbNwULxtQqP8nnpUOmJ8D4k65T7bK9TiSAgAACbQCAAAJdAA==
Date: Mon, 18 Nov 2024 17:37:09 +0000
Message-ID: <b42df3f01e6053edf9ad4eda96c3eb0dbdaaafc9.camel@intel.com>
References: <20241115022031.3794406-1-ashutosh.dixit@intel.com>
 <07c5107ce34654d1d484eb301d12e46831a22fb6.camel@intel.com>
 <854j44xxh5.wl-ashutosh.dixit@intel.com>
In-Reply-To: <854j44xxh5.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|LV8PR11MB8581:EE_
x-ms-office365-filtering-correlation-id: f6990553-5cd5-4f5e-52eb-08dd07f7a0c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cVMrSnpkQlVBcDVkVGErSVRVM2ovWG9ha2hkdkFUK1hheldFWGZsVVk5LzND?=
 =?utf-8?B?THFlNkxQYzdGUzY3WHZpUFdiVTVIM21XM1h4MHFVeUZVZHhDU0RsaUxnOUpF?=
 =?utf-8?B?K3c5ejNWdHB1Unc5dm10M3dWdE93N0tRbGEwNWRiU0ZiMm1HVE1yOUNZbFpZ?=
 =?utf-8?B?b0dreFNPVzd1YzJkNnBZOWtGV0dNQXJFSUhDMHByTnZZbFhVcUQ0VlArMEdx?=
 =?utf-8?B?RUFyTkJDZXZjb1BtSFg4MTZVUTk5N3FKRHAyUzhxaHhiMTJsb0Vma1VqdXV4?=
 =?utf-8?B?MnB0RkZscTF2cG1yeUxBVVNiMytlUjRHKzhranovTWJLZVFpRTRUOUt3MjdO?=
 =?utf-8?B?NExsZlBIaHMycGJMWkp1b2JlUTVPRVJEcnQxNFY5WVJ0RmZQeXJMRmpjNTJs?=
 =?utf-8?B?cWtnUWJQalFSUDkvSEpaUVR1VCtYRTk0VTJYbkxkLzVxa1VCT2VMRlAxZ0Ns?=
 =?utf-8?B?U2R2ZHVZM1kxc3R0cjhxVG9TSHV6YjZoWTd6NGpPZzdsUXRidFhuZU1TOXBD?=
 =?utf-8?B?YkJSdzFvRlgxMHpZZUtkZmdKRUd1SkZaSXpscVAxbGV1ZXdpZGJNY092SllJ?=
 =?utf-8?B?TUdET2tBd0JVanBQQVdLV3RBTkxJMFRseUN5QjRlenVqblk1UzZSZ0VhU3Zq?=
 =?utf-8?B?U0FWQ08rMG9Id1pZd3I4VDVzTW04YkZOMXhSU24vdEkzcHgwZ2NxMnpWRGlL?=
 =?utf-8?B?RzQ1clhxdzlqTE94MHpMNkxRTkV2eTduQlhwK3pSNGVqOERzV0pkalpXVmVp?=
 =?utf-8?B?ak0wVlQ0Sk8zek1sMEdVeXUvQ21ScUFXaDFiWHhBTkU2cVN5bExXaDBISE1H?=
 =?utf-8?B?eDlTM3orSmhoWWF1UnN1Y2R5N1ZuUjVPT3M4MEZLUW0yZTlHRHRSRUwxRWE3?=
 =?utf-8?B?L2ExRHZRMnNpZDcycXhSOHNyYTVUYnBXZmZWSG5qcjV0QTNzRUVMYVVzMUhR?=
 =?utf-8?B?MTZ0MlZXRWgwbVc1ZnM2ZVg2c0YwYk5tREh0U1hNMC84U0h5RktSdWxUVnY0?=
 =?utf-8?B?YUNMWDd4bmVNVUYzUzZxYzZicGM2NkZwRVhQbFhjU0N3aXN2bWpYZ0t3dGg0?=
 =?utf-8?B?aXhOWHdTSGxTbUs3akdiZ0NTd1ZWdUxOdXhPUGJBMit6T1lWMVd2SDNIcVZW?=
 =?utf-8?B?WVVCQUlKb2ZZdTZyOHNYRENzUDArb1dEdXNRQzJncFk2VXphMjBQcVR1QzI4?=
 =?utf-8?B?Q2xnSXZBbEQvdUdHRVhYOGdNbDBYREdTN09vdm1iSFJaQ0RtdDBWcjMxK2FH?=
 =?utf-8?B?aC9Xa1pvL2dTaTZ4SkR4a2Nad3EyNzMxM2h2OVVwTU9DWWl3MWxaWEk2bCt2?=
 =?utf-8?B?cGY4dVhIeEZkZHk1MEIzZVI4OEtpUmNKNm1DeHhtZU1tMXJzazZvc2txRzVu?=
 =?utf-8?B?cW5QNlRjRWdEcm1LUXZLVWR6OG4xcGdyZjFxQ2dkTDRMYXRTMmQrOEJSK0Fv?=
 =?utf-8?B?OTc3YnpHTCtUL0xHUWE5bytBZWNtRGpoSmxZSk9qb00rT0NFQkNYTWJSbTh4?=
 =?utf-8?B?WGU2emVEcTNVVWJIRWdVZXVOOEk3UVJQYWJyYUNET3BJWDR6TGREMXFTamg1?=
 =?utf-8?B?WmNHaTI0L3VGZEhYdURnNzFEYUpaYmpOY3lVODc0ZHBFdzRPYm9tbVBPU251?=
 =?utf-8?B?VFRhQlMyc2hwSVkzbTVRMm03WW1LTWF6WHhoUWUrb0ZMU1YrR2NOYk9JQlZM?=
 =?utf-8?B?ODN3Q0g5TnlWOHVacUoyWHg5TGlMWnpuYTZSeDBXNkt4WENPUXZ3Zm9SODVy?=
 =?utf-8?B?SjJITmJwU1NIUVI4YzZ0MUxSYmZLTVhXNGNoZkZqN1NFMnd0YlBBNGQxVGRa?=
 =?utf-8?Q?i0MECh8yAG+sEg3VQB5jnQxuHZnizY41+Zkd0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zm0zVlBsNHlXaXV5R2NmODVBOFJOaFhSa0lUWlh4Tmh3aE9hNnMxQ1VCR2lS?=
 =?utf-8?B?UzJCMTVUSjF6VUdzOGJqR2JIdnpNZ1M2VGhid29nSVZDd3RVeTlhK2VGeDRT?=
 =?utf-8?B?MXRrTCtKclNFaEREVStuazRWbVZlSFBoYUNFTkFCaHA1SVk4a3dmdXFwcUcy?=
 =?utf-8?B?T05OQVZKRVhQak96b2RLSkRvd2h2OER6WEU0S0NkaVpIVWNNQlJiQjVBS04x?=
 =?utf-8?B?YWJ4K2F3bFRuSHI5c25vaytLVkNyaHNnWU1Ld2VDalNjOGhPOHVKQzlFUnE1?=
 =?utf-8?B?WlNleUJ3aVlLRGVRMGpGVjVuUElvVWw0VWt6WlBzSE9GUTZIVjltSHB1VHMw?=
 =?utf-8?B?enVJMkE3NzJaeDN1WFNtdXRNdE8xNktEMW9HbTcvQmpMK2ROMUNqNTRTY2JH?=
 =?utf-8?B?eXRJTk5OQjVqQ2t6QmNkT1lKMGI1VVFtai9NWThLc0FOMitBYktnd2ZMZGVB?=
 =?utf-8?B?SDB3WnlzV2NPcnhsY0R4Q1c5N1I0bGNkYno1QmZHanRQbFd4QnIxaGJlYTdQ?=
 =?utf-8?B?VCsxK2EwWjZvOXFGT2Q1MGV2cUs2QkgwRG1iTkxMTFA4aWR3M1NQOXA2cUJu?=
 =?utf-8?B?ajR3Tm5rSHJZRWs3aXIzSiswMFFDdlhsMU96Kzc0ZjFCdFRMZnFrSWZHK3NI?=
 =?utf-8?B?WU5nUCtISG9xSEg2VHFUQXJZWjJ5QjNUZVd3QnkrY3JQNHFIMWJzR2JZSG5N?=
 =?utf-8?B?K1dHVkd4N0E4SVpHQ1pqZ1YrMWV2b3QzNEF4WWlyZzh0RHBZK3ZodWFSWlhJ?=
 =?utf-8?B?MmpWMHJCT2Vzcno3UE9mM1R3UTFwcGlDamVlbVdEMDRKZTMyM1U1RFhzWWpV?=
 =?utf-8?B?QzBoNmk0R0xHeDNBbmpSR0NCK2tNc3ZpT0haUjBTakFoZUZPSTJhdDV0VUpz?=
 =?utf-8?B?a1FyMjQ1ZzdBczlCendUektUYnhob05kQUFKaERSQmc2WWtxbjRhSXdXbXF4?=
 =?utf-8?B?QmFmU3RDNkQ2N3d6dXRRTFBFd1lIK084REUvM2RHNU5iNDFPckhwbnhDS1Vz?=
 =?utf-8?B?blcvWHdCNzNwVE5wWVNNTWY4MGg5REo0NnlPM0JEbGthN091TW5SOFI2WEV4?=
 =?utf-8?B?Nys2alp5VDFUWWlHZjVtTEdsR1ptNkdDc1ZtZFhtRjhqenoxcm1wMGVXdW9Z?=
 =?utf-8?B?cnFnc1pUNEdDUmtWTVoyNEt5K2JiKzdqTnZoY1hkWkQySkxUbzlLRkFQWWZX?=
 =?utf-8?B?dlBRQm8wTlNxaVFYd3NuQ2h3RDl4TGkyQjFCemZ5RjN1NzBPTncrcVRJNnd6?=
 =?utf-8?B?dGh3djg2RXBaY0NuREZxajdCc3JOSDAwS1EreVJlblV1VjV4THJGT2wxRDd6?=
 =?utf-8?B?WlJxWWZvVzIxK0hCMG4xL2pSWGM4NjNxQ2lUQkEyQXVuMVNuNGNWNUxtbjQv?=
 =?utf-8?B?Y2NydlFBOEVsQWRMWFNlN3J5NTIwd1BtU2dJMVZNMEI2WDdDVFcraEhSMHlO?=
 =?utf-8?B?dDdtQ2lDUUF1ZzBpVXduWVovWFFqdUdQTG5OV1I5aEpEMGduT2JkSkdzQVNk?=
 =?utf-8?B?UVlPb3VJOVFaaGtlY2xWN1ozR3RveHNZMENiY3RpYXZuZjdLSWRGUG9ZNWxU?=
 =?utf-8?B?RTN0WGN4b29GaHpnc3B1TS9MbHMySk5vRUgrRzJlR2oxTzI1ZjhpQVVGcjZD?=
 =?utf-8?B?Zmc1ZDRra2JWbVBpRVRqYTZQZTJEN0luMlpRdkozZGYya1ZEdWRPS0MwczFH?=
 =?utf-8?B?WGYzMm9rWTFEd0hWdkJUV01FYXFSOHJIZTJmVEttNjEvdWFoeGgxVzRIWVha?=
 =?utf-8?B?aXVIOXdsTHRBN2pLbGE0eUNleVY1YUM3UUxZMzdwdkU3WVUrbjVUdGlEY2t1?=
 =?utf-8?B?cmpKS0owby9LMFJIb2NNRlVXQW52ejJkVSt0UU5Nc0FaS2VkQVVkdlp6b0Fa?=
 =?utf-8?B?b0lsYTJMMW9HRHRwbHFqTmJFVHE1RkJheUNUd28rY1Nhb1JOUVgzNVBKVFpq?=
 =?utf-8?B?ZFlYN1JkRnpaUzZkVWlsTHJmLzRpTjFGa0VoVHRMNEdJeGl6TnRRVWhyNDV4?=
 =?utf-8?B?OWxOQ25rRzU1M1d6ZU5zWEVaVjVaSGY4TVB3T29BZU1BNEV4MS9PalMvU2Nz?=
 =?utf-8?B?M2FRbHhCdFByOTkwNnNnSDFhL1M5TnB0MlNiaFJlNU1ObHpFeHMvejRDT0gz?=
 =?utf-8?B?ZHpuVmxSYWUzVFRoWDg0TVl3Z2JyRmRpd25maG5XQmhxcENGc2VJdEtqWC9Q?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C79A219102532C4F97243F995AE82A15@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6990553-5cd5-4f5e-52eb-08dd07f7a0c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 17:37:09.1659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2W5veVMuj6FiOCDa78asZvA+xzIUK4Nmq+AVQbzK54/xtTAVFA24Ab5mBDTE3zT+astlpMe46xLi6cz+K+jH0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8581
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

T24gTW9uLCAyMDI0LTExLTE4IGF0IDA5OjI4IC0wODAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIE1vbiwgMTggTm92IDIwMjQgMDk6MjA6MDAgLTA4MDAsIFNvdXphLCBKb3NlIHdyb3Rl
Og0KPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi94ZS9vYS1jb25maWdzL2NvZGVnZW4ucHkg
Yi9saWIveGUvb2EtY29uZmlncy9jb2RlZ2VuLnB5DQo+ID4gPiBpbmRleCA1MTQ5OGY4MDNkLi43
MjUxZjVjN2E2IDEwMDY0NA0KPiA+ID4gLS0tIGEvbGliL3hlL29hLWNvbmZpZ3MvY29kZWdlbi5w
eQ0KPiA+ID4gKysrIGIvbGliL3hlL29hLWNvbmZpZ3MvY29kZWdlbi5weQ0KPiA+ID4gQEAgLTM1
Miw2ICszNTIsOSBAQCBjbGFzcyBHZW46DQo+ID4gPiAgICAgICAgICBtID0gcmUuc2VhcmNoKHIn
XCRHdFNsaWNlKFswLTldKylYZUNvcmUoWzAtOV0rKSQnLCBuYW1lKQ0KPiA+ID4gICAgICAgICAg
aWYgbToNCj4gPiA+ICAgICAgICAgICAgICByZXR1cm4gJ2ludGVsX3hlX3BlcmZfZGV2aW5mb19z
dWJzbGljZV9hdmFpbGFibGUoJnBlcmYtPmRldmluZm8sIHswfSwgezF9KScuZm9ybWF0KG0uZ3Jv
dXAoMSksIG0uZ3JvdXAoMikpDQo+ID4gPiArICAgICAgICBtID0gcmUuc2VhcmNoKHInXCRHdFhl
Q29yZShbMC05OV0rKSQnLCBuYW1lKQ0KPiA+ID4gKyAgICAgICAgaWYgbToNCj4gPiA+ICsgICAg
ICAgICAgICByZXR1cm4gJ2ludGVsX3hlX3BlcmZfZGV2aW5mb19zdWJzbGljZV9hdmFpbGFibGUo
JnBlcmYtPmRldmluZm8sIHswfSwgMCknLmZvcm1hdChtLmdyb3VwKDEpKQ0KPiA+IA0KPiA+IEp1
c3Qgbm90ZSBzdXJlIGFib3V0IHRoaXMgb25lLCBpdCBoYXZlIDggR3RYZUNvcmUgc28gc2hvdWxk
IGJlIHRoZQ0KPiA+IHN1YnNsaWNlL0RTUyBub3QgdGhlIHNsaWNlcy4gIEJ1dCB5b3Ugd291bGQg
YWxzbyBuZWVkIG5lZWQgdG8gYWp1c3QgdGhlDQo+ID4gZmlyc3QgcGFyYW1ldGVyIHRvIHRha2Ug
aW50byBjb25zaWRlcmF0aW9uIHN1YnNsaWNlcyBpbiB0aGUgc2Vjb25kIGFuZA0KPiA+IG90aGVy
IHNsaWNlcyBvciBhZGQgYSBmdW5jdGlvbiB0aGF0IGRvZXMgdGhpcyBmb3IgeW91Lg0KPiANCj4g
WXVwLCBJIGp1c3QgcHV0IGl0IGluICJzb21ldGhpbmciIHRoZXJlIHRvIG1ha2UgdGhpcyBjb21w
aWxlIGZvciBub3cuIEkNCj4gd2FudCB0byBhZGQgYSBGSVhNRSBoZXJlIHRvIGZpeCBsYXRlci4N
Cj4gDQo+IEl0IGNhbiBiZSBmaXhlZCBsYXRlciBpZiBhbnlvbmUgaXMgZ29pbmcgdG8gdXNlIGl0
LiBXZSBkb24ndCBrbm93IGhvdyB0bw0KPiB1c2UgdGhpcyBpbmZvcm1hdGlvbiB5ZXQsIGF0IGxl
YXN0IGluIElHVCwgc28gSSBhbSBhc3N1bWluZyB0aGlzIGNhbiBiZQ0KPiBmaXhlZCBpZiBuZWVk
ZWQsIGlmIGl0J3MgZ29pbmcgdG8gYmUgdXNlZCwgYXQgdGhlIHRpbWUgd2UgdHJ5IHRvIGFjdHVh
bGx5DQo+IG1ha2UgdXNlIG9mIHRoZSBUZXN0T2EgbWV0cmljIGluIElHVC4NCj4gDQo+IElzIHRo
ZXJlIGFueSB1c2UgZm9yIHRoaXMgaW4gTWVzYT8NCg0KTm90IHVzZWQgYnkgTWVzYSwgc28geW91
IGNhbiBhZGQgbXkgUkIgd2l0aCBhIFRPRE8gY29tbWVudCBoZXJlLg0KDQpSZXZpZXdlZC1ieTog
Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gDQo+IFRo
YW5rcy4NCj4gLS0NCj4gQXNodXRvc2gNCg0K
