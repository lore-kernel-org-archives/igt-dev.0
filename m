Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BABBCD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 12:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEA91132EE;
	Mon,  1 Jun 2026 12:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZBA1CC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B00010E7A9
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 12:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780318019; x=1811854019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=d4WzOuaaafYhkIip7+ZXcJXnDFCtiIPa2UmeVXa+oSU=;
 b=eZBA1CC1DA5nU1gb0wNoCJEfSMHG86AuMSydWOWx53iLGZfSh6ww3HrG
 Qs7JCqPHHq91nTBrk6Jds/29KAktfuQeJPYRaR9II0VeP364oVcBHFd6I
 k2K0m9Iab3SzkS9ieTe1fR3SAanNSzjQ4gFKkXxvoehmMGL6iSNnlbDaR
 y42BzztYMqXk08wBQPBm99q28sRlH/9zq6T0NwHnoJjsgVB5jBIWCcjN9
 vwNRwy3Ym00/RhJN4zNSEpISZMwJatMUr+WJQDDDXnlPur/YuZ0ZIj9Bt
 WwqwL4uAswLnaWK2zoj6ZBJ56EH+p1l1iJdTzpnMcqnEvpPgNxCWI8SFp w==;
X-CSE-ConnectionGUID: xCY0PAnmRiiH0gev+h1lcQ==
X-CSE-MsgGUID: dNBjIF31T6aPICwB3UyQgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80212893"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="80212893"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 05:46:58 -0700
X-CSE-ConnectionGUID: PWAlkWOZRhu5yo+IwPuPKA==
X-CSE-MsgGUID: gE7vSm80Tsysvb+dm1D7lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="242521461"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 05:46:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 05:46:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 05:46:58 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.10)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 05:46:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYNzjk3IPigzGOCpuBZ5H+snPhk6c4VoWF7ga1X3YhT/zFh4WoaB2aIYtFnIx0Ov7R0WkbV3jAOMqlihcwMgbNQ8N7+E8lSTIxmUNemOYwIfkYakcchCedMSaYOj2pdFcSsRbwWZccfrnHG1tH88Pp1E1DAu/MuVGjeu14vHR5AR9z1FnV0FeGiB91q6IuXf6awVK+WtPerYQFANILzhljHpI6F/Tk2i2FbniFdLxCIIeGU/b60eM6pYUZgZk51n7qY31NQ/BjU5pGNgDqDc8pQBDsJibLKgDXYlsMDdNHqawGDtyWT9I2uwWTnaTYfq5jfC99GGobu0Dyg1/WXJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYTrHYL7sSMq+8wl/Zj4bx0XLyZ9vcZ0l9v/qH+P0hc=;
 b=yGqd7rICsvtzCxfmEtldVx07x1PRFZRCAa+vTrbzPlJ6AhO+1FuhLpIDT3RN3xl3mBX3MUMsWDyXzsYFWDMoBqS7iIlQM1yAkW/8mVROAEViYCXHHCijLsET7fqAUDi+YF8/GfrsFNsftK9jcm4rwXru4frFSB2DD5tLHZUdh9WuS7sRftvEpG4PWv+08ja9WT1kOyKDlibt/TkrD2gWM5yJ6/1puCik8gguxF13I4irxO92qx0y0nYHd7XkUH0ovHHubDoqzLn1BTWM6Eb/T1Lcw1nclUZ8vTk14xgzlFTgdBGPeq7PPU2mk5iO7kzBa3YCpCxWN+jqxIg/Nxs4cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 by PH7PR11MB5796.namprd11.prod.outlook.com (2603:10b6:510:13b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Mon, 1 Jun 2026
 12:46:54 +0000
Received: from SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833]) by SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 12:46:54 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: [PATCH i-g-t v5 1/2] lib/drmtest: add drm_open_driver_path()
Date: Mon, 1 Jun 2026 14:46:19 +0200
Message-ID: <74d549e21790c747367197e5d6e90f2e58c66bf8.1780317251.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1780317251.git.sebastian.brzezinka@intel.com>
References: <cover.1780317251.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::14) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6897:EE_|PH7PR11MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 9993a8b8-dcfe-4a1d-e113-08debfdbdbee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: xoBur2AMYNP75YvhqIHl17wUlEGLWM+tktaUXAimv5xLHLQ8x06+/jERhzDlvIGkasoZiHzWN6wIvePLzduIqBIYFG6jKgD8VPpqneBKuDyxJiNQoMgfaUDq/1lWUdpCwMjbQ3aaec+cvOtm2PYzp/KlH0Z157lJsYfKOb1yFGQfBXDCihzMOjtVkPilQJf+kC/DaYtvkRH+noVsXDWL2ciiARyGQMbONp1l42UaI6znj562wYB1XAtWBnQqF4PJ1AMxz9y1Em6oY9lMFvYNJ5T89Ren0MkvgqBHx9PychqF7F0L4UlC44ZnOidcnEV7ompeRjcxrLbdc0V7GgwnSyNhmp0i2wwXdTy7S0wm5+7YyX62Bs9ftJiBjyLunskti62MFcJOll3V2TMEPC9vHXuxsUOepbt1eECxAWlbT/nRygHLYqa1qzutBRNkqKR6eWty32hnP6JyUwYRtqeB2zd32uRMoa4M14IrQe5pTzsGtfnTNtD70ZVVLAtYWSOYfJS36852rqjODiZTs04NIa+IyMqq39dhXgls/pMRCC543ZBxUi1zHuuPKIkNBHNBNbABOtkOikHd10/g9Sju0+57n3Oabr46f+qud0ojy0wb/oXMmzEFiAY1pLAwlqxt1RiLUb6PLEeVRRxBvRUBNpQj1TrgJwHB1lyWixkMPosSTR5Pb1fHiuxydG8yILVb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H6qsyuO9qZAO/swjOFxyk0uCWMhrYnysfUDEHC0DWaVAVRe1koOzo1EBRkkL?=
 =?us-ascii?Q?hiWIFY/Lj8JU27wvABnpGAgpmP6PHcmB1ZU4MOEAwfHzw/l1NW+pg3FRDLin?=
 =?us-ascii?Q?zadsbS0uZok3JITDNhQm4+205DMmbyvJq1oxF0MNMpq1j0LzjCijZt56CaSG?=
 =?us-ascii?Q?wslyHlSiRzL27a8/lgSn2rO2z4L3xmx/uJ41edPPcjyrgTOl2zzD9xdSN8qq?=
 =?us-ascii?Q?7HURtGAVa7KZ3E/PhGvtu0vLPhQRRjE/vO6anHFTUIrMUPgPnQ+aHYmzYg8/?=
 =?us-ascii?Q?89pwVZg8DkB0vKIZtpIvD6UyBFCz9XflukqW0hWeDiUYOFWxGQ4L5w2BQf/3?=
 =?us-ascii?Q?ULIBp8aVAlEwbFAZA/oc+TqTrqzUjs0f0dKcSzhmy6zdtVAcLsR3Ak1L1yRE?=
 =?us-ascii?Q?hCmD5rj/iWDHGvjwMmIWQ5/qfXhKypF90X7VuSJMy6XY7Y5MbFuG8TZUQvlU?=
 =?us-ascii?Q?A+eJOvHl3V0GYWogc/x9osZ6rd3WIQAtThX/dNZ3VREkSDCDWZrEq6yL6XCD?=
 =?us-ascii?Q?YRdhqgAek+GOUWFeiq/FnNtqFatmsgEzCGWIylyIWv/w8a7BOyDo6F1BFn90?=
 =?us-ascii?Q?GtcJ5uLrL8WhDxIbWujw2qw1MZQskrXcBQTYd4kdsluasJdcgTdrHY/bKoa8?=
 =?us-ascii?Q?+KcvhHiyveayC9ZEO9bfx/kxVrS/tg8Rqc2vX9xdbzjLbPrGfH7/5VtFLW1M?=
 =?us-ascii?Q?Vz82Vg1kr/Hd19wVpVIDWLw3lJkxAdhxIidNO92oZXgcD4S2f0SPoFkpUa2A?=
 =?us-ascii?Q?x760vjA+P40xSPHDpnfQKuTVnc8yqT/G14yL3+YqDL6Vges8D4seH+6XlwSZ?=
 =?us-ascii?Q?a6CRdu7jTDynq7tvG9PMUJ4qLe8nhKvN9gwesgCc7B0r0oKdGwnvYSM4f3wR?=
 =?us-ascii?Q?EwX44RdGduLCvB7h14yYviCt+dk/ka3edZsXu99oo/Li01MD/u1A+bYNXxcU?=
 =?us-ascii?Q?c2cH2fpoxCPR/yUqRUiymceZjPuzNLkn74uNbXJan6XCsNgOrr3uZ/WVZshT?=
 =?us-ascii?Q?fOLfdy7Ia5aYtvbkHx8aVt75ktAC+CWFPVDxgSTdOhqy5b0aRdFWCrCvxSyP?=
 =?us-ascii?Q?RL2ZP6Acm9Rp9A3detwLPUHfWHWV92FYS6ClVFNzP0Qy+e81c7fhzK0C0gUX?=
 =?us-ascii?Q?Hw8lBGWRK7BnFa9/1KqkElKF9LeKRHcU4zhajfSKA6ibQqi3s++r2reM1oAH?=
 =?us-ascii?Q?w1m+a8ZhYeCWWg47ECrurSXKQfmw/BPXCDc0tsbgw4704KRQeu08UzKr3jXE?=
 =?us-ascii?Q?E+WfVEKi3Z/a5Y5rzSnmrtSrAjj+mBOIwMehFwGKVjK1jcA86G6dXM+X9fGT?=
 =?us-ascii?Q?mML8Qk8Zc5M3DCbHDq9U2SZV6HkKHN3L9X0kARDSimEAiikkwMO5heOG4KEV?=
 =?us-ascii?Q?aismi3b8KT5GSJ9RIl0PzhDAANyvW1yCeMyFh/GstwU6e5DGjfXYYIKQh3eK?=
 =?us-ascii?Q?y30ot9v46fNtuCJMYlmrtey1HBZ/77NiGAwoTNuoPhIguCWNsvn7zChZQzLh?=
 =?us-ascii?Q?PccZ9JSFsFxGbmgccT4Jt2PhLMP7OvV5vGSNAX0aWOdRV4yj+ioj/uL+OzSN?=
 =?us-ascii?Q?yGm7CJuBA7KACw+ELEGBGTnBab1z7E4TWHogRpN8N6c5jPzQd4RI126ezc6g?=
 =?us-ascii?Q?j3xWPxYngfh//3drQHoJ+k4DFiiHBXpFhgTMDKP5LS8AuIEejLx9ljVhZ+2L?=
 =?us-ascii?Q?pyxaoO2imGDP5ylZ6M2IbCKMUkvycwsYdnjQbXxqs7hlHOpVjKGNhi4DY9w1?=
 =?us-ascii?Q?Fd6eEVp94pGrk5ccEsEoDVbzadvLutE=3D?=
