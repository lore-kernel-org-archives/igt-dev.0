Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85960606A336
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 18:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=htWuCt5h;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fs+8TwMO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E5D10EA0E;
	Thu, 26 Nov 2026 18:07:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93997112672
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 18:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716353; x=1827252353;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=6QorhscBLaL1Q9416qZMatrzWAOK/ub/xGuVXQ0qvMk=;
 b=htWuCt5hs0pyGZg0uZYM5lX2o1DBBjWVEelebkZrpl0xDbjU6SsUrkdW
 Hjs8pZn5vVor0sn2CjvqXN7kKCpV2t237den9jMIm/lmQEVZ4xWORwrOb
 gFAlpYBJPAosfx7p1hqXW8UG629kYUY1Q9cvHjk//a1rNKYng9nrc6Xxj
 wJH9PqTp/J12Vq3DFSZhvR+MQs064wtiyDZn5M/GviZfETAtpQ4wxrRNh
 bJY+IjFOfbl2APF5I4Z1dTXlo2JWKvQsGWEMLLoKYx5UvcGYnRQfv5LBx
 A+FtFKaY2cqWQFioZFK/N0+RNh20lWB3ouQeWKlGkQH5qLG8OoMkLnexL Q==;
X-CSE-ConnectionGUID: 46ME4v52T+iFAq4stx0JEw==
X-CSE-MsgGUID: phvuYrMGRR25NMZcRxCs8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4541033"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4541033"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:05:52 -0800
X-CSE-ConnectionGUID: 1ef+9JeKQ9mJ3a3oNTsz6g==
X-CSE-MsgGUID: ZZ4cS3IhS2CSa45tZUrXAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12560601"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:05:51 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:05:51 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 10:05:51 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:05:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jW255yES5ifK2kxRqZ0/5zejF3XtFZyale1dMoX5Cbqk94ZWk/jRcpVPtLAdmyLU5aUziTQs/Mg5TgYFiYPE6IAp9eoMACykvp/f10SsBZk+mqiNWTnDfjviihwjeyQv9QW0p0PEwhvs6BdBpwklljmOBCCO6c+IYh4wjeERM0SQj4KYQcFS+EF2ufIoPjMwe+zYVR1QmGTFcpbmyjWXcU7ng2N3Q176+mwzavx+7MMZMIq09EkQn5HJMAdmbjrUACoEibizDqmQ6zX9rI1daiozTMfzWGLmOiEzlgK9h3Y7QxDo4vPybSVAcNrsqOde400ycqzx9VGfbmnia8ANmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79P1nZ1kIotqeKfAHy64jZZTp1ha5VcbzLigbg35+EA=;
 b=jKAzcqU0Ya6fRs2lxZ0M3qEufilhDg297ETGlHhUqIfx/IVDpJFOpCgbvCCzZtZB2c6diOgpreqyL5jA3GbdiL2zlDsZCdSH1A0r/JkR3MO5zT0fnkG/8Y9DS59+O7oliMavODW1szlmOO/CrhOZII8I4CgpyMIqDeVNOCKYiSXKNpxIaRHEsBPXdCvwZiXnMn9fknzWnfZ6V0leZUkNQ81R5NjWN0Ajd8VxIPyw9iEd4ljsJvnFRgFBsGg/RfvTz+3tNxbJgA4A11xmFtwEAZu0RSb4m2SKFa2ZAWptlYgr40MX4S2StewvzOm1wkgdkmKHQIrzD7YZHn2v0CC3cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79P1nZ1kIotqeKfAHy64jZZTp1ha5VcbzLigbg35+EA=;
 b=fs+8TwMOGs58f1X7Plxw39Mzn0dwIewq8dpwiUPo5ZG0LkD0ikImX7K/SVH5VKQaIiysz7HcEBrx3ojK2jgIjBTIGliqEhU0XZVVNedEgv6hAJKKckmy3u41aZ8tzbQFhopDyF1e1zO+j0FGfDyZ2UdLtyDrS/BlNVpaQRKaV9o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 18:05:43 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 18:05:42 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 1/9] lib/igt_drm_ras_nl: Add node and error counter
 listing
