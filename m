Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF47C5B56A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 15:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279B310E17C;
	Wed, 12 Aug 2026 15:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYEylB/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C77610E17C
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 15:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786546896; x=1818082896;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=XvliavH7KMnDkz6t68MEECIcNeFslRVf7clCBlTLtI8=;
 b=eYEylB/dDAdLO8FsTEPd3w4ij+iKyuEvbpKzXeoTIAck6uSJodoF8gH1
 N5oGoHGxwOngczzAjlObmjucMafBCO+qIdr1KhWs6xjyGWP7YwzfI7W0B
 weMaJKZkHAg+Q0RwR94DIz1k0WXGzkIZV/C19tgiet55Yd7D0H48oNUSJ
 GlBGp7M5QPd006syqJsUE1KemjJCYduXKbHEcwc9Qz29yhDdIdQcYDzon
 M8C8WXm1EQwldEDAQkHzCfOQRAR4ReaFFM9II1YfSLQB2KTa4YialeX2h
 mCZWk4D+Cf4H/pzVKL0jrGdP0Ne64/McKEHWtSV58fC1w9eV36JlAD9BG g==;
X-CSE-ConnectionGUID: adbn25/wTrG2VqfA1deuNA==
X-CSE-MsgGUID: SSdpTRkKTQG+Er2zpxeriw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86223641"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86223641"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 08:01:35 -0700
X-CSE-ConnectionGUID: nfIn3s10S8SfVFmH20+OFg==
X-CSE-MsgGUID: 4lk3PxkPQA+cqs5nobuQag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="259837240"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 08:01:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 08:01:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 08:01:34 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 08:01:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUBXgNkGORBcDo0+bdYHty9lCnWwVtlmO07iQllBxthtqdUvftnLhtyyc9I0GRlmRHT9ptczIhI3zzTWClNiGfCG+HMIRIwolsMwo4UHNSwbKE5rWkCUGj5jiB0o2+x9gIZOZeT5RVtAHSdx0TPXLulQqoTAYPSS/2E+b3GrCh4HvsSvRgqvoBye/hMqtc5ZaUtikxgKKJdKYcNPFcw1AB4+PF7koSq/h6jQivE+AdwzX41qAxnUAq0Smnfr0UZsAIMbfHEX1uOwJgFbEPavw4rPR3E6VwDuC4A6soGfZbXsS7LtCxXJWx4h7ucgEASSamf84D6Ox1cW5dnD+16b7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5k9MGSu6F9zQLuZJfUajymZA/UUk4l3YlWHPA4qq3E=;
 b=gidl9eFi15ZUnFBO7w/Y5BLOlXX94heFxtX4I0eCkubeyo6d3cmCskwu264IrGYxA5zkQiZAqdw0c0tsMUafV0MPxXZZdlq8V2ed0gP6RqxuAjtQwoeKkv8YzYzOsESMa8uAvmLb29kM9WZ5yAjw7233p22N7T/o36EOW1sHEZLQqXz7c3oTXPI6BGgEIUf6Mw0vkFZTImQxP+grKhiB/VVMLAg53Oi4a/EkOtegvNw4Y1NDloQ59BJGb91s4HWbEFRxzbUYxJ2dAJOzaTmVjIdJjHWfAZpK1uVRkfhPZeR+T43FnGYgSTGzwpUjbEOWhaQDv8wT67IkPRY5Wbb3VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by IA1PR11MB8785.namprd11.prod.outlook.com (2603:10b6:208:599::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 15:01:31 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 15:01:31 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Lukasz Laguna
 <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH v2] intel-ci: Block sriov tests on i915
