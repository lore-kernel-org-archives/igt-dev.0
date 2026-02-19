Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3467E9A04C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 14:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7664110E6EC;
	Thu, 19 Feb 2026 14:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HT6SnDBf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACB410E6E8
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 14:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771510491; x=1803046491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FPgIuI73VkzVzZ9sIM3NiGc14lBSTLIPwat6Zuw59Zo=;
 b=HT6SnDBf4xS3G09wCHbFqjHFqBkkffJfQk++2/Any8TzHE2asujKa8PJ
 uT/j3bqjTCLvGtKdFrRVFCqBOgSPtrW5wmsHTRN8ayzEC72Kn+nPXvuyI
 g3/Veukb/sniYGzb3xb1bHx+FacRcwpzMl7fLOnyxxuZHXpQxUoGdKZoM
 vuhSKsJzaavGHJidOd0Q2tpBMHh3mdJ321STVWHa1v1Cmy1kPBDsA8IA4
 78B8e5zGB2kEpeURb/8dVcIMtYuqq+5gxy4XbeXdcexckRE+NzSXpaQ56
 DDDpwFkJPp15y8QpSGQntNmkLPE+fUn+0adJWCMhRu0uohtNN+DMbO4dh g==;
X-CSE-ConnectionGUID: XiOHx3UPS0S29AwpE7X0Wg==
X-CSE-MsgGUID: KD7X1I66SmSPQXqG7XFwDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72635912"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72635912"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 06:14:50 -0800
X-CSE-ConnectionGUID: lZ/tKv/7Szamo4PKx/WJ+w==
X-CSE-MsgGUID: WzXTfhTbT/2SYWnK1yHqsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="218661359"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 06:14:50 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 06:14:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 06:14:49 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.20)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 06:14:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGH7DrTrE5fvI3Av476OiICvzHN4DAZ6igmY6QPPpLhWz5TD+yYX45b9ZNyiqKSF+tIegSSpuAVOZAg9LQh3KXSXRUxxuOZf36dt9EBOkt5rmFdFJ5vxurtP4Sv7kBIb0kB9W9bd8fTIZW1R+FSOG8RvRaW+1LV9BNnYWwzHUuXpXY30gumq6WAp/KjR3G61uULEuOi0Hb8xSbCX/h9LtpbbzHyuhnPMa4U0MML5KcBqqKh4kE4c2R/tMN0tquvpOX78NqoXQU54jkiOUE5u/W7QLcfZ7fXWI3DkDbuzEZqRZ5mLXEoy3Rc+59nuXH48wcXtPtkRDh5lS1JINIpnew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbXZIo23qRmvo6ELtsd85pbd09X8qvd++6yp0GGffow=;
 b=leRDbjn0caHpuXgS/cwKeGxlsKJ11hBsd26PfK/2l3TQNTcw7wbMACdfq9I2BtLmeXu7R2LglMk1ChB6EY4TKu9kheKjTlTTT8zUghnOHHQV9WezO25isCb76hJbQ3lv/tZiImHHtOOdfU6B5szUITe7FHCQjbLbjdaKMDOs7sl54jFcWOB3jkvyFX/KdX3PW1jmNrHF+jqiyjp9tht7KIMO8ES4HlkHvftFzRefyzGg2IezvJOLN8s2oU4LEft61gg45JBYn7hLbZyfIz2GN1Zs2GTzgWTuPwQIZfbKiJvrowcKtvDK17Jg8LJQI80+DQ/PuyqwOS0Fw8F1vJq96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA1PR11MB8831.namprd11.prod.outlook.com (2603:10b6:208:597::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 14:14:47 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 14:14:47 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v3 i-g-t 2/4] lib/igt_tools_stub: Add igt_load_igtrc() stub
 implementation
