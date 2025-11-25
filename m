Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CBCD0EE0A
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 16:51:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AAB10E547;
	Tue, 25 Nov 2025 16:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeBxZHJw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA52B10E546
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764089458; x=1795625458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eh8aEt5P+W/tJ+wf1cyCpW2W5oRMTCSdH4UYZcdsGuw=;
 b=MeBxZHJwvOkE3j3dO6CMmwjOwK+DzeIFYsgsZl6jEmjnBhWO8qHw/jZJ
 lp5fcyH7diBSwUR8wEXCRUDOnta/Yuv1fQbMEMURv+k3JvasVM5L4H24Q
 CJwANY6KYyq7+8Ygaxd7MmYfikPqL3e20scjBvLoPimnNnW6W6sOXgk2R
 zvmAK4Q273DuVx/XrFS42Y4iwr7ZGKO5SBpf+HiRr7NuCTezz9+i0YCST
 YfOqOKEem498iYctAi0FJt6Dakq4Bk3fUDimUisrNGWOKTxr/yOuhWftX
 je8CM68mOGqOjaUHnzJQZ4luOx148gYEL/KZm/yp9PmECOiNsm94GNjAd Q==;
X-CSE-ConnectionGUID: tfmJLc4DR3ClqFuLc3cGtA==
X-CSE-MsgGUID: kdWjeJDeT9uAU4amk2y3iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66157094"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="66157094"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 08:50:57 -0800
X-CSE-ConnectionGUID: wnrvoHpOS5We1diwGLPq1w==
X-CSE-MsgGUID: GGhF4PC9SfSe0WSesRTwmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="193112608"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 08:50:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 08:50:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 08:50:53 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.26)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 08:50:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAu37SUTo9QsC1OAslNfqjcCwL9FEEpI406oUb4CcV682bFHasTNf/IuS28nPZXWkyz3nqeEQvsYzB7qJnFloJneZPrJdE03jPjOJYUyTyuN/pzs1vgS3z9H1hJ6LbBtLK+n69CanPPAfaQbQI1OCXqMjSUoYwqthBjigRWEwA0dRCpdPyiVGBIIq9XhPelj+uL0IBrKDN70An+xskRU8sdIYxiamzGPT0H36ROcBty0sgxK0VyLEpEN4m9QRkrGHzdICQRTIAGTRdoJPjaQl6M5nFiOoLm51xlslSfttHc8YiTmM9n2DG9SUcy/PHNLTFaXfnr2xTxAuE/pdcKCWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+joSVe0CRTGJvyW4+f85veKZLF0qZV0oLqiLBa0XWM=;
 b=LqOo8ANBr4X3taI9iVY1aXuGoOPy+fYlfPhlOhBEayojRuurxZk/6ZZvIMEVF6ZD+Adb8/3RdKf8bK4tZy6Vekrmj9nlyc5ezttppoP/7MIYOz/O2eXC4IlRSnRE7APmugsZzigD9g+X0wldr1VV02PSyElEpIw8aZvoY89jzUqQgV6LYfP0L246vd6kmFJnjfGLGYfqDiAjsT3iXab29/uA8KHAAVuaOxTTQNSJqXUeolNlI8eVjPYD0rF1D5mpY5M3tRwN1SfokWBIVwksZRbFyTKBrxHuzE14qlRiUE7X1iK/73RSa8fGU0UFPVkJOvLx7Z3b2SXqxAFQ103f9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 16:50:51 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 16:50:51 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Peter
 Senna Tschudin" <peter.senna@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 3/5] tests/intel/debugfs: Rewrite tests to use array-based
 required debugfs file lists
