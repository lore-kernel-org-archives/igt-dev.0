Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7A4CD5BD0
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 11:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDBC10E7EA;
	Thu, 13 Nov 2025 11:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fD8OhnBD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEC310E7EA
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 11:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763034540; x=1794570540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RBbSbZSW0uQFCzzmOtg3ruG1C25WoR/rb0eMPhmBzCA=;
 b=fD8OhnBDggidXSu+yw5Yct4Asn/dqCN0BFqW1296TW6cq12JBbkS0pTq
 4rl/VP0DV2PdzcIiUuLGGDTLLYM5nUgXPFCl/VAkIUK5j3S0tS3iHwchH
 ZMYrph3BuCtrwdNcLiAMNa11lViYCmeG4YcLMERklotk8xKH9/CCHxjwg
 FtURvnwm8+6gWQgRxpA5cAfMjCS3jyPHsXlkbxMrhevw75aX+aNJKwd9L
 okk4GyY8smmVBZ5EvWS4eyPKyuTYAd6Q2fTID9vIG+oKX4dM0YgfqMq44
 n6GNhZi6ZlRirm06ubyAW4hz1SkcakMXRJ8KJSzwZn+iH13aNii10Dff4 A==;
X-CSE-ConnectionGUID: JBnwEj72T8SjnvIXZ4A1Pw==
X-CSE-MsgGUID: ILwZsQHSQVylNzsbJemAIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64819487"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64819487"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:48:59 -0800
X-CSE-ConnectionGUID: I+ykOUD9Tai+G9tEcHUq5Q==
X-CSE-MsgGUID: ZWhNyfk4T86Ijr/WNvqK1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="193733054"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 03:49:00 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:49:00 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 03:49:00 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 03:48:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSJRsqLlPbyaDmWG65aeNVHzj/OZtK+GRGaa8z3ZdLW2/UBVwT+crEtzn8P9YkF2tlvNu7Cq69xO+CfY84DjifLsWBJVIQnJElZ/Nmvz0KB24DA0eJ0f3tC7gm7b1LS2xXOqrXo9qyOhhMJ/L/2yVNU1VLdwKb9NqJ+lmdf9jOEqCdpYu9tzsnXleQH1pc/BLnqGqVAGeDLVopnZWAosD55OKOWs4jPSUpnGFFE+Olnbr5znd9vaquo4+z1PW7ee0FTZsMdYy10QBUUHWGYt2acRuzJCjF6p550Kgn/xMiKcu/ganWXyFV22jGlPaPcDsyRqJvFsm/Oq7FqWKN79ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3EXzcdYuZ3pbgFsh8Rl8kV5kxIkZly0LYlJekOgnS0=;
 b=RvATwyLzI/qj6iExWAO5GFVOEHvGvM/ulUijkeYflA4DCa3UHVigGo5h58R9latqEPh5IsfMP1CEBE1s4CBcF4A5wv1JiVr2bS9rWe/AVdrXRphc0sHp9Cvcbu957EPw5EI+Wqr1GVv1aHkz7Wwu65eWSDepujbdO6STLDJO2z/+VJV1eG8GqoB/K5XfyqV8faUFYCpci41Fg15w2fvtuOHnjTOKfWGNfLl3MW6wmtvUuPziWWStWUxz9KkamT9sDJoLP2cTXHp7dfNODSeZydjVJLyAflclmoZOwe7cSwGJxeT7C68hk1aj4+5frBCzgZCmhikMOs8BSxJb5AqIPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 11:48:44 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 11:48:44 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Peter
 Senna Tschudin" <peter.senna@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH v1 1/5] lib/igt_dir: Allow scanning only the current directory
