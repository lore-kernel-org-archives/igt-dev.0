Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1747ACD4F52
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 12:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845B510E7C7;
	Mon, 18 May 2026 12:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikGz6GBe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B3D10E7D3
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 12:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779107557; x=1810643557;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=+njAJAjl4fQZVIbWvykTO/4/45WLhi3SUWrA/df2Q1o=;
 b=ikGz6GBeuuZW7d0xNAFFtGv6rmzs2FDdti1gQdhVbyVFu3rdqA/+ajNN
 wmNa71OVRD44mAx5n2z5HSrMcqjcjVPPf50yEXc5U1ECjRsG3mFm6f7sV
 C8kV14K1ILbNlSdcYSLznKG2qJn2LT4GfQqm2uN6R55OADzvmNTf4wht0
 gVr6E/7DH4HiSSKWeNdH0etR+yWdW1C1/IZsRfq3fqR9t0/qVHdmGNitt
 o0/N3cUC7Ait7qWRbjI1WD4Y++/Y0mQLA/qyQGPWrHEAbIz2d3wuY0Hps
 9pNBT2uG0/2dBc0DvQgJfx1Nl0zteCIgmpfSdF7vDJxvtcXcFjf2xMQlp g==;
X-CSE-ConnectionGUID: I4YfFWE6RE6Cr2qnDGkYQw==
X-CSE-MsgGUID: g/Rg5UiDR2W7o7fZU/cUwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="105418485"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="105418485"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 05:32:36 -0700
X-CSE-ConnectionGUID: f7CLlr8UQua+IERdO44Lqw==
X-CSE-MsgGUID: QQlDQayMTxqT4/loTl+P1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="236408710"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 05:32:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 05:32:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 05:32:35 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 05:32:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8DBn83Ns0sfz08hQ2Q6wiT3jrGNzsbNpwzFsEFhDxpdN3g/jdn5ajmvK6f0gVEHzLGKIbsuR6Pzlb4Vpo7A+7TPWeWq6Mxuk+WfbGO6QlSqJu0raQsiLqf6SDCT+eF3vLoGE4tOobGCJyP6B70jMy0Snjb1xqUgwRFvcFv2tPT33xlr5fNfusvs8L22+n5hFxVswCFWJck/Awz8ry5e0O6zGOmX6mXVf0XTcuijZb/m0SNHKsK5mzHN8b6T5HGEQrTKjzx2/kKZs50Y0iO19Z9EOlC8RSWphpziknfMulem5uYw6fsOVjRp904gRc6oth9cscv2BtsYkcMoQV5Agw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o2Wc0CqIKEkXtcOLeXXbU0CmdwXxIoLz1bnp5UDKGY=;
 b=nefaDoC/8eUiiI8kX3C/hJeuI2rteqZOztqEwW1dMorxflYq+j92+JWOSSkB00ugplziqX5kY58GGymOCXe7hJ+sTvGOMoCte/pbOEF9bqDRKBsweT+ploiflgaB1sU70j/dHsZ+Lijv1UD0VnnSsJd1zY7NqhZGrJeDSoshcX3eMRc4/Pu+b7JJ5WGiFRPVnIxqUqzeeGpMHvXrHR9+DQJT/MHxmUIZdidVsweGCpVPuuCgdYbPzZJhxEulAoxW6BA0k/FWfcgeIa9WMlNpBkFyfm77X6vQN0O2buyjIjs3yf9tQEX5d6KCigwMZZOcdtMJ0r19tkqTtIwKb+yKOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH7PR11MB6556.namprd11.prod.outlook.com (2603:10b6:510:1aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Mon, 18 May
 2026 12:32:30 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9846.025; Mon, 18 May 2026
 12:32:30 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <ashutosh.dixit@intel.com>
Subject: [PATCH] tools/igt_power: Fix crash on Xe devices by initializing
 xe_device cache
Date: Mon, 18 May 2026 14:32:24 +0200
Message-ID: <20260518123224.7398-1-sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0337.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::35) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH7PR11MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d2bcca-af75-478e-d587-08deb4d9876e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|11063799003; 
X-Microsoft-Antispam-Message-Info: txM72nKhUDvs8B2j5Mtm48F8yGWciH0XrkMWiw5tPzOeVy1T3gtDyQfCaUut3xGdX2fsApzie0gZvLcPtXHegbwpGrBurDaru6ddbarxVh0y5ztj8p8grDPzDWeQQRU1hZ9ViyPAXRJqeNz5zhOVBZnTqFBIB5fZYFYxnNx9gUdJlk/SuMlTDb2HQRN8BugXFOLcxoVDNszKlmsQQQjTxr1n58Tl/Ne+IPMxFEzHa3zqcW13R7ClC1Lo3vI5MSL09K6i/NAuzsKBpmjQPo9kPFLJ91JdlGK1s8dIU6b+V5K6dUmhVO8OCjofQlPOAAWFVD5qMCzu4CdNs5aFf5yByePxA8G8oquuYrOltFy0xEljFvm2baWLTdh746fFx+qTdAabmyD8AAhjD+4DMqiRT6iBaHC52wVloL1+tzyc5aVW+9l+j/RQWkB9P5KDmA6uGe+cbRi/A7ctxMTRvwQ+/JqW1IRPKUFejbUwhB9q14TZqnitxj+BCuAzji8+HRVUJ0kHAJiJUyVrS9mnxkcfj3joyD0U4MP9rrOkAoSS8QOeiuTJ94cFNcDK0f5z8qyFfIbXiOiL4vUHNSoFCoandKdFxRHWjGzM+Wt1zAZp2i2oV6DfEsQaOx1IiK0yomXXP6YWs0EcLfloz23CQUBEO+mMly0zQ2gvNeI8NQB6Ag5O2Qf0kPFVu5xgg/v5GXEC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2akztuTlS8tsymUCUl0p5zu70kpW6N5I5NEoQIZIHYRAGODh3yXVVoqgjNHp?=
 =?us-ascii?Q?ENBNiwrPpNqgehxNBNYVfLFLmQKP7Yk4wGFZJsvBxK+iJdsmvJg7krJWJmJb?=
 =?us-ascii?Q?Hva73W8IiniNE7resJpK/CW6jjBCyXXDSKOXSqEbLIV6eEqljHSW8MxMDM3o?=
 =?us-ascii?Q?z8Ilt6uObcxGoDdioxVEnm1U5doC6vu1Y/rdcaRQmfD2iIPb+Jr7QVJxeHQB?=
 =?us-ascii?Q?PebRZOskOh3xx2n0hfsLXHLEmkc50JPbEv7IVBrxXCq8HqIEMBh7GtpdSM/a?=
 =?us-ascii?Q?YUCCirfEhEVQYbnr+r+jm//9Wm0RllKeR7JbQsWHKZ9ggqpCuP77888v3f6E?=
 =?us-ascii?Q?spHHC1QWhUPqkTqOpu/+PIv0mz4DuIXAMlHexEW2hWJJ4mQFxf7/mrB2oG9m?=
 =?us-ascii?Q?5LUtZp9rHPkj8rBBYmqfnAuLIRaUpY/B72t7GkJdMldyclxclYiOCyaVSGRa?=
 =?us-ascii?Q?Ex6frAxJJuvUiVAX5Y/z+2zI3tgwcdKQFQYgtUjqtlZklRTfx4ARoFYu+JaC?=
 =?us-ascii?Q?EQOeO3bWddpmR7NYWaFfkGtZUkELN7F3AZr9yYaXv+ZSeGyH75tS9BPcdWZA?=
 =?us-ascii?Q?Kl25Di38fww+f8s1ePg63h9JafcVCRkaAzHJO6wCZJC3y6fptGqw6LGkDmPK?=
 =?us-ascii?Q?e3g7YRxwe2/Mue202CCXA7VNZWRYz8lx6zrV5zdGp4lALphbkQLYZPWu5qmn?=
 =?us-ascii?Q?k6q6PsN++Cs9tdz0pv31nFv/pBrYPrQro2rcSx/CzTHIi/iDNo2ALTP4G78I?=
 =?us-ascii?Q?rBUdE35QmxCjj5zwz7e+sVhTibagX18Ku3GDi0ryYCv6YAxqmrW0yBmNOiTH?=
 =?us-ascii?Q?pvtqg2S/r/pbXIBm+1+whoTX68adxktWjlO/ZvBD1+6syYTzU2e/V1k0+amu?=
 =?us-ascii?Q?xRurQc3xed3CWGfMRH+P0IikbqAXb4uBHNBZXlZno6eOrh+kSbKkHb0eYU0t?=
 =?us-ascii?Q?psdRC6qICyZPm4bPvZJelviZzq42Qws1R/7m9xrPSRk1jGN1V7neNHGztQPm?=
 =?us-ascii?Q?njUzJnojFwbmQ/dKp24LrAfbMc3h3qCXZQUhOl1S+T8Gm3nA6l0pZdUTND2/?=
 =?us-ascii?Q?o0VD55BGZtBFeiWKvcq5VVZgyNDe5sRMAMA657548vL7kIrHd+ap+Z12JyWT?=
 =?us-ascii?Q?GACHsMUVtW/+Gi+xEA0e+XfgAdT1vF4CW/qF3xy8w2QZORErcNM03ZsbMK6F?=
 =?us-ascii?Q?ql4VRadBjUytc9X8MDMwSOp/Wjewb/z4iSob0sRv7oHWlV19UE+RcLleYEOq?=
 =?us-ascii?Q?JxdKjXf7CoSeOp+KZh5lvr5IsQf7rCu7HfJC6IHbTbPRQJ7mE26mv+9J9NH5?=
 =?us-ascii?Q?cbnHwvs/UosVBmfXXXAkzybnnY3RWOwTo2hNva+Bi43Ko7ahW+54IT7CAK4v?=
 =?us-ascii?Q?9H5Z6ib69AC1LeKJfwbvCgw0kIzQ/eeobkd9C4bNLU1yJrLQfQaEXXhReRS4?=
 =?us-ascii?Q?YK+L3qLNfkdTDsUUlJ/IdOgGwScZqqXo9kVZT7NEvN1r9RL/Z1KSYz7RpHOC?=
 =?us-ascii?Q?rND1lMDO7emCyQ2tB2hSvcqW8OtyvWqbszlB5XEqY84KZZ22k0aVwqM7Jdbi?=
 =?us-ascii?Q?8YdtUWWpjdYm54xKov43PIvc0VWL7GTRoPhMkvwzUJincjiTnoCBL7rXskHk?=
 =?us-ascii?Q?TOdQRvAu5kZQr29GRj9k+XiWxPfX2a+W6RFq35JyYMVeOi4z5bJ1/kyJazUZ?=
 =?us-ascii?Q?f2C3q76p8RdHVC/DonGR0BzLfHgLziy7rxMBb1lVZHMR58BW4r0EgCNw8APK?=
 =?us-ascii?Q?3bGySdzB9MIOsztCpwfMB37va3nXUYY=3D?=
