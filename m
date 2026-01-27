Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5F0D2D8D8
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6617110E027;
	Tue, 27 Jan 2026 09:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hs9XRVsE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D72B10E027
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507550; x=1801043550;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9uLinlLriDs7vpTY6uMmEXrwR2KcPitGP/7L2Syj7as=;
 b=Hs9XRVsEmNo7mThel/xymhOr8G6Kp/oL+BKxdpg0lQgLNgySCmZpPWZi
 8ZvFWktSGcOoR+roSDG+x13f6Fyk2q+9icKNbIlGslV76x9Xhli2r8Vjt
 g81AQ2IdJ26cBq4JOJxfJpJGTnU7V2E4HfVijur7KxTW9Tvwf1p0JjWd5
 dsxGNF6l7+r2s6uOS2ZWwO0qNgkbPOFh4xFL4jsoxBUz8haSw1sHH9eOj
 YtfHOeuxpQEpSc1IAu9U8YygxRL/UxIM3Uto4zsoRzdUuPY156RYG51Uh
 vu4COA+XvexVB+BYc8ijOwM7j1C9A7dWf19Vbl7lBsFJgIRORsJvua0OQ g==;
X-CSE-ConnectionGUID: KG9ITdYsRFyXkmRRELUahA==
X-CSE-MsgGUID: ona+Oc+aRjmhl01LiMmWMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82066783"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="82066783"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:52:29 -0800
X-CSE-ConnectionGUID: 5rqJYjvbR3+nckrvqWmCyw==
X-CSE-MsgGUID: PaT8cHLrSBaCJqeq68PkTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207059643"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:52:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 01:52:28 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 01:52:28 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 01:52:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJ3Ramu/RC1+vs5eEQz4rNQcj62dfcLZmEw1tT8EASLp50Kktu3tjDqHn/zQkhpru5ByW2PPlDchvnTT14FA2LeJWZF+KHrRv4GWDLaqIk1GChGpqo3QPdpdff0Ql3Be60+vAp9puLat2+Y20KPB2a9X3LqUyZrd6PKmmhG3eXUqb0NOigvyTu96cM92LPVcXxSivO4oNGmtyAbILf4R6AIEnt9d4zm1pqsoHb2vaWRBhm9osifeONVvN2Poc6J486GfEvpqBv1L4JZuaAV70LMHScdW30lMsLjyyOvOpEbmeVMEFpovglSkw8IHjtwQ2H4zGrdoN83iIXcj5K0Gug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXm/g1iVMuM1OlfbPrcNQE1QwJ9mmfLrUxSfc6/R+CQ=;
 b=SoY+G/LtSU4vNZ25EJGrionof/3vo5FOf+XdpDDoJ4tD/hE112auVNUDmC358lV5NoWwofkNAggazIvWspdjpjs03CMmE5olmMdt+jjvuSTV6HZ9/F6IPJTaPY7g0ofo/IfmiahOvKRXb5ZMwl16q9r81RiQojJjWCC76uSkR6Q9++A+DgrBJxYzBz2PHViULAOd6vPohFRuzurkMNNuwYEu1rDFv1Y7Bk6XY7jiS8Am7pDEuBy+mtjkv9HFaZD/4Drm0uv7isbepcimgtUVqUUAcP5Bbkkt5aNFMN2I/CkxEoVgipwKZ62VjKQHb1g64znuWsD+YIhBfXgku9CdhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 by DS0PR11MB7849.namprd11.prod.outlook.com (2603:10b6:8:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 09:52:20 +0000
Received: from BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::f19c:833c:9f41:f3de]) by BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::f19c:833c:9f41:f3de%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 09:52:20 +0000
Message-ID: <752462c2-5b8d-48da-a767-6d5b2530f8bc@intel.com>
Date: Tue, 27 Jan 2026 15:22:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 05/10] tools/intel_hdcp: Add helper to get HDCP
 content type
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
 <20260119123142.504623-6-santhosh.reddy.guddati@intel.com>
 <DM3PPF208195D8DA77B845E8121A253516AE389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <DM3PPF208195D8DA77B845E8121A253516AE389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::19) To BL1PR11MB5302.namprd11.prod.outlook.com
 (2603:10b6:208:312::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5302:EE_|DS0PR11MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 193960f1-5a27-4fb9-be12-08de5d89c2e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkZNZ2QrZXo0eldVS3VsdU1NZ0ZkUlZZOVFWTFZ6MGVKRlZldlpERmtob1JT?=
 =?utf-8?B?Y1BkRHdNNFA0V0s5K1UxOTI4VCtoOWxYTW03cW8xSC8rVW1sR2lhajJBOGlz?=
 =?utf-8?B?VGkwSEJXQTdOSkVJMEM0eTRFQ2d1c0VZL1hrNHlwVjJyLzNtbzlCYmZ2dzVj?=
 =?utf-8?B?ZEtzb0RCeE5CWWhJbTkrRW5MZklTQ0FXNDgwSDZMR1ltR1hPNExnUjJic1Mw?=
 =?utf-8?B?ZEpnczZBRVBORjB0SUphTXNkcjV6U1dWMGxTZlpTQXZ3R2F5NkovangwRzlw?=
 =?utf-8?B?UVVTcUZ6Yk9jZytpRlZxejBpMG91cDZ5eCsxbko2cUVuQ0Y4K2lSam0rdU8r?=
 =?utf-8?B?NW8rbHFVeWw0NU11TzF3cmg4Q1p4dk1XbDBkU1pJT3B2MVF4eW9IUHBkOGV5?=
 =?utf-8?B?VjljQXYvK2sycnV0OVUrdDN6ZEpDbFB0Q1Qxcy9pU21IYndYeDVkZlRnbmhR?=
 =?utf-8?B?YWQyb1NNTHIzTDhQeHNQWWZEeWhXM1BzV1VFYWROMDN5Z2tzcTNLQU1MQlAw?=
 =?utf-8?B?bitHNXJ5eFduN0ljR3huS0FnbUo4MmhYSWhpeHFOVGh6ZVlQR3pvV0tYc3BD?=
 =?utf-8?B?T0hCc2lhT2lNTEFtSXBWSFB0bnNIVGx1WFJVV3BaWXVtWjQ1WFlFK0tsaWl0?=
 =?utf-8?B?RmNBN0xaNGxXSW1yaHovMGZFRHlMNFdaZjdwZUhCb0c3ZVdaNmNsb2FMZEIr?=
 =?utf-8?B?cHY1RGRxaE9teFdFdmM1M1lFM1hlYUVYclJGTE9QYWRzWmdLbDNaaVBScWU0?=
 =?utf-8?B?VnMwYWlpdnFnczV1YS9IQkpKL05FQ0pROFgzbURkcXlqb1FyWXppWXlqcTBv?=
 =?utf-8?B?WTQ3TCt2dVhvZEpjbUVlOWtZZFhiL21Ea0p3ekdJTloxdy9VSUZnMkhNY0x1?=
 =?utf-8?B?U1JKSndnSVhGTUZsQmdzZVBVRUZyZVI1Q096dFljZDVxRE5KSWVjelRHZjdF?=
 =?utf-8?B?RkcxNDRqbmNLbXBONmc5YlNMcytWQVpCUXN6ZUxPZUl4TGlERHVjUk9HTWZB?=
 =?utf-8?B?dUJnbTFaMXd5L0s5anFIQ2ZTRnpuUXAyQU9oc3BMUitQZlVVRCt1WldpejFV?=
 =?utf-8?B?bDMvZWxYRUlvY2htQjRNWHgzWmx0NWJyWW9JK3U2bzJmRGFYbTdhd3k5UzFy?=
 =?utf-8?B?UmZKMldFU1FyOFBveHVZTmtwQjV4WVBCOHRzZnJOSHpJMzgrUUhYUGtzU3FW?=
 =?utf-8?B?d1U5ejNGQWlQeENJYVBPYXdHT3pWNG9NOHRNK3RTblhwV2pFYm9oamFGdVEz?=
 =?utf-8?B?ZHNkaVRNd0UrV3kzOXlYRkVrVUFDazVnTmRhYTFCZWRORFA4QlYrYklpN1dJ?=
 =?utf-8?B?RDB5WUZRR2FDVW9UTjRXQ1dGcG91Y1hnWTNzV0NRNHVzeGhwQXg5MjVXbkZH?=
 =?utf-8?B?ZWNoS00xRVVCcmxBWUhDMld6UUplRytNZ0NONUZFU04zVnR5dFJ4YS9LRWpC?=
 =?utf-8?B?T25VOFNQQ084SERlRXVRNUNiNVB2SlRQa3k5a1JESGczd3hCYlVVUi9rUTlF?=
 =?utf-8?B?b3Y5bWlURUtlYmQ5dVVxWkxKcWU5YThuVkQvbGlsRjltQkoyWjQyS2x0N2JM?=
 =?utf-8?B?QnR2S0k1bG9PN3BtQlhZQlhPc0cvbFJNd25tMjFURGp6cFRjaForLzdVOGFy?=
 =?utf-8?B?cG1EMmk2cDc1d2JocEVzbE4zZDZVczlSWTBJdlFGWTU0REUrWm83MmdUVllV?=
 =?utf-8?B?MmZGQ1h2aHdOVVZSRmdPRWpOdjhJOGEyOWh5VzViYSthL0FMcWl2N1Z5OE8v?=
 =?utf-8?B?TUxiQlRISFF6UTllTUk4NVVSSEpCemJqeXlabDJzaTNiU2RTaWFrUzNNSjln?=
 =?utf-8?B?WkQxaVJqYWRFL1l1UGU1VWNEdGNlclJhUmtzblJUOWtCdXJRZWs4eS84ekNX?=
 =?utf-8?B?RTZJRVhueThHSHdPRUR1Ty9RbU9VQkJTVk1NdlVISmp3S0FHQkxsYnNPT0Z2?=
 =?utf-8?B?UjdSUG9kMlBJdXlpMnNtTmZQZE9uVTBTWlBaR2QwRWtDY3M2NU1QRDZ3QVBy?=
 =?utf-8?B?elU3Y3RVNnBTVkdNTGtJZzBsVy91Qk1TMDFYOXg2cC8wbW8zR2NxaFVuYnJj?=
 =?utf-8?B?bkxDRktJcHk4em9NVU9ZQ1ZOWCtlNlUvaUhGdk1oMFR5S1pSbUdrV1AxN0VD?=
 =?utf-8?Q?fsB4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5302.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUJ2bE5SSlYvaTVzbEcwSVVONXpnaU1GZ2JzUlZxTEUyYktPM2ROOXhiRCtW?=
 =?utf-8?B?UTEyMnR3UFBvY3IzLzVDeDY2OHZYT3ZoaEdYRjY4cUx5aXlybnA3alI2VjZB?=
 =?utf-8?B?eVBuY090blVOMXhqRngyRk1PV3FvTDZMcE1tQUViZVYxRFNNWkttKy96NHR4?=
 =?utf-8?B?UzFOdHcvQkZZTmlIMUFiYnl3UWloTTJ4Y1NFVE05OXBsaTB1Y01ReEZTSVFa?=
 =?utf-8?B?T2E3NU5kazFIZ3d1dnFRb3ZLNjdiSE5MMktyZGJZcjMxQTFLR2laZ3hTcEdR?=
 =?utf-8?B?dXRacFdGOUx3R29ZNlRCU0VaY0pWeTJheFVyY0M0Uy9LUTIxSnU2em5seXFE?=
 =?utf-8?B?VzRocTF5N1Z4c21lVHBFZ3RFU2pVc3JhNzM0WEFkaVkxRkNKc0pHazE3Y080?=
 =?utf-8?B?aTJHMklwK0FhN3VubXdVdGJjbWlFTm5GdlE5azVNNW1tYm5xSEdmY3QyYlJ3?=
 =?utf-8?B?N215SlpzK2dVRUJleHlTU0xJR0RjMnJnSTkrU1hreEhrZVB6WHlwTHZ0VGZ4?=
 =?utf-8?B?Q05pK0Y1VVg4OXJQcHpHbEdtTjRVSlRrMVFlYWNvMTN3akpRdE9rNk9qdEZr?=
 =?utf-8?B?VVdMQVdYRlVqcXZuL2JjeVB1dmtVOTlKelNTNzNOdlZELzlYUlFJUDU4bnBa?=
 =?utf-8?B?NWxiSko3Uithc2crdGxSYitoOXdXcjIxSjRtNFRsU2FmQ284SzVNcVYxYzhl?=
 =?utf-8?B?WkkrMUtrem5SbE0wUlJoc2FLMFBTRHp6TEM0ODJNWTIxWFBIdTljblJjcjNQ?=
 =?utf-8?B?STUrNDM3K2hWWVVXWGoxMnNubHBTZXo3RGhBbDVTVE5aMWFSUS9LNm9RZ1NC?=
 =?utf-8?B?TWFQT0w5Vjl0SlJIdUN3d0RiUEN2UGZxU1dkekNnaTNWVVJJTGFYTExBWkhT?=
 =?utf-8?B?Z2gvUWV1cndiZU9tU3hTdUlhdHZQV1M2Zm5GVEpYZFRFR0pqTEUram9Hd2R0?=
 =?utf-8?B?NXVaUGQxSjdjc0RORG1SbTE3a1BGd25XL0xCTEM2OFR4bUgxbHhGWjlmZTRx?=
 =?utf-8?B?M2VTMkIraldoZ0hhaTBKTUJtd1ZJOEJmVlNEUFlidS83SHpKS3R4R3BYcGFO?=
 =?utf-8?B?WlpSSm1nVVVJMko4TW5ndW1Yc3VoNWtOQlVtc3lqc2NQVEhvWFY2Ymk3dmp3?=
 =?utf-8?B?MUttYmRUYlhMeUcxd1ZHTStyb1F2RFNjVVJuaDY5VWJRSGRtYlM2blJHMUxz?=
 =?utf-8?B?ekZtK3JROEYxRFIvcFlWZ1hZNE5lRG9yTnQvT0pJQnVKL1RvM0U2azdQYnJr?=
 =?utf-8?B?YmkzZS9sQ3cxcmxTMUpWcTNZbzVMaUlJTGkwMkNkRWg5ZEdUU2RNMUtlUncv?=
 =?utf-8?B?M0NYVG02UVJuNm1wSVkzeTI1MXdjQjBsa3pFaWFva2xJbFZRcmsyTGFtL25o?=
 =?utf-8?B?eFJFNW9CK2o5d1JHNHh6V09iZisyd3NkSE1GRjlRN0NIV3JFbnFWdzA1MDFY?=
 =?utf-8?B?WEgyQTY5UkIxK09Qd3J6aFNLTmxDNFR3SDM5Q2VaUTVtSVNzQzBYdnVSYXA5?=
 =?utf-8?B?V0w0WUxoQ3pXdFZHdVIydEFuQmtkSFp1aFFmOFVSRUhNYWVtVG9adDZuRkNJ?=
 =?utf-8?B?OGhrVkt6TjZoS3NJd2VGSkkyaXFiSXB1b3YySkNYZVZ4K3hDNTF5eHNyK1pt?=
 =?utf-8?B?eUpsMStxdXhDcWdiOFdUQldNbHhza1kvSXg4OWhCQTFPUEw1ZjNuaDAyZjdX?=
 =?utf-8?B?VUo5b1J0Zk9mbU43WVdoSGYxdWFubjA4NHo2OFgrWElFcjBOb1h4Y1EwVUt1?=
 =?utf-8?B?MGlKYlYzQjdVNWowUHRFaU5BbXVuWFdseTkxbGRtN0tnVGpsWXdsNFNzRmRs?=
 =?utf-8?B?TThwazdGS2FaQ3BCcEp3Z0Z4YmFDYWluZDRXalQyUGxYS2RENUlFQXBlWEYv?=
 =?utf-8?B?aFZIY21ENlVMM3FNUHN2V1NoejhXK0xqMVRKTmYxdWpHZWpxMHlWcW8wSTEx?=
 =?utf-8?B?UHduVlM5K1ZZOHhYQktYZWRpMzZtRTVBNGJqaFNzc2NubnpHNHV0dGptcDU2?=
 =?utf-8?B?ZU41NnNOZmhLMXExTHRnNk1GaVFLUzN2VjBLUUJSRDZkS3BGWjE4bDZFdDZU?=
 =?utf-8?B?MHVOb0lTcnB4MTZpZzBpL2MzQUExNjl1U2U4bmpNNkh2dXMyMC80U2tTOHE4?=
 =?utf-8?B?SmQ3MjE2d3haMFVwVUd1T20xd2dNcDFORFRHejArbGlZcm1rdkcwZVZnZEJq?=
 =?utf-8?B?VWhyZ25kYjNUNFlhYm5PMU9Ubk9GZ2p2RmFlbzlhZEI1YTVvYWRqQktrMXUv?=
 =?utf-8?B?WXRSaVlJWkp5cm1qeldEUnFYbFlQaDY5cENxTmo3TVhRWWJlNGh1ZGNEd2xu?=
 =?utf-8?B?YTVRYW9GMlBWckphSXZxSXU5dEY2YUlnelo2dklWeEtrZFhpVDAzRGEyY0Qx?=
 =?utf-8?Q?o6Ee94UltpQFUUQ4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 193960f1-5a27-4fb9-be12-08de5d89c2e6
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5302.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 09:52:20.1190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhNCd8JZ4ldPSbq7Utpqp5guTt3MOa7VRxZeuRPUu5B077Ovwas7G5c42vAU0QrzPWVtbwfJAmF/x8+SKuTaHbnW3JLB/2AdPCQHqQzYQJgxIOOfq/uW7FClehzBhxss
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7849
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

Hi Suraj,

Thanks for the review. Please see my comments inline.

On 20-01-2026 09:02, Kandpal, Suraj wrote:
> 
> 
>> -----Original Message-----
>> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Sent: Monday, January 19, 2026 6:02 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; Thasleem, Mohammed
>> <mohammed.thasleem@intel.com>; Kandpal, Suraj
>> <suraj.kandpal@intel.com>; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>;
>> Konieczny, Kamil <kamil.konieczny@intel.com>; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>
>> Subject: [PATCH i-g-t v6 05/10] tools/intel_hdcp: Add helper to get HDCP
>> content type
>>
>> Add get_hdcp_content_type() to read current content type property This
>> displays Type 0 or Type 1 or N/A status for connector.
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tools/intel_hdcp.c | 38 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
>> fcb746b6e..dbedc60c8 100644
>> --- a/tools/intel_hdcp.c
>> +++ b/tools/intel_hdcp.c
>> @@ -79,6 +79,44 @@ static void set_hdcp_prop(data_t *data, int property,
>> int type, int connector_id
>>   	drmModeFreeConnector(drm_connector);
>>   }
>>
>> +static const char *get_hdcp_content_type(data_t *data, uint32_t
>> +connector_id) {
>> +	drmModeConnector *drm_connector =
>> drmModeGetConnectorCurrent(data->fd, connector_id);
>> +	igt_output_t *output;
>> +	uint64_t status, content_type;
>> +
>> +	if (!drm_connector)
>> +		return "N/A";
>> +
>> +	output = igt_output_from_connector(&data->display, drm_connector);
>> +	if (!output) {
>> +		drmModeFreeConnector(drm_connector);
>> +		return "Unknown";
>> +	}
>> +
>> +	/* Only show content type for connected connectors */
>> +	if (drm_connector->connection != DRM_MODE_CONNECTED ||
>> drm_connector->encoder_id == 0) {
>> +		drmModeFreeConnector(drm_connector);
>> +		return "N/A";
>> +	}
>> +
>> +	drmModeFreeConnector(drm_connector);
>> +
> 
> Disregard my previous comment from the next patch idt that would be the best direction
> One thing we can do is all the above code can go into its own function get_hdcp_output().
> 
> What do you think?

I have added a new function get_hdcp_output() and the helpers 
get_hdcp_output, get_hdcp_status and get_hdcp_content_type use this to 
avoid code duplication and keep it modular to use across other functions 
as well.
> 
> Regards,
> Suraj Kandpal
> 
>> +	status = igt_output_get_prop(output,
>> IGT_CONNECTOR_CONTENT_PROTECTION);
>> +	if (status != CP_ENABLED)
>> +		return "N/A";
>> +
>> +	content_type = igt_output_get_prop(output,
>> IGT_CONNECTOR_HDCP_CONTENT_TYPE);
>> +	switch (content_type) {
>> +	case 0:
>> +		return "Type 0";
>> +	case 1:
>> +		return "Type 1";
>> +	default:
>> +		return "Unknown";
>> +	}
>> +}
>> +
>>   static const char *get_hdcp_status(data_t *data, uint32_t connector_id)  {
>>   	drmModeConnector *drm_connector =
>> drmModeGetConnectorCurrent(data->fd, connector_id);
>> --
>> 2.34.1
> 

