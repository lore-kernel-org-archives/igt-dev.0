Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CED9CDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AA510EE23;
	Wed, 24 Jun 2026 08:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8a5d229";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CB110E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290888; x=1813826888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OPWrzpbX+eybqr2gsA8YjHmS19T9a9X67OCubzo237s=;
 b=L8a5d229BpBcx07QIbk9mqCDJMkV5Q1yBwCVaIdlpkDr2TeORnzEZMlx
 O+7jabzJx2BGPh+0I6bv9VjJddJEAMXZ4svpK/W+ccJW9TSy8R8lZzhbl
 K+0znqU3SOG3sQm6OVYnqkwEhMIKVfOKA1QsjzAv+Bj9/R6r9qMXnxM3T
 m1pLjYUxlLaQlkeA3/Ndnn6WIDTP7xkpQhmH2kuOUtNrDIs3zM/Ah3xi7
 GrFXgQbYIYknP1kfzxTkXHuiBwQ40Mn3Lh0cLloHNJtneuEm+tvYw40KL
 oXt7xy6MYprJXNs1uy+0npeUAA1yM2OONoGKIlQ/UHISYjm6GiC9pnbf7 w==;
X-CSE-ConnectionGUID: XaXk/sfCRnyIVlCeOkrTnQ==
X-CSE-MsgGUID: czzWsZCNT8m7MS/LIJu9YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142315"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142315"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:08 -0700
X-CSE-ConnectionGUID: m3dntPzVRp+77eSieFL/sQ==
X-CSE-MsgGUID: 1PPM3qNgRZeEJls/iPvJXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="245432214"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:48:07 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yedmrHcFhdkaf7UX5z3WU/0ene93mvSnAtAdQtsJro2LD6x7cIPTUUEkFRaBop5wdPwXEjNw4may0u/JbbXXVpqOn1MIdSJmYHNZLtCMoGGLC8OvqGNONqavU2RoB1cuGye6+qpr7uvxjmLCpFmHAvx7a4qx9X2FvqlBEn363VyDlT9EmgmyuFRQLZGRrNa2NA4m25XlVzvW7WNQCJlpk6RuLHXru7NEKaN8h+/bvtkNRKizoqunDcwS7ng5KzGmA2foPyPFIjdgPpWlBXKEG88D78j8IhxIvbNH5uQtwqtsFDE+iZeA5BwDM0fRDSjAl3Cs2O3+RLl4iHjXjxfN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibj+Q5dObJRpaxNCqsLoHi9mhrg0lE1HR8u3gKV/u0w=;
 b=OZCoICsupW/hdowDXXEf3JJUjrg4Bd9EH9QarIkNBaYbRwWSgHzpkB5qdgDG/msnUDlJjl8hAEqswVDZPTCp10EGujQAhAuE+xN2/8BZj/pYU7eLJmZ5ivm3eS8wX2qbaqMhyHPBmUlQzIjG2DP7baW0TEu38gcyuG+dzzbi5k0kzeJUBpgIbEZH+o8OMF/JN/rh2FfMft69Zx0Sq0BdojP8d1lRT2oGjjuKOYrgGQsdY2I2EnweIYWHplx/lbIdu/65FyWTAam6LOsjNQzWoAeHj9HOwDnQuUDNtH/hCMZQlPPLu40u4oGWufEF7JdgXJfazdTkLllzqf6mJYsezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Wed, 24 Jun
 2026 08:48:04 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:48:04 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 20/25] tools: intel_infoframes: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:27 +0200
