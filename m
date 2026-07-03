Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAABBC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7950010F82B;
	Fri,  3 Jul 2026 14:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNvBFsDe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A71B10E2E7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088929; x=1814624929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=24anu5/hEQonkfS/XnpwE8GbpgOeDlq422d///7tUdc=;
 b=jNvBFsDekUKdh9RqWGG/nMVvhBTLMvPBEeeXUTN15AXbutALbMOwovaU
 XPDQMWOIzCaziY9wuZQrHFw0vmt+WnKAQQnSoJ6GYZcG5CB2ruJFTGMVU
 /3IzQ+z05z8ic5O2LsTnDNVKZaCX8ebXRtj0w1Cmr1BrteVGZQUD5HvBO
 0J/mL2pqLzwARCGbYTy5RO8+qo+Zggh/z6SwlXC8ZeYC9spvu4Du1N7lv
 RA7B30nvZRRU2aPgzXrthpfmNk1t3TsIZ0C7nlC0FFJv93j3wzfTdbQSS
 v1bkaGFgWQ+2JUhc2Pv6oEWNcG44+423c3n6Ifwm/XxYuN8FcU8zubVxK w==;
X-CSE-ConnectionGUID: cPVKvbiPTHm/j2qYs+4SPQ==
X-CSE-MsgGUID: k2gGriwLRgmB5uX3Pr/l8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83877904"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83877904"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:49 -0700
X-CSE-ConnectionGUID: 7LCVXv0cQiaup9pI2OuY3A==
X-CSE-MsgGUID: OHXUVzqsTFmD8aEA7tsYLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="258019319"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:28:48 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTYsJt6HAlLlAyn60qtKq/0dF+Y9Uze7XBoML/35V9Bp+gBnArkxhyhozouXGe+PmLtfovRBw8wTYp6W30fi16uR+qGPgJcwzxRvnd4EuLaYImE92x8vH3aKGCJIFX3paOZdk7kGIqtcKqXAcolLBy+mp7FXCEujEgNTiSSC5Zea2zNJPDHBCp5poWvI6p1HUgCWuFoW2x1iDfqlmnQcLh+hPm6yviZCy5aBX8wb3wl7N4txU0mW3VlauaJB+fR6ISaRKabyeTJaGYeKzXtCNcdCar5C2phKf5657JU8rtFFimvA8PNiCzQfXVWC4MkNB+vHlkvh+xNDTBWe2wzi8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyGtcM0mG97WbK3v7yvD09brERzuROcZdWjlsY31cHU=;
 b=ZxSdV1WFzBZFW+PXl+n0wvOf8gqojNAmpfmtjot/xU3T0z1piNZE9BENe4Ha+sdjghoRPxBwrZ6twqS+JTYiNi6vUEQKGVzO+miH6tv5bYuOxHTMJ7faOe7GAOPtWNtX6CbKLNnTRb1skNl3g+j8tWN/+YDPaFtqvm8wl+oFgXdlT3GgrUnfwYy01WyAJLqWgi9PnhAv0zlv9/fC9ywm+wUw0DldR3A8+rSG0YB/CHVjuRiuunOMGgWVykH8iOj76t7rt7rMZcDvyefJuph6etnZmHSBbuhwbiu1iP+daZS3eDxUDEzQ4O9xcB+O/CFU9paHf7eEIXYs+FUydBaL6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 14:28:42 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:28:42 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 03/31] tools/igt_stats: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:37 +0200