Date: Thu, 13 Nov 2025 12:46:11 +0100
Message-ID: <20251113114615.3736269-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
References: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0025.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: afeb09d5-92a9-492e-8632-08de22aa9920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wlp2aGp2YzJEbTQ3dUVReUFDSWs5dUFwMnVyR3l5VkFwVXdmNVZ1aEVXSmFm?=
 =?utf-8?B?UDBROEg0MFJXWjRuM3NRaUNhRHJ5TkZhUjJpakpaRW1SSjlhWHJBWEFiT081?=
 =?utf-8?B?MkFkck80VndDWS9abHJkS1FCR29PS2xKWXB4WWhpTERvN3hJcTQ5QjdLekp3?=
 =?utf-8?B?L0VJYWc0NHhyTkNuZC9TaXMwREpkMTB3cFl0ZWRPWm5jWGVXWlFDSElPdjlr?=
 =?utf-8?B?ZlF3THd6d3V0cTZNSkdZRXoyUGFNL0FaUFVSL0FnNE5oTDJMSVhYU2FVWEdG?=
 =?utf-8?B?YjRJdDBqbUtpVVdDVlJ3WE4vaWJLOU9na1dsYkNLMlFKVnJ4Wjg0MFJYT0tl?=
 =?utf-8?B?N1dEL0NaWUNSZlpJc1JaZHJzRE03amNLdXg1ajRHSWJIc3ZTZ2p0TUhNWDV2?=
 =?utf-8?B?NG9xQW1GVVlob2NEdUQ2OC9QNFNwSHdXTXhaWm9GYkgxcm8reXA2ajNnZ2J3?=
 =?utf-8?B?eldqdHUzUHdYT1NPM1ZYWnNyZTVVaWNZcjVWeGVqSGN1bXZ5TCs3ZUFLbzVu?=
 =?utf-8?B?RGdtQU9FUnBrK0lkOVpqamtvNDRPbzlkYUk1ZjZkUDZ3T1Z6RWdRUTkzNmxM?=
 =?utf-8?B?TDhYNmpiU0VJSlVzUnI0WDNRNVlqUlBrR3RFNDluanhDT0tJRTl1OEMrMStC?=
 =?utf-8?B?aHVQelN5b1JTTXprK2RxMVVGbHZiNXNkRlRaQ0k1elN2QmFFVC9uamFkYUNS?=
 =?utf-8?B?TlQ0WnZzR0VCd2FWY3JBVHZiVVhQeGxFYUFld1hBenlJK0ozN3pVOGh5L0p2?=
 =?utf-8?B?OHg3MDdCU2NFWGlneHh5dzR4dUltSUdvNGl5RU0rcW1WQVp3NWxQbSs5SEgv?=
 =?utf-8?B?ZTIyd3NVdUNIZy85Wks5MUExVWhJSmZXZXN0bWwyUzBMa2lVSVNrcUI1UlBH?=
 =?utf-8?B?MmtHL2NRdWEzVWlldkFnUXhLUE05ZzhHY0xYaG5LQXN3ZmthTjBKY3pYWk1q?=
 =?utf-8?B?UDJjcjg5aU9RS2FkSWNYNElBNEJsNGpNZ2RxREp5RDV5MW1nMkM3dXprR0RT?=
 =?utf-8?B?NHBITDkvNk5nbGoxTVNMVnpuZGxJbGFOV21mWW5KWkQ4RnRJTm5aRGZlU0Q4?=
 =?utf-8?B?clJiUXhXWmdGeEZENVhYOTJUdkJ0V2lRUFcvSXc2ckJtVEpRb29mVmNGYzYz?=
 =?utf-8?B?WUtYSFNhK0hzSUtSQ1hZUmxXMDV0Q2lCTUkxbTJQR05TbmdUdzNBRCsxdXJV?=
 =?utf-8?B?aUdYa2U0dkNiRS9YbWVxaWJHTTVkc0liSlppQk9PbGF2Y3kxZUFvcGU3Y1Ur?=
 =?utf-8?B?TUJyNWlFZUNGU1ZKM2RQaWhSY2NlaVZHcjBvbTY2YlZOVkl3WHBQZytKVExn?=
 =?utf-8?B?ZUh0dDlrem9wcmFxMFFoQ2VUR2tBbDA1TmVINmNDTDBIMVBUb0lSeVJxcklZ?=
 =?utf-8?B?NWxmb0dPOVdjbkdGcjZRdVZJN0JPYkFWa2cvYVRJQWNiTnpSRkVxMFhDY2Vs?=
 =?utf-8?B?YzZzYnErR3NvY1FURVRCYXlnQ3hwaGhDVUFUMm5ta1UzcTVLWDlvOHJ6WU5O?=
 =?utf-8?B?bXV5V1VQaEZiUE9UK1hoMGkyY0xkb0E1ZitCcWE5WlJ2cTFwQXdtM3R3a1lZ?=
 =?utf-8?B?eUZkMUVMVjNDa3prTVpDWGJ3QnBGbGlQbXlaMzNxREEyYlhPcXBGUnpPK25H?=
 =?utf-8?B?anZ6UXdycXhBZm0zclgxa1BxbCtPOEZPblRUQmVqbTlkYklYVXFySzdUSHI3?=
 =?utf-8?B?eVFqb2hQK25JdVJiNzZ3b01vUng3VjNXMVZZM1pNL0NDNVA1NW1WVENPWjZI?=
 =?utf-8?B?b28rRHF0by82QkIyYzBMN0pYRnVZbHJQaXV6OFhGTXorbnBTWjN6WU03ZkNZ?=
 =?utf-8?B?dzdmNW92RXV0dGhKNjJKcGlaZkhCM2NIWk9lcmp2ZnQ1dFpQa1dwekpRMktm?=
 =?utf-8?B?RUpsZ0J3ajcrejVURk44NkRmYlVEVlo4dWN4ZHArZHVPVndzc2ZrNGd0Sk1o?=
 =?utf-8?Q?flzmdJwM4OayvEqgk6e5jtn+ynWP6Sdx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVVTYzJSS1d5TDFIWHMydS9OYlB5TnB0MFoxbGMyNStFTU91azdoQjhDU0pl?=
 =?utf-8?B?UU9KR3BBRWZSc2N5MzRCTzZhejliQlZrY1BuZVZiaGFsOXZMeWV6R08wU2ZB?=
 =?utf-8?B?VlJtR2lrSHM5cmVCNTFvZEZmZ0t1U3pwOGY2MDhYdDhRNFNVL21VS0FjUlE3?=
 =?utf-8?B?K2RwT1ZZRFVSWFlCOE4ycDV3SGliS3ltK2o2ODFsVVFIcitmZ0NmUDdpMFhB?=
 =?utf-8?B?VkVUZlZvRUp5YWoyVVg4d3YwWGFvckxRSThINStpd2Q1ZnUwRlZPUWw4YU52?=
 =?utf-8?B?c0V1czd2RElIUWIwNEh1KzdVR3ZlT1BKaVVYVFBTSmhoaHd1bTQ5Z0ZXbHRM?=
 =?utf-8?B?ZVVHRGFCYVZ4M2dWcjJraldwSEtCTzVrVWRVaEtxVS9XdlZuQlJjUm9ZbkdK?=
 =?utf-8?B?aUpEbitwbkZHMVJPb01PM0lXVXE5bm1QSEN5Q1RVNEU3Vk1BKzlSNUVoMzli?=
 =?utf-8?B?YXdjM2x0clFmTnFRZG1jODBmN0grYThjNGJGbDJuSDdVd3lDUWFhR2FYRnFL?=
 =?utf-8?B?Ymd2OGxJL0Z5VnZNRzRMcm42TG1uQ2Rnellub09JbDBHWUxPeUpKTERRUHcy?=
 =?utf-8?B?eXlVWU1VbUYzaU1ZajVzYmowdlhWVm8xdlcvZU5BZUpFVVVOU2pNemQzeFVV?=
 =?utf-8?B?M2JZZElkeVoyYlQ4Ym5FY2dza25XekhNN05MZGJ5LzVVZ05uVCt5NzVUT3dl?=
 =?utf-8?B?UUtaWWRqWms3a2hCcWlQa0N2WnVhNnNSTHduUUh5S0F5c3ZJSTl3bHhvY0h3?=
 =?utf-8?B?WUlOMUNzNFVrMjFxUUhwWjNSSXFCOWs5Zi9BejlQWExRaHI5Y2E0RVVqdjlH?=
 =?utf-8?B?d21LK1Z3YzZuRDR4WC9IbENDWmR1TWJZRXBGRTRlL1c1YnB1QVVDdE1pcjNz?=
 =?utf-8?B?cDJDMXZFaGJrekxJdkxBNGFOanlVZERiL0U1bm9XZU14M2VmN2FsTGJkSGtW?=
 =?utf-8?B?UWppRVhSYTl2bkNvS2M2dnBVRVd0TjhrUTcvLy9OUExxcDZSOC9HaTc3WUt0?=
 =?utf-8?B?cEFWSVFPRmhyeHFzNkFWU3VCQURjblJ5Q0lUajdMM3JERktwRWtLSlNXbmhi?=
 =?utf-8?B?VTNlRzRCM25mNW13MGFHaVNHL2M2Sm53eE9JOWJoVTNRNnVlR3RtbWRuOVIz?=
 =?utf-8?B?dFVJaXlHRU1XbmZLdHNOakpRYW5iRC9wa2VCZG80dzNnc1hTelRrZGMrYVNE?=
 =?utf-8?B?UlRFM0ZURW02a2pSWC9MVGI4cG1ZY0wyM2dRaWJNMEFlb2JzM0FZWEI4ZVNw?=
 =?utf-8?B?R3FWU25CVklGYVhVaW9WbGd5UnNTTEtCdTRNZGUxemVkekU5MGdvclVtNlhl?=
 =?utf-8?B?d3Q2emJvUGtsOE9SN1J4enJvWXV4YnZlekdkK1k2WDBjWTVJS2x0L3JQdEps?=
 =?utf-8?B?Y2F0K3pFcVBmbTFxN3FJUGVuYlpTSU85UENsWUtJV09tTkRyOWlsOXdaZXgr?=
 =?utf-8?B?cGhTakE0NHVEeVAwS1ZHOXdrOWVEKzIyM1VBRGwrd3NMWHhaMVZoaERnY3cw?=
 =?utf-8?B?cklUZ21YWldTZzBURGw4N05DTUpGRUN3T0hPRGpLejQxZllMT2tmMC9zNzRT?=
 =?utf-8?B?alQ1czdXa3lmZm1hbnNEc0twbDY1VW5uY3psanRIbit5V3pjME5zeHJjdmYw?=
 =?utf-8?B?Ym9MWFY3UTlUblNSbm96Wm9jTlFXNUVxaWlMdXZ2MUVrOU5xeTNEK05qVVdl?=
 =?utf-8?B?Ykl1bGk4OWdzUWlqY1FHOUxhdnZhQ1VaSmFvSlh0SnA1UTJuL3hMa081U3hD?=
 =?utf-8?B?VVJzOTUwU2pnSGpKcDRkWlFFUTM4ME12b0pPeW1kcURvUHM3QXlOSHMxUTYr?=
 =?utf-8?B?Vks3dDdYT0JWSm5JZkhMU0ZjVlcwZzd5c2pVa0RnelQwRHRRaUVwWXhVcWpL?=
 =?utf-8?B?TmZIYjY5MHlKRmtZNnE3RHRCbzA1dThoZEk3cnVZMS9SZ05GbTlrdGRqNFhw?=
 =?utf-8?B?NC92bVZKVDFObEZRNmJjK0NnRE16TDBGeGdkNjZSWDJFQkxoZFR0bFB4YzJU?=
 =?utf-8?B?WjZuWFFjSEFYZHIrbVdZa25VZjMxVkw0YmZPc0kzUmtuVUY4Q0xTZW1Ea05B?=
 =?utf-8?B?T3lvaHB5bW9ES3NLODVUWmJkTmJjZVg4SVZnL0hiWVFCYXZEUy9aRDlzT2tC?=
 =?utf-8?B?ekxNL1RjMkgySTFiMFhyR0MwV1gxVnVxR1hIUktIZ3RsMVl3d3Y5eHNCUEM1?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afeb09d5-92a9-492e-8632-08de22aa9920
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 11:48:44.5506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/A39yOHKuLk2XTATz+/y8eYCF06yj16Or7mS6A9FZVT+lK6Ix69Bqc5zfgSZurfce05QSd6/YTtdUxZOgKCbkOBoTpx8CSY4VbFTb3sVq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
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

The check rejecting scan_maxdepth == 0 prevented callers from
scanning only the current directory without descending into subdirectories.
Let's remov this restriction to enable using scan_maxdepth = 0 as a valid
mode to list entries in the top-level directory only.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_dir.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/igt_dir.c b/lib/igt_dir.c
index e232dbda9c..6ef8e859a4 100644
--- a/lib/igt_dir.c
+++ b/lib/igt_dir.c
@@ -241,7 +241,6 @@ int igt_dir_scan_dirfd(igt_dir_t *config, int scan_maxdepth)
 	igt_require(config->root_path);
 	igt_require(config->dirfd >= 0);
 	igt_require(scan_maxdepth >= -1);
-	igt_require(scan_maxdepth != 0);
 
 	/* If the linked list is not empty, clean it first */
 	if (!igt_list_empty(&config->file_list_head)) {
-- 
2.34.1

