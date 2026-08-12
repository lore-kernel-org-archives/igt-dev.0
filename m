Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E2CC5AD5A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 09:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B4B10EE92;
	Wed, 12 Aug 2026 09:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPynMXej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48FB10EF31
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 09:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786527928; x=1818063928;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=pGiTkqISSERlr0zemfgXvpujZtqt4lV4noXavavWMWg=;
 b=bPynMXej1AGn0RdC7Tutmb4qC9IStUueMPx5q1Vr2Mks4V4yXOPkkkJB
 LbOq7S1yVLGAYIyAw4cl4i4RM5/AnWaDVsi19F+pGixi1nN/+GQi7vnOD
 xao4K3kr4eNxOsd/1URJKEf+uzH3JqGn8wWVNzTDFVtbVkw0vYobSTaQ2
 y+dQldHc7Ax5TK2m1joYZwDaKoIfUnuZkRPTcCU3dzYsQQ4MIaX1VtV6b
 BNql0Sbp+3819UV7+NOq6/Tx0tIitm9w7TdLSE4wJVINnWiuGvQd6RC52
 BbQPPUN9A5so5cxdObJbFZLZbT1j+fiG/0tmxbJDAeKcBqLAHnU02xWkg g==;
X-CSE-ConnectionGUID: xORol0RVRn2bYB/bSXUWIw==
X-CSE-MsgGUID: 582gMt3sQ9OkiyKp6XmEUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86194859"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86194859"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:45:27 -0700
X-CSE-ConnectionGUID: oWeS47KZT7GS+2xxtfvYUA==
X-CSE-MsgGUID: ioU/WwdjT0m/RhvKhjI/Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="261842690"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:45:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 02:45:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 02:45:26 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 02:45:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSdx1kE9x5RyFCnUvcigY5dDODn2bYJOU4Vg47p0IbGZa4TmJ+HvMMMSRlYdXYPz13IuUm+xbfWg6I/xQeTNxRvicI3w/ag4qQAkevVRmhPsrtfx5qh3+OIiEvNtJ7GjhRsGOwoo332n7QfVod9xKq0Igmy92sqj9e1ZZwAaLSpruvIb7IuaCGTigZo42Oc83maN2QwL+jY39LyDSHenH1Lw8FRL789TGe6q41Zbttg9+bwPBHBWYQFq47eL3Rp9ldDaImETJhPFua2QciWlhDLlIvpcm2TM8ulvhJ3KKSdZVBaSAh+R6jDCuy1+yr0/7jKJqZO3bOgzaPQckvPurw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPo5IPw3HL4rcna4+CGOIsqVGvZYOASgJHQL9MipwGE=;
 b=dnqVZZeAA6RoiikADvvhRjadE/vEL9e7kR+naBi46Cl9yznJHN2bWD+iUCbzPrC/xmlzSAuMyC/rMW/4GaG7+wH4YUnMQAPsioyf1wPgv5T7TvXMyUdvO7AUBROwk2FuG6SSnrVWIHP8GKbKkSpB0cE6bEQGbWID+lY+rtZHF6c9cAzOhkat6/6805SnyOoLjI2dcDbKeNEnvVCVvU6fH9iguE/TSCAE53f0jSM2weGLTL3zY9UCvz9lQdAIHM3vH4sdB2ehZHgt8aP51iSQc9C51SGM0PK3czSXCmKQQasMCVsUmQxE1019RkoWc2vZk+mUOeJb9LyfjWWrhjtUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH0PR11MB7471.namprd11.prod.outlook.com (2603:10b6:510:28a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 09:45:23 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 09:45:23 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Lukasz Laguna
 <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH] intel-ci/i915/blocklist: Add sriov tests to blocklist
