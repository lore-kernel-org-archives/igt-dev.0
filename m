Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FAFCD11DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 10:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB10610E507;
	Tue, 26 Mar 2024 10:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPQn8YHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2567C10E507
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 10:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711447783; x=1742983783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vtTmZG1QsPQDxBN6sLLN+RgJI0YesNOrdGYaL4cWPt8=;
 b=FPQn8YHKOU65hTgbhqOwlEBGndX9K/EzjKvLzMV4N7ObZ5sU6Hsigk2L
 jD37NiLnUCLIENqcasaLJ/7fn2pOjZciVJ9n8iBOym37QhMcUzUy8fmW4
 BT8Oko1huZuKkwr4fGaKGW0cXu7zKexyvZhclkQHhQw5EVstv9LmfDYMb
 1O4ZsxpFteiLwZWxMAltKQ2ELSnH9zItPZumF0wfrpNXl4fXe2DwihzZq
 TnPXEjR6WXlKRaWvmYWqtAi26kkNF+biCDSSOnQrTBrl8inoXg0AYat9l
 80Bpwgs9ebbVsR4XFVpaof+QKHhp+K//KP40PYtv4Ow0dze0Bb0yobi1q g==;
X-CSE-ConnectionGUID: NmQkySNvRAWrRR4F8wnQ4Q==
X-CSE-MsgGUID: r/1Px0WzSCy5EWE10rPtqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="9456381"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="9456381"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 03:09:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="16302059"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 03:09:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 03:09:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 03:09:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 03:09:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 03:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZcknzegE47KG0qiKX5dUvGIPw9bRcuU7yS8FBK2q+8A3pcPtslTb1d28RywmADprK4hsqFNNMBwo9MMtg+x3fyyJSjmCrxTw+/AqmfvIHS4F5IJU6GhWPBVY+mKZzjt3YgeInQFixeOqBarrKK/pF6L+UlgzRICs2v9gUjgBrOQq4H0kLTJs3zwS9VDi3FWLB0BdAhZLydJRrm9x40aH004b3+YaHT2hs+NyrD3SAalSoF7MTELluAYanB7KUZoXCrdhHFjPAWnFPb8F0zqOoUpCaRm/R6+GkUz583YNVXR4HQjsrd8wHjE2ZubofP9NP80vnRwyadXSp2rLR24aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrMHrasEABoek44QIc/kAUhJlhgHa1Q3fiPRRAMvals=;
 b=Gn4IMYO77zNBx/hPHstnQxxFki1Hr0NXkmhs/GPnjM6mht8yjOSRLLKcrFH/mqf/CVTrJO/gfTvgikU9B9RpUGzLohElgW93dQWEFEUkSM4RswVNSH1W5quBJbpUa1iVF+MApwxDiYZ2eIcEsTR2AlX8nkynfMJ8cHqKjIbQ1jJY8qzjmLSgaRsnhj9hBluaHPfdnbDsFVjQfsdLgFLGU3gqNjLYm48wI8WwcTF7lk8cPKoyUsH8JViNABa9tWLbvj76mtKBuVkDj57LWzLgd7qBRgjcDSaLNdYRvxdpSSq9mx0xyGU4XmuAChDs9VypdCoahvIw3kUExLyQmHKv3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB8013.namprd11.prod.outlook.com (2603:10b6:510:239::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 10:09:39 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 10:09:39 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t,v2 2/2] lib/xe_mmio: Introduce Xe MMIO lib
