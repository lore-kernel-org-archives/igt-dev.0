Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0BBE9A04A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 14:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868C210E194;
	Thu, 19 Feb 2026 14:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOOTItYu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB0010E194
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771510497; x=1803046497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=W2IHzWsZO5ROv9SbmE/8i+ka0Jonjvc0RWxoBMhw8Fs=;
 b=NOOTItYu131iQSod7VU6TvwH0HQPkoDGSYdNRC32hYUapOkETgwXxjrR
 z1GLQctSsoDWe7vskG0UXCkzgPq+s/GKSFCU8i53R28ckbrLvWfPdcNc4
 oC5sNdFWB4LtlnOAW8J6yYgDyUX7IcfighAKn0raS52GkbMLRarEVNw43
 iDlPInVmASCPKt59XN2b3c3kLiDk3KzZlhXKhZjYeojqETjRx5lWGI/FO
 e8oDMka3XVpcxCEo3B6gNNQoos0OgTLdK95iTdSpSDC3ArrO1nxN3jWgj
 mrMvXHlWgxmWUSB0YOCZ6KtE5kyYkrK0ysCP1oSre/DLzVqDIWhEWe338 w==;
X-CSE-ConnectionGUID: IarzaA6aQY25UoVOQl6g/A==
X-CSE-MsgGUID: oKJp7KQZTSiFiMWCmXKtSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72771658"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72771658"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 06:14:57 -0800
X-CSE-ConnectionGUID: V8ncPTZ2Rzi8N5rNa2RrUw==
X-CSE-MsgGUID: DY1js0AESR2EX9MbRcsl8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="245119319"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 06:14:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 06:14:56 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 06:14:56 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 06:14:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szX5xOBm87cMV51fNvohw6pMA8bkBMFDgzpz7iOgScJS2hAoTZwq1qrsDSIzP3rBS7qf4qd1BXC5byKXMqUZ7NLZeSv9ANal7v+6TXqf9if2KcDhHL9ab5diZBuJbZgRTdwRj6ESfFxoGvAStBSfxFtdUn81GNMLkw274uRABTAd0y/VEQZhhmyGs9c8uxmar01pdcZ7iZ9pw3HT6PuQ2sD3J3oZuewYwRsq1vKSy/2oHy54Plwbqnwrqh3CliCu6szUPrsBlVmNIdjvALRRYLXZzZkqPpfOkTGOOOdyMtCRJIh5d1eSQVruduU0ksXDDH/aHtLohRy9UxkJo+nhLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUWSKxdIzVaGB6GZDZ6OZaunepzUr5uJI/mjbXxa3Cc=;
 b=EzzvQQ75qJ2R/5htJ4txJLZvrw9+vJdFX+NQ8WdoH0pcDdfYOqLlEVAbGlfVXwlMNaoR9toZGa3GW0wnfEDs6oP6DD0oBWI3x4fAsI6abVJA6zBqEw1Cb79weO8hqySeU0aHwHHxX247mdW+f8cK49JymJxSwhp0spEvJKjQsVNtQI8MqMaR9QG1vTwV5q5vnNkd46Sg6FVpywC1KWLOsshaLT8/lsX2ofGnCV6QqD/VOthJT+9KLDZmM+M4+uZK6l/ZcIBKjheR/MpXFcuZgtXd30SONQP/l4G4kHH+OiiSRkHiDUYMT3DlS6g52H835wmsMfdzRcXGsw7swrvfkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA1PR11MB8831.namprd11.prod.outlook.com (2603:10b6:208:597::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 14:14:51 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 14:14:51 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v3 i-g-t 4/4] tools/lsgpu: drop cairo and switch to igt_core
