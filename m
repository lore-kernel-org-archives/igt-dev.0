Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B80C04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 18:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA52610E04F;
	Mon, 20 May 2024 18:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gDDkau0S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D831A10E04F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 18:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716230130; x=1747766130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=i9Qe5RBqg8LwrGbW9UGJEGL0D+1AP3Jeeti/c/fytPU=;
 b=gDDkau0SyAAmS6XSoyWlZgYN9Ui6dewEOk8VoWovzkOblfKQgSy47J23
 Tr763dg9NeE0rcej3Df3Nkyspp6JlZQElFzjYhUxJU/3ewalpfZkzKyVE
 aUWmrFDsakNy/2BomyCQ4UkMY8tafhiM2BYEA/RfNQVG36W9YvmpwdOYq
 GzYhcHmOzAEo6gn9xwsw52A7AabLnaWkcY9Ayr4YjMyeABeTC3ZeA+bqY
 qxHtd+PXgm+clK7xDHZzTl9OAh8pUYBd8ywLlOKhUQjmfD9I2BoQoelmb
 3wU/gfRLYa0jjYFhECz88cEhP36MvFx8yAu+fk8Hkkm3HDOo+jCGrM+M2 A==;
X-CSE-ConnectionGUID: BZnPvIDpQHuK7YsWOQUAKw==
X-CSE-MsgGUID: P4BigljBT4iVg8tO+wOTYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="29900245"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="29900245"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 11:35:29 -0700
X-CSE-ConnectionGUID: 8m81nkUBRauQWcj7CFw0/A==
X-CSE-MsgGUID: aYbgw79MTiSUguPwKuIpyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="37155029"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 11:35:30 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 11:35:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 11:35:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 11:35:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZHYp3MhTtrh0CIZ6fa7Ra0R4VgGpnIApUHvdNlzSy3wJxYTKCH/ZA5YG/6/Gw2Gje3h9xurtTRDJgIxvykB6ypc67jfaGqE0gLokXvSQNH+NM/fL8TjKudPUclAMTPwBtSa6fBzN3o05W9CGfG23Ggcoy/p4Q0eUOFu1v0ulxPEaketGx8aQvKJuavnusrhKf5mrUr4i8/85zsrFMggBy6H4J63Y7XVzCtn7DQRkjBJIggKiO8ieiaElFstNFzNbopZRKASe/gRD5Mv5s+XWu/+91tRvapEXmyjl45nxz9UnDkRkVaISz58nt1dbO4+/iIstA5/imidFX9hL89lYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tXVhTOjwCLHKWH9JMYk5rQb7tqoFKjiJ812lpHmq9U=;
 b=UYGoSJ7L4bNLCRH6VFJiBUlTWB8s0iki9fpLEXfdajD6SdHlP4ypm7xKS8xMdr8pigrk+s/KPoaIQfvq3oQfnYCHXYSIuxy2LVcj5YFX+3gZHbGOcbZsUAgt4CTushuKViqCvv6e2GApWEa48bdvHL5RfinBmtKWH5O+ls4vKO9E+VELKplE2Vgiz9lLrpNRT/nQ4rsuJQFeN4s+acDq6V//vRhmUAlFeJZKGcnJM1+gIIWLT4G+rbWHtWSmhUiBiB+EXKos3t3YpeoP1ql0QXHiftGyc/Yp/4lnaspKwovduog+/W2gB/pQ5HeENEJS43gtP8S7vyAfdV/mdpVLfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Mon, 20 May
 2024 18:35:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 18:35:27 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH i-g-t 2/5] lib/igt_pm: Fix and standardize IGT PM library
 documentation
