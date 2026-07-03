Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EA9C43602
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5C910E0AC;
	Fri,  3 Jul 2026 14:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZqvuKp4c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F004A10E2E7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088946; x=1814624946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FpEDldTp36GxIyKiWvdE0QprUwf0Ltovu8yngkbu+1E=;
 b=ZqvuKp4cfsyZW8782ZmHKBUTGf24o2694eLwtabAJ54dSux8gUUSkqYg
 3pZXWkozaXTNJ/cadL/Y1FaxBWGBYoBoiPiUIJoQOyObh6qZ8rzPFo4T4
 PcT8E/7sPeksIE+t+yxHbhUfH9mE48PmDe3CnUO3zY8vBkkyrOk49FP2o
 l/eVh8mJyx5FK7tugqCfa9k/OrhefMjUQ3+Kw9uqr/rNuh6tkItMaKKRF
 TPJ3docwUph7E/its/lOlt6Zd50W/U81DGQfWVAt+PIYWJvicny7rxkKo
 Kfh5eki5OFVTWVZLscGCk9d1U7PcbmdWeI/2N6NOg3Les02RgCo2zm5JO A==;
X-CSE-ConnectionGUID: wAAcC263QVawFQXRLyLQaA==
X-CSE-MsgGUID: l5pKzUq5TbiG94GDzakWtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101264062"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="101264062"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:06 -0700
X-CSE-ConnectionGUID: cScWwipEQRKD7znRk/ZmRw==
X-CSE-MsgGUID: wpVFfotFTnKr9/4BBB7YbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="257019487"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:05 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+RSimQgE3e5Wadj08I0KWuh3KrMG3YSgsHkABnVDoyNtwck7owtqEyRkKk3w0oe6yq7ptx2JcW4DwbOXj9RZs+hzizkY8jAFSK/hW5U9/UtMjY0q8iowMOWqn3Y/hY2FzS53eMZNM+cLaFW8DTfllllZIU86rce/ec+KB0z0fpTg2ElBQU3gBQ3S9/ps+QdAKUN92nT2/JRWkuybSnbxWvco3ZF6ifRyKIoTam4MnYr+BkGlbHvxFk20AY1DjGX6hjMSmu10rBtvP8RDdGXKSFVWumL9i4PihR89F5ENnaFyeW3dtfmKKrz6Dc2bEsh3F5vFScsI2frPJibQaO8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uc6AJTcF3/4AK0Krr5OYwqOM5WfdHINfdOBGeAcgFl4=;
 b=gOR+rQ6sQ8gPdbCxiJN5minAadO8UEZ9Inlo6leAfMY2cAUomhxrU94hX0KFDLx3rnn1rZaGi/FfMWOl+FOr6268c9Jep1R0Q7w0yh9WjBc2sfpHn21eNcaaddG6sSAUQhKgGMtTSveehmd8qO0mpqJbIybA0NSfaKXnMV362vtyGe0AhnvkO6/1Ugr/tznQvxljoeEwpvFiHGO6GMkgR/uj0yuKF98lTCuQbigWi/HuQH7jGOLABrPOxHcLgU7wZaNinn5idG0BM9Crzpricf5fI2PLsa3EZBb0UxjxHXGABgNNT83ulyy447yr7YH8o2IEJJ7RD83fqbnSZznnCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:03 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:03 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 13/31] lib/i915/intel_decode: replace igt.h with
 minimal headers
