Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C559C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DE410F026;
	Wed, 15 Jul 2026 12:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJI9Gw0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938F210F026
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117723; x=1815653723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Wd61OuJPJzHtpwj+Um4+dTftvHOtIQ9HAsU5pRYi7IY=;
 b=TJI9Gw0czzl1ChFKscmVpmMZ0OKfRGCesRRqixa7zYOBNogj/aZNDII2
 59TPyrCmqlc0qdsiDLRb0HzMDNfB7apMDtkImebBbrTonr+w6joYk5reN
 +rpGxNVGSlqqeG2wwmr3SeD9WpyqrJadfu2LnimYsDn3aO4Cs434vfqO6
 N3PYcQD5UZMhKMAywqoAdkGta6pv50GzTBpeu0VqE6yK6z7bSxthXMc6W
 ci4gpKfZGKKC5PJFZkXogBT8G5kfzA6v6gXmT/s6E5YH2DYn8i06nLhk5
 4b9dsBM92loYSUXCJxPa33pH7QVvnOgSOyWdcU/uOqrWRE2G69O+ufCeC A==;
X-CSE-ConnectionGUID: dxB+nHnbSZKee92b1jUChQ==
X-CSE-MsgGUID: fjcRs6BZR52jSTutoEwtag==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83872618"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="83872618"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:22 -0700
X-CSE-ConnectionGUID: 6vrQ2WyXRc+Wbz8hLofdvw==
X-CSE-MsgGUID: BxXHgwnITmmaOL8LmOZR/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255046073"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:21 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pm+Qtdl3Sg4TZLeB+y2ah5Jr+WNGRoxHkt1bSoKn0Jp4wCujMi+D+cDoucjgyJNJiytqx57RwqNir9KzQfZpsM6rTuVwsk8QKcIgwz4qAGusSYShwbJZrPYXC99ZWuxTHSMVtw9nl/ygK6bA6z1+dbOA6nhgGjtZ2xIhi8mVvEL5SrbAjBANVhyYV6W84is+uq82A8U/BFspg6fa3RUxFhZ0TZrexZIrJaBN7gupg3MepEo1TEIyQgLgV+t4zlqfaUDFgbfZ4bPCh8PNLlQU0vpD6oFCId7hnDB5NpOhySGcuTSwfVdh8G7WV9ROcCDmHcPgnVvd47jsbNgNyU8KZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JEzNPp4OyfRW03tj4aL1PU/9tzXiRpp8eIlovkeYH8=;
 b=fS54zC1V8Oe+XH0DChNg6RaOSf9xwkKiRH383ekBCRDXPfYXZ0G8LFvQlhjD+aLwiaTwBf1BEYxGVYsBg2mBuJSkdO1kvCwRNMik7CfqzDbqkZ9pSpn9c8I2i/BC0S+5/NSD3fcKx8E2wd3jd9J6p71X9MU0szf+Yl8GhpNPKmuYSuf9mwHIhVw1a+0CG+Jf5uMVUNsbyYymKVFt9B2MP+EbdoNUUkLRj9CBpVP2prLAJBb4Hln94+TLP8nSnq01y63RPrDNGkhR9MHM9PR7MffADFBujyrjR+Vcp2zab6NwX0TENuj7D7smpHDhM1RplAkKg/RirVx/ieoydInuTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:13 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:13 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 09/31] lib/igt_halffloat: introduce static
 sub-library for tools