Date: Thu, 26 Nov 2026 13:05:35 -0500
Message-ID: <20261126180536.487442-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:74::43) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: ec376b84-d3a7-424e-d92d-08df4be7e2e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261102123227099003|261022105027099003|261022075727099003|10067099003|56012099006|11063799006|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: IwvvBXIm4NjA66UJdT7PF+e3Kcc9JsNATtM1EqcmEYzf7IJkbYVmf/9bA310MuX1lsL2Go3CW05aIziQwWMyjVvZko4LpS9pzkUU0njHe6W9VgIkbgfZPDVnf5mmOT7NjIXAWj7HKl1rR6D+kAg24fkNzQQFrIc7o1g44qR2F/Bv+cG4kH1lZ38plFIRY/SY7mchA93I62p/B8z/Icb9LYZdezsw9GsMOhZINJonIQauamHjx/a3FjjBuYShKNMpIenAlR47eIKjkZG8gxBjLOnTx+U6g+Q5KUGy1ugmnkr8uvocz7j7KGPeoG7wTc01nae0d1E+avEvhDecSGzoYNSll3MGTALBX1pbe/rs6NqpiJbVQ7Sjj7e6BBsEbPjwGNZAM6kiGqMjAvg8IXdXJ7nzGwrV99WaAoP50n9rlF9kKverEwLrpAMZ5sqcJJlUkwM5Qgkz/Vn/XFyUEVCnrZ0nqPmMGpBtok5jdXHsr04uc1oeB9HNQxhujRWvBjWDjidlgDW+CNEnZF5kYjQiefBgYsdJy9dZv1OtJiaKbK44auSgxnqVCBk6VWCBTjZ3IWEdzkp1tq+9mfc3uBd80UqpFccNpgXDC9BLfs+n7GzVdt8BQhVmsfdNawnkGQ4+M34iCd4qGFbUkOitrtzBm//usfBYfr95fVrYji08KJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261102123227099003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261009223027099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M2jAGUrQgcM0o7i0DyYAwbQKuW7fyPYB7UPPHX62y1dkGv43EuDB5ibSyl2x?=
 =?us-ascii?Q?bQIyxw6E3s/D/D2yvYxVkd0xnuU8N7JTEMIfEq1FRKcLYG0EUtD2sk5CC/Zx?=
 =?us-ascii?Q?J5iffn9x8aJIqSn2N3OEdjT4QNDnwixplnfBjWr7ueCGMeJF+sm1XYBN5Wvt?=
 =?us-ascii?Q?3WCjwwN5Eq5Z/6b/7DcCLPTN9KjUOm6x/3u0CeYPcwFnngiKbl9YRhBvFXWb?=
 =?us-ascii?Q?vrUxDKy6lXIrgs2dvnWM1Ve3sMZB8gn71lMkt72OeW2EF4OC3xlnlafJLxIT?=
 =?us-ascii?Q?XCllYDxTzRHzfPotWHypgm7+Sl58ga1w39HAbJedvJDmF/FUPp+XGpIF7WRB?=
 =?us-ascii?Q?Ng8/NYZB4syYDqYOJ/ZlUKQtRCDJFhYhRoeLflZ951MSWP7KJTw/qZipapfK?=
 =?us-ascii?Q?hBbPJF8UIGRc1Ax3jBJQICJ52gSca/+VxKLH/NljrpqfjyPVd7akaPQHIvaz?=
 =?us-ascii?Q?GG264AamNQYJgc251SBzA6RsAvS+4S/J/poC5Rt+FretCakrp/1nlcvejX/j?=
 =?us-ascii?Q?ICL1A7DIhn9TfYuhfB3//nzYkLxqgOO8I14EQIYBvzFC7mynxpjOnx7p79UL?=
 =?us-ascii?Q?bUEmmty7WqDsbrnItUaEygOc2VXbbHdaXmIya9VsT2UNwOj9Y3eZbJmU6wMr?=
 =?us-ascii?Q?XgC/mmgQkO2xVCkxsMVTlcfgC5SVY7Bn2Fz5muwgeyb4Y/f2Gxj00c3MCij1?=
 =?us-ascii?Q?DI+PiEmuN75minjJSQv6bDCfCwJyfSfzFg3rayFXr40XCxUf54o9uqRDY7Cq?=
 =?us-ascii?Q?+7E3s04R8g0x3QrWxJdzfV6SguYCATc9oD8O8ZYx3Q/B05ecx0we6IIURewA?=
 =?us-ascii?Q?TluHQBhdF+IY4Cl9ooOFoVNfo1HenxVr9PY3zV11a+JMYaKpuQwyCpsWAQ5I?=
 =?us-ascii?Q?EhA9A5Xjq6fDIE2Q4TNv5BSBDi6UuYf6FSjGk5Ja9hHlAT35k8xjGCRHQsYM?=
 =?us-ascii?Q?mLnxotfJ8dwVHfh3mr1lpnyACUKBzMarcuzdY/3ISn0EHvo4p7TtKqXAo82t?=
 =?us-ascii?Q?Z0Bko1RZUv04Fq4Yqqa7SN6OucGc7Idfml802yskXoapUs3EN3NQoCCNm+vQ?=
 =?us-ascii?Q?sNf90MvylA0dCMzGVxSRaEH9w5YiIEzEvVWhyN4RkUmwN0UYuORR36KL0Pv4?=
 =?us-ascii?Q?zPCv4xGoXAHXGzNkm+j5uzjeRodDSYKShp5h+7YDh06GTii9hhm/4PXoCNiS?=
 =?us-ascii?Q?RgoEEM+xKmWzlImmHLBHjCNGHAO1Ck4FAy3LmDJK4A2pY1gYDZcyLK8i9/rt?=
 =?us-ascii?Q?hXQEueccxBxEUEmsJu51EuHR7Q4uYFLqKCKtL4IVzQ44PI9CKQA3tmH7YDSe?=
 =?us-ascii?Q?WO/cAV2QqvUkjoSfyvJcNKh9cxzPcJ99hmLuHwvys3h9iaLT+qLTEmAXNf/V?=
 =?us-ascii?Q?ITf/GY8vo1JKkdlJDNtguTCZW0P9mmSKzq6x6+jwbHkl2LT9Sj/nQoCHiFgx?=
 =?us-ascii?Q?X9ZLoAIfBciTT+J+eA3e9Pvqt5uxT0PtZuI4M99BrfgOZtAlZCjUli27KLHp?=
 =?us-ascii?Q?4cZvjwD7Exr5svktzkIjN/0X4YqyQOcuUkQqyrT8GmIRpOIfYDsMy7dbXa2/?=
 =?us-ascii?Q?Cv75GYqiKvZnS79BX/aOYwUB/9EXDoMnwahZOV70+LrgBY48/taBigb9vDwO?=
 =?us-ascii?Q?oSqrIivmG1IQqabKiKg3jvY2YX7TjQpH1MZX3/3C5jFC5FSIE99189btIkym?=
 =?us-ascii?Q?Q6MtjxZNP7dUKsPrgC+4yEvtAIauSvGDL+FL5+pXIPNNhW0mPc0EfQPoD440?=
 =?us-ascii?Q?tPunh4YObQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: MatQnt3JgGzfOrXpytZUlgi16kUR575HODeRyYQVzt4IU8TZ1kwwov9DzRx6nM/0cn3ZWaVRJcapQ2T2mOEmiMQFxcMH4+poxhtiODXixi1Pm2lkmDQ097Uw+8q0stSQEcnq119Do9OCDWm+SQgIMrcYroKzLAbyLLxMvtR+kQXFKyXAb6Z167WAinx0y07gyJwrBWkuA3dPhs4eghfyCwi0rAx8ipj7r+TgiSM+6bAEHQVjQPc9KkZEElEDN2KAWpanvetd5Dc7Yy6/VFOpa6IMVmVJOxhaYNgxLio72TVmcNaizp33MeyIkjvxRi/aX2C1mdsguYQFnYeYGbvgFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ec376b84-d3a7-424e-d92d-08df4be7e2e2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:05:42.7953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EW+j1vrkjPXAwnQcG6TuwewZHJ7OIaDOAz/7S06OolpUQlK5YQPAoriSUKcWewAk57quDTnNlHL/F7BdD4fIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add igt_drm_ras_nl_list_nodes() and igt_drm_ras_nl_list_error_counters()
