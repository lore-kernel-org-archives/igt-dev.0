Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10571E9D3E2
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 14:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BFE10E668;
	Wed,  4 Feb 2026 14:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ys38HasO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5404010E66B
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 14:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770214601; x=1801750601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Y+4ebcb/3CzuPOImsoj9V1VvWMceaKNADJ5VxmRw5sE=;
 b=Ys38HasOGyi2usQVlu+4kfmYbpmmXpKNJxJiH6bz2eo2lH9NpDVDCCx3
 amnZ8DBsDqocdUf2SEjwJjiwNaNmFJLlGQg52nYK7+m2Ve4u6K/Y89YyW
 OgzQb/jJqhWLog3gwFdC7ee94XmkRtCY5m+wiG09VmV2LjFL4g770PBa6
 dijN3imETciHmoa7ssNwJtSUy3JF4ZvHHMHNVdW60DWA3wbU1MKXo8Uz1
 hkmzLHXLhE4nBjaPxtCfE9eKwiNyP4sLxD7JmXwWXeNcfHNe70jWfTEK4
 rxVshD4+k88luAmmWfKv1NgmZy1xuhjHYM9MrFTe41g3kdthBSn56lcdK A==;
X-CSE-ConnectionGUID: szuxlexUSlClucur1tt2kw==
X-CSE-MsgGUID: RAhxoLBAQ/eMi8rHbDz7LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82835265"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="82835265"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:16:41 -0800
X-CSE-ConnectionGUID: /uPKX3CUT1iZNgopYPDBpQ==
X-CSE-MsgGUID: 3p7v3fqVScSreZY9C9a+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="214668681"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:16:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:16:39 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 06:16:39 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:16:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emj9i27UVQXfQncuenqhI0PA+Fj1paSUgEiQTZBmWxriYQnr77b2RAekPKSecYH3w7M21UZak+VQQ/pzCcX5Og404Var6a6lAnqLRkVMvTdRBnuwczzUfY1yyv8tr56bT3j3kmMUIGNJNphj5bN10lPB+0ZZPxp/TfGe3xw2UAS8hb0Xh3MwGa+r9KqzM+qCYpt32x7g/WyT6Qmjdi0ZCxA1RSG0J+jqIYX9T+gUYSMHw4xQXLyffY53O4AjiEe3m8h6L+dsxwXIi3dDcSXF4wpqd2xmmIkEK+eA4VyqVoYKbAlwrOQwhCoZgEKzCOX/jw/Od0rVZOvj1DV4Y1faZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLb6RJ4r0o81H4meeXpid/01n92c3lGXSKxG/mcU3zA=;
 b=IKflsOR/Lkfs0SWipzXtHmXQZlg5IAfgBgV3dCsXZnVyS/6KKaJIJrF8YB8NUfrj3r6thlmoOrxKDHRkFufjfwjursnQLgrpudLdiHGKCQGs9sNbr42hUdPngqREUqRoglAdTIMyN6lQOHP37zuIognYCzweKqTljp5UfSjPj+N4QFtekhULqFQTesSQkjcNtB4oPNhh0HHtDHn8kFqw9QaE5dqSnPszIPPBXY5Lys5niM/F50u0+fjgDZFcNYpmNEBgVOvShsUGf5PyJVGmfSaVG2Z+GmTcf92b10/dMGTYlTxy9d5GQUh48ai0cfJN53cqjzSKK+oVXD9Tpk78tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 14:16:35 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%3]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 14:16:35 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: [PATCH i-g-t 6/6] lib/meson: build core sources as per-file static
 libs with minimal deps
