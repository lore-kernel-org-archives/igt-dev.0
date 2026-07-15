Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32441C44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AA710E126;
	Wed, 15 Jul 2026 12:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5nvaecT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0840A10F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117731; x=1815653731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bfo196y5Sw3Z+Isxv+MP0tgLqhodEcrh2rhrjztU+qA=;
 b=m5nvaecT25rLGP5IoHyZMkjdjdGdN4J1rMn47hzjS5vaN1NsFEAjr4PU
 IZbla20wu7excSg8+rpyXs59UFUrgT4IvqZkKNOKqDFvidqXQA/Zw3noR
 dKjQbua+7TIplPgcAQ6hZvQM9O9zczfdHl+3fmjpIuLToUM7hrps9DEJS
 IjD7wmr7+aDRxuRUHgYiJDVQbZgHoJ/4k9sKy+3UuBf+uMNYfsYNmcqyE
 Pv+Q8Fkl0hyYdLBaloRAKv7myvTnpdFMXoXOFNekVSKE+FQomdibkk/1s
 9VetoBVhqUGh723jqgCWuTarJ0iKBtC7ywsMTRjohV5Qhf+PVeaNOFKHP Q==;
X-CSE-ConnectionGUID: RWs0p7usTriz8zUZOXDl9A==
X-CSE-MsgGUID: sxBbK79GSxWeDUy9uC0mKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102175902"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="102175902"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:30 -0700
X-CSE-ConnectionGUID: QgcBTbHiSBG8QyWswGVTmg==
X-CSE-MsgGUID: o84FYLRlRyCA1YGIez++7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="259985102"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:30 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RR5sLMHEV5a8v8ABvllVNFTXCd/g01UYUUJtd928xNt5l8wQVn2dNgI2616r6ooTpHKdfjEHrNlrmyezNqRAAbQTBYzrUepoPdctw6hpfXd3fJxaU8TVKeKT10KDqe3JT5nJME4sNj+tNAZaaTqvl5LgfZdX2lSSF5lQeinQgz/O1pSEx+o7IzN0dapmCfBy52B1MU4vBXpsPmzDRILinaT9e6O7PhSoJ3HZyg7qKZTeAuKuQ8ZZNf8MA0VmjOVj5uK+rD+EjDjapsFzmlJuoBs9I/PSHX372cJCP8RgmiFbvMlc5OtPnZyQRWxUM9os1ZM+osAHnVVciQCA1GVx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vbnIwFPXovx/Gcf8mXb13JnmK3F/gfktzSMgYUmV6g=;
 b=JXn3Pb7yRzQgLrsjIJm3Ov2XaWStmjCJ3pzPp4PnWez98qvZ0dyTeuZrc4uP3lIgLjcqdnX6sTWgbKIb+v4RODpGoJkjQM/S38Fbzv7aF6C1CVVYBMDmLM9BWg/+d4gpBOg2EeAX0hBdo7YGzDDxNP7wwcne6SFE0yfdXhNavCA6c9RzJna3OvuNZ2rQoQXnXXOzf+Fhi4KxexOnQXi+bWRapA/RUpImBR/NbHFRJgqAn+Ht6+oQ7B8ZZthI1tDXyD9CrrtxpoBoPWpVQEU8nUIQ/rTHzcwXHAuibe9kKHQZwkYrqgouBz5IzeWw1EB3RnBwCGGuGuvCKlVGKI3rmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:27 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:27 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 15/31] tools/intel_gtt: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:25 +0200