Message-ID: <2579fb0205052b87592c7f57cf50501595979eb9.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: b57e98d4-1d6b-4914-ea4f-08ded90f61f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 32feM7msy3057o52kJl4AJ8RdtfLxr7FYiSm9A6iCUoEIu2pB/LwtWDxF6NyzGmtLxEm1/g00p3US08sjumOusMs8FEk9s3+ZmQ5jqhW+0z0HT4isOMdVHPcndik5mFelSeBU5OGiAez1rh/t/2Ef+MCZERdH1Ih72YIXY1uWgd3EYwRha1BT991lUhKuPXEHCoSot9cPbLT1JEfuZ9QtNaIGHhmh1+VFkXEaFUh2XTAvoZ1N8PvikMM2h5LvlbNzJHbOEKOhaCihOW5eiB2u2Do3Rpeyw5gU+Fy3lBT7AJgp29Bqm3ABqGx711s+qPrkAFwAqNXkz1pkbdeJOtILg0gEseMVzvEF4jIk0M1G15Xfw3GV25ik2jU+4Qsgqs8o3nt527jLM0oN5TXaSHk/BZSAanxRO/OktpPTAYJCo9W5dQdJM5FYTx+9Z+rU2uU6TUkUpD1SceXJ8Thn/odJ5a33i4wC8yfYC7aIfCfhOztjA3JLgIHVXHSVWr67ix1LJauT0PEAEoipDizZD6iuAWf6moKase+cicpubmYrFCcQ5nD6dBvb18in9AO9a51QgU798mWWkrlsLB6+tYHyRuZgOrkwVavoUd1AuoIVf1mm6i60FXyF6EbRfg6HGpTUUda1LXx1/lTQgAfqHb0KdxzNycJaMLiJ+s5kmreVCk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7SX0Tn3MnYHhLJtqi0o+bkHgtgVZtzOZzYkX7o4vkFZ2JiS2JtJTAoCY1jzQ?=
 =?us-ascii?Q?B45WVGnTM/O8XszNEmht270Oa+9z6Hjj4TYoQ59w8hAk9KIPZ8Ump4tBiBIP?=
 =?us-ascii?Q?2Q5Haf5B50QLge1PLRRD0WOXd/z9vEFNgCutdnRM6vzUyPx2BYxG1jOJRkBh?=
 =?us-ascii?Q?bmIYGlDVaYFfR0nveSYisBGmitLF2mp5qwoQeDN/XA7KU/X0DHNHpDAPRLqV?=
 =?us-ascii?Q?9yEr3CdQGyXuL1oiiQI2WD7d9WSyWudewZIfORsEybDvGCnx86ejbSJNyTQJ?=
 =?us-ascii?Q?4qDbzSwMkj39AJvua2D8D1hrTvpVVWeZFu2E8YP54LD+HfuCEPM/8mMBtmbt?=
 =?us-ascii?Q?9Pdm9yqQ8WQt6xR60rcxryK+U/Om4w9BtxPMApVnyYx1KhvouEmGn5mDT2Cx?=
 =?us-ascii?Q?qXc+bRCS0hkkmArZTLwReAbvHsgEycv2WAJ/94zDZNv2vXQ2Yxk37mkTZ4Uk?=
 =?us-ascii?Q?WvUH4PoFGd7S1EYCpoUzScWFBpLJ13SzZftHBNZQqmy6YzeAa8Ur8w8dTvIF?=
 =?us-ascii?Q?vedh7hMM0mKpPM4QG9msZLRQF8/KCBa0ETaMjtOgebFAEYC6vtuIwgBGjoao?=
 =?us-ascii?Q?XyajbvEBL2H/FGBqLJ7YV2LITYuRmVoJt/LX10a+Cv//k5gVfpYuhbf6WCmI?=
 =?us-ascii?Q?zIy5Q3fSxZdNIlie+4OVYqgRgfesVYEvqpWgBkDET3e16ZSVh6wUIb6+B7Qv?=
 =?us-ascii?Q?zjEUq3nxY5C5tKOxmuitqJrLCTxjENaC7C5ZHaqlXpzs8Qf3RB0ncsNLE28/?=
 =?us-ascii?Q?t4aGa8Qtyb2iZ/+DlwiYU0/mbFYUqqbV9fZwMvLSRPM8G2L1arVIoI8E2/9u?=
 =?us-ascii?Q?I3p9ti/rDWhVktSF4Sn57zLBMN8DEvS5B/htkY0KO14aOmIr3AW/LJVNFsiN?=
 =?us-ascii?Q?HKE3A+dt4cq8y5UAxg+FiPhi7LwqiREhLSO8N8ZSUGFvFH53TostopppdW3S?=
 =?us-ascii?Q?wxfih2FwW2rb/Hj6l/LhMDijAzDxhHS7eWHS1uUKzVbAVHxChw0+Qxmds97m?=
 =?us-ascii?Q?JQZfma/6vD9CBL1+VihXPYW3jPxpWbAKSaI9IoKVU++FHrnOawl0Y0BAfOPa?=
 =?us-ascii?Q?mwxMvh5nMRknhLXxdVYfW/7uR+HtvdfVzJLkG+lC22wePSjx+PMjjuVDvQY6?=
 =?us-ascii?Q?wGjEluDynYfS4afGMusZIkO0/wA9JM4qfcSdsqaOQ3RsfZkUSKdcaYbwc+F6?=
 =?us-ascii?Q?f4uXtO2uZ+gGamSQxcbU+bmHFjwJCouFcX5rylPMSyGNlzOBatASOC0N7t9t?=
 =?us-ascii?Q?+co21gYl5bsUh5ZOXDlt9xO5PjFf9Kz2q87XhGbi44oX46jTyahSizI/U+Sb?=
 =?us-ascii?Q?OuQk+xnp3yT59PJTNseAdTzdMeeRXc6OO0g3TR1x9k2rdE+SOABjNWxgX8TJ?=
 =?us-ascii?Q?+NJ0lUULrQZ/EirvkrFmeAGa/+oStEdqun2830O2TkXiJZ+J08yUdyeiFHsY?=
 =?us-ascii?Q?tSRVsM0Y/A6GUdZv6C5wME6aFkbQEn1DlknA+Yp/N5CTIpmvuG++HWUu49eM?=
 =?us-ascii?Q?b80OGl4r4rQ5qwFJzlRjyl9T3p4Vi+zfbovSRXdh/9brmcYHgo/l0t2aBnAu?=
 =?us-ascii?Q?LREwygTv/lJwhqa54dVpofGU38+tT9Jpxn0R/mXUI723080G1mrgnINvrMlZ?=
 =?us-ascii?Q?IcHK9Sy8C35JntvwLK6ZXcz1IOScSYZq2o4fRyeWbx+MUzgXxoKUfqAAFp0U?=
 =?us-ascii?Q?grripPtrWkDEfb/ob7sXrvGLv07aiRuD/P/jOLuusthuhb0X9Ou/fsptkqIQ?=
 =?us-ascii?Q?hLjDZjHJqKE0M/4tVCtdMzsr+yzRhjA=3D?=
