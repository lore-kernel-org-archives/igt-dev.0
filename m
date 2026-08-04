Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DB5C55172
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 10:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8753C10E150;
	Tue,  4 Aug 2026 10:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TjOvxkSk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1097210E150
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2026 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785839319; x=1817375319;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=h0993k6kBAwqAwvqFxa9pOsXb4Y0OHMtDlx+J3b0p54=;
 b=TjOvxkSkdqxhwnOveOkpzn4paUQMuzu04MmazAIAN0S552tYMPHxCtq3
 UrBSHHE7aBq2ppttIkeV6knM35hyjzc/rpDZ89LiznAmbScOP8wFDUHzP
 z4/zy/wgSEj7+E5dHw1hqznYXmvR09nV7rUFFARCPY+nkDi9UXzz8atZg
 g8AxHAKCEEk87yjjfkYIbJFi3VpeC6W7GUG2ExUJpIVnZo4tpS1ElWlN8
 ctdKUy9c0REnzlU0Y0x2td8bGJMz5IzmN0iGni6YIzmtmWS7WDw+ZBtnE
 xJmbWb8p8J2c6/5QhQuH2+9f82VMzH6kIm/maMKQIH0BRon57715jueIF w==;
X-CSE-ConnectionGUID: fVKfpjAmTAW+83b4VxbT/A==
X-CSE-MsgGUID: QlhWGNJuR1KZCqcD3MKVEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86156953"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86156953"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 03:28:39 -0700
X-CSE-ConnectionGUID: mnJuPEImRdqGm7HncMT57w==
X-CSE-MsgGUID: gc2GxYX3TGa9mEKc7SvKpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="260229521"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 03:28:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 03:28:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 03:28:38 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 03:28:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INSdGh/j/gZJAorsJCGq01Olg7w/6AHL7CpJutEEhEJTSav9pcmo3reeqENhLbscuvw8my5aPIFHALhqo/0jtwLgloFuTO2KJkMmJ+V1uTf5TNJPzglKvEiYegYCoK/DyF5w+TLwU5QOGHSfw+mgzzNk69RbqkuZrP9fp2seTZM1MvgG3w95MR43PQp4GLxjyBRQAPR0Y+47R1WnCz01FR2zZNbqFusjWVZTpLMGOXewBv3J+qZpKcUICzcTNPw53S5Y1tQoVQ0O6UamNghfCY5AIBID+4XUf6vmDFveTJmrvvdVHXTkI6lvgVYz3qfwUhT68MMGAw7WEvSvhFkXmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKXQvtHK8XtkLN9P/+Qk21gvyx0OL3dGRJ+nDYo90Wc=;
 b=n1m6FDgPrpJrDSM2XIUw/iVbYpwfsO2qDi/n71yucqacNUqVD9zXzIm8POviVHgqZt6qZMZJzM/JkU8fBggPa2MgFwvYKfqFlDp0n5LRRttjt8piTAkD3A57uWVvFKbBSAdwxkO8joYfnrLxUyN9cKqsE+lCROkh+X7d1zvTW534NvrBWciom51t7MzGeMf697e17Akg57JU+aQoo9OWnfJeQhE9j2ARpfctY+rpV4asJLAkcB5vC9ZL/EIlUY77k8mWnw30A6K66+6QsFdlCre5VvOBrsItXaSMGwnH4qOxR+jFIAh7AbZewOo+H6eDtUKmRppdizaVqIedD09aMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA4PR11MB9230.namprd11.prod.outlook.com (2603:10b6:208:567::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 10:28:35 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.015; Tue, 4 Aug 2026
 10:28:35 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v5 0/2] tools: remove unnecessary shared library
 dependencies from standalone tools
