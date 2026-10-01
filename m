Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22880CA5FCB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 11:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F4010E029;
	Thu,  1 Oct 2026 11:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdHGG9Of";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D7010E029
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790853271; x=1822389271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BMVVRKjWLCACbcDyFVonx/PCQFuv57NyTr8Cw2Aee2g=;
 b=jdHGG9OfCOOZkGxU77dgvPq/3DWH+xa8ZMbirnKo9T0LQhkAUtJZC1xX
 wwjGcAzXzbfSuMleI9Rnew+JFP5qwpAJfQ5WMgyaXHShHZ+90y8aQPW3j
 vw8gfQnSf4QhumqWBkLA2UHqUkrWbz0F1sc9Z2kfBWRxPQyaLrp1sKcSN
 koRR/V+k0Vo8x3zQrP+noLKNNHJRA9MWaFC/Ik90FGxYtGwHHVCcincYJ
 FBiT4keMP3m304I6Npjpk72TIRy7dFPUOg02m0438fCBS4A6WDRuVZesX
 UrXhZZbRzITqmatXKnL+XjZMlC40DDqaAKiprsFtfnUjyDz5XN0K1e2Vq w==;
X-CSE-ConnectionGUID: px5lr/u2RV6kSAOGrSnroQ==
X-CSE-MsgGUID: kpPBvoHPTxKqT19QFJNFkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="117136262"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="117136262"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:31 -0700
X-CSE-ConnectionGUID: +vsHg+y8SH+7I1HcFEkcBw==
X-CSE-MsgGUID: xBAFotVKSJm5XFhPTWEX4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275508953"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:14:15 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKOhH+jLOO9cbLWgWkPBSgoniK2idj6SIfTmQb4j0Sdo+/wNRUKZYBPofZ3aCxLrZdqp4ef4fT+UMl6k4Uzjq26kJE2e95L161zeIY323ROds5DxlItZa4KGZLUze2rzrDFPo3D0aM38OpvNX71BR5q85uVCuSvDF+8sw5lo3DrATDZ4yzdFQ0lFUDQ5vrvRfCPLrz9p6MTWCAenSXOb+Z59iGvCQ2DeY4cX3TMKU4oRJRynnqF4xCzaFmHYjGLD/sWUNgmsoF5TGkPP08EVBV7/JAyPTz5CI8PiZjtL6DPJySKhQJmNw83exBiFAGK77st1DfuBh9cI5W/ZksIHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0VY/9Ymg48SArOZ/c0lZr7rw4YUh/DqHrmcyVo/QtE=;
 b=eEbUGHdcsHYLuJWoawJHqVQ28K07vbZqXRWeJLgliTa4YHtHhw8mPIErpPj7NEM/J/ezqrwZdAILLWL0v+tbSkH69pJ3ZSDytBkbaK/FDrzWZWGNx8d1YmI5EosMLgfskfFuSOohSNE/aFf2YIHpLJqSKDBmZKFYrnVkxxNx52Q+k1iYBfbJhvK2QpC7P/WfZWV7gOKdqvh9GZJp5trC9nCvth8srsckFMdkI8yNPaTRwEqZy5pOjruB5UhnVwz/iK/IlLGPlenZCM8HvN+/YV7Xlsj4RbPQZOPqZ+9L6DuPd246La0c0QFs5c0PDB4G92LBqyzVUeTIPM8j416Ssg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 11:14:13 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 11:14:13 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 5/8] tools/meson: build gputop PMU backends as part
 of gputop
