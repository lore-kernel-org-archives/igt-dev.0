Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74872C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 22:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DA410ECB1;
	Tue, 23 Apr 2024 22:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwLDcrY8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D4010E833
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 22:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713910949; x=1745446949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=H2frxpWlfTLR/Cc21pvGPimEui1LNZyGGHDOAzv1pwg=;
 b=XwLDcrY8/0JsV/KFlzDpmqg3/A9WmAcaJVUQP+4eLhS8hcAX60FoVhwo
 vgGDmClGNCRBcgP8EYxGly1Eq2u5ci+3dSoiqVvLBOi07aHQ7vMdi4+KY
 ZLXCsozy0911eaHU+08AgNEOn6y2N72znFDWuoUo2H+DJViSRT7krMPg+
 DuhgARpxoLP1X49B65cXP+slNKv6Gmos/P/gVNusJKJA7DI/+xZas5a1B
 n9caEUMUpOqaR9y6RywYGGe+PC/MKP2umzexrrwDcFbMJM8bqaNFWPs8g
 pOc5GCkMq5PJpq6XPxDpzV2/YLf8m9ctnescpgiKQaag6YNBZeVxwvr8f Q==;
X-CSE-ConnectionGUID: c3eqsMesTPi/vFGvOZA+Tg==
X-CSE-MsgGUID: eWz3FCGKT6iQJv3VHr4GAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9737096"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9737096"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 15:22:29 -0700
X-CSE-ConnectionGUID: sdpDgWLyTXesM+hNPC9bwQ==
X-CSE-MsgGUID: xgglbUgOQOKjyffERwnX8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29306179"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 15:22:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:22:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 15:22:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 15:22:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NViitvYfdYpCxbvRq5yRGyKcPQUV1jHuUYLMPeFTIOehoIZvsU3UJWEVla4twtDJ+zwcER2LJ1OSeKZpqvpC8ZwIfsNQ3tZU1OGwqO8BPm+kYx/J4tb4hjyQ6TnhMVuVfspAKLfnjaDAsEWQj4MJaijMe78K4htzKauW+wZzGc1g2fRmY2jicGMkI8hpcAWuZQYbmpUZrDsx9gSUWb8alv94wvPo6WhB7OZmK96w/5jUj94Y+CZ8pYiAPT7m7iow5dIgWcM3RQqTXK00xYGqxba8z5qeq8E5oi5ldaQfyE/HhKbVpGwNFdyLWhZwfa5ZAd5VIEBgGe2HMw3JoVbw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtbeRIKKdT2oLaOStpD3rQPwn8QyEN9DyCIbkeDzqSQ=;
 b=BhgHiZ8kI5RLPRHykOdRIMjwir47X7D2ALkoSK65G9DW7GskcU8gywqHRm47Emr2foloFa9HCrn8OS/QAJMdaI5hrljvOIAmBoDbr6ovPVyANAHrMXQ+B1tRyIhce80qRbg8LvPPdKyt9kB0AB4LMjr0+OLXK5IwvEHmUcTYNogv/+dr0+PvpihOY3avRimGMPGmeteo9NDBjbSl7Tp0ENkAlGNEljvngGLPqDmTUIZ11FHGHzn2AEACMcQ++0mODaKac6AtsSsIYlcrEQx/ztjeabCkRorcgBllUO6zOUetZE9X9Y2X7x6nUiHp9Pckq5DpIlEpceseEnUF+h2wtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 23 Apr
 2024 22:22:26 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 22:22:26 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/xe_wedged: Also add a simple exec to
 confirm GPU health
