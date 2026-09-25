Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2CBC98321
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 11:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49D610F9FD;
	Fri, 25 Sep 2026 11:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHklIDIz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1BA10F9EB
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 10:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790333888; x=1821869888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dftVfNH+CpRfnNaATn+klEvuyNQt/BSzoHsuaQVAMsU=;
 b=WHklIDIzkAxpx9bsKriGvI81mwZW839R9jHco+ezT1Y7kUagM9kjR1yU
 9yOdxSdexvmCnlTYCQGiXFKlXoO4JWdtnPc3UnhWu20Vn8Ejg7VrcL303
 ve2FZK5iwbNWxeSZakmZEomkcDvVLyPtjyY3hr33kBcP8a/mxbg4dAsGJ
 v62MVAaQyQQlG/9d8EnLBJx7S/QHZmrY3qNCAgs/AmrCF8kZM7ECg0Zy0
 7NmDKmAkHJN4q3ouMkJHTgP4mSYrRgQSsWl/NNRrBMKmqUyvhdqTyWjz1
 BoO+KESZRcX47UfMejHabbOwUrq6SHDDkY+jadFivJfaA/9cGvSz5PIRq Q==;
X-CSE-ConnectionGUID: 9/1iYFcnQxiG/7dt1S4ndw==
X-CSE-MsgGUID: 2yjVS5yJRH2jSzTP0CEN2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94935946"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="94935946"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:08 -0700
X-CSE-ConnectionGUID: ul6GT0B4Qzq7WcayP1dsZA==
X-CSE-MsgGUID: VYkk3NnDRsOD0+s+NoEI+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="312230405"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 03:58:07 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSOjgIipoxldVRFqWE382H7cgs0HIcX33HRWcn0pC9coj1/aZtDUXdyydmrR1V3EIUR6EM7k9DkgR1eSWcTv1iJfqk/P7xvMMFXPylDE38yfh8pa67DCCm3DWNz7ATzgG6FBMkhp6UpE9kdzKKo3DVQoc4bYRs6pC0wd+Fd4hER8/ofPXxPvicYgnw+gKkj9yAkyVd7U4ehVY6I4uX06CG9b4/trL8SbvvEWvkqvx+uZR2zK0PJ3sLHQdKuqldkgJmtAURSss6y4P29QoF5YWGmnSgR96D7Wbp+8WxN8KbjgEL3fJ6xTinaQOH9SU7lAPLr/tL65JCRWvvcqh1+1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXNFs8wQs87bdnkTM8x0hfUGFjZ6XuCUOl5i2VFGrmo=;
 b=SJHeoF1rMzuNjhWzVn6014WLDGowqE3lGj08SdcSKoXXwKQxgfWePZ3J6cCl1VkFBKkSF/pErq4L7EOHKLqsIDO0yoxnoigjbNne+pzZwBd+AP7qwxTdq78k7F0PvgZliu0ycimkwo1y3rqwHA9ZWwi5M1NDHlQZoFpm93BwfLlMT/j3GIE1tgsZz3CZUpqDjX1TpQiDYCLYo22l651p1wkTF7z//Ba4j74636e3eVAR8v83a7uCDpLMqAvI7cDtajsC8qvjHjpA5jdnxZcQr2vCuWiGSicpgE8Ndf0MHFB8esKjbjF6MaX7n/9vGfgGGJjs7FRE9YxxSdfxEqLCkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 10:58:03 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 10:58:03 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 4/8] tools/gputop/i915_gputop: add i915 PMU engine
 monitoring