Date: Tue, 26 Mar 2024 11:09:21 +0100
Message-ID: <20240326100921.3539141-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326100921.3539141-1-piotr.piorkowski@intel.com>
References: <20240326100921.3539141-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI2P293CA0010.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB8013:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VjljQuNW1w1cAkUUGIJjnCefYzoBbaNUKgJmi7pd2yCDtcGfRaFssQP8ekZokvFJU1tT988+TEyi3LCX2T8vpJWdbW48rysRuZTnYVAOcjDOEFWZL2kZKFpBaomke7Ur65ydPTEIDIN1EcSyl4j3YJpBLXGR6f40K4pT4QVODeEJYEsQbh7ijotfv39xiYckpgpcr00D0cEFqnXosqbFZBKnfE+x30tm9FKJqQwJNtlXLie1G3XkbbDnitMIf0UkSRBoAI8GIovanq4ZvU2m0uM1hztyAx0W2H1qXG882odvRxB3BKs2ErewDHxdD+SlCkBcK1fzwkyjVYipP2BAXmjxgvUwYsRejtVEWBuhmURLhM2Iz5ofZsDjmxxubPJ+Jee0NBlZHFds3fk0NA2iQotKTQP3Y9UU5Y6g5oj/SgSxZ4LaF0mxD4sTvTfsuSuBI8G7YzOojlNEodbe2JMG6SYITP67cmw26UwsVdgr/K9EmYYU7D23YJ3RMkSO9fKjgE/h5942XfOI9mFEiGqXlOz5ls0tpVFbLEHBXOBJwJHEcfTLbEy4RZPRegztJEJ6j+2aUBEciBxOAcMAnESsafk65kGO8yqmXUO6tP+2k3xqXehhcePlRIpKyQHyAYEsCCxNha5jRGEFY4x6AnlQRBJ6kzLeA266XnHCn+1Hwuc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enVlYkpZN1Rzd2pJTVE2ZDBjNzRGd2xnV0ZIeUlDVXc5WE9lMnVUU25WQ0RY?=
 =?utf-8?B?bmdOdEllbjdsT3dJMEpRMWNlR01zaFRLME5hVjlPV3g3S29jNGpDOFkrUjVy?=
 =?utf-8?B?YTMyNThGZzYyT2Q0ajZuRVIzQVVKanh6dXdFdXhiWGNiV2hSQ1Y4RHduUW9h?=
 =?utf-8?B?RG96d3VoRnRac3RQY2ZDeWFCUE02K244eXhvOTdHd3hLaEhnV0g0N2tWSTgw?=
 =?utf-8?B?WW1COG05aVVFUEFFQjRlaG8wa25SZmo0OWFVSUVQNFhwZy9nUFVIMThKRnh6?=
 =?utf-8?B?UFpGVnR5SnQrbTRXTm9CcXVqNm9vM0hYZ204MlZFeVU5OUU5WjJQMm5VaXVO?=
 =?utf-8?B?UHJjTzN2amx3N3NIZE9SWk0xVkt4d1VId095NDU0SGdpVUlQcUU1N3ZTa1ZW?=
 =?utf-8?B?NHhma1R1eHRFeFl0em9OSFJYUC81bGxrQWhkWEE3OUdXc0hrZkVBS01CVStG?=
 =?utf-8?B?dHpEakY3dys1QXAwRGhJakRKb21pZm1OM05KclVlUmJnSUM1bHNYdFQ0NjB0?=
 =?utf-8?B?elpXcW8zMTVRWlFsZnNCQlRhdWEra0NpRll0ZVJpTWRsVXI0bDlDLytEZkhG?=
 =?utf-8?B?VnJlSENsa0laYkwxTllDYWgxTmMxRWxUQmRUdFE2TjN6SXBIa0EvQUVDYTU2?=
 =?utf-8?B?RFB0dUMraTVEdVlHSjJoeC90blpkdmZlUDU5NitoZkdGQVEvOGw4SytTT2Np?=
 =?utf-8?B?bEZNTXoxRC9TOUxnbnVUMDg0WU92b1o3bk50ZFZoYkFJbmdiZ1hRbmtYSTRZ?=
 =?utf-8?B?YkUyNEVpS2VPd3FNOVFoUFFTN1JPRDhzdDcxN1RiaWNkNG9qOWRRaWZFblMy?=
 =?utf-8?B?U2RXT3pHaGp5bWMxUjF1aUhLVW9KWUxOWFI5c1c5Y3FSWlpqUUdZUVQybXJz?=
 =?utf-8?B?VUdBdncwSE5DZTFoZjdOR2luRDNGLytkODB3VllQZVhMNnVoempacHRrOUs3?=
 =?utf-8?B?c0xPd0QzUVkya282RmpQZkdYUmc0TVlWRmVQdzduUDVLTlV2emJ2d1hFN2hG?=
 =?utf-8?B?bjVJZ0RBaGVOcUpOMlNmNitvZ1BoWmFJeVdpUytMVjUwdDFvUnlwZzdxTitn?=
 =?utf-8?B?ZitlampFODFVdFAzbnk1c3ZzZ1E4bVgxcDlKa2xEMDc2MklNS2pOUVVkSTho?=
 =?utf-8?B?QmdOVFBaVURuS0N0MTU5MEF1S213THhNK2tNbGM1cFVJSm9kV1RuOXFmYTVp?=
 =?utf-8?B?bUJCN1FZd3d4YkVxaExTMXRub1k5ZVFFazZKYzhNZ0FJcXdvQnlISUc1UnpF?=
 =?utf-8?B?bjhubHBkU2dSUHY3a2VPSERBMVozbllGQTVQUGkwM0ptTEFwTXh6NkoxV2dI?=
 =?utf-8?B?Z0g1SGlvMkF0QjA0UkdmNVd1WEduV3FCRjVaOE9NenkvUXBTdGhFQVVoV2Fn?=
 =?utf-8?B?WkpsajNBNE5HWVNjMFlEYUxDTmdxUVJycjE0eG9aRGhZOG54UlpMbGk4Vm5V?=
 =?utf-8?B?NUJFczJucERXb0UwVmIybk9sNk9Jc0t5Q1ZYWE1UeHV5RXZZVHBoSm5lOTBR?=
 =?utf-8?B?VjZkMnRFNCtoREFMcVhyOWJSNVh2MlVhVXgreG1xa1FnTDJXOUNidXZZSWpP?=
 =?utf-8?B?dTRPektuamdvWjl6bktjTU9mdzZUNm11d1R1eHBRTGVRM2lpQVZ4VmlxMm5j?=
 =?utf-8?B?SXM3QVY1R1gzUDIrcVA2Z1BmSlRPYnMxN2RDakdGNWU2d0JRcnR4Sjl0UjI4?=
 =?utf-8?B?SkJRQjZ6bDREOE16dFh3ejFpSUpacGh2MmI5azg1YkNQV0UwRThiaFNXMnZr?=
 =?utf-8?B?YThoN1R2d3RJc09Sdjc1bUFJbFhqUXZBTldsMXBzcDVUV0t3dEhBd2JjRVFX?=
 =?utf-8?B?NnlJSk9DV1RoUHc1M2dheU9rUFk5VVQrTXRoMXRvbXBlVURVK0JrMitLNnh2?=
 =?utf-8?B?d0xkdmoxWHRlTlZKbGRaSWhleFNoMk1UU25pWXVBaEtmVEFBeWNtb0JGUXNr?=
 =?utf-8?B?UFNBclNHOWlkMS95WnJPMWc0dEhPMGtqcVo5UjFDNTNoS01WdWh3MUxSSzRI?=
 =?utf-8?B?Y0NuN0VkdzdhREMrQnl2WFJEUDBrdkdGZlBqWHprNms5aFlWYlArV0dvMnE4?=
 =?utf-8?B?TExaNG9VRll0QVpxN0V6bmgzb0NhTVpQaDkrRmE4SzJjalltZm9RVExSWnlW?=
 =?utf-8?B?bHAzRENDL0FJNCthNkpMbkd4WXFKQkppSFlJaFQ1NHI2a0VRQ0VDMDZZUXlx?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d735c6de-dc8f-4dcf-a38f-08dc4d7cd948
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 10:09:39.8156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNyc5oViVi/7sIj+I99Gy0mVn3n4+OonBNC9MJKTcNNccCH0kaNI2e+uwuSyuueDGtPoVujWrDOabhrKtTliIn7YQbPrlJER8eDyFxWvINU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8013
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

