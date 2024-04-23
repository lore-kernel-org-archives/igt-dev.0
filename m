Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653FFC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 22:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16C91130C1;
	Tue, 23 Apr 2024 22:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l1pbeGFp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C25112AD7
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 22:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713910955; x=1745446955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vd7E/pSgBgjNHanCzG6R8aQZOhj13xRZLf1S2fxS3s4=;
 b=l1pbeGFpNIhLCNoJhGZQjbeXnkXFjlI+8FkQh5hk12m+IU3eOXeIWNrx
 HdKZRchQc+9FT+aBelfeD5uh4oedS0sFUht0irfOAVN7qlnIxflvh9bEU
 eqELzuLdv13t3GolMF2JGrOjTYO11Nix0/uiSGYpD3W3TWtKVse43gUi9
 PuP6i5JVQ5HsOipJ+tyxPyzBOX2AvLBcJXjXl68MKpCcb39fiFFB0OoaX
 PM1jSzpbiPcV/Bl2vLgWb+hjIJGUBW1GDdpm77azmr99HKKFfqlzgWmTo
 JG84sDCEBtKNPwkojimoEj1D+gG99mHz7fV6pQQBHPPNwzviCTgI6mZaM A==;
X-CSE-ConnectionGUID: 7EK9E6JGQUSRlmdxhoOCyw==
X-CSE-MsgGUID: 2c+FzofDRb29hT5I9pH//g==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27034345"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="27034345"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 15:22:35 -0700
X-CSE-ConnectionGUID: LcK1Mfg8Q8iPO8c4fEmDvg==
X-CSE-MsgGUID: smbsH7qGQwm898DpQnhxpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24951118"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 15:22:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:22:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:22:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 15:22:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 15:22:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZVRPjY1LDPhPs6DiRd+Oe7dMo6vz4Yu5XJli3FL6Vz24vOsgv64SiIwvFMR8mtGb6tdeeFbrdXTQD6IfM61HPfK8JORIKEGDTJnpNeCk3UCjaolXaSs2bqIUF8X0g11TiaVHAIrHSgd7B6fofXslVfko5mOxqIK8SS3eiHJ+AMcxc2aaaWE0qJAjL7U6L/8VxrBllZsc6Iyvb2ZQyKXMJzX3wkFJYtbc4frcQDzDjNKoR5RVNjaiOLMexatmAZWq9nLoZX6YHyVKZtDfkPL8MZA7aMjMRELCLhvDq4gYOfg81g2AmrTdo+BJMU9mMwo1fOEIIeu8Tih2PtTdivjiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2MLnKVsZYKv7e2gwp5x3J1F75OcxuTG1dyYNtv1FsE=;
 b=AO/raGFqNO4sZyJy/8N6bBhhNXzYUBdOJDgfl24UTZuhVHZqaykUnD/gwHCl1vcE9JhBN0BAOTBXWMjzirdxOa3dAE6VCEYWnhdO05dj03BR54B95hLX1FwNB1rWRZgWGv2l6XJzHOs+fOa9apOrNWdDKS1rFGXin1FvDRN8wRrwLykOueYV2fSiVjzkQZKTGIXuxynaQnx0ya22Ieuducfs8ed5BcUWsBPstFyZTOzWIpjd2CV4pWZT4ckNzxhS/wtTnAQNI00gALfLCsUs8bDBGbGHRAWdu1Lza/PEgR7D5AzQ52L0N9A/sVKCjsyXLOap1F3bJk1iG/CMxkEQRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 23 Apr
 2024 22:22:31 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 22:22:31 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/xe_wedged: Test wedged_mode=1 after had
 toggled mode=2