Date: Fri, 3 Jul 2026 16:28:47 +0200
Message-ID: <dd67797503576f6bec6d0f7cb7c10997987b17e9.1783088106.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783088106.git.sebastian.brzezinka@intel.com>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f4e2e55-1a78-4d27-f27d-08ded90f6e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: e07KOmab8mQTZRrExga76xL3fTqZf1BKkzh6zon/Yxgb/kn/ax2jYPzBuzsf7uEsxnXNkW1jo8Y7Q6xeOqNx9211FnAUibqlTgJSnmIS6GBkFjp1Ns3IfUcYXLghJ2igVjp75ySNdoXeOS5fB9pSs+kz+WWjikneOSjxLX2mASokLvMngQSlZkC+Pw47tBGt0sSkXy1H6Eg8peXryY1i2TDPVaKmUiucz0HyoObSgWv7IbNhcBcDAXud/v968xqb1vYmiLDN2m7ESyLrwCjinlZ1/WhbXa3HXVA+GRPK6XCFFb6Kp7UDZpOlfYsGppS7zaM/U3D86DzFzuKM5Eme9pwqHPC/cq1anNSJAqHztJTHm1zaCEfu9Nv23NczNUDdUfuKB/2NhEwnYiySDqbCoZWYD2e1mV+AXKPS9SEQb0c5GI9D5eaE3AuPQGe7ctreVbmpJc4cQAVL+HcyFzWP9+OAO5gyYFOm6TKmVF1zbJYVwryHJtQBY/FugM27z/YtOjSH6HkCybEoZcuhc+xuBtY7qJiTFYsxE8m3u7/moRN7wFAfcZflDpkRJF1uO08OkuGRZ8QcLKkZCeIahUJ81UNo2pI1MWExl33vzi+U6SxwF3DspABjvWe/lBG5Z5x4R0YVPb7D9xSypzWAPVRO5IhnvULH9MhmOfNv2ror8pQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IOtDwHwcibjCzTxH2GEzpoFSccK/KFo/1csQz8WO4T6LC/G9DxwrAwiRzl7G?=
 =?us-ascii?Q?nKoeyNkiBFKIuF/locmHPMUyftxrtS+P4f4OYv8thKiFNc4eMuf2FlpFvbfd?=
 =?us-ascii?Q?vPb54/7hHfSyO4ccdyIY/2LUmxU88l8Ha+FR6jUcqbhh4pB1D9RhQBn/Ut68?=
 =?us-ascii?Q?3AZmYgRVo/2kJmqQPY9bF71UyyHMD5Zv42Y2hsbcnBZFa67y7OFe1ghqfzTU?=
 =?us-ascii?Q?i8ikb50Y/BjRpna/Fs+/3QlvVBbf8uCRz0LwdHU7FmLjhga3g1aTGCknnSlx?=
 =?us-ascii?Q?O20riP2159/OeMds2i1LLd9qD6FcT8uCrrFQqo9zuLFIxyLHBQ2RLHj/rcMC?=
 =?us-ascii?Q?+jcnOyTr6iYvCtiwUjtW8yzJyfo7QhroavEUHr5j2n7LZ1RMJEiRGQnWiLS4?=
 =?us-ascii?Q?3tTn9mzBuK3ETIEpwNGB1q7DDbeaTPoEB3OInuUQyAT34vTVc4oSgFDRNxrG?=
 =?us-ascii?Q?lAC09RVQ8l7QXpykppYWNF6fLTlUaOuuTBdDGn+eDGFlaFyFPkGYtH00Qq20?=
 =?us-ascii?Q?N7U5q1y3im8Rc1+i6hH5OPuyyoYGNaO1DUTu6+oxshiPEMB1Qf0EVLWOJy6T?=
 =?us-ascii?Q?OLs+P0UnWWTrP1z0M4LQxVI3dzQ9PV3vkgKEelrNaWIgREs0Qs5tDkxKOr6N?=
 =?us-ascii?Q?z/cJFL0o1JWdw9wFfDVPSg+OQg6YWnzh0Jk22uUj6VxeZ22XCWLvm1CUrsxf?=
 =?us-ascii?Q?6tm70FrTQdf4yTyPHKIQorphjIPWR8d1VLWyvQ4YfQ5X3XUi3UjTVLJ5jQDY?=
 =?us-ascii?Q?zSGm1gw2lL5XHFSVTJb44gB+PQusu5FalPyurrjjNYKqAIMkWlysHP9EEpBO?=
 =?us-ascii?Q?GcHfbQqWz0yFIhDI1tKA6EtTcHLhTEnVk2UwAm2eGBM6t+CFBcm68jDHYp7y?=
 =?us-ascii?Q?jkO1/fs2CMxD01ywOqnxPCgZF+kFOYX14HchvpWP7oDCs4sWfsEki9WS74QH?=
 =?us-ascii?Q?Z48GPJ+uOfThYs/FvZgiJ24QvCnw2ZzR81b2GrYPCh6S8l7oUujekzhebzUS?=
 =?us-ascii?Q?wMl9cL/0EqtWqbvel4rL3wqqlzuz2bAp6n6xm++j/HzR9jxo2UIA4sz8Zq0Z?=
 =?us-ascii?Q?b0aS27P/gK46Ziev/BDFNw1fDdr2jCqHox4PiT5evs3MN7BgslkGeMFQzQdo?=
 =?us-ascii?Q?sf7vcTjcKR/dE/R/8UouSeC6O2Utk3ag5bGrKtMCF92Q/JlVygOdyuN1HmDm?=
 =?us-ascii?Q?Dd20iuDsCXARrj68ksgEg0syW5paXVpJP8p6jBBb071AYF5Rfz1R0/wsrCGZ?=
 =?us-ascii?Q?sk7Cx15HDZ82qIadcLMHWiNgqTJSc4KZfD16cKt9cH//7onQfVBqpiHkBF9F?=
 =?us-ascii?Q?mbOPJnPiNLlymFRltH3v6wF6jTJ88n4CQdRiWRsPApAVAj1p2vsT1QUlY1EZ?=
 =?us-ascii?Q?tWQmtDO3nyvD+rAFQlliUV2aDd0GU/5dhHHXP9NK7jx2py8pCFboAhz9fps3?=
 =?us-ascii?Q?Ch4tv2QAWEAcj2KNhTkxp9lBlj3dI+BJe+WG39YJlsQXE+zjrSjbdp51D0DN?=
 =?us-ascii?Q?hIwrioWW2kjZdDZH6FatSVjdrUqGb6RmsdLeVq123Ekw0l/8dO2VY0i+2BZh?=
 =?us-ascii?Q?ikCmpy2idNWYTd6nLExO2hLzk0nCtIVjzVylQAika66usJkY8UmE22pZFwk2?=
 =?us-ascii?Q?Bya34mr4HrIMUWoUnGxpdGd1URSI2AMP0LjWMf2conDdpCA94DTOJmXFSx1Q?=
 =?us-ascii?Q?Vu+tXV3IYFqkFtaokQGSQHXXREAX6SYE5JaT5KEGTcvvDqqNXFU04c45cYIt?=
 =?us-ascii?Q?7vTzDCNcetBU4qpFL9iYioOef/Df4yI=3D?=
