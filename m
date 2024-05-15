Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C42C25B7B
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 17:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4EE10EBD4;
	Wed, 15 May 2024 17:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwJGjALC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C182D10E2F2
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 17:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715793224; x=1747329224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ROTJiwiv5p5cJimx4lh04aX1xkYnMFnLSf6xx2XkKMM=;
 b=nwJGjALCJpmI6E6Nah/LtDynUdNz0Mf6d1ErXEmz+qQH7d72cuNXmdRx
 eF7+lDB6fiXAQucZK58hS0dHccn7qkga08XZPdkeSQ2SAAFtRJbgaPxTJ
 Pu02djE90Paa608pIQhRndxl+XVogWgtvId1Choe9U2CzwQ8WHpepzys4
 8DpgbMiqEVVEPMyVXvodkRaHi5eij17JHXrWEzyCw1mpGNoCoc4lwEpVy
 ij1I06OWI6uZJAKQ17Kk7qLZiB/wovCjDPgKamHoswSGKypvW8Oh1SPr2
 xvaMGmmx2JT8lXB1aJP02cvJrRk6n0dNendM7E3ks9ubRI4lSrLzdEW9P w==;
X-CSE-ConnectionGUID: kP+4wMKcS8iPH+Jso+iH2w==
X-CSE-MsgGUID: hFCerNF8SSe6tVo7j2XqKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23261746"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="23261746"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 10:13:44 -0700
X-CSE-ConnectionGUID: s4JhsiQ1SC29NDBP9+h/3A==
X-CSE-MsgGUID: QyXFvs27TbyLKUQjY1kJiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35677875"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 10:13:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 10:13:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 15 May 2024 10:13:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 15 May 2024 10:13:43 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 10:13:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arSFNj0Dr97zMW9MxifgM+CG05yEQV3jY+foVNXO0SDiWunTBZS2X0Bl3IZaP5wj2fa7CaxdMJBkQ5qWgJLl4VO5Fd/p7OA4196Ix3DJ6tGDz6CmEq0eaQsXzfvISl7Xma8BYMnxOwRLu/KoCNopfY7GljJW2PKx1gJRl9vL+yAmlTsJgGJnnFms1aSXqIsZ01Pkspz+TZW1FqBpQxvxWZ4eiBvcQcpjpD5Wfu72YbYWib4OkBT6KBrxUqay5UT6HXXBEd5sLIHEVFAOwa/nmae4FsejtDw0CVBj4B3PZ0WGdVxTocMN1YNBrrB55NNzyyf+J/acd8sDy3GFXjZcRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5vj7ekO84+mOeTC6b2gv2XFlw197UYHp8ZdrdHJwY0=;
 b=MPs6EiQBJ4Jdb1J/wAtqOvtTvjBiQmXLwWuqrIcvgS3fzmKvfpHGTEl2q5ma4CJ6qkO0zPBnqeBtvYU81/sH+N3yMg6Kgs0fW/S2QF4LRZub2Xu0+lvZ9T9mz0+QFqiDTvIu/Tz3yLH4vEn8PXmOFuq0bmcfdfGk8kbKMw9XdmYHQ1MEXGr4Qyd9M9A7IF45jyuqxtoO2LHwE/x7Up85OeQb9HdJuK15XtUmX2LEvbT+ZQwr4w9QLJ0M4MeSCU+WnVVfP9palyzjY/CXPUoI3a6MknffLnQVOqpVYJZunhXTSADg7rpel4DaEuqDhQCydi/+RS5H5PaOVd5FWVZ1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Wed, 15 May
 2024 17:13:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 17:13:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 5/5] tests/intel/xe_pm: Convert mmap tests to use
 existing d3 helpers
