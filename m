Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3142BCDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE66710EE25;
	Wed, 24 Jun 2026 08:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NaXcH8CN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0777F10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290870; x=1813826870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hDL5mMM/E1yWfMTLXmxFriHlNHolDG+8F2ki4G/F0Eo=;
 b=NaXcH8CN9GAlCutC3QoX/L+a9aDpo8fDmUmSp88GtIu67oI9580vSW1D
 iJzdduol5iypUxbGuJEnJAkhOyPyAZ/h4RhIHmUUYOEZMiJvq0CyO/dx6
 f519YYgreNp+IhoEa4DT60XWQhc/dU9rFVxaJXEGLxfH0M4q5SE3W5LH3
 i0FSBy2L4dn4E/CcS1nPjUt8VfTpfPcrzdL8011QHiFSOZ8m5+ylNogZT
 Wz8cNgx436cCcM52oy4L3EeAy72eD+GInJd1gbdowiiRmYFm4wy+fZc21
 qFt27EKfRY7frRuA6xGsW0rEOnwpghTKdVEdu3s94Mwl/OIhn76hwRMSj A==;
X-CSE-ConnectionGUID: 0GPx4g8LQx2P4nk7VIPQ7Q==
X-CSE-MsgGUID: blga9mSYRb2HJvZGlI3/eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="105841230"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="105841230"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:50 -0700
X-CSE-ConnectionGUID: CSL4OW3ITsGo4n/4n5xx+Q==
X-CSE-MsgGUID: Nv1rejWZQ/q9zXM7twWV9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="248880810"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:49 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncQOfMUX/rKRTsFtxIsAoRA5W1gnPrYgYQ0hyVA5G9Xo4AZ2KsviFaIv794VziSBCY00bR1cAObSBhnc8ZyjvQNykMXTcbZTC5do2Zw7FanNyWPthhwFof9cCUeCHbjhbos/tCh0rG9furATQ/z8NLy8O2TbY+jnkricXuMJOvlEZp9+JOBCNbwcRY1LLp4tPlRNZedzC/Gfsq7fKI26CCTuDnk+iQ+NwOC0wKQsrDpZ4fs+pRKvuNyRT3QqIcRmXBc7mto5Ozx+j8jViKT5EKpe2go+m36LcFRxE9lpKq3mSILJqvrqY2dCZZiAsf4LF0WPe630AmiTjAhJzDGuKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4MT1VqMZpNPiiZjsc+7YPpda9fCb8sJKn2FWnrXwi8=;
 b=VgspntiKCQp/dTVqpd0XKWcmW3NNvD+IsP8ykltUeyH3N6J91K84Z+oUmWGbx0K7H4PSd4u2A0zEKotaOOIFR0rJBpQMRCh9IVbfMlvjHtOdWFo8O1oKh8WgIPDTONHQMjgwe37RJxysGy8a6pOAHRZHWi9zBbkM0Dm80QUkoZ8fXi+G62nQBHNNfXJStzpmunMqg6V8pTdPNMl2K30VHVQYmh3RCmbTV1HUOL8fXtehzbOsGh2RzRp8RMEeiTAAhOPTxfrbs9DdDbvGeU99mZL4FM5uSbAfsmdIsmxMG7GZOGs2gQgOFJaU1TehmNFoC+k83As499uASfflRPobRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:46 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:46 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 13/25] tools: intel_vbt_decode: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:20 +0200
