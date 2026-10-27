Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90784606A325
	for <igt-dev@archiver.kernel.org>; Tue, 27 Oct 2026 10:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GmLPKXwZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2812E10F3AF;
	Tue, 27 Oct 2026 10:39:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5478410E3D6;
 Tue, 27 Oct 2026 10:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793097508; x=1824633508;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=wGCTaiTCphejSGHKfCgfXm+aGkOccYflwrYjJxoo0x4=;
 b=GmLPKXwZUGxw1cygYxRpElwh7+NzIcKRmjS6A7+QLKPEowfNJ3Sv/OMN
 h0aioPnkxL99cKXfw5EHY2w1dfPKakrEyoC00w/KFsh5yrEUJTBFYNvjS
 QlkmGpJR+62RsZp/q38FY3uC/n+q00Fhu1xa56EXZifsUVvCaYIdZz8yc
 au46CO3Vn/Y28L1c+lP0xQOEw9mAWd3aUItestJv6FJGw6Dfv7LuyGT9N
 TruH3Sx/AMFC8ZcaM7UadX0S3rl5BSKom3rxdgyJpM+MeKL/BNMJeKrn7
 CHb/GGJIEBP7E1+PdcRvb3FJXqpYIj1gdaP+u35ONXFBGqcjEo3sJg4om Q==;
X-CSE-ConnectionGUID: c+i7pnwiQImIF0dfFlPkKg==
X-CSE-MsgGUID: 4TDUcUx3TvWYJKukAs+cJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1684420"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; d="scan'208,217";a="1684420"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:38:28 -0700
X-CSE-ConnectionGUID: u+qef+pnST+JgOuXxw7Fwg==
X-CSE-MsgGUID: etbz0bWPTtqZly5RhxYKuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; d="scan'208,217";a="4595293"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:38:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:38:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 03:38:27 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:38:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2fBAz4dNwmoDn6WaHYHqG1FKju+2kEeKubgr4lSmSQJdGVI8T/ugsfG3i+4Kx4Qnkwii0e4NdXt0+WihBICdF69Q1xSFM75HtuWp7TWDlYp13W8s4MTVRsXhnCvFUoptoAFflAM21w6c5VP82f2jHJAIYHPfwoGSgN4cKIK3IJR6T2RUzM0J07O5wKGpwdifqtn133O2+EGzEZhAFumNTYABZk9PmU/aFlRlvNLsDJ6VUQVXQZxMQMqIIU5i32YCgebq/+T+cR1Ft7IdXgtuwoDetrR5e96+b8IRyIW/VCSkwEoUKGS2qwhstdVBRGaFdRMpqelOuAE9S/0EZenlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3t+5xgC+h5+e3E+mnQotwH8gzjPU+6wpgcD3Dcp1DQ=;
 b=TZjAklfGAIekLT1XWxa++AIMGVYaFwTDsGNtCob/D3ikt40adugDzwJwddD7BRDXVg7Zhc2D0tBAxJPGDyni+n+H4lfrSKML1T0l4PqGjWpRzVtYhXmYaz8aKZuesPZ5+XX96F6WTD9OabIC2AQ2mgAScPOp+Ge6l0arS5BonRuSUsaghGR0P24GkjWgvvclsDyTY2xCme0083SHP5O9h1BoB4VnTa6PxjC9YFWN5qTOp6qGjVhI1x2KWkS1/QiMR7oeaq3ER9vqgtMaUqWEE8pMsZlnDOc8312c7LAnjZ0LWja08JIqgsGLoDDNdA7DGFWoteJPY4Ujn6rGReGZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB662844.namprd11.prod.outlook.com
 (2603:10b6:806:538::23) by PH8PR11MB6802.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 10:38:24 +0000
