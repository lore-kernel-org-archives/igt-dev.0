Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4911C79F8C
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 07:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A02810EF92;
	Wed,  9 Sep 2026 07:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhDhuGHS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D182810EF91
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 07:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788940588; x=1820476588;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V4VxXvK+H5DHzl7Im9dDfLWcOx+Z4C7gEegzIg4VPwE=;
 b=nhDhuGHSOLb7zBgRtakdC6F/GbW2Ek0ManS7M0R3nmypDxZG1RhLV8Q7
 R8JPA3edklO+pP2Gnn33ogCCWc7JxpJrTYdax/tBFxXRLqjPpzEYbWJC6
 tAbd9aJPdpIyTzCSH1V5TtVoi+HVmGQs68ysJs5AFhrF43+SHcIYePXft
 fEr5p9lSHUqcaCyJm/BL/wRE0SRUrlWwFQiiTSq3oK7Ctn7pA3A8KC/p/
 qMSDThNNtLp0rRdS4gjsBzBXDKVaQ6K09YMEfTRQN2W1cNlLZrllIu8TP
 MIUDy2FfEoi7ajZP+3cEWynnspDdu6RsBWSHIl2GJoLSCv51VAJ3jxl6g A==;
X-CSE-ConnectionGUID: 2L+E5f+MTb2wEmqak5ur8w==
X-CSE-MsgGUID: +kl6IhArS++cAZa3sJ5dHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88294295"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="88294295"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 00:56:27 -0700
X-CSE-ConnectionGUID: bE6t7rNCQ96N3L1y1akPPg==
X-CSE-MsgGUID: vBHHgWQCSbeQiZseF65R+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="275025558"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 00:56:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 00:56:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 00:56:26 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 00:56:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxObN1OGZOWTHeRkATN3xFS3on4IHMmQIP5XbFtBmEOlhZJtp7yZ8weougM0d9fLhQPUT1inapPclEW2etvGTJDuk3DL//M4DmBdQ0KRHBf9kL/xi52A9FsfkgsbxEWlbhc2Yx7BWDgy3BDE4Ity4zmucZ12OcU3wSQJkgjiBrb+e9l9Mf8W5Wl3f0QiqNyXyRYNghLarLnvLG3WVbSk+C7FiECJKY2UzlEBUsr2KeNwThKxgNj4s3nYOj7/jtQS1QJxZ5LjK0sXjvIVGonIFE4JfkIuzHc0ikm5CuXx3Ap/LLlsGfBO/kL5NvQTeJ7U0mcy9NxyoFt8EFWdkOUsAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8rEVEm4PwhxW77lqiPvdv3fe83vgo4NPZXTLGHJeDw=;
 b=TdDt85rtB3XoA+xpGDOyJwS+HfXoKFMGF1S+aaEAaOnbrWL0eK/ukC12Dh1DbBRgiW14NPvKMIZQH2/4dQ0d5Gm9zdYgTqNwU4xK5+PhDbFBDAVir85wHLnYOlNG4Dw7u42otOlq10M9TTM0eGlBw23Q+ZmvaeW/TMhbbk+Ut7cUSbn0YhYIpsuYFpNHYlb6o/KD1rJthpZiOZGqnnKTXEztZISemUSzynf/eIzCwUUKJRXznn2E4l2Uss06YEl8sGj+rIiSxAGmpTrQLYv48PHJ1l4v0fy0T281sr1HfgPe7aWA/GkxqoSiUzWeRhbAKKwt3ozesv04/Q/WnYIrFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 07:56:19 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 07:56:18 +0000
Message-ID: <ecad9838-aa41-47c9-a049-7795299ecddd@intel.com>
Date: Wed, 9 Sep 2026 13:26:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 8/8] lib/igt_kms: add macros to iterate color
 pipelines and colorops
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kernel-dev@igalia.com>, Alex Hung
 <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>, John Harrison
 <John.Harrison@Igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser
 <contact@emersion.fr>, Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland
 <harry.wentland@amd.com>, Uma Shankar <uma.shankar@intel.com>, Jani Nikula
 <jani.nikula@intel.com>
