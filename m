Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C83C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025DF10E631;
	Wed, 29 Jul 2026 11:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBW56SnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCAA10E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322998; x=1816858998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FuZr86EYKG0pxdLS3xctD766JOryDUrAETkWgeu2URs=;
 b=HBW56SnBHwa9mFwyIBnQPFwOKct2JAY25AljYbykNonQWTs+IVPsnLDs
 pRZk3gha8BX/gVA7ygTk0r4BYBLDq881ixX7CvevSbYUcpuBCIAtxXYvZ
 VgMtOoe1SRdVmFATY75y5N4QsQk0h4dC2dCDW7S/T4AxlHzzWy6OwvQV1
 WZAzz9uRcTHWlhGaBWDOegnbM4dfQR2dgKO9uu+D7iOSnmxvadpZMn03J
 7KLhIuxK0TtNBvavdkbI4LTE8qyWnHAqQnXpW+9vL3WqWaSnM8DhDs6pw
 EpmAbigmE3vSJ8gTOqdyP+lzAGHTE2s9bGKvt3lx6mymz8zX7cop8YNnA g==;
X-CSE-ConnectionGUID: jbUnY/e8TC2aurW6zChR5A==
X-CSE-MsgGUID: QFqKswIqRleePk60qvCkag==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85797575"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85797575"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:17 -0700
X-CSE-ConnectionGUID: 95OgJLp1R++njaKbKe6uYw==
X-CSE-MsgGUID: +vcpQJGWTduHQAic5Aq+cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="264264076"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:17 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXdVqMVe0s/9nD8ircl1XwhiaKVLD4gB43X9J1R47JchO0uDC/JoIFFI/Mu2zVVCR04BYC9AU8GRQN6nMAMzHzsm4Pi5cSTg73aCpySABxvvNGv+BdanZf+DBP1xUAGWt39i1vKL5vbu1bolhr5Y/6L0wjHOTZX4PbHNPIpJuJApGbRzWBDlXrazKeNdp336ClYCCFtAe5HKmrNSDIyAkT4oMv7G0H7ODkkrvQPkhZHoNDdk2UlWAwlqeYgb2e4sY/HhYnOoXPv8XD0w8H/2FTuIpdGx9cRrOioFsR990fRZTZU7ZYUz8UcrDWA63YL9rUxqPil3niGYU68vh0MqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GG5gacViUxEU373zSFN8/o8zKkiAoCjZWi4lKnIWra8=;
 b=eEzR/xJKCwwh8GifCE+1kTg7aqHu+mZ0WCccM67ameIjHF4TDKQGhVAhuOlbw7i/06hKA++10rwRqt17uY/kJCp9tg3fNXW7JN+Pl9B68YPi5FtKwyUesjCuGby2xzS13MMFU6duYdpfn4q3yXxD0wDnd1u3z0Ylky+Ux1YHCREY2g9oielPV/C+JCUKw9AAhXyOSxfBRNEU3DdsookY8tt9qPvkQXI7bZ8Fw7fi5YF9nYPu4rbyXOG0y1KShGKxEXwpzfVST4+Hu11a09MhSC+mCrV7x3+nbvGEqr6P2ScSbLU5Dhu+s3mfdPsBf1FZO9jVJcg20MqtWkNKm1Mwng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:14 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:14 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 14/31] tools/intel_stepping: link with minimal
 sub-libraries
