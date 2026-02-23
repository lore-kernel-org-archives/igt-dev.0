Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E01EEA4FC2
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 13:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2565C10E3CD;
	Mon, 23 Feb 2026 13:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jrkti/lv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF4710E3CD
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 13:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771854890; x=1803390890;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=xK/ZkIO4ITn2UN68GMvILXcgjRyA7lnzGCEOoG/UEok=;
 b=jrkti/lvNUQhRv40Bdb63ipFVDSEICNjIciL1zV4rcK3FJQli4VORvev
 IByhL9oOlLJTHD1+T1EfEInsceeHQml/z/QpzC9VDhpiKlQHENlGWbVqp
 bU+TGoOPk1tqMu8XYtUYgTrYRKM1EcigOaalC4bm2JG4r03WEnoIZX8Kr
 64kNAUrDrpzQVI+5hu1J8YkQj/+g0B7SZkLzfHjG1F/PFFevDlxZyx+ed
 7vRWdZvrBW6R5xi9tna8GwTuzEsCdPjeSP2ta8zwkVgXAfTqkwJbV+ib8
 Z5D8/im4upESCb5U9AO9wddEAyAQZXHtHhOqW/niizdFjyRvKstg+Wsn0 g==;
X-CSE-ConnectionGUID: 78mcFzX5Q+KT44lCfmaPDQ==
X-CSE-MsgGUID: cxUN3c6ZTGeJHumyqYcxLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="83164586"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="83164586"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:54:50 -0800
X-CSE-ConnectionGUID: QESdLqkIQweZHXZEyWGyIg==
X-CSE-MsgGUID: 3g7yssWURoG+URgIt7HsWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="220114608"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:54:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 05:54:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 05:54:49 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 05:54:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kk5kgrsXWl7SOzus1jNomospCYHjO67hPGW4IXxWYkCZf6I6KfH+xqSmmtu2AP2jg97a07nxs5N94k1B1/d2t5OsituhW0vXBrUO9l58+OngLhRDeqmJsHfHnGeFX869jw5XD7PaTL3AjtKSHTzfZUgcxB6mJ0pQDiqW0XY6RYYnNY4i+3HrQPY6CEYtTNbZmPuV7+qsKgv+xXL8ibv+VfYrwMPdEbj+N5/0bSbddo0uxhDBY9Mrw05rWoBswKAJGJ/U4n1Ca4hlbVudkwbfiQtDPj02vN/6WQ0XC6hU60oPgSHTuWq41P46s2nX6JPC7TYW3rCNTkgML9Fe1sGSEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Au6kpBoLFcdYT540T98XOpNtbwRMSIqVC9TnZ9MoZHA=;
 b=L9AaoAPrNCl5NHISopse+RRxxZJc5A4d5ApknYXLmCL0Fp4sgluknvpTKE2PUHid9Au4cjfOP1U44cACRHqfEfpgRd2L8LjZlqa/zajRzluytD0mfCh6voyVdkrbP8m+c4nx1i1Dyy9bfRx4iiBEh4xRsWI7df6PkR6MxpgowGokio2rBVLCJgBkWBzNU4MGPrtJOTwjQIh4j14XjLtRJ+7UU2Gh3U0XKYRT7wQdyHf9bZZ2yiqZ6pFIwG5vOudRADZvbDYMZpsLYiHjJaaAbD8U/70jrApTpP48Kt87qRdW59xrKGyibYB2TGbhjfdBtPqxBUeVjKHDkrzdXa5xKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS0PR11MB9454.namprd11.prod.outlook.com (2603:10b6:8:28c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 13:54:48 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 13:54:47 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t] tools/intel_gpu_top: explicitly reject Xe devices and
 update documentation
