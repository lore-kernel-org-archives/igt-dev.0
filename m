Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CF9CDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9292710E070;
	Wed, 24 Jun 2026 08:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/nUhxyD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F39810E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290846; x=1813826846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=90r3qlF2ZdPoVkxwIuwUFlWG5GHL1ev31XJsh+Y++h4=;
 b=B/nUhxyDOE8R7OVRdqTvs1oi97I4MIUKtP+PWCj2aMNUGtUumim/5WH+
 pbDki6sqUJem+Mepg3sl1XuC/I8eA8b3aQBOUvuQGUFePUo6cWUdXwEHo
 Dkt3ElUivmczEa9ejzYYgZMtamNenXJ2gKKddZr4ZOhyXl6lCyDEdoHYL
 LUYsE+zvyko5AAX1xoXKdKRRuxNL3C0PrXrf9TFVR2kk6kxwChYYoYELe
 GyqgcooW5x12yS3dnY+fOGY8dJ5DlFm+WDABNk9B0adwiMdfquwnKJQ2w
 eWlN1A1QC3sLzi9WMatbRut+C2atDpvCi7y4QbIvbUX+cz7vts+iD6dxl w==;
X-CSE-ConnectionGUID: NoRGo+JuSvaWheEAAumU8g==
X-CSE-MsgGUID: DPneDQ68T5+NJV/adneb4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142210"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142210"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:24 -0700
X-CSE-ConnectionGUID: k37PkF6YQg6nmFHTImNSOQ==
X-CSE-MsgGUID: LffRq8jyTgCkMbi54nrfWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="245432068"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:23 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8XT1Pg3UwaB8v4PgQdyt6hZniezKGsvOGzmDKTWMLg52JQqjFmMr6hhkTCKG+B7nt07+ysJZbWgx0p9MNuhBuNWVlghhJ9AlKYwMZ4RO7ZOb10onThRJ7t0MXzjw2MBgdQ0xHau4LqACv6XQHKUDEGNQUrx+/IvarSGqTs9gtHtwFAPCbk8+TjudIoYFJskVZ84x3N/so5LrhJp6vJFyBZ/EHp2zNsjVJQiOjfXjcOtipqCYrBa3Uux5/dAKtWacIciP0gO1gGXnU9iWFqUXlqxJROOS1ahM6uAKgXqloy0PEd7LLTnrjWmDML+udhbLotwuegRsiVwwF6sMzsEjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4l+65dywi16Sj1kgohwUQuPiB45XXWG5Gf1EuZj5JNM=;
 b=BAL4h2mAyRknYNUK+bLNVr1JzBRhP/WEa/W/wZChhfAg6czQLtHZBu6bhn6PmtSAX39oqv9pdmg1i/b3daBsl9iGI9VHuZb72cfEfWWR6xDuS95qyeo02RtsJVReu2Qhd3GTYgOOWZL1+KFiCzNIxKJWzRUiFKQfDQvcolV5yJdJfb/Jr63FKtGX7CWPjTLNubW5tljmx8ttbhZ7jjCjYUbFKZvkOaAAN/OKDZRz5nxtf3jBCK1yXa/H54ltYKDky2xY63zcOn2lshXAxh8TvUaZeDJgibjcxulBWvFQcc3xzVclKYhIe4xAKGyZEgluY5IyVQEbsuIkzT5RW7Bd/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:20 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:19 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 02/25] tools: intel_firmware_decode: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:09 +0200
