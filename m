Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158D5C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA8E10F820;
	Fri,  3 Jul 2026 14:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOHc7L9X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6644A10E2E7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088928; x=1814624928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0AUKq3U34PLeeM6OAU194fAjlhaohWcmlX30ht5Eef8=;
 b=VOHc7L9XaUanauvBpr6q16HVhJHyS+shHBQa/pHmWBnEoYedPMIFtECY
 islS9Ze9nGHf+q8o0U1bQ495+6VTHYpwkGg77uvT5BeM9rI5EpC/tcL9J
 9eYAfUiyZb2q6J0ihNzHYDgJFq0bMJkASz0leXVPsXJ8o6bJjgNV0as5G
 CUGolVCuI7f5a3sJwf9ov5hZtd1yG6G7stLiR1XxrVgejH6gCWfSrSsed
 VKhhWrEGvQByW7w6wClhhLi8sU5i2lDhq+Lgrd4TWRYXjk7Q78T+bQwbu
 LYj58LXRucF6TvAz8d0yzSUGHy+S/pvkaFCPGFlazq3H4+ASSd/xC1hfL w==;
X-CSE-ConnectionGUID: ICP5oLFMQESeAIU/2ynfwQ==
X-CSE-MsgGUID: wTPfhWVHS/u5cpClSdkGoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87523732"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87523732"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:48 -0700
X-CSE-ConnectionGUID: Heu4YktMTHq9boKVU5nh0Q==
X-CSE-MsgGUID: kEzI+A0SQDusCDrZg2CVTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="250476087"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:28:47 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjfw1nseic+liOHohKn9dcGUcv+pSGcbOYWu8STeaJ26f9cRi2PQw4RF/kYo8EP23AEPOONKfSgHM2r3a8jtdhD6gP3Vnk5RRxp1zKYr5j3mqhqN/SCWOyX9NwYKLHs4QjspppOEHte1nw/kNVGAhqzT9Vv0KMdbbSFFdY9phAcX4xxCmgwwSMButjdJOFCnasfKkpgwK9L87ieGYtlzURq3dMwkER+ILdBw4EWt3yVT2R9IJf1dwDQeWEEPTOCDBMX3L3xIGen8EoMMjsOYzJwgfpKzRZfJ/hR/7fUSjUjPylmMtYuuHZ7qXHyZ/ePwzDauhIdjboVD4QsN0M7lRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyiBgfSRT7k8Voh+8YUhkM/opAK7O+vfxQaXxqk3uJ4=;
 b=dGVoPaZ20jqdRh7NbuqUp6kfoY8DNyk3IOkPq+2bB2SNf2t6wiW+DGXL0EcTzvg6wbfezKXH1kUIGUiZrktuelCWMOiY4G3mDD4okAY7r44lhvbzHtclV+ADNyXKsZZJUezUWce+f+3kjtPXg/oO2kJPlUWVfpT9pANQ/pqTm44tU5rahv5tsniOk+kxTmnVIJhxEAVtJ4CzMvK4RG50O8ma3cecBqZF0H4074QmJNn8Jf5y5CPc39o2mSfxWbOMbAVqPSRXeU00hF7ZFD41PBEAkMvqYly1u8FACqSWSiRqX7OcLDEferK873sgFbloKaMe+3lbAeEKLx7lQNeHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 14:28:40 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:28:40 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 02/31] lib/igt_stats: introduce static sub-library
 for tools
