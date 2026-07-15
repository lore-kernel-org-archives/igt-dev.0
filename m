Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E17C44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:16:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4DA10E194;
	Wed, 15 Jul 2026 12:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9VXY/XH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8ACC10F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117739; x=1815653739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BrIPP6Qal6+t1e9sal0VNR4NCSH7B+awxEc+IsYK0w4=;
 b=W9VXY/XHI2/q/WSia0+IjQKga/Kku2q9HlG2URrQ47M8qXiw1T627iys
 +vy1M1fptGiTVgheK9hw9E72QX8E4NE5sOiqtJ8+DpHvA8UwcC1wvCOnO
 RhMqGGwSOUX0Ga53KgAHcIoBfLXLMhfDuUsa64EhcROmkfl5RA8uXhCPA
 ZvZRFFX4cMhV2P/OteGyyZrA1Q/cM+nQw84Nvb0u/Lu974ZvLzwk2EYTf
 +8IeM36b1SeuZOBQ1GW8m56wTEqCz15wvbECT9nmh5Vj41g+rVje4ZESG
 C6UBwzKfDwLRcV7tbCd4hSnvLxcEPt9cKvGMVGMkCW/agcBpMPMQokrBX w==;
X-CSE-ConnectionGUID: fDnIP20LRgekZrXPMmUI/Q==
X-CSE-MsgGUID: 9M9sue7lRb+5/JN1LIEcXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95108130"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="95108130"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:38 -0700
X-CSE-ConnectionGUID: E6a0GbghSRetPcfpbLr2mg==
X-CSE-MsgGUID: 47hVi9ugT6aOlXmLESA7Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="252209938"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:38 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBy7g+tqJp+y8/FdVDjphgD4iWA2lVkwl44DUWyJFtKwxVN/Ls6KzVlePpWfmyKU63yjOKRWh47wFeD4vN8Dg21tGDViUPY11q78Q3DYqUkaJTf2ZWoXA08VdORfFf0/WIJbMmjBere2Ulq7SlywEFEk8aOYXmRHrtA6/wLzKnMlnF2nIx/VDWRZC36g2rHhf1W+GLDjB/9B03uM/ikI3HtRrr1C3+gMOSH1AKlkMSOJBgzdNEH1ymbhLv7AcU/rNp7l/gS3jAFDUcFIrFkJqGOPrWwaiyNgP8gfWHiTfTsuvRummybKpH1KzdC5ZwlfmYnIctePGanGuvW3FgoeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwR8HcE2wvlSu+49dBmbjK88NOMU69Z+mNci2oH+RtM=;
 b=Pr34EEjclZ3llFS5gRCsBiSxjaP75G2A68Z1+tpOXlF8GealxSXhfjiQG724HR4LNL1AyEF5Cexjbefx7h+JINvSiNfM7EjLealjyMMAd9NaKtgDEMTTYE6HyJOZGjj0iQG41oQR65osbAgDSCbig3VygmaG5csGCV6FXlTwg06Jdh5xX3dWisREyZMi6MdbkrMi4rhe8Fgn2x+Ze8+5uL37EcqL8OI0X59J+MvUIcYSKVd+RBA4AM/R1cECSYJzyBtDIM6dx7C05abnfd4TUJyVNEQ9F6ADj28HaZuQNNBY7XcWgjjVntCogu1F7MPiolp7ZnKM7b3l3ZXShzxICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:35 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:35 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 18/31] tools/intel_vbt_decode: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:28 +0200