Date: Thu, 1 Oct 2026 13:13:58 +0200
Message-ID: <b02c2ae3cec9db7a2756a0e3cfb0a6c0addecc11.1790853076.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790853076.git.sebastian.brzezinka@intel.com>
References: <cover.1790853076.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa7270f-9189-4afa-a2c7-08df1fad1f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: tGFezac+rkLu+Capxeduum8cUtPYv534yd07q4dZnc2akLedpfi0VhrWJ4Z8mQIkAF6h5reMwrz0tufBpEPxlTMAbGhhnsxdkIWoRVtIT/tbqfZRSbl/E+Jp0bjsP+b5IGRAiiQcLkpyyOa14lO9Hkaegcf9vDO54DRQPMM3RQirlF6Kl3hj0BJ7PH0MmGk6KUYIH4heMJQOQatf4ruQsHp2/jjzR+guQ7YcPQLo+ts1PgEESOlD4pLclaVFA2k9o1WGOj/J6snyXCH91GRhCnOe8PBj4iqFZwbL+Yst7eCW9hrTfS0eStEo1vABZ1otZqaxeyzU79MhKdc9aoNpxfCBjheIO3s2WM8FBbnGmmXiyMzCF9+cp1LR6I3eoclbGYUWUo7YG9JKFMxSSpym18VdbRfVceZaqlwEhqjMwvD1vFhveYU1hQ+EeN9/sKWlQ/qgN/YxVbzfHJ9jpdS5sfvit82bchu4A3234G4Oq6bKnnz15cWLOHM3TdXblAYcUTwzJXE8dr9RxzpMP6fUpFa9KNQljVjS+BR39PAEeBaC6/UrvLqir09BRsbiYDzKTccvbOa0Ku3aZRSxSwZ0gFM6lPP88U4s9G2lfe95tNyovlW2lHKS7lGZetU0MtbGBsz1TnGoWVuEbv27ZxOeKEfyvdh+m37J2QmEz6BPU7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KqSLQphT2nullumo1xzW6CFycQJMI5F+llWmHqs1JWqHfY+hXCND0fnidlJq?=
 =?us-ascii?Q?CbwrDOQHge4KHyM9MD7Cilc7dc4ra/nX5eSItZh38Fa2p47HLqsU8Pdp7P/e?=
 =?us-ascii?Q?FDB1589vTnCb/duGUOdGTcfXbGnJFfZQXLKP/5n5onMkwnIUr0NMRTOv7+pe?=
 =?us-ascii?Q?uRPscDi7diD8qbq3yE19NjqhdRVYSnDHWMeFA40Tpp6P/os08uKN5hNoMaiH?=
 =?us-ascii?Q?odX8Qcqh6frvTHrCUh/6kRRfPeTfcx3L1ITvAypxdLFC0egoDdoQYpM3CiY6?=
 =?us-ascii?Q?Hsm2wB/g5BvPNabKqhFCR3+gxwfPcKImJ1l/GBSOWxHFx8vWctgZfKHhXAnH?=
 =?us-ascii?Q?fBeW3aiCs+yHSbwYeKiGXjZ5lsaDoHypbFBE2Ev3EsoNBKrxQ/2tGvpWK2Qp?=
 =?us-ascii?Q?w6Ml+nOT+CmGH2IGlUh3ciwNDTzjW3nWhF4ZrWAMQqy6hl6+PYYFThOQf+a/?=
 =?us-ascii?Q?UbTf/cIQpIzPRZ0yN5TYhO1RuA+3jDL9+5NQ/JuyhzJoWKWKfxthEFv2t6fX?=
 =?us-ascii?Q?Q478AvIrfKxuiy7q8w+wfEOOPRQgd5sabiU8XV8gvwjLgQpyXN+Tbq/SfqON?=
 =?us-ascii?Q?5kCKLLi2iZr+PlP41lm81Dqztum2uv9BoIuY7yyppVo89r9reBSIJ+ti37Hs?=
 =?us-ascii?Q?+x4wsX8/ICov5yDo4Va88KpmhLTugzAM7dRwnvLwma5yKO4fsZ7aNj5p38Cv?=
 =?us-ascii?Q?8SBaz5DRU1YFuzjBMYrV3LcIJfhRbLzRhx6BK7vKXM18XAxLp+EK5CgpzoAL?=
 =?us-ascii?Q?7lgo0hWAhw/KYZHK4j/VCIXlYOzAqX9/eYC3VRfE7Hg/NVaunm8gHfQU5ghv?=
 =?us-ascii?Q?FPpuKAN5DPVcVy3h7MeeUQPdomRsI9zNW+JAzgf/QvSpEp6Z4CvrTudBNma7?=
 =?us-ascii?Q?KUA83dl0ssGN652Ketn99QNER6yCSrZ6urSmo+fR3aRV7XErqTxefnm6jJ+B?=
 =?us-ascii?Q?svPhqEyFFE0ZOW8g1OSzHdlafzS/OMhLdQMKMOEXqD9/s/e2y5ee/4OCTUwC?=
 =?us-ascii?Q?IUUU5OyecgIPH3vov6eJUZnj3wWaQcGqEvF4+R7i/wWMjmAK4cwehFfp2OQ3?=
 =?us-ascii?Q?b4A4KKuCwvpFM7IPeRwu1bROoGTvs7csiXmGtHwnjJhR7JHAoRdrwI8vXbmb?=
 =?us-ascii?Q?EeAiypoytV0Fp04Ztlx2DSIiin/f78gnrqZVFai/rck3l4sYzC+p60UL127D?=
 =?us-ascii?Q?cxyYgka7p/30qekZlUZEVD9IxojZYZusogYcpBT3HG2JW6r5fgV9so9b6wtm?=
 =?us-ascii?Q?DGUffCjH0UP6s8tAIen+mAkUW8paQy9eMgyCyWn6fEiOXkE4tCnGzDixd5CU?=
 =?us-ascii?Q?oWhnCzYqzFKMqjvrnJ/8OfnZF3zswtaAj0SpnDhXQMRoT52gm4QY+lFHXOnl?=
 =?us-ascii?Q?k9QjuEOjFvcRiS2p4XwticICcpXQE8k0j41Txxe6eQq459NfxW0dvtbrLV2n?=
 =?us-ascii?Q?HSwyAx6yVuD1gSxAlQNXGosMbDGK1dSfnhGQA5FG8qNGF4KyB8OmvWms0oqU?=
 =?us-ascii?Q?vyoROk0mPSBDjZeQsYhtO3YE6X+n2ns8wR82LiHbY83ASNsCBOEWpxlyQ30R?=
 =?us-ascii?Q?oMJ5zkyKTrxwQhg2QMKV24MkXp5PbiLdmyj34bgNtVOJFwQyCfoqCHIuBg2d?=
 =?us-ascii?Q?6SBDN3NFodw8Z9AFOQZkUuCvw6bIMmnP+aBUHucqu/pG3oq8Vin860cjvTv1?=
 =?us-ascii?Q?WIHZzOnuV3V2UJZn//l9aHxpJI1mr1MEehxpa9JeMD98XEtI8NdnbvWca11X?=
 =?us-ascii?Q?vH9r7qtg/Yxkch10n43Z1hTnR25jaUE=3D?=
