Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B2AC44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:20:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEF210E126;
	Wed, 15 Jul 2026 12:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPb/BcVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D19E10F021
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117705; x=1815653705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=soQgu9B5Niksfj7dWwkMU3xtG4IUVA0TVtATFlJ3D/Y=;
 b=jPb/BcVtK7eWzfzJot1QEu+6XfyeY0R5AhKcKnQwgWFN5bVJx5P7PwJ3
 kxI4TFRvcIWgD/wR/ahmR6PY84c6w5rScZ0o/h3bF7HTcYOJi1tbAdR2+
 xpFqBYlkbqN7w4ykbY9wjFaExzXFoEbzO2zQ9bvFGVu13MBcwKHsH4WsU
 7ZfxfFaJHjqsf4xIQYxQFMLLTSgNJMAzvZ2o5S0jgu9VAlvtWTmD41j73
 QVpEeE8aS6g5+cgfkInHJkNwAcoTROYLYkMRPlmKFwYQziFk/AgMCMHkY
 qnMD2XHPoUNwchvY7H13uCtk7cewZWly0E//iBsDHBEv58aOckg202Z8S w==;
X-CSE-ConnectionGUID: FOn1lZBERXSbclgsINpCTw==
X-CSE-MsgGUID: ECGxzMZPTj+C1qICl9rrBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84606995"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84606995"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:05 -0700
X-CSE-ConnectionGUID: luFk3NnESeWclhHpL2V3Fw==
X-CSE-MsgGUID: EBSuLVvSRECxLDyHys/esQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255659329"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:04 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OsRnGcqQb6IBP3JrTGlM+Pq7rMFiWoj47W75hT1urSMMIb8UDlXjYoMytjGn+M2yU8QQFyJgRnSRecD5CIAUg53uwJdILG21wPAZtoSRmoIbK4Doe6my0rNoOBUnanlk0TDUtAKqVpHgEAIU2YsEx26PLREZ6PiUfvAnKIFHMhbIS9gyIXD6drHuFCy4TfliaPmLzGTRR2ojl5yApNpmFPpTgQqOp/0MyXgszxf4I7HCW5yeuklLp/2ZwX5FbiYLEcIC0zwFDOFtJoQDcVVfaEGwPlJewOX6qun7Aj9v53/Azif0uYD9UcvBaEOOaeTcqk1k4D+r8P/0UMngW8sEnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlnV6l5BTMl65oj5EUQmbFEGOg9OZpLuTxoCpmd6IL0=;
 b=lhVjEulrGuGvsEUexikgzAGeAQxVP8DUaDl6vs49VseSQOPLcpBq7OBgJWTptkqBo0CCBEdkqptXgQwnUSUvCWjPKQeb7SL06bmEMg8+krvfWSBOB3WsTLAWeEFhAJM+xDduWeWJbLymJpL2jWVtaIPHkdjSwW4CesFycKz+KxFXdVZtfQ0sJ/1/1MdGeOWFdxsfhVhDy4Gc27RhaUnxHf++EI2gakIhJmGS3Al6J5tpWYE5sBCzrHVg4WjdkLwMasAepBTNMtDl9vi0++Tk4uCWUhyp5Ar7r/yV9EFhgMaEM7hKV9jEi76qmpqZwl3E59WNtcWTy41M0/RVZU2sig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS3PR11MB9867.namprd11.prod.outlook.com (2603:10b6:8:366::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:02 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:01 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 04/31] tools/intel_firmware_decode: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:14 +0200
