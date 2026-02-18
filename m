Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAACBE9A047
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 12:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58ABF10E00F;
	Wed, 18 Feb 2026 12:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IstO9VYY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F07810E5B7
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771418037; x=1802954037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FPgIuI73VkzVzZ9sIM3NiGc14lBSTLIPwat6Zuw59Zo=;
 b=IstO9VYYn0oOai9IRjahzUvsMQJKMKoQ7AYnL4okegOtwT3/BsOwboUH
 SHyN2wQkTXtEJD2UnIqh0cTRg1pZbJanOqUtrBa4oZMNyUYa50FGsAeqT
 LrP85b0CjzLxh8HE92PzwSKjnmjTs7pSMU5AO9XT3HWtoNFbcvGey9Q91
 i65A/qEhTVZVv6npUMI/JHkrdMm0Tr5b1f5Kua1rRV9yTgwtmn5sl0yFN
 kstPIHaxfBjfUYKcqR1PIypNB3u+i0EHVMBquMnoG2ERRegQCJK0klw1X
 QUrvOCv94q96DOD7hJb5f5dRmFEHBGbrU7bML7RRTTgtfutAzVFr/43eZ Q==;
X-CSE-ConnectionGUID: uFqIZJIdS3KPlbXgFCPzqQ==
X-CSE-MsgGUID: nE1HfBsUQmyoqAb+aC55KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83116112"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="83116112"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 04:33:57 -0800
X-CSE-ConnectionGUID: P5WCm206T6OeusVJZFqFyg==
X-CSE-MsgGUID: Hc0BHCFYTnSNol2f2WbDlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="219175848"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 04:33:57 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 04:33:56 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 04:33:56 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.54)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 04:33:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7KahtimKwftrW9ndCsQzgdTu/tag8n8vylE+bGQ8uD9S03dj49WSEUrCAhjSC4w1BUvKV3Pssds9sb3mBtvGoyGabsVBOcbA5w+FHSLe+JOXjx+YlHoMiq4DbP1GpAeCFfBqe/XzFsGRph72cACArKneYV4fEqeFgWJ+wdRpWVaXOdvAF26Lva6XMfkaBTm5NE9BhLVgIsMN+438jIV0fAmRUVKMVgsrLMwQk9jUqXmCgf2AdlvoyxHjbvLB0Ej3bKRVQpMOKyBnxSpCyCaR05vOHCfpI3OiCi/ObUXDWxnv7pvFWP4nmS3xOUhggRUluVup4Ov++WVR8RHNPWVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbXZIo23qRmvo6ELtsd85pbd09X8qvd++6yp0GGffow=;
 b=fsQtnTUopvi9eInS7cN89u0L1L6vrQVlxTSKnkCWvnlkGkKdcI9M4l/KxoD8SXRZ2t0/K74v1KW5HNxe7GiTup2xlhNRDQxMpa3Prpx+kOQsabqh7Z/EiVunwjiC3XJtrD3Ic1L8y/6rXJ25PhkFgOw4HW81JfKE2LhOSTe2j5To4LtL+rnTDtjlGcN7HFf3rO8NG5+Yl5AfSxA69D43i9MnmTR/8jpa1uGdXWxq/8Y6SPcDy7eneZUuGrlflsR2IebWCcEzwbZwHG3F0Uh13S5Dc3IG/O4f/dB55S3URVB6zrhIPXG8WksL46/sTU+bqz/eMxie/ulNj9af2C6R2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 12:33:54 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 12:33:54 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v2 i-g-t 2/4] lib/igt_tools_stub: Add igt_load_igtrc() stub
 implementation