Date: Fri, 3 Jul 2026 16:28:36 +0200
Message-ID: <2ce757adfdda0c87f5f3dbf9471a3fd78a7efeb5.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 22736fe1-840e-447c-d0a2-08ded90f60bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: L/e7fbtcgjFzaF7yzhnzR6gGkgh5RqNEQoEaoRUdGtvYXMpN8PgjRTi6q1NC3AOyEQStlip0G1FSOyU3nJSR8rww+WHIlqe2T+K5cFGyvi5FKHat5eP7Uy7/AFkjCv9RudQuqsISfnYFiXrQmi4z+i+W8WahJoRdDBsk6Gc7u5po1ouJIqQbO+0Alee4Om24jx0Rcg2c/r2IpcCsSZskToQ/OIELF3qI5W6ApXow1ZCtzLIgr4IMo/VRCyrJI47u9PoIB6stj3ABRoOf8WNO0+udBePNCKGGxdOqz55I1/khm4QkCdVX6UAZrYASKlTAqSjMoSvCPdIZehIKqrxTssQy4mDlFNfG8B0V1lFdvlDZWGOauF/z+5i81SamCpQH8D8d2KT7C+DB1zukoAlZrMu3d/uTmikGlZQVqy8anT+qmpDEmk2HViQBSkZ//0Wp3t3Xo+R6wEXM2Wx2+YGfTDAKCzDRtBslDbulCJawmNplLMyNnOOUYoZ+LRpc+SHYj3rYYfq9ZR/tie76rN3JwhhHgzCWhIsQKYOKP75xZw4eOcBB4tTejTHEIfBsOQTyRxKqtz3xMOLmOwVFfCuain1mC5i8S+ALf1NEP4RkTsfVaq7hO9ETH/xh8LzimpJdAnVT8rt5rR8f2ZdBgpz0zNLwPeQ4kvPsl+NcNJfykOE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UolVlac+tznUxuvnLWPDsQZi8YdT3x8H5XixvVuGZJMtfXGY0uhHyk/KHN+w?=
 =?us-ascii?Q?7AXAuTJN8PVIYUX2zxtHc5Jh+1QbxrGLh+Ig7lCIs/ChkWwHWdrZA9y4yxHL?=
 =?us-ascii?Q?Owet7HloUt5DXR1bHXxh/vqqpNz5bz8/vWmmY16a5LZMqi0HBVF45vQMDxIK?=
 =?us-ascii?Q?Me/+2ypKIZDTX5W15UJSpTS7HoBXLYP2+h5ewJ7DKhn20G6YwFA6v9kLkCjK?=
 =?us-ascii?Q?guiNlZ6AZAAS1QxWErRFIa3ESPG2DcIg/dRA8H9ff4b/vTClaYyRFjyFCHzp?=
 =?us-ascii?Q?4XfWlBU9+cybxq7Bnf5lXC2wiBkxcs/TNDiD6ZzWm/FErRE26ZRz6myh5FDQ?=
 =?us-ascii?Q?V8vsQaBCK1H8TdWbw2tYL415L85VdH+GboZkrYIrZYleglZPHhj43H1BlAYW?=
 =?us-ascii?Q?JtaBUzmyhsPCS7HLIZ8v6d8RSHkwb+TA7HqfsPXKzSbppugMKh0YXA08HZm2?=
 =?us-ascii?Q?ReKtdinrLwJ/5to9PqfP8O/O+Jmy9gnNKTP4WDtbI91Zi1auNj22vKlEsL6g?=
 =?us-ascii?Q?5jFywMEn2SHBOtIBsd2gw9EDPb76Pvt6dHqCcUTv+QVIsXN5ZRzuNIwobfhG?=
 =?us-ascii?Q?YrC9xG3s/z56Rjrvy3nYVPhxPAG4gV2KzHF/c76IVKuX/B6Pms4tKeMr3jd2?=
 =?us-ascii?Q?TWdI0CyoJb9h9Qi+Ed/32rj/rjh6Ez7E89vclJwJmOvLiDkSZ9qRdIPaE5Ry?=
 =?us-ascii?Q?Nsnr1pCHqnAbbSs+8qvvwtEADcPBjfwcgNdLxdabkFX4JkK2VNUwsdUfubme?=
 =?us-ascii?Q?uxRM39sAaIUamXvA/uiDGMkyjKjVoOGdPG+7zd9tjAyk+k2UKb8nR110ccbD?=
 =?us-ascii?Q?A4twOJC4lzVgDRDouLWXhZ2yV8io1oNKWmmj1jlKbr5PkfsjB/PccHHokqU+?=
 =?us-ascii?Q?q3tp1gbnXjXpAik673a4dg5zcmyEyD+Sia5xVoo6Sct0sgVU6SidgJWBAIdl?=
 =?us-ascii?Q?mbCjNmmWWmz8NSWBCOas7ToydkRcskNfqRx3OvRX7R4qgaIv9iOOimpMNV9w?=
 =?us-ascii?Q?3eAvoXTyVnX46vLbLhZblgEXyxz5FzZ+jtx7R1bhEIeXPpedVM7KJCNHfoHE?=
 =?us-ascii?Q?WdNuUfVqwhewdpjs7HlyHsYxBF5qEzuLqh/qbwtmTZu3mi0VmnS5bGNUQOPl?=
 =?us-ascii?Q?q9nLyptCPEPvHUGsPw3yWA6ewCqa+ufK2owx3ExE9VykZ3PiXhFjXLuNzvyM?=
 =?us-ascii?Q?ubFO5SojB5gKAaWW5xdJ6yTdcVs5JRbudQ2Rvn7RdTHQa7ChAnCTfAPdya/s?=
 =?us-ascii?Q?5Kaan02561wxDPKXi7TWEJfnLD74gml7C4SGGZueL6IThwPIAka8Jnh1oghe?=
 =?us-ascii?Q?WyKdKwDCO08kouOwaRQRB5U5DpGjIebQ6a9s0GvLgjgisuScem2dVgX/q9xR?=
 =?us-ascii?Q?NEdc1Bpn6hevyiXEjs07ELZHHoIvpa95JTTP21hy5Gj06SHOkXOrW+3XgmoO?=
 =?us-ascii?Q?9xRUnueO1iw54jDd2Yxi4gskBZlbdcrhF/NA1kzjhmjtMWqq0WX1+G+2MBIz?=
 =?us-ascii?Q?mJada0gHhDGhD0Ds6IQxj1aGsNR3jOmUJowurZEQWwk88FZCBvafkTzOfy2b?=
 =?us-ascii?Q?k6wwrS7iTsRG2dSUvIGkNRPF51ZqRvZ/9lXVoknCCputAvVmKKcQruDOOt7T?=
 =?us-ascii?Q?CHiPtstZwEN1lEqObMX7BmV7zyoSv71py7iVlwlFk//xl25O8PdumdC27n4q?=
 =?us-ascii?Q?5dxvwsJKNwWf351UVZ6kS3XuZ918SA8D9yPr83sWNHWtrTI9l5a53lBfIwZs?=
 =?us-ascii?Q?jonsf4G2fIY/CVyjCuClgANBft763XE=3D?=