Date: Tue, 25 Nov 2025 17:50:26 +0100
Message-ID: <20251125165028.36533-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125165028.36533-1-piotr.piorkowski@intel.com>
References: <20251125165028.36533-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0089.eurprd04.prod.outlook.com
 (2603:10a6:10:232::34) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: af4d64fc-1cdb-4da1-ed82-08de2c42ca5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXhVaEIwdGh1UGR4NXlYMXo4c1NMbm9hSVVUT1dRQm5sTXN5U1dwQUxrcWw1?=
 =?utf-8?B?cTZSZlVtcENZRmVKN3JpRSt0Q0lzeUdPb3VmR1RkMXUxNDE3Z29qZnBicUVh?=
 =?utf-8?B?eGhwQTY3S0piTXU4dkZUdHd6d1Z6aFc2blpucWhRUUxWb1JkbkhIcE5SWFBX?=
 =?utf-8?B?RVA5NEZlMmpKY09TOVdBWmdFaUlBRDFzNHJBMWpXbytaMHFMNFQ1ZEczamQ4?=
 =?utf-8?B?a25uUUJMdUh4bU55d05DRm5SQm9jSFhHejB6aHdLcXVFRit5VDV3TndBTG8v?=
 =?utf-8?B?cGhCb2hhbnRsNUtJb0RWTEhYeEV3M3d2S0E0MWNRR2lIK3Z4eHVuc0djWDc3?=
 =?utf-8?B?NzlyZ1pucjA1dHk2NERrNjZ1UzJ6cDlXdW5vRGU4NWwwMFNxK0U5YWpHcmVw?=
 =?utf-8?B?T1F2U0hmZGlwalg3QS9rVnVZTTZ2aTVic2lvVDdwV1d0VHQ0R3RBQVRpb3Va?=
 =?utf-8?B?YlE0K3h1UnBZa094aUdMaSsxTERNOHkzNG03K2xEaThoNmk4aHhheU9LVzlZ?=
 =?utf-8?B?bjJ6LzE4VEdaUjV4MWxsaUpGTmZFai9FaFpuUm56eUhNRkNCUXljRklsUzNl?=
 =?utf-8?B?bmJ4OTZROVNWZ0E1NzdZeGR1RjZuNFBFbU1obmpSWWFaRUV1VWdRdytzNHpl?=
 =?utf-8?B?UzNEOWFObVlhWlY2NzBTWlc2TnFjWVY2TXQ0Z1EvNFBkMDJTUmRMdVpqUFdN?=
 =?utf-8?B?cDJaL0FDejVMVTNHZnhCNTNFREM5UHkxK1ZFYURMQ3laSk16ZTc3SHdEdHh6?=
 =?utf-8?B?R2s4b3AzSXFJQzhQZGlGajZKZzd1cDViYzFiSHpKTDFXUkM2eURrVHZjYWI1?=
 =?utf-8?B?Q0pTTlBSMXdBZitSVk5MYjZOOVZRRldQT095dHMxd1BrZW12NTQ0UHlmaTNs?=
 =?utf-8?B?OEEycGtTL09EV2VWeDN3MTNJT1VjbXBDQ3ZoTTNzdTVnaEFtZE9uaEFZZ3Jk?=
 =?utf-8?B?RXJmbkZXZk14anR1am5Zcmg4cmJUT290UVpob1RSbHBBSlpKNnJ6TWx0TEli?=
 =?utf-8?B?SmhoY294WTZ6bUxWcWhwRmhxYzk4RlZQeUdDNUl1SWRTMG54VG1MRGdxQys3?=
 =?utf-8?B?YjErMUcwNEliTkRpV1p6WXJSSzV6dWJLZzlxaDFPSHY3RkRWbDc4UjFPb1Ur?=
 =?utf-8?B?bUM4cVJhNEZZeHZUeHNBN2UveWhOWHloazVNWSt6SHZjb2o0N05pMU5MQWJI?=
 =?utf-8?B?UFVVSDRiTnFKOGgyci9SQ3EwQTNpQXQxbTlOakVQaGd5elRLd0FoM0M1L0JO?=
 =?utf-8?B?OTFLS1VJUTJONjd3SDk2aC9HUUVndTJRK1dSWHREaW5LUDVHc1plaGp5WEV6?=
 =?utf-8?B?andHV05LT1VYajRnMUNxMStndStqVjdTRHNJcVhvWlNLa3d4YjdSbktGb0dT?=
 =?utf-8?B?bTgzeVFIdkliZHJ0T3dDNkJaODQ1cStCSFI2WjBIbEFONjEvWjJsdC8vUWdy?=
 =?utf-8?B?Q05lNlVicmE3UFNoU25EUEdCbXBRVkJUdzFRUDBlN2QvekhNK3k0SitkNHZa?=
 =?utf-8?B?UGdKVVFoM04yR3B3NTU5MExxYkpKMUpZZWFkeGE5SFpvc3Q0UEhwdXhNZkFU?=
 =?utf-8?B?Um9zeWRXNURFNmIvdFl5S3hicUU2czNwaUdRUTRvNmpVYjZwVk1mN012cFYw?=
 =?utf-8?B?bE9qMHJ0ZFlLVFFYT1JmdHB4WnJwZUxwVjFiUTBrOXVDNFB3V0dDWE4wdUYz?=
 =?utf-8?B?bVpabitHVE82eTBIK2Exc0c0ZmpORCtuWWxBRHcrVm00ZUFhNy91MlUvQlFl?=
 =?utf-8?B?Sk83VDFXVEljUmpLTWxsVFlHMlZpUjE2ZzV2L1NWeUlacUJzYzJOcVlXV2pv?=
 =?utf-8?B?c2VEUkpkbEtsT29RMDJpSTV6T0ZMZzVsUEQ5RWFUMG01eHRVbTBEQXhLeUVz?=
 =?utf-8?B?cFRicVFjS3lpdDNmbEZGK1dzNWxUcHFvUlpIWTJnYnpyQUppSEF4T293WXVO?=
 =?utf-8?Q?pY9IrcD0CuMjXE/x9NoXn+PJyzWDa+jc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXNUaFFFbFZOT0dZYWVGWitmYzIwNFphZGdMVjF2VjN1dUdOQ1RpQ2cxNmZ0?=
 =?utf-8?B?dk9WV0pyRGpub3NqcWRDclhHVWRrSnNsRkd1bWpvWk4wNVFqWHJMQyt4N09N?=
 =?utf-8?B?eFUzZTE1bUo5Tm5BMHJ0YUpKaGtuejRYWG9sY1NiMDd3RVVUdlIyaUg5QjZB?=
 =?utf-8?B?ZzhMK243clluYitjbE50YVpSRnlyZytkM2V0elo2OVU5UW5acUZzVUlJVXo0?=
 =?utf-8?B?LzJSK0JESXhURFpaWDJtUkZ4UEZnRm9WNWN0UzZHWkgrd0ZIZ21tdWs3ai9T?=
 =?utf-8?B?Z01SV05kdzJmNysvaXdWVjBUM2hUSnREYVVkUzgwUWxCMUxtckRRcjdQdmY4?=
 =?utf-8?B?V245RE5sZ3h6bCs0LzVUS3NaSEd2TTFzZ2JOOERnalFjUG9TUnQxNTFFK0dj?=
 =?utf-8?B?VlFFSnNpMytqVDlwYktmaExSZFJjL3NQTWZ2V0pJUWNJUXJpWk9rQ0swaElX?=
 =?utf-8?B?RTUwQlpGOTdrOHJhZ0x2WS93SVpHaCtpbmIxYUNQRDZ3UUhnMXgxUWRDSFov?=
 =?utf-8?B?OGtibFRWNmhBbTVqOFcza3daYjB5N0hnNHNTNzVQbUZteUR0U2tkcXdRdFdI?=
 =?utf-8?B?Q1JKZXIwK2J3Y3V3WWFseTRNWVNjUGljVy9xblAxWUJKY2F5YW5xb1pCNXdW?=
 =?utf-8?B?TmNLdmZudnl6S2k1YjhtVjRzUnB5L2cwNmlGdGJjMjM1UWExRDk0Mi80UXRS?=
 =?utf-8?B?MjhPK3RxaEJYWnNTZWJzRXpnb1JZSEpQdnNvSmltNDNUais2N3RFN0NDRnkx?=
 =?utf-8?B?bUs2QkgrUitTcDZObnFnV0lySnpSd1FGNk1vNmRIcEh6QWVxakhnNSt2UWdR?=
 =?utf-8?B?RDg4YXA2ZWhKSDBOaDlvMjVMWEhmc0NxWDNUeEJDMWhETzQ1QlJnYmd4SWsw?=
 =?utf-8?B?dFpUWXoyd3NGejdNejFpQ1NOZWV2RUR6SFNzOVZQS3FORFc5UzFGb0xWNUJz?=
 =?utf-8?B?d2xuQU9tNnVBWEo0aWU1UkpucjBIMWsycWNOSWZxQURMOGJQSk9yODhIS2dJ?=
 =?utf-8?B?ZkRpWk9MQ2pMOTFqRjF0SHRERzA1M2NSbG81d2V5TDF0eDR2K3RFbHllS2hm?=
 =?utf-8?B?Mzg3cG9pYytCc2R6eWkra3B6UDFZQTZSaU1QR1hQc2pQdkdQTUlkcGVuNXVV?=
 =?utf-8?B?UmVtTW83ZVlMWVo4WlM1Rng2VXBqVW51dHljeXUyaDB4bWFQeWNUY2VMcGtJ?=
 =?utf-8?B?U240Z0xuRStvbStid0VMYTVhcU12V0lJaTJlY2tMdmNpK2dKc1ZnbHhJVXgz?=
 =?utf-8?B?aHVldTlLU3JmMFRsWVBPbVU5aURyenNXY2UwVGllY01CU3E5Ry9BelEyK29G?=
 =?utf-8?B?Q282NkxTQUwvZnYyMmpEVXVFVG1XR3RtVHM1ZkhpQ2EwRmhCdUFjeHJPQkZV?=
 =?utf-8?B?ZDFsc1RXRkdMK2hSU0U5ejhFbCtNS1B1czRaYnlJTXFkZDVxcngvYmJ4M2VE?=
 =?utf-8?B?YmRDQnFNYVE4dTMzUVpTNlRxeUltOGRvNEwxRU1kajNwWDJ2b1dOY1JyK3Q1?=
 =?utf-8?B?VzZObmZlVGxhQlViRFFLcjNYY08wRzNmYnJabmNlWHI4N2NqWVM2UnRhWXNQ?=
 =?utf-8?B?OXA2ZWFaNjE2WnE5NlZ3UmtROUxnaEtGRUpPc3ZoaEpCc1lDNlBtTGJyeXN5?=
 =?utf-8?B?b2pCOEF4SEgzajNZckJwUHVRajNTeHI5VWVsYmFRU0hNeHA2MWloZG96SDRE?=
 =?utf-8?B?WnB2T1J0Z25QYW5jZFNlSVpLSTBkRXprMWl6SXJ0RU1zRnp1Vm5aemd6ODll?=
 =?utf-8?B?MStJVUZDaWVqbkZhblJvNmQ1eWc4V0hHK3N3dFlzdGJMWVMyT054a3R6Sjkz?=
 =?utf-8?B?SDd2NlR3TDlLa1lkZm4wWVdIUllNQmZMcndlWkx0YUNqZFlRRTB0dFE2S1ZP?=
 =?utf-8?B?OEZKMkIyMWJncllzYzVnM3lDaUNSNXdIWlliOExvVDloemRyU25EUG5zUGQ0?=
 =?utf-8?B?UUxGTHRKcmdYdkNVUHBVZklyb2JkTVpRN25YMTNNRjE2NHhWR3RNKzgvRGVh?=
 =?utf-8?B?eXRHd0NZcW1TTXFZTGFHRCtoVkxWU0VSRlR3VzhIVWlNczB3ajM5ZGpnbkZM?=
 =?utf-8?B?ZWVBSWdBMXhZdmM5bllacVZHWXpBOUdqazVaYnc2dWVzWUs0N0duSGdXMFFs?=
 =?utf-8?B?QUltdFM1c3FaYjN3WkdCRkhBZ1NlZzBYRDkxWjJWOHdDRCtRWmJiY1R0Vmxm?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af4d64fc-1cdb-4da1-ed82-08de2c42ca5d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 16:50:51.0029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxsK9R5NVGg4gFOVjolea4yJuoYO2Qg7MucZrpqBeOTyt5yzBQVSCnPtdZMrh0RmpB+QFTh899WSjgM9NgeXuUXgygD6ow/udg4ZH8ZdZsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7470
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