Date: Wed, 18 Feb 2026 13:33:57 +0100
Message-ID: <2b3a5515b83f39ca87b627fe05ed5846383d78f0.1771248283.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1771248283.git.sebastian.brzezinka@intel.com>
References: <cover.1771248283.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CY5PR11MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 9670c3cf-0109-454b-9e98-08de6ee9fa7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7142099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FP/A61s+o+0hU4lOi0uG57yxpVTXt07GqcbyuhvayEyAgQnU6wk9bxwrrLDO?=
 =?us-ascii?Q?IIiCDzUjjow/K5BtJrtgunUGBnh5f10zo+rqtXvgOxEuFi0FTNTQQl8/+3Pe?=
 =?us-ascii?Q?qlbOz8jkWl/AMLshuB2jJOKt+lzuivTwL5fJa23E+7kzHm822/0JTWGErL11?=
 =?us-ascii?Q?XXMwj1oKDpCT+YrBwYlwLswTMmySAv8dR6pnu345a98p1Cov0rLa3hBFehXN?=
 =?us-ascii?Q?rHsN5asbtI3feo5JDmB3FTx9YPy+qlccWx7ODIS/12AQSie9aOlqIrv5AkBX?=
 =?us-ascii?Q?3pDwgilL0aePsxGNJkbFD36mWllD0Gpy2qz9Pe/ATdp5RPbqKUC2HhWS/mbw?=
 =?us-ascii?Q?4jneTkKrEYv9lq7gMZ6c9U8EUUGctUQgz60qJoGoPMYNweBTNkss3FzE/Rpv?=
 =?us-ascii?Q?7rHbmPmK2qjkrmBlj79WzbrB05UrLobnjUe1Wt4GeQhfDWhearvescLWkN8w?=
 =?us-ascii?Q?NWsgVKc7UOratSDbHdlcdXkv/Y08U71kF2Ru+b8cgCBOkgqEIbuFI9+RSjqC?=
 =?us-ascii?Q?Wdh9oTISgLfgJsT2jmvGNntjnENy6NauMCMWnzpxam4QM64WtpsvKFY7XYdI?=
 =?us-ascii?Q?F+q5aD4qjqVO8Jxf+dOmGwENoHo09iWFHrqhjmZ9UHu5keNLb0ph7t9vOTRE?=
 =?us-ascii?Q?/0iC1oPV+RNgJl1SQjkxw4slNtWUDS5Sum26zJWVtRbX++z/qjORyS0Ad1F9?=
 =?us-ascii?Q?gMErsIK0HiU5h1QxrHToNoTZVw2vi4oIhE8fwVY7Qu00XKPCIlUANttxi3Mv?=
 =?us-ascii?Q?wxycQ2uUXQVBkqyHCs+ARyRRk5FAt00d9eUADXdxTcySO3szCqVNufQ0spOW?=
 =?us-ascii?Q?1w5RQY0fCZh9yhcTU49S53rnOSYSja3hxg1+4qNUceQi3x4b7hSa6gqzzHGZ?=
 =?us-ascii?Q?0lv06Avzn37QWSz1fPuQKUNbCFPnvDLGzr3qxfQqRTPirkSTI8+feVahUppm?=
 =?us-ascii?Q?iZ6G6JDvFnEeE8746ZvKL8u2FFrgoT9NdS8OE1QvGrWqKVOLPJyRgSD79qL3?=
 =?us-ascii?Q?hSjKC7ZNrK4+ABEDiNEKCawMMPsBOdLn5zattin9Tr+ZerO9un8jV+tn0ZrW?=
 =?us-ascii?Q?3dXKHVDRUkueV8RsPm/Vz16VcrgM7P1YXXZw83V9JYRAqkmN69YsX9YNTgkE?=
 =?us-ascii?Q?LN3odMzXLZNCdXD8cF4fzloKN7cKY29QBGBKo6cB4Ne8o56Pf8r77VGnj9mE?=
 =?us-ascii?Q?qKgSWhTI5qXjF8FaWFgDkD0EQiy8hr2LmtNSn3JWQh9iKxcyH5T6UpVEmmV5?=
 =?us-ascii?Q?IQB1emZZOl6FT3xRVDHxCX/ATUc8k5yFpM7Z5K91Ahsg0pLhGw+u4Oq3LWTT?=
 =?us-ascii?Q?Y9IlYn3lrlvAY4+n5fv6PvcM5dIrQSackJeOnPOO6zKef2byKLpAgRv3Be8L?=
 =?us-ascii?Q?2t8W24aOKItd8NxUxMOCtipVfQw8a+BqFLH3OvXOOzaHK7mlZT0PAWdOvrp+?=
 =?us-ascii?Q?F7pO8ZpJ7W7KGn2fcxFh3VkCqTRIYPrVueE4xTzH7VM8eMaI+x0d9ayjRCpE?=
 =?us-ascii?Q?GgPz2KVw3ud3wA9IwU21FPBOrvlWI3AZpCGGZebWzeMuV1pcP5XsS1ETx+RT?=
 =?us-ascii?Q?rnHn5KrIj6get/MjIA8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7142099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MkBvPzNb9HUO4cLMc6rFiBXQfj2WCRCdPbzER8xAVKH9ZQL1oqudQbfjx8k7?=
 =?us-ascii?Q?AKmkwo7LipaJmiO/emXGn4ooU9COFomVMLzGk1x2LOxfT0rJkQE/XXs3WItJ?=
 =?us-ascii?Q?4KXoN2q35VvIoR+aK07alPoiWDtyxyst7MxRJJZD2NK51FfYDOa/tXmAbPml?=
 =?us-ascii?Q?ArwJvHr5PlXteqWfdXDAarahsw9kYc2rM0+Ua6HT2Xob1tpbFqunqWR1bmku?=
 =?us-ascii?Q?IPdPXA3VZ7GXbKio5sQ8RZ+0awAdbR3qq0nvRtpdV0VfARBbp07+rzJ6s0DT?=
 =?us-ascii?Q?kpuZaQzWsSI3MiQR/TDcDKqisupCSPQ2iY9WF3nAyULHNdcVxlSDfKJz3wqw?=
 =?us-ascii?Q?iwKhEcCSKYbBLUnr7reTRdUqTPWuQR0YasAUdfBLGqe0e0s3eeTIhPt6ch0Z?=
 =?us-ascii?Q?hcShf1Ne3FL9d5YKaWp1bNJZwo5yeEN1IdQoIyuKT1FwPq4kBbYpNlFzpSaY?=
 =?us-ascii?Q?1SSPgsozIAO0SR52ukrdATKWD8SghIejT77rWOWPehW9w+nwvd8AhvC5jA2d?=
 =?us-ascii?Q?Sj7fagXIbFRavC2X8/dUnLEMv7lNpS6oIKfE7wO9AUgcM5IPlqL1yrypD51P?=
 =?us-ascii?Q?OKNJFQON1vuMNTdG/bHdpHCmxZiDw8lDzTId4rj2yE46dy7kgE2YmnSCMfGZ?=
 =?us-ascii?Q?Iyo5uH40iIkRH8kKyW+wbkhRZ9dbiaFOu2+/7olAtqFxgPKvalQ7U5wrGB3H?=
 =?us-ascii?Q?rdprbDfEtl5qe9IWdufeB1q4iUz/lErNeeJI8ORZNIhEKZ4dyvDBM9wBhJVV?=
 =?us-ascii?Q?JVVIqHGxojlZqA/fNSHLPfhw05uKhtUvSZUTNXg3Rg+1g2XLfskOGFZOm9LB?=
 =?us-ascii?Q?NXELTkdT6pVAR3KJJ3ugc8dMfpEKvuzi3X3bdSyvZew8FvSQwi1aIJlzUAc4?=
 =?us-ascii?Q?n8ew5y/DxvP2wMRDyHxH6/uAXR0jQRJD92dV4yfjp13tFW2Z2x8Ev9ag4Cfg?=
 =?us-ascii?Q?A/tRbraRGOTbaUmEgH6UPPSMAMHrZaRRTgvjeldML1Q1ts2LvliGmni4ai1Y?=
 =?us-ascii?Q?toc37h4rIXO/m6476t9UWDSwKolBBtKvF5mlEKSwmabKke1WKJDkNjfbY0Be?=
 =?us-ascii?Q?oSWuo4H7vE8ITT5I/ZBHhonr53HXGGtn0xVi7EYoT1LKatbh93KFSdXSL+Yn?=
 =?us-ascii?Q?CGLVru7qkM2Uwgo0jaA7UhBuF0+ECNhG0gUG50xaPrvADikDsGGs/jOyXiiy?=
 =?us-ascii?Q?Da193Wa5iepUPZMDQDBsJJ5+hVxGSt0vgv+EAVXt8spOWZ8Iq+JtjaTB8n1A?=
 =?us-ascii?Q?udDAr7OUdXzq10NlzsYJO5RZnwKBukjDkdZAu8Jg/0fEs0N1fB/lxdIsQ6Uo?=
 =?us-ascii?Q?KEOCfkkJHduAGPfl6+QLPZ6QoW3EOLiMUrwWE2cZTpctEGAR51cULKChvYdI?=
 =?us-ascii?Q?zdNb4y82dMXjw9ndfYJm9IK9EdNCnF5fmLWba+YX9imfQHN/wWdg80mkNRhn?=
 =?us-ascii?Q?i4dJ10Rkya57GMmuasg7zH7IjUg0EitA7djPyINQgp6kgPR2VichZZ6Io5vK?=
 =?us-ascii?Q?8jRAHK7WmnD0DfGsbo3U/m/S0JISz4uOizLseR9zsPVSbccbrKinvFCl9k9f?=
 =?us-ascii?Q?38WVb+ebbqxHl9Bo21fVHpgtQKsyvougaXwZv9+S+RAUtUNJ8FTLMbcinef9?=
 =?us-ascii?Q?i1TaxKLi6gBZ2CDPS9UIUZMuiKI/c+QVBZ1o7aS9qQKKDod+mUGaOeTYfR65?=
 =?us-ascii?Q?z6VsLa80osKT9dU9qleg/SFGn6phNysP5U1WeFMru0+rTwrp68yTv/8hotFU?=
 =?us-ascii?Q?EteOWM9R90wmNj581N6GZ+FscWVVvSA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9670c3cf-0109-454b-9e98-08de6ee9fa7b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 12:33:54.4068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOZCFDafCUerjDxQKhcClraR/cF4UZjJa2ZVvILWtdhRmtK+Dl6JLaqKDeq7n2Snye1i0MDmWrnsVbpZlfAXDcJ2gPLjIJe6qEaYNsfaZGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
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

