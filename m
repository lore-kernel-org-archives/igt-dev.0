Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD1ACD6E4A
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 11:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB5610EFDF;
	Tue,  2 Jun 2026 11:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FZyB7hoM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F418510EFDD
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 11:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780401076; x=1811937076;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=FSnzzyI/wO1OpezTu6Ib+WI3AZoxwgzv9TgVK8YMuqc=;
 b=FZyB7hoM3P9IEwd45JE4W1Z5lHxoUY5cOKju7tcrDVJJsYpQKTk+2VGB
 XvKpGDKonjaKhABZPHgmILpkHYP6LR7ifAUKexi7iVVwBpobxI6FivYVm
 Nd2vg2C+DR0WKnfz5ALM7ubGGNzf6vqYm/JBeHdo+jolqqdSYJXTB5lrb
 styGxPWJdbKirMIdbDohCE0i+0MBz/iQj23+HOOdehUJdnRpHozLqwDmf
 bWaq9NP7G/sgI4opqhey6ITZIzIgW90L8nw3XglXEWDVSWKI7tQHA6aNC
 LRfesvXgLfHaRrk6/mWZsgu13GOTUr+Z7OA/DoO8yTlLKPBJEu6Yfx+jB g==;
X-CSE-ConnectionGUID: FefT2zizTPa/UWlcQ03P1g==
X-CSE-MsgGUID: k65fm9p2TtadTA7yqWqRUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="83766041"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="83766041"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 04:51:16 -0700
X-CSE-ConnectionGUID: oSCa3FH/SNCq/8Fnc4GIRQ==
X-CSE-MsgGUID: Y6vSm6jAQZWC+uxY/Xo/8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="267748221"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 04:51:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 04:51:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 04:51:08 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 04:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tY/MRvNUl9e9XOGN3Ab5v4lWmBQyeswsc/NhUKBhfNmQnN13mTvTJcz4ob90UrhkQd24xdm0MTV3stG/GoV0Xt0qDMUGvV9zQwQL+apaAoW7vlxxg21ZCFMtVC5mPSDg7FyVHTfKyk22mXISy9Z4L6Dv74s1sUvEQj0THMyNjHBhToAoWl3RdNcKp+rK2esK30lRQYG38IxhbpxtFB6ChXxYQU7GF/ndvn74zXp6RGz5i/L8xS3iDZjjcgsyVAnRToxEgE0QoYp4ayXd8PrPTXfxbzYMDIuHOv8kfXRk7VGpWp2mYR/GoxZbMwAMR2tk+mcx8Er0trExrbhp0w/5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yozIHgIrkpjzWWTNQ89o8W+6BWdiTMSAR33BHYAjr/E=;
 b=FMfsAovWjFX2t/PpGbEK4bgannOFybtGxSzt7f5hWQe6Algt613jHxTlhbSIyuU7ZsshNzuhHXoT4c8LxBhIbBABAm7SbGcukjblhfyHfGnPy2PhwD6iK9K5asM9ow0WKL0FXIDzs9tIVlrUHrpbt8VDz6jDJNguq5JL/Ytor8p+yqModfDCGylHNf1TuHrxtyLwmUk+Hc1Q8JcZZlTpOacbnsa1QbNYxbHZpmr6mhKctmKFQ9IvjOWe1HuxPs8pOADLchnPGhDOZpGP7K+CIndOvGwhG78DFEmrHuRAw4dIrX+oueH8/bX+BTh8zm0vs7rIQaB+Rt3IaFr2ou/UMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 by SN7PR11MB7666.namprd11.prod.outlook.com (2603:10b6:806:34b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 11:51:05 +0000
Received: from SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833]) by SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 11:51:05 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: [PATCH i-g-t v6 0/2] tools/igt_power: fix Xe crash via drmtest path
 helpers
