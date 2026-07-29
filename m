Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FC4C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557D010E631;
	Wed, 29 Jul 2026 11:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FxphYoGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B64D10E53B
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322989; x=1816858989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=a+6X7zK3DoSgaw6Y9ebXO8cPXzPPUs6UJ4XCfGv0uAU=;
 b=FxphYoGkUpCYuORll6dyErNqkkRVx8Zd2ejsWKIxwDVoAm2bRmeNML5J
 ZiQNUf5lP8Y8WP7EQNbhGqIfES73ePiB5waMVZ3gTYhxL+jkBQKRzbJTS
 dgUj4DOYuW2OVRlap44j354vx291Px7pMRZ/V0F1LSwrswsCp/qQJoi/O
 G28h9XfVfV//yREXByM1rZMfnvyloBzHWjBkUwNNCU1Jifgsf0VdUhvFZ
 Ny/mDYNHk5+31eBupQSX8F2assrua0GNRu9v9hqxMY/dkDC6PAXhkg8HH
 /6rPw3eP4q9aXtiJE+zoFVxD/PGlSxfIbiIJRKqvdbqQ9hAH4KB+l++HQ A==;
X-CSE-ConnectionGUID: BeBYgvgVT7OgR8XLC63WtQ==
X-CSE-MsgGUID: rQNtLGvaRtmQD/FNxGLCuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85797564"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85797564"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:09 -0700
X-CSE-ConnectionGUID: r4jDrffqTcWVDhyGsrj5mA==
X-CSE-MsgGUID: CU9W6NEHRfuSnAqoiXZW8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="264264062"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:08 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tr9R/kMdSqMeB1Oe2LTWHz1WmfcSpM6KqcVqpJgM7jDM/9dLgjEegwI2oYfLV3775mAKR9AJfN5S4clpXLod4l7HJnVlXNdNCMDJGg4/E948oLkE+NvXaV0zDJfEkrq2nfc4H2wT/v0mKiAAC8pSCPCnsjSsUBGdV79jgHA08dM66t38re1toNKHNk6OY85jjhM1rw47iGfZuIFPahSE3WQogr/rZAD/Q3cKBMCbDzd9jSV1s6IPVEoa7gN751JQmBjSRlBBOy01bughNPAdYN1UIB696V0Ujv1fzcnCD3GXU6zXveexFSAbdrotUfmUPxufgeu7p9FVKl6ziOw6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIEaIutVfzSFsYPhugpqjpf2C2aOdSEim4O5VjtTH2A=;
 b=k+GGAWyjhGKzND5WDZ32Jm0kAdkpVIA//Hrj8zOIkXtbrAyXDYOf+mlMHGWRlt9d8TJBK5ykYxG4MHhg2tB3hsPHLiLUAnAKc0pohovF0KtxNUDtnmJJSZ9jVELelnv4BmBHpBtCq5ww2IADouN01qhKBBnk6/9TpsKhj62OzGjL+uCE89JaS6L11byp/tnvX9AelxHhXc+yILKx0avkU+6v6gv+y3WIGZJ1uL0vVaXD7AK+tbxZSxvibEUd1J+IGFiLFCQ3RHb8eadaYQeyIJjzyTAAJangDhzSzhUOxlyqK1DB9xrDym/pCDlEf3YA5YMh8a2SWKUJz7DLA1i+wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:04 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:04 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 09/31] lib/igt_halffloat: introduce static
 sub-library for tools
