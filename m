Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5392C25B7A
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 19:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1BE10E3C4;
	Mon, 20 May 2024 19:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHc2ILGy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC3D10E87A
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716231853; x=1747767853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ugo9U8ok+HY1BIsTkP/3jgX1FqJjWiSOZ8rW6Ta0Uto=;
 b=jHc2ILGyeenph4VhXQUPFuFLCoc/0Phs28bkopU5JGqZNbpevYP4sZ4R
 e55j+b9WFoXhydUobt8wzdOdQrouVx8A8XPemvs5vJ82ATsZqIIfLSOEU
 2M6Eo7qcQhI7jWKsVUP/z5P5148ToaoQhDXx9sK9I5Fczu2QcEKfUl4hU
 2P5IAYZFY6USr1Vsfojic2UGKxz3yWTuACjdJMDQVcXM4GD8/QLSIfeq2
 0zjeHQf7Y7Kom7MioBL5PDU5dvCz54aXnEkULWmId9r8iNE9oo9yEh4SH
 +SUtPnioZfLHixCUBnkZeVjdy5MGKMofhByUPOk8u3Y9fBxdVe7y5V4j0 Q==;
X-CSE-ConnectionGUID: lHIf8zkEROOapbIUMNc55Q==
X-CSE-MsgGUID: +ej36NNgRvaX2lEwfu5oYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15330797"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="15330797"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 12:04:00 -0700
X-CSE-ConnectionGUID: FBGApgldQA6GHPzcOy9zkw==
X-CSE-MsgGUID: cORj4Y8mSJOK7aXBHhxYbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="33199934"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 12:04:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:03:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:03:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 12:03:58 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 12:03:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApI6a7x1ZDsrpeTNSa8L6YgP428yPpovcs8rBtWRbMvFiqmgnqUcRUngmZiE23et8K7PaEqkoRAbMU1x8KcI1VfMY01zFX6w5YmkzxEEPgUr1oy5qW1C9kn0fCcgGXLmYJIwsa8xc9usa6C8HEWw93oi9XzCYRuJqzhjJAEqEeqkwYxh/yu2spNDIdJ4aG4Oh0tby36oC3lXeMeTOAKuABaUClM5N8epV6wAXQHmfZTy23V+JwihZMmzcpkBZQo1i9IVjVDwojP7AJNYbj7ytG5hl98ZwECuzbqP2dFTHOAPzPOONO1OuMaTJSsfJAVB87bB5aUNFJvrHwKrUb7VvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1S7179HyWlPEQ0I50rZ0tqWkedxUJ6DY9/uRbJzadAc=;
 b=hJX2RhbAPlbXbtUc3O8Qfglvq5rfUXrMyJ7M0GnPu+mk5WhPFIjBtQuHcTMYjvBolhWfF6i3QiUa3etMcXaTTNYfBNt6C+E4Yy7Zjy4a+yeflaM199Nf1vxVttSafNW+X2NvFCRc/NX8eohM9toNczIwt/np/EWB104wnUwn91DavmUkLS9djL8qk7aCpaGdLGQBv4Ki9h0TUWfesum4qkH9PBTd29owhhVz41jr/SacyYUyOkV9kzXSWIsdeQPAVN/5q4hsWATHoTvDDW85M5Bjd+5vv6riY+Opbdsg50c2/kUWC9/qlWlXCWht6yj0WCNYZtFXtzVUPVVH+htovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 19:03:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 19:03:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH i-g-t 2/6] lib/igt_pm: Fix and standardize IGT PM library
 documentation
