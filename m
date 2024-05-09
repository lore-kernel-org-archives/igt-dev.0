Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DD4C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 19:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1129010F0A4;
	Thu,  9 May 2024 19:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dozeTVj3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B1710F0A5
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 19:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715282216; x=1746818216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mTmy57XMFXnwvhuEIH+ZOGf45Q2HSq2rY0tYxNiUk0M=;
 b=dozeTVj3hTi1+k2R+uAaUEvx1NY74ZSwTk2+Ae574/uyYboIh2kTwl+4
 pvwX5FoO2BCA5ZkwIxYJP9HjO8SeN2TklkOTPGizRfEFHrDkc2QyWqZ8S
 1Shm62/Kc1L2/M3I/y2TzG0uKbWSoScFgXXVFS+ztHqaiZBduh++wtlHs
 2OxeVCVIqURtEEKC60nETD5wisN+BACAGl3r2a9gs0bfBY+JG8hv3Gokl
 LeKm4gtywPxlLoBsM4nhLXnrsxk3A+6auCU1D3MTIMEO6aTH3tZzcc9da
 hVjIcoFL5qtFBZPi891n6pRCFEIIILU9bIGR5s2H60elGAR+WPhqcSO6K g==;
X-CSE-ConnectionGUID: CW6cel9VSE29/m2md3/L8Q==
X-CSE-MsgGUID: IfqQ3yFWSTmzF7pzB2rEHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="36608680"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="36608680"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:16:56 -0700
X-CSE-ConnectionGUID: pyH40XqGRqiahowQWem5ZA==
X-CSE-MsgGUID: ObY4gJK8QKSH/pCTbhowtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="29724928"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:16:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:16:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:16:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:16:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:16:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNjG8hJO28AVj/EcoR/m8NdrOZhf1cIPvEt6yQ4MubBDEDBBRuzmozYDfzj5S+v2NVU5sJrJiK34zVH4GVkCYV4iW45SwzFYXq2BkrEMePPINkaJtf0vj51ByvG/albqk///s1ZFKnyKGqgUQVL7gwcl6L/0dLYcoORj2lmNPv/Fx1vbN219atV8Wl1bB+WYYXvC14q3E0o1sxQ9c9Hwb1ZguS9zT72rSi0jMUa3LtfRvZQ3m1BLTdCscJpkkhw0VI67kN1Xpnf1jB7niBOm6f0tvxWUo+xQLY4nhEh7ehJPXxCQe/qFV/5RnjVXdHXftjr+maan+R11PRqlmfpZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InaCF81zbdYhJV4HD1ViE36ACUbTWaDD42rdeecJz1g=;
 b=e9PNoDt9w2zK3stIKR5iL5C5rvsCKLzth6+cXHrGhQYXnPkihliauc8R7PWMW4W4EGlxgE58+nP2cE6Fp9WjbOVfNv+s5S780RiBl8oRAE7AEQuY1tyz7eXmNqV0ICYEMPez2xbfAQjlXGtpPd24GHgUtE19KsmMcMKdZwiTqnoIeI+WEYTUnrSepserm4HF+qAlfFn53u8EsJ1o+LYgBPqOaIjQxylo2koROkXl1vlmobvB7dsRysILbjIQCp5fj+DSsD6h8XEaQLTPRClng8Wf7hCuBFXZkydiNFpsUpOFtq7x9HVj0Rh2ho58cZjdTLMi/+VwVSuvWdvFRis9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Thu, 9 May
 2024 19:16:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 19:16:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 4/4] tests/intel/xe_pm: Convert mmap tests to use existing d3
 helpers