X-Exchange-RoutingPolicyChecked: cozfJRTFSbgyLe52hsSeNynuEnN3vDQahQpbSAyPjZdoKSIa/NQjftphPlBy53JW1gpcPYbJcKSZpPcHFYyL9GtbYApRtPxfQRLWXNNdsN/cDVr7SDEY3oorEMqjqtUp8u7DXCqBYQ7VQ1ubVPFOTdKpuScL1tLgoTkZUxt/x+/xFQ5wS9VvRrKUGz7H7vDI2cPqPBvfkUcSIoZ26eDxBeZjk1YT7PEdsIgYUpprW1sAuLVQC2Ji5NfBBQSSjk9nEpi4b0xySOLj4vjKSd4W16RtiZcCtcmWyaafnErXw4TmI2S6ifySYpyPETiO7VbTFCuURanNHFsS1BTkybQpjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b57e98d4-1d6b-4914-ea4f-08ded90f61f5
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:28:42.6879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaBGkGlHbipozGrJDmhlBkPvKg+NGjOGh34JnUIX1whqKux1RpsKi7sJrP4YDrccxpPGT3BryCPDEg5WLZW4ZSPPBIFueJJD/ttj2ELxLvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

igt_stats only needs the statistics helpers and a small assert stub.
Link it against lib_igt_stats and lib_igt_tools_stub instead of the
full libigt.so stack.

ldd before: 35  (ldd | wc -l)
ldd after:   4  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..286a718c8 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -14,7 +14,6 @@ endforeach
 tools_progs = [
 	'igt_facts',
 	'igt_power',
-	'igt_stats',
 	'intel_audio_dump',
 	'intel_backlight',
 	'intel_bios_dumper',
@@ -58,6 +57,11 @@ foreach prog : tools_progs
 		   install : true)
 endforeach
 
+executable('igt_stats', 'igt_stats.c',
+	   dependencies : [lib_igt_stats, lib_igt_tools_stub, math],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