Date: Mon, 20 May 2024 15:03:43 -0400
Message-ID: <20240520190347.242249-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240520190347.242249-1-rodrigo.vivi@intel.com>
References: <20240520190347.242249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0090.namprd05.prod.outlook.com
 (2603:10b6:a03:332::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: d11de6df-cae1-4ed6-833d-08dc78ff97b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s7rgRS5KCtOUjRzjOauHcjvjbznQqmK/R2WymU8OvcZCP9QYp4zf4dlVGgP7?=
 =?us-ascii?Q?QVA2Zc103BQid7nTkt8KcW1GaZoRoKycoxqXPQFhArbMwgMFARjUag9MFdTV?=
 =?us-ascii?Q?u3kPrk2dSbcmFsDVG5vcvujBSwtGkO11DG7CqiS66B6Lab/0xu0IVLxZMv0l?=
 =?us-ascii?Q?2Ma4iOGgOAc9RXjj0ENFun4Lls0Cxw19JaejXwn/dHSNRhBbBK0VaKNhsEcZ?=
 =?us-ascii?Q?/PeYc2gjLqfQJgAzbTrSw1kYo1sgMSdWwCrdpIqpjYGwKqglTGngoPYZwcOi?=
 =?us-ascii?Q?oofOSssQdkq++CswjtdLcfBDIgp6dcuY3I1yEB2tzSg4iViBnQuXGRobhZHr?=
 =?us-ascii?Q?zkILMFRydSH7eGmUaNxnaj2uGQhOFLfhZsHrYbHwY9F+ML7mKA9Vw5xkmhys?=
 =?us-ascii?Q?EBioBApBRjpMxliFLF5ZCgbrSvhA5Y5vSrzI9ev4iRFsTfDR+nVZkPRrgezk?=
 =?us-ascii?Q?pOzLegiCw08yp1eM1RrRKcEnylsdPneHcWcxIja7IEUj5raKDf2UxYXramDs?=
 =?us-ascii?Q?nAkmk//Ownw0L1hcF+y18JE7mRp97JETF/5jTbfA55VluTQrvp1Saa0g9yaz?=
 =?us-ascii?Q?QA0MS9kHnKR6X2V5SMxJyN/rYmprent/jhfsaPI1xs9O9e4vSywn7UnhsHG0?=
 =?us-ascii?Q?cQy0lJRFLg2fmxGL8UZWTRSzYgEATTdh2OYmI8UN673wG7etyBO8yZCAQAmc?=
 =?us-ascii?Q?cxW9xiIc7UmbLSQx8B6sSo8mStSlkEsfepLt3Z4SFzQ3IWPrrlZYkS/g7Smi?=
 =?us-ascii?Q?vBPUPzar9HGWFdSA8EX/Hfdf4wzpj4BraZ6J+VYfnQbdB4SVDXZ/Y2wh/CXi?=
 =?us-ascii?Q?1AQ7/46BWdkj3GfB7NM1fz54OzBFZKOP+Z8wfyrCOnKKr++5ushDYMxgr6Wt?=
 =?us-ascii?Q?uuDD0/nUvsK7qhVQXUpe9RWtP5BI46ThqI+BxAiBdTM07XKEy2iSx1ZIQHkf?=
 =?us-ascii?Q?YL2HhW61XMT6wH3noX17ujWmcS8qM4IXQHcPed2bAbDHqu/jvPe0vrJlUnt9?=
 =?us-ascii?Q?ULbzu5sPjRS7MAWYao0qyjt9PiDxgP7cgSG7+aMXj2Sl5CKpOe26pyqifVwe?=
 =?us-ascii?Q?2iHNdyeNBnGrNBhDx2+JGTIDUYhyYhXfZ+oqkHOsPrY2JJ9UVc/XqhZlPjBs?=
 =?us-ascii?Q?/EE9Vh085Yph84d/MCQRIEsipKGKxZVb5qv9kr6vd1/MzpAEmm8RPopmdF0z?=
 =?us-ascii?Q?ioXWLkBqS7cjlX5l60Ae/xWBpJKs8hBPro3OQQyYUTP4jS4CJQTLajdEvH4D?=
 =?us-ascii?Q?nKISWZ7v5f0ITujJQXuvlTQaYV502PnDFQ0dnlqA3Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fslVTAkPwhkNYD9euEUoAZXOwVGmornaK4GyXx0Rio9yqGtySMd8ZY5Ugjl1?=
 =?us-ascii?Q?7WcirPUSgU5zgnUFXECWvC5e/H2HV42pQfMEYA0WakuRI1w2CypqyCusrmdq?=
 =?us-ascii?Q?KpYJlaEudHhOXcVC0mCK4DVMeMjm6tIC5uWYup/uIkPWsFShiMZZjzz6G5n5?=
 =?us-ascii?Q?SZFKMRhdQxRkCkYfDDUd7hX37DIXOiswc6F7pc/uzhV0TWvNdOPWDV/vYvCw?=
 =?us-ascii?Q?BVT3IVb5mugk397pzF6iYzAbxOfv/ms4jGDN4vzOTR6DJI6I6OvIBpETx5Vj?=
 =?us-ascii?Q?vBoqLFYTjEY1O9Z37Z9P9q/k5Vfm/F3oh99G7+t80Q7f3Y1gw3aBLAoJuNNQ?=
 =?us-ascii?Q?9dwxj2GpALUfPeJfByCiZcetun65am+1NT6IQ188vwaYi2PIjPPLEguPqZTn?=
 =?us-ascii?Q?1WjLRgETV3Y4cil3o+BhwyZVjCLS3OTgjb4B1EXqSbtdWHf2wVm0HbEp5v9Q?=
 =?us-ascii?Q?b7cf8zB+SSpxkjFcOUiKX3GeFo86WJnZ5bACeZie3GTjCxgORnd61sUnpgYf?=
 =?us-ascii?Q?4Y14s97V6UL+SSQyO/ucyrBPRrr9FsF+FCWouLNaOaMMCvxSlnBKGej6o2dA?=
 =?us-ascii?Q?idyRIraeWHnNfbVxLqD7JSav+7e6GBOgmAWDUdFJAvRUN/VOOaGvHHFOWMWO?=
 =?us-ascii?Q?fMqjFpCVisAnY3ppzj+CZ4oOVOOJBCMk61+1myafkr3pEhDiBNbPui8603wE?=
 =?us-ascii?Q?0Qi3jTOyXYK2ozmFfM8TQ6QUeNd7DAo7jXjnEzFoHLSEnB5gISaNpfgB0w73?=
 =?us-ascii?Q?AaU0AK+cfEwwRKejJmKICAjlHGqh98+DmEucKLFHexpQDkE512VntRgVWK/y?=
 =?us-ascii?Q?c3rZe+eIRzCP9NHrfqHZ1sfso54nw6CZsEEKfjfqiswQD3MSs3+WojCofY7t?=
 =?us-ascii?Q?vmhpRr3x9uBlRF2JriO3p/F8yI618WXiDcRiXogvX7C//uGqrbmHSzBLC44V?=
 =?us-ascii?Q?3G/AHkZgfHT8pLd8vNihQuJFSVbgxWOZQy9QFqXZZsIStHzA/Pt9GtKedisq?=
 =?us-ascii?Q?zFG2x1oqCyT+LOFWkGzv7Rq43/zXkyLTu4UGrw2ZDamk+B0EpFw67RnObwlb?=
 =?us-ascii?Q?DMR30mxh0zE4wMGo6pQ15+/03czpYSPcVFJ3G0x/HaWVYAQ9jc3h87wT4cS8?=
 =?us-ascii?Q?B2UzPX1YeB6HNDXkHwONBWoTTQ0oSAxi/SRXlaNgFvHX1jY/15rTGnlzxjfn?=
 =?us-ascii?Q?PuoUMans6sk1tI7Q5DuJwuIAb+UUUE+0DxjORgyiI2PlbubCJYc88lRfKIth?=
 =?us-ascii?Q?ED497M0+FWrj2N2QXbXxRARWMuTrvt+r1vSYxKfxEJrRupf35lJMr265JFat?=
 =?us-ascii?Q?ddrbDxfyS9C1seHTbo5B0zrCqkVS1rEt4DfnTfIIZ18dwzR7FxJoEr89ba0+?=
 =?us-ascii?Q?SppOFaljqZRmSqyTqChvPbs45JOctXHUVVu0Ok2Bb82m0aIkNqI0wqsLsI40?=
 =?us-ascii?Q?Qy+riexJmAgQnV5CDhM+F6M0Ncic9hVZyjuhWXmoVOhjVFYN8SvsUTRM8tke?=
 =?us-ascii?Q?eNXxv5rE14n6Hr1hGeAChYjKPySJMQesGIFYzCHdxP53XDunMkSIh2Jn74pS?=
 =?us-ascii?Q?9ZoBomGIS8gbqn10PNcrEleMh8fT9UMs91mWxKRHqDsEUZSKK1nVcXmTuJhp?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d11de6df-cae1-4ed6-833d-08dc78ff97b7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 19:03:53.8811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /svhtx/9xz1ln1SzCKpT5UFS25LIfD2XIDGPQMza6IElR4AgBUbLJmlCkD+EOZina3GyPwLFQqPprJZpZKf34w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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

A revamp to get some kind of standard in the various exported
functions in this library.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c | 148 +++++++++++++++++++++++++--------------------------
 1 file changed, 73 insertions(+), 75 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 9904f976c..d54549d11 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -454,7 +454,7 @@ static void __igt_pm_restore_sata_link_power_management(void)
 /**
  * igt_pm_enable_sata_link_power_management:
  *
- * Enable the min_power policy for SATA link power management.
+ * Enables the min_power policy for SATA link power management.
  * Without this we cannot reach deep runtime power states.
  */
 void igt_pm_enable_sata_link_power_management(void)
@@ -469,7 +469,7 @@ void igt_pm_enable_sata_link_power_management(void)
 /**
  * igt_pm_restore_sata_link_power_management:
  *
- * Restore the link power management policies to the values
+ * Restores the link power management policies to the values
  * prior to enabling min_power.
  *
  * Caveat: If the system supports hotplugging and hotplugging takes
@@ -566,8 +566,7 @@ static void __igt_pm_runtime_exit_handler(int sig)
  * Sets up the runtime PM helper functions and enables runtime PM. To speed up
  * tests the autosuspend delay is set to 0.
  *
- * Returns:
- * True if runtime pm is available, false otherwise.
+ * Return: True if runtime pm is available, false otherwise.
  */
 bool igt_setup_runtime_pm(int device)
 {
@@ -658,7 +657,7 @@ bool igt_setup_runtime_pm(int device)
 /**
  * igt_disable_runtime_pm:
  *
- * Disable the runtime pm for i915 device.
+ * Disables the runtime pm for i915 device.
  * igt_disable_runtime_pm assumes that igt_setup_runtime_pm has already
  * called to save runtime autosuspend and control attributes.
  */
@@ -683,11 +682,6 @@ void igt_disable_runtime_pm(void)
 	close(fd);
 }
 
-/**
- * igt_get_runtime_pm_status:
- *
- * Returns: The current runtime PM status.
- */
 static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
 {
 	ssize_t n_read;
@@ -711,6 +705,11 @@ static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
 	return IGT_RUNTIME_PM_STATUS_UNKNOWN;
 }
 
+/**
+ * igt_get_runtime_pm_status:
+ *
+ * Return: The current runtime PM status.
+ */
 enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
 {
 	enum igt_runtime_pm_status status;
@@ -728,12 +727,6 @@ enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
 	return status;
 }
 
-/**
- * _pm_status_name
- * @status: runtime PM status to stringify
- *
- * Returns: The current runtime PM status as a string
- */
 static const char *_pm_status_name(enum igt_runtime_pm_status status)
 {
 	switch (status) {
@@ -757,9 +750,8 @@ static const char *_pm_status_name(enum igt_runtime_pm_status status)
  * Waits until for the driver to switch to into the desired runtime PM status,
  * with a 10 second timeout.
  *
- * Returns:
- * True if the desired runtime PM status was attained, false if the operation
- * timed out.
+ * Return: True if the desired runtime PM status was attained, false if the
+ *         operation timed out.
  */
 bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
 {
@@ -791,15 +783,14 @@ static const char *yesno(bool x)
 }
 
 /**
- * dmc_loaded:
- * @debugfs: fd to the debugfs dir.
+ * igt_pm_dmc_loaded:
+ * @debugfs: FD to the debugfs directory
  *
  * Check whether DMC FW is loaded or not. DMC FW is require for few Display C
  * states like DC5 and DC6. FW does the Context Save and Restore during Display
  * C States entry and exit.
  *
- * Returns:
- * True if DMC FW is loaded otherwise false.
+ * Return: True if DMC FW is loaded otherwise false.
  */
 bool igt_pm_dmc_loaded(int debugfs)
 {
@@ -821,11 +812,11 @@ bool igt_pm_dmc_loaded(int debugfs)
 
 /**
  * igt_pm_pc8_plus_residencies_enabled:
- * @msr_fd: fd to /dev/cpu/0/msr
+ * @msr_fd: FD to /dev/cpu/0/msr
+ *
  * Check whether BIOS has disabled the PC8 package deeper state.
  *
- * Returns:
- * True if PC8+ package deeper state enabled on machine otherwise false.
+ * Return: True if PC8+ package deeper state enabled on machine otherwise false.
  */
 bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
 {
@@ -847,10 +838,10 @@ bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
  * i915_output_is_lpsp_capable:
  * @drm_fd: fd to drm device
  * @output: igt output for which lpsp capability need to be evaluated
- * Check lpsp capability for a given output.
  *
- * Returns:
- * True if given output is lpsp capable otherwise false.
+ * Checks LPSP capability for a given output.
+ *
+ * Return: True if given output is LPSP  capable otherwise false.
  */
 bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
 {
@@ -887,14 +878,13 @@ static int igt_pm_open_pci_firmware_node(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_pcie_acpihp_slot:
- * @pci_dev: pci bridge device.
- * Get pci bridge acpi hotplug slot number, if bridge's ACPI firmware_node
+ * @pci_dev: PCI bridge device struct
+ *
+ * Gets PCI bridge acpi hotplug slot number, if bridge's ACPI firmware_node
  * handle supports _SUN method.
  *
- * Returns:
- * PCIe bridge Slot number.
- * Returns -ENOENT number in case firmware_node/sun is not supported by the
- * bridge.
+ * Return: PCIe bridge Slot number or -ENOENT number in case firmware_node/sun
+ *         is not supported by the bridge.
  */
 int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev)
 {
@@ -928,11 +918,11 @@ int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev)
 
 /**
  * igt_pm_acpi_d3cold_supported:
- * @pci_dev: root port pci_dev.
- * Check ACPI D3Cold support.
+ * @pci_dev: Root port PCI device struct
+ *
+ * Checks ACPI D3Cold support.
  *
- * Returns:
- * True if ACPI D3Cold supported otherwise false.
+ * Return: True if ACPI D3Cold supported otherwise false.
  */
 bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
 {
@@ -958,11 +948,11 @@ bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_acpi_real_d_state:
- * @pci_dev: root port pci_dev.
- * Get ACPI D state for a given root port.
+ * @pci_dev: Root port PCI device struct
  *
- * Returns:
- * igt_acpi_d_state state.
+ * Gets ACPI D state for a given root port.
+ *
+ * Return: igt_acpi_d_state state.
  */
 enum igt_acpi_d_state
 igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev)
@@ -1155,12 +1145,9 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs, i
 
 /**
  * igt_pm_get_autosuspend_delay:
- * @pci_dev: pci_dev.
- *
- * Get pci_dev autosuspend delay value from pci sysfs.
+ * @pci_dev: PCI device struct
  *
- * Returns:
- * autosuspend_delay_ms.
+ * Return: The autosuspend delay time in miliseconds.
  */
 int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
 {
@@ -1177,10 +1164,10 @@ int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
 
 /**
  * igt_pm_set_autosuspend_delay:
- * @pci_dev: pci_dev.
- * @delay_ms: autosuspend delay in ms.
+ * @pci_dev: PCI device struct
+ * @delay_ms: Autosuspend delay in miliseconds.
  *
- * Set pci_dev autosuspend delay value through pci sysfs.
+ * Sets the autosuspend delay value for the PCI device through.
  */
 void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
 {
@@ -1201,26 +1188,28 @@ void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
 
 /**
  * igt_pm_enable_pci_card_runtime_pm:
- * @root: root port pci_dev.
- * @i915: i915 pci_dev.
- * Enable runtime PM for all PCI endpoints devices for a given root port by
+ * @root: Root port PCI device struct
+ * @gfx: PCI device struct of graphics device
+ *
+ * Enables runtime PM for all PCI endpoints devices for a given root port by
  * setting power/control attr to "auto" and setting autosuspend_delay_ms
  * to zero.
  */
 void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
-				       struct pci_device *i915)
+				       struct pci_device *gfx)
 {
 	int delay = -1;
 
-	if (i915)
-		delay = igt_pm_get_autosuspend_delay(i915);
+	if (gfx)
+		delay = igt_pm_get_autosuspend_delay(gfx);
 
 	igt_pm_setup_pci_card_power_attrs(root, false, delay);
 }
 
 /**
  * igt_pm_setup_pci_card_runtime_pm:
- * @pci_dev: root port pci_dev.
+ * @pci_dev: Root port PCI device struct
+ *
  * Setup runtime PM for all PCI endpoints devices for a given root port by
  * enabling runtime suspend and setting autosuspend_delay_ms to zero.
  * It also saves and restore power control attribute for all PCI endpoints
@@ -1234,11 +1223,10 @@ void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_d3cold_allowed:
- * @pci_slot_name: slot name of the pci device
- * @value: value to be read into
+ * @pci_slot_name: Slot name of the PCI device
+ * @value: Value to be read into
  *
- * Reads the value of d3cold_allowed attribute
- * of the pci device
+ * Reads the value of d3cold_allowed attribute of the PCI device.
  */
 void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
 {
@@ -1258,10 +1246,10 @@ void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
 
 /**
  * igt_pm_set_d3cold_allowed:
- * @pci_slot_name: slot name of pci device
- * @value: value to be written
+ * @pci_slot_name: Slot name of PCI device
+ * @value: Value to be written
  *
- * writes the value to d3cold_allowed attribute of pci device
+ * Writes the value to d3cold_allowed attribute of PCI device.
  */
 void igt_pm_set_d3cold_allowed(const char *pci_slot_name, uint32_t value)
 {
@@ -1294,7 +1282,8 @@ igt_pm_restore_power_attr(struct pci_device *pci_dev, const char *attr, char *va
 
 /**
  * igt_pm_restore_pci_card_runtime_pm:
- * Restore control and autosuspend_delay_ms power attribute for all
+ *
+ * Restores control and autosuspend_delay_ms power attribute for all
  * PCI endpoints devices under gfx root port, which were saved earlier
  * by igt_pm_setup_pci_card_runtime_pm().
  */
@@ -1342,8 +1331,9 @@ static void igt_pm_print_pci_dev_runtime_status(struct pci_device *pci_dev)
 
 /**
  * igt_pm_print_pci_card_runtime_status:
- * @pci_dev: root port pci_dev.
- * Print runtime suspend status for all PCI endpoints devices for a given
+ * @pci_dev: Root port PCI device struct
+ *
+ * Prints runtime suspend status for all PCI endpoints devices for a given
  * root port.
  */
 void igt_pm_print_pci_card_runtime_status(void)
@@ -1361,8 +1351,9 @@ void igt_pm_print_pci_card_runtime_status(void)
 /**
  * i915_is_slpc_enabled_gt:
  * @drm_fd: DRM file descriptor
- * @gt: GT id
- * Check if SLPC is enabled on a GT
+ * @gt: GT ID
+ *
+ * Return: True if SLPC is enabled on a given @gt.
  */
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
 {
@@ -1387,13 +1378,20 @@ bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
 /**
  * i915_is_slpc_enabled:
  * @drm_fd: DRM file descriptor
- * Check if SLPC is enabled for the device
+ *
+ * Return: True if SLPC is enabled on the device.
  */
 bool i915_is_slpc_enabled(int drm_fd)
 {
 	return i915_is_slpc_enabled_gt(drm_fd, 0);
 }
 
+/**
+ * igt_pm_get_runtime_suspended_time:
+ * @pci_dev: PCI device struct
+ *
+ * Return: The total time that the device has been suspended.
+ */
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 {
 	char time_str[64];
@@ -1439,9 +1437,9 @@ uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_runtime_usage:
- * @pci_dev: pci device
+ * @pci_dev: PCI device struct
  *
- * Reports the runtime PM usage count of a device.
+ * Return: The runtime PM usage count of a device.
  */
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 {
@@ -1456,12 +1454,12 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 }
 
 /**
- * igt_pm_ignore_slpc_efficient_freq
+ * igt_pm_ignore_slpc_efficient_freq:
  * @i915: open i915 drm file descriptor
  * @gtfd: open gt sysfs fd
  * @val: value to set
  *
- * Ignores/un-ignores SLPC efficient frequency
+ * Ignores/un-ignores SLPC efficient frequency.
  */
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
 {
-- 
2.44.0