X-Exchange-RoutingPolicyChecked: D6EA1iKzu+ZPNVQpucNPio7W3j5fdEhUcwT23YKZL41h/N86MK0tnMVa1La35Sq0l9nDca5zHDnMvxxxNyj0ccNF1eR/jjDsxGWzOQ9QpJUlPp0nv0pne4K5bH71S2MMWVNuRzYuGFvGWBi/tUFKwQeEaffWIvwaN6g1SDnQGotf/EsLhomhtbbRvbqW2iDAQLeO1PJiVPtG1CZzQXPkE8x1Uv3I3utuN1leAP1gvLitvHZBIIdlxmdAUIVFWsM8Gxs/ui7D0SwZGyqYHQ5lgj04RvT7ZgUtF6OLN2CIfHEl/HduzFdnwiEgoCG05SZRM/mffVtCU0tUg3oRN8LreA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 22736fe1-840e-447c-d0a2-08ded90f60bc
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:28:40.6485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ofa5GZ4TGX1iFx4Ow6MmNaojA+jf0DgT7ojiw72KREw09u0bkoSiGEW9WHkPpc/6/Yb8ozhttrvKdLpG+C4YaiyLDpOCRJVhwQKSoxNSmvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

Add lib_igt_stats built from igt_stats.c. Tools that need the
statistics helpers can link this without pulling in the full
libigt.so stack.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/meson.build | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index e95b29d49..a57c1eb8d 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -397,6 +397,13 @@ lib_igt_profiling_build = static_library('igt_profiling',
 lib_igt_profiling = declare_dependency(link_with : lib_igt_profiling_build,
 				        include_directories : inc)
 
+lib_igt_stats_build = static_library('igt_stats_tools',
+	['igt_stats.c'],
+	include_directories : inc)
+
+lib_igt_stats = declare_dependency(link_with : lib_igt_stats_build,
+				   include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.53.0

