Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4848C87FCE
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 03:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6266910E0AD;
	Mon, 28 Jul 2025 03:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yk0J81oY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A825E10E06D
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 03:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753674877; x=1785210877;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rn+FBWzyUSpr70GAijrxe+QSfr4OrjVw/dwLt10/k2o=;
 b=Yk0J81oYGE2oSG/5yDW/aRew2DFCfHTPq4VMrzwCkd9icb/eKjA4s51h
 kmtFau8F7tuRSDkUwgvhh2jtyhg0JY9kh8xau2/lSzjK7m2Abw2fBqoDY
 kxIJxAcBYGiZYfjB0Pi40Z15RLuTnTWpDmnB18dyOFDRDYOPib26v76V6
 yLlp4ouZLML3toG2qQf43cuY990iBYmSvpJFqVB/MO4iyyhwKNuwATQlC
 cIMQLQVt3uqevTE/hMg6UqwJYYSHKEpdZDo2vBGQazpNA3Q1uXpG+2Lyd
 MkPjIv3zbk3RK4KRsayL2Gq0HZCSI48JKvgfU9J8xUAl/C9NwM5TB60oW Q==;
X-CSE-ConnectionGUID: fjTPSofVSFWOtudfLbhZZQ==
X-CSE-MsgGUID: RUzFIUInQPe7cAkbFPC8Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55615178"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55615178"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 20:54:33 -0700
X-CSE-ConnectionGUID: flzLWvhyTqq3kEGGhN8yFw==
X-CSE-MsgGUID: rfTx1EhsTH2ZDWT1EnWbow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166479524"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 20:54:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 27 Jul 2025 20:54:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 27 Jul 2025 20:54:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.46)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 27 Jul 2025 20:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auKmy4DyQ/5vbMZG6qieh0CbFFar7t40jLKkdE5COoQTTHVgiYUkWEmF74AJyzAOr2pcpngu5sDvEayovgsrbaGchZEmi1KgQLb/FWPSRTg0v0iUk9c7tOrmgJhN1BwLyhcIhvUdpTMg6LmFUOyaxK5OcQ2STaY29+MTUXsKNNZCNwoQUTqJQu6kpvwgJ1uOHZJpsKV2VVmBgLTEqqkoOHCtejZl/u2k6udD+9MfyIOoh0BUsnZVOPe2ldTaJZ6xqxoa0isWH66lWx+O+cGHNMAvkC4VxbWQBGNdEGr+Sz1Hkd8B3Y2gaDoqwhLnyng0yb0JJC4Cy+dkD7bkeNl0Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rn+FBWzyUSpr70GAijrxe+QSfr4OrjVw/dwLt10/k2o=;
 b=ldC6h8vN2EOdvBj4uYQHkierVqI95ceBXEk5F/Mzji+NsCGB9hDJ2O61TL7JbqSAmGjNY7rVJ56r/lxjbE6/y8h45HjENtMBZzNelFHYfZw/rVmzjdilIeJ0PtfiBv/0DB4MaMvfkfYuad4OqXnPUm0epEbH7rWYhYzHcCUDImQ2rTHB0/xSpaEr+ERBPQboMWeTFHGarJ3Ap78KfQ0VP2G3TiCc8fZbLeoDED4KG/w/wO9s1WXvYsPwzWMkB1cqqhkvAaotg9uJbhBf6+FYWrNCjA8KtEqcDTJiZxhytY9XnNiNunIoVdyAhmeb6JuniP6DxUcpNiRW13X6h+7j7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DM4PR11MB5972.namprd11.prod.outlook.com (2603:10b6:8:5f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.26; Mon, 28 Jul 2025 03:54:29 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%4]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 03:54:29 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_plane_alpha_blend: Reduce test complexity
 for simulation
Thread-Topic: [PATCH i-g-t] tests/kms_plane_alpha_blend: Reduce test
 complexity for simulation
