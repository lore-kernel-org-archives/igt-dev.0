Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B246BCD5BD1
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 10:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABBA10EF9E;
	Thu, 28 May 2026 10:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EzeoDxvG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4117110EF9D
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 10:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779963674; x=1811499674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ihfCXOPv96D5VUBsAsC3bAQ6ptj+fw9ubalcYqlUugQ=;
 b=EzeoDxvGGCaj72yTNqvrEs5KthmnHbPqOOUFHiniUeVL9AYqCypYoPmH
 CpEt2+n1ZdG6AgyEpw/IVxmhOYEmhHJWY/tFjww9+6n1rYRQf396z2cTg
 vomJOstOU9W6R8mgPiUxfFi65Sbh0aRO/VyY9lOl61qKVckkNqExChaNY
 ai8wMqCO4Wq1hB3Qkx0Fd6shcXYzA3J7tHjYGRmrdMI9+L51RJg5H3yas
 VsR528vT4ByiouiWg2lmFPxB4+iLGWi02Bsg7HRvRrI/lGubEpf3eCOts
 PTZeMhIqYLiBZoMX11iEZbHr/+Bw502LuVGn0he6uKuUAu2c5pAfdggwy g==;
X-CSE-ConnectionGUID: FSiSapsERwCKRLHks7uVIA==
X-CSE-MsgGUID: LqtNQf2zTD+AXB9BnSRNxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84430448"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="84430448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:21:13 -0700
X-CSE-ConnectionGUID: xoq2lHw6ScSo3/c0IXhpOw==
X-CSE-MsgGUID: mB95OL9dQp+Z06dzA2T/EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="236154770"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:21:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 03:21:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 03:21:12 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 03:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5EPr8hnUavpDahQYZkbnYagCtYxPSGR1TUw5MJuMNa3aqKPs/0ukVEzrcl/e81ZRAYtMpkzZzkncXnGrI4xwsYH5qna9Gj2Nf9H8nJ6OtL6T31gXzRHcVo69Np9UiKOjX2soJbVDjLaLI16OT7u9V+oTOv46Un8uomkn0cObJgc2NJFdYP5tjPwz2EvVY2X8v4nKdHH/zckN+48Ck6oNmKU4DyO7Z/A45wLgsnK53bANglvkV2/rmoIfoDfri3TL2iWW9Groj0Y5rqTlvnfOrIuTP7zT0eY/Pp6ATYCjcmF/ZfzfcSElz+DFEhnbWjI6jTRa3AD1AXH2uvUCTZfAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzEBKBPxwYnJQ7iTFWD4TenJlexnKTcZOHLIQ+9pslQ=;
 b=JXRq6DrG8dm55fxsDTkxRg/f4lBpJvnsl1oFnB9FXUpRyyGCYZr7Ip2PTPhNP6BJKDujf+SBIl2+6tekl5Xxq9PxjfL/r6swYO46Lw6bpkcK1iixDjtQjKcNZ+1MMnRJWFQFRq/uh0+QH0YOpUCtnazVG+uIQhHZgFsD4gNkmwk2y6OiVUuMZa+A6WzUMPedUKLIZco5gkF9p6Au6/XbIadXzmRVrTQKtOTblABmQRyKx4Hx5cdsAM+Wek5ec4dSkjU/LGpsbjMXoyL+4OTdpBbQZXCYl00M70m4NEn5Z2UKNNTYOYq18dxHHoHClpRYSOPhtu/8BgModmdUiC3rmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DSVPR11MB9719.namprd11.prod.outlook.com (2603:10b6:8:352::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 10:21:11 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0048.016; Thu, 28 May 2026
 10:21:10 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: [PATCH i-g-t v4 2/2] tools/igt_power: fix crash on Xe devices by
 initializing xe_device cache
Date: Thu, 28 May 2026 12:20:56 +0200
Message-ID: <2ac3eda9b4092f9ea06a245b25f0d6cfa2ec0dfd.1779793676.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ce36517d762c8e1f7e8988df446f12853f2fdda6.1779793676.git.sebastian.brzezinka@intel.com>
References: <ce36517d762c8e1f7e8988df446f12853f2fdda6.1779793676.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0019.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::19) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DSVPR11MB9719:EE_
X-MS-Office365-Filtering-Correlation-Id: c0693c77-c6a4-40dd-125a-08debca2d6c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: UfkABEmsWkDtR0bRX96+JM4SnqeyILm1fF+IgqVVpfZohq4i/Dne9PuBdRKNEjGWuMfIY+p+0F3QPIPyrSm8jRVkAJpcLSb5ZMqg9GhAVSqodTTJb/a/BuDMrC0V3PqccUoOaOxJsJJaqIqpI/W4s/y6qF2p80WmK9Hb16yaiz7Xw1/6xJ7PuR5bw9gVaHUo5gZ5n/XzEKGTsUo/vZA9gHG6vWrMys7otxClGn18Drip6iGyeFWHcSC8+Bo4JJFgBGeZzB/Q3DluPT35YfRu8ahNTU6jmgBGZUu29sG/LtDooByY46EXRV+kF08GNfqhKwMuuOm9mVkg+wU0HNY1O9xubb9lDoY7XtwGhZ48O86trh31h4gxMpSLRAGK4C1CA8HYB+413InEUxsBMvpNifUiGI9b7de6LZOdjpXosFbc9SgGENQPsZfCq0pjgSpVsZe0M09yzM19akzHrzpgdVt5t7qqLhGVbfNVfvVg19KrmM0MIRWq887RpNGnZEdwXmdM558MoAVfF2Tyojv2hX4xgmHy4cgNqHP/gXvYLdOqTCpAzgWlE+/6pYaWMz6Z8cmi0tP38/2S80o3PkrKF/JH/5aiumBdYFVnJghxzI3UOIP+7BrLvzUEQkmyKjw31PXeI1jhNjuRLFO0mKQuZ7jNJxdJeyrSJM8b55vmBcgCcWtdWQeDuxxcT1cF0Js2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ro7jTMh81+t51SgNJ4fXUV/zA8Y7cxw2SjkWR63LYP7LNDaNR2sVZd20HNVq?=
 =?us-ascii?Q?C6AdfeDydo+MakRaTLa0bS28hGZX7d/6yaHBxjzrZ9FbpyYkz7lyxB2utM6w?=
 =?us-ascii?Q?A9zEqxH7PhOtzOFxAg+QT0umPaCMAvFiFiP1t2w0doMrRpkteQquPJTQzGbC?=
 =?us-ascii?Q?jhPag3pTAoyHHQoGUznnHSYtvSbcN1VI9CpJ+7KWYpf1AL0KuP1QrqSPd4iM?=
 =?us-ascii?Q?KjHmI3Utakshw3n/Uriwp4fmMktTZ13CSdRxsDEg4/mznpgITiJ5xEN8f6y9?=
 =?us-ascii?Q?4A28tDTh/9zGLdVgo/ECsWCCy3IZeX972TdXXXk8mFovrPi2kpurYtpEfBmn?=
 =?us-ascii?Q?rpWyZJthf5iYrBF1z7CR01KOLaltGKTneG2I738zfS7+apbH0LFK2vlumgxX?=
 =?us-ascii?Q?PKpCJ//9ipZcFY8JG1FYaJZ6n3iycCQPoRmj2CWSYK0kZml375WXJMoK7ppr?=
 =?us-ascii?Q?ruOGVlBVlEFRBOJ/6RxqzEShY4C9JPKveEA7AtZm6eToFS4XhVT+4G5GcReP?=
 =?us-ascii?Q?+zuHM7nhraHk8YDjMwXS+atNyxjZhGXZeHJXbWNg5h8Ar3s7KR6NtUKrGXuz?=
 =?us-ascii?Q?BJR0eZG0WS5BFLLj2chWIDjG1yuqNltTALCMJm0hdhTJ0bTwqwF3Fshll3JW?=
 =?us-ascii?Q?exBWlg9qL1VWI9ObaYRt6ivuK7qmMJCvfw1XE/RrUymn1Ju80vuVK0dNZE98?=
 =?us-ascii?Q?3yNgUwwasnO5NR5n+zWeoB6qHDuS08rcBwnW6C2cKgGgey24/SsDmzUM+4J9?=
 =?us-ascii?Q?oeVHhcZcU7Y9sZV7XrODD9RqsP5N9RTDDVWWCCP8q5OlxWhNjpgB5vKo89ob?=
 =?us-ascii?Q?LayhAf6CQaYiNDtRIE2Edif6zsvhsBTwIJWl9AreweJ2kyFk/GlSPiZd7W7F?=
 =?us-ascii?Q?zI56jyIswVceDl7sV1XZ86sB0qWvAUCIiAG3hA+opwMcICCq57xBrvos70Qm?=
 =?us-ascii?Q?XTicPyOxD3KM7j5DEXUBAM4omWQFoLmps13j0bE8z0swIuWH1PZOK5mCqY24?=
 =?us-ascii?Q?hSCT2eva6uSUByszCgPumE/r1sGPPu9rOQwHN+qkCqFnE7x80kWPWrTGL9UT?=
 =?us-ascii?Q?OyV39w3/5cc1a49lc0kM8p3kYv8TPC8SOPea2G6lvD9Y088IUwqCASj43Vbn?=
 =?us-ascii?Q?OQ/uTh6KCS2UF1Sbcbaof0Mp6BkkhZhNtg5zN+CaO+YXihMx51C/HRwQMknv?=
 =?us-ascii?Q?NgBMPvw1AErX9WxQMzsOnItssEcRBzeorSi1Ou5JnazNx6YYKYdzrV2WQ8Z9?=
 =?us-ascii?Q?L63Qqa7ijF7vKKo2j071GxOgAM843jWVL/lIFy9pSZ3BV+SSjaNsAMuQBRqh?=
 =?us-ascii?Q?KVkLvCTmTwkYgX+ybpzrR4yTJq9OFbtHZlAK3S4jlFsHmT03qeOqHCbd9ElC?=
 =?us-ascii?Q?PyvEmc6XrpVDMclknVqr29jzqL5k/OUFJAM+tiB3DYxY0XkHiK91eUf2/t40?=
 =?us-ascii?Q?O66ziXCPN9TI34qV/tOX4gnqBhSzDb9voicr5ro/Iy7GZdo5jPDEIdLBrPve?=
 =?us-ascii?Q?2GDWgxXsbQo4/33eNagVDsYlPWSIM5oWIR7SM6wTjgUOCY0b4jhSadr+vY5T?=
 =?us-ascii?Q?cgMoIaUJOjzwfxsBlTL71IENugTulOy4/2DtTrlDiQxAsIXk2cVSuXjkUVW2?=
 =?us-ascii?Q?s2Rp7UmXDMEkAlGdKCji0wY8keqlnp6hH4f+LxvmNCrIQ6xBoO2dwbptRuEj?=
 =?us-ascii?Q?3WVrk2dKzGDi7+RlQtA12FLDi71W08RofZJFBnh4YqeCFWGogNz0MqS2JIEJ?=
 =?us-ascii?Q?13sqjmdYTyhEn/fsXlrVNV5tBbd6ADU=3D?=