Date: Thu, 9 May 2024 15:16:36 -0400
Message-ID: <20240509191636.504200-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509191636.504200-1-rodrigo.vivi@intel.com>
References: <20240509191636.504200-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:303:b9::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fa7b74-954f-475e-6010-08dc705c9475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a5KTVWr+cZMhqwLUIEjiuL/ep4axAU74tpgB8Ijyvi3Wm5SwgK4N45J7/j6t?=
 =?us-ascii?Q?JBkN4R7o1zk3HPLn/mJ92G4guS+C+GBbM8ObNpN+Nsuhv/vT+473awkKc35i?=
 =?us-ascii?Q?8bmEUwo2nQpimriRUIzhXiB4Ph/M5+I1GWKZjpbAhMcFw+4EchrSnuRIKtMU?=
 =?us-ascii?Q?OuJaQ/PXLbXpz9ShwewHsxGrZL72Nq9Wtbaa+VaMBjuBQ0Ea7g5s6hI8Bv7y?=
 =?us-ascii?Q?zedb6CpRdvDx7Tiur+PXQD7BjhziHNBmqtdvI3Byml1uTYA2nZP7dZ6VhMQL?=
 =?us-ascii?Q?qT01fQU8u5VgXI/vV0n/wggFhW1cc5kLGa17uUiJDX2EILyT+pc6e5ACyS1U?=
 =?us-ascii?Q?Nq2RRxH6SaAOQ190z0VuIkK1K8UvSosBJ8xWct7Gji54MQM0hodnkNnrx2Y8?=
 =?us-ascii?Q?d4y5dZtCtN3duQg1PhbT7aF40M7U60k70T9gkBBj0NZVKAwCv6Jvl1KjwS43?=
 =?us-ascii?Q?Fg5AltNJEzfMKLZJsPx2VA1bZaKOiZIzIy3joDRFjx3976s/xJryX4+YNZCk?=
 =?us-ascii?Q?50AGvNx18j6xqLQw42EjBb9wq5GvANrHkI8JnZUMCeyD7emFolAGvQo54+3p?=
 =?us-ascii?Q?ih+COGyErrqODZJIW1rGgb/A2lRZ366Dr7Z3+NuQfDKzcbyMfkdAZFgGXYXC?=
 =?us-ascii?Q?Te8orGAmEY/UsC4S9Qc9m9LHU6a/Zq+7aRZkY6y4RBpuLIgB+pZBi4jZp9zd?=
 =?us-ascii?Q?ysUU+T7AtMsO4ynD67zZV556Bhh5AJDZWSsHAqB1Fbj5IT9kjvos2/ipgIOm?=
 =?us-ascii?Q?13zBsm4184JtELeX2Rb4PJwkYl0KJvncVhOnw6Udb+IG+XHQ+4QuPokZvEaQ?=
 =?us-ascii?Q?gGRzl5znpI/smFb8qYOaujsso868c/a6B8h2mZoywvIM9J+ojxRpk7V04f8k?=
 =?us-ascii?Q?GJwDVsjNFDitVnbMEW2bW6/VGCDW3j8RFbK+CZuVJ7byuJ0IXtq5qGzFnl3A?=
 =?us-ascii?Q?458a2STKKqMiytfbGKExRM58bRXrKeT8YZH1yruo613BAa+KKfqym8NSLGCt?=
 =?us-ascii?Q?0Xgyi/mcDk7YKa7cXMjcjJbdH1V0AFatfjrrsdRtUQm7knegQMWlb91Erfhe?=
 =?us-ascii?Q?oEmyKeE2ttBCHD9BAInz80pj//5m1LpfhdN2gFThbBtcEJgBXi5nFUnrHB49?=
 =?us-ascii?Q?rEwwmc20t6Ynuqu73gBZH65UXyixQJEWLm34qfxdS8jeEG2RsqjJBf6YFKsy?=
 =?us-ascii?Q?2GuTgJPFKu0uWxqpapzeNiMZXhqrrG5pOTnQ5mE54eN8X5p6NJCrxm1HW7UP?=
 =?us-ascii?Q?yxSqib8WfTPxQ1AI22kcGHlfaoGzLSV9ZLqaWqwlpQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9LyL7bhuqcOiGwkDyW+THZCpovU+Q4NJtVO4ZXnMtLbiQQ0w48RX9eXBbIpa?=
 =?us-ascii?Q?yDFkfEECMiLtyCfTmkBuomVzTacuBsGRm52PJQ3Fg4eVTKiABiMwCY87/01y?=
 =?us-ascii?Q?FlesH+9TE4EYQ+EDhmwmJ83DnFff+cwCPg6B/D4DLV9YfMX6lno4WP+nP/eY?=
 =?us-ascii?Q?UdWmTVkq/+4gKCSLI9l2Qyhp33RhE2YwYbIKHZR4kVu3cmS7fFh9N6aGLeM4?=
 =?us-ascii?Q?VedBR5vQ+TYHcd6krAQurgp8H68LHMJvYVBtM9do6g4QvJrQPurMqHLqNqQJ?=
 =?us-ascii?Q?Ez3f6qm80kR6Tzdpo9etrGYJmS3StWV2GuBTUhSMUovV483imOdAOQwEJUZA?=
 =?us-ascii?Q?V2blL/w0nQ1ogKun5nkQdXXnYVOFAjwxUMqSIUmVqf0UXW0V7jswtD35RzoX?=
 =?us-ascii?Q?5viS9gCi91Z8420vau2Gjqb7GDllUxQ7rkXyhDjn7BSbVJ5l23aCaLg8m0vW?=
 =?us-ascii?Q?K79Bs8ofPfiuzVh6xmVmqp3CJ1hK+lBRXhqPnxtpV0xMSuhWhRC6sKsZD6N8?=
 =?us-ascii?Q?TbAUkb0+WJ8cSEBudzG1ZV8uAHBu7uMFjXZ1h/XbncmXy53x1418N4Pw0X28?=
 =?us-ascii?Q?UhdB2oMXtBghYVP2PSQj4l8P2VdsQZpHT9n8FcoTJ0wuf8Fq+HGUYJZlVHPw?=
 =?us-ascii?Q?cdChzZvabFz45/6W5T1Vw7SZmRq4x/+3H8ft3RpFfqfgNgPEqG/Naz/JXmr0?=
 =?us-ascii?Q?XHWeAme+z+Ox9s8Yc54wa5ePxYWDrSixdgMFSTuFVDZpW03u0nIOZhhmqxaP?=
 =?us-ascii?Q?jIdOb+Me6mDx6pU1j0tbo5QN3CA5+RkiM/OFFmv+3r0uLRGfxXX2QUZxiuX4?=
 =?us-ascii?Q?j3ih0FIb2vbENN3S+KikqK2MLAWrYpx7pR8D3Mv4NLz61WpCM/CSzLsT3T7k?=
 =?us-ascii?Q?3dhfeGGbrfstJj7Lcm7FZtx+iU4n4RMWC6pr0vnNOkOcDkvGsrBShp3k27I1?=
 =?us-ascii?Q?Pt8rY9tA851y03I3pO7YbZUqhCwXErgvt0znECYPrIHD8QQK/pr5hdeA2BU5?=
 =?us-ascii?Q?G/5hahZIUOfb077C70SSPU4GLV5KmE8KkO6UNQIMBdj6R8c2HMSb7GHjeh9k?=
 =?us-ascii?Q?k89DtdlEaUFKM2H23nhE5xj++DjPsEjp9QO5Hl3zpMlVaVRDL9hcvpRwoxLB?=
 =?us-ascii?Q?DJMZteJql3S1N97TkEB1cvVsLv00yAqPf73j/IGeiotesITRAPEcMIqlLjcv?=
 =?us-ascii?Q?nbas0/qeDgzJYeTCocmeccqKHmBEP00QCujKaIiiHQnszieDMVpJYxUqtUO1?=
 =?us-ascii?Q?RQos6/U4LQygDZILFKVgQemW2xDZSDtGGslU6qtGHNBuYasDL6/I2FUG59JL?=
 =?us-ascii?Q?3KZa2tsYTCsIpJqYbHXzXICOxIkaonjxPKhfJBo2AeRNDZs0txWaS6XJGdEo?=
 =?us-ascii?Q?bDjpKyAtg8KZ14iLk/cREJMHLcGlGCsVuX/vBol5I1bnFN+L0xySwZQ5lOoo?=
 =?us-ascii?Q?VuMbgwwFCBbqdfhrkwMCXwInN3ZeHbTNdADVCMMsd9GBqQeoB87vgs+Wb//C?=
 =?us-ascii?Q?78LPJGe9+1gupxvmfcUNwi37FHKweKzMJP3RK2hoNy0xHJFthLwLifCAO63M?=
 =?us-ascii?Q?iXuES85DMaJDa5k4bT3BZJtg8pODXEMjTR/jz4CIfypJtSIQR9OFJ/ppxNmU?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fa7b74-954f-475e-6010-08dc705c9475
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:16:51.1367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cX3TtH9AKPdABdvWZ6LH+NHaxgx479FnVKbuLwojn78TFs2yRyIOclqGcD/DqkyzETNkuhxWwB4k+9Zz6S2olg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
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