Date: Wed, 12 Aug 2026 09:45:14 +0000
Message-ID: <20260812094514.1362168-1-krzysztof.karas@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU7P250CA0012.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::25) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH0PR11MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: a4872fd9-d089-474f-e7a9-08def8566e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: QXpG65nWnDZigbUBcubv4hKl1dF5fQwmcZl2JVII8EnQWi4TXYVD5H83xxX4aEtQqbdRFsqLOwb4jb2Wr3QjtrE8BjSteG1qBn3FPz1OGKIqLn+O9zRdrskZVx7Q6RK1sxLMMoqmmJTOyt7GUvEJOB33bIHzuOw4wOOhuX0sN0yiayHku2FCcp/d8v5Ck1TTnKaVPrd1T8aWfdJznUijpYwNMqlQiK4TnWXWfSvuf1MF8GI0BRWymSjtZpzP9pbAzFQA02sYB5NSvhxKwGN+dsWZfoDUsfFe+/zidAVgB1KrywEWrEL4ZIN2awMXAk4iUm7YwBcZgci0WppzmFnsqRnbvK/Ska9L9FBRslXW2Ci65ffplQq1SkPyG8niiQyB1iT2cQ/MGtcZ70HVmUCH4TlI5Kc4vtwLUp1qS7CII/azu76cIw2rf6FOGZuKQ5DTkvmr1LOrI4oQBnPtw+NWZL3f6hzXMs6fn1dYRFa5cajF0bG/Vl4RrVLWURrgQSh/sQ6dj8s1672RXRo5saNgOU6Nxi6qMhu4s6SgsL1CnTg/7EPGJzMHGb8juHrnwdqFR+ka2nAyry4XpZyXCKIiVJCSHnXMSVn2cgLqjIqv2sDOl06cfOQYYv0opV/bcYNXYU/hs79Ob5Th795A20J8G05wRWgj+5iQVMueDO5wPVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cIMAX+w3PHzxsqHhqrSngCNLvjyha7LThjOZJH1OKMg79HOUSZKGphaR908r?=
 =?us-ascii?Q?2VSh8QjD4XTgxsiluYMCfatohSWmDkQh3t+vVMNoGf6Eq83OH9ipQhKeW7dq?=
 =?us-ascii?Q?p8Ae/VI/nzIxvZOJ2XZr9N4Ksbv/flgjPLSpx10L2WSSisOnjvI95Ch4fz+m?=
 =?us-ascii?Q?ERZQk5ZRffsLZO+UE55nCBfl1hF0KHA4OAnKBvee1X+mptb9i6axdSFUtXBq?=
 =?us-ascii?Q?42wD0QJ6UA5cPBdgUxbV6nN1u1+84Vprnp4x0kJyUdWelptOP/altGCK3O6W?=
 =?us-ascii?Q?942CbjHSLkW0uvWoQ5osShgF8x1M0O/bez5qbY4iu9Axh4lqX1vk8xT5qYnw?=
 =?us-ascii?Q?h61I1J9bR1k9Vq+x0uoVUH91yeaicNsCuMZyTntyKog9eHgIwgAdRqCzx1ON?=
 =?us-ascii?Q?O5OddEZBD+A0kjGInEQjLVvYY0nIjjGwBkgpOIfipmIXYpn6yJfQfQqq9+In?=
 =?us-ascii?Q?H7JJtMl9ogH8tRAgIXt920ml9Fbx75drnE3ZfsW5k9I2X5R38FnUnDRPzjsf?=
 =?us-ascii?Q?FK8LqOvLj+pZwuZUFBa8vaSUO6ty0qelEvGiRaN7dWwl3mGFCyTjGyey7EWc?=
 =?us-ascii?Q?vHjH3Rump6nscXYa/U7VKoV1g/GzYUkZnCR5sKL6WPQX5B3oJk1dKHOsPWCK?=
 =?us-ascii?Q?NAUU5C/EZutDffxBLUUP7G4N06cWUzn3Uo7u71oU4uJmz+x82xOakrQdMg9Y?=
 =?us-ascii?Q?8tfkvJu6mbWJmvxeL/p0rLOCpPNuTLQ+tizN9+X0VsnAA2AmXcAlDlRHtAPS?=
 =?us-ascii?Q?fZ+0xn3tJGk/qXo9gvUNaHnmD6cwcOhlKOeeZOWFUDGHqF4T2bMD5ECu/ZE/?=
 =?us-ascii?Q?kHSsAEcUQocQ8ta3jocNyJLK/avOkASFn5J4vCRSxl31j6i8zFbD5xZdTWky?=
 =?us-ascii?Q?ZnZiMqx+Ix4jxzILBSQAHuw8IhEpsBG3XLNqHouS897yajV2glXqoii9JJOd?=
 =?us-ascii?Q?XBYp+fkKkuvZk1YrGxcMUzE2/AN8oL3PbcgptAtt61+aWSyOr7WOQh/9aY/e?=
 =?us-ascii?Q?xtB4CGzCM4CzzO2RlRRNjFOcNGQunMlUnK+FTRdAN1uSSgWoaNXw/FF72DGE?=
 =?us-ascii?Q?nhCIJu02fFZNvzz2nhG0rUlXg1Y9/FQ1hJt9LtU65Ge3fS25so0GamO0W6Cn?=
 =?us-ascii?Q?vk9nZCnnxAxRwCvA84P2yfMgw/j2egLTDxOdb6sMQfk7BrVhxiVJ0Ub/xr0y?=
 =?us-ascii?Q?SMTkm4yeYPkMRd9n2AaDmfu3dBkl8FcBu4bjIg7orC4NciRzYPgesi3TpYoY?=
 =?us-ascii?Q?d+2fusHCtzqfndtqUwGf6KumCrWSxaDs1b8RCj7LOqvtiXEVf5bJvZ9N1U8v?=
 =?us-ascii?Q?Kv0xuX2KUKYBqdsSvGb9Ty4s1YZlW3tkJ5Gc0Ya/QvbSaZBifHM5Fj8yYIKJ?=
 =?us-ascii?Q?FuArXGomKhyu+0OkCyyqLAB87MsegWY611GbSzRagNB0sBYJOWFJh+iRQuI/?=
 =?us-ascii?Q?9yM+X3YXPz2jPNeuUcWLodh6MijiuDFp51d/j5G2aRSdw541mSNWT7BuDIpg?=
 =?us-ascii?Q?79rtGeyxMVCk+DnAWrja281Xx9ylIxe0CQdHh5bF/sPDz2cOHgMEGcbWvbzJ?=
 =?us-ascii?Q?FFu0yq8I5qrTzDY8gmNSfdiRg1btxV6DZWxi8kQiOqUaf0YCwsiaCyQ6y6l7?=
 =?us-ascii?Q?KxnMotckOjWiobxUMPlr/+uZpGrXT++qKwf/nInuVquIlF7CZFsZ+Z08uVF0?=
 =?us-ascii?Q?/Qo1ukosHPbrKpcSIuDs3CU+cWiXhrNpFDjOVGWXE2cxt53LO1bu1O/fOya8?=
 =?us-ascii?Q?vJXwi/LyijS2p5bnUdx6JXEH0RPeMS8=3D?=
