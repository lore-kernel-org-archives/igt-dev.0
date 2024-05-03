Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E07C4345F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 19:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0628B10E641;
	Fri,  3 May 2024 19:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5BolFAI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6816710E641
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 19:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714763641; x=1746299641;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=NEJTdsKeqwjrbJoX6dAIc1whfgQJ3J88Idz1VBnXTxQ=;
 b=M5BolFAIC0vrKWfed9S5gX/6QvHsBBSFMbJUORf5QfBbpbpKQdLXSnmE
 G0c+jEZ5NK9aZ2ApZjkvpMz115B0nZHKKquBC4BNqU9bOa10LVMtz9RTN
 jnfo/y5HpnC57B0vTBDyaaofBmfEWkdzQppI3/8TemaIO6qai3qDMgVPW
 5LBLjpk09PT+YVJWetLn7PrRs3868jUGTX6ppxLbyHbBuyXKcqV2TV/cr
 mNcLiKMJ/V2Pacrl8ojq7p3WbOnRaAQv1Fy6vMs/UhQpx711LFGgUSkGE
 LILPqcXOaJ3eutoNDzrXaOzdwOnE6wHTOhEzrCzcnDM+Gsdk/XcRmrcZs g==;
X-CSE-ConnectionGUID: HphmlBLbRH2Q/HE6clRgpQ==
X-CSE-MsgGUID: VsccilbQSQeKnkzvFdroPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10417775"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10417775"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:14:01 -0700
X-CSE-ConnectionGUID: 9RO1vvI2RgChXs88CQKIPA==
X-CSE-MsgGUID: WFe/q+6hRsidcdmcsBSLCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="32018032"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 12:14:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:59 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 12:13:57 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 12:13:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKE3p1rYXYcgVO4xy2+1BsjjfLnhB47w7Ixr7utXk/CZlaHiay0K7MTuTQvlEete5H2UAoQdeAEVTSwp99tJdfFaJsuGw6wyK/btUid+OvivYZ10wdWZCEU8y8keStXqdeSXgl3c3tY/8EL2pD4awRPH4JOeAxifkhSD+cvm7hnX0G9eETltL25LDnzkb343JiSlswPke42A6cKN3wUPvbRJwaMsvCOQmwbJtnc9ODlxADYKa9vY0hhZHCBH3RSAHUDSuETXXuLGkdR2g1IQxuJpFvTInlroxfrV+TsCOxTp7xDtzXnXotFYASdV6KOlHW3Wg8nccl/eurVbon547w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWVNkCz/eGn5EYzW198AruzqmFEFMj/mvp9qO8dS3nI=;
 b=JXje4g0Vyo7lhqDpQxRrQtlwdnNs49PoYU3Ip5iGCPJHrNmtdNKSV2o4m+OprWqUQRk7nhaJO4ajMrBAW4ILDITTdX2ctI0UcIVTwkZhd5vXxRSc/a1fH0j9wLeDJBpSmpYlbvE3ck3jRBrI+TUopG2hLamOkemNkZ00sohx5Dj6MDWP5rPMZPTDFBK6fKXFIr5jsxaNSOHTBpMjW60lHbBfs60CNQclfAA7LYaFqSEiMUhdKjmBItUO0jZMa/i4xmXM4m+/lEzK+EjAklACq90cbCe9KkZNo9kTTsdfEclrFjikTIJC14L9ITl0Vpkyv7bZLz7n09G/8/1rqPK8LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.33; Fri, 3 May
 2024 19:13:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 19:13:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_pm: Update runtime pm conditions