Date: Fri, 25 Sep 2026 12:57:44 +0200
Message-ID: <84e6c1f62a64cd5f6a9ebe549ce32b123d623f42.1790331690.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790331690.git.sebastian.brzezinka@intel.com>
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: be2122dc-3f22-44d3-b701-08df1af3deeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: e7W8KjaZx4nTtTg9iP/qSJ111jPXumb964pM09nvnXGFuPJAzw2StI8U4KuYFgp3UaAqZrhrJajiJg6BUG4ZM/OlYVAMnTa9mCatT1H2+fjBdGWK++eo2fvMej2b4xi0Su2wZc9dRtOawKGxtOd4H7ZAgDls5FOtnmWoqUK5uMqgpTlu91r/lxVJiUxlAcs+WfBAWkApFyz40iZhXDz9Wa9EZi0XMq6uP4eMYRqU0UFg+xKHpqI5G2+Th0pcMhpSMVJQftfrGNMam4PJwoTxdtVs6hO0RdY8w+OGZeRrsFsSfZHRYwHam7eG0QMciGcMAj3Ymigxmw+fYMMfDUWPS850NnvtsnC8tYeih3gIjdIqWvqmOqpvA/eWkwYousoS5xygQVY7YlWlqXv0p2T5hIh0SFTpemmADmV8oJA/+dvSPLovuEZpvJDX0SvJQGL5a0qvugqIPGboaAypPB8qU++83PzwYwqnBDxnJ+ePnhpRvbDI3/6vqva5b8NPy25PVzjaibvh8MUtljo4OLrs6U1BglCjFrDoSA8FFl66ohB3mAqmTAQuw6UT8/kEOajal51D/F5mT1eEkRrLYtemI8VT8tW+VE/PSdejxawMB1c0UHd7etXjUjplllooBMkgYjBOyyDF8vsnU6VXi5OloQ/LZG88LYVetCj+tryC2MI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGtiWndmbzhaS0MwZnFsTDNzOGRTbVREanRCZmNPWGhlMmY2a2xuVHd6TlVS?=
 =?utf-8?B?OHgrVEo0QWN2dE1idnMzV1dFd0RsQlFDUWVEaG1laVJlQm9rWmFlVVRwT3ZV?=
 =?utf-8?B?d1l0OHRkb3lQM015L3VnYU9yVXRYeUVhT2ZUcnMveFpPSnNHWVRZY1U2SFRZ?=
 =?utf-8?B?SEo1aFd0Ylc5dGw5OUN0cHIvbFpyS2ZHYzBTTFdtQlozQkh3L2tKbWtsa2VX?=
 =?utf-8?B?U0JCVlcrRkhqWThRWiszQ1BubmhjU1BOdzRNdC9ITFpLeEM1S0JGS0pPTWRB?=
 =?utf-8?B?dVVaNk5OalFYMWF1NnhveWZwN0pOalhFZmdnVHdqVGxDeFdTQzBWamtZTlly?=
 =?utf-8?B?aGtjcUEzUXh5bHVySEFYR1dqU0dsUDlLTHZzOXk2QXpFQXloUGpDbVFGQUVO?=
 =?utf-8?B?VndFdUVpSHBXdFVEQTlBYzUydjRhNGNrc0xTKzZJWFlWblMweHJtSEQ0ZWZX?=
 =?utf-8?B?Q3JobVNUWXRTcnEzU1JFUHZKN0o1Q0RlWVBncmVwUEtzNjZIcXlpeE5QWmR4?=
 =?utf-8?B?Q1d4OVRGamtPOWliYy9mV3BQNEtWZWNEcUwzbnJWbmN1QlZKODVZbm9KbVpI?=
 =?utf-8?B?QTlzbGRtVWt5YkwzL1NaMHFTbnd3R1ZPWU5kaldocVJQYy9LTFg3QVdtdU9B?=
 =?utf-8?B?ZHdtdlRmZE1vdUxLNGlSRkVIS1d1QWp6blNRQkdDd2JEVFoyaW9BMnEwRTZq?=
 =?utf-8?B?NVBaUk5pSk1HK2dTdDR6cWNYbFpZajJndFFTZ01pVkR0QzNhNDhsZFVPZmZt?=
 =?utf-8?B?VzNMRnYrbWE0Y2JpS0c2Unc5RTE0UnQybXFtSmgxKzRoR3NLMnNmMEtwUGRn?=
 =?utf-8?B?TUZHVmZGcmVDWXFHUDhpMTJHU0wveGl3aVhoYXY5ZGdFUy9DemM5YzA2RmVy?=
 =?utf-8?B?djVkbDVnbEZLakQ3R2x3aUVtWXhGd3UxWDJLVFp5S3lvVDhvaEdqdDNRVGFB?=
 =?utf-8?B?dWxacUZPcEdoNlRNaXVJUWd4VUVFTHc0QlQ1b2lzVW1VdlJIM2c5Zi8vVUkx?=
 =?utf-8?B?eFprMnMzVTlDNE1qSmtkMXg2eUZlWjN2WVhMZmE2RUN1dzd0Z2UwYUFBR0VV?=
 =?utf-8?B?bDJyYmFLT2hHSklGMnkzWFM0R09wdDVZa0VKUTFBem5ENDl4NUN1dm9YZ2d5?=
 =?utf-8?B?OWNNcmgxek9xcndXdFYreUtOcjFKTXRNZE9ZdlUzSGFjR1U1M3JQd1hOU2Zp?=
 =?utf-8?B?aGo1eFpwaW5hbi8vbUlWcVNKR09hQjhYRDdLUjVpY1RlTmZZRTFuUG04NmYz?=
 =?utf-8?B?VXA2NXNSclZGODdNWEpQaW43UmpIakZHR3VUUFV5TmphOGtmZHgwNHZWSHlQ?=
 =?utf-8?B?VlNEQ1gyTEJVQVFuVWQrdlRXN0RSVnBHM3F5VDRVVkc0MkFhalM3VDUxemht?=
 =?utf-8?B?dFZsMEt0Y0JpNEtWdy8wcmVud2gyYm11ODRTRkFWYVdLWGpkUGxhditmYzBw?=
 =?utf-8?B?dm03RzJmUUhUbXZaREE0aHpyTWpWMFBtbkdIdjhhcGtkcWJhdUh1RjdMQmlN?=
 =?utf-8?B?VXFaL2ZYZDBmMlJ2ZW83U0ZtZHNkQTdjWlY2VWtHQlFiZXVPZzFHbkk0aGZ6?=
 =?utf-8?B?V1pUcXlybVJFcjloVFNHMzR3cFRCbzRmT2Z2Sk5mbWYySkV3Z1ZaZHRQZ0l0?=
 =?utf-8?B?aGhFVFVxanFrUjZuTUxHemxFV0YrQi9OWHlYZGRqTk5aSlJvZVFUM2MwS1or?=
 =?utf-8?B?TFBySXBzUXJzRjQzY1Q2dm1wR0hiREMvUk54ckh2WkVpY0swR1NiRmNKaVpV?=
 =?utf-8?B?ZExGSzZTV0U3RVZQc2dwdkJTYUlMM2t5QzZoNHhuTjgrdTdWZUFudnlFRnlq?=
 =?utf-8?B?dWJoSzJvdzdqUEFIYmxocS9uMDRWNytKTWwreWpiZkg5RWJCNUUyRWhNaVZB?=
 =?utf-8?B?akRqVnFoSzd6RmlvUkZMSmlxZ2YxQUhjWUtJTCt4UlZsTm5meGlxenYzN3BT?=
 =?utf-8?B?UzVKL3BWSFZvSU12UUY0enhkaXR2ZWVwT1NQSWZkK0Mzb3JYNC9zR1pKWXNu?=
 =?utf-8?B?UGZ6eDMwOXhqL05uSlFlYjFuRWJaU2NCcHVSeEJqNGxyUWNTZHRqSkdzRTJn?=
 =?utf-8?B?VHlFaTg1S24zMndLckllenNzSVQ5TjI3Wkpkald6bkErM1Q3WDU5eS9EQkhh?=
 =?utf-8?B?ZzFaVDRXR2dadVE4RGFELy9ybThCLzJUWmU0SlIya09oZUw1UytTZVFhWm96?=
 =?utf-8?B?M3ZFWU5xTjhhWjNGTDBXeVI3TXZkRzRXNGErR3dRdGtoakw3RWRmYXMxTVZY?=
 =?utf-8?B?ekpzbko4QzF5V1hGNnlvNXRNMUJYaFpyVHFDeFF2MHlPYzVlNWdHNTlMT29F?=
 =?utf-8?B?RDJPYnBYZmNkcVZiaE5kTlZSSDQwcitZVTFNeUwrYlZUMDl4alU5ZzlDMlgy?=
 =?utf-8?Q?6bPWotIYj3tOWgic=3D?=
