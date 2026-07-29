Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21ACC54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A4010E00A;
	Wed, 29 Jul 2026 11:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bf5wOxQf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEF610E4B4
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323010; x=1816859010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DnjRWCmSud75j/cCaWrd36NWnyvpd2qUJeQ2dLQ2hyc=;
 b=Bf5wOxQfc2ew6WHss182wqvHxUuJJuej1z2T4K3sIyGQNjNpHRCs9hsb
 6m6MF/vv/95hh1qDkjl6BPAOcYjoGNCIushzBVA5xMAAtAo9LfbQaMzxO
 DL5TGCwi4/6CAHdjXZSvJ3RmFosv918131xEIs1rEVbzypnar3KjRRhnM
 hjSjPOuumz/zfRa/IMb59WL95qsyEFziPNOHvN2Xu3zZw85fOkylAPNbG
 LunEJsynEJx0Mnl91SpvfRk0JoxbgQMIC3xNtJ2WpYLfqMqkBdHkjecIu
 knoplSie8nfVyJeuBVzcdz5ydtlHkMoOGrvao8JR4ySeaBNalZkMAUdeb g==;
X-CSE-ConnectionGUID: afAu+pA/RJSchSy5k0z+Og==
X-CSE-MsgGUID: zIesZfYrTb2TjJjPkbCAfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108719010"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108719010"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:30 -0700
X-CSE-ConnectionGUID: u4Qom5wVQHGo+hSQDVWPAw==
X-CSE-MsgGUID: XT/n1cjxSbqnThOfHyz+CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="258204799"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:29 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BD3s1wj+oivPuZqMOKpS8g3TMFgGPxezjojShTw53E36hvcFxAPksjYEMlv+bTRzXRRlkJjXVFm1Q4Vu8/v+MEbInvxHo5Kh7CB6kW9VvUfu1F7BGS6HIUc7H77gObmA8El/LNvuuDrwoFF73VeIHaM8EaH1wb01cuptqn5f0WggvqfnEfbodW9pHlxll69AqYmDwKmVCp8QUnD0fKIu/0SKnPoJvIneZV+j6sovfp45sGeTzJQLMZKe+JROOXPXSHJ2mr4DjGtAAQ2kvxYUp6SiHC3MN46ESaZAKR2fdWmlHp2GTWJwHRES+G47YYJEmAmPGVgoVrfX7KK+FkFLsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEZgSNtLy7BgGKtxTwVp0GMLmHuJRF9kWTsLJZhYzWA=;
 b=JdcoFiEfxOs5OZ5dd+NR3fcOmFOaoy0QODAXzZ4LADafssZLlNaG3HIN783nNsukZ77XLH9qGdivBLU5+7ytB/cx6j2nzn65f72h3wMgHmkr+Z4BjB0AUsb8AzGoOaFFJpBX9UilMaypLMhchTxbXClUJndZrLOrLolaBXNqS9SnBc4c5M6OU+0kNEwYc8DEbDFCcwdCrohrsbpfXIjzcIcLYoNMLwnrt/laODJwsfmffKqpMBUBB/X5fbw6PLv0Ay94GDIzAB8g/Nwy/W0lr/5d+PiMeLsOTqmDi9C45AYsUNVsWPMx+7Mwyk2CcsXyOarhcnhoCAqTdCmTSE86gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:25 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:23 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 18/31] tools/intel_vbt_decode: link with
 minimal sub-libraries