Date: Mon, 23 Feb 2026 14:55:06 +0100
Message-ID: <9482ee5a326acdcc88b626112728e6cbcb6e0386.1771854831.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS0PR11MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d65a0c-54e7-4a92-4e4a-08de72e31b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1m1N5G1brkoqYD24BlNmK+GoUEqV6nIYprsULMAz+X3wocqdauRNUHU8hd/l?=
 =?us-ascii?Q?48croSvWhJOlY5AXeYbiwB80y3uIMTvQ1YawsmQd6oOHD25BFe27xMXoRktR?=
 =?us-ascii?Q?KS2lcYMfPcRvQ6koYdOZyc8+5RlXWxoQ51NRDuHWewxYth/CWDT2v78Me5nd?=
 =?us-ascii?Q?XfJtUL25rbjXQNJZI3rKryB9saKaya17rEy0S4vU2533K2pdgoOcFWdmZ+kr?=
 =?us-ascii?Q?D+dC69qEdmApQVH3HHlTeRBHQvRo+NUqjnfuWkSbNQ1Z8eqklQx5RmJ5Inzo?=
 =?us-ascii?Q?G/I4Ec5Gy49uf+cqkckUQW/G5nWw5PQInSIrMfJpJh18Lj5WYSceTxsIBfBp?=
 =?us-ascii?Q?j/EY3pVZHc67gAOJcHD2u4UFmqElmkciwsxuFdfk9xoFXLAWPiSk2HhFMpZX?=
 =?us-ascii?Q?ssn9yi8fHe60SB7Tpe0oSI3U9Or/1CncD1i6k/dJIU67sQmt2MnGnQ3OqRqD?=
 =?us-ascii?Q?BdqXk06ka3q8aU3Lob3PN4//lYfa3JfTGhpXysi5yIc4a+e/yr/RJVqsmh2Y?=
 =?us-ascii?Q?0Yz3KbRghZKpHHna7eCeZHCn6p0vNqO1pks6fzV2u1dL6Bj9AUrD1ZXzsqAe?=
 =?us-ascii?Q?eDGWrYXT2Ps0jaVg06N+i6/oe5Lq4jhLOnjp0X7MFRK4V7SpfLtWEeytc5iU?=
 =?us-ascii?Q?b1douoHYtNkLyGP/kZpc+thBzjbi6mEDHb0zOaL3fRQCaA2rgducEvWSbnjV?=
 =?us-ascii?Q?SXD3FHbuWCFjGLWa+ywcTEr3qHPpUSwbPpA1IziLp3PlAB4Nh6QdeWZrCs+6?=
 =?us-ascii?Q?5ScNV/qd2ihYO/Qe52d6Ma8bSymMjbVJlgcXBZFqsrjzz4aDuthaCDuSOr6e?=
 =?us-ascii?Q?3It0dLpAFOmWr58K0wAOCDZVhLc//fT5mJHCNhZ6eIfqFvVKiN53lGo+7JBx?=
 =?us-ascii?Q?FAaKOUqhPghmP1x+3voadLu3ZR3gpr9l46bDmLdpdxxFlszj93uWw21CdqkL?=
 =?us-ascii?Q?lY1RBBXqJMilMUyBSa/pL4wnkbbaKryM0J+Bq2h6xUofiEaT4YLsi6yTcA+s?=
 =?us-ascii?Q?gTVHmPH/1L6Zyx1/mKmxgpBFrYbPN46Xs9afdWQ+FLbnMfcal1x0I4AtOYT1?=
 =?us-ascii?Q?npVU5D6g3/KE0q5n03c+wqaGKh4RqZGCqx9i8zgbQJ8Vhfy/rSXVRF0Wernk?=
 =?us-ascii?Q?VB1HsDtTSRnWHQsmJkgzrFQndihIpBOIrvqv4GZW8JU64x5koo2wG+XK6Fd+?=
 =?us-ascii?Q?c2yBLfZHQqjcQaOTnXx3E/YujvRlUIQQezMT19zeUGFssGnUklmvPMYBsLt3?=
 =?us-ascii?Q?wnQVfL4bRiNIy/ysIlfDR2+EZDCfrz0kXGdNBzWZF8VOdwk+wJt6HF3Rmun2?=
 =?us-ascii?Q?G/csgebCFZLFUghL4zWOSquyRfawvKxv4NBqOntvyDLsrNup/zTTputTxaW/?=
 =?us-ascii?Q?xxxU6nr9zsbVJlMek3iYASJeWXdUGq9yZMWFJDwLJb5+HQxHvg9v7wfRqbHY?=
 =?us-ascii?Q?KI6JI2KQPehTdgeeI3j2UykMS4cC1sO/3JYcucTa42/JSpkikVAgRL/uHTg9?=
 =?us-ascii?Q?rVkPoxg3qNQZDojzbb5tlhf7AKJFvbYjsdWou18shQbX51mzJebgbBAoap8P?=
 =?us-ascii?Q?hXnJSjmrbu6NcCDfFis=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jO40+YMeyL9iVO8NdljHBFXp1D6B28hQ5USNL7129OUEmybmymN0JeLP55dk?=
 =?us-ascii?Q?l/4+L9QEnFGRCPwYLLMzeO/6zSrfqkY925NoIiVrNqDYO2JUSmeMFfKjQKgz?=
 =?us-ascii?Q?PxU8NipAoFmipd7y8/OzipZRr0+KIlqF1LdwgYQDVVZ+2sDGH2wFmy2oWCrZ?=
 =?us-ascii?Q?hrn/TElR4X/VD64sfdYcPXnwsCw575KylQYoKtEsmgcLpAiH2I4sNeyHKj87?=
 =?us-ascii?Q?oRyPrjwitr+12dDro2zDFU9h5phyAPcfrUFxJSQNnXDdK2uQ8atiOsm5XR5T?=
 =?us-ascii?Q?XJJH3vzuLAJjdpqi4AmoeL3jBAQRELY0MR2Qvystmop/uIKGEQEeB0+o4+21?=
 =?us-ascii?Q?q6KhcsIIefx1QNuJHMcRxqt46Uuk3341e26RIAp682vgj4OASuCz/k/mjM7F?=
 =?us-ascii?Q?TCbyOt1zcy8JIjBNKa36zjdmFsj8aoQz7w5oW+U8HcbZv8WbHXkfxVUitLV4?=
 =?us-ascii?Q?2rrbkE8J3QENp7NqZaBfdVwxR/2yuOns3Vo9r8IRjfvusVorq/Z/H+JltqP+?=
 =?us-ascii?Q?rqpwbHUc+/t201bP2sypCD47WTbYipTDsNZiIKMQBkwrsWsiPfB782FS92HU?=
 =?us-ascii?Q?nUSvJ37rfy8bW/S3omtb66gGuRKotG7n7rhGNUd7Aou2jcji3TGADO+/C2bY?=
 =?us-ascii?Q?0+NW4FhadgiTprIMSVnxI6B+Bynd8c4cMHk2tHBoICP0i8km5OB/IwhYeyx2?=
 =?us-ascii?Q?U2Jt2HavxyzSxqZ32TWTEo95dnvQt1jii0uklWRV9k4GJGtuEMPenUs1AILj?=
 =?us-ascii?Q?bxLwl6rYQ4mlfZJLmurhvb/PaYFrrZ7KL6qk6VAlY8IujXWzkP2omki/9chk?=
 =?us-ascii?Q?rf2xELRB40wqiiEm/haghaInKEH35zNmJeMXsj0BTfky+sL+tOqOw/t2/Kiw?=
 =?us-ascii?Q?eMWoOzB/q3w5lhLvgwBPksXMTDwduorOmE9Y+VPt/DQtTqysZjs9cQ+X3CA8?=
 =?us-ascii?Q?oVjHVmTx8JlAaQBwDnqljoeEuLh92QfS3iwZUgF9hdC9roCnN/rOdNe+Fbzd?=
 =?us-ascii?Q?l78OAHnv4V9KQrU7KBp7RZ4GWgm4NV+8mUhrX+WPJc1Qk1YJxiZ7rql4+kEY?=
 =?us-ascii?Q?637gs3lImIHB+Jfb0moMuP4rLUqEEbjs+sQ7uQRD0WySAXBK51rOod53ca2u?=
 =?us-ascii?Q?aFrIBsjFI/FbA41hqft1ABmhMS/J2YJRYGsGPTpJERFsihKIYjPx2BbC2Yrf?=
 =?us-ascii?Q?cpGSpar9sKAfnREBUNgTeHJHWpDBo483KBKN3rihaMXSbcskiV4VJE/1SlDf?=
 =?us-ascii?Q?su4AvzF66g1HISj63zixUsXSlHtmL2/EEZVh2RAldevmEut51y1OYoPHAHQG?=
 =?us-ascii?Q?aI2ekK+xVLgS/lRxl0ssN+EXww8mXjF891VsgW7l6pkXEq0bvQ+MKQmGAGvZ?=
 =?us-ascii?Q?4J7eyjnZWCK3Vp5q0FmL5Mro5qnzR1fnhJf7BUFHjqZ6Uairbp8ZCcP98+DS?=
 =?us-ascii?Q?cTURCkyOkrEXt0wG2LgjyhZHbcC9YPF7+VE36sk8IUHs/GsRy9seCDaNvPUk?=
 =?us-ascii?Q?G1oDL/MND0vrSBi8U0hrbiBdbS+rRZuc5bkf8FeA7wGwUW3D2DWs4ixDzEem?=
 =?us-ascii?Q?ZCS6wFhKRF6D5fyA9DrZ6hi8b1RXG0IlEGcwFA8vqEdrC6+Xt6RhOVuHaMnj?=
 =?us-ascii?Q?gkP4KJWV1ANqcD54WXKXvABMGWHP2m9utvEgywEbE/q2RHrWgu1/VnSJxZgl?=
 =?us-ascii?Q?Kp7gUUi5YlMb5PVOfcPftJ68JiMd3VIo5+400UPejW35vjpT6mPMo2G+Oa8T?=
 =?us-ascii?Q?FH932dd7/vOE3sRUkbxBt/0qUBZPzs0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d65a0c-54e7-4a92-4e4a-08de72e31b79
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 13:54:47.8834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjEfWcLHN2H56PB3RDT/mt2p3k73TRa6Bgub9mpdtpRM0mRdhF55qydnpus5/23TCDnXJLaDpph7l93jASj0OW2lJETMOrTOQQ1xKz4PHGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9454
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

