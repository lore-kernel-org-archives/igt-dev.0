Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBFBC54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:14:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFDF10E631;
	Wed, 29 Jul 2026 11:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1vReGeW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED50210E677
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322988; x=1816858988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PQzSDokOIpblClOvVb+VNs848BKcnVCCCLJ1b8l6zHo=;
 b=b1vReGeWNY/i8KHCGKrC/7EfzRysSBHVKVgP/MxFw3tTdeoMhwm0X7ZD
 rKg1UUY1JalxquUkvOZDH1+1hKB1wvj8fjgMjuVAOOEoqpPfypmN6HyV2
 e9A1ei3tKPp7nIEmSCBLL9VhKOvw/TMP5VCbIrA9/vQoSomErfswPx3no
 IJOEDP3mOAb4G7upRKsGygAK+JlF5671A3zPg0Lm/+MhQz//s2/T2wqsw
 kXfNi6zRzBZ7zqf2B+/FC4PCEz7yi7t/AeTQM3cTJzGXwR3e8lUrsOJmt
 SUtA9S1Zph1ys2Wvpp81zz7QjEtqGymdJIiNi0/wMXAEjB+QZNAC8wTBP Q==;
X-CSE-ConnectionGUID: m0uGt+QqRteIfeZojMT1yA==
X-CSE-MsgGUID: nDqeUSvVQHmMSEMcdlA3Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108718991"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108718991"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:08 -0700
X-CSE-ConnectionGUID: T4GYERcuRneg87Fn8ZR2Rg==
X-CSE-MsgGUID: d7zbwozMQ4qfUage/t4H8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="258204773"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:07 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeZ0F8KckSZkPxOxfVsD3qDtybi9p6M12NuLH3CBGssHHrtOncB94DiMgT9Ue1buVpvmNrQ/n6IirW6FjxaNRaGpkS1uK/2ghpuirLpEZDLHSDNBmDWcQpKScwMRZw7Zfif+V11RvzVh0nlsb9/9E8viogWHD97cBriSCxHQwNM18cM13zAzoYb9oFdymsWXsU8waZiE0NqLYKI0d9mciUE0tM7Wc2jyrHHsBvhYZgi2Z57ppWMi+ER9dH1ov5gl36reunc2d8oT+csD7SmyZ8w1iQvwgSKJ/YkUqVe+GEVQ9dtuu71MPpTql49h6jh/PGLf3K+yrkqpZPaip/9z5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGCRJWxPsgkjvaKZR+LPOGaMt+mwmqkqK1Z7YAQeGnc=;
 b=nfzWeYDeFEAoC0ShgdLUy65JreO1cSmpiwCv8xJcn6RxBG4uL+WOguun+H7J7Bf0ErFWlRbthsr4owUyEbgcyKtdjcp6dKVmAgD6DOJ7l4zC+i5DKXj7FV4p/sPo6SaUBOAxvksOX76dOW5g/5OAWgZPDXeX4IqKYQF0aW067IeWHWjNC8FNou1/AiCgazb7EAprAhIRE5vJH7wrViSJVg0mimP57JUefgnOIuoswfuyw+RsXTVu+PW/EVE9wIwVB4rP0o3beMA43GaI4NU9uLpDP6AfO9gL8g3qR7pfIkbGDWUp+ScC4Aqxq3swBfb1QlBCee5tcEKOJVn5JkUrHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:02:59 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:02:59 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 07/31] lib/igt_device_scan: wire to use static
 sub-libraries
