Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E7ACD5BD1
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 10:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1625710EF9D;
	Thu, 28 May 2026 10:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cjmzs9fz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7183910EF9D
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 10:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779963671; x=1811499671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gXcTql5UX8uVZ2ud9cGN6WpOfAKBUM6qAn6b9IjmPe0=;
 b=Cjmzs9fzBAHGc0/JwLKFw5NTSUBBG9Ls3338Zw5DIfFHNEV2mvnVU14u
 jC4Etn0fh5OAqL+GqrvXHQi6MwKKdSnrei9t+Zt7H9jM5Bxi9k+Tq8UBS
 6QL6Irqyx5f5LdSvkxWwoa9lBeLThvA9mYgXbBtRFssU25QPF66KzX0tY
 1DE7j1vdGudP1dkT9SypPDxu84uCRQ229DUGqpA1YC9wj6dFwVh2hC4Kp
 jGERBU40Cmz5G0UBbQS3vcTk7GVca6pXsK5Q5UPNERy1HxyJtRiR4015e
 9BZ2tiJXKp0MX/Z/20YB/QHKjn7fjgT33Vi7tBaOPD/IyjWxsJ2dY8ZPY g==;
X-CSE-ConnectionGUID: QSiQEl5oT8KYNwEkgXxBIQ==
X-CSE-MsgGUID: 3LsgQw6WSb+UcQpVMsCfmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80991067"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="80991067"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:21:11 -0700
X-CSE-ConnectionGUID: j1Uw5oWSSAGciTYoq70CMA==
X-CSE-MsgGUID: nUjhHDT6T2KWMybuj8fzdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="246787475"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:21:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 03:21:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 03:21:10 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 03:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XK4Q8DZABRjJt1NOaV2RPEKg/gghHljgz5WbHl7rFHvX58VDm0liasZMwUJMmz5cZ228S3458vB6PpPz1w8Xt1aMYBtz2QY7aruo9ZrrKpdj7TUd90LMScm0aN3pkOkfbV+Ogw1jdrBk+lJKThHuyQSRkXSGxZgM1werQVr6AKTljxZEfYMfHM6FEey7ZEBZTccdN2mBN/TZ6ls3P0xBOiVsd24U8fdXFkWKSKXm7vjrv/KXsLMvhgzFG25UJWZbu7otpn8tpKrtw/kZVsxn4uWXQls8v4r59N0+pOPrCEr/TFdmGOhxQ9CgPOrmuMW8FD4676s+3rb3NQK9SvFI1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtKSHG0Fyb93UTaw/LgbE8cirrQzNm3a9zAWWIUB1/c=;
 b=Gk3vfvJsoUtv2Qe7H1NimsN7D5pqDXDNlhuNSY0LyC3oWtFHA/UiK0sT9snhOwE+FvDqQBbdqeWUtftefu5RJapKFb+tfPW+1QzrE42FCti4QMvKg1erMTqOW1DsfqfFCCXb1UmFLT2d9t4RGHWZHAmfWJJba/UcYB5s5wlxA0cJcBZBRdQLLBBhfM/i6jFk+WWc6xTOUhxp6EZlvPZQKRQzAReSvMRryaPEVjrWK0uS1IHs7kiZO4SSxTRoGLr3YU91jS+O1amYRnuWKZXZgbh9Wk0+Ub9Uz7oAlrvBYz9GNhAKlxijDe2rK0tv5S9JOCXh5cTmzZzfK6QrKuJoKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DSVPR11MB9719.namprd11.prod.outlook.com (2603:10b6:8:352::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 10:21:09 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0048.016; Thu, 28 May 2026
 10:21:08 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: [PATCH i-g-t v4 1/2] lib/drmtest: add __drm_open_driver_path()
Date: Thu, 28 May 2026 12:20:55 +0200
Message-ID: <ce36517d762c8e1f7e8988df446f12853f2fdda6.1779793676.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779793438.git.sebastian.brzezinka@intel.com>
References: <cover.1779793438.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0019.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::19) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DSVPR11MB9719:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c1aede-33f8-4b0b-72f9-08debca2d59a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: vuDwodxkvdMCLOX8P/kkdivu68s4kqVpjT94rMyPkExwKL3SOI/22ner/X5BzTfqUWxDWE9hriGGsUKOq9Iv9h9s6U+I4uoW+VzewPnX5OfQtv4S/QJV2Q8BeC3mONpExEjaIK5mw2PP9KHzSazEkTXTQKmQMiNYSgsFypaMPyzXHZDuEHLfkxHzgNnDcs8Otbcuqlx1rCw0nsQIIYalHCuSkpF+IP2Hv2MY1OLm2nJxylC/16eEgFRViy3mXlPp4mxcIrjDqu0O976gwwk/OqtNRWI4jWBEPaK5I7A2joIwpBjpvdmXUvF1Zw6JNiR1ui0wg9lWo6dGcUHcp5XuSaOmmgGx+jREDT5oZTNjZNXdpymtklxuv5XAhmthLyB1CpyN+zPc82YCZtsPBXZuIgAm1ShXD6kgeH3eeEpmi8rJtjoZq85VFEq5JXGMml2UUHUs8itMPWDHFLfAwhpmwj6/y8GvOhipxpTcYzUhOqQOnk06jUR21suoHpRSErO30Yaq2aowED7Hr0e937zvYxvOjp/AmpcZbXMIWoegunPfTJ3nrF2A4d5CRuuaJ5EFN69frTwN6L5uhEUt8H6YjKz7447+la7hlvGkocBf+wt+NLHa8k9InqUB4F11QW2I9pY7b/5Gx4PsUWhn3h2+R7412Ocj8n1bdhEYsSqAOJ18JlAl1eHjHtBA+ZLlWqLv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RWXQOoix0deUNZhDyttL5Uy5JGP6KaHiWojZ8II3XYs94WdHIWOvim57riYM?=
 =?us-ascii?Q?i0wHHl0oy6MXHytqyu4wH4bOCGraJz9UI6vvsjPASxJ0l+PHspc+0rtl544u?=
 =?us-ascii?Q?mBaOCcv72ZGLW/m73r+1Od418QIm5HaBo/1Y+Tv3AQSqRISQLUU0cqHhCsQg?=
 =?us-ascii?Q?XIqIidfZhSK9JvhiSWI4f1hMUGcCSymU3hNwaSXs9VTPY1ke48r7xYcfDpH4?=
 =?us-ascii?Q?inTE464QGNeH7HO5fN+KvllNaJ0TXDQLG33+htSlpX9sNpPvTUtGKc5k5Twh?=
 =?us-ascii?Q?Y3LAIkGswCJXtvlTwzXojYyOL4Wm/wg1qkQTI/nURSOmnWe+2qlfhhdvG28x?=
 =?us-ascii?Q?e/kjypSaNxH8vK2tAkkpmZZQpR+mVk/sg0RWBh0aQ4PV0hv6joyu7rVJkhi+?=
 =?us-ascii?Q?PLKz/hQjOBLrg++y3IMvBOeyyS6MqIEBIygOZNizGR1VT/sP/kn+KjUeTsmJ?=
 =?us-ascii?Q?2FmeC7pD12vPlG7laOAyK37cLFdoN5MgOmm0BIKusZuI3NvWJQr/M2nuj+5E?=
 =?us-ascii?Q?6/SDIv0vcucQS1itX4if0qdj6NwP9Ack8CVoyZlL8vn3/7q95TUBQ/12LD02?=
 =?us-ascii?Q?lp4Gs5u4W2Xh8BCIw1uvybfLf84o3r/LrE645I6j31/bjhLv7eh2qXag4k1V?=
 =?us-ascii?Q?WIGpGxiBh+BAKz+mkLl8/Pn6tP+acLVSLPijzIeXd8lbegcC0EnYcD2fikUp?=
 =?us-ascii?Q?iF6+VGageNgEMe8vDn28xk7GRJ7XGQmp/lmAcv7gK6kLbxrEjs6yUPQUji/L?=
 =?us-ascii?Q?aZFwY2KlHSbCGZUyEdwyZ8ZJbM3AWyBgXCPXCKf9lvBKDWczUfAMEVYpuK2r?=
 =?us-ascii?Q?Ax+/CLiztgAIHpGwIiZu1UtLs8ec5vTZWs0to1Pfqh57Z5fy9E2E1NO69qq6?=
 =?us-ascii?Q?x1g7QTMXXbEVPhUlzjmY68+8RsMuWTEtgym2ZTZiCWqx6mThhc5iLbSvjjXN?=
 =?us-ascii?Q?lupv8Uoxx4BTOX2QsyD+WLwNwgChQiHafXwvhGwTrXP/rUswvwQ08+1szJBy?=
 =?us-ascii?Q?rJh3cDeCzrcAa2A8p4iKXAqQ9rEhaoA0kHKz8YPgOQyjmkxagXD7W7bu92Nc?=
 =?us-ascii?Q?MJpnn9yxU28vN94393R27yg2kq/7n92ZyssFAp0AjL4ObEQVqVT12e80KOr+?=
 =?us-ascii?Q?3zChdjRgukxYGwHAGLlzCgU7XOxflQ9vOoo/eqa+QRrD+JjDOXZTzNoRm7yP?=
 =?us-ascii?Q?pPQ2lWLReseqz4k5aP5ED/2OPJJbDKb/28TxBfJ9uBUwV63PUH1kKwSCPTy8?=
 =?us-ascii?Q?2OOOgTPs6TgVzWUxqZdh9Ea8YO0k1tPHrUGSSMRNCpzXx5MNar1x4D+UQxeL?=
 =?us-ascii?Q?WUvHUUKWNmATvfLK6IVi+ZXVI3msE/EjgiPTbU23/b7zqHEEJPEXx3Gaj0re?=
 =?us-ascii?Q?/XQs6UzlXB+8tfxgvMUiD/1AP+kKl520OMgqtyV68H0QvSrHXQU3K2oZgPqd?=
 =?us-ascii?Q?3jJLv3bC8tr1GVGEDuRxLPI5PPzJXINmnYkaSCnnGKdJ5j6Hl7P5VmivzxJW?=
 =?us-ascii?Q?EnBw0HddZIZmVOlFcS+880IgTGr0Q3tLvCeLWyPFBV9Gk70/+TdikGWaHdqn?=
 =?us-ascii?Q?exFcQb0dI7GMxMGG2NEwpwluUFsJTjezYvHiCPoenW9UlXYOdOz5sjQcY5te?=
 =?us-ascii?Q?oPS7IC/6K+DHfALaZ8dyCEJs6GHVDY7m7BcOZrRGt66xipc/CyGJADO0L/SV?=
 =?us-ascii?Q?sgKv4IPg2z86QRTW3kjkUm2Y3p/CMW9AyEwoYQ2VIIyCK+3DnXMfQ/sIr/zj?=
 =?us-ascii?Q?bTlBWDBQmiMrO3hpk3JnDEYnNv6xiv4=3D?=