Date: Tue, 23 Apr 2024 18:22:17 -0400
Message-ID: <20240423222220.1285742-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423222220.1285742-1-rodrigo.vivi@intel.com>
References: <20240423222220.1285742-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:217::17) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MW6PR11MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f37df66-c4fb-4a1c-4ac7-08dc63e3db1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YYkvXxHotF1QPU4b+JEgBSjjiZYVBS7QOF0ib6YmIoHKNrRfFf49C1yek90S?=
 =?us-ascii?Q?+/P1dhZgmck6iNGTypBmOJTHvEy80QSDLbbtxjZSW01Vle2XIhijsXG7VK2J?=
 =?us-ascii?Q?5OZTfZJ3Br1nRaNvfnnv0MzMyFUEZuRI1lv068o5otFJN/N6e2AfGPOvTN5Z?=
 =?us-ascii?Q?s+/lwqpfW3eFdn0O7rRQJ2WcnI/m/JsQ8s1QmXF7t9ZNa0P4aTYp0QxNyUZH?=
 =?us-ascii?Q?obMJW2upb62EWCqo84Nm+s6q5PayjsKxSYVhOZkOJdAGK0IUTsmXFd0NKrMk?=
 =?us-ascii?Q?ZJabF36pwpn4tICqZitzJMQsS8TEoCJoWhmhmieNOiwuIp+xgBAFzeTV1p8u?=
 =?us-ascii?Q?052x7YIIFtfU7SXYfw0dHQH6G7VzgxfY8CLMukrYev9ajIlbr9Zz7eWi13IB?=
 =?us-ascii?Q?Kle5gzwQLhoi5KLOuEqxjFqTxgruoxjaJWJgadV0Oy3bWxoTQa0XWM1Pn5sL?=
 =?us-ascii?Q?xq2t4Cgl+xBeUpfdF+lRS4p+Yu7vDML64G1bV98jec4UsGS+H/s4hXpl5Bnj?=
 =?us-ascii?Q?a7M/oShJZ3+ULA4qVCmqYlFYlwOYhXiuU0jzOwQlcJpKg5rCWffn7pZTR+8w?=
 =?us-ascii?Q?mCPoTRUeL61E0SsfXsIdUzi3ZulWKIMg7rORfql+3uSqa7yYFhVnmGSsIWpK?=
 =?us-ascii?Q?0umgPw0nP2EusFWwMCjeFbrkg9kcL4YDDhfLUgWG4Fvu1Zwdznq2CPZw+9g8?=
 =?us-ascii?Q?MD8yhc8BtcISRUEJI/qf9q8dd5zmIPUmeFxFj2M0Tsi1AvLfqssXN9OxPQy7?=
 =?us-ascii?Q?9upx8EirdE3pTYTvqkdV7/wHJePjbjeTSOo9cXItPWB0aZBjjISk+fQnnhJb?=
 =?us-ascii?Q?VeRFhDcU2/WRmPjQ638KzLy80N0XG/Talu/jzq12eK8nx0kUDQCZEp+5qwF9?=
 =?us-ascii?Q?nrwWK9dL354djo7pFwdmebyeJZC3HsR3piT9Hyl856spO/sgoztuW03lOoij?=
 =?us-ascii?Q?NE+fBIkAvT/DMwHlUhMEa7vFLL6gGb3vwdS8cuc/aEk0SJuLRHgIyTm5ijIf?=
 =?us-ascii?Q?fZTdAd4B2FFBSbpBZ4FidfMgmz0FBq4dDx8ea2KXZ8i+NEF3fyUGW2XrZG/4?=
 =?us-ascii?Q?saXUBiHxZSliYKy/bMOElCLbEgqsEOmYUaSTLpXRwaebV8STT4pDehO/wuCR?=
 =?us-ascii?Q?Smp0wi7nTPBGPjXXXyS1y304RCKO7yHtl1bXhmD1y9tkYHFqQGkoATzhZ24U?=
 =?us-ascii?Q?tJSzGjj0OSJNo9OoL/PO2IQVUI55gz1Kco839lTHSn/ow309UQo1aUIOi46i?=
 =?us-ascii?Q?3yLuQ05N3dRpJqeDTlphLGJI/YUrdSLahWiry7cuLQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lkS9Gc0Cfvopyg6msftih1z37M1Pr+YfKBZ6m4iAXhGWGgcn3ePx2snutkkY?=
 =?us-ascii?Q?VmXN4LF/5LPBTdjWNJTIP/cTM/U+ibjMln4cRzGfWEhVF7DJUKV3pPvm+vDZ?=
 =?us-ascii?Q?WdGxESiC3PZCMR1dyIpLpoSGAGEFS/TG2gGpcGhbtfNHCyIHTQjuUuQebui/?=
 =?us-ascii?Q?D/AxSH+7zNmidLf7PhXXQ5t8LlVTf50Q5+dNDn2w/iqAbaVbqft5nlo+XLY4?=
 =?us-ascii?Q?1sgf7Yi3pAOehMyvev6Z9vLWtd3Exm3Lj18eCZoy90ivXiQAjZjdnkEIheO6?=
 =?us-ascii?Q?dM9tHAbv3kul4635LaLnMxsYrdqDGtdlKrSq5/DIH9dGaRkCKcGSED+jbZrw?=
 =?us-ascii?Q?3Dh5y/ZSjhPxpju3S9Ugf1O9JuFdMVOqNMpIBNLXkKP0fTbF1XkBE6cDSKn2?=
 =?us-ascii?Q?7hTc89XmsB7WrQgr1jtAHNnSLNcYhhyaAhtaW7WfwlBmagA/ERRhfdDeJlGm?=
 =?us-ascii?Q?jRVHdcJ1JwQqx7lSWDR4r9Kg26mG9qNVZpBEzGUb2c7GbOD4HZNivFfFBYvY?=
 =?us-ascii?Q?2Z7qqrAMRgHJ1idQn7QeIa9APYtn7Hrv+SnQbkuBfF/6P7Ut/UIaFQmLPDna?=
 =?us-ascii?Q?P9kYVcrFw1NkjScXAS08IYKbaRavt7s6i8VKjnqdWJbNH6pKOVitDTzXe8+H?=
 =?us-ascii?Q?JxAtHLge/jTo/6io4YooDive4bHbO/0vxHEoe7W+viqp2xvPv7ptsTRMzhvv?=
 =?us-ascii?Q?mbvipI5OdDFDhN118KkE1ps/su7Nnswl4r0AtkwI0qyQmt5VrXfF4sDvWh0x?=
 =?us-ascii?Q?+G70hvnD1VgdzOJ4qQsQxJpcQXCcAt4aDGG2AsHWXARg2bPCvMg+Zh0yatbP?=
 =?us-ascii?Q?qIB1zlZXfLh9D4GtQXDna1k3sEVoSsnnOQyzd0DDvZ5oIB2eDN4ORX7hZUW2?=
 =?us-ascii?Q?7nXHYGXFQEyXkHQRuJ9SFQFILkcsqWdE6OGc1GDA3ixuvwZAFEkT/imxajFl?=
 =?us-ascii?Q?XjZkgS8TT7edNDJkAWcBaYcCP9TcG+3NGkofoqW0CGctwkGd0H8JsL+bx7OA?=
 =?us-ascii?Q?aqU+C+6fFK3OByIVL/1CIP8/0Jvlump5es3YHGnSJsG4EZEv7haiF+t8Y4Um?=
 =?us-ascii?Q?kGg8bjiaSXnYwh8LKa6KX5ru4T7TaieNdCjRb8NDP6xLHBOekFO+DozV4y80?=
 =?us-ascii?Q?njssxAjkahp1o/mUvmu8kutRzwaOjyRBk07Tou6CYhq1ikdDcXP8IZbf1PC1?=
 =?us-ascii?Q?MBgxn9mGhX9g3WJFfrVNqN08P49xwr1oJmjTc3Mcdwzrz/5AtjxIk8gA2U4C?=
 =?us-ascii?Q?Rw5/44WxOFspIr/aoGtYZ2hx88gq9Rhx3PQDfNJd/gR1E1e4op93758CMbBH?=
 =?us-ascii?Q?+WXpzfh88GvAtqaze8CRDdOOTOTkYU0lD0gH7Vw3ZzxqD9zKQLVq+RDpVmh6?=
 =?us-ascii?Q?2d+ba2suP8Of5ZhBgc3BnbuEye5tgM9LDgaeEPXdqR1chbHmePdNd0HzHoIZ?=
 =?us-ascii?Q?LsxRv0icipNB/MZHEADXMZyyqGtMJzSPD2TvSNkbH3CelVcszUp5NtV75k9v?=
 =?us-ascii?Q?HVZtXzVTTFtxMGqsXbWmR8fEgUy85wFSvlMyXGjIU+ElxaZEgHQ+ueHHut2Q?=
 =?us-ascii?Q?ZIi2cUv1L/mDcH6hyU1p6sSGkMCnMRlETdD91jERD4f1ND3VMJrCrgTQDA28?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f37df66-c4fb-4a1c-4ac7-08dc63e3db1b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 22:22:26.6966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aQJsGWyuseQRhV8r7pAXMbC1S1Gam/oQoYyytlcD13Oj8QoHsEn6rnig+9mUraj1arlUOd2PTw7toX28FSs3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8392
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