Date: Wed, 29 Jul 2026 13:03:24 +0200
Message-ID: <00ee84e6b9c8792b8b1183e0e4c2be5fbc88fc6b.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 27c937f2-2db4-4318-d514-08deed60f394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bZ1U/pdPFqjSCo7UivaLff/46vyDK3XfbEA1GEWx3kzOCWuxcojp5aNP8cPsYBjXiOgYLPUORJN48aMtSLCSSjv4fkl8aXbhBQ5Y7eQfdlr0KIM2T3HTivxOA+Wx0SQmlgC6MI6mBDTcMqEQtiPy+9iuLa0dgvliDWzVQSb/OHFoY3/UO3MVtlhaaJsRUMMmzNJAhXn4LgsvGEyAsQWBHRIf/i91k22AFnYhcB1QmhvZCBPFykOK2/UyrxEgmVa5xAd/Ad23id4C3mjm/o9Ypv6Fd/yeR+oYdpv1iwiZcuQ7p8Rsne9n1sJDHa2P8K0BGk8sNpDHSXafKQ05bLSMz1d/RMbpsNCPPVdaQAFyq8pOVEr9090V8DCw64B9DhbV8c9rQXoa1mFTcNWcAa/xaZj1tWrtfMt/GIyWvIP6qFYxWIZpcmYnTt7QtmbuHnD2y1UusqSN/ZVSTC9lhtbLOGnVwmp4S5a74qTvproggun+jxbOt11cxEj688k7t0Ut9K6sMKty/RP/FlPyUJKH0iJWDdWjHHKccyuIDNNtsxB4RL9fEZd4CCvRY96lbpo6LOsyqivF3r4aTg9VeBi+zdtMghn+is8Fp+riyzBsM7hlbnjSYrM5WC8Ix8Kwi9NM1ryJeSqu9mjOp7hL7AyBqqzMCVxrHMpronlgCU0Vny4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?POyJc8qytKXjChPBfIZiV7PRcLKI3u1MxyZF6hwmUX2jlwUqMORD5JH2Vr66?=
 =?us-ascii?Q?IwNLuEkluZNCBo0fkUHIHKExGmbWRgtmV0sdYeFex/413NgsM8ACEX4e+Eur?=
 =?us-ascii?Q?gEh2R4BMGs0emVZosdgOjAXcdYX9YWiB2661B+VXuWIrWMJ80/PfctDbZyTh?=
 =?us-ascii?Q?uqy5V8v84YdxWoQOqDFR8EqvL7kDkyhbnHRDslnMl2Y5c7SbQ1JyutkOKF0N?=
 =?us-ascii?Q?RzeQgxXgZLSZuZSX0IT3liwtIaTLJQ7GK1c8MbNr2kTogRpFzXEvjXgdF8Sz?=
 =?us-ascii?Q?u/Fx8a0a/5DTrxmwI/OlY4wGN/L8hxQaZJoJl3BDV13hLBeZuojxCyoW5DI/?=
 =?us-ascii?Q?tP9vL8JAohxHwNchuIC+vFF7ixf08b+2CB9YEJKY0MImL3qmMX+UMtkUg2+p?=
 =?us-ascii?Q?QiRzWWGVeJOWcCA6YnVXdVhMDeFxNu4BxfntB7xmiFmdlj+eFYrXuavrCca9?=
 =?us-ascii?Q?sKdfTMSoPLGaEMYxqSds4mTMYf9r97cYnsaTcVJE+B6hB2u2Cx84pCedA5Wx?=
 =?us-ascii?Q?LAJASIzddH8Hp5HoxX+g0jDCbfhAPb/fOHfNmVjdkAQP1a7OsFlpyuZbPyIv?=
 =?us-ascii?Q?24GK/LoHGZC+Ahwk120hr0aBq1EGVxiyPnMUlTmAerQo/ggo9pEE2PyOeNsR?=
 =?us-ascii?Q?rl6wNic9WnkG2XhH6H5hPmLiovp2XfRZy/XEUnO5ezjEwxQ/s+yU7b6Pqb1C?=
 =?us-ascii?Q?iTTWkXuqBB54dsQ1rM1femrwy3prlMU0Gz2e3PivQ3l1IamvLipCJz0EG52F?=
 =?us-ascii?Q?VZO4AC2vm4uk8Szf6JoiRMtnZCyrAeyE37mSxWKc4N0NJz7R54GyuT8Uezq0?=
 =?us-ascii?Q?Mz646BKyrkisLOLzcqsKn4ZT+TW8PY9SR2CBAfcIiDRyZlwRVJT30IwvYncH?=
 =?us-ascii?Q?J2I0xACehSwv8/DXx3Ns7NjSyCYT85Ij8tXr/cWrc3yXWTcPUsVWH9CcDzBM?=
 =?us-ascii?Q?JwQGuO96XAWlSV/oFg0pZ/Wz/bwkjARQ8uTQrOYWyXZ/Wzq6Yej0okTKfmDJ?=
 =?us-ascii?Q?xEbnvlICIJIW+djGyJUnkRTia/AXp0kI0KFG+PolY2NlcW72v6vt/xGE8vAM?=
 =?us-ascii?Q?3pE0HkT9nwJ/9/MYpn8+5A/baKAIHvvZOqKIZnOQshEyo2h4UmN1gs3QpsCt?=
 =?us-ascii?Q?bhBDLMcnYVsEFRK35r/lB39cr8EhlRmn500lCGrC9HOedS/5QDfUjAf51+mf?=
 =?us-ascii?Q?nXShjOH3eFic+VsHhNQYqweNlgQl4JlLSbY7UihKZEfVAotagTX8A1DDqLIT?=
 =?us-ascii?Q?9JJPNp5cHPgl3eFNBImnFXFT/TXf0I9muyGTPwIzWc6QcY8tkx17QHBT8pV1?=
 =?us-ascii?Q?q4sdWzO0s/PM10C9OIYttZEI2VxHG/e2W6IjwGHiLGmP/d3ckapuYT/SD3o7?=
 =?us-ascii?Q?0HAnsyJylInX1Oag2SkBVwjgo4syycRLwG9C+rTZstJpXYzrYGuVvMfRzN/e?=
 =?us-ascii?Q?jkAX7vSAOXt1GyoPM8df1tkTFwBCvNv0XuowU7WbJ612d6Odd61iPd+A6++u?=
 =?us-ascii?Q?4ud9YVvhtZ/ypoY9KtF3n7Ltrn8pUrl8qkyZNqLPlpElimMllEWk72XIt5/8?=
 =?us-ascii?Q?K+JhN2hadj3GF4KmE7R8zSos2TcNsXPahRitlN6i6iYr6VwGBuHudLBRKCfV?=
 =?us-ascii?Q?UBr1RXXR16vGEUj9w618MoY5QbvcGD09mLU+ga9jgAMSdcvphswuGRlNWgn0?=
 =?us-ascii?Q?odgu1uH+/JpfM4EDA13CphTVWtEbDbPXJi6CEj+62XcbEoN3OuFnuMWdR0pQ?=
 =?us-ascii?Q?LNLKZ21C9lPBGopJSyt9IpXB/oq8noM=3D?=
