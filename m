Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67D7C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E2310E793;
	Wed, 29 Jul 2026 11:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ocma4u3k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF7F10E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323036; x=1816859036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nAlfz1sQlBlQLk795NMAUYrl0WtpxbpNz1WA9oEcMoI=;
 b=Ocma4u3kMDzmP9U0yud7AEuE61vTEMqBqpSi/GgX3E/s6BZW6eELJCOy
 zaWX+ars1S5bRnvyf1dCMNmk0BNGDe3xhYtNpBGrqzDf5Xi2xZERtmZWq
 80vrfTQaOjhTnksmjBFKM/vq6Lz8pUtmJ01ZN8dia/9QysqNOHhLDNE8q
 6Ahl5m1Ykxap89O4S3OqCTWLz9tMUccsWicGHJxlRxTqNr9paorrF5Xt3
 9eyWDyDtvVD54bohIOG7ZyYQVPm3fjAw+oCsmNfvw3quROOY9Ctcc1NZt
 ZNkLmV5qZxXyfLLHpX0ed0lta6P5VpBoN/3MJHlN+JuD2j468w3ctqcOX Q==;
X-CSE-ConnectionGUID: iqazTK+XR7WKvBpW1wYPKg==
X-CSE-MsgGUID: /M8b4/EARD+wSkR+qY1Ojw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85797640"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85797640"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:55 -0700
X-CSE-ConnectionGUID: hlD84AGbSLGTeRL9I0tFqw==
X-CSE-MsgGUID: z0pODevvQVeV+pbvziQMZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="264264188"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:33 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.15)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWAxM6OSWIbQfgmYGWb3PtOkVs/ptebpEmdoAxBAzZvPf0hiSPKUVzLOur1SciVPxYTDhqH848mk2Le3mK+8VRGpb0nLnrZQ+xOQ0O6xFwcef3n9BU6pJZS2kw10BqQEHttiOrdSOguy46itgkfcw8WclFaP7/wTKzxqM76qSM3iVfN9wVVHU3tah2RvSxmngXZTK25R0fd3cXQAtyUAr7MJzxzMcJn8w87bgb88s099IjncirX6W7hAo84cqijty0GpUqVOe0CPxoeukVXaVSq4x4Drgz9Ubncd7l1Yt6keIlpuLvgt/HZ7E1O9htffXTuuF1qOd6DRH+JbI+pbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vuyaw9Y8yQLHmIK/gC0BS+E6B+6ehLvvf1WtCN+Uo0w=;
 b=RlpUITnf0VBLi2StJfhCk4M6wo4XrPcIFs2e8fnyNvTIZx+N0qBwl0uTyF9i/0/n+kn4ebmyH0lkv1y3cec5V3BiIGb2ZgOZ/nsO1ld5U+rCMEVML3Ff6OdAIlCIi+6jlsmjuYD2mxzgKK6j4lWPcGP1/9QTwYQ3g9OgYl+HoNtuH8a5lW612mF8pP3mTlMtUxjr1l7YRnQCO5x4awzn4B7d8XCMyPtNPdYhKYo6VnGVKf+InBKyQHRZWrTKKh00OnLJmCyQ37o8JxziSEIHRWZXKi+obno9WdqJrI4EP8ts0RtYAHNwYiM9tMb+bvxhjzFkLijCsUxsNoJz3M5xXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:26 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:25 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 19/31] tools/intel_backlight: link with
 minimal sub-libraries