Date: Mon, 20 May 2024 14:35:16 -0400
Message-ID: <20240520183519.227167-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240520183519.227167-1-rodrigo.vivi@intel.com>
References: <20240520183519.227167-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee22889-2b40-430b-00ce-08dc78fb9e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oEhw2jYERDmJbXRvqoLxNNO2Sl8T4KCch3TeR0msZdwu5/dMcuSRnWAdkPtd?=
 =?us-ascii?Q?SCna3Znjyy+2m7yxybJ2bMmh2iVuL3n1UwNmxw5S9mOiCHaAo6o69PVkzklI?=
 =?us-ascii?Q?tbBfwNK83dHW6n+HlIPvk1qRPCp0FN8Mh37uwwmQsWCa+WzlquzTwAcR25F8?=
 =?us-ascii?Q?j+chfhFi3xgXQKA9niIsfJ0i2mxcaCbii9+BVN37NCsKjkVyMPodS68tDemV?=
 =?us-ascii?Q?Vz+PT4aKW+QwRve2TMlV36mmFGreY7drsZetkaoNrQ/aFV/c+9r74RD4TWBc?=
 =?us-ascii?Q?s/eGxzcKDLEukL1OWsjz9la9RrecT6pgipmP4saEghT9oNfp+CLps63j4mRu?=
 =?us-ascii?Q?8v7XqPNMAtFSyJH4HDl8/lCQAE1vmPnl89nSbwvORFnlQYk7kZy05gQu/MUB?=
 =?us-ascii?Q?JKwqRrEXnAcSPl7PwbtQtZzFROsPxCU2eBeBtirDVHlkLcHNDpzl9wVyuVZy?=
 =?us-ascii?Q?maNpDRF+47yH5xmz/B28Ok1bHoIQB3meSQwziX9bsvqymkKk97noA2RAiHYU?=
 =?us-ascii?Q?VOWwhtPqGfV5Sqpz3i9ZXY83JL24E+bV9c7IvElgCUAmnu1XT5gTs3eRRTmU?=
 =?us-ascii?Q?drV/qHDVTrDp15Cddhkvxida1cPlEHfgZFl4rsXxRE2qKlra3Mq9g+kL7iBx?=
 =?us-ascii?Q?tF2ErKaFx2aClp9zUJAseLVu9io+xSmDfy+1QebNo/Emc5k29msXsITJj+tE?=
 =?us-ascii?Q?TSsni1CO/kIIbFV/DlPUQZ+PHeUwU1CoT8w7BDMQCuKnFXYMEiY/FwxNMNyV?=
 =?us-ascii?Q?xvYDV0j7Zq8xwR/yFHqzamJ8+foY64b3X0kD+G1YV6BkdjBWcfo8fBwL7ap6?=
 =?us-ascii?Q?zJ6VFozMEFg8AYOwI/Go3T0KX0q43KO5F3HuiWNu4joLDM9zIk4vMXZpwRHM?=
 =?us-ascii?Q?GtGgvGCvN7lCb0JvYQB7q4B1BSiDBqlapIwLnbGPiXmlGAXpHDc1zCNCn29S?=
 =?us-ascii?Q?HRayAPEEgrOxpEWFLXGvubXP6c0g6qfNn2pYp7t4F1FCi/yhRi3ji8v6/oXg?=
 =?us-ascii?Q?sxb5pNBDB4ge/+RgJSr3f/M5B52mLCc3yD87FklqdrPzuklTSqikw3124VUp?=
 =?us-ascii?Q?kW8B7K9CSEJ44rEKTE/9HLst83RLoAJCbnq8wkV3ldu4+0lp7h3EIU/IegWd?=
 =?us-ascii?Q?evoxCeJOrCEuqQekhvnLLa5QcZEmUKJWUGvcUAfO69pID7MO/8Jv9wKnQ5CB?=
 =?us-ascii?Q?Is2yKN/Dk/oYS2Zyd4ZOqt0EI7cosi+FpUzO9wdSby2I8if3hvJOEPkwWvBY?=
 =?us-ascii?Q?Z6CRjUXfcyhBI8DPTfcfgRZGoa81z9/ireV2lejl9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aAIL3quz0I6ihq/cML4zGpS/ol1VozcuawL5Q1wskrsiu9rOcPI3hjOtmvUi?=
 =?us-ascii?Q?OdciZRUxySN8SC0ShhzUdlmQ8OH3wiKMbeBOVBtDXmGvtNIjLliehhfeDHrq?=
 =?us-ascii?Q?/4yZ+sSbaX33XvN77SH+Z1YnubSm7Y33Rh11uldgpUvtBqhhXh9SpI7xwPX2?=
 =?us-ascii?Q?a1aji3xJIzjwszLiJVVURgYo/HHtfiNQA3boHxk4I16czcaSD7toHpmsBS50?=
 =?us-ascii?Q?eHOndjGY/2DBkgKV2hr+Ka5t0NpCOp+ML3ad0VdFaQLFCssNc+glK5JWG9Al?=
 =?us-ascii?Q?Cn/6SfZdbtwvEq3Izxj/fuKHNc0lJLzR4jZFkTpWxwfn7XFe0g3y0cMEpFyk?=
 =?us-ascii?Q?9NGKzeCW9FIp8S3km0UN1gKcdLg55NB/Iafm4YCUtAFG3sLKDRmWDHqKaYAT?=
 =?us-ascii?Q?XIDb0jbKA1iGcH8/bbH/Cqxd5RVIUYe8oBKwHJtBfp0ewAZeuuDHC4d267Ox?=
 =?us-ascii?Q?IWU/N52P68MZK7d5JFFIbAgse3nZaytm2FUvA7MParWhyQLz93owz/wHDpEJ?=
 =?us-ascii?Q?Ygz0BV194T51dafy6XrkQIgrXWs1gy1Np5sSoSk7C2/5xrcpeEJrKn+RrUcC?=
 =?us-ascii?Q?YX+lKjBs3NJ8KN6Sk/zyPHGkEkAI71U/r6SOUsGBlEPkm9bUL6cdJKkiBicO?=
 =?us-ascii?Q?fDruxe1eNdU71kTfx7QwuHKW5ZYqx0/+0cQK3qkllbLUgrZ9u3bpocwAA0NI?=
 =?us-ascii?Q?lSFQk8UC7bATTwNEMkBETElWJwBpTllBw8UcqJ8usZRxoDTeXmAYKVAbI8Ic?=
 =?us-ascii?Q?3DId/E8K+vp8+byr7vMRiG7p6iQu8chwuGYr8Cmr8sppTSXgK+dx7pp37Gr6?=
 =?us-ascii?Q?x52xth5+yDgRhrFYKAAHvRaPNSBPDcyx5UoeJtf3tw0XRNfG7gBAlDAnpD3A?=
 =?us-ascii?Q?Jr3PPJaZxl3zUzIgueTEQ7ntuT7jVn9sf1AMB2ZgxaCk9jPmGjOrOOtXxubL?=
 =?us-ascii?Q?wNHcJFejEPtbC7s/zV2uQ3UM6wbX7B/vFJ7wktUFnhHqXgouFNYLKnqnEC7Z?=
 =?us-ascii?Q?oVHt0fV6g7J4Vif9g42zFrqTr+TKfx/EfCWU85et1ECbRWsxMDorae+rBleG?=
 =?us-ascii?Q?7RWPDzPrPqZpPoakWpyXO65cfSljJcBhhvHViUN9FUQSiEBTDBpf4ul4rptP?=
 =?us-ascii?Q?drnVq90LatRpyzf5r9nl3qa/sB8JfTrCNB7GS5RkOJQEB0qKgiC1BVhcnPjE?=
 =?us-ascii?Q?WOuBYMcKYUXdtR6WrMhoX3ybTu3rjXUsFXwZI2yuNt6riXmClCkSqj0hwI0k?=
 =?us-ascii?Q?UCaGW7eshyZoDompo6twrl8whiybR22MrcM3YPqLz9qvG6aGho9LVoQ3mTxr?=
 =?us-ascii?Q?Y8ot9Xtllmxjucrry+WO4qkgapajdVRwwfqOJXxMI7K+aKInMofdN4lhiEd4?=
 =?us-ascii?Q?yE1nrQ7PT+jh/q7pCkaxzX7Cz8fGWUIt6gdA13PDVVhBveSovFOk4kkQgZ/Q?=
 =?us-ascii?Q?7bQo7mLgbpboOG1S0g5Pb/c+7blFInd9p5i3Tw7UacXlshGK8UuIOWh0l7WC?=
 =?us-ascii?Q?wKAnkfAwcu3FNj3eWEW7CGzTiaYFL9QqSDftMMj4XDnn6xGg3I+2Cghr+UtC?=
 =?us-ascii?Q?BduJ1dAj0D65AZIDCW5H1dt6e4tS7UDUpnLrygRd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee22889-2b40-430b-00ce-08dc78fb9e5a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 18:35:27.0653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6C3Sb833LOpfiMyTi+Wy49wYjtIwPvTnxdCpVHRR+n186YbYsDyfT+/nhFQ+z/NeePCEBZyVi/TUhkwUfG5MyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
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

