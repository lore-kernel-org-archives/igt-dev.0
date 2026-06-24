Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ACACDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1550010E087;
	Wed, 24 Jun 2026 08:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+IPW/en";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FA610E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290877; x=1813826877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=N9jrNpu1uAq+KOR6G25XuDHT8tBMTDQFo362s3nktsU=;
 b=P+IPW/enIPTsz7T/QgNtAq2AVGvLLVz15eBRTbaeIq/66PEZMvTvbBXR
 cas36b6sZp+8C7PEggBMp3yiBrsQ2j56Nfks3XKh08qlm4TFd86rQ9gVG
 d36Qi08TJQJ9TL/IkKaQUsjkeh9MSx9UsfWkCPSiOdUQyYRf6nRu2Mmd2
 5wzcoVvoSgkNB25OgsAjoROhwUJtuku2LDHIH26n6lOzdsENzcQIf+0nZ
 k5WLvNPuOaX63JlPn9AP5yujmpGjZQm7vyWOldcQ4smhGGT37pLAQYI6m
 bopurQWSnrlqqryRLbA4VztFAVlfeVR0bvnS0wGFZa4gHlzOxKC7zhLY+ g==;
X-CSE-ConnectionGUID: EG7CCYozTJqkyaET7kAr4A==
X-CSE-MsgGUID: 1zu1ApFcQuqoRzBRzN5bAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142281"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142281"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:57 -0700
X-CSE-ConnectionGUID: UF5Uo3aVSz+C/Wabb/w6aA==
X-CSE-MsgGUID: 9hmgm4E1S5u0TMHyLLCJxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="245432178"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:56 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dj5jlVXBg87Or/k9QRL1b9h4cuM+Oq3gFPcSAxs2uPXcLLPlgObf26OQCzMhrxzf0BdvgkVYOs7evXOsqJMBvX4ar++X6RdSXbWUuafyWDd0CeGm19h0vWVBgrCxHmymBVpAdBn63hB9y+9j+Oe5D0jlhcv/SNKrcP5T8vrqUKMhrmfUar+kGAVplSRSYr9Y7YdFPkPcFGd/UxHpTTi2MHWGHrjyulOtt7zoEDQt0qSFhmhUI5sR2mgLC6rYXFyNYzpnHk2eCCt14Y6H3wFIPhM/06B0zyTwmgPlS4a02i9M8oJ/YzZvUOBR898odtjGdOSQ1otreKgrT0wjWHsIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9wNDTFxx89EVO/mGJODhs2eklKt/dpIJFfvDY1JSgI=;
 b=kRkaeRKtpnOSvmNyk+3GtsAJrKuZslFvNAGq920AlR7P2lapVl/cr6X6jRi6kP8TWYUh3JjEhtYUHHvw6Lzf8VU6moBmwP2AkjBJ53PQGDR0KmHGVKvgdudSCSFw1Scz4t2Cob9pUnV1lPfee1P69PUGgkrwWB1fQ9r9SdEUnxw1J6PV0GAj5yyOhZILq8RRz32EoujjGLJ7lBCUghqyFRc57IKAKExYh5f0tRPBgA7Z/x8VGamzGCrZftnilHuIQ0Vzh/choaYa5DFGdG8xEgXR+hfNDSmGvdjtvGP/hIleUeUGx2gwaKDnlyXHARWIuVGGZcENooXLLlyLFvODjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:54 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:53 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 16/25] tools: intel_gpu_time: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:23 +0200
