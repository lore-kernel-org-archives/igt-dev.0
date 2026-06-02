Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B671CD6E4A
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 11:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57DF10EFDD;
	Tue,  2 Jun 2026 11:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yo54F7TT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1984710EFDE
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 11:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780401076; x=1811937076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=abJEDRGWn3sRou1Hb11rVArfkP7hRK+vkNGX7RWqIT4=;
 b=Yo54F7TTRtA1Cbd44yPu5eZ7n4kVcxJlkzpXz6TmjjBZvs7y+Ew+ntmT
 T/S5/9rCRHUn0AdUN6VywxS8zWzIcRpJspC9gJlPIl8VtGpVQ7VT2Fk6f
 D500JKVtmdqIo7Tt/naY0MJ4hialN9Zn0AhU9Tpi5LK01INRLeJ+wNHtE
 hDI1cwDaq9pJ7sSiJlsFFsssqGz9kPjzgGzIcExSa200tziCe1Ppt/bb4
 4DQgHiXAwvUe6BskDU7tx1CcBrVm2KV1EnT0Y0NYZLrZO02Upzuuq32Ii
 ATa3eTTGvMzLdSudMeyLSZe2/I/SF+pYsQ8ecSIHxRaLnavIR1U0sFB5Q A==;
X-CSE-ConnectionGUID: i5FNUmYRTH+hW399vym8kw==
X-CSE-MsgGUID: n5e5cj9/R1eCfAaYIBZcqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="83766040"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="83766040"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 04:51:16 -0700
X-CSE-ConnectionGUID: ud9E+etSQVamV5UqLCRDyg==
X-CSE-MsgGUID: E2CBZ/E4RHmMX18v3mDNFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="267748228"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 04:51:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 04:51:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 04:51:11 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 04:51:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIKEkZhGDX5Eitvttn2d1ZS0Bk73hG2gfiLkDfIXSGG3T11RA58qLHxMV/ZHBBQ5Lhu6rPe0KXxCDeLveRAj7leCx3b9VxSNBuW/tyxjzgG1fm1Ye1IUGIGFnCvBbVc7Tp02NmoiK/7dpfy5BwMMEQI2dMfg5MmCmzfPa69DpY6PTg68gv13wxnPF2jBKkA/3P8UeQZbtzIhDtRrE0+3ZtJsbXCdgTNrG9AALEq1mD8CKAV9Jl+9p/LZECkdFS64Uch7BJ8dUUhUpjrXSFQYSu8cWdHW8GRmJKLtkhYBCmzwHInN+2/PmBy1TT60kajaUZK3IZD7X+bZA/JY5zl6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKJT60Qfjl8mTmF0V4oWiOeeive5PQUQF34ALMFM0nY=;
 b=i66XcSQFh4+/T8aBwtVDWC9sm/rEUVktQaclpNK4Oq3vogvxP17/Rm8z6cTPCdwEtfpJWhkXnD0HGlP2Dko5ffn+JqShAS42c44i6eXpJcTwoJW9lbk6/4zsdqyRKXtTINX9X1j73msfPAI6H0rChnd2HwJN5d2cRFCZw0vftxu27RfKMIdab0K0S9PAAvZYzRfEn5l32DRCpWCAnd11JXMFSBpDH7o4HAEv2YICG4IA7bsD2GXEBMZoJWpo7eFlaNKTzfLI7C3fUG6JWvRqZahKtlpX9PrmL2X0JS5/qxUtB3XcPkHJ9rNfBKe+6zGEeOweJVUJxuhZDhXXlPvVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 by SN7PR11MB7666.namprd11.prod.outlook.com (2603:10b6:806:34b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 11:51:09 +0000
Received: from SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833]) by SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 11:51:09 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: [PATCH v6 2/2] tools/igt_power: initialize xe_device cache
Date: Tue, 2 Jun 2026 13:50:58 +0200
Message-ID: <bd84c34f6e2a65c01c934f6165bdba51e67351a4.1780397630.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5871c3f9-519d-427e-8e4a-08dec09d3c58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: q1xiT1YqSKVehC4iS9Y0vA7Xcs1nhMESDAQVqifHV4KTYPCzNZMGMuamiNr7jntOjzYSvclJZwRIZkzA5UiE5ZcBiB++0Z20APfSbLMXxlq8OAc4V9hzhSuvHcS6q/G5GGkDCeCYovNvszkj66SuBa9lDhlj0IHcD3xhWDW8oww2bskBTF/AL+wRMic7N0Fe1RNmEpJvpByjT8xNms4xdadL9d5x6HGW2i4xRg5OqkTzJs54LFL4qLS10ffA8m7Pudkv55rWEoK/CNJf/HiB7i1AoPSPlnO480JG/1EZ96yVQk1coDbwTGrpLJz9ectxaNZlLajnCB6pe+vLLIq6VLEYC0BfLojXEJmzjgi1KH9skMVY06b7e85FqUxxXYsKZ3q46fcKrPHJCguwZj9mg5UwwaGUZL4HT7zdUjTR97BO55kUTTk0JIe+MX7UNRtlXFL+1osauiEjQqEKOVh+SkDC9y2xa2BPFBlM7s2vQXB6AReN0e+DiVyeIW9S64F/xMR3m6lw6h4W3PGMilONctl7DyW8qq6pWI97NqpLWYpwyzfXdx4Cyn3uJ9FzvQVNp+zXILgguBhowW3D2/hwK1t5UjLjtAX3ZvWzMNTjqY+Yzdvx7j68woOTkhJPTiETSoO8jq8Eqfr+p1WPmMh/zxSlolOJyUWt+HH2Ez7tBSCcnap00lICPpykNzBxkdGR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MJNCEBdzZW93lJRCj3HwAjfUaZqqB52n7U8hkayPBX8ga/ekhaG0EuDmQEXs?=
 =?us-ascii?Q?kwIrP+G+p0IzuNkvLobCVsbBKhWgMbwNnUb3zz+IBEV/GbV+GkpvwmkQzdGR?=
 =?us-ascii?Q?gP/vHR8++oLuc2DavpUfHx74cd4J+aBd+CmY+ZeLXSzbJ0DeEWEsYUw0ob7e?=
 =?us-ascii?Q?i9ZHfXz2p0YSD7FIWLCnZtOl9uC5gaM8x/6kahoXMunsp1Wm7bMkVyejZvaG?=
 =?us-ascii?Q?cw9A7620ZZD/Itw0OH5igy8l+32SCnhnF4XerlZqdMl5dxHoooZoddIdwtbQ?=
 =?us-ascii?Q?4AP3aZ1MvoFOnPTAgpnlZXd95dkn6Hxr5Rc2GbiXtAYUv4RqNq6oJtRxcMjK?=
 =?us-ascii?Q?Oxw/Om5aFYGhkXhUQrpxtR/cjChudzWB3P0LbMP71YAK7bI5z5AZTI89R5ci?=
 =?us-ascii?Q?0Ip4WTeK7PlqN8NQUFSZwxTdbMKj2XTj5GF83kgqtDFsIy6H7j4dZruJ0pAi?=
 =?us-ascii?Q?uX+1tbfcIpRzj4q1zKNADdleiC+bIg7HSnkx/FEnuMK/kWRjRzEIb87QZ72c?=
 =?us-ascii?Q?c49fNRGfrjzBe+RoXU85KMuyZe7aaCSAlyPDZ4OsOS05sspyiln1JYBcaxtH?=
 =?us-ascii?Q?uy77z10UFIrkrg6Stl595UhT0X46cZGNYi2p850ns/IX/gEugQ5b5oeHz0IN?=
 =?us-ascii?Q?ZpDDF7ltr4omEuf31+FeMhw478YNjp9qFxlGgm1/cMIxEs7wwPQfwAed/FKk?=
 =?us-ascii?Q?E7RKPCSDHTwDLESS2yExA/6OooKIQCIa5tU0Xok1l3idxxHJt0ZgaAAhFtBp?=
 =?us-ascii?Q?tmWG20eIwqE+QthyxIdeNx4vOphRyb8YWRUFQ8lRLtLIIsjUfcVZgL/X9USk?=
 =?us-ascii?Q?HkSLvnbah9OgWe2kCTwZtmHGLj7tPWxR3ngLvm8LhHgeLiACdDk7bfW7lD3s?=
 =?us-ascii?Q?rB0VcKn47Ph6lRUpCmHTW75xpWjmE8Iy1rflEwKZQnh1/6F2B0qNFTYWXpJC?=
 =?us-ascii?Q?LX4/PPzTdHLVjoLBr8/VRJAlRMpB0Pf903wjGtxo4uAr6RWH7f6bsP9DKAsl?=
 =?us-ascii?Q?DDeDDL331viQNruTeksvq8CInj8dbElGWmRDUyKQMxnos20qu23BKVRq3IOL?=
 =?us-ascii?Q?sDk9RrB2g7HIc9BkwSntlhggh6ZWkb992gjUNld3+KDReYJpw5EbUqk3vyo8?=
 =?us-ascii?Q?LlzrfzuoshycYSQiTJOwUPflCFF9ZtnHrMEIb75L+/OjpIpSbYZXW/t2TUdw?=
 =?us-ascii?Q?BJGwt8j+Nf3Jhdh1speAskSUDApacIcTiBjAjYh49j3l1m//d307TqxcATpE?=
 =?us-ascii?Q?3lGFcK0BuLlDdkvfcl7D9FnJCRllTs5K62ugag9T19gD1xV42r4GPSkcEE1P?=
 =?us-ascii?Q?exOFITfuyWxW2v5aan1eTipEO+i1vM1GVJNDCBAWKhkQHe6o7F+bPf1V9Vrp?=
 =?us-ascii?Q?t5PyiGP3fCVTCeQj88DTWQ5GeH9hq0E4aSoZ6PCuXUn6bwFjiIJgOL4GBU4F?=
 =?us-ascii?Q?p2WyZHhTMtIqjmWbqyMINgMCygF2viDFSi/CutVOMnRUe/T7BtC3wlxNZly0?=
 =?us-ascii?Q?Ip5Vmbh9PQbzZ93lrFpe3FIQPnW7thgcoAZoLH0yisJVCU7qJwm4jTY2tW0N?=
 =?us-ascii?Q?EWOj7D9U78jQ+Lr3oIHUpLuUVkAWznMp+u2bEfRHeA+JWJyAVoYbFBfo+wEJ?=
 =?us-ascii?Q?LFl+TAVjndeD3LEorivm8CVhHYMaRi8JgnZKrEune2lvsHT3B1kU5OQ7v7/v?=
 =?us-ascii?Q?r53HW72+TvQlDNWh+ra/98ozn+DrJdAiMEpmw6ddR5Nfi16uvlhai3eLUU40?=
 =?us-ascii?Q?H+Z+jK4uJrhhfydMyv07FOivKquKJuM=3D?=