Date: Fri, 3 May 2024 15:13:51 -0400
Message-ID: <20240503191351.7145-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e940df0-ae87-4937-c092-08dc6ba52d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3gI4jHcZW7EXz1vI4DuMe7PV3h/Wwx78vt6SMBDPEoWp7nwd1hcMflQuILmN?=
 =?us-ascii?Q?kAKwVReKXMx1W62MUZiK+CwB7oFfE5ZTAuuFb/T7NdoelXVCCu9nPMimDPHa?=
 =?us-ascii?Q?bWz5jTViOPYVrZkxbrEwWoTIzJlT5lENhA3tAy9leB3TncuqMZnNTyiB991Y?=
 =?us-ascii?Q?Gm+cjmL+KPueT/rygnjD9DIi0Xlu97FLFcSQegPWBLnwxp+gJgZr10TDTPbc?=
 =?us-ascii?Q?hckgLBjL2IRWdJvuppa1bqHX8/C+CMB+h8IeG0+fP+lFUJtZqVLD7B5itnBT?=
 =?us-ascii?Q?WPFvT4Qj1wY+caEBAAMSSvxB+kUTvQPns7bSjLQrNAc3kXZdMyhLjqztuTzg?=
 =?us-ascii?Q?yF9QUW3V86bYDaFdtFfr6nQFFt98jstHaaBdtOcjppnOr7gCKmeHwNbS8yWE?=
 =?us-ascii?Q?zbjADM9GnMgmaW6uhC0/bkquJ5C+GGOZ9XCTbXJ6cqmvd0JcuG8PjKwFR2nJ?=
 =?us-ascii?Q?aXKgyPV3e18Keu+I2TKPCD9F5cz/HlbZbDEv7p0XalG0w0oT/VKdHMonLQbc?=
 =?us-ascii?Q?Ikdn1hyn9ncM7HALxZfAHUX/JX6mya3nvDCNUpYmZDbQm5F8j26L29D/5kqc?=
 =?us-ascii?Q?KYqPWqfk1rEoWzv/Zw2PZA3gYQHq/xXX7XjgrBzYVwLgoNr9PhIdYZFAVUBs?=
 =?us-ascii?Q?n0G01FEN2Jrp6/H4H0FELZtMHu+vRUGpI4lqrxk3htme8lYtXaeTpy9iL6BQ?=
 =?us-ascii?Q?1ooaB3VLEzqQyaXwPveHJ7MF2wFSeAGkpOA5JD212hiafO7Ve6bAxD+kMFot?=
 =?us-ascii?Q?70ZLX4gX5IhlSyBXAOcJGoyU7ljKHubB8mI5EDYqnJWoeu/hISsLw49OV9VE?=
 =?us-ascii?Q?2ClkXs61PqjMlrg7dRpdZDThxqmuQL4vS/aqSih5Zkm2yiyteh/Zb/z2SZrb?=
 =?us-ascii?Q?bxAxp2iRioi3VvD66VHfhjPhkBdX/M0961AvCRS/eJOTn1Pr8IYAbrwlBGY1?=
 =?us-ascii?Q?vnRQaB5exjEdTOQELaIAOxmepGAcZPmuZROFH+rDKQnPzFviFollLgR+kPWg?=
 =?us-ascii?Q?bc5X/wDZ53IF0mkHGaZLNMLyFP7jojMTFoVZR/w3ZS4N0eHDoH4XTaASwLPD?=
 =?us-ascii?Q?qzReLJorNIUkJ8I1pTsdG3OQFQYiP3S/cy653GnLWc7fubYkiWmPK5ZDExJL?=
 =?us-ascii?Q?FmpDYQdSPhaZ5sWe5pqHjt6zymooe6AwL3+EJJWjZoRM8L9CWTynK/RVhvbM?=
 =?us-ascii?Q?H9Y0fb8mYR3QL+Lq7d0ESVEFmnHqrK/61fay5kIv/q8MwDf1bD+aL+g19BCN?=
 =?us-ascii?Q?c7YuLu7KSZcVJxGv+QbFVFtlCZl6LwBahkVLbpyicA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4uPWFjpvZkp1y1LNL/N+MD7BPBCpNujTJrc4UajXZGDc+D19xWD96E/gVYQF?=
 =?us-ascii?Q?WhcgLkjMxayTqaXrQr4lBcUUn4xpzkQDlMsDYzeFcrfD2lNmPT98vjzDzkaR?=
 =?us-ascii?Q?8XpUm8M8zVZNIFWETy/+9VXHMpOJsJHlrfvnK/smBQHKKsN2Yux8YXKweAAD?=
 =?us-ascii?Q?/qv0CMWKHWA3FaBG5oKkUiwjIZS3GAvjCl+FunKDcW8UF28+CHpXMkmjPi/B?=
 =?us-ascii?Q?cbgVnHbmfu827+Ves0EtA/bIbrAGhjKMS4mCHaF2LWcWmFpj/Kofhb5V13qi?=
 =?us-ascii?Q?XKVmQ4iBZbvxbp5l8gkGGHwC1JOoFwLIXu0AF7X4xDPzHt7+PsmiQZEZc8eL?=
 =?us-ascii?Q?jVv3ZqeVALHw4eJRdjJXTKQdtvpBsH7LIKTKQcfaYigwouobPnFpRu32shkt?=
 =?us-ascii?Q?Aa6tc7iC5lgUw/2o+jV0KeAOtQMaY/940sFwDY+QJdVXTyqGmThacv5/8j92?=
 =?us-ascii?Q?xqKBPczhW17LP9BcJRVz65EjRIrPPYOlHmvFRdaWLIdsY4ywx6nWrqCSeEQo?=
 =?us-ascii?Q?qMqqS2TSmbNB8jMq1l+PL3d3vK+kyGpnCWGdq4dEobuHAbg0i54B2MSa/paH?=
 =?us-ascii?Q?/kVnGwDfH+Yo09dixX+wIa4WZU6vYCRjeZH9YDFp0lK9tgiCKyWX90RAOdkd?=
 =?us-ascii?Q?k4mr8yyoyuF0U7/WIfCnoNeUmfY5XhuHSh6rb58AY/88d4YvhZd0EHbyZWvS?=
 =?us-ascii?Q?j+iosc5QvF/Ef+grioILEGctWjuVmsSQRW5jgTbu1F6eWZf9H2Znt1TVoC/i?=
 =?us-ascii?Q?6Uwa2TzE3vSZF8l3/FxBHFsroi+6hoxvFckQpvfd8t/PnYmzaetY0hncYJu4?=
 =?us-ascii?Q?5LpBAyW5stV6mcEfFOKim3COR381w0t7D1RtG+hgTteCIHh8pd1xuVUEQsI7?=
 =?us-ascii?Q?C3HRF5q9cPz1PSoHVjpeVXcse1aB9416nGEvUJyiuQTLgD4XzfnoVGHh4Oi7?=
 =?us-ascii?Q?rC+yRdKHQkGTFJxkMjUtqdGjFFM0TT0FL32el1/qnpANcImOHHW6qRusYqx5?=
 =?us-ascii?Q?HXyr6X7TZ/4/enpVtGNH1scq2cFjuWG15iABRML21N7cDDboPEA3EjhBIYbi?=
 =?us-ascii?Q?ikBBoMRMiupMsvyWxPSZKvzluJ+aYc92VJXi9PBYhDAGownOd3KoSZxswxd3?=
 =?us-ascii?Q?EpkDvi+GueqPvEg5lE2tMyRrLHct5F7/+8gDR7GCLvflhDBmQNjVQJ5WaGzq?=
 =?us-ascii?Q?vExUShl8K810Q5TNZElr92q56voz6edMvLNAFhK5uOp9dja5y01qEHnmL2ur?=
 =?us-ascii?Q?DyraUFzb03oOISxgK8YlYsky+paDAKxhcMLWqDLQcOwkOyrLMmjZaX8Ly3CC?=
 =?us-ascii?Q?k5lZ2cWaeLKAKVDMljBHnE16TExso/9j44+QabP8r+VgGqmjXnqeqIRKxnmR?=
 =?us-ascii?Q?rvulR+yssnBPRoFz+qxAljiLI/NkRC05ReCm4Mx7daQzxWmjn48McfknsUbV?=
 =?us-ascii?Q?d+RqeEL08rTj1Qt3/FzpiJtAcxsyHPvf7aUoWpBHEFIAo5v/+o1paKarEisx?=
 =?us-ascii?Q?9itr/W+D3i8CBGHCrBWeSwnYRS30/T5l6mXPyU4h3JGqz90osXoixxkZHfCH?=
 =?us-ascii?Q?u+nU4AAegMjhjZePjalx6A+ob2Saf/Enw94JhK1e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e940df0-ae87-4937-c092-08dc6ba52d37
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 19:13:55.4872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zq0PwfKiUlWKdpBYgMKgt9jgBvdsAD2IMzH33Ljplno1PPIqkfM1WYYUrOXM7NAEgyhTo2lwHgV1IGpMVwE9nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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

