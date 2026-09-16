Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65899C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D9E10E170;
	Wed, 16 Sep 2026 11:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPbd9N7d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021D410E170
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789559548; x=1821095548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uW6V4ZzJ8jPCZgt8yHj4PpMiQZaI7ZRKvtbvsb3mMQg=;
 b=OPbd9N7dnSorsMBkvvwBV2pTFCoT+l/ZO+H7/OwOpCsdkn56ZlN9Isbb
 KN9QpKlt44HyQFVCOJ40hgmQLpDO8j/RxFV29214LOFa3+OsFRP3HE5ko
 bYnWyKdj/onpXa54Mzt2mnaI1KFU8HnEwroBO+GVIZtONoEjnRKzzAnz8
 2/D7BJXFa0K9JDvRCT3HsaqIRS5uwuTW3KDGaldrrf7C/aauB8tBTyQqy
 Pxo17myK2t2YbG3ACtANKnDWhVsb08+EzbCIwVvk0cebWyISf8RdbDQoB
 31MLpz8JWynRPeI5oJ7j2Pr/VbECMkaZyS/S6S6cKKNHHNg+e8hLyGU41 g==;
X-CSE-ConnectionGUID: xGIZzFGuT0uwKFA28cR8NQ==
X-CSE-MsgGUID: UAPI1hynT+WcgYx6hu5TEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89070100"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89070100"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:52:27 -0700
X-CSE-ConnectionGUID: MMlKr8KTSQGxE5962VIY+w==
X-CSE-MsgGUID: +T+LrlVkT72FQj4zm61cUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269057303"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:52:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:52:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 04:52:27 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.62)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:52:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4aAsbrLVeIIZjgSjkxo3dAuH6rROOd4QvW7LKYWXvp8BjyWRQFTFGThiqAdaMeVcCgHYoSkcAnw1HurDo6R7BMzuynM3c8own2w7oZRJ6iCZq4afP6gqGZw5+scByXg2Fmz3F9boXoq6+aNTs61C2FmTzXj37TNXZvcoFXTuCAbXIy9HFLeOqSWCw9iSgjRHk+ZCrvNYsUju60iWBxHnj8X8vUzvLEdGBJrVdj1SzhttcJBRT/IlDSR7mSXwymwqnbf8Kcl1AXfH9Emnv7NN0SV/FJ5bMBSjIeks4yrH2uG5v14Ln8ejDPS9qQV7DsJAWQ2QQ5FzDHmeP7GVC+W1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXajTFbRIfgyAGNEjOK0T79dGuw7gFZ7OmnRIBtavdU=;
 b=EGMaO9HzBw+FA1EknXRDPvbI4rk5mvwo3ZTyA2i1R3rTFwJXA9D2k+tzMFsdPnTegf0/vndWiOo3e5jysv4wD1iC3eoi0UN86mPP1hxKmiQZrO3NK/1b40QGFBbq8XqFWl1D9CAblE++n86FG08tLO8RSLzjpZVfLFtMHMhp+zqd2Ov/YoK2wpRPmnPxzMguD6Q5+ZddZg+o1vk8fpVlNmwtZyyEeFbHIH5aoyWAjViM4w8ouWpjHXj+S3JDG5n9LQ6yl4hYhei67J3Wz1CZ3sRqmKXiqwkd+BiVTkTc1TPvWbtwCCnB+gpDtye2n1zlNJ5kFaCC1wfKplQv532Z5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS4PPF821BFB4AC.namprd11.prod.outlook.com (2603:10b6:f:fc02::37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 11:52:22 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 11:52:22 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 3/4] tests/sriov_pci_config: Add VF core config checks