X-Exchange-RoutingPolicyChecked: g6u9y9n3ycC548hSRzMCxYayyy9Zi5SWKPm/5Z0xVTBTTrfOeVostAYXLPzDwxnFYCX2H7/J7msjiYKcar3x0b2k1ED9Ela8BtgEQlKUDk1aYsLGlfDMMYJQvYfvFux+59KCXaLvK/X97+usiAzqTB2ykMXWF/tdwcI3fbkpuzeDP1pQqgJuri08ZbYADHv8r7/8COEPn9jqtYgLQiFck0hIbjQ939bb6CCWsMInL5M5Qrn2LjppXpGJTO1m+ha7rCSDPT0rWBWAjtw0FL8tTyfyhGqkdN+IZQ5ym2v56RXpDKqpyWvlePVmiYLxDKbzHdREnQTcX/PUbW3AkaPoQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5871c3f9-519d-427e-8e4a-08dec09d3c58
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 11:51:08.9878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7HI1/nqZanILWJ+RqvNnXgcK4lKVi4OHuGa7LDvNc2Yc+lNlxnOhb3+Bipq8h2lLEY2kc1wBkpBH9MIb52CHa+fIGAWOl3NZTFy7QlXpUQ=
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

Opening a DRM device with plain open() does not initialize the Xe device
cache. When igt_power_open() calls is_intel_dgfx() -> xe_has_vram(),
it reaches find_in_cache() which asserts the cache entry exists, causing
a crash on Xe devices with: xe_query-CRITICAL: Failed assertion: xe_dev

Switch both open/close call sites to drm_open_driver_path() and
__drm_close_driver() so that Xe cache setup and teardown are paired with
the fd lifecycle, keeping igt_power free of Xe-specific handling.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/igt_power.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/igt_power.c b/tools/igt_power.c
index 6dd180d34..9458315a3 100644
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
@@ -54,12 +54,12 @@ static bool prepare(struct measurement *m)
 			else
 				fprintf(stderr, "Unable to open rapl domain %s (%d)\n",
 					m->rapl_domain, ret);
-			close(fd);
 
+			__drm_close_driver(fd);
 			return false;
 		}
 
-		close(fd);
+		__drm_close_driver(fd);
 	}
 
 	return true;
-- 
2.53.0