Date: Wed, 15 May 2024 13:13:17 -0400
Message-ID: <20240515171317.84811-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240515171317.84811-1-rodrigo.vivi@intel.com>
References: <20240515171317.84811-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0063.namprd17.prod.outlook.com
 (2603:10b6:a03:167::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV2PR11MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d8fe74-f883-4364-d3a3-08dc75025dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QVYfHQAWHCV/XgiZbttPJAq1iTY1bDGde6w4W7k0u1YqAaUiJyyaVlAJT4V9?=
 =?us-ascii?Q?WdFmkupHVW8DGNbyFv2V6KzufJr09HWJL5/yqHJ8TTcsQreNFVD0xw+BmlHO?=
 =?us-ascii?Q?et5xuUNxhX/+ISHQRmdfxGQWSw2TqwENwmQm6aFGr7+E73jPatZrQ9WhDJTP?=
 =?us-ascii?Q?RmpJmhk8i5Cu79NrDqXCZgfTJ4XwxijLpaxXhKWmgB+pWs39qe9K+aGmF4HH?=
 =?us-ascii?Q?CO0AlJG3r8ylSEmb8tQnCchrqAxEed8xzzcR/OHBvxzBgJG48A+A80poImXn?=
 =?us-ascii?Q?VA8m8yD1BRLQE/Jk3kH+dWgRypL8eNKWhJuENH1aLKiMEQ7Y4uiJ7MVibXJj?=
 =?us-ascii?Q?oiEAy6XumKa5zyMleDuoCsAWg+EGHHvo0Mx33KM9uMtLhEkQVdC0GZaWTCMf?=
 =?us-ascii?Q?jMyj3tFOZGrMSYsI5Tr3Mzc5ev0sZ1NW65DUaMrKsFhPkjn6p1Gqr781aTew?=
 =?us-ascii?Q?Qz3igpZWMyiShmaS56kTrC2hbnsVWPoqRereDO3uwzIPSbYJJA+8t3U684Ld?=
 =?us-ascii?Q?b/ILLbUOOr7Ij+A/0XfshZsp3efI4UhFNz+sHwB+0wslrhvChdLHUXBejEAP?=
 =?us-ascii?Q?Ht9DUgdYcFbV+Avju07K7v6S0O/Jt4XygSbQupAuj9m3oiVQrfjrkbdYR3We?=
 =?us-ascii?Q?ZpEnWBlDs4SkvLJDXm6cJpQ/e/q/qOjnubmS5tHxLoBM53D/hPsX2O/DDTEA?=
 =?us-ascii?Q?ycpsofGu7Hs/pIh2MWXpxVr4MWuZ5Y4ltUos3plGmS4Mrw17lXIdYy2E+mia?=
 =?us-ascii?Q?Rw7NWboGBQvksoau381JVlCGlUSOikHMsYJYDOWHtkEJNi3/asrjnVIRgFRY?=
 =?us-ascii?Q?xtw4HM8vcA+/BEoXdasSWUu6z83Fwb3/oX6DzqlL8oGUWw1TrYpPevVF5Pr1?=
 =?us-ascii?Q?JEwmRYBvcc8o5ZqPthcI9xbf3oucmA5Z3LcpPnl+/l9LJpjC+Chg67ThCEmw?=
 =?us-ascii?Q?cjPBzZEvkYTI6ylH4hkFHqeOXjvbZOVF31w/4IIQkWbXtJVOz2aP9SEWSlM7?=
 =?us-ascii?Q?7uSpQKO2V5zT6WOJ4DVJ9zKc3LYiKxxERVAPyKyc3CfEQoDZkGbvNiX5ZYqz?=
 =?us-ascii?Q?BnKDKQFPHHKdw2I70va4Qnjr/Gtd7cg7CvVOJ9rDP2OGPg/AlijI9rspp+yL?=
 =?us-ascii?Q?rDAVbZWGW3k41OwR37zNCEs4SBrluwqncAb6MqLLMqbvyGOHsxQVsl2J65VD?=
 =?us-ascii?Q?XyRKYJJegLMA6h/A9SUULWytLsElNvjRqdBvv88sk/zixEQms27dZVD8QM55?=
 =?us-ascii?Q?TPOJbaoIojmDiIcmo58cs8fcx7VR4Mu9HwFgvKLfHA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xf1KD5cHHabMrIWeNQMblxlzJr6TGQScwuVvPxsiepvtRblyPawTGcJmQiw8?=
 =?us-ascii?Q?i/OGdnJJyFPmX6CC8nNzSVWydPH5/QGksPJ9+g7MDVZY5fBwGQiHiJ7iw9h5?=
 =?us-ascii?Q?583C2E2VbnoLWjwiSoi3nwB+p1MVaAEn0LTo6ukDyPwBw6kRwfJ1RQAuec5y?=
 =?us-ascii?Q?qfT32qFp/EslXjFQooeL82vWPX2+2tmKdBTzKvCI0l2j+/3tnYkOWtTa5Bij?=
 =?us-ascii?Q?jxg1ZN92M5pQBe+mQCQYNiEDImy9p0dtYsRdSDNwPus5FkIY+5p2N3jYOmtI?=
 =?us-ascii?Q?9ERuiExXlHd106DtG508o6jQql6jhKPhTLofawyJx1Fh/uHGohI8s/Vciq2I?=
 =?us-ascii?Q?1g2GfbLKK9WHKy81wRPZ7cnmAnTmpES3pjCrWTQFrqBGThAPXqeOLcUFrLOH?=
 =?us-ascii?Q?qhPC32s6ro2+AjEz6l0t45rfodX0ImV5BAEebTtCcun+onYlurOplFWu4sP7?=
 =?us-ascii?Q?PKE71I+kjsuBa94u3Qijl8MMopPeIXX0Br2Rvqi16CxvrXkm4rufTKQRsvvg?=
 =?us-ascii?Q?nodoLDnVXrvrbmnniD2uTqTcn307OZwooBTnUIbFx+xCabirxTFqrFfTH+NW?=
 =?us-ascii?Q?wM67SvYpggrFnZbaujOT+y2fjniAsN00JmmG3+x21mekyc2vqLbBeXJ74Ss1?=
 =?us-ascii?Q?pEUWoeyghJUxzhdus08RKpgF5WDjzIezafKbhQB+cjiCy1kyysCWcM/xI1V8?=
 =?us-ascii?Q?IKA01LPGT+zwsU3Akue8fkP46tfkLl8pzE+Ze+sB/O5ubqI0CHFKP2pCbRhU?=
 =?us-ascii?Q?MA85hWUGylyW5jqCcNQNLeui7mP0J2G33+ND2/RvH58CMKD5O1Ct28J2T4/7?=
 =?us-ascii?Q?/O4mZSFGs5HbHZPB1xvqrRflinO9eTGCTZfbY8FSSE8bYSOLkOAEymsKtpcE?=
 =?us-ascii?Q?hgSvhZCu5AV0IAwNq9I+rdhseYHXOG1mULcJjGh42IW5VmtR+Tmj9IHSk9li?=
 =?us-ascii?Q?rdS2RfekHJCy0sLm68sw8aS6HHi1By1zxdyMx7PeuwyCwMYN/eeparZkblR+?=
 =?us-ascii?Q?ASHkjoPswWiSTpcgTvjRgxvXKaFfPudVL1qc69H53robdr+dk1kKmXDl9Mb6?=
 =?us-ascii?Q?AHb/mbO+F6/2eeNLv94jgE5F62uHD0WPTMm2WRvSP+KVULkjeGHOMZH+DidJ?=
 =?us-ascii?Q?qPFHJuJmjIhbpjmkNAGcJaQDjqAnHjc0FznZuxMi6JdtMmamzjvQ1FezuCnW?=
 =?us-ascii?Q?dVMmZkbELIYOG2GmnBU+oJzg7PKZrrKZe/taykzbdYBzvgFMTTeZ1aCy/MVz?=
 =?us-ascii?Q?ufNcqi7P9NuA+Fc6G9LFiGU2Kkmm69DfIIbSGdXtaHEr7m1uogaaKvJHUjFL?=
 =?us-ascii?Q?GSKpG5y/mwm2kZUTlJZkDzz+DGq1KJOG+Yv3Exsv/kLoalaToV1njUiAmWbA?=
 =?us-ascii?Q?7Nlw6abqrnTcwxMsOxAxdevjesrwNa7vZzLe5NODjwwbfEnuQCkgQlQJ10Aa?=
 =?us-ascii?Q?szwwrF4VFDze5Jb4M98SySRN/x179U3N+sgdPCJBwdrSwZVUhuJwzXA84Q/+?=
 =?us-ascii?Q?mBL4qgiwZOsfPnUOMaMieFtXcr1RybMKFZ99kwp827lO9OWQsBoZLVKqu5ar?=
 =?us-ascii?Q?0PVK2gakCxfN4UcN42ScKeCHq+8zr9Lc+xMnHszk93RGpm86e/6OY8gCmNTI?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d8fe74-f883-4364-d3a3-08dc75025dcb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 17:13:40.6265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWR/XIbU+xAasWIHdtprhmXAhc4FLb/cA5lfjYUCMXE7pkCY6nPxTqvIINkITR+xytcvVIAFkYNao88S5Vdeiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
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

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 80 ++++++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 2770ce83d..94e36774a 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -516,19 +516,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
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
@@ -537,7 +543,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
@@ -563,7 +569,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 	close(fw_handle);
 	sleep(1);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -578,7 +584,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
 			   active_time);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -588,7 +594,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 			igt_assert(map[i] == MAGIC_2);
 	}
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 
 	/* Runtime resume and check the pattern */
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
@@ -783,6 +789,36 @@ igt_main
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
@@ -798,38 +834,6 @@ igt_main
 			test_vram_d3cold_threshold(device, sysfs_fd);
 		}
 
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
-
 		igt_subtest("mocs-rpm")
 			test_mocs_suspend_resume(device, NO_SUSPEND);
 	}
-- 
2.44.0

