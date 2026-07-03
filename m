Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C439AC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A08610E60D;
	Fri,  3 Jul 2026 14:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4irK+w7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8000010F82B
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088963; x=1814624963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8W7ULOyNhXIisiBLjPoUIdF9ubC0Vt/BK0U51GGsXGY=;
 b=V4irK+w7x7habVjqDOqCq5dJYDJLWGBAMqAJH8S04JOD+XOIbK3lgkHH
 e07VInk0ENL9yHEjqAyivquVuPhfWPLYmMhKRcFSqywArRfRvsQkQ7n5q
 3WNlnpEg/ufqmzIR7sX8UJSDOlYfQtbbq6KDMaapPnssP7/BRu0uafAoS
 daudJVPjXIBkjSJ+fb6JIbuXJPJ5Mlcj9PbkmRVEMXxX+Rrv3cRJzP6wq
 bxqUBlduXe1Bp11C7WlIfN/7ORhPBQIR92BxdVlDVMATvmOuOy70aj+3O
 YXpa45/e2n778bc7eC/fKHeGlv2+aFbn7DOv9pWsMQNO+jZ6Ku3tVCCJR w==;
X-CSE-ConnectionGUID: 7vm6qHprSjemW9fVQ56Cbg==
X-CSE-MsgGUID: uydl7gtiRwKo1kqrB7nSKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87756534"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87756534"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:23 -0700
X-CSE-ConnectionGUID: E8OVj3MZQ6alUShNdt0OQw==
X-CSE-MsgGUID: MNUuYYRtSoukTGrkG9im0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="276341124"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:22 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qV5G5uyksXvtAlUIyE7l+oxaqf478PGZEAk9HeIO+/8bq5hVenxJvkiKuYPH8SSu82NfMyunPGlWBb/Jf6bL0G6XZ8MwqsPUVkvMSn31iAZVNZon7HeQRY6Brj+vFNv34Ql0f7KseUKIIz2xw3UqwDae+vlX3YB1fH3m9M93Sj/BbAzNgrhZWWe7Hh6kljR0JCZAoTAkbVAv3wYfMYntqwF5M+zmOgY3X9OlJ5yfK34u7KdkwdtBtuYByONd0WXE+BOFOJKnKhPSWyPK8iFglajuRV4uQP059FFRyEiJj5MGSa/4/hIMvktdHvcgXKIV8j0Cimm+kFVwM/0jfjVDfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLLC0pOOJFsUKuOhTX9wRIEpe2aN4bZkHF+WO9aYmWM=;
 b=rZL1PBZQci1Pe63+lHNW8SROZ6HUfQMskH5hV8Cd9CAovEhCZn6iRw/qWg1JayrH9vTBeJywfFaIUyvhr/+KdQN2mQCKOq97eU54/eTMY8LM99uaL+Zs2xzTVGUPsK27x3VYijS7WrBHOR5s76KbbOEA2MwkG+xw33ix17iNwapCvv3fD6SMEiSpRZmfeY2LkFwtgNZZ/rzzTB+Ly1DIWievGrM1qjhDK1l2uCX3jmAdTAOlr/nvs3ynUSWR4Wlto+DIzAib9wMocGgQmb930fkf78PPQJcjas6r8ycpybZROiovbaXA6gAUBxvJ1JeTPOVmdquS2Tu3uiWQLcrSZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:20 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:20 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 21/31] tools/intel_gpu_time: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:55 +0200
