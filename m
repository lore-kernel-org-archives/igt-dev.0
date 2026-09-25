Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4D5C98321
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 10:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3344510F9EB;
	Fri, 25 Sep 2026 10:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPVBiBYc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0142610F9EB
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 10:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790333881; x=1821869881;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=kHGQ63VFXNZX/p30X2TXSKYtuUbgKkCpFRh6tjvsIgo=;
 b=GPVBiBYcbAOqOY5cDDwnDIBSoPHM6qU+V9/8f3wrj9am+fDxfnq4WsJt
 LTfEpwrjzuXdtGfC3FBFELqh8+UbObefphrQM9nYp/P67POeIdXZwvZMR
 ZrwER4fQ4Q0Xj3+CE4KHYssaHHRzWBtl1JiGnwDaFqUdF+it752fRtbvF
 3RzoJ1fHeN5aKHgifVJir5pCeOk//AbygRP27QidWfPqewzYL3Jc1SYBk
 exACUIKPzxpKuM2zjzenUKPsHpx439Brf9RJHY5lRVHH5n+sTQH/qNIor
 7EmkMlRnd9lvYGdmvVQqgCE/xH1SDzbEW3tuURCFvNnshdff7sbJDTFf3 A==;
X-CSE-ConnectionGUID: efHanCGLTUe/6cDD6zdQfg==
X-CSE-MsgGUID: gZKWqjVARxGaJ5wCGJH3Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94935927"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="94935927"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:01 -0700
X-CSE-ConnectionGUID: bPd8GzZCSXCNbsw72nZ0Hw==
X-CSE-MsgGUID: jblZNdCBRliLyTnEtXgtDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="312230366"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 03:58:00 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfyipYJ/B920fMs/aOeMYwIvVVCs/eah/N8r+4WksaLMA2JqUStLQuMW76xovbaTUAYMgKH0ezThBXTuMuw0IOiXL2ckRYcM4sEi3UH5PMQKVYNmfBJz648HWDG6r0Y5CLF+TpUs7kxgTN6AWz9xtTh5OjSPkJh1IAYzbGuya8ZXJWiiQkiYEK6cWbbaPcLjEH/73tCkrK/vFKX9UCYSpovkQ0sD0dvLzsbmp1oHQLAkvFTsUoPec/Gkn/PwTgnqUXT5yMjvhVhdHOmQQQhj9gAaJ9y6u1S/vDuBrenZEgJT84fJkFwHk13b3jJe64HYbKRfMDIIBJ+8HRRCzkntxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkgzB9NBUZru/FuBlXwZnFV4Z8kVFJmTMfvk0VKk3bU=;
 b=NV6SZd55anVi8cTOmSTv8Jn+h0MvrQA83qZI9ajX9haOW54GOOG4YffpBhIDR+QztvE5QwmdjouwPb69A/UTUC6Bpw+0PmBJhGumVFsyqOFRUjg77oMMjbtsNSDE8h/F6PJcDK3FMFOAKfxXHkDwW4jP6FZvqlugyTtPSvbtju6dAu4EpgjFGoILJcVGH/4tAjcceWvcMjQIlyXIC+89zOe0QWw7Q/MC0+Th/E3o5/e0qW3/w6xAIbQ5RaO3yNvkAcobJsYpvoVGhzZUjOtSE1RW7QjYvaypYG1csDw7hunpytKzIKJeIu6MjV9qnvHfaRlx76Q1QIrgiHje2J+J3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 10:57:55 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 10:57:54 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 0/8] tools/gputop: add i915 PMU engine monitoring