X-Exchange-RoutingPolicyChecked: Ls0VuB8GT8RKPotIh8KmGl+7NjYMfrPJJcNMGvzhU/Vcn+0TD8j/A/So9+pY+ENNXNs6MwlE62MovIcyqc9sjmKiPlDTP0NIRV910WzddrMyoTdei5OqLt0YYP0r+RDk4uYPAr2pGpsFGmLlLEqETvpnkzjKbBMq5zMPQ8padW5SgVWY/la33X1u7QfZVeEik04gkt/UdwzJl9aWKwYTlE4OiKE6rEdYG/vkQ2RFgHEZn92sJLvfJl35H41NjITdEfP42nbvavLUON+BHaM6YK4qXJ0t+Qao4qZIPCkqjME9L7VU3ZZnBkF3/2Kfe/H6hCpjqNuli+bJlkvaqKpFog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d2bcca-af75-478e-d587-08deb4d9876e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 12:32:30.8118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tf2pu3OrHzI2adQEEk6m85aDQ0lHnXFXtZXJjhR4kPfu3Fmfo+XyWf83q3ag7X6BIc52le85z8B515xvFySXxS2z2CI/myu2uufNYcEWbmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6556
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
cache. When igt_power_open() calls is_intel_dgfx() -> xe_has_vram(), it
uses find_in_cache() which asserts the cache entry exists, causing a crash
on Xe devices with: xe_query-CRITICAL: Failed assertion: xe_dev

