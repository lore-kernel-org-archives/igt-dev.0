Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2B0CAC597
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 12:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C3110E470;
	Mon, 15 Sep 2025 12:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UedcHyqq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BD210E470
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 12:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757938139; x=1789474139;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=iPUqY11ZtWEzkUEw1ivGuWZT56lqY8bu9hZ8f7Sx38k=;
 b=UedcHyqqs1ULWOZ/5SnCMK9CcPNQYua2iHVY3M72jK39IVob9Tlax+0o
 hGPqxDCQjDP+mV3dtOqg9l6pTgNbkDEurShSsbjhWfXnGF8aZ6ms/evfu
 WkccaanVOShUrO5GaetjsUYC/3PYbbVH+0UbEEVPd/TW8qqPMRBtNQ7zX
 /F8QA/eGEh92ijq86z522zMBPmRxLJXGHsZNd6kpDN9FIJvICDn+syTbM
 yIwDRURXH9Nym07KfLMcwnIAd1E7exBeitXkuwSxSh4AVNaO6wqq43DpT
 Y4khm5JX5eMrGa4DO++JeLXGpa9jTbusuhG+XV3vKX+BMf3ZkXXJmuzbm g==;
X-CSE-ConnectionGUID: QuEwjM0QRK+AsfsireTeqg==
X-CSE-MsgGUID: mi5JZSV5SaSHdd7nrwDBKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="71558635"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="71558635"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:08:58 -0700
X-CSE-ConnectionGUID: HntwnWI+QEexlbScJHe4/g==
X-CSE-MsgGUID: i/6oPG7kQ7mDgqgwARpgKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="205400775"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:08:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 05:08:57 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 05:08:57 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 05:08:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBOKPtaD5LRzUgdkENDPSlxj2qIXLQPDT9pwYQ8LUv3MhHZSHgSW0HnO+0eU9lfvogLC6EJIvunS15NAeBc+x2RT7iEY3Y+VitTi/TDHUen647UNjV1lFprnUz416BRnyAiRxE4mkrFuWXqeL4xqR9udR4pJ2l/JF+7Cxgbnhp/FX5kt4EV5ieGrEBb35wBlA5GuFlYyMxX8wb2ADvme2P9y0H5ieo+u+UduMPkt0udFaMhO+Md/Y0tyfYSXjkHEbbm/lRSA5XbV3hXQMfQKDlvE8inGXBaooRpDTX8Ny2rIDz5Nq7gePE787v5w1C/x5kY1K48izx2+e/UAdTZbYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPUqY11ZtWEzkUEw1ivGuWZT56lqY8bu9hZ8f7Sx38k=;
 b=DylzpRWNdGJ6ArbjDJa1bYqq54Ah1+qPqECPviwEApIoGodN7lIA1JOSt+ona14xNPryTtQAizPpHAEU4bQS8BowjeFcTpSd/FW/RPkFCOZS7u2gjU+Bv2AdqNBqodvlPVuEXL0hJcxvtxCff1vocbpfkT97bNrYeIZNraUWDPWn7Lj5ir8RUUWdJ+43qP21/45lkCZNkJOXg8yGko623oDjKr0l3KSV2Nq5uXdFaZydXC4YKJPvsRDwW9gRMp/X7dzd7FEqpkcNnklN/sdGccV/p82Jz+sEZ0RbmBcse7XkAaSytMclk/stQRpro1eS0ZqYJlAqUj8UcDiK5UTugw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CY5PR11MB6306.namprd11.prod.outlook.com (2603:10b6:930:22::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.22; Mon, 15 Sep 2025 12:08:55 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 12:08:54 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Grzelak, 
 Michal" <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] lib/igt_psr: Skip the test when PSR is
 disabled
Thread-Topic: [PATCH i-g-t v2 1/1] lib/igt_psr: Skip the test when PSR is
 disabled
Thread-Index: AQHcGAhT7h2ejFA3kEevBIvZ/eXi9rSUQu8A
Date: Mon, 15 Sep 2025 12:08:53 +0000
Message-ID: <98f87611cc7586b5a6f5295e78c818f20df3205c.camel@intel.com>
References: <20250828104311.1279788-1-michal.grzelak@intel.com>
 <20250828104311.1279788-2-michal.grzelak@intel.com>
In-Reply-To: <20250828104311.1279788-2-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CY5PR11MB6306:EE_
x-ms-office365-filtering-correlation-id: 58c16e0b-5382-43b4-52a5-08ddf450a43d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?aS9KZTdYTmRWbHN4NU1IeXpOSG5UeTNyZ3dZSEZoeGd0MWg3bVRFYWdxYUFa?=
 =?utf-8?B?ZmhWVENxeXFJT0JKRitMZXZZcVJXclg4R0lvbnJUTzA1N2lFTnhWK1lHZUVZ?=
 =?utf-8?B?QlJ6OU5iUmFqZmZ1Rk9EVjB4TGlBd1dDTzF0U09Cb1VKeDJzSmxwenZkL3hD?=
 =?utf-8?B?QXpHOWpCMTFLZ29hUm5tMFVrc1F0YmhKaWVpazJyeVRkcEZyVEFjMHQ5T1NC?=
 =?utf-8?B?TFM5Y1pjaHFKNERmRjJwbU9TbnI4MitINkxsNXdkc1VoVFhiUnBMbHRyR3pw?=
 =?utf-8?B?THZJUXhOVUJOZ3JqbThOM1JjTWxjb0RYMVJkcE9IeHFrR3IvR3VpVDFxcExR?=
 =?utf-8?B?SHNEYWpRVGRNaU54OU1SQmFYd1hWaDNIQVNXem9WZWNYMTJTMXJJaWcva3dM?=
 =?utf-8?B?dm1za1drVW5UQndhNzIzbmkwVGo2V3R5UW4rZ0tCd25Gb1IrQ3RkV0pkSjFN?=
 =?utf-8?B?eEFTSXZTSW02TXh0ZjRYQkZOcTBUYzRqSzdQcHMrUFgwMjBHZ0tUQk03Qnpz?=
 =?utf-8?B?OGZDSVBnWHpVekNaczUrbWdTbk1NUVFPNlJBZ3dzTzJIb0xOYWFFeDFPTmsw?=
 =?utf-8?B?MnpVSWpuRDd1SmY1UEY5TmFVTEJ5R2RCQVZZOEMrVWRwcnF5eEdNaDYwUWVn?=
 =?utf-8?B?RkhXaDlZd0pPV1hwdzFEYUJ1bDhvWktjN3BmN2dYdWVqeUJ0M0kxV1NacCt6?=
 =?utf-8?B?eWplTnR6MWJ2MVFLWk1vM2J5ZWdaUkpiWVhPU2d3TEFYaXh3ajFsUlFrOHVu?=
 =?utf-8?B?SFM4eGpOVFVGTVh5c0lBQlFuS2lLRmhoT05yby9Bekp6bzNzRk1kblBaMFMy?=
 =?utf-8?B?YU1iS0JXWDBpMjdUZHR5cnIxc2FGL2JMNHRqYnZ0L2FEdFBJRmRKMi9oRnFY?=
 =?utf-8?B?aDUwUmc2b1pGcmpiZEFuRDFERXh1Zi96UkdyYUtnME5YUFptdHlyajRuMzVY?=
 =?utf-8?B?bkx3ZWoxb0FISStoTG9EODUvajlZYmlSeDhDeXZZQ3Zac3dKdUJwSWFXd2Ns?=
 =?utf-8?B?QmN2SjRvMi9WUUJKZzdnYktCNHFZYzBXd1JyNTJqNkg5Wm96QTNEeEQydnpJ?=
 =?utf-8?B?UGlwOGE0ekRBa3BVYW9FVENvRDZoRU1JdHFUbWY2aW93ZjJqeVhVV295enR6?=
 =?utf-8?B?cTdQaWlSNDRYeENyYnZOZ0tYOGhjS0J1aDBIN3lGcUIzTHl6bFlORFpPajlk?=
 =?utf-8?B?ZVlBS0IzVXFwUmZReVlYQXRsQmRrUlpKY1lkRXkwZzhqN242a2x3aUZ1NTR4?=
 =?utf-8?B?b3ZiT2o5bmp3eXEwaEM5SGRvZEI1OWs1ZzFrQkk3eWRMQzE1Vk95RlU5R1Zq?=
 =?utf-8?B?dDJtNzF1T1pxNGYrVWc4SDF2VFo4N1NKZjN4TWc4eWNsYTdCL25WVVFveHB1?=
 =?utf-8?B?RGtMcWtIbWw1U2REN1BMcWJrTklFRzdSWUJwTFJIYmszTTdkOG84NUtuRG5Q?=
 =?utf-8?B?c0pIMDhKU3llSDBYcmpjSmk1SHBZWTU1Rmt2Qi9sYlpSb1RLeTdiVEM5elBn?=
 =?utf-8?B?a2F2SG1nK0JKZ3NvV2d1UGpYbkY4VCs5cVMzNG0vQldaWVFmVSsxa0VwSlMy?=
 =?utf-8?B?S3F5cE5XcG1hK3hRamNaM3ZWTjFzL2hUZmNnVkZvelpIQktsUnEveXNCUVNw?=
 =?utf-8?B?Mm5BOGQwUklXY2ttVTFwc3dSNWd2R2hhWTBYc0ZsbjNYTVBzdkhoQnp2N3Jn?=
 =?utf-8?B?cEViQm9lL1lrdXNTZGpNOUZHNXM2ZWQ1cFducmkwOU1YbEtiSExHZytOS3RL?=
 =?utf-8?B?RHBqYUdBUlpnQTNOUlRqd1RjNzdCSGZiRTlUWXRRK01xSmdGOS9kMG1mWEZ3?=
 =?utf-8?B?TllsSndQS09Yc3k3UTRZSHk2RWtqNGxjbmZPWnFDTGpySUhZd1EyVlhtU2VO?=
 =?utf-8?B?N0o0NGtaa245OFFEeDQreHAwNFJVakVZOWVBUmMrTSszN3pjYTFMd0lKUWc3?=
 =?utf-8?B?K2N1UWcybE9wblF2akhvZ1VKMTdGRWNDL1B2eVFoZXNJNk1rTDhJR1Q0N3M1?=
 =?utf-8?Q?n9FORm7GqASgAuT3CHdFDxLQ5ePzqI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGduMy9SUEF0TDAzN0V1TEhmVnQxR3ZVRU1wRmJHM2t6Z3BPZFJKek9meEVi?=
 =?utf-8?B?dHpodE54UEZYV3E4MXQydVdwczAxUmZuazJMdnZXZjJpcFdaZGVoa0IrSitx?=
 =?utf-8?B?RHN3RlFHR3lXWm5SWXVmVmQ4U3Y2VDFEcWhPcy94ZkZWR0hIckhYRkFpam53?=
 =?utf-8?B?L3gwRWwzUXdNQitLQlU2a0ZCR05tY1paa3cyakp1Y1I3TUFQZkZLb1ZUT1gz?=
 =?utf-8?B?ZVRnbHptUjVwVmlXTm9kRzNLOW1RZVFJNUQxaXJjeWdMRzkxYms5UGVrM0Rn?=
 =?utf-8?B?Z2t1YzMwV21iKzNjU3FtQVBvSkIyWllwd1RaZ2lta09zaUQ5SE5XODM1THli?=
 =?utf-8?B?MHNZaW9QZUcrQXhJaW92NjZpTk4vNzl3cThsaVp2Zk4vczJVMU5aUUUzNzF6?=
 =?utf-8?B?a2RMWXdZK2xycEIyNWVUc1IzZUovaU1lS3diR0tYclVjc2orYVEyd0h4YlJ6?=
 =?utf-8?B?OE9pODUvdlJPU0pZRnZpNTJRWlcrSjNkM2I2b3YwaFp6YTl0SzVVM0F0U0cx?=
 =?utf-8?B?L0VJdkYvS1dVUnJzMGVXbFpNYlhkZi9nVVZ5ckxFUnN6bFZFWkQrdHNIWEtT?=
 =?utf-8?B?dmlmb2w0ejBXVStWWEJNSlRya1kvZERvdDVVMm9xR3VwSEJ4QkJlejZlVU1D?=
 =?utf-8?B?bGpOT3BOVFZrYnBQd3B3NkVIWmZ1dEc1RHBaUHFEQUY4M0VFSk5TejlPUVIy?=
 =?utf-8?B?T2QzbjlyaDRzTW9CVnlGc2lEeENxNDVrblViR0xQMGZNTHZzdmtsVm9HU2Fv?=
 =?utf-8?B?NE1MWnJpcStiRGw0ck1lWmk1a0xTazhKalB3MDFuMmYybmd2QlRFcDRCS003?=
 =?utf-8?B?anhuaXNyZlM2RTFaRU1YTXlWK1pDZVQwaWxPZGhxTkFReHNSM09jblc4ZlJN?=
 =?utf-8?B?bk1VU1loYUd0YzhRVEJXdDBUZXNDS1NNN3l0M2g1WWxkSHR5TFRJWWRSaHRO?=
 =?utf-8?B?VElqR1NzSlFPNCtZR2xNaE84ZDRWb1h4WHE0NzVnd2ZKd0tlc1hCWXNtQytU?=
 =?utf-8?B?azduOUpFTnhXMXhZQmN5OXZHK0R5Z1dpdWd5eW9DU1MrU0ZJSTMrT2kwMnBH?=
 =?utf-8?B?djNYRENvQ3BLb000NDRobjkxYjIrcEo4bjcxYVN3QndWMXdyelN6UWNGeUF1?=
 =?utf-8?B?clUxYWVVSWhOYm1TOWRQYXEwQkd1VmZ0dE5lekFmQ21WelU0eTBMejFaemdB?=
 =?utf-8?B?UlJHSDZveE1pdzRHdmN0ajhvWDljVlIvNlNncnBhUThpbFVQSGRKTi84eDNT?=
 =?utf-8?B?R0J4Mll0c295VkxlNW4rREhCOHF4WFczc0hjd0VuRGw2RzFTQldOT2ExaGor?=
 =?utf-8?B?T3dFOG5uSTVja0pxSFJHdzJuNEZJSUY2TTRiMUpqaG9BM2R3eWNTQVRzS0RB?=
 =?utf-8?B?cGtQdk8vN0ordk81RHo2ODUrWTVNb1Zib1Q0Sm5xb29aV0VFblBqTUZIeG9Z?=
 =?utf-8?B?WTRXckw4ZVJBbWgxWGR5L0JBSFFnMU0zUFZwc1F6OTE5cWl0bVpwNUhzVEd3?=
 =?utf-8?B?Uk85RzRNR1JEWkpIVFBrS3pVK1h2cVdOSDJXOWdIaDlhVVlNeDdjZW83Rjd3?=
 =?utf-8?B?UUxaRDVCQXNRdEMzVDdSVWVKUUhZYm1nQ0R1NDFxNlVMSThXckpWK3dSU08y?=
 =?utf-8?B?UE9mNEc1Tllya2dBQ3JFZHVVOVJTOGwrUDBuL3FPaVZIR2xpRXZRck1KaHZ4?=
 =?utf-8?B?ajdmOSttbGtvdGROSGx5QXZJdXlkWEVpMnphdTBSMTN5aklsNFhJQkQrcnlp?=
 =?utf-8?B?bkVwU05mSlUyWkpJZWFxNHZXTkNwcTZzT3paZUZsa3B4NmxIb3QyOGF1OEtI?=
 =?utf-8?B?ZERjNEZCeXRUN2wyWCt1MUZWbzVRK0FTK0ZRQnNFMmhQR3RGRWlweER2emdi?=
 =?utf-8?B?WlNxY2c4ak43QWc4WmJ4ZjFvZUt2MlpKWms0SjZxbFBxOXRhVVp3RHVYRDMx?=
 =?utf-8?B?SGdydFN5dEpEVTBJM0tDNW9TajJxT0VEL3NWUXQ0c3VTVGVWZU16Y2E1RUZ5?=
 =?utf-8?B?YzdicEJodUh5YzJZUHBRV0MwcGdnMW8xMTZ6bFY0QVkwS0ZycWlPTExIdnBa?=
 =?utf-8?B?MVBSZkMvandtdXU4NkJjZWJNZnE0dTlrK1JRS09hOUk4WkFxTUg1MHN4c1Q5?=
 =?utf-8?B?NHVlK2NCWjZaaml2akZCN3oxRGZhSjdwNUVDK3FzejNiT0JkWmk0ditTSkJG?=
 =?utf-8?B?dXB3NGUwckpuOGRldDI4NHlCK1crQ1h2QjJ0SHBsVldSVTYzZ2p3Z0gzbjlD?=
 =?utf-8?B?b2srTE5WcjJlUUZKTS9acGlPaWZRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DCC02B589F8FB438FB520E888B62E4D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c16e0b-5382-43b4-52a5-08ddf450a43d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2025 12:08:53.9617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B0Rtw2/W9eu5vDpHXU1MzjER4uhcrvX5CnX4zsc+LBfuhuQazlmyQTAMmRWoGxQ8KJiUeNiYeykAx1eQ3PUU6JmsNWN6G1iEv80AUbEJMM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6306
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

T24gVGh1LCAyMDI1LTA4LTI4IGF0IDEyOjQzICswMjAwLCBNaWNoYcWCIEdyemVsYWsgd3JvdGU6
DQo+IElmIFBTUiBzZXR1cCB0aW1pbmcgaXMgbm90IG1ldCwgdGhlbiBQU1Igd2lsbCBzdGF5IGRp
c2FibGVkIGFuZCB0ZXN0DQo+IHdpbGwgZmFpbCBhbnl3YXkuIFNraXAgdGhlIHRlc3QgdXBvbiBm
aW5kaW5nIHRoYXQgc2V0dXAgdGltaW5nIHdhcw0KPiBub3QNCj4gbWV0Lg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTWljaGHFgiBHcnplbGFrIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQoNClJl
dmlld2VkLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCg0K
PiAtLS0NCj4gwqBsaWIvaWd0X3Bzci5jIHwgMiArKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIvaWd0X3Bzci5jIGIvbGliL2lndF9w
c3IuYw0KPiBpbmRleCAzZDhmMTk0OWIuLmQ1YjQxOThjMyAxMDA2NDQNCj4gLS0tIGEvbGliL2ln
dF9wc3IuYw0KPiArKysgYi9saWIvaWd0X3Bzci5jDQo+IEBAIC0xMjIsNiArMTIyLDggQEAgc3Rh
dGljIGJvb2wgcHNyX2FjdGl2ZV9jaGVjayhpbnQgZGVidWdmc19mZCwgZW51bQ0KPiBwc3JfbW9k
ZSBtb2RlLCBpZ3Rfb3V0cHV0X3QgKm8NCj4gwqANCj4gwqAJaWd0X3NraXBfb24oc3Ryc3RyKGJ1
ZiwgIlBTUiBzaW5rIG5vdCByZWxpYWJsZTogeWVzIikpOw0KPiDCoA0KPiArCWlndF9za2lwX29u
KHN0cnN0cihidWYsICJQU1Igc2V0dXAgdGltaW5nIG5vdCBtZXQiKSk7DQo+ICsNCj4gwqAJYWN0
aXZlID0gc3Ryc3RyKGJ1Ziwgc3RhdGUpIHx8DQo+IMKgCQkgKGMgJiYgKGMtPmNvbm5lY3Rvcl90
eXBlID09DQo+IERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydCkgJiYNCj4gwqAJCcKgIHN0
cnN0cihidWYsICJTVV9TVEFOREJZIikpOw0KDQo=