Date: Wed, 29 Jul 2026 13:03:26 +0200
Message-ID: <36990156eade834bb5dcb041ab3c219e690dbb4b.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS7PR11MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 6feeb825-be01-4b96-ec62-08deed60f64c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EoHhgQenYOPQ7xwdnnmbBsJzcXas22ghGTd0i4JOLQpL5N/MRzyhrWEyxQSNFUZXeQg1NdPGwX8zSlvtKDJz4n9jzcg72vy4a8okgGlsbT7Liks/+6LuMpeHHZx96BIi0azR/aGvR2CRUfcpPK8PZpUp/ztkFMkEaCb4ExlE8jKWRNT0aQrvDoVCfByHWE9w9qFuHnWSki6NL+/A92s8Gat2mIYnjnYUZv9SWxXgVDlZ3Cft+C5eIi3U/1IcKhiwFtcGvzPbq96hpiZhxwEnrt5zQ0NKArdCiHiuGIN2YEUDPR8u/VEbFwE3Fg5I3y1NCbb86FMqdLufnifCGjMzvnWGvIJokyWZ6lXLNcQLR5CxgzXuWM5GMkozzwJ2T0xb9xvD+S/sdAuC6CsPLdFH7otO95m6gmWSgPXz4DLDoSvAg52koNUE200h6gfedaf8/i4ugr/u4aA88tPJk9WVN2eb47MFIwnJsON9PeDQnlZ4tsmM1wY1KWMhoUpF/2Ss8VFZeSsYysp8P84+Xpyd/0H3qKzbmOVuom3FyfqSi9VnIGDd13IxZ8NaN9EtEGz2e/v3uwM4huNPmLdHV3Hb9JSbz4jK8s/mkf96sBmejsA8xDtggWBS4gGlONmmEJzNhHG3L0AgBnfFuPszQxQflzAJTxYoDVMyiEk9JqprbZY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?icvW3mVg30Us3Fyz5zcAf+GuGb/nxCPJW+4p/Aw4t7Q28/qTCOOHuA0/eJm/?=
 =?us-ascii?Q?iP4U3XF1Js275qyRQYjjmiCtww7BpP7LcGOl2CaPgzrf7QsxV8Y3qkI+5i56?=
 =?us-ascii?Q?KPg6Cnzp+SjHcBQL5BldsbxN19qwNR0MA4RlwFA/7rTCoauRN5dKQe5O0BgX?=
 =?us-ascii?Q?Xc2uPEQge6l6loxlzteYbVlNY+yJUycECUzuvp0ksgm28cVhz9kFpazFv5Hm?=
 =?us-ascii?Q?UH0eUyg7P4oY0V9Ko/agaKYobAhn0GHhhMrWA7jsBuut3XT9CdkqfFD76usU?=
 =?us-ascii?Q?kjY5x4W4CsAc8buJaaN48vLHhnDJhaC5vPTMwSwS1XK+UWHLrMjl16RfwTPa?=
 =?us-ascii?Q?nz4MRqOXr5unwrguEKiflVisvvVVA6E/7/90vvIAqZPzPBLFnetM3GOI82o9?=
 =?us-ascii?Q?Dl4uWPI09P8geTdi+BXJvHzUhYJ6ZpjirK+hIcJn8NJt8FOpDtDMtrI353bn?=
 =?us-ascii?Q?TSmaPsW62By+Ngsg1fqufd+smAyGZX1RXBvyGfr1Xp0wAv/ic50QYQoQPAFE?=
 =?us-ascii?Q?vPaXOnHq4tALZs432c3Y8/dauiMgsv/k6qI0dX8uutVYyhvnhpGdobsmzd1L?=
 =?us-ascii?Q?C+DSRnQYGRFHhAGpXoFy9dAvWaXzR+fwoNykSgoI5ODgGLeaQ3QXs3tYlHrE?=
 =?us-ascii?Q?ntt1KtYddgnVexNQxJI1ZV/nh579FHrkZj6MyWQXczO/kWQkAR5GnyIBuJ9L?=
 =?us-ascii?Q?UJLY7MfAT5sUGfI+o+/gH3rxh+NHGprDkwribrbbVI/e2i7veHjtVU87kyCI?=
 =?us-ascii?Q?ark/UN8x07c6b+/slESVl5y2y25lan9sXD38bJv13ir8Y0cBYwpZQ2d53tRn?=
 =?us-ascii?Q?rrt8xE2S5drB/yWA06bGGO85HcYfvJCa08hCJd1NyltWkXCxM2fUvUbSFyud?=
 =?us-ascii?Q?4fdy3489FqW8OWsEbcB0tX5jWg8j+kE6/VTvz/MGydYpadAj49RXmM+/1qCW?=
 =?us-ascii?Q?RdbK8qrFt7DGQFTvYepsysCe8srw7Qu+t/l32UFi3ckumOoeE7fQsks8KZvF?=
 =?us-ascii?Q?B92d+TEXdlof/mLz1TxD4xHPSm5zne26/xm1u6kZpGnePQ74a3Yc9Qt4c4uR?=
 =?us-ascii?Q?4gSovwTuc5pFJZvtoa0/T5Pjcvc38HUpYkYFFoz94PW+xp6bmo94Kbn4y4IU?=
 =?us-ascii?Q?wc7wTOpoOebUHVBtrczaWnAv20sPgQvXk6A/HA8HPS47ypgt8lLXwHZP0wnj?=
 =?us-ascii?Q?Nqf01VdVSr2N+niBkONroQY5pdyyS/w4suzRR0BRYvnKzlW+eO35mLOFjBEt?=
 =?us-ascii?Q?p2qKG0pOb1O9FAODvErexnqBY7r7N223zQBt5OvnxiewlzaRwbmk5Kcc082i?=
 =?us-ascii?Q?Zyb8Fd11K9vieFhKbOGg/N06APzf+WuEA2JlW8bdjo8B0Px3DyRkGbkakqdf?=
 =?us-ascii?Q?XKj7HB9lKJCVzE48HHx/LTa60cmaJc7raq8FC0aw1SoI7gKDwliHguIX1+sp?=
 =?us-ascii?Q?PF6m3EEtZIRhZB2U4xmdNbGig2bM206FlvqWNkaMek79zBVK37kVH3SCzan/?=
 =?us-ascii?Q?4vlQqn8O8ImcbqEGpFTVfMLBi7DiZd+5Ubx9nXV9RPBS2LLmCXnF9FFPR+xk?=
 =?us-ascii?Q?ncG93fIZHaur+dwHwP9h0MSp3DJZEP9yHrfy3iTibya8NuxMJKKcGh57goMs?=
 =?us-ascii?Q?0tIMuip7uxKkDgu/V3T/7iQSOzE03Nkw+cgvhgA/N56ZCG7PG0j3yoP9a4X/?=
 =?us-ascii?Q?/KsQqnbrmCZL4D7nt2Dw8lzuy5rFyX2QhAIG7xJg0mECAocv2xcRASIttEc9?=
 =?us-ascii?Q?KgQk70yLt+zla49luXG+jBHve1S2IqM=3D?=
