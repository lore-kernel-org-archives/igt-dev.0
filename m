Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6FCCDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2F210EE25;
	Wed, 24 Jun 2026 08:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ehl12ugO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8BC10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290864; x=1813826864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=h6pjyZZo5iRhLlovIrvcOo7KvplRO+lZApvkJ7MKK0g=;
 b=ehl12ugOVEy0OC69dOYdwvtjBVqUmF7OiafjrOJevT3uRTXxKxYkwCHM
 24OQRqEGSQH8Zq5g0csErF/IoSRyDtCEoeNlN3cVHyHhw9w97MvHm6AVf
 QDpqRUOJYWvP/qyk82PbqMJqzF0zwF1v+QQ0DXTi0wsUUwBlZtfHTc5P9
 +G+0VqionnW5vaeos303slflezHeXSSxnaSMhbBIQLpr0kpGMh03qynUR
 eSFm28rtZF+hB2bPYpfZtMClriIYX6XqIyZHqnm2zgPIhS8zSBdYQatxs
 RXDIq1Ws3fQvjYwMKL4tlTDMZkcGS5J9fQyWPOWhtZphNyi8vu1XkU2V3 A==;
X-CSE-ConnectionGUID: m0FRZjQ/TmKfrg4PDbtu1A==
X-CSE-MsgGUID: I38eZ9H4QOSAiMYRbU4lkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="105841226"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="105841226"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:44 -0700
X-CSE-ConnectionGUID: OizA1zcBRn2ldRsRL3bIZQ==
X-CSE-MsgGUID: GhBDZfJrTkGO9oe9NiLA1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="248880798"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:43 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yr4le5KkKIIJsx6ka9YwoX/vWE3pEX8KbbyajlII7sjINe0d8pOCAuMxbCSy+AXFpymCOp3nldvaKxkWd7Ny67zCUdhzw2b3meDOs9cHn9SIiVZOisHZ530uz17ROIEmY8fxkfPhoIeuOrz3oDR+U8uH+Cz/kmoT9IU8IvM2yAoSduB2Pqgj+WcDOa0RZUAW33rhMvYjIIzyScPGNX1dcc5F60iGTV7w0bPsqJvvynNv29J0JNmloycI78L0rLDGwVlOqjfU5qxk5XIHHRrBB6+okQVkkbjrcDjiOo3JdFpNtV2OacNgoK8nkL2SVAi1hWYqu6FdxFNI/jYZwS5+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/5AiDZNWrlL9IFrMLa+bESyVaZk9SjrjiWYFSibGj4=;
 b=PYYm+SjmD1DkZJOUjY0OWnaR9wXcj2pc4FvddxzzOoicNAndErBrtjXNPkrYHXJl9q9zt/IV6XTkisjLKu0FOZAn9euIIdGV89hrVuBQAZ5aQfPt/m+EMRM/nYOBofbmeVQ8aCVGbjA7BCxWOAOE0Qz7O8LRwyKnm6P+HIFadJHm1S41zWAnqgaZPZcLyQ6Xa075hR2zOK3MSDFaYGHh2vs3plpWlzazRk6/z7gievDfWx0FnDyDzU2T3hfZdG1SetQWlV0Ozz8wOb+9HJtO5/WDgGryLmXqQIWPzKUtQJsac+0z5Xf5c4FqRMLKCXMSJaF8EMghqlibY8W7vfpjXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:39 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:39 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 10/25] tools: intel_stepping: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:17 +0200
