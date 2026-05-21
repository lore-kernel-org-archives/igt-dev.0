Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E95CD4F5E
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 12:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A4910E4A9;
	Thu, 21 May 2026 12:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkWKY9ci";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D8910E4C1
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 12:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779366033; x=1810902033;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=W7PIsFC80sUYGZTaLA2QZnxniKusDACC/Pyy3+YAvWs=;
 b=gkWKY9cikGGJIbCWNd2m7EnHUWVDqbXm87M6qOGOe0DiVyNnYjz4mMwD
 J2u5t24pAYkKiShP9yhj8SKAQn+RP2rNASX9+QtLDzlfaqKsN+LmCUJbu
 mz3gmDFeinGefc9NSWWzSuiHYVA7Vbe82r+R/jV4bKukw/z3rRIp594/I
 xlnde4IVPcUnEQbs09vPVkrrLJKr3IDotzpmqOt1RCIVkJGjrU0xkB/uZ
 nPQM8bOsa56h6z6I9vifp2ijsXm7hZ5ez4cT2D0bhgj0/5ihF3SN5ciOH
 ISs5mIpEBl3BjGuVwTl1030B/yaXOvYDJWLvY0BScsYeio8xMtwtT5nvp w==;
X-CSE-ConnectionGUID: opjTAnjuTvSanTfFZ7aKjw==
X-CSE-MsgGUID: Gf5wjb1QT62TVu+HA6P1/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="102957362"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="102957362"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 05:20:32 -0700
X-CSE-ConnectionGUID: QwcE9puRQSuZ0MiqxBudbQ==
X-CSE-MsgGUID: tekKSAf6TZmWrq8NOD4ecA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="264032835"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 05:20:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 05:20:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 05:20:31 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 05:20:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNhsNcgLAi3WwroMXUJfR3dR+0wUyrfe1au+yfJjQT2kwa23DSGDkYEayQaZKE8lyJDpN7/4EYQeGyOTURe2FG2U4i9HUVRzd5AISk+04sSLr6WPklzeiQPrSYtoKql4WYRwqQIiGG+J9+z0SgQa681HOkcqsRpm0O2rc0LBQEbtmf+R15V0FhwJHROd5cYnjNlg/2hrEA6STe+38l3f5gXzlkspEYPJx7k5krZbTAzYSKw+lItj8KH8gx35A8HOhGghPK0dF4MYRvb1GvcR42sRCFRxpTppsNxvymvnu+LFDnVSWQ17ZG53N3BkqRqQQbe2AugL9tMWiZ1dQBkgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8qzyWYu6bwOUCobPBjcQ3XkklOjryIt56RLHIDRE8k=;
 b=Ru8YzXi/rZkhMu4ZKULMseG1HJGpWQalUpkdbKO6yusKbTrizC0aUhdVs3grf23m75GZKPJUU28l9XPpQjEfKnhmOkVNSvyiYeg2dCqVkW7yxOh96oN3EvK45rd+LXiFLfBp4AdyMeK9rpnVbpKyaxglPfKV/qiH/5EQTIA2/GrUN8YNvPqDqR6CubZZkr2keLulYTXU3WNqhjzu5UyBYJWc28GjYKhy1TYVtKQBU3Fm5Dre7+ww+sxEzs3txv/SgTtAc93ixf/ytspHWFIyEJPvW51LofhDa1CwoC4Sv0sSeYegMUY85BDqpS7Fw9ZUJhWtxI6Y7FxQg80GNoS41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Thu, 21 May
 2026 12:20:28 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9846.025; Thu, 21 May 2026
 12:20:28 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>
Subject: [PATCH v2] tools/igt_power: Fix crash on Xe devices by initializing
 xe_device cache
