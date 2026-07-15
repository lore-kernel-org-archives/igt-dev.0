Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDD7C44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7E110F02F;
	Wed, 15 Jul 2026 12:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TmL7QZgw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B2010F021
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117727; x=1815653727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FGJlt7myySxjIFywhG5uo+K8ncjRekuX1av7yT6QlXk=;
 b=TmL7QZgwBeuDaSr0nRrxjCs05mdvB74IjUKUm89gf8yTl8itNTahgj4e
 FxCXsZEVRTNp0+NCL3s1LXe58wRa5mVA+D1K9jciF64jJ8NSfc/lVR3hU
 phN7fEDaQDV2Ng3Bt9J9qrhBRJSEmFPFzuCSy9G7Ps/XcCrRHjuibSQvz
 UZ+FPSnMUbwAcNR7lreTXWYUZ1ewP0NCwJD3xPFKXW1UXB1rRaP5C0E1q
 fwKpid9ICW2UT0BvNuq+onufGHxqTpoMvYlGVA3m2VtxcNc3atUpcv4Dh
 qpuBuQh324DGSvJMMEEkU7KYEs0BawOu1pdPSw/7C5QZnmozMflMPVeor w==;
X-CSE-ConnectionGUID: Wgxc0oEFQ/W/iIeoAy99gw==
X-CSE-MsgGUID: OzVySRGnR+GltALoN4MyGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102175898"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="102175898"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:27 -0700
X-CSE-ConnectionGUID: RhsoBMywQt6R9duNCwxZpw==
X-CSE-MsgGUID: Kc3d9pd4S/GNGOxer/6i+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="259985088"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:27 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6tSJp6Eo3E67gKuECkbGvfjlVa0bGPyjuxNofrS5vyfmRBuM3V8cLUHaxy+jOoAugW8lB+zCQuHeZldPdxbS7T9eMks3U+xJNB0njIqnmK4CyQAqRm3ZTxf2un1Zhce2YDf5YD+85rOMW4CZOCuMhMAxYubPpMTRM2CRPdYN5yow5gNwwr4LnFNfhOJPazFfRWNnS4v7LtyFfAzt5v9w1q9/qKg7j2sMIrj5/dlXSHe9rZiIXFo+yLMnzm4h8jEflzPi9ehjLiPczR1DWJduoKX3jpuDrY1jkGLRJ6I2IMRolN5mMHdMpau99/dsAbZyKuzntjWGd7Dw43zzhNDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+qA++9AXbMTzyppLy4yqGDGsi05/QYvIeRcTb9I/7w=;
 b=fwdVbVQgFSHOHMhFpdkOLRzbuRE27kcS17U66/9j1rH03G+7ygfU0l+HZKN+pHLUy+zbCe+HMbtTs8ZV+cgkgGeXIW407DrbKt+Cp5KQPxN5CWoHTPz80N9FJIkd46SFiq1+7Z5z5LgFn1UCS9J5Y3mS7mE/OAqsGYQ+8gMO7yDnxXZ2rJbAnmA28MB2v83G7F2hMaeeSz3veKN1fu2iUHMyCHcC+hP35+ng1JZgKedTjsH6DWw8opG3C4l8OtWY8MylC+UVv1FWY44HrA9fQvbQiznQ6dXD1qXnprm1LK23QBGnhqowLVg0Lz7JhsewphLuHZK7qwY3vTCBMlYVAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:24 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:24 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 12/31] lib/intel_mmio: introduce lib_igt_reg_tools
 static sub-library for tools