Date: Tue, 2 Jun 2026 13:50:56 +0200
Message-ID: <cover.1780397630.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB8PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:10:120::36) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6897:EE_|SN7PR11MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: defbaf6d-46af-44b7-e31e-08dec09d3a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: vwBaRznIYEuR7j7bbxRR1p70M1a/u44gmP91/M+2rGyLxjVtdCYfQCl9xJymiREl4QbH1+cZJDF7JaZVe8ZKAPMRMCDZtZgmmoS/fpu7XJP6YpybV5/W2mR9BkEi7ttloyspDwtD2RGUhOmmzO5UXvg0lQJeRtGbK8004bJb3AE1XMwRs6V4/QYrlIvLQkU8aSKRGFTSKIBdf7QVLP2Pq4AAg+55dkqTkgb/1zcz2MNo3L41BBWrlay3XnSdklTacGMDgNWch4ma7JfH8K8pWnNydP4A81zl2NYmqyvFoPtCKw+T22mtZb8R3GUa3iFJ28sENAgeZfh+SqJJzZHBrgHq2fQesmmpnhnLLGlzaX0hwQ2ps8lb6REJU2wOwXtf1aQ+Tt8rAJhsMVWNNynvZaK2BC138SuM1zq3RRl27OHkaUNFIXaIYshGaA9wcRxMawUB1R4XiK9rjgf6t0Lgytx9jstUo5IkEnLaCYfqTJt5y3wNE3at+XrFwAOc6fthDKf3fdbd4DS5utYJFCs8jm4q0KQL3ATLnqCB/p3Z0jCtxwVe8oVCYi5vhg3cTPsfa03qO5HfEQqQCv636w2HxHGpT6fG3EbGBpkJKezoPMnSO8WjNNJJFyacM3KMr+Wksd9iLKbSLJrccJW1dNAMaKF24tKA2Yn0L0y41GzTT9cucUg2lejXSkSMqvFCdgTp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tGd6uTd1A1ecxpdZxSYf0xvj8fFgGNE4Apv89cfC+j4QYYalIw7hWwpQ0cuD?=
 =?us-ascii?Q?Dhj9grl+/be5gM4/929JwTNcL9xP/AII8AviNnn2xOb30lpyxuBCEt7kmZjV?=
 =?us-ascii?Q?eH74orMZQqePvjShVuJ01y6p84CMiD/weKZWnXFNjGpHNMUHlGpTsJoqJdrJ?=
 =?us-ascii?Q?qA4mA6gnTB21Kil1IEVGPVjZ0GwaM3CQeAC217fhX7RsHHZSlj7VTFoycpKP?=
 =?us-ascii?Q?xO9+1nLO9yIZwKFDCVGVfkMoC0q40jC6m0SG2ay6ikuQOtmAYBasn8L0uVc2?=
 =?us-ascii?Q?CLDWN9HVWcMjzRCSL8yj3nGuC5Nsk3BbI/AJeibKSsn/gWcdDN6jQSq5Yr7J?=
 =?us-ascii?Q?pjUy+c1I/sv3K0/vB/WypE7Rfzd8lFzg9zsWueNbBgYZHNZbuoYjHLxh0l8r?=
 =?us-ascii?Q?loTGmjy0PB2xD7CYTcFwyx5OPGnEnvs8gKF3yzdBFyuQZBDPkwMV/njAXYub?=
 =?us-ascii?Q?i92GaHe9yWgWNuklAchdZfiXA72jWnqz9nbrZycCZey9S2XqOFy1ItexH3ep?=
 =?us-ascii?Q?74k2OIN28ms5s/cR6ip/ZgSersboAE6MsqYgT+SmRIH0ZGJ1Bej37/6D3x/R?=
 =?us-ascii?Q?Pt+VFr/rXvLL7X2sk+EKqHxEA56r7JrBujj/utTcJtMN2Ypa3hM57CSZR6c2?=
 =?us-ascii?Q?BLQP+0QughlAPEAXfWN8YZsioqRyKrwTpirtwKEJxBPk7IDYuHgk0Aj9x1UR?=
 =?us-ascii?Q?ui9S/Q4RQnPyQ+GLSVVy68Oqdl37S8WWxjDMr6UTtpSFwF9UmkS1HC/QyRkx?=
 =?us-ascii?Q?KntBiF46Ed1AbQHdl5+5gnHFXbvhOJBE1ZhigXbqumuLnh4Urc2BWW4ieWq9?=
 =?us-ascii?Q?Bb+lRQ67jxmUPHf2tcEcoWlYIfpUtnsTiMqHrJyxg6d0pGkW6JR6mH9W0HIZ?=
 =?us-ascii?Q?i8JXwKRxSXD80I5NUYiAbHvAqEa/99Q5oQ/rkOQkbrwG2QwvFBU4EtlpPLk1?=
 =?us-ascii?Q?5rEwTDc4a9Se0Da6exIVZSmaRQdtyL40Kqh50GXWssqO98h59TpaiPdY4DmF?=
 =?us-ascii?Q?SZhHY7n+u+qMZlT38+bohKeEPUzG74KoxzomEIs5a3doFb9uTc5J1ir5KPFk?=
 =?us-ascii?Q?2SMwMyqZEgY5IeVJN3kXWxFA0h0aPUnEdECE4vByQifrPTecHi4+ssRNKLQF?=
 =?us-ascii?Q?uVqF7YEdQjEgGrng68YYL7e0pxCfVJFtsA1a3o/2jfBrZy+Ui6vDQ80Ojob0?=
 =?us-ascii?Q?tA/ZLtmYTeCQ1pqhnc4dvGNG1B0ZiQV+w/GWo1mqR+3/CdGYnZKNBQSyaKd2?=
 =?us-ascii?Q?8HnVT1PAmVt+rK0GON6x5OmNA5+eoaZdGLVa9jskx3zO0QX0wQnFDntPzC0H?=
 =?us-ascii?Q?QBlmT3nRwX1Lz1VswshuyHtNHLjpEnz5sr4JCM5GImGl8ahi/xbv95qRg/tn?=
 =?us-ascii?Q?DmoNmzkVLB8Y0xn1D+vWq7rhFDuHf9ji8bBwFneWgEq/aQaMvZiGx4WVKuaM?=
 =?us-ascii?Q?/2lqfxYU4NyA2o8nzTzeIE079Allxw2th881n4R+64vyyI6qvfCatS9LEbbF?=
 =?us-ascii?Q?F3N8XkWIkLwIGOrS13B1f60JgWuApO0KFSNbnHL7znboSMp+xDgkSuMNS9QE?=
 =?us-ascii?Q?INJE6Q0kAgens6I4wHy8yrFeWPLsLP+g3dV2r8l8lorXYWHF//mo6QyoUGer?=
 =?us-ascii?Q?c6fK+lZq35Dm0+C9fI5zrzky0u7oIT3kXdiheKsxn8J4ldFR52C7/7xBNjOc?=
 =?us-ascii?Q?9JZh1xuUIzLQTfiC3E9nVZi5Ft2YtMcZM+wDliX4lrfti/6RSrtJ5kk55bjh?=
 =?us-ascii?Q?tenLTiKYg+UAJDN8ve59yyjjQLp7R9M=3D?=