Standardize d3 setup and ensure that it tests with D3cold and
D3hot.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 80 ++++++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 67d51f4ce..7c1dfe425 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -512,19 +512,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 }
 
 /**
- * SUBTEST: d3-mmap-%s
+ * SUBTEST: %s-mmap-%s
  * Description:
  *	Validate mmap memory mapping with d3 state, for %arg[1] region,
  *	if supported by device.
+ *
  * arg[1]:
  *
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
+ *
+ * arg[2]:
+ *
  * @vram:	vram region
  * @system:	system region
  *
  * Functionality: pm-d3
  */
 static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
-		      enum mem_op first_op)
+		      enum mem_op first_op, enum igt_acpi_d_state d_state)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -533,7 +539,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
@@ -559,7 +565,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 	close(fw_handle);
 	sleep(1);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -574,7 +580,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
 			   active_time);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -584,7 +590,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 			igt_assert(map[i] == MAGIC_2);
 	}
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 
 	/* Runtime resume and check the pattern */
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
@@ -716,6 +722,36 @@ igt_main
 					  NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
+
+		igt_describe_f("Validate mmap memory mappings with system region,"
+			       "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-system", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  READ, d->state);
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  WRITE, d->state);
+			cleanup_d3(device);
+		}
+
+		igt_describe_f("Validate mmap memory mappings with vram region,"
+			     "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-vram", d->name) {
+			int delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
+
+			/* Give some auto suspend delay to validate rpm active during page fault */
+			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  READ, d->state);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  WRITE, d->state);
+			cleanup_d3(device);
+
+			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
+		}
 	}
 
 	igt_subtest_group {
@@ -730,38 +766,6 @@ igt_main
 			igt_install_exit_handler(vram_d3cold_threshold_restore);
 			test_vram_d3cold_threshold(device, sysfs_fd);
 		}
-
-		igt_describe("Validate mmap memory mappings with system region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-system") {
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0, READ);
-			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-		}
-
-		igt_describe("Validate mmap memory mappings with vram region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-vram") {
-			int delay_ms;
-
-			if (device.pci_root != device.pci_xe) {
-				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
-				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
-			}
-
-			delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
-
-			/* Give some auto suspend delay to validate rpm active during page fault */
-			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
-		}
 	}
 
 	igt_fixture {
-- 
2.44.0