Date: Tue, 4 Aug 2026 12:29:47 +0200
Message-ID: <20260804102950.20892-1-sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2P250CA0030.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::35) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA4PR11MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 1387915f-4e26-456c-e4dd-08def21323bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: fW1asy5mKKV4JpCmCJTfIyamD/IvWCwOpW4+hyXRjXpRjN6Hg8qKOoAzvqbtl8/RF0AN6D7J0kdhQrPzeaFuBZ2iB/Rd+z8cNxMWbzdTNp4NS9ZJs1tJAGg69GwUTejO/pR8bt6pRd/U7v7ja83w5UNByZJ+GCDin6toD67NMap0qdb2EB4Vm++yt0yl56kRG0O6i7vQXcpYBD3bVphVDi7uUkYBLJW3c8IfGfy1Cc3txQa+XkntUxN6C651ERIoPwEOVMlJG8KE4UTuz18PHt2XI++QxtwOsnDZ2yfJBTxllDP41Y7P+aGxSYYyheLXz/PoUayw+U0UN3Zdmrz4EYCSeB19ys1xT2LCIWsThdbOT12xpj/o9gpGhUWujCaIAV69O5qYebUkdSiAOkIQPydfPzTdOcvjnEHAT4I0bCTNSYMJ+se0wN/7gbQhsvlctsBszP8kpamMMEo6q1t90Jc2aN5Rk6sGAPtD2q+5txNbiyZspFcHFcKJCeuE+65wfgFDkgvdXdQ+bOad3ZsHvPeWFCdGi5aO1lKdqR7yz0jV187A5uHC7yME1NDEZUhPwUWmcWvvdPkrgFgi2vxos0elgFRF2aL7XzzlSv5uUVpFB0xcQlA78r6UUxGa1CRN2H8+KSC3FFjynIxhpOum32c5dMA9NHxLTzjnASJGmc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nq0otimA1b1v7dvZOcHrEKPD3cLhLFkKWRrZHsmLXjd7tOTByEU2nYTTeEeO?=
 =?us-ascii?Q?HK1F+gwTapJEfk/kgP5peaCKe452aEqpnFqnIL86RmeOoPHaHIoVM2Ff1RH9?=
 =?us-ascii?Q?UDPdKdABu1tZnC58AtPhcJY85MpLkwFJRcIZIlAj5wZ9Q/HgQ7DAWs1Vqv+7?=
 =?us-ascii?Q?eDaCw4fVCwTxTh15Wh+5ymjqTnxibd5OwA8yFHOjXeSborlfr5eeoI3JCZuE?=
 =?us-ascii?Q?lubVYNL/TZlTuRC4Ls6h6BJZcmX/oTMWsoY1i7nSH1TtNppm4kyEwsQcFVIX?=
 =?us-ascii?Q?ntG13+rQ5Usdwz1V2HPFFV/w867yfJ3TEaTHioW9Nu8k+9v3NGaBv+JGh+1l?=
 =?us-ascii?Q?ZSilYdPrkWk5kx95zcrzaQwzO5aljzNQAfByN6PwGRNfBS4FuieQn1xdsaFF?=
 =?us-ascii?Q?K8Or1+TfSbp3O+g3C/wI25SYwDUFSpiC5uTonM975zunCUMjpWB8ZtXRWSfF?=
 =?us-ascii?Q?Qelm5U8S8IUujM21tM/F2gPqW8fFvx4DxchLhcCFGkuFfaGnktoHg3ewvUpm?=
 =?us-ascii?Q?iOxaVmsgte4ekn1xsrpq9Pu9/EuHlThM1FbB/VwfiS9ysZHZY+eUuYoaLBYY?=
 =?us-ascii?Q?ipkPoI6EO01mjhafdhKF2Ovu8nBRSr4jJjNvsET7tXs5I5HrvtDvgO7X6Sp4?=
 =?us-ascii?Q?qpV+YCAKmZpBFbmIlZYzYDEyfSuqZKpWURjaeCM5T6b4UW7Nh/Wn+SyVWf9m?=
 =?us-ascii?Q?/vFimruN5Ui3WbLUo+kgqo1W7eUkMBYZLjl45BDqzaDiiYTsjmgg4hRX9+8d?=
 =?us-ascii?Q?Cs1K4n4trz0tkG4QOzcpK6rK5VTek2dBUYAq5GHUT5f/WQWVlvmowQbBK0vm?=
 =?us-ascii?Q?RkRq5L5Tw5yOEdM112S1vd9haee4U1/+XqzLlkej2YrrAcUgCdK2yL1CIdo1?=
 =?us-ascii?Q?F8jWY21+OaJJ1nkbMvScBRdAwfPehdQ/nfACu4EmwhNgrXXEEaee9vI1faJ/?=
 =?us-ascii?Q?AlgceqKb+02/p787y5p6i9eL79fFG3azuJv5h+2T3VH9wSCiJQLrnyHeSpk/?=
 =?us-ascii?Q?mk1MAKXTG9k+xH9UzAyeiroFnkkCY5vuyuu1KKbiPyPMrgbr7CpUINUVQhg+?=
 =?us-ascii?Q?q3eTO2QmJ02iAjFx8dW8T2uTpANK9RgfJbB/YgXEcAI+h2oic9Q2ltwBxALM?=
 =?us-ascii?Q?XR3v0SLaQSc3ZjRy8LouTc6szrJqgQlUKMaCKay4qmfhRg8RVxVvoe/yA/Y9?=
 =?us-ascii?Q?GKF27OcmqsMF5D1deSPs/kZ1cLquPxGPjeDPGvClPvYZm7bKw4Olt26Z6uVU?=
 =?us-ascii?Q?Ux3O2Rz24VtklyrYhtvDDmy5jNMTnzDSKC+cqHW4FgPZimb01cIpEChqSNh8?=
 =?us-ascii?Q?NWmYhhs+F7MhJTQhUSxtxw6p1Gk0dtauPNKmuKLKrk5fl+QMshDDZcJuy0vM?=
 =?us-ascii?Q?33J0BNtOUpDIx6W986VQb/ZzMvYaRIJPyjoTrJXJRMd5kb935Oj9v5bPMChH?=
 =?us-ascii?Q?/XTX0XIiB3s26qNPzU1CbZ8yrsgpm491Q2yBTluoHk/c1otsMOgXS162Q+Ig?=
 =?us-ascii?Q?eHATezNbusryQZWBnSRQNpzNOVK7Vgz1CRnO4t7b9VKLe1jPZOn7Fwe6Nh+w?=
 =?us-ascii?Q?Kflstqk043S0/CuFiHE4eASZgcPVyYUggPWUdOPxOH++ZipCy/W72HwkKwkM?=
 =?us-ascii?Q?NP4S/D3M9G+b9OCSBs8K7UG5Wv9Lg4dGib/GQJF1HFl6nnl0QAwtF/VQ3ki6?=
 =?us-ascii?Q?uYJ5YcAym+RtC3QXPdXoWYUWXp10t2FlZObg8N7a9g79Ad18g9v1njmF11iB?=
 =?us-ascii?Q?Sh0o+RknpBPu0sdaxen+y7zxl5vIp5Y=3D?=
