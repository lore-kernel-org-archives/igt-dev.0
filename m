Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DF2C25B7A
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 18:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F189210E3C4;
	Mon, 20 May 2024 18:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NrXb87CX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3428410E04F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 18:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716230133; x=1747766133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qODsL4Z6FRktKqE1RmMisOovSxb24zEiPU22AUmntD8=;
 b=NrXb87CXJG/LjKuv22XifZFH49xXawhn4zZMPHzuSHCKId44wzDCJw2P
 PtlSoze7SyuU4rwMX0DOCDrPS6tySoNu4vuQCb/za4qfTrF6u1gvGuwYy
 1TCqhia1pXSI/wolxUKqMruWehFNgbCZxYnzsCKilk9rHPbbENpRx1fY/
 IMOQwla2aWKjoMqloBXkaNZMiMzw/TFWjzh7eKxcR9VYLDEXkIcClelNF
 sTN95W9FsavMART/oSTcMopZCzfzN5m5Oi5uAw0ewdevzUPpzneHI/gBX
 e1DFrPma+uYfx2aFwbq23UkrALv9k0fYliXs1VwxDjI4DBQD4vcyXqJsw w==;
X-CSE-ConnectionGUID: KpXM3Sl7T7qg2kDa0908gw==
X-CSE-MsgGUID: 7pRUNMg9SeqDrxeUpFLzHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16168269"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="16168269"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 11:35:33 -0700
X-CSE-ConnectionGUID: Apqy71IsSY2FdnolrihgLA==
X-CSE-MsgGUID: P4HetjB6S4S9379xLWRauQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="55860113"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 11:35:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 11:35:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 11:35:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 11:35:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8ZVCf211NIZ2x3qgGpV+5eo5J8hZRZBO7M7em46W8DLsIQFVhA3ckKrbbKNWvxtpY2YhZnzO0uNMF+9wYFKibCeeVrdk1xZXz9Mso40xCk3Sfx3d5f3iAR6iHc545PmxSfIxwtHFE8aewPRmNiHMcipUeW/YQitZLec4ATojtLxDF5XCq+JR8das1V6puIGB8ZtKiz0DcGTum1uJIOXI66qxES5DF4jBUQl7ZfX03cL3hJ1m5zxAmWu+HA8L+e+zb8hbDAHqq8X0f6PlpQXWNeMecpWuvFoGCUv2gH9NSWUXokKw/xUlVjKDxJoKL+6sa20qxdGc+bikOKVKVv4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNw0uyo1br4y9nvNerfOvTRlQ/fyb1ffVSGd4C8oH8k=;
 b=PMR7duqyQi5sufsww6DUIUaavyLWJy1dWvftYXcA41R+Pz5xN8kX62eTbLXJyUDZufflhm9UQhkDlsjCuHYTMH3cyd/I070oqdTytDQICvZBj1MY55WCN/NC1KYBUaU+0Dwk3fQwaquSkeP3rxXZTxuhiTNjGj/tQ5+TGbKt119B1GfjiaDrRNXXQa8j9VZVLHYxH2hAsE3COiyOSjU+PylEkB1WPmxV1qIxopJ2rPimNXCHCKksKD5w9buzn7yLwueyKbdBZzSC1CqtG9DLlsqSrRdvVVGkIE50ww0qT30JNJhvrifcY1+4vGniMaQug/aK0i8KiuaUVuxT4Nzd3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Mon, 20 May
 2024 18:35:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 18:35:30 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 3/5] tests/intel/xe_pm: Also disable display for
 mmap_system test
