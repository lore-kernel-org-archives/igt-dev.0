Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D615C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 17:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1BD10E447;
	Wed, 15 May 2024 17:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GF8T/trx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A2210E447
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 17:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715793220; x=1747329220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kCi+QCNKhWJaQGwIvEymFWyT/YPn4uVC+7iDAW1TRBI=;
 b=GF8T/trxJokC0aRoU/eaP4Yo4a41eq/2ZgqEIZY35fU9s7xMDK3D9kc9
 Mgz/faEzxrzangDnXE7ha+oKIpPgRnu/5RontoE+ug2WTpi70TZ+EC2l9
 2iwxA796ebW5SsGkSIF3jdJB6rjII2Nl5+/1NjZt/ARVa97ZkhLNTyA0N
 8LRWol7lngYl7uFxBGeJZHZMBuE6s4IabyZuXqu1MYRAKJfWRyCPnDKRP
 WC2N1IqZLbKoOT8X7P3ooiVcCWVIMP3chF/ylseC2FmEY11mVQjTB/iT4
 uX46obNX3bXxxrC5cbsvZP/52G55nl5dsAeGf5M4e2OHDowjzymVFds0x w==;
X-CSE-ConnectionGUID: 0kkHqa1RSOeWQsoJ0yTD0g==
X-CSE-MsgGUID: 572zr5UNTr6RbMMVelRGew==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23261738"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="23261738"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 10:13:38 -0700
X-CSE-ConnectionGUID: 25Uv0LoOR0eISz2YT/jLWg==
X-CSE-MsgGUID: jsX7Ry3RQH2V5Jhet/mnbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35677862"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 10:13:39 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 10:13:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 10:13:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 10:13:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAXNtdC6jym/5KiNi1nTWqsJmyrR7KqDYnVpsSkujoSn98QyWhR1YrPTpk9NfTFE6g1FPm60fs4H1s/3dPUqwxSzxqCsehL3+gN8xJAT1a8iihKddgapzF+KpzVWwyiICsS8gK/6SZ8jxmRkXeMv1mT1zvUvV0DpWPwaFt3gqn0o/BiMcn5UaAsQQ9aEZ+NUh3no0oDitkGoEMwRsiBeQT8Jd/b//7mpQmdic7yI7XtoYoxAKEeCUpm3L7JJoaJ2Q7XNuu8YhvIbnoXLmKmIS+ZtAgW1EStNdUSQK/QGZzZlqKMNF4BYCVF6VtFVgsHWrg756OPPatjcm3V8qmMuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22+tUJPirKHkdGFodba1rNxL4Ndcd7ONtjYa7mGtzks=;
 b=bMDVyIXxdSXFydYG0C8NbsPvLK4e5mMFopXLmFPs6XDmi0AW6OUkILpdell0nXwO4x48VQspaDT2fndIVLLTltJIyhi+zG4RETp6FC/UpnK8KBszoEuMTNnBEb2MTo0O8zp8N4nacvft0T04KavPEl7Sdhbo9CmVZn8WhvK3owyAYp7QqHsaJcTPl9yZkHUzo5hM8uxIh8L2hUMwe5Bt3l/CSWvSI94tz26T9fuvKaNMBlzNc/1UFSV/KoQkW8CouJl0S08dvjhHz0a7awFzxiU7FbPtb3UK2MC/RIB8dZvJhTatfcemhwFP4JyH5jhB3O17CFdODfXKQnfBi0SChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Wed, 15 May
 2024 17:13:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 17:13:30 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/5] lib/igt_pm: Fix and standardize IGT PM library
 documentation
