Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFF9E9D3E3
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 14:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF03110E667;
	Wed,  4 Feb 2026 14:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRAs3Pgx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3370610E668
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 14:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770214601; x=1801750601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ujk0SrxS9lvfiKf79mKtLHtaIuWpTd57BmEfgdyp2nU=;
 b=DRAs3PgxZM2rMypgpED1fnDr5OQ9tnuDrFqw/UyvTotUYSQpso1Iymvh
 5TD8mMN+ozndOuUVv415UlEstfBx8e9I34j/JVfBbwb3klyJoPQ4XRrtN
 T+r68seRZ79r/j00+7K79UCBnJm/6Rwml5/k3PQqDuWkVMULH+pbKLc30
 3Fz1JKRJXB/ZxDnGNkYFxuhEDiHznFRU9CHyiPR6CvXunLHrxDGL0UsyE
 h5bzwUo3pR6NUeaH8kpeTG1zU26/F5HiRFwYIkGLmEOpG3vwgd1dfRp69
 v5suRZiXCOBv6p9uUpsQckP6BbErsnhT/61YcsQyErd30RMhG7eF499a1 Q==;
X-CSE-ConnectionGUID: qKTS3rWqSI+ULUJe3Cubjg==
X-CSE-MsgGUID: tDoDd+57RgK/jTcQvGt0tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82835261"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="82835261"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:16:40 -0800
X-CSE-ConnectionGUID: l42dnY6gSEGuuutlGnMwPw==
X-CSE-MsgGUID: ZbFOyYZjSWepJsvdoY1fMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="214668675"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:16:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:16:38 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 06:16:38 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:16:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INhwms3UsR6cRmXjgrmyQQhyzztLzxnWKl5FdmF/Zp9cMRJqoTjIKKSxKywvcki15CnbBzt89crH64joSg4sbFw0gYopWwRHJj/LWAw6/VGncRt9eAYShb1qyHTUMZYmXgc7hbECVV/5d9GwgIgllkUumr0rczuy4g+f2M69mGWSC1KlzxFgmKdm38FnufMlNDAIFxgqU3yIWnbTAOx3BrNlVs7y6CZgVZ4SJBajMNo8aCf+7pA+aUZiCy1iaZ+CBc324yPjBLUgSw0P7QTqOoRgGt2eNKb/9rYLg74iQZNSqkTxSu3pP+n1axhFsqagcoeNnQXGBZ/dKF1hwtMLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kt6py5+zDDPECB6vbKQnE2Azs6tmqqnB2MkbE6Nx7NA=;
 b=UE4UEnUByCwynOy6KlnDDkRoZkz5ffWRrgb2VC5XC/3unq4xEcFuCeHlCq8RlRVeV3/5PMDpmXQAesBJwQyRG1GlZ6X4T1ahmKlElkRL3sdO6P2Ygs3X6EufbuDJDY/wq3RasM7Et89IhNYPhXmDVFrSDxqpgV6sclO60MZiN1h+EUAFo3bmmjy1Xg/ONeRwuu32oMOJuMLDp9P3lT5jw9GQ15s59yMHjyiyhDbnCCuzoE+ijKcenMnsYHyFL/8jjS7rOn5Wy/SUfTu7vL4BdxTjEhC4cRzyvYLANRggEP04onq6896EoMMO63vOP8PaDRS1LWQMsrzYDNWTD8XdEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 14:16:32 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%3]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 14:16:32 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: [PATCH i-g-t 4/6] tools/lsgpu: drop cairo and switch to igt_core
