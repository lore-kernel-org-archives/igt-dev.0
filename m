Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D7ECA5FCB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 11:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932B510E029;
	Thu,  1 Oct 2026 11:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hFgcQ34B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9CB10E029
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 11:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790853275; x=1822389275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NZ+BoZ5f4UTQcfRzHXqYRj3NPnw4U1MlSro4wkNQZTg=;
 b=hFgcQ34BEJGOqebY0U2Qz8yuDlUQsYVdOTdPwyA8tCVX6ETRPuOhJKUx
 Lgc7EaiVNFhujq/XY0ZWPtC9zUFx4dLWaiXNBBWI5jgg8KVzzP8t3fiDP
 shqtMXaOybmr1Ra5ZTh3yF08YW0X1XjcPDFy5m38i211sfrJptDTdw8bh
 K0y9RAXKe/mwdqZS1MjgIQLdJUQql2PaBJAcXgv5VitGshNJo/9lVq3a7
 mmSKUaMp1JZO99R8WzCzvquvJqemtjawn38EB7C7tC72+IvTcQbOV5xbr
 DgOYjcAKMSKseGJ92rg1pzixtJW8Z0AjbIKpX4YThsdJrG9uwXnTTUYUU w==;
X-CSE-ConnectionGUID: nm2Vs3AvSUuesqBrvfJm6w==
X-CSE-MsgGUID: XIl3UjuhRgO3Tg/9iNuJuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="117136268"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="117136268"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:34 -0700
X-CSE-ConnectionGUID: jlAYZbYxQq65s6grCddAPw==
X-CSE-MsgGUID: yT9pqLZMRteTtGfhrNrVEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275508960"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:14:19 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2npbZjp3FCsmqLJZYeGCaLHYECuonhNT3LXcSt3eKsMN58WcZzYaIeQdeP3AFNQCBsDqdkFGFatCzAEJ7A1C8t2eoZgYUX3ELCshwl4VLCv7IYgXV7mgKjpaZxo0TVMp+vaCrb8yrWHdOLVlj4p+ojFs6Zfb+0AWzUVVB/eCwxx2LzqZInAAkYC3y2JJnWoVrODhJrrorRTxhZWPz8ji+Fd5borW/vZM9wBvjP7mqyXcURBgvyFgOMGGwmQou6znd3r1QPBLTcr2Bhizhg/rGNFMztasyHBnHa1v/KvFreb0/nNs/kKNhzdZvdNc+kJfh863pdxOGYCvKnQE6oCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMND5gp+ohVGacMws4o62sNd8WDx+0Cay2uPxnEN44A=;
 b=Ef6rfZfIzakEu2cNiCi8cc5k2swCwoTGvcw3WWepAK0WZA0Mtt7NXW3WknuYUxWO8L5cukAo5OTMW2bcziLIj0utemINYEEGPI+2k6AURMMBYrqTcTmaWzNngjlzTq1vRJpl/PmbewIciA4ZFLM28YORDeIPTWfWv0423pQNqqUvOTWM3YJMfG0mFAL5tyac9xEHIfzi92nFpCvy8oUzkwAVn9PMCLjtKY1NXUrtODhqCZSCq9i3lStUDLphhzSu98exnsnfFtVEO1g14IKA6b65P1QusgQmH6HK4Zbrlec2XzAUbZzW7s9jwNOBlh1L8f4pGmpUEhE+6kx0ghAzrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 11:14:16 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 11:14:16 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 6/8] tools/gputop/utils: guard ANSI macros against
 redefinition