X-Exchange-RoutingPolicyChecked: fXu3+LfKW/B1Ddf1C62oGguYfnEs4MClPbU8L5NvgubhT8EAQjs5NtGd2IFl+7BeZd/qDnSnma85qL0mx9SEFm9r4Qf4za4U9PwaXfuJi5gF1CCjwpJGVyfx9u21Q9nPIZgId7RdrXzposghhA8yruwaCf5VnAHcCYPxE/piEIP79TykDIbek/t2EUoomi58PlNGrf7zYqYBwnJRl/Tj9bXGY4ygHsEFmnw55jL6k9wbFOhCztHzbNuiaWVTP6R7lNyptud93GHJdOm+2n7kY/XVzdFROlEHDh3hV/+QncEa/BaOAluAxfsKmFjGxOnnFyOg4nRnLGOmUfdHKW1ywQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa7270f-9189-4afa-a2c7-08df1fad1f66
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 11:14:13.3935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/eVOXodg5mDfvPFfq3k3WQOz8HnHBVPRigzQmqhh5ZcQaLKUPM0YS7c73sIkLpPbS7+UBj42zeC7NQBivZDc8qrj1zbjVlkoj2TRehfN+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
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

Add gputop/utils.c, gputop/xe_gputop.c, and gputop/i915_gputop.c to
the gputop executable sources. Pull in the required dependencies:
lib_igt (for xe_query), lib_igt_perf, lib_igt_device_scan, and glib.
Also add include_directories('gputop') so gputop.c can include the
backend headers directly.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/meson.build | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/meson.build b/tools/meson.build
index 68c31da92..029668b90 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -147,10 +147,17 @@ if libudev.found()
 		   install : true)
 endif
 
-executable('gputop', 'gputop.c',
+executable('gputop',
+           ['gputop.c',
+            'gputop/utils.c',
+            'gputop/xe_gputop.c',
+            'gputop/i915_gputop.c'],
            install : true,
            install_rpath : bindir_rpathdir,
-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
+           include_directories : [include_directories('gputop')],
+           dependencies : [lib_igt,lib_igt_perf,lib_igt_device_scan,
+                           lib_igt_drm_clients,lib_igt_drm_fdinfo,
+                           lib_igt_profiling,glib,math])
 
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
-- 
2.55.0

