Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAA8606A326
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OfU7oWW9;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=F6d529fq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8C910E263;
	Fri, 20 Nov 2026 11:33:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD041112917
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 11:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795174304; x=1826710304;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fydQEy1Mcy7JHIc+wELDzQNpx+/bqUwM86jshQGjMGo=;
 b=OfU7oWW9p5d9ujlLviw0gSLG1/Ny1UhI9HqnminiChE/kxbXSm0F1m7J
 86oRFxIowqfgpVl2FjCo5JMzgGvA9Ozlz10y6nSIwyOx6W9SVHl5MpC+s
 b9TQdJW8eLzv+5G7ZoHzLp/GkZ6cepVxLcqwTXcTFQCh6/7CQcvhBO2Yx
 Wsr9hajGczCABu4rcdJXPdYXvwG/ZmaWOU5ka9tDrWfro2I5I7OZttPkQ
 D5P9cb+VRCZ/aZghmclCNVYdbn/CxVM3gOeBQuz8k9byrH5ZbeaXddYmj
 k7YBfYQqxs6/swCYjefTeIxFj1GTQs7VFfMMT0/bsPfVZ7nFHOd4qiIvF Q==;
X-CSE-ConnectionGUID: sluheXugStSOM4HKGc3i6w==
X-CSE-MsgGUID: eWriLoGsTziHVqvo5peE0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4053614"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4053614"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 03:31:44 -0800
X-CSE-ConnectionGUID: 9N6L4P+bQlKSWy+ePo2+xQ==
X-CSE-MsgGUID: FogxCg7oQiqsXt2cM3mkeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10568900"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 03:31:44 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 03:31:42 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 03:31:42 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 03:31:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHzFBWnS+KdbmYdLiQmLKaA0Skw4Fe6wyTPGLy1WcZDyOXY4ROncPUeKbPSqPxyXrTBrHHUfFeCYaF9VE9shhudj/p9FKHG/L7HzWDNbpF0f34+QOWUgl18Z/EkU4YqcaLTLZIra9Jgilde6lVN/as3CE+aUIag7r9QdZ0bVSREwIbxo9st67M9YFpQNiUdx80M7uVQ5utLL3B9LO5/9a2wtYKtD5hS2tlj+l/brtTfi5GcH2snWsXNpwDEaoJXq+8TYlbmrbC5jzL6HO8kT/iRpC2RjS2UfbIM6VlOFTvxNOA08cvBWqlqSQRKLwwl6u1j9RSTgtd/O3SzHzvH/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0k/+4TIvN24mjPSEhgbV8emnG/Z524kf1zRo8ZxDjQ=;
 b=WZJVasc2mFM9VHIUUtcY2zUVqgDTRxFqRMLCl9JoHB4gez30v/4ptID1xuqzPTLX7/XTP/QUzl1TgPJxNLCHIFWy3+GPvXZD2Mcbu4OgyuuXSxe7sAEEAtfj/ON05W/aTY5L8tSVgpgce3HTNrx43n9PNcWuSSJEhXKz5R96TftBJUEWHKP2tiwZmNULhk6ipur0AMn/tPa0IcOayn2fyfZjoICQIBcDumKuDMZfvjs3+tl9o8Tx1/HdGytI7S8Ja26UPM0B/xJtupX2ILDVgTFVhXTxQU7inNio/C8YgC09swpZf+z927dADVIeHDn9+A4TREBz6qbW0ZU97zTJsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0k/+4TIvN24mjPSEhgbV8emnG/Z524kf1zRo8ZxDjQ=;
 b=F6d529fq3qVw5NBy50O+V9h7TzBMoQLwZTHtkuPBN+qWZTkebOMmrM40PcDSFE7MsPeK8nXs6b0utj+qazdTRKbOc6rfKa/Bn0pcZqyZ3qwnKOJsNWLCaFKjzVi/+wXt0tlIepF4u2eY6UBk3UZre03D3LwwIkAO7kWadIjW/NQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7665.namprd11.prod.outlook.com (2603:10b6:806:340::8)
 by SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 11:31:39 +0000