Date: Wed, 12 Aug 2026 15:01:22 +0000
Message-ID: <20260812150122.1380284-1-krzysztof.karas@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR04CA0057.eurprd04.prod.outlook.com
 (2603:10a6:802:2::28) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|IA1PR11MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e496b5a-a5d8-43f8-d420-08def88297bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: x3HhvMkwd8bAqP+D7PyRXIleYTQN6H4mm1ArrSbYuPahX6fdNOHW+WDFCid3PBlPKirVuHzNYlKLmQgfK21nDYnQd4XTRaP0ED6nXD+nx61P8TgKdLWE2yW/fx5s3U5adC9iTUpGavkpLFLt6DV/gG0yx99bl2ta5HEeCwc4Bg6aQyGss+n9TqyeUgQ0UBWt6SH9Di412g4r20JePc42oDtbv5dbZ3GVJKBoNV+z0ZPEOZ+rPBjh/2a0AGiHsYL7PFcP4CAXwN3RzaLv5QCbOohGbo5UPk92qTZYJHt4M0krHdcdMATt67mOqW+lhlqTRWHQD5My9NB7WcweSlA+DZU3a98rTR17PGigKf0IZLYcPZll08RAR+xuCydGeWZhrcymOeSgSXxRk4/asfUcSkMWj6ao5Vnjwg4VLe6KqiTPSPEuBgd32K9diV9+4qAjzULimH7Uai6KOIKxspKY/QNcnjd86nSijwCPyOZh9NCPvjfvzDRM22oxDeQ6PSOhw4hGr/oiLhyFVnjcHOVh6FvCeyBI/Bkru5eZRn90LLwPk4+GoER4FaVJOVt/Hela42rGjJrIvXwI6oaLZhVCf/tFxjRDaoWTYYOMXewXNALPpFFlPjWX3aD99xiQyc2UiuLiC0gw8E9mN0aUS3A0txRDDwoL8HPjrvYQ37YlQeQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CrpTcW5G9z8P5bxl+U7h/Avkfu5BaKk4T8BqGhR4trrD2qqNaK7O+D2li4OZ?=
 =?us-ascii?Q?cAoL0vzGgJ4IDewcWn/eyjHFZW67Qqqn5e3M6rHju/cqEawBVh0RAPTv/Wme?=
 =?us-ascii?Q?pTW86wm1IOl85COFw0BYIhkzwAqU01bFDydxs+YoeCnquCiZwPgI6fqnCxa5?=
 =?us-ascii?Q?EmBQkVmlXs39B/3dE5THnJ9kYfp+0BDnH84/xvHo8ktePDNOEWtx4SdN2eDn?=
 =?us-ascii?Q?XY11QxGtYiZBwUGMdp2tVlP6qc6Sc1TTuYGL4m8jod4auWSjTL1PpFVz+V/D?=
 =?us-ascii?Q?9MKmdVgAeWIfBpE9dD1fS59wkZGEB1BB71mLS3Gu9O3D0QMLekj9RlGcLJL1?=
 =?us-ascii?Q?apFDYgZkVQdwTVcju2bHvjJoLi3tvktst4ZGJIxgZmYDqF9w8FwRaNMdYMxn?=
 =?us-ascii?Q?fcCpmS767gxxJb5xDd/XpFTH/wjHNprmDjwyFKFdkvPgXrRAKAoAouVszTJW?=
 =?us-ascii?Q?32+43vOULmZvkffAf5N+r6t8HxzJ4cUsXDynP6nng0ip9QDST6nRLIYS6877?=
 =?us-ascii?Q?zxmNIsTUt+bYWwpMFtBDMA3RWBlejcFG0WCxjDuoJfIajww84th5Ww3i+Fz5?=
 =?us-ascii?Q?kCEiVWT3qgaX3groXGmhTJw3MfWVTNxQu9yk5oS/AJOMrCOL9ISWWBW0yK80?=
 =?us-ascii?Q?F/ScioaPsRNT5DHUn8kfbDMD8EEvGDyYcodXvI6Cu23q9GbHvZ6xCuIE38Q8?=
 =?us-ascii?Q?PK/cQfjdWJeBOLw9mZJHElpeLA6XsL2fVjoSkNf3NjjcJ6yNAB3ZCRLdJAJc?=
 =?us-ascii?Q?bJ8rbOfNZAXU9gfhihciyR0E9srAXRAK+zYkbyf6HaF/TkPEGlo4NkYDxMvG?=
 =?us-ascii?Q?KeBhiIqCrZxq6bkCWo0ehF8C966mp151TsxlJnmaX0yOML7lVkNNIU2mtNkY?=
 =?us-ascii?Q?CKGWaZ0f7a8uk0jlRlxM4RJWYDc1tuvVHAS+LO6N3armU/0hGo7ZZxeWZ2R6?=
 =?us-ascii?Q?iF2wrtS9vej9/Qd3NYehp0d/ZgEaQalWNDXZes6yXF4cRvaLRxbCz1RBU3Vq?=
 =?us-ascii?Q?xOpCDAP8G+c2xhGOfEIwuXB5xaqFfPl7Cn0uVYP+wvFg/CFzjhFgsGg4EwuB?=
 =?us-ascii?Q?iJ0iK2PdzZmCTOb0wfWX5D90EOSWe9hgQwvQ35ulPRb1LucRFNetDbV1xoCm?=
 =?us-ascii?Q?ULruNe9f/RvG6Xekpfb3mQPo3/t3Ac5Dhl6L+P4oezo+zKyNvcEPEUn7BtaT?=
 =?us-ascii?Q?MUVzNaErVYbL3c2euPa0pSyMWsjRNI3u0KcPMpZhpebL3ILpq3KNcNFSCumK?=
 =?us-ascii?Q?MepwUWSXWOhk6SwL0EFlyR5TSL2qYch736BqOp9aMFZc2XIhsMMKjrOb9wL3?=
 =?us-ascii?Q?++cNhBgv5ApvoXUAuMnnHaXd/gBmWlpaEIl0DHfUtMdLsJneEJWmGKWB2AR7?=
 =?us-ascii?Q?auO6myfg5YUOQCiu44nZFzx/HXxlrrpoMFj7k3ZKBoaPs71G0PsSi/1dSLGp?=
 =?us-ascii?Q?L63J5Rjq0iVb3y719QQhSgTnbBx93pbI4suDL+MLO7MGkQq1wlnmdLCYxxiY?=
 =?us-ascii?Q?IRpRw0wqUyr6y60zKATdjcAjFk59uMtUobWZ0i8+vd1RfEQJMAEjLxideu6N?=
 =?us-ascii?Q?JzNKci1yjYGWUGLYAkezdwsgB8VWwv2viJbU+ZR5DU1Q4uYSUJXfRN+AUet6?=
 =?us-ascii?Q?RBAd8HY6szRL+lv8453RnGWN4YWyBFHYxt042duPeSe5lKRfKLMKlzX/056C?=
 =?us-ascii?Q?I1xdKPso98JaohjVqHTYOjzsTLeCZ/5EB+pKI4ntW6+7Y3e329tIU0/oHmQb?=
 =?us-ascii?Q?ZzeyWjagv50TStlie/A7UfRf6eHnnRo=3D?=
