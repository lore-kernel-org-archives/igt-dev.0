Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FFFC44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED80610F028;
	Wed, 15 Jul 2026 12:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UEnFjJGR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A39D10F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117760; x=1815653760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DoMqO3JFA4N03qTjPybM1cIPqfICaSSApWVESMNAGrY=;
 b=UEnFjJGRBvHTlZOoQVoeqhuniSrEfVMG7eCMii/Uipmz59WOu3JxBJy9
 5NNLhzHrTRwL3k8D6Fjy7aXo21fxx8q15UomOEZ4a8X84tsaQ2rej9kzc
 w82UiV549CwQSlBCwIeAGJDWXixoPcuoJMUTaKHGYGbe4Xbt80YS3g/Tl
 g+rk0G6QwyprHH7Sf3Sao0EWlR09hQ2rTYmCEMOpLhV9NNqbCbUxTNWZQ
 4l4FcCQsX+/l7hMURc+kvHWB+gbipe83X3pzoniZd8VLZfvXl6zicrD4K
 pxYxAJv6doVhOkCK9AEj52a0zug3QQnZ9HdLElBhfEqUlGIuMCkdJRXT0 w==;
X-CSE-ConnectionGUID: 6m9ajEh+Ra+HuBOUb1ZR4A==
X-CSE-MsgGUID: LIyV95OuRcWRZtSUuSmzCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95108138"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="95108138"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:59 -0700
X-CSE-ConnectionGUID: giHzEpqPQ7mcKay71hm+HA==
X-CSE-MsgGUID: q9zHYxpKTFmwt4RHiGduIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="252210317"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:59 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7ZHWvm65v8AyTOeePrkS8nJD8R8NkhVMh3hbtei2eK+o8p1oHs6XDD2dZGu3eU65UBnibgBeX/b1HHK4jGHTBmkO4Lf5FOLlBQ8pgpwcFwnmEO7Excc5fpWlZO1Xg//d902tcibVbOoZak4EfuXoxrlV/G5Mp134Vx4jmEOnWrvfycyM+jDfXONBxqYXlJ9T0uOjgcntesWKfx6IdrnLgapPn1gCL+I1fGu+eBGYlFmdfw1rmeoUqKk6HSiwMoc/5w/5Hf6iiowQx5cgSgp/uPuD4OKH1MZHvm5eTbd+i5yxeSyzjN+67EOgl0Wd/VWSye4xCz8XotTp9yL9jI5MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyYMXlUvj/tSG+s4vN98kkU5b2ohqq23sA3UVT5wgNU=;
 b=BX6RAOy4bsHu+U3CzW8gSWxtCcuOjbIEUIAKFH8AjWLVGRTr8zz4iShnUlX3zjWG1TJBcse/ReKR9mhkKZGEQohRRLa3bSrc5aJOVVULSdUPFfbTTAb4UL6dd5/KX7ogoWZccYkVEAQc3WHzFx0K4XLFx3wcgxMQ1NFxu05uTolZdKWOG7EzHBf0i2qxGoa4sjqGQHzNOY7xpS51vkez1CzSZgcAN32OnIg7+Emw2tqg7oOn3eElDUZIWiYTipP2zqmJtBeiFmffxB483re27Ah0zpKJc4yyGdcdmoaZMfNesdZzWW8oJLZq/ZvfMtKmyYifpSetUr/7XkfD80jibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:47 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:47 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 22/31] tools/intel_audio_dump: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:32 +0200
