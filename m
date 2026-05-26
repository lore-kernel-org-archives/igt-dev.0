Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3F8CD5BB1
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 11:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E85B89DC0;
	Tue, 26 May 2026 11:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="noka0uMv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3AB89DC0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 11:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779795626; x=1811331626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gXcTql5UX8uVZ2ud9cGN6WpOfAKBUM6qAn6b9IjmPe0=;
 b=noka0uMvUYRS/hWRlfnEe87aa0U70Xou/Vv6odZZC5MSJ42xrQ4ddwu1
 4/7eqrBfXbtxPlU0iEZYtTWCn/oebPA9DI6OjUVAsVBdeDRiE8NA0k52j
 iD7CGBVt24Mlg5R1v+aGSxxFFyaSsMtr960xnYjuSSdBMIYOLoI8yJRKs
 P/kd2niHXY6ieN3H+IRoUbWp92bpW9IYHYw8NfceLLnr+SuiWDPjyTja6
 g8PnPucuHkfPPfGvMa6YnZHDJfMDgnlsgLZneOI/6cWVC130x4PHrClVy
 Id7E+FWuOYP8NINmtEmgUqm+GORHYc8/O2x06D2afZMkCXQRvRKR4VP/Q g==;
X-CSE-ConnectionGUID: dcs9ltgQTfCYkJSRDdcw5g==
X-CSE-MsgGUID: RiQc1mUYQ6qPusff7uIcRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91175070"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="91175070"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 04:40:25 -0700
X-CSE-ConnectionGUID: d92+X83zR46jsuzCjYLP+A==
X-CSE-MsgGUID: fP6NUT//QOSAywia44SwuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="246981227"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 04:40:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 04:40:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 04:40:24 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 04:40:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejEWMqHWmnL2Rd/tPinW+9i9oSJOdB+NT/wuPEmUdOOOXuR75+9nR+W3RP68ImyqJ1m5INVM8H4lhO4jqmJW+2iKYOQ6IVb+zssaAx1hlzNTxyj3NlJ9nY6xFY3i6qRmlFEf54/kusjS5gTL9U1uB4GTQKgB42I4alkrt4IdGwpaF17oZYiWQqJ6fW7GCMKYh7iB1PHgYTLJH72cgJqIx/RwPnY2NoITFutcwOj4hPXa9Vkd5FY07B7EdvLaEh4lhCqmCWmY419ZFc1OLX40H2tX8K55QbkGKvM3gXIEfa5fg1mmrV3DTpgLJ2B4OjOMRtrhLim/0vK1JfetvsZTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtKSHG0Fyb93UTaw/LgbE8cirrQzNm3a9zAWWIUB1/c=;
 b=VIPWD+OHucT9yZZgapJGq20zo73Wt+XF0JplTVeTE3IVO6gAhZy7tJTFL477x+RW6E7BOOzoyLcGVWJFA8N/yt4iRFS+xkI87dBv1dydY3tZ4+EZQXhwJCbm6fWeW2UP+7PXoF6Vkj/CuibcpuRHUtQJ2nN5Q0E978S0q9cnKk3O8BOCh5BKFJDTnA1MVoRL3fNYsBbvrt73uHtiYhsOBJspB8ljX9V3wDMTeWwa19KdU3EaVoL56OLg9rSjXvn63tkBFz8Agak1tjznorONHSy+XIHal5nG+cQE/nMethjP0rItCIVfVGUI9GniKpkTgqSNRi0xb8cUYE1q/Lo2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by BL3PR11MB6459.namprd11.prod.outlook.com (2603:10b6:208:3be::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 11:40:22 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 11:40:22 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: [PATCH v4 1/2] lib/drmtest: add __drm_open_driver_path()
Date: Tue, 26 May 2026 13:39:53 +0200
Message-ID: <ce36517d762c8e1f7e8988df446f12853f2fdda6.1779793676.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779793438.git.sebastian.brzezinka@intel.com>
References: <cover.1779793438.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU7P251CA0011.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|BL3PR11MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 5660fd47-7724-49f3-03eb-08debb1b91ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: jX114wBR2SYbGm9IHPiHkh7TZjIuSqcsvqi6xa/ntmuvBZOO/96asoukHAWD8+AYZYOvGx/GROJ2wX4ev1jFNCdfo/PKgHPrJeANasgQWvm50jro84sGuMtq+VdtBMZJV7xcEJiQBvlo28+GRoBNoD6MwTftaouyOnmzMCZPlALuk2kByj9qmuKGHOcqRaAGivMkTYO+DsgEL9AvBDgFEeOnB4T/Bp1NlOdYdFDZb78LXQysLKrEEZOKbaVXvCEAh8+m91YtuLYcRidkcZZyDiYjBhS0BSy8B25Ah9Brc4yQAWrpd0HTTDp0ibB30cKIPglH/M0WxfKkJvEpQCKV5pGHqHxaiihLaGxERNzz7OBOCYt2NPbS/5k9+SzracfPKUat5q82l55LmrO50gWhO59qebMH92Qmt+Zo1xhshL7fBHb2btBQQic4jDkyKIWcBo47peFAL4wJjary5fzi0mGMYcxorU0A4+QOycYAmlDnuHxppIwzHTDh73dDdEShu4SWEGK5gSJpQw1wVhznh8hyBkGUw776czcnHzg6zt8frAaiCWRgQ1a+RMUnAcRQu6HigLuaLjP5Ob2Fu1SaGgQI63lqBKVcSPfN+kA363mw2/Pu8r7FljJwAngUaxiNS/0vEabNxT+qFJs36sz55e5mbWMuZoyK5qkaJoAOvwoeJWjd8bpo2JwVi1BYluH/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ETaMUrIFAFor7yZv0xl79T+QatP93u2s360bJ/+sFu7YAZsutWhO533yC0MY?=
 =?us-ascii?Q?z+tkli1pIQaDzsrSluR2pyfAcKQuQaM/xgTxHXuxTq8Ml5wxBjp/a2TnWAkx?=
 =?us-ascii?Q?QE9onAxfUOhPShYroYsBSIeGS0TIzIm3zBr5RSDv8GQIiAvR77igVkaYUmGR?=
 =?us-ascii?Q?S62wXS5PYpiGmOOoOh5oeNrGdppzDw/6FttEtuaW1abRskRoy7WzgSgoMbfa?=
 =?us-ascii?Q?OgSgW2a0EsCuQo0ogzdXAIFwFG1N4JuwfbhC5Tlh5v5ebRAfEVpHaULvbxaK?=
 =?us-ascii?Q?wKDvqGK6fm4rzjk8imFmu9WjHaWGry62bF1BlYSV+c2WAukaLUSapkuJwmmJ?=
 =?us-ascii?Q?Cptmi5+i65oM0bWAjTdYK4MfwcIldeQ5gsHgBMKiJLhWwvz6smk89RoRm0nL?=
 =?us-ascii?Q?o7A312cqyNPwVVsOG2xHAoZZ9T/xQSkIPkNM+PZDuO7pz7d3Of5kxIaO60aY?=
 =?us-ascii?Q?wchqi0gO5ax4vbQcT8XEEN2FDgW63l+KRAcY/wTgyQ+5H3VGEb4hjDhfm/Rg?=
 =?us-ascii?Q?9LvdVve0PdQ58tORUx4Na39Lu0a4MalqzP9X1inRM2yRKmu51HA9O/EPXMGX?=
 =?us-ascii?Q?y7OV4p0mrKFntxpHsDM5zh8k8ukOb4ZWKgWzR22+Vi1F4SxtqX6oFWoP038F?=
 =?us-ascii?Q?EjxVGWAcznJmgvDDLj9yt3WrQNXZyQmksxQFP4UYaFffPWS0PjAAHYoDzqKB?=
 =?us-ascii?Q?ZvJKE1mzlKq+x6Xvl66snkZ15ic7t8F9qQBFPLUMEQhvbDPRoB3Kj3K9V/FJ?=
 =?us-ascii?Q?Df2HXzhud85CO9ioTCpx25npxj0FWMMlIgCAh/Y2eulr+wnoc/3ketk6SCV9?=
 =?us-ascii?Q?1t0H9/qZ+D6JxhRWJa7s/gSvTGRbkwIidPi0P1lts9FzJa1QCep82kEouKEy?=
 =?us-ascii?Q?LKwYocH3Zj+GW/UO/ftvLY7blHmOJDu4+u3YJCUxDy4fj0Gmi0HTLEIennVy?=
 =?us-ascii?Q?KMXC/7aNzGfPjNWkuq87onYjB08uIcjugQKqGBg+dRduA/x9ZU89s9TsgBVS?=
 =?us-ascii?Q?nzEA/k05ZatzVihby1ibqwyD3P65gYrHXcKYcPT5tXVCJHuKz7c0X4onrdJ+?=
 =?us-ascii?Q?Qvg7cfvG6n2GSuv2FYGceBkEMFqFZdRQ5ANVyB1mJA6LmohvYu4JzqFzF/2q?=
 =?us-ascii?Q?RetRaPhNKviabpKnOCNJQkO8rGFI4XK8sM8oS9Im/zd7UjLtY5peUcujCcZW?=
 =?us-ascii?Q?lL/Bouz+YMVsEA0McEfH+khX5adxVNgdzSXSBlrW2uEOWlNcTgd5pYyrOQuI?=
 =?us-ascii?Q?XiCYAR7qXFm0H6liKxFzUj7pejqt7TheshmmnlDI7gFTprRDDbL1yY5fy0Y7?=
 =?us-ascii?Q?NIO/c4Rue0xOIo+uuo2HvGBodJLOAOqYfIRB11YglwkB8L36nsCGFHqz/NjX?=
 =?us-ascii?Q?kC7uswmTldG8F7aTZFgeSNg2ML1rU5TY82Svh9/yERSOUh3Mh3SPmx7FJWO2?=
 =?us-ascii?Q?wS5/yjGIMJzz2W+LRoj923z0okHHPO/aPTj4+awt+p4scnXxjwuK3c+GQDOu?=
 =?us-ascii?Q?29zAsDl45fTETiBjhWWr7+4AcbAfuCbJ3HVTXZDFB0rzqNh7arYVuNUlsRXS?=
 =?us-ascii?Q?aI/fmmI9UAbEsacpa4ZHvtJhCUKBfTYhgnetwSZiaoeiQ3coGGG/A5MwUuHp?=
 =?us-ascii?Q?2sjrSxC2nspQeLfbJbmKB8VwQW9rf8HsW+uuH3X9D00SyWt6fDr7/E8nDGmc?=
 =?us-ascii?Q?6grWcDZqek4I+wt2CfHMxoKbhsMWldyAEmoqmwNoXWR1bnsH+hyrElm7wHNe?=
 =?us-ascii?Q?o/1BrIssQ4JUZ4oxK0xI+pMPjD47DxI=3D?=
X-Exchange-RoutingPolicyChecked: FHAIS/SBlTunYSeXOx8J/L0tRYUcisz01ujWCcrv2DBiJJ9K0AjtBHfA9sHb8XS3ZFJQ6Xiv5J2laMFFf5T5qBSQnXMfPKfY+BjLBfOhuHeTClzLuTHnp1NUkVaBnxoaLDoQCHFmSFlKq7wMx1Tm5FIqXBJTm1eppekNgpNjw/NWYbrmo8zKa3QutSxGHLU+QFqbGjNTTJqcZzDbPih6B2vJKFlddOjg7Bol0BQ6vU/E7y+pJq/TPrLjCAHY/1gGRwP6QAf0WeKvPFywRyihCEp8zWeylby4GW4QZvXwKA7akm53oLUPXRslxvswIUjWCeTPLVEAqA/cUsYM4puUIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5660fd47-7724-49f3-03eb-08debb1b91ce
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 11:40:22.0267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ez+gjtj/aobhJMozu8Dzog7wmo980ZegwEi8MHgDIc5XKy77mfS03p9GFCMnRWsdRubqCCNKMBkxNcDN1YDHnfG8tk3HKf5frlVnjmVUImA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
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