on top of a common request helper that reads until the reply, the dump
end or the ACK, and records whether the kernel flagged the dump as
interrupted.

Enable message peeking so dump messages larger than a page are not
truncated.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_drm_ras_nl.c | 172 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h |  39 ++++++++++
 2 files changed, 211 insertions(+)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index f7ee3e373..282648f55 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -398,6 +398,7 @@ static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
 	ctx->event_received = false;
 	ctx->family_id = -1;
 	ctx->subscribed_grp_id = -1;
+	ctx->dump_interrupted = false;
 }
 
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
@@ -424,6 +425,8 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
 	if (!ctx->sock)
 		return -ENOMEM;
 
+	nl_socket_enable_msg_peek(ctx->sock);
+
 	if (genl_connect(ctx->sock) < 0) {
 		igt_warn("Failed to connect to Generic Netlink\n");
 		igt_drm_ras_nl_cleanup(ctx);
@@ -657,3 +660,172 @@ int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ct
 
 	return 0;
 }
+
+struct request_state {
+	struct igt_drm_ras_nl_context *ctx;
+	bool done;
+	int error;
+};
+
+static int request_done_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlmsghdr *nlh = nlmsg_hdr(msg);
+	struct request_state *st = arg;
+
+	/* A dump that fails reports its errno in the NLMSG_DONE payload */
+	if (nlh->nlmsg_type == NLMSG_DONE && nlmsg_datalen(nlh) >= sizeof(int))
+		st->error = *(int *)nlmsg_data(nlh);
+	st->done = true;
+
+	return NL_STOP;
+}
+
+static int request_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
+{
+	struct request_state *st = arg;
+
+	st->error = err->error;
+	st->done = true;
+
+	return NL_STOP;
+}
+
+static int request_dump_intr_cb(struct nl_msg *msg, void *arg)
+{
+	struct request_state *st = arg;
+
+	st->ctx->dump_interrupted = true;
+
+	return NL_OK;
+}
+
+/* Send @cmd and feed each reply to @parse until the reply, dump or ACK completes */
+static int request(struct igt_drm_ras_nl_context *ctx, uint8_t cmd, int flags,
+		   int node_attr, uint32_t node_id, nl_recvmsg_msg_cb_t parse, void *arg)
+{
+	struct request_state st = { .ctx = ctx };
+	struct nl_msg *msg;
+	struct nl_cb *cb;
+	int ret;
+
+	if (!ctx || !ctx->sock || ctx->family_id < 0)
+		return -EINVAL;
+
+	msg = nlmsg_alloc();
+	cb = nl_cb_alloc(NL_CB_DEFAULT);
+	if (!msg || !cb ||
+	    !genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, ctx->family_id, 0,
+			 flags | NLM_F_ACK, cmd, DRM_RAS_FAMILY_VERSION) ||
+	    (node_attr && nla_put_u32(msg, node_attr, node_id))) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, parse, arg);
+	nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, request_done_cb, &st);
+	nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, request_done_cb, &st);
+	nl_cb_set(cb, NL_CB_DUMP_INTR, NL_CB_CUSTOM, request_dump_intr_cb, &st);
+	nl_cb_err(cb, NL_CB_CUSTOM, request_error_cb, &st);
+
+	ctx->dump_interrupted = false;
+
+	ret = nl_send_auto(ctx->sock, msg);
+	while (ret >= 0 && !st.done)
+		ret = nl_recvmsgs(ctx->sock, cb);
+
+	ret = st.error ?: (ret < 0 ? normalize_nl_error(ret) : 0);
+out:
+	nlmsg_free(msg);
+	nl_cb_put(cb);
+	return ret;
+}
+
+struct node_list {
+	igt_drm_ras_node_fn fn;
+	void *data;
+};
+
+static int node_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlattr *tb[DRM_RAS_A_NODE_ATTRS_MAX + 1];
+	struct igt_drm_ras_node node = {};
+	struct node_list *list = arg;
+
+	if (genlmsg_parse(nlmsg_hdr(msg), 0, tb, DRM_RAS_A_NODE_ATTRS_MAX, NULL) ||
+	    !tb[DRM_RAS_A_NODE_ATTRS_NODE_ID] || !tb[DRM_RAS_A_NODE_ATTRS_NODE_TYPE])
+		return NL_SKIP;
+
+	node.id = nla_get_u32(tb[DRM_RAS_A_NODE_ATTRS_NODE_ID]);
+	node.type = nla_get_u32(tb[DRM_RAS_A_NODE_ATTRS_NODE_TYPE]);
+	if (tb[DRM_RAS_A_NODE_ATTRS_DEVICE_NAME])
+		nla_strlcpy(node.device_name, tb[DRM_RAS_A_NODE_ATTRS_DEVICE_NAME],
+			    sizeof(node.device_name));
+	if (tb[DRM_RAS_A_NODE_ATTRS_NODE_NAME])
+		nla_strlcpy(node.node_name, tb[DRM_RAS_A_NODE_ATTRS_NODE_NAME],
+			    sizeof(node.node_name));
+
+	list->fn(&node, list->data);
+
+	return NL_OK;
+}
+
+/**
+ * igt_drm_ras_nl_list_nodes - Call @fn for each registered DRM RAS node
+ * @ctx: initialized DRM RAS netlink context
+ * @fn: called once per node
+ * @data: passed to @fn
+ *
+ * Returns: 0 on success, negative errno otherwise.
+ */
+int igt_drm_ras_nl_list_nodes(struct igt_drm_ras_nl_context *ctx,
+			      igt_drm_ras_node_fn fn, void *data)
+{
+	struct node_list list = { fn, data };
+
+	return request(ctx, DRM_RAS_CMD_LIST_NODES, NLM_F_DUMP, 0, 0, node_cb, &list);
+}
+
+struct error_counter_list {
+	igt_drm_ras_error_counter_fn fn;
+	void *data;
+};
+
+static int error_counter_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlattr *tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
+	struct error_counter_list *list = arg;
+	struct igt_drm_ras_error_counter counter = {};
+
+	if (genlmsg_parse(nlmsg_hdr(msg), 0, tb, DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL) ||
+	    !tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID] ||
+	    !tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
+		return NL_SKIP;
+
+	counter.id = nla_get_u32(tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID]);
+	counter.value = nla_get_u32(tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
+	if (tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME])
+		nla_strlcpy(counter.name, tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME],
+			    sizeof(counter.name));
+
+	list->fn(&counter, list->data);
+
+	return NL_OK;
+}
+
+/**
+ * igt_drm_ras_nl_list_error_counters - Call @fn for each error counter of a node
+ * @ctx: initialized DRM RAS netlink context
+ * @node_id: error-counter node ID
+ * @fn: called once per error counter
+ * @data: passed to @fn
+ *
+ * Returns: 0 on success, negative errno otherwise.
+ */
+int igt_drm_ras_nl_list_error_counters(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				       igt_drm_ras_error_counter_fn fn, void *data)
+{
+	struct error_counter_list list = { fn, data };
+
+	return request(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER, NLM_F_DUMP,
+		       DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID, node_id, error_counter_cb, &list);
+}
diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
index 46d31599d..4980904f8 100644
--- a/lib/igt_drm_ras_nl.h
+++ b/lib/igt_drm_ras_nl.h
@@ -62,8 +62,43 @@ struct igt_drm_ras_nl_context {
 
 	/** @subscribed_grp_id: Multicast group ID currently subscribed to, or -1 if none */
 	int subscribed_grp_id;
+
+	/** @dump_interrupted: Set when the kernel flagged the last dump as interrupted */
+	bool dump_interrupted;
+};
+
+#define IGT_DRM_RAS_NAME_LEN 64
+
+/**
+ * struct igt_drm_ras_node - DRM RAS node
+ */
+struct igt_drm_ras_node {
+	/** @id: Node ID */
+	uint32_t id;
+	/** @type: Node type (enum drm_ras_node_type) */
+	uint32_t type;
+	/** @device_name: Name of the device the node belongs to */
+	char device_name[IGT_DRM_RAS_NAME_LEN];
+	/** @node_name: Name of the node */
+	char node_name[IGT_DRM_RAS_NAME_LEN];
 };
 
+/**
+ * struct igt_drm_ras_error_counter - DRM RAS error counter
+ */
+struct igt_drm_ras_error_counter {
+	/** @id: Error ID */
+	uint32_t id;
+	/** @name: Error name */
+	char name[IGT_DRM_RAS_NAME_LEN];
+	/** @value: Counter value */
+	uint32_t value;
+};
+
+typedef void (*igt_drm_ras_node_fn)(const struct igt_drm_ras_node *node, void *data);
+typedef void (*igt_drm_ras_error_counter_fn)(const struct igt_drm_ras_error_counter *counter,
+					     void *data);
+
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
@@ -72,5 +107,9 @@ int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_subscribe_error_report(struct igt_drm_ras_nl_context *ctx,
 					  const char *notify_group_name);
 int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ctx, int timeout_ms);
+int igt_drm_ras_nl_list_nodes(struct igt_drm_ras_nl_context *ctx,
+			      igt_drm_ras_node_fn fn, void *data);
+int igt_drm_ras_nl_list_error_counters(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				       igt_drm_ras_error_counter_fn fn, void *data);
 
 #endif /* IGT_DRM_RAS_NL_H */
-- 
2.56.0

