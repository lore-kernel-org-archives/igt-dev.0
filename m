Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3191AC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D178010E60D;
	Fri,  3 Jul 2026 14:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RuwdySlv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB7310E1E5
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088971; x=1814624971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OhKiY7+k7MVbPoP2xOSn37qHts1Mde3ryynZ3SgiS3I=;
 b=RuwdySlvF3VvmraaeO77CIREL2bB+mlY+cpHxxK9WzOoAymy08H7PchH
 yZBidAH5sfgb4C77bjr6sIzA/h8yw1h9mMi7RzBPF9iI7SHE/4B1fSvkh
 X8GyB5Vtr79qwYR7CItje2Beh9sZ0cYUZP0fpvIHzz5UR/4NCcoPCKx1d
 3V6aC0i2/fHfwnz15wg0gbZ4cmOS/4x042rXzAselnAYkQMdb85fRkcyJ
 zg++3gyhLT5BfVqcSn5QMT6rndj8fkWgCmsrQ2CPs5UnimceOcr0ZuQ+e
 IHzjEyNiCvsr8HjSI60k4WkA3Gdm+MLeVpJYH5AzInRtiqx2IWaNPwXT3 g==;
X-CSE-ConnectionGUID: r2W+49bpRMuZltQqMx6NHg==
X-CSE-MsgGUID: KYrqUhcuR123UqLg9SsSJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101264107"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="101264107"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:31 -0700
X-CSE-ConnectionGUID: hIgZF9Y/QvG7lyaguLRPdA==
X-CSE-MsgGUID: 5v7r3YQAQZK4/Vgf3/4SHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="257019607"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:30 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKxIipXlY5R6BWYJNYm9GhhPd/EkR7+LnbmRT7pEsWp1dR1Qi7oSd0sYfzQ33J3euD6ie53RtrFUbdvqOKEfk4iOZPy1ToHPsfOlqXXXjSlMhku+GUvVTzHxowAs5whFxyEfyP82l9zTPD+SdKdDvldFaDDbObDu6NHqV+v6JRw86Ekz0KtsOIOaSthfHELrRy9rMbaBOu+cHznGwhRkrrb+J1bKzR3ta6FuavGWnYpVIA/hzAKfLQfS1gDLhgXZ7m8bFp1IkaVSP2Qd9JTMgh1ozu2liG9RmVp5RYRIwOYG5dJeQ0NIXsmBfmvafK4Y20sD0oGUQQyEW3dUYzuCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZmR3QZjyiEC9PHW4AhsbIdGp5BSDzOlRXdCh4+6rcA=;
 b=evLTd1IfB6z9AFl+ZchYOSLRvrx95eBH0EC2CcHOWFU/SFYvy2hGohsGJcg0uzXWhWz44wU3oozrJR0hyfiTasHei9rZ0bpB3nM+exnEazD1kWTWYVTxgFZnoO95X81r2hN34ofmTPDBZqax+zRe5+m57BvHl6vKU8fGafyw/xfchh6iUKw4Mqb0OyHBuGZBkTx3FSZSYSqfPdsoBGl+e98TQbcZ7Po2lU3JhmVUN1vPnZ+tvSfWjP2i2bmg5fHNELDcrDvqdoR8OzXtCPdF6sz0H40yLoffcko1keNwy1o75cnzPi4Sg+qd1yNrJfUhJuYypQD6X8GPYWUa1QmGVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:28 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:28 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 25/31] tools/intel_infoframes: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:59 +0200
