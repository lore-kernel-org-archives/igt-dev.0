Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8FDCD6E5D
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 11:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B698310E2F2;
	Tue,  2 Jun 2026 11:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJcNalNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68ABE10EFDD
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 11:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780401071; x=1811937071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=puVmsmGXLfSRPrv8Dh5Hgnv7yYZO7YV/XRyG7ExF+is=;
 b=TJcNalNEPCN/Q+gfKscCeVBDf28WBT72iBmk2wjtjb0H9ztR97ffwGyI
 u7Gj2ijzj+YDUczRSHY4BYjGK937zo2ibiSHpnLinaTnp8oxf2riwUMRt
 x45R9zQGi/woG9Ub4fOlw9nPLd2vHepaeuv2UWy7DPA/XCEqEMyViLTm8
 /JyNvPvRXmsWiqPfSGhakQMLujrZNB4FqnLY97VRaNpLP+e8iuSAzrxGN
 AlYwMxHGUboxSeCiIFt0Z9+hliIxo4Q9K0NwV1UXYKZPv1gz+Gu+yTABW
 jmMlgeGFGrhzoETFe2bRxcBacBgLoncIwNrsihY/wxeDOlIkP92mkNxyD g==;
X-CSE-ConnectionGUID: eQO0FNt5SUWxVUXxT/EXeQ==
X-CSE-MsgGUID: BK+RmPC0Sla0zLIzcGi4+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81151695"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="81151695"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 04:51:10 -0700
X-CSE-ConnectionGUID: YJFz/FGGQYC180GofiuWkg==
X-CSE-MsgGUID: c1bQjo8PSEO1mYrcG9/Hsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="239449482"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 04:51:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 04:51:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 04:51:09 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 04:51:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aftyiJe9nXBIxb1bFTbtoPlnRVUZaBfTXSjCA+XVnMRypjLAyvcowZ716YmTw3GMVl6RjB5f8hczxYm1k5+3i6FCP2eUKIpnsgb8wocnVCzD64gNJaMETBqOZSKBGESlIl+ETJ/PPhTrUCsUbR1ItLSNwYm0NQ3G1vVKBosSktbPrMDcLLuhBF7/NgN396KtH5Zib1N9WyD3VI/ri5FO3NL9e7wKQFy9+YBiuHffKRKKBoF74+4hHZiXKi0jE7ytp233Y9WdbQssASLNjP7Lx3Qs5B56J1DkA3yMVFzRgej4cecB8196ZYXasqLeb6Sg1dLIJCUrDqIdHlotNqO6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5N5pTgQicLcowBXJFpRh4HJpbNtBFO02YBuhCvp7wY=;
 b=AfeRas+rLRCvAq0f4t8KoyhA0tqJxFAgujWlnAkQ1h5KYM+xtt5qppM/fuRZywPNETV2XLaVADEe9X0W2sCO97H02JsvH/gT90fTVLawUBducilzXXQwCv6HBPM5vgU/or204wScnh6fTX97hvA7LpyKQNuVGOP+AY7Y5Pq0c/kiVxdoeoukbYUy9oNwukl1v7j+yBzGgBydcoVTpDJLMnB0AOzbVRnXJ5Iv4dySh04VYcpRsm4TefGU4uZszdrqI72tROIrll2Zp5jMLPpt+fs56jeNL63LNml7duTkRy5FxLNk9Lk30zTb3eC27FUO/L6a64JRdMqaZuWlixdLiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 by SN7PR11MB7666.namprd11.prod.outlook.com (2603:10b6:806:34b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 11:51:07 +0000
Received: from SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833]) by SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 11:51:07 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: [PATCH v6 1/2] lib/drmtest: add drm_open_driver_path()
Date: Tue, 2 Jun 2026 13:50:57 +0200
Message-ID: <3636f67c531c0e99743682c5f69ede74f5e0487f.1780397630.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1780397630.git.sebastian.brzezinka@intel.com>
References: <cover.1780397630.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB8PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:10:120::36) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6897:EE_|SN7PR11MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc20f9d-312d-403b-4251-08dec09d3b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: /xxN4ldjEYYPdlSWimFTZ8occJo8m2w+kYecQCxHeeYkCXy1hhlUHoiIpx17X7Lns2nGNQ7trALMImkkSSjA8v8LTfWkEdqNi4aqyDaG7eVg4wc6OeD2WkCS9aMJIbfa5rQZTb+AsCEsiqJ+OzEGGjU7xXX2NkQCw7Af/TsAGZJ7b9Km+QKTyOLq9AQRVscxkmSar7NRplZLYov56t+972ueZTVUeEGAzCmSKoEmMEb0wV0zpaXbTJkF04Eqbo9rPevesmKVZ9oBxGjV/DRhE9Qbc5l97Haj4CDI+PAXjjwaWrYjop2H/9GOYycQcRvv1kHwGsy7qla0V5iVP2tsFurfidYmU524Vc242oe7BnNJLecjtNdzJPJsRl7ZHPvOWFlwYVvq+UDyrXg9FBSBtNAG1hKxxY4pC6PWU0HNUpHWb/XWEEag4G/QOe3Xro+dYhzulI4Y+nJzCMUYfyiHHacKU0hW+H8NbDwr8oWGS8c87zdXChZeGF2GAVcdJnxPcrwnM3vTSwMgqig/nhHf6hWfKE/e1iT9PJBjT/0jyqCnlmo0WfebEpIZ5bbipc3vLwnpWcoZkPpP+mVEgLpUqSjFbWSC2kwNCyGTPTCpKV8kfs8vQ0iKorZ1kuMaP/biks+VEN+HdFYo7hwVe9lMQQZ7KFUAZfPCfd86TRLZFoUwOBpSIF/H51MfXQQOTMP2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d3xonwmHCoeOpNtv7xcCpnNFgqTtKFH4urVAVgzWqcJo8pa2nLKXNWK/Dzny?=
 =?us-ascii?Q?yl9LdjtWP3wRQMepq8NTvKrJ6cka93Sk8dyUav3M2uZMekG8BdkvwRNksGOQ?=
 =?us-ascii?Q?qKFFLy6lzLdekBNXBI8ZfApP9KL3D6WbCl0CjpZU4HrDcYkt/lRxJ1fuzb2Q?=
 =?us-ascii?Q?U+6ILnxD/P4ksAc6+EiQKE3VpoWsbkGShDUKSeZ1SwOg0T3z1k9Pcyj4BIJJ?=
 =?us-ascii?Q?MWAF5dqW/31IyiETdYP00tEmaJ1wBzYp7+f7bL4aO8tHEYfTz2t1hKnrLG8r?=
 =?us-ascii?Q?g5+rhlvz4YuU3znT9M1bHkChWDDjcx2shU52qx8/XBIZe9z9SBVTCIPsRJgv?=
 =?us-ascii?Q?kHqnRuKsyd1kdUEVP+Wx/sZQ/qML2a1pXo3bXMkpEDGtJCZ5YggQyTrfENtG?=
 =?us-ascii?Q?J8p+N1oNzK2iJBsLjONl2WfqDyv9Jyk+XwEFfTVXPVuPB5QOjSxTrqpgoRIz?=
 =?us-ascii?Q?p0CMMSOZ6QDfZqKcd7HqsoxkRfcmUsIPFb899NABB+OrwByh1MXtCtUvshDf?=
 =?us-ascii?Q?DHlxyvUKOJbINQvhJSysqkcXu6Uh3IX7zQu51DZru8gWE384nmvHUffn8GU4?=
 =?us-ascii?Q?Rrnzv+3Vun9cO3fwrgbt2len0hpqq0IAiWeIL4fOYY8t64aGn5yBZl8S37/o?=
 =?us-ascii?Q?sXfyjLGT5Tf8aIsEpJg5w78XNrHifH7i9TazPTm17cqCgy/yNBsmIrMTjX92?=
 =?us-ascii?Q?4qHKxijiTAFAVtIWFYkBhootWdgucvnwTtjw8K2Q98x004jTvlIcNneZzHZY?=
 =?us-ascii?Q?90cxxdZU1RVK4Qv0yVt4R/kyQSJ+ZJYJ0+areMSga0Bl5mDU49R9J8zfUaxP?=
 =?us-ascii?Q?TNM2hWUjCIVW6G6I+Hzd3WuNzkkKaLfOMjKyxFrbDyh2KYK3fRJ6B0Bt3LKz?=
 =?us-ascii?Q?E3e79YenC/kmod6RTLTewqQCRqqtQBYlHDQBNXNmJMWVhw2pKN5YuTmGCgxn?=
 =?us-ascii?Q?lrDx0AdvMZT+AMqoVOIb7alNEa8NLrqrkiiWM2uloeOYxMkdtGuFKcjsjBZe?=
 =?us-ascii?Q?zeJjqQyGvkaqtHVq1wh/4+wX6q11a+lF7MrjGQ+z7dhMnS0MLNzCmnnFwV34?=
 =?us-ascii?Q?kIrWFFSzO1s0znZEiGLcC1rMmEPHwgksILiW9uc+4tI0p/xAlbwQUYvcPPjx?=
 =?us-ascii?Q?GfAyZbhAZqpMbbjtTa2w36I96YnsVaETS6s31NXaJnObJEOPna8zRcHm7qH5?=
 =?us-ascii?Q?2jPyHXjmYuP+vjYcViucEuLyHU7jVvRGyw1+cFlgsxdPSjyb/Pk6O9hbBmR/?=
 =?us-ascii?Q?YDaRE/bZpjOW453RU9zshqptB8U6KMLUSsLlNbEObGnrAU2hwdmsSCf0ivo9?=
 =?us-ascii?Q?6+/x0p1FgzdRjcj65CfYRZSf4u3eoKgwOx9Nw60cCEG611aFoRGUM+B9Gf+S?=
 =?us-ascii?Q?BBjOAa6OxgqNcMK93PO/DXZcRA04ZgDcGGnoaveMB0LL34dF2Z3zobaaQHoM?=
 =?us-ascii?Q?2wK5SLPFCXW80kQ5r+5lO0CYnpx+LN4nkGmCagE3WV9t0xpT7Xil5myCBFqy?=
 =?us-ascii?Q?ixxGfuICuuk9B0rUEvpC/BoBJIZjlEnA0KuQhKfdsr2WiRL3gY4OFgI6BBAI?=
 =?us-ascii?Q?JSm00LMC5BvRDTHO6+cg+Q1YJPl51DUEh5Omt+1t/AZu1zOVvpITtbXmBtFQ?=
 =?us-ascii?Q?qWct/TOyfnwaRQhDfVHhnbVLa6keUh4NsrHY93ioFCszlty6+ashQYVj6vNO?=
 =?us-ascii?Q?WBq/JMMARo/ErCwTVEymTpxJ++XjFgq+2Y5o6cgjBAFnqkdQcksTpY7fclpt?=
 =?us-ascii?Q?lcmFk1Jg80H1+lBZvmkbaLF/Q/rQWso=3D?=