Date: Wed, 29 Jul 2026 13:03:36 +0200
Message-ID: <851a497091615774ef9af4ea697000baa90b345a.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MN0PR11MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d99964-6752-4db4-8732-08deed610331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: SDtryHGbyx9qneXDNgoDgHpsNpYMcKPTMiAxtMhjzoik8zT035sLEwFS64YDbQKFRlco7jve2mJFWvmzdYkAv45vcna2Qk+Oh8atlhiGr2qc2Yv+68njlO/XHec4Rgc8qWg3wnCUwb8uT1pt2QKoHeD2W+XWkZL484MvV9o1w8B37TX1HfjGZBODGpMbkPPcGM/vLfLBezUS6jJwDZdxo+0DnppSuMGBLK/vVzR9kw1SGUbQxnXw+bj0GjlHuPjgNiBIMjVsc74hkIfIw+wQmNatw90EtFPxrTABO+zRAaxkg8a9eBJD1MWifvBbsuV1EAgf0pF/9zlygEnXmEvFvl45+mgTxYQGorMsnugjYIFAtzBcu4sVrpRi9PhGKOOYHRUD1Gxyo4pkMFv2VktYO4utB31mZM+QIiqMJaLcKplNVxqa9WBTVDid+hscwOrJpdurroyvyRyQCoYRCsK9eYgPUBmSN/x2grl4aM4E/fhBRnrCYgSyW7wGjuZMhrEiM0K8QuEJs+V/353tv7Ry8O/u/+1+EEQ5cRn91W0PoXZqLAWJiGJE05+R0fyFH7oTf+9N1q9+Vd8UoIBQnys+XIG9pU6ZtGcGdEIYBdLF8o9vm6vXCOmHuXSoJY/m/OuY3mSEPO1ZiNrUUf3+ffbcnhYDyHNmy8n8ROQ2fikwbjM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FXkwu3HlopmiJKbWLlDDKj3sfEN0rIhGVzvWHgNknfnWMWeUOoWjcGZuyR9k?=
 =?us-ascii?Q?h9A4EBf/5d1W91DsKDKk2O/WFTL5SIkoNVlV/sY4pp9A4Bz0lwIH0XEphqR+?=
 =?us-ascii?Q?hS+kL+hX9KDZtdjwkkmrnK46XZNZOGhYfmhhpjZNftgyNmH7d9zTTzfzcL9g?=
 =?us-ascii?Q?JGiMkiTIb+GRrHnc3ifOH1X8eGYsuiOL9ysOVh9Chtn5kEcVIj0vCUGknBaR?=
 =?us-ascii?Q?QBUOxYBLwl7NhDJLFmox5vIldFILhuZpWj9IUn6ZOSHh6AkUReMtxdcXUFjs?=
 =?us-ascii?Q?pLXg4SUh1M4gVRfuPd299LmXPEIBcODVClhSpoKC/Zy4yfTQ4dnzLjZv4I+z?=
 =?us-ascii?Q?8JeuNPv8NX94SwBPcMyQU0TCGqOYKxzlP8RmTGdkwMQ0X2M+nzYutRynDhOq?=
 =?us-ascii?Q?H0arTupD5839lmedPhwC2Ys0dQbX+YpShndKF//e8JIs39XjiIkvtYMvRmj9?=
 =?us-ascii?Q?CRtE+QNyCzNuApZymkrRWVlrAokr0xgmNn0hRyRTKfcbYnai7ORNgNzAYq4a?=
 =?us-ascii?Q?PQGRWMD7MHeua9MpoacFf1ZHuqH81ILmSBw6geHlB1PRrNUc6fZC+mYuwehO?=
 =?us-ascii?Q?EnCguyojqkup/OPVX4o85VeXehDryiUQKUIqODAB7OpGJHqN3/Oar82Ge1iv?=
 =?us-ascii?Q?hsXQhWJ+uCi5EmwT+E48ERP4mb+aWG1R87oo1af/zxkNC0ncpEgdr6nbDpAe?=
 =?us-ascii?Q?J2J9CgBtMCxevUgVzYMgKN8rAHn4ieuO3oTugSSnBASyTmfryB5C+bLFAeXQ?=
 =?us-ascii?Q?6sm/KM9hqQO71u8sp0NOko/plMp4kXG8dgaKOLX/3A5pmBymbLsecBTe2vNS?=
 =?us-ascii?Q?7ZEO5a1FFhBGf80YGoFXg+9E/nwINDDnJxHJDKf+1S0wxsjyZ29IdNvpat5k?=
 =?us-ascii?Q?LX8pshcYjr5eMN8S9mZEjUIW7dI9h1v9rUQFaUMyuw9hFaNwZQcO23wl0+Yw?=
 =?us-ascii?Q?+9pPZ59RLnR+ZSIy7NrHsBxWLwsZEUEyyCby+2+6OBltWaCnk1N1IjaxT4WM?=
 =?us-ascii?Q?JGiRkW8H6EOAmWWuBUoyCqKDcJ+kNxADWXv+kT6Ph5UuxoXAuEnniLyxbMgl?=
 =?us-ascii?Q?78DCA/R3MaogSY5GxSEl4eNEOPDumPnQAhDIGrLoauNAPeJUgpGhnQsZ+Kpd?=
 =?us-ascii?Q?/jHuJoeOVBOfmNYonlaqKnKKEixwfcwUuPrc225Ofr5Mq+rKG7gyyc2/9Fsk?=
 =?us-ascii?Q?84rRq89dyIjkXW1n8esmjAWWK+uTJ45bigZZZ1VYYvr0GgGk3ecWaNSbFFxn?=
 =?us-ascii?Q?U22p+tP3Pq5dRGuE8ywLEdTZrIKhqzHTJXMGNsJseKSRiIy2YYDCRIPAgJra?=
 =?us-ascii?Q?RbW+VXx/PuEv6v/Ba8IOdJkTwdPsqOj2LrCrNwijE2Yrpa/mhWv2uQywMEsz?=
 =?us-ascii?Q?E1o2Gr0QxNQR7OOksJ2h6eOPOW4K/uuUsoPJve4DoCmMNLhbSYvbxhM680gk?=
 =?us-ascii?Q?2+WDzG0Rd2WS19oGn16Sn5LjMS8WDJXbXlS6RVsU62NBlaeukPY/I8HQIbht?=
 =?us-ascii?Q?nJgItMuXNr5iumNbbuepTMrsO2i/ZnD0IOiA7FxseAS7+L9lmYQBkvPm0SnT?=
 =?us-ascii?Q?qaCvQKCnQzlPQgdpJ3q6mY6LYDef3mVFkkf9J1vgaHObLZuxt9sgvrJvHTo8?=
 =?us-ascii?Q?KfU9L2Rw9kzCmmNf0pGzYzaW3XdpDkWHnJIQT/hcuzM6oD1NolGL6IQQu6rT?=
 =?us-ascii?Q?fCWuUMcpdWk8ip3CAKNpml9eP8cKmu04EhOLx0jOioii1P2h97FSH4aYa6Lw?=
 =?us-ascii?Q?vpR2DLoHVOVDq7o0zswjuDBkGSoV6v8=3D?=