Date: Thu, 19 Feb 2026 15:14:51 +0100
Message-ID: <763881965f67ba856f33bfd5c351e90a80d0ae60.1771510028.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1771510028.git.sebastian.brzezinka@intel.com>
References: <cover.1771510028.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA1PR11MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a52b3a-4529-42ef-82cc-08de6fc13ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?91yEZyWqS5L32GvyajnhkEKHUwyLw1yk34P+/ovT6Wi0k8rOum/2pggRSBfn?=
 =?us-ascii?Q?M80+u34vkKxlz68xWPTb3CZvJIx6tLohQpWXIpSFxSdrV4voflMAhtjUtErn?=
 =?us-ascii?Q?pu+601+X6xPLMBoX/twRpYYR5L38cjo/4Bp1cj2xJZHH6YJ/Q1mOXtrYGBaP?=
 =?us-ascii?Q?LB4ud0Lh4YDXjLMZcKPV2UvrLAYs/Bnt+XsxcRxavIhBqPN1iJ5JYld/COfk?=
 =?us-ascii?Q?zjo5fmc7z4JZ/kpkyQmunXSA6vr+a7Gyz1yuiAQY8X6cOrH0C0ZJZiueNwdV?=
 =?us-ascii?Q?wLoXrLtdPPQnoPY+B1V/7lOLSA02LCom81DEBx6+Ee+wqjpCPpTHIOpccx6E?=
 =?us-ascii?Q?StSeLn2jQvhGqRzGuHtBomrAcprAVjtbjJQC60pyzmgUr+0tzHr5sJ1Ux2hR?=
 =?us-ascii?Q?59/V2iBp2MW8lSRFIH0M9nAI4qPpNgMCfWhyRs/21lUhqm9RyvHmAjvG21dg?=
 =?us-ascii?Q?72yXPPVtPRFZqi6XGbhpbFOG+my4W2lFdVuiUxQ+NVeP2iXPTswtEAZ/Eau4?=
 =?us-ascii?Q?cZpajbf85PTT2nSWMUB42B2aH/YtYJGbPtsH2mHezp4czAFzPpKOultN7sSY?=
 =?us-ascii?Q?R0UFYi3pYuQSz6GEyWXYrCdTYvI3DwJ7Tfr2X5dP48zMGagaMDNZajHuwTZ3?=
 =?us-ascii?Q?tNcWajUHOdjmISiyYmbPmnr5/WfdX145bTsijZgZsLhj5ys1m0+AIT+ZSmJm?=
 =?us-ascii?Q?fnF6qdZgHz+njoebsFsJSljf9gPtXg686E2a2vxSsxpVoB5lf8QF/yjFWxLg?=
 =?us-ascii?Q?TWpjidyFksWT+kDl/Sx0wH6WZe5L50MmYD8nZI6SGbWkBcpGngb2qeMEjyyT?=
 =?us-ascii?Q?r41MX4ErzYWnevOCPKjJ2hqy+ipj/Om3Wz3B6RtIXwn8FLaOcFfZEg/WLJgm?=
 =?us-ascii?Q?Y5/9hgJjOwLxfJGhqwmdg64aq8pg/NincA5gCDNwpzLStKwIhaT2XUEArr7o?=
 =?us-ascii?Q?2QWXOp+73kF3IxZN7vt6DOieFXwUi+lBjxRZC13+4pQl5zrE6SaB8rTOMaLo?=
 =?us-ascii?Q?ezibQ4cpBvSKtr2UaafLjfrr/cEmiJZgwWT5xy0reAXMIyku/iiuaDGSFynE?=
 =?us-ascii?Q?6SrmVppQY/73XkAgXr/9qcyKuI6VyZE6Tjl4pmFfNAMPa1RCdPdtFjNWiRCC?=
 =?us-ascii?Q?e40PYXiKWplQKrsNjPY8YExTdhxIl/5iePI1FYmXhSaz1X3hCVIRLOYyxlNL?=
 =?us-ascii?Q?IgTn0vAsMCSP5IB7XvWE37NfongPZnlPNLYxlkgAOhRzfy1b3wqoiad8/mvP?=
 =?us-ascii?Q?4VCbnzrgP69CHXGIbECN68iq1mz1joJ6VpzAUQxoKW6B/oHsWf/rJ+N4UqyO?=
 =?us-ascii?Q?ivg8DYAdWocq9NXm8HGDVWp6HI11VTLAYhYyOKeYbEW1siJBbpl8HH+BDs7q?=
 =?us-ascii?Q?FiKw3afbPq8sTBF0p+lb4KZv+p0RM66ME001hCgp3uBx6dmsnsNQNGW0aaXT?=
 =?us-ascii?Q?UtnZQAjp4lyEerM7QlIu7NSC+ykWOfcqh91tnyPELkehaKxQ+9Uof6w3Zbue?=
 =?us-ascii?Q?JLERL0Hi6vu0VenHzzO0kdZ18yEaGioJogs3tbWdup5G4DQIadjp76SfjQtO?=
 =?us-ascii?Q?GGdTOF/DMIS03FVVLwQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7142099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cTOFRwB5N09BFL/7iL7+vq0f9JJBjgxNJ5hNOPCyfLw8J7hI60sIj7hnixp/?=
 =?us-ascii?Q?dOfHwkDHT9FeZTwMzIeZV4/gZ47eAwQkKeK74NTA547aPtaCeWY1pLFPaFR6?=
 =?us-ascii?Q?2hclVdbRVHwrvcFDinygEVuLzkvhP5EbGpobUj0FBIFTCSxdG+tATbXmVgBB?=
 =?us-ascii?Q?rABdF2qs5WAgQlSCao0ZR/+I1gHqpR+ixhBx1M+LsdL/a8jsl6EhNUmxFAuT?=
 =?us-ascii?Q?LSsgmqFjnRlPLcKcERgxVdc7O6dW/r+6xjkAeWD3ya8i1R5eY6ic+DNCZWoc?=
 =?us-ascii?Q?teCaj5BGfV5FVgw2Q4eEUD2JCYZK/FYaP8BfkqekA7ODDlvvVXzm5IGkc5OU?=
 =?us-ascii?Q?pNwzRoaAuUKQMmeqN1WncwzVruQFIjQM0i8slJ1j9QWuZPKyT72DfQhKbjWT?=
 =?us-ascii?Q?SpIGr42/M5W0jXwxzCFA4yndxrDOJdHgnHza4pYm7a6zAHskTyFJDYY9qD+S?=
 =?us-ascii?Q?pNdEWNGpOB0q3ZAKkICTgfV0cgdzOZy21Kt9poRN/8OOkh35PNSD55BlSCX3?=
 =?us-ascii?Q?E4bOrpY4L0hoXVVG7rfoOaGlvjFpRERNf6/usrWuJQuga2KeM63n6RiKNT0F?=
 =?us-ascii?Q?xwD17js22SYKF7Dj4ana4nUNTxvIK7LFobHrX1MGiHlRrUUO3o4sSECy7Dec?=
 =?us-ascii?Q?aFKHR6ZkcSWoHqNCseoBc4xeR4N/qz95f/Dr8DKyZXWYEnxVprQ1BgUyzaOa?=
 =?us-ascii?Q?GHPFXM9gZL0g+t/eW0kG0P8HSowB6qkWoGmcg6fB/mP0ZK5Iof1ZbymWg71C?=
 =?us-ascii?Q?UbG56YSRLQ4TP2Y2YXI++lWfskT+yrvwrvzI0J1NJaiHAqRky53Oceu0XOAX?=
 =?us-ascii?Q?50XyOWqjaN96zM6DSVsa10XBPnbBy+ZoJ+NYjb9+nGEK6vMX23EsH9VYu21b?=
 =?us-ascii?Q?RDXI1EbkVYK8E5/bFDImtb3FPcFSc0lXn7EjdEZDD+bf7iHv5+DYivtVbEXu?=
 =?us-ascii?Q?YHLok17UH5tXAxCuoLC/gI21yQZSYXH+coMOWNjDje4b0H7991u2Qb30qc7M?=
 =?us-ascii?Q?d899p7aJnN7cMFOmJIFDNEmFYeolHn+5exe5PMPvjAj84I8LswKJw/OzUR/G?=
 =?us-ascii?Q?10LNK/9XdIwAKfZoyHjqf1hrmOPAA1LhM1UQbtyTmj2GhWBSbvouwvEjdVF3?=
 =?us-ascii?Q?WKX5zYuUQvx+6vB0/gPWZjBu29gw/9WaKI1yxAc68ceDaMiZnjQyG+tr0T3I?=
 =?us-ascii?Q?mfZ/e/z8xXToDjZLmMoZGVDBKR1N5TmuN6FgNuOad3+EFlYq1y3887e4Farm?=
 =?us-ascii?Q?MkWbvPsKTxD26gTv6I7ViUCuywauLA/Ve0mnN74Kf36HJVcrUp10jst+H+G+?=
 =?us-ascii?Q?u19pGAnqjzu3EJRmRdlq7nA4wjQyTX4dlsbXXw23RGBi52qoOnNKyY0xa6VO?=
 =?us-ascii?Q?3RfsNoNHN6CWEs3xI4Xlu2e/XkY+vrM89qM65bvIYcR/tyxb+UzcknVEkUKE?=
 =?us-ascii?Q?9uXUzueAXfYeleCo2u7fJdxxSmFsjDJYmaHudAxZs8zemoPKNnizL1yHvd59?=
 =?us-ascii?Q?oY5yGad19EB6TcgXGdHy+03xnigx/H5eIRHsTGf7Xh3g9zrV7oc4LPFEfoc8?=
 =?us-ascii?Q?IODjrDGQEsXKZhWnz12RTfrgRQLuCYNFgsE/YvJFUnEhCX6hExH+eeTfb+Ec?=
 =?us-ascii?Q?Za6ARPQgvpX5mDuJLljw2HpfnH8B3aSpVR/OzhOkBkTUI0Ly7EV0MEeGhP2q?=
 =?us-ascii?Q?XB45+d126rFnht7CEpjx809FAMr47jhNF2hMWiFfsoP6ZdFZuG5wIrTsura5?=
 =?us-ascii?Q?1qQh16JryZjdiylg6uFI3KJKDgrtXPA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a52b3a-4529-42ef-82cc-08de6fc13ca5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 14:14:47.1522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omDSi04jYrvdwE9bkfq825azVgscZyOD4NQjrnRdk9sZPgvwGlFvoL9rYQ8dk2+7uqj02V+8sAPbDvmzu5/NvreLb5OvOeAOnMa72P8s2Pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8831
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