Add a minimal stub implementation of igt_load_igtrc() to allow lightweight
tools like lsgpu to load IGT configuration files without requiring the full
igt_core.c and its heavy dependencies (Cairo, Pixman, X11, etc.).

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/igt_tools_stub.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/lib/igt_tools_stub.c b/lib/igt_tools_stub.c
index 9a0ec6217..ccc393913 100644
--- a/lib/igt_tools_stub.c
+++ b/lib/igt_tools_stub.c
@@ -22,6 +22,11 @@
  *
  */
 #include "igt_core.h"
+#include <glib.h>
+#include <pwd.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
 
 /* Stub for igt_log, this stub will simply print the msg on stderr device.
  * Domain and log level are ignored.
@@ -49,3 +54,41 @@ void __igt_fail_assert(const char *domain, const char *file,
 		func, assertion);
 	exit(1);
 }
+
+/* Stub for igt_load_igtrc - loads ~/.igtrc config file */
+GKeyFile *igt_load_igtrc(void)
+{
+	char *key_file_loc;
+	GKeyFile *file;
+	GError *error = NULL;
+	int ret;
+
+	/* Determine igt config path */
+	key_file_loc = getenv("IGT_CONFIG_PATH");
+	if (!key_file_loc) {
+		struct passwd *pw = getpwuid(geteuid());
+		if (pw && pw->pw_dir)
+			ret = asprintf(&key_file_loc, "%s/.igtrc", pw->pw_dir);
+		else
+			return NULL;
+
+		if (ret == -1)
+			return NULL;
+	} else {
+		key_file_loc = strdup(key_file_loc);
+	}
+
+	file = g_key_file_new();
+
+	ret = g_key_file_load_from_file(file, key_file_loc, G_KEY_FILE_NONE, &error);
+	if (!ret) {
+		g_key_file_free(file);
+		g_error_free(error);
+		free(key_file_loc);
+		return NULL;
+	}
+
+	free(key_file_loc);
+
+	return file;
+}
-- 
2.52.0