Message-ID: <c138a478549e5f03500d69da61d17597601ef82c.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: a33c1fd5-aafe-4989-e857-08dee26ac5fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 83q1717rIeLEQFkF2v1pG3nTuXV3rBt0o7Oai1+YnMBwQmtFf6cYFcdixFYKQquLhMI6lSSIOkkxE0l82+Jkz0XKWLqQQPS+LUVl2JUX5zn1NWxBxy3KcdJRFOH2LqACNQt9HXONnzVHwVYzVqUL6mtP46nyFiAcrU6PRHXjaYrb7Bzw24MqoA3EdAAam865CDWgQcuaR5+CEx+x9HnO29MaX0w0+snkb6NuTgMpV8mIRVfZPr4B6CuiC0uJ0st/ZvC2608iTY/M1OXta/LZnb4EW6tsEJNvlfz3gjYjY2w+Ch4bGPy0LXQRSUpgnMWbBzZ7BpJjKijE7acFnWWQGxSGljMx1q67u01O0e+g/B64Xa5JupTOBlRqcvvmMPPMdulk+NRDZ0RojmC83ybWMSc0KnSrJhP5pd6MDatzE2+E7DuzdooIxR0rP3STpaK/DQslmWTA22KEafJdKqyG9LsLFwgNi5mneJaY3DUyU6YUqkW8xbfNsY0dPVvD7HQCw59Ec1JkCndd1qYT0nU4XLSeMDgV3CiUGaL76qZkzvxo8jPxrnQdfbS02A3va9+lbeWCvi8r9Y3UAHETbjYjl1yPdy6KHPglF3+WxjJnj9QD/qzSz14R1jHBFrJZ1O8vMDH+fgh8nTTeUrs+5MLVHNJKQFcSVHmPWuUh9ndWObU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VzKxhvf69BH4nYYXQm9WqO0lqS3hVsjeGu8OZpiD+hYGy+0EKXbgnAhL3TYu?=
 =?us-ascii?Q?ffxdn5sGKs/7bguUXjr0ybxnIQZ2obSzVN2m/gUfwoJOaO2vXpKcvfURedlS?=
 =?us-ascii?Q?4P1pc0RNq0/qsmt8pIEYRZD4ooLYsQPbyuD1W6+mEOju5BhBmxMkQ1gW4EMb?=
 =?us-ascii?Q?ls1obk2LnUAYNre5lqzdZCYlyzHZ3qNyo8Z+xAX7PaiKchw3xQrHuGCHcvrn?=
 =?us-ascii?Q?nPWWFtFDacqp5HPkStBn+XOds2cWBZ8dhM5p0bFMy5D6/MlpxJMPEd36k45W?=
 =?us-ascii?Q?IW5hPWK1k74Im1z51AgPcTVC5dxT/7hZYg1fwOSTOhyjHPY5Ir/0681if1vH?=
 =?us-ascii?Q?JmIWHZfS+DJESiivRVapwil+ITNDAaB+Z7Y1X0YRZATxe33oG5YZoROA6MX3?=
 =?us-ascii?Q?vCtPuzJt7qpiubmq2TbQ8mwUwKc474dQwhbZN9P5MtahjAYDQDctU9XQe0XS?=
 =?us-ascii?Q?F7QnJ2Bav2NaHDUt/6s4E4WBCZpuJYg5KqLNjZh9zGEmVXWLoHuFg2IADV1o?=
 =?us-ascii?Q?2YwDwL1E3DywM3gomL8f/RjavksxjRWzKVGuaKUNUvtQNZpS0S6163fteo+1?=
 =?us-ascii?Q?tNqd3YDz59J0n8kMiDkXeVybJ65z5km+aEA3vAGDdTMcH1z+e58/kE+VN0O2?=
 =?us-ascii?Q?T3PaQwV8ZSXWHx5t7y02nbA5bzPmAi/peoFTm1doNI+1xgZ887olNPJmsIHu?=
 =?us-ascii?Q?WrnXHBb14HgOw4wHbABoJ6vfFUH1019VF9koxxWUWEhsbxSGc+8VHFuhP4Tx?=
 =?us-ascii?Q?8sDtVH0NoOP+EKbImtgbO9YzVqirR33DJ2ygdCD5S12+OM3NPgaKmme0FGgE?=
 =?us-ascii?Q?gQMKySdhS4hTQvlSxMC6oRjOIZwmoFRtrkg3JsoJoy5KCooh7YB1lJlbua4S?=
 =?us-ascii?Q?WF11n1dhjHH5nJVITPswM0rs6V/Ufz0GULwduOaPXoKeOKThuM3BLWGe2cTp?=
 =?us-ascii?Q?N1CqtIss6D4bWpdT6GdBJtF4X+bIqQxxU1kwQKJWQrrUhzZmSClsVeMVhAMv?=
 =?us-ascii?Q?eoKoaHPRASyJJODldMUB+g/iM0bvXN2cHQ0az/QdVOwRlQREfKK8pSlhjz2N?=
 =?us-ascii?Q?2hUoezQtmEDFElja/REbCabx6z/jVhbhpVaK2v/vpJXevTVm+KRnW+Gn9XqI?=
 =?us-ascii?Q?97dJZNVlXv1KgM9885qrd9D70Q0CaJLCYuvM0TN0gZPDSq3Ba1jrtbUzPmsy?=
 =?us-ascii?Q?A08BMdXEOSwv0FOGvGDSPf3lUQ28zfcCfSSgUbdO/wka/QUoWVkSjQBJEW6y?=
 =?us-ascii?Q?2i3YQYrZwMZv9jJdjnL22TNoxxJwlRQMuP22kXhk3l6e0QUYoCnWX80o95RO?=
 =?us-ascii?Q?JgvnsdVzaIZcIWP0aFc5U2Y//mhI4tn4x10ZLDH5PNdey5YjwR+int24fxha?=
 =?us-ascii?Q?wwPRoYD+ICTyT8zBk+v0Nn1e9yb4Ype8fGCOiLS60FzNtJlAwRxJaQ29DrNp?=
 =?us-ascii?Q?i4s8hf9K9OBcKgedDJrCNkBqSjmtK6rEhjFIL6y1h7vhilKSj2Jz4IZs0mNc?=
 =?us-ascii?Q?JN7OEQaAeFEpKUA8498gNy9bkpJZJlsn3qKwVS3xO1K/LiGFBKUO9gBlO3Ax?=
 =?us-ascii?Q?z2ySwC24PAJFvwGSHACC66fL/5Kj9n9nHrTCnXrJVVCpY5UTCOHP8jfPwO07?=
 =?us-ascii?Q?MvWRmKXTWFq1E2HNP4GS20hK+Hjf9QR+R2//J1csj9mJ4KDAhlMDl/lw6obF?=
 =?us-ascii?Q?Acg5n6y9p3np6+ZqpnK8UHrJ1h4alEzeirTkQDMQLMlRncgVXyvsmlxXx2R2?=
 =?us-ascii?Q?qLsANCXSxvf5ODYJR1loIA+GNmqksSo=3D?=
