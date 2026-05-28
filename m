Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1BBCD6E44
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 10:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE03C10EF9D;
	Thu, 28 May 2026 10:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nymqNasL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3AA10EF9D
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779963669; x=1811499669;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=6scP/Z3RWC5jzGi3EvmoHKSyePedpM5sRQbqQmMUkb4=;
 b=nymqNasLwFqlVzzezp5dZZPtlEf88TGvEwUVcuDVEQYPIontOmMNBA6H
 bXqWKLKHtwEb7q2XOft0t7Q3bALNT+F9fvjrE9h/ANZmDJEvuGxRGq8lI
 FxI13+nnpBMc5UWZxzB0V1+qH7+QoGAJB7kOv2a1V6unPQaY7+Xcv7x6Q
 uzCZWW/Q2ns6XtBuLYfj0onflJa2jyy0fQQqf/ubLV3uBU59nnYBaJ+Ow
 pFcEMPou/7qXE54IzgSdMgGFNJ5HLdWLyxtiDXLHTqL6wWtASbtT9nyaf
 kaaorl8LRob8cR0rVTK+UT0yEK9U65Bx/ieDE6pZWpwCwAaYgkjxTQrl1 g==;
X-CSE-ConnectionGUID: P1ygo+YtR4eDu9cnWD+GRw==
X-CSE-MsgGUID: fGIL17u9TPar93Eztit6sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79952386"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="79952386"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:21:09 -0700
X-CSE-ConnectionGUID: 4p3b4UzHQCK5xdIXzydVyA==
X-CSE-MsgGUID: YI0Ikw6PRGyGNWiMr4+4QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="247594613"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:21:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 03:21:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 03:21:08 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 03:21:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXmO0cNRbMGSKdDPwieJR22Xq9gqkgcyLbBQ8eNAzGb81FG7Po6QwmoLIpJHHVHc9ASFpSULke6hpwNH6WS4Zg7BAVLOJ522AEYJhgtS4aobVQ+Z/dNMwUgwIYTQb5dmjlkQFFaieXS3W+OGiFtNB2DjYSzEFt4EwbYneyR94prPVdeCMfHT0taMf4aWB4EVmgAP1z/W+zBxiW9NG+Jft+MwgK4P6Ud7x1xKi3MgH/QPYAdGFTbBMHpY1VYHdGGHxG/KtWPx9g4Hx6q+zZGDOaJTXIOV65uGrZxXvJ3xqIhScV2guLkJphZQ/aIcs09VfCUxSVghIK0DSv4bbDPKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRfKfeMtpaJXTo1etKWIcJHqWcKa59S+sRKbTt5msP8=;
 b=RM0xP3CGwW0rbe6SC7B5Rtgu8v03n/sfJO0hFjqvyEB4h9zMI9DqeqlPzwdPeCarcqQ8+eZ7GbwaJvg9a8pmFc1a/b2ixMePNhyPjmZZ4p7UaSntgX3r36VKj+dyKcRxkfE8ejsR7ev5LPmwqk7e9ALP26cbdOws0qcFrNGAFDltO9dKXubjxxs6AlhINE3QWE8v9+243mIPvYWDu4Qls6QMIkHbPIy34a8q/ZrtRU6bMwhcIdksVpMpgRQHVtArs9mbT6seOb8L8vy/AHldre4T5Ra5FjNCOj+LetDZs2MQOkLgymwjyCG2JF6dtRBZrBP8mmjvbeHMNF4Ia+qLyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DSVPR11MB9719.namprd11.prod.outlook.com (2603:10b6:8:352::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 10:21:07 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0048.016; Thu, 28 May 2026
 10:21:06 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: [PATCH i-g-t v4 0/2] tools/igt_power: fix Xe crash via drmtest path
 helpers
Date: Thu, 28 May 2026 12:20:54 +0200
Message-ID: <cover.1779793438.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0019.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::19) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DSVPR11MB9719:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a1de79-2a28-41b8-c04f-08debca2d450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: c1ZJcpJXoO2xaj39Finql0rar/Dw1gtHnFhXeKcA7iUPRBBi47LqefIrU/M6uHp7E+b63EU/GJQacnuH7uuuD3M+CKY/6s77RTwlVun9fOjk98C3vq7W0Z8edFsSIik4JxDgWN7oxM2iDjU8R0IJqrpT6qBlCCokGlqS0qpJbC6IM8Up5AMzBUeQdp+98afxtItsQvvdycRpg6yR33Kj44yoigoZgL3YH2ntU80q4sUvKKSHaANIc6nZv3MgN4O28SbOnCy/9wMD3E/p/g04S5jGnDFjGF8oFsLnw43U/xjtdGliirWgX7FxMsJpnzHKB938YigoJL4zBAIR0fkVNJ7k7A+ExvajNqmpVPjK9weF+BUdvOkw8keNA1HaAduTCIePFKopqEkgtDlh4Io987H/gPa8nIOlf26UlFMly+nsu4dPFCyRgFXVu8G0av8up/M2zSuWGxpxCelGJ5rVP/2mox7yyuZiJr5NUC0TBTceYZEO8HVXx7XhX5DiDJBGdeQYmG8i9JxGFCeyiic7K4r3d5IIWm0M7joZGx5n+khMadrpSfpMbKW+8Pj0s/qpM939ujpP8N5xBM0a+QhkyRT9QPLx/wqXlab9pTW5v6F6aMsLEo1aDL2Hd+KGM5svYYMOvUpqlfttTyKQdoC6EintM8A4fmfn90lvQbkioEwhoq0nuGvnvST/e+KSSIGG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VnD9lD3liAxCG1AqUMmq3QAd1ZD/jmMTxUe/z3i4SSwcbsTriJx34eqTDTOo?=
 =?us-ascii?Q?Rp8128F1f+I+s36MfaU/HfeBglB09Q7geSssu9jkIIXJojDvkb5NTJemOUM8?=
 =?us-ascii?Q?buRMN/ssZpCnKCwFd8u8hEBqVukqw8S9hj12pMftpZcR07qukqgbv19VjNRI?=
 =?us-ascii?Q?LWK/VzD/wcqYV9QU2hBSzuoG3reQmYgqstkir+IdAUPglc+pGQGvFoSKSx3M?=
 =?us-ascii?Q?kryupFJzEFrKYI7d/GFc6ZfQLeDhVK4NinK2RvO8F3WvHBCCe2WgHmiJn9DC?=
 =?us-ascii?Q?wiBbPFouOdk5e9X9dhFX5+4yNWK73jlsIRQ5zRhTiRr5HK7upJCvrZJVHru6?=
 =?us-ascii?Q?myT73pn+zJE70iDvB4JAvAcS++l4VmTr7Gfb04D5Onpvh6XvqUsFIb+650La?=
 =?us-ascii?Q?PZNhOc3XBRimBf9OXJkLUUYgU916FjrO6ffqi9NegXaCC9saQlZ7iAOcq5IV?=
 =?us-ascii?Q?ijuWvNrcVE9qvhlEQLaeQYf4lfFhAusTGqADW3UGBvy32SejoDVXmpSrTveb?=
 =?us-ascii?Q?Uz4oA7hRt+elC1l5wApr6uRn02ckHG6BH38IDArJFY3bF6sWhCSEwtpnWxX5?=
 =?us-ascii?Q?FLAYfvmDW2P02ld+G9cgKF1U4YH/ZWNe74XH8hK/snUe+NicHOtHCuVeXzZs?=
 =?us-ascii?Q?Uf3eVPdOCJ93bjgATjT01pgqhC6w/EusFw6Uqg7R+ZclIpaj9TJE5OsYZkpB?=
 =?us-ascii?Q?SiuXCFqJK+QCDD57ZQuKQB/BfRlVxz6tfY4+HAfcX46H8+PIqsNykCgsoILO?=
 =?us-ascii?Q?xt/M/utSwp84dplNXkXzeOMCAW9c2XQUlTCht9etRVur3CAcxHf4x+PpHumE?=
 =?us-ascii?Q?6+u67NNb/a71i92ra7DBDvY1BVuO0QgTX1CQ6tMwn5EkswMhNpEYzbFb0dnO?=
 =?us-ascii?Q?KKol2UdBWUdG//SV7+0lmhwwrrC4XUMlGemun3i1fr8ISXacz0lK+99biP5u?=
 =?us-ascii?Q?B6xCeFlCB3hKT5KdP+vxQhPgIfXecOLjmwXLj0tqcxCZBA7luRW5r/Ne/5Dr?=
 =?us-ascii?Q?Apvvye5ERFakZh7dJw3kitHhGgmF+lJ+qHqneyyXMDPW5EkXdoL0u5+k/7Z+?=
 =?us-ascii?Q?ajt8o5GmwtN5M5oeGbe4LFvmDMkFl9Ri5LEhp22GhNCkf8Zr0z8wd7UyEUtG?=
 =?us-ascii?Q?ZchSHMZgnwbtrt2i8drzMJ5fszbKehsN7TQK8nHGMfb/p4MEl2ZTAOTFsTNK?=
 =?us-ascii?Q?gd99Qo2Z5hNCk3A69Ea69+Zx+njm82fE4uHJ4vrJaIplyVn/xwJ6D7+XhzPR?=
 =?us-ascii?Q?LdX9gib75OilJXjxLEhzagcaQOeu/sEm6+mxRbUTFc7xRuIo2U6wne7C3bXS?=
 =?us-ascii?Q?/z3DzDE07EqtpExyZutjP7JQuOlH2K+8GWLjsPLIIxVa4n+VzeeoLWeQXj3q?=
 =?us-ascii?Q?kMbM0SZr+JJSUbNhnTZ/TMeMWI2v6ecU+BAVJbyMShYAXaMxg7DfljPUEvzU?=
 =?us-ascii?Q?sbuCSE7GOM8FvPUGiHZYC+uDCrW5YDTY1oK5j3tilhxX7PmL9choQFUgpOdw?=
 =?us-ascii?Q?/SxG+qgUluQYwWBpnGxa8lIwGg6wIKWkN2mGdGCvx5u+7K0hXysQ+QcJpjQD?=
 =?us-ascii?Q?e5mBpcDWYLMaQIptD9FleungmEm+QVPO+l1pExnCcoeprUtcioTuJl1GE0N3?=
 =?us-ascii?Q?ZGLaox+QLcVGUOjabeghMJdPtS+fkc0H0i/rET5ieWgdeIRtSROXVPp/oP7c?=
 =?us-ascii?Q?jA1jA73VK8RHx//zqIBjMcEpR3xBdkMPm9q59kt9FRkxE+KjWXvzkRqipho0?=
 =?us-ascii?Q?phZsYjOBud70gjZ3MAdC8iYIZo5Wk50=3D?=
