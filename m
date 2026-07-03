Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93334C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2AA10F82B;
	Fri,  3 Jul 2026 14:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CH+dUyra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751AD10F82B
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088965; x=1814624965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xS67yh4XjF8R5B4O59/IrwiKrzL6SAHkI8KuIax2a7Y=;
 b=CH+dUyralvTto0mbiUZKQRDnA/0FdwwdNLtkh810f7+3gekI257UFxIW
 yTqXr4pCYSt+Ufq/tfVTSjF5V50h6QyBrOEkO88COKCYkdkBZl8ZBfXT3
 Myt6/zczQmpkS2KRU4X4ayhWCWGfrmSqeNR5qwx5U+g9TxL822mKlDS3M
 nx4VUFmYZNrgLJpmvt2hHX+pAhEuzk45XAo7dFWOKnUpxk0NwhWsk9LRj
 FzOs7Jeid6AX4LtzQJ+PWO9NzmRksVXourJAvGlexisjK1jAVbb/+1JyU
 sUS4PKvIgp/r4k4DqzcfDZsrhwZEQAT6CNtqjfSSLz1QO3CRctF4W6SHp A==;
X-CSE-ConnectionGUID: rz4LyB+BQNiwAOwv015+xA==
X-CSE-MsgGUID: yUT915duRuKSiNlgJbT6rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87756539"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87756539"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:25 -0700
X-CSE-ConnectionGUID: Nz86bY3qQ4uLf1BneQGXvw==
X-CSE-MsgGUID: vZSc9up2ROG9hRS+tSNTOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="276341128"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:24 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUo0MzpjNppZoQZuHBtL7tN+EPHfnRWSNa8n6A8t+btezZ9iPTQI/hwvLG+b74a0z7n1Mw+TUtPEoqTJVXVfIyYU3tyjeG7ZuknnV8mYLKQbnSyOmZkeegyPJcvqmc/CPiv+q9xQ+Ov5h71DCioOryUA/363lN81wuKnuREUeynVA6kGFEp24hxOEqoDNu9b6vvfOjmALy+zSzTql3HxxKGK03FjgZo8A1mxPGyhYZx09R5GhX0txqMwvydIEUjV0R8ShY9U5BCV7fx6jojukMMcC0Q8kx2J7Ql5zcq85X33MPEh8Hk6fU0WktH/4OosYoZiP+TAvRsnIrdAEZPi+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKD5Z8zomLdk4ek6w2CMLds65VZ7EHpV2IsK52hhl8Y=;
 b=u0YerkLpT3k0RhZQqfgl6d5z+mp0y84s5NzRcon1YC44btXEYhKeDNBLph0SEZqXkGPNHPOr7UlQc/v55LKz5sZB0/ntZVABlfIqnefX9bf8caJ5DO9Yn9Z0YGgtMjqnvgngZf39SHDgp4btN3Iqd+o5NV6lLr9yDdKYm6Auyk4GFKvcUk+tQzm+GDLQnjjg5PdH+USDnpeo1JX8CnCoOY7Y0Z8FQcjLBjLEla5MkJVMSPsqLYkw/F1yI5wH0bmtSpnhU4OAs6/UhDP6A/I+kCEDrIFxh+nL3bkhGSnOWrviiKnNdgT+oINFAl7QgjpbmeTsf9g4656iH7/8U+505g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:22 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:22 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 22/31] tools/intel_audio_dump: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:56 +0200