Date: Wed, 15 Jul 2026 14:15:22 +0200
Message-ID: <c7be5bb1258d47a1ebdf0309b32059f441f0642a.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: cb81146e-1ea3-4409-b671-08dee26abcfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: YFtavau2f9bjZBmZL0lweZRsi07OJubX1KQmZ93jWe58xfeCZICUcZYAp5xqeZ5pVTvfC9CvT91IHvJZL3NG1L7fwxtK9JdcUoC/GWlNpFsI2Zb10u03OmeE9kGsDk223WsxBDQuWCrH+KOOlZgIDKQ29XKATrdZS7EkNEmVQW+kqHem/wp9qceBGvy0mPkALXFRIAOjM4ImdR7hHDbin5mJK3v+Cak+q7SVp5bFU2hdTetzzxlwcHIfTZu4H4B/cxcVJzs6SXXk5CCk7c/eFQRPQjkpaqFLs/mzanXUeNS/6iNIIC0bKpUKFSRoq0DD1IAW+Aj/MZ6nICt+F5cFPOojqaPbn/q+qVg6leSrtKSgVg/uubsyO8MX2zI4y5ZYblKQ8z61A/SaASnGOrc/qEtT2F9qV+alhHh1g+Ct95klJ903ZkOj/lqCuuEjya0VanJN8OY9CFl0M2Y/8fA0HESsIllx0YwnlphKKAmEQJUk+c0UzBpkkRxu6IIZdOcfKFVtFfJHPxQBuNT3okMDSNwlGVJHN0SyWbV1TUwAyP3bDdO2p44RbYoILT4f+8FAxosrLAKboJlAv2GI92VQ+yQcY84xim1X/F/DE6uiYO7yJkfsJ7cBU5fOpZFUxKc/wJeb3yjsPW2f2u8V2obDeFkJntbPM0OmkyRbKofKo5k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hzfy94EyIsClte+xnBl3s+PrWkEKrKZ6xJJnUyrt/lIV0ZwBWwI45at4wpYF?=
 =?us-ascii?Q?bIrwJtG0UR3XKHU4BDR421heKAreWUhqV5WwjHqVD0PkWICuupoCsFw85eQ4?=
 =?us-ascii?Q?fPZfYp/znrVMQcqH9BKrPO//qWufwXIFpw0Dutgi2LVpu7UQFZmF8qqm+VZT?=
 =?us-ascii?Q?4td+7Fj+B2sH31Ep1Y6ncD84fWjcGoxZ8gDT7VSTz+rotzRDYT5PoqPhnp5N?=
 =?us-ascii?Q?tk+NszsPYe8PTImhJYk8UFWQAYkEb4h+6kQR3/4u9F0Zo1VFG9kqm/Hcq3So?=
 =?us-ascii?Q?NzixCQJq6xqe1IIQj7Ex1Duj/tSAyxeO1N7RmaB5qKPQe9A655KaNVSUHhq2?=
 =?us-ascii?Q?vFjQXZsKYH6822kxjc1ViroiVEd6fqsRioqL318+2Y32kiConIm51yReaWXy?=
 =?us-ascii?Q?pkBtXw53mTJDrKiYfPOLKqHloIdgYnsF20KfL41GqM4llfDIPJbHKnydm+OG?=
 =?us-ascii?Q?3zZWbbNp7S/CXy1RaWTPyjPiXff579vubbr+8ejSTjCCa3wKJJwgbaSuHpLF?=
 =?us-ascii?Q?yf1010rC1R0Hqqxjlr7td0dampb/W6lRxD1kVtiz/cq7vtl28jtmY+z1dWaH?=
 =?us-ascii?Q?P5+toW/9cqAm7ituhiV9K/ftYffJbfI6xCUFBwxpk2s0iysYsVKeMz74Wuwp?=
 =?us-ascii?Q?QIJUNc+idBQdgVcsH+5aLkOiHeATZtPWKBkjnjUDSTVzR0j+bkq0GabTKXV6?=
 =?us-ascii?Q?HWsaN1NMdnvIm4pkQ4BVIQ0E9/I+/a9Iff+teRMbIpIGxBjALSvkYajwqs6m?=
 =?us-ascii?Q?UBZT4JJSzUenKTcgmNBXXb7iXWHk37tpQnBr4FntIAc65/kqDeO2kcRsKSKG?=
 =?us-ascii?Q?uSNvsBuJfhfAATAB7INlqoT55IYCo4XOdvSMdu45vvXXJkRq6QG18+C++zOJ?=
 =?us-ascii?Q?r0fqoKI54L8/IxnlUCNJ7lHPjycbNWaxHIqJ/GFJi2r70f6G7G15/kpGxLKH?=
 =?us-ascii?Q?9R/DUs7ZAQMPyGb+8WjQF+Z0GhYiQIJVAPmDn/6dveJY2uD4CATlA/YBXb8u?=
 =?us-ascii?Q?FrB8KGly2id7W2cdE6o0bG6p0Ss4hMhPnpslmjT8qIS2dXmtSAARJptvhGHd?=
 =?us-ascii?Q?kdWBGUqehl0FKMQGr6430LVMry5KLBWW3nQNlYu4YqtmY9qhBxGL5mm32/L8?=
 =?us-ascii?Q?5yt2HdejdCMJFzHJIe84hwqI8olLBURy785TDJZOtTnpRolgSceC/F85xyLk?=
 =?us-ascii?Q?AeIlg9TAYvPtwzzvyJ08LEySva4F+C75HBl6jwyhX81qKp23QQK0NmGDWPvf?=
 =?us-ascii?Q?//FwUjmaTnSysXNLgGEBnlLtwE3xA6H9NfVoO4a3PcrUWqIUG21CoNMMlDhQ?=
 =?us-ascii?Q?BqF0/8PrtGZxrvu4P+ebr68qRXyMesFCyyZ8MbjEOwXtf9sV4yp+U425dfjP?=
 =?us-ascii?Q?xM1YituYlPI5hEF7MysAmChzAyB6TFZOQr6hLz1UMyFybzgpzdAKMxEdoGWa?=
 =?us-ascii?Q?ClrmQe02cfYNOLV0Uv6ZnDAMy+r5hqNwjgoXHMIAgs7V0VJOc5FYoUjFuSFm?=
 =?us-ascii?Q?hPrDdO/VNkVZhwXUSHV1sYsXO/C5zNHunmSlguay9CVnMkzDU13LPyORDBkU?=
 =?us-ascii?Q?wP14i1Zoj2TZwJWVRftCZN085HVg2wNRJ3WEcrdKJ4G9aC8rHW28UHJIuSG+?=
 =?us-ascii?Q?wkU/jmj2fWAOAmpZvM/f7CoUfxsOJQ+H7gYSVcP205VEbz/U6oEODypX9SXF?=
 =?us-ascii?Q?hyJjdup2CvrsgcpF9KRE6nTNBZDTxSJctUbq8Y5V0TPGQ2K6YNs7+ZSBH8/h?=
 =?us-ascii?Q?059so4YisGcpg3ShxiSs+G73+LKnWDs=3D?=