X-Exchange-RoutingPolicyChecked: jT4EoQv/a3B//hcFuhYmbcQK1+IfLzjn6bw3K7C6ielt5D0ijczdNMz9vtp9+zgqOL4WiMpyYEs/4R88BKOsSfikPhLbR9HKzO/m74KmnDiJh7y8DUheO+G+8u0rtg4ZNx7gaXGV2VDdqA0uN04cH+3dZS7LECqzZPrAv4vKE6RSvbmXBT+wsnbOAhbw0tAvUZSc4wsoisgOk9UOhcItgDJaOHZanKv5MaFX7wdZZDt3uplaCeDW6nItZSrzamvofkAhPohKbgDCLTbnFndE6i9z1yjkzmgEpZbltM8+5slvNea2e6MzYK9AH5QIPb0qNWhsn6lZMx95+/T56Xsx4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d99964-6752-4db4-8732-08deed610331
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:25.8917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDCYOe3QCY6elS1lGr6HIHWEHD2Xhe0mR2lgrVFr9L0d2unk8m8gEz7xFv/Ut1POhGy6EuLDH7Y3l2RQJtHmvYjrVQWG/D/TQF0xJaYXxZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
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

intel_backlight only needs MMIO/register access helpers and the chipset
metadata they use. The full libigt.so stack is unnecessary.

Add lib_igt_reg_tools and link intel_backlight against it instead of
libigt.so.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 46cf1a717..8899a5b49 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -15,7 +15,6 @@ tools_progs = [
 	'igt_facts',
 	'igt_power',
 	'intel_audio_dump',
-	'intel_backlight',
 	'intel_bios_dumper',
 	'intel_display_bandwidth',
 	'intel_display_crc',
@@ -92,6 +91,11 @@ executable('intel_vbt_decode', 'intel_vbt_decode.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_backlight', 'intel_backlight.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