Received: from SN7PR11MB7665.namprd11.prod.outlook.com
 ([fe80::d7db:f642:193d:a908]) by SN7PR11MB7665.namprd11.prod.outlook.com
 ([fe80::d7db:f642:193d:a908%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 11:31:39 +0000
Message-ID: <85a7d6bc-a767-4f19-8ed9-4004483677ea@intel.com>
Date: Fri, 20 Nov 2026 17:01:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 3/3] tests/intel/xe_err_injection: Add test for
 local Uncorrectable Error Injection through LSC Storage
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <kamil.konieczny@intel.com>, <raag.jadav@intel.com>
CC: <anshuman.gupta@intel.com>
References: <20260930153755.2447513-5-soham.purkait@intel.com>
 <20260930153755.2447513-8-soham.purkait@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20260930153755.2447513-8-soham.purkait@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::9) To SN7PR11MB7665.namprd11.prod.outlook.com
 (2603:10b6:806:340::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7665:EE_|SA1PR11MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: 4716c81f-4168-4c14-2291-08df46f9d7b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|11063799006|56012099006|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261021123027099003|261021135927099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: /l3HNBIbgGYFaOuo/pFO1aWOxuZkVlrOR28vtapGlBhYBMHDpA5eUnj5DAlzBhiXVoBH2wD2sUWTozvwhulmeA8G9XdZrySSR56bfiWg4dorGb57XJsFwZqRaomvzf/S9M/JuHDrhCN+yxEAEVy2XK/TYE0wSkQSmIBhbPrB0YBnQVrmeNUbgGCwRlEII41NY4y5plIa6Cusvo0LFTQclynpaN6H3jKJa2EwZbdcKvCVgKR2YdLiCyzuEpoVgAXTMbzoeLXvXUMNH4mKneWnBs7WTSeFUmSWm0qw0iAHXbOdMNKS8Bl6NBq8Xgztywzc3iibfiYv21cFQhSLUVdqc66vdWHb070XA02gbpXpBIYZ/2fi+Gjod0VYoRCePwChxs8WS9BrN33A1viJvQ9mFR8MpL9+90IGqvhmxz1p4nvIuzCfFOlbn9QSs1Wcm4D49dE43yGiBetsjGJKdb/gfERdJqNw3Z5sUeF0iqkIZZookxyArTn3VNVABJylYWVVP6fx7IIE8QItZaJrf5MLApuiBNWRoCmdqRVdpilG8VSG4gdip2bm4bqOuiO7szPejuI38QyuMdHu9189dyaJHJ0cwdSdmMGqaZvAhVNijXDplevhXue4+P+sqcrUTCKS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7665.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021123027099003)(261021135927099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3d5Y0wzdXNRWnR4RHROTXpuWmMydnJsSzVEWkJ0RmJEU3l2eDFrRnBYeWlF?=
 =?utf-8?B?cE1IdTYzWTF6L3dUTm5DSSsyWUJlcHlvWWdEVzBUT3d3TWV3eGdJYUlkcmp6?=
 =?utf-8?B?eDBEMlpmWmJ5TzczbmZQQ0prMFNnZUVrYlI0OGNxY0xKZ0JTR0tMamxULzRs?=
 =?utf-8?B?Vm4yMEpDd3Bva0JxYXlhLzc3YW53VjJ0Q1BJaER6Y1I3QXIzUi9hMzRPbm5D?=
 =?utf-8?B?aEYrTjhmaUtWQ2VBdm9ZNTdGYVRJTXpSMWNjZERRekMxait0WFRGVENleVB5?=
 =?utf-8?B?dzlhakZ6b3BXRUppV0xFRFN2RGtnclQ3MVUrUTBVdU8yS1lKZmU0UFd6VWdZ?=
 =?utf-8?B?UEpoM2FPZjFabGJXR0JmcjVoVkd4M0ZzNGovNW01QWV5cWZRSGt3R3lNcmVX?=
 =?utf-8?B?aW5QR1J4NlFSenVsTGtoeUl1bUpoeW9TK3BaUnJHM3B1SlpobjJseXNwUmtt?=
 =?utf-8?B?VGM0eDFNdEN5SU9NNnFVNURjaVJ0VzlvTXJJWDhUdWM3dGVWMGJST29nc1I1?=
 =?utf-8?B?UXBGUitSSDI4ZlhRQTRkT3NSNnRPRlVqWmZBRUl0KzIrbytWMjJzYkEyOW1V?=
 =?utf-8?B?dHJURXd5QnVpbzJrNHVOZUlxKy9SNmtXeDlYR0tOUGNEamNlc2NsY1d2UnBa?=
 =?utf-8?B?NjRzN2JVUnpSblBMNHZOMFJsekpQaVA1VFdNKzFZT1lOeUdXaFNOcVZnL1p1?=
 =?utf-8?B?cis1NWhNZTExZC9tTVVFUG5GTzJCa1k2TlpYV3c3UW16YnY5V2VCdjhrcXUw?=
 =?utf-8?B?VjNsa0hBWHFLTVNlNHJOM2FMUmptazk1M2NkaXlHU2FBMDhmYzNCejJHSktK?=
 =?utf-8?B?Qk00R3F4ekx0UmJjUGRKcUZMU3dvQ2ZKQUo1ZVVHeGEvSlRoR1k5VytZWGdv?=
 =?utf-8?B?c1NwaWtFYUpvamVWZjk2dW9taExNS0RVTnNBeUM1RmxzdWk0SUVGK1lrUnJy?=
 =?utf-8?B?djl4c1RZRUFZaGJ0VGVZZmdmTzlXdDJJZmZ3TmMyTVNMQ3VmWlBxR2MxQU1w?=
 =?utf-8?B?aXJxa3lYSFI5am5YRG5qaWVNc1psQVdiRmdrT29jQnFjK0p1YjZ4NjZaUXBp?=
 =?utf-8?B?NjMvNEFUdUZQRzFqaFkxRUVLRkNmcXFRRWlSTnVXZXBxZzhEV3E2TDRFZGlZ?=
 =?utf-8?B?QmpRK00xZm9rV1VGYU5pK3VhU0FJV2Qrb1dTQVM2akcyaVlpWHM2bmJjKzk1?=
 =?utf-8?B?ekRIRGV2WWxXMWYyZkFUZXJMc2Z3aVlHZGttUUp3ekFxeVdDSnFWakpLeC9U?=
 =?utf-8?B?SlVsSVZGQVZza2NlMnpKVFJUVFA3N0pHOGhyWkVKTXB5MCthN1ZIYkViaDBx?=
 =?utf-8?B?U0tVYnRyWHllNmpGay92aDFUeDBlS0t2VER0UTVHK3hocDhZVURjb0p2NUhV?=
 =?utf-8?B?cjJYRWhtQlZaWUF3UmlpV0tIbXp1dDBuQlNwak9BbW5rMHd0djl6dXdITW45?=
 =?utf-8?B?MWJiWUVhdldST2MvK21GRnB0V3JwS0hUUG90alVtTHZRRmZCTnZTNTNBMVlq?=
 =?utf-8?B?UkpRelNOTlBtNVExTy9pcy8xd1BseEQ4N2tDMDNpTWd0bDJLRUZjNkI3c1Iw?=
 =?utf-8?B?T3J0L1FlZDZ5VVAzRldZWFAwazIvajJqeWNDL2N6dGtRaG1VQnhwRkRLaU9v?=
 =?utf-8?B?QzNNbEhXcXRTbkNUeFdZSTM0OE1XUFV3SUdnOEFRaE9WV0hkMDYrSVRRUEkr?=
 =?utf-8?B?STZmKzdIZjVlTHppN1FTV1orWDFiemN4Nld1M3VvSmtsamR2ODJWNm85RWcw?=
 =?utf-8?B?WUR0R21ieXhYY2h6cGFzQXA3RDcrY0VZMW9hMDA2SllGRkF1TmxCWldPYTh6?=
 =?utf-8?B?RlR3ZzhLazNOVFVvV3lsYThFVllFcE5FcFcxQVpRRk5wc3N6eDQxck1zOGVp?=
 =?utf-8?B?cHRNWnVqekRRc2RpQmlSZUJjc0xaOXJobkdFSSs2L0NLbThPaFhIdDBUQWhw?=
 =?utf-8?B?eGtqSThhemxwNGUyWG56MXV1M2xQVnduZG5ZOWRZcGlkZFYveWVrVTRGWFU3?=
 =?utf-8?B?d0dINEU2UHd2Ylh4OGZKT3dMd3JnZlRNdGJVMEw2bzVHTkZEVStGSHpCbEJY?=
 =?utf-8?B?T0pwbm15b2VFQkpNZEFDdFBuV3BkSWhWS2lVdVZkdlFlbWZtMEtoTUxHTHdO?=
 =?utf-8?B?UUNxcUxzc0pnSzgreXk1NG9FSzNPdnBreThVbDVqMFFFY2t3aEgyb2dCVm4z?=
 =?utf-8?B?WGp1dkg2aDJOSUNZSS9ISGlIREI2cHVGaU95aWlpNXNWYnFveVpSblV5TGZh?=
 =?utf-8?B?U25xdDdSZCtqMkpzYW4xNlJaM1Rzbk1FaUdTM1BMT2hFWDlSTWRxSE5VWTIv?=
 =?utf-8?B?U1loNi9SQlI4NVQ2ZCtmZ2dKOW4yR3Q1WDlucWJ0RGRUWCtQZEg5d1hxVi9k?=
 =?utf-8?Q?w29bGikPdoSQ/xAKZy/4lfY5BbwUmNQwxhuF4?=
X-Exchange-RoutingPolicyChecked: i7lpZDSx1bgKRcd7Jki4WmODNVt1Pe7opIvGtd5XnhPY4Yjqa0EjsF80mdnjyTWMTdBTK9wfINclYMw8I6Mb+CJej9U9D+EHsqyn+uPmW98G/MGG9RlaKwdryHbMo9k3Y129JvYdeyYfj3QesC1AxqUJrAVvbQKlQ+3JaqleskAVdYGbSAtuwk6KhD5VotfFgAXiYlNrztHgIx3TxdQA1iTLPrrahbODGipaBj1eNgt5Qt/ZdthSbTIW2UamVJWocaKhY9aTbctsS4XZn0XZo6p6sh2Nxw2QZh70aF4twQWRW5CJmwjY6WVs1UnQG4Iwu23EHBOVQV4cB20TbJQk2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4716c81f-4168-4c14-2291-08df46f9d7b9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7665.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:31:39.4259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V01ytc7gqbIbMj8cs1g6Xjs80Wyt0YgTPQWQoq/WY/OYedJSkiijWsR5sEM/DMHEuBBX2wyq7CuQfGMim9zP+HGeevlqAbB1h/S7I1WQSbbrElkBAasw0jmM5teK9hyh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8428
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Soham,

On 30-09-2026 21:07, Soham Purkait wrote:
> Local Uncorrectable Unicast LSC storage error injection driven by a heavy
> LSC workload on all compute engines to trigger recovery post error
> injection. Also validate error counter increment and post-recovery error
> counter stability.
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tests/intel/xe_cper.h          |  30 +++
>   tests/intel/xe_err_injection.c | 344 ++++++++++++++++++++++++++++++++-
>   tests/intel/xe_err_injection.h |  11 ++
>   3 files changed, 381 insertions(+), 4 deletions(-)
>
> diff --git a/tests/intel/xe_cper.h b/tests/intel/xe_cper.h
> index ff061d35b..dfc245016 100644
> --- a/tests/intel/xe_cper.h
> +++ b/tests/intel/xe_cper.h
> @@ -11,12 +11,15 @@
>   #define XE_CPER_EVENT_DIR	TRACEFS_ROOT "/events/xe/xe_error_cper"
>   #define XE_CPER_ENABLE		XE_CPER_EVENT_DIR "/enable"
>   #define XE_CPER_FORMAT		XE_CPER_EVENT_DIR "/format"
> +#define XE_RESET_EVENT_DIR	TRACEFS_ROOT "/events/xe/xe_exec_queue_reset"
> +#define XE_RESET_ENABLE		XE_RESET_EVENT_DIR "/enable"
>   #define TRACEFS_TRACE_PIPE	TRACEFS_ROOT "/trace_pipe"
>   #define TRACEFS_TRACE		TRACEFS_ROOT "/trace"
>   #define TRACEFS_TRACE_CLEAR	TRACEFS_ROOT "/trace"
>   
>   /* Timeout waiting for a trace event to appear (seconds) */
>   #define CPER_EVENT_TIMEOUT_SEC		10
> +#define RESET_EVENT_TIMEOUT_SEC		10
>   
>   /* Standard UEFI CPER record header signature: "CPER" in little-endian */
>   #define CPER_SIG_RECORD			0x52455043U  /* "CPER" */
> @@ -39,4 +42,31 @@
>   #define CPER_INTEL_PUB_HDR_SIZE		328U
>   #define UUID_SIZE			16U
>   
> +#define CPER_REC_ERROR_SEVERITY_OFF	12U
> +#define CPER_REC_RECORD_LENGTH_OFF	20U
> +
> +#define CPER_SEC_SEVERITY_OFF		176U
> +
> +#define CPER_INTEL_HDR_OFFSET		(CPER_RECORD_HEADER_SIZE + \
> +					 CPER_SECTION_DESC_SIZE)
> +#define CPER_INTEL_ERR_TYPE_OFF		0U
> +#define CPER_INTEL_ERR_COMPONENT_OFF	1U
> +
> +#define CPER_EINFO_OFFSET		(CPER_INTEL_HDR_OFFSET + \
> +					 CPER_INTEL_PUB_HDR_SIZE)
> +#define CPER_EINFO_EVT_COUNT_OFF	20U
> +#define CPER_EINFO_HDR_SIZE		24U
> +#define CPER_PRIV_ENTRY_METADATA_OFF	12U
> +
> +#define XE_RAS_SEV_CORRECTABLE		1U
> +#define XE_RAS_SEV_UNCORRECTABLE	2U
> +#define XE_RAS_SEV_INFORMATIONAL	3U
> +
> +#define XE_RAS_COMP_DEVICE_MEMORY	1U
> +#define XE_RAS_COMP_CORE_COMPUTE	2U
> +
> +#define CORE_COMPUTE_UNCORR_TYPE_SHIFT	25U
> +#define CORE_COMPUTE_UNCORR_TYPE_MASK	0x3U
> +#define GLOBAL_UNCORR_ERROR		2U
> +
>   #endif /* XE_CPER_H */
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index 6dcc2b1c4..d3e63fa8a 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -16,6 +16,8 @@
>   #include <string.h>
>   #include <time.h>
>   #include <fcntl.h>
> +#include <sys/mman.h>
> +#include <sys/wait.h>
>   #include <unistd.h>
>   #include <sys/types.h>
>   #include <sys/stat.h>
> @@ -42,6 +44,18 @@ enum {
>   
>   time_t event_timeout = 10 * 1000; /* 10 seconds */
>   
> +#define LSC_HEAVY_WL_ITERS	64
> +#define LSC_HEAVY_WL_ELEMS	(256 * 1024)
> +
> +static bool tracefs_event_exists(void);
> +static bool tracefs_reset_event_exists(void);
> +static void tracefs_enable_xe_cper(bool enable);
> +static void tracefs_enable_xe_reset(bool enable);
> +static void tracefs_clear_trace(void);
> +static void poll_for_cper_and_reset(int timeout_sec,
> +				    char **out_cper, char **out_reset);
> +static void validate_local_uc_nonfatal_cper(const char *event_line);
> +
>   /* Cleanup helper for injection test functions */
>   #define CLEANUP_ON_ERROR(ctx, fw_handle) do { \
>   	igt_drm_netlink_cleanup(&ctx); \
> @@ -68,6 +82,44 @@ static void run_xe_compute_on_all_engines(int fd, bool state)
>   	}
>   }
>   
> +static void run_heavy_lsc_workload(int fd, bool forward_failure)
can forward_failure be renamed to reflect its usage. such as 
pre_recovery (yes/no)
> +{
> +	int err;
> +
> +	igt_info("Running heavy LSC workload %s (%d iters, %u elems) on all compute engines\n",
> +		 forward_failure ? "validate" : "stimulus",
> +		 LSC_HEAVY_WL_ITERS, LSC_HEAVY_WL_ELEMS);
> +
> +	igt_fork(child, 1) {
> +		struct drm_xe_engine_class_instance *hwe;
> +		struct user_execenv env = { .array_size = LSC_HEAVY_WL_ELEMS };
> +
> +		if (!forward_failure) {
> +			int devnull = open("/dev/null", O_WRONLY);
> +
> +			if (devnull >= 0) {
> +				dup2(devnull, STDOUT_FILENO);
> +				dup2(devnull, STDERR_FILENO);
> +				close(devnull);
> +			}
> +		}
> +
> +		xe_for_each_engine(fd, hwe) {
> +			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +				continue;
> +			for (int i = 0; i < LSC_HEAVY_WL_ITERS; i++)
> +				xe_run_intel_compute_kernel_on_engine(fd, hwe, &env,
> +								      EXECENV_PREF_SYSTEM);
Don't we need return status of it in case of validation mode? silent 
failure inside the loop can result in success without checking return 
value of it

> +		}
> +	}
> +	err = __igt_waitchildren();
> +
> +	if (forward_failure)
> +		igt_assert_f(err == 0,
> +			     "Post-recovery heavy LSC workload failed (err=%d)\n",
> +			     err);
> +}
> +
>   static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
>   {
>   	xe_mmio_write32(mmio, reg, value);
> @@ -106,6 +158,58 @@ static void release_steering_semaphore(struct xe_mmio *mmio)
>   			STEER_SEMAPHORE_MGSR_3D_VALUE);
>   }
>   
> +static void acquire_steer_sem(struct xe_mmio *mmio, unsigned long timeout_ms)
> +{
> +	if (timeout_ms == 0) {
does this functionality needed? do we anytime allow to wait for the 
semaphore indefinitely?
> +		igt_info("Waiting indefinitely for steering semaphore (0x%X)\n",
> +			 STEER_SEMAPHORE_MGSR_3D);
> +		while (xe_mmio_read32(mmio, STEER_SEMAPHORE_MGSR_3D) !=
> +		       STEER_SEMAPHORE_MGSR_3D_VALUE)
> +			usleep(STEER_SEM_POLL_INTERVAL_MS * 1000);
> +	} else {
> +		bool acquired;
> +
> +		acquired = igt_wait(xe_mmio_read32(mmio, STEER_SEMAPHORE_MGSR_3D) ==
> +				    STEER_SEMAPHORE_MGSR_3D_VALUE,
> +				    timeout_ms,
> +				    STEER_SEM_POLL_INTERVAL_MS);
> +		igt_assert_f(acquired,
> +			     "Timed out (%lums) waiting for steering semaphore (0x%X) to be acquired\n",
> +			     timeout_ms, STEER_SEMAPHORE_MGSR_3D);
> +	}
> +	igt_info("Steering semaphore acquired.\n");
> +}
> +
> +static void release_steer_sem(struct xe_mmio *mmio)
> +{
> +	xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D,
> +			STEER_SEMAPHORE_MGSR_3D_VALUE);
> +	igt_info("Steering semaphore released.\n");
> +}
> +
> +static uint32_t disable_powergate(struct xe_mmio *mmio)
> +{
> +	uint32_t prev = xe_mmio_read32(mmio, POWERGATE_ENABLE_ADDRESS);
> +
> +	xe_mmio_write32(mmio, POWERGATE_ENABLE_ADDRESS,
> +			POWERGATE_ENABLE_DISABLE_ALL_VALUE);
> +	igt_info("POWERGATE_ENABLE (0x%X): 0x%08x -> 0x%08x (all PG disabled)\n",
> +		 POWERGATE_ENABLE_ADDRESS, prev,
> +		 xe_mmio_read32(mmio, POWERGATE_ENABLE_ADDRESS));
> +
> +	return prev;
> +}
> +
> +static void restore_powergate(struct xe_mmio *mmio, uint32_t saved_val)
> +{
> +	uint32_t cur = xe_mmio_read32(mmio, POWERGATE_ENABLE_ADDRESS);
> +
> +	xe_mmio_write32(mmio, POWERGATE_ENABLE_ADDRESS, saved_val);
> +	igt_info("POWERGATE_ENABLE (0x%X): 0x%08x -> 0x%08x (PG restored)\n",
> +		 POWERGATE_ENABLE_ADDRESS, cur,
> +		 xe_mmio_read32(mmio, POWERGATE_ENABLE_ADDRESS));
> +}
> +
>   static int acquire_forcewake(int fd)
>   {
>   	int fw_handle;
> @@ -308,6 +412,116 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>   	gt_uc_wkr_parity_recovered = true;
>   }
>   
> +/**
> + * SUBTEST: test_GT-local-Uncorrectable-lsc-storage-err
change the subtest name in alignment with latest changes of 
https://patchwork.freedesktop.org/series/171275/
> + * Description: Inject GT Local Uncorrectable Unicast LSC storage error and
Replace all "GT" text with core compute (Xe also represents it in the 
similar way and GT is part of Core compute category.) and remove 
granular details from the test such as LSC storage and etc.. (as these 
details are unnecessary)
> + * verify recovery via CPER and engine reset trace events.
> + * Functionality: error injection
> + */
> +static void lsc_storage_uc_err_injection(struct xe_mmio *mmio, int fd)
Change the name of the function in alignment with latest changes of 
https://patchwork.freedesktop.org/series/171275/
> +{
> +	int fw_handle;
> +	uint32_t error_counter_before;
> +	uint32_t error_counter_after;

Use short names

> +	uint32_t saved_powergate;
> +	uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
> +	uint32_t error_id = ERROR_ID_CORE_COMPUTE;
> +	char *cper_event_line = NULL;
> +	char *reset_event_line = NULL;
> +	int poll_timeout;
> +
Inverted xmas tree
> +	igt_require_f(tracefs_event_exists(),
> +		      "xe_error_cper trace event not available; CPER-based "
> +		      "verification requires it\n");
> +	igt_require_f(tracefs_reset_event_exists(),
> +		      "xe_exec_queue_reset trace event not available; engine-reset "
> +		      "verification requires it\n");
> +
> +	fw_handle = acquire_forcewake(fd);
> +	saved_powergate = disable_powergate(mmio);
> +
> +	error_counter_before = get_counter(node_id, error_id);
> +
> +	tracefs_enable_xe_cper(true);
> +	tracefs_enable_xe_reset(true);
> +	tracefs_clear_trace();
> +
> +	acquire_steer_sem(mmio, STEER_SEM_POLL_TIMEOUT_MS);
> +	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		  MC_PKT_CTRL_MGSR_3D_ARM_VALUE);
To disable multicast and enable unicast MC_PKT_CTRL_MGSR_3D_ARM_VALUE 
shall be 0x0 may not be 0x1. cross verify from 
https://gfxspecs.intel.com/Predator/Home/Index/67175
Also can MC_PKT_CTRL_MGSR_3D_ARM_VALUE be renamed to reflect enable 
unicast or disable multicast instead of "ARM"?
> +	write_reg(mmio, LSC_STORAGE_ERR_INJ_TDL_GFX_ADDRESS,
> +		  LSC_STORAGE_ERR_INJ_TDL_GFX_VALUE);
> +	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		  MC_PKT_CTRL_MGSR_3D_VALUE);
> +	release_steer_sem(mmio);
> +
> +	igt_info("Injected GT Local Uncorrectable Unicast LSC Storage error\n");
Replace all "GT" text with core compute (Xe also represents it in the 
similar way and GT is part of Core compute category.) and remove 
granular details from the test such as LSC storage and etc.. (as these 
details are unnecessary)
> +
> +	run_heavy_lsc_workload(fd, false);
> +
> +	restore_powergate(mmio, saved_powergate);
> +	release_forcewake(fw_handle);
> +
> +	poll_timeout = max(CPER_EVENT_TIMEOUT_SEC, RESET_EVENT_TIMEOUT_SEC);
Currently both timeout macros have the same 10 secs. is this max() 
introduced here to make it future-proof?
> +	poll_for_cper_and_reset(poll_timeout, &cper_event_line, &reset_event_line);
> +
> +	tracefs_enable_xe_cper(false);
> +	tracefs_enable_xe_reset(false);
> +	tracefs_clear_trace();
> +
> +	igt_assert_f(cper_event_line,
> +		     "No xe_error_cper trace event received within %d seconds "
> +		     "after LSC uncorrectable injection\n", poll_timeout);
Replace LSC with Core Compute
> +	igt_info("Captured CPER trace event: %s\n", cper_event_line);
> +	validate_local_uc_nonfatal_cper(cper_event_line);
This function have various checks and asserting in case if any check 
fails. If this function asserts, there will be memory leak of 
cper_event_line and reset_event_line
> +	free(cper_event_line);
> +
> +	igt_assert_f(reset_event_line,
> +		     "No xe_exec_queue_reset trace event received within %d seconds "
> +		     "after LSC uncorrectable injection; engine reset did not occur\n",
Replace LSC with Core Compute
> +		     poll_timeout);
> +	igt_info("Captured engine reset trace event: %s\n", reset_event_line);
> +	free(reset_event_line);
> +
> +	error_counter_after = get_counter(node_id, error_id);
> +
> +	igt_assert_f(error_counter_before != UINT32_MAX &&
> +		     error_counter_after != UINT32_MAX,
> +		     "Failed to fetch valid error counters: before=%u after=%u\n",
> +		     error_counter_before, error_counter_after);
> +
> +	igt_info("error counter: before injection=%u after injection=%u\n",
> +		 error_counter_before, error_counter_after);
> +
> +	igt_assert_f(error_counter_after > error_counter_before,
> +		     "GT Local Uncorrectable Unicast LSC storage error injection "
Align with Naming for Core Compute
> +		     "failed: before injection=%u after injection=%u\n",
> +		     error_counter_before, error_counter_after);
> +
> +	igt_info("Post recovery: re-running heavy LSC workload with no injection\n");
> +	error_counter_before = get_counter(node_id, error_id);
> +	run_heavy_lsc_workload(fd, true);
> +	error_counter_after = get_counter(node_id, error_id);
> +
> +	igt_assert_f(error_counter_before != UINT32_MAX &&
> +		     error_counter_after != UINT32_MAX,
> +		     "Failed to fetch valid Post recovery error counters: before=%u after=%u\n",
> +		     error_counter_before, error_counter_after);
> +
> +	igt_info("Post recovery error counter: before wl=%u after wl=%u\n",
> +		 error_counter_before, error_counter_after);
> +
> +	igt_assert_f(error_counter_before == error_counter_after,
> +		     "Post recovery LSC workload unexpectedly bumped error counter: "
> +		     "before=%u after=%u\n",
> +		     error_counter_before, error_counter_after);
> +
> +	igt_info("Post recovery LSC workload clean: counters match (%u)\n",
> +		 error_counter_after);
> +
> +	igt_info("GT Local Uncorrectable Unicast LSC storage error injection successful\n");
Reduce the number of info messages  in alignment with latest changes of 
https://patchwork.freedesktop.org/series/171275/ and rename all GT / LSC 
to Core Compute
> +}
> +
>   /* Inject a GT correctable error */
>   static void l2_bank_corr_err_injection(struct xe_mmio *mmio, int fd)
>   {
> @@ -585,6 +799,16 @@ static bool tracefs_event_exists(void)
>   	return stat(XE_CPER_EVENT_DIR, &st) == 0 && S_ISDIR(st.st_mode);
>   }
>   
> +/**
> + * tracefs_reset_event_exists - check xe_exec_queue_reset event directory is present
> + */
> +static bool tracefs_reset_event_exists(void)
> +{
> +	struct stat st;
> +
> +	return stat(XE_RESET_EVENT_DIR, &st) == 0 && S_ISDIR(st.st_mode);
> +}
> +
>   /**
>    * tracefs_enable_xe_cper - enable / disable the xe_error_cper trace event
>    */
> @@ -601,6 +825,22 @@ static void tracefs_enable_xe_cper(bool enable)
>   	close(fd);
>   }
>   
> +/**
> + * tracefs_enable_xe_reset - enable / disable the xe_exec_queue_reset trace event
> + */
> +static void tracefs_enable_xe_reset(bool enable)
> +{
> +	int fd;
> +	const char val = enable ? '1' : '0';
> +
> +	fd = open(XE_RESET_ENABLE, O_WRONLY);
> +	igt_assert_f(fd >= 0, "Cannot open %s: %s\n", XE_RESET_ENABLE,
> +		     strerror(errno));
> +	igt_assert_eq(write(fd, &val, 1), 1);
> +	igt_info("Trace event %sabled: %s\n", enable ? "en" : "dis", XE_RESET_ENABLE);
> +	close(fd);
> +}
> +
>   /**
>    * tracefs_clear_trace - wipe the trace ring buffer
>    */
> @@ -667,15 +907,15 @@ static char *wait_for_cper_event(int drm_fd)
>   	tracefs_clear_trace();
>   
>   	/* Call igt_get_error_counter to dump the cper in tracefs */
> -	ret = igt_init_nl_socket(&ctx);
> +	ret = igt_drm_netlink_init(&ctx);
>   	if (ret < 0)
>   		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
>   
>   	ctx.node_id = 0;
>   	ctx.error_id = 1;
> -	ret = igt_get_error_counter(&ctx);
> +	ret = igt_drm_netlink_get_error_counter(&ctx);
>   	if (ret < 0) {
> -		igt_cleanup_nl_socket(&ctx);
> +		igt_drm_netlink_cleanup(&ctx);
>   		igt_assert_f(false, "Failed to query GT correctable error counter\n");
>   	}
>   
> @@ -695,7 +935,7 @@ static char *wait_for_cper_event(int drm_fd)
>   		free(trace);
>   	} while (!match && elapsed < CPER_EVENT_TIMEOUT_SEC);
>   
> -	igt_cleanup_nl_socket(&ctx);
> +	igt_drm_netlink_cleanup(&ctx);
>   	tracefs_enable_xe_cper(false);
>   	tracefs_clear_trace();
>   
> @@ -777,6 +1017,98 @@ static void format_guid(const uint8_t guid[UUID_SIZE], char string[37])
>   		 guid[14], guid[15]);
>   }
>   
> +/**
> + * poll_for_cper_and_reset - scan the trace buffer for both an xe_error_cper
> + * and an xe_exec_queue_reset event, up to @timeout_sec seconds. On return,
> + * *out_cper / *out_reset hold a malloc'd copy of the first matching line
> + * for each, or NULL if not seen. Caller must free each non-NULL pointer.
> + */
> +static void poll_for_cper_and_reset(int timeout_sec,
> +				    char **out_cper, char **out_reset)
> +{
> +	char *trace, *line, *saveptr;
> +	int elapsed = 0;
> +
> +	*out_cper = NULL;
> +	*out_reset = NULL;
> +
> +	do {
> +		sleep(1);
> +		elapsed++;
> +		trace = tracefs_read_trace();
> +
> +		for (line = strtok_r(trace, "\n", &saveptr); line;
> +		     line = strtok_r(NULL, "\n", &saveptr)) {
> +			if (!*out_cper && strstr(line, "xe_error_cper:"))
Current code completely relies on the first occurrence of 
"xe_error_cper:" in the trace buffer. In case if the previous CPER in 
the trace is not cleared properly, then the current CPER will be missed 
and wrong CPER record will be picked. Is it not a good idea to log how 
many CPER records received in total while iterating the loop and pick 
the matching record based on the test case such as severity, component 
and etc..
> +				*out_cper = strdup(line);
> +			if (!*out_reset && strstr(line, "xe_exec_queue_reset:"))
> +				*out_reset = strdup(line);
> +			if (*out_cper && *out_reset)
> +				break;
> +		}
> +		free(trace);
> +	} while ((!*out_cper || !*out_reset) && elapsed < timeout_sec);
> +}
> +
> +static void validate_local_uc_nonfatal_cper(const char *event_line)
At present, there is only single subtest using this function. But to 
make it future-compatible, can it be good to make it generic for 
validating CPER for other errors as well by passing the expected values 
such as severity, component and etc.  as arguments.
> +{
> +	const char *cper_raw;
> +	uint32_t rec_sev, sec_sev, rec_len, evt_count, err_hdr;
> +	uint32_t einfo_off, entry_off;
> +	uint8_t err_type, err_comp, uncorr_type;
Inverted Xmas tree
> +
> +	cper_raw = parse_cper_event_field(event_line, "cper_raw");
> +	igt_assert_f(cper_raw, "cper_raw field not found in trace event\n");
> +
> +	rec_len = hexbuf_get_u32le(cper_raw, CPER_REC_RECORD_LENGTH_OFF);
As the rec_len is taken from the CPER record directly, it would be good 
to compare it with the real number of bytes in the hex string.
> +
> +	rec_sev = hexbuf_get_u32le(cper_raw, CPER_REC_ERROR_SEVERITY_OFF);
> +	sec_sev = hexbuf_get_u32le(cper_raw, CPER_SEC_SEVERITY_OFF);
> +	igt_assert_f(rec_sev != CPER_SEV_FATAL,
> +		     "CPER record error_severity is FATAL (%u); expected non-fatal\n",
> +		     rec_sev);
> +	igt_assert_f(rec_sev == sec_sev,
> +		     "section_severity(%u) != record error_severity(%u)\n",
> +		     sec_sev, rec_sev);
> +	igt_assert_f(rec_sev == CPER_SEV_RECOVERABLE,
> +		     "Expected UEFI severity CPER_SEV_RECOVERABLE(%u) for uncorrectable "
> +		     "non-fatal, got %u\n", CPER_SEV_RECOVERABLE, rec_sev);
As rec_sev is being matched against CPER_SEV_RECOVERABLE here, is it 
needed to have "igt_assert_f(rec_sev != CPER_SEV_FATAL, ...)".  If 
rec_sev == CPER_SEV_RECOVERABLE then no need to explicitly verify 
rec_sev != CPER_SEV_FATAL
> +
> +	err_type = hexbuf_get_byte(cper_raw,
> +				   CPER_INTEL_HDR_OFFSET + CPER_INTEL_ERR_TYPE_OFF);
> +	err_comp = hexbuf_get_byte(cper_raw,
> +				   CPER_INTEL_HDR_OFFSET + CPER_INTEL_ERR_COMPONENT_OFF);
> +	igt_assert_f(err_type == XE_RAS_SEV_UNCORRECTABLE,
> +		     "Intel error_class.error_type=%u; expected XE_RAS_SEV_UNCORRECTABLE(%u)\n",
> +		     err_type, XE_RAS_SEV_UNCORRECTABLE);
> +	igt_assert_f(err_comp == XE_RAS_COMP_CORE_COMPUTE,
> +		     "Intel error_class.error_component=%u; expected XE_RAS_COMP_CORE_COMPUTE(%u)\n",
> +		     err_comp, XE_RAS_COMP_CORE_COMPUTE);
> +
> +	einfo_off = CPER_EINFO_OFFSET;
> +	entry_off = einfo_off + CPER_EINFO_HDR_SIZE;
would it be good to rename entry_off to einfo_entry_off to represent 
that this entry_off belongs to einfo section of the record
> +	igt_assert_f(rec_len >= entry_off + CPER_PRIV_ENTRY_METADATA_OFF + sizeof(uint32_t),
> +		     "record_length %u too small to contain event entry error_log_header\n",
> +		     rec_len);
> +
> +	evt_count = hexbuf_get_u32le(cper_raw, einfo_off + CPER_EINFO_EVT_COUNT_OFF);
> +	igt_assert_f(evt_count > 0,
> +		     "event_queue_count is 0; cannot determine local/global scope\n");
> +
> +	err_hdr = hexbuf_get_u32le(cper_raw, entry_off + CPER_PRIV_ENTRY_METADATA_OFF);
> +	uncorr_type = (err_hdr >> CORE_COMPUTE_UNCORR_TYPE_SHIFT) &
> +		      CORE_COMPUTE_UNCORR_TYPE_MASK;
> +	igt_assert_f(uncorr_type != GLOBAL_UNCORR_ERROR,
> +		     "Expected local uncorrectable error (uncorr_type != %u), got %u "
> +		     "(error_log_header=0x%08x)\n",
> +		     GLOBAL_UNCORR_ERROR, uncorr_type, err_hdr);
> +
> +	igt_info("CPER classified as local uncorrectable non-fatal: "
> +		 "cper_sev=%u ras_sev=%u component=%u uncorr_type=%u "
> +		 "(error_log_header=0x%08x, evt_count=%u)\n",
> +		 rec_sev, err_type, err_comp, uncorr_type, err_hdr, evt_count);
> +}
> +
>   /**
>    * SUBTEST: cper-tracefs-event-format
>    * Description: Verify that the xe_error_cper tracefs event exists under
> @@ -1103,6 +1435,10 @@ int igt_main()
>   		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
>   	}
>   
> +	igt_describe("Inject GT Local Uncorrectable Unicast LSC storage error and verify recovery via CPER.");
> +	igt_subtest("test_GT-local-Uncorrectable-lsc-storage-err")
> +		lsc_storage_uc_err_injection(&mmio, fd);
> +
>   	igt_describe("Inject GT correctable error and validate error-report event with threshold set to 1.");
>   	igt_subtest("test_l2-bank-corr-err-threshold-1")
>   		inject_error("test_l2-bank-corr-err-threshold-1", &mmio, fd);
> diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
> index a4b99711e..9b6f67cec 100644
> --- a/tests/intel/xe_err_injection.h
> +++ b/tests/intel/xe_err_injection.h
> @@ -21,6 +21,17 @@
>   #define STEER_SEMAPHORE_MGSR_3D 0x00FD0
>   #define STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
>   
> +#define STEER_SEM_POLL_TIMEOUT_MS 1000
> +#define STEER_SEM_POLL_INTERVAL_MS 1
> +
> +#define MC_PKT_CTRL_MGSR_3D_ARM_VALUE 0x1
> +
> +#define LSC_STORAGE_ERR_INJ_TDL_GFX_ADDRESS 0xE760
> +#define LSC_STORAGE_ERR_INJ_TDL_GFX_VALUE 0x8
> +
> +#define POWERGATE_ENABLE_ADDRESS 0xA210
> +#define POWERGATE_ENABLE_DISABLE_ALL_VALUE 0x0
> +
>   /* Node types for error counters*/
>   #define NODE_ID_CORRECTABLE_ERROR 0
>   #define NODE_ID_UNCORRECTABLE_ERROR 1