Date: Wed, 16 Sep 2026 13:52:00 +0200
Message-ID: <20260916115201.1973752-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916115201.1973752-1-piotr.piorkowski@intel.com>
References: <20260916115201.1973752-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0041.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::20) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS4PPF821BFB4AC:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d7d202-7756-445f-87a8-08df13e8f805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|22082099003|10067099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: jLu1xhmIX445Lq5TrIgr+GtgxlR1/MR0DYk4RopnAGSqniaAZJWKnh8ekKQkqdhu+zj9HbR1I7p7ZSVeGS1UvImzceHI0E3O+dF7LdwEJrWEa6kwg2OpHdV8E2qabvE6kouRtFSkVGk3sHjzFq6CH3Hapg5ED5mVi5JV0+w8AqMI7c5UKZCxzw9wt+RK/P8PJnixvYYmeCDH+PoD3N1C7A3GGPURP+jGsgxwn+ZXkiXwc6YjkZ/8kyu9K4Cc3Gz9ax0c45GfgzPzabiOs1ai6azB6cGBBqP/n0dZDa/KSr1ZHBI3QXG3IpKfi80sjetr9v2FwLMM+Waqqyh5KtzE42TYPRmUeLSnX37/NPjoXjiiAcwNfndSEp/2Llg8bROr5MzZTH7Bpcdvp58YAloWMX8oJ49NQcK9OrbR8mX+WFmSa8cZJvw1uKFTLf5FOr5nSv3XzILPpz+QKIeVw779iXGI1kQt3IOT+YgzL6OcadyuXNfFITerBHP2V1Z/uq+i/Nm44cVlkCzhropiszbePpyUoYDBLbMnKUE1yS/MTiAItb6i0x3oznBg651k4mjBvFzAEHV18MjKzCQfChPa+08qSoqx3RB+FRoduCxkhNOfLnXNo9NBrMFfUXqeXVqSgHJgMMocWQm+dK0x6RBU4yOZ4gXC9Z9U6nOcTSVh4mQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE9GUTN6MTJtNlFGL0NoRFVoa0dUaHZ3ZGEzakJZY0RJZGkrb2ZFOTVQUlNv?=
 =?utf-8?B?QkdFa1RvczV0U0FyVjVqM2x0Y0pENTdwUWZzMFV5NEsrOHphbThwOEp6Qnp6?=
 =?utf-8?B?MWxRYzFvRDRUS1NLVnpsZUdubEY2WTEvM3lEeE44bGl1WFJIY0RDQVU2WWhn?=
 =?utf-8?B?UTFFSWlBY2JWbXQ1ZUJ6NU4yMkMveG04cHpGYnVQNWV4YzVQcEo5TW9TN1gv?=
 =?utf-8?B?M1pDaU5NZVNnSXJUTWpZMXUwby8rRWxTZkVJMS9YempZNFJ5anl6S09zQ1RV?=
 =?utf-8?B?Y0l0eW9sL3IyU2ZVSCs5V0pIaG8rM3RyY2lacTRMTk9xSVUvaEZUL0Q4cFJm?=
 =?utf-8?B?bERRREl3Z1dkNTZBRUFIY09tOTBFWEpNd3RrWEprbll2RUJMQk51cnNsNG4v?=
 =?utf-8?B?NHhScnl5dHlqZ2ZucmpmUnJYREgzYnRRU3BkMituY1owSGp4eEZLQ3hsMEtY?=
 =?utf-8?B?UW9EU3psNjl5ejNCWkE4a1NDb0hmY25KWSs0dGRUUFRGYTc1eCtlRFV5Nm1u?=
 =?utf-8?B?b2hIOVhSaWhUZ2I4bCtRR1FRWnVsQkZpK3ZjaFhKVzFZQzAzMDA4TDBGZWU1?=
 =?utf-8?B?NDhTbXg2cVdrdlhacHczVXpla25WOGJBWXdVaVFEUlpNTStXc1RSc3ZVRmVN?=
 =?utf-8?B?em54NlZZQnBOLzJsWnZ2M0lCOWdDTVJndS9HS1QyY0VyMHBTa1Q4OEVmdFFB?=
 =?utf-8?B?R29MY2ZkbFQ0UTdHT0NVSzVvSlNGdEpTRUROa2pOMmZ1TjNkWnNMVDNEajhH?=
 =?utf-8?B?MVByVkZoVGc3elErQlZraGRITDRvRDc1LzRuRkIwdnNYSDBzdVZvQURDQVg2?=
 =?utf-8?B?cmNwZVVmWGN2WG5CMHJoVVlwd2UwQ0tnaXhSUUdNSGlOUWc3T1Ntd1hhUHlp?=
 =?utf-8?B?Qll4Vi9LdFMzQXNuTlVVcFRyZUJLT1FyUmZObUlkYXFlTlpOcFVxZzZOTUw2?=
 =?utf-8?B?ZDdEVEUrT3dDUlIrT2pvWkcrWnIyY2Q5NENrQ1lmU3E2dnd0RnRqdERubHo0?=
 =?utf-8?B?NDZUek45WDBuWlNpSnhMSkdwRXM1RjZQQ1ZPSzdteC8yc1E2U0RKN1NnZWhK?=
 =?utf-8?B?aFExVTUzb2NBT0MwN3hucnkxTFhnbmUzWUZRUm1LQ3pKcHFvZjlIYStFRzhr?=
 =?utf-8?B?MVFmQWVCQVM5WS9wbTRvOXFqazhQdmczYnJnUUFSNVpUVlBRNHJXNS9EODcz?=
 =?utf-8?B?d1kyVGpLTWEzS1JZeVRaUWJ3UFNhVVh4Y204Q3A1V2Y2cThvUjVMM0J1WXV3?=
 =?utf-8?B?d2tFbkZzVTc0aWFuNC9NOVB0K3JJR3ZTVWkzRFNPZ1JkbXlFemNJQ1U4WXQ0?=
 =?utf-8?B?WmFKenpzNHhSay9nNVJDVEY5RmZMVkgvNnZOTFg4eTdPZmJPNWN6VzR5WTha?=
 =?utf-8?B?ZkFiRTVsQlJ2MnBEdDFSdkhoMjR2K1FHU0kwUGJxaGRQcW1aaUZmKytWRXB1?=
 =?utf-8?B?cWEvcFNVbTM2WnJUTkdTaUxtZXZkYk9hdkhFNWV2RDBBVzNid3laSUN1cXZa?=
 =?utf-8?B?MlVuNktIR2t6QVhvbk9JcDFNQkVPbTJXaXordVpQV2VUZTRJS0N0TnBMbnVY?=
 =?utf-8?B?VE02Y1F5TGNuWVF5UlI4dGlicDRhelluQ3JCOWxia3JESzJSem1jZnd1cmdN?=
 =?utf-8?B?dnJTcGZpSXlOTTB1ODMxblU2dHE5elRYTSs5MzFUZklaRjJveVlTV3NLRVlj?=
 =?utf-8?B?QWJaMG1VTzRSRlMvQkoyaU56TGVvK0VQUlNWV2ppN3BqTlQ5WW5kM3Z1Ulo3?=
 =?utf-8?B?VlVmK3VQTkgxbTBUTUdBNjJBYWpQWkNML2prNk1MbkNqeVpuV2czVzFpejln?=
 =?utf-8?B?c3NuV0VNWXdGQ3R2VmIyVUJ5akkvRXlKNUgwcU9QQUxEbTRKQ0pMMFAvWGZ1?=
 =?utf-8?B?VTZ5ZzlWYWkrL2k1S0JydHROazZHZGNWRlk5OG1FK1YzOTAvR29pRkQxYkpW?=
 =?utf-8?B?T2dVUlF5S2NrNVhvODJQYnZRQnVndkl6NzNlaXpIcGRUK1p6NlRESEF4UktD?=
 =?utf-8?B?dENiRVVOQk0zOU92eldIbUszaW9zTk51NzZQQ2ozV0JCekNEeFFnK2ROTCtU?=
 =?utf-8?B?U2NTVW1pbit2YlVNL2M3SU9mdldsV0tQM2xNcUszaXdOejBxNjIzK0Vvd3Vw?=
 =?utf-8?B?NEFhTHBEME1BeE5TWDZtRE1KVzBOb1RZYzBaTVBIVWs5SkkvMk52d3VzK1JD?=
 =?utf-8?B?OXRqeUM2WFhoQXJaWGtBK2pTN2VlQTJERmxqUHhSZlFBTzY1RDNkTzVta2Fx?=
 =?utf-8?B?QTFsNGxyRUZoMzI2Y0d3TUZnUmN5WHNXVjNjd1NKdVQ0NlhtUk1ZMUN6S1Rz?=
 =?utf-8?B?ejllNStoK3Q1UFBCZ2pkSW4yRURKVGZsU0Z5RU1GQWxkM2N0WmtEZ0p5eDB0?=
 =?utf-8?Q?tZ1rTv5WL2WyZuVM=3D?=