Date: Fri, 25 Sep 2026 12:57:40 +0200
Message-ID: <cover.1790331690.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e93791-a064-45bc-72b1-08df1af3d9ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: N9Fy26xjV1VxCrnvVjQaEg9u3l/bJnkWSMJuDRW/aB6WIRJ+zxkJpsSYZKoVHU5pdqRo/FRHDsolpRtE1Xnt/zKaHOPkSMGHwXpQlssqST1n/NUl9ztRhJg2Ddtk00+1ukzV+4unAvygmpUSn1jZgtsz0xFpiE1ONS9GgggdP4Juma6GbkF2Er20zZATg5l9wtT+/5T16LieIluoMcJrStOlHmkX5KszZvDA+xlXS4BTkmbhfVXwN4dtOHak9Hq+1b0uT6wFGINxEzzsbCQjG6baJesDs2nMu8JRflcgpsPeK4vttsRzcLY4tANIySC220XDNrzNI9MsS0ixkn/E7N2lA01x+R7/u2xbhJf44/FtWko9hP1hwSprPRpEfDBpbQIG/G2rOSo9snVAKrK8iUdzOlj4Chcre9aPlL6YcFWoY1FBGD7TLOXezw/lKKRvlZSz2HmolTavKjpRj8cF1mFLnboTPV/xhU6FCaOkDzPJdvbtOmYApHGrGsde5TrPZZhChsZfsqJNulpf7XVDUmazIyeHAY4tMdCQAgA950oH6PMEVI4NHfEx32puBcUgYnuk5MR9P7z2aek0t52tQvHG4EFM8fwBaymQkHC1fuyh9aiUJUbs7/Uv0Pyo4uWCpWwuAKQN2y4ydOxf+f0Fo15DpQjC1JKqHCaSAqqGdvg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y1f3IK/GyzDagAgOxGWCVOgMPmoHaUPLBn/LNDHfbZ9ozIYsxOMwChU7ldIq?=
 =?us-ascii?Q?ssoLuIatdPCf3EbW0kVIUDUiVU8X5n0ebeBdbBnp72Z2j+E8VkqPXjundvkd?=
 =?us-ascii?Q?FrJjNb5c1lESmFN87fycCfc7VIdQqWQlj9cHu1vZiqu2ug3WRYrZlNGyebiT?=
 =?us-ascii?Q?ZjXSzrwyJYXpLiJEoJtJz1HTEtQCeybbktGnLgSvODrDkxEY3LRBT9yBUw9N?=
 =?us-ascii?Q?M76mekPlA5Yqbx690fEzr9DbmlSnFm21pxJmGqWKJYKrqYqzpFsb5am27fqM?=
 =?us-ascii?Q?smb0a92kb3k/RZj66s7nSlyjZygRDv4YZe7rQdU6Zqaey6KqiVUCBsE6SfKx?=
 =?us-ascii?Q?bXXbtxseWvDjBk7kfnI0onP5Dbe+MwMSHiTUJR1TJYNXGgZMlbyRXdA5k6Qy?=
 =?us-ascii?Q?YEdXtPffK+nJykhCs13xVmXmTDFUuydM3kUffF5Y0R4beU2+GOGRq8k1g8Dt?=
 =?us-ascii?Q?ykD9NX/0PteL2Or+AsTTTVtgvxQIXZN2RG793Ug1oO285AQl36gjsvBaxXCI?=
 =?us-ascii?Q?SyPYPs1gI1X4HDXUuUvaAluGcc9w6vSqxvdl51qbie3uR3NVsFAOVSdqKeuN?=
 =?us-ascii?Q?0RuzX3ck46BnMXKN2Gj9TcXZCOOnfbnKF7+2co0SKCkeVzV3Dr+hfrfEDFki?=
 =?us-ascii?Q?eYDOsiaaO6AQSaMXTucmkQTA+weQXof21kLzdBOBospRZv6EAyNgjS7zw3Ut?=
 =?us-ascii?Q?SkZq4t1m0289btWPv3TPjBX5ZsMKF6fKQ07gUaCFHoI1WddxUZqnKfgflWDI?=
 =?us-ascii?Q?1HAm9FQazIXoDXAvgrPWAALaFU+xuCjQUrRVAHHEiL2HHsxtZxApAS+jaBKa?=
 =?us-ascii?Q?ehCiTzsFcOqV953/CaUMJmXg7r+Nq1c8IZ4QDYkNuliHukISdhBdPXZjSIe5?=
 =?us-ascii?Q?+9XwqaVDLgxXI7LuqXTtW1C8TZvu47C7RDzlSvzVlQrftv9wS+t/xH2eSFhd?=
 =?us-ascii?Q?tF0ZbYcP3MvqO57EVy6FvOsdUbcwBmfjmBZijNvxha+SR9VZDC3lkgP6Cd0v?=
 =?us-ascii?Q?gEXUSzrKsWwEwkE6nGfAmybAJIyWNKivRkG+Mo1Uy6qhno0+O+u08IpZG1EQ?=
 =?us-ascii?Q?QbTE5SYyFckSAhE4TxrnAtboT8N+JAy1iRtdw9j5qz9oSXf2eKC6iArTOWeQ?=
 =?us-ascii?Q?vguBjT/eh+GVXGoEtVpnvLC66b5XfTcNUSAcVKE5n3FXkI5Kg3yyyp8NSvid?=
 =?us-ascii?Q?oeMC9rH/HrCm5EYERzR8xhxFbTDMpkAKkOhRP+JeL02vpd9b9gblkufnWVjD?=
 =?us-ascii?Q?7LRORUhW/OjuxCoTzxu69xk5/E7jZb+04NRbaZFrmqZd4f6EDqgoSfk9PInG?=
 =?us-ascii?Q?CwLGn0InSbvFs9lBlqOvsbeuHtfYYD9H4t9yi6IBa0drM48N8NC029+8uHf/?=
 =?us-ascii?Q?TtOT/VSsDWW8srfOPojMQ3z+KhsWf/5QmBbiKJ64lYBJGbGU5mx+GOXKJYCc?=
 =?us-ascii?Q?kv5Yj7bdYA3bngqV3yLDFjB2ibHnRR1hTYcnQSeQcGVwurEatLJxRA7B8iBs?=
 =?us-ascii?Q?UT/64Xu1PMHnzwSoxCRDUoxYNuEhrfAf+/TL39tT13XYrzVoQG0SMIiDVLbC?=
 =?us-ascii?Q?+cTnB6frhOvchLFJlmiiexG4FKzU8vxYypBBJ7MqZxYeCddu2qHocL+PQBZX?=
 =?us-ascii?Q?43r91q6Opp2RY0+GIWR5c/ztwoc4U9FA5tJAR+MNcrqLIcTmezTR4DyopSEK?=
 =?us-ascii?Q?h2svJr7MwiTFKwfOt7h4a/OmWysNMz6tOx7SWXLc6YL9S2nnhejy/aUcqBH6?=
 =?us-ascii?Q?F+CiUrzkYMc1a9+HmGAJXFlyKXuNdT4=3D?=