Date: Thu, 21 May 2026 14:18:59 +0200
Message-ID: <0d96fafa9f1d2aec54eb79ac96ea101bf9762c7c.1779363474.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0352.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::23) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH0PR11MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: fad34713-8616-42cf-6afe-08deb73357e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: zhaGP/+U+Bj4qjbwx5NTvuVJu/qVCq921qbzP2mrnA7enYUWddYPlk9s3U7Nwp/ZkhfCydLe/NLci6KQf+O+azwRNiNB89Ux5MbZdqPWamqRgng/B9iQ8ADMNy/vctKcuHg/qNmfm+yJuy6VJXuGSXKtwePNnjjzUWe4ZeNLKEpkxbfBsgoakyqy/afeiCHAmTqQl5CloqhF2M0zaWsiAFcwEvTx9IFZ6ocn99NhK5xGP5WPvEJD5WwY4URyS+Z9sXG5VOup5BpYrVY3tTbUEN8hnY6cFUnoEItM0DiCtTKLvbXSVfDS0R+FhwF3QEABDMWv3fFVABWxLI0YxnRAtcLaGava8gneODve+aRbvJ9oO3f4ATHNXsV+pY6tJr67BIK7ClfjDA7R55liFtfMEB5E/H/01NIfU1pfAeOM36SgV8GmhMniPLTUEeMgOuLusPEqQCxRcHj42f1GlmUrSlFXT/nOB09VxUYuJIlaScyjD4zIORG1pMKcRgbDsqTvu8vKqDfDSM+GsCnZTzzRzp86UiwOAbYEKNMB27QNhEUPeb+G8FTi0YFlrcMK7z7hA5NMfDHyQo/NDGWXmiszebgqwthiFCnWjB2zsT/Yhi+TPnSzZxWz1k/ZED1LuG4Erjiog4RuKcG17r28qnxLkS2VPwcOI0X32KhV9aE9eqEdamAsEzmi5OXWueaWfJ/A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O0u/Es4ujYaaxq+gbSwRG5aylzjxgAWl5mp/PWrDnTgxq1FRXKKDbq9a8ruw?=
 =?us-ascii?Q?4D5YCOQ0jji3vC3BIeUTLVOZAcoPeHIWx22NnPm2AkE+LYY85W/8I8NAxsTQ?=
 =?us-ascii?Q?AFgB4N5Aa3nZD9g7KSQXhUCLYd292A29fIyFN54VvaE0muEFqf9I0p2IrdSf?=
 =?us-ascii?Q?oLCIKTkBNjgmzkH5euGcmFqjdNYEyWlsc9bjb+sBihjqge7jx4IVPp6U8GEW?=
 =?us-ascii?Q?Imhjoz2rmb34Qs6zdfyJveH5JHU0poi9C2TYc8mxNyFlkVhBs98f71JMqyCV?=
 =?us-ascii?Q?uQSEx0z7ZBku1hyTFU+Iq6IZTn51vcQcJhGtYLMa95Z4ZRTFiq5jQmDcnTMC?=
 =?us-ascii?Q?gJha4HnF+WYRrDK3Ay23xKcdSmYgN4JbCQGEmiOvNzSpTQ12nZ8wRD8hI3b0?=
 =?us-ascii?Q?Ov5AO02O88sF03ZQDrOZfoCZ5Vx+biG62kLDTmRtlg2heRfBtBz8vpDctZjf?=
 =?us-ascii?Q?23x3YRUerL3wg3yLsLDthkXLMJCeoy7fe0M7ZBlOHBQEfM77MA622eUQufei?=
 =?us-ascii?Q?eGEwfGb+24xeOCaJ/mIpx1m00Nq+ZJT2LDKq+TsGHKE4QfdYkt/xM1zYgA6f?=
 =?us-ascii?Q?AvfGcsEtwSb2GgRVmqJBe+PDclB61u1SKTrsJQNAduRDnBVALW/QvS6pR9VZ?=
 =?us-ascii?Q?DG3DCeSfqkokXpYJOwfd8d2ONh3ANLcLZN9kl3bPWnKtUXybMYvAUhmtP7Nh?=
 =?us-ascii?Q?R5UsKOPKnpgTttm622xdC2WAo2BtFDrZhmggYPnRtxMp41n3H/nwULyDujwQ?=
 =?us-ascii?Q?R3fWS34UAkom/0id0MWo4/y3/uRJHf/JI268Q8ei756C6jsJaCWdlM/WBdd4?=
 =?us-ascii?Q?QrOoVcMnsbcWCE3GZon1U+jYlKUkRO57pcklj+0xMBldGFWpZbESOmZ58cFo?=
 =?us-ascii?Q?Mic4cxUZVlok1VVIWQ1xFb3C9BlMhykfPcTpxDdu19cXQ+Z27mifkCgVkbCC?=
 =?us-ascii?Q?/5TOvcNDSedV/h8ODoJHYJkTLRyJKp0qew0tNDu5ct5NhIvUPY10XfVzmH9d?=
 =?us-ascii?Q?E2SxRUpCQXKfLzTf5qmLk+AffKO7ewEA0FAhp0m0zptmiEF10AVFDGfHiBB6?=
 =?us-ascii?Q?KbdlJsaKuBcaxZ5o9oNXn76/jgTK63ZtPHGaX17uelP1el60XSfiIK0qlwWZ?=
 =?us-ascii?Q?Y5JHaQl6Le2g+tl8/AcRAWlhmjmlswUUbGr6+GGl/U+sgqQvM/WhoyGrVTo8?=
 =?us-ascii?Q?4vF8eUnEwr1fPhcEjiYLTSbQphA0h/o0xWz1Jnzagm9EWsdOJvnkW2mV9Gvp?=
 =?us-ascii?Q?yB5ACJJ8Olw5HfQziOsbVO0Ztr31z4sjwQ6ZPR0Udkj+7IiMV1jjrYMV4aim?=
 =?us-ascii?Q?sGWSsvesCn9kyDQE+kiwd6riqVy2zDLukfYPc9v76ThT+7r0JaKWcVCPi3ra?=
 =?us-ascii?Q?jPSXKVTW16hRK0xakZchcAY09gM2LMvIPO+camssO2FVR8Snb5jscxtYgW8y?=
 =?us-ascii?Q?O4Chi3FjdjBEDhE580XEfV2irsV8GOPkmKm6a4HxAHoZhFkyxqyNXz2NhusF?=
 =?us-ascii?Q?f3oZXeP5BL8O+LQzAvPMF6+KBC7UO3ReEF69yHqCEtiN1V7VvxCMb6YFOhvm?=
 =?us-ascii?Q?yftLVdaPDF1m/OvxyUfPpuLMrnsMTwmSWeSpsR7jPnp254J71Tw4yBNe4Su5?=
 =?us-ascii?Q?lJw1t8oBdBMCcw7VN6OVRFNzM4W3vUALgJ9ZzWIiIu9sLVWQsNQpUobh3fex?=
 =?us-ascii?Q?FiBFO65I77LvdJJtgejXA9dxUHzT+5z9ZpB2XnDz9QXIi1xqf3gqS/gy4RsG?=
 =?us-ascii?Q?CO+rM1SL0hvnLet3KaShDWNgy9We5CQ=3D?=
