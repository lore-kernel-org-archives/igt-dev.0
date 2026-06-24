Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DCECDB47C
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 10:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D6710EE84;
	Wed, 24 Jun 2026 10:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNrvUQgj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2FD10EE7D
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 10:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782296967; x=1813832967;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=SvizGAbO/G8TAunb9Hd9BB1dBgYZqOMb5UL/CKJveV0=;
 b=DNrvUQgj7fBFEgH5gFQphVM1vbx2SgbGM8t3AOs2bJqtDERmaKuG9gUX
 T4tgQ+DP5dqUbwb4dege3H8SNmQ3MzEjkagEHnQc7EdywPId8coPpmMfx
 H+GVxgsI3WbsQUxqcy0ptCue8EMOKg+KEIfAsvh5on0boyQvOD9Vpem9N
 lYL51snM3uEM7o72HCufTUFarPxGfMtymAufZY/T4mjlGtRrUcfafvYNI
 b1GY2oeydS50BObk30ym3Bnn7AFpEwZhMadThxXJETysaJTRmVgRs77Rx
 gNIiz/SyyYlhLsWUiHpB4TtDHMu/EN2m2Azh2gbeuH6YklMVUPbZjFE0D Q==;
X-CSE-ConnectionGUID: VwaNS+MyRuC41A0LAkD3Uw==
X-CSE-MsgGUID: YaS1fW0XSWWzrr9J5CjvFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="105847991"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="105847991"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 03:29:27 -0700
X-CSE-ConnectionGUID: QIKOXxruShWdgKR4H/qzjA==
X-CSE-MsgGUID: Y35EfhQAQ6eS5bumJQda9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="247439708"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 03:29:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 03:29:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 03:29:26 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 03:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4YDfvtMRTZcGO+9RdxW03Pwyg7ChyuJUy98GcAT+fKjxMjCIjKVs4yvbhzj3+hHCyn5JkpN8o7OYXxuyT6cvAO61EvNc0Hn1PnenLWPU8hSLVSnKTsjbR37f2oNdKZ+eux+6UTfqR4SyE5/FILpNq+5RVTEi+j2I/LlipPxF4q2aL+IrwEweiqqQtX2ytr3tH2dsvbVYdAtVeCyqQ7hdKy481t2YOTZBS3erFvCOBP8SIvQw9rVr12jvkas43GKSRe4BoeqxFxsYRm0vobiu2ZAmqUkdkEIS2FFXXHiEEnHw+0mPvPcvT16/DOaQlLDnvy9lECHFAhZBxxZUf+wdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkuE381KSWv0cMFE31EsoyAOoNWLbLyuFONzZsLyZes=;
 b=G79f6Agw7zzsdvDq0nCQ852+vJg2EarqSXPeFTpCkU7KGNkJn75a31HMz1wOnKYCj3aqhQS1geLeclwqEmQymfE8JCBJpf0yzUW5GZ/siK34DhbJ1cZNLZTK0tjBV3BtcZAeAGIUV7JZ8+IbfRcmP7wAUeeXhgtCCwvSxDtEXRiMfBqcMl0uKU0YivVn7NlPEas4aZ0YjiyiD3hW6Ne9Qsz0LnaAaEbb/LWowNX3NA08LAjjrEsVP74N33d04BeVA1R5dfhSNdtSFIMrL/1KLFa27u12Wws6jhGA7HuuBvDZSMbIHpLlpnGryr/QKfZ1lWS3fK95GoPq10A9hEaP5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 10:29:23 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 10:29:23 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Janne Grunau
 <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andi Shyti
 <andi.shyti@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t] blocklists: Add asahi tests to i915 and Xe blocklists