Date: Wed, 29 Jul 2026 13:03:31 +0200
Message-ID: <6dbd884db7b20357709c2c5ecc07a7bbb6b223b1.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1d2a91e9-9e16-4a12-d01e-08deed60fcb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HBem26fw1l4Yv7yi58Yd1+9eIZOeCPW9FR3TAeDg47a/qmTJ4XGCjFZ4noWvUi57wB7DPDG0iZT10jqwKOjZ0ad2CglVVY/29zPQGV5APpdJ1zBAwOhPSkBeFZhjsBc9irubQzkZxsDR8AWpspVlUoDKwClgYs/OC1THKEOduQ0upuB5TVgl/aPs4FQayfBFF1xgODoLDnvZpP1ekNPKs5RLbPW9yC9NKo+CM807/En4ccgJ3w0xTUDp3JWnj1wk2zcum8NPx36fsVLCdy53y5vck109M8x4nEOlq8JaI9Mm5Uu+Zeg/BabevnkSiAMVXnjpx/Q9A8yUHDrzZcDzVoEYUZ6QbjDxxZUqTaFKAPzjSXmOQaJ8tTRun9MSLmOL2Nyrh7zCaHrONqe+q6M4eg2+QMeoO3vN9IxzPjV6AguXgFsLTwi3h3walZvj35hrU2q+sJ8xsT0H7TwpA7lDKohYZOIsFw9x0A7JVEkkWu/qmleV8H7VsGwPnDz+PeG2RaijrT3K+e7tsazf5ASwODjjbYnN/qJ38iTqq32SHJ1mX8k/mYZ+n6zOktU9f93DWwtWkfaDBJIYFm3YqHq2RbCUfy7+xWaD2bRn6Zo79zQxkaVckbgZhm95Bt4a6x3mYQzZqw4V5raC1n6GJnbtxZusimaRhid4EdAdWpg8ehM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zz5UAYcQp5WksHStB2UC2xygaZt7AczGiB7/8iCyWza/rhVKavPyApfXNSpd?=
 =?us-ascii?Q?bWCBnMaMJCZeUQLchJbPSfWVfiEnZKjRZOIem3uECNuwhKM4Ug8x9S39E7Rx?=
 =?us-ascii?Q?+qA8y31xbQjlZHBk1ofra0vMjXPyBtCttLP4YbNWJWhL1aGxWY+miLwKWUTG?=
 =?us-ascii?Q?EOuZznbVtNLp2kNL6IZr2NNOjIAtRhAuN5U9fzhrkWo3jMZVshq3H+al8l7N?=
 =?us-ascii?Q?0kvWVVDEuU1P9qjIRPBwG8HKP4qcmdC4YMA8DJnmXAtcdAMXmXI4Tr2FULgf?=
 =?us-ascii?Q?6+EjrvurUxvSQOvEcBgVmN3BsayxiqeP/6mYD65OuB994QdQubyj9OqoGuNl?=
 =?us-ascii?Q?EZzv6T7s2CH0USlVGWYYRLqqTagEA5ZYEplWJh31EGGKH/6Kw9mnMwQVAt7W?=
 =?us-ascii?Q?m6zt98//9l2fkxtbPilJ0l4YkB3mHnvxZ/Y/MFv7e2DznqjBxYnW1xzhCEFm?=
 =?us-ascii?Q?0lh6D/9uR6hhIehHPmkrSSpNx1KgK3hbs96VbXCgTNmbGU2zppuoUNEFeeCo?=
 =?us-ascii?Q?1drhLxluvl1SFuHQ9TIHssKO84nc4ATotCREAncTsBrXDyRNK7a0TZaBNERD?=
 =?us-ascii?Q?WKpKAoj1w9AN6Clv34uppMha8ogoIycqxr1CRNstwJFSc9+wgYchUr/iDT6p?=
 =?us-ascii?Q?PJKNzSz1YbEiDc04CE3hpn482nDfVsRqZwmxktAZLT5JxDWxUQzhW1zB2Pkv?=
 =?us-ascii?Q?9PgwtZUZI8d3YF+z68mzEEZJxzH5eRbvr/LSHjxabstnzBLTDVeWXxtUXBdA?=
 =?us-ascii?Q?V1t1k++isxCZ8SLQ86aTrwVgg9uOrKC2/+hvXw9YzVI9lT9QbdkEKUs95W5m?=
 =?us-ascii?Q?1z36W2M3rRQ7zHTj7k3UvvM3URMKm6ROejT1kA/Kqc8R0CpNsQYIjiF51VWA?=
 =?us-ascii?Q?eJ37L09NtLtAbbNBaML3wLw4c1QJhnwXsm22Kfi1vdjYY/Z96qkdj2RglWRT?=
 =?us-ascii?Q?QhsJzdHw/f5EZO763k8JAU7RvOzOnnu/3X9EvE2puUsoaeiwNExG4OcCZbkx?=
 =?us-ascii?Q?NQTiYUCKkR3w09Cm3MXBLBt0Lh4cM2ndJvARknD7KeS/IidUU9HsIWIJ3jWz?=
 =?us-ascii?Q?NHuN5fnR8fUHaXdQOHxFsudvWvGEw9BNkUJVmitJo/fewZe6Hahsdp1U0SDU?=
 =?us-ascii?Q?5BWezp8oXtUtRLgNVP2UinLzy3wMIrZpgBh3hTgipGyGAmsRp3UczWgu8W8A?=
 =?us-ascii?Q?V6N4M47EigWOtMjloOvon+P88D7x6iFi8x1eAUU6Kgvgdvmne8798SJDAi0u?=
 =?us-ascii?Q?ikEGuUJGdu9GvC0Xgvy4gkTlXBKFWWvHQ1Y7Nt5KovA1LTbZ8IW7t+XdINfj?=
 =?us-ascii?Q?b2tK6pJv+AbhsZ8YZbixq2EdyoF4X7miEHhS62ctdy+ZWiMs4n94ZLh23b8D?=
 =?us-ascii?Q?DFAyg8p4i2aP9K3MCGjGBifno8CT+63oN+VnM9omoRDnV9FQS9ECg8QUL8p3?=
 =?us-ascii?Q?SNae3u/1rxaxpK2qruSqlBbiPlZRvNqFnMV6RYWduOa8yR2HPbB6mqKN0Uf+?=
 =?us-ascii?Q?sP5wWUAl5bJMtika1y630X+XIQyTZkr4cmb/WVzBiTBIfVNAVei7ndy17zYp?=
 =?us-ascii?Q?q8Z38QXI+N8gfV41YVpBHVpRZHqODdNTqWlfg0JTbYXgC3aB1rSfUDP4bdnw?=
 =?us-ascii?Q?uez6NhkO1t5COzXPv4Xr+xNwbcdqkhWKHuSnM6H8f1uwrFYiwkVdjn2ko8bK?=
 =?us-ascii?Q?OeVvlyMhQ4L/HYnk9EG9yvF/1F25r1fAy8aT4ji2UQ+QG4kX9YE6I+AXumgN?=
 =?us-ascii?Q?yZIHNb4DaMISpzWiviNBDh1Ld4fyirk=3D?=
