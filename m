Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8351CD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 12:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA9810E7A9;
	Mon,  1 Jun 2026 12:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzuXF1yr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D330910E7A9
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 12:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780318019; x=1811854019;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=iNTyBRfMUuO3p4fVuLS6hj/JymONo8a+qOjVASOwjZE=;
 b=VzuXF1yrB/EFOvKOSHeFUCQ4x3qhAUPrbHUoknG7cdf4xjfFOshL8BXE
 otV9UJOkhzj8STffKvX5PUMdIALT24UG16dLPksanzELQRDKF9d8ry1oM
 MmVFQMLXMaVveNSHHHOiwqOUx1/xgok7ysi0e/ErSb5k53HWVy+kGHbQE
 dTdDQ3oeSOJ+hCZBMSv1yycONfYJzF1SuBDyqvkbGYwUjrRVjHSlhQ7kq
 oTJnQHXAjhIlY7eAiK5urpRIE2Cn6BwTkM2Co8MjC2au3ZEyoY5laxtTw
 aXV+ZBsnz3AO//uw8dU8z0nZLrat3mCN+BYXqfoojMuBruSGqKFXR1sO8 Q==;
X-CSE-ConnectionGUID: mLYbN7Y0SdqIAYWIGOhV/Q==
X-CSE-MsgGUID: MGFFleXqQdmiCGLjJcJXaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="91384305"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="91384305"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 05:46:58 -0700
X-CSE-ConnectionGUID: c//hNDV9QNGrN4XMICoQGg==
X-CSE-MsgGUID: BjMfIxu5TVKcbxvcon3bAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="245394385"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 05:46:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 05:46:57 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 05:46:57 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.10)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 05:46:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPz5ivkpco92InsGwC9i0Ke/wf9vVu+Zz1Ooi/jK2eBj+xd4kIrg4A4sumdUEBz8+Qt5o+F+KhSRbfJtWbMsy/bovrljFbRauzMTXgztPD19rIvQkzwa+jk7L4gUAHvEt/nd0FjzarH4G7913ic9gKjoe7OCXU7NPcN/PqXkOwLtmfDni5kqe6+1b7V7JCme4FU0mLST1xysKfnlnbB7fMjSoCDhgyvgaFODtJw2vltdZIZ+pC1zE7VGbBdW9U2aop1a+xst53LwtVQI8nyZmLErEwlyyiRcw5UaezcOaKetgtu7dOVRI/n55iUTL+zSQ+Xd8CeAJhWLrPNBdIgi/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEDSiL2tz8b7oWygdJm1/K2jgGNA8Eqq2bFhNKYDBaA=;
 b=BMD16nT4UBZBFkE86K68xJqdJDbDsdp1aQKsihR8eN4vkEAhiUBXO9gXomI5isuHttCRP41W2s9gW/4UroSVGB5JqNI6g07AMA6BhgN+K5JDYNj8W9mOueBAdk5nQf1hV4Q5sGmA4L+yKJ/d+4nU35wM+GekvaOBCyTgFCyM2xcoZIPHdMkoAD+OHZzjC2DcZH4VPX3i4x9WPRu/DMjvZjnKl27SgxmFSFmtSkCmqNDy0GU4vBnhJW8jEeTGcgQ72pQMoGB1g7jZY7fX7aUBzY4V2ZujkkUM3OKmGcMhifdqFlEPBuep6LApKmBLadnIkoDwidioVJexKDp/Ple8LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 by PH7PR11MB5796.namprd11.prod.outlook.com (2603:10b6:510:13b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Mon, 1 Jun 2026
 12:46:52 +0000
Received: from SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833]) by SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 12:46:52 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: [PATCH i-g-t v5 0/2] tools/igt_power: fix Xe crash via drmtest path
 helpers