X-Exchange-RoutingPolicyChecked: P+i6lIvlKlrSupN1tJQkcOuXZv8BwBAHPMptTxQP2E8vMn+LvoQp6HohTRvvl27gZ2TYkvKgvexfzfQlsHHamWnq1tk2X5P1o3UlomTEY3cSb6pvjv3ue4Y0ZDFB2GEIUgVF091kIzgPkkZfSR0Xh14RZfVKRZ8Hf34aJrx7sldspZJ4NiCSnlLdTP4RBqqvaxtbmnzhVZkQvwKn3BLNujQ23lj13H2bWw0kj/Ne0JtPtx5alQeoWhv+NkOELg/LlVTDX4fRQe8iMj0RRoQLJha+gXEOcrhMnFGCRLJ1wCS1p4TLSjFngJDdUFWGMY6GrRXXHFwXAHUUZqQXLmxhCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc20f9d-312d-403b-4251-08dec09d3b3d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 11:51:07.1386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTOwjdhAcaDA2Dki9igUgTRrqpfAoAuwC/IGNJ/w+F6WGY6NY/qynS+4UM7dmUnp5m7vn3mcnzhuDKhC8C3vtCQ551Y+M8KhxbYm7F8Wth4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7666
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

Some callers already have a device node path and don't need the
chipset-based selection of drm_open_driver(). This helper opens a
device by path, checks it is a real DRM device via DRM_IOCTL_VERSION,
and sets up the Xe device cache when needed.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/drmtest.c | 35 +++++++++++++++++++++++++++++++++++
 lib/drmtest.h |  1 +
 2 files changed, 36 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 4a788ea7a..40ef2bdee 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -379,6 +379,41 @@ err:
 	return -1;
 }
 
+/**
+ * drm_open_driver_path:
+ * @path: DRM device node path
+ *
+ * Opens @path with O_RDWR and verifies the fd is a DRM device via
+ * DRM_IOCTL_VERSION before returning it.
+ *
+ * Returns: DRM file descriptor or -1 on error
+ */
+int drm_open_driver_path(const char *path)
+{
+	char name[12] = "";
+	int fd;
+
+	fd = open(path, O_RDWR);
+	if (fd < 0)
+		return -1;
+
+	if (__get_drm_device_name(fd, name, sizeof(name) - 1))
+		goto err;
+
+	if (!name[0])
+		goto err;
+
+	log_opened_device_path(path);
+
+	if (is_xe_device(fd))
+		xe_device_get(fd);
+
+	return fd;
+err:
+	close(fd);
+	return -1;
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
-- 
2.53.0