Message-ID: <758f127a782a80c1725b6f98df441f13621d38de.1782288071.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782288071.git.sebastian.brzezinka@intel.com>
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::28) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|CH3PR11MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f12153-28b8-4a02-f48b-08ded1cd3386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 1RQJ3ldQsrydkj9Btb3wzCA5u1/uso5RZhjoRwpcwiYKpk8swNIY31oe7GpWwoKTld0jNynxs/fY50pSGHsXjeFZDIBsyfuZ5yTf0hJXRD0aEVX++2tNGTxb479Vw7hpsTjq4iizROLDZUYTyOKEDQfXdHxXKm1QM18FTAiIqNmtOoCWR4brdghiji3HZajYz0j2ryMmw8S79ByueGREzmZvyl1Kz+gOG/tw2JyqW8IMmN/FBPTKBYzCg778YeUXNZOVs7VdKFmfV7clxwuwXedZmYJ9G89M4wIjWh7cU/r1jZ0EwRLAL31yv4RzvKt33BchrmEDoEmjqGkjhS5kQf6N7Rh6YFqWegw02r7gKt5SxLUT9iFMEjbqKxWtPspHKdt8UCOa3Rsssr03IQN3qrjsLdBsT8Li/353kKcPALNESrYXZLYg3hZ8eihx7ehedji8x0+YtKYqId7a4iUrBWorWDtAi2yVNHJ3aUdYoXx81rIOiDAOVVgcLP6NCscOTSgagnhw+4uT9vQWl2+rOlEjJxH+9SU/BDIFtGu3UDTegoiu5gSgQ5gf9oTfgqgxxlhRdatA5qswDIqOd2UGmf05kcUkObBkRDC/MSprhpEO56sx83qoXkQwewi4WvjPLxn5sKEcISY4l/NBcwGjYDgY10/Ub/6rZXwNt2n/muI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KDFVirlQW4rGHhL6elDLp9bgJ8KlGqyOjoa74sdzfYpKv1e2VFS8Nzmlpw9W?=
 =?us-ascii?Q?6+iaYImlMtj/aqCfvO5BYsND2VKQ3nSOoFXwTWwZJGHfQ8efLBHZMr0z3eMo?=
 =?us-ascii?Q?lpFZFG8U+8tgKdMOkEgud+CpDhPeoEUAhlrEUISAmWVUEoL1N3sTZWNWaa9L?=
 =?us-ascii?Q?oNcAVtkaIPKMBKk3rxR1Lp0BhVwWL0KcybJZ+TaG581QQ+4UARzBMNT8vnC5?=
 =?us-ascii?Q?hGgAzrUt2RyF91VLzFyXcoPItJ09NZ8FA+92/gUJFnZGbRGfYhz3gheqNlzV?=
 =?us-ascii?Q?c1mBbSRKhtVDQWyGHCgmIv2W2/ZxmKfofje5FuFzPGgVsUyKlJVwrwY5tAe0?=
 =?us-ascii?Q?c0Z5jrNwMgH4dF9xHl0aV25cszN9sF8KefP4IAnL/CqcXfUHVvfdMmP++lXy?=
 =?us-ascii?Q?2//1nD3fYW4Q4H19T8SfzWcbAjiCe9MGA3l5J1lFUPI74mfOI8mSgec48QIY?=
 =?us-ascii?Q?IdqWm/R524K0LPnCyvDoAR5alsVcyP5jiOvrDS7Yyb3RhArzkvHB4hA3sXHs?=
 =?us-ascii?Q?CGg0+/HVUNCXTGM6CKCgp+XGrWu4S3ksuG0wzVDG7VL6qScfHapOykBW61uE?=
 =?us-ascii?Q?ANSEkqdFPxmzPGgdznIxenPOjEKQy/l34f/QZZfOidfjRaJoZrAJxf6jxwKs?=
 =?us-ascii?Q?Fmx8L+LE2vP9ULuN9hZDMZfptaRFUIuUcm+aHxbdcwU3qlnYT9MjQez7rY/I?=
 =?us-ascii?Q?pj5yRdjhSurYymesZnN5J1ufInsPs5K0GeiT6e0kboSJIRHB09w/dyP9uVn8?=
 =?us-ascii?Q?tvkPvvojLrT70sxZE9uJfND7vSLQdqEbmkHZOvVry9V7KYj+XP+ZcTzm6lIC?=
 =?us-ascii?Q?+M6f1Lm+wR0myR/lOrPigSHLwOufImUqgMEkkE/LdwGKrTC1WZImY4/eOGnd?=
 =?us-ascii?Q?trsoxt6Y6sA61SoyX+9N1D9D14O1CRNijZzj0EoiXweOx/oCr4Xhz6dGPJqh?=
 =?us-ascii?Q?XdnJ/Es+RrCDSS319VmKi34zQVdTiNtcz+Qu5WsBLn9fIH6JFZ5UGqw7MNud?=
 =?us-ascii?Q?VKeoN3ZmU577jJZVVkmmplASn2p6Dlb8/IkrFnJl3/7jgYIe/0K1tMykFvIg?=
 =?us-ascii?Q?0R6sIhFdHrd6YEIXimCmvwX0GRLb732NQ1YOi5XDzy2L1b/2m6x2Lp4b0Aoo?=
 =?us-ascii?Q?lOg+vch0uAnrvF/CuGpTDFP9XImffiw0enBBDgNxJ8Gf+vv2wmPKPEAaM7rL?=
 =?us-ascii?Q?irXYSaZHlSvjgWbRwoAu8/qiUu62RXD5YdNeeCm6X2agIjeUcalfWZU1GygL?=
 =?us-ascii?Q?cSNnLpda/45xn/ZsCwftu3TxKGCiBMH7htFZxEqXXlLXv/1xRFN2YaHqkA/3?=
 =?us-ascii?Q?XSVTslC6j/sfsr8f9S3mAr+AqnJdD+X7fIbpLsKrChO+qeX2n+QCP6AQfghu?=
 =?us-ascii?Q?f+BvT1BOy9/VzB+JXn/CmSQHVPni3zfpRHlZrPZ3wXN5cKCzz+zFEVcvs+ah?=
 =?us-ascii?Q?dw0iakPkgfsH9+Eut3vAypEIUj33eOB5My2bWLHKF7Ey7sB63+rmRAenGrRf?=
 =?us-ascii?Q?fXz2AR3RvqgnC5v1/J8LRfJjsDDqi2b4OkopCrjBQt2EkKiDDkM7WDvq2Gwn?=
 =?us-ascii?Q?gBHsN5qn7krDAFRwctFaSYa5zXFXhOayFv5NxuC9u7yEsnnI+zxOmX1RbprK?=
 =?us-ascii?Q?Whx3+X43KLEhmTtQ0RuglxMlLT0LvcYBS07zkEh/kqtNVWWY2KTg8Oh8OngD?=
 =?us-ascii?Q?+8G2dxpAlPxf90uPwBNWmEPq/t9AiSYlHFPP/6NBHO0BgBp8cwyJug4Y2EsI?=
 =?us-ascii?Q?+dvzJKXL3ypBalauek4eShxHc9texeE=3D?=