X-Exchange-RoutingPolicyChecked: aN3lN+l/LGr38htuVBRFFKSE91wU5qtLPRSh9YKNLL2z/vKsB2UTcbMl32DARPyxtIVPU02jOwUI7gnRQfodeIZD0TDla6LyxYMlkppgqzN0WoPJV1uJKYMNtz/3o3YeXHjIL2EX7acJrczErOnWX92PjsQGx0+2YJM88XhuwgUozEB60CPz8aaNsKT1CfmGyQVKBz9JB+Lk518qGKUsG/jVPgOA5o4Z3chYkAW27lmpdte09zDE/xQda/4gF1iMSZWW1cMBxGY49Q7CBEogC5TR/jJiFUJtOeNiTuHtMPj92D13HzFcVIxf7/1bpshDQrtj/tLNSubZZjcKKgukNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4872fd9-d089-474f-e7a9-08def8566e29
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 09:45:23.4792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TiD1wXiwAvJWN6+VFhyKol1+wwV63cn9aOwu4AzC5xhXUmgTb7ubHueFY58jH0mt7gN3rdVHZBXyxBBiaY67CDtd1UxN5kg1S5Vqa5MtYeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7471
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

With addition of commit c9a41149d843
("tests/sriov_basic: Validate PF unbind with VFs enabled")
a set of sriov tests was enabled on i915 machines what,
expectedly, produces multitude of SKIPs in our CI [1].

Amend the problem by disabling all sriov testing on i915.

[1] https://gfx-ci.igk.intel.com/cibuglog-ng/issue/24557?table=&page=3&page_size=100#query_key=dc51d83bc41c2b44b58762c6cd35195d043d85ce

Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tests/intel-ci/i915.blocklist.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index da467ae49..9f7aef0a5 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -221,3 +221,6 @@ igt@kms_vrr@lobf-dc3co
 ##################################################################
 igt@kms_setmode@basic-no-cpu-idle
 ##################################################################
+# Valid skip :- SRIOV is not supported by i915
+##################################################################
+igt@sriov_basic.*
-- 
2.34.1

