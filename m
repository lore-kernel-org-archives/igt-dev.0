Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2346606A31D
	for <igt-dev@archiver.kernel.org>; Tue, 27 Oct 2026 10:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YmOio6EK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB3010F3AC;
	Tue, 27 Oct 2026 10:41:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19E310E3D6;
 Tue, 27 Oct 2026 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793097632; x=1824633632;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=HD6mE7YmGtZXh7R/2zAUxOD0c28ZUwKJp9QxGL3F8DE=;
 b=YmOio6EKZFd1sAgwLUdSWqVrRlCjM5ljdx0hYOI7SUBlIoD31NMNf9Ws
 9waPG9e8WUQJzR/x1eKeWxKRM1LdjGtBLuVD0lYyjkh8aZbgJ1Grb9Q7A
 n0egs0m8m86JR0WkbnuAV9xQsXsxrzAX3x8S03WH9xbcSa52CmuQAKVy6
 /6d5v/jOVpes2mLXGJKhLNoS1zy3YLxJz+99DNyCTUZjddQzp4YV6jc+d
 Mc0hpKHxpcqwkhs4m2d0G1ttSPF+o9zMwJzn81ChD2XBOoe+80us5Tw/O
 SNhvvNJFUQx9rQUojfREFphiV2YJIKqPQtV6EpSfaOQdJXi6m+/EO5iVN g==;
X-CSE-ConnectionGUID: V0ru+RBCQyG952Mm1kwSQQ==
X-CSE-MsgGUID: gjcPz0RFRMuxpQnZPu0naQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1671201"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; d="scan'208,217";a="1671201"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:40:31 -0700
X-CSE-ConnectionGUID: Tm+y3hHdTVKEab7+4/4gYg==
X-CSE-MsgGUID: vQtRdCgXS8eDRXmjOxzCRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; d="scan'208,217";a="4416576"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:40:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:40:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 03:40:30 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:40:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBuZ1a55/4P6lKrFS7AsWuagJMODb+98WRkG4odE9b6emqCx5NaPxdHzcrbh1UPhoumbOwcgu5VbbemNcWy+o/7dXQNnUvdbiJg0+2K+YnBJNTKdssrTsuvsKSz5uZt+KHImtQGJLrWeIy54K3l1tMcd4St2DNom5LHsqDkaSn562NMXdVtRttZ7YUrd0KZwfJxHEV8s8yh5MLox6moFwdMMW9mID0y95jALFBfSaATQzO12qP00uzagJxU+DLUhwKoWll4WOVZ2/aQsbFqZHgYMXpRV8/G1u+x9d/LNslPAKPNTUtxZdrd/IZQGmUktLQYwOQMSUxp52VgaUaU3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5O0w0vTacL7tCw0dQF28s+TTgoU+ogVe2x+hAZeUwY=;
 b=RaxuCKDRMuP4iyM5nQIwKJEcJx4eskmw0BViprS9ROlSkl12JpycJjRJ2yDM1dnuUkklamLB0Bvet5HzXrFU4n4kCPIvuXeY3/Aa79AohNQtOfEPOA2/GrilZnl4hXA2lDJ7BvdhdYjt77VCebqB5TMlI+NEUGL2RAdjlA3V+MeLP0epos0aV+wYbY0N/n57pj0pbpoGkLaNtTveUQ+UMNRwd5M7zfRr1uNzTgXnO4UfSYgLfLkqJtiIuCndvMp7jAxfABA5kTy6eyWP9PP+37P03gRjZUhAWOhUmrSdYvYYp1s9N2oTlpC0OouFtyb7Ei3CrIYNgYPOh6n7z3nnLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB662844.namprd11.prod.outlook.com
 (2603:10b6:806:538::23) by PH8PR11MB6802.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 10:40:28 +0000