X-Exchange-RoutingPolicyChecked: OIhFI9vaH4Y8emRmhFAsWtIYTCXfyoRbedhBTiJxROyeywRDGrpRbZ626wD1GWik05xwC9twS9esNd3zQvLkKKUe/GwZsLEqREUc9RorQX9N9eggs4VvmAMc3EvrO5Ogu9q0pJAqQrdXK9R6sTqYbod3vZqTwk3jDhK2BT7NVILTx4bDopJpuIPYsvnhKYNFR3AcHXvOIIbhJk89BaUyCP792kfKOG0gPATmj/Aq/ZaApd6hQkR2VvJ4ES5HHxYy492gFreXMV/VITJNb0cva0LQ5MYP23GU1pZAahGlfozq71Ay5ayXMZTpvrt7q+e3sKUdpxikL7mOXkC10h8BXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c1aede-33f8-4b0b-72f9-08debca2d59a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 10:21:08.9141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wS2TL4fCoEejfIqjo2ArDyZu2iUwCy5WNO24r9Ssv3QNSRbYS5G75RKcf4I2UBLTDAfeg0/QAuvcEI+zYcTbfDgQwtQzXJ7N6564vqkE8AA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9719
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
Message-ID: <20260528102055.dmfsPrVFIAGHY2sG2T_ArXFMKLg2Jz-EQnYUFmLSMZE@z>