Fix this by opening the device with O_RDWR (required for DRM ioctls),
calling xe_device_get() for Xe devices to populate the cache before
calling igt_power_open(), and calling xe_device_put() on cleanup for
proper cache management.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/igt_power.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/igt_power.c b/tools/igt_power.c
index 6dd180d34..11da0430b 100644
--- a/tools/igt_power.c
+++ b/tools/igt_power.c
@@ -11,6 +11,7 @@
 
 #include "drmtest.h"
 #include "igt_power.h"
+#include "xe/xe_query.h"
 
 struct measurement {
 	int battery_index;
@@ -38,12 +39,15 @@ static bool prepare(struct measurement *m)
 		int ret, fd = -1;
 
 		if (m->drm_device) {
-			fd = open(m->drm_device, O_RDONLY);
+			fd = open(m->drm_device, O_RDWR);
 			if (fd < 0) {
 				fprintf(stderr, "Unable to open drm device %s (%d)\n",
 					m->drm_device, -errno);
 				return false;
 			}
+
+			if (is_xe_device(fd))
+				xe_device_get(fd);
 		}
 
 		ret = igt_power_open(fd, &m->power, m->rapl_domain);
@@ -54,12 +58,20 @@ static bool prepare(struct measurement *m)
 			else
 				fprintf(stderr, "Unable to open rapl domain %s (%d)\n",
 					m->rapl_domain, ret);
-			close(fd);
+			if (fd >= 0) {
+				if (is_xe_device(fd))
+					xe_device_put(fd);
+				close(fd);
+			}
 
 			return false;
 		}
 
-		close(fd);
+		if (fd >= 0) {
+			if (is_xe_device(fd))
+				xe_device_put(fd);
+			close(fd);
+		}
 	}
 
 	return true;
-- 
2.53.0