Message-ID: <e68fa6b6ec44fddbcd016399caf7fd5ad17b66a4.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9d7f31d7-7717-4fc5-b875-08ded90f7868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Yz6KXdac8RoKBUgglANqnlUWoWJsPlG5JVNKAikZ/ZVpfsFk9DL3rPz7ptMqBCXmqdG5qI6fY+3sUNhCa7waPHrHXp//i7IbgTJXPfSnkmYY2wwbzTsy4lFJDwuoCegFLyZz3h2Ay/w9Gf6Zwt64q9VU+vIGqdb71b6IjyX09d4GZ0NfpB+P1Rm2A6sRCPe1OQ1E9xUevYs0L0aQDh0CPcFPI9gYU11KPeHxp0Ki3MsGz3z9jI7k8H1ea5qqmnG4M6QcOHTyqAXECpVj34DDO1IMccHjvmSho8Z4rAjjjfNnPCGfBAM6yAQ0UVsZeVkH5whAl091KtZOKTcremCuRL3XKj/L9MTPjffDi02redfouKH0Y73QY/uhUwIi5kwAlBEJQJTBjMCkrnwWuyPjVcW5ZKv4g8Jf2tJuXUAks7hs61xLdh2J1C1GD76H3A2iyfjaPwxUBuUUVC2SM7DoJjDmBizZo/a64Uv0UyJAppCu+vPHTu0hf9d6W8pLWYUSdr3030teNZDlSN4NsZ0zXJp/fAI6azy7lTmNnhCvOslSEEwGnv6f6O9nV+NEa42ECy13t70kRAQTrep+kZwIOpheCjNOVb8+oVySnc/P+dJkFTX7UTuUTB8TWgqogUuDy3DxkPMRbYXAIdHGu280v/AVRt56ribGYK8pt6nyGIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/rb13vYDCq9J7310jOkDwJ2ttViBV2ygN5Us6wULU08XOJtzG/le+j6gpzfQ?=
 =?us-ascii?Q?Jltk9ER9vIZ12S3EjErtSm9CGUbNy0qchqDJ+ShRNPB3j5q279v5YwObulRQ?=
 =?us-ascii?Q?ABeg38TB5zEOBueog/KJBFW9kt9d87WHCj7EpRTy4U2we6j6bixgZwA4NTO6?=
 =?us-ascii?Q?bTIyR+uyqf1p+o0NgulSwluGsG7Q8e/ZQtKGJFQ9GSaioIPfanu6aP2titKB?=
 =?us-ascii?Q?39mJPO8RtMAB8IVa6WWclIEKjcfKkHWMmoq0cPMaWgmkCyUxhqqMOTgWc8th?=
 =?us-ascii?Q?4UcIjZi+hSTHGD5r4PMZ9jdsJQYc9XgaPKXCL307q7BHQ/raMWx6aMgySBK5?=
 =?us-ascii?Q?YIbh02KaaAtBDAmAcrqtNhyzWsV7yVySDkkaIEsBS24A96wlq8pTeHE9A+Ts?=
 =?us-ascii?Q?wt75t7hVHW+DO8z6KL9wMbFyVn88Hmw5tx8dAGj7BnPGgshWOzoUAbrXw8Zd?=
 =?us-ascii?Q?9OcdPsG7+bDnleyjfPaYvWCpcciGu0ZkWJhkZdLc6Lrngb/RjB6C7CF8lXp4?=
 =?us-ascii?Q?jnlqi+MYqQPUgR7akr+7itlWIBrDDoL1LYwgR6UzXf0ljzRvRDVjHS8cwa8M?=
 =?us-ascii?Q?ob1g1JkJ7CHRjr1DR0uZG5vuFJpsH8Fl0KtFuO8IxGakHQr8spUwbmDKXl5p?=
 =?us-ascii?Q?rrMRlpDNvuyuREYLcNE51vS9KvLhWyrf/JI3rreEKtPYpSDYK2yLd2c18CF2?=
 =?us-ascii?Q?6gHEc4kRI+aOjm9kbmCHi8qmHyR24ucygQAcWoGU4csD3ZyuI11wd1xGU7AH?=
 =?us-ascii?Q?UoCJcwBe0Cv7lRXal/7pL1Mo4wFhDALrW8cDx+wDw96XIzRKmzavBjt8DOYx?=
 =?us-ascii?Q?Z29pVeN/lPiRX9WbGnDh6NtgkwBvmYZ5xAy+XA4Y9pqYaC6Ed7rif2ZRSl8E?=
 =?us-ascii?Q?aaopwJBX5QP/mYJQbfT3ufF9AQwusI98frf/gIScO6KGFlkqGE3uPeDdn713?=
 =?us-ascii?Q?AAPrNlNCTFK0hcfgO0MkrQ9NQ1nX+byi1bmgqsIcVaBwz/6zOwlMA+ddE/Ty?=
 =?us-ascii?Q?qRLgwetrjxSUfgDiE5egB0zvh7ScHtkrrMKW1EJ1V7CoMa+CDOVZH23Vz3d/?=
 =?us-ascii?Q?CsV22jNzipFPjjhvFUAvIx9ACOq0upjInDfRaKAiEFDLGiGPe2345M98jAg6?=
 =?us-ascii?Q?F7t4ewTFbNvuadVOXDKy3DzR3C/Yt09gxFaa5Dt8fCX2gAQt8mIV2iDalOJI?=
 =?us-ascii?Q?9bIpxrWca48UKA3RRcnYqS3C6Uv18o7LPFU+RNR7EM8v0bgh+VYi8ENIUtiD?=
 =?us-ascii?Q?gTS+PspoK4m+dqdfYTYFaDNQ1bgy3q+wOkEE/uSx9eNaS50XrPDgpAAk2oKN?=
 =?us-ascii?Q?x8iiZJ9HkPtkBwZ/643x6ZVSemdFCCqljLd0xGxdt3uQmdwjyu8QFzD26g7r?=
 =?us-ascii?Q?juXochej7aEW1lEv2tmaXT2YLsvXoTG9gxuiXs2fMJkwO6MCww+vsg9SfFE6?=
 =?us-ascii?Q?H1gDROsMjx4H8PiID51YPBMZ1V2FJ8q3+lMbL/K1J1k7/32VdvVnFqgPs/PD?=
 =?us-ascii?Q?V8k5ZEs02X+DllwGhxTQ0NCqZKNQH9HCzsJDmEMBLkxgjTB65NA1tEeWp50E?=
 =?us-ascii?Q?J+HFIYf5b0C+++uOkci+p6J5rwtLTRvi5Y4E5RX7rbsWCbKngZtVg/FZikxn?=
 =?us-ascii?Q?Wv4OSJf1/MU/vIElkB0OS/bjbvmiADTSL0gvtTW/awWgzO3q3Ue9gS9vFlYc?=
 =?us-ascii?Q?8QgxpZb+EBNZM5GO6UZH/bzVixEMZwaCerFhJZsiJ761P4/MbXDSbuNnLnEc?=
 =?us-ascii?Q?9XMTVfZrdjEyj8nlUOh9Qtz+hm8VhKs=3D?=
