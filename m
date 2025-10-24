Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D70CCD1AB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 08:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8381810E1B2;
	Fri, 24 Oct 2025 08:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OnN+g6g1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B15810E1B2
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 08:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761292953; x=1792828953;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lVnTK2JTixET6x3YlGPYjSD2UJgq02cOyEQBvRIikMY=;
 b=OnN+g6g1BsFFD/N6IEBKHhBdNGnsU2yo3/V+zOugv+E35uocv4MBi7MH
 zo437khYADB7sae8CBztBmO5cFv8JbI0mX3uhaQqs/Cx63+sltdXSwC1K
 j25zYlNLWaKSoTYW79l0gaJD/TdTt/H4qojOew0FCW3OoTgwIpaVznDgC
 BvnBQVNYg+RocAG9U8AHn4mo+AYSR+OYTSeSXQJxS94718VeOgOCLp3kA
 gG0HB+zbHNR8WrvaSLv0iqq6X7wuRZMEDrE8kCgOY0/Xe8ooP/r5lsEq9
 wQbdN5tiJZ/SPKNmqc9Z6ljNkh+OY6ogMuxRL/iVXl4gGZdRGsYblbqaV w==;
X-CSE-ConnectionGUID: Hz/LGvOCRFSGCkxqc2oQiA==
X-CSE-MsgGUID: pxsX9YbYTrmp5HJ+3YhR4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81099183"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="81099183"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:02:32 -0700
X-CSE-ConnectionGUID: pPdDZlbBRoij1qm9eP0Ovw==
X-CSE-MsgGUID: yDoL61jqRIWBt4UMaNXzYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="188429441"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:02:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 01:02:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 01:02:31 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 01:02:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJwcDJ4Stiztg010VDzrD7r+5ccmQxn8VApIxCpzipYvKiHUdm/O5NVTwVcykwvcvLsiUy9y/MGKAocs5O9uHfqtWxIUJde7XlxfThz8OXJnL0EidSYlNpBW1QGfKWza0Ays/WwGR6DNfmOsCbSwe2rpW5uqVF5089DK+LSMp56tA7B/ielYWF5hnnv4ssQEJsiA+8auirizusjjB556WWqTUFZbNVZtNR9BNKWkzL9567rJmQvC+6CO0i3qWBSski4ikXJMU+EwawaoatNs7bsvlwT6V7Av1m4mtqlRF85Qzlx2npt9rE4Jzvz0yJyKCVnhQZOIC9xanNCRflZJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVnTK2JTixET6x3YlGPYjSD2UJgq02cOyEQBvRIikMY=;
 b=lsU2JbIyYCVTGb4mOKOsFmbSb1gZDTC0HIoR4TTvQm3k7FbM36U6jYlZvByQjyWsH3q45FvtQdCWlPtJ0eNWRgUnU3yXfhgo+ZYSN+QgE32LNiahISOTjYevpznaC12+LQbuMiTdaB9t35VkjSGdMRBkNoUY0a6QV41EUGQse2ulr8PG5yoBxA04s728+jfMDP+5Kfx5hnzrD98h8Ud6y/Ntx6TC2t6+2eQQn0lZLiCBYslAQcfW21xSpZin0+cWrq4HUPnFsvftHMrKY5u8XisYCr6M/ofCDuFDOREuibtbMNjLZAogkUtjo6gUOyCW/AiJdaDoXk4ApbhnWymChg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH8PR11MB8014.namprd11.prod.outlook.com (2603:10b6:510:23a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 08:02:29 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 08:02:29 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH v5 i-g-t 3/5] benchmarks/intel_latency: Add xe_vm_bind
 latency test
Thread-Topic: [PATCH v5 i-g-t 3/5] benchmarks/intel_latency: Add xe_vm_bind
 latency test