Date: Tue, 23 Apr 2024 18:22:19 -0400
Message-ID: <20240423222220.1285742-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423222220.1285742-1-rodrigo.vivi@intel.com>
References: <20240423222220.1285742-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::35) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MW6PR11MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5a1b67-16eb-4dc3-d399-08dc63e3de10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yCTbRvs61QLax7cW5Tir1wSNMJ+aNrcGi4LVMQZpX8QpvERSbOHRU5urQ0oh?=
 =?us-ascii?Q?8QFGrndJqTjnZ344VFyhCpoLkAO+IDlAVWp4UJVccSyQ61C54zrGKyM9Z3DA?=
 =?us-ascii?Q?+i46WmEtF5GQxVy1UNmHtp9BPhGaATJ/lfiPUd9BhVFvxvhLZKPEiAFayDXe?=
 =?us-ascii?Q?TvK1bK+U3jZyJsaXaQc+Z2oUMZPksJzS6ylzWdM59Sy1bFLDk37BdT4+irFz?=
 =?us-ascii?Q?nXlsm7xGUvHvci0PP22u1QZUspoJORt2kCmjqVi8OWbf9OOFCjyQ4Spio6Ii?=
 =?us-ascii?Q?7zXPsihp/namaUbcBoOOUsxKIV1nulKcxy9Oq+D+2Fvh6gUAjySGJJczq7yV?=
 =?us-ascii?Q?EHoZVG0MuHh5a4ZgwlDvk8t+MGjLn6m5x/OWPDydnftFZH7pRmm+5hAqeWJ0?=
 =?us-ascii?Q?BRU7i+LLdfIGmJ6Z9AqmIMFYr4F0NbyazAX6t6uXSvCcKqh9WOrofxoBq9Bc?=
 =?us-ascii?Q?ZsT8186JlMJ+PYcrIAeig+WqrZCV6Lm06SEOJC7mFCgppSkqAf0+jePRv9kv?=
 =?us-ascii?Q?2hM+fH+trtBpHziI9qjWHlsIbD3VnAA7CTL0S74zVUxuQmYLKauSUMIeQC+7?=
 =?us-ascii?Q?+RrTIvAwJuFL72t2e43PQd5XF7y5amqB6o+S4rBIEPiLjC3wBE+tTOJbiQSp?=
 =?us-ascii?Q?2hgJvFAiH5Laiz8zlVqFZjvdRmU5CO6RerM9wvAnXt9Fx3EOBjYlGgti+40L?=
 =?us-ascii?Q?+IlYqB68HCP4lrjT3V4igIsGWMzdbENyyPKOpCvq9QVg2F50nQcY6TeUSl94?=
 =?us-ascii?Q?US9s4JVQIQxeO61tv7EgcDQnSbdnmErx7B0hwIIA/7VFaLavNdrgqMahoiSW?=
 =?us-ascii?Q?00nJGOHTDNQD6HtFjWT120rtWQm9p0XfIQVC1yN5twyzUOtGVQhNsayog4aA?=
 =?us-ascii?Q?5CfQAOV8jZDsb5thKo4QKQFqfLygFzWaKbcE/7HmlKRf2Ug8o11RJgwOWgsT?=
 =?us-ascii?Q?FfEWeydngnAdpu26wtBi0QK2iKgVnnX9jZQYuitQ0+XiNq5SerK8jBl4HgYH?=
 =?us-ascii?Q?dpjDXoU8OvjlFWB+BMWMpaRXtMjw6un42qFett+QsJ4Pua+saqyb16ojbGbl?=
 =?us-ascii?Q?QePNikT/iHxIjHcpgxXrZJ9oT2+Xyj8KZRS66llAojTe3Sn3ON5JupPtjghA?=
 =?us-ascii?Q?0UsGWG+X/o0k2O5KHY4uhHR54+SFQfxlBPT4RcF7mknICJHCkMx1Q3Vw/ul/?=
 =?us-ascii?Q?RuSS5YmciNh6LRFswCG2GJkvvySz1p+kpRuvWVqyDNY9/R4NK7wm2m6x+LnI?=
 =?us-ascii?Q?md1hKSNIbvUzmas9Dt//vFIm/pf2kyQKlOWOC5N4EA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UJ3fNO+9kxYKLl+p+pz8AiBunGk9JJk3KIpkUOzR4dqs42F4ro8CAmsYkC0Q?=
 =?us-ascii?Q?Z2mGbpB60+9ejbCU1oALOqIDCLgKYB4o08xl6qBfC+qbPGQ9gwhrPwZ+Ftp8?=
 =?us-ascii?Q?xErrNtMjVH334lYO2vRI2rC1HXtS6rSm+Px4TPz5Nk0KgxYp+IJyx8XIEPEw?=
 =?us-ascii?Q?GGCBN8TtApBficLGcuRQOrevcR8ONhlYMcb9K8+AFi8yXzCEwaMmh9pQiyMN?=
 =?us-ascii?Q?p3Gy1SX3QyIn5Sycbbodx9q6vNNdYOf9UTD5cKYMxSy+/sDVOVJ6f0o5SdOm?=
 =?us-ascii?Q?eNuoS/nDUV5pRIc1S8WiVLCNnq02hLa5K12d9xXUdmphl2usZy+rA6uKLt6n?=
 =?us-ascii?Q?Nk6CBXhhSC5DFXfFbh3nj2cNy9fwaBYVh2x5Gtz8CovZ6el5n4HBDs0lzY6A?=
 =?us-ascii?Q?HsitC9EZ6Z6H5bs7RTf54YGR8QchR/4GQu7NDG2C38J58yvG33o4yc/1eQ1f?=
 =?us-ascii?Q?wGQX86xqMGHGa4+LYIYUcPuIjJsUrOUhcV9yGjM6KnzOb4FfyVAcU3mHWVAY?=
 =?us-ascii?Q?IqhCON1r3VYGileO3jsVltrGhnfGX9BmgOw0YKaTWKz6mbqvQA5mzN9nUhub?=
 =?us-ascii?Q?mSTeIcXjgEu5uAAL408FRPjIkx6gKB/XOHwQ66ALxaffWWeVWay5fP2/lHoM?=
 =?us-ascii?Q?YB945sX9W2n2GSXaCPXlsaH4QJCzx2AhMX2ll1OaHcm9VMv27iA2RyUdNsRO?=
 =?us-ascii?Q?dnxWUkg9+rUjgysKntJikIAJ3LmmCy5ec5KngKXhjdbvI9FWw0x0RvIK0ELd?=
 =?us-ascii?Q?mv8/91hqqQgxz12TXB1F0CGkBWl8AFBomrOhlohuHMYQ4jNfimlS7T8wZKVt?=
 =?us-ascii?Q?/GF1V8PllRS/zegkpbK3oWW3Q5R8oDJJsCERr7bvy5AObN5c8pYTfuAs1PB+?=
 =?us-ascii?Q?p8Nmng27uvX0krQONjYiA8p/Z3DFzFWix6gsz5huCmRZ8Bl6mqy7NAViKYM4?=
 =?us-ascii?Q?XQjreqK2HxSYYpDBoZt0mIBe7gfn1D/xdWz5Q78R2qZgAL7mtAWAYSjWxHdf?=
 =?us-ascii?Q?HwR3g1egZb8uTW4G1QV97/JqbyOFRWJK8gwBrezggkXvcIEtpFwjCiLmQYA5?=
 =?us-ascii?Q?2zR1jpZDo2/OxWd0Z4nQTkFrlSPvIjOR993cHZKj7XMlC4OKk8Yl7LH1H/ab?=
 =?us-ascii?Q?T/KGkYUHQ9bTw9bRImvR52rf5LmdS7ojQC8Jt983taaWrF+W4hvJ4rGJhLzm?=
 =?us-ascii?Q?OHrFLsnE/xStWMv1qBnhvNKI1bCRGh29wW3UP82zZg+PtLFqcty9pkgvmxSo?=
 =?us-ascii?Q?wvyBRjM7gPg2HspnlDT4deyczUReBgxBmcJcNCX/X8FVWHYOBU6+2Dcnbj9K?=
 =?us-ascii?Q?vUxhmxBr5MhYHcGzrUUsWxOTbE5XxgAxEF43nu2bKGv1kyAIjo7rQrCL5tPV?=
 =?us-ascii?Q?VKl77C5a+0sXlJzXAwNMFHr0SgqhX68aQoKFFKLhDvsEERSbU3x6sn2qhHec?=
 =?us-ascii?Q?3s6rTUnxsg1vqmMIfbY8AJrxhz1kjWHDPYF9U2v4S+9Q+xOPyOV1yQTNIcTc?=
 =?us-ascii?Q?5LHKa95pSxvuFxe1ilybyw+5DL42kHtn+9plu4ZSU+2e5IOUefFJ2KSqb9sS?=
 =?us-ascii?Q?ErzSGa1wp938rfeB2KxBf++mlZcQeWfMIE/PE5dR+oVBl77RQFERQiLSdohj?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5a1b67-16eb-4dc3-d399-08dc63e3de10
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 22:22:31.6580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rslHqbs91ql91TD7Q/ecLS1ILqRMckzFLVFLZF925YL97MnPgDLTmkY1lg/wwvsmU5EdBsx1+lisR4ql9ggaxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8392
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

Let's toggle between different modes.

Suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_wedged.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 35fc905e7..b9bd49fad 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -216,6 +216,10 @@ simple_hang(int fd)
  * SUBTEST: wedged-at-any-timeout
  * Description: Force Xe device wedged after a simple guc timeout
  */
+/**
+ * SUBTEST: wedged-mode-toggle
+ * Description: Test wedged.mode=1 after testing wedged.mode=2
+ */
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -257,6 +261,16 @@ igt_main
 			simple_exec(fd, hwe);
 	}
 
+	igt_subtest_f("wedged-mode-toggle") {
+		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
+
+		igt_debugfs_write(fd, "wedged_mode", "2");
+		igt_assert_eq(simple_ioctl(fd), 0);
+		igt_debugfs_write(fd, "wedged_mode", "1");
+		simple_hang(fd);
+		igt_assert_eq(simple_ioctl(fd), 0);
+	}
+
 	igt_fixture {
 		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
 			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
-- 
2.44.0