X-Exchange-RoutingPolicyChecked: hptnQ8X72RidvLPxRIP7UG8YYo2+g95bUt/5ybF1CY1cyd2KYR1q86tXcfM7oMPrUNQy3uWszWAYtA574gFI7gscowRq6TajlAgt4ve5S9QY02XjeSTix102EWHx08U9oSk5JdlodTMvARtbRjSScy+OhYTzVgZobJ2aVoJ2YcFmZFED9SGL+246TbpMB11RO2HuNNOrnce55TL8HKepf99WGqt+ehE2ZSnUK5m64B34nhxihgLV3FVVyYYZudCiKzrLzgWiDYvOG53lpOUAE25FZdfV/kjXWXDX4TY2p+uNohAjqDJKg7ID0Ab38HUJvFFm3qLyBXF6YT4LhF7zQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f12153-28b8-4a02-f48b-08ded1cd3386
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:19.8709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0y0QfmdFWs184jQEPKFoq3xYvy37NJms/jBDT6KbBR3FkJEtbWkbpw+nFDXWUBgz9rr04LQxe6F7Y127iVG1tOxtZ5UUxp0nG9XE4ymN1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8776
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

intel_firmware_decode only needs the lightweight assert stub used by
igt_assert(), so the full libigt.so stack is unnecessary.

Switch to linking against lib_igt_tools_stub only.

ldd before: 35  (ldd | wc -l)
ldd after:   3   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 286a718c8..4c67dde4f 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -24,7 +24,6 @@ tools_progs = [
 	'intel_error_decode',
 	'intel_forcewaked',
 	'intel_gpu_frequency',
-	'intel_firmware_decode',
 	'intel_framebuffer_dump',
 	'intel_gpu_time',
 	'intel_gtt',
@@ -62,6 +61,11 @@ executable('igt_stats', 'igt_stats.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_firmware_decode', 'intel_firmware_decode.c',
+	   dependencies : [lib_igt_tools_stub],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