Thread-Index: AQHcRJbGxahSjTdsjkyCU3uGDK8KBrTQ72Qw
Date: Fri, 24 Oct 2025 08:02:29 +0000
Message-ID: <CH3PR11MB8434EE4C8AC19B4371B54AB68DF1A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250917121626.67917-8-gajendra.uttamchand@intel.com>
 <20251024033118.15674-7-gajendra.uttamchand@intel.com>
 <20251024033118.15674-10-gajendra.uttamchand@intel.com>
In-Reply-To: <20251024033118.15674-10-gajendra.uttamchand@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH8PR11MB8014:EE_
x-ms-office365-filtering-correlation-id: b6eece35-5e11-41b3-1ad7-08de12d3ad87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dlU3U0FOdEtia0NwNVNWVGRsaE1SUXFrSUlHRkVCbzZiMndnRG8wZXBLQVZC?=
 =?utf-8?B?aXkxazR2cjBzQVVwYUZMWG9mcnVCTURvazJXZ3ZPdFpMNDZMSjhWZ1ZscVZV?=
 =?utf-8?B?YlFvWVE3cnZrdWFLU3JpbklqQWlQckVSckNGd1FVQXN1R3BsY2g4YjBKbElX?=
 =?utf-8?B?YkRlOHdiUWpHdmYxdE92WlhlYlppT0pXUjJCTXBhVU40My94ajljRjhJWk5v?=
 =?utf-8?B?b2pHdSt0NUY2TDQ5SzRsSktHaGM5eTBmOHIzbXdOaitHVTVFTDZhV25lT2ZS?=
 =?utf-8?B?dXkxTFFOTDIvNzFpMnpqUGJvU3pTVEpBSEN2aTRqSFAzU1BjZ0lpYndtK05i?=
 =?utf-8?B?SmhKZnp1d1YvSkVCK2kwNm1hZ3dycEFCakJsdzJEWmxpZlJmTE1TOUZFTmwz?=
 =?utf-8?B?L09pSVZkUk5ZNlN0cHVIZC8yY0pMWkR3U2tjSERwcUx6VGlwYWFVTFRuZWY2?=
 =?utf-8?B?bGFEK2ZqOVhWcXpGc1lJaUNtNXByTEx4b1hLamFkcGNkN3BlYXRsaXVaTmlm?=
 =?utf-8?B?QWJTRFQrYjNMMHRuMGU2Ry9tV0xnODlXclZkUTZMMnhQdEszanVHcWFpdGIy?=
 =?utf-8?B?SzN6UFFIYzBHeGV1QzlDMjgrTmR3WVF2c2lmZmhEWjV1djhzaFdaS3lsL09U?=
 =?utf-8?B?dzhmTjRaU3l5RU1SRWpueGxKUnJQOGt3aGdsWXA4UkhPSUhxRFh4b0pEb2NU?=
 =?utf-8?B?cXZxRW00OGdkbnlvNUQydFFnS0VMd09XbWd0U25YV3RTbXg4NFprT3g0ckJS?=
 =?utf-8?B?NkVVRW9sZlF1WWtFNmxzbTNlSUN5cEFlNEVrZ01PWVA1WUcwYW8rMWM1d0dG?=
 =?utf-8?B?QUQ5YWRITDYvWWdaWlJsN0pTM3lLcXpkeDVCTi80M05wK3AxQnVObnEwbjJz?=
 =?utf-8?B?czB3VExLMmI4cjdMK3N4ak1GM3hVRDZRY0FMQ3BLR3pVMk1RbUdiaWE1RVAv?=
 =?utf-8?B?MTk1K1NyRkRucEVhZUVVNWFTTlBoeXBZNitTamRST0NxU1hhdjFlaWh1ZVJO?=
 =?utf-8?B?MGVwN0RTMWhXSXBwU2lXMnJZTU9ZUTcvY3N4UHdQaEVBNUlJZzg0dlFESE5q?=
 =?utf-8?B?V28xRW5PRjBUcDNPYXgvR3ZCUjkyKzY1NzhxRWQvYktFNkxlN2M4Y3A0WktE?=
 =?utf-8?B?YTI2dC9sNHIwcDNXM3ZERS85cTR0SWxxM1NQLzVIT2N2S0ZPUXRQbjJIaUNN?=
 =?utf-8?B?QXlzckF5MGpBVEFjY2FkWCtEc2svcFVMc0lGNGd1YjYxN2xMbHFFazM0MUFX?=
 =?utf-8?B?b1hsZ0Q5RTByaXJkNms5R045Q1ZqVEtBdFNPU1l6dGhjc1lkNGJGQ05qS0VT?=
 =?utf-8?B?WklQN2FrZFNFM1hPWElkWkpSODFtYll2MnNhbGJ2djZobGY1RkNMaUpYVTNx?=
 =?utf-8?B?ZndRcTl4Y2huM3IyOXdyaDY0Q3NjRW4yenBBMk5SZ3dvTlMrTTc2bFpvWXFk?=
 =?utf-8?B?VUNyeis5RG1TK3JyeUY5VDUzM0Z2UUJlditDOUpxOVlsNjlxd1VLODVyZnN5?=
 =?utf-8?B?K1ArcVVXQzd5RkFpcFRidzk1ZzZJREdiMDJTbnA0aUFVdkNZM2RTdXozc3dk?=
 =?utf-8?B?SzB0SDRIeWN5UGNKSldUS01vRHVMU2U0QVJDZmRKYWFHR0pwUEViWUJLTTFH?=
 =?utf-8?B?K1Y3ek1NRDhLN09QRlF1cXg5NjZUc09kLy9jb2lOZU1pM0twcTUzcVMyMkVi?=
 =?utf-8?B?SXR2OWJmcW92V3hyN0U5cGVyZmd6cTNjdzZjNElxZ0lta1F1VXd5S1JTamNC?=
 =?utf-8?B?ZmlLQ2h2VTFudUNaQkpOazJsRTkwT0JXOG52U0FhaHVXaVhieUQxVUxmaTY2?=
 =?utf-8?B?ZGw0SlBxbUowYjYzaCtxVk1CSDk2VVYrMVFKbmUxTXZORFRXeHBndGVtNngz?=
 =?utf-8?B?SlpHTzlGdHZzUjRveDhZZnVWT2ZSTDFmSzk1cGNtYnBtTUp2Sko3Q2NZT2o4?=
 =?utf-8?B?TUVVM2JTWTVnK0VtUEgwTkp4bml3NzB0T0k2bEpOdUNtRE9ydUlieFF2Q2R4?=
 =?utf-8?B?Vk9Kcm9JNUZYV0xnTEhVUUZMWDNKNzRIWjE5b2VVK0x6dnFtTzY4RjFPbzhY?=
 =?utf-8?Q?+hdvKW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3liWFhibGJhOUM5N0pmdm5nMXdYYWFvaHR5dlRSZTVoQmx1aFl4ZUVjRWNU?=
 =?utf-8?B?SlFabWFPVTVaWjZMZUpSbjl4T1pwaHlZS1V2cUZOM1VmTDlWNkxDOEFXUS95?=
 =?utf-8?B?ZUt3UFFTcFptMmlVMmZqNHBXWG9nblFlcVVlVHl3cmE3ZW1NS0JoVHM4bVc0?=
 =?utf-8?B?ZzNBd2pDZ0I3a0x1QkV1WmttNFJ1YldVTU4vd2pvRy9JcTlFNC9CNWIzcWNK?=
 =?utf-8?B?YmNmSmxoMTJWYXgxTWpONzIxQ2szZ0tCY2psVTJqZmd6KytmeFF3MGhyWFFi?=
 =?utf-8?B?dk44WkMvRjBqUVZnemJ1dlRIZWJLSFZXK0hKUHc1L3BDYlV4dUFIZ0dBK0s5?=
 =?utf-8?B?SXpRK0hzb2tQQmVuUjFkdEFwVDNhQUJ4TU5mcENVYVY1Mllxakt0L1N2S0Vy?=
 =?utf-8?B?NmFtdWtBdmRUdzZETWozcmN2U2NuZCtOUkYzV3VwOFlqVk5iaGc0QzlweHF4?=
 =?utf-8?B?ZnowQXdaT0VMMStzbytLVnRqYmlxVVQzcjI4K0JaUGVQVzVuMlIreko3TDZr?=
 =?utf-8?B?d2I0dzF2eE9jdFkvT0dnNTZyZ1lLUFFYVjAvenRUak1KTllNWUlXZU0yTEFs?=
 =?utf-8?B?eWh6amRGbVNhMVVNTlo2S2wydEdOckJ0d2lXeHZCbUtjWHJqUlgxVG5WbXg0?=
 =?utf-8?B?UzlHUTVOaEN4SDZtKzY2UDdjRmZBMTA3YlJvY0V2VzlGT0pPaTY3ZmhXRUVN?=
 =?utf-8?B?dXA3L1FpaVhwd2NXRkZtZGFDNVZtNW5SNGI3Qk9RcTh3eEpiOXIyWUVWVkUr?=
 =?utf-8?B?aEZlTGV5TkIxbzA2MnZ2YVVpQ1V1eVlIUVNHdnozSjAxYnNJcDd6aEZRM0cw?=
 =?utf-8?B?RWtEd043TmlxK1FGUzZKODN0dWZWN20zZmZNSlpEb2VndEVoc3VKaXNmWjFi?=
 =?utf-8?B?eldIS0cwTG1md1BtQ1UvaWduaHl0andNQzdpL1U0WDlyb3grUHlhR2hWK0Nj?=
 =?utf-8?B?Q0NaL3BPa2FVZHVzaUk2NXl3TXJtdTlEREllVkdERk9YYTU5SFhSMFFWRGs4?=
 =?utf-8?B?T3VvMis0UkhBcmEySkVPQSt4TVdnQzBpczdESkZjYWVMMm1GdnVBUXBIaGY1?=
 =?utf-8?B?TW1LNWh4YTFvd1E2NExVMy82RVF5NXpvdnJIOCtsNFZPSU5PYkV1ays5RVZr?=
 =?utf-8?B?NFphQXB5SVJJRzNWa3VUbS9SVCtubHpiZnhYMzVMTlQrWmhaQnZ2ZjQxeEox?=
 =?utf-8?B?d1RtV0ZxTFRaMEZFYzBVb1dSVlZHSXhIeG1KM1NFRkw5dEVNUVJGdE1oaDIr?=
 =?utf-8?B?NXFNZGdwdzJRb1hieEw1TkpsbFlJTEM0LzVPK2RoT1RuR1BEZDdhWkxXWDEw?=
 =?utf-8?B?aGFFdSsyZTdRZXovVDc1UjNQY3lhQ2tCZUtadkJuUnhKMVhqRmdaeUMwdHBl?=
 =?utf-8?B?V2xsZzVINnVtWmZod1BmM21hTzMyWTdCRzhiaWJTbU1kRHhuTXdVWWdBTTU3?=
 =?utf-8?B?bHpvQ3Q0TnFrNjlRVGVIQ1c5MzRSYlFMaDJPQnpNNzMyRHptZ1JuNEFCaXk2?=
 =?utf-8?B?T3lVS2Z3M2RWRlVNbHRwOUIwejI2S0o4bWUwSkdtUDJCU3dMUVlGcVQvSnJV?=
 =?utf-8?B?WEI3cHFjc0N1dFBiVWRGQTNYMVo5MDB0ZVpDL2pzR0xpaWdBUzdvNDhMenN2?=
 =?utf-8?B?MzVLVEdab1p5R0gxV2pUQ3A5M0VPUE9VYzVrU0pqSG5FSm4zOHB6MWc4SnVj?=
 =?utf-8?B?cW5CeWtzQ3lzSUl1dVZiVXVWT3pIOTMyOXRjekk3bEVMQmdHcGhzdGR3RDVZ?=
 =?utf-8?B?Wk4wbzE1Y083dUZ1OHc0NGo2Rm5Nem1PejlGVGdzcERMVnUzdTlSZ2pqZThs?=
 =?utf-8?B?aGJ2UTRxK0U0S3FQZ1JxRnhNd0tnb1I5alNRckRTTTRac1lQNitZZ1JodEZI?=
 =?utf-8?B?N0p5SnU3ZmlPWjhCS2c4QjJpTDRCRlFoZ094YnBLRk53VEdqZUFvUWFoVXJp?=
 =?utf-8?B?dWx0Qis0cWdIN0l0UzZSMUJmRWlYSXk0b2pvaEJoQmI1aFB3MzNva21kL2tC?=
 =?utf-8?B?RGFQM0lja291RDI5TWtML0lLcTRkOG9QY1gwK2d2d0dFaCs3Z2I3enlZQnp4?=
 =?utf-8?B?V3d5Zk1VZmFJR0NrQ2p6Z3RmVGxKU1VhMnBKaWptNE9LNktlYnlLRU00QjFu?=
 =?utf-8?B?bktkOFMvRVNTWDhadHlZaUl2eWpad0RiUXFacnlFU1FCc3Y1dDg1U2NNdjdY?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6eece35-5e11-41b3-1ad7-08de12d3ad87
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 08:02:29.1711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kuZvKCzmYc4zVrLKrGLcqlYyusOGdwxhHop/srbDg9oQKo1p9L6BkLwZWnwfIzWKHifRc5tUO+8iVfv8u0eNrdg6BENWHqfIoTbW3DW7E5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8014
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVXR0YW1jaGFuZCwgR2Fq
ZW5kcmEgPGdhamVuZHJhLnV0dGFtY2hhbmRAaW50ZWwuY29tPg0KPiBTZW50OiAyNCBPY3RvYmVy
IDIwMjUgMDk6MDEgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBLb25pZWN6bnksIEthbWlsIDxrYW1pbC5rb25pZWN6bnlAaW50ZWwuY29tPjsgRGFuZGFtdWRp
LCBQcml5YW5rYQ0KPiA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT47IFV0dGFtY2hhbmQs
IEdhamVuZHJhDQo+IDxnYWplbmRyYS51dHRhbWNoYW5kQGludGVsLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIIHY1IGktZy10IDMvNV0gYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5OiBBZGQgeGVfdm1f
YmluZA0KPiBsYXRlbmN5IHRlc3QNCj4gDQo+IEFkZCB2aXJ0dWFsIG1lbW9yeSBvcGVyYXRpb24g
dGltaW5nIHRlc3QgZm9yIHRoZSBYRSBkcml2ZXIuDQo+IE1lYXN1cmVzIGxhdGVuY3kgb2YgVk0g
bWFuYWdlbWVudCBvcGVyYXRpb25zIGluY2x1ZGluZyBtZW1vcnkNCj4gbWFwcGluZywgdW5tYXBw
aW5nLCBhbmQgdmlydHVhbCBhZGRyZXNzIHNwYWNlIG1hbmFnZW1lbnQuDQo+IA0KPiBEZWZhdWx0
czogYnVmZmVyIHNpemVzIGZyb20gNEtCIHRvIDhNQiwgMTMgcmVwZXRpdGlvbnMsIDEwMDAgaXRl
cmF0aW9ucyBwZXINCj4gcmVwZXRpdGlvbiwgMiBzZWNvbmRzIHBlciBzYW1wbGUsIHNpbmdsZSBD
UFUuDQo+IFBhcmFsbGVsaXNtIGFuZCBidXN5IG1vZGUgYXJlIGNvbmZpZ3VyYWJsZSB2aWEgY29t
bWFuZC1saW5lIG9wdGlvbnMuDQo+IA0KPiBFc3NlbnRpYWwgZm9yIGdyYXBoaWNzIHdvcmtsb2Fk
cyB3aXRoIGNvbXBsZXggbWVtb3J5IGFjY2VzcyBwYXR0ZXJucyBhbmQNCj4gZHluYW1pYyBtZW1v
cnkgbWFuYWdlbWVudCByZXF1aXJlbWVudHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBHYWplbmRy
YSBVdHRhbWNoYW5kIDxnYWplbmRyYS51dHRhbWNoYW5kQGludGVsLmNvbT4NCj4gLS0tDQo+ICBi
ZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kvbWVzb24uYnVpbGQgIHwgICAxICsNCj4gIGJlbmNobWFy
a3MvaW50ZWxfbGF0ZW5jeS94ZV92bV9iaW5kLmMgfCAxMjYNCj4gKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTI3IGluc2VydGlvbnMoKykNCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBiZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kveGVfdm1fYmluZC5jDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L21lc29uLmJ1aWxkDQo+IGIv
YmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L21lc29uLmJ1aWxkDQo+IGluZGV4IGIzNTQ1ZWZkMC4u
OTM5YTAxYmYyIDEwMDY0NA0KPiAtLS0gYS9iZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kvbWVzb24u
YnVpbGQNCj4gKysrIGIvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L21lc29uLmJ1aWxkDQo+IEBA
IC0zLDYgKzMsNyBAQCB4ZV9sYXRlbmN5X3Byb2dzID0gWw0KPiAgCSd4ZV9jcmVhdGUnLA0KPiAg
CSd4ZV9leGVjX2N0eCcsDQo+ICAJJ3hlX2V4ZWNxdWV1ZScsDQo+ICsJJ3hlX3ZtX2JpbmQnLA0K
PiAgXQ0KPiANCj4gIGxhdGVuY3lkaXIgPSBqb2luX3BhdGhzKGxpYmV4ZWNkaXIsICdiZW5jaG1h
cmtzJywgJ2ludGVsX2xhdGVuY3knKSBkaWZmIC0tZ2l0DQo+IGEvYmVuY2htYXJrcy9pbnRlbF9s
YXRlbmN5L3hlX3ZtX2JpbmQuYw0KPiBiL2JlbmNobWFya3MvaW50ZWxfbGF0ZW5jeS94ZV92bV9i
aW5kLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwLi40ODlmMDEy
NGYNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9iZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kveGVf
dm1fYmluZC5jDQo+IEBAIC0wLDAgKzEsMTI2IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9yYXRp
b24NCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSAiaWd0LmgiDQo+ICsjaW5jbHVkZSAiaWd0X3N5
bmNvYmouaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPiArI2luY2x1ZGUgInhlL3hl
X3F1ZXJ5LmgiDQo+ICsNCj4gKyNkZWZpbmUgT0JKRUNUX1NJWkUgKDEgPDwgMjMpDQo+ICsNCj4g
K3N0YXRpYyBkb3VibGUNCj4gK2VsYXBzZWQoY29uc3Qgc3RydWN0IHRpbWVzcGVjICpzdGFydCwg
Y29uc3Qgc3RydWN0IHRpbWVzcGVjICplbmQpIHsNCj4gKwlyZXR1cm4gKGVuZC0+dHZfc2VjIC0g
c3RhcnQtPnR2X3NlYykgKyAxZS05ICogKGVuZC0+dHZfbnNlYyAtDQo+ICtzdGFydC0+dHZfbnNl
Yyk7IH0NCj4gKw0KPiArc3RhdGljIHZvaWQgdGVzdF9leGVjKGludCBmZCwgaW50IHNpemUpIHsN
Cj4gKwl1aW50MzJfdCB2bSwgYm87DQo+ICsJaW50IHJldDsNCj4gKwl1aW50NjRfdCBib19zaXpl
ID0geGVfYmJfc2l6ZShmZCwgc2l6ZSk7DQo+ICsNCj4gKwl2bSA9IHhlX3ZtX2NyZWF0ZShmZCwg
MCwgMCk7DQo+ICsJYm8gPSB4ZV9ib19jcmVhdGVfY2FjaGluZyhmZCwgdm0sIGJvX3NpemUsIHZy
YW1faWZfcG9zc2libGUoZmQsIDApLA0KPiArDQo+IERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTkVF
RFNfVklTSUJMRV9WUkFNLA0KPiArCQkJCSAgRFJNX1hFX0dFTV9DUFVfQ0FDSElOR19XQyk7DQpX
aHkgY2FjaGluZyBpcyB1c2VkIGluIHRoaXMgY29kZSwgYW55IHJlYXNvbiBiZWhpbmQgaXQ/DQo+
ICsJcmV0ID0gX194ZV92bV9iaW5kKGZkLCB2bSwgMCwgYm8sIDAsIDB4NDAwMDAsDQo+ICsJCQkg
ICBib19zaXplLCBEUk1fWEVfVk1fQklORF9PUF9NQVAsIDAsIE5VTEwsIDAsIDAsDQo+ICsJCQkg
ICAwLCAwKTsNCj4gKwl4ZV92bV91bmJpbmRfc3luYyhmZCwgdm0sIDAsIDB4NDAwMDAsIGJvX3Np
emUpOw0KPiArCWlndF9hc3NlcnRfZXEocmV0LCAwKTsNClRoZSBhYm92ZSBhc3NlcnQgc2hvdWxk
IGJlIHByZXNlbnQgYmVmb3JlIHVuYmluZC4NCj4gKw0KPiArCWdlbV9jbG9zZShmZCwgYm8pOw0K
PiArCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsNCj4gK30NCj4gKw0KPiAraW50IG1haW4oaW50IGFy
Z2MsIGNoYXIgKiphcmd2KQ0KPiArew0KPiArCWludCBmZCA9IGRybV9vcGVuX2RyaXZlcihEUklW
RVJfWEUpOw0KPiArCWludCBzaXplID0gMDsNCj4gKwlpbnQgcmVwcyA9IDEzOw0KPiArCWludCBu
Y3B1cyA9IDE7DQo+ICsJaW50IGMsIG4sIHM7DQo+ICsNCj4gKwl3aGlsZSAoKGMgPSBnZXRvcHQo
YXJnYywgYXJndiwgInM6cjpmIikpICE9IC0xKSB7DQo+ICsJCXN3aXRjaCAoYykgew0KPiArCQlj
YXNlICdzJzoNCj4gKwkJCXNpemUgPSBhdG9pKG9wdGFyZyk7DQo+ICsJCQlicmVhazsNCj4gKw0K
PiArCQljYXNlICdyJzoNCj4gKwkJCXJlcHMgPSBhdG9pKG9wdGFyZyk7DQo+ICsJCQlpZiAocmVw
cyA8IDEpDQo+ICsJCQkJcmVwcyA9IDE7DQo+ICsJCQlicmVhazsNCj4gKw0KPiArCQljYXNlICdm
JzoNCj4gKwkJCW5jcHVzID0gc3lzY29uZihfU0NfTlBST0NFU1NPUlNfT05MTik7DQo+ICsJCQli
cmVhazsNCj4gKw0KPiArCQlkZWZhdWx0Og0KPiArCQkJYnJlYWs7DQo+ICsJCX0NCj4gKwl9DQo+
ICsNCj4gKwlpZiAoc2l6ZSA9PSAwKSB7DQo+ICsJCWZvciAocyA9IDQwOTY7IHMgPD0gIE9CSkVD
VF9TSVpFOyBzIDw8PSAxKSB7DQo+ICsJCQlpZ3Rfc3RhdHNfdCBzdGF0czsNCj4gKw0KPiArCQkJ
aWd0X3N0YXRzX2luaXRfd2l0aF9zaXplKCZzdGF0cywgcmVwcyk7DQo+ICsJCQlmb3IgKG4gPSAw
OyBuIDwgcmVwczsgbisrKSB7DQo+ICsJCQkJc3RydWN0IHRpbWVzcGVjIHN0YXJ0LCBlbmQ7DQo+
ICsJCQkJdWludDY0X3QgY291bnQgPSAwOw0KPiArDQo+ICsJCQkJY2xvY2tfZ2V0dGltZShDTE9D
S19NT05PVE9OSUMsICZzdGFydCk7DQo+ICsJCQkJZG8gew0KPiArCQkJCQlmb3IgKGMgPSAwOyBj
IDwgMTAwMDsgYysrKQ0KPiArCQkJCQkJdGVzdF9leGVjKGZkLCBzKTsNCj4gKw0KPiArCQkJCQlj
b3VudCArPSBjOw0KPiArCQkJCQljbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQywNCj4gJmVu
ZCk7DQo+ICsJCQkJfSB3aGlsZSAoZW5kLnR2X3NlYyAtIHN0YXJ0LnR2X3NlYyA8IDIpOw0KPiAr
DQo+ICsJCQkJaWd0X3N0YXRzX3B1c2hfZmxvYXQoJnN0YXRzLCBjb3VudCAvDQo+IGVsYXBzZWQo
JnN0YXJ0LCAmZW5kKSk7DQo+ICsJCQl9DQo+ICsJCQlwcmludGYoIiVmXG4iLCBpZ3Rfc3RhdHNf
Z2V0X3RyaW1lYW4oJnN0YXRzKSk7DQo+ICsJCQlpZ3Rfc3RhdHNfZmluaSgmc3RhdHMpOw0KPiAr
CQl9DQo+ICsJfSBlbHNlIHsNCj4gKwkJc2l6ZV90IGxlbiA9IChuY3B1cyArIDEpICogc2l6ZW9m
KGRvdWJsZSk7DQo+ICsJCWRvdWJsZSAqc2hhcmVkOw0KPiArDQo+ICsJCXNoYXJlZCA9IG1tYXAo
MCwgbGVuLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLA0KPiArCQkJICAgICAgTUFQX1NIQVJFRCB8
IE1BUF9BTk9OLCAtMSwgMCk7DQo+ICsJCWZvciAobiA9IDA7IG4gPCByZXBzOyBuKyspIHsNCj4g
KwkJCW1lbXNldChzaGFyZWQsIDAsIGxlbik7DQo+ICsNCj4gKwkJCWlndF9mb3JrKGNoaWxkLCBu
Y3B1cykgew0KPiArCQkJCXN0cnVjdCB0aW1lc3BlYyBzdGFydCwgZW5kOw0KPiArCQkJCXVpbnQ2
NF90IGNvdW50ID0gMDsNCj4gKw0KPiArCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklD
LCAmc3RhcnQpOw0KPiArCQkJCWRvIHsNCj4gKwkJCQkJZm9yIChjID0gMDsgYyA8IDEwMDA7IGMr
KykNCj4gKwkJCQkJCXRlc3RfZXhlYyhmZCwgc2l6ZSk7DQo+ICsNCj4gKwkJCQkJY291bnQgKz0g
YzsNCj4gKwkJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsDQo+ICZlbmQpOw0KPiAr
CQkJCX0gd2hpbGUgKGVuZC50dl9zZWMgLSBzdGFydC50dl9zZWMgPCAyKTsNCj4gKw0KPiArCQkJ
CXNoYXJlZFtjaGlsZF0gPSBjb3VudCAvIGVsYXBzZWQoJnN0YXJ0LA0KPiAmZW5kKTsNCj4gKwkJ
CX0NCj4gKwkJCWlndF93YWl0Y2hpbGRyZW4oKTsNCj4gKw0KPiArCQkJZm9yIChpbnQgY2hpbGQg
PSAwOyBjaGlsZCA8IG5jcHVzOyBjaGlsZCsrKQ0KPiArCQkJCXNoYXJlZFtuY3B1c10gKz0gc2hh
cmVkW2NoaWxkXTsNCj4gKw0KPiArCQkJcHJpbnRmKCIlNy4zZlxuIiwgc2hhcmVkW25jcHVzXSk7
DQo+ICsJCX0NCj4gKwkJbXVubWFwKHNoYXJlZCwgbGVuKTsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1
cm4gMDsNCj4gK30NCj4gLS0NCj4gMi40My4wDQoNCg==