Message-ID: <b45ad3a82a97d5539e9ae619b26b2605bb8f6baf.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: c1049a46-b33e-4b88-0696-08ded1cd47c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: He2Htk7HPXUR8x3ddjGEaIahQgvG973tOGMJgRtABFIwEiv6X/r6fd3lrp/XMqHCO0I8m3TRbcM74ZW5fBahYUmh6m6xr1k1+lytla0wAEQeaJJJaw0PTo0CrjKikK5C/YjxcT5MC16oSwyVPTIQX+Ga+K5zLLqyahiqB8ARTIAdzl7iJsat78bPC+BoXpw4l9EW2Y5IPcZh2yr6rBTantrMIMn+Db09CTjU2lgiAlin2xsKaeRfdJ8tHMz6mj4i8/YbIyeELD5z/2kLsbAHvLhjaqCui2uUETV9sJTXGfqpdI+EzRr2QzOgi0GI+5jAm9v2jN99DmvUlsNT4rDBWS56zSNluDRmHiTCffIsyrZgYpMNRSoVVs2+uJ8jz3ni9Rdobs+O0rhMJev485Ul+lUVadZ5HbzXRkIibAAsZa9+MzJ7JebsaBkdCoUlPi6tWWokoQli7K1Pq776a/zWE3/t7hQRty6Vt4BydLyu1qrzw7NlBgxQPEbWCIxWzn7pbx/yRyVOOIJOfVJFh6v2X8mICrKcihEO8GNtUAggt8SHeQgLMBRa/LKZtfLdE+aFLWMGtEppJo3e3E5YMc3yVvKiS4Re2v4VoewPuQRDgUL57e3qw0G2DQhDZfJn7Cf7U4CS69dtjhowJPQN9Q/fILA+KPys7r6a0XS68BchsFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?plZL0A030v9zGk6GHGVZSZKOrYGIzURTY/N80j7hCt1Y+76YTvBQAf84YSmq?=
 =?us-ascii?Q?EXD6P/j3cTTMA2UY6wNV5zgDBE0I21ywnYOOv9s0TqGkfp5/qUI3GxK46iEY?=
 =?us-ascii?Q?YOZN9THay+sPjVPaX0E++ShPmXFbOWOUuFJfxh9JvyLjhyNbGGx2y3X6+QTO?=
 =?us-ascii?Q?xEdStOqzyeI7tDlnF/j8CQqb1afHfGw3eNFyf9yul2lhcjX9OeFKuZ5tZhIt?=
 =?us-ascii?Q?Dm961ph/VGnRqW7mWfyE0Q0v9CXGYwBvF1Kd5kI91FJJLsmDh41BwAMcmJ91?=
 =?us-ascii?Q?Poox622gtkeQXbci07JNaeZOEimKQ3LSc4dSG8bRoJ3tvoyQS9JSyfB8VVdO?=
 =?us-ascii?Q?Y7Bd0RLSNhUhmRF0MqPqsRerH3YvrJ56wrfRqjKJgou6+erWRJ7JsPR1Jwj9?=
 =?us-ascii?Q?CQjx3fM1K6zCiE3z8bSwXWA6uZ+V2ULvh5v4VeCH/V7Oet0eIJ3GK5leRCWO?=
 =?us-ascii?Q?ImJJ6dG5heK5SNvedISavgz0dHf0ZrG9fFoi0A6O8pDFjlB1WyOcG2K7r2Ty?=
 =?us-ascii?Q?jJoZjnIXqI3wdqV5/VGwSmF55wrSNpxKBIe5XTH9epeySWMSDtUXQUK/FeKY?=
 =?us-ascii?Q?G2tbFN8zVyK2J8ysqrExunoCjBv/kjLZenxYXkNVJgpZGYDsCee7cmLn2qCh?=
 =?us-ascii?Q?XGO0zEY583esyWHGnULh8oI9mEEN+/Ox2muJCkUiBfCI/sTaTIbnIUVePj/d?=
 =?us-ascii?Q?2jylS4n78BfWzfuwjSbh1vT61aDgQxUsI+ybyPQ07VXyWsWVLxbZKfHg6IND?=
 =?us-ascii?Q?GlTAb8pSOOxgfiahvNLOQDWp6HVdn+u/KdFfJV/jJpNrCIIL/gfFNIemlHBP?=
 =?us-ascii?Q?tJxC6oui4lXPdzP17FAFPbo918Ahf1DXXPNPWtIXrbSEYo/6CQLo3nDnRsvT?=
 =?us-ascii?Q?iwk3NlhkF1XJaZcTrRoNuZeOEPukH33a0UdJttodtZ/HUOCJbMFPd30veBHT?=
 =?us-ascii?Q?KqCDaG3QA0nd2umK6HNtlD3HMMhs/e6x3FcgvibpVKf7IRYCZ4HMsY3S7UKM?=
 =?us-ascii?Q?+uzJ6DxH0+tW982yj2QLizYSZug9Po3rPlQVWDiVNov++IuEBoVkpECjVQ3R?=
 =?us-ascii?Q?LuUNZg2+VMuSOWkWIyrXIzp6jmE2sJa+sfKWj0zubPAXYJHJV9V4crSiQsE5?=
 =?us-ascii?Q?AoxL0tArahu/HHlmgehbHm/Hxb4xtkkZGlJGrK2bRPt1zSttzz5Gs/FxS31N?=
 =?us-ascii?Q?H0MSzwbyoYU8h8MzeCZbCntUzand5xoU2hy0eTjCAgoOaAgcBCFfUrLJnSMB?=
 =?us-ascii?Q?dceYaVXxuCZrrkIM5mRtFRWDOetrAeCl8KIW+At7PO1OOw3b+YWkrQvXOOov?=
 =?us-ascii?Q?8PnyV7DWv1iWz+opHGplRZMMKqTwdRDSbDUo/XOtcxEZd8IeYOvOLIiKJQbi?=
 =?us-ascii?Q?vzwPDFMCQ874SsAAoCs/CgoldqquWpl4zCBlyCzReCJdDhp4DSUHH/H6EASQ?=
 =?us-ascii?Q?+lgShuZ5dQeh/9rwvkXE/ctIVWlHVjvhh2Vql7nGacoWqPs96PKHHww16qmJ?=
 =?us-ascii?Q?fBghWfsTVSPqBGW9QtvIMlTDJs1zj3i75Va/6GkTMjexD1CXBWIkBGnHHVyw?=
 =?us-ascii?Q?fI12OoNxAbRJD6qyMKN9XnSxc/zeekHUPqaG1hDW4o3u0j4DjiMB557ITq67?=
 =?us-ascii?Q?yOF055IjtgOT3GAH+GdAfH06M8Cu3ztKVFCDz0n5aUUTr4ZyVZIBtiUWPP+w?=
 =?us-ascii?Q?WQZxh640tno/bJ4opVwFvn9aFR9Juy2va3/mbHARByQ7GbWdh51NWjXekiRf?=
 =?us-ascii?Q?bLNvRIDFglgpSD1chu2T8t2vbF0hkHU=3D?=