Date: Mon, 20 May 2024 14:35:17 -0400
Message-ID: <20240520183519.227167-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240520183519.227167-1-rodrigo.vivi@intel.com>
References: <20240520183519.227167-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 3734e454-3151-4a54-49ad-08dc78fba030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m2VEwpW4Bbm+gkqcGadFfqIXYzZaRMHd5y5pSPUWqG9YxynZsHEk6/EFl65A?=
 =?us-ascii?Q?gHNp2BtYeCyVVkYi9iRNeWzocEcTf3FreYxLbdQTwNBNZnHMPB9/ODDU5hBZ?=
 =?us-ascii?Q?L9QAFZpTyyGoWgV54hVwC1v7J9llgadlbl4bYtc5dji7fyr/zZS/XgeXRoe2?=
 =?us-ascii?Q?Vw1ntMUFNjZs4tcSyV0WqISIySY8xc4+oiqRViwYNX3OpqjTNOZTfhCAGIIh?=
 =?us-ascii?Q?7XKgEbGVXYWrP8jfYEy1fOW22YdFR0lsXk+tvL0XIAlTjzkh8JJYIrv9PJDP?=
 =?us-ascii?Q?UsFsVIH4OGhxuRRIIaZano4EMAZFqh7iWhVxwGIv+5L6NE4zzPyRrDfnwELc?=
 =?us-ascii?Q?kqjOQ9wielTjbFP5o4zR2LfLd0nmKDqowojFMonhscTdMF5jHT3WLB+IlqxR?=
 =?us-ascii?Q?LthpCV5d3h3efqn3zkyushkc7e5mkNCdWciYVTu+18z0ZTj08WCH3ovhoZCt?=
 =?us-ascii?Q?kKOBgcxI0UDu4sS9Mg23voUQ0ljo5n3Yp47DuGRY1DB91EvSIAtLi0o2NLKi?=
 =?us-ascii?Q?irP2kNYAtLNsFBNDUYgHleb32K4qfIxkBiCjAwr0d2rQfOvWP5rzughiqMJP?=
 =?us-ascii?Q?TIZb6T3Mbh2VGNqwoAqc8rfzyjvHGxlFCcGWvTf/YGlQwHj78zTvO4Qhd/nF?=
 =?us-ascii?Q?QQS3EXVw565SFMoJaxlBj6FtTGSlPOzqrKqKv+bw5l4W0W2upNwxPFHCWjaB?=
 =?us-ascii?Q?hIJ2KJ04FnyxefV0gMRtgsFVxJLAMVKaTJjweA2KQounwd82saRstafz8leJ?=
 =?us-ascii?Q?fL4dtxtpNyw4K15SkCNCae1sobUDNFjYYKg+6wwlQMXgmkBzYevwzv1e9jHu?=
 =?us-ascii?Q?UUjcN43dkYdXqkbHt9H8PBUa9e4nH1uTRK6LHGBNoG6+KMMQId6B8wdEdBPV?=
 =?us-ascii?Q?6yJ1yBqJ9gVkftWWj7yd5WEPmG015BnbJginBVXMN7+ZVohuY/0uAaPN+gwT?=
 =?us-ascii?Q?hVaVTaGNOVh7ey2uiKjoJqCcseW7uQTGNghrgukHW1CCz+7A7HqFWGodPFKJ?=
 =?us-ascii?Q?VePVOo+rNhB/rmz8GBWW0Agu+oDNypCTwsgx0SmnZfK/uml6SQ/95XH22iSL?=
 =?us-ascii?Q?Yh5qD05GtbH3A7pUa8Ob2F/D3dmTFN4+QrWHqPBuGutBdBFeOuKcXC/BHQy4?=
 =?us-ascii?Q?31o7KY1wgsPoiBPBeB9U5NPxJNBtxbo92d70xAsOuk/m0x+hxWz7pJTECTcK?=
 =?us-ascii?Q?tdGo+RIwSiilhL70UxrxaTvczt2GmltIaqgmKcYMU8JpKbMfj2opiJswdAPf?=
 =?us-ascii?Q?uC/VwdlSFnVaUoi5ATK04YSPjDzqJprZxXorEVlsOQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zd1TmxHbGmlWwJS7U3NnEPd0UxKQYBLfR9RZeXff7VI39cY0EizKISXQ7X8u?=
 =?us-ascii?Q?PCaITp5sBCfYsqKJDz4iORUa8YqvgM/pmqe6XaBoW9M9rWO85skRTzk4IFM/?=
 =?us-ascii?Q?TBLzXKW5D1kGgzMMBqR5+w1B47xi6Bm9OwkLU7LQwj2b0Gq43HNsDpUFHBZo?=
 =?us-ascii?Q?DSgElxemrkG0wKreQfJRg6RwM9gfC5mMcmjqHF8k7HoAixdrftc09WkQZt+v?=
 =?us-ascii?Q?ngRSybLFN1qY4z0nYRWwlCTr47DFzqgEJnwX4bPL2lnoP7YRTXV0f/+jqvqc?=
 =?us-ascii?Q?+q6UdTSM96seqPpExjdE5kx2xER7Pfz/jvYNayRud6lN301zm+ceOjuErmBq?=
 =?us-ascii?Q?PsI/nweFsgU4t4tphmNNHGIF4aYugYN52wSjfxVYSc745/Aft1AUT6hi5ia+?=
 =?us-ascii?Q?M8GkMTzl88Go881WxyDgVAS5T78o7JkJibS1UA1hPT+sFu+00jB7zg2uWxd5?=
 =?us-ascii?Q?cAoRqxyJO7diUG1qbBOwIyR7Ll24+Et6msKEuSnlncgOguKU5tN9DVnCiTVi?=
 =?us-ascii?Q?2nQyv3JrTsAujkC+84mDwgzXvYQRNeHxeqlnU9L/Dk8F/IiAG98FjXJmikm5?=
 =?us-ascii?Q?SIfhTs5XzNGHZaXmemO3PA4qni48OO4M+1eBg6OwxxMrDAKI5EFSzv9EhB25?=
 =?us-ascii?Q?+J346JsCE2BrM+sut27JHhBBzC+IbRgXYJOCrbRLtxBonrMftbyXJKO0LXNQ?=
 =?us-ascii?Q?FMZbzlWpiQIZhQB9JW+O5UKBbMWcZhaeC2J/eqZLUO8qz0dc1hpxKi8TMzTd?=
 =?us-ascii?Q?pvsIbXkOPNyxRDFB1/JN0sU7SCS+U1nkMiIKCM8l1/HTWDzbnLtIygnSKiD5?=
 =?us-ascii?Q?uzKTOp4He0XAN2/THsebeFDkB7zsIcAmjtxOXGtN2/ZraQYRtPV9O/+r7vSv?=
 =?us-ascii?Q?auaVIv1trnjK57eaCRWkfZ7vwn+juRfVcOzzxlGzNPswAsdo2taZoFEzd91+?=
 =?us-ascii?Q?QWvoZOuOmiHk2bz+1oWtcAV4PcznLNkNZ6fUiTb+J//ot28JmbPsvtzF5tAF?=
 =?us-ascii?Q?qKPp2xsRs5AAip6PxxvkXW7h/4bnsC1OyVoz97ONh1q8ZpZIzKemLnzpnbK2?=
 =?us-ascii?Q?QmVQCErSXCVwDhwPEL+HzI3BErq4Zzg612seDd9WqwQa8RXt9l0bcZB9zUpy?=
 =?us-ascii?Q?1VjiEm8cLMsZdoavgD+IyNm+JE6g67pujvNp/i9qkGMDmRlWTQ8qpj3CyPfL?=
 =?us-ascii?Q?mo03O0kOgna12vmh5tmlAIIHsUiCNQIu4Hz4XFVkj1gfO1VOSj6ULZXOTYWS?=
 =?us-ascii?Q?3SX8Al6QoLVTJmMDLUXCPkZuT+zyKLUDom3tvmvco5NABWh+GOVAP+iyYEtu?=
 =?us-ascii?Q?d3Xx69oq7h572rxvTcbpBMhTanD8pOjTg+50y+SU6zpGurmX8OG0/cYBaTtu?=
 =?us-ascii?Q?PZUoznGMdu0NcF59g7Qr0qGhxstEV2kj9lAclRg8wzlNVuia/3e1mQevxlcF?=
 =?us-ascii?Q?CdsvquiUzyN/l8hBeKEHro4bof1wqu3Bblc4e6uCU8KM8E+fzAhRY8XzxMZ7?=
 =?us-ascii?Q?6QBdOMCiwCt+XLfoAiLu3tHhJd4wHgxeWcHIBQWmO1m815Zej9WAChyxaRwt?=
 =?us-ascii?Q?O4500pJ+Yb3Di/DJDAPSJ7YUhP2ng7ZHz9Q305tQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3734e454-3151-4a54-49ad-08dc78fba030
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 18:35:30.1693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/wznRmL2z/ntrTl5QvBQ5N+msAuyAyngHm1ySdKJ8srb4lUsk29UKHT5ayynoxFjWemy8wCs26vF2vwRxucEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
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

If display is enabled, the always-on components will always
keeps runtime pm references, unless you put DPMS_OFF.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index b9968b439..7e1cf2dcc 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -791,7 +791,9 @@ igt_main
 		igt_describe("Validate mmap memory mappings with system region,"
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
+			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mmap(device, system_memory(device.fd_xe), 0);
+			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
 		igt_describe("Validate mmap memory mappings with vram region,"
-- 
2.44.0

