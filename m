Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF574C36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 08:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81ED810EB86;
	Fri,  4 Apr 2025 08:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCsqQc97";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034C510EB86
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 08:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743754322; x=1775290322;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nZ4LGVPchiHnyafzZPwg/NZRh+kj14QssgqXy7jP1hk=;
 b=bCsqQc97+z38JaY4xxMbuToKakD/Gb6SknHGs1PfCK21pCNBdXBi//Ad
 LGxyqykBp/PWgwiVZ7qBqunpGRA6g7jgGmDdWM2PjbpBgzE9WFHKBS0Am
 498a1esS/PNUG/wG1O+d6M+b66iBeRgvgfnhYJckSHUwLnxUpRixEwL6s
 FH4X7CBEXVwrSZ4YDb7b9CxokgYIWwUZVQCu7yCPx00zdJzUCyr5M+Qem
 dALZj0OSj9gGUVzFp8/RsUnxbV0Y7j+D1QB1CycLcqpXqPzTD4GPUVyNj
 wUpVg1y0IXeLKO5QAHrlGCCy8mhE0a7O2SJZjc7p4+jk/+Fhe9OTs153A Q==;
X-CSE-ConnectionGUID: Ra3NlfPMQ+WlBwacTRV+Rg==
X-CSE-MsgGUID: ObCjaawNQkmFVHBVuf8qeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45362837"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="45362837"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 01:11:45 -0700
X-CSE-ConnectionGUID: a24B4igRQMCdc9ZZSz1wgw==
X-CSE-MsgGUID: 78YEsFZVTv6epU1jGUr6sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="127056767"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 01:11:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 4 Apr 2025 01:11:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 4 Apr 2025 01:11:44 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 01:11:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNy9V9AbA8MYxgefO7tRcPcQq25UeFskndDnB2OPZiQ4zWUxIk9YOksKo+SpgzAfDZ4MJkubCVX9pdHhA3EAlE34SfT54LZDqqXV1oFDNx5v+RtBC+EyGyHeJIeR9so2FmzCEMX8S+Vwrmos1tkNKJDVo9zGDYhPF71I3mihokQDX2TR1lbEZ6MfoEgJ1H4EBCkxG454X0+Zn5vDmvypt29gdcAlbtW3RshinGbEv4N9fWZRdQGA9LjnPpfMMAXsMiB4Op9qK096fjpXs14fSeZEKZtLmO1UZFNg1gu74CtOh0BXywHZagpoIzw4oXDDmtdY3UW2qF3j0OJaldkEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZ4LGVPchiHnyafzZPwg/NZRh+kj14QssgqXy7jP1hk=;
 b=rbGlPNmXY0c8BIx3v/fht/ENlV0QJqKVTBZQDjL2haRWzV6SyzSTSDIyOqW6/X+qhByYF34PY1qTOZZrQo0IqraLF2gMVWq46mvJFt4eHs8KJ8HelWMP55/mgJSwB/iobXI7NfZt9aYC+kVnmM/vOLwgkzUuTE+47lg9J7DEBvyJIvkcCcwZ10AtLIC/8XHQyZUQlRpJMuNEY5KJz+pYxVtHCHrmIAvn6nkdI+n7fSgKE8shKA0QsLj5dCp3lI+3LPPMF3p7ZfX2PWccN5HM7oylEXOgn/B/XAAyHyUAiP6H8iJQg+/u2gPbhyBf3DsueiATFWHbnxXqFFjilBniLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.45; Fri, 4 Apr
 2025 08:11:13 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.8583.045; Fri, 4 Apr 2025
 08:11:13 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B,
 Jeevan" <jeevan.b@intel.com>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_dirtyfb: Fix misplaced parenthesis
 in display version check
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dirtyfb: Fix misplaced parenthesis
 in display version check