X-Exchange-RoutingPolicyChecked: h/RNLigklbM18ixnQHrAc0bB6+0BR5R+8DuEdTv6ixduumWArFSvAq1XRstIUZt+h7TnIB5lGkZympMRI0iN0IkKghNSXZs475hu7bRIfQwR332TT7hud+0FpdJJ7vTmQqTYHHjGFxisOPgIbi8lt9QBt9lcevOtte8Y52KBSc6YLXgFKb0Zw22RZ3bMeHof5/td0ljobMgfGDZRB/tNl0OhM7VU1iS0nlNtDGI/Je+BHiiU+0K0lBD5WIwZ/1QmDkgpvVnKMFM6JHNZIimfAASA3hJmTRDVHvZUh9qIeS21X+PGi9eU9e4da2JRzmo9IO/+g+43mDMOZ5X2EHJPhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1049a46-b33e-4b88-0696-08ded1cd47c7
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:53.8417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDuHWOIrp+Iao03TUB3VcYni2UJIfvpE3NNV38sgR4fO2qw/sBqKeLkV/pg3/jdxM1FvymtcKYZftIkmNjq2cwCBayspKxjok2p3s1gUPus=
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

intel_gpu_time only needs the register/MMIO helper subset, not the full
libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 0978f8f11..2e8ceea36 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -21,7 +21,6 @@ tools_progs = [
 	'intel_display_poller',
 	'intel_forcewaked',
 	'intel_framebuffer_dump',
-	'intel_gpu_time',
 	'intel_guc_logger',
 	'intel_hdcp',
 	'intel_infoframes',
@@ -100,6 +99,11 @@ executable('intel_lid', 'intel_lid.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_gpu_time', 'intel_gpu_time.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