X-Exchange-RoutingPolicyChecked: m/dlMFARaPKpszf8MnlR6uGZK7JdLx9SFH3ua5xSVsO9uhP6ZCGWLf5KIdDdQte9qjNzEn/i5eBdVh66OnxlM6Je1Mrw+Zl31Hcz9D1IDc/hF3EarFvY0oVCVOVfCGuxxcugsbjWy20XVCk0K94wyq8GMcW69AHvKPz5JsRieKvSC7gv5L8BVY8EOoLRquhyVEwIuEkK50s+uCXzZJOQjrPDhqBZqb8jd9WN4xG0kwC4yVy9kyZ2nGmnpPLwI+arr+TsYlpq1XcLwR6O9kdBScbr1easIXxcoD7gm62mUga/7GPp7iCKfa6OExS5T7zLbM3PS/K/kPrAYvbiEY390g==
X-MS-Exchange-CrossTenant-Network-Message-Id: fad34713-8616-42cf-6afe-08deb73357e2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 12:20:28.4495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mPbx3jWNhWtHjxSBxFx9pPjN+lFhzFfJA/xeJFgqinJkehZ3SQARs2BAk0eevl+QY3uNxtGdnB6pqd+1dlXUKCb8iZz3mch1xsD3WxtFOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5830
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

Opening a DRM device with plain open() does not initialize the Xe device
cache. When igt_power_open() calls is_intel_dgfx() -> xe_has_vram(),
it uses find_in_cache() which asserts the cache entry exists, causing
a crash on Xe devices with: xe_query-CRITICAL: Failed assertion: xe_dev

Fix this by opening the device with O_RDWR and routing path-based DRM
opens through drmtest helpers that pair Xe cache setup and teardown with
the fd lifecycle, keeping igt_power free of Xe-specific handling.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
v1 -> v2:
- move Xe cache setup/teardown out of igt_power code
- add drm_open_driver_path() and use __drm_close_driver()
- drop the direct xe/xe_query dependency from igt_power
---
 lib/drmtest.c     | 24 ++++++++++++++++++++++++
 lib/drmtest.h     |  1 +
 tools/igt_power.c |  8 +++++---
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 4a788ea7a..9bec3673a 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -379,6 +379,30 @@ err:
 	return -1;
 }
 
+/**
+ * drm_open_driver_path:
+ * @path: DRM device node path
+ *
+ * Opens @path with O_RDWR and populates the xe_device cache for Xe fds.
+ *
+ * Returns: DRM file descriptor or -1 on error
+ */
+int drm_open_driver_path(const char *path)
+{
+	int fd;
+
+	fd = open(path, O_RDWR);
+	if (fd < 0)
+		return -1;
+
+	log_opened_device_path(path);
+
+	if (is_xe_device(fd))
+		xe_device_get(fd);
+
+	return fd;
+}
+
 static struct {
 	int fd;
 	struct stat stat;
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 37874d729..19d3d1e76 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -123,6 +123,7 @@ int drm_open_driver_another(int idx, int chipset);
 int drm_open_driver(int chipset);
 int drm_open_driver_master(int chipset);
 int drm_open_driver_render(int chipset);
+int drm_open_driver_path(const char *path);
 int __drm_open_driver_another(int idx, int chipset);
 int __drm_open_driver(int chipset);
 int __drm_open_driver_render(int chipset);
diff --git a/tools/igt_power.c b/tools/igt_power.c
index 6dd180d34..c2bf8d92d 100644
--- a/tools/igt_power.c
+++ b/tools/igt_power.c
@@ -38,7 +38,7 @@ static bool prepare(struct measurement *m)
 		int ret, fd = -1;
 
 		if (m->drm_device) {
-			fd = open(m->drm_device, O_RDONLY);
+			fd = drm_open_driver_path(m->drm_device);
 			if (fd < 0) {
 				fprintf(stderr, "Unable to open drm device %s (%d)\n",
 					m->drm_device, -errno);
@@ -54,12 +54,14 @@ static bool prepare(struct measurement *m)
 			else
 				fprintf(stderr, "Unable to open rapl domain %s (%d)\n",
 					m->rapl_domain, ret);
-			close(fd);
+			if (fd >= 0)
+				__drm_close_driver(fd);
 
 			return false;
 		}
 
-		close(fd);
+		if (fd >= 0)
+			__drm_close_driver(fd);
 	}
 
 	return true;
-- 
2.53.0