Date: Wed, 24 Jun 2026 10:29:13 +0000
Message-ID: <20260624102913.903645-1-krzysztof.karas@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TLZP290CA0002.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::8)
 To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SN7PR11MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 795baf74-57c9-459a-8699-08ded1db7553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: gz1wMCtr91iJlk15kALNS7ovtYeWOPCAM5K14D21i+l6926EnlyQerKkyzz/RHeYr+T9EidmRff1k09sGPUORj4AbN+iKOkHng3vQWCiMccud/MOaF1uR76gluCyHtYOG75oOxXutQRww0DP+fKJ+zkwz4YTzwgvSC4nI/wqvFLS/yJvsRHn22YSsnsiks++TVc3BXsjjMJLJSlg86YfS1TXFYAQCIH/aLCT6/pEbdvugfhDJR8EvceSw0LVjjIOZk5aNUCN8HrILguCOaNmxgZAclPdugJw+xUsZfH/I0fV3ddvptPNTLOso2UOVRG0vkd3+UfTX7rUo8M7/X2tUJKR/ipVc5A+u2c8ZkSOQVi1GVDGO0NbXcU95yXkgoxbd22QbBt1/2Vi97WvN8HYcZdLfFpxeRZeqW+48ATvqwZ+q18nNw0NZRyqIKQL7PtxMFfme95PSQbiFGaRbVwAEFJm/9S5GAR5b5lVV8Q7YjI3xa7fp1GdgF9GlGcGiPp5RusX52YK3nh5W/y3eC9kcdspL6ew0U4t33qqzyn95QA0WPIPYqKlTfIVb5l1tgGeaqFEiGrPEJt+kxXzlFnUM9cVmYVevA5vGfzAMZhCyYB5Oz72I9vUT/ErkboxRsbb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ih86A3FiNS3IYi+ni9jp5sfbQr/+OnD5KAKP9OnsviIRHDcsYvW4pg3YKV3d?=
 =?us-ascii?Q?QfG4ugEV/i2/SA3fGz5jjq0XUMbuDI3gIO15LtOlq9eake6EXMyyhoB69B8a?=
 =?us-ascii?Q?vXjwXbEyHFuLRNhXbyOvAD1xjobwcXy4FN2KVcJ+64ryhyQ3ysaT9RFVWVE2?=
 =?us-ascii?Q?TvCfuhXFLbYumzOXCJswxffVyzF1VG+zwfoNeUSrF/OaB4cDaqRpUUnOQ6uX?=
 =?us-ascii?Q?DWZr0CMBGhj+9eVNsTfeNSfkh3SxUvO4XuQTMNYlr4GHjr2WlV+Ed2I2AS8I?=
 =?us-ascii?Q?5v8tCto1Nebvt2aCTioVwwFD6JXIiKlITdxNDj83RaTBddAQLMS6i3OptBZH?=
 =?us-ascii?Q?qRyqOeKPDR6nshgqjUOUULJXdPez0y7i7sb2NT203ucannKovZsRN+0kkUI3?=
 =?us-ascii?Q?zNydkBSF2tNRn2xST6r018nBglUQ3k4L8xCy1Gc8FPzYCjVQDKQZLvj6VlQc?=
 =?us-ascii?Q?wkm25wePY/k72ppqgwkgvgH3/SHvlEYeJ4/ljdIzYQgYteaN+LRYpLhpJDpv?=
 =?us-ascii?Q?euRh7DyXjXfrkPEOKqXj88/Ptg31CSoj3zDJ6uL+B3OErpXKb0e6pzsWRk2l?=
 =?us-ascii?Q?YsGEAXQsziVosDyyCcFlnPMB1FfYmclh1A6Iikea7Iu+s8t9dn+b8DAHiR47?=
 =?us-ascii?Q?/+2uJhguQb1e1c3rbfh6piB04gt/TSG2eUsWL0+9mhiP3Ee20w7veLJHtPDe?=
 =?us-ascii?Q?YfRxgs8qHZODJPkc0WIPIV/yrlfb8usjfyGVuHm9Z2wsBrowN0OqcY4KI7X/?=
 =?us-ascii?Q?WOQAQy10p9SptGtTR+WsgoiMQ77Fiwq99uFpMRPfpkue30vxnmIAv8e7kyej?=
 =?us-ascii?Q?DMRAyvjixmKMLJcRpjb6SctvqW0pIa/G7nN1uab6dAIsNKT7+wRZO8Skv+nJ?=
 =?us-ascii?Q?K3Cvau2EHtzjuAc0VbfTK6zhbAugS9aczehHJ3HkwF7J2x0H+1AM6KW+RRyP?=
 =?us-ascii?Q?UI1gCwYCquqhQLsb5gQSGGe5rHwAOaco1NofMzlgrcJNsOxZFi7/6Z/Yecmy?=
 =?us-ascii?Q?1AyU1/ApAVZU9x9JGY8Hrl0nAgpmuZQeVKKos+/WKLP3ybFtr2MdE7O6sNtQ?=
 =?us-ascii?Q?/PlcLUTapK7TmHs9osmJ+cG1JgmPXS/wBAVED73CBA4jzHVaLIE2oJNY2H2H?=
 =?us-ascii?Q?DFJRiz++6sqONJZS7D5nSfKIXM4lo4zoUVtbWSnqKZyIo7zWVRLgwApKl9jV?=
 =?us-ascii?Q?pkYF1SZKEDzEBYyH01yx/T+l4gb/JBXxkkGUxehU00sF7sLrOSCM0MCN67nl?=
 =?us-ascii?Q?TKE9lv/kh8/e1gqjgU3OyWic7uzDzsM0U8XFruGukB4f3JH+KxCu4zBmpfHj?=
 =?us-ascii?Q?43sUswfphZ6woysTLb2dTT9Je5nrXkDKeTeFCAqryJrvV1uzfDXPtJkXM3qN?=
 =?us-ascii?Q?WdL7rMx66SYi0/3ltBt702nETYO50QBzDkzKdnT0qD6BgjsJhdWR4cAYYZkj?=
 =?us-ascii?Q?hSBFGaT0MchkiBstNbOmzbCyxpQXMmCQ+v+CLMpxzpIMd8c5jotY9PNzUP7K?=
 =?us-ascii?Q?tfp1dAHDYaJ4LdStWysW8tWfepEd3yMMWA0wHg/0FCS+h5ZkGMps8l6qA75h?=
 =?us-ascii?Q?P3dF+twJrMm1Z4UHlH5YIoePuJgcKmv58UU37ym1CZYetV/l68o1Yjx8zKYk?=
 =?us-ascii?Q?jG0nPE9wrjdYsvTdC5mnJLd1iONdPPgrj8l6xPYHqRqKUcHRRhqiEKHg89Fz?=
 =?us-ascii?Q?yYo0N5ecdr2KRLFnsYGT4UvBT+QP3TWhAxAZwkV+JaEP0z4vInGfuXChp7r2?=
 =?us-ascii?Q?X5CU/HMUAZJnjd58lc3kvTCGs9cDS88=3D?=