X-Exchange-RoutingPolicyChecked: RBUDcOuB52hZh+YZQ4MpJAteD1Wae+hy1ahvZrp4fkbj2HDl0a9KomAj5DGsyRFPtZSQ3nKsQJjfvEU6a8ySKuTsT1gQLfErD9mybPYIN58Vhu+I8RY+rowsUioWMmeYdGg+bQfq8bG0ghRqwwFX3per4e24niD7V1GASRxjMZNJdl/QLmufeIK+o9u5kU2wJLCXFeooRXtdPIk5yOFqMJie5n3ynfa4qnkxNegknDbHHJCoKkvJiehanVr8QRIidOq5FLTBsTdlAmFOxc83bWIB+KD+nxyqCsHWJMPemApEfIlJzqZYfLAabUOw5h7nyOi8Axd9GmyWbmDi4HllIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6feeb825-be01-4b96-ec62-08deed60f64c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:04.0677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYawWXQfp1R+bRUL79zC3KeKG/LI9I8Wh2scPpBoqtQVDynNlvkjUH0cbBFjPuGGlIxRPDfDi7RmRIWBoHdV8041xRBVvYYRzuevjXxWL4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
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

Add lib_igt_halffloat backed by igt_halffloat.c with a math dependency.
Tools that use half-float conversion (e.g. intel_vbt_decode) can link
this minimal library instead of the full libigt.so.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/meson.build | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 2c1fbcd43..93db217f8 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -415,6 +415,14 @@ lib_igt_stats_build = static_library('igt_stats_tools',
 lib_igt_stats = declare_dependency(link_with : lib_igt_stats_build,
 				   include_directories : inc)
 
+lib_igt_halffloat_build = static_library('igt_halffloat',
+	['igt_halffloat.c'],
+	include_directories : inc)
+
+lib_igt_halffloat = declare_dependency(link_with : lib_igt_halffloat_build,
+				       dependencies : [math],
+				       include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.53.0