Date: Wed, 15 Jul 2026 14:15:19 +0200
Message-ID: <616163c9262da8da429f8d59ad570058d809f7f3.1784117512.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784117512.git.sebastian.brzezinka@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: f4cdf050-767d-45ea-a645-08dee26ab8e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: l3OZIzYMccz6ML1rhGdhhXFjSgeid1tR7q0WvPAPZMc8IV1ypE0zExl95qvKpOLkK74kqbkSb/g4wp2VUgGKDktH0N8VTYJ72kp75rQDql3+l3qbJGfrNIcc62WtG2Mz4YvDR5haEMeUYF+7iUzp9pqqXJiavMIWqbziHu8Sj8tFxYbxTKC+FypITi+1Osq/wylMnKdFDHvHVKUIo1mMiPJG30y6cTkyZvHVX5ivqtlealhfbXSRsdJCOPlnnNBHS+Xa1Q9IRxpJgv4iG0TTn8f/WZnRsy+kfXFpaWJrhhG29MEPRwB/7XgAROH4DhtE7G5W7s5apBUuQXcnH1WITG2p89PyAmJ7CZ97jrqwGtJzDzfS4R4cKT4YLnyjMUejQcZLogMwINuxLMgItzUQY1AGB9A6jlDoen2HiGPB3Qbdpl39Y8wjLl8GfatlcfZOsge92oB9HnHEADJEHn00+SqAkXghw99fKB0pG5qOUmKj6HhqnCBxXCVfyrHtfZXQE+HQCl+UIGK5dfMHJGpcC83vOc03EB5xXjTw84bWFMh5HaTo6BOgdqClizLNj0xmkWorwnudB5BzCaTIZXX+wOjVjT/w7vFvonPXeZHM+qAnCpNvreM18yy+eRFDuZeBxhIFvVzFpudBhYLx0EjGn796DGo8IPRHJdYqLDDg/zY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rdBYXcR3TQo8ZlFwN64LKRt/+6qfV2imsFvPAim6RGCO0jKOGULf9rMPtU+f?=
 =?us-ascii?Q?GNEEYc+YzfaldqHqNzEOFoUbaq/M4xi6Bo13jv60G46E43PwNmveiMvb7uSp?=
 =?us-ascii?Q?UTTTzPSnQdaDwJHob5t4BuNY4aPRIPhPtv9QsPjgrgS/YRu3/FXNuUi3PtqV?=
 =?us-ascii?Q?Lcrr5spV6O1vov8IiwRZqORRYiHOGLA5HnjW0w1n7hixlOYVJ59E19oDY7lw?=
 =?us-ascii?Q?vgi5LJq1AokCAMcbwncle6IQluqwL85eZVJrLeP9j8vijoaVLP90GfvyhXTC?=
 =?us-ascii?Q?WMqBIsX6g7qFTcPlpRb9sb9th3OW3wuODoWVu5Jq+JpCG32IKIzvybnfOwlO?=
 =?us-ascii?Q?t2Sn2ERGp/OvVBLeoXSzRb3Xy5Vu42dDUVB22zB9W4NIC4YmJYKsVbPmrAQU?=
 =?us-ascii?Q?hE+0x9j87oOgL99DPBqWkBfEqj1dLgIF/wySXbCb3bKX8VA0mVVhPOEfzail?=
 =?us-ascii?Q?rNmR/F0gza1BoCgRNkTf9v4YgCNj2d6yNgva60XPvMz7uvS5KrWSk6uskyWz?=
 =?us-ascii?Q?aCn5itgOYVpOrsjIuezdFE2tqM0q6frsovLeO+n2nEjAGbpFEcaecrDukCb8?=
 =?us-ascii?Q?wMdEF1THC66xc5Bybvom2HCbQKeWdwG7Gi42w41ZTtVInX9C7zyNs6luuYRq?=
 =?us-ascii?Q?+4lO0hO1xJNlQ87+xti7Uu4yfXFSdKDvFZA5B6eEpaYDRVkPOj5b4lXMVzx8?=
 =?us-ascii?Q?HoupmpjV4hUhuk5hidwM+94a6jXY8hhzOWNr75v8XOBbuw4g3vobO4xb5tby?=
 =?us-ascii?Q?uOG87SQeV8FDcCZqOH/EsruhlZbjNoLYJUi9S3yDKG20+/NmoUtQGrpROmcY?=
 =?us-ascii?Q?I7nkcyzrAfCJfCr9ygikk7sLihISILfMItx4a3AHoAmRsy5GjZ/4CWwzPM4w?=
 =?us-ascii?Q?PwSXl7YEJYQ5BMRhXfHnIbLhCvculPnqDfpKeEktsdyvkC0Yq+jFAoGh2JzV?=
 =?us-ascii?Q?jdOxdHaKeFN0LzWIcrLbhX7IvGiut066ooRL3iQ69eaCAn1a+E5EaOCupfW9?=
 =?us-ascii?Q?064wuDUvLMt6R2fIr51Cbz7GQwzyeo/X7CEsrQ3j6MtSUaBIQ8gfndwTWlDR?=
 =?us-ascii?Q?oX0dYpyDcwWV8lgUViD0x6Q7dB9yPd1V54LfxtURBnlQgVmAXeWauJ8sAcjS?=
 =?us-ascii?Q?8e62HRIBwMDIFbYPsEitRDmjLoNMkXhz5T8M8bHOICEsi+KdXJYRZHkSshqm?=
 =?us-ascii?Q?h5qSzU1RAYPmR01xnnZ4RUCnI2kdI8gJdZIwpR1lqbgSim8Rf7njn1W26FIY?=
 =?us-ascii?Q?bJhN7pqqNoE1nuRU7wfDsz5ZCQFBXH77XKBOuxIuutfCpEZznTft6I8/7WWm?=
 =?us-ascii?Q?VreDQlxOn1spa8F65MWp89wuW02bibvfHu7PFERQkK9tssYX6NEhS/lv7Hs0?=
 =?us-ascii?Q?HghAWqgMgn28mpm2+KxvXzt+6cqyeO/RNfwoiNB+AsxnMuALrDMNa9Zev0ar?=
 =?us-ascii?Q?jpzAOs5WBuh5HNRR/s3uci57S4PKCYP/bgxAGE9kbbm77fNJQ6CWHXErtFR0?=
 =?us-ascii?Q?wY9qg2ybCZ6aZLOFmLttqi6Rui9qf6KO7x/qL1CWvlA7IOsEPRQBY60rxNR8?=
 =?us-ascii?Q?ydqZBlBXL9R/dVUpwwrRPvRNnXBQ1nm7cLr/XkzvCr1/+3r1icV8M5iS3k15?=
 =?us-ascii?Q?0uKwNlCbtPBzZEHC0MBdyKcp3X0q1ETLBvj1Fg2VGY+LtAWsguhGkywPXq8U?=
 =?us-ascii?Q?TUta7WXn8vgbJ8wtxA9I3NAvhMHw9NRn6qS4FeAVs6UBK8iBJ6FdGHeb+jID?=
 =?us-ascii?Q?RRhl+FLk0q0iyuvBPM9tqT1p61UwoN4=3D?=
X-Exchange-RoutingPolicyChecked: NwssthrRocGUb1hOsGTqfzV/HP0xUmzOKUJ/IocdzNqysGWSG9r+xtMDGXEKPmoH7k0u+ZxSlwlMjf5sDCYbPVuQZpdlo/qUhK5E1k2hHmOpN9Q1Li71GEWF5/gCkoLxgXdkF9ng4q8VXMADh1ml9KKLk1qUHlda4tjm6r8bIh70GZPdcjewXfWBSxjK1RZ5EDLc7bJQqX2bufWs+92YsTU3S3O4UiSFvwZRhZoabrVTgNGDrmgm+hC/J1F1KLonFyTMVNQA4kSE6vp7QgHKgG0l0TXw0huAEMTOANjhyzo+Qm2yRGRgJALPsnwzQUREg2iACkMwIrL/SQsVWbXS6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cdf050-767d-45ea-a645-08dee26ab8e2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:13.2866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JjQOCFyUqKbyuknZbbiExSk8mdmgbbZPZOnZjwnjVd93U6K+rUFLccVFFVy4s9LxHMki8xgfHmO5CWF9KcYFinhOm0GYXYjVMXgx+URU+5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
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