Message-ID: <0166057cbfe44847596cff9928fd652c08255626.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: c692d7b0-6896-4a71-8af3-08ded90f79a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: LtcKjnKps/csTucPcesxF/aFa9uIm+lzdTtx6wQ+WaMBLrUKndKz6/4xsEGqZtragv/26QaEGT2SjYY4KxA5WvvFb7myRfvV+rjF0UJheNMwM8j1h+2OZpEa6kQcg0rDL5Lecmla4SzqzR59Mgp1IfXFEqyhLZRpsJLucDZgfpwfsPyKyJt2dTeCtDAyZL4yJvcWfcgQR2EVgQAtIh4Li/3G1ebS+aBT8idwE7tMtfLfP03s+mEPOVDo7qi0ogfyj57BKXhxLx/FvWSHelqh3QPxm/c0Pdr+J3BBZmBYlQlLyv0UrIPIBCQsnngaoj7w93ZNxvfxbXWpb6uhx/Gie2sCsPfHTTSvYJIqLYiFsy7GSEYifwoMwhxa7OAcm+MgDoygOKl1dzp94ohaVjZYK44JpwWxviDAR4PnwhR7mqa2jzqivS8mp8SBP9x/u3X8NJLzAIlTAq8rA1ceWuoI31QI2IzVSjah5rOgKfXTQ5nPcbkwFsf+RgBWzOWG/z0zKwrIn/5FqSRJez+/yPi8FM0f5iwne6cEQ5fhn90lWERE9xKm8vebgiVcrr8AOw9WuiXhlEgsBOzh8kF15QeYouFiQjxw2KAbkNm36fIy2wWjzd46kzU3T61mK+aAn/6LLxQ8LxqN8gYMOUNn0cizgkYUCRZqYkIjx8yfx6Zw5co=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3d59A/V1d3VH/1OqHbyLlivqLyUnone7pCt7a+E7wZKKvgNz6e5rou5Kxtxj?=
 =?us-ascii?Q?aXKCxacb9ecm00xEOh0VpPN9XU3CeeGxVdNIdxlGHsos/y1LXuvJ2gJYuUq7?=
 =?us-ascii?Q?iXe1SvIcN8tFtiMvya++8OF+0T8mmhDzd1e7+Vk395aSdMQfsAf0jW5ECuBx?=
 =?us-ascii?Q?njQWntOBQQph8B3Ot/iu6AposwtN3wIZsTado6vfjz64q1uFZHBtS4mFyosr?=
 =?us-ascii?Q?R8a5BuhIrETLJr80oG+H7hJTSvmmBPz8ftKgRlw/1ow6ZEaTLj36+m2Wp9D/?=
 =?us-ascii?Q?F7bBjqDRGsdH59diWLZgYi2cRCmwDcAJV1sXJug13qFLSYfQa/1THi2OKAqL?=
 =?us-ascii?Q?PP2Ltjixq/3pyYpJ1SwkW4jbAGU4Px5a/1uK7fNf6HkywVWi7AlWkq5RnMQs?=
 =?us-ascii?Q?LXPQr6qKHXcmvIeLNyt7C/kdrRp3dQEE/SpNZdN0RY+2wVtzDi3bqLuUW7GM?=
 =?us-ascii?Q?ay56zbOoViHfD7y37OjYbc1JBYyb+jp6N+Ra7XRlzka22TfGOeKprrPB79Nc?=
 =?us-ascii?Q?0OVcap7D2LeZPYAGdK4oS7QdQRW5HFrr/HlS5XahAzpp/9OoUJ7ZGxf9KCxJ?=
 =?us-ascii?Q?TQx9vj2RjRJJ2JoYu2Y5F3qv27hB4oDRMy9sXoJ2tEz02zxRevSKBbkT6adL?=
 =?us-ascii?Q?MYIALVibWn71T7ipOEYwlAWanxkHtJbcAXVAPkB5NCItZ8tZ9S1qCuuLNVMY?=
 =?us-ascii?Q?Oos/Oan5n7MdlkFGq/79QhV7gUFNHfeIvVocVzkQRJtniqHL5JR8EJM9N961?=
 =?us-ascii?Q?wbbCKOJz9/KtRufhHzPBnGDELVZvUTS3ByEURqLhgmGf9qAYWrX3EaK9odgo?=
 =?us-ascii?Q?TKvCKvvooZSk6YdQAnnWMmCCu9es0FyQdEbgdhM2OtPDBdgKmhtrm5UiYPAp?=
 =?us-ascii?Q?p1ye+2llPNkyaqw/vxnQFQ+t3u4axv95Y4pv5OKQ78isE/0PkVxZmyFUrOYs?=
 =?us-ascii?Q?tjZ15Zsf6cKv12gNqAvQgqq0rxyYloccXZa2TBcerE+wZ4B9xK4B3lSioPYR?=
 =?us-ascii?Q?V7IdeWsEma5OZy+JqTTU5vKIOh8S5RUb28WR6Xy+H0OYrvpYZHHNKn+RHH+/?=
 =?us-ascii?Q?7B5ORDXN3hFIANG812ybwGoRr0JFlk+7LWnPpMiNVrUJHw9CArk1sFdq2+21?=
 =?us-ascii?Q?03lCmVNgplU5MsrWw54fAj4uBcBUT0Lw8s148znQ8ixB+hWgCQfbr4ZNcNq/?=
 =?us-ascii?Q?yBXtUP84ERebxwjnT0XOWP3wMszfgLzefX0Oo3RgkrKitF6mFo0S4BxEKj25?=
 =?us-ascii?Q?hTloRnckcBsH+M+xlEVMPxstITbxJTo7N0m7hCt6FARftaRb1Olpk38FTjV/?=
 =?us-ascii?Q?/DAwLhrwvq7agkiiAozn38aQUOp6cI4BKCClS/xju+IsHRUoNgOmyI/oHRcN?=
 =?us-ascii?Q?Wyxa4mGfV456OT29QfPlI2CKiyRw8GpEVYtSTzBBac2uyIcLEOtToDekgzUu?=
 =?us-ascii?Q?lpCu+TqTOIfl/NjhzamqYdCiIwbstZEo9UMDGEvlo24YwkCz/kuEm58DATjE?=
 =?us-ascii?Q?TpGn2mdDQeTZBTdn+ch9+W8BFPssVZrKyXdaxhXo4DPi02x8OibAjJ/DuiR4?=
 =?us-ascii?Q?yxaI0MW3nA3AuKY8HCG6qOQG59/da6MNgDduMWgEPOqmwZzRsNrsMs39700w?=
 =?us-ascii?Q?mZAZu1MqghhMTQqtJPSIfVp+3yT108JJjoycQKok+aHi7mdoQcSiwlwFs4G6?=
 =?us-ascii?Q?fjXHMl+h/eu3eOOi4vKJYf36iUKH9JHKgOoa3pOFsmc4halDUJW6uGeH1GvP?=
 =?us-ascii?Q?nckZoEKVbTkFj4HyGSiZ8z7EFLHdBpI=3D?=