Message-ID: <19eca6ea840c78cb673ef58eededa9f85e1d0278.1782288071.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782288071.git.sebastian.brzezinka@intel.com>
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::28) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a618788-8c13-4fa8-0a6f-08ded1cd4df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YyN+yrv90qz99u/tfKzsL+qSJLLIYp7a0RAXDoc4WAcyzlDekyICTUOxQ/5XuspJ2uEtF8udnpy3g924xAx5bfTpkskP04c8dum0302snyOMCXZXUJuvNrHKIq4qNzuPLGIAODo/YJyfHNrVoUwO7X1CjCo+M0iGzAXeVjyLYTaeYhM47+g6AfS88XI69asNdBEdvbcDlW/k9AlP5yn5p175jQVkIBxLNZFuMEuq7jkD8cVAf2Dw05cszpzk0hpXbam8oI07qoVyRT4/mK39VuX1TrYTil07tU8nIipkmZurdL/dldlLUW7JLC/306Z8BL5AdHJTHx5k1PZyHbQ3jdtRFKysoU8f5Njd5UEvrju8tE3mpxGEWLND45LZbUp18Cqp4EYa3jbFbsMnatd++5Hy+7HFkJqTCGJIR4fnurbEmFYE9XpI/sbwz5RM/E6OtdtgAYKun9nRMjArhw1/zGXtM0ReFIUQpms0BKX2pPsVK/gacGYbipG4vU3usY8YasBDU8FaThT0mxwPNvgPvtZBzq0aJsuAVmH06A55QDEi7GEXPuoIWYYt3/LnJ37iWhcl8MSqjgH3xExXmNFvctPOjAng1vrFCDhP7KSTyADuCd84UArSoTt61oRCV8LufsB0wPiEBbSNOCPxLTgG4Zqqvmj/GpxI7kpTlei9bhk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TudgUOcuyIoWWgvlR3/Z6va643uUW2rvJ1w61tPw+7SFLOHbeoNkhHkiJ9FN?=
 =?us-ascii?Q?IKqj24eO/HAEdW4Cera4WLe49RdVIsygx0HHfK1M6Pu9hSf9tK1/2hob1WYA?=
 =?us-ascii?Q?em31lhA43wYvafmR4Jkn6z6QND2COhJdu0vuVncli8/PTHDGbXVR/HWR2nIs?=
 =?us-ascii?Q?S1MH1wcQjOP7UwrcXF1rLjf2EjVMBkX87ei8h2dw5sYrRmPi1/Nw2siXrXde?=
 =?us-ascii?Q?YyaFvFqIfmYOplST82Kp89jCr8+dnTLg69P5vxua9rpkgRGD6x8kOODiXLW8?=
 =?us-ascii?Q?1NqWxarY0M2DHZw8Tp/6pkjTOwNuREzZDw4d75/XL58FEK+VudWrcM11n4jA?=
 =?us-ascii?Q?ytGjbMmq5UVBuRzcYu3cyWFiRqtqlRWCKM/opYe00V/IkUpNwqCUKmCwku9j?=
 =?us-ascii?Q?7WE7gEznDf7+2tBwxnW+Qw/50nDYt8tZiHEQGMS5AB5hz1HhpLQ6rYS8cL2x?=
 =?us-ascii?Q?jCQWVrmHB8I1+Ds/b7x8DcpgHAf9CUbX153ON41C0FnGzhMKT0IiCGYLVcyr?=
 =?us-ascii?Q?ZJcsyUL6k+7D8RTSXJWq2+PiVdFGG+9JV+C8kz3Zdfa7IRsmAj1Ot7w2ulCU?=
 =?us-ascii?Q?jWHxrnS0qtS2VeXf0ldc4xGFbDJEcy1I1SNFiftq9g+uKDfAfDhOIBSlxPRb?=
 =?us-ascii?Q?lVI28gjjjpL1lX+YGK4JvJ6/013PMrvzY5temcPktioHviKmdwU4WAjlIKal?=
 =?us-ascii?Q?4ZUfhHtCEQLQRRQSUUKH3DMUfk3Fx+F8Q93btSIUEOiApgjXYocBfWxwYZAj?=
 =?us-ascii?Q?PzmmI7sjOqitwbecIC5bR1uxbAa50vDveDC6Jjb4FJB23ZDOIwPZ3Bx1u9qV?=
 =?us-ascii?Q?mVKhLE3NQkBxDXOavXVi+ZqLARYBAjdAYR0aPe0qB5hRgZyetTBxFdupKYWO?=
 =?us-ascii?Q?aHmmsJ/6h5vg6UoA54hvRHrkzPpDaGdSWmmkOS7rdaZpZwDQ7jjPx2iwLf+Z?=
 =?us-ascii?Q?RsQw4ivE9o6WyZ+l7Q1pBgtEBqz4RMrFETGAuLVwYanEHHWwaqBtQbMH6oED?=
 =?us-ascii?Q?t5hwCYN8kU0HcoktMgEJJigYxcKXJg6Zo7c7GvYGkboJm16bPCmOUKk7kBUP?=
 =?us-ascii?Q?o9XFdFfjFBOnifSMPHrEeAAeEYBZuLHiDuaSJob14Q839yB8WTKw6dP+3Pun?=
 =?us-ascii?Q?J+9EJHSzcNoIhNWKA3y+5u3EX5kGS6sZDdwK3s68W9BZvpmnk3V510cnnje8?=
 =?us-ascii?Q?0zfmhShq6YUIrgh3/NDU2F2zwea1HaqO6kGxfMB97Xtcl7jZJqzpBfkVHiTV?=
 =?us-ascii?Q?jXXmSQdTTjLpA1nKu5lBazqL8PNpaAS0EdsSWZEo+HVPeMn1SwQuwF5VQQ64?=
 =?us-ascii?Q?9E64A6UyPrl1T7/TvaCTsP+Tq9lvPMqTfE5VnvgIRLaZfYDYIIFgk5GFFWHc?=
 =?us-ascii?Q?GBKmPvxkTjhCFDWPTklWbbNWCik7J4NpT7ZwpIxjl4sIVPZ94ZHLjz6603HY?=
 =?us-ascii?Q?vA13HoRKFYVy8/wdUz2QGC74ON6n4xmFI979aToqF9koStYcDOFJS62isQgF?=
 =?us-ascii?Q?NBtv+yf1leqV5QayBF5w16WlW9WHJ9hCsAdFAAI+HWQsLw5WXQVu2k357Ke2?=
 =?us-ascii?Q?ST2AO8FhcnN/Z6pnbZJW7nHxaobUyE9xFBN0mn2L6Epxhuc49Y+yOZjaJOkz?=
 =?us-ascii?Q?Eyat9FF8KmUdxFudhPeoghRCJDuwb3qwl5PfctNgHvXU0d09eecA6WYbW1J3?=
 =?us-ascii?Q?cnyZ1pUMQ4cpuFov+8kUjTlZtFmZUmtTYC6cJiRaIkNsmto4Ac7N4Er4I4De?=
 =?us-ascii?Q?VgMjRVbF/Odi13l1DU5DiilLXQlASVE=3D?=