Add __drm_open_driver_path() as a path-based DRM open helper. It opens
the given path with O_RDWR, verifies the resulting fd is a DRM device by
issuing DRM_IOCTL_VERSION via __get_drm_device_name() before proceeding
(returning -1 and closing on failure), logs the opened device path, and
populates the xe_device cache when the device is Xe.

The __ prefix signals that the function does not throw assertions or
igt_require() calls, consistent with the existing __drm_open_driver*
family.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/drmtest.c | 30 ++++++++++++++++++++++++++++++
 lib/drmtest.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 4a788ea7a..7007569d2 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -379,6 +379,36 @@ err:
 	return -1;
 }
 
+/**
+ * __drm_open_driver_path:
+ * @path: DRM device node path
+ *
+ * Opens @path with O_RDWR and populates the xe_device cache for Xe fds.
+ *
+ * Returns: DRM file descriptor or -1 on error
+ */
+int __drm_open_driver_path(const char *path)
+{
+	char name[12] = "";
+	int fd;
+
+	fd = open(path, O_RDWR);
+	if (fd < 0)
+		return -1;
+
+	if (__get_drm_device_name(fd, name, sizeof(name) - 1)) {
+		close(fd);
+		return -1;
+	}
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
index 37874d729..305bbc86b 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -123,6 +123,7 @@ int drm_open_driver_another(int idx, int chipset);
 int drm_open_driver(int chipset);
 int drm_open_driver_master(int chipset);
 int drm_open_driver_render(int chipset);
+int __drm_open_driver_path(const char *path);
 int __drm_open_driver_another(int idx, int chipset);
 int __drm_open_driver(int chipset);
 int __drm_open_driver_render(int chipset);
-- 
2.53.0