Date: Wed, 15 May 2024 13:13:14 -0400
Message-ID: <20240515171317.84811-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240515171317.84811-1-rodrigo.vivi@intel.com>
References: <20240515171317.84811-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: f0307fcb-3206-44da-0d2b-08dc750257e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/xqvZKW3taKrciw0KPE8DulgklzF5d/bphx4bk652F0S2qeydY4MsVUHN+Ym?=
 =?us-ascii?Q?nzOrEzk6yx4XXzZKNWBNuqaMBEpWkPdn4HoSLwo+DYr2bO6nVJMzNyhl8IOg?=
 =?us-ascii?Q?RIGT3AWiQILEL0SRzNFGaAeTeZxG2m41lbKo56guEL00dC454ksqyAuZgFpL?=
 =?us-ascii?Q?+ON/pCxqzytJEiNVMf17Do8vwhi+m7z0NA8FRDHCeSVdrN2KRErJDLRYpF6T?=
 =?us-ascii?Q?6CfAxq8F4zU/9h7mSkFbiu1Fd0oRw62Gq+6Y1A5lbumwVAtoTuXvv5c6+17a?=
 =?us-ascii?Q?IRMafh0eVEyEG/+BbwBid6MmLBncwovkL+M4bTFFacXRa3GT2YPFsdJ2lL4+?=
 =?us-ascii?Q?ZyJk3QkXI7bw7BzMTXZTv163nKojlQ0esypnmZrGcpNohvS4JLt98XYyWK1Q?=
 =?us-ascii?Q?IMN/xabe24k3Sxb+xHIS0gR+BX54FSGFqXAeC5ils/Z9LxPMOQd9XM2Frhsv?=
 =?us-ascii?Q?9/awLJDAmHO5np5HJMyZjU3MFwyAt3CzhxSVywLzg7e+WxAkCrSSjRh0AymM?=
 =?us-ascii?Q?xbOieIkazAy+vBrn/wQW7mlaqpOOHtcV0SViks0tlb8XH/Fu3W1rnTu1TN8T?=
 =?us-ascii?Q?/39QwRlSdYNCP4Kq9m8d8JNctOyNMH6HFm74fCrh8+G+C++OXtqYnN1JVMDR?=
 =?us-ascii?Q?5y1IaNEuzR3iSRaOIs/euKXlIQnUckZpYZWvx6ap4QXIhL/+UTFPaxkbIhyZ?=
 =?us-ascii?Q?FQVmjl0y6W8dnsQ+ypG3+UAfv1y2aps8Z/FJn0d9xNRNtVuwge0teD4g5I/t?=
 =?us-ascii?Q?or+JXCxgaCsRPGU2gpWlETqsSCN98hTk96FMYHYLgXTArMXQOZSDk7BeuiSe?=
 =?us-ascii?Q?tv7rSrpNVLc+JRZa1UFSAfv90uF6UZj98NI+PvrcYN0MNVGieN/Ne/N1RFCy?=
 =?us-ascii?Q?ms68hvK73YSBUws7DoTiU6ZJ3q6KS04hrqOj3VMH0XJG4yKowO7VG1rBUoYr?=
 =?us-ascii?Q?Xa5OACcJvtErwQlkWIh0Zc7+lmD9jNlHrlHVgxCu+pIP58IriLfxF6d+gN7/?=
 =?us-ascii?Q?z4eyY6QHyEn/q0NOEpZqOx3U/5XetRZ9yWvsSs+1+ZSD9Yl7WOwiIPbx6inL?=
 =?us-ascii?Q?08MnIs35Kw7vo2nmWuGnbuO8XTVwcTJdP151ZqRhU4X1zuBvDo/5IGVySVwR?=
 =?us-ascii?Q?g8tc2rQDQRuKSULd8pz2+Cnj1SazOJe+FssQBexzMPWu2jtlaj66GrR7gMOv?=
 =?us-ascii?Q?312z8kL6jIVXG1kcrQmbgNOFXVD3qiPIqjoXoOtYSa6BLwmVToVHt0ITvaHT?=
 =?us-ascii?Q?n4vPPREZWLkh9Y7kRSFHDSSuo0PqGBNCvNjlwMLlVw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cbvA9XzR87VoK2xqOI3b+CAGcaHHT/9fMOqIp2kjgQi384DkiDHbmnqyob4j?=
 =?us-ascii?Q?NkwZg/vO8ozKD+WpPX3szXzCstKjlbWHxjvlSJ6tz2kHBYkdUjHLNPmnxn5p?=
 =?us-ascii?Q?U05jh0L8zqiQI8cLo/f2ZywVgQdF5Rxr2iespRsebCl1Pu6RlMxfMvtebyH4?=
 =?us-ascii?Q?QO6h2cpkYrexAlQVflyEokWjQmEm7x9ROp/VmNzfYztUoWvI09dIT24CNpqV?=
 =?us-ascii?Q?5UFMJSnZlftHRH6tHFvSQFoUuEYXAzC0Wig0O04vio3ATq/amSRLGb9ULYRD?=
 =?us-ascii?Q?zX9vzLb2k84dgqhdcYstq4FhYYXoV0ZX0YqPL59FZery6SvqCvc7NJtl3GYF?=
 =?us-ascii?Q?/DEoJrGHS4nLNNMpA4r3P62gI9MxQHNt6qCboKLs5UslUgjKFbcgU2nJUllu?=
 =?us-ascii?Q?yACdvCaeTboheS6DChm4vz4CxeNbBeMQwpEwebxyQvGE1hw/aL+YenYEt9HL?=
 =?us-ascii?Q?V40U0Z2euDZncYn9rmByGPFqZ4bJbU37qe7z/iXCCX6w5xq97VvGcGKVDG8h?=
 =?us-ascii?Q?nf1MJjcgz4IOPSYPDvZfTQfN0FlTTn3tl+t2dszjVNVlbEgdvuU6pEW/ymtn?=
 =?us-ascii?Q?TCvmvnMgxcxBn4fCeh1LtSsngOyfP8a4vRO7XFFp2AHigW/PCQ9dusZUxkpn?=
 =?us-ascii?Q?zgBOt+9UkdwKqg/UPaHuBcyxIOiZUdadL0jAblXDXXIYakcYA6WJqDKF0Q4d?=
 =?us-ascii?Q?tLQ8vPowERQjPPzlC8vhJ1zJsaThFj+JW17NhCX/cMGXWfeO4q2CSbjBLbds?=
 =?us-ascii?Q?AiMQwJdWfD2ouam+HEG9Y31Wt39cQjEsqtp3WZlT0Of7vMgW/Dx57ODavwF+?=
 =?us-ascii?Q?0DTCoewa1Hks5PH81OIM0Zlx+Kp5k2l/kmlyYPsbYHljQxR0J90FNhAFMrE8?=
 =?us-ascii?Q?6zEBm2jaWuExsVoYpwO5cEbWE7b/EBD0WPqTuu6FMJ7ApAkXQSxSL9rlJ9Yd?=
 =?us-ascii?Q?1vc1gulha/OIZWP9XznfmMTpTlHaEuoqTPpfaaoUXBxl9HsD+tYIlGWK85le?=
 =?us-ascii?Q?XnGmk48bHTeFpawc+I0lcHZRvZiZjI4c2MFQxqN4UgP9NDhYtwgOw5hoVQDo?=
 =?us-ascii?Q?kxxoq5aUzYfjrwfYHq4G4OM3CIqebaC64S08If1APk/3IxFKK5pHZ9CPJx31?=
 =?us-ascii?Q?VVVf9u3oDjKtkT2rOZ3xc4KDfJZoUElR93Hziwar8iRL+xUEgVqYMeHzeFlp?=
 =?us-ascii?Q?dANqX2abuQfImWKgAmbHRYGD0gsQd1snf9E7PjAPVUhoWl6vsuURmFDLn6s1?=
 =?us-ascii?Q?CJ/KrPPfeUHhgSGkQ/sYlRvP5K7Web4XR3TkaBhBAol+GsIP9GtIgyzAz7VZ?=
 =?us-ascii?Q?fsgC17FDa002LoLts6jMkDKfQ6s0JPQ4MhpxxASdansVfb5s9ATYnvwx+hzV?=
 =?us-ascii?Q?GpswBBXaiOQL4J/6drwaCimkFv8QAwf5ycZ7FayYMFhXVsvVhr58+2HfHFi1?=
 =?us-ascii?Q?pVmGo+pJn4seB5QaHFXTLOD7LZSKsdrtMNVGIJ5guP7FYCQBKlAhkeFv/Znb?=
 =?us-ascii?Q?jpbEGBiWKNLB0dxH6C+XsC2lNXgE3qhV6j+nzeQXKK3c4RamHH3ffnATJtXv?=
 =?us-ascii?Q?6rXTEPRljh9J0FrXNh6TvBNxADmZYXqw3vVSSA/6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0307fcb-3206-44da-0d2b-08dc750257e6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 17:13:30.7721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jVOaoc9p7Wkdkkg5jJ0EsigQxECe/O2IurYUisEjQGJD8zlyjtyhRnODfp3wn3C7w92t3ZnqYxteyP8T/u5ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7164
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

v2: Fix a grammar plural case for attributes (Riana)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c | 148 +++++++++++++++++++++++++--------------------------
 1 file changed, 73 insertions(+), 75 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 928b72685..0b9d3e604 100644
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
+ * Restores control and autosuspend_delay_ms power attributes for all
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
@@ -1438,9 +1436,9 @@ int igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
 
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
@@ -1455,12 +1453,12 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
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

