Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78F6CA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 11:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE6E10E21A;
	Thu,  1 Oct 2026 11:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIXaposq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD0510E21A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 11:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790853256; x=1822389256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NdzNdfB9Ert9yp1kjkEH8ZQJdJ0pIwVTyKWUG5qWqOI=;
 b=YIXaposq+NBmFJpr2yiHXsx0MPkcHPcaT570CYBgxJuntZ8cZ2BuOvEZ
 1/FPvyWAkLa4RAeThpLvoMs52ANQ2BO4sPT0hzF0tcgLmdJzXzzk2K30C
 ob4ydXGW1PySTKFVsOe9KK3yjzMXTHoQ0KGFQ2KKUmTS7zama7lZJ37V3
 N5uad2B8k1+K/hqDYHfIvB26vuYqnV9PGlsE43yStipr6K+CBc1pX66p7
 W/tr7/onf2eUt8KrCqL8S8hnRDDlRJL5433qQ6a5ZNGAUsh69Vg0kF5uf
 IAcawVODSen1Qa+W00yZGlaIL565cPGVFkaOvImFJAjgKZ2FweWditOBM w==;
X-CSE-ConnectionGUID: gLqg/CWpTReUnu2DFv74nQ==
X-CSE-MsgGUID: Y+VM+RxDTxyO/ctBeKVw1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="94318730"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="94318730"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:15 -0700
X-CSE-ConnectionGUID: c2Yvk56xT3qBnbscP3M/NQ==
X-CSE-MsgGUID: t1EGFyHCRGC7xYZerRywYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279742989"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:14:12 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpYQkAbmjimSHet0ULqZ6I9l3G/D7BXzG5awceRbpu0Ed8n4DNFAb8W/5UOWWfFwxtcUqjVrpLY+0YHwFCnN+BFCGlb934dxLvGCqTXN7KQa2MB3qDNZDb1s/doUgycJw61OcO6M3lgni/ii72JI4/LJTlR2oa/xiaWpNXtHsrYcyloPeA2qj7iw/83LIAnNIIPMk30ksTcECh25yF1MtblJIJ3cok6xZ5UDYsRUEMRiLV7UM7jS8hKmWZjKjCYRuzJ2Av5XaJxjigEU0D5KUa3Wkn66Bx08Bbk6JZGUgOUZ63CtFsNJHGBHf8GGQauQMd4YQ3L59fREuXrUP4vTig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFJ7GyW007Kz8fbcIIXLNHc4IIT6iNy17PFArEIc2VY=;
 b=df+g/hSCu0CXGQOfzhPldolTDd7iDrM8JoqsaGHIovV4I/+qqfGtCUeHtKewlLNr82cmIYWAY/+6Y2P/ElWuRepYPNMq4BvN+0Q1FGivWZpnYJI0t3L1TtzE7Qh2Czop9fMXhqeNEeMklRqrSq2cwaRvI6y/VPzBt2kmy7ZA1QkjGCU4y67esrkflyMYIuV8dwQ+tynvlMFBSt84lJn9sazVrSt/Dzg7HiFfM5280G4gPKF4mgFMkrKbf3ZBGKqmBwNChJcunLspBDgs9h3FVugPGDzpmmcOurwqNxZbkK9zZLSB294PjHuiD2+SDHJB9bXuJG5CbJaMV0QGE9vOag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 11:14:10 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 11:14:10 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 4/8] tools/gputop/i915_gputop: add i915 PMU engine
 monitoring
