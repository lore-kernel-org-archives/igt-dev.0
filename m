Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE3EC3ABC9
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 12:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE8D10E800;
	Wed, 21 May 2025 12:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fLcIueIr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0ED10F43F
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 12:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747831551; x=1779367551;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4eoC4BpVI3uX37xnVvDi7OyRZTw/IE+2H+st/tuFyqk=;
 b=fLcIueIrDNarVM+ZmjiZpg+kX6xuiuV/VKleAi3ctxYRONq4FXoqbJym
 sujFSiL0pFQ1ytCsiARigiwHKpqq+sjLr3ZxvahOZkld5c8vrVHUplJP4
 YdeaZytG3WoN5MVn76pcfkd5q02+IIu4sEiYXBnvcQhSBzjLJcvoUuXt8
 85L5f4V2ehuZ6JOkTGmQlXD7q2xolI9vzCG66WN3FGVMewCfZvWZXTNKn
 S3yERX0KouPu+LwfUdH8y0j1JC5simuFdX+fr1/7695DoHUJ4JUr0A7CF
 6JgkTeKPFHTekvE3F5dv7RxcHVe9hAEECMpkXwWJbWg6WUyCsY9291FSY A==;
X-CSE-ConnectionGUID: 1lSAkYZBTN2YJpjiPSyLxw==
X-CSE-MsgGUID: kBGxiMjfTe+Fy4w4V1aqzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49962469"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49962469"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:45:50 -0700
X-CSE-ConnectionGUID: GcA/9+xxRB+6WpPSRv979A==
X-CSE-MsgGUID: TgFLr7g8TCSDmLh4CoubFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139909697"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:45:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 05:45:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 05:45:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 05:45:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJGi5jQaRONqpzqwg85H/YDgMSvYShiXdtJ3VJ/EWqCuuWEJV3IX2NggwrFJYUa8tJO2iQMy+XypnwkxCWGbBsMWiAEv9v7VgMJ7Q309aGokCWN0udZTwuoZJAwPTmwj7w/NTXUcgGygrnq3CcOXN44z4XKJcD56wwZlM3xbciHbbD4zCADktxoEtDXISPlWIkyN+pW68X/TW/Ad76Do6tqOnL8iCi9ALtvbyzOSUyKh7EmGjxHDx1HQx7nUjTcccMJqvYY0aP3vpUjBUmvXfxWZ8810IhhZBxtga/49qxt35rrrScjER7rA1HtcJRgAZjiaPfIvkh6fPL4lvSXVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eoC4BpVI3uX37xnVvDi7OyRZTw/IE+2H+st/tuFyqk=;
 b=x/5iPgUdkeaKYqiEBk8LkoGD8fNTgHD6YZbid4JzJzJBEahMVa0PSWHBBuXM2//OE8i/XNoMWEbaFEwxc4Zac8HEIKvkZ6p5xfLNSrvMfcL/aSi70CqicI6G/w65ZWQdOztomRPfGibddQw1wy5NuGB+YNEpAvwNd3zcaUJVVMGIC1BftL3hsqCR7yD6FzRAt6ukIWf/W235MELT7h+zTHBz/YlwV5b5NEQG9oVRbAVgFgzkgzb5L+j5v4bIzPvi5pxyphoWTG0bGvgmonT6rhxAOUn3kfXk1YbkGiBDY6r4SIVZIzgRi3OIQMShk6Ry7HEm8OKug2Orbwsa1vF+3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA4PR11MB9417.namprd11.prod.outlook.com (2603:10b6:208:569::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 12:45:42 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:45:41 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v10 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