Message-ID: <ba9b15d5300a9061b6263f5887c21f927555f713.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: af16125f-247c-4bc5-7d63-08ded1cd4384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: s3jFrlA691DhE5cphUBea2SUZb+ueFpOyGIvwT2fSs/FP+eKGD5Fbl1jXFu8i3ZqMQemP4pUg8uHdvGPipeIk6LzlfWo7ZSNkc8WUc97euf9qPAys4TbUSqw1R8+bRQOWwSm4xF9CRfz+V2mKsIPAO1b4o0R/iHV/fNyKGf29oYlLZtpX7nZYV+l9yhOIpt5GOlvzB4Q/NABi9LPbp9s/k3R599eq1nIZgszphcAfWevS3rY6Og2uZjdi/KqiZs3WNiRBhxoGx9T7WN/ud4uVsG1po6yMPjgAhLWHOz9JbrFuhwjxMkEmxG67zyxmFSdaWfSTx3QGvh+u0PUezuUHv+UUOwfJTFlhgCqB0D8Js9lQzGB+fP8Zr67Hq9Og4eqJ0WDWpPGdDy/VmbXAA0vIpF7s2nveOf4m406INDZMI1YEeCpVYxZ0lflkSUFUm7Lfr/f/pbyAantN4Lp17VxCVirxM7QXTPDOXngzBwxkmiy55EKWH3FLfrmRu4hbIxahJ0gIHHtm21l/ODptRUNKDHvdNPN/s9l2/X4XW1mQOYmtakQrsdeq6VF5BB6EFDZEnMdS86WbwS2TU6DLA92olRaCtmqu56DYzMUeSr2Pv+5ZdceYYro3ZXwZ3T6TcmmVkMFiSe4nERcZc30zMDEriKFcXhBZtW0/dUnZJ+JxI4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r10ikEv7BASwMzrhyH44i8Mk4pNJyNuUlkNNjgPR361imotggRtKmGlj6F3K?=
 =?us-ascii?Q?LZSYEL0OrpirQuYHIGh2judYWhTtA+XAVVJ+oxF7kJymNaRCBNgIKjKNinCJ?=
 =?us-ascii?Q?y3fuM2hqKSrsW3qSHNB6fKqSTMDypP+FNJPSCl6pgagoIho+aHOCiZCUJ4vj?=
 =?us-ascii?Q?IIerSfI0SHJHcLhzaZ3gPMv+tdPX+CUmgJ0wZpQcTQnCpHZJNXCaPNzXGyRu?=
 =?us-ascii?Q?+qMyhx4jfEHCE/iQ6wXBYcBCGG69GMZ14HG6/WXXAPkBJupZzDuNwyLq92fQ?=
 =?us-ascii?Q?kNy3IV9L99hUWLlSTA6/f3+CcGDoenT9MWNq0MrpP1sVFSD7kEdI+SzvOXLL?=
 =?us-ascii?Q?FsC9Ts92ysqdbF3MiarlcMP/Pu5k+PN3JrGMk0fdynSkGXwz/d2xm73Ru9TB?=
 =?us-ascii?Q?m+0v+eXecnz7ZNOQgMmCP7ZN36bH83sZlr1BwDixFD+ztgdMAPNzgtOjl8tv?=
 =?us-ascii?Q?ZXCwdRqs45kXLzL+QjzH60MKcASa6duy9BXgrF4RshHumNQhZy/HwRN8bFyh?=
 =?us-ascii?Q?oNwJ/qEJufNiQntbRM7orWM9DICVQOe4o+9yMQADsfjstVwoXE2aIJT2Oe6k?=
 =?us-ascii?Q?B//zanABpv2hNKd9w9eZtiMyUHPTtoKJ8vdB6NWJz7+9emYtCEz0RVGrrPxi?=
 =?us-ascii?Q?0PoQQkW/qDbcpiN7inEyEwFcMB/FfcXaXMplsddW5c320vIBxPl/dZeqM2Ob?=
 =?us-ascii?Q?DEtEL+yIB3tkj06JA+by9Cpw+n/CF+GdR1GASbMFcTzL9HQPuXwk7qoKVhZ4?=
 =?us-ascii?Q?a7qOUv1ctBD1zC3qdNGuTfpmUwnr3hTt6NRGJrBsnViskTpFvt0y52lXumqK?=
 =?us-ascii?Q?X3jdJYcPVWxWVusj5fxuDK3vM9fAZ6PEsmLxKAmdUprgRCDASsiIMyZMg6Sz?=
 =?us-ascii?Q?c213gjb9SMOe8BJhBsldSgSE3rg+tT7CqYQjTnQR11haquIm1TImZ/s8IXPf?=
 =?us-ascii?Q?88HcgwaQI+cWQvXIPXINKWuLcM+JveowFJAVR31wSKaL0+R7Vftk9zLZnJfz?=
 =?us-ascii?Q?3Lqz8X8AWc+eiOH3gfm9/jDYFqCD+wohPsIgvC6LtrsukddDwtfGsHT42tDl?=
 =?us-ascii?Q?4M1dVx3r6al7JXHKv1ffQkkz801CYrtPEE6KSfuzr3WVdy5xVTL611Us/30M?=
 =?us-ascii?Q?PXpig6zcW9nk1//13diWdtkHQMKV9FwNSinFYa+2jH1HUtVuFN+SgLSxldcs?=
 =?us-ascii?Q?DZcQLk3EWdJCsznlh4alc57/3+rJ8I4z4aE/IUWkz2cuDo1flBRmO5sX2knA?=
 =?us-ascii?Q?csJpnPf1r7Nwy8zQM74nhvBwoD3UzDmkwaw1GOjvlh47wTpYF1dgExDBbAPh?=
 =?us-ascii?Q?8bbPpCNr8SgW5XIRjCTHRKuZt+H7vKkUuUNlaKNT/Wji09iJgRMc3XMxZbTs?=
 =?us-ascii?Q?CAR3QJ260+jvCWmHRfLI4QGlJBsZq1e23dKZyV9Ql/zWQ2gjjirkcYgQFQgO?=
 =?us-ascii?Q?fLSBRwXGL3UP+bR9wgFGBjzoXGtSYioV441DExs65RgtkiM9197PtIO3RWRs?=
 =?us-ascii?Q?PESLdnbeS/i70uHP8CmKXxnf0OO8OY6IDcslsQ/TNBMLT7Ms3Db6XAiYMUpB?=
 =?us-ascii?Q?BCKG5vP+RAvzytb7kGhtdwCEiDhIXcEDDayShStyMI1x91LMQaOWA/LjowwB?=
 =?us-ascii?Q?RyprV4r4c1FsX7LTB5YAhMLsZMclYg2xn/K+m8eLGOuA4LIMUbk2WFJuKbEu?=
 =?us-ascii?Q?2iSejQuRMKlbIBjawPVFMWxbR4ClN+5/+dxAiMQF60D8NM4tHOlHqYtqzCVR?=
 =?us-ascii?Q?zkgpqgDR0TtdQ+pMM2Vn8Da9fTYrrpI=3D?=