References: <20260902180016.303482-1-mwen@igalia.com>
 <20260902180016.303482-9-mwen@igalia.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260902180016.303482-9-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0242.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::16) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|MW4PR11MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: b029728d-4814-447f-d19f-08df0e47d4ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|7416014|376014|1800799024|366016|4143699003|11063799006|5023799004|56012099006|3023799007|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xFGPsRlMyS9KRJ98hnpk8Fj1OLRjJ6YQ9xUYfvuJjP4p3f7dLAw7V0OhnfpwEy7wfWNGR34i4lTRs5UfSJMr0qbwwpoBSvwqmzp+j++kQN4mhw35uUDGfZqa7BBJXl2TUvJcs3EJtQxKP6jQfU3hJsI8HwDNU9q75JwbLbo9b6P0YMkMyZz123oy7KPVOYs0G7Zu656gkUa1j9iiFndWY4wt/Cmm+0KBRsmO+0/99fmMAhMKwEk3uE1CbwtkER8yAiXRRkiqadlEZo1+I6lNy+sx82+uz/QHf8sMc1MJUE7a9AadvQAot8VS6G1MXYvQxIYHKpTOvHyaFytssf+3Wm+tR7Okyj4vD0t/X5vpn4dpeMEpzgQB5X6VXmgnyc70ujLorp7Z3wJH7C6s5CM+FnCBg7ZbO1mRkj2pCGoStpuRJ6meWsMAtLviV8Sh16/zag0K8dKG+ZBgTU+fQ75lK5GvBbrKcWcO8TrDncevGn+WDs45E+Bb2AGURrQAhVzOY8Eh98Dt49uLgWUdI4DtSUub1z/mD4w5gf3sbprga9q6DGZ+DbZGmrG/ueY9OExV06Rnh89YPmedNnxdKeSV5KhhHG7k3s5Yz5GcG4GYukELSqn0EFn/y6BOMYPSdmVpGdNmR9GlydCl614SkYBNxCov2nPuyTtB05xEcBk8brY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(4143699003)(11063799006)(5023799004)(56012099006)(3023799007)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXJLNUNZeVRwaVViSldqZUQvTmJiWk96QzVMZlJJSk40YkdGUzhnMVg5ZUhZ?=
 =?utf-8?B?RFh3TndWN3pUNkEyV0poaTR6OHhQK3k3RzRZekxqbzMwU2xUQUtXeUxiUE5s?=
 =?utf-8?B?ZHF3TDQwVEdBMUxOS0E0YmhOUHRkVkorREhJUWVwT0Q1dlVBK244R3RUWjJR?=
 =?utf-8?B?WUdmVjFMWno0aTBmOGQydnNiUFRDUjJNMzk4S3d3aVBhNFk1dXc1NWgyaTIw?=
 =?utf-8?B?QlpHZnI0QlJPbk1TazlLR2JWVkNLNW5IeFhpRG1leXJRTWc3U2Z4NEtYaFVP?=
 =?utf-8?B?TzZiNXNBMHdiU3ZELzhuWEFWVmV5RUpwbTBWNXhEKzYvbVk5d0FaclBuWXl0?=
 =?utf-8?B?OGFwSWN0R3YzU2RrelZoV083cnZURWVubmFCS3FIZUlaemdaUktud3VvbDVo?=
 =?utf-8?B?SmVIQzYraU40SFZYbnUyRHAvYTFmM3RGWGQ2cHEyUm9IdXhwK0lXWXlCVTVC?=
 =?utf-8?B?c1JTZUFNVEYvVllFWFkzVE1WUjIxTnhCZGl5R29waXM1YlVCVTRyQTJHWEFM?=
 =?utf-8?B?K0VKbHB6TDk2ODdDS1dvOVlBbG5YVHQ2aEpQMmhQeG5PVFN2dWM3ZElVTGdN?=
 =?utf-8?B?V3BHa2Focjd2cVhreHNRSU92Slg5SktSL3VBT0c3ZUpCd0lPcjJXMHFVR0Fv?=
 =?utf-8?B?RzYvSjB1NitVRUIxVTdXcFk3RFhDQlF0K2F6VkZCVWNYR0ZGM0drbzdjb3BS?=
 =?utf-8?B?RTZQYjBaVHdqVTI2RVJJUTdDRXRkOWpkYTJFTDdaMFRRUk55QUtTbUVKVy9r?=
 =?utf-8?B?WkdveWViR1U0QVNuYXRobG9tSEo2QS9kUkZuVVpqT09laFVTUjBaQUt2TUUz?=
 =?utf-8?B?MHZlM3ZRU2lPWVBrclV1M1lKL0VGMHdIZGhjdVRsR1lqQnB1ei9UZHhabExO?=
 =?utf-8?B?dGpBZ0QzazRodUZNWTV0SHJ5RzVIVWNDcml0SXIxTE5FeTZNYzdDMUc2L1hP?=
 =?utf-8?B?dlhIbVBRNGRxVlByUGx5Q3o4eXQ0R0gzaTJSdnhPcHNwODQzR1lSYldiZ2Vt?=
 =?utf-8?B?L3Y0aGNycm9lZWtJcUxTTmlmeGQwWk5QZ00wcVdkaEd4eWpBMGJUVTVHRHA2?=
 =?utf-8?B?RGhHTVFRK2xoSGlZeXNIWjZhSGJId0IxVEdIWDN1bEhJVzd2MlpRWkdUMFIx?=
 =?utf-8?B?QjduNi9aRkpEYUZLa0RJTjlGc1k3alJuWUxHZDlRZmx3czNUTi9FNEhjbTRv?=
 =?utf-8?B?eVVuRVRKaE1LOTFRSzFpeHBidGJpQ2ZDUWtpN01sd3VjdmttYTROQXNYTkFM?=
 =?utf-8?B?UmtLSVhwWmM5NmQ4RUluMGRBc2R6VFN1MDllclpuNzh2K21aUm9xdnJZdHp1?=
 =?utf-8?B?bis4S2o2cUdpOWJ0ZGJXZ1RPTFhLVTVoT1N3QnllQjJtckJ3M2x1dlVEVGFk?=
 =?utf-8?B?dnhYNHBKQmpIdVVGZ1BJQzlpTkd1WHNSMC9WNWRvOUppNkNXRUlXeEEwczBo?=
 =?utf-8?B?YVA3c25yQ2gzOSt6eDd3bUYraWZraGZJeWdPV0FlZkI2cG9GLzFaVW1zZXpm?=
 =?utf-8?B?UmZNQ1FSUUhNc3NJSHFaTFh4NXdvc3lDZWM5Q2FKMno4MmM4eUJpY1NzcGYy?=
 =?utf-8?B?aWhMVUt5K0ZXaG9JdnphK0JGOCt0TWIzeXFmVit3T0JzY1BFcVNSc0NWdUo4?=
 =?utf-8?B?WVhKOE5MTHoyR2FVUGZZQjQ1L2FqT1hnUUI5VWoxdjhlVTVTK3RXZS9RZzFq?=
 =?utf-8?B?Q01KejFJRFQ5VDRTTnV6NmNaMjYyeXdKRit5WUI0ZlNOaW44SHdMNVpVWWJV?=
 =?utf-8?B?c0E2WjRobGZNdkxqMWs3OUt1WVhkT2RZdzhhbmZXT29GTi9YdkNDSk1vM2lP?=
 =?utf-8?B?QWdMQzFEbzZJaFVkNVExcUQyV1FTU1FtaUozbzFYSTd3QlJCRzVZL2N4QjM4?=
 =?utf-8?B?ZU1OdktzcVdJR3l0VElwUmJHa1N5VCt3WTF1WjZZanpaWHk5aDBqRWxFQ3hT?=
 =?utf-8?B?dm42VnZHNXpNSHRONEwweklzeWxaQURybFBzblVYS2dRZHg4ZThtVVJCVmsr?=
 =?utf-8?B?bzhzRFZYVWZSWDE5NnRVelFhZGlaTThRV3VUVVc3MXZzYWpLeGV5RFRUNDR4?=
 =?utf-8?B?T1BRNjBiVmd2eGduWDBXMjROaGRycmJCakRuM2NCWU15a0N4bXV0SGZ6eG1l?=
 =?utf-8?B?dm4ra2FYcXBTc1NKN1NVNVhSYjRkNU1lVlpJd1N4cGpxc2djWjM0SU5Qek9i?=
 =?utf-8?B?YVd1bHlRb2ZDWUhMV3ZWcGJIVTBwMldGNkg2UGZIcG5tVXpEelh2bnQwbnp2?=
 =?utf-8?B?cmsrTDVzdHpvWW40T0FIRUk4bkpMZzhOYXBTNkxnZHRvYkpxUVhsVm54cUJh?=
 =?utf-8?B?ck5PV05DNS9HNDNwV2liUmRsd2Y2RHZHSEtnTDY4bWZ4MG5NRXoybm0rVENr?=
 =?utf-8?Q?IIbaSOIETFkYG4ZM=3D?=
