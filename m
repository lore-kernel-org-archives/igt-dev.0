Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AEDC25B78
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 15:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C203710ED28;
	Tue, 21 May 2024 15:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eh69GTQ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A05710ED28
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716304615; x=1747840615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ClB6gx5XvWJWVUf7mBrp/ztbkTewGqqajEr5+7d4OMc=;
 b=Eh69GTQ1gKwZxkhr5AkddsQcyBZEj5aQJhS1VAyiRENMQIV3+FozdZza
 FoMNmq6D9k8bfF52NKqG5PFYftwcpxgHj6OkmvajJ/rIAw8xPE+ArJBUy
 6JNjQ2sgMXI9Jo3PjQQCXoTF0XjZUV59WjNZOhw2HIltVRszgfqs0xn2N
 6JoZw3TiU0CcziD1BSiyQSmATyTDnpN7aHHj+CUlfwQTQzHWpBXgmphmr
 md4/SfNFpnUMj84S5Ww3faq0k0Lq1e8h78UdqGorulKLGr7waFdqnPYQo
 B0YJj3RBQkDNWHEshyG4aes3h0Hq6Mx6F0ZaHuUmguWsZR7nsJuAcTr5q A==;
X-CSE-ConnectionGUID: LK7FI4IJTOG9Hzra4PsFhg==
X-CSE-MsgGUID: XNw+88fTRgut4LACNT7oMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12355394"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12355394"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:16:55 -0700
X-CSE-ConnectionGUID: Pn3UkPIaRbO0GvhKYN/FFg==
X-CSE-MsgGUID: 3XEGxnAnTc6wROMLYgyLcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="33078479"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 08:16:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:16:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 08:16:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 08:16:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1WO7wcbrcV2u7mARhJZFTucZghG9VbOTgxLcexGzJnFr0xRLhsjFYrB8OuUnJrjLz6aoIaD0wLaX9bbC+cgZeT7pJxo63cXtU6/lv6GNAW6j2LBK1Ol05hD58E2D1OfchzGuMZpdh40osE9NjzshMZ1XcwYWLU1pXuCgcQ6f9ePsagcbjrwW7r/iDWl9+wUQJCDtQp2JW71K7sWmGs4GMkgAkLWv44FqwCX1LYMHxCXyuQ3s3pdv/TNypvCsav3G+p8bJEB7By0fjlO2UEzTUIKMiuUBR25C4sKPl9UkdbJ2AKrFt9KdiOdtZ6U/tGKcbb7St+5ODAI1Iz+dFkNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdaQIZqAcAVXwfY16IXTnhQ75DTYJHdenlQ1oW33RnA=;
 b=RYoyaYJmslzvRfSAtuMFCHXklpWCrgd4u4Z7ssRjNO3iGLXhVrEh3+8aT8m4G59CbQyiIw5x4d28thyZ3hzAIRUL9owAG1+cHuNSLuWuBCx/soBsoILLbsVjusoK48vO8Hd0GzjcsNl/9GwqOomr6PC42Xx/wrY+0zZ5wgNgyA5Sm6davpx47G3/fOBWAI2SeCeefcIuBgcx0xKenFhjF/jQPWkn9hFbS/+zCYOq7gpEeRYgoKqutvewARFpEBX/bDSkcqMZK2Jq915crNE5wLPGPRY7Flvxq9CV14TpY9+6K8yYFt+7J0vxOSOiGe72St32rEvWzYsg/8nqdZYv9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 15:16:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 15:16:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 3/6] tests/intel/xe_pm: Also disable display for
 mmap_system test
