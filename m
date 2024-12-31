Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCBBE77188
	for <igt-dev@archiver.kernel.org>; Tue, 31 Dec 2024 10:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CC810E651;
	Tue, 31 Dec 2024 10:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S79KDaem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B95010E651
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2024 10:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735642761; x=1767178761;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JqL+8NuGRabjgUUcx6qSFfFQpmSUug2QW2++BWmY9AM=;
 b=S79KDaemQYCi0v6vzaTKGXS2JccBD5BOaCSZTk9REU/ODKOIfjuUYOdZ
 XLLpIQl0AbqTofkO97wT1QLqpcsKkXKZMZlEoH5elTG8NtcWMRdyf1WTu
 i2HQeqmqSqq2txoCC/DGVJUyB/RJa4x4N3/kyHHrnjWZKiq5koRMvjmLW
 Dj71BZzsxJJFfecmFnG/PM5vMZyUBO9saIXvC2r7DKzlzTJeT2PCnnvJI
 U6jEIeRWJecCEx3HXw/756oQzXqwZFD0dZG6DfHG1ZLgaX8BDGxoBYd7n
 wF8TTyC+7D7Dbca1TxviQl9vNkdVBFo/vOCEn3Yh/51e0hDsIwGrVTtqm Q==;
X-CSE-ConnectionGUID: rTpb83toRwe5UumJWfqAYg==
X-CSE-MsgGUID: JWrgygqtTw+2Z08Nk2hH0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35946098"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="35946098"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 02:59:21 -0800
X-CSE-ConnectionGUID: DRwvziDnQz6aPV5NPqko3w==
X-CSE-MsgGUID: NVRQqOLBRiqeqapz9usC2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="101200601"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Dec 2024 02:59:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 31 Dec 2024 02:59:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 31 Dec 2024 02:59:19 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 31 Dec 2024 02:59:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hR/k9w8CfMLeYLWNcDMKC76L65gucsHK+L+vd8MAFu6dagvQ1LvIGXWk2S6ZfsZTzLz6r/W9SWkt22C4g5YUhjsRrIAhUkYK5L3RC2U0mGSjkZtCsCeF4rRYGQGG6dy0KdZuMlcz6oVi21KkH6esVXwNUAtUK7yCUs4arLYKvDhbtRKC6MwMlGAfJXaOozWzQK0GQ+/H7TcwKMhR7NygF6aKn68hLb4XZ8LOTIsHcsmNAoX6nGVoK99y2sUYlyZOyGtDuL3zV3QsiT2uwpk5iVIzCIKd15+SE3PWYAmLm9l8h/1kTZYZzCTkiQUubiL3GgvSbX8OeubWvAB6ncAFRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2x03Zj++2b4mEqOOaXnh+PG1eZO1Wc4DD/nWGsTSMc=;
 b=A3xU9Q2k9fzkrw9C5Pi1pvXVG/LUAQrPHFGCOgFgczzIrCokau97wubDfIsjCmBOHU7taOShixfIYfLmerM5LdYW+GaMFr9jnUHducPi6DLhHLfyeSRV3FWT1IHCLuzVWmb5NfUsbnC6ZmiN2C8Y0jE2NeP/r33ILOkQURdZcgkniSIRdpLp6msP7CmBaeDfK6UO0jHUyF+DhMs7uu7Z/XjOvFFhkTSR+XMuy+O2xlREiS3iqbYaCE/0I5a/C4wZQudYcPUrWLTKRAMV8g7n61PEp//SAbV5/8ZE99xlESqrEu5MNjydqxhpl0fjSIUTzYqGl0IOY7H746ZgdBv7mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH8PR11MB7000.namprd11.prod.outlook.com (2603:10b6:510:220::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Tue, 31 Dec
 2024 10:59:13 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 10:59:13 +0000
Date: Tue, 31 Dec 2024 10:59:03 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_balancer: Decrease expected
 load value