X-Exchange-RoutingPolicyChecked: BlmEonpGYezbCWUKvcnH7vgDVn+mPl88n+1+anu6ja4Hxs5/ywV5zrIvUulP8gPXQZPgohL+cvIXoJMlwejMgR2fB1egW2mnKcTqR2ErhrOMPyWOaQKjMh4JxN3WxgIGNt9R3o9kZAml6WyXDoWXu/vY7UQ47QmCJ8Erb+R5no2zXgWXUZLBDeDBqcu0Jsj+U0fnau8ADvd1+MKLyj4dIb1gn8WNuePdCuUB7u+mDcyvzhkkSBIyq4exKaxq3qpE0dp4PCwR48nX10xQ+Kx4XB9V/gFSu5zosLB6XOSdh29CXPv0S1LmEHK7bP6RUKrrTCriYKfQJlqqorjJcgnxNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d7d202-7756-445f-87a8-08df13e8f805
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:52:22.5514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgLt8pudPlGbR49nNh2yxbAMvFzQkQseZJydlcELEU32dgp41b9TulIV9NodDaSRTH9k4AKQ62lp3Q0R7ZMCFHOA5fIktxMagT1e68LrnHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF821BFB4AC
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

Add checks for PCI configuration fields required by SR-IOV VFs.
Cover the common header, BARs, and PCI Express capability fields.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GPT-5.6 Luna
---
 tests/sriov_pci_config.c | 234 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 234 insertions(+)
 create mode 100644 tests/sriov_pci_config.c

