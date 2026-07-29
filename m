Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EBAC53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849F410E4B4;
	Wed, 29 Jul 2026 11:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ft/g08TJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FE410E4B4
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322990; x=1816858990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+1R0hz7YsXG7LYVtYJBkKUeSidQgODBZFvoHa2Q08EI=;
 b=ft/g08TJy6omUzzwyYw8nJWjMLqNy2SeGC28cbepqGI7U8d2ObA0aQH9
 UkAzdGj0UVo79wIi290/qdF6t3uesCiNtcJDW4YvFjT1bLgEerqLlLO6u
 AKEkDak8lPsj6ndF8QiGidtwhYzGnUpktuUaS6gt2hb39liyG0tDStxID
 l+K4fXTUbJzXEp4BgwgoL3/59JvNGgIPOplB3rX8EbQK6OCwCSPFH+5g7
 JwA2ACLkpbbcpIaYacik7y/sTe1VLdGIhgimQxnw7XySrkHhOZ88gEZJD
 Q0QoNrVDU9+D0aTO1WUEZUS49ijRM5gjVFnDp3pYmN+IjflsiPKwEsTZZ A==;
X-CSE-ConnectionGUID: BIF/r5BASjekkfWUaiQUyA==
X-CSE-MsgGUID: bdJX/a9OQPGwK5oO/2s1Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108718994"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108718994"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:10 -0700
X-CSE-ConnectionGUID: VVKVDrAPSWmqGwF6+6N82Q==
X-CSE-MsgGUID: YPKcwQsXS3icE2h/wAjiyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="258204776"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:09 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQPTNl6jpV9jfCnZwR/xr3+5JrdWIKYLL9sMLbuEqb3JGtwoUjjTUKWRMsGub4FEe89wstCWhehkUFmM14PCOJNyWA8We1fwouj9aOp0yAIcxUrg/U3zn1DGf7UG5NfNEUby7ZRQ2Hmr0ahQXGEKn3wlWki19dk0EHp/4BicKzvhSgnpeJsDD93SLPATBRgoo0Lq7S4T2SrJWNLDqC7pOWGWfqgf4BhlHvUmt8Z+MUOcpsqeS04rYSHeKsbUsEPcMUuGMrW+whgiQcGpis3spDKSba0bA6DiWFNY9hi0EnbfHk6mUoXhA7w4NcU5CKI19n9lXzke4mIV+1bCqMzWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwtDigkm1A6yNuO+SzS4PxQw+w5i3za4knJzjr0CglA=;
 b=U6T1JgGF3RVei/MS6vvBECVecHFarHEQeYcSLKf1LXsmA3mzK6c0dh0+/UjGt8sgO2eesdMe6HJwbtXte+ARTDiuur1k+2QauVYT8/TAfZo0EHfLsAOLrliuiwj2E8lVDaR/YraW5i5h86AVMz8DxUp0SUA+Buzlva4b8KlTVVqRqaDEMiHWA3MNthIPhTfeohNEXcT9SpI+SNFnF/jPbW5aoQOjNj+g96y5qI8ZO9gY1fV5q0O4E7AoNL4KdH6tG9VwnpUnJ0rr7izMy7xxV8aPwYQqgXKIE/D6EIo8lnxOb4oqSjtjx3M/b26sQVwKwN3iAZSpBpFSy7BP0u9ccQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:06 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:06 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 10/31] lib/i915/intel_decode: replace igt.h
 with minimal headers