X-Exchange-RoutingPolicyChecked: IEiCVdzWR4n6DPjsYXCqZ/hLSzURK4/NOEi3z1rYSINvw5AEZQSmouNtq9sYD1rpSSVN0NysRF5ZWzQkO00jZ1BKyXRo1OvlDiPvKW7Xgy817swkaf5hJmdjzIqdH2brwN+7VPVhgOLHeXddHU5co/me0tEtzlqRm3+I6xC6TojuJt+uvGJbypIcGimxSl+k0l0j5Zw+/RonCexr69PB7/Y2rZL+l1LnVxuh/XA11jNMSOBXqPu/jU8CEfQRST2NYTyMxzn2eV11oFHU1YwCQQhn6sSxExLbJB3WWy+v0JxAoL/FXMG5r7EAZErXDdw9hPxfNaFSr0Qy3p+FPdHCVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e93791-a064-45bc-72b1-08df1af3d9ca
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 10:57:54.6360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMDwjFLII6eHPY/bdfO+I/5HHzR064f2G2aUtgLANYWMJdiBk4a3hmuXG0WszWalMJYS+OBQwRc6GR4LYxHFCbQjb99O8YvGZnGJAaAoJVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
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

This series adds a PMU based backend for i915 devices in gputop, alongside
the existing Xe backend, and fixes a few bugs found in the Xe backend
along the way.

Sebastian Brzezinka (8):
  tools/gputop/xe_gputop: fix struct layout and PMU read
  tools/gputop/xe_gputop: fix CLAMP() usage
  tools/gputop/xe_gputop: fix return logic, cleanup and div by zero bugs
  tools/gputop/i915_gputop: add i915 PMU engine monitoring
  tools/meson: build gputop PMU backends as part of gputop
  tools/gputop/utils: guard ANSI macros against redefinition
  tools/gputop: integrate i915 and xe PMU engine monitoring
  tests/tools_test: add gputop PMU engine monitoring subtests

 tests/tools_test.c         |  78 ++++++
 tools/gputop.c             | 218 ++++++++++++-----
 tools/gputop/i915_gputop.c | 473 +++++++++++++++++++++++++++++++++++++
 tools/gputop/i915_gputop.h |  56 +++++
 tools/gputop/utils.h       |   4 +
 tools/gputop/xe_gputop.c   |  49 +++-
 tools/gputop/xe_gputop.h   |   2 +-
 tools/meson.build          |  11 +-
 8 files changed, 818 insertions(+), 73 deletions(-)
 create mode 100644 tools/gputop/i915_gputop.c
 create mode 100644 tools/gputop/i915_gputop.h

-- 
2.55.0