Thread-Index: AQHb+M6/wOiOmu64W0K0Mq4rewzdULQ81e6AgAoeNiA=
Date: Mon, 28 Jul 2025 03:54:29 +0000
Message-ID: <PH7PR11MB605380A8A1EF9692DF9F893FE75AA@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20250719170838.1340070-1-pranay.samala@intel.com>
 <d9a94bb7-767b-403a-b89f-e3c4c2ce7e02@intel.com>
In-Reply-To: <d9a94bb7-767b-403a-b89f-e3c4c2ce7e02@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DM4PR11MB5972:EE_
x-ms-office365-filtering-correlation-id: aaedb026-2f2e-44bf-598a-08ddcd8a7449
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UFBsdzA1YkcxZ2F5SEVMWVYrbWplOWZvR1JYekV2VVV5aG1TQWpmZlBNdDdp?=
 =?utf-8?B?LzNHeU9rcHptMktOcVArMUxEOERzTjY0cGJnaWV3aVg4Rmd6UzBYd2puWVl5?=
 =?utf-8?B?UDVaUWNWQnp2RkpLNEQxanhVVnhaa1pzRmk2d3lEQmgwaXd0bGNWcHNYOHlD?=
 =?utf-8?B?cjVRenFaaHh4RHRoMk1DN2RPTUFyd3BRcUR2aVB4NTBFUENSVGdOZzVUUU1a?=
 =?utf-8?B?aFNMNWZCczc0M2gyVnd0QUVWSVpuallmV0JUbnVPcDluRzlKeXlRTlp4UTc2?=
 =?utf-8?B?VURYMEppL05zU2tlZ250NzdWaEpYUkl1dFhRMEdvaGZQa25sYWVjZnFtRTJP?=
 =?utf-8?B?NXJqZE0zcVJQQVVPVXRuTFhJaXJtZXZMM3RFKzhieHVSL2VZSVduSXUzOG9G?=
 =?utf-8?B?aEhieTd1eVU5cDQ4TDRqVkVhNjBXenNSOEJLSGErYklnM1pOUEVMS3lGc2ly?=
 =?utf-8?B?RTJlZ1pZcjYzdHhOclp4cC9UY0U4eloyODU4MFVxVVJxV0ltQ00yUlNnR3pk?=
 =?utf-8?B?Y1UxMS9GRGNyb1cwa2FSVkE1M0JPK01CTW4xam40NDJzL05SOEhUaHJkQm15?=
 =?utf-8?B?Zkp5Skx1SE9WUmxBZlo1TGRKdkxxYkJ2Y3IyTTFudkJmaWc2dWNiNXhGNzFM?=
 =?utf-8?B?dlNhZDRNV2NqUk5FRVhjNWl2UklnRjRLbDBQd21DYS9lOVl1Nk9hdndXQkxN?=
 =?utf-8?B?MmNKZEJ3ZUYrMERocmQ3UjQyNWRTTTJFYUdNU3VaSVlBM0VicHVpTUI2Z0ZV?=
 =?utf-8?B?YndUOVZEamZYUVJkUG1OOEozWGxncTZQMlB0ZmNCQ1VHeklHeE1qbDVQanhw?=
 =?utf-8?B?WU02aFZHVFVGQmM2Uy9xVG8yZk05ZHVUN2w3aDJOdjNTYjFvSGFKTnVUakgy?=
 =?utf-8?B?eTJyeU5xVkR6MGJuMURUVDgvVUQwejVuekNiN1RURmhoR0o4WUtzS01YS0dJ?=
 =?utf-8?B?bThuMmFDZFY1RjFjdlJjckxUU3JNMEpqLzEzN2Q5UDhrRlRIRk94NHpzS3B1?=
 =?utf-8?B?SW5BNXdHWXl4NnJ2NXhvcXRpQzl5UC8zdmJRalE0RnZqUnIrWGdhUUlNdGdM?=
 =?utf-8?B?QUFyRXdFREx6d1dyVko1L3AzemJtN29hckhlTkg5V1dTTlY5eGVUSU9kOWN0?=
 =?utf-8?B?WkdxRkU2VSttSHNqVEc3aUw4ZDZVSEl0UlV2R1JyU3NZbUhtR0MvTjI3UHVu?=
 =?utf-8?B?c1Bvb1Ara0ZoK1BDZ0p3ZU9rSWthK0VLK0NPWVFpV3EwM2s0SHlvZnpjUldT?=
 =?utf-8?B?TS9DSVZqbVhHRHBpTko1d21WZ0xwTmNXVDJmT2pDK1ducFowTWVLbHo2UWZ3?=
 =?utf-8?B?Tm1qanF2eTdieVQ2T2I4UkJXT0ZLZ3RMb0tvSUU4WUR4Y1JjNS9xSTVOVzhy?=
 =?utf-8?B?amJMaHJ4VkhuNk12Y21JWVA2TWQvS2piUTA4MFhHNmRWaW5veS95d3c5TGNQ?=
 =?utf-8?B?UXZPNHJZazJaU2ZEcFlxRVZLZU16a3RYWTVvZWxkajZjWmo5OVdWV1NPRXJy?=
 =?utf-8?B?YVRHekdMRGNId09zanlPRzJRQS9SSmRtSVFYajRLM3h0YkhUOGJLTUZaNE9L?=
 =?utf-8?B?OXVFQnk0Mm1LMTgvcUJnVHhVb2Q3S1NNZ3RpZnBGcVU2Z2lpd0RLYkxpd1pZ?=
 =?utf-8?B?NTZQUHh6emx3dFpsRklTbjNlT04rRHNPZmRMZkhMTnAxRThETWZiUnBIcnVn?=
 =?utf-8?B?cnE1dkxPSlNLakhIaTFtdzBxUE8yUjBxVWZTNFcrbDcwVU9XOWVsamN1Vmh1?=
 =?utf-8?B?L084cnc5c1djRnJDZWRBVHF2REJtSmYyV3drWXNwbkg0bUpoaXVtd29TUkFG?=
 =?utf-8?B?dVJwUWEyVlI5alB2Mi9GTFpqSUZLclVyUVZrWmlJQXJSVDlYMkk2MWRKQnhM?=
 =?utf-8?B?YXVKTDI2N1B0eEFzTms3UnA1TEQ3MTVpUnQrOGVFZU5RMFV4SlJPaXhESU5R?=
 =?utf-8?B?V0xkZXFTN2JWRGFIMjV3MVRZYXJpRGlleGxFcVdaV29CYmJCZUJxaEYvNXhE?=
 =?utf-8?B?T3NQWTJlYmJRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFFTK2FIZGpJRnU3cXcrcmpTb09wSEpkV2JkWXMrcTNBSk1aWU1QZkJKdmZ2?=
 =?utf-8?B?SnV4ZjNZQzA3MXZDOXROaEcwSjdvNW1ReUxQSG95ZDZ6WGRjMmNTd29nYko3?=
 =?utf-8?B?eERRR3FuRVRLUE8yS1Vua3k2YUxTUTlDUjBaWFFvMTBEM2sweGUvVU9Uazhj?=
 =?utf-8?B?eS8zdUc5aTBpTFBQWjAzWUZjcEx3a0duUTYwRUgzZ0I5WVRrNkkyY0hJRS9q?=
 =?utf-8?B?c1FMZ0YrUGpPMGdTS3UxT3llMkNpMUxnZFAxYmR6RFhuZlZqTkpLM3VMbFF1?=
 =?utf-8?B?aUVsYTVsdGxHNGdweW5qdkppejNWS3dlb2JkejdJd2ZuY0NYT0srS0g1Q21U?=
 =?utf-8?B?czU4NVpneFVhSFNUMUM0cUhFOW9IMWpNZDlkOTNzTVB6bzE4ajFOZ3V3REVp?=
 =?utf-8?B?dGdkK3BQREZWZU84SzV6VzArclFtU3ZRdVMrT0xqQnZSQ2ZMdXVUbG03QW5u?=
 =?utf-8?B?Q1V4dm96UEUreE1SdXAwWVN0cHFXbWlEWVliekdNTUsxL2dnWUdDc3Z3clRV?=
 =?utf-8?B?SVNQelhEbHhEaTZqMzI3K25hU3ZYb3E1U3Q4Rm1KaURqMnoyNTl5QjlOOW1X?=
 =?utf-8?B?bmtxeFJvNFI5VGp0WDNNYkZwQVB2QitaNTdXU1ZtajduUjFNR2daY0R3WXo5?=
 =?utf-8?B?bDhWVWs3cHJrZ1NYczEzNkNwSDNLNWJEalEzcitUQit1SXhocithaHp0dFlO?=
 =?utf-8?B?WHIxVlZSTWQyOFZzMkdjZUVaNE1RV0dFamIxWkpuQmdvbXE1VGFVMkFhdkxB?=
 =?utf-8?B?UWRaOG5MM01OS3lEYWhaU1E2YTV3eTBMYU5DNlVUdS9zU3NLWFF1R205dTVL?=
 =?utf-8?B?aUZqdUhHa0JyOVJMWWZKaTRxclNkTUNxam9BZDQ2RDBsV3JOUzhPY2ExLzZC?=
 =?utf-8?B?d2lwZmh6WFhNYmdtNzljT2U4VncvL0FpZ3FGUzZ3eXR0U1JvNGZpR3BsZkFR?=
 =?utf-8?B?dHhZQk9meHRhTElqdmQ4V0FYMDduTTBJc1JBaVRJejJuaitQMXBoS0JDMWZL?=
 =?utf-8?B?dlUzVGxWZzRDNjVGeXZNMGx5M090T2ZVNkxNVGtXUmIxVmM0UEtua0k3TmFp?=
 =?utf-8?B?dTVtWTNUNHg5YWdZL2hKNi9oVi9JOWllSVhvYWVKVUQrZ1E5K05IM1RZR21B?=
 =?utf-8?B?YmYvYTU1cUpLOGFDOUp0bmtXZGV2Q1o1UFRuaTY0dUtPSWRGTnhCVUhESCsr?=
 =?utf-8?B?WDR6VkVNZUovL0p6VGRPVXFyeUs5R0V4UlIxY1RDN20xZkZicjVyRDFTNjc4?=
 =?utf-8?B?T2t5T2NGeUdBZGUrZ3pMQU9XK1RUbTlNMjYzVFpsYjNEUnpldWVHYm5leVpk?=
 =?utf-8?B?QWNtUG5QZU81b0NDMGxGOVdUZDVlVndlNUZzRkNHMzB1b0pyNGE1dVFjWE5x?=
 =?utf-8?B?SWJPakZNZ2pvbTQzNURPdXBJbGx4cFd6L0hOczEvbjdmY3N5MjNKQ3ZhcU5S?=
 =?utf-8?B?NkJVZi9qd0Ivd1RBM0lRSDQ4R2IzNnl4QTJobVRNalVvRkpjUFdvQmJNVU1v?=
 =?utf-8?B?NjRlZDkvU09pV25XeDB0anpEdWlpWE5vbHR5RTBLbGFMcDhpMFRlTHNMMmhh?=
 =?utf-8?B?UE9VTVR1VEpIeTUwZGhyU3g0Vm1sNUxORUNuN3B6UDdpSTZMSkFMaG52Z0dV?=
 =?utf-8?B?L3A0V0pnbHA5UE1zWEpFS1VVdWNRa21JOFZTdG8zT21wYXFXbjBuUVFxandL?=
 =?utf-8?B?QktOektsZkJ6djVIVVNQK2t2RU9Ma2xFWjdJZ1JJZmhYd0lFT3pNYzE4eGJO?=
 =?utf-8?B?YVRiOSthWml3SkZCL3VlOTVwMEVvMkhZOEcvN1U3SmJzSk81Nm5LSjlaeVJF?=
 =?utf-8?B?VTFDYkhLVXY5N2ZzaWVJRzlWK2UxZDZvUU8rbmhNeExSWlJKMFdzUG1VQ2Fh?=
 =?utf-8?B?VUxKZzdjKzZIOGxLdXZ1ZnVpYlUvd1MwcENwTDBoVkRXSnYweFBjK09laFhU?=
 =?utf-8?B?NmxNZ0RoVmtIbEpsdE5rM29WQStOYWlqcTBReWNZbG1zSitDeGhPaHVpVzlE?=
 =?utf-8?B?YlZudzZLWW5Vamh5OURmYUVFTmlNVWJlWmZPcmVKVlFFMml2aDdOdEovTnNU?=
 =?utf-8?B?YnBhSWdJb1VMTG5iUE01Nm1yanhwc3Frd0RnZEFqRUdkZVBlck04WXJ1dmt2?=
 =?utf-8?Q?HIch6Mw+cT0LDBBUskb119yrM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaedb026-2f2e-44bf-598a-08ddcd8a7449
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 03:54:29.6327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vV21Y0PI9/UMTQ+cQ9jniGekvylpdWX9nHRQL4b8+b21Pj1nU2suZBolQ47hu+glgiIowGHFbnxLW3Jdz1cjmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5972
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