X-Exchange-RoutingPolicyChecked: KvLNwSwLrEskMvvoOCWjo7iF78TJxTYGtDQtzNrnhv1wpSG2qZrjxs8X/WxGeRFpa+rC9nAdngQ+I+v5sFfs+9JJenvoU6ORdD+J704XL6Fv2BFMDsa2gN75jo/yixmb/5rN0rzQdcNz7Ipd8yO+9OEvJOR1F3HtgAUT3mbjKOlXV5k2umjp/j/nR6yCiJhbbOK7LCX+F177gThWPWxYyDOVKEjbUGIwz7lNmtTDdGgYSP63Ryz2z70NlEDQ1PywrDsJ1Sfp7cqXUIj7mP80JYSRvGyYN7LGJshQ0kra/Ae5PKgaOeJcipkPH2qn2OvQ2Y0arzGVUW/7upwF/YdRQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4e2e55-1a78-4d27-f27d-08ded90f6e54
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:03.3249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQhmEF79WcRW0hNVZL532ExQn1xgECZVSs8AAijjRVHRpVb498LQV+LqIoJVvvj97vfkMFvYjX4nfqFjNDUARrzUuWXLXxrUY92Rvk8NKcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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

intel_decode.c only uses two symbols from the IGT: intel_gen()
and intel_get_device_info(), both provided by intel_chipset.h.
The DRM_PRINTFLIKE macro used for the instr_out() format attribute is
provided by xf86drm.h.

This is a prerequisite for building intel_decode.c into a static
sub-library (lib_i915_decode) that tools can link without pulling in
the full libigt.so stack.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/intel_decode.c | 4 ++--
 lib/meson.build         | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/i915/intel_decode.c b/lib/i915/intel_decode.c
index b78993c47..d4a4da4da 100644
--- a/lib/i915/intel_decode.c
+++ b/lib/i915/intel_decode.c
@@ -28,8 +28,8 @@
 #include <stdbool.h>
 #include <stdarg.h>
 #include <string.h>
-
-#include "igt.h"
+#include <xf86drm.h>
+#include "intel_chipset.h"
 #include "intel_decode.h"
 
 /* Struct for tracking intel_decode state. */
diff --git a/lib/meson.build b/lib/meson.build
index 43ae4ce66..aa8eae68b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -432,7 +432,9 @@ lib_i915_decode_build = static_library('i915_decode',
 
 lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
 				     dependencies : [lib_igt_chipset,
-				                     lib_igt_tools_stub],
+				                     lib_igt_tools_stub,
+				                     lib_igt_drm_stub,
+				                     pciaccess],
 				     include_directories : inc)
 
 lib_igt_reg_tools_build = static_library('igt_reg_tools',
-- 
2.53.0