X-Exchange-RoutingPolicyChecked: qj2TyByiFd+Jm0o/FMxw4eogmTt55tNTeX7mtxN1Q6flpaz0sqiR5vJeZmLP0xzrl8uPSGbQ3qVIdo45/meiVub9x07mGuR7RJvowZsUuK9TEYfWXgu/5PjY8nIfrB4stapdiCNbzTHWIsm9MRm2I1zbDnrOrNCxs9k6+fPmJmIbv3RHSeJZjYC5VYKd+Sia6vno+k3et3fKHVCj7/6cubJBaiOauIOr4D3yKVaimXxjJb2yw4e//ypqsTVIyEhs4wwmvkGKPwMcVYN3iOsy4X0pvbAL2AS9UbGxOalRNkcXuOfB9SBKmLqpk+ufLxyuP3oVzSCuEBLva00CH32xmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e496b5a-a5d8-43f8-d420-08def88297bb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:01:31.1850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6NCcPWgQKmmiTRktehoJZAz/KVzPWvYUW0YTlQzEoUEVa/k9kxQpCrulxgiZN+Fo7N8PPvKO/9u8U8pu2eTVvHex3F4sl5gQyMxjR1ijGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8785
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
v2 (Kamil):
 * shorten the patch title,
 * shorten the reason for SKIP,
 * and capture all sriov tests in regex.

 tests/intel-ci/i915.blocklist.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index da467ae49..a6077dee2 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -221,3 +221,6 @@ igt@kms_vrr@lobf-dc3co
 ##################################################################
 igt@kms_setmode@basic-no-cpu-idle
 ##################################################################
+# SRIOV is not supported by i915
+##################################################################
+igt@.*sriov.*
-- 
2.34.1