Date: Thu, 1 Oct 2026 13:13:57 +0200
Message-ID: <08d2be1618ac8a0c19d4b5b37da37903f86b26f8.1790853076.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790853076.git.sebastian.brzezinka@intel.com>
References: <cover.1790853076.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fff5027-4b3c-4441-b033-08df1fad1d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rSBzdRm9gYnQa2VVNuYNw5Z16Qo6kFJokI1qRvomVGkAr2aI5hJ5hz/uDU0u9a6PAjMft7zeN1W7hHX7ZCDydZTs1W5kjTJJBCYdeLtFDyFf8kD/zgQkqkBQU7hm+ZaGN1DBmu4MyS2yCglM7JWornkcrcQ3PSmTVzI+gTWbBSBuGvoTnUnQKj37Gera//A1jO8f0Gs7I4jxNX4tug7TqS2LotFd30pYtfG/VIf+JURRLjV9ilf0OePJpzR/ptuDtY7pL2YqDav+q2SjogFkRXYTWffB7wKuvGikAeakLZKKg+999D5cx5QDoM0TrO2p7Qxf6PeASGmlrFNRsZbRNexBjrcMbpwcPihukcNWhmhvDwrv2ev04wSxtmjUmRNvV1LJlsDFwUFQbzIacYrKQEgL1EYhvHj+7KZpmxynCUhhC06CD/z6EHowU91M0GJAizvmrC3knkrZgmQcSG5PZMN+NHrfr6fWmsFlJyxn9BnrNv6Hbe3bpIFkXzFyYFDZMxwK2zvtg+rrcaDU0Q7sojqyItsboMfLXYyWuE6YLgyTGQvKRxF/EMNNA639ONki2YG3ScYNz8yppak0OUthd5ixozFVv1M6zs0DoeCqS8kWMhouB7qo+7wQPkEdgmBJlIN8Q1R0RYHciBHQy2CsquznE6BQwId1FUn1rNnU0DQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVVNM25ncERVVUI4ZW9lNVVaSTVMbWdBZVUvbFRKa1RtS1ZrTTBaVk42T3VS?=
 =?utf-8?B?cUZRTW1HUzcxazhiWEs5TDRBQ3dhVWYxbVFUbVNFbkR0d3Fja3ZiTDQrenRs?=
 =?utf-8?B?TFRkMEFIMmRTTTFBSStFQWMySkVjZjJsVkprTmpWNHA0aFZVU3JDWmFvVHJl?=
 =?utf-8?B?ZExML2daeWd3ZHdJY3Q1TUVKcVFDUWdHTVU5RG5tbWxGT1ZiZmVNNG94YXNy?=
 =?utf-8?B?djhOR1hIY2dHVUx4d0hnTUlXaXdGbTBkem83bjVONzNOcTJSYThsYkRUZHdy?=
 =?utf-8?B?STV6d29zc0U0VkJJSWFvRkhBb3gwK1cvSjdCb1JSU0x5UkkrOG9QY0lINi9t?=
 =?utf-8?B?aVlaenZJazByL2M0SVUyeDFTTXphUFFRQ2NhM1ZpNWp4UHVJSUpNS0xPVnJu?=
 =?utf-8?B?VFBieHZodU9xWnN4MHJWWjNYb0ViTG5Mdmh2Zm1WSjdzKzFueEpOVGtDeHFq?=
 =?utf-8?B?UVNrcjN4ckFRSzVPbks2aG9kR1RMZjhvRXBha1E2RnF2bU1Oa3ZaUjFoWFBl?=
 =?utf-8?B?aHZ1ODY5cVdTS1VXbXFQRkd5YWpPRUhaUzQ4ZVNDZEk0NmdDWTlYTXNkS0Zv?=
 =?utf-8?B?ek8vWkVMQ29CRzVtM1RjTDdNUEV1SnJ4Ym9HNDFrU3drVVc3WWp0Y05JZ3ow?=
 =?utf-8?B?aURqbmtVOFJ2YktmbllpeklENldRNW9ZbGZXMlQ3Zm9YUjdqV0hDeFdPS3Nk?=
 =?utf-8?B?dG42SEZ2VDhTOUoreWNGVFpsT2ZJZEZua3pLMlM2dHNGbSs0SER5V05Wc3B6?=
 =?utf-8?B?Mld4Nkw0OGEzUUJPUjl1WFRDZkI4KzNNOFpSU3NualYvUE4yYW5QRnUwV2Q4?=
 =?utf-8?B?RW4xeGFwRnl1TTNudS8yczgyeDFUQ1JRZzZGeU90Ynkzc2dmNTJzTklpYks5?=
 =?utf-8?B?THpMUC9DeEhaOHBwbWsxdWJ2Y3hHUER4VUh3Z3VJcklJVmVycTVBQjh6d1pG?=
 =?utf-8?B?MVM2MER4TjJ2Mjk3S25hNWxLNGVIMGpZcDhTQ2JGUHhGNHRxcDExSEdOS0Jp?=
 =?utf-8?B?bHRiZktFenVzQTZVRkNjdDdXaDRlS2NwMnlnWGVwRWVUQnFIRmViamt6L0ZH?=
 =?utf-8?B?OGFkQmdNWVl6aUR1OHA3Z25LUEZlbSt0TTBZaGl1UDd0cXpabjRSc21mbnhJ?=
 =?utf-8?B?Q0VBWUNiUHpGeldqaXdXdHZ2eWxrYlZGN3YzQ3BmZmhvVWV6S0ZWckd2ZFc2?=
 =?utf-8?B?WUVUUlJ4dHRXVGhhc3FVV052L0FnWExEaU03aHQzT3NQbDlTNWh5bkgxeE9j?=
 =?utf-8?B?c28rSkJvYVBTK3Y2Rm5PeFhJZHBmVk5odEd2S1dPYmQ1cWFCZFVXWVF1QmZR?=
 =?utf-8?B?eXhxaG92alNEL0tzMUFLTzFPYm1KN0IwZXBQU0VhZXk2b1lBSFMxSDBWRUc1?=
 =?utf-8?B?NXNLNVFuUlRtVDhPTXdmV2VZZGNqMllKYkRXdDk5T0huZXlSYTl3SkVYNi8x?=
 =?utf-8?B?bEVreC9FUUp6cEpuemFDNDhCU3ROYUFjWHFSWVZYd0pESHFOOHBXNVljNFVI?=
 =?utf-8?B?V3B4elB1SlpVQjBjK2J2WEhJRHZYQWtRMEVsWUJ2SjBOK1BlcnVmUGVwcnNV?=
 =?utf-8?B?Y3YweWYvWHloUXZhR0FCWFZSTkd0aXVXRkpRYWc4VDkvZ1dvWDBjS3FiNytn?=
 =?utf-8?B?M0JETFNCL2JCanRSa0ZYUHVPRmJVd0JFMjFOc1N5TmpsRU40dTlUQUoyVWNw?=
 =?utf-8?B?UHQ5MnZYU01aYTNySmVxZC9HN2p0T2xkWjlQcHY4UGpNTXRhOWNpaisxbkc3?=
 =?utf-8?B?M0VlT3BlWEhZWUJRdWZpVVl1bEx3TndjWUsyZmUrbkJjb2JsOTlXWTl2U1Fr?=
 =?utf-8?B?WmlRamJ6VDIwK2NGMHBkYWdYTlhhaWxPRWh1a2pzK0plTXp1U0RxQ1FjMER2?=
 =?utf-8?B?b0Z1d0ZBVXFudHFtak8xQmZjNzdwZFIvU2cwTVRydTMybGp6ZGtDM1NUdmtK?=
 =?utf-8?B?KzFqZk5KVEg4dUVHeElwSEthSU11V3YyeFR5MlhHWHo1QkY1K2d4ckxNQUU4?=
 =?utf-8?B?T0FPR3dGVlBXUUEyTlNyY0V0cXVjQ0Q3LzI4MkhncTJkTmNwKzhMNWU3ZVhR?=
 =?utf-8?B?ZitaeXMwN1pDVjdYb1Rsb3kvdnRjWDFpcHBsRlJCcHZDdzVNVVZIZTkxZ1RR?=
 =?utf-8?B?eU1IeE9BT1VqaDBxT1BoMEdTVXdybHIzeTBPallBb3V5MU0wVHh1d2MrRDgz?=
 =?utf-8?B?a3dUL0xVeXNHdkhud2t1TmdGUGJJVXh1UHZnS3E3TnZWMFJyTWcrckpyVUZm?=
 =?utf-8?B?Szc1dmJFWDY2R2tDL3NZQ0lmUUd0VGdSZGRSN2lIRlNrNW5hTnhvSm1MOGto?=
 =?utf-8?B?bjEreWh4ZWtTNEZ6V0RRcm82Qis3QW1rWFZNOHNzT2xnejI2TnQyYURFNjh2?=
 =?utf-8?Q?kY9oZTjly2R2Cqs0=3D?=