Date: Thu, 1 Oct 2026 13:13:59 +0200
Message-ID: <deb6dda15b7ea969734adebfda5482716d994c61.1790853076.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790853076.git.sebastian.brzezinka@intel.com>
References: <cover.1790853076.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 762c9dfb-bfbd-481d-a39b-08df1fad2138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: e2f0CURkJPqOgHA1u/sV+7jYhuySjMGO5xhydU6vdJDTeIAHgJ+/b33lYM9wZAy6l+XlYBuQZkz1GSkooOVoA6gRfVhc+W0PaSeTorqp7Mn2X1KS/A8zUkC2GGbBE2hO71uXSTa3wgDE5yanHV40CUVF5BQJ8i4YDMuMgdjwDuoIClaZhMWzbqVBXxs08wkKFQwGZk3KGF5PgvJYnwuWBKy3w1zRIuT54pBq1yKnUFIqRtg7B4hs3Km7c/nouW9+tYRfFmrd9cxf7satstC94G4aa4K1UeOhW7WubLF0GY8EOTdBs5CsASRoewk9a1xj3WdXGjD1mGBKzDlCcqMcz9Gnrgqe/jT0P/QuNNkfSA03DfB+hzHYDFZmqypYJy8YPFm5crIfZTHH46KfENYDoMTXYfZpFSU2yHp7XHl7Bk7jsl4b3zeDbahwpwzRy+Ke5SWqYGAg7HKxgNj5kU6K/7Cr5adl/meENLvwealpel1LhoOJBhfAG3N2N7U8Ff0tZSMA/Ovr00dGC+3ou4pSoywKcEnpePRjLDoV0Mqt6lSuf798UCP9nj9xoJ+FNONlzCVwBxhCvn6dGG9wFxCyEKGUvANDi4jhIycbGzluWX5sOB040x4kcjuat5xVKHCUDM6Jr8UCW8AnpxnrnB21CXWvVQFYHv9xKQWci4izdEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kBERQBYZdt3f2lhgqswOqPr6t7qjUBZHVZVQdT4C4zF1ZxZ1yVewWU02DC4R?=
 =?us-ascii?Q?F994EgPjAddZCR8wM0DbYtDVz/aZoARgUz7hr7K2tB2W4NoKwdd8vD50yM21?=
 =?us-ascii?Q?OD4ae5ibN+pvvY695V8nRWa494pmS2ukKniF4QG4nzDwW9EwuIvrnXUSVOLf?=
 =?us-ascii?Q?vbi3GQ400VLCkl2tnX7mE8XyDnp65oyojFBrcdqJN30tneDGc9xQyos+6Ztt?=
 =?us-ascii?Q?PvSnUuFZk8g8unMSm2h5UZokCrkuJlAmRtpgb0CHlQufis+7R9DtxonLAAVJ?=
 =?us-ascii?Q?0FEgu+IkwmIrArR1+oYK91gX+9s+ZK07vmaOln1iViNWSU5Z/Ws6S3812rEi?=
 =?us-ascii?Q?GQJPnTaVHLTEUvt9YOxhV7B81VVVQp0ARxnmZYm7+3s2UEyvmbXO1CoSEUYU?=
 =?us-ascii?Q?P1u583KZyUYEJ19xfFbb4Rllu9HHIn2S3/AZyUIRI9AQqO/dMlcMo4lPC3Ir?=
 =?us-ascii?Q?jpu83svwBFX2Y2AWY+CT/KIUO+9Y7ZT2zbhmPcFveojuPkwfPe6Ph0kEk9bA?=
 =?us-ascii?Q?CmsFnMfYRtTaFKsX86rXOLZ8xZpJBNkAnHKQgdlustxF7USIrYo9BJHpHIsU?=
 =?us-ascii?Q?vG8D1GUS+HeMCCpRvc5gQY7sVgZRG0co8Svo/d6GcNQRY/Ix04laNb6XbrG/?=
 =?us-ascii?Q?uIK+9eYwuJim2nL2WusptrzvfXL7z876j5iV/XTwFkRNuBT2scmpUbH0NZn3?=
 =?us-ascii?Q?6ujsDr3Z9NAvlJeRuzYRhu+kny8Odoc2riNNswHwdHi8Bk63Vgav0WJmRX2/?=
 =?us-ascii?Q?PXoYDknbnCBge/uNoEn9yOFweLUBuobT8z+7RqIioG7S3qIyxM2+ChKtVgUz?=
 =?us-ascii?Q?FuznQiij9zTl7OsIG5+zgG+g+4NodV+CFZ8zayWyr8kJNwxzQCwNTee8qfYb?=
 =?us-ascii?Q?joPfNYLapkO4igVcdODozf2OAhM9yJWgu1aBX3XLRH3SnzpNPCXARIAgCFIO?=
 =?us-ascii?Q?b53vHibS7tnVtZ2tcG6wgPMx1WmDRFY59xxpQjMSXoEcBmNWHeq8A3Bvms6B?=
 =?us-ascii?Q?lcYmwtXb9ELPZIlyUfh4Led7sgDp9VI6GjqOCA60SNS5G/eWnSWTZ7aVih5E?=
 =?us-ascii?Q?/ShvFDPYdS4T5wjpNQNZjQywso1Oc9JWf6RFc7fDrQ+8YnF2HVZjxyhLQfk0?=
 =?us-ascii?Q?G+sEe2hd8FGVz/1YOnXJ/RMVQ4sU3MO6poUJXYvjMmX5YiktutaOG3BsXl79?=
 =?us-ascii?Q?cQrGULa3foQ+Gp2Fyu1VZkQa2cdIXMi4gstnKqkTUKc/d1gjeZAh//RaDefs?=
 =?us-ascii?Q?n436/lGdP2o8Ma3GxcXPtU1B7/zHsASgG4Hsiu9FT+jAmpGc0VlqfV/fGxZf?=
 =?us-ascii?Q?uFqCtiTWcHXEBOrtSmoRVCqlUVgp7xoNIjjpCmrptU9qHP37h3BakBIiUeUf?=
 =?us-ascii?Q?iIK+a+lTJMfORLobHL46FuaQZ64exMBlAiX2YjAY/ug8C7xetZ8XKOCVqqs6?=
 =?us-ascii?Q?gcQYJbwikU4DNdmKeRrZVdJuMp0ns/lqkU+t6y/w0zcYghmTjR34uw0+83Bb?=
 =?us-ascii?Q?qRwwtBvwFfYl1ScQPir/ITXKYNRsVIMwghqYsqXqBRmICJ9bYwhe3kGqstl1?=
 =?us-ascii?Q?WWH80RSdGN1//ev0ZOVb+fLUDm+tLcxOBHvSNhBLxKuioul85XE+2tTfjzuV?=
 =?us-ascii?Q?BUstPKIXkXOy5qQexcmZ2NxH5slA4GZhq2NfgdO7lkU5V+bQioz0OqbglMv7?=
 =?us-ascii?Q?R6u/lOn/cGyBN5av6ddOJdr/jgMEN7iRvq3+iXf0es1sMFUC3inJO/uQdHqf?=
 =?us-ascii?Q?I7eZE3/M8Kml7cDwtYRv1X5tHHEDPFk=3D?=