Xe is no longer holding a runtime pm reference for the life
of a VM. So we cannot guarantee the reference usage in these
points.

Also, IGT changes autosuspend time to a minimal time, so we
cannot guarantee that rpm is still suspended after the execution
has finished.

Hence, let's remove all of these conditions and check before and
after states and the results of the execution. That should be
enough for now.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 47 +--------------------------------------------
 1 file changed, 1 insertion(+), 46 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 51442537b..1e0a9b282 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -184,34 +184,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
 	return true;
 }
 
-static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
-{
-	uint16_t val;
-
-	/* Runtime resume needs to be immediate action without any wait */
-	if (runtime_usage_available(device.pci_xe) &&
-	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
-		return false;
-
-	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
-		return false;
-
-	switch (state) {
-	case IGT_ACPI_D3Hot:
-		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
-						      &val, 0xd4), 0);
-		return (val & 0x3) == 0;
-	case IGT_ACPI_D3Cold:
-		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
-			IGT_ACPI_D0;
-	default:
-		igt_info("Invalid D3 State\n");
-		igt_assert(0);
-	}
-
-	return true;
-}
-
 static void close_fw_handle(int sig)
 {
 	if (fw_handle < 0)
@@ -322,7 +294,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	int i, b, rpm_usage;
+	int i, b;
 	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
 			  d_state == IGT_ACPI_D3Cold);
 
@@ -334,15 +306,9 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 
 	vm = xe_vm_create(device.fd_xe, 0, 0);
 
-	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
-
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(device.fd_xe, bo_size);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	if (flags & USERPTR) {
 		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
 		memset(data, 0, bo_size);
@@ -380,9 +346,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
 				     bo_size, sync, 1, 0);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
-
 	for (i = 0; i < n_execs; i++) {
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
 		uint64_t batch_addr = addr + batch_offset;
@@ -422,9 +385,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
 				NULL));
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	if (n_vmas > 1)
 		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
@@ -452,11 +412,6 @@ NULL));
 		free(data);
 	}
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
-	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
-
 	xe_vm_destroy(device.fd_xe, vm);
 
 	if (check_rpm)
-- 
2.44.0