The previous version of debugfs test contained inconsistent logic.
Lets rewrite the test to use a single array-based list of required files.
Add support for conditional requirements and dynamic index generation
for entries like gt and tile dir.

Also split out a dedicated subtest for validating the contents of the
info debugfs node.

v2:
- a few corrections to the for_each_set_bit macro (Peter)
- s/find_no_tested_files/find_not_tested_files/ (Marcin)
- drop xe_device_put in igt_fixture (Marcin)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_debugfs.c | 385 ++++++++++++++++++++++++++++-----------
 1 file changed, 283 insertions(+), 102 deletions(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 1005047132..cf464c5cb2 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -30,75 +30,284 @@ struct {
  *
  */
 
-IGT_TEST_DESCRIPTION("Read entries from debugfs, and sysfs paths.");
+IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes and their contents");
+
+#define for_each_set_bit(__i, __mask)		\
+	for (unsigned int __m = (__mask);		\
+	__m && ((__i) = __builtin_ctz(__m), 1);	\
+	__m &= __m - 1)
+
+struct check_entry {
+	const char *name_fmt;
+	int mode;
+	bool (*condition)(struct xe_device *xe_dev);
+	unsigned int (*iter_mask)(struct xe_device *xe_dev);
+};
+
+static unsigned int gt_iter_mask(struct xe_device *xe_dev)
+{
+	return xe_dev->gt_mask;
+}
+
+static unsigned int tile_iter_mask(struct xe_device *xe_dev)
+{
+	return xe_dev->tile_mask;
+}
+
+static bool has_vram(struct xe_device *xe_dev)
+{
+	return xe_dev->has_vram;
+}
+
+/* Validate the format of debugfs fmt file, allow only one %u literal */
+static bool validate_debugfs_fmt(const char *fmt)
+{
+	bool found_u = false;
+
+	for (const char *p = fmt; *p; p++) {
+		if (*p != '%')
+			continue;
+
+		/* % at end of string → invalid */
+		if (!p[1])
+			return false;
+
+		/* must be exactly %u */
+		if (p[1] != 'u')
+			return false;
+
+		/* only one %u allowed */
+		if (found_u)
+			return false;
+
+		found_u = true;
+
+		/* skip u */
+		p++; /* caller loop increments p again */
+	}
+
+	return found_u;
+}
+
+struct hit_entry {
+	struct igt_list_head link;
+	char name[64];
+};
 
-static int xe_validate_entries(igt_dir_t *igt_dir,
-			       const char * const str_val[], int str_cnt)
+static bool find_not_tested_files(int dir_fd, struct igt_list_head *hit_entries)
 {
 	igt_dir_file_list_t *file_list_entry;
+	bool found_not_tested = false;
+	igt_dir_t *dir = igt_dir_create(dir_fd);
+	int ret;
 
-	if (!igt_dir)
-		return -1;
+	igt_assert_f(dir, "Failed to create igt_dir_t for debugfs dir\n");
 
-	igt_dir_scan_dirfd(igt_dir, -1);
+	ret = igt_dir_scan_dirfd(dir, 0);
+	igt_assert_f(ret == 0, "Failed to scan debugfs directory\n");
 
-	for (int i = 0; i < str_cnt; i++) {
-		int hit = 0;
 
-		igt_list_for_each_entry(file_list_entry,
-					&igt_dir->file_list_head, link) {
-			if (strcmp(file_list_entry->relative_path,
-				   str_val[i]) == 0) {
-				hit = 1;
+	igt_list_for_each_entry(file_list_entry, &dir->file_list_head, link) {
+		struct hit_entry *e;
+		bool hit = false;
+
+		igt_list_for_each_entry(e, hit_entries, link) {
+			if (strcmp(file_list_entry->relative_path, e->name) == 0) {
+				hit = true;
 				break;
 			}
 		}
 
-		if (!hit && opt.warn_on_not_hit)
-			igt_warn("no test for: %s\n", str_val[i]);
+		if (!hit) {
+			igt_warn("No test for: %s\n", file_list_entry->relative_path);
+			found_not_tested = true;
+		}
+	}
+
+	igt_dir_destroy(dir);
+
+	return found_not_tested;
+}
+
+static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
+{
+	int fd = openat(dirfd, file_name, mode);
+
+	if (fd >= 0) {
+		close(fd);
+		return true;
+	}
+
+	return false;
+}
+
+/*
+ * Return: negative error code on failure, or number of missing files
+ */
+static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
+				    const struct check_entry *expected_files, size_t size)
+{
+	struct igt_list_head hit_entries;
+	int missing_count = 0;
+	int err = 0;
+
+	IGT_INIT_LIST_HEAD(&hit_entries);
+
+	for (int i = 0; i < size; i++) {
+		const struct check_entry *check = &expected_files[i];
+		unsigned int mask;
+		unsigned int j;
+
+		if (check->condition && !check->condition(xe_dev))
+			continue;
+
+		if (!check->iter_mask)
+			mask = BIT(0); /* to iterate once */
+		else
+			mask = check->iter_mask(xe_dev);
+
+		for_each_set_bit(j, mask) {
+			struct hit_entry *entry;
+
+			entry = malloc(sizeof(*entry));
+			if (!entry) {
+				igt_warn("Failed to allocate memory for hit entry\n");
+				err = -ENOMEM;
+				goto out;
+			}
+
+			igt_list_add(&entry->link, &hit_entries);
+
+			if (!check->iter_mask) {
+				snprintf(entry->name, sizeof(entry->name), "%s", check->name_fmt);
+			} else {
+				int ret;
+
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+				/**
+				 * XXX: We ignore the compiler warning, but
+				 * validate fmt at runtime.
+				 */
+				if (!validate_debugfs_fmt(check->name_fmt)) {
+					igt_warn("Invalid debugfs name fmt: %s.\n",
+						 check->name_fmt);
+					err = -EBADF;
+					goto out;
+				}
+
+				ret = snprintf(entry->name, sizeof(entry->name),
+					       check->name_fmt, j);
+				if (ret < 0 || ret >= sizeof(entry->name)) {
+					igt_warn("Debugfs format failed for: %s\n",
+						 check->name_fmt);
+					err = -EINVAL;
+					goto out;
+				}
+#pragma GCC diagnostic pop
+			}
+
+			if (!file_in_dir_exists(dir_fd, entry->name, check->mode)) {
+				igt_warn("Missing debugfs file: %s\n", entry->name);
+				missing_count++;
+			}
+		}
+	}
+
+	if (opt.warn_on_not_hit)
+		find_not_tested_files(dir_fd, &hit_entries);
+
+out:
+	if (!igt_list_empty(&hit_entries)) {
+		struct hit_entry *entry, *tmp;
+
+		igt_list_for_each_entry_safe(entry, tmp, &hit_entries, link) {
+			igt_list_del(&entry->link);
+			free(entry);
+		}
 	}
 
-	return 0;
+	return (err < 0) ? err : missing_count;
 }
 
 /**
- * SUBTEST: xe-base
- * Description: Check if various debugfs devnodes exist and test reading them
+ * SUBTEST: root-dir
+ * Description: Check required debugfs devnodes exist in the root debugfs directory
  */
-static void
-xe_test_base(int fd, struct drm_xe_query_config *config, igt_dir_t *igt_dir)
+static void test_root_dir(struct xe_device *xe_dev)
 {
-	uint16_t devid = intel_get_drm_devid(fd);
-	static const char * const expected_files[] = {
-		"gt0",
-		"gt1",
-		"stolen_mm",
-		"gtt_mm",
-		"vram0_mm",
-		"forcewake_all",
-		"info",
-		"gem_names",
-		"clients",
-		"name"
+	const struct check_entry expected_files[] = {
+		{ "clients", O_RDONLY },
+		{ "forcewake_all", O_WRONLY },
+		{ "gem_names", O_RDONLY },
+		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
+		{ "gtt_mm", O_RDONLY },
+		{ "info", O_RDONLY },
+		{ "name", O_RDONLY },
+		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
+		{ "vram%u_mm", O_RDONLY, has_vram, tile_iter_mask }, /* vram0_mm, vram1_mm, ... */
 	};
-	char reference[4096];
-	int val = 0;
+	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
+	int missing_count;
 
-	igt_assert(config);
-	sprintf(reference, "devid 0x%llx",
-		config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
-	igt_assert(igt_debugfs_search(fd, "info", reference));
+	if (debugfs_fd < 0)
+		goto skip;
 
-	sprintf(reference, "revid %lld",
-		config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
-	igt_assert(igt_debugfs_search(fd, "info", reference));
+	missing_count = debugfs_validate_entries(xe_dev, debugfs_fd, expected_files,
+						 ARRAY_SIZE(expected_files));
 
-	sprintf(reference, "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
-		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
+	close(debugfs_fd);
 
-	igt_assert(igt_debugfs_search(fd, "info", reference));
+	igt_fail_on_f(missing_count > 0, "Found %d missing debugfs files (see warnings above)\n",
+		      missing_count);
+
+	return;
+skip:
+	igt_skip("Failed to open debugfs directory\n");
+}
+
+/**
+ * SUBTEST: info-read
+ * Description: Check info debugfs devnode contents
+ */
+static void test_info_read(struct xe_device *xe_dev)
+{
+	uint16_t devid = intel_get_drm_devid(xe_dev->fd);
+	struct drm_xe_query_config *config;
+	const char *name = "info";
+	bool failed = false;
+	char buf[4096];
+	int val;
+
+	config = xe_config(xe_dev->fd);
+
+	igt_assert_f(config, "Failed to get xe config\n");
+
+	snprintf(buf, sizeof(buf), "devid 0x%llx",
+		 config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
+	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+		igt_warn("Missing devid in info debugfs\n");
+		failed = true;
+	}
+
+	snprintf(buf, sizeof(buf), "revid %lld",
+		 config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
+	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+		igt_warn("Missing revid in info debugfs\n");
+		failed = true;
+	}
+
+	snprintf(buf, sizeof(buf),
+		 "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
+		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
+	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+		igt_warn("Missing is_dgfx in info debugfs\n");
+		failed = true;
+	}
 
 	if (intel_gen(devid) < 20) {
+		val = -1;
+
 		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
 		case 48:
 			val = 3;
@@ -106,57 +315,38 @@ xe_test_base(int fd, struct drm_xe_query_config *config, igt_dir_t *igt_dir)
 		case 57:
 			val = 4;
 			break;
+		default:
+			igt_warn("Unexpected va_bits value: %lld\n",
+				 config->info[DRM_XE_QUERY_CONFIG_VA_BITS]);
+			failed = true;
+			break;
 		}
 
-		sprintf(reference, "vm_max_level %d", val);
-		igt_assert(igt_debugfs_search(fd, "info", reference));
+		if (val != -1) {
+			snprintf(buf, sizeof(buf), "vm_max_level %d", val);
+			if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+				igt_warn("Missing vm_max_level in info debugfs\n");
+				failed = true;
+			}
+		}
 	}
 
-	snprintf(reference, sizeof(reference), "tile_count %d", xe_sysfs_get_num_tiles(fd));
-	igt_assert(igt_debugfs_search(fd, "info", reference));
-
-	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
-
-	igt_assert(igt_debugfs_exists(fd, "gtt_mm", O_RDONLY));
-	igt_debugfs_dump(fd, "gtt_mm");
-
-	if (config->info[DRM_XE_QUERY_CONFIG_FLAGS] & DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM) {
-		igt_assert(igt_debugfs_exists(fd, "vram0_mm", O_RDONLY));
-		igt_debugfs_dump(fd, "vram0_mm");
+	snprintf(buf, sizeof(buf), "tile_count %d", xe_sysfs_get_num_tiles(xe_dev->fd));
+	if (!igt_debugfs_search(xe_dev->fd, name, buf)) {
+		igt_warn("Missing tile_count in info debugfs\n");
+		failed = true;
 	}
 
-	if (igt_debugfs_exists(fd, "stolen_mm", O_RDONLY))
-		igt_debugfs_dump(fd, "stolen_mm");
-
-	igt_assert(igt_debugfs_exists(fd, "clients", O_RDONLY));
-	igt_debugfs_dump(fd, "clients");
-
-	igt_assert(igt_debugfs_exists(fd, "gem_names", O_RDONLY));
-	igt_debugfs_dump(fd, "gem_names");
-
-	xe_validate_entries(igt_dir, expected_files,
-			    ARRAY_SIZE(expected_files));
-}
-
-/**
- * SUBTEST: xe-forcewake
- * Description: Check forcewake debugfs devnode
- */
-static void
-xe_test_forcewake(int fd)
-{
-	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
+	igt_fail_on_f(failed, "Some required info debugfs entries are missing\n");
 
-	igt_assert_neq(handle, -1);
-	close(handle);
 }
 
 const char *help_str =
-	"  -w\t--warn-not-hit Produce warnings if it founds a devfs node without tests";
+	"  --warn-not-hit|--w\tWarn about devfs nodes that have no tests";
 
 struct option long_options[] = {
-	{ "--warn-not-hit", no_argument, NULL, 'w'},
-	{ 0, 0, 0, 0 }
+	{ "warn-not-hit", no_argument, NULL, 'w'},
+	{ }
 };
 
 static int opt_handler(int option, int option_index, void *input)
@@ -174,34 +364,25 @@ static int opt_handler(int option, int option_index, void *input)
 
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
-	int debugfs = -1;
+	struct xe_device *xe_dev;
 	int fd = -1;
-	igt_dir_t *igt_dir = NULL;
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_XE);
-		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
-		debugfs = igt_debugfs_dir(fd);
-
-		igt_dir = igt_dir_create(debugfs);
-		igt_require(igt_dir);
-
+		xe_dev = xe_device_get(fd);
+		igt_assert_f(xe_dev, "Failed to get xe device\n");
 		kmstest_set_vt_graphics_mode();
 	}
 
-	igt_describe("Check if various debugfs devnodes exist and test reading them.");
-	igt_subtest("xe-base") {
-		xe_test_base(fd, xe_config(fd), igt_dir);
-	}
-
-	igt_describe("Check forcewake debugfs devnode");
-	igt_subtest("xe-forcewake") {
-		xe_test_forcewake(fd);
-	}
+	igt_describe("Check required debugfs devnodes exist in the root debugfs directory.");
+	igt_subtest("root-dir")
+		test_root_dir(xe_dev);
 
+	igt_describe("Check info debugfs devnode contents.");
+	igt_subtest("info-read")
+		test_info_read(xe_dev);
 	igt_fixture {
-		igt_dir_destroy(igt_dir);
-		close(debugfs);
 		drm_close_driver(fd);
 	}
+
 }
-- 
2.34.1