X-Exchange-RoutingPolicyChecked: BJdpsyO7WFihEiBR2tuUC4C2kXNz93LMYS0N8ZEEIqRQNtdH+Uzylq5YZ1rs5u34T2qDmL+2yWCBqgy6h4rwazNeXJ9bEdGbjqebhXm/ausZCkL5iGrb1QPXxTyTDRbK/6z+WFlGRE8ocULwc2AWjOaFHXkr/RbQ14afl+Ua0oQW09UBUBfcmVA5bGvB7sX8QONB+z5PAxFRlo5c+OmND6ZPDrd171Baji+V/usK2XN/cZRxZVYpsGv5dFZqdkPGxtFIpagOu+1NU3oIiUDWY+J7Xu6XoGdoKWwIeBCcA8byudNJ68ZMtgj5rV5peU1ksD/SlOfpeiTLnWd127D0Dg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a33c1fd5-aafe-4989-e857-08dee26ac5fe
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:35.4721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZCrAl+obBOdYSIcu7ycrUHrWpu50s2obmffmsHVUlo+eF4LL3hb1O4QNRJWpt69+9YdVDQgCNmkj1Wo0NWzpgildU8jQooc5thT5VvP8zM=
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

intel_vbt_decode only needs the chipset tables, half-float conversion
helpers and the lightweight tool stubs used by those helpers.

Switch to linking against lib_igt_chipset, lib_igt_halffloat and
lib_igt_tools_stub instead of the full libigt.so stack.

ldd before: 35  (ldd | wc -l)
ldd after:   4  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index b04754c5e..46cf1a717 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -34,7 +34,6 @@ tools_progs = [
 	'intel_reg_checker',
 	'intel_residency',
 	'intel_tiling_detect',
-	'intel_vbt_decode',
 	'intel_watermark',
 	'intel_gem_info',
 	'intel_gvtg_test',
@@ -88,6 +87,11 @@ executable('intel_error_decode', 'intel_error_decode.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_vbt_decode', 'intel_vbt_decode.c',
+	   dependencies : [lib_igt_chipset, lib_igt_halffloat, lib_igt_tools_stub, pciaccess, libdrm, math],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