Date: Mon, 1 Jun 2026 14:46:18 +0200
Message-ID: <20260601124620.19636-1-sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::14) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6897:EE_|PH7PR11MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb00a50-5bae-4172-3b08-08debfdbdadd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: M90rGgyE3r8E5y5x0UaJIQu9bbO5O73w24uOn2rLd5PsxC+Xfyp5Wrpgvmlc7w3q2bpQBg6H66a1Y/2nAqk38MCL40SIpxuecxLGHqvZNDgnnWUPJi9goT9BHvMUYNmQAvrQwTVAlz8rUbaUqDlE7KS/VdJvROGdphf/Ybqe3pxeuBdY4skmQq+zwizeQkrt+y34VoA45ZOQ00qSlYFLvZ6xvPFtAISHnPg4rRfC2iTzvF5a5oIKZll45tBgkWQna/ftoTFE8MBMS4mBsFz4rqV29HbaE8mhuWwnxINe/c0sBRNEGVL7X7NV+71XMLRlu6Nc+YQyrEUQlKUgDqAqxfZuGu8vDjn/N9UIDWlDZy/4N4WMc39A3cAttsuYJsLtKqXASYNtcd0+88Gu0IsXwMjJcl/tTAtXhaXcxdRKiU5f4jJhfh5VuJHCAncSQMEOZX/wTHK+NL2r1Mn4myFGQLmalb+gZnY+JIMQSgVGR2S02aVxDLy/pWSxLJLWZAdu+HO2sun/m8wbxCTGTk51nqve4QVoK62StGlav6RkS4KCkXFOPVkDFLSE1eIMcFmdr7+BDURqEi0o4iVJk9W/VT9snP+KqSR5pYME3Yl8REZFTldJf9ByHGU8IDf3DBHH33aKBT8z8XooedPG9a/kiIMsxW8u2C/Lb1D/vPhAcodxUxsKKy38kov3EuVEPUNAwGYpUg8bUYiI6WegcmlL6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/2DArumI9AQky9SIjbei34yuoV+Utcy/VpMOtWWrtNFH6Qmy8CSJi120pFJC?=
 =?us-ascii?Q?4HabD21qpr9DcmMozNK07tvtOX7bb7wUBeMPFa5ifVtrHPsQ922hjx4PxQIp?=
 =?us-ascii?Q?AZ4jkqcdbZl9bv07hfNBHltX9QKawf5ZWOeR2TtWunk/tX26xOv1EZIehWPD?=
 =?us-ascii?Q?YxrNuuiJGybGi1BDBV5dkZM3KKR/z832siPZwHDa49kNYIoKnw0nL1qhlIqd?=
 =?us-ascii?Q?z5BYSk3xB9ligHt+5z6VWJbWhuDc40FHObuzL9G6RWs/RKLU18nl9m0TBdUS?=
 =?us-ascii?Q?AIGCNlymGqj7BOk5MdB/kosmGp288mmgOGANFmUaqf/7d6QhIYjkvqPp2jiw?=
 =?us-ascii?Q?CRyK0F2WJ4Vai0Zh0/bZcYInU/1yJxF89oT4kz0ztHn2Zvb2XoAJYYKL0NFt?=
 =?us-ascii?Q?PJUE6cRGlpj7FY7LKXcWdFjtkxxFbh1JSxOPvBu7hNNasVtRYxeJlzUoO/If?=
 =?us-ascii?Q?RTfhEApDNPU7j0QYpypKFe/ScdQElOBchHmrGgHTbMqaUqnAd2hb5SMlvN0U?=
 =?us-ascii?Q?mWU4EPl8SOVpnvtD+Mcbhoz5a7GFba5FPnZn7pr9+YLUK/arghS6ArXXRn4I?=
 =?us-ascii?Q?UDCJ3/XOFNhIuAAe2er+j2Orb2BWJiE3zlVJVizOCvO2SnDRNynmo4aglXZJ?=
 =?us-ascii?Q?+aiAf/nb/yDL57iwleCEq6miNfD47wrh6b4xokFkKlvSZpO7qNRSy4chb+vh?=
 =?us-ascii?Q?+R9hbxvSJUZkTF8gmxfQuHg3NljMIXKqVoPEN5ChGDE8eCIAoNxeVmzBcsAC?=
 =?us-ascii?Q?Cj8YQ2ELq1lwg9+ogQ6iFmBxTgH6cmz60gfklFp78zuEYboVPo9D9otJG7op?=
 =?us-ascii?Q?WPACs7PIXADfMumWP0UjhBZvE+VImBNyayAtMUdxRTnnvQqisGVUxKKsIom6?=
 =?us-ascii?Q?L4hSfCCSHAFUfr9Ho92fwFjFOHYBwGSmqgk3SKs1JELMV85HPkwO8FBult75?=
 =?us-ascii?Q?t40p4ovMWEf6KSOc8sfxrrb3F/MKZCPdfu56N2p6qJxmZr9v9EK+SsVA9fLL?=
 =?us-ascii?Q?3QjKdncAOrcLpzNeycPcIDXEqDroJJsr7KqBg3RyOQTYOghTbNtnCnkGQGlc?=
 =?us-ascii?Q?YbQs5US1lxefaeI40+aaHDU7HZPM2JL6G835G717O5DI40J6EdWJdNWpgIDf?=
 =?us-ascii?Q?y+XUKfd01J/2UHrtTCmjmTiD2Cefwi5qjyEAXTihY0SyYJtfRjcWamGabV9w?=
 =?us-ascii?Q?+IQdtk8OuhlkdI7VULTN10BRjHjulmLWfqPV7pDnpyUQNHfrJ3DQf7wh+isI?=
 =?us-ascii?Q?bx04uRP2NCzU3TDLOgKt+5vbcI4xWOZixkjoMwbdGqm/Cw8u8hMCO4D/cLn1?=
 =?us-ascii?Q?V8wyWAy/m+g0k2xxbjSQ9XXnOnuDipAfjH0EO3VmpgvF+vrcg7gFMh2cc+/Z?=
 =?us-ascii?Q?PuDiSGMYTeDh8j0a1jFGYCkbxOFmKuFXwAFYTAkUNIyUQumCeWDWewjLlvgU?=
 =?us-ascii?Q?hPgWd9z2dR1NC3ykNTnQhN20V2u9ufRzMdJC0nEiV1C+G7QATdzsu1M7qUW7?=
 =?us-ascii?Q?wNP2A0lkOYEUoyg/hZAT5WHSLOmk6lEB26L3O1emobyFcTPqCiVWxlvQVCaF?=
 =?us-ascii?Q?DWPBGmEMre0xWNdf+6aUMI3/+/lgsb4q0HgIf31QXIXyc2ak4Qtgc3ylD5Zu?=
 =?us-ascii?Q?lhCopiptzVdf6gF0RqkeDOqoAt0ZtAaEebuDy4ErYRzRFPY09DY96cxUvW2h?=
 =?us-ascii?Q?Q/FgsQGZwoRvCnoYuBVUAudeW4qCL8p473zafzsCxPgZJz1H+TsBfkG8j1yS?=
 =?us-ascii?Q?tQVPThBWr46nCILkZ1/TjaJ57wveQq0=3D?=