A revamp to get some kind of standard in the various exported
functions in this library.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c | 148 +++++++++++++++++++++++++--------------------------
 1 file changed, 73 insertions(+), 75 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 928b72685..2c91aeb33 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -454,7 +454,7 @@ static void __igt_pm_restore_sata_link_power_management(void)
 /**
  * igt_pm_enable_sata_link_power_management:
  *
- * Enable the min_power policy for SATA link power management.
+ * Enables the min_power policy for SATA link power management.
  * Without this we cannot reach deep runtime power states.
  */
 void igt_pm_enable_sata_link_power_management(void)
@@ -469,7 +469,7 @@ void igt_pm_enable_sata_link_power_management(void)
 /**
  * igt_pm_restore_sata_link_power_management:
  *
- * Restore the link power management policies to the values
+ * Restores the link power management policies to the values
  * prior to enabling min_power.
  *
  * Caveat: If the system supports hotplugging and hotplugging takes
@@ -566,8 +566,7 @@ static void __igt_pm_runtime_exit_handler(int sig)
  * Sets up the runtime PM helper functions and enables runtime PM. To speed up
  * tests the autosuspend delay is set to 0.
  *
- * Returns:
- * True if runtime pm is available, false otherwise.
+ * Return: True if runtime pm is available, false otherwise.
  */
 bool igt_setup_runtime_pm(int device)
 {
@@ -658,7 +657,7 @@ bool igt_setup_runtime_pm(int device)
 /**
  * igt_disable_runtime_pm:
  *
- * Disable the runtime pm for i915 device.
+ * Disables the runtime pm for i915 device.
  * igt_disable_runtime_pm assumes that igt_setup_runtime_pm has already
  * called to save runtime autosuspend and control attributes.
  */
@@ -683,11 +682,6 @@ void igt_disable_runtime_pm(void)
 	close(fd);
 }
 