diff --git a/tests/sriov_pci_config.c b/tests/sriov_pci_config.c
new file mode 100644
index 0000000000..9f8fd9fb50
--- /dev/null
+++ b/tests/sriov_pci_config.c
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#include "drmtest.h"
+#include "igt.h"
+#include "igt_pci.h"
+#include "igt_sriov_device.h"
+
+/**
+ * TEST: SR-IOV PCI configuration
+ * Category: Core
+ * Mega feature: SR-IOV
+ * Sub-category: PCI configuration
+ * Functionality: SR-IOV-related PCI configuration space
+ * Description: Validate PCI configuration fields required for SR-IOV,
+ * including Virtual Functions.
+ *
+ * SUBTEST: vf-common-header
+ * Description: Validate that the VF Vendor ID and Device ID read as 0xffff,
+ * and that the I/O, Memory, and INTx Disable bits in Command, the Immediate
+ * Readiness and Interrupt Status bits in Status, the Header Layout bits in
+ * Header Type, and the BIST Completion Code are all zero.
+ *
+ * SUBTEST: vf-bars
+ * Description: Validate that VF BAR address bits read as zero. The BAR type
+ * and attribute bits are static and may remain set; the upper dword of a
+ * 64-bit BAR must read as zero.
+ *
+ * SUBTEST: vf-pcie-capabilities
+ * Description: Validate that FLR is supported, Phantom Functions Supported is
+ * zero, and Auxiliary Power Detected, Emergency Power Reduction Detected,
+ * Current Link Speed, Negotiated Link Width, and Link Autonomous Bandwidth
+ * Status are all zero.
+ *
+ * SUBTEST: vf-pcie-capabilities-2
+ * Description: Validate that the Current De-emphasis Level field in Link
+ * Status 2 is RsvdZ and therefore reads as zero for PCIe Capability Version 2
+ * and later.
+ */
+
+IGT_TEST_DESCRIPTION("Validate PCI configuration fields required for SR-IOV, "
+		     "including Virtual Functions");
+
+static int pf_fd = -1;
+static bool autoprobe;
+
+static void read_vf_config(uint8_t *config)
+{
+	char *vf_slot;
+	int ret;
+
+	vf_slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, 1);
+	igt_assert(vf_slot);
+	ret = igt_pci_config_raw_read(vf_slot, config, PCI_EXT_CFG_SPACE_SIZE);
+	free(vf_slot);
+	igt_assert_f(!ret, "Failed to read VF config space (%d)\n", ret);
+}
+
+static void skip_vf_test(const char *reason)
+{
+	igt_sriov_disable_vfs(pf_fd);
+	igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd),
+		       "Failed to disable VF(s) before skipping: %s\n", reason);
+	igt_skip("%s\n", reason);
+}
+
+typedef void (*vf_config_check_fn)(const uint8_t *config);
+
+static void with_vf_config(vf_config_check_fn check)
+{
+	uint8_t config[PCI_EXT_CFG_SPACE_SIZE];
+
+	igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, 1);
+	igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
+
+	read_vf_config(config);
+	check(config);
+	igt_sriov_disable_vfs(pf_fd);
+}
+
+static void check_vf_common_header(const uint8_t *config)
+{
+	uint16_t command = igt_pci_config_raw_read_u16(config, PCI_COMMAND);
+	uint16_t status = igt_pci_config_raw_read_u16(config, PCI_STATUS);
+	uint16_t vendor_id = igt_pci_config_raw_read_u16(config, PCI_VENDOR_ID);
+	uint16_t device_id = igt_pci_config_raw_read_u16(config, PCI_DEVICE_ID);
+
+	igt_info("Checking common header\n");
+	igt_assert_f(vendor_id == 0xffff, "Vendor ID: expected 0xffff, got 0x%04x\n", vendor_id);
+	igt_assert_f(device_id == 0xffff, "Device ID: expected 0xffff, got 0x%04x\n", device_id);
+	igt_assert_f(!(command & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
+				  PCI_COMMAND_INTX_DISABLE)),
+		     "Command: expected I/O, Memory, and INTx Disable bits clear, got 0x%04x\n",
+		     command);
+	igt_assert_f(!(status & (PCI_STATUS_IMMEDIATE_READINESS | PCI_STATUS_INTERRUPT)),
+		     "Status: expected Immediate Readiness and Interrupt Status bits clear, got 0x%04x\n",
+		     status);
+	igt_assert_f(!(config[PCI_HEADER_TYPE] & PCI_HEADER_TYPE_MASK),
+		     "Header Type: expected Header Layout 0, got 0x%02x\n",
+		     config[PCI_HEADER_TYPE]);
+	igt_assert_f(!(config[PCI_BIST] & PCI_BIST_COMPLETION_CODE),
+		     "BIST: expected Completion Code 0, got 0x%02x\n", config[PCI_BIST]);
+}
+
+static void check_vf_bars(const uint8_t *config)
+{
+	igt_info("Checking VF BARs\n");
+	for (int bar = 0; bar < 6; bar++) {
+		uint32_t value =
+			igt_pci_config_raw_read_u32(config,
+						    PCI_BASE_ADDRESS_0 + bar * sizeof(uint32_t));
+		bool is_mem64 = !(value & PCI_BASE_ADDRESS_SPACE) &&
+				(value & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
+				PCI_BASE_ADDRESS_MEM_TYPE_64;
+
+		/* Only the address bits are hardwired to zero; type/attribute bits are static. */
+		igt_assert_f(!(value & ~0xfu), "BAR%d: expected address 0x00000000, got 0x%08x\n",
+			     bar, value);
+
+		/* The upper dword of a 64-bit BAR holds pure address bits, no type bits. */
+		if (is_mem64) {
+			unsigned int upper_offset = PCI_BASE_ADDRESS_0 +
+						    (bar + 1) * sizeof(uint32_t);
+			uint32_t upper =
+				igt_pci_config_raw_read_u32(config, upper_offset);
+
+			igt_assert_f(!upper, "BAR%d (upper): expected 0x00000000, got 0x%08x\n",
+				     bar + 1, upper);
+			bar++;
+		}
+	}
+}
+
+static int get_pcie_cap(const uint8_t *config)
+{
+	int pcie_cap = igt_pci_config_raw_find_cap_offset(config, PCI_CAP_ID_EXP);
+
+	igt_assert_f(pcie_cap > 0, "VF has no PCI Express capability (%d)\n", pcie_cap);
+
+	return pcie_cap;
+}
+
+static void check_vf_pcie_capabilities(const uint8_t *config)
+{
+	int pcie_cap = get_pcie_cap(config);
+	uint32_t pcie_devcap = igt_pci_config_raw_read_u32(config, pcie_cap + PCI_EXP_DEVCAP);
+	uint16_t pcie_devsta = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_DEVSTA);
+	uint16_t pcie_lnksta = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_LNKSTA);
+
+	igt_info("Checking mandatory PCI Express capability\n");
+	igt_assert_f(pcie_devcap & PCI_EXP_DEVCAP_FLR,
+		     "Device Capabilities: FLR bit is clear (0x%08x)\n", pcie_devcap);
+	igt_assert_f(!(pcie_devcap & PCI_EXP_DEVCAP_PHANTOM),
+		     "Device Capabilities: Phantom Functions Supported must be zero (0x%08x)\n",
+		     pcie_devcap);
+	igt_assert_f(!(pcie_devsta & (PCI_EXP_DEVSTA_AUXPD |
+					  PCI_EXP_DEVSTA_EMERGENCY_PWR_REDUCED)),
+		     "Device Status: Aux Power Detected or Emergency Power Reduction Detected is set (0x%04x)\n",
+		     pcie_devsta);
+	igt_assert_f(!(pcie_lnksta & (PCI_EXP_LNKSTA_CLS | PCI_EXP_LNKSTA_NLW |
+					 PCI_EXP_LNKSTA_LABS)),
+		     "Link Status: Current Link Speed, Negotiated Link Width, or Link Autonomous Bandwidth Status is set (0x%04x)\n",
+		     pcie_lnksta);
+}
+
+static void check_vf_pcie_capabilities_2(const uint8_t *config)
+{
+	int pcie_cap = get_pcie_cap(config);
+	uint16_t flags = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_FLAGS);
+	uint16_t lnksta2;
+
+	if ((flags & PCI_EXP_FLAGS_VERS) < 2)
+		skip_vf_test("PCI Express Capability Version 2 is not present");
+
+	lnksta2 = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_LNKSTA2);
+	igt_info("Checking PCI Express Capability Version 2\n");
+	igt_assert_f(!(lnksta2 & PCI_EXP_LNKSTA2_CUR_DEEMPHASIS),
+		     "Link Status 2: Current De-emphasis Level must be zero (0x%04x)\n",
+		     lnksta2);
+}
+
+int igt_main()
+{
+	igt_fixture() {
+		pf_fd = drm_open_driver(DRIVER_ANY);
+		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_vfs_supported(pf_fd));
+		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
+	}
+
+	igt_describe("Validate the SR-IOV VF requirements for Vendor ID, Device ID, "
+		     "Command, Status, Header Type, and BIST fields in the PCI common header");
+	igt_subtest("vf-common-header") {
+		with_vf_config(check_vf_common_header);
+	}
+
+	igt_describe("Validate the SR-IOV VF requirement that BAR address bits are zero "
+		     "while static BAR type and attribute bits remain valid");
+	igt_subtest("vf-bars") {
+		with_vf_config(check_vf_bars);
+	}
+
+	igt_describe("Validate the SR-IOV VF requirements for FLR, Phantom Functions, "
+		     "Auxiliary Power, Emergency Power Reduction, and PCIe link status fields");
+	igt_subtest("vf-pcie-capabilities") {
+		with_vf_config(check_vf_pcie_capabilities);
+	}
+
+	igt_describe("Validate the RsvdZ requirement for Current De-emphasis Level in "
+		     "Link Status 2 of PCI Express Capability Version 2 and later");
+	igt_subtest("vf-pcie-capabilities-2") {
+		with_vf_config(check_vf_pcie_capabilities_2);
+	}
+
+	igt_fixture() {
+		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
+		igt_sriov_disable_vfs(pf_fd);
+		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
+			       "Failed to disable VF(s)\n");
+		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
+			    igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
+			       "Failed to restore sriov_drivers_autoprobe value\n");
+		igt_sriov_clear_exit_handler();
+		close(pf_fd);
+	}
+}
+
-- 
2.34.1