X-Exchange-RoutingPolicyChecked: A+wtsVyULUzqbLDC+a0UJSnoA/0LKwsfwrsOa+gPCBSD5rHqZsHuu33GuzgnOJXBzx6SjC4HFHnI/sARjbde5FGCgJvcDQHT6tY1JtCYPOF/BDg0Iz+8NYY9fdKlmZ3KVBv0on/uU3JJeghpmdseQYPpnFdhcFhkWyUzOw4OCXuCCoGr3zS3+D5AMCsahDgdxFkH/72G9yc71WTw33ajwjTwAO7vhPigX+2pq3i6a7nOqayYfyzIBKxlniU0qd0eYSOnrV4NcWFCpB9qeXKGgYoaubq2wQ7mHeQnc5vb8klAORN0m7aaEZmhTabFW52756RcotP4PYjB8bP0w9Wmcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c937f2-2db4-4318-d514-08deed60f394
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:02:59.5608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4C4syzwQcp/syWNnnCdR/qyW6oCFX9srgOH4sS4BMLBCFZMuwvYeM8/F/pZMTkppPtrRkPbAhs/nhYtKsggnsya5oGuQ7c+s/lptUm9BEE=
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

Drop the directly compiled igt_tools_stub.c from lib_igt_device_scan
and link lib_igt_tools_stub and lib_igt_drm_stub instead. Compiling
igt_tools_stub.c directly would cause duplicate symbol errors when a
tool links both lib_igt_device_scan and lib_igt_tools_stub.

Add libdrm and pciaccess to scan_dep so tools linking lib_igt_device_scan
pick up the right dependencies.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/meson.build b/lib/meson.build
index 484a912d7..2c1fbcd43 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -367,22 +367,24 @@ lib_igt_drm_stub = declare_dependency(link_with : lib_igt_drm_stub_build,
 
 scan_dep = [
 	glib,
+	libdrm,
 	libpci,
 	libudev,
+	pciaccess,
 ]
 
 lib_igt_device_scan_build = static_library('igt_device_scan',
 	['igt_device_scan.c',
 	'igt_list.c',
 	'igt_map.c',
-	'igt_tools_stub.c',
 	'intel_device_info.c',
 	'intel_cmds_info.c',
 	],
-	dependencies : scan_dep,
+	dependencies : [scan_dep, lib_igt_drm_stub, lib_igt_tools_stub],
 	include_directories : inc)
 
 lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
+				  dependencies : [libdrm, pciaccess],
 				  include_directories : inc)
 
 lib_igt_drm_clients_build = static_library('igt_drm_clients',
-- 
2.53.0