-/**
- * igt_get_runtime_pm_status:
- *
- * Returns: The current runtime PM status.
- */
 static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
 {
 	ssize_t n_read;
@@ -711,6 +705,11 @@ static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
 	return IGT_RUNTIME_PM_STATUS_UNKNOWN;
 }
 
+/**
+ * igt_get_runtime_pm_status:
+ *
+ * Return: The current runtime PM status.
+ */
 enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
 {
 	enum igt_runtime_pm_status status;
@@ -728,12 +727,6 @@ enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
 	return status;
 }
 
-/**
- * _pm_status_name
- * @status: runtime PM status to stringify
- *
- * Returns: The current runtime PM status as a string
- */
 static const char *_pm_status_name(enum igt_runtime_pm_status status)
 {
 	switch (status) {
@@ -757,9 +750,8 @@ static const char *_pm_status_name(enum igt_runtime_pm_status status)
  * Waits until for the driver to switch to into the desired runtime PM status,
  * with a 10 second timeout.
  *
- * Returns:
- * True if the desired runtime PM status was attained, false if the operation
- * timed out.
+ * Return: True if the desired runtime PM status was attained, false if the
+ *         operation timed out.
  */
 bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
 {
@@ -791,15 +783,14 @@ static const char *yesno(bool x)
 }
 
 /**
- * dmc_loaded:
- * @debugfs: fd to the debugfs dir.
+ * igt_pm_dmc_loaded:
+ * @debugfs: FD to the debugfs directory
  *
  * Check whether DMC FW is loaded or not. DMC FW is require for few Display C
  * states like DC5 and DC6. FW does the Context Save and Restore during Display
  * C States entry and exit.
  *
- * Returns:
- * True if DMC FW is loaded otherwise false.
+ * Return: True if DMC FW is loaded otherwise false.
  */
 bool igt_pm_dmc_loaded(int debugfs)
 {
@@ -821,11 +812,11 @@ bool igt_pm_dmc_loaded(int debugfs)
 
 /**
  * igt_pm_pc8_plus_residencies_enabled:
- * @msr_fd: fd to /dev/cpu/0/msr
+ * @msr_fd: FD to /dev/cpu/0/msr
+ *
  * Check whether BIOS has disabled the PC8 package deeper state.
  *
- * Returns:
- * True if PC8+ package deeper state enabled on machine otherwise false.
+ * Return: True if PC8+ package deeper state enabled on machine otherwise false.
  */
 bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
 {
@@ -847,10 +838,10 @@ bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
  * i915_output_is_lpsp_capable:
  * @drm_fd: fd to drm device
  * @output: igt output for which lpsp capability need to be evaluated
- * Check lpsp capability for a given output.
  *
- * Returns:
- * True if given output is lpsp capable otherwise false.
+ * Checks LPSP capability for a given output.
+ *
+ * Return: True if given output is LPSP  capable otherwise false.
  */
 bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
 {
@@ -887,14 +878,13 @@ static int igt_pm_open_pci_firmware_node(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_pcie_acpihp_slot:
- * @pci_dev: pci bridge device.
- * Get pci bridge acpi hotplug slot number, if bridge's ACPI firmware_node
+ * @pci_dev: PCI bridge device struct
+ *
+ * Gets PCI bridge acpi hotplug slot number, if bridge's ACPI firmware_node
  * handle supports _SUN method.
  *
- * Returns:
- * PCIe bridge Slot number.
- * Returns -ENOENT number in case firmware_node/sun is not supported by the
- * bridge.
+ * Return: PCIe bridge Slot number or -ENOENT number in case firmware_node/sun
+ *         is not supported by the bridge.
  */
 int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev)
 {
@@ -928,11 +918,11 @@ int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev)
 
 /**
  * igt_pm_acpi_d3cold_supported:
- * @pci_dev: root port pci_dev.
- * Check ACPI D3Cold support.
+ * @pci_dev: Root port PCI device struct
+ *
+ * Checks ACPI D3Cold support.
  *
- * Returns:
- * True if ACPI D3Cold supported otherwise false.
+ * Return: True if ACPI D3Cold supported otherwise false.
  */
 bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
 {
@@ -958,11 +948,11 @@ bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_acpi_real_d_state:
- * @pci_dev: root port pci_dev.
- * Get ACPI D state for a given root port.
+ * @pci_dev: Root port PCI device struct
  *
- * Returns:
- * igt_acpi_d_state state.
+ * Gets ACPI D state for a given root port.
+ *
+ * Return: igt_acpi_d_state state.
  */
 enum igt_acpi_d_state
 igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev)
@@ -1155,12 +1145,9 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs, i
 
 /**
  * igt_pm_get_autosuspend_delay:
- * @pci_dev: pci_dev.
- *
- * Get pci_dev autosuspend delay value from pci sysfs.
+ * @pci_dev: PCI device struct
  *
- * Returns:
- * autosuspend_delay_ms.
+ * Return: The autosuspend delay time in miliseconds.
  */
 int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
 {
@@ -1177,10 +1164,10 @@ int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
 
 /**
  * igt_pm_set_autosuspend_delay:
- * @pci_dev: pci_dev.
- * @delay_ms: autosuspend delay in ms.
+ * @pci_dev: PCI device struct
+ * @delay_ms: Autosuspend delay in miliseconds.
  *
- * Set pci_dev autosuspend delay value through pci sysfs.
+ * Sets the autosuspend delay value for the PCI device through.
  */
 void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
 {
@@ -1201,26 +1188,28 @@ void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
 
 /**
  * igt_pm_enable_pci_card_runtime_pm:
- * @root: root port pci_dev.
- * @i915: i915 pci_dev.
- * Enable runtime PM for all PCI endpoints devices for a given root port by
+ * @root: Root port PCI device struct
+ * @gfx: PCI device struct of graphics device
+ *
+ * Enables runtime PM for all PCI endpoints devices for a given root port by
  * setting power/control attr to "auto" and setting autosuspend_delay_ms
  * to zero.
  */
 void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
-				       struct pci_device *i915)
+				       struct pci_device *gfx)
 {
 	int delay = -1;
 
-	if (i915)
-		delay = igt_pm_get_autosuspend_delay(i915);
+	if (gfx)
+		delay = igt_pm_get_autosuspend_delay(gfx);
 
 	igt_pm_setup_pci_card_power_attrs(root, false, delay);
 }
 
 /**
  * igt_pm_setup_pci_card_runtime_pm:
- * @pci_dev: root port pci_dev.
+ * @pci_dev: Root port PCI device struct
+ *
  * Setup runtime PM for all PCI endpoints devices for a given root port by
  * enabling runtime suspend and setting autosuspend_delay_ms to zero.
  * It also saves and restore power control attribute for all PCI endpoints
@@ -1234,11 +1223,10 @@ void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_d3cold_allowed:
- * @pci_slot_name: slot name of the pci device
- * @value: value to be read into
+ * @pci_slot_name: Slot name of the PCI device
+ * @value: Value to be read into
  *
- * Reads the value of d3cold_allowed attribute
- * of the pci device
+ * Reads the value of d3cold_allowed attribute of the PCI device.
  */
 void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
 {
@@ -1258,10 +1246,10 @@ void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
 
 /**
  * igt_pm_set_d3cold_allowed:
- * @pci_slot_name: slot name of pci device
- * @value: value to be written
+ * @pci_slot_name: Slot name of PCI device
+ * @value: Value to be written
  *
- * writes the value to d3cold_allowed attribute of pci device
+ * Writes the value to d3cold_allowed attribute of PCI device.
  */
 void igt_pm_set_d3cold_allowed(const char *pci_slot_name, uint32_t value)
 {
@@ -1294,7 +1282,8 @@ igt_pm_restore_power_attr(struct pci_device *pci_dev, const char *attr, char *va
 
 /**
  * igt_pm_restore_pci_card_runtime_pm:
- * Restore control and autosuspend_delay_ms power attribute for all
+ *
+ * Restores control and autosuspend_delay_ms power attribute for all
  * PCI endpoints devices under gfx root port, which were saved earlier
  * by igt_pm_setup_pci_card_runtime_pm().
  */
@@ -1342,8 +1331,9 @@ static void igt_pm_print_pci_dev_runtime_status(struct pci_device *pci_dev)
 
 /**
  * igt_pm_print_pci_card_runtime_status:
- * @pci_dev: root port pci_dev.
- * Print runtime suspend status for all PCI endpoints devices for a given
+ * @pci_dev: Root port PCI device struct
+ *
+ * Prints runtime suspend status for all PCI endpoints devices for a given
  * root port.
  */
 void igt_pm_print_pci_card_runtime_status(void)
@@ -1361,8 +1351,9 @@ void igt_pm_print_pci_card_runtime_status(void)
 /**
  * i915_is_slpc_enabled_gt:
  * @drm_fd: DRM file descriptor
- * @gt: GT id
- * Check if SLPC is enabled on a GT
+ * @gt: GT ID
+ *
+ * Return: True if SLPC is enabled on a given @gt.
  */
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
 {
@@ -1387,13 +1378,20 @@ bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
 /**
  * i915_is_slpc_enabled:
  * @drm_fd: DRM file descriptor
- * Check if SLPC is enabled for the device
+ *
+ * Return: True if SLPC is enabled on the device.
  */
 bool i915_is_slpc_enabled(int drm_fd)
 {
 	return i915_is_slpc_enabled_gt(drm_fd, 0);
 }
 
+/**
+ * igt_pm_get_runtime_suspended_time:
+ * @pci_dev: PCI device struct
+ *
+ * Return: The total time that the device has been suspended.
+ */
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 {
 	char time_str[64];
@@ -1438,9 +1436,9 @@ int igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_runtime_usage:
- * @pci_dev: pci device
+ * @pci_dev: PCI device struct
  *
- * Reports the runtime PM usage count of a device.
+ * Return: The runtime PM usage count of a device.
  */
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 {
@@ -1455,12 +1453,12 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 }
 
 /**
- * igt_pm_ignore_slpc_efficient_freq
+ * igt_pm_ignore_slpc_efficient_freq:
  * @i915: open i915 drm file descriptor
  * @gtfd: open gt sysfs fd
  * @val: value to set
  *
- * Ignores/un-ignores SLPC efficient frequency
+ * Ignores/un-ignores SLPC efficient frequency.
  */
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
 {
-- 
2.44.0