X-Exchange-RoutingPolicyChecked: LorWWFbUsu6xpVAETRXKhgPaaQa5ZBL47uLyGTPS2eEJPnu2atzTnFpVCOOMDueST1NpKgyyj+uJOeiXqd3136Su0yc4peZe9lAojaor9X/8BkVHOoKiyrKLbdCY8aU8Zqisx/0Nwv0ZugwzOdANJ9vKjOmP2cYRMDCwAKxTc8Pk8Nqy9/tMYm6psFsEbmP+saLj5QWc5Dc/0nh5nLdIyZ9AxtYP5Pn3a8FSGrfR6uD6Kd/1zO1snowAWhKnCeK8KmVDZ+tknMInGcbIiciSP2pFtgnKkEK3z1YPgdS7sDs2HsUMPUV7sqsTrU248hoxHqtOpiKim3XYltTnOITVMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1387915f-4e26-456c-e4dd-08def21323bd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 10:28:35.4990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJIhaAtJKsxJJkOGRgzURk+DvMJVCl4WDqR03ncfwEeZvxWRsj5rGkkxQn7G1rlR+xnBiLHw5swzpLSoFuXOqb8WItUrSDcKGfohJ9ItCkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9230
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

This is the tail end of the "tools: remove unnecessary shared library
dependencies from standalone tools" series. Patches 1-29 of v4 have
already been merged; these are the 2 remaining patches, rebased on
current main and resent as v5.

igt_load_igtrc() is moved to igt_rc.c so lsgpu can use lib_igt_device_scan
without pulling in libigt.so.

v4 -> v5:
 - lib/igt_core: move igt_load_igtrc to igt_rc: add missing
   #include "igt_rc.h" to tools/lsgpu.c in this patch so lsgpu.c
   keeps compiling standalone (bisectability), instead of only
   fixing it in the next patch

Sebastian Brzezinka (2):
  lib/igt_core: move igt_load_igtrc to igt_rc
  tools/lsgpu: link with minimal sub-libraries

 lib/igt_core.c    | 47 -----------------------------------
 lib/igt_core.h    |  2 --
 lib/igt_rc.c      | 62 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_rc.h      |  2 ++
 lib/meson.build   |  4 ++-
 runner/executor.c |  1 +
 tools/lsgpu.c     |  3 ++-
 tools/meson.build |  7 +++++-
 8 files changed, 76 insertions(+), 52 deletions(-)
 create mode 100644 lib/igt_rc.c

-- 
2.53.0