X-Exchange-RoutingPolicyChecked: V4OyZzVzHalpKptw3k1nqyMneLHHAp+ZnH8h1/MVlh/OsABr03s5Ucc1uVLnd6C2OJ8CaFMhcnqibaQHx0X5b/0/xBRpxgeLIxoMO3xlzt/9IYmsj1g21xviwqqZQH9l5vpYWg5BYF0cK92T0Zi82iuLGhWq2UwgydoucZoEwIPLED8cTjzxoJ3A9sSM46Op85/vRXcSJt7c6JLU5LMfrU4cDjC+OZuySr14k546RblyLeEcYGojMYjs1idR/H56kvWkfrX88uM3Mt98p+KJx+qjeP/g5gDZViO2zd+de4nmoBijb2Jkg0PNiCaUChJAB8ZQPMpLmQsxoLmEVqz02g==
X-MS-Exchange-CrossTenant-Network-Message-Id: b029728d-4814-447f-d19f-08df0e47d4ce
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 07:56:18.8558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dr8FiHjCRR5qoHU0ldp49B5ztEr60GzcbdNurDvlrD4DQ2CTRNH08y4AY2DpKEzxHkTp1fnjeCLt6/JUB2A9qFwlWu5Kpad6KVwK+z93Ghs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
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



On 9/2/2026 11:28 PM, Melissa Wen wrote:
> Walking a plane's color pipelines, and the colorop chain of a given
> pipeline, is open-coded in eight places across lib and the colorop tests.
> Add for_each_color_pipeline() to iterate over all color pipelines
> supported by a plane and for_each_colorop_in_pipeline() to iterate over
> all colorops of a pipeline.
> 
> The chain walk in igt_fill_plane_color_pipelines() now stores the next
> colorop reached by the NEXT property (which is immutable and doesn't
> change after being discovered) and, as a consequence, igt_find_colorop()
> becomes unused and is removed.