Date: Wed, 29 Jul 2026 13:03:27 +0200
Message-ID: <005fcfad1dfd13b9e8dc56d64a6da59e8c5cc1d3.1785152675.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785152675.git.sebastian.brzezinka@intel.com>
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS7PR11MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 0643ca82-2775-40ad-e235-08deed60f789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: jAvJ2HG88N7Hem2WEbupGbZNqgaBuGW+rzEy1GD5WNT1U9Sa7h+WZmNmZ9366urF4evNC6AbvlmfnsLlWMgxB4tc1qe9x+tXkDR/eau0dDZN/mVK0GDkNuMqY6/f0V2Dbb5F+3IKZxh2C3ZGahFL5QQmKipjMIAjYF3wcG2ijzlhuWS+0YPAVzXffLA0v2XMABANw/Sso4zBREI0p+6BbfxoR5Q0/Y6x4fAuCowmCaRqgaPgxkuiY3Yj8J1smSQjjo7/5XQ6J4Cr352RVXaOFBIk/oRd4/sOpgIvsM2aw6kGQxB10vxvXcEPGmsLx4H3wcUia1kCCqkyaqOf83uXKZl5/WsBr2oluYBCshk9Z3FCVrFisbkiL5vNNL8H0pXBxLENFaetTs8YYXlqS7wO3f/LfdQzAN/Kq5pdt1SYhh5fsmDUdnNE7vKyRSmkT8/VqqWmbD3rVJiH0FS9gjWIyWk/20+nbMvpHKzolaMxY56hVw50eshzQCijYf+tcCr9oBiUIU75dWVzFgOzGE9H9cHJ+aehl6era7za7JeVoeq3biirtlMnEN1XNfIf7hDSHDmuExTDx5QfuyRnt3LMrZo/0dA/Cp9/NIhjzFFhHG5TurIxwVG0DRlbGATZ/9+2HVd84L3+ovxMgazvT+AJLGp1WhbuZV3U3JKqDQNlUZM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KrfeVFzZun96ajx6begw6mdXwkSxLO7BntrRO1adptYBZfP7JZsK2M557drI?=
 =?us-ascii?Q?A09J52OKzCb0H8+dUfPUVsjwpQHYH2uZQPQAA4ggZwZKH3aycn0LlJFnVDS1?=
 =?us-ascii?Q?VXw6SDtv3oaM9bJbhIOCSHa/Zfq3nlUWNATDAmRzxM4kZmca6rqnXMHJF0CX?=
 =?us-ascii?Q?nc2gXl31KEmtK4l0hFKtrUGjR0ss1GRRITt7g5nV9jksNJpchSHkxjaMO+GC?=
 =?us-ascii?Q?gTUQJBQq/fJB1CgdwLk91LEVZ6JyCa5AnPoZecoFTN3LjZN57gFPFbXRkpYL?=
 =?us-ascii?Q?dJTFpkaybu1DxR5meC+P1EVa9sBoeeLNCS1+SVefMJu+pIQDZHhMUr+i9ooM?=
 =?us-ascii?Q?Uk+F7Xv3iCB3yWihoIpEbhxTs+PNqgNzPbfzrs7qCC3aWWISNJyGFKJpzYVX?=
 =?us-ascii?Q?WazVQosZBUrtVrjkVTnYGaD9FeuQNC2eFE4cxTpG6VJLVyVwWi8IO8DU1SVq?=
 =?us-ascii?Q?Ugqkb413YMT6Xjybuer9whBR8VkfIMjLW88kpoKtG4mce6a9HxUf2MEIgppg?=
 =?us-ascii?Q?jTITSDGkpw7cjrRjHrRhd9mcUGbpfgjVb6c2uWKQ1OLgwBlzDb3FUmif0+We?=
 =?us-ascii?Q?YiGLxv5RHOhnVRy4DC6p7MD7bry7uoNnJOZX6Dd42KhApu7V7pXE8ggrgmX2?=
 =?us-ascii?Q?W6aVar6uVSp4XzT0ZjummUHAVN3bgxRTQWEOc5+ZIosqlVlN1uDb33SyubkX?=
 =?us-ascii?Q?tU76Ck6B2QaHdCn9ym4EZviatF2i0HShqpVdWJLGi0zFlC3sU3uJIFqm2prO?=
 =?us-ascii?Q?LImLJmWN0ZLk1euH1IeG25C/7S4iZyqM580Xg6shm8mP/yvj0/tnPqmTP0iv?=
 =?us-ascii?Q?AcMT+57CT5z3l82cD5QEP6VVAIFjMLJS2fCrjwMuks6zZq/deWozvNEczJlI?=
 =?us-ascii?Q?B624izuRBb0SAzP+w/ZeQu93lsFnzRDFkGrALW5yUk0clVjp80FA4BklpEeJ?=
 =?us-ascii?Q?iZyOhFBPfzidG4dW2JT+IqiekeoGnGr8aHK4LMoXb1yVodEKJQqb8snTXEqZ?=
 =?us-ascii?Q?VuXMs0tb5odyFPwRwZRRuZH4ErbHQvOltHr/a/X7NZ1OuqE0WhPyM4VT////?=
 =?us-ascii?Q?MpSV48e6w30vZ9DGEruXijrYm+cIbehtXCiy3I8mWJ3+Nz5M8i/ddV1Mz7v8?=
 =?us-ascii?Q?EXnc830QZY1DuTvdne1sEGEFnrCN5sieeT/ilM3Z0AY6AxI6Nc09GIVBJTyw?=
 =?us-ascii?Q?VfoGMU204oUnig3CqsOlYY7TPcbgWOVIkwvaxI5ZhpJ9lVNNV+eORfIkG80R?=
 =?us-ascii?Q?FnxaTWDiVlS6GCo4e2Y1W3gXanh+OGKIBnpf4i/SGvD0RHqk/BVnQZLmscny?=
 =?us-ascii?Q?mIV7ViBnjiDyimJHkdDsptXHKkGXXOpYK4+jgI1hDrmVDsAKcF5hZ7OirwVd?=
 =?us-ascii?Q?9fMMOsnvKUDC8mUm1m99siokaIUfoFX+09+M8SAOWl/VCaEdULQKLW6Kj0n4?=
 =?us-ascii?Q?OJHRezzipvobSXKhfqc5tdmJUfahJzlgZzGncEEaXgSry5feh7XY7V4N/862?=
 =?us-ascii?Q?xFCq/0Bsa26guf3E8QlRz9+NAN9kf8PLuNBA5PzK5BJ2d/EZOcFEWc9seTag?=
 =?us-ascii?Q?rccfcwcConS5KOameqnFPKJRYxl5nhbEveV9mccg5c4hMI47PKqwmnPjbEB2?=
 =?us-ascii?Q?ozWdj5qyW2M9nFSVji3FIZKRpoZ9DgZdZVSZL+4nRdbP1UrCQcD64MpC5BQ5?=
 =?us-ascii?Q?8jvJtT5iOmphZn1F5RATquxNoVF0mkQ6A1dwWSphw9Twq2cI5WrtBsjotEaN?=
 =?us-ascii?Q?dZwxSMwO2LwmmzG/RvllelnZ79pbnuM=3D?=