X-Exchange-RoutingPolicyChecked: bETHnlaftCzHQJ++kBUM4gqzJGXKYObu+2H4oYIU/8Npa17VQr0lJo2arZV8xkQSLFhFMkA/VYu90RNWhLrnR9DozhMo0n5xIItYTp22MYZuYLL5jek1iyJYg3NiBq/85ths0SIyCpqtyGdQBwAm3MO0ssRk9TVVR9BXeTo+/6fMM4WdEZoFvXs9G76ubYpzrX6vmrnCJuTMJuv9YfOIAas4dUhQiFi0n7odRnbHvdLG3zQ7vHP8kCX41id8O+4srZXd5VCHHM1RfKEFgI5APYwRePEEcOcvV9Fz3biDsSqytbbN7vcSJbpxXQ2H5ytvYW+wiyDBYGDHyjEbVfMw/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a618788-8c13-4fa8-0a6f-08ded1cd4df4
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:48:04.1885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVN7HKyGpdYWDOXQls4KysyGr3EuomgQto/+C8UWpOvSsoZ3UkrWN3/T8booZMCi6jcx0JZDX9c053ldG4vMIpAHMEkRUuMxW5ISd01uuxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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

intel_infoframes only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 62e4cfb69..8f0537f14 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -20,7 +20,6 @@ tools_progs = [
 	'intel_display_poller',
 	'intel_framebuffer_dump',
 	'intel_hdcp',
-	'intel_infoframes',
 	'intel_opregion_decode',
 	'intel_panel_fitter',
 	'intel_perf_counters',
@@ -116,6 +115,11 @@ executable('intel_guc_logger', 'intel_guc_logger.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_infoframes', 'intel_infoframes.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