LGTM
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> 
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
> 
> v4:
> - new patch, suggested by Jani
> v5:
> - store next colorop, now igt_colorop_next and igt_find_colorop are
>    unnecessary
> - use igt_unique for macro iterator
> ---
>   lib/igt_kms.c              | 76 ++++++++++++--------------------------
>   lib/igt_kms.h              | 32 ++++++++++++++--
>   tests/kms_colorop.c        | 17 +++------
>   tests/kms_colorop_helper.c | 40 +++++++-------------
>   tests/kms_properties.c     | 17 +++------
>   5 files changed, 77 insertions(+), 105 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index cabe60a31..6329e42eb 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -794,28 +794,6 @@ igt_plane_rotations(igt_display_t *display, igt_plane_t *plane,
>   	return rotations;
>   }
>   
> -/**
> - * igt_find_colorop:
> - * @display: display on which to look for colorop.
> - * @id: DRM object id of the colorop.
> - *
> - * Returns: An igt_colorop_t if found, or NULL otherwise.
> - */
> -igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id)
> -{
> -	int i;
> -
> -	/* find corresponding igt_colorop */
> -	for (i = 0; i < display->n_colorops; ++i) {
> -		igt_colorop_t *colorop = &display->colorops[i];
> -
> -		if (colorop->id == id)
> -			return colorop;
> -	}
> -
> -	return NULL;
> -}
> -
>   /*
>    * Retrieve all the properies specified in props_name and store them into
>    * colorop->props.
> @@ -873,28 +851,34 @@ igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
>   
>   	for (i = 0; i < prop->count_enums; i++) {
>   		if (prop->enums[i].value) {
> -			igt_colorop_t *colorop = &display->colorops[display->n_colorops++];
> +			igt_colorop_t *colorop;
>   
>   			igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
> +			colorop = &display->colorops[display->n_colorops++];
>   
>   			igt_fill_colorop(display, plane, colorop, prop->enums[i].value, prop->enums[i].name);
>   			plane->color_pipelines[plane->num_color_pipelines++] = colorop;
>   
>   			/* get all NEXT colorops */
>   			colorop_id = igt_colorop_get_prop(display, colorop,
> -							IGT_COLOROP_NEXT);
> +							  IGT_COLOROP_NEXT);
>   			while (colorop_id) {
> -				colorop = &display->colorops[display->n_colorops++];
> +				igt_colorop_t *next;
> +
>   				igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
> -				igt_fill_colorop(display, plane, colorop, colorop_id, NULL);
> +				next = &display->colorops[display->n_colorops++];
> +				igt_fill_colorop(display, plane, next, colorop_id, NULL);
> +
> +				colorop->next = next;
> +				colorop = next;
> +
>   				colorop_id = igt_colorop_get_prop(display, colorop,
> -								IGT_COLOROP_NEXT);
> +								  IGT_COLOROP_NEXT);
>   			}
>   		}
>   	}
>   
>   	igt_assert(plane->num_color_pipelines < IGT_NUM_PLANE_COLOR_PIPELINES);
> -
>   }
>   
>   /*
> @@ -3810,13 +3794,14 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_crtc_t *crtc,
>    * Add colorop properties
>    */
>   static void
> -igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_crtc_t *crtc,
> +igt_atomic_prepare_colorop_commit(igt_colorop_t *color_pipeline, igt_crtc_t *crtc,
>   				  drmModeAtomicReq *req)
>   {
>   	igt_display_t *display = crtc->display;
> -	int i, next_val;
> +	igt_colorop_t *colorop;
> +	int i;
>   
> -	while (colorop) {
> +	for_each_colorop_in_pipeline(color_pipeline, colorop) {
>   		LOG(display,
>   		    "populating colorop data: %s.%d\n",
>   		    igt_crtc_name(crtc),
> @@ -3838,11 +3823,6 @@ igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_crtc_t *crtc,
>   							colorop->props[i],
>   							colorop->values[i]));
>   		}
> -
> -		/* get next colorop */
> -		next_val = igt_colorop_get_prop(display, colorop,
> -						IGT_COLOROP_NEXT);
> -		colorop = igt_find_colorop(display, next_val);
>   	}
>   }
>   
> @@ -4415,18 +4395,16 @@ bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
>    */
>   bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
>   {
> -	int i;
> -	bool found = false;
> +	igt_colorop_t *color_pipeline;
>   
> -	for (i = 0; i < plane->num_color_pipelines; i++) {
> -		if (plane->color_pipelines[i] == colorop) {
> -			found = true;
> -			break;
> -		}
> +	for_each_color_pipeline(plane, color_pipeline) {
> +		if (color_pipeline == colorop)
> +			return true;
>   	}
>   
> -	return found;
> +	return false;
>   }
> +
>   /**
>    * igt_plane_set_color_pipeline:
>    * @plane: Target plane.
> @@ -4932,15 +4910,9 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
>   				 * so already-committed property values aren't re-emitted on
>   				 * the next commit.
>   				 */
> -				colorop = plane->assigned_color_pipeline;
> -				while (colorop) {
> -					uint32_t next_val;
> -
> +				for_each_colorop_in_pipeline(plane->assigned_color_pipeline,
> +							     colorop)
>   					colorop->changed = 0;
> -					next_val = igt_colorop_get_prop(display, colorop,
> -									IGT_COLOROP_NEXT);
> -					colorop = igt_find_colorop(display, next_val);
> -				}
>   
>   				fd = plane->values[IGT_PLANE_IN_FENCE_FD];
>   				if (fd != -1)
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 23615dd91..0187ad9a1 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -415,17 +415,18 @@ static inline bool igt_rotation_90_or_270(igt_rotation_t rotation)
>   }
>   
>   typedef struct _igt_plane igt_plane_t;
> +typedef struct _igt_colorop igt_colorop_t;
>   
> -typedef struct {
> +typedef struct _igt_colorop {
>   	uint32_t id;
>   	igt_plane_t *plane;
> +	igt_colorop_t *next;
>   
>   	char name[DRM_PROP_NAME_LEN];
>   
>   	uint64_t changed;
>   	uint32_t props[IGT_NUM_COLOROP_PROPS];
>   	uint64_t values[IGT_NUM_COLOROP_PROPS];
> -
>   } igt_colorop_t;
>   
>   struct igt_format_mods {
> @@ -1027,6 +1028,31 @@ uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, en
>   		igt_colorop_set_prop_changed(colorop, prop); \
>   	} while (0)
>   
> +/**
> + * for_each_color_pipeline:
> + * @plane: plane to which the color pipelines belong
> + * @color_pipeline: the color pipeline to iterate
> + *
> + * Iterates through all color pipelines supported by @plane. If no color
> + * pipeline is supported, nothing happens.
> + */
> +#define for_each_color_pipeline(plane, color_pipeline) \
> +	for (int igt_unique(__i) = 0; \
> +	     igt_unique(__i) < (plane)->num_color_pipelines && \
> +	     ((color_pipeline) = (plane)->color_pipelines[igt_unique(__i)], true); \
> +	     igt_unique(__i)++)
> +
> +/**
> + * for_each_colorop_in_pipeline:
> + * @pipeline: the first colorop in a color pipeline
> + * @colorop: the colorop to iterate
> + *
> + * Iterates through a color pipeline, starting from an initial colorop pointer
> + * and extending to all subsequent colorops pointed to by next.
> + */
> +#define for_each_colorop_in_pipeline(pipeline, colorop) \
> +	for ((colorop) = (pipeline); (colorop); \
> +	     (colorop) = (colorop)->next)
>   
>   extern bool igt_colorop_has_prop_enum_value(igt_colorop_t *colorop,
>   					    enum igt_atomic_colorop_properties prop,
> @@ -1380,8 +1406,6 @@ uint64_t igt_get_writeback_fb_id(igt_output_t *output);
>   void igt_detach_crtc(igt_display_t *display, igt_output_t *output);
>   void igt_get_and_wait_out_fence(igt_output_t *output);
>   
> -igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
> -
>   bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
>   				   int drm_mode);
>   int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 2bee1eecd..1585c0ae2 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -365,10 +365,8 @@ static void colorop_plane_test(igt_display_t *display,
>   static void check_plane_colorop_ids(igt_display_t *display)
>   {
>   	igt_plane_t *plane;
> -	int colorop_idx;
> -	igt_colorop_t *next;
> +	igt_colorop_t *colorop, *color_pipeline;
>   	igt_crtc_t *crtc;
> -	int prop_val = 0;
>   
>   	/* Use hash tables to track drm_planes and unique IDs */
>   	GHashTable *plane_set = g_hash_table_new(g_direct_hash, g_direct_equal);
> @@ -383,18 +381,15 @@ static void check_plane_colorop_ids(igt_display_t *display)
>   
>   			g_hash_table_add(plane_set, GINT_TO_POINTER(plane->drm_plane->plane_id));
>   
> -			for (colorop_idx = 0; colorop_idx < plane->num_color_pipelines; colorop_idx++) {
> -				next = plane->color_pipelines[colorop_idx];
> -				while (next) {
> +			for_each_color_pipeline(plane, color_pipeline) {
> +				for_each_colorop_in_pipeline(color_pipeline, colorop) {
>   					/* Check if the ID already exists in the set */
> -					if (g_hash_table_contains(id_set, GINT_TO_POINTER(next->id))) {
> +					if (g_hash_table_contains(id_set, GINT_TO_POINTER(colorop->id))) {
>   						igt_fail_on_f(true, "Duplicate colorop ID %u found on plane %d\n",
> -						next->id, plane->drm_plane->plane_id);
> +						colorop->id, plane->drm_plane->plane_id);
>   					}
>   
> -					g_hash_table_add(id_set, GINT_TO_POINTER(next->id));
> -					prop_val = igt_colorop_get_prop(display, next, IGT_COLOROP_NEXT);
> -					next = igt_find_colorop(display, prop_val);
> +					g_hash_table_add(id_set, GINT_TO_POINTER(colorop->id));
>   				}
>   			}
>   		}
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index a109c1b06..34b0f4901 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -278,29 +278,25 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
>    * colorops[] to it.
>    */
>   static bool map_to_pipeline(igt_display_t *display,
> -			    igt_colorop_t *colorop,
> +			    igt_colorop_t *color_pipeline,
>   			    kms_colorop_t *colorops[])
>   {
> -	igt_colorop_t *next = colorop;
> +	igt_colorop_t *colorop;
>   	kms_colorop_t *current_op;
>   	int i = 0;
> -	int prop_val = 0;
>   
>   	current_op = colorops[i];
>   	i++;
>   	igt_require(current_op);
>   
> -	while (next) {
> -		if (can_use_colorop(display, next, current_op)) {
> -			current_op->colorop = next;
> +	for_each_colorop_in_pipeline(color_pipeline, colorop) {
> +		if (can_use_colorop(display, colorop, current_op)) {
> +			current_op->colorop = colorop;
>   			current_op = colorops[i];
>   			i++;
>   			if (!current_op)
>   				break;
>   		}
> -		prop_val = igt_colorop_get_prop(display, next,
> -						IGT_COLOROP_NEXT);
> -		next = igt_find_colorop(display, prop_val);
>   	}
>   
>   	if (current_op) {
> @@ -320,18 +316,16 @@ igt_colorop_t *get_color_pipeline(igt_display_t *display,
>   			          igt_plane_t *plane,
>   				  kms_colorop_t *colorops[])
>   {
> -	igt_colorop_t *colorop = NULL;
> -	int i;
> +	igt_colorop_t *color_pipeline;
>   
>   	/* go through all color pipelines */
> -	for (i = 0; i < plane->num_color_pipelines; ++i) {
> -		if (map_to_pipeline(display, plane->color_pipelines[i], colorops)) {
> -			colorop = plane->color_pipelines[i];
> -			break;
> +	for_each_color_pipeline(plane, color_pipeline) {
> +		if (map_to_pipeline(display, color_pipeline, colorops)) {
> +			return color_pipeline;
>   		}
>   	}
>   
> -	return colorop;
> +	return NULL;
>   }
>   
>   static void fill_custom_1dlut(igt_display_t *display, kms_colorop_t *colorop)
> @@ -426,8 +420,7 @@ void set_color_pipeline(igt_display_t *display,
>   			kms_colorop_t *colorops[],
>   			igt_colorop_t *color_pipeline)
>   {
> -	igt_colorop_t *next;
> -	int prop_val = 0;
> +	igt_colorop_t *colorop;
>   	int i;
>   
>   	igt_plane_set_color_pipeline(plane, color_pipeline);
> @@ -436,17 +429,12 @@ void set_color_pipeline(igt_display_t *display,
>   		set_colorop(display, colorops[i]);
>   
>   	/* set unused ops in pipeline to bypass */
> -	next = color_pipeline;
>   	i = 0;
> -	while (next) {
> -		if (!colorops[i] || colorops[i]->colorop != next)
> -			igt_colorop_set_prop_value(next, IGT_COLOROP_BYPASS, 1);
> +	for_each_colorop_in_pipeline(color_pipeline, colorop) {
> +		if (!colorops[i] || colorops[i]->colorop != colorop)
> +			igt_colorop_set_prop_value(colorop, IGT_COLOROP_BYPASS, 1);
>   		else
>   			i++;
> -
> -		prop_val = igt_colorop_get_prop(display, next,
> -						IGT_COLOROP_NEXT);
> -		next = igt_find_colorop(display, prop_val);
>   	}
>   }
>   
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 76aadd162..ba07d68d6 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -239,9 +239,7 @@ static void run_colorop_property_tests(igt_display_t *display,
>   {
>   	struct igt_fb fb, afb;
>   	igt_plane_t *plane;
> -	igt_colorop_t *colorop;
> -	int i;
> -	int colorop_id = 0;
> +	igt_colorop_t *colorop, *color_pipeline;
>   
>   	prepare_crtc(display, crtc, output,
>   		     &fb);
> @@ -268,23 +266,18 @@ static void run_colorop_property_tests(igt_display_t *display,
>   		}
>   
>   		/* iterate over all color pipelines on plane */
> -		for (i = 0; i < plane->num_color_pipelines; ++i) {
> -			/* iterate over all colorops in pipeline*/
> -			colorop = plane->color_pipelines[i];
> -			igt_plane_set_color_pipeline(plane, colorop);
> +		for_each_color_pipeline(plane, color_pipeline) {
> +			igt_plane_set_color_pipeline(plane, color_pipeline);
>   			igt_display_commit2(display, COMMIT_ATOMIC);
>   
> -			while (colorop) {
> +			/* iterate over all colorops in pipeline*/
> +			for_each_colorop_in_pipeline(color_pipeline, colorop) {
>   				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
>   					  igt_crtc_name(crtc), plane->index,
>   					  colorop->id,
>   					  kmstest_plane_type_name(plane->type), output->name);
>   				test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id,
>   						atomic, display->has_plane_color_pipeline);
> -
> -				colorop_id = igt_colorop_get_prop(display, colorop,
> -								IGT_COLOROP_NEXT);
> -				colorop = igt_find_colorop(display, colorop_id);
>   			}
>   		}
>   