X-Exchange-RoutingPolicyChecked: lDdHAn8XeYKdE9GottKrcNwSDv9sl0wVv6mKab/c/Sumw1l93XpEQr/a1vIU8y9tHGws86JBMlM6fzQ9OtME62VAQ5P32HjMO0oFcY1XydWtBsa1iNPXaqPqgIMJokMZzsPTpo1jUfobIYTfxJEuZbyuBYC50YOCWiK3/uVOos2J+Cu27P0LvsWYHP9NT3WETRweVLlBclAMk3i1HJ/LKzrnokvalp2+Aq+2sFKYqKyjUQ4iv61SrE6CufqtD1RgWwOnH6Jbjmv91Oj1KSUiBVa3xuJGKpO/gQWDsYXaT5sQdbSXsMwvXRhzEzgv1MFXQyxrudK74yh+gWfgGHUZrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb00a50-5bae-4172-3b08-08debfdbdadd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 12:46:52.6628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsKuAMmLr4CCjBBMgLUQgP4+VEkZbJagJRmr2Hdb1vhOrl10egQNo+e1PvFv4BtncQLok5Z4zAPPtPm+1siLy7bBwRlPgJIdzsEO2sNDGjY=
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

 lib/drmtest.c     | 30 ++++++++++++++++++++++++++++++
 lib/drmtest.h     |  1 +
 tools/igt_power.c |  6 +++---
 3 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.53.0