Currently in IGT we have a library intel_mmio for simple MMIO operations
on intel GPU devices, but it is limited only to accessing registers,
has a lot of legacy code related to the i915 and offers no support for
multi tile.
Let's reuse the memory mapping from the previous library and add separate
helpers, dedicated to Xe, for registers and GGTT access that support multi
tile.

v2:
 - add missing std ifndef/define in header lib/xe_mmio.h

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/meson.build   |   1 +
 lib/xe/xe_mmio.c  | 207 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_mmio.h  |  42 ++++++++++
 lib/xe/xe_query.c |  19 +++++
 lib/xe/xe_query.h |   1 +
 5 files changed, 270 insertions(+)
 create mode 100644 lib/xe/xe_mmio.c
 create mode 100644 lib/xe/xe_mmio.h

diff --git a/lib/meson.build b/lib/meson.build
index a5651571b..e2f740c11 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -111,6 +111,7 @@ lib_sources = [
 	'igt_dsc.c',
 	'xe/xe_gt.c',
 	'xe/xe_ioctl.c',
+	'xe/xe_mmio.c',
 	'xe/xe_query.c',
 	'xe/xe_spin.c',
 	'xe/xe_util.c',
diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
new file mode 100644
index 000000000..bd4227f25
--- /dev/null
+++ b/lib/xe/xe_mmio.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#include "igt_device.h"
+
+#include "xe/xe_mmio.h"
+#include "xe/xe_query.h"
+
+/**
+ * xe_mmio_vf_access_init:
+ * @pf_fd: xe device file descriptor
+ * @vf_id: PCI virtual function number (0 if native or PF itself)
+ * @mmio: xe mmio structure for IO operations
+ *
+ * This initializes the xe mmio structure, and maps the MMIO BAR owned by
+ * the specified virtual function associated with @pf_fd.
+ */
+void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
+{
+	struct pci_device *pci_dev = __igt_device_get_pci_device(pf_fd, vf_id);
+
+	igt_assert_f(pci_dev, "No PCI device found for VF%u\n", vf_id);
+
+	intel_mmio_use_pci_bar(&mmio->intel_mmio, pci_dev);
+
+	igt_assert(!mmio->intel_mmio.igt_mmio);
+
+	mmio->fd = pf_fd;
+	mmio->intel_mmio.safe = false;
+	mmio->intel_mmio.pci_device_id = pci_dev->device_id;
+}
+
+/**
+ * xe_mmio_access_init:
+ * @pf_fd: xe device file descriptor
+ * @mmio: xe mmio structure for IO operations
+ *
+ * This initializes the xe mmio structure, and maps MMIO BAR for @pf_fd device.
+ */
+void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
+{
+	xe_mmio_vf_access_init(pf_fd, 0, mmio);
+}
+
+/**
+ * xe_mmio_access_fini:
+ * @mmio: xe mmio structure for IO operations
+ *
+ * Clean up the mmio access helper initialized with
+ * xe_mmio_access_init()/xe_mmio_vf_access_init().
+ */
+void xe_mmio_access_fini(struct xe_mmio *mmio)
+{
+	mmio->intel_mmio.pci_device_id = 0;
+	intel_mmio_unmap_pci_bar(&mmio->intel_mmio);
+	igt_pci_system_cleanup();
+}
+
+/**
+ * xe_mmio_read32:
+ * @mmio: xe mmio structure for IO operations
+ * @reg: mmio register offset
+ *
+ * 32-bit read of the register at @offset.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t reg)
+{
+	return ioread32(mmio->intel_mmio.igt_mmio, reg);
+}
+
+/**
+ * xe_mmio_read64:
+ * @mmio: xe mmio structure for IO operations
+ * @reg: mmio register offset
+ *
+ * 64-bit read of the register at @offset.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t reg)
+{
+	return ioread64(mmio->intel_mmio.igt_mmio, reg);
+}
+
+/**
+ * xe_mmio_write32:
+ * @mmio: xe mmio structure for IO operations
+ * @reg: mmio register offset
+ * @val: value to write
+ *
+ * 32-bit write to the register at @offset.
+ */
+void xe_mmio_write32(struct xe_mmio *mmio, uint32_t reg, uint32_t val)
+{
+	return iowrite32(mmio->intel_mmio.igt_mmio, reg, val);
+}
+
+/**
+ * xe_mmio_write64:
+ * @mmio: xe mmio structure for IO operations
+ * @reg: mmio register offset
+ * @val: value to write
+ *
+ * 64-bit write to the register at @offset.
+ */
+void xe_mmio_write64(struct xe_mmio *mmio, uint32_t reg, uint64_t val)
+{
+	return iowrite64(mmio->intel_mmio.igt_mmio, reg, val);
+}
+
+/**
+ * xe_mmio_gt_read32:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @reg: mmio register offset in tile to which @gt belongs
+ *
+ * 32-bit read of the register at @offset in tile to which @gt belongs.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t reg)
+{
+	return xe_mmio_read32(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
+}
+
+/**
+ * xe_mmio_gt_read64:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @reg: mmio register offset in tile to which @gt belongs
+ *
+ * 64-bit read of the register at @offset in tile to which @gt belongs.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t reg)
+{
+	return xe_mmio_read64(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
+}
+
+/**
+ * xe_mmio_gt_write32:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @reg: mmio register offset
+ * @val: value to write
+ *
+ * 32-bit write to the register at @offset in tile to which @gt belongs.
+ */
+void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t reg, uint32_t val)
+{
+	return xe_mmio_write32(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
+			       val);
+}
+
+/**
+ * xe_mmio_gt_write64:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @reg: mmio register offset
+ * @val: value to write
+ *
+ * 64-bit write to the register at @offset in tile to which @gt belongs.
+ */
+void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t reg, uint64_t val)
+{
+	return xe_mmio_write64(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
+			       val);
+}
+
+/**
+ * xe_mmio_ggtt_read:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
+ *
+ * Read of GGTT PTE at GGTT @offset in tile to which @gt belongs.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t offset)
+{
+	return xe_mmio_gt_read64(mmio, gt, offset + GGTT_OFFSET_IN_TILE);
+}
+
+/**
+ * xe_mmio_ggtt_write:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
+ * @pte: PTE value to write
+ *
+ * Write PTE value at GGTT @offset in tile to which @gt belongs.
+ */
+void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t offset, xe_ggtt_pte_t pte)
+{
+	return xe_mmio_gt_write64(mmio, gt, offset + GGTT_OFFSET_IN_TILE, pte);
+}
diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
new file mode 100644
index 000000000..96bba6e16
--- /dev/null
+++ b/lib/xe/xe_mmio.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#include "lib/intel_io.h"
+#include "lib/igt_sizes.h"
+
+#ifndef XE_MMIO_H
+#define XE_MMIO_H
+
+#define TILE_MMIO_SIZE		SZ_16M
+#define GGTT_OFFSET_IN_TILE	SZ_8M
+
+typedef uint64_t xe_ggtt_pte_t;
+
+struct xe_mmio {
+	int fd;
+	unsigned int vf_id;
+	struct intel_mmio_data intel_mmio;
+};
+
+void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio);
+void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio);
+void xe_mmio_access_fini(struct xe_mmio *mmio);
+
+uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t reg);
+uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t reg);
+
+void xe_mmio_write32(struct xe_mmio *mmio, uint32_t reg, uint32_t val);
+void xe_mmio_write64(struct xe_mmio *mmio, uint32_t reg, uint64_t val);
+
+uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t reg);
+uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t reg);
+
+void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t reg, uint32_t val);
+void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t reg, uint64_t val);
+
+xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
+void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
+
+#endif	/* XE_MMIO_H */
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 53a2b4386..c885e3a79 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -731,6 +731,25 @@ bool xe_is_media_gt(int fd, int gt)
 	return false;
 }
 
+/**
+ * xe_gt_to_tile_id:
+ * @fd: xe device fd
+ * @gt: gt id
+ *
+ * Returns tile id for given @gt.
+ */
+int xe_gt_get_tile_id(int fd, int gt)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+
+	igt_assert(xe_dev);
+	igt_assert(gt < xe_number_gt(fd));
+
+	return xe_dev->gt_list->gt_list[gt].tile_id;
+}
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 82af2706d..b1b3a989e 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -99,6 +99,7 @@ const char *xe_engine_class_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
 bool xe_has_media_gt(int fd);
 bool xe_is_media_gt(int fd, int gt);
+int xe_gt_get_tile_id(int fd, int gt);
 
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);
-- 
2.34.1