X-Exchange-RoutingPolicyChecked: MkgHxWotbKTVqQ9XGbNiLW8xNOzcDNpAn+Rv7e71WuUBbZyflQV5yHGHGKxAN/ly8biZbB7JbjOQnrZnEBBeGM0gBxgpTjCizu995J18c5FAOKtYvUBTKfanhekb+9/qTZw+QuhRReKqYoujjHo2U+baIeCn7eD9penFgweZM0HvpcLNvo/2xIvoUhudoenHy6eauQhpGA3VhiYrPmvWk62AKWEQ9qmzWzF8yOmp0JWhkzITKzam9TjbyIrRPwWfHtKHt4I0mv3w/tuUhIcGhRBA0H/jTMXRFhgp5kJVz7+s6RiiiHOjbzpBl2AmqoGEkXoHaKnYzd5tMnslY9Uceg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c692d7b0-6896-4a71-8af3-08ded90f79a5
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:22.4630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ww6F353WUHTPsM3jpgi64bgNJiBJ8cj+NMVoFPa5c4TUjA9IP1lZQhQRbQRSE1BNjfS19vTwl+k2BeFVTOpJu4B1j+SRLbT5vB7nF48jfe8=
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

intel_audio_dump only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 2e8ceea36..f9bbb41a9 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -14,7 +14,6 @@ endforeach
 tools_progs = [
 	'igt_facts',
 	'igt_power',
-	'intel_audio_dump',
 	'intel_bios_dumper',
 	'intel_display_bandwidth',
 	'intel_display_crc',
@@ -104,6 +103,11 @@ executable('intel_gpu_time', 'intel_gpu_time.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_audio_dump', 'intel_audio_dump.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