Thread-Topic: [PATCH i-g-t v10 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
Thread-Index: AQHbyj/pVung7s8oE0ic1iO8VMVdgLPc/0XQgAAIOICAAAAnAA==
Date: Wed, 21 May 2025 12:45:41 +0000
Message-ID: <SJ1PR11MB6129CE6754E353E8ABA55703B99EA@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250521105308.4179637-1-santhosh.reddy.guddati@intel.com>
 <20250521105308.4179637-6-santhosh.reddy.guddati@intel.com>
 <SJ1PR11MB612965E12B4493B74F63F0D7B99EA@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <b48c3a76-204b-4b64-a2a2-90e3d7624c16@intel.com>
In-Reply-To: <b48c3a76-204b-4b64-a2a2-90e3d7624c16@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA4PR11MB9417:EE_
x-ms-office365-filtering-correlation-id: 8655e21f-b1ef-4797-7e68-08dd9865656d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UWtBMlFZaHlWdXNaTkdEK3MycjFUUkp0QVFjZmpNZEhJOUhyZjE4ZFZFa0pa?=
 =?utf-8?B?ZkRIUVhra0d1YWFHZkMxa240b1RrQXlTd1lzU3EwNE8rTjQxcU8wL004cU5i?=
 =?utf-8?B?bTYwek5TcGFFMkh2ZXJCY0FjczBFSXhrOWo4UGt2b3gzREdsUlJVZlNSWDRq?=
 =?utf-8?B?K3RCMlVDRDNWMjAvQXNxM1MyTHljWkJyMm44Rlphd0VVYmYwRXpZWnIwMXpM?=
 =?utf-8?B?WEhGZEJYNHZTMVFTeEE1cnJWWE16b0VDMHgyOGtoS2Y5Y0wyQUMzNzQ5OEpN?=
 =?utf-8?B?bkVCdXVIc0xJNFBUbnZuL01iMDhjeUh1VG5jWVNtVkVHQ0Z5U0NpTU9RUStF?=
 =?utf-8?B?MnZsSlVTY0JralBtMjIwNThycXdoRlFHakhsQ2FTR3RoTzYwV1RRVnBiSzl6?=
 =?utf-8?B?cnVlTFNxUWhQdmJBa3lKSkNEbmsxd2RNd0YzSUJZdXJ1bzVwamZ2SUQ4ZVJX?=
 =?utf-8?B?MXRSeTBYdlN5MkRvYmR6cEVIUjVibWRHM0dnc2Zzd0dPM29TTVIzaFhqZnky?=
 =?utf-8?B?SlE5MlU5Y1U3b0E0L3dLNytwOTROc3NPSllBS1R1Vjlld2pFZWk2NVFBOHNL?=
 =?utf-8?B?SGNTTldZQVYvODg4YS9OakFaMmJKVzl5dVRmYUNkZnBveFBBZXdmTjZyd01P?=
 =?utf-8?B?UXdEZE90S2JSamJpR3Z3aHUxaXZwd25zZFFUdE82QlNia0Z5dTJJZllPSStZ?=
 =?utf-8?B?U3hJNVh2U3l1RlpYNjNmNjRqa1crdGJMMGdUeWZ1L0NMMG1qV0p3R1JFaDBU?=
 =?utf-8?B?Zlc4ZmxJZlJqMU16VFVQeWplWlhlTXN6Y09HbDM2TElBdENrYUFESU1WZkMv?=
 =?utf-8?B?dG1DWUpkU3VuVmFER2NpMzNSL09JMjJlMEMwdys1ZENQbHhmei96UzZUbGdR?=
 =?utf-8?B?eWVydmM0SlN0UldaOFZKaElNaC9BVXBMSDhlM3Y3V0I3UXp4ZzkvTjNiTUp1?=
 =?utf-8?B?TDVzYUgzK1Q3bnpOSForOVh6d0NKMkJzUFp5VG1MRVRKU0JOL1krVVo1R0Zi?=
 =?utf-8?B?R3ZhZ1phODJzQTdGRTQ4dmYvRDdrV1VIaXZyaWRtOFVHcVJuVWRxeTJPaElk?=
 =?utf-8?B?M283WWYyMUZJejNNY1lUcWVPd3ZaSHowb1JnK3dtWjA2MTJvMjJtZS8zUHpy?=
 =?utf-8?B?UklKNWVISm1wajhRNjdjV3NSYjZ2dDZLMWpWUnFwRDRIcENOcVN5eFE0cnM3?=
 =?utf-8?B?K0ZFNXplVHlBb2czUlY0NDdhd1UvUndpc01xRVFQR1ZaNWJFZEI2TTBEK25q?=
 =?utf-8?B?S2VRb3NnQlBWMEYyZWhaaEY4eWVRNXpNUU1BZW9MeXhLRnpORDIzWEJpNWdZ?=
 =?utf-8?B?dC9jempzVGhDclc3clF2K2VhRm9CbkJWQ2NwQnp4RU9MRHlSMGIxZ3dwRTM5?=
 =?utf-8?B?L0NpcTl2RDRuZFZXMlZCcEF0UHlWUVVaRjVGRExtVVVORU43bWI4MHFhQXNt?=
 =?utf-8?B?Q1Z2bHVKd0czd1dpYlpwMmRhS2c2Vld6QWsxL3BkYWJhZGpCMnE4amtsT3hu?=
 =?utf-8?B?cU5OcFEyUUJqRHlnMENJMnRYRVlXZnpWRXZ4TDZSV1EzQmVuSjRBK2pPTmV2?=
 =?utf-8?B?bC9sei96N1REN05EQWY0eFM5NTR3cDZLU0U3c2JWd2RXY0k4RS9GVWNqY0Mr?=
 =?utf-8?B?NUV3TjZkOGZEZ1ZEaGg0RDRsbVZuY1hzcm9SZGl1MjJqNzNLNE1EVEM5NEV5?=
 =?utf-8?B?c3JLM3RvMER1K3hTM1o4eG9xVEtUbHBQbDZ6R2NBRFE0R0VOckxCVDBXdW5P?=
 =?utf-8?B?ZnhzbzBld3VhbFRCUDdWZFBjSG1yeVFOajBJaHBDdXgxOVgvZHRRN2gySzlR?=
 =?utf-8?B?QnBwYjVGMHRTUEljTU5JUGplYW0wcW1zM0lWTXo5RStMY004c1FKY2laWHNG?=
 =?utf-8?B?Q0IxSjVtMjlUdExibHR5dmp4MVBPdDIzVUxJVWhXYXlmL2lzdVI2YjNYMTZV?=
 =?utf-8?Q?5OfQ8aEHHZ4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDA4SmQ1ZjQ4OXMyOEpNWmJaTFdrTWxrbm5rSkZrWjNwTmRKZmZxUXVqeDlE?=
 =?utf-8?B?MC9pdkV4OGVQTWR1Y1duV1A1WWo4aUpTZm9GR29JL25sQjhuSmdRLzhaaXhj?=
 =?utf-8?B?R3dqamtDUW9wQ3ZaK1pJTXpVZjhGWWpEQXZBZ2o2WUlDaXMvTE5pODJBVVRL?=
 =?utf-8?B?ZTRRaGJVL2ZYL1dtREI0QU1qbnRyUEFuV3pNYkVETm5mQTlVeXEweUhNTXd6?=
 =?utf-8?B?S1JuaE51T3dxK0ROUzhPbXNCZGdpSWQ4cXZMeWdJOVZSeStneU1lZXFNK3l3?=
 =?utf-8?B?TDdxdWtMK2xOdHcxbllZUENCaXB2MXZXOHZsejdnVGdMcjNJSForWFkyUnpI?=
 =?utf-8?B?RjJXWmt1WlJsQ05MbU1Bb3JOZWJrYTgzMmdTNDZES2JJT2NaR21kL1czU1B3?=
 =?utf-8?B?QkQ0UVAwbWM0TFlYOTFZTlNicUphT3B3RWhJeHlBTHJZUjBKS2NGOStJM3lY?=
 =?utf-8?B?bTdsZTZkVXV0RnljSi9kWVR5K2plRk5FUFdWSjRTYWhwTVJxR3FkYkJnY3dx?=
 =?utf-8?B?NjZOSFJKTHR6V3Q2YzZxSUQ0TndNdUt5cDNBem5LYjM1V2JKY2lUZ0JsRUY1?=
 =?utf-8?B?RkQ5QldPb3U3aDk5MGlkcTBpUk1kbEZSTzVCaUlxZTBDMkxDdHk4SC84b0FK?=
 =?utf-8?B?dzlSSForVmFMK1ozZVRwR1dDa1FuMUJRVjNYaXIyZS82UVRRc1p4Vk53d1d1?=
 =?utf-8?B?bW5yWXVLMUtJZ285N0l0bkc5SGVMNkN6Vzl5V3hFeCt5OFROcjFzZ1dRcnZV?=
 =?utf-8?B?blR4ck1WeGZCZE1reE9seDlRQVhzSUdvdk56NWJFcU9HR0hkSGpjTkQzSmxS?=
 =?utf-8?B?UEVWb2ttYURMbFg4Qjl1YVY5dFQyWlBERmwrTTJHT0kyS1lvMzBLZHpCYXhr?=
 =?utf-8?B?d2NhUTd6VWk0UWNkNVU4MUJibTVIT0U5ZUJCclU4TzhwbWRPRG5ScFJYMVJY?=
 =?utf-8?B?QVNGSnJLTFMxVm9JOFA5dEU5UmpzbGdCSUV2SFR1K3l0WVZ3MkNEQWZUV0Nt?=
 =?utf-8?B?TnJ1ck9uMEUzQ0VGT1VnM09sb0kwRjRsVFZpYTJqR3VtNVJIcnhyanlQYjdx?=
 =?utf-8?B?dkJ6cTI2OVE4amNtdDU5NmFZc3NHZ2Y3WVVabmIrZVFMb3VKNkQ1b2FPNCtW?=
 =?utf-8?B?L1hNL1d0anZCSWkyaWVVZnQwZVhaZisrV2N1eHo0OVR1NWsrSW9TTmpFUWpu?=
 =?utf-8?B?Q2hjcW9PL2htR3Y5c3VNR0RMaVFNNGV0WWgrOHJUano1TVN1dDBkMmkvaExp?=
 =?utf-8?B?dmM3Zmg1UjhtdFBpbmVxTVhOVlhZWXdtVGNqdk15eXpKaWxUQzZFeVEwQUNO?=
 =?utf-8?B?cndVRHVWY0VhQTh4bVVSMkN2VEIreHFrRTlaTkNzbVBFc0Jia3RwV2F1TE01?=
 =?utf-8?B?R3U5M09UK0pCMnNBMlJhaVhHQ0JCQSt2T0YyTGh4NU9xZklPdjJzSWtMYUth?=
 =?utf-8?B?ak9LSi9KdmVmLzFQU2xnS2dRYm9WMytnNzI4UHhicW9XNXhUQWZLVUMwblVW?=
 =?utf-8?B?U0lVTnRjVzU1QnNLMFZVSXd6UGdndjVNdVliaDJTVjh0NFM0STBTa3FjYVhp?=
 =?utf-8?B?L1JHcGpDVXY4TXpENVlKUy9JZC91YVJWSFoxMnduVzRvaU9qdVFvYzI5R2p6?=
 =?utf-8?B?M2Q4a1JhcFozTHdXR05KU0dlRkVCblZIbkhsNFN3R2h2WklLR2YwUE5zOVlr?=
 =?utf-8?B?YnZNQ1RJUlRtUmJrV0JvRFRYYzRrYk9PVjc5aXp6dXNnNDl1MFhTeWtCbjBZ?=
 =?utf-8?B?aWFESVQ2c0p3cDR5Ym5VRFMramZ0ZStCRUtJeUN0R1hqNTlTQXhDRnJaM055?=
 =?utf-8?B?Sk9RWGpsM1d3UlYyUit3dWJlR3Jrd214Zyt2bDEzcHF3dzlnZXJhSGtSUlRi?=
 =?utf-8?B?WEl5NXlMb1o1ZUxGaGh2TlppaTB5TVUvYmZVa1BPTTU1QUJHUS9qMkN0WGdJ?=
 =?utf-8?B?SkIxT3h1Z0gzUk44TEdTS3NjaVNscFFqWlZ6WjBzcGMzU285Vk5MMGZPOFpB?=
 =?utf-8?B?RVJrOWIrZGJEbVAyMEdYcERsaCtwdzdianNDZEhjd01INFpLS0gzazBrdytU?=
 =?utf-8?B?SEJPVGRPd3lzdVhkelo4OG1sbFY2UENhWTJGWVFFclNPZktVUWVyMlJTTE9n?=
 =?utf-8?B?c1RyQVpDN2VJU0xiUHNYdnJRZENWZmNNODdHSFc1bmptUEZnREh0OWd1bzZF?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8655e21f-b1ef-4797-7e68-08dd9865656d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 12:45:41.7095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WztcGqsY9lhEXpZhrU6NwjEvNWJdTweX4yQ0+xH+z3XIqV3IsRg90x+l8gf4/ztDSHoVRmZRSmFIl3KQQrJ/gIg6MTj+mX/NRZdDURFSrhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9417
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmVkZHkgR3VkZGF0aSwg
U2FudGhvc2ggPHNhbnRob3NoLnJlZGR5Lmd1ZGRhdGlAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIE1heSAyMSwgMjAyNSA2OjE0IFBNDQo+IFRvOiBCb3JhaCwgQ2hhaXRhbnlhIEt1bWFy
IDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBCIFMsIEthcnRoaWsgPGthcnRoaWsuYi5zQGludGVsLmNvbT47
IE11cnRoeSwgQXJ1biBSDQo+IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBpLWctdCB2MTAgNS81XSB0ZXN0cy9rbXNfYXN5bmNfZmxpcHM6IFNraXAgQXN5
bmMgRmxpcHMgd2l0aA0KPiBMaW5lYXIgTW9kaWZpZXINCj4gDQo+IEhpIENoYWl0YW55YSwNCj4g
DQo+IE9uIDIxLTA1LTIwMjUgMTc6NDUsIEJvcmFoLCBDaGFpdGFueWEgS3VtYXIgd3JvdGU6DQo+
ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBSZWRk
eSBHdWRkYXRpLCBTYW50aG9zaCA8c2FudGhvc2gucmVkZHkuZ3VkZGF0aUBpbnRlbC5jb20+DQo+
ID4+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDIxLCAyMDI1IDQ6MjMgUE0NCj4gPj4gVG86IGlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+IENjOiBCIFMsIEthcnRoaWsgPGthcnRoaWsu
Yi5zQGludGVsLmNvbT47IE11cnRoeSwgQXJ1biBSDQo+ID4+IDxhcnVuLnIubXVydGh5QGludGVs
LmNvbT47IEJvcmFoLCBDaGFpdGFueWEgS3VtYXINCj4gPj4gPGNoYWl0YW55YS5rdW1hci5ib3Jh
aEBpbnRlbC5jb20+OyBSZWRkeSBHdWRkYXRpLCBTYW50aG9zaA0KPiA+PiA8c2FudGhvc2gucmVk
ZHkuZ3VkZGF0aUBpbnRlbC5jb20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2MTAgNS81
XSB0ZXN0cy9rbXNfYXN5bmNfZmxpcHM6IFNraXAgQXN5bmMNCj4gPj4gRmxpcHMgd2l0aCBMaW5l
YXIgTW9kaWZpZXINCj4gPj4NCj4gPj4gU2tpcCBsaW5lYXIgbW9kaWZpZXIgYXN5bmMgZmxpcCBz
dWJ0ZXN0cyBvbiBpbnRlbCBwbGF0Zm9ybXMgd2l0aA0KPiA+PiBkaXNwbGF5IHZlcnNpb24gbGVz
cyB0aGFuIDEyLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBTYW50aG9zaCBSZWRkeSBHdWRk
YXRpDQo+ID4+IDxzYW50aG9zaC5yZWRkeS5ndWRkYXRpQGludGVsLmNvbT4NCj4gPj4gLS0tDQo+
ID4+ICAgdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMgfCA2ICsrKysrKw0KPiA+PiAgIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2tt
c19hc3luY19mbGlwcy5jIGIvdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMgaW5kZXgNCj4gPj4gZjgy
NGY2MGY5Li42NmRiYmQ1YWIgMTAwNjQ0DQo+ID4+IC0tLSBhL3Rlc3RzL2ttc19hc3luY19mbGlw
cy5jDQo+ID4+ICsrKyBiL3Rlc3RzL2ttc19hc3luY19mbGlwcy5jDQo+ID4+IEBAIC05ODgsNiAr
OTg4LDkgQEAgaWd0X21haW4NCj4gPj4gICAJCWlndF9kZXNjcmliZSgiV2FpdCBmb3IgcGFnZSBm
bGlwIGV2ZW50cyBpbiBiZXR3ZWVuIHN1Y2Nlc3NpdmUNCj4gPj4gYXN5bmNocm9ub3VzICINCj4g
Pj4gICAJCQkgICAgICJmbGlwcyB3aXRoIGxpbmVhciBtb2RpZmllcnMiKTsNCj4gPj4gICAJCWln
dF9zdWJ0ZXN0X3dpdGhfZHluYW1pYygiYXN5bmMtZmxpcC13aXRoLXBhZ2UtZmxpcC1ldmVudHMt
DQo+ID4+IGxpbmVhciIpIHsNCj4gPj4gKwkJCWlmIChpc19pbnRlbF9kZXZpY2UoZGF0YS5kcm1f
ZmQpICYmDQo+ID4+ICsNCj4gPj4gaW50ZWxfZGlzcGxheV92ZXIoaW50ZWxfZ2V0X2RybV9kZXZp
ZChkYXRhLmRybV9mZCkpIDwgMTIpDQo+ID4+ICsJCQkJaWd0X3NraXAoIkFzeW5jIEZsaXBzIHdp
dGggbGluZWFyIGlzIG5vdA0KPiA+PiBzdXBwb3J0ZWQiKTsNCj4gPj4gICAJCQl0ZXN0X2luaXRf
b3BzKCZkYXRhKTsNCj4gPj4gICAJCQlkYXRhLmxpbmVhcl9tb2RpZmllciA9IHRydWU7DQo+ID4+
ICAgCQkJcnVuX3Rlc3QoJmRhdGEsIHRlc3RfYXN5bmNfZmxpcCk7IEBAIC05OTYsNiArOTk5LDkN
Cj4gQEAgaWd0X21haW4NCj4gPj4gICAJCWlndF9kZXNjcmliZSgiV2FpdCBmb3IgcGFnZSBmbGlw
IGV2ZW50cyBpbiBiZXR3ZWVuIHN1Y2Nlc3NpdmUNCj4gPj4gYXN5bmNocm9ub3VzICINCj4gPj4g
ICAJCQkgICAgICJmbGlwcyB1c2luZyBhdG9taWMgcGF0aCB3aXRoIGxpbmVhciBtb2RpZmllcnMi
KTsNCj4gPj4gICAJCWlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pYygiYXN5bmMtZmxpcC13aXRoLXBh
Z2UtZmxpcC1ldmVudHMtDQo+ID4+IGxpbmVhci1hdG9taWMiKSB7DQo+ID4+ICsJCQlpZiAoaXNf
aW50ZWxfZGV2aWNlKGRhdGEuZHJtX2ZkKSAmJg0KPiA+PiArDQo+ID4+IGludGVsX2Rpc3BsYXlf
dmVyKGludGVsX2dldF9kcm1fZGV2aWQoZGF0YS5kcm1fZmQpKSA8IDEyKQ0KPiA+PiArCQkJCWln
dF9za2lwKCJBc3luYyBGbGlwcyB3aXRoIGxpbmVhciBpcyBub3QNCj4gPj4gc3VwcG9ydGVkIik7
DQo+ID4NCj4gPiBDYW4ndCB3ZSB1c2UgSU5fRk9STUFUU19BU1lOQyBmb3IgdGhpcy4gSGF2aW5n
IHRoaXMgcGxhdGZvcm0gY2hlY2sNCj4gZGVmZWF0cyB0aGUgcHVycG9zZSBvZiB0aGUgdWFwaS4N
Cj4gDQo+IFRoZSBpbnRlbnQgb2YgdGhpcyBwYXJ0aWN1bGFyIHN1YnRlc3QgaXMgdG8gdGVzdCBv
bmx5IHRoZSBsaW5lYXIgbW9kaWZpZXIgYW5kIHVzaW5nDQo+IElOX0ZPUk1BVF9BU1lOQyAsIHdl
IGhhdmUgc2VwYXJhdGUgc3VidGVzdHMgdG8gdGVzdCB0aGUgYmVoYXZpb3VyIG9mIHRpbGVkDQo+
IG1vZGlmaWVycyB3aGljaCB3ZXJlIHNwbGl0IGluIHRoZSBiZWxvdyBwYXRjaC4NCj4gDQo+IGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC82NDk4NzIvP3Nlcmllcz0xNDgx
ODImcmV2PTENCg0KSSB1bmRlcnN0YW5kIHRoYXQgYnV0IHdlIHNob3VsZCBjaGVjayB0aHJvdWdo
IElOX0ZPUk1BVF9BU1lOQyBpZiBsaW5lYXIgbW9kaWZpZXIgaXMgc3VwcG9ydGVkIGFuZCBmb3Jn
byB0aGUgcGxhdGZvcm0gY2hlY2suDQoNClJlZ2FyZHMNCg0KQ2hhaXRhbnlhDQoNCj4gPg0KPiA+
IFJlZ2FyZHMNCj4gPg0KPiA+IENoYWl0YW55YQ0KPiA+DQo+ID4+ICAgCQkJdGVzdF9pbml0X29w
cygmZGF0YSk7DQo+ID4+ICAgCQkJZGF0YS5saW5lYXJfbW9kaWZpZXIgPSB0cnVlOw0KPiA+PiAg
IAkJCXJ1bl90ZXN0KCZkYXRhLCB0ZXN0X2FzeW5jX2ZsaXApOw0KPiA+PiAtLQ0KPiA+PiAyLjM0
LjENCj4gPg0KDQo=