Message-ID: <017ccd275205efd5171b44c548c50c9517b1aaf2.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: ad5a8b9b-161c-4ebe-f9e3-08ded1cd3f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: sf5o3Z2Qo+05zCb50fbD45zgc6Lrzjq59dXvZmpSUUDmjLveG2PaH7YFzjsbmZpMdGPLMFgZRQeKch0155QbuAZ368BE4XuCgUJmcixt9yzWudQjV/Ypqt5JWo1yDA9DqlV9riP9QorgtoUhwYFzPZq5Jk6wzPXYevvc18pO0P8wppwkO+9mdW0uFGmrHDmG2wksHb3WVcIh7Co29t8QBiIeyk4z1hAsI14WxWoJPTaLSPWDSfpk4XA7FDiqveP/VkLdEgghJSWN1sNPDCbf0tMxaMZyhJyoSriHLwE4y3cIZ/zB2ijxB1xvrazb3VjJnmowIbMGTC5oy7XdtAFNOKDGkEjbyB13dhSQ8iLVzzzl/Jh7VsG/MVd0DlNU22EdKdH56lQRYhteOvryLm7xWc+TH5fTeQtTt2FsdwXCrqOAg7qNP4z4XKYfx2vaUoTfMAXjw5F+VyPc21LR4FMVcpvuu2h3Xz4hQk3W6yC8RE6LFiuSaKMXwVmeuJOhuDfVZ3l7ohiamAW45Z0v4beI1UXizlIUsdtZS3XlOJKWvuyr8vhtljCvievKkXbKW+4a00LtKDcwcQYEa32JdUukSkYZAdlMqKajmo6WZF3bLxayBTeXwN1VY9yBlMzkqWNjzJTTiQ6BVQCZFFLywdi96GLwj5tK9nKUJup2CAOR8+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YkIXxylQKvfNJbFCjR+fwCKy9j4HS1Mxlf6pT+YIOASUgPm/Ex++7JAO1C5H?=
 =?us-ascii?Q?pk+n0By6cneAsKBGn8cze70J9hk+37dC31aRugr1KV8J7ILejGZpYU1iazlM?=
 =?us-ascii?Q?4/alFHWrtqbCz42LoNQvc9HKRKRcgNTdfvlF6Dy3b+/V2IDkPIHzr3+jLb1C?=
 =?us-ascii?Q?sGpotZflz4ylKK516v0aX24HFQzS+bIEGdB1ZPIC2TpbKhnT56a3LKLFBdKa?=
 =?us-ascii?Q?ft9NteyZsnspGp5DqW5Liwjwum3OuO0DFDD6sGxnKc11RNDf2Ky0SjDNl9Kn?=
 =?us-ascii?Q?5ri0FfAS2SPg58NxHp7+4AVV9eP9mvvLAWaVabOsCrJkeCcFjAt3fkzmZqn1?=
 =?us-ascii?Q?NFrzJRfoVDnHdU7z/A913TvpLowY3YxTkuvnillxU0lHr0gcAUhllFTNEBzZ?=
 =?us-ascii?Q?vS6SCTNRH+689dfrWXvopKcnWE+R2Yo6j6Cr6wZXAmCRFqGWMHselB0wYryG?=
 =?us-ascii?Q?tsPf6oUXoGbSJqiRCXYmlEtOKmdLUv+0cOJl9YklUuy9GZ9tABoTGiVY7Dk5?=
 =?us-ascii?Q?v6h0NWYlj3kVjueUnYgp0LVBjtr/LZ6pSftuu8KYL8n1zS5/jbw82NncShn5?=
 =?us-ascii?Q?xD0Z+XiK9PlYmGmJQ77sV2DitPho1howeoMtEZW9VC2PUg3e0gxbqmFWUrSU?=
 =?us-ascii?Q?NX88BhPXz9a7PvxIH9U9nQIX/PdDhlblzw9kXX33+AZF4yGfBT4jV7Z8CtjG?=
 =?us-ascii?Q?6Qu9RshLUYqKycxLdGaHmFfxC5hv5orBTPRceIU3hCXlwlNBGue22GoHfUMQ?=
 =?us-ascii?Q?5EPQmSJ6iaMFfct6z6Asl0/5kT5DDNaqgdYfh2NmKFnAIeqmF2qrRG7Wgbt0?=
 =?us-ascii?Q?r2JLfOUG0ZNbtX6GW/+WLuLFxnSzuw+9S/ZFOlHVQRlDCpjNwRSCoomJZZBQ?=
 =?us-ascii?Q?kZtZGHbkqneB7uF44PjYPECJohEZ88eroY3Lt/aLUw+LOKzNq1qr5JxGL1tP?=
 =?us-ascii?Q?vBeRdEmVG1JzmxTuqGRpQcENJgxmyUOB992mP/q27jwQb6PWEakieo/K/m87?=
 =?us-ascii?Q?nwukLhBVmKGW8U2XSptU65CQGj0zGvLWxA1QsPIxyjOv44nGJ6CG02jPaFRm?=
 =?us-ascii?Q?vA8VebWFoQnAeCMscCEEyrcvxZfE3ZP/es0TzLTA5wmPK9F4wC8T3k6GPNUM?=
 =?us-ascii?Q?OM5M2Jarfwj49UwYHJo29Ka34YX3uLDTYIjeYgTKO6/fEHFv/vd9vobx1AbW?=
 =?us-ascii?Q?LVzV4IFW+4pUjPvi6sLfFyD+NpaD29ZtC4xOjgy/RWz6bCQFHXzG3y2Pf/0C?=
 =?us-ascii?Q?4jtB6LSCbUEJ+MExl2ky2QS0G0bWV/pZkPzBDYDQr9IPrSCzQrAu3iMBIMWy?=
 =?us-ascii?Q?CazSeFcGl3LWPYDBFUYeAMNdLwgNKtnKlGY5D4xjMr4OfLldi+OPZoqzx1L5?=
 =?us-ascii?Q?AFgrriMl2tyAAJsi1UA3XOb+bofv84sM/EZeEFWKHs8/jKjqbti5x3rvscz9?=
 =?us-ascii?Q?7OHDgmcbiVgrcWvw5zp7yvlGc4tLKE/oqQsMaEHNnV/WWOJaxdVdooTrAXDm?=
 =?us-ascii?Q?NgZxK1CXmfIhYWcecMr/PtlF8nq5T87JDMVveb3zANKdJ/x0QVIRVZYg1R2a?=
 =?us-ascii?Q?w22kamxm1LF4iW8AyNqPPac2iOXkaZjsrZ3ZNts+EUP5vWqb5nPRflEkSQdB?=
 =?us-ascii?Q?AfsnTwyvMoXVZfy1gOR7FvcWMfzjd86eEsbUnCB31Dii/Ump/OMhKkvCAdcH?=
 =?us-ascii?Q?snMsUPGOUNSqSlKrCiqoS81So6ghjeHmqb7akcuC3ejLuoHk4EWOv3FWrCun?=
 =?us-ascii?Q?uKVe3dzDQ9eMAOLHKUc5NZyFhaUJvjo=3D?=