X-Exchange-RoutingPolicyChecked: JgbrQ0Hj7qdRtasAFk2yxtopg3vDFtOJjQhKe96PamsRE9po7vDfY3jaHrdc4jQJH1SNQObVsyLMddzIGro5ht7ZtA+IiKCixNFGwRdlSWqYWjwqilyZq8Pz5gBelOzAKdCLLC7sD9YyrWoAUUh7as6sowny+700WORaEI+xEFz3sRPoGK1uME/ARkyHVClCj/QPNbZ2DNv0kmu3Dae2lF4G9svrEcGb/XVI1ChmtnY+EH8SysLLbDfAbmkC+O91ud5Qq7ZHSnq1lUXWS8hgOZ6oo7mI0vu0DuczzOKO1RJOC/YbPktsdMIPuVxn2vr9s2cph83xika5vauhgFPHnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7f31d7-7717-4fc5-b875-08ded90f7868
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:20.3402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPpfhKxmTKcFM+ydo/qCDc/mQ945NrGMWryzOYLGmvF1PW4BxiuZiwKIobkg4P/XQtr/hncuMLsNAaMSor+eQCwSgYCJ6YvCd/2bVrNz+Ww=
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

intel_gpu_time only needs the register/MMIO helper subset, not the full
libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 0978f8f11..2e8ceea36 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -21,7 +21,6 @@ tools_progs = [
 	'intel_display_poller',
 	'intel_forcewaked',
 	'intel_framebuffer_dump',
-	'intel_gpu_time',
 	'intel_guc_logger',
 	'intel_hdcp',
 	'intel_infoframes',
@@ -100,6 +99,11 @@ executable('intel_lid', 'intel_lid.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_gpu_time', 'intel_gpu_time.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