X-Exchange-RoutingPolicyChecked: eEI5qgS24E84YPHgni5JRpbygGHG56LWsaK+35AN2/eXbOFpP17nyhumdL/HF4k5JFYdN2A4rAGq53DdYqgrAazO7RvvNCftFiPL7qCTQRxv2rTBTFSR7vHp3ckHYmWcl8+3U3re/d1KYwR9XwpGn9K8HpQCv9q2Xplfh+pSbn7Mydvda8FdTkrWL03b9N4/0cwdNb6PHhYL86TQgFQu4lw70wQs1UIrOndSmbHWQASJA1mwqp+4zfnmqfhF9eQTSv5/QwVbfytV+diEb1XAFLCqScLM/yxzEyoJcNBfg46DDN6Qsle+ru9AsHL/z35HcvpIFVyVMLNO47hEshYdqg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0693c77-c6a4-40dd-125a-08debca2d6c9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 10:21:10.9062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZTtixBJN5HkEhNvybzOJJrBmT6Eb8azvZIBJAmSXs25lQDONc4rocwr6sHSxNc866RAViMyjU1ntHDVMvsq2NVaTyiol1eL4BgUHgZ9z3o=
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
Message-ID: <20260528102056.EakvVw8TwtIj_d7eX71Ao1mMINeZsB7VlC6D1FbTGqo@z>

Opening a DRM device with plain open() does not initialize the Xe device
cache. When igt_power_open() calls is_intel_dgfx() -> xe_has_vram(),
it reaches find_in_cache() which asserts the cache entry exists, causing
a crash on Xe devices with: xe_query-CRITICAL: Failed assertion: xe_dev

Switch both open/close call sites to __drm_open_driver_path() and
__drm_close_driver() so that Xe cache setup and teardown are paired with
the fd lifecycle, keeping igt_power free of Xe-specific handling.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/igt_power.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/igt_power.c b/tools/igt_power.c
index 6dd180d34..97d95e7b4 100644
--- a/tools/igt_power.c
+++ b/tools/igt_power.c
@@ -38,7 +38,7 @@ static bool prepare(struct measurement *m)
 		int ret, fd = -1;
 
 		if (m->drm_device) {
-			fd = open(m->drm_device, O_RDONLY);
+			fd = __drm_open_driver_path(m->drm_device);
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