Message-ID: <aec7b4d0d953275932e033af10e875e6f361a705.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 85c5f5aa-628e-4142-d3a9-08dee26ac140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: J12jKfWEr1xxvxnCqzmAtBLvpmkPaI4NBZ+17dToUgL3fHOpWnSfBsiuF7GHFL3UnScPAe61X+s6/5lBr62d5JgYpr/STRQzVRwgxa0iUClyiDmq9FM4/F8QN9C5AV1TMhCrlvDHVle00qFYCiKl5Wwzv4e+Slk91aI7V2WIyHOhgDihnW060xFDb1ogtfvCK6y4yBszxgCElwHdetks6bVeLYeLd5n650UeACCBahOQcPPVZklQzrESahduW5J5yIc9x3t1xMATZ6dJYkjXSobjWQRAOHcXEBjenv0RoSugMOOYW/stMAw3WnvAX3IMQkk+nrO5fdhyzazFrFuy4bFDBsXRRpdBLqvDhrWetuEbWGhsS5E07Dk6wwF4/wABSpvaYqgtCq3zG7YX+OL34TPtasl7I4IyLddGGv9ZQ23NpaAWZ/Rz5S0PjZouBRfipLYwVp4ZDW5k9pigqdf//sLOHt0Cro6fqi+b+UrwUSBaG2RyuKNXKygPWcRd/a/PMG7dmh5PNuboSlFBIoYXwQOo2LWukY9XX1JmSo4ex7ZBwgIHdmMnsDfgYzum7jryAgCPdcH29EWa9sbTSNlXtUseTc43px1AgUyciVALE0zsWhKeM6DJOirHhb61V/En8DC4N8GUeVAOYqAphoVUeTpSvFkfOLCPH0YuGz1hcLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w5dQ2HAKLHyVLggzaDHcaLz7coGLm55HTmfqo4XfxLqLtyQD+nUVxGg4S8dN?=
 =?us-ascii?Q?tOtN6BI3bcmMJi2t5MU+T32GyTjtBK9ROUiYbSIGn3uBCwUiSklOCfYefvQA?=
 =?us-ascii?Q?zoe0RomtPCV5bCbfTsqBAuxJODm/c7jWsGfcGjSGfcx6KbRktAVG+zGdpDY4?=
 =?us-ascii?Q?KzX2YdQnNI6VsP+hbjggVhgDtuSPHl4vKhxPghQf4QzP1ACCEwfp7DIoMBwF?=
 =?us-ascii?Q?KR2Z5aQ/6mZs3Gu9G3QyKnRAH4ZwVjjYXA8wawPmOdr4+uSNBH4pxl8mNW3s?=
 =?us-ascii?Q?tfCnQTILFBH7Lt7w/67nOtzAl198aqxph5U4AJBey1c0HzX/xDnsgHwwH9wv?=
 =?us-ascii?Q?X72m2NQDkk6+Y2dQQ4MxC4G4I62+4sTN9H1Fpe425pw3wF1cV5tMiBHQdr0b?=
 =?us-ascii?Q?4/HJi4D1IC3nI9nxfjKiiO5ulNcDyKqJNCBFHk9m9ZNxxiYVXD2+ILownBNC?=
 =?us-ascii?Q?UclftFWY3gh2GKQ+1ATpWJeCaK3S/Na3I6TXBbyi3GVTGsIkrNfPnHTA9LTC?=
 =?us-ascii?Q?VtzVrVyiFhU8pJIANbF6KADx3suqVrBNHgzwiePGyLjvLR+ds6gTCKglCGXl?=
 =?us-ascii?Q?L6CLQ/C+0d32D8CBx6vksUhulvG2Xew731+1pm8/VYWtTIfnMhGQP8qHN+WN?=
 =?us-ascii?Q?U8zXPJK8cAsNerJ27VaeHEmHkNQGOPMnR8QAPZiDFxmPJd3n/TrnXb4o4d3T?=
 =?us-ascii?Q?7zzdj6K9UkhwwKKfaAqBm7bl8THEMecRc3vuU0J2b9FlqrkOHFZvbqrniq0R?=
 =?us-ascii?Q?EtqcmkF7kNDp74XvKMxnBgl3PdMqK6BtyiBGg+qmp/GaR7N06cT9y3gahgY0?=
 =?us-ascii?Q?uCIwdkPp0gzz+O1liQ6iFIvUwWQVp2Hijf3SU+8l7JMXT0v/sZ1l//HvlUn2?=
 =?us-ascii?Q?dZ9grLppQdaXmTAPhd7pJBTvh9kb+UQCEThXmLWccueQQ+Sn167YB7+GM0sF?=
 =?us-ascii?Q?pcixdBVpkbQLI5aHo/wEhMZBlrV92tsllg4qHcj/fkDrO9juUjgXBID1AaDt?=
 =?us-ascii?Q?wJPC3ypXrtVP7fEjed9xC4DVPWBn/HZVr99wVqA5nZ5cUC9U9vWuqUWLCZrT?=
 =?us-ascii?Q?WSHjcrZRz3A6RDMSKs3/R/tU2JDF3eCR1oeTUvKdxY+hf/BBFFp4XxMBtmhe?=
 =?us-ascii?Q?qBrRK3iVEpqy9/zUcGPGHZYRAZcwp3gcIgckPjM8HVWKDQpQcgKFjdwU4KNJ?=
 =?us-ascii?Q?lOqZ+KNTsdracl6zMBxDyE9F63TY/UW0zHs5Vct65GdutEVCxMmY+y/jR+rF?=
 =?us-ascii?Q?5ICEARsW/+B0QIm3DHBO1jLg3FPhfiNM5owOT2Itle9n+r44RZLtCXHtnUdg?=
 =?us-ascii?Q?BR/eNpnrirKIpHh6GnvhAYGijUj9Yt3vHQzBzbhUfbgmkXWkFxIE49Ax2Fgh?=
 =?us-ascii?Q?3GHS48DbzOwiPWVbP2LlFD4GlrELA1gm1h3FRywXibHiaPUQ0KL/mfglDwSA?=
 =?us-ascii?Q?Vkx8qao3/cZa5bPaLZ0mxLY+lzYBqPV5Q9zzCqHcb21QRdQ3jbBvL00k1YsI?=
 =?us-ascii?Q?h4FgpkOFiZruuyWYDQ8QlsBAfp5LZT4Y8XvPgkJWRa+XzY0oa4mqP76Va5Od?=
 =?us-ascii?Q?omzO+uF2TCEnsX55AhiJmyajUTwkkUZtHJkfcQGMBoKCkfNK+Lhb11baC+mD?=
 =?us-ascii?Q?ovpTUN0qv5/SV5n/8BuS43gQQAyqBZlSQRh+XrU07k+lBq7voItPWFPoVbP/?=
 =?us-ascii?Q?aH3l/Y666m8yF3xiEG9k+RDGO0mDAbgJ7wCWO9YCtE5Xc7iybuvpZVzxhCM9?=
 =?us-ascii?Q?y7I6VA/3EgHXe/YbpGS+6NR5teM+vv0=3D?=