Message-ID: <7uv2w4zusfd3byux6ihs3km3w55apvcrvq4wzkojq3j7f2iouc@unflmr7eabvn>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <fjysvvdi7wbyamul3gxnaitsbnsbme27ikteqelhk6ukih75vs@cynz3yfs5gmx>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fjysvvdi7wbyamul3gxnaitsbnsbme27ikteqelhk6ukih75vs@cynz3yfs5gmx>
X-ClientProxiedBy: DU2P251CA0025.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::23) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH8PR11MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f4f8b78-8d3a-45d2-af3a-08dd298a2925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qnp5RkFvY2NkUlVYTllnSU9ZaXVuaUV5Sy9LSnNYYVkyellsSS96YWthZ2ds?=
 =?utf-8?B?TTkxQ1ByZFlkQ0YzVG4vT1BOcUY1YzZxcC85Vm12VXJaV0lUZlhkZXFSaDdO?=
 =?utf-8?B?WFNLNlZ1bzRuWnA1ak9oUTlMdXc5SFllN01YSTZkV3U0Q2YvaWExQlcrRmN1?=
 =?utf-8?B?a21xcDZEdEg3RlFwK1VSdUxOdU94TEw1eEEvaHlDSEE4UXdHZHdJMXFCUzFT?=
 =?utf-8?B?Q0NTd1ozUWZmOEpncnRENThkOFdaTmtGWWRGTkRVaDFKREptdDk0RWJpSlIx?=
 =?utf-8?B?bUdlcHgxYUM4Q3d0L1VyaFhlOFgzOXdtZldlUENwN2t3S0xBbWMwRjN5eWhH?=
 =?utf-8?B?OTlFTHBpOXpmSmF1V2N2eW92Sno0OEdwcTVwTmxjRzVVeFY4SjNFWCtuNFlK?=
 =?utf-8?B?ZGJ2Uk5ROU42aU91cEtXUkVSeXR0R1pTVDNWTVBLTGZmdFZpMk9tc0FrTkk0?=
 =?utf-8?B?SmlFZkVPdDIvU1Jua3M1enBSKzh6ZktSdVU3UlZ6OWRrMmtHY0MzMDg1SHNq?=
 =?utf-8?B?eEV0M0s0TWIrT3l5ckZNYkM5MkFpZTFHTzlONVJkU1d3MVczMTJpRk9DUGV3?=
 =?utf-8?B?T0RFTTJCRFFhRCt1eUo4NVJORU5rU1l2K1o3WFAyOUw4a08yTy9ScW44Z2lK?=
 =?utf-8?B?UHZmZ1BUOVpFU21KZjVJRjB5Um1OV1FhWlFCNm1teXpvZFZXTjJBekJxakVa?=
 =?utf-8?B?enBkU082N0d1OHFCcFgzSS9NV2h6TzhFNmdiZDVKQXNheWFGazVtYmhJUHRV?=
 =?utf-8?B?MVZlYXljeUhvdFVqbzRqbzA2NmhSTzNWS092b09zU01qaXNtK3BZUjBnZHgr?=
 =?utf-8?B?VXo3Q3p1c0ZrMW1lT3o1WFRTL3h2VldNZzAxK3ZmdURBMEk4SnBmVjg4emtu?=
 =?utf-8?B?bjBSWUEvWDVDMmdBeHlxOHV0TUpjSW5qZG8yWU1UVENyQ0RVY2UvVkxBblNu?=
 =?utf-8?B?VWdNQ2pvU0VicmE4U2FPaEJaOXZ6QVpOWmlFVHpYZkwweWZpSngyT0owZTZH?=
 =?utf-8?B?bEdIQjFGay9GWU5YR2p3bEIrRi9rcndZZG1SemEzQVFKS1NOWXhjckdkTi83?=
 =?utf-8?B?bi9XMEpObHUvMzdhN1dlMWlmVXVYenVENGh6YWdyaHI2VHUwaEpOeGlRN1Jx?=
 =?utf-8?B?TkxvRlBaRHZ6MklwSTI2UnVJT0poS3Buelpkekt0b05CT05UUkJIV1RtaHhh?=
 =?utf-8?B?SUI4ck10ZXFRYnIrREdiTmRJaU5GVzNML1dPMHp2TWptSmNzeWcxQVJzMkJ2?=
 =?utf-8?B?b0U0YVY0Y1djTTcyK3VSOFpsblMzMW9ER1NVZ2RBbzlFNXhmdWs4MDRBem9T?=
 =?utf-8?B?T1Q1SVFYZGN0Z1lkenM1MGpETHNwUmtCOXZSWHhoL2VpSW45Nm9OZk05K2tk?=
 =?utf-8?B?Z3BkaTlLTGJpL2VoRnJVSWc5RDBEZlR3WHAyM3hPTnRNMzFCRWhTSUZKREJp?=
 =?utf-8?B?aEJMYTJQL3ZxYXlGYWd5YXQ1RWFXWVgxZWMvTXZqS2ZZZnlsOUZnOU5udWFp?=
 =?utf-8?B?TWdhMzliZ00xeTJlMHJrWmEwZWQ5Nk9jYVZha000bkV1eTZRWHBxR0NwQWZ4?=
 =?utf-8?B?YW1jQ3kwMi9hN0dGbEhVaFVyNnd6RDdibTYxZURYdWtGSUlRZ0oraFhNelJt?=
 =?utf-8?B?OTdaT1hEdGIvOG1MM1BKTVdQUk9EdkIxcGRhYndjUFY5Qm5JdnhGcHZUeml1?=
 =?utf-8?B?TXNQNVQzSE0ybkNuY3AvRWQvTGFyVnRCeHUwVW1wajZKYXpPZlhIb3N1OGJH?=
 =?utf-8?B?RjVxTlBFbTFEUDIxUnlCdVVBNS9JWEdGRVhBSjJWZkxSMWtFMzlUK0tyRCtU?=
 =?utf-8?B?L25Na1RLTEcybWlEcExUZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2FuM24ySk9oTVV6N21qaTRZVmx4Ri9kOGdxYStieG93T2dXMy9WV1RMa0hZ?=
 =?utf-8?B?T3lvMnlUaTE1bmlHY1BvSm1xdVBRRFJyb21BY3pkY2RhQkdnWlNMUCtheFhv?=
 =?utf-8?B?WjFFeVRLUlNWMDUyZlJWcjFrL3VKMjZwTVpacDhvQXJVd0JLRDk1MWZzTVQ4?=
 =?utf-8?B?VzVLZUNDSHhqbS9NYkYvay9XelpBWDVMUFNQem8zbEJNOVY2empGOFBhT1Y0?=
 =?utf-8?B?ZUxqQ1hTdGh3Z0lNNlMwSEE0WWp3RUp6Si9icGJGRzZjem56VG1QcG1VYmJS?=
 =?utf-8?B?Q0R6RnBya1M4ZnFaV1M4NGJNZC9EVEpTVExnS0paa0d1cGl6SjhNS0h3T2I4?=
 =?utf-8?B?UjBkZHJVVjVRY2lVUWZaRzRuQUs2R0syamtNS0pONUxwbDBiQkltKyt6aC9w?=
 =?utf-8?B?Slg0azFVbzFveEpyUlpySEgzbm9qdE0vQmc0Smc2Zk54dmlURVVWSzN3ampj?=
 =?utf-8?B?STArMkc4cmVyVjJmR0lNUmJDQlllNE5adHlLN2Fwc09rR2lyaEFhTWppZFBw?=
 =?utf-8?B?Rzg1VkNwcisxRmdpMkQzaklVL2tlTDB6YXNvcUgrZEcxRStDNWxneU1hZCsy?=
 =?utf-8?B?cGVqRFNPVjZ1Z251azE3eTFObWFXRnNQM3J1eFhtK0c3TXJTU3JjRDFMQUd4?=
 =?utf-8?B?UkgzMWVXakY3Z0pSejlTK0pyVDVzZmE4MDIwbDBHZ09uWElFSXIrWnVFdkNj?=
 =?utf-8?B?cThuM2tGMkQzbVZkSkFpOHg1LytCcENMb25QVjRhb2RXNjFYMWJGL3VkY3Nk?=
 =?utf-8?B?TWo5cUw0MXl2TjZTczFTY28vOWttVmJzUndkd1l0RWcxVCtnK0g0Q296ME5B?=
 =?utf-8?B?bGRTc1BRRXVyNmlnd1UxVXlxS3c1SG1Ud296eDVpMTN5emFzY2daQ2FxaURm?=
 =?utf-8?B?Nnllbm1ydzIweHovckJqalZydFA0WXBMc2tvZmFmcHJZanJDbWlKR2hibmpK?=
 =?utf-8?B?MC9jMzR2Z0tBTndXYVkwa3NZNVFQaVRXMzdKQnVWZzlUZ1hpaGFPVndiemg1?=
 =?utf-8?B?WEV4QWZhWEhCT01rc3Q5Y3NCbDVzNVdlWHdJVVlmYmt2SnFVTnJ2cUhobVpm?=
 =?utf-8?B?R1lGRWNHYzgrOVlYK0xkbzVsWVNHd0hHSzQ1WVlRbUdkcFkwSHFmU0NwZ3k2?=
 =?utf-8?B?VStsR1A1ZDJrNCs4bHoxc3hTaHFYSUhXSlRGL1pQZENLb2hzN09JNmNUNkV5?=
 =?utf-8?B?bndxOXRVY0NsdTc2QzlyS0ZnYnFoRkU4cUFMOUExa3JkRHpENTB2OFRpQW04?=
 =?utf-8?B?Nk1sUVVDTmtab0ZvNjB6OHpjcitzS2pYS3BNUVAyQWJjdUV3b1liYXhTdVVm?=
 =?utf-8?B?NDZNckpkQm10ZXBlemFZcHNnWWZlN1AzZ0NXUXVDRS9Ba3V5TEJVMXlPN0xM?=
 =?utf-8?B?ZXZSMWp1bGlTL3czZUVKMStDUmRSSG5CZm5LeHNxY3NEcEp2SEhyR0hRTTk4?=
 =?utf-8?B?amkrSXl6RmFpUGQrdHhQMEoxWDFYQi9zTkJ3bnk0S21NTjVLRWpxVS94a1Bs?=
 =?utf-8?B?SWtRcElIN1JjZWtKL3pTZmZLcm4xSDNpM3ZNaFczYzRPUDlKOUdObm5KRDdU?=
 =?utf-8?B?TkxkNlNwVUgvemJkVFVpbUhTVVFaOHFvQXdpLzlDNjU4VjVabXludlFFMTF2?=
 =?utf-8?B?bmpPMmRDa0s1Q2syWjR1NUhGMmgvNFlucGpqcUdWeTU5UDhPa3Rodk1JYVhQ?=
 =?utf-8?B?YzI3by9mcEhQczBROTVaemdhcjcySHYxdStwQllpbFM2a29uNGkxVlBNKzg4?=
 =?utf-8?B?eEU2UXQ3Zy9iWFBXSm8yQUhxVXFlZktJTEE4a2Y4aGVmcTM5MFFqNUljR2tu?=
 =?utf-8?B?cklNZHhQTm9yR1F2VklOWm1MNStINEtoVGthMjdoZUNONDZEN0tDVzE3WC9t?=
 =?utf-8?B?N3p3ZW9QU3Focy9nazZQK0xKRWtGWi90L1dpQW9RVjJaaVV0R2Urcm9jWVp0?=
 =?utf-8?B?cnZ0WWN4V1VlbDJnWXpUQ0I3TmhseG5RWng0NHdRWFBqc0g0R052YTc2UldB?=
 =?utf-8?B?YlhpOUJETVRqamdnZG9DZE5mUGJ2S3ZnckU5d2tDVDJkOVo1MlhITXBsaENQ?=
 =?utf-8?B?V3FrckhKdG1YRFVCWTB5SFhMV1E4ZDBReEx5U3N0d0VpakxrZFB3ZU5NQWFu?=
 =?utf-8?B?d25BTHgrTzlOekY3K0xwN055ZFRjZ2h0NGdjZWZRWkR6ZmxiQUM1ZnpkcllY?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4f8b78-8d3a-45d2-af3a-08dd298a2925
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 10:59:13.2227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hff10s6JXbq6DBiokpB2buQ/RSFiEFwL6pc9ojgMKKxcLO5tSBTTaR02Fga8coTbd8pIwJhAzCB9BnpzSGiPigbLUVqcEu2VF5AkxCahLwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7000
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

Hi Sebastian,

On 2024-12-17 at 15:01:10 +0000, Sebastian Brzezinka wrote:
> Expected value of 0.90 may occasionally not be achieved, either be
> latency in the scheduler, or perf reporting. I'm lowering it to 0.85
> to match actual values ​​(87.5% in last fail).
> 
> Resolves: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12943
> 
> Signed-off-by :Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tests/intel/gem_exec_balancer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
> index e7c43f1b4..c3f0c938b 100644
> --- a/tests/intel/gem_exec_balancer.c
> +++ b/tests/intel/gem_exec_balancer.c
> @@ -614,7 +614,7 @@ static void check_individual_engine(int i915,
>  
>  	close(pmu);
>  
> -	igt_assert_f(load > 0.90,
> +	igt_assert_f(load > 0.85,
>  		     "engine %d (class:instance %d:%d) was found to be only %.1f%% busy\n",
>  		     idx, ci[idx].engine_class, ci[idx].engine_instance, load*100);
>  }
Looks good to me.

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Krzysztof
 