Message-ID: <f3d4fcf025c904933886d0880a5c538b7878098c.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ecc4d2a-9827-4b1a-1e4e-08ded90f7d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: aF6wKjLiJ47gtbwvQ8kHdUzWTINFt4kCLi1If9oaqrEg4V6edJmfGaQth29hL7hxIdMBYFuYCUUlckkQizAW0mwjY26wrkkXM0GzLHYn7GmZq60MS9jYpIFJEkJtvxdkwhRbUosf/nk6wa03ha1mpiQ8B38ekEOcgL8uAhRzhsOIteKm20GDVh5Rcs81QV+ccUAIZPkabtS5Uq+A9Gciha7ZC+s0foZtohYUZ3zFPk72EElbuOdfXgqqLrd5Vo50xx/jrBCtjBpX0DTYVNCo4wf4zFBpFsQVXOfZaw7t91KUUW5kh1EksHC2ZFWlmPieYxIhdJNlpWL1GIVXLQoz4JykEzTTqn9tZnv/mu0Z7lBrSSWn44nZuGg43plQSU/cdBS0ls/ZzROOIM1ONH3uVBf6Jopcfzv7AjPkxz7+BvljHFHL59tbb2RCl2GJ4Plk4ctNtGhVaHaqklQBwIVVIuKOF1+CUWxplryAim6Z48Y2PLRwRmq+2sYU7Q9qKjqPvWXA0aCvZwwYNRG46B2JnJpVc53PAEGodS9uGsLLrgfDfAM23Y5C9RzZ2Rhw6+6PpH8rlN1Fuu0+1OO5zk8th/5Kn7MgpaSk4ibdcpi+hCuE5EEJtgeGdVB5LbM8+L2oQqMONY5/bQL60Qs9YQadORsXDla1FSBt4f7TI8li4XY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8pVD3Ik/YJ3zDsWDsm09SJ86/oBTiuRU+vDHhXoXzpkANfKSvby33LVZuz/o?=
 =?us-ascii?Q?YsUUUIUr7kuC+0r1uF8cZigmzi9E2OzXuTQj8WmB7PCrKu5sIwicOIEk/5PA?=
 =?us-ascii?Q?Jf4ATj2LDZYn5h8K2n2XHXESUQ4Hg96tdxl91xLUkDltb29eK0BWCIAjou75?=
 =?us-ascii?Q?/v5T1xQvOhWSgcutfRattlLtBhAkwM7U0dbGAWLLsoHhdCeV0G73cBCarj0V?=
 =?us-ascii?Q?Llm5dARVLjBHvZoiGcfiqi62soJ4IBnBy38NEEZWkBGMWQlUXsPGOGpW7FPh?=
 =?us-ascii?Q?ric5hIbUhAYthx+BODEi3vBh+Ixdfnjua3KbKzRUFHgfQXRtedL8J8ozqgQI?=
 =?us-ascii?Q?8ORwQnABb3+GPkzxX4mC4tWksF/iI5jLCSmYHhdV/Qmo5ZtkC+C2gfb+izDv?=
 =?us-ascii?Q?yZfZ/G6YWl6dGO+q+delC/tBImibfe0LJ3FIt/iEzcwdzeec1L1SxRYXf+f+?=
 =?us-ascii?Q?JCdjsH3eG4TDkXv6xyTJId7ASePdaxpBGPVmGy/Qzj0Fp4Qy0c1wVb2iwts9?=
 =?us-ascii?Q?DftX3TyNgX2m1HW7sm7RIhKNxP5VBrbXFTbnN0mctwhRqMat+6n5+662TK0y?=
 =?us-ascii?Q?umws19fTjyYCBsui0K8SnIqW0fA6dQf8iGir/ihl81DBYAp/Vehxw7gWTU75?=
 =?us-ascii?Q?PZNQJxnjIYadcrCue8uR7/H4rVa+oLk+GdTzarvK6FWMIWX3rZnC1dJYEK/U?=
 =?us-ascii?Q?1mLT4oNSUwhAUmj8KQ5bpRspex+HPVZHSsTqw+tQQRg5olPdEfeK8/n6o232?=
 =?us-ascii?Q?n0aWC8jFeFy1zUMsID9YljpWRw9qEw6yWDcuRwqOfpblXKapnDvRyLuBlipI?=
 =?us-ascii?Q?r6WIzliSgXTKLSBsYJPkYYMRfby5UzYkOZnuuoBmNusYlAlsqJp9bt/ZcLZE?=
 =?us-ascii?Q?8vES2Hh2zbcwe/psCu5z0fiQ5WrLfqHsCnD3q8TWiw1yoZbxJPCLU1gZlwr3?=
 =?us-ascii?Q?s7U1/6jtZimhwljN92Q85Gb4BPTTaL+z6X2lH9xaEb7vVEzo0BHJwoT09Ge6?=
 =?us-ascii?Q?lOotjkBWUDvJBiEcYzwQLfJtDvgrSXj332gJ3jVGcv9W7aqLgarArKClFRcd?=
 =?us-ascii?Q?j4GzShB85Wfj2D8m+VIL++F2hxRUS0Nnz6RzHK4tPLRhr/77L7JmxAtf/4gc?=
 =?us-ascii?Q?wNl0V1u9L+ZVE2uGCCawzg8loEsiaucB5BTfTLf3e+dpSTs/sfRJSuZiSVoZ?=
 =?us-ascii?Q?uNPgnnwj48i2hwl54XTQ6U/oKNbuY114eWsUZxvc747nRMvySx6sx7IwIWHN?=
 =?us-ascii?Q?nRapF9rRmxP9wju8+McKGaqECPj8KD0sE5RTeHGv6keJErjavsf8f10KTwZy?=
 =?us-ascii?Q?PItcR+m/1S3U34+tx1rfTo02UKdyypC54EoFnBX2BeVW9b6X0m6ujB7sc/9D?=
 =?us-ascii?Q?obr6rxyUIalUDnSirJGcYLaUnytsHkVmhw6kICeaMLsJ85w23fjy4q0tQVrr?=
 =?us-ascii?Q?5oc4SSlbX+HpG8IfNS/Udr9MEipNi5ScDlg4T8tje/DQ59IQOSnEr32iCd17?=
 =?us-ascii?Q?ZDKg76AMK4APWOU/vG71ge7oQJRipRgDgzt4RS1lWUkg/ZBfyUDBlqTU7DUy?=
 =?us-ascii?Q?zcovPNzFq9Yg7QwXMCdUokdK4iTamSQnl885xIK4fOL+w6Z0KQj2QSzpoaxM?=
 =?us-ascii?Q?KEpkrVyZWW8aJZCyhMNIuQokL/R2dILaD8yasBLj8ltQRMX4EE4Kcxw6/7yw?=
 =?us-ascii?Q?0OyLVMt567gU6AZ/BzhfgtxehiVQjYZUXZ/3dNqVHTiM6Rnr75uwf4hKE3Ch?=
 =?us-ascii?Q?oifueKI9+iKaoGuSUrNiSt/gvHnQjdM=3D?=