X-Exchange-RoutingPolicyChecked: WhBeFFGgMi8NutKTerNtA65yYjQwdn7gF65vf41iKbXRx2pzvZRMjmorHNQlxF7+PubNAdXrW/H888a0Q1AVzswi/9AwrxYQ0ApICgbuSsLigf65xKPo+iJZgJI4LT7nHr7Hx5JRaqN6UMFkjP2g0VvKz6xJOHOOeckFQXTHdeqFivNugQ3739hhz7XaILgRi22dBNtmF/hIkMOkx9qc8CCEYBdnLHJw/HX9XzJFDvJzdYEnev4MGQeY4XWXc0faY11o5mjr45RpAHupEpcUtAlSNz4Ojy2nmzNFHs5lKwsjJUoDUYdpcTpKjHoRdYzpOEZRwxKkUsl6Qk/vo0a5wg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2a91e9-9e16-4a12-d01e-08deed60fcb1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:14.7217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlkOcs538mOlVxmA8KC1Cc/o5cyamcEC+SDx9gh2BtuM43RfmsklSlWn7AIMY0QxvkqxloWNdxvdLycASoBdMtpl3LlOctKGxe10JIPqTxI=
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

intel_stepping only needs the chipset tables and the small tool stub
support used by those helpers, not the full libigt.so stack.

Switch to linking against lib_igt_chipset, lib_igt_tools_stub and
libpciaccess.

ldd before: 35  (ldd | wc -l)
ldd after:   4  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 01400f53e..8eb346321 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -36,7 +36,6 @@ tools_progs = [
 	'intel_pm_rpm',
 	'intel_reg_checker',
 	'intel_residency',
-	'intel_stepping',
 	'intel_tiling_detect',
 	'intel_vbt_decode',
 	'intel_watermark',
@@ -70,6 +69,12 @@ executable('intel_gpu_frequency', 'intel_gpu_frequency.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_stepping', 'intel_stepping.c',
+	   dependencies : [lib_igt_chipset, lib_igt_tools_stub, lib_igt_drm_stub,
+	                    pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