Date: Wed, 29 Jul 2026 13:03:35 +0200
Message-ID: <8a17544beba8904b30313fd816720d5d9814621c.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3d4be55a-dd2f-4386-6fd1-08deed6101fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YUSkFojUB5KqVGJMOVlvC8rECs2AF2qTdw+cvRyphdkF5u7oJGZj8knaAEZg8tO3jyABEfds1LqC7sA26mIJOPPJxLM6X9I0EjMhNjvdqwn+Haf+EAnxhL1wB6V4bnNCZuwtT4zA5cGyr1AJMjYv6u/Y8BwPkX0wCh80hsfnhi6lGssz74zGyOdoM3+c3MKP1qON0EAI6UHLQNnvLW9cvEQy1b2Mk9IuiHcqAGtpfdR7nfilDjo8W1G0+6tet/4PuqO77UJX0AlxY6GrA+Ph/vzoWMWmRrbLExz/QmnEHvTinMKD6Cyjs7OneFg1JY+qVAwb4gI0/JeomQXrzkTTmU7XgCJNdEW0nx25B5QBrWxWlFqbaF/WWPoyYXN2qicNlSPo8QnMwIDHAXxG0GhWw3eHnP7XqFM1ydtXmY/jGzo3y6NuPv1kiCD3GNBhx6HotiNr1DHXEZDhddRWjMjn9lusMbUpCamaxqoMPk+9Mpqec9dKpNdA27O582fhO7cz2/Rk+Ilv0norHsYL3YAdzJTxQWgbkcvcL+V29cH963z4/A1q3EG7UyBLwGqWSpB9kbGx649yeBmv/Ed3NpLeVRnqxMAO+m5lmmqDhTeCg14x2AO9gjOnY6oFgeKwqC+WScYbcvNrxHdy48C6bBdvue8csmYJ2Uwn4QJcD5F9tzo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y6FnZLNOEddASwVubQTirkAkUsenJ5Co2pyIupegVW0LeKHFT85tkq2Gyzv/?=
 =?us-ascii?Q?d5i/g9eyT8K6ESX5T6BG56J78wDItz72Nsikvt4Wa4j63NQb6Vt/Dmm1bqA3?=
 =?us-ascii?Q?MZh4yHaRTTQ4LFZOjuq1YXjcNybm6aW8ckRj4/Ud1dOM9Y7tadQfaHSFt2UD?=
 =?us-ascii?Q?7BmZpql4ZQrCt2Hghx7L5OCIf7lZ2hUWQMC8yoqazLvs4Ll4ai+awTZzMjJp?=
 =?us-ascii?Q?tE3+2LZcZ20LMXw/vjo9p1odUBOjtW14xQALNWayf4lCQoYwnV4Y69oEyFRl?=
 =?us-ascii?Q?kobIIWRGLJDfX+MHttJ3zJORNcrcLfLC5mIAT1w7yZ9ZxDxHIVTMortBTLmG?=
 =?us-ascii?Q?1u//CQq8y383gNyfvS+7ipsW8xsi9Rru/QLD2BY74QRmpKSuQFmN74kvmkl1?=
 =?us-ascii?Q?rjCsapN/UcbTwtDiSt8/Z+NRlUPfnCN2hf2zggTILcuZSWIwdbu7vVm+AV9Y?=
 =?us-ascii?Q?ZMtsxUE7Y/1xsyy2s6483/Z+dvj2Tss2XUe8llEeREZnJb/Ws9IMieXXDiOI?=
 =?us-ascii?Q?g6vQZQzUdx/x8X/tNvyPTetzUx6o+NTnHAxlXcwHNKUoeAPIG7I7gUsShI6W?=
 =?us-ascii?Q?TgO4ClTPPzaQGPEV0YHvA5c+xpnvmqkDzECy0Q3NRdiuzIDpxzwIK75BL6sW?=
 =?us-ascii?Q?TuTrIM+8Ipe6/2kips3/hmQPI5oG5RwiS14xyZzecRV6Ex4tFcMMZiQ3XZhs?=
 =?us-ascii?Q?6TTdyTJLmVy6thTkG3+jnyVwgug+fQf23VQZDp8M4vMKo5H7kh5Srn1Nvfy1?=
 =?us-ascii?Q?NoTTgnSUwXMLm5KtDuB21GPJlgjDVXvEOVjMYCDAxqr4b/l81nOOJWSvvbPF?=
 =?us-ascii?Q?xS4KhOLWSOl6b8uRdFYtF4Ez8uWWyKwumdImGeANXI/3+itn7icvh+sWp3St?=
 =?us-ascii?Q?qPgyzDogxkV0ylit85QMDzgH9BiGJlxjXJo0luuz1p4CFWEJDMo5rU+Ra33N?=
 =?us-ascii?Q?BocE7Toin2cRoiKI2iDLL6NTCw8ZiXnj722+RNZRkWSLqfK7sWynU53rulMj?=
 =?us-ascii?Q?LCAQqa1epcUC9lZcqxBkl9CoHXHEz0avOoF0tQmdiTIOLLcjmHpHySct0wUm?=
 =?us-ascii?Q?/khJgoedCzs4DN4FtWJIA1niHLQPUaurM790dffX0tFQ2NwWrWgOfPR9spWf?=
 =?us-ascii?Q?orBu6/UY7pjmQ2fyaiQyQKGOkpRFZzJTX15qkzuuXI4hcGz6mYx1ephhRipW?=
 =?us-ascii?Q?c71hN4X2WADmLb+08j4l54+H9Kqs0EffuryZxOZS2/OOE+kUHn4y9Ef8LLie?=
 =?us-ascii?Q?cjsvdIThVO/WClJxI2jXcVl8OM3CTGGG5gb0m9aoaaZhmk5OistUEFe0IiA3?=
 =?us-ascii?Q?eWt1WeBENgk1LAKAvxQSkdKV44xmqu2FQ8a1G893UPRrKpKNM2wEgeq1DBG+?=
 =?us-ascii?Q?riiutBKtNLtDpiBWqaGUanI3EAV6PEr2fUrPX0/t0GEa/fPfpShzQmyK2nzA?=
 =?us-ascii?Q?562Ejg6y0BF2lk7habfnqoSUUvdpdkSKfHYsdoRZxjV4gkOfPkE0T9pH2S5e?=
 =?us-ascii?Q?fqw6i3uyWAu6SH4ofYRx+VPNIP7Dq8BZFFA2NSOIPoyECyvaoUTM9ME2Su9V?=
 =?us-ascii?Q?BN1Rql7V860if4ejDszLk3MYU5c6JdZsBBT98SVeC0rzvoNbHrKUEpvA6/s+?=
 =?us-ascii?Q?B0JWunQTsPL9yAMi0R7LuX4IgE8ofHMi3PLBFJcz3Qkb9eiFJyNfS0KK0vKi?=
 =?us-ascii?Q?K0451tuBioqwLYFkLwp54OW+saGekezqRXn19UBVtNQkOt+qoA80A87dy9dZ?=
 =?us-ascii?Q?YkgEvClSaSZ27UtklfjNaRrQZrYsJIg=3D?=