X-Exchange-RoutingPolicyChecked: 5MOPdFJvjmeckb6XcmbAgPH1qCS1XXUKJn+B2WQbg15k2kU9caF+z6FcZkwqPIX1eBD6vnWSdS5sa1G2cphyn49sIbqT1oRsQ2tFXJYJHrNP4fSPc8YDPvxY7uwvjdurwzOvLs/njCFwLvUl9SFVrYUMeMVK8wprnOphlcUJlw+ixX0y1JGVi1kR36E9TzNC3obgK8TO84Za91YoiVe8DGLMbfugoD5JvHUdZwTn22EvPbkHvJlaRrir4P3e2SRvlCl/9jH3SNniVOcZwDoZhe1KOHXUQ+Gx8dCqxQUWCzKYjcG8D+m7weDBIwxuRi6cPWdp7MCbqjCrICOjRjyWyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fff5027-4b3c-4441-b033-08df1fad1d8c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 11:14:10.3259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2g73wfdDGD4UVsxXSQonhT2qTorvAwrzAc/oNEiIS2cwPnh7AwMKIg+NtV64VnqdMSL4VSwRHizNeYy6DIFwKbqBbm8zAk01FsTW9j6/DbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
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

Add an i915 backend for gputop's PMU-based engine monitoring,
implementing the device_operations interface from utils.h.