Date: Thu, 19 Feb 2026 15:14:53 +0100
Message-ID: <15055a844dc91c0a37cd72f1de7609c47505d723.1771510028.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7d8f0f47-6d98-4ef1-ad94-08de6fc13f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6dp63Venq0OViKgHIjmFYsZjCVuq3v9qCpm2LtVGqxYK87WxN0Ab/IYmWy2h?=
 =?us-ascii?Q?ytyLIOl56Q7QM46YbaUKSnmhQAkzGYle51y5aFNyh3xsBK0ciKP7ll2Hn98p?=
 =?us-ascii?Q?mFtDhx6DnJ6vRdqi1tF39tGUvXCZHOstV08NrCYUv/Fa+GD52U6L1+4FsVCK?=
 =?us-ascii?Q?wWSST+FjkUvt+tjN908UgzaVfEMZc98BD7ij2E8DgBuB4uhZm5d7fIJ3Egk2?=
 =?us-ascii?Q?xGRNO/Kf+L0A+SBRgSgxQYgXFCHhd4mBi+Ras1bcSBTJoa7iMgQdRTrYJzMU?=
 =?us-ascii?Q?vSxXe3HVJ81rtc0VIY/Z6bvQ/N92l/VM5n2JmLo/r7IK6TiykO2uQw6G6qbh?=
 =?us-ascii?Q?+tL+2SPWNUoiZQV8KJfZh2k6mOIfD5Llnav/1wJce2z1R3QC8dp3jn6Dn3IK?=
 =?us-ascii?Q?pYzrHQLrMdB7lAWIzcr3iq5xrXpqjp12+JVaT8Ebt2bFZ0uDy4iTXvqrl2Q4?=
 =?us-ascii?Q?cZSjPG8WZZmX3UeC1BPnyAuiPqsXI9yE8i7oLQ27tncM4aJ+7EUxI32oMPEV?=
 =?us-ascii?Q?VlSrildhMaKIrdivi8lnBYRa2N03WyEZ8uhOW5ODSWEQv8phyGwz78P+qXkq?=
 =?us-ascii?Q?DRaF4LT3u8nmbaOL6QxGPEucAKAEijZLSygMgSYg3THC7Yxhnd1hN/DODPcv?=
 =?us-ascii?Q?DwN8ucrWTg9Jz4uETFpAAeYLDSmrSD0yT7DADEH1DXp/wzUaEcOrGTEN/k8g?=
 =?us-ascii?Q?bQaYUB1weQmCznxh1mkrOPwNK1SZKxA8DqUCYIqavOreQlIxTecQnGsK3td1?=
 =?us-ascii?Q?G2MuE9v40KvX67xWxbmSx4yQXokvJPcFIIeXI7k2YcrMmddvqS8IYzFVJhnl?=
 =?us-ascii?Q?cAcr5tFfSq5LBoqChRht4IWL29di3ascyzaOTLqa9wX52tUTKQh2wJCF+W+P?=
 =?us-ascii?Q?B1VNmJyFAiOA4Ic8WLFg0hAFIl+qB6sYcaxd6G77Es8UCzZy/7igauawtqUp?=
 =?us-ascii?Q?ArFQySpZHlbOtPEMqUKbWIK81uyMAtkuYHAdfa43CANoKzctbZq4N8hsaruW?=
 =?us-ascii?Q?Rpc2JkWuWJenZgl+vPtYcUXEid/kgYAlDepzOyNU/lqpTeqLUTyypoC58L8v?=
 =?us-ascii?Q?AeiHwgdAinctc1Hq7qyw2+f7jFFfQCPxbDzyMIzWyy4Sb0cym+x45M9ZcbDn?=
 =?us-ascii?Q?/WHB0CnUhDK65sszhhuPr2Zegzn34l7fTTp8/pDKiY8HgwlPSou24HuENgu5?=
 =?us-ascii?Q?bpehmyDOoWP7nItExOf5cBwx5fo9rQAJttuEiYc51xJC9YgP6n0GpKztWFoy?=
 =?us-ascii?Q?Yfi2UvP3BTMlkcx6NARnc6K7tZtxhu9OToQMHCFckZvysExdDAsQ4OWmulFQ?=
 =?us-ascii?Q?1vd0eSN8sEzLtHTZU8SUP77Ts9zR7U0ArWl3a7SKLvb0v1zzQPM/VbOfwqyU?=
 =?us-ascii?Q?is55NVNr3yLWxFaNWV6f2VpoVP8dxdHtfhHSJBABHkK2k/diJinBaNuInHDx?=
 =?us-ascii?Q?Kcr4j7z9HfsY3mWHxiIoglDUe342HgakJm7+7iKdpmRKgMoBn3v0EPHycV98?=
 =?us-ascii?Q?dx2eEaIe2KFzDFB5hp1vPXzrBRjHlW4iRUclNmPx2CK6Ouuyh8dHhwt/0Ft+?=
 =?us-ascii?Q?dsvWz6V0AeVO37ISvdU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QeLdKqWOx07m8rc9N09RsBef0bgEEcmknDHs2DaaqGKrmbJiCAgv4kRTUE7Y?=
 =?us-ascii?Q?BkS7RGLdqyXl/bgWI+ifb2lZgRBGPtc9yOG1a77QCYKvaCTt3qmIziUoM0of?=
 =?us-ascii?Q?UvXzHiRyt7ObYD8qxMOvsJ1fmA3ASl7DBUc6RHvF5LRlbWIjI5Hexc3LGiZo?=
 =?us-ascii?Q?RfU6BpfjzUcc0LzZ1PPlAY0Cd9qX4XR9drSBmMPzKTOiScET/Cx9MzZkyPyR?=
 =?us-ascii?Q?EvZ1Op3lY6aFX7DsCvOwsO6jK2B+W2Yazi3rxBraNJ5M4WILphK6eF99m0X+?=
 =?us-ascii?Q?2yRDB9L71H7ey58e6ZSoWV7lyqczS7XkGce/4ISJ6mUdaQATGV3d9pfzwmr0?=
 =?us-ascii?Q?UOWAXtkQBEmytyoG4xPnK1/H7eDZMbvq7a5YKp8LOJ1vGBkiGzE4W1scgbL0?=
 =?us-ascii?Q?TPxdDDDbeLvXidTb7X0QakODfVks2hVNemaRa88xNh/MqrLmKOCcdTiWxWcF?=
 =?us-ascii?Q?OkX24vogt/cBzKDIKc9/87CTxJh3lg9k/MFnqDAh5LP1NXiahjWFfQ8Y72ZP?=
 =?us-ascii?Q?1u2TkW989ZYfgbDoqc91pqp6fx8M92+d3xs/6SnS5CeI00b/ledEIMWUhj2W?=
 =?us-ascii?Q?9QnFyvKZsBg7V3mRl0TttVHhDF8BD3mP10jf0Py9OjVMgoLZj/Xa6v1GQhv8?=
 =?us-ascii?Q?nyr3wBCcIALYKkH8O+FJKQ5DElDJY1H5L1EJTR1Au1EIL9Q9U2iH+Bm/2x/h?=
 =?us-ascii?Q?Li6fZG9x/DmfxvvWg0YJMUfGfrvfbShiwKu9YDFgJy1u3EYs4+DWXSD1C8m0?=
 =?us-ascii?Q?R1Qg0XAtApHW/74CBSAyaG6inQvQTqTX51KkgtDD9uHynDNlyteh3Up5RNUE?=
 =?us-ascii?Q?E1z7fcrvWNPmljgtxavxXEIRZU2uotE8camKYDBH39lzfTiP09sJ2TGX6SyF?=
 =?us-ascii?Q?Xtu19X1Hf0zM2wxkAsU101aAn+nBE5hfnDLtSN52yDPqIMedoOc6N/2rSx87?=
 =?us-ascii?Q?gVj6kh3pMr9yL1SHb8B46M45EGoGu1iJju9jVKBjBD8301A8WOfoBxQ6LO5z?=
 =?us-ascii?Q?8qfVwAZPEXWImr2puHU6tX0DTX7fLiosjDa3P1zC1689Mw1D+xdL+xg0+UE4?=
 =?us-ascii?Q?Mn7Ew7HLIhih+x23ciRXQZayFUE6Vx33pF72NqYBE6di2KCQOjEhMeaJhVLB?=
 =?us-ascii?Q?Hd036RKxLY2e2pN6o5YFQMNUmRmbdEnfJUaRuj78zYCxLplJCPAH/CvcqK1w?=
 =?us-ascii?Q?tU6bWkyYf0ZcI0wYk4IZomSxD7MIyB6s7Tp2PRCQIOO5JYSxxNvZMCfFNXyD?=
 =?us-ascii?Q?stg/cHolahIvz9OeI7SCmu/E3CZjk052kgefI0nY3Yi0M2qX4pfKK+iDgB71?=
 =?us-ascii?Q?0BelSGGMWh8/RYB+iMgl6PMN3IqyMD8QKd+s4Hm4OjWSd5l1Sovh6bUz4V73?=
 =?us-ascii?Q?9DMFqYM60mNyG8bP8TXVKBacLtbG4wsYkE4caWtHjTPHqQhXG2C0+YOB1fgJ?=
 =?us-ascii?Q?zaWC1/vpX9mC1GbOYtEyoPkbAw3HXZJMyIs8Xa1XTFN/R04f/YO28AggXjdE?=
 =?us-ascii?Q?8V7ee4TzpghAak/EvFj36tIMxqM4ozVzFWUVxJiRjTpOkYhPftaqlVLCDOTS?=
 =?us-ascii?Q?goLpX9xF6SpoLoZDyAE8PJB1DKsSaaMKcQDe2LkWYZ43XY+VV8nB6pS3JZFW?=
 =?us-ascii?Q?ZKXub0ynv+eiWWfn7lKZ5tC02d9zRJdF5gvfP7Hm8zWwwr8RYIhcSCr5fXih?=
 =?us-ascii?Q?ePonq2NJq/dq5GNpLZyGPLp9rFY+AB99NIbocsiylcl6CNFvx1u27DKxjZjl?=
 =?us-ascii?Q?KgIBEAz75M3uRsE7lvGqvhTXZtTJa5Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8f0f47-6d98-4ef1-ad94-08de6fc13f33
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 14:14:51.7219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hj3a9XT5LoZGazBr3lAiMsgsNsPfHo4XRGk2Wa3YneZ6EyJABj9gbXmNgbhMRX9UOWwfVHVjKOn07EyDm8n/cJFB1GjFgqcylynJcQe9yDY=
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

Replace the full igt.h include with igt_core.h and link lsgpu against
lib_core_igt.

This removes the cairo dependency and limits lsgpu to the minimal core
IGT functionality required for device enumeration.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

---
v2 -> v3:
	- add libpci to lsgpu
---
 tools/lsgpu.c     | 3 +--
 tools/meson.build | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index 935371dea..057a594ea 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -33,8 +33,7 @@
 #include <string.h>
 #include <signal.h>
 #include <sys/ioctl.h>
-
-#include "igt.h"
+#include "igt_core.h"
 #include "igt_device_scan.h"
 
 /**
diff --git a/tools/meson.build b/tools/meson.build
index 0fc2427f9..903c0de0f 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -57,7 +57,7 @@ tools_progs = {
 	'intel_tiling_detect': [tool_deps, cairo],
 	'intel_vbt_decode': [tool_deps],
 	'intel_watermark': [tool_deps],
-	'lsgpu': [tool_deps, libudev, glib, cairo],
+	'lsgpu': [lib_core_igt, libudev, glib, libpci],
 }
 
 foreach prog, deps : tools_progs
-- 
2.52.0