Add checks to detect Xe driver devices and report that they are not
supported by intel_gpu_top, directing users to the gputop tool instead.
The man page is updated accordingly, and the tool now prints clear error
messages when Xe hardware is detected.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 man/intel_gpu_top.rst |  2 ++
 tools/intel_gpu_top.c | 23 +++++++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
index 20204fdcf..5d29710e9 100644
--- a/man/intel_gpu_top.rst
+++ b/man/intel_gpu_top.rst
@@ -102,6 +102,8 @@ JSON output will be correctly terminated when the tool cleanly exits, otherwise
 LIMITATIONS
 ===========
 
+* Xe driver devices are not supported. For Xe devices, please use the **gputop** tool instead.
+
 * Not all metrics are supported on all platforms. Where a metric is unsupported it's value will be replaced by a dashed line.
 
 * Non-root access to perf counters is controlled by the *perf_event_paranoid* sysctl.
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index ee38829e1..b94604232 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -2734,8 +2734,20 @@ int main(int argc, char **argv)
 		ret = igt_device_find_first_i915_discrete_card(&card);
 		if (!ret)
 			ret = igt_device_find_integrated_card(&card);
-		if (!ret)
-			fprintf(stderr, "No device filter specified and no discrete/integrated i915 devices found\n");
+		if (!ret) {
+			struct igt_device_card xe_card;
+			bool has_xe = igt_device_find_first_xe_discrete_card(&xe_card);
+
+			if (!has_xe)
+				has_xe = igt_device_find_xe_integrated_card(&xe_card);
+
+			if (has_xe) {
+				fprintf(stderr, "No i915 devices found. Detected Xe device which is not supported by intel_gpu_top.\n");
+				fprintf(stderr, "Please use 'gputop' tool for Xe devices instead.\n");
+			} else {
+				fprintf(stderr, "No device filter specified and no discrete/integrated i915 devices found\n");
+			}
+		}
 	}
 
 	if (!ret) {
@@ -2743,6 +2755,13 @@ int main(int argc, char **argv)
 		goto exit;
 	}
 
+	if (!strcmp(card.driver, "xe")) {
+		fprintf(stderr, "Xe devices are not supported by intel_gpu_top.\n");
+		fprintf(stderr, "Please use 'gputop' tool for Xe devices instead.\n");
+		ret = EXIT_FAILURE;
+		goto exit;
+	}
+
 	if (card.pci_slot_name[0] && !is_igpu_pci(card.pci_slot_name))
 		pmu_device = tr_pmu_name(&card);
 	else
-- 
2.52.0