X-Exchange-RoutingPolicyChecked: eutx6rS9TrQ9pZ1AQdD4mGdr8OXSM14XdX+NCwxEhnTcrVChuJZvdL5V6hmzVXa8mV4Wq/+QDp7h0OvKPOuUrNqWzNm7ltIZ8L5ffzWBb5gDp3APUIHCLvpCQBP+7qRd0JCpL42xBDc/LudoJmvCP/9kqG2cCNaD8PgGOzERjb/mghecYZ2MSH/Sti7nc/PBcwTvmRgJrvDANmJnClWRx9lsFFyCq3HMKsF9jd31wXNxnAJcvpAWvrxbfaO7fsdzpBQ3HS5givljVyJrmMLCN+msO8eTPojHrrlrfHn0uUyQGBjX/1fFCiRNDptBpXpRXbwPuEKQIgHq3d8kyCy9uA==
X-MS-Exchange-CrossTenant-Network-Message-Id: af16125f-247c-4bc5-7d63-08ded1cd4384
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:46.6953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vuqT2xy0ET7k+pLn4/2k6TrvlysAzfiWfUpdvVrkw8tu6EqfPrqVacDsmBoCJRKFpvkCNPz/c/gqLNGOfhh+1ygPSJCViayHnxZpx/GNY4=
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

intel_vbt_decode only needs the chipset tables, half-float conversion
helpers and the lightweight tool stubs used by those helpers.

Switch to linking against lib_igt_chipset, lib_igt_halffloat and
lib_igt_tools_stub instead of the full libigt.so stack.

ldd before: 35  (ldd | wc -l)
ldd after:   4   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
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

