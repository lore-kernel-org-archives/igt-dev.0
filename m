Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA9606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 04:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=miWiJ7Fd;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BthJvmaE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B261110E289;
	Fri, 27 Nov 2026 04:55:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE8F10E289
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 04:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795755214; x=1827291214;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ViAboP64d0PAE6SEC4jXYjJhlvDUZDU3kU8kPJrc01E=;
 b=miWiJ7Fd8G+m2bk54Boq8XlqCHBflhQLG8s4fYUN+hmongEyiPw+ah8r
 aFtUSM8bR5j7ncgVLa4rr9G9ifDhGR8b3ML03UZXbq19je/Y3rBCWOJQq
 pLa1kMum9lxGjykOWFJ+yVfxIjk83z5Eom3MaZdzHeFmMMBcmCO0VAXOj
 ZWPHA0pL9pyxL/l5ZG5q7Fc1WlOsgFwlV8IHQ71gJlVWwQw5p04QNfUe+
 /4Wofpm6eO4wCbn0i1issb7Cgcisin9vnluPy0t9MJSu7FTrYpgXUwVi5
 SMCAgkH+BVcqcdUSa4sBenmZ0ZEuxV8Xx3GM8GSAeEhaJbquew3afv4jm w==;
X-CSE-ConnectionGUID: 9DbKa2YNSbixTmwW2rzS+A==
X-CSE-MsgGUID: LdXL+BaJT1+V2HlQXxYbWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4572208"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4572208"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 20:53:33 -0800
X-CSE-ConnectionGUID: +M6j5tftTl+a2RJSd2lw2g==
X-CSE-MsgGUID: ueR6DlycStWSUcwFBxgapg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12310638"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 20:53:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 20:53:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 20:53:33 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 20:53:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWoZXOS+Ve/bITBkC5H+7L8F8AEYBOgm3ugc0oWUrsCMhaiBjRfQrSDHIgmdKbQpnwfjLsp9gaGSNt8R/DqzLmX0heyzehpCdFtw8RTHKGoLo5fGuidIirH6W/9zWi7DMNkJlbnSBqwwjncC/9gFWQ2tgilgpsm9ApP7W/v8YxP2wY9FYfSJ6pU+DBbnL6+RR0ihsfinytVasRbTlv05HMP0bckQEt/8lJv8PHBFPNMY4e2HECoeI42voJoMqTcQGPcjlmdL6rqd3meOPHUoYX7bZ551ttS5xKmPy9rPP0drITEm5/qZxKYLqH8+C3mT+oCUi8fyt0J5nvAvxbl3og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2jfzB1LC3k0ZWfJvvxe3pImwI5tH3rOQ5b3ncONuRQ=;
 b=UG0rY0x1kFPAholGJA8u9jP82u7oMcJg+EtrwyqUB8cIssL05SG5Sh6pJByYVuF17bUZifuZA5Ar/IBubWI57jXPXAR4NLTIU3AxhnA6AS5Drjwe/V+cpckOTf50OfEzh+AIL/AKffGEJYhsU6/LtDFGNwGqCaJ4zq3wRvW0UgE64CYdsl6RJ2IVK0Y+ZfmtN8WpPmKzYfD19QOGSjZ7plWVDnuJOUy7hdug/sG8R3s2ggSYka8w8KkLO8IjOUfCSLHCdOEgcL2X1ywq8DmCyERrNOTtHYUPZQDMqbXMoqy7uI1ELMw4jbOiYkmx36FIbs/mf8rskR/UulYBTvfPaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2jfzB1LC3k0ZWfJvvxe3pImwI5tH3rOQ5b3ncONuRQ=;
 b=BthJvmaEPPR9eYm29OpSx/KsxFDfdjUn6lpE7jkA8Fp+k3TaKnjQx4TlUIH8LwJ59e1pp67CzObNEiGoP1nYxyShAxP7dqWqw8pHQqtE8PNmiHV6l+wpomM9XIRk68nv6XM5Zry7C5/993nBogNs0Lo/5mMbtZw7+Lit+fFL86Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB569431.namprd11.prod.outlook.com
 (2603:10b6:806:53f::5) by CH3PR11MB7275.namprd11.prod.outlook.com
 (2603:10b6:610:14c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 04:53:30 +0000
Received: from SA3PR11MB569431.namprd11.prod.outlook.com
 ([fe80::36f0:fe31:ac43:ae77]) by SA3PR11MB569431.namprd11.prod.outlook.com
 ([fe80::36f0:fe31:ac43:ae77%2]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 04:53:30 +0000
Message-ID: <2dc418a7-84e7-4719-8bdc-7e60b7d04e4c@intel.com>
Date: Fri, 27 Nov 2026 10:23:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel-ci: Unblock
 compute-threadgroup-preempt on CRI
To: Himanshu Girotra <himanshu.girotra@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ramadevi.gandi@intel.com>, <zbigniew.kempczynski@intel.com>
References: <20261127044504.4119774-1-himanshu.girotra@intel.com>
 <20261127044504.4119774-3-himanshu.girotra@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20261127044504.4119774-3-himanshu.girotra@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0231.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::18) To SA3PR11MB569431.namprd11.prod.outlook.com
 (2603:10b6:806:53f::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB569431:EE_|CH3PR11MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 96c5c053-586d-4b42-c3ed-08df4c426214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|4143699003|6133799003|22082099003|18002099003|11063799006|10067099003|56012099006|261102123227099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: wBVFRZOYcTJd5UTDuWNdUviid7iuod7prXkFjcXiOt2ZJd6O+v6OB/JNmytX0lxo+jkOMSsNCIg0M8yLcWrXVWamPD0nSAMgjAqrAsvd7pmzv6H3cm6METdSsNKZoGhwrjaDYmvdggzuPWbpwPQ6E6DZ3UgzcpOGbVUzoofbcmlWojL9D8RcgXy2y/ZM/8vOtAABOR0QijSWOmiWuDJ5JPyAgTLFBdUjbnGR3lyaFV9xC6mGd+iqmiM9sc6YSZMtloK9HCBm0XEiT8DYEISxn5klbqyzz+4t81Xd4n9wFuxpHMswXsPkucxtlFZuCdp5JeOsnoKlWn/xqZyU9Y5JkUcQ9B+oeyPonL/fIj65oU3g4cNDHcE+Uncev8HRNqGsZpVgYw2RYoQlxVWdGWAZppjU7ninOs9FUNnf5qbE60Bh+OY8+U+fLQiolKxeWWcaQbHAqjibzc98nMZz84ADsx9MRwbKkPaP8GrAJRzk5U0G42+IYiDscgQ3PZXTGBVx1za09GRYnPQi7kJ9RIB6qv+XdDVyu7zmHpUtCs/3RBkY6bCdQ98l2L5wUGF8Yqe50qaIKjT7xp3vis0jdnsMUlqWkgR9Noqp+KJIqEUrMT76CdiBFJMl++eG/oX5KyfdznTnVNkfPA+2p11MeexhN5PXKyHYfhTTP7fqxj7hcC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB569431.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(4143699003)(6133799003)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0NoTTBMelg4Z3M2d0g4SXlLZFBxanFzZERlb2x4dDRIWFp5Nm9xTS9GZDNa?=
 =?utf-8?B?aEd0VGF2QmVrcWlUS2ptaEROYmtsRTBBZzJEazNxdmc5Ly85aFRqclhweG5I?=
 =?utf-8?B?WE5OaVdPdy9RanRsazh6RXBIbDcwWnlySS9yZjZvdlVrcTRFRHdRWTZWTHA3?=
 =?utf-8?B?U3k1SEhFT1JGU1hFY3ovRzhaaGREUm85Uy85VE1yZFJTcTNpckNleEp5bThV?=
 =?utf-8?B?KytMY1REbUthT3ZrQ2ZpSE8zc3ZGZU9vdnB3TU9QZXJDWmJlRFVnYm5UUnYz?=
 =?utf-8?B?NEFGcVBXQjFJc1Y4YmtjYmNRSy9nczRYL3lBelBYLytHc3dKRFY1NjNTdWEx?=
 =?utf-8?B?TUxtaDhhNXA5WWIrd2sxV3JmU0xVT1MvdDdvQTNvdFBsT2ZDS21EQ2pBNDNJ?=
 =?utf-8?B?SWhxYVlZS1hlL2U1eUFqUUFhYWZlYWRnNFk1bUZ2NXErYk1KZjBMY2MxNVdK?=
 =?utf-8?B?RVkyRlNtRjkwUEdhdHZPWjQxS2tHL3Z1ZUNWRFl1RFIrLytuZjBYS2lCK2Nq?=
 =?utf-8?B?TTg1ZW5ZNWlpVzlxa3AvemsxL0RwbEZEcDVZakoyZURTSTV4ME55d3htV3pB?=
 =?utf-8?B?cW9qN0RqdzQ1L2Y5WXNrMTFIcDFjNHU2QWZSMi9BenlRdGM1dDlmdjlvQjBQ?=
 =?utf-8?B?QWlXa1pIUkJVZlg4WXdSU0xlNlJzVlA4VzVKRXdXcDJFeWEzN2lRbTlBNnZn?=
 =?utf-8?B?OWhqbGkycXVsZGJlZWNnYVhSa1cvdWFnQ21ENUxpTkFqak1qL0E3c3ZGekk0?=
 =?utf-8?B?aW1IWHhzWEMrM0lwbmFMNGdkbGVoN2pjMzJBYUppU1B3OWdSakpLOE42YWsv?=
 =?utf-8?B?ZjhXWVF1R0VlRjF5a2dKMGJKMHozSUNtZkJ5cE5Senl2eTVPTlFMZGJabk9k?=
 =?utf-8?B?SlY5QXh6WStOank5SFB5cTFNS1NCYjZSNXV6MXFNS05UZGsyM2FJSHNNQStv?=
 =?utf-8?B?ZXFBbTdpV3ZIUk9MMFJpQ0h6bkdqT2dCNVVkTWdxaTFNRWFHY3ZPYklvWkFn?=
 =?utf-8?B?YnVWOXllMGJaYk9HdHpIWSt4d1dZYmVtTnZCbUJLL0NYZjd2RGFXQ1VaYzhE?=
 =?utf-8?B?ditrMXdXTllBamhnUFAyNTN0NnNmSElGZ0VQaW9Xa2J4bXRIV2J0cnM3N25E?=
 =?utf-8?B?OERkenFzRy9wd1h3d2dXVTA2dkphMHZwVDRRK28zdjY4OG1jS2NoNXg2aTVX?=
 =?utf-8?B?WHpKdk9SL0s0bHprNHNNUlFnRHYxZG4zN2hqVWVHeHJ4MGo3Z2VDdWd1NEdq?=
 =?utf-8?B?clZ1RDVVL0kzd2NnYTN5ckxpWlhCN0xBQnNUem00WWlrczcrN1BmVzlCR0Nt?=
 =?utf-8?B?MUNMTlpsTFU2d2Ezb0xpMmlCOW1DOWpzaFIyYUUvMXFKcFlweTJNTC90Rmly?=
 =?utf-8?B?ZUtEMHVyUUlUZUR5UlBiWmM0MlJiNE9oRmtJbGl2WEFaVzlVSXJ6dWFUcDBQ?=
 =?utf-8?B?VEhiOERadWp3blJTNk81bFRpelE4MXBmNHgydkZYRGwwUGQzVllnMFY5VkNC?=
 =?utf-8?B?ZDc5YjFBcHVXYXQyQWFhdzZkNWlzUVJlcGJvVDVYWkVscHBRRDVMUkZrdHIx?=
 =?utf-8?B?bURBcEtjMUx3ckt0YURsbmtQRDkrTWlZcEpuaDdCY3FDRXdyQWxudFFFa3lZ?=
 =?utf-8?B?MDdya01PSGxybjVENGFTUnc5bHJPbEZrM1Z6MUYzK21raXEwUGw1Tldwcmlw?=
 =?utf-8?B?MlcxakZnVWRRaUx6TGZiRUxXMm9zZkJGVkFOQUxzRUp4a3Y3T1FhTm5GMlF0?=
 =?utf-8?B?QTJiamZYSTh1YXc2QmRMa0JveFpUQXVjdkJlS2tzUWJFZUVBY0Q2djVLOEc0?=
 =?utf-8?B?QnQwVkVEY3R5cGVDNDJIbVFTaFVHV3hndEwxMXNNWTFDQ3BjaFpXMWdPYzVn?=
 =?utf-8?B?aVZKRzFqbmV4MmVxN0lMaHdZYjRoUTNJMHllUys0eXNXMDJhSTZRaEYvNG9G?=
 =?utf-8?B?bzE2ODNob21GcjIybC9VTjZtbExPTndsa3JBU1RlVm5DNmU4Mkd0ZFg1UXkx?=
 =?utf-8?B?dW1sMDJBOGRFeCs4WkNWeFlFRDVOR1E2STV2aURsSkE3Tm8zcnVNamVPNHJL?=
 =?utf-8?B?MHlKTlBONkpLblYwSHR6Ym55M3NKVUlDcVhMNGVwbWZ0Q2RSM3dDQkVwVmxp?=
 =?utf-8?B?Ymx0TXI1K1dsVTNaempUYkZHMHNQYzdwZ2tQYkFEQ1FPUW5Xd0NHQXhPcCta?=
 =?utf-8?B?WFovQkVWdjVwYW02NE5Uc1NaaGZyNDNsRHVTWUdLQlBpZWpLSWdidDZoaUlD?=
 =?utf-8?B?a2FGMUMvcmxhaVhUdjlkNDVHMWJpRStCUkxvbFpWKzlCUndyUVRLdG9pWFpF?=
 =?utf-8?B?ZVYvR01WZkFEdmZnL1g5aEgxdUc5NURGMWcraHlWcHFDUWRXaENRdz09?=
X-Exchange-RoutingPolicyChecked: H9aI2YcP/rAiVJjXi9On3gSA8yCbWDHiNQ8NTeCsPHekidCA8JpS9smXHaGibyle6Izzs/jm0jOZgAuRjMyrOJJVg7wdFcG6SW4C5cxDa3LGWCKxT5430FQQgKguYvyLBfjKe3DaJnop2qhQmO6JKfOz891Bl4I01nm9omWTwLLLLODqnXwPq0HmbvxkmLqmA7Me0OgKcmIUAeLQDT9fOFZkI4v81PEGEN5H9KLQ0nrIsf85wkWsMMImV3LkLSUhtxe296ktSpTwGXioeOeHi8MX0KVR1m82UxKv9/gR6w9dfu5hY5QMuwjKPtn1Y9guWc6w0xCKAQlTshdT9Vm+6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c5c053-586d-4b42-c3ed-08df4c426214
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB569431.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 04:53:30.7498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k61Fj2Lb6SV+robNXZ9ooTB3sKfhAOJ5gDHuyQkeuwfyjS68mv3ndv8Blju0zk6chxBqYkMzPPbB7htaaiOK+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7275
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


On 11/27/2026 10:15 AM, Himanshu Girotra wrote:
> Thread group preemption is now advertised for CRI (35.11), so drop
> xe_compute_preempt@compute-threadgroup-preempt from the CRI core
> blocklist.
>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>   tests/intel-ci/xe.cri.core.blocklist.txt | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
> index 6b77523d6..d1d786d2c 100644
> --- a/tests/intel-ci/xe.cri.core.blocklist.txt
> +++ b/tests/intel-ci/xe.cri.core.blocklist.txt
> @@ -42,10 +42,6 @@ igt@xe_evict_ccs@.*
>   igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads
>   igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-(single|multi)-vma
>   ##################################################################
> -# Valid skip: Threadgroup-preemption not supported on CRI
> -##################################################################
> -igt@xe_compute_preempt@compute-threadgroup-preempt
> -##################################################################
>   # Valid skip: Tests requiring multiple CCS (Compute Command
>   # Streamers) engines — CRI exposes only a single CCS engine.
>   ##################################################################

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

