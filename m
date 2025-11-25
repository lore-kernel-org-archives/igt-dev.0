Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C99D0EE0C
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 16:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB7610E544;
	Tue, 25 Nov 2025 16:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzTAr60w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237B610E547
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764089458; x=1795625458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rMfECa8XjqQuNNEbwwdvu2gMRM3yo2pUWsXh6B1l50s=;
 b=CzTAr60w9haMck2Ml1rOsdSPzhpFPqOcT4I1T0h+badf5hoMwOKdnZ3/
 5u1m6yOZ9mdAHAiXRW/FPfjSj8DdElnO0USZeoCgvsPu0xPiJ44DAMK/w
 blOurDSr5GJ9kCj35xcU/GrBUuUQVLwGxAOo/PDnF37Ng52ScVjz4wGXU
 BAKgWjXxXZWAfdsTDUMf35YSW2zV1cu9Cu3u4cW5w6izhYhOfRZouZnC7
 hMNnr1zeOePvu+68a/pasHckrvUdeeQCc6UGGtjZKXGYbDORR6n0gsOh5
 CK+sqTyqMLUy07yXUAaamefpdDR2fpD25UEJWadI77y74ZUuxs8kx8vLr Q==;
X-CSE-ConnectionGUID: GZkezPHfRc296Tt5asjsJg==
X-CSE-MsgGUID: YZJyxRxKTre2lVPhnt2u/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66002527"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="66002527"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 08:50:58 -0800
X-CSE-ConnectionGUID: 3gWQULqLQeSvcPWq6yz3eg==
X-CSE-MsgGUID: ei1YFNw9Sp2rMxMuF1SOIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="223657916"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 08:50:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 08:50:57 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 08:50:57 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 08:50:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATwu5CGiyyuPim4Dy2GmsVmiCUFpQw/+agDF9B5Sa7zQG66IoOm+jguE29u2mt7/AbRGcUxOpgr/kckSsj9zi8g/Arf2s13XmjNpVgOkLDxiPMvQI6BzqXRb2DhQ/FL4lbRmZBEcuIi0Eelp0sPqnChqOGucmqYjwCv06ps7lztlVQN/hroQRvhM1e8bARr4XCpDvarDgpi9Mi4wX+OFkcCrRVMoOPKPHoN1zHDJfH8NHeLu3mRyUm+LjwIIsJ8APUTouSecrEyXRH+ahuJQCEJ8dFkpnX7ncD09v1Tcpp8xbPfo0vT+JlbE8Xqa0beA6CeX9DiJNisnbWGowpLprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eKyDno1xiWPeO6Awy6r74DwiLQ1YfrFi6FfhL1ZkuM=;
 b=XW0VgauNKjk/eEp6Zu5Qu8ZYcIrcmk4rJoOO4/RcmAI4+QsCEfeHyg1TEO4ehtBecsPRGOJqSJBH1KEUs3rRRrd7wZNHQd7sdn4J/HgYkOc0ZiySAcu39kjuVVL8XpGmWBPrbf/MQpG4WxQ7qAsjUqcTX2fdGegy3tk3+F5+dpDRBQx5AF4WF7Y+YwkirL6i9ea1RbIW4T4ZGEv/60Wv/0xQLhw3Zz9Q5yBJ0Q5aPxyj/7dQrXrVMlJaAqVp6m6/mkUkNAebGvtay2JsCLje7bUlNKst9ZaYLPhVAoRJP4Hgw45E7NFy2e8D4xFtwtWI0nIDEExjFQEnBI3edqXTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 16:50:54 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 16:50:54 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Peter
 Senna Tschudin" <peter.senna@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 4/5] tests/intel/debugfs: Add tile-dir subtest for per-tile
 debugfs validation