Add a minimal stub implementation of igt_load_igtrc() to allow lightweight
tools like lsgpu to load IGT configuration files without requiring the full
igt_core.c and its heavy dependencies (Cairo, Pixman, X11, etc.).

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/igt_tools_stub.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/lib/igt_tools_stub.c b/lib/igt_tools_stub.c
index 9a0ec6217..ccc393913 100644
--- a/lib/igt_tools_stub.c
+++ b/lib/igt_tools_stub.c
@@ -22,6 +22,11 @@
  *
  */
 #include "igt_core.h"
+#include <glib.h>
+#include <pwd.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
 
 /* Stub for igt_log, this stub will simply print the msg on stderr device.
  * Domain and log level are ignored.
@@ -49,3 +54,41 @@ void __igt_fail_assert(const char *domain, const char *file,
 		func, assertion);
 	exit(1);
 }
+
+/* Stub for igt_load_igtrc - loads ~/.igtrc config file */
+GKeyFile *igt_load_igtrc(void)
+{
+	char *key_file_loc;
+	GKeyFile *file;
+	GError *error = NULL;
+	int ret;
+
+	/* Determine igt config path */
+	key_file_loc = getenv("IGT_CONFIG_PATH");
+	if (!key_file_loc) {
+		struct passwd *pw = getpwuid(geteuid());
+		if (pw && pw->pw_dir)
+			ret = asprintf(&key_file_loc, "%s/.igtrc", pw->pw_dir);
+		else
+			return NULL;
+
+		if (ret == -1)
+			return NULL;
+	} else {
+		key_file_loc = strdup(key_file_loc);
+	}
+
+	file = g_key_file_new();
+
+	ret = g_key_file_load_from_file(file, key_file_loc, G_KEY_FILE_NONE, &error);
+	if (!ret) {
+		g_key_file_free(file);
+		g_error_free(error);
+		free(key_file_loc);
+		return NULL;
+	}
+
+	free(key_file_loc);
+
+	return file;
+}
-- 
2.52.0