Besides confirming that the rebind puts the device in a state
where we can send IOCTLs, let's also ensure it can really
perform some basic exec functions.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_wedged.c | 90 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index f2587cc43..ab9bf23d5 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -17,9 +17,13 @@
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_kmod.h"
+#include "igt_syncobj.h"
 #include "igt_sysfs.h"
 
+#include "xe_drm.h"
 #include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
 
 static void force_wedged(int fd)
 {
@@ -75,12 +79,96 @@ static int simple_ioctl(int fd)
 	return ret;
 }
 
+static void
+simple_exec(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint64_t batch_offset, batch_addr, sdi_offset, sdi_addr;
+	uint32_t exec_queue;
+	uint32_t syncobjs;
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int b;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	bo_size = sizeof(*data) * 2;
+	bo_size = xe_bb_size(fd, bo_size);
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	syncobjs = syncobj_create(fd, 0);
+	sync[0].handle = syncobj_create(fd, 0);
+
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr,
+			 bo_size, sync, 1);
+
+	batch_offset = (char *)&data[0].batch - (char *)data;
+	batch_addr = addr + batch_offset;
+	sdi_offset = (char *)&data[0].data - (char *)data;
+	sdi_addr = addr + sdi_offset;
+
+	b = 0;
+	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data[0].batch[b++] = sdi_addr;
+	data[0].batch[b++] = sdi_addr >> 32;
+	data[0].batch[b++] = 0xc0ffee;
+	data[0].batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data[0].batch));
+
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].handle = syncobjs;
+
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+
+	syncobj_reset(fd, &syncobjs, 1);
+
+	xe_exec(fd, &exec);
+
+	igt_assert(syncobj_wait(fd, &syncobjs, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(data[0].data, 0xc0ffee);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(data[0].data, 0xc0ffee);
+
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, syncobjs);
+	xe_exec_queue_destroy(fd, exec_queue);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: basic-wedged
  * Description: Force Xe device wedged after injecting a failure in GT reset
  */
 igt_main
 {
+	struct drm_xe_engine_class_instance *hwe;
 	int fd;
 
 	igt_fixture {
@@ -96,6 +184,8 @@ igt_main
 		igt_assert_neq(simple_ioctl(fd), 0);
 		fd = rebind_xe(fd);
 		igt_assert_eq(simple_ioctl(fd), 0);
+		xe_for_each_engine(fd, hwe)
+			simple_exec(fd, hwe);
 	}
 
 	igt_fixture {
-- 
2.44.0