SGkgU3dhdGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhcm1h
LCBTd2F0aTIgPHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bHkg
MjEsIDIwMjUgMTA6NTEgUE0NCj4gVG86IFNhbWFsYSwgUHJhbmF5IDxwcmFuYXkuc2FtYWxhQGlu
dGVsLmNvbT47IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCIFMsIEthcnRo
aWsgPGthcnRoaWsuYi5zQGludGVsLmNvbT47IExhdHRhbm5hdmFyLCBTYW1lZXINCj4gPHNhbWVl
ci5sYXR0YW5uYXZhckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXRdIHRl
c3RzL2ttc19wbGFuZV9hbHBoYV9ibGVuZDogUmVkdWNlIHRlc3QNCj4gY29tcGxleGl0eSBmb3Ig
c2ltdWxhdGlvbg0KPiANCj4gSGkgUHJhbmF5LA0KPiANCj4gT24gMTktMDctMjAyNSAxMDozOCBw
bSwgUHJhbmF5IFNhbWFsYSB3cm90ZToNCj4gPiBSZWR1Y2UgdGhlIG51bWJlciBvZiBwbGFuZSBh
bHBoYSB2YWx1ZSBpdGVyYXRpb25zLCBhbmQgbGltaXQgZXhlY3V0aW9uDQo+ID4gdG8gYSBzaW5n
bGUgcGxhbmUgZm9yIGVhY2ggcGlwZSB0byBlbmFibGUgdGhpcyB0ZXN0IG9uIHNpbXVsYXRpb24u
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQcmFuYXkgU2FtYWxhIDxwcmFuYXkuc2FtYWxhQGlu
dGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHRlc3RzL2ttc19wbGFuZV9hbHBoYV9ibGVuZC5jIHwg
MTMgKysrKysrKysrKystLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3BsYW5lX2Fs
cGhhX2JsZW5kLmMNCj4gPiBiL3Rlc3RzL2ttc19wbGFuZV9hbHBoYV9ibGVuZC5jIGluZGV4IDA0
N2NjNTdiNC4uNjk2YmIxZTVlIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ttc19wbGFuZV9hbHBo
YV9ibGVuZC5jDQo+ID4gKysrIGIvdGVzdHMva21zX3BsYW5lX2FscGhhX2JsZW5kLmMNCj4gPiBA
QCAtNzksNiArNzksOCBAQCB0eXBlZGVmIHN0cnVjdCB7DQo+ID4gICAJaWd0X3BpcGVfY3JjX3Qg
KnBpcGVfY3JjOw0KPiA+ICAgfSBkYXRhX3Q7DQo+ID4NCj4gPiArc3RhdGljIGJvb2wgaW5fc2lt
dWxhdGlvbjsNCj4gPiArDQo+ID4gICBzdGF0aWMgdm9pZCBfX2RyYXdfZ3JhZGllbnQoc3RydWN0
IGlndF9mYiAqZmIsIGludCB3LCBpbnQgaCwgZG91YmxlIGEsIGNhaXJvX3QNCj4gKmNyKQ0KPiA+
ICAgew0KPiA+ICAgCWNhaXJvX3BhdHRlcm5fdCAqcGF0Ow0KPiA+IEBAIC0yODksNyArMjkxLDcg
QEAgc3RhdGljIHZvaWQgYmFzaWNfYWxwaGEoZGF0YV90ICpkYXRhLCBlbnVtIHBpcGUNCj4gcGlw
ZSwgaWd0X3BsYW5lX3QgKnBsYW5lKQ0KPiA+ICAgew0KPiA+ICAgCWlndF9kaXNwbGF5X3QgKmRp
c3BsYXkgPSAmZGF0YS0+ZGlzcGxheTsNCj4gPiAgIAlpZ3RfY3JjX3QgcmVmX2NyYywgY3JjOw0K
PiA+IC0JaW50IGk7DQo+ID4gKwlpbnQgaSwgbWF4X2FscGhhX3ZhbHVlOw0KPiA+DQo+ID4gICAJ
LyogVGVzdGNhc2UgMTogYWxwaGEgPSAwLjAsIHBsYW5lIHNob3VsZCBiZSB0cmFuc3BhcmVudC4g
Ki8NCj4gPiAgIAlpZ3RfZGlzcGxheV9jb21taXQyKGRpc3BsYXksIENPTU1JVF9BVE9NSUMpOyBA
QCAtMjk4LDggKzMwMCwxMA0KPiBAQA0KPiA+IHN0YXRpYyB2b2lkIGJhc2ljX2FscGhhKGRhdGFf
dCAqZGF0YSwgZW51bSBwaXBlIHBpcGUsIGlndF9wbGFuZV90DQo+ID4gKnBsYW5lKQ0KPiA+DQo+
ID4gICAJaWd0X3BsYW5lX3NldF9mYihwbGFuZSwgJmRhdGEtPmFyZ2JfZmJfMCk7DQo+ID4NCj4g
PiArCW1heF9hbHBoYV92YWx1ZSA9IGluX3NpbXVsYXRpb24gPyAxNjAgOiAyNTY7DQo+ID4gKw0K
PiA+ICAgCS8qIHRyYW5zcGFyZW50IGZiIHNob3VsZCBiZSB0cmFuc3BhcmVudCwgbm8gbWF0dGVy
IHdoYXQuLiAqLw0KPiA+IC0JZm9yIChpID0gNzsgaSA8IDI1NjsgaSArPSA4KSB7DQo+ID4gKwlm
b3IgKGkgPSA3OyBpIDwgbWF4X2FscGhhX3ZhbHVlOyBpICs9IDgpIHsNCj4gPiAgIAkJaWd0X3Bs
YW5lX3NldF9wcm9wX3ZhbHVlKHBsYW5lLCBJR1RfUExBTkVfQUxQSEEsIGkgfCAoaSA8PA0KPiA4
KSk7DQo+ID4gICAJCWlndF9kaXNwbGF5X2NvbW1pdDIoZGlzcGxheSwgQ09NTUlUX0FUT01JQyk7
DQo+ID4NCj4gPiBAQCAtNTY0LDYgKzU2OCw5IEBAIHN0YXRpYyB2b2lkIHJ1bl90ZXN0X29uX3Bp
cGVfcGxhbmVzKGRhdGFfdCAqZGF0YSwNCj4gZW51bSBwaXBlIHBpcGUsIGlndF9vdXRwdXRfdCAq
DQo+ID4gICAJCWlndF9pbmZvKCJUZXN0aW5nIHBsYW5lICV1XG4iLCBwbGFuZS0+aW5kZXgpOw0K
PiA+ICAgCQl0ZXN0KGRhdGEsIHBpcGUsIHBsYW5lKTsNCj4gPiAgIAkJaWd0X3BsYW5lX3NldF9m
YihwbGFuZSwgTlVMTCk7DQo+ID4gKw0KPiA+ICsJCWlmIChpbl9zaW11bGF0aW9uKQ0KPiA+ICsJ
CQlicmVhazsNCj4gSWYgd2UgYXJlIGJyZWFraW5nIGFmdGVyIGZpcnN0IHBsYW5lLCBob3cgZG8g
d2Uga25vdyBpZiB0aGF0IHBsYW5lIHN1cHBvcnRzDQo+IGFscGhhPw0KPiBXZSBuZWVkIHRvIGhh
dmUgc29tZXRoaW5nIGxpa2UgdmFsaWRfcGxhbmUgd2hpY2ggc3VwcG9ydHMgYWxwaGEgYW5kIG90
aGVyDQo+IGNvbnN0cmFpbnRzIGFuZCB0aGVuIGJyZWFrLg0KPiBUaGF0IHdpbGwgaW1wbHksIHdl
IGhhdmUgdGVzdGVkIHdpdGggYXRsZWFzdCAxIHBsYW5lIHN1cHBvcnRpbmcgYWxwaGEgYW5kDQo+
IG90aGVyIGNvbnN0cmFpbnRzLg0KDQpJbiBmb3IgbG9vcCBpdCBpcyBjaGVja2luZyB0aGUgYWxw
aGEgcHJvcGVydHkgc3VwcG9ydCBmb3IgdGhhdCBwbGFuZS4NCklmIHBsYW5lIHN1cHBvcnRzIGFs
cGhhIHRoZW4gb25seSBpdCB3aWxsIGV4ZWN1dGUgdGhlIHRlc3QsIGVsc2UgaXQgd2lsbCBjb250
aW51ZSANCmZvciB0aGUgbmV4dCBwbGFuZS4NCg0KSW4gdGhpcyB3YXkgd2Ugd2lsbCB0ZXN0IG9u
IGF0bGVhc3QgMSBwbGFuZSBzdXBwb3J0aW5nIGFscGhhLg0KDQpSZWdhcmRzLA0KUHJhbmF5DQo+
ID4gICAJfQ0KPiA+DQo+ID4gICAJaWd0X291dHB1dF9zZXRfcGlwZShvdXRwdXQsIFBJUEVfTk9O
RSk7IEBAIC03NDMsNiArNzUwLDggQEANCj4gPiBpZ3RfbWFpbl9hcmdzKCJlIiwgTlVMTCwgaGVs
cF9zdHIsIG9wdF9oYW5kbGVyLCBOVUxMKQ0KPiA+ICAgCQlmb3JfZWFjaF9waXBlKCZkYXRhLmRp
c3BsYXksIHBpcGUpDQo+ID4gICAJCQlhY3RpdmVfcGlwZXNbbGFzdF9waXBlKytdID0gcGlwZTsN
Cj4gPiAgIAkJbGFzdF9waXBlLS07DQo+ID4gKw0KPiA+ICsJCWluX3NpbXVsYXRpb24gPSBpZ3Rf
cnVuX2luX3NpbXVsYXRpb24oKTsNCj4gPiAgIAl9DQo+ID4NCj4gPiAgIAlydW5fc3VidGVzdHMo
JmRhdGEpOw0KDQo=