Date: Tue, 25 Nov 2025 17:50:27 +0100
Message-ID: <20251125165028.36533-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125165028.36533-1-piotr.piorkowski@intel.com>
References: <20251125165028.36533-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 201fe706-3e96-4399-5966-08de2c42cc7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjgxUFpqdXVsb2dpMGFla2loM2ZBaXJnTUxQd2NkcjNZcHNtRDd4bHFkMy92?=
 =?utf-8?B?NVYxRjY4dko5T0hQUjlwcWlicE5pc3N3TnBSVkRleTVpQm5tZytCb2hGMnow?=
 =?utf-8?B?bTVoenRkQVpVSklGcVVXZ0lteVQzbGlWT3F1QXI3ZFU4RGZ6NDRsL1V6NklT?=
 =?utf-8?B?VlJzZXFGMDB0TXpwUFhRSXFuU3psaVl5dXUzaGVYTHJDd2E1RjdDQnFLNjhM?=
 =?utf-8?B?OEo3VHl5RFpaditHNVFBSlhKZnkzUlJJWlBZaFlGY0U4eFFIVEZOcHZKdW40?=
 =?utf-8?B?QSs2eW5Ed3k0ajFjdWV3bU1KaEp2eTh4MU5pQzRFejc1cXgxSWRabWxRZlZq?=
 =?utf-8?B?RUJuWFRJYVFHVHZGaU5kRjBQY3JtNjdmUWY0dlhKOVRObDF4RVF0TEUxUTFF?=
 =?utf-8?B?SDVmSVIxNE5aZEZJZFhvL0NvOFRodGtvMWRmakVGcmxQNkVybmFDZnZDY0lJ?=
 =?utf-8?B?NXJLRXUvRklHUFJ3ZVZuRW9mTklieDhiN3hxNzVqTG1qQURIVEJhTzN5cUVI?=
 =?utf-8?B?ZkVneE5wTGV6YTFqZElkVWc3bDMramx3VFhSTXFWWjRYdUowVm9KUEcxTWpS?=
 =?utf-8?B?ZnJZOWgzNVZuRUJlTlZPc25Cd1FwYmVZek1yV3lNL1ZDdUErOUx1VGk0STZI?=
 =?utf-8?B?am5hTkVGSGxXcXpnK3lHKzBCNzhxdGJHaldzeEpvejAvbm1pZGRpeUI4U1Fv?=
 =?utf-8?B?Mi95VHQ3TE9EWnlvZXV2MlZHQnVyUXNRR0dOTHM1RU1xVnptOXdxcGVadDVv?=
 =?utf-8?B?b2pOYzVINEFPRDgyT21iK2dQZGtiTjZZRFZyQlFkVkdPT0p2WHFqTWV2Szdi?=
 =?utf-8?B?UlNFK3BySmVXN0hpQm96MGFwL2hYcjkvTUZCNm8yYTlPUGxuOWxjZWRkV0Y5?=
 =?utf-8?B?eVBNUVo1NkZFdnI0Q2pCYTZNbm93RittbHlTZFl2OXhJcno3bmJ1S1llRU9H?=
 =?utf-8?B?SzRHNk81ajdWMExyOFQycndVaCszbmpsNnhpd01aY2pkRFU3S1BLbUdaNTdy?=
 =?utf-8?B?YmFBaGNxN05rQU9maG12Vm9jSnl3NUMrQktBY1BkWWViR1lJd2FmSFdqaUUy?=
 =?utf-8?B?SGJobnNBUS9ic2UyUjA0MGpiSlBibGZqRS9ZRGxHdURoYldjbkE0TDZ4dEFG?=
 =?utf-8?B?dFRZZUQrdUZFLzBIVG9EaEJLNVZ3RTJRdDYxaVJndzZQV1ZlV1ZIbi9rK1hp?=
 =?utf-8?B?WE93R3FFQ1pVVEhwR0N4cXNlVTIrK1o2dy9PQ3dIcTJiUWJYOWlqOC9VL3Ev?=
 =?utf-8?B?TFlKVWo2amFadGx6QnFodXVnMlNST0YxM1BpWERBSE9EbFRtTXJqNEs1aVl4?=
 =?utf-8?B?a0RYQlllUVBUZk5Fdmo4N2crb2c4UGsxdENvMFlqR0JNWERGdGdtbEV2K2di?=
 =?utf-8?B?L0JEYUUwd3NKWlFYeW1oU3ZrbUsydzlnaCsvdE5LUUZFMmlVSzBLNDVSMFhz?=
 =?utf-8?B?TTV5Z1hWRlZlUGJLbm13ZS9XR2NmMk5tWUdqL3YzaHJ5U1p0SG82d1VTNFlE?=
 =?utf-8?B?Z3lUelNKcXNRKzAwTUV2MStxWk1Hb2oxaWg1V0FsNzlIUjg0Ymx3RG52S1g1?=
 =?utf-8?B?dGZZZjNlL0tYYmhKQ0hIS2EwWXZOaGRKTWR4K0hCdXZHSnA2ZkdLb0EzM3Vr?=
 =?utf-8?B?N1cyMWQxZ2d5WHdGS01NaWRQdW9NMVdIRXpEaXc5bVVLc0ZjZk1kVzVSNWpz?=
 =?utf-8?B?L1BvN2hnRVpEdWRjZk9HLzdHUTI4OW15YjNDVzFCd2t5ZzBKVS95VENILzlX?=
 =?utf-8?B?bVNMdmI3Y0J3NXl1SUhhUVRJTVdIVENlNVBQZERnbWVBT1daMWJ0emlERXgv?=
 =?utf-8?B?UE1Icnk5OGdhWWQxOWZSRTJGcDU4ODUvTU91bWx5R1M1QzVnSVBMWkRNVzFR?=
 =?utf-8?B?Y2hPemsybk45QWwydkU3Ukt4SStrVDhiZC9CSFFtSEJmbUoxYVFjWGkzRXAx?=
 =?utf-8?Q?J/g/3gk58d2AhPfW/rSDHw6tHBHvgwWy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YThBbmRiWFJpNkVReWdIRFhsSDZVRFpwUFZlSUtkTzAvaE9JdGwvWjN5VkhN?=
 =?utf-8?B?KzU2Y0Y0emdLaFFCZEdiWVJjS2NNSHlaWURCZjVNYkhwSGFuNXdIcnovcTM1?=
 =?utf-8?B?M1NlQkVJSDBIRW40RE1ZTkdGcWlGN3lTeWdHOTBqL3JROHI4cDV3SW1HOW9W?=
 =?utf-8?B?eW5pVVFXVy9KK0dlZTc2RG9xeEZlTXBYSHAvZVN1a2VRTGkrOVI0b1JpYnpV?=
 =?utf-8?B?eHJaSmxSNnBTMlpUd1pRcFE4MEl3MU1lanpKY2FicUEwS05SbjhnNUNOMW5o?=
 =?utf-8?B?L3drMnY5ZEttendxLzE1VkNlMmEvSVgvUTVLOW93VDNtWk4wZXk5Nk9sdmdU?=
 =?utf-8?B?cGc3eDlaa21Gamo4YXkrR0c1SkNWVEJnUlIrbTVlbi9XWUZHTnJ2bEVHUXFl?=
 =?utf-8?B?a3Q1VnNkZFNYRVRSVGxSUGN1MlgrU2JHV2N1clhYWWpMWE9uUXFjZE1NL1Zo?=
 =?utf-8?B?Q2s4MGI1bGFDSWxjNk9hRU1aczVuR21wc0s1WmxhZmwwbkpPZEo1dzM3aFpQ?=
 =?utf-8?B?N05TdmVHTi9GK1N5OUt2cGJlUWUwSTdMUjl3SmRzTmpheUxoOVZYRGlRdTJa?=
 =?utf-8?B?UXpXVndZWU41OVF6WStlMVlBWFNnZFQ2NkxWb0RiUndYU0Y3SzVRbkJNek1s?=
 =?utf-8?B?SUVIeVZvc1Qwa3QrMWVLcXh1MnRMYlNDbVRZQ2Zwb0FBb0hCR29RRUVINDRS?=
 =?utf-8?B?WkhKMHVkMTJmdXU5cHoyVzJkc1BxbSs1OXpsYktGRWl5dUU0a1hyekJRcHpv?=
 =?utf-8?B?VEJDOS9CRW8vRmR4TW1hekR6bS81enQ4SmxOVGYrOStDc2pPblZYWlYzS0d3?=
 =?utf-8?B?bmkwa2hCVG5JM1c0bGk4cE9PV0pMNjZNanRBQXRIcmh5ZUdsaitNSW5LT2lF?=
 =?utf-8?B?MDg1WFNMMEVXdzJhcXNRQ2pTUUNwbFluenlqN3VwZGpZaGtyVGdUTTFxMnRo?=
 =?utf-8?B?VXIwRlh5TXNqcEorZ1M2NEhsYjFnei9ZZE5JZm50enNIcXcrOUg4YWRNd3Ro?=
 =?utf-8?B?ZnFwWlpsd094T3hBdlZiSTc2aWs0T1VzbDJtN3V1TmdXN0F3YjA5MEtWWlFX?=
 =?utf-8?B?Z25Kem1FYllpekpsTlByaEw3cUZpdGJsVmpKcGRHK1QrUHltc29hSENNZUdj?=
 =?utf-8?B?bU92aWN1WlR2dSt5VDZMNkc4d3Z6SkpBeXJjYUF0YVB3Z2Z1Sit6TzNScXZs?=
 =?utf-8?B?VDV1SEY4NXNXSmtTZG5URkNYYSthZXE1WmNFMFBNOW0wNlV5d1N4c2IwYUZW?=
 =?utf-8?B?cHVWS0hrdnFNV3FENy9FUkcwc1g1NVgvd3VZeGFjWW1sb1hmMHQ2QkQrbVY5?=
 =?utf-8?B?RlpuVDlyb05xWnBvWXpGUlcxYTVkN3ZBcGdZT3dKc2lqVGtYZy9kR3ZXWCt0?=
 =?utf-8?B?NmVuNnRNMTRNYVZlenk4bm5LWmJSWXdUTDhxdnRmbWppOWtVei8wQWVlcjBP?=
 =?utf-8?B?ZDVxOEUzUU9tMlhiNG52c05hWmt0cURPakNUUnhRdy9MeXl5YzhWb3F4amNE?=
 =?utf-8?B?VHFoWmRwUkR6NHVjc1V0WDQ1SU1pczFlQ3ZRWmE5MDF5Z2I3UTdtUjltb0Ro?=
 =?utf-8?B?MkVWeFpZeW5jNmFPcGZObG9Fc2o3ekNnMDl2S0hsWDZQRXMwblA1SWFjL095?=
 =?utf-8?B?RkRBbEc4U25QY0Rva2JDOVVicWZCV2ZCOGdNOWxsUk8zMjNHQlFaM2Z4ckN0?=
 =?utf-8?B?ZDA2RnZjV3FGY2FobnB0OWdseVBORE5Ec2k4V2J0dDd5S2l6V0N2T1Y2bDFP?=
 =?utf-8?B?YlZnU3VnbFZYRHlyazR5dmxha0lmKzdqVDgvdnFQakVPTEpoeGlYOTBucENP?=
 =?utf-8?B?UXJtdUZzZHhSYlNlclo1bE5EYitKUjlwMGdScitLK3F0YVprdkdHL1dVNTlh?=
 =?utf-8?B?NGpQK1FvOXpiU040dWMrYVZWWVFkd0g0VEo2SzAybVBiSGxSZFZFZXJGZGNr?=
 =?utf-8?B?bEtrZWhDa0lGUmllT1BoaitqcWxmUkhzQ3VibzZzcS96V3hyQ21FTy9BRnFm?=
 =?utf-8?B?K25QaHgxSGRhYUQrRjFHUVM1clFWSmVoKzdXWWY1ZHc1R251TzNZMFdzcGUz?=
 =?utf-8?B?d1c5cDJpYjAya2kzQ0NqcC9UZ29OQU10RVJoYXhoYTAwc25GNXVuV0xyaHll?=
 =?utf-8?B?cVF4b0ExbkZiTmR3ZlkzL29vM1dQNWRtcnFqQndFK2xkaEY5bDZQVE03MGVN?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 201fe706-3e96-4399-5966-08de2c42cc7c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 16:50:54.4554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvmecCNJEpuqYC+ODHf/dTkifJbGO+vWAnonAMAndor8Jp2mL5GeQE1w6NgXA4d4M28aoGz8I2h0D9E32X8O6T033r4iLq2NDnjBhjfTjQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8856
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's add a dedicated subtest for tile-level debugfs validation.

