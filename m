Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E46EA4FB5
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:23:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE2D10E147;
	Mon, 23 Feb 2026 12:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+/cSHXh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B3610E147
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771849411; x=1803385411;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=XbYxw5e/hdYSEztN8hv9pCEGhhrFDgj2spJNZKZhBeY=;
 b=l+/cSHXhwyrCs4M59w27wdanPFITxs40u2h6d5jNUww036HsIjmyhc1R
 /4D/sMd/1+dXJEbuWbxFlMOVScI3TN5t5fVtPzUqRA6mCVFdSD44o5UOY
 3vr4ctTCt5c70s6dvg7npMJBjG6JwjUa9/j+mjrYv/QBRa5OyNuBh795D
 HU8xUp8ZKNJQdw4r5BAXNpdUy4pordK5WHeOcPFWJFGSGK0DlgaMRIKLY
 M0WAYSz+wg8+kZA6uc7wZKXWorfNl8WorijfTkviTYja7Py65VJRy4juR
 WlkvbN2vJlH9j6zxMxFt2CEbvoqp3bnpldNOExM9na/Poy8JboTsT7PBQ g==;
X-CSE-ConnectionGUID: oolnrlXET7Go6NoMvU7KKw==
X-CSE-MsgGUID: ddfQorPiQU6OduDyviJ/Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72750608"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72750608"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 04:23:30 -0800
X-CSE-ConnectionGUID: oo4ysVGtQXCpiU012b0NGg==
X-CSE-MsgGUID: hKf4jy6oTmSEdm/k8cam3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="213956129"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 04:23:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 04:23:30 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 04:23:30 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 04:23:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtz40fSiXTkBfvmIw5Ji1D+hDQbznDlgNr6GQ+3c/Fd0kTuxOV1B8I5ZchNEdz4lKYy8ndR9hJ4VBdPvdIyf8UGPnv+ZIgS5MBAiu+76C6qyykfh6W1FGwnlpzNgOWFuuAHRiZEuM8zW74M0QTzjpKPD2MiU1NdQyYrqdg28sSufFK2ram/Tr3OSMKHP/G0nKEBGVwHh/qYwE3A+dCyj3IgowoH9crrBmcR4qpYOUGcDganvwCGBhcpuekNR6r+hruNPWt16/tA09Msn66HqPHyoeBX4/RUx/AfGc7qgkG2epXhFJ5qLDhUPTeYNC+0gseaCkz1WTLYxFmpGK3HgWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daVI8EeD4rghJsu6Vbe9DqrYWZpe7hOXRzG4HqQQggk=;
 b=uvuIXrfqzJrTgAWzyuBN0XShKE41vBDZ2hHKXFNuWkcazDoGICpIjQYcRwJqURszcTiZWIncCLAzCPP0M2k1M/Uenjxc9HaIZaORv3WaiB2N9wmC4ueRhmHNP9Y26++qEpNGla/K+0OY2flO22u4iE4v+7WNAAEHVW9qNgasoxEkFIYsK4Wis+mgwkCOUwu6Ppjo1tIesnu2ZssMpLKJai5sFPOPWkQN7Rw3EIyl5P3B+9E9eCI2jd4nhjwz4018Zn/ODAuUcdVqMzSS4hAcEcuW6XIdh8HE/qtkJDSzDBbHFuyNY86/7u+ARELQ+OP8UdvpbBHZQWFmFUUN6DeOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH7PR11MB6356.namprd11.prod.outlook.com (2603:10b6:510:1fc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 12:23:26 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 12:23:26 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>, Marek Beyer
 <mbey-mw@gitlab.freedesktop.org>
Subject: [PATCH i-g-t] tools/intel_gpu_top: fix JSON comma tracking with
 per-level state
Date: Mon, 23 Feb 2026 13:23:42 +0100
Message-ID: <4edeeeddd4141f3de463548785d3d9a4ca696823.1771848992.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH7PR11MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed9bbb7-6bd3-4415-96fd-08de72d65866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CrymuU1o7urAA1AMhOXU1IGyurlkLOYCW/PaNFRLi3eWGtq9AT6Z+oVUnxND?=
 =?us-ascii?Q?RJ0wryxaCfsikVN//b0ytzJgIxASS+O9DhPme1EmCNicoWcXHOVoSOuwcWty?=
 =?us-ascii?Q?Y7IMfEuTSj+7emtDflHJl9lEbfKhwHdC+MlwHRfYFOO7147GFeTyGnvqQejL?=
 =?us-ascii?Q?3478QY1fWAk7vq2pWu0QeiFSXvMEELwQ3/QHqYMgYyT9K91M8D4ooBK9QqBr?=
 =?us-ascii?Q?Rsxpl3Poj3Q3lIcFWxarw9Gu4IsN3sv5Dm8gI4kEjUWQYQWZnIgdbcaHFHlM?=
 =?us-ascii?Q?oD/Xpq2Ii/Z+JWC7Z780v6zeRJmLCg0r9lJVxIKqGCvDoMXIETIyIeo3g0Ow?=
 =?us-ascii?Q?SYdBqXMARlUgqc97fk2pSXKVEzgIemGTOZNUP0egrmZ1Aw8eHik/QVQbi7Mw?=
 =?us-ascii?Q?q1r7p6CNeO6uuUb10i+DTBkup7GKmtlJzeK1zqxmX3Ap+08N4FoZSixAD52k?=
 =?us-ascii?Q?sAlzrMa5ih+XulGPp567j6DJ86i7WfZi7o0Ej3jpDMcpiyV+AWb0h+HgwK23?=
 =?us-ascii?Q?a7A6e5aYJkNxxBrjqAICTHhWK6JT1fXPIEzuU6JEGB1DeIDtOWBxqNv1o/rh?=
 =?us-ascii?Q?YuywU5c3dbcvWIFQIVv8zDMEr+Ipv3n/nT9/68OsI7gE3aa3Qtlu7Q+gXGil?=
 =?us-ascii?Q?w3CYDmuGpdDeMdnco5bjAUhFQIjEOPshR6o/xCFwIIG/603LYf7uyu/A4a0X?=
 =?us-ascii?Q?4f55iQ2fSf8i9mRPfWvi3OZWkmFgVLcIaBcYYkdcddMzh1hb1wnuZzEO8Zuh?=
 =?us-ascii?Q?PnG59QwpEXGTgKyJG7XhSke2tdDgLCE+qOyqUI/YyVcO7m/UeRjM8vmczDJN?=
 =?us-ascii?Q?h4F04RDA9y9MDAhLpVVXiRcZXrOSTMfezftqVpDIuoFMCq302nuhldgvV7uf?=
 =?us-ascii?Q?yKLGAwWvmFGv/ahWIqjl4jHvUandnaKay+X9vp71e/JPJsU8XTKwpt9Jdpe2?=
 =?us-ascii?Q?ZViGy/D9pM9HDtoMOZsB1xyx6y0b8G6hJnvUfaPXGXQojtJNZTWQfV9PGvMm?=
 =?us-ascii?Q?RbO23Lbu7POIf+hWFUy0/JN3Q7Fvdeq9Zk+in8fQbHqbjTv2EuSEUIgN0YsB?=
 =?us-ascii?Q?suRFrLFO1SxZVivXZ+pPNOoz3KKzlyHyomLpGkVZIu5b8NTAoMJo93q1EZI6?=
 =?us-ascii?Q?0JMRGv7x0YU1IkDtn2QXnXDapvZmnKKjfpu48VqaXG/VVPgU5iYUQiJyNDVi?=
 =?us-ascii?Q?uXK90tkYAjw3zZL4+WtwuqvshteHV7jMCQQYZUWC1J8vwsYYDL78EydXN7B+?=
 =?us-ascii?Q?mFok6J4WmOiHdwallIkBuGTRMwoUy2Df3821v2OGaOrrSX4QEU12ACOZJng/?=
 =?us-ascii?Q?dpWj16ZIrHQpH9XjZz6m3sTJvjuuGgg4RvDSOxI4RbhndMZekbbT4Yb+ZED3?=
 =?us-ascii?Q?m/QiR+7QqcG9ShWq26tUKiRL6WI/jXsxi/pLQVmDkHf7AoZY0HVz5rCSImf3?=
 =?us-ascii?Q?pMWXsSvdDPlglkEssr3cmBZUtN/FDaNHkJXZcxEZGhWcJQru3CJ15ATShKES?=
 =?us-ascii?Q?V7SERaWgVb4fBCW8B/73VPxX5d6wQytkeTeE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aCAFOaVhDap+85vehebRXFNIoZAPyBgirZGnt5UZiuuWwEn7rzO2wx3ZAlv7?=
 =?us-ascii?Q?erab6ixxBhy/bR9GJvfYI2rQawRepAXTsFJ4TcexPM6m7xgHu6ysAHxOVlkB?=
 =?us-ascii?Q?TTwiqd/OgZ21EiQi2JcPH/YSwopB13Un9zeFuu1aMNHK/lHQDVUOZYWuJREX?=
 =?us-ascii?Q?rVxF1lfIoxZDt7z49nhiYPKTi7POG/vWd2mpJcGXL3w4R6YfhXpbgR6iBeeB?=
 =?us-ascii?Q?4DhrFVmOWI5jdd0iG7YiMMVCFktWefxQIpKDgnRvAoyFz3qRqC4jw0i1EB0n?=
 =?us-ascii?Q?6XeiCqwFP2fGKTK/znriP631OEvWJf7RrYLvlDsGiTUIMjZzthihUwIXxOi6?=
 =?us-ascii?Q?aObhiRTZkiGDtRtAEPY3i38CsQplz2B+JgUilbU9Z3SlIoCDXL7/4b6YdTpu?=
 =?us-ascii?Q?+VPIbVZoGt84tS562m9t0ku8nIWOhrrMB8xIkk3e/g/tfJzaYzJ6ZKWSDM0u?=
 =?us-ascii?Q?EStWCF8YUB884tIR2XgUpeD5OmQiBQBEjWQGifQcEhJtd4nz20XaWsaSTSG5?=
 =?us-ascii?Q?AmBecGYe1s5fZ9YqkBl44Mv9fMoY7o1pdOt3QNlbfeFYXi99fL3Dt+6xxZrp?=
 =?us-ascii?Q?gnzqK66+4kYr3K5cRGyemt1tfuAApA3R5nFowvaj4A1tL/9zV8VSe405v0Jc?=
 =?us-ascii?Q?iBQy2KAAOgE9G7B+g8CdDEiAILxvZZoK75Il3jgOQX0Fe9tuzjS76MBOcvQu?=
 =?us-ascii?Q?JHqqYJZgNyGF7KU/xgi63/B5T4+5EWC/N6WLbGDEy6cRJBPfKuWrka1gMhf6?=
 =?us-ascii?Q?H5JBt+9IC3C3kRjzUl2EHakgvpe38rK9yG7WjbkWwNtiQQYX1nxu1sxtUCY/?=
 =?us-ascii?Q?pTOyv1Gjaz10qecHxF2uHBkJaQ3bhnaDG81mpINHdG5Pshnf04ok6mve/l1S?=
 =?us-ascii?Q?XGpmIaYSuju7T/CFBJ/ptaQohI9ASMAEp0CHarvOxyReFYmJ2IyRy6KrbZd3?=
 =?us-ascii?Q?YdmN9QtKAjI1ZubV0CNzWRARDf2XHeTZ1tnmT/0TobNaKtgNxcN4o/hIIUES?=
 =?us-ascii?Q?gtk9zHwQnr7fx02LG8Ds9Ek98/q5FFPYbVvUnSQ7mZvMyqEOCO+wL0Jdccty?=
 =?us-ascii?Q?1fDXnNLiQbpXHi8FiD+xTEBB8sHD8r7DiePgjfa3gxH+6bqn1cCqgwyeWCsO?=
 =?us-ascii?Q?quHhYLCPm58CWicdDyrHetn2bluZIiok4ylGZsJq8MLjKnDp7C7Sn0vAscmT?=
 =?us-ascii?Q?5Dkz46RK1RS3QpjBBJTpXrkhlbcQxiAunvQSbvg/CIRsjndshCVX6mmrdzqe?=
 =?us-ascii?Q?7Fh5xtypRqV0D0hRIj33UNjzTe4SAlvmpPnDzeG1ps6Awl6UifWBwXv4/iwy?=
 =?us-ascii?Q?rbE+ZvdqpH7TDkZF3dLtZhU1rjgQ/dwndX32wl3XVvM5/swAKHXwTMUE+tZV?=
 =?us-ascii?Q?MmX8UuHwswlmDIPeA5uBog3sTCAxqJ+QP/uFGj7a8AWxt578VgqCvoK6chTm?=
 =?us-ascii?Q?fVgPee1kpAEcj3epNUR3n3PAXoRhlZAovAQnl9smjSMdqe/YUqLwtCjwBEiE?=
 =?us-ascii?Q?w2OLoCxuEg7gT1pax9dnz5o/JEyPbTXJFMbc6MxWXhFzx2S70k559qP+rw+c?=
 =?us-ascii?Q?bjSTSdfgbwsEEASsA0o6KgrsHW0Ll+MJxh3avcMZJPIQrdpGOLnSknJ7T2RS?=
 =?us-ascii?Q?EQlZimRjH6vIIt5ZIcherDUAH/YjDqBcwa09ix9613b1SLu9KZ5wuDBqat6P?=
 =?us-ascii?Q?ay9WH5/aqbH9ryimhQGhWcVnEW5thUBtFy2J0DxsDr3MbaIRcbITHfUGWXRK?=
 =?us-ascii?Q?3405QakpYCy7+5fJqiYZYsprrNmOcY8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed9bbb7-6bd3-4415-96fd-08de72d65866
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 12:23:26.6453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLqSB1Mo2ZGWYyuXO3ovdID5V7+eN8PYj10Z5BKdysa10U8xdNe56rgkh/WPMtZqBbbUFu5ASSu4W/pNiM4b+l4Y1zIrcMzRmD+kpk3v68Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6356
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

The previous implementation used two global counters,
json_prev_struct_members and json_struct_members, to decide whether
a comma separator is needed before each JSON element. This approach
only preserved one level of context: opening a third nesting level
overwrote the saved parent count, and closing a nested struct left
json_struct_members at the inner value. As a result, when an empty
(or any) nested struct was closed and the parent then emitted
another member at depth >= 2, the leading comma was silently
dropped, producing invalid JSON.

Replace both counters with a bool array indexed by json_indent_level,
sized to ARRAY_SIZE(json_indent) - the same hard limit already
enforced by the existing asserts. Each nesting level now tracks its
own "has preceding output" state independently.

Suggested-by: Marek Beyer <mbey-mw@gitlab.freedesktop.org>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/199
Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/intel_gpu_top.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index b94604232..d8ebb20ac 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1117,8 +1117,7 @@ static const char *json_indent[] = {
 	"\t\t\t\t\t",
 };
 
-static unsigned int json_prev_struct_members;
-static unsigned int json_struct_members;
+static bool json_has_member[ARRAY_SIZE(json_indent)];
 
 FILE *out;
 
@@ -1127,20 +1126,18 @@ json_open_struct(const char *name)
 {
 	assert(json_indent_level < ARRAY_SIZE(json_indent));
 
-	json_prev_struct_members = json_struct_members;
-	json_struct_members = 0;
-
 	if (name)
 		fprintf(out, "%s%s\"%s\": {\n",
-			json_prev_struct_members ? ",\n" : "",
+			json_has_member[json_indent_level] ? ",\n" : "",
 			json_indent[json_indent_level],
 			name);
 	else
 		fprintf(out, "%s\n%s{\n",
-			json_prev_struct_members ? "," : "",
+			json_has_member[json_indent_level] ? "," : "",
 			json_indent[json_indent_level]);
 
 	json_indent_level++;
+	json_has_member[json_indent_level] = false;
 }
 
 static void
@@ -1149,6 +1146,7 @@ json_close_struct(void)
 	assert(json_indent_level > 0);
 
 	fprintf(out, "\n%s}", json_indent[--json_indent_level]);
+	json_has_member[json_indent_level] = true;
 
 	if (json_indent_level == 0)
 		fflush(stdout);
@@ -1160,10 +1158,10 @@ __json_add_member(const char *key, const char *val)
 	assert(json_indent_level < ARRAY_SIZE(json_indent));
 
 	fprintf(out, "%s%s\"%s\": \"%s\"",
-		json_struct_members ? ",\n" : "",
+		json_has_member[json_indent_level] ? ",\n" : "",
 		json_indent[json_indent_level], key, val);
 
-	json_struct_members++;
+	json_has_member[json_indent_level] = true;
 }
 
 static unsigned int
@@ -1173,10 +1171,10 @@ json_add_member(const struct cnt_group *parent, struct cnt_item *item,
 	assert(json_indent_level < ARRAY_SIZE(json_indent));
 
 	fprintf(out, "%s%s\"%s\": ",
-		json_struct_members ? ",\n" : "",
+		json_has_member[json_indent_level] ? ",\n" : "",
 		json_indent[json_indent_level], item->name);
 
-	json_struct_members++;
+	json_has_member[json_indent_level] = true;
 
 	if (!strcmp(item->name, "unit"))
 		fprintf(out, "\"%s\"", item->unit);
-- 
2.52.0