Date: Tue, 21 May 2024 11:16:37 -0400
Message-ID: <20240521151640.280354-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521151640.280354-1-rodrigo.vivi@intel.com>
References: <20240521151640.280354-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5088:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c1e029-2a52-49fe-77c8-08dc79a90aaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jNdHMkGdk4PULYAt1H89Zh7fSRNDWnHd37mltBGYa07jHO4GeBlKDtfecqQs?=
 =?us-ascii?Q?s7+HHKHEIvNaL81/cY2ca7VklI9zAkLcZE8uRJaNb/DCTy6nKm98BD99ti9H?=
 =?us-ascii?Q?4asKLygxDK6/B7Ug9gWmMqOS0y7gcp3+AnVQe+fgmn99+x/6p+gazFrXQMFq?=
 =?us-ascii?Q?eq7GlGD5QmL1v7Fu5ySTHK7LPmv+wM0uQNt4/gynjCqlfScG9VbmaqAOAKnY?=
 =?us-ascii?Q?CsZsRqDCy56LmC9K+4KGxOO2SII7LcFw/jHZb0SYMV59RSr/ZZkKHQdoO/sh?=
 =?us-ascii?Q?65zKUTz1F5/SlGLYYsZLDeKcvNjK5IyhEynWdWFRchh/Jou32GOQEIVGbfNk?=
 =?us-ascii?Q?1Xb7g9YfwH//Y8Noph0iYr0vUF7BjTx7YcE99tV3xfL9agu69S+sZeEOCRMG?=
 =?us-ascii?Q?gH6Iaby4bwVohqNm3YC43lhG9VXWsuHOcFZoWhfI1gxs0DIRthy2r7BqVMPZ?=
 =?us-ascii?Q?G0eM0zPmLxr3ZwVMm7IxOzjEIF0ojFG9+5Mio9Cc1NUlL5HeG+09TXkgM3Qf?=
 =?us-ascii?Q?iE5kHomCRPG4JP2E22nOEtItctqhFfNREzXYUv7ZtGetixYWz7vb+kwcRDxn?=
 =?us-ascii?Q?DN5vD/6ckOZ1SgxT03XJLEXmhbc4yTzfAMwxK8CsSIHrh3o1ErpOtlprJ3ux?=
 =?us-ascii?Q?6LV1bOMDpbkcwpwmSS0JMF2AC71FbqQKX1WtZve59ThXLeRGIfHtttKF34PI?=
 =?us-ascii?Q?n4TEk9sjmPUeKAdm0Hj3MatW3jBV6Hpb8R+Lv8OPNbhAxwxRHi1CuAhRkUu+?=
 =?us-ascii?Q?kcQEvzHmDGyx9YaQ+P6mrmKdJAtuwP/iVo/0N42Gq6LBwyxiBZpWPCAfRzBL?=
 =?us-ascii?Q?3qyRnYGm8DroSkoi8yRQ1dv+XicpZXrpB7eh3qhQbMGpSQ7rHlpboggj5Jye?=
 =?us-ascii?Q?EqNVyui18lj3ejv3vOdImhv0e8gKBmYvuEUpHBMpHRiKiMMLtaJYvVNXxgAq?=
 =?us-ascii?Q?fUOh7zDFFgxphKUCBLj6HdDa/b3L21uF4AzSYrY2iyl+5r0kyHbGGFbm4Y/I?=
 =?us-ascii?Q?CXiBEVJhqjHWQKiT9d4BZ/MwHS5Z6+2ArvL/jO1EjT2LF0GBy/hLBgYItgn3?=
 =?us-ascii?Q?ZJ2WKV7/nBR32pboTABc44/NviulcgiEV0NaiicDC6fAhK1/MyvV7Ru+Kv/0?=
 =?us-ascii?Q?bpkJvjRBZwUe0BAIbqupuCOL5qRSvaiJmS+YH7LphY9ViciefCYiZ9OzDyDI?=
 =?us-ascii?Q?P2kCKLWWV7Mq4D3EXJAliWHOL0/RdfNSidbeB2HWUOjqxw8bxlE0foyswoYI?=
 =?us-ascii?Q?DRZ7DP98knefP50wzZcbY+FecI2rQ1YhxPZGOvriUw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FqY8+75KvVmN245KxzRqUUD6pSwcWiR1cpCcl6bac2po+naxJ6LSVCFmzrom?=
 =?us-ascii?Q?jDn7EEpLmbm+yZbf/3+pHUUkhPTHEek55XsLin4uOKsdGpQnNngec6yeiIyH?=
 =?us-ascii?Q?bx/NSeOKls4HeAMmy2YCbmjJbJ2Dm8waUckeNvSGWEFmEWYtcVBlS/22+/eA?=
 =?us-ascii?Q?5YXRltgmX7/jTtAVpCsuZCoVCg6cSrrsrl3mC2fUBcNAPd0m2lu9OVtaFqnH?=
 =?us-ascii?Q?gXefgtA+uriBMTbDIPtqrLHc/xZVvTP467/8REaqkej0eP0S+oG02KTDLEzH?=
 =?us-ascii?Q?vSfimCzemLasJwS+XoVzbJFgSm06ujSFOeSan4KBTzEtEW1ZR7BU2rTMEZYI?=
 =?us-ascii?Q?PULqcLpjccdOaXe3difpyHmE9JXY2TslGJN80vszb+F0Ed+rQBIEcNwXZAAI?=
 =?us-ascii?Q?pjQtpPMmeam2Zg0rynCSKiJemtaP/mDUYex05Z+o1fOw0vwNcprUh9dajdkR?=
 =?us-ascii?Q?qdiukD112DER9b00YqCxG/5ec67JndoMTCyTDMS6th9vKNRk7sO7L51QahXe?=
 =?us-ascii?Q?j+e9oEoPZEEm1iQFi50Oxz0bUmAMIaeqwlK9WgMqwicDBtYyHTckt9r55TW5?=
 =?us-ascii?Q?yWX/uuApoZ7BaNnV3JNywo4B7xvusl2tNN5YzzvOsXHSJ8pQ2HLGGWrV7ETc?=
 =?us-ascii?Q?PZHzrTTPoLZQC0K2vwCAfWOhPvYUVg8xM13g+O/O5l3+wt6Ke5SIjH33g2o3?=
 =?us-ascii?Q?QA8VngL/mCgNLXiDRwiKgQy0TjcRTa01TN3T3d/54QGx0adYE4CkAykK8lm0?=
 =?us-ascii?Q?SbMkhSDW/AohKLOFmosRPDkOv5hjmbWw9N8bGowTO3VJtEw+tvpPH0e3oLYb?=
 =?us-ascii?Q?tccvLCVWICUG27B0cElA5BB8i0KuUkgcOXJMKIkTxZk7MzB1RWZ9pBSUgi7e?=
 =?us-ascii?Q?xh9kHWFu4zc6lMTtgA7/rpAeqrYsohi+MrK77IOb2VIn9QPy0xGhiPZaBXbf?=
 =?us-ascii?Q?bW3DEj+oc3tuETSwtU+raZBUC7IdgjTMTfi+zcv4QBuRBajsmYt8beTKL7Q5?=
 =?us-ascii?Q?zvIVeVv1j7IcWUBi6WpOIbqO/H/BxCKwNhW50IlxsjHjHVayTNksWJdULiqZ?=
 =?us-ascii?Q?yzQKjPOuh/g8XSuqFRMlLJtedgYTLz6em1BhXl+d6tS7V9SuuRcucVyGAJjO?=
 =?us-ascii?Q?58m37zrex+woZQqtFmAh0NkOqTAoGDtUx9KsA29rHCKxIqgs/UuGQl3Ahbao?=
 =?us-ascii?Q?wlHK7cJjd54tnjwsWIsEs3bI5kzqMGu2jDo6UHlsc5pBfTpVcLRfN6wQ5Qxy?=
 =?us-ascii?Q?E7KnQcgGHGqOqwb+Yf6CMfm5do6AbJZGXqMF5PIRH7tQ/GLB2W2TV/1TkCRO?=
 =?us-ascii?Q?J5AevMd+CLVlUrR2Hu9HscExibqQ07eYp+n8vy/5H1lpW4mmsWvNsBEwRwZt?=
 =?us-ascii?Q?ch1LB8kbpPwxR/EsNzVcixGJa7Cub9tGvv6ybqpwNy5O/wtc7lPTC54oz27q?=
 =?us-ascii?Q?j/gF+erto8H8gJ+um9XMoAzuNAOYUsbE6kHyoSsV6+AOUiONcidfeJmT1+fh?=
 =?us-ascii?Q?uz9a6Nkto5e9voOYorrIgABwZlC2/gc7fx7t9XIC6zYtQOyJRffiwOyRNm/t?=
 =?us-ascii?Q?lGZtGhvpuZwq3NIXmJbIOVTgqnEEWkRWEzgUB0ySUXNfysUKptqUsSkSSjNb?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c1e029-2a52-49fe-77c8-08dc79a90aaf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 15:16:51.7236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lA6W+B5CujMb/DV3i9tdQljQ0aGZJKRb5m2jRG0sLFmjKooLzCvy5tYCF5hjm29ES2Czd1nr6WhegItmcqQtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
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

If display is enabled, the always-on components will always
keeps runtime pm references, unless you put DPMS_OFF.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index d301ad031..68e3dd1ec 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -793,7 +793,9 @@ igt_main
 		igt_describe("Validate mmap memory mappings with system region,"
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
+			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mmap(device, system_memory(device.fd_xe), 0);
+			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
 		igt_describe("Validate mmap memory mappings with vram region,"
-- 
2.44.0