X-Exchange-RoutingPolicyChecked: XjqGAguRgwPuKKfahczd7R+kPCAdlWPN+Lka5m+Rag9wh5I+6rOGe1TAdtbza1prV33uBlgPZZkJZ1wo4t3D3vRZ/p+vm2JDrPa/WV9MPfOxjbeduHeFu5qUZpIDtLNs9EeOQoIIKp8jc9I+BhkpRKDXfOjknvskmbe4UiiUTjUwXuq1z/cfOWxsr0EhyfhHd/2Z8pMDLXSfK/8boLZpMyAciFKwogS7Dy3mNxRXP5A6Th/f1rQwiHcjsrQl+q3zvdMsG1bzELgd6Ki5xcRNhBD7AUPzmlXDFAYyWp+SBPynVMOdYsIwyGP6kuCDMpr7gUPWTVeAQeIrDp0Cn7Zjdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c5f5aa-628e-4142-d3a9-08dee26ac140
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:27.4303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/qeRHzE2YwmfN3dtXRdXD6H5wM1DjDmLTJEII6MBCmFl+qoX1kjroBZdDinsLUobsTVZRgC+VfEmb1NTW/28OBxOnCCtPnA+n1CvX+jBMM=
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

intel_gtt only needs the chipset helpers plus the small tool stubs they
rely on. The full libigt.so dependency chain is unnecessary.

Switch to linking against lib_igt_chipset, lib_igt_tools_stub,
lib_igt_drm_stub, pciaccess and libdrm.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tools/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8eb346321..a3fef87a9 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -25,7 +25,6 @@ tools_progs = [
 	'intel_forcewaked',
 	'intel_framebuffer_dump',
 	'intel_gpu_time',
-	'intel_gtt',
 	'intel_guc_logger',
 	'intel_hdcp',
 	'intel_infoframes',
@@ -75,6 +74,12 @@ executable('intel_stepping', 'intel_stepping.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_gtt', 'intel_gtt.c',
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