Thread-Index: AQHbpR5WL7fKwZXzykmL+bODNp2VZbOTKAOA
Date: Fri, 4 Apr 2025 08:11:13 +0000
Message-ID: <49b0b25a193946ae7d8b0b20c6ee0a169d094d71.camel@intel.com>
References: <20250404051503.2095885-1-jeevan.b@intel.com>
In-Reply-To: <20250404051503.2095885-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|IA1PR11MB7755:EE_
x-ms-office365-filtering-correlation-id: a42ecb0b-b0f5-474f-e37b-08dd7350444e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UnFIczhYaWZEcmpudlVBajhXRDA0K1dUd1VBWE5SWkNRRmFsdHVDZlpBTlYx?=
 =?utf-8?B?Mm1xMndWZnNiMUh0a2c3MG0ya29kbjMxRnBlTUt3Z2ZzampFZlJJWStrTm9r?=
 =?utf-8?B?VDF4RVRsbjBhU0RUdm9ta3p0QmFwZHI0eTlTL280NjUvN3EyQXVaWFpWb2M5?=
 =?utf-8?B?TzgzclBkVDRpUDlFSDUyZjNhMkdMYktYNmROVFcxbzJxTndudUhSRHpyTlVM?=
 =?utf-8?B?c3MvSU9yaHNTdlc1c3RGSExHMm5Ma0xtcnA2WVkvelNSSnl2cGRZQ3lCc3ZU?=
 =?utf-8?B?TVpUTXZtU0NlN0ppR3dIWjlaVUdMaU1yeTIzdDA3ZW5HOXlORldQQkFaUy9P?=
 =?utf-8?B?M2thSjdRNjVCTlEvcENuZzJ3U1RENC8vUndzcTJ3T0Iyc0tESXo1djNHOWp1?=
 =?utf-8?B?Z201bmE5Z3ZidWMrU0R4NlRiY3ptTmNEMEZxK0hCKzVMdnNObWN6d1NvZGpi?=
 =?utf-8?B?NGNQVHY4NjBVWnRvdDR5eWh6cUlEdXFydHo4YlhDdjJzMStwams0RERQL3Rs?=
 =?utf-8?B?WjQyMVlsVHRVa2RNeHhIem1rWXNuR0ZxenNOaGp6YkxpZCtyVm5JY21oT1B6?=
 =?utf-8?B?SGFWeGcxNXg3QlBQYlJ3YTlVd3NGVDYvaUx6TEhsc1BiRUpFMkZZcGJtckFG?=
 =?utf-8?B?RDA0SVVrZzYwWDJBbGk3RTJackJxSVFSWWdtalo2UlozQytOU2pVU01EQXR5?=
 =?utf-8?B?NEJUc3UyTDg3d1lEUHMwamM4MWFvZlNMMXUxVXFRR01jWm5oSEdha3dld0Rh?=
 =?utf-8?B?ZFdEUWpBZTcxNE1sRS9Bc2JlT0MreVRWZFpWbENrckNlRGh0Vkx5MTArK1ZK?=
 =?utf-8?B?R2Uxa3NOUWtnZnBWYjBMUCthaitBQVVIdWdZckhUR1dvbmE4Y2cyMkdjTGdX?=
 =?utf-8?B?WTVKUTI2TEJ5ZDNVL0wyWENLOXl5TFUvbUVKV1ROSkdlekpYZTREWFFnQWho?=
 =?utf-8?B?TFVGaGQ2Yll3ZFN5a1NZZU1IeEZQRFAwUGZkYnRHcm93alU4ek05bm1uZHlk?=
 =?utf-8?B?RHJFMGtSTCtVczZ3dVVHTHFOR1h2TDhEZXlYSG1KODI3dndRdUdaaWJ5NGhP?=
 =?utf-8?B?RldUdUtHNFd5UUFVekg4VDk2ZnVHZ0RrYnZhc0llV2c2SWxlOEhHVnNqZDkw?=
 =?utf-8?B?Y3lRQXlDYit5N3pMY0dCb1BWZU5QRDEzSXVzOStick43VThJTlhtRjBuMEVr?=
 =?utf-8?B?VjM2QktkQkdFbFpXS2t6bVQrYjlmSkNOcXlySUNsQlFpS2tYZWFPZFhSZElN?=
 =?utf-8?B?Tm1pUjBSQ0d1OFduMWhFaDBKbTRycGt5V1hwTTN0SUhOc2lnb1h2c2dxalZI?=
 =?utf-8?B?aGNjd2pISVZtWWVvMWdwaVROQ2pHK3ZBV3lZeTZwaWxjckxkWXJ4ZWJUeW5m?=
 =?utf-8?B?TFpIR01XaU0rQTFURysrSWNPa1BrWDFrN1FEbEZIR1BCQVJsV3JkQXIzYXE4?=
 =?utf-8?B?OFIwai9aL3NnU2RaOFM5QWVITituSzNMdWhBMTdyRTdMMTFNalJRL1JyZ2pM?=
 =?utf-8?B?QTAyMzNBK09nS3BINCtseXhIb2d0WTBUMno0NEp2bjJERnEzSWJNTVN3b0hI?=
 =?utf-8?B?RzgvblRrZ2svbE9OQldCcU93MnovWjRVZHBqTVhNUFB4alpaQTVUb2hMbjRK?=
 =?utf-8?B?TnZ6eXhwN1pGZ1NMTUdMTlk4WUU0ZVZodFovbkpsbGwzaW4wQUQ4NXBBNzRJ?=
 =?utf-8?B?TUIyMVZqT3F5RXZ4RTFqczRDeWpicVVaNXU3QUxRSmRFcTBBYjQvaTh0d0U3?=
 =?utf-8?B?WHhOOWZUK2RMeS9ReWFWYzB0cEtGTGFKcW5rc2gwd1YrY2NFWWRWb1RyRTAy?=
 =?utf-8?B?SkY4WE1JZjBEMWYyUkxZS042T0MzVTJGVFFZWEZ1REVtaWpPYm1wVnk2c0JL?=
 =?utf-8?B?VzRmdDJESDJodEZsMHlRY1NOVmtYcTNISnc3QVV2RjQyWTM4TVhpNk8wbzQ5?=
 =?utf-8?Q?lhzmyYP2p1bNN9i2h0eHQ4Vj75yvRWP7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZytDYWdSdUVhQ2dUTlVnTTBUTTV0S1JVbjRqWlNmRmpKU0NMRFBlQ3BaTnYv?=
 =?utf-8?B?VWwyWGkzbkFDeTF4b2NBMnJLeklDOER6alBwdCtxNlBZd211Mk84amhVSmM5?=
 =?utf-8?B?c2cwQUlUQnRmd3hlNjlqa2RLRk52NjhPREtDYzlyN2cwNTdiOXBLdng0bE9v?=
 =?utf-8?B?VHJ3b21uYzhFbVNISkJiMmhqZEFoNFg0ZXRRVStkb1dkSkNPcTFTNG1FelZm?=
 =?utf-8?B?VDAwbU5rV3FVOGhrME9UMkFFZGJOd3JYS1FEcjZDTVRkbC9VejdtZS9sTjBD?=
 =?utf-8?B?L1F6UWM2ajY0YkNqRy9QY2VYNjRSc25WYTJYVE1rZTM1aWl2N3ZuUVZzT0Zl?=
 =?utf-8?B?UkZ3VndFNVRFTGEya1huZFBWQ1ByYjU5RW9GcHRnRWxTMjRIRVc5SU5CdGtY?=
 =?utf-8?B?Qmk4ekVOYTgzRTA4SnBHMUNvQWRuWTltZXZBWnk2WVhYWlBvQUtMZkpwWUQ1?=
 =?utf-8?B?L2FyVTlNWTFwT0JBWWRTZDRtNmFVNVg1UzQwTDRzelU0MTN4SForRVB2alhr?=
 =?utf-8?B?dzhzN0k3VmloekI3U21FeVVyaC9ZemR4bERiTEdOU0xOVFRqei8ydUZuM2Jk?=
 =?utf-8?B?V0J2K0VCRTBmTHBQUU1xM0FKaFo4TXU0QmdPby9wMmFHcnNaWllueHFtSVZW?=
 =?utf-8?B?dG5IbHRUMEFoVndxZjRTdXBBakFrUHE0R3VuNEh3WUNsbWpCVjZ2Mm5TaFpZ?=
 =?utf-8?B?QWxSSTRxSkFjWDZ3V2Z2RGdkbGFIRTZ3dXl2VXBBaDZyQkRFMXErTjJ3aG9v?=
 =?utf-8?B?M09OSUJ0STQ5ZU01SFh3MVB0aW9uV2thck4zZjZhb0x5S0k5ZFQzZlZNd1pU?=
 =?utf-8?B?Wm4xUTU0c0dkdGgycXNIcktnZyswV3FFcHNjYkdKalVsSmU5eE9SL01KT05F?=
 =?utf-8?B?alhMbGIwNkNVamJRVlRYM3JjaW4rR3JnTUx6anVoZUluNDUwbjV6MU9uWU1K?=
 =?utf-8?B?cHJ4RDVaTVZyU2V6QWRwMTBpMllOa0V3a0hEd0hmS25ISzhVeHQ1RVRhekxI?=
 =?utf-8?B?VFFJWWlHdkozLytEMEV5eE16ZFduSFlRa1M0RHJESThkQWhxQVNBOFBHUnl2?=
 =?utf-8?B?aFFsdHVxYUJpTEhnSHhSMFRmUWxNOExIUmpRVmRhaThxcWdmUHJBSjExVVlU?=
 =?utf-8?B?VjNxelNyT0xvUkdqeHVzaldjTlVrSDc1aTFDNGhoK0J6VEQ2alVQcFg4OU12?=
 =?utf-8?B?VGZwZXVBT1RGOVUvSGRtZTJUd2pUcEdLZkRNOWk1TkwrVHFjanRUdmU2ZW93?=
 =?utf-8?B?d3RkMXl0bTg1ZzlGUnBwZXQvcFdoTlJSTW1GSzk3UG9zVnlCcDFpUjNLdjUx?=
 =?utf-8?B?cGp2OVlqTXREQjlJVFJqVmZxWHoxNUUxdDQ3K2VZd050d2oxYXZQaWk5MnJk?=
 =?utf-8?B?dkFXWjNaYUV0V1NPTDFidnczVm9QeElpNFVRVldtZGxVTkczTWV0SUdIWFBy?=
 =?utf-8?B?djJGYjU4TVBpZjJ1Y3RsdEZIeGlXbXlZYkxZcjUwMzFWVGMzK29lZURORmRj?=
 =?utf-8?B?d1dBNlMxMk0zQ0FYWWNFUEsxeHIzMy83ZnpWamtaZ1lsanJqOEJCbmFUamI5?=
 =?utf-8?B?elQxV01OUGdqQTBqWmNKSERsN2wxYkx5ZnpJemFhSTM1d0xiWFpZUllNSmFp?=
 =?utf-8?B?WWJmcDFVK0p6WnROMm1pWEJ6c3R4aVBFcmtQald1bDdrWU1VcTBOY0ExZ2I4?=
 =?utf-8?B?VkQ0MDFFSDQwS1BkaVYweWY0YUZ5WjU5T3YrVW8ydkNmNmRzNFdYeHU0bE9w?=
 =?utf-8?B?ejBGNlJiUFpHMXYrUkYzRGM4NWxmUDgvUGNKalVQNUkwVjEzL1Erc0NKVE9O?=
 =?utf-8?B?Z3AzU2wwUitxMU5icXBNeU5aZEZyS2Jwd2JjSHUxaHNiZWlaemxMc3l3MmNL?=
 =?utf-8?B?YnRrNDdNNXVEdkVVQzNUY05lbjJPYVVnUGZ4ZFhqNTNlRzlrSy9MdXBYdjNy?=
 =?utf-8?B?RkRSenN1WWlZTCtrd2Zjc1puemNtNGp1OHQrNVpNUDVXbW9XSnJDVDRnb1BZ?=
 =?utf-8?B?NnBJVnB0YmY2Z0pHM1dhWDhlRGxTejNSbmxYNzJKRGkvV2U3aXJHY3BGSWlZ?=
 =?utf-8?B?a2Y5UlArSVZNeFd3aEZyTU1rRDhBVy9XWVFQSkMvbWhnZ0phM3FESHFoc3pp?=
 =?utf-8?B?VFlnckdSZFhBTUtPdFE3bmRRQjBvcTRBNGVLZEVXcGpkQktyTUp6c2tVemtu?=
 =?utf-8?Q?xoW0pq/dYl2/76ePxrxFCTY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30042A0F825CDD48911052A26F834086@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a42ecb0b-b0f5-474f-e37b-08dd7350444e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 08:11:13.6932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xhk8KcqaIcI/4b7tFqt83qddx2mQNTiDqlzQyINCrReoNnBUcqstJKlnan4aH3yRPD0P9571ptGNTjnDGHaeETkIOUe2eJH+tVtZ7UTvpCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7755
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