X-Exchange-RoutingPolicyChecked: BiiovJYO9qYX7xwr3C1mXxAxX5n5MOQRtQsd6xtZNcZFddZ5Q1uhqtRL7RysGnRO4Dt4CHopKR1Cv69UJflcF0vRb5cmqxUwo9fZBQnu+pfZNtg0fNkyuW9IBycqVs9oxSp0yikty1aVNHhCJQblhhGh1l5FqbEeuBRdsoI61xVL0OMM6grvCf0dLhy9S9AwVxPrJdej2cM28lIUAj26cq+wJCaOiwfei+0qj33XY1G41Vmlf6Ru69gWhU525x5GUFF1C3OJgnlc++Psz/gbilu5RPIyLEZcYmZU5I0+Mq5o2hT7tb/MC9kNmDHg3eNCqidSoO2H0MhBNZc+4ZfsRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9993a8b8-dcfe-4a1d-e113-08debfdbdbee
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 12:46:54.3349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8zC/pG5VfOni6SmiIpxggSg24VtUeVqC1UDW5YjOicKvDhGeMR8EeNzphAuCaZoWzjRXvhfhjq3jBtbLDdFL47hZIBOuCjGOGt3kJpeEaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5796
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

Add drm_open_driver_path() as a path-based DRM open helper. It opens
the given path with O_RDWR, verifies the resulting fd is a DRM device by
issuing DRM_IOCTL_VERSION via __get_drm_device_name() and checking that
the returned name is non-empty before proceeding (returning -1 and
closing on failure), logs the opened device path, and populates the
xe_device cache when the device is Xe.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/drmtest.c | 30 ++++++++++++++++++++++++++++++
 lib/drmtest.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 4a788ea7a..3d1d331f7 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -379,6 +379,36 @@ err:
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
+	char name[12] = "";
+	int fd;
+
+	fd = open(path, O_RDWR);
+	if (fd < 0)
+		return -1;
+
+	if (__get_drm_device_name(fd, name, sizeof(name) - 1) || !name[0]) {
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