i915_populate_engines() opens the render node (no DRM master needed),
scans /sys/bus/event_source/devices/<dev>/events/ for "*-busy" entries,
and decodes engine class/instance from the PMU config value.

i915_pmu_init() opens a perf event group via igt_perf_open_group()
(requires CAP_PERFMON or root) and cleans up FDs on partial failure.

i915_pmu_sample() reads all counters atomically from the group leader
fd into a heap-allocated buffer, and tracks read success explicitly
so a failed/short read leaves counters and timestamps unchanged
instead of using garbage.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/gputop/i915_gputop.c | 474 +++++++++++++++++++++++++++++++++++++
 tools/gputop/i915_gputop.h |  56 +++++
 2 files changed, 530 insertions(+)
 create mode 100644 tools/gputop/i915_gputop.c
 create mode 100644 tools/gputop/i915_gputop.h

diff --git a/tools/gputop/i915_gputop.c b/tools/gputop/i915_gputop.c
new file mode 100644
index 000000000..a8b37df39
--- /dev/null
+++ b/tools/gputop/i915_gputop.c
@@ -0,0 +1,474 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "drm-uapi/i915_drm.h"
+#include "i915_gputop.h"
+#include "igt_aux.h"
+
+/* Minimum chars before the "-busy" suffix (e.g. "rcs0") */
+#define MIN_ENGINE_PREFIX_LEN 4
+
+#define engine_ptr(pmu_device, n) (&(pmu_device)->engine[(n)])
+
+static void __update_sample(struct i915_pmu_counter *counter, uint64_t val)
+{
+	counter->val.prev = counter->val.cur;
+	counter->val.cur = val;
+}
+
+static void update_sample(struct i915_pmu_counter *counter, uint64_t *val)
+{
+	if (counter->present)
+		__update_sample(counter, val[counter->idx]);
+}
+
+static const char *class_display_name(unsigned int class)
+{
+	switch (class) {
+	case I915_ENGINE_CLASS_RENDER:
+		return "Render/3D";
+	case I915_ENGINE_CLASS_COPY:
+		return "Blitter";
+	case I915_ENGINE_CLASS_VIDEO:
+		return "Video";
+	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
+		return "VideoEnhance";
+	case I915_ENGINE_CLASS_COMPUTE:
+		return "Compute";
+	default:
+		return "[unknown]";
+	}
+}
+
+static int engine_cmp(const void *__a, const void *__b)
+{
+	const struct i915_engine *a = (const struct i915_engine *)__a;
+	const struct i915_engine *b = (const struct i915_engine *)__b;
+
+	if (a->class != b->class)
+		return a->class - b->class;
+	return a->instance - b->instance;
+}
+
+void i915_gputop_init(void *ptr, int index, struct igt_device_card *card)
+{
+	struct i915_gputop *obj = ((struct i915_gputop *)ptr) + index;
+
+	obj->card = card;
+}
+
+/*
+ * Read a single uint64 value from a sysfs file relative to a directory fd.
+ * Returns the value on success, or (uint64_t)-1 on failure.
+ */
+static uint64_t read_sysfs_u64(int dirfd, const char *name)
+{
+	char buf[64];
+	uint64_t val;
+	ssize_t n;
+	int fd;
+
+	fd = openat(dirfd, name, O_RDONLY);
+	if (fd < 0)
+		return (uint64_t)-1;
+
+	n = read(fd, buf, sizeof(buf) - 1);
+	close(fd);
+	if (n <= 0)
+		return (uint64_t)-1;
+
+	buf[n] = '\0';
+
+	/* i915 PMU event files contain e.g. "config=0x1000" */
+	if (sscanf(buf, "config=0x%" SCNx64, &val) != 1 &&
+	    sscanf(buf, "event=0x%" SCNx64, &val) != 1 &&
+	    sscanf(buf, "0x%" SCNx64, &val) != 1 &&
+	    sscanf(buf, "%" SCNu64, &val) != 1)
+		return (uint64_t)-1;
+
+	return val;
+}
+
+void *i915_populate_engines(const void *obj, int index)
+{
+	struct i915_gputop *ptr = ((struct i915_gputop *)obj) + index;
+	struct igt_device_card *card = ptr->card;
+	struct i915_pmu_device *engines = NULL;
+	char sysfs_path[PATH_MAX];
+	char device[80];
+	struct dirent *dent;
+	DIR *d;
+	int render_fd = -1;
+	int ret = 0;
+
+	if (!card || (!strlen(card->render) && !strlen(card->card)))
+		return NULL;
+
+	/*
+	 * Open render node to determine i915 PMU device name.
+	 * Render nodes do not require DRM master privileges.
+	 */
+	if (strlen(card->render))
+		render_fd = igt_open_render(card);
+	else
+		render_fd = igt_open_card(card);
+
+	if (render_fd < 0) {
+		fprintf(stderr, "i915: Failed to open device: %s\n",
+			strerror(errno));
+		return NULL;
+	}
+
+	i915_perf_device(render_fd, device, sizeof(device));
+	close(render_fd);
+
+	snprintf(sysfs_path, sizeof(sysfs_path),
+		 "/sys/bus/event_source/devices/%s/events", device);
+
+	d = opendir(sysfs_path);
+	if (!d) {
+		fprintf(stderr, "i915: Cannot open %s: %s\n",
+			sysfs_path, strerror(errno));
+		return NULL;
+	}
+
+	engines = malloc(sizeof(struct i915_pmu_device));
+	if (!engines) {
+		closedir(d);
+		return NULL;
+	}
+	memset(engines, 0, sizeof(*engines));
+	engines->device = strdup(device);
+	engines->fd = -1;
+
+	/* Scan for engine-busy events: entries named like "rcs0-busy" */
+	while ((dent = readdir(d)) != NULL) {
+		const char *endswith = "-busy";
+		const size_t endlen = strlen(endswith);
+		struct i915_pmu_device *engines_tmp;
+		struct i915_engine *engine;
+		uint64_t config;
+		char namebuf[256];
+		size_t namelen;
+
+		if (dent->d_type != DT_REG && dent->d_type != DT_UNKNOWN)
+			continue;
+
+		namelen = strlen(dent->d_name);
+		if (namelen < endlen + MIN_ENGINE_PREFIX_LEN)
+			continue;
+		if (strcmp(&dent->d_name[namelen - endlen], endswith))
+			continue;
+
+		if (strstr(dent->d_name, ".scale") ||
+		    strstr(dent->d_name, ".unit"))
+			continue;
+
+		config = read_sysfs_u64(dirfd(d), dent->d_name);
+		if (config == (uint64_t)-1)
+			continue;
+
+		/* Only accept engine (non-other) configs */
+		if (config >= __I915_PMU_OTHER(0))
+			continue;
+
+		engines_tmp = realloc(engines,
+				      sizeof(struct i915_pmu_device) +
+				      (engines->num_engines + 1) *
+				      sizeof(struct i915_engine));
+		if (!engines_tmp) {
+			ret = errno;
+			break;
+		}
+		engines = engines_tmp;
+
+		engine = engine_ptr(engines, engines->num_engines);
+		memset(engine, 0, sizeof(*engine));
+
+		/* Strip "-busy" suffix to get engine name */
+		strncpy(namebuf, dent->d_name, namelen - endlen);
+		namebuf[namelen - endlen] = '\0';
+		engine->name = strdup(namebuf);
+		if (!engine->name) {
+			ret = errno;
+			break;
+		}
+
+		engine->busy.config = config;
+		engine->class = (config & (__I915_PMU_OTHER(0) - 1)) >>
+				I915_PMU_CLASS_SHIFT;
+		engine->instance = (config >> I915_PMU_SAMPLE_BITS) &
+				   ((1 << I915_PMU_SAMPLE_INSTANCE_BITS) - 1);
+
+		ret = asprintf(&engine->display_name, "%s/%u",
+			       class_display_name(engine->class),
+			       engine->instance);
+		if (ret <= 0) {
+			ret = errno;
+			free((void *)engine->name);
+			break;
+		}
+		ret = 0;
+
+		engines->num_engines++;
+	}
+
+	closedir(d);
+
+	if (ret) {
+		errno = ret;
+		goto err;
+	}
+
+	if (!engines->num_engines) {
+		fprintf(stderr, "i915: No engines found for device '%s'\n",
+			device);
+		goto err;
+	}
+
+	qsort(engine_ptr(engines, 0), engines->num_engines,
+	      sizeof(struct i915_engine), engine_cmp);
+
+	ptr->pmu_device_obj = engines;
+	return engines;
+
+err:
+	for (unsigned int i = 0; i < engines->num_engines; i++) {
+		struct i915_engine *engine = engine_ptr(engines, i);
+
+		free((void *)engine->name);
+		free(engine->display_name);
+	}
+	free(engines->device);
+	free(engines);
+	return NULL;
+}
+
+static int _open_pmu(uint64_t type, unsigned int *cnt,
+		     struct i915_pmu_counter *pmu, int *fd)
+{
+	int fd__ = igt_perf_open_group(type, pmu->config, *fd);
+
+	if (fd__ >= 0) {
+		if (*fd == -1)
+			*fd = fd__;
+		pmu->present = true;
+		pmu->idx = (*cnt)++;
+		pmu->fd = fd__;
+	}
+
+	return fd__;
+}
+
+int i915_pmu_init(const void *obj, int index)
+{
+	struct i915_gputop *ptr = ((struct i915_gputop *)obj) + index;
+	struct i915_pmu_device *engines = ptr->pmu_device_obj;
+	uint64_t type;
+
+	type = igt_perf_type_id(engines->device);
+	engines->fd = -1;
+	engines->num_counters = 0;
+
+	for (unsigned int i = 0; i < engines->num_engines; i++) {
+		struct i915_engine *engine = engine_ptr(engines, i);
+
+		if (_open_pmu(type, &engines->num_counters, &engine->busy,
+			      &engines->fd) < 0) {
+			/* Close FDs opened in earlier iterations */
+			for (unsigned int j = 0; j < i; j++) {
+				struct i915_engine *prev = engine_ptr(engines, j);
+
+				if (prev->busy.present) {
+					close(prev->busy.fd);
+					prev->busy.present = false;
+				}
+			}
+			engines->fd = -1;
+			engines->num_counters = 0;
+			return -1;
+		}
+
+		engine->num_counters++;
+	}
+
+	return 0;
+}
+
+static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
+{
+	const size_t buf_size = (2 + num) * sizeof(uint64_t);
+	uint64_t *buf;
+	uint64_t ts = 0;
+	ssize_t len;
+
+	buf = malloc(buf_size);
+	if (!buf)
+		return 0;
+
+	memset(buf, 0, buf_size);
+	len = read(fd, buf, buf_size);
+	if (len != (ssize_t)buf_size) {
+		fprintf(stderr, "i915: PMU read error: expected %zu bytes, got %zd\n",
+			buf_size, len);
+		free(buf);
+		return 0;
+	}
+
+	for (unsigned int i = 0; i < num; i++)
+		val[i] = buf[2 + i];
+
+	ts = buf[1];
+	free(buf);
+	return ts;
+}
+
+void i915_pmu_sample(const void *obj, int index)
+{
+	struct i915_gputop *ptr = ((struct i915_gputop *)obj) + index;
+	struct i915_pmu_device *engines = ptr->pmu_device_obj;
+	const unsigned int num_val = engines->num_counters;
+	uint64_t *val;
+
+	val = calloc(num_val, sizeof(*val));
+	if (!val)
+		return;
+
+	engines->ts.prev = engines->ts.cur;
+	engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
+
+	for (unsigned int i = 0; i < engines->num_engines; i++) {
+		struct i915_engine *engine = engine_ptr(engines, i);
+
+		update_sample(&engine->busy, val);
+	}
+
+	free(val);
+}
+
+void i915_clean_up(void *obj, int len)
+{
+	struct i915_gputop *gputop_dev = (struct i915_gputop *)obj;
+
+	for (int i = 0; i < len; i++) {
+		if (gputop_dev[i].card)
+			free(gputop_dev[i].card);
+
+		if (!gputop_dev[i].pmu_device_obj)
+			continue;
+
+		for (unsigned int j = 0;
+		     j < gputop_dev[i].pmu_device_obj->num_engines; j++) {
+			struct i915_engine *eng =
+				engine_ptr(gputop_dev[i].pmu_device_obj, j);
+
+			free((void *)eng->name);
+			free(eng->display_name);
+
+			if (eng->busy.present)
+				close(eng->busy.fd);
+		}
+
+		free(gputop_dev[i].pmu_device_obj->device);
+		free(gputop_dev[i].pmu_device_obj);
+	}
+}
+
+static double pmu_busy_percentage(struct i915_engine *engine,
+				  uint64_t elapsed_ns)
+{
+	double busy_ns;
+	double percentage;
+
+	if (!elapsed_ns)
+		return 0.0;
+
+	busy_ns = engine->busy.val.cur - engine->busy.val.prev;
+	percentage = busy_ns * 100.0 / elapsed_ns;
+
+	return clamp(percentage, 0., 100.);
+}
+
+static int
+print_device_description(const void *obj, int lines, int w, int h)
+{
+	const struct i915_gputop *gputop = (const struct i915_gputop *)obj;
+	char *desc;
+	int len;
+
+	len = asprintf(&desc, "DRIVER: %s || BDF: %s",
+		       gputop->card->driver,
+		       gputop->card->pci_slot_name);
+
+	printf(ANSI_HEADER "%s%*s" ANSI_RESET "\n",
+	       desc, (int)(w - len), " ");
+	free(desc);
+
+	return ++lines;
+}
+
+static int
+print_engines_header(struct i915_pmu_device *engines, int lines,
+		     int con_w, int con_h)
+{
+	const char *a;
+
+	for (unsigned int i = 0;
+	     i < engines->num_engines && lines < con_h;
+	     i++) {
+		if (!engine_ptr(engines, i)->num_counters)
+			continue;
+
+		a = "            ENGINES   ACTIVITY  ";
+		printf(ANSI_HEADER "%s%*s" ANSI_RESET "\n",
+		       a, (int)(con_w - (int)strlen(a)), " ");
+		lines++;
+		break;
+	}
+
+	return lines;
+}
+
+static int
+print_engine(struct i915_pmu_device *engines, unsigned int i,
+	     uint64_t elapsed_ns, int lines, int con_w, int con_h)
+{
+	struct i915_engine *engine = engine_ptr(engines, i);
+	double percentage = pmu_busy_percentage(engine, elapsed_ns);
+
+	printf("%*s", (int)strlen("            ENGINES"), engine->display_name);
+	print_percentage_bar(percentage,
+			     con_w - (int)strlen("            ENGINES"));
+	printf("\n");
+
+	return ++lines;
+}
+
+int i915_print_engines(const void *obj, int index, int lines, int w, int h)
+{
+	struct i915_gputop *ptr = ((struct i915_gputop *)obj) + index;
+	struct i915_pmu_device *show = ptr->pmu_device_obj;
+	uint64_t elapsed_ns = show->ts.cur - show->ts.prev;
+
+	lines = print_device_description(ptr, lines, w, h);
+	lines = print_engines_header(show, lines, w, h);
+
+	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
+		lines = print_engine(show, i, elapsed_ns, lines, w, h);
+
+	lines = print_engines_footer(lines, w, h);
+
+	return lines;
+}
diff --git a/tools/gputop/i915_gputop.h b/tools/gputop/i915_gputop.h
new file mode 100644
index 000000000..65684f040
--- /dev/null
+++ b/tools/gputop/i915_gputop.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef __I915_GPUTOP_H__
+#define __I915_GPUTOP_H__
+
+#include "igt_device_scan.h"
+#include "igt_perf.h"
+#include "utils.h"
+
+struct i915_pmu_pair {
+	uint64_t cur;
+	uint64_t prev;
+};
+
+struct i915_pmu_counter {
+	uint64_t config;
+	unsigned int idx;
+	struct i915_pmu_pair val;
+	int fd;
+	bool present;
+};
+
+struct i915_engine {
+	const char *name;
+	char *display_name;
+	unsigned int class;
+	unsigned int instance;
+	unsigned int num_counters;
+	struct i915_pmu_counter busy;
+};
+
+struct i915_pmu_device {
+	unsigned int num_engines;
+	unsigned int num_counters;
+	int fd;
+	char *device;
+	struct i915_pmu_pair ts; /* group timestamps from pmu_read_multi */
+	struct i915_engine engine[]; /* grown via realloc */
+};
+
+struct i915_gputop {
+	struct igt_device_card *card;
+	struct i915_pmu_device *pmu_device_obj;
+};
+
+void i915_gputop_init(void *ptr, int index, struct igt_device_card *card);
+void *i915_populate_engines(const void *obj, int index);
+int i915_pmu_init(const void *obj, int index);
+void i915_pmu_sample(const void *obj, int index);
+int i915_print_engines(const void *obj, int index, int lines, int w, int h);
+void i915_clean_up(void *obj, int len);
+
+#endif /* __I915_GPUTOP_H__ */
-- 
2.55.0