X-Exchange-RoutingPolicyChecked: JCxBananYOiXJwEAn5UoG6rcc6PPleOxZlTfi58lrtLqbz6xWvyWB8TGf/umr/ejpG6Oj++ZLF5wIE2AkmdCL3c2oa3OYJo6VecwALDo1fyLVTS7y9poF5MT6nq/uibQBOvKQSQZ56YXY/XmbnXzfXlYdUR7BN3bH0MGYdLCWWowpe8DW7PXSmjUoYg++I7zjJwPOIVvsNXMmcn6B+eSQmE+j2OzIa6dJ2q7t5JkxH62XXa3P6Ng8ohjO3/2XpoITyG4knQX2L9/nhfIjtHQ82FpOfxMK37s3K8VhRkJhi2eSf+jOpNO7u6xadQMLi00OI9RrzjeRnA6DjSCURG2Hw==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb81146e-1ea3-4409-b671-08dee26abcfa
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:20.1619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9wLm1SlWYUNQR45jpxgQUdQeCSB1L0EjH/peoMSJgLHK298owlMOIVWZ1NbOBWVNphUNPcvuIiQHdFewMXd6a2ZVzgsqgrinXrid558HtQ=
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

Add lib_igt_reg_tools built from intel_mmio.c, intel_reg_map.c and
intel_iosf.c.  Tools that need register access (e.g. intel_reg) can link
this library without pulling in the full libigt.so.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 lib/meson.build | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 8addc8982..aa8eae68b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -437,6 +437,21 @@ lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
 				                     pciaccess],
 				     include_directories : inc)
 
+lib_igt_reg_tools_build = static_library('igt_reg_tools',
+	['intel_mmio.c',
+	 'intel_reg_map.c',
+	 'intel_iosf.c',
+	],
+	dependencies : [pciaccess, libdrm],
+	include_directories : inc)
+
+lib_igt_reg_tools = declare_dependency(link_with : lib_igt_reg_tools_build,
+				       dependencies : [lib_igt_chipset,
+				                       lib_igt_tools_stub,
+				                       lib_igt_drm_stub,
+				                       pciaccess, libdrm],
+				       include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.53.0