X-Exchange-RoutingPolicyChecked: bbAARnzPTA0OhFz5pCK3KOsD0HTykWxcafatAMEU6mB76M+o2ZMlRN+DzoY/datddFyI6RmkAMaSMySNkmO58ErjUXERRAPjKKoVRyULu1Ys4JUud5kS4xk0J1qmnG10IdE1a8qwlbcxAZV5gIIbZdl/jYVj0Kc59gi4HuDS7op4NtfGFk7gkCGfmNomK5Q5jVD9x96i3Q0tm189yFZSl9ww+DAGnjK+egoo4/mPS3+itTLQdMzjDHj94/0FCA3fGI48OAbzUkDhoUvPZV9tXzwYfxkIpe2TTGHltcGnpduDsniGY4cSQwjjvpIQj7Gz13aZMf3FsdqNARwcBX8XWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 795baf74-57c9-459a-8699-08ded1db7553
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:29:23.3039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5i/4hMLsfYe44VlZDHQUP4TzYNAybCq8691fDlAytkiqw8KGs3OuOyG2nEf/DfSaH5iJgxEylnCB0Fv45+46xQcjW3WEkWBeemREvVYOWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7489
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

These tests are not supposed to run on Intel drivers.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16489
Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tests/intel-ci/i915.blocklist.txt | 4 ++++
 tests/intel-ci/xe.blocklist.txt   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index 17b2f1f3f..6ab955fda 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -110,6 +110,10 @@ igt@v3d.*
 igt@amdgpu.*
 igt@kms_async_flips@overlay-atomic
 ###############################################
+# Apple
+###############################################
+igt@asahi.*
+###############################################
 # VMware
 ###############################################
 igt@vmwgfx.*
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 80cc98608..c3a9c87a4 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -3,6 +3,7 @@ igt@meta_test(@.*)?
 ##################################################################
 # Non-Intel driver tests
 ##################################################################
+igt@asahi.*
 igt@amdgpu.*
 igt@msm.*
 igt@nouveau_.*
-- 
2.34.1