Message-ID: <a9e2bd71b05ba0b323cfaed16cda18b8ecfc6fc1.1784117512.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784117512.git.sebastian.brzezinka@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS3PR11MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: 97fc36de-1526-45d1-5534-08dee26ab223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: F6ATRVXnrGUvrkvof09FeomHt8AhSa2YitwP6zmsaGmrFDQ/Hr3Ssjcq5lIr3Xjn45wq8xkYEVWOCjGJB4oIlXLe5G17pgkp6N11L5FKu0fuiMKq10xuExf/W9mw8lzmTL4f9NaMNw2U2ATOAAVCMQ26j5LQa2DBjzuPpClhuNuwSjUDfF/ppfMRTkHKxQUzWVatp+O+mGhqFCImqGtnAazHdJ/Kr5titK4n6/3+87pu5uLCX8DZdqGwU2P1KFBLq18IhkLv/eRSQQZHXRImTbd0XbfRe0U6ot8O02aR79CaTXJ1fPs3E5q0HXAr/bQINjjo+wwwilX/N6vl5SawcUJcH9O4kAaPc4wtIyp7DlO3/YjkiGobmNB5MSV2k2Azs2Tvb9ZsQMLwLMrqb8TZhhFiZr3ZNrVI2b4NSBFAVH47feFBNVTAdIE9OvGcXGqUwGQAELXNfvgpGbF/a6tWzcj2cm71PVG9mz2ggjk6ieqVqaF+B8i+hBHsoYXWR1bVoBou5upzggwiZXIjbsC/+aToJyZRmLQvFrYnPdPnelCwhEp4GJZjBR0PH0LIQW3obXBEUMG4bgSSMPaDtFJJxMFtXpRg/v3jysnupsOc6lnwHjmH73L8IzmGU68469bwtXYibYct8Xg1/EpBWkuCCSJ8Hl4AkxfdRknoueWW9hU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uzqFK3ZdiZavqeZje7xDGVFwVFVuGOWKM/WZXCbLz9sVbQj3XZhCPqDMAq2r?=
 =?us-ascii?Q?Nt4fM4b5bbMQ0h8rB53tDKwPmL7KfertiG6HnvSngwFDpXDFWDdxcJD3tEE4?=
 =?us-ascii?Q?H9Q4TPiNYY2wKltM9d0F4J93AjlhUbRosYX2evikFgm3Js/8g4RGzLyNltKU?=
 =?us-ascii?Q?vrUpf3V+CoGVzA2pT4dE1LxDyrv6lJ5W1zswKHTXl4IQCZAN2wVOkwx995qq?=
 =?us-ascii?Q?q9qLqADf7RcmtyI1Pwy3V3I1uyPt4z3ZSgloMwB6tRmqID+E3lMjDCd+Ag6A?=
 =?us-ascii?Q?isQEdGetbT8E3UCh3sXGRh2KGgbGqnxS9taMZUpmrp868rQZJT6KvfRNPIaV?=
 =?us-ascii?Q?l0gjVeMtcFKdhu3VBZItPDWSES7pBzscILO6cD2S5bN6xYyuoPpiOVkxgoPX?=
 =?us-ascii?Q?UfD3CUOdW6IRWSbbpjsfFVNql4geuEcVN6tas+r8Z5TysTPKY6mGjyJnGWsu?=
 =?us-ascii?Q?ayb/K/UUXcO1t2nVccr3Da34QOhI7fJ65hK3WRMS/0u2RrtKkz3LD/GpXKwD?=
 =?us-ascii?Q?WkPM3Y9vJxt0t9qetQEpEco7Ca45c9OS2Aht+SICHuFom4F9TfpWBNGMOOp/?=
 =?us-ascii?Q?4ZquT/Jj/vyz3KP5xFbkrkdYc2zQ+vCQRS5dWaFBMMX9usj0WlvEBgA/vbzD?=
 =?us-ascii?Q?NJf3lmLfHSkzNIV0YExvSv7mG+pg8o3QQK8dX08LNtKWy0bqU2Oqv31ftm6N?=
 =?us-ascii?Q?Vvolk1hfpkOAbn6bqIKFooud/4lmoL31XHsJP/ILrBTNbRDxr6QD6tAGXhGi?=
 =?us-ascii?Q?mQ1VyZpKr/HI93UXbzKUnSDOYIKjUzphZPSl+tx9SldBQhGJIiEtKhkRL7aG?=
 =?us-ascii?Q?5Tql18EyGivWonlDJxtfXphR1Lt1vL0sRDJTQrT/FqZJdpl0WSqlRtkJr0Vy?=
 =?us-ascii?Q?ns8nt+sgQfK30XwpUyzcLjHP+sCk5n3hlGL6FGOxMSPPNnjjDZ+UZR/qfolI?=
 =?us-ascii?Q?cHVVuzzQKh7HQiWoGVDKHCc6KmYmJ34et32jmFWS8ebxEKcF5idwUFs3l7Pu?=
 =?us-ascii?Q?9BJY1e0wN6BOkAqnM5WuJUTYUE3NEHO8IWsRm0glm4sWxDORj501nA3KC+gN?=
 =?us-ascii?Q?7svA7DkYFqCGqWpkYLDyxplDLu5QuX2ZYaDysD8QHbTckSh6dFzCWPHmVzpe?=
 =?us-ascii?Q?dkTFyvyXz39Qc0dRkW87m02imYXjNGqMmL+sBdMyOTsfca/Q9f3F2gxFk7zc?=
 =?us-ascii?Q?P68rsn2ntOeiVct0c46ooA0R0evKprl/ZXt8poYYhYOoAU16eZzVf2zNmIJX?=
 =?us-ascii?Q?iIYqqRRllU6Mrsizsi5Xw9OHuNoZNCapY+QE8NmRcAr6wn1CCsEnb04wF673?=
 =?us-ascii?Q?SWhN4AZhBP385h0kgy2Fb0wwAQJX+3xcDoga+lWO3rgRgj0ZFrxP+vx4tT5X?=
 =?us-ascii?Q?cEuYlQBdTklYVHXJ000C2t52UNOlT7Pq45al5XZetVnWCz/x2+YTnnWXLiDc?=
 =?us-ascii?Q?wqrC9+UBQJVDdd7uBVPbT/rZ/TrOr6KWX9VehuIDNlNT9IZax1+KZEophp78?=
 =?us-ascii?Q?FzqFrFHP5S2hvrzvcDDEKbSFVbHus0VmwK4QvaKZh7NzXQYib4fzuvR1460V?=
 =?us-ascii?Q?RZ/+ee8+sm3HpHB5NiepulJZI7LHFS2B7OjhPPprUkxo98b8KY/RidDFDtSO?=
 =?us-ascii?Q?4JUAkG1XOB/C349GruropoK94M5/j836UGAptw0oAHmgOs5LzkpQ3TjNAVZE?=
 =?us-ascii?Q?AzDRLrG7qrVqP8YcOBG6LqZFz/X9LpJg1eb7gnGqXHeoO/qGxXhcF3CBlnah?=
 =?us-ascii?Q?81XZG4EMfivof7jGWc33hNioTer/B+w=3D?=