Received: from SA3PR11MB662844.namprd11.prod.outlook.com
 ([fe80::cd9:c00b:a7aa:e841]) by SA3PR11MB662844.namprd11.prod.outlook.com
 ([fe80::cd9:c00b:a7aa:e841%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:38:24 +0000
Content-Type: multipart/alternative;
 boundary="------------Q5LMEXzd98qdZjH6NPdFnZB5"
Message-ID: <8fd069de-9f4b-4c70-b35a-af7200191238@intel.com>
Date: Tue, 27 Oct 2026 16:08:17 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel?=
 =?UTF-8?Q?=3A_Add_helper_to_dump_GT_debug_state_on_C6_wait_failures_=28rev3?=
 =?UTF-8?Q?=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20261023121034.1139234-2-sk.anirban@intel.com>
 <179281896639.64851.3910187433234514510@221881a7231d>
Content-Language: en-US
CC: <I915-ci-infra@lists.freedesktop.org>, <kamil.konieczny@intel.com>
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <179281896639.64851.3910187433234514510@221881a7231d>
X-ClientProxiedBy: MA5PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::19) To SA3PR11MB662844.namprd11.prod.outlook.com
 (2603:10b6:806:538::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB662844:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: b5316c6b-e305-4027-3932-08df34166d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|261026135527099003|261026140227099003|261026130827099003|4143699003|5023799004|11063799006|10067099003|56012099006|261009223027099003|261022105027099003|261022115727099003|261021121427099003|261021133027099003|261021135927099003|261022113327099003|261021130227099003|261021123027099003|261022075727099003|18002099003|22082099003|261026121527099003|6133799003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 0HE8v8qSK/m24fDciNzjJWIPEOqYBc61s0UcN4zlabvZgNg2iYMap9ctKGWtXjOtIxTPCUNhm1h35LemtGams/3CDviMx+6gLTLQ5FOqXuwGLzUInbedQjE9tMBM62OhQtXFh2PxXsBUu5y5wdPhSd4iHraGjvjOaTEdqCizeC2vWbnuEXNGkl+FXvttvG+uzo0qHLwfpqFRHbDjmVzjWu3H9SshSckwtbYHrdSzsrsa7dJkoIv7zfqWjouydSGCgEOjhVM1uU16CWFPxa58MEZCHDqnomydrCw1tdAf6RLzHTmoJvE2uNjoRmH408Zc+R5NpZgzlIX4PDgSimB5iycaJ2ChEf9iS1kCNVKUtdk1+1pxp5DFHBwVzr9GH7pxUgTSEA+UFQeMFe+plGdcB/Mth9WVNA51w3saKDy0cLRNzhGracJO41xXUvYfN69nGRUFn+QsBEzz4f6JUW5Vrm6Br+JQ+NKOp974J6ok/fbEkuvHmb0q6Hi9sSz5volt7KPigU7+AZf9FyZUCCAnUFOUoWuEkay5Qd3nCs7YsQFs5yiOt6JrIbLOlvBZki5Xp8tvU4ujHQgspQpGvIhz0hWXAwHvNgKT+FoJXsx3Cqk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB662844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(261026135527099003)(261026140227099003)(261026130827099003)(4143699003)(5023799004)(11063799006)(10067099003)(56012099006)(261009223027099003)(261022105027099003)(261022115727099003)(261021121427099003)(261021133027099003)(261021135927099003)(261022113327099003)(261021130227099003)(261021123027099003)(261022075727099003)(18002099003)(22082099003)(261026121527099003)(6133799003)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGpkaFdsK2Q0SXFnMGw1QnJUTU80Tnhtd1pzMUQraVBSRURnRnFiTXpSbWRX?=
 =?utf-8?B?Vk5RYTVvNnRkNld6S0psZkVSNlBjUTVNUUV0Wk5JVzAyOXkrQ2dGTktqZ0Fo?=
 =?utf-8?B?cVovUXVJT2svZEFCNS8rZHVPNUwwLzl3dXVvU2FMV1ZmaHRsdWR6cWViVFNX?=
 =?utf-8?B?dE04VlM4bnNqUDZNOUp4VzRyMFJTdnNrZGtzdW9LRDBKMm9kM29zMnRhMStr?=
 =?utf-8?B?ZnBhcFIxd3FmOEhlQ2k5Y2djZHd5b29QRTA5YWx1T0FUOEV3TG9qeUFGVFNj?=
 =?utf-8?B?ZVAwbVpXY3VXVjZzZExqOVpmdWdObSsrMVlXNXl2OHpJa3ArZk9FSHBnLzVh?=
 =?utf-8?B?RENrL2FIazBmbVpmOUx0UjkyMklBSVBQUFhlNDk0cWdNaWFvOEpaOW0vWWpB?=
 =?utf-8?B?SDFBTm9QVkJoWUNrQktndlRaL0NPZTUzY2dQQnllTlZNcm00TzFXcFlDNW1r?=
 =?utf-8?B?bDVpc0tpYk9xTzJxTGpPVitFYmQwaDU4VHh3dm5JVzJlbFFEZ1ExendER0k0?=
 =?utf-8?B?Y1F3clZqNmFGNEdaUW5kVzZGUzR1UjE2UDdKSkVVRHFIR1JXTUVpcTN6Q1ZH?=
 =?utf-8?B?SGFlYzZIeWYvOElYbHJLWExtODR5UjVLYm5xM09lOHY2b0xJd1RHSUxoS0x2?=
 =?utf-8?B?RllJQWFNdHp4ME9VTUs5NjE3ZjA5K3k3cWQvRzdlSC9yZmd3YWpBMjd0SXQy?=
 =?utf-8?B?MDZ5YkUwOW5LdXpZbTY0cWFOZG9jckVqV0JsOWlrQzZJd2lqVlBvSE1ibmVG?=
 =?utf-8?B?NXdxSUdIOURFR1g1bmh5NE1uaDRvcE9jUXpSTkdnL3Yrc0F0ZFJKems0LzlB?=
 =?utf-8?B?SG1hcmlrVGQ4VzI2SmJENlpxWjFMTFpYcUY5ZE5UcS9EaUhRdlNCYkN5MHdt?=
 =?utf-8?B?NUFYN1lFOTlONngwaG84YUVhRlptV2U2TFJYQmdXMDN5dUlxUWZ1UE1KZ0kv?=
 =?utf-8?B?c09UdWVGYnNFL3RBWlR2dU12ZFBzWExCV0VsemZkZlBtWXhLdFFkdmxlb0Z2?=
 =?utf-8?B?WGh1eWVEdk5sZnFWY2RsaE52QVc5MGwvZlBGYWpzVE5uWE16dXpHNFQxeURI?=
 =?utf-8?B?RzEvTGNUUEZwa3BuL25mR1MwWVVzV0hsZUk2UGdOejNBOTBZWCtFK2NCSWx1?=
 =?utf-8?B?c2llMmFxNjlYaS84bFhNb2pDTTZwZGcyQXZSV3Z5eEJoa3BISzNMNHlCcDhp?=
 =?utf-8?B?aHE3MmlmUlI4Y2NWQ01idDF4MzhDdGVIMzJ1YTdHbkxjSXpKTDFORXhSUUZL?=
 =?utf-8?B?VWNsZ2o0WER2dGF1UXNUN2twbkZGNzVWdXY3Y0tyMnFJZk9ORmhDaCs4Z2xD?=
 =?utf-8?B?bStiYVhwWFVnTmZNQW5hQ09iN1E1TVgvd1FnbUVxcFErKzJvNVJsMnd3eDRu?=
 =?utf-8?B?WlFXa3ZXekJVOVVnSDVmQWZ3cmt0K3ZkbUF5bTlsQ0hUaTBpU1pFS1NzZFZ5?=
 =?utf-8?B?UGtrUHhqYk15bnp5NDFGZmFQeTltTVhaRnFVRGdZRzh2RTR4aVZtT0VMRmhZ?=
 =?utf-8?B?eVVTNGFMZ0V1SlBMTDB1bmVZeDdGZ09BWDJtTy9aZ0t5b3VrL1piMkZERGJL?=
 =?utf-8?B?TXIvWjVjbE1sY2RpaHFaa0hydjBqS1VzVlpyWE1iTHZDY1FEU2lDZ1JwdlJ6?=
 =?utf-8?B?d3lxZ3ZlM3BiVHRadnc2YWZ4NkswY1U0SEtKTVp2SWhid0xOYWlLdER6cmNJ?=
 =?utf-8?B?a1JUYjB5eFNEUDhRSk8xNFJOdFVpdDQ5VzZIZWFmMmQwOHJFWldMcUIyVUp0?=
 =?utf-8?B?UGpvdjdEaEN5N0JIc3BnT0daU05mSzRWcWdXRHBqdmxZOVh2RThLRG1DaFkz?=
 =?utf-8?B?Qk5nRU5zVFpRZmJlVEtLcjMyNk9LVUJubTY2TzZKaWc5emJaMkNjU2hoTTla?=
 =?utf-8?B?MzRMUDBjYWNHbVhscHc0OFYrZVYxZ29SanR5SUVFa1NYdWwrQlhIdEpabFcy?=
 =?utf-8?B?eHBvcWdhK0V1dHJ6eXVsaGVVSGFXRG4yUTgxRzVNS1FMUURNYlNoUlpzenRK?=
 =?utf-8?B?WHZhTktmV1FWTXFXZzduSEt3bndOSWRQV0t0dEpGc2h1SFZlVlVDblVwRXVD?=
 =?utf-8?B?V3ZKdTdWdnlpek4vTnlEYTZ0eUpHUE5QTTdkbERIaCtXQ0Yyalh1Wmd6cTVO?=
 =?utf-8?B?UHVwR1B0VXF1blJJamJaY2Jtb1JVdzQxOWdtYzNhMU1ucVNZR09IUlZOV1pF?=
 =?utf-8?B?UEtId3BNYnFvNEZlR1p3Q05KSVZQK1p0YTJiMFJJQndZem5vdXc1ZUxSZlly?=
 =?utf-8?B?SWhBS3lzNFBFOXhGRlZ0b0F1ZmlUNElUc0tTeFZWYzc1ZjNkTHRVUXhmaC9t?=
 =?utf-8?B?dXlrWFF0cHNmbVBHM2VwSi9FVlRQRS9rbndBYk1KRkVZQlY0aDlSZz09?=
X-Exchange-RoutingPolicyChecked: 4Km3a0gETE8e5MEEv8mIUWWD6GTVxJwnfZkczqXRT/1uQdLbHD4L5JmRkBU58gXyjQ8adl4JDYD/48y5FjYuJ914zgVdYtCPxeL1IC187txAwqZeyvaGkgWy85XP0Vcyn/l5ro1whiTwnamZMXfEJtamZiR6h8rPTKj7+F7VYNlPeox/2Gx5Rj3wqigWac7GDHxJSc2wXQ0WP9P/OkFj5CZ9sZiXKSrS2m1MTnPvIr+p1yuoLvCc+WieBzp+fYQ/kc8vSjgnsvp9hTpcjQIDI3lE1qdX5JNow4BaD3Y5Jl9PVVFZBgrh3HYsy/0Egr/Feou32KFrgHpGK4oVbh9eUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b5316c6b-e305-4027-3932-08df34166d74
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB662844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:38:24.1105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4NbuBPB0gTll5NAxeB75Ga4dQgNc+9J+0b5YCjGBrealh0imog1XLHz62rdSUiDvbhkf7XjUuYppQIssYk8Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
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
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------Q5LMEXzd98qdZjH6NPdFnZB5
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
These failures are not related to my changes. Could you please re-report?

Thanks,
Anirban

On 24-10-2026 10:46, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel: Add helper to dump GT debug state on C6 wait 
> failures (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/174646/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16041/index.html
>
>
>   CI Bug Log - changes from XEIGT_9162_FULL -> XEIGTPW_16041_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_16041_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_16041_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (3 -> 3)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_16041_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16041/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16041/shard-ptl-8/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html>
>  *
>
>     igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9162/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16041/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html>
>
>
>     Known issues
>
--------------Q5LMEXzd98qdZjH6NPdFnZB5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,<br>
      These failures are not related to my changes. Could you please
      re-report?</p>
    <p>Thanks,<br>
      Anirban</p>
    <div class="moz-cite-prefix">On 24-10-2026 10:46, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:179281896639.64851.3910187433234514510@221881a7231d">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">@scope { td { padding: 2pt; } }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel: Add helper to dump GT debug state on C6
              wait failures (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/174646/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/174646/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16041/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16041/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_9162_FULL -&gt;
        XEIGTPW_16041_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_16041_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_16041_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (3 -&gt; 3)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_16041_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16041/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html" moz-do-not-send="true">SKIP</a></li>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16041/shard-ptl-8/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9162/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16041/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
    </blockquote>
  </body>
</html>

--------------Q5LMEXzd98qdZjH6NPdFnZB5--