Received: from SA3PR11MB662844.namprd11.prod.outlook.com
 ([fe80::cd9:c00b:a7aa:e841]) by SA3PR11MB662844.namprd11.prod.outlook.com
 ([fe80::cd9:c00b:a7aa:e841%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:40:28 +0000
Content-Type: multipart/alternative;
 boundary="------------1rPYRj0uB0K3bA0VF01C8mBS"
Message-ID: <03f89577-6a04-4969-9d65-29b0da4d4ae8@intel.com>
Date: Tue, 27 Oct 2026 16:10:21 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/inte?=
 =?UTF-8?Q?l=3A_Add_helper_to_dump_GT_debug_state_on_C6_wait_failures_=28rev?=
 =?UTF-8?Q?3=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20261023121034.1139234-2-sk.anirban@intel.com>
 <179279114359.63820.13723341491836196698@221881a7231d>
Content-Language: en-US
CC: <kamil.konieczny@intel.com>, <I915-ci-infra@lists.freedesktop.org>
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <179279114359.63820.13723341491836196698@221881a7231d>
X-ClientProxiedBy: MA5PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::15) To SA3PR11MB662844.namprd11.prod.outlook.com
 (2603:10b6:806:538::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB662844:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd60e4b-e846-4b6b-536b-08df3416b75f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|261026135527099003|261026140227099003|261026130827099003|4143699003|5023799004|11063799006|10067099003|56012099006|261009223027099003|261022105027099003|261022115727099003|261021121427099003|261021133027099003|261021135927099003|261022113327099003|261021130227099003|261021123027099003|261022075727099003|18002099003|22082099003|261026121527099003|6133799003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: BaEfjhXQg8cteZ/rzh7H6RVl9dT4F4qapoYQka8iqQ9R8Y1PIIvwgKiQNb2nNfKxCVBEVoDHIgDB1l4mZebL0OVccM/apy8zMzz2wxr97lNj+Aa0RGHTasmwFWwVGDv8Ee38eAGJp0u6KRvjeZEqCEkFVpahm10gJcwNFoOc01O/w/wn7jhe5yWZIFBEvxnJcjUI+L3oMV9RKqYjMhsrMvPWQ4LtbZLJlIe2+3QlFTxm2m+Qc0D7SmTeX62I9nQ/XAEdoSZ1e81BDuRGcR+v5PLZRtY0mj0ZZZePHBUtiT0KS4n4jVlLFSo/a6nGydIypCqj17HxniKTGIvEY5ahLJAmr6sH4ol6XLaEbsUCyPM3DVQcnUOogLRPCtE2CYTr/bXdAKQHJ72pW8YqunyEm2yMg/5TMNUScwAmWSIytLuriIZMCX5zxLS6sDV85VMPnF/Nije32kR4d7liA8ONnr3yv1LslYz0QldLZjzueBzc7Og2jtocBGU6kOFiFR6tFhBbbFZv94PTI/jfCQ40TcElV201X1/C8nP7Jbc7zm6mS6AqIJ+M+cvrUNtCN7QUUjrIsWvreQlImcrMSzxpVFzrA/CBXaEVEeGfEO5DbSw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB662844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(261026135527099003)(261026140227099003)(261026130827099003)(4143699003)(5023799004)(11063799006)(10067099003)(56012099006)(261009223027099003)(261022105027099003)(261022115727099003)(261021121427099003)(261021133027099003)(261021135927099003)(261022113327099003)(261021130227099003)(261021123027099003)(261022075727099003)(18002099003)(22082099003)(261026121527099003)(6133799003)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk4vS2M5MUkyQXpHWU1yQ2tHN3hNc0VTemdXTHFsQjIrcjRlSllaNHlVNEdY?=
 =?utf-8?B?MnZVTjVISnplWEpFc2VIL2ZyUmhxS1E3TDBZSW1FRmxWZXhPN1gzTGNCaWRy?=
 =?utf-8?B?QnBBT1pNcmFTYUVQQWFBdU9FeGk4b29sT2g0SlZuaGhwa0c5dDB5blhQeUtu?=
 =?utf-8?B?TXdQc09mM2RnWndFVzZIVy9SOElnTW1LTll1ZXhwYzVDWmpTamhoa1hycTRr?=
 =?utf-8?B?dlhVOWgzMWRCd3IxemNVamZaY2puUjhXUXM4Tisrci81MVluNE53dkRFcXJC?=
 =?utf-8?B?cnNtRDEyK3hzSi9FSEoxbXhuSXpoSmY2UEpLRUZJNEFyUU5FRWo3YnRyb0x1?=
 =?utf-8?B?cFV1VWtqWDhhUXBCUUMyU1ZFeStKVCt5QmFLcjJZOWZZS0lXWnZpSEU3R1NP?=
 =?utf-8?B?M1NRWUhjV1lQc3FzbEpQaUk4MHl0emk0bEhyWE9JNGFPTWUwQldlREc5SnlR?=
 =?utf-8?B?cnFFa2k5UzZCT1FIc3Jjb1RkQ0dVd1RJZmFwOTFhWk0zV0crRHcvSzY4VzdY?=
 =?utf-8?B?VUVsMGJvMGpoVS9hMk5aeUl1NDJqOHdudzFwOHJRTERJZUF6a0QrTG0zTUVK?=
 =?utf-8?B?U1BDZUtlMkxwR3RUZkZjRmRRa1o0cGVVdE92Szg5NnA4eUJZRHMxYWNVeFF2?=
 =?utf-8?B?THlkVnVDZ2svRU9TclJMeU9Cc1VHdXNPRXR5L05qQU1Lc0JvUzNQcWhiMFla?=
 =?utf-8?B?RHRFZ2tYRlBFMUZEOHg2VTVNb1V6KzU5U3J3QlZaZUV1U252VTBMcXkxNEF3?=
 =?utf-8?B?b2lJUmF0c1p2dzBxRldVRnFNeWYwdlBlb2xkcG1tSjRsS2NIcHNCUmc4Nk9H?=
 =?utf-8?B?SzIvajJUdnlYbGdNeEdaODRTeld6Uk9vS3BneVdpa001QzlkQmpmL282U0Y3?=
 =?utf-8?B?RWREd1RGMWFla05aQkRWTDRQUXRVYVJvYk9rTk9yQXdNcWVmWGErMFExc0hK?=
 =?utf-8?B?MUlXeU1nM1Z0a2hrTkFpSVVyR3V4TDViSlloSTVFSWVOZlpmbEhCMnQ2QnlR?=
 =?utf-8?B?a003Vm1HdlZOTU83SXpEL1dYYWlWakRVc0ZXSmpOZGp6dkcvMTU2T0phVW5y?=
 =?utf-8?B?NWJIbFhRenA4QWYveUtLQkllSHZlZzNjSS8zY0Q5TGp3akRjOHl3SGpyUFZs?=
 =?utf-8?B?dUtJUzJOeTNudHAyZU9XTWxaRG9KZ093SHBxZTVNQmwwSkpQdFhNTVZzcTNs?=
 =?utf-8?B?VHJjUzlqcmU3dmgwWnhTaERid0RYTW1rZmYzTzVwMXdVUkZKM1lQaFVQS2Ux?=
 =?utf-8?B?dFBpRkM1UHRDU0VzWGdJMHV5U3VuLzhDVTBBOGdhU0FHYzk2YXJIV3lLZnpr?=
 =?utf-8?B?YzRXS25zaG9pNWw0ZnRlZjZsNGNIUk1FYmtISTR4YkR2OUFCa2t1MFhqbzU4?=
 =?utf-8?B?M2RUZ2N4enJoWE85eGpGdUYxMmdNSEVkS3JzN3dQaVRGZ3RWM2JYUHE5SEJF?=
 =?utf-8?B?TkYzL3p5UExyVTRsMGl4UmREWngzbFR4TzFJMnJDUVdhZ3BWWXU5TThKZDYr?=
 =?utf-8?B?cytDVU1GUk5lR1RPZzR5dE9yZytET20vQ0RzRFdIVmVMUlpXSzhjYmZZOC9E?=
 =?utf-8?B?VjR6OFhtRStuRGxsdE1Xdit1TW5SbU9LSmpIUU56M21XSmdKUVg5NHc3a3Vq?=
 =?utf-8?B?Vzl6aGl0NFZGTWVsL3pBeXBqS3k5WWNnWlpLK2RXWGdjZ1ppMXdDYzVmTlMw?=
 =?utf-8?B?Y3pQUE5kek41NTBaOHdreThZc2tNTTZHckVMOGJQYi9nN2Iybm5nUjR1Skpt?=
 =?utf-8?B?SXQ5d0Q5NTQ2dElMeW9lV01nbVowa1YzUWtrVTc2YUVtZlA1U1FiRWhydy9u?=
 =?utf-8?B?aEh5SG9mU0lvZDUvODRZM1VXUzQwTGMxTENGazVGVmF6bmd2NllCZDhwbTM3?=
 =?utf-8?B?Z21GSlZ4RytrMEcxd01Va0J0b1RyWmxPQUk1NW9tc0VyVjdEN2JmSHNWL3Fi?=
 =?utf-8?B?akJGdXdWZkZHWkgrSUFhUHFPd2ZldS9xemhiTVBQQUx4dkhEbTdCaG56Tkty?=
 =?utf-8?B?bUJLQ040NmkzLzE1Ti85VlVXMWovYlJ3ZGVXY1ZlOUZ6dUpKQmVGZGZLSHVh?=
 =?utf-8?B?OXJXZDlIY24xY0ZCQTh1ajFzWnI1NFNpL2lEYUV3ZWlpbEYxeGwvb09NODZJ?=
 =?utf-8?B?VjMrTElHRkx4Qnk0ekl6WGtJN3FOMkZPM2J4T3ZpZ2Y1RHl0TENmZ2Q5Ulpj?=
 =?utf-8?B?MldCMlZXNzExSlNFVnlQSTlQNEdPeHd6VWFETFJxSnFzWTBhN00xVnZlaHlx?=
 =?utf-8?B?WlB1U0RaTW5MS1hxcFp0ajl1MW96ZVBxSWZYUlBnWGswaCs0eVZrWFVHd01z?=
 =?utf-8?B?Z0QyclBaU0p1SHU2eTAwV1RCUkV2VlNFMnlzekl5RHlNU3JtWnRhdz09?=
X-Exchange-RoutingPolicyChecked: est1TQoqS9/Ylztkgv2so1zmEpY4wT8b5QgAGJAw1yirxfRVlgQ5nN5635YhzocB30kWUHbDCKsTfqeqqLQ9qODWUHQ0r7qLDjx2vocfMlRnOexCB7e6bBjLp+/O1WiQvfZGb57eNd1nebVtAdJIpObzvT3yczTiajBSsY7FkZs0qQhxq2N+v8HWlaF5Cse1orJ7ynSMz6XnHtleius4ci21scocYZVNNqeoo6+ugUK+997McUyBFnNMjjx4JIf/BsKnpnOx8s/UFy8zHY5GrmsUsD3adcxvgi2pHcwkeCmwTUY6nD/ZYfWjXwph5ShHJBzEXL3tcrVA3l8B54jHrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd60e4b-e846-4b6b-536b-08df3416b75f
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB662844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:40:28.0952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CU1KkM0KtKnA5bzf1PMdPmkIWdtgZRpVQGury9R2ibaUFp5kStox2+QKkKbYSF/uj4UUmYMIWBunJ/7C4WHLLA==
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

--------------1rPYRj0uB0K3bA0VF01C8mBS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
These failures are not related to my changes, Could you please re-report?

Thanks,
Anirban

On 24-10-2026 03:02, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel: Add helper to dump GT debug state on C6 wait 
> failures (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/174646/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/index.html
>
>
>   CI Bug Log - changes from IGT_9162 -> IGTPW_16041
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_16041 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_16041, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/index.html
>
>
>     Participating hosts (40 -> 39)
>
> Missing (1): bat-dg2-13
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_16041:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@i915_selftest@live@sanitycheck:
>       o bat-arlh-2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/bat-arlh-2/igt@i915_selftest@live@sanitycheck.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/bat-arlh-2/igt@i915_selftest@live@sanitycheck.html>
>
>
>     Known issues
>
--------------1rPYRj0uB0K3bA0VF01C8mBS
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,<br>
      These failures are not related to my changes, Could you please
      re-report?</p>
    <p>Thanks,<br>
      Anirban</p>
    <div class="moz-cite-prefix">On 24-10-2026 03:02, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:179279114359.63820.13723341491836196698@221881a7231d">
      
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
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_9162 -&gt; IGTPW_16041</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_16041 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_16041, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/index.html</a></p>
      <h2>Participating hosts (40 -&gt; 39)</h2>
      <p>Missing (1): bat-dg2-13 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_16041:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@i915_selftest@live@sanitycheck:
          <ul>
            <li>bat-arlh-2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/bat-arlh-2/igt@i915_selftest@live@sanitycheck.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/bat-arlh-2/igt@i915_selftest@live@sanitycheck.html" moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
    </blockquote>
  </body>
</html>

--------------1rPYRj0uB0K3bA0VF01C8mBS--