Message-ID: <ff8fe734c3988f904167f49964cf7ad579128ddf.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: ae06fa87-c669-4976-9662-08dee26acc45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: jslzh9i+/XbtKTXYMLW+gqo9PO6zepWlVocP6IThffrjuh94NIJP8T4pX16DeLcf4gKkJ0xffY5dZU/zwc1jP1i/DnebATCo6dirEYNgcSw9htD4ujL2XE17VWc06TpRANjs0QUfbPLxDR2ZnJfsIUELR2J7LqMPFcEtze4YOUTwAOMN4gRbVOs4eaDlzucskM79bxOw7ThbmQRzOIRxiG+oDsBwVS61s1EIN6JXbTyKOjbY/NsTu4+ETqs1Kx1qiRKQJVuPB/Ny4D4YfLiRIxtpJ59a2Ttn1BEgLF404n+9NWkCpaooKCot2jR6gCzVC6GZzEWH/GeT+kPHy8MzQ+ha+xKo7Azyoeb8hyWpHXoyzgOZSINv8mT0Ug4fmkQUgFmOgUqXrOK7tggHJ7q0f2wuHh4I5CwmMo5jQ0x4Me7rLn7tIICbaLyEqNv8SXXya7nMrYxMHTAheN4g8GA9t0ma6nTSiaTd8rgtGbiZRXk+sRD4n2fOkLdxBmngG6fr+TFQ8JrA6STzt+BwwlQWEoz05ctIK8DNLinu5Ga1uduqheJSTve/hhL7vm46cmq+HkG4yVtfZanrzYcutO6ZjsbIXhSQA+fdsuXLbTnvCGzCPGzFMuK+2UfS5Gsm3H7nVlzvUYjDgGphgbQdxvPSaFpJHTepFiLaQhCX2mz+rKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gmz6pmNTcP1FFrVKpxrEU3zqDojFtCSudML7XSroCFeOsZRwufOm1uD4lUWx?=
 =?us-ascii?Q?xG17z/Hdilinb9LMSy1uBUiUfNquae6w/bNnFtShtiJU6y4Ew/KN7xL9r5Is?=
 =?us-ascii?Q?5vj5wqk9CcxJs2L1umydwJg6G/p2guUKAHuQbeNEo3DY3EOizE/+nLGGAbcE?=
 =?us-ascii?Q?VCnDZxx32nMwDoHUFBS32L2+NvcNt891KWTdo4luxpig+BpR8kl7ykgReCXC?=
 =?us-ascii?Q?MU6pYM6H0kZeyu6z9/ZrxkICiQpuGNbOCVSMHz2ww7ygJQ4ZbpyUPHt0br5r?=
 =?us-ascii?Q?wM45/EOeoXpPKmqdg1YXCMQPtvyvQEieviOptp6PaWxyAqZSqUXFL/yNLqGY?=
 =?us-ascii?Q?H1mnt3QHiz1LRB74iC+UI3hSRrlsB7FLcX/ITGs7seMaLig44xu8wDf6Yd7i?=
 =?us-ascii?Q?5DRfYmTPyyBA2pT2CAnG2wtDVNvjPSSgYuBnoLtGCMYGC4xrMLtJqQpqgEAu?=
 =?us-ascii?Q?TeEMhlQW9puxDoHwmQaVMyyiYW90Hq31E4MH5sXhmISkEsmzSOR6lqTNeCAA?=
 =?us-ascii?Q?U0BeRIwUzM8XwGF97IT+IK7FNhnLBTh4pXqHnktpSuZeFtUw7lLJe3E5h7rU?=
 =?us-ascii?Q?7dsUPx5K1u66Owc8tsZyx6fCs7XgKCP+TfK4Jf8ruJO/9i29/msjyVl/irJD?=
 =?us-ascii?Q?P/qxfbqyPbCk4IeHcw/n3J6bKIRKvEkqQTFll+WvLHs+xGnDVIAtefQDAjyg?=
 =?us-ascii?Q?yhQBqsGmp3S+fNY31M7cTvs3zNjBbYlRblSCtVWR1AU6Lyya571KR9BQWRYN?=
 =?us-ascii?Q?2CHiMtZExnMxFBNBz5f7uNrq4AuVxO6dsUtg7QiqvYQQdTr8FSTMxCKuWJ+9?=
 =?us-ascii?Q?dkPye2nkB8tLP9KAzyFKySODcekuDMaSRoCZzhHaF7EFaYAe/CihZ3oCkO/4?=
 =?us-ascii?Q?Iw5QC4ysO7NC8fIzAE67bwKT3o2qTqKAVlgIVxoU6HkuGlTO6rqT762mHNO+?=
 =?us-ascii?Q?cq1pnZ3PdjcgqSZH2qLxsZeGmcbQ47VPb7PuGHLDMdqkN7YHXePApci856EF?=
 =?us-ascii?Q?N3Rfk7BS73zdDfgkmAbXMtJKjKt8LcSd4boAtIWDJdK/SQ0X7ZMZsDNTG7Gf?=
 =?us-ascii?Q?z1t/k5T3U0ifUO8w+9dfPlVZ0x/Jyd/qbYOGEqo01CLejghMbqQgwGLxjylV?=
 =?us-ascii?Q?tvKG49QLC1SCPzDmDqIMJcveBFZ0BAoraHps/7DQD23UzpTXqxBJF/vTVcYj?=
 =?us-ascii?Q?/i50FKtHELpk4QjRxygXR7XdKNKIlfObKy2OCjRN9Z3Rt5ZXuK48ELRi6sCL?=
 =?us-ascii?Q?g+RLSFO+/AIt+yrMsHQ5Tb64JwHmGqh/szdLiAq04o869N886ExeRLuJcYHk?=
 =?us-ascii?Q?24g9j4YGAX+OXh5WxqNE8OhsBVV3SAB3r6mmPEpcXnmLPy4uNU9EMmHkvMxb?=
 =?us-ascii?Q?aCTjHLm3gVxhcVQD/vLYXhT/sPB/SOi4J3wNrAA28Az06wKqtijDNX1N+St5?=
 =?us-ascii?Q?D68FZ8En+q/QblgH5SHWwi8tj4h9P3HvtkXN4kS4zWvqKGx28112BEh1L+KF?=
 =?us-ascii?Q?fe4AZ7dALXgY7mJmPnsCnO4JFyCopAu5AzgDUdpC8YjCSLODX8mPlQc3r2Qc?=
 =?us-ascii?Q?p0TvY6aN04roYOFermdbKP517Ru2uD9uiBvs8G6IxUe5rGen4LiKYd8jrXPu?=
 =?us-ascii?Q?goejO79fY217R8KPiWHgzcR3e6BZ60zHZOa/AYCUw6bt5LqsVYUFDLGH7Go2?=
 =?us-ascii?Q?QA6TPrM9EPk04DM+MPQ4iGdxG9Qi5kZacAVTvS1tNxgYNPEvaNPPCbTWYob/?=
 =?us-ascii?Q?CoPryrndVeTYuQWh5NPm27upDFsLgjY=3D?=
X-Exchange-RoutingPolicyChecked: R8Qj4B7l1WRDAvIKjdkAS2G9PmafOxUsCDOWF8RCx62xZiBGzQslZEZzgeoK1cJM2bn98WjPTD2vX76aI1SFKOLj4T1O/uA4657xs5bAYNwinlBC/gPx6CXnGXczLSQgDXkj1/pG6qmk0I86KL2u82fwQAtu46Bmc+94cTr3RTuOefyIFqFaBQeyvpa+0Yie+d/B3ay1Ilco127/XbE440tpA6YdiyDQAZXIRICjuxz9azeKk3z4/vLopT5dSvWZ+cL9D91gmJKmMLN4vXk0pVtKNJFp0Rq4PFF7t/MoyRfAphy6VM6wXG0Rk7sA4zhWiG2nj3N5vcLPQZ9kWKP3+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae06fa87-c669-4976-9662-08dee26acc45
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:45.9042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrFiTu8NL/5NHWzgyZWswJ8B81vscgmD/BXEgT34g4gmCvgZTE0r6Yvy0h7NLFD4j36tM8iZK8i8sdjdODf69hvAQDcTtTW1m40Rzcx2Dx4=
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

intel_audio_dump only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
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