X-Exchange-RoutingPolicyChecked: yqqKX8v41JTbgAK7BP+9MGQPhCvvmSky/KTwkUj7hB6Z/mAPZtt4STiySTxhlS4IxGiN5Wq/eLaOBQaI9nUo56RDu0HkTopiyfgYIVyNgiR5AgDdTzNkfKdBL20ICnynTtH9YsRZlfJvmbv20Ua9QHhElyX9155RO0rRJKcuarwKLrZclbEvN6I966YriSBJLW5vEJKOigjPRzmAiXqmMCAS3r/J3ZnE8oA6eOmWcY/PzcdRZg2KyFAb0Eb8ChvRunSTijhA7Wu2BUjDsfSt63WBxLd9mjyo3zIYFjqgUVabMq4EvpCsuNSPdv884pkAhX2n9eoGjqRnFSU6ZJrlIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 762c9dfb-bfbd-481d-a39b-08df1fad2138
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 11:14:16.5468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7aG+hTdXY/x2NFljvNmBAy7n7yg1GnDHZ3jObbR5+5mIHV7U9ld+DB5cDPAqkqAkuf7d1eEFtiITNbmQ3p6CZLUPB7LcNVX1IOIZokYpqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
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

Wrap ANSI_HEADER and ANSI_RESET in #ifndef guards so that including
utils.h from a translation unit that already defines these macros
(e.g. gputop.c) does not trigger redefinition warnings.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/gputop/utils.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/gputop/utils.h b/tools/gputop/utils.h
index 00befed56..d319bff09 100644
--- a/tools/gputop/utils.h
+++ b/tools/gputop/utils.h
@@ -14,8 +14,12 @@
 
 #include "igt_device_scan.h"
 
+#ifndef ANSI_HEADER
 #define ANSI_HEADER "\033[7m"
+#endif
+#ifndef ANSI_RESET
 #define ANSI_RESET "\033[0m"
+#endif
 
 #define PERCLIENT_ENGINE_WIDTH 8
 
-- 
2.55.0