X-Exchange-RoutingPolicyChecked: biz8HIya9RtVSErZiT+ZdX1JIgmI089ZanY5dvmoim8gCHJKepgi/x36lJq0VTvKiavzuYpbbtbhZGQI/6mzEDjFZ3KMtO2wqlYogyWsiL9uQ7ewTaNf247XQ0IY20UCs7o426cfAaW6wvZDnShbxTbCS7kbPvrSrZPVJKMlUsNeh2nW0vSOCgL0ic0/nSslN4JpmnBR5eItQW35XsXvPWFxrDDzmLFbQ3g83B+WasyBYbWQhbeIzWCnehvpuVwMZP7WHEDVt41VGELiSPf78tnTgttqzvPuFF8ciTemClYRC7sAZktVB/BYWQjLNRur/ijCHgm4aJdjA9CC8DXNhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: be2122dc-3f22-44d3-b701-08df1af3deeb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 10:58:03.1141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0+5G+s1x4DTZSVzq4V4apaonTPdm/aXdg8oQQibzCE5+PFySCKp8Vt66ob+P8McmijToFDgZajG8Z7Uie4BAqx1ua5ClHrigFkn3sJLxno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
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
 tools/gputop/i915_gputop.c | 473 +++++++++++++++++++++++++++++++++++++
 tools/gputop/i915_gputop.h |  56 +++++
 2 files changed, 529 insertions(+)
 create mode 100644 tools/gputop/i915_gputop.c
 create mode 100644 tools/gputop/i915_gputop.h

diff --git a/tools/gputop/i915_gputop.c b/tools/gputop/i915_gputop.c
new file mode 100644
index 000000000..de33bb3fd
--- /dev/null
+++ b/tools/gputop/i915_gputop.c
@@ -0,0 +1,473 @@
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
+	return CLAMP(percentage, 0., 100.);
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