Date: Wed, 4 Feb 2026 15:16:08 +0100
Message-ID: <2a664fce3abf544c00e9ae12eaee1ab81215b36d.1770212190.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770212190.git.sebastian.brzezinka@intel.com>
References: <cover.1770212190.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f56ef4-e01e-4eb3-95ea-08de63f800c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wGjMMx106AuyOH0GuPQdOYvM8LC+AdoXlt35WHYVmtwKaAYgradYpFDnpjb6?=
 =?us-ascii?Q?0pKOd4XohS106EDy6pPkzH8gUcOTe0du8dA4YgFMxAxzs2jVvkgA7jyzEEwr?=
 =?us-ascii?Q?jOKYRgDvBf34ydH7kWIdg8Rn2zLfJ4g9Z9Z5j5X2Te9LCKChuppBK2jjzJV1?=
 =?us-ascii?Q?MMf7VrBl15nnhRGIxzXW4NPDU7CO+rcWZtQs/5lY1pkmzblfj/Kvp/zQ8mi0?=
 =?us-ascii?Q?7VrMEuitdPS9PzGcwkt+aJ7Xmbq78XoQqSK07ulFRZstLhEHCY+g+2/WjzXO?=
 =?us-ascii?Q?ZJFSQ3xXH9EpX2HmF+F/BGuspFIsdHbo7VD8bUdyTkXxX8SY61SVyG0kJd0k?=
 =?us-ascii?Q?zyOqnek3imHzy8orPcRjmt5PMzUq4zNABbSaHqM0PPCbRhonbysjedjzq02t?=
 =?us-ascii?Q?Ri+EyJzCZ3nupvI6R3/sgT/AtDggMjHt6Jo7J/GON8qy5LQjOTELOIrDlndJ?=
 =?us-ascii?Q?Jjz6J0gd/tEAjRnyZ8dZZQ5Lpasa+jtD7WNuWX5YV2OywJJpIHilL0PhRTtt?=
 =?us-ascii?Q?yUyqPAa7Iqrwfbn0Zq6e6tNY0gIW/yBVrGW0O6myv1mCLeAac42Z0JYIJCaE?=
 =?us-ascii?Q?R1F9F/20jRZ6U/gxuyyZ2yLEVAR8z+L2tOnZjYvQS18E00qh0cqzC78n8FQN?=
 =?us-ascii?Q?j/ne6hw+I/BEaGU2Q7r6Nm+mrsNHJgMytNQmrdbY1HckpDbuAZ+djMUHqpdF?=
 =?us-ascii?Q?lS3m6Pq2GyVwyFIwsGobzg0O+uVq8MSVpH0CC+d4I8mlmBhDFuhiHYfpkgKH?=
 =?us-ascii?Q?P9ernzYPe0xmc3oCtUPgCmE360KM1u433GcTHtPwX3c965+Uvw6C+GvYjw5+?=
 =?us-ascii?Q?qhkgPyXeWifrKynTrOdEP2jg5kcY5Bp35Ew9C64mSW3/Lsg7L94vPeRLbuPV?=
 =?us-ascii?Q?gv9CqUZkfEAzcZluF/OhgX2FdKejgKDM4Qv85HKiAZAMC6Qbq5QJwuMQu12y?=
 =?us-ascii?Q?J0yKiyzU2HI8bp/HyYv3cT8WhYE0nI4iZCTqSYThgPWcW4X117UGIWHtjgqu?=
 =?us-ascii?Q?WSqfmQOfc0ov3X2LD/FDF4kVU82xN1VhYmYUJ9OXp1rA0G7z1whXbNon+2M9?=
 =?us-ascii?Q?86iVkYVqXHbK3yJ0uPzGSe+aafGGPb4duG+Ey37rwCxe93FmSqjlAAIAu/sZ?=
 =?us-ascii?Q?zWrayGnx6GCsKaINSSShEnjFY1N4OtQLAom3422iUZcJ4OpmP5iFcaCwyzSE?=
 =?us-ascii?Q?YhKiQ6a95BZelX4V6cGM7i/77Auju0LkV4AIcbP2cOAQl0cs0ervX9YFDeI/?=
 =?us-ascii?Q?brqi/jtmc7XuYLiZ4SXz8Jydkc4U/6X1Lyw/3UOiZDDq30/qiRvwWPy6hO18?=
 =?us-ascii?Q?0Q1HQAvbC7lGk4hgVp4BQ9bmdvFBQeYoHhkPigigNjxezl9lT/pFyKjYX2PU?=
 =?us-ascii?Q?Nasw3ml8lI05cErEUZ4bqhq9gvW0+fUQmNkNlha4Ew/fqaz5R7m6vJj75c5h?=
 =?us-ascii?Q?VQiSj651aJEKBFKnMn9ckPtYtPz5qifbGj6YwgYSFQTBH1MbSI+ZM4AV8+u+?=
 =?us-ascii?Q?klTSZLqNyvRfYu31vaV8gQq3dAvU9kBJL6a/FVha6y7bkz1jm8f//S6Fm/40?=
 =?us-ascii?Q?e6u5sI0NG85M8eWmHGI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?noKngVAqj/RQpSI0lQA31I5Rsg5wq7DjmfqS+kfE/v4PcHlJoESe1J7Gavi2?=
 =?us-ascii?Q?qE/Z8jLW9tO8i7+sNb80u+H0KiJMFmYWT5+bEPK5/ctDys/rxQu1nmZr79Wq?=
 =?us-ascii?Q?0DOrLBCx9TbsFzA4z/0eP1w148EXMWp1wY8X3TfSLKH1IVaP9aM5WIYM/ocU?=
 =?us-ascii?Q?GCdWv20slufYJMnwP6Hlf6dO8i0r00mMdxjR49B5bHGzaFFREikBAqaGoyOj?=
 =?us-ascii?Q?Aqv1gq5kFdEOoV1oCusGSfsv49gocZGiEIKyHJWN9h/xssQFAu1LSfzlsykC?=
 =?us-ascii?Q?Scrbh2ydOyD2Vl4RxlnmdSz28GtKec9tXzhceOjORh/x4KW7e65DOdxebLpX?=
 =?us-ascii?Q?IVIpqXofbChpPnv7jWH6RXyJsRWSU5VToickgTpA5JJF32+4xNC5lZ9zGg/o?=
 =?us-ascii?Q?2eFeCRSTJeZeMBygawQzpb6frZciyqpE86yQ80ykP+16Y9QtzUXQqRE8BTaw?=
 =?us-ascii?Q?laNbCnytW23SFfIXS2Ra692DuL1+aFNx9MrF6dCyjRTlGFDLqjaDADd3yMlV?=
 =?us-ascii?Q?x7+f6Y4xSYPy3qWkAMW5pyMHSZCthSfRCvyE7x3qbV2UJVnVu7zAfYtvCTDg?=
 =?us-ascii?Q?FpKwn/Ga35k73R09bEbVPq2jCGBfOee2BLq8aMMkxzEL3Yxh3OLjJSTT0S70?=
 =?us-ascii?Q?lx7zM6alAJy5fQ8BmxMIAbvzoXYh4s5GxbcJ/q6+iyhUOLIOE0nqdCfJk4kC?=
 =?us-ascii?Q?/LPJAnvKCKnSrFCSil4xLAcjHZJ6NmRUq76bbxZhQiZXhc4ubC+BwpAmGj0j?=
 =?us-ascii?Q?9adR//dW2YGrnx4JdjpzYXTIhCPUYPdNm21k0b7RDG+JwTKBGTPKnTGDK4JK?=
 =?us-ascii?Q?OOe4HT5bOGS+WJ7PfLl5v60KA2Q1vSfgMUPzlDk+dmA77KNagQUFVgEmsumU?=
 =?us-ascii?Q?to5FrppIkU2W9Vp8sZPjnT4GRgkW9ZZoHiWJAFFRoO24S1B7yeWc78wdd+Oj?=
 =?us-ascii?Q?TSMtilTNIYIJX1xURgM1X7Rj6aYOyX0LPQX6401lGS+AvIO6lTPI9pQRZ86a?=
 =?us-ascii?Q?hsXNPUB/nagTuNqicYdtrneggY78yov30sk0dzCX9pJUR22JrgTG7XF1Tzey?=
 =?us-ascii?Q?9CYe10H4wVujfMfJw8sTtklc4Rvw/SKhWT37hGGLSq4IjSRYSK7gaNfa/jSg?=
 =?us-ascii?Q?o8p9j3PxzoYDA0nDocfiq49otvSg/PGx8QKajT/h17J3LAlYMpxVBQZHdj3z?=
 =?us-ascii?Q?9NHnI3smRDf8+hHnUb4OpalVr9G9pHtdF2wrX7CJ40xpUhI4JQOE+fn+zrVQ?=
 =?us-ascii?Q?0LdSi6I0rj+pqxnf2SS+xwKEIdQYYfYSAbjYc27wS1cwHdaMDcn0/Cl7Yz83?=
 =?us-ascii?Q?PLHJCwznPk3Y7VFfw6bVDvHTqnvD9xi08owzGhOS216OYxVQE/yXJQ6AgsYB?=
 =?us-ascii?Q?GLGIb5Ihceea/E26vZn80ClenKnRMa25dYIYJS/yv2ax4GQWq2a3LA4udbcg?=
 =?us-ascii?Q?fBkgw6mP8zfkWcWAXsROVcscaH0vc3LfAeVdoMJhdvy5aEK6KkksU13jsbv9?=
 =?us-ascii?Q?vPbQZjJttkExLQcNn6ICZjHGc8MXh6RBqPl0O9hCMktEbPpCu0gYi4hxyCQe?=
 =?us-ascii?Q?b4655oZ3zq5ldVkCGFEeqjO7JVoyqw7U/qtGL1meAbZRHcPB9pggCbfMlry5?=
 =?us-ascii?Q?1vBVvOy8jukt3ITduoWC0yFu8bN7uDcBWUW/xeeInNsloY/hHlsnqRsWbUqs?=
 =?us-ascii?Q?jSB5XJK71FKpkiYzvtr/UXkSdlSIMncJ7IQWmnKHKczQcPlZMOByD5mSxRmL?=
 =?us-ascii?Q?BwdSQ7DrSqHR57yn1lPGSpMmkWD5tS4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f56ef4-e01e-4eb3-95ea-08de63f800c9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:16:35.0982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pc7hA5gIZPM6tDUQGN5UM3xjdx/iOZJPpJVYT8wF3/fBAMo+i9+zf4B0cdObe2uxKY7NBR7fWmVNZB/AR8BEBmV2eV0zeIxilG8iI6/Q1cY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
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