X-Exchange-RoutingPolicyChecked: UG4IldlwKGCQxvY3K1fCruWjaFE6nUbuz7rqbi4CePAijo9YGpwN66JzHCUDr9mkRIqr8IteKllQb8qsuooq+DGIpAhKBXWWXS9Spz0SNbfJHCDsaPq3maShCtfqrwqSoDYxa6zSUB0JrWfbFH3o53UC+/xL1DPcm1iDkPC6wwuY33XVLjWlhDemrkpoKNZaladwszimBqR/4NZOsBjoUbXHre5IOI9e3aVA+9b7oanwyMGQV+dc9L67w00T80jqFg2Og3z8W/sw0F+mE4SheqHBOjG8Drt/vqi4vfZ36fOkS4j4CD/r1YZZTJ98XfNhgsK817PcPhE4Uf1iJteDwg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5a8b9b-161c-4ebe-f9e3-08ded1cd3f45
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:39.5623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4h+3sHIqJTM2b4k/xo0DEdwDY5A65D8lYlxRa/96bOvIa+XVfbibN07aCiHLlDFWSXQAlI2gMTS7Q+vPvFxfhHe2ON64BkyhVxz95fJm4Uw=
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

intel_stepping only needs the chipset tables and the small tool stub
support used by those helpers, not the full libigt.so stack.

Switch to linking against lib_igt_chipset, lib_igt_tools_stub and
libpciaccess.

ldd before: 35  (ldd | wc -l)
ldd after:   4   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
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