T24gRnJpLCAyMDI1LTA0LTA0IGF0IDEwOjQ1ICswNTMwLCBKZWV2YW4gQiB3cm90ZToNCj4gRml4
ZWQgYSBtaXNwbGFjZWQgcGFyZW50aGVzaXMgaW4gdGhlIEZCQyBkaXNwbGF5IHZlcnNpb24gY2hl
Y2sgdG8gZW5zdXJlDQo+IGNvcnJlY3QgdGlsaW5nIGZvcm1hdCBzZWxlY3Rpb24uDQo+IA0KPiBG
aXhlczogZjBiNjY4ODMzOThiNGEwN2JiOGZjYWEzNjYzYTIxNDAxMjlkOWE1OA0KPiBTaWduZWQt
b2ZmLWJ5OiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqB0ZXN0cy9p
bnRlbC9rbXNfZGlydHlmYi5jIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19k
aXJ0eWZiLmMgYi90ZXN0cy9pbnRlbC9rbXNfZGlydHlmYi5jDQo+IGluZGV4IDhlZmExNDQ0Ny4u
YTU3MDdjNWIxIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9rbXNfZGlydHlmYi5jDQo+ICsr
KyBiL3Rlc3RzL2ludGVsL2ttc19kaXJ0eWZiLmMNCj4gQEAgLTM4Niw3ICszODYsNyBAQCBpZ3Rf
bWFpbg0KPiDCoA0KPiDCoAkJCQkJLyogRkJDIERpc3BfdmVyIDggYW5kIGJlbG93IHN1cHBvcnRz
IG9ubHkNCj4gSTkxNV9GT1JNQVRfTU9EX1hfVElMRUQgKi8NCj4gwqAJCQkJCWlmIChkYXRhLmZl
YXR1cmUgPT0gRkVBVFVSRV9GQkMgJiYNCj4gLQkJCQkJwqDCoMKgIGludGVsX2Rpc3BsYXlfdmVy
KGludGVsX2dldF9kcm1fZGV2aWQoZGF0YS5kcm1fZmQpIDw9DQo+IDgpKQ0KPiArCQkJCQnCoMKg
wqAgaW50ZWxfZGlzcGxheV92ZXIoaW50ZWxfZ2V0X2RybV9kZXZpZChkYXRhLmRybV9mZCkpDQo+
IDw9IDgpDQoNCm9oLi4geWVzLiBUaGFua3MgZm9yIHRoZSBmaXguDQoNClJldmlld2VkLWJ5OiBW
aW5vZCBHb3ZpbmRhcGlsbGFpIDx2aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4NCg0KPiDC
oAkJCQkJCWRhdGEubW9kaWZpZXIgPSBJOTE1X0ZPUk1BVF9NT0RfWF9USUxFRDsNCj4gwqAJCQkJ
CWVsc2UNCj4gwqAJCQkJCQlkYXRhLm1vZGlmaWVyID0gRFJNX0ZPUk1BVF9NT0RfTElORUFSOw0K
DQo=