X-Exchange-RoutingPolicyChecked: JI97spk1SKGZK4n26rjckrTR520UvGREOvXmE+QlzzXH9OxL4MnF/v1vxzITq6CrCmpFiHAHESxnHI5quYeahp0eDCEtmUKRYBaIsNr3z0w18cnveWg48YBkM7EBKHGO+bgYHpTSSdS8koRt8xx2YqZI3YeVF1JbKSNtHrE21UmFotJeaN0Ho2ST+qkdtRm3wMuI98gD3zQvOX4BCcwk3q1OKmvD7xdYLjNzg5V27T22rKdNGmKiYFF3jWSW/r3JhuRDvR7pQzffhM9YdmfNBojOUVEQgKyIIO1yMogNvtZ/20fuibeFBZLqYmk5YSNUY49wxM4lEYBoW/YhaSG7yw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a1de79-2a28-41b8-c04f-08debca2d450
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 10:21:06.8864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MArWxBR3E89i2EWM9GrxRIq7AYkN4UV5pYfqWsnYS8YaCSunGV06c4NVuRCucPnJGkz7Iiyil2N3kMqS4+OMEs3sSlELhGUCRGs11XBeNNY=
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
Message-ID: <20260528102054.CvucpeyiF0-WhTHaHjlz22L4X4PUN0evStvu1i7E6as@z>

igt_power opened its DRM device fd with a raw open() call, which skips
the Xe device cache initialisation performed by the drmtest open
helpers. This caused an assertion failure in xe_query the moment
igt_power_open() called into is_intel_dgfx() on a Xe device.

The fix is split into two patches. The first adds __drm_open_driver_path()
to lib/drmtest, a non-asserting helper that validates the fd is a real DRM
device (DRM_IOCTL_VERSION) before initialising the Xe cache. The second
switches igt_power to that helper and its matching __drm_close_driver(),
completely removing the direct Xe dependency from the tool.

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
  lib/drmtest: add __drm_open_driver_path()
  tools/igt_power: fix crash on Xe devices by initializing xe_device
    cache

 lib/drmtest.c     | 30 ++++++++++++++++++++++++++++++
 lib/drmtest.h     |  1 +
 tools/igt_power.c |  6 +++---
 3 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.53.0