X-Exchange-RoutingPolicyChecked: O20jU2qkB05hG4tEu91RpFJTvW2oj39EV+txD7zshfoZFS5fAv5+mBrTBygnBip5ImmqOFY5SPWxIeTbEcqhMKXG9l8Wx63dmQf+/LSZnY5ZK0GvsQK4Gs/jYBCL6/PrNkADGvRyYBDh7c4zP0qUvdL98kLo2imhKDR+v2Q8awdo36fTec7FcKp7FpEQRjTRrFVppUp0zqmT+OwMeAtrOqbDvC0J+JHHdK8D4nyzWFumhOy5h/5zlEMW0OwXlgAYN5scFUnPDawTsPZ/yYa1OadyYsRxzH84RDs4MrNu0qrLt7OQJY5VLVbvLSvwSoeWoCafOlaf4NHE2KPm65xmkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecc4d2a-9827-4b1a-1e4e-08ded90f7d49
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:28.5416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDG9rXMyv7X45GESeDxRP0Mz9hPb078NgtKzz1+8p8IH7yaXCzEglqWEVYGrGfiuic6ltnM8dDgKizsrn9KNMHbc9/Fh0SwjyRxYs14oW0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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

intel_infoframes only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 32a345e9d..a31b6d0ed 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -20,7 +20,6 @@ tools_progs = [
 	'intel_display_poller',
 	'intel_framebuffer_dump',
 	'intel_hdcp',
-	'intel_infoframes',
 	'intel_opregion_decode',
 	'intel_panel_fitter',
 	'intel_perf_counters',
@@ -116,6 +115,11 @@ executable('intel_guc_logger', 'intel_guc_logger.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_infoframes', 'intel_infoframes.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