v2:
- simplify skipping when debugfs is missing (Marcin)
- use %u instead of %d in tile format (Marxin)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_debugfs.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index cf464c5cb2..705b80ab80 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -266,6 +266,30 @@ skip:
 	igt_skip("Failed to open debugfs directory\n");
 }
 
+/**
+ * SUBTEST: tile-dir
+ * Description: Check required debugfs devnodes exist in the tile debugfs directory
+ */
+static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
+{
+	const struct check_entry expected_files[] = {
+		{ "ggtt", O_RDONLY },
+		{ "sa_info", O_RDONLY },
+	};
+	int debugfs_fd = igt_debugfs_tile_dir(xe_dev->fd, tile);
+	int missing_count;
+
+	igt_skip_on_f(debugfs_fd < 0, "Failed to open debugfs directory\n");
+
+	missing_count = debugfs_validate_entries(xe_dev, debugfs_fd, expected_files,
+						 ARRAY_SIZE(expected_files));
+
+	close(debugfs_fd);
+
+	igt_fail_on_f(missing_count > 0, "Found %d missing debugfs files (see warnings above)\n",
+		      missing_count);
+}
+
 /**
  * SUBTEST: info-read
  * Description: Check info debugfs devnode contents
@@ -365,6 +389,7 @@ static int opt_handler(int option, int option_index, void *input)
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct xe_device *xe_dev;
+	unsigned int t;
 	int fd = -1;
 
 	igt_fixture {
@@ -378,6 +403,12 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_subtest("root-dir")
 		test_root_dir(xe_dev);
 
+	igt_describe("Check required debugfs devnodes exist in the tile debugfs directory.");
+	igt_subtest_with_dynamic("tile-dir")
+			xe_for_each_tile(fd, t)
+				igt_dynamic_f("tile-%u", t)
+					test_tile_dir(xe_dev, t);
+
 	igt_describe("Check info debugfs devnode contents.");
 	igt_subtest("info-read")
 		test_info_read(xe_dev);
-- 
2.34.1

