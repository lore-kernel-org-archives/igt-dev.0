Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3C2C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8E110E1E5;
	Fri,  3 Jul 2026 14:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uod7RUSz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669E710E2E7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088934; x=1814624934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1qI3tCrWkc66Hn3knIvDq7hxzgU8ILOMV2DsccxEqHY=;
 b=Uod7RUSzntb01+NVeKru+ctaAOJkEPBtmDVxcV1Wmr5m7hOzHv2/xGiA
 bN+RCKeRG0uablxaFNouZSqCNWi5l1m0Iam9Yia/e6AQ8UPHmYPs28nko
 UxG6aCNiAhh4kNv/BvAYtdOF3q6kv0qELDbCNo+8YPP9JXVe4EDub9Ru3
 rjLWO8mm6/2X4bB7U0/vQQ/jOs5j2r5AiyotC+V+/4nbFVU/qQoJt8Zpe
 CKfuure67jSVrJILRsJKAC4X9hDBVcGE1SvRw0vX27qQmWwAO2UndWDdj
 Wg7mYYKA97oqWOlEa+o0vKnM1lFriIlQOV/vDOpBBtY+xAdhVibHhB04c Q==;
X-CSE-ConnectionGUID: l6DLlTqtTsKvgLyr6/Go8g==
X-CSE-MsgGUID: HTfpiPvcQwyb8K4ZD9gelA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87523750"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87523750"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:54 -0700
X-CSE-ConnectionGUID: VhOA2va7Tui1ba9xTyzPag==
X-CSE-MsgGUID: lUfUWPOpQH+oUZeGmi8D3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="250476108"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:28:53 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfdBlSkdqo1UV9faN/5SHGDQk7ygozYqzhnHO/N7XabcGoVPXPoWco3eIPjxkSdTzGM/jgkvPMNecesK6zUbD9sFbRwvh+5PPggwVqh9KnfQxb7o436bfHQ32vBXFp/+HGFgoMwnJdBBP+g3I+WUluWN/Y6/9dIhX8UZxKHoMcLSeuoiPLMB43QQGBeUMXAzrETy8M/dNIoiHjq0gl5VdTf7Mb+Xp1LmD902YWV5Lztslk7W+PJvASOApKvLUnDtqBp1ee84u1Qah8bF3fcXTPvhIdaJjdmLlhnUGU2So5MAYY7R+OJFQKb2/3qas1MU50nBRosbjFa8nLjFUa3CtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1omp4wnFZtzcrRTKt4vNy+tsDnLdCArTobVfREuu4c=;
 b=DQsE8mtpH/LI1vNbr5rnyGudL9vGt3qrl4IQiqjoT+1nBNWa/3146Tw6JYZs+MZs0xYTZRIHN3Hk3Qe5YBUo+jlUZ5WJIqzgK9M/VQPboZTgBLZQDmcc4pqwvNp20STQWkGaHIlkcwjyxbFiUB4Wp8kUxTKRt0zJr4aJqRSRvQciJ4ydnaTOmhX+GXruRZFQUwO+tM8dXx8KwrjAoTTMtmYauddMZaSbTJ6sC/D04uTYA04sOvlIl03epef7ncUD2MLu5wccabegwjTy9Z2BIFuGprHql5Ir5DdqeQrVuHFnThJWy/bHoKXFwzf7Rgcni+lL2KzpnNcz8F1OCXoxEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 14:28:51 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:28:51 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 07/31] lib/igt_device_scan: wire to use static
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:41 +0200
Message-ID: <6a920d28bc86c866fc92d35434de0a04b63bbd3d.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 06b60023-bd2a-49c4-c5ee-08ded90f66c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: s2KFZZS9NT7PyS4YHlcv6hQJK23cJlXh4CPvQJOPVnohT/Ya2Cm/e55gCliaIPUaSvpc+VJ2dn/i706GeUlBvNxtNzPUeg8EHfhDvkrnKduGBX09jHVHs7Gw3BzuNKyFWFnZ723OqWuJNNFpIu8N2Zievoiw5a9Yskgxp/Mj5kD+OHT/GIObhYgKloyaOflEdRfj8EwX8gDiRh0fIccE120MY8TpPF1fKFaHD1vvqelSrZJPtgbohjokXz8dhmnLleblZwXpcOkmZtOIeKu8TWph8Dde54SSTi672bqmWevFZldrrxaVrd41EXlroRBWwqhSAN9DezoAi/o8iuPVv+cgQnrKBwXrm6Uypz+L0VU6390GVVXW8ENbYGGBry9wv+BDzXhBqjlEzwWi5xKtPCANyb7LLGLcATVSx/VkAJOP3lg2Mn5sQYCB/+BIRA0hff0F5PiLN+E0sCQG8hBQ+B1XYGZczJD2e9xI41pWw5EG76j2bzmbcOJOSpD9gTSOt/mXnVnKu6cokHhONp258guYFiRSKM/4o+uyTSjLhnFvVo5cVBn4oXELzVL8B4Cskf0eAZoX2QvdAraj1sdsI4hwuW1XQH+f7l6fRNWmNSIa3Gv6cJhiia+tJ5GRXyRZ0XS2v4dj4f/MyJZ0t1HuQdtZu2NIlSd11cUFr2jIdFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WvLXK+IR+9uhSV9g0KT9//eXCmkHvfgtlkJ0PMXAMY6qllgz+nejpUHb6xy8?=
 =?us-ascii?Q?p9rpIrdQm2OGS9pgQPiv7g/01bWV2Ms1lg90fbiquBI5rLvCIhzz5CmcL46G?=
 =?us-ascii?Q?+ovdD2pNgxWQfjNpybDawe6xe5p1qumLX33JuGroq0VZffGgrnPRnLzym3kr?=
 =?us-ascii?Q?RwsETrDX2c3bWJXa3ZzqwTYUGYYLIBwsyHuJNpWmOnxQIo1RzpJsouiKNkbf?=
 =?us-ascii?Q?ZScjAGWJqrzyxfjzqH8ssM9/zr4KkwiNNZzunBWsmtEEAL+UuwriCml9iKPf?=
 =?us-ascii?Q?5HxhRORuW9S3b7KtnRRnN3DAxSsHdTBSOuXXTLKsKWG6U55H6GTXnNA84new?=
 =?us-ascii?Q?CTOnYnG4Ot5ZiDo48yvyNjtzx0cr7tcHmqlNfXu7OnOPOZj/OnanVmOjhqpg?=
 =?us-ascii?Q?tSr6+gnkdG5Dswm+J+zn2Zif1O0+d6eeGqMG+qtPy+jikpGjmEiJnXQR9/Bb?=
 =?us-ascii?Q?TR0QLxEwacxLyN4FnE4SYgwQAxLEg8ubQXYURshytCltCq6YzVy6zbeOuJsG?=
 =?us-ascii?Q?gHV85OQr4rmBVknC0um3w3PwSowJELdlunhbYw+rolhD2+SrFW0oE3c2k3z3?=
 =?us-ascii?Q?X8NdrEUYjVjmXX8MkU4u6umwCkWH0+suEBbCDJcEFFAMGD9uIxpBR26iEzMo?=
 =?us-ascii?Q?7fYyaZmEsFLCAPixdTDOSUnRNBXDojIn5Yk4O1izOeLdaO1qsKhgx/y4/LOh?=
 =?us-ascii?Q?tLc/0EiX7SP0mq00cG3nGgGhOvCBFx0MjoXhgwymO/wvaRw5QGMQZZB39F7w?=
 =?us-ascii?Q?3IngjHavUX+06f5bVJhgYRH4wZUJQCX/8I0CiwkeL9WI2YchnpiG6jtBXc/R?=
 =?us-ascii?Q?oRyow2v/ogRqyANljo0OtX3h3rAVlc+CacoSlynJUkz+QXWfdG2EwoPOM+80?=
 =?us-ascii?Q?ZtjpfDVqpf0gqbLtbtrRjoK5QAlYzzdmpFiLGXzacnpwNolloDclUEZDCAFf?=
 =?us-ascii?Q?FNOKRGLCRrdYq3HwT1jZWo+xCEMyyx+/Doh9X0ANrXUDDPV4wQUVKVi6do83?=
 =?us-ascii?Q?j2wLzP4L/xqd4U2e1o/iMJdt5DaZkq6i/3uTM9sr65DtGF8Z23MusrbPegTq?=
 =?us-ascii?Q?//he1aoco8lZYocqFa/Xq19azl+JvZ/gf1NFozjwFnYOdAI75gzYx3Z+/x4D?=
 =?us-ascii?Q?od8Za09sNInyYGLfSeOX+mqHQ5YkrdsaaVQXBZVMHn0Fl4GksmnOiXW2rvX5?=
 =?us-ascii?Q?Krem/O6WNMnmC+EKLVYfSvYB0uj6sXK8vW51D0PYbfJXCFbwMr6QRYJGtCGV?=
 =?us-ascii?Q?sBLSp8hCW05gHFLOUQk+77DEp0nFWdh5UrP/zW2WBennJE2nmeSZxoNYuvpo?=
 =?us-ascii?Q?6GL8ZhBmxsOuubqiz80ROeTHaHTSuoXO3HR6BL+YYpIpiOvamqPbohnESVZ4?=
 =?us-ascii?Q?pK5mspZWrA38i3azH6h08VSS/rDqvuPIod8xiGA28/VQmSfe5foeRd1aDerp?=
 =?us-ascii?Q?1egAZwTX3IDAudzK3Au8XZ/f3ej+Pw6OM3kZHuB42xJty5U2ZlA+6yu+gOce?=
 =?us-ascii?Q?+lZulcDsz0k98sMF3+NgbdoJLl2csHVynBeLQppPd81veh/Hzkpjdd2Y7Wy/?=
 =?us-ascii?Q?IfhBgOt/2/ojoeWTrsT+iul07M1Q1GrZr/K3o7Gptjn9IYdYCf6O0U3Ee13G?=
 =?us-ascii?Q?+vttwH3cFEyObgnxdwVWlyGJ+WtH9tl+XSoIOE+80NN5+7b6j4r4Ue/XhJyA?=
 =?us-ascii?Q?YrdYGaG5eAMt+q2vAlV7KR6XGyIeByYQ2PsGfEbi58MTi5SfSr3HjdLqTbVb?=
 =?us-ascii?Q?QotEh09ZS4KDmCjprBTBaGUaHWZsyVY=3D?=
X-Exchange-RoutingPolicyChecked: gsXfVxEnEfM/La8XrKSZlMC7H/lyq3IADShbp80/9v5Nu9iPSn8bkE0cs1gKuTqbe6TIguzEzxhn7227zXN36K2wCZb+s9FzdDFMPX6QHQe//YimdDGRWBzScktXWNDCXlCxfTWVXDrOWilsl84DeFFEgKOgeN5SFvObqyLQu1CpVoe9Nt7BTVsaUBdZamhAiQtCzRNQCgFpDMBnbPmdiYThjYSEgWbV6WlzA4eA2xYxE1f/F+Nb/SK/IUCkttkNzRk1dmqA9Nlwlz4jqbldLJqz4wL8mDfr0p2KwTaQEpLGdBWwVORlcctxFyrYv6MnFG7QvUSistO1iXLtnxiI2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b60023-bd2a-49c4-c5ee-08ded90f66c9
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:28:50.9069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNviozqY7t3KQea0CQAEKs9GynKaKzXCpUx9q67Gk/eJ4fx3+NTpoort1yHTMfTLvZ6+eQAMDcHVS+f6uwaf20FWUdSQUARyhzsMCTjdj6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