Date: Wed, 4 Feb 2026 15:16:06 +0100
Message-ID: <9f557fba7fae384937686edc8a376c10197085c4.1770212190.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770212190.git.sebastian.brzezinka@intel.com>
References: <cover.1770212190.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c67606-c1c7-4d33-f739-08de63f7fec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?undriAnuf43KOQV/q5R8E5yEH1RqcBKDHDwK4zZToxuA2x0yfKQTFhis6OtV?=
 =?us-ascii?Q?3D20V3GK5H+qGVsIHUSYaUa/1MphVLJ60oaIRDTy1Z8RvI1UK3qvjuOORsJ/?=
 =?us-ascii?Q?DAOBoy3C85K+zMeY1lLZ4SLBlv/hCsUlpj36VzzyOlt52+Pqszhk7okZpbnq?=
 =?us-ascii?Q?bI9Zw+5xoTgiHqsCTgQMR26KXe6Lx9rLfBLGyCl/sxAB9A3t+gnPJhJ46FY1?=
 =?us-ascii?Q?BVNzm/pA8wxShabSfyqpQzRqfPLUmWNB6gKsda9EAWVsLA40kri759KHZItp?=
 =?us-ascii?Q?HHGNzGH9O1efL8KcJz1lWFZKSYcMFpQFm/v/iXGfjWv+mRC2TSULa4r+OSoE?=
 =?us-ascii?Q?so48m6VO6dmtG/YOgEUipV0kD917fM43OK3A/8a5ksDZeoUD0MTWsGgG7dGC?=
 =?us-ascii?Q?vwVplsjcsTvtv9oVl8Xg8oe384TrC63SCWPE4guJOeJPdQ2/rZmzCjgHrcNS?=
 =?us-ascii?Q?bpSvIEc20KY3Wv2H7zTr0SaPkkt4Zi0t9GbgQVk/LPtaQE/VcUShSQqvNpuZ?=
 =?us-ascii?Q?tof67Db6NiFpVm2GYW1uHECV1iTTPQNtme7pwkSD0xocJShQD29AQyd+0Ve8?=
 =?us-ascii?Q?H711PJjAMOie/41ATPekpWVUPft/YrAXnyEPQ2lh9Z82NMVWmAyVWGEVOIzz?=
 =?us-ascii?Q?wSWGn/egd/gaGgQcaS28UMnFglfz5Cml5ioFFM0u08D208280csBOTGvqs4m?=
 =?us-ascii?Q?Io8LTINMVQ3xnHEqN0jNsRbCtOhcmV6MfS3krQ+HsS4Lff+lleda9KSlB/ys?=
 =?us-ascii?Q?La/yQaQZnaGnVmEn6wEID/pZZJox7rXlhslxQmpok8JR5gh/+EQcCOLOhRHj?=
 =?us-ascii?Q?9XYzE1wPMZimdE7PD9NWKBkSVopINNp6TUnI1zrLZ5k5Egingq8BiGeAg3gA?=
 =?us-ascii?Q?5ozeYulEPIMv5uksnG1fto11j/Oq2MUPVQt4FnuNx+HgDmQ93fg6L+scoeYr?=
 =?us-ascii?Q?DeDVT0HsAUvo3jNS7oc96DlH5qX+DkcKJcxvh/NT4lH9sv8Am251XHOANXFL?=
 =?us-ascii?Q?NzYme4A3T5kRfvHJfVLNrg3GPGf0X/WfgnD1irkmYkE7jVZ3Dwe6phJfa7oB?=
 =?us-ascii?Q?kygijU95zL1bywocqFgkJzuFS9t/WoyHDdtkqWqa4UizQjfwcn8LKv1c5K/W?=
 =?us-ascii?Q?YjhU5hv7ZXlVMFqzp/UG57jSMRvBguUCsHNgP7xeT2Ik4+f7ZtMnHbkz+o3O?=
 =?us-ascii?Q?xxZ8ptIqGowu2RZRXG7KzTx83BSIM8K24ZxLDL2D8qovKSXQpxQCM1h3Ozmf?=
 =?us-ascii?Q?N80FWtU5kx0AnkZJtFlEHwxlm3k6gXmUqNlJhlJeZLpT8pHaBW8vpuY9zaLK?=
 =?us-ascii?Q?flWvCrfsd0DLUgEwayHpZhm7xwqYd/t/HWGpxPNH48Ryp3Nky9Nw6zsSnLyZ?=
 =?us-ascii?Q?QynSjV82OlTZ94Lriuu1aJqZkbQA84BNafOP4phaf9VwRHL3lJHRemsjnNC/?=
 =?us-ascii?Q?vh2dfM6ExsmyJxy9xIJbvkmuTjjmNrovu2v3NnbSjVB02/cYRvLhekoO/3p1?=
 =?us-ascii?Q?LZhIgG8gfFZaV/VDtYjAQiC0EKhG6in9pcHX+zfyiEphW4tnoZOzCth6qQm4?=
 =?us-ascii?Q?Nf3e+Z+u0j+SB6HYLrc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9OdSYhSMQiHzrig9QkjNHVZ2hXgybUTyVrm7wCVi9rgNlVy1UNNIGFZi1kt7?=
 =?us-ascii?Q?2Ht9gAFe3jQVHWghCjV+dwQGH2pcsnYwhQdldGN0CpnK3wh0qR2FCzhETmHY?=
 =?us-ascii?Q?/gbBDJ8IIyr7KVd6o82/biCkRLvGqSzqgCEZYVFw3bleuoP6savtuFzomrkZ?=
 =?us-ascii?Q?e+xhfo326RqCkB2k9uF2owjmgG1nBLyE8GvKDyTka/HzLIWjCCtLypyffzja?=
 =?us-ascii?Q?4Oh8FRAropmbbfjfBJZyXCnWZ6tTO3WllfYsVXXeDVWXThVESEr7RU0gg269?=
 =?us-ascii?Q?6ag2CLSSpAzb2Vhk2p8FpuutNE6JjC2Yw4Wg/6QsXWc/8FuR90rY2fdXCOEI?=
 =?us-ascii?Q?6ltLvJ9avGp+Hn/gupuEfbL8rk8egSnQvEIbI7NO6TFFY4/FaxEoOkCT8/XV?=
 =?us-ascii?Q?7/DTHzO7sDGx+4h7uPuya/GzSYhEMvt7YkF9tGAFNYqyZMggW6I6CVH3TUb1?=
 =?us-ascii?Q?61WKDwLDED1ywgYrctS7s27ue5B7mo3nLO85O2xFAKY/ugW4BRaE6rJTBZQ3?=
 =?us-ascii?Q?Q2Q6rruvl2HblPAXT0puS8yjPZsDb1Br9lk+cfZRhUSLzmDlRdPjwbnhs0d5?=
 =?us-ascii?Q?5OVm984meRp9LpeWqy2IKrdvrST2oAj+DsXT9kW0CMUxI7ngEWpEKVeQr0pO?=
 =?us-ascii?Q?6dm9vOaSHwgDWIp8R8gIoIkHNr7ySGJqOX4uYdyK87lKMVCbPXJoevUQsd1q?=
 =?us-ascii?Q?9YyO2EmAZFLUQk4SG5kVoMs9QNdown8c/OgSaP/3emQEgX8VNC7wkwnUii91?=
 =?us-ascii?Q?Ty6eEHZZB7SGKmspULj7uHNjKKu6btAsUlclxEEPcsgUzwqNtUbuCcNxCdWB?=
 =?us-ascii?Q?KaEhX96v55masyQSO10IxJylzlWVtzJRe1B0+VzqZHC6NCvnKTEp3NWgMmgY?=
 =?us-ascii?Q?faOhEdPXORm1awqhv2godYdDR4ZG7idaXGxFm0nU11CHyMiPq6US9enCYQvt?=
 =?us-ascii?Q?TmdyenybK2qUMEETVt6UPug1nnZ8zcIKUSykPcuapO3zZwoZg3lS98Llrizp?=
 =?us-ascii?Q?vlTbNsouCuXkYAIx02CuY5SaN6drikljRoPhIN8DFw2kLEqvWpZG4v7k1daW?=
 =?us-ascii?Q?IdVkvNMpAluspM/FtYb/1Ek09kchTC91c4OxHiDoPjfFR7+qRosQmPeMi59L?=
 =?us-ascii?Q?atXMOaFOCX1OBpaiL4nLtavZRib2HMU/DK0t9CIl3ZqO84exVqrwIACeA1SV?=
 =?us-ascii?Q?JhkqIww+lBL6TywOlYszUzGtfDhn2uTmllWo1FtPvw/8EvxyXQ1KCI6SWnMj?=
 =?us-ascii?Q?L3cZ/OAxmaxUGZ2y7DrrXnPlfDD4RFxpqVxhUsGyZ/i8B3ow+XlXxOKVzpOj?=
 =?us-ascii?Q?43nQmQd3yU91kZlgMvuzEKBvkGK4WY4cyctlxcH2kB31CJYsJKCzfQJR94L1?=
 =?us-ascii?Q?ckf8SCMp1vb6x5z8ghE/ylhJmwDH6gg8joA6Ee4ne7aeflkKLqZgekXfLt9z?=
 =?us-ascii?Q?KPb3faSVmmNGDb46/b7xqFiKLTdL3XnjcyNRMCUYnW/bbRh1yUAUHheQ1Qlc?=
 =?us-ascii?Q?xtymdyltVCq5krY6Gv2o3LjiTQJtYGt/0EeYTm7E1ZtCOcPzYWS5SHmOlXYi?=
 =?us-ascii?Q?8yjJVgIMh2S639spCmaaBODe3w9UHBzvm8CE3cZzwnmKLIIXpz2BN8G20zob?=
 =?us-ascii?Q?4oK+niWAZyyK4fxdTT2NppmM7Q98QNIT5anpMTKJ7xtqYGfgMC1gO+ZxdSvU?=
 =?us-ascii?Q?Srf8elgMQyk4+D5o9Too2SXzgr1klpJU9fbBhD8TxAGWkbmnvxTdhI6sFE7b?=
 =?us-ascii?Q?Cwr0nSHLsnuB42m2U5mBWgHLqD/Y7tU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c67606-c1c7-4d33-f739-08de63f7fec6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:16:31.9511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrhynK3lDJVDcG3WZ6xI4VBoLNgLYttfBCH1RRnhBXXhaulXmeEidaLefcWqkDqdJRC+J1n8MNClPCzv16bawf2ZgRQt5Zpknznqf4AEZmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
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
index f7874cf82..dc56f68a4 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -57,7 +57,7 @@ tools_progs = {
 	'intel_tiling_detect': [tool_deps, cairo],
 	'intel_vbt_decode': [tool_deps],
 	'intel_watermark': [tool_deps],
-	'lsgpu': [tool_deps, libudev, glib, cairo],
+	'lsgpu': [lib_core_igt, libudev, glib],
 }
 
 foreach prog, deps : tools_progs
-- 
2.52.0