X-Exchange-RoutingPolicyChecked: ca09hDLnjNfXP4VK9a6RlDbdh6GQpFv6R4DetUy9wqGlKRpjfMjgSPIllJz78mjN3YbcqHX13kYO40Vjp51Eipz5IiiKfZeXE9JBYfqVuHC411GLmFTKQ/n6iN2+qXGddnZliOSBeBNkg9I1N2YOhdgiv5DsQx0jvO8AJwe3jb2fUUVZ7qbFRTU9fTfGdFjNQJLFLxj4JE/CS6r6nHrpmswJPYE73rE/C/V7FnljXCHV5ypNLqM7PNRxbaL1QeqyjJSW8BlkS87aPsmi2dJ8fQ6vi8Ic6kagbOgD5/ckQnkTqjTyFlNHS4lePjpWZmvHZY5H9i9iwDpPTm6gG5xO/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4be55a-dd2f-4386-6fd1-08deed6101fc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:23.6141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVKyah2qdhUI2YLqVbRmKQiF0Lv4g+TGuXAMIZMkB63IJMt0fniimQ3q8rmcFspOQ50yW9iHfjCQzZcD9Obac23QMXlSwgkQNvTSUujQHUw=
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

intel_vbt_decode only needs the chipset tables, half-float conversion
helpers and the lightweight tool stubs used by those helpers.

Switch to linking against lib_igt_chipset, lib_igt_halffloat and
lib_igt_tools_stub instead of the full libigt.so stack.

ldd before: 35  (ldd | wc -l)
ldd after:   4  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
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