Introduce a new lib_core_sources list to isolate low-level/common code
(basic data structures, device scanning/info, and basic utilities) and
build each file as a small static library.

These per-file static libs are linked via a new declare_dependency()
(lib_core_igt) and use a minimal dependency set (glib, libudev,
pciaccess).

This improves modularity and keeps core components lightweight.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/meson.build | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 1a569ba52..2b94c0d1a 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -148,6 +148,27 @@ lib_deps = [
 	zlib
 ]
 
+lib_core_sources = [
+       # Basic data structures (no dependencies)
+       'igt_list.c',
+       'igt_map.c',
+
+	# Device scanning and info (minimal deps: udev, pci)
+       'igt_device_scan.c',
+       'intel_chipset.c',
+       'intel_device_info.c',
+       'intel_cmds_info.c',
+
+	# Basic utilities
+       'igt_tools_stub.c',
+]
+
+lib_core_deps = [
+	glib,
+	libudev,
+	pciaccess,
+]
+
 if libdrm_nouveau.found()
 	lib_deps += libdrm_nouveau
 	lib_sources += [
@@ -282,6 +303,27 @@ foreach f: iga64_assembly_sources
 	)
 endforeach
 
+
+lib_core = []
+foreach f: lib_core_sources
+    name = f.underscorify()
+    lib = static_library('igt-core' + name,
+	[ f, lib_version ],
+	include_directories: inc,
+	dependencies : lib_core_deps,
+	c_args : [
+	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
+	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
+	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
+            '-DIGT_IMGDIR="@0@"'.format(imgdir),
+	])
+    lib_core += lib
+endforeach
+
+lib_core_igt = declare_dependency(link_with : lib_core,
+			    include_directories : inc,
+			    dependencies : lib_core_deps)
+
 lib_intermediates = []
 foreach f: lib_sources
     name = f.underscorify()
-- 
2.52.0