X-Exchange-RoutingPolicyChecked: AISCp1ez89OIU+1l2rRHAOXF8kco9M4Zq62gt/dGbiE98AEObYtm+tunI+Od2bxadeUrWTf2/fXDTfdRGj/1le0uUxK1/ei82jRJkgD9mL9jz/c1hzuO3v/i8KKS3u3o6oYcv1dWG7q/+W2xvvOWZv+4IpCQW2perUu9K9mCBivb0fMorVJGUjuGaOySxg1RIMjt6XRb2s5IJJYkCCmQmgs7t8BLGxCw+tS/5VTeLD+NvxkTsq7atvmh3Zrb8QaKx8R+d/dPtejyuuBtOanf43x2htoYpYGlasPJ1lFYyyLeRxa1ESV3Gtx1LuOA/Yay00rfAg3QnAK5aO+P7hdVnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0643ca82-2775-40ad-e235-08deed60f789
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:06.1654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qn9u7TyHeIltWS8f1l0IziBnPhxHDA6CP5VlCihJs8tjwVJGhdvj3JWdDhzGD5mw/CUoybBdB0inxFcN6EhAE5HzY7Dx+I/vQvk7uahEETg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
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
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/i915/intel_decode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/i915/intel_decode.c b/lib/i915/intel_decode.c
index b78993c47..0b404ae53 100644
--- a/lib/i915/intel_decode.c
+++ b/lib/i915/intel_decode.c
@@ -28,8 +28,9 @@
 #include <stdbool.h>
 #include <stdarg.h>
 #include <string.h>
+#include <xf86drm.h>
 
-#include "igt.h"
+#include "intel_chipset.h"
 #include "intel_decode.h"
 
 /* Struct for tracking intel_decode state. */
-- 
2.53.0