X-Exchange-RoutingPolicyChecked: ZRqVhPdRXh0KtEPyPejP20f/UlupOyFCkCMS0To2tEc2IAxofXQ+3wldjxaXgOlVlOCHX8B3FH8ejdMndnAe9q3QfYFSxdL+2yj78Wdh/tvNxrgRW9FZF23AaHc3oSiThohZLyRuKrcucCFi36d3JS9zyFoMBGbh4tgPuJddBN7Ky37TYhgJlCLpJlyTg6q2rB4chkTpQIz+wCzsBocaSgpM3JpkECtSe3QBp1MpZU/1jqWNZpMwiKZXCMo4cI1SWlCZAjmdchdc8GKW6tFOW61UdVZnaWW/Z86j1ljVsr2sr8GWdjcfT8TSwxt5X6Tj8dHnhrBqmD/O4pbi1QDoLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97fc36de-1526-45d1-5534-08dee26ab223
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:01.8895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgCDPbP/9x7/FysP8LIGZhM/G+vu+07xZSGkctwj4R6V4VdVWUwKvl41KIXCUYJldDLgdBCMIB/QG1Hh5K5gTngPCqBroC51ePpcHA8+yXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9867
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

intel_firmware_decode only needs the lightweight assert stub used by
igt_assert(), so the full libigt.so stack is unnecessary.

Switch to linking against lib_igt_tools_stub only.

ldd before: 35  (ldd | wc -l)
ldd after:   3   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 286a718c8..4c67dde4f 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -24,7 +24,6 @@ tools_progs = [
 	'intel_error_decode',
 	'intel_forcewaked',
 	'intel_gpu_frequency',
-	'intel_firmware_decode',
 	'intel_framebuffer_dump',
 	'intel_gpu_time',
 	'intel_gtt',
@@ -62,6 +61,11 @@ executable('igt_stats', 'igt_stats.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_firmware_decode', 'intel_firmware_decode.c',
+	   dependencies : [lib_igt_tools_stub],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