X-Exchange-RoutingPolicyChecked: JrAUcIhPd7JldRGXFiMLyZosXnpQvqeAwGDDJg+D6zaGALHiOqa5BW5PScNz+sd7JnqbMkVShBzedyhBbEbiL7SvyWqb3aX/GbK7pWvr6wLQFbUOaYyYtvOQiWEvzzJVd/qrt5cqFXRxj4OgRaTxoBhKmcmZuUznH9dc/Tk2fvXMfZpk0+gA6rY2/oQaFUy3+YoAdCEiAG/4+Q27QlsYKPvX2m2YlPuscJ1M/JN68qCqyE6wQ55hkWE7CbqU3JfacI32eKaytYtEZsPSiS5IvQtIJiz3+CcGdBp9JhsdHQL2RpxJ4E5qQJCmO7+VAw+SroCuo3BamWOoD/8T08X2Dg==
X-MS-Exchange-CrossTenant-Network-Message-Id: defbaf6d-46af-44b7-e31e-08dec09d3a0c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 11:51:05.3160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IO9XoiQErlvOZ3OGe0mi/g/AtRvspjoyYKn7B0MUgC58yh+ijMKG4yNGhdn2T/E+CjHtFAyz1GgapNh8mWgTNen6vUJ2g7sAY09yNi/vmw0=
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

v6:
- shorten commit message for drm_open_driver_path()
- update doc to mention DRM_IOCTL_VERSION check instead of xe_device cache
- split combined __get_drm_device_name()/name[0] condition into separate
  checks using goto err pattern

v5:
- rename __drm_open_driver_path() to drm_open_driver_path() since
  xe_device_get() internally uses igt_assert(), making the __ no-assert
  prefix semantically incorrect
- add name[0] != 0 check after __get_drm_device_name() to guard against
  an empty driver name being treated as a valid DRM device

v4:
- rename drm_open_driver_path to __drm_open_driver_path (no asserts/requires)
- add DRM_IOCTL_VERSION check to verify fd is a DRM device before proceeding
- split the single patch into two: lib helper addition and igt_power

v3:
- remove redundant if (fd >= 0) guards on both close call sites

v2:
- move Xe cache setup/teardown out of igt_power
- add drm_open_driver_path() and use __drm_close_driver()
- drop the direct xe/xe_query dependency from igt_power

Sebastian Brzezinka (2):
  lib/drmtest: add drm_open_driver_path()
  tools/igt_power: initialize xe_device cache

 lib/drmtest.c     | 35 +++++++++++++++++++++++++++++++++++
 lib/drmtest.h     |  1 +
 tools/igt_power.c |  6 +++---
 3 files changed, 39 insertions(+), 3 deletions(-)

-- 
2.53.0

