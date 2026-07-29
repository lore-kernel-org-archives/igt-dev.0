Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0BBC53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A066C10E4B4;
	Wed, 29 Jul 2026 11:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEdWvHNx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE2710E4B4
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322973; x=1816858973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1ZcfxZRAM8oCYCEniU/IOp+v5j8pfuNTJ0hx5aoinCI=;
 b=VEdWvHNxBMnQNhCa4jys3ve96AsrSW9HkcQxfTGwshu+me8/dI3WmXoT
 gshilEXtuvw0WfvB2Wj8x+auw9sA617ANtMC9K8iKLwDfVIyexbK7PoRE
 4L9/yAWlV+mAOfWr6ODqw8saOiR1oJqZyqclzoFt5wa016Zuk5J/S2pO2
 NPp5yzAuuEXddbbJLiKDASnafEvK/ett7YmcCTPvTBC8QbnFEjfJntxPL
 RqLOOtqqj93XkSFt3+prNEvFU9pZe5kbuBvwOs81qodzNe867/cYMtnQg
 SHwj2vuCKUamMaM+Dx2/ZPyHgp5mcd4VbWSSzFM7cPvmiPOPNwZDFOyxj Q==;
X-CSE-ConnectionGUID: krb/JCjOR5+0zSCMrgtZuQ==
X-CSE-MsgGUID: BktrTawBQfm7wwPhcg2CHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89743455"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89743455"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:02:53 -0700
X-CSE-ConnectionGUID: cYcPHdBITPOCX2AeE9A0lA==
X-CSE-MsgGUID: WGqRa4NZTaWXl1FFlAQjfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256652463"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:02:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:02:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:02:52 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:02:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjotMfAawxaWjvjumTjnDCdue5rrpqHAo02c/R/n3RX03y/RFqXRf+X31yN6whYr1rXTkEkzMYLla7uPm7df7F1kAqu7hnpDnohXoR4JTMp+1DDPNCnsDmL9MFy83NTbIxmJH0Y8qaKWUQy0mV9IevRqFyFGNvTRXDOVXAuKfHIzs+AIBS1Apfov4k4/TNzG4hE0t7GQyaYX17QbrhfxmUPywEM1W0gTnVOeKK95Edo34FZhFzmDqHvW2DjN8Sg012ZchQS79J2kE7SeqfbdyUDM1nm9p7l6WL0fYbLJRxlhB/exKiDi/hCQQcQEFm9+N+rXqsvwdYlmvuq4xa49MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H4n2L/b6++tRwrLByOZvW0r38Y+KSm8SXN5nppbmaU=;
 b=vcscXkCMuUUAN9VBQ6ftc6yFP2hWUIadwH3+jdgVgeZjPEmxV2ETvPKObbUuSja1ZrXSlhv2ULLaK42ITvnFUZ4ia9HEycBvQz6taHFk2lR65Hm7MhE+FHatb6VGxaL/s6A42Sf4eU+ycSCRLR6M8coGDNHp7lsOhRp6do95uZD8zSpkGOf1bmfZJ/jOyhtfAR/6uBMr7gtTmOjlYoIg4k8QicpafETJCHifmVJcGX9Xb9In1HWAzwFFLWEn1bt8jtlPfgs1S2U3MNGOCG9Sbf8OzSC1kcWp7mesFU0K8dg9MPkGLRDHuTTOo5uca3QYi23zhWOULhxnBp7KnwwXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 29 Jul
 2026 11:02:48 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:02:48 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 02/31] lib/igt_stats: introduce static
 sub-library for tools
Date: Wed, 29 Jul 2026 13:03:19 +0200
Message-ID: <09781f7505b66627efeb001534af8b749dbe944a.1785152675.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785152675.git.sebastian.brzezinka@intel.com>
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e131b91-a2cd-4515-2668-08deed60ecce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|10067099003|6133799003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: Q5KTPuSgk5ZSRCoeLG1qlK5iLjsi/OyQdzeCA8Pe2VR5JehWdfL6R8HYrYnaRsJNTNIIodFt/ccKwMR4a08ldN4GyMUZ3k60LGsCvf5ibJmnxogf7aAp1Ns6A9MRjSwMGUKpfJWwi9D0STZRBtXmaO/6a/KThdaEeIM/oAlPas23oO1TG/uHYSm9F9dh+KzvlSQdnGagsgha1nTAZCxDW0702M2axLJYp/HjBYKzSZwjSs8WWdlS5vgd1O468JEcSKD1OYWA4Pv6ItcvQ3SbaSV/27JQOwLDOcpOdPqdOhMpLjPjMwU6arVY4W2BYzI/FO4V4a0AneTsIfi0+3omSpEP4YnJX7VYhfLaSYScYki2+cVoZFgPE6MKAidGoDs1qgDnpPZdiNgY/HTdrQ56mETf7i3NxPRNI+kLkuXlUwQd+kDzxJoJSoaI3VjK6GaKeMtHuLMg1JGbnOluH5t5ui2B7NY57J0Jd35RjOFMYs9s+CW1xWYaEAX76Q1OFSkoljAan06rX/OtnOym14K3paqy3sk/YyMmILW16R/y+RVseWwicEFH9urIro/uMJ3uUd3UVVYSnG/700ZCVs8fM6zLO2FuPGLjj62K07ULSZJCmxz9wL//1dEebSa0/599BtzdmUmQwJtJ6sSB952AlUwq9B45tjAVntOqyAQCOPQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(10067099003)(6133799003)(56012099006)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5NiEHUN4svmtFx0SCkqGIE2QO0RNCtvGg67ZSOMb+naYazk6l1nOZOYhl/a2?=
 =?us-ascii?Q?TaiDK8VD/8or3u/dEHjnOe/os250MO/0RsyyzvpDVmsACOvcAtsAkKLuFNFa?=
 =?us-ascii?Q?0N1LdU5yFMAAJ+xR6r6eIgprLQ7J07tFfTvHjzuV7AkgWXsnvjIdRevQCOLb?=
 =?us-ascii?Q?8dLyzCR/mQ/4Q7zd56am/iqHrNLZn0RWSp292AJGAtNYKjx5NQJpd9Uw7OnY?=
 =?us-ascii?Q?Il9o+/ldyiMh0L6JRg8oIAIZxv72IB0TdExkJtAtchh74/Ugd1G5och00c6S?=
 =?us-ascii?Q?p0S9Z5h/j4WY0p3oMJ+7v1CJBhuTBMulHiyfThJstVrsbl7CCU2WUGglv4NS?=
 =?us-ascii?Q?zqplzXzG2EEbGTEfuJFOuF3lrodpz2aAvJ4msbw3G5EEj/AxO3muykhY+gX+?=
 =?us-ascii?Q?kOjdff3Wo5SG6FVwFyHHqjQyH2j4olcueLV4P3KpnmyLtO9zxnPLgwo31Yzh?=
 =?us-ascii?Q?wgB+lxtiPyqMW54ydOqmVg6f+LMW+oPv8uz5n6+2QF38UFF1pkqUeVEIDYFJ?=
 =?us-ascii?Q?3rDh/3/XEFA+xk9A+I2qMtI+52WHqu0UeNP5FO4dyS/TXs4ZTHb+LVRZn63n?=
 =?us-ascii?Q?ym6qthi7yO1Fscu3mFN4mXj8NCny26fh6DJJx8yyGfKhVs8pw61JEVHTreIP?=
 =?us-ascii?Q?MvF8iUUMDfkLWFs0jOSm79m+fq5M57HY/g1BmpQCQTnxKK9iLP6zWK25wFBe?=
 =?us-ascii?Q?194j6xuKfJtZYV4noUHGZm+sbpA8v0TJiXoVAFLERR6SFQ0Kc7hlPnQ5hSD+?=
 =?us-ascii?Q?Iu2O7hvdyLQ8J9jP84SHGx9cor+pnUWkfWU+DIC7cg3aCNYYH4VUhRNURUpv?=
 =?us-ascii?Q?2/4s8EDHKxVNzSTMWIEa31ABRzlV82qThX964iKyf6p7JJH4qfb1Ax9MPxcv?=
 =?us-ascii?Q?1iW+oCBETFSK1MwSjBDzsjP2UsoG5Bv+AZHldXf22EDMh3yidEvFAMP4BnmC?=
 =?us-ascii?Q?pJXEu2/rdNsvAGmdVXWr/duv7BGvRxrIAVyS/VMm2ipNExtT3ez8SJSrtHsT?=
 =?us-ascii?Q?m5jd07mEVUOY1ImkEXLCyzT9OA+SGWEva9T10XEvVi4ztn1SOxklSgR1o2HL?=
 =?us-ascii?Q?PiylIIqAp9ZcnlFd8EicIxRvim4E6I/E+BPWwIlRabQz+eLJbNxorWO5pimI?=
 =?us-ascii?Q?m3uvNumhG3tl2BoeWb69E/9Jgjqq8TwlrbT5vOk3gNUmZJ+gjhRgK+nn6Kja?=
 =?us-ascii?Q?DNCmmtSApOoVSq680C5Ys3wKcNmtEOAEHOUbEbJDTDmrA5lvSOqXusbOFiaR?=
 =?us-ascii?Q?c7xCPD7WgJd44NBhkWZ+V55RVDzjzyHTgXJmLeNRTPL0JKgnkr5Vz0eGHpzi?=
 =?us-ascii?Q?+43rjh636ILoCqMmyt+q7iIC7Z8wLNKzqJZJQL2IAJl6NrmAzjXMdTRIuBTQ?=
 =?us-ascii?Q?+ydQEvQMiGTXCcq9tD6sHWZNtXJx8mdZNiUv2u1KXZwqbmV50IpepDMwx6pj?=
 =?us-ascii?Q?/L8YBKHsAWDYLglQOLiJVsGx5sRuHqyxEvoipZBcjHBFS9EdOPYSelAmI3Wk?=
 =?us-ascii?Q?R0ZtPXg5g3PYHUxv/mxN0BVNJYO0O7GvZZo375cfSWQJnruFyttpET2FcNFX?=
 =?us-ascii?Q?iATOuS6yosNZJ3vxrYzl218+/6bfezLISbdBBr5efv8UktebH5DoQUkuYZpd?=
 =?us-ascii?Q?DjSZ/JvqcpfMDkN3elk2CzfxAKihS6HY77BllWzsABQ7QVx+JDvqIASiZadR?=
 =?us-ascii?Q?ZyUe+oe2x16TEoYBAif+dNXWIQUYHqU5O6YsiuIveg2LpJg2Pn1v/7yNTZI8?=
 =?us-ascii?Q?4ZP6zOtSk3qxKUUsjpcjycEvKzV3zCY=3D?=
X-Exchange-RoutingPolicyChecked: GioOl/IJV5WLadYEY9adbxaRNSdJlSgixYeM7tEUJcEpODlGAhYyFBsUxxdzTMx+x58xgvC1BCk29EKfVPEgGLOBjuzr+S2SONhh7D7ziCev8giREgDCd7ilppu7+J1wrmienLPVQ5YeZEVGGJR/RU027BQxYAOI45mYXdqGt+nMW0QOXT0Qg56PYrqtAdwwVuOd2bTJZpoqe5W3tRDXxWq8PtwGCsKNQRVGI1wlYv26jHFshKde5ttViPazJq3cuV56HzUW6YGwjlXTz0eLhUEEzb2/lz+4olkY9pka1NFbFZ+Np6UsRHpn0dRtBpLV2WjF0bzMhPIxk/pLWvHEZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e131b91-a2cd-4515-2668-08deed60ecce
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:02:48.2155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKmNTrkyemIYu4vA2LsD/tEvMvwfg2f+Bwt4yrmjJr1Aa2/D67Of7L/Y5AS5ug9QDYxI68ppa+WXMaXhjujXhmetT8MUkAwEcuP/KNHFEDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
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

Add lib_igt_stats built from igt_stats.c. Tools that need the
statistics helpers can link this without pulling in the full
libigt.so stack.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/meson.build | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index e95b29d49..a57c1eb8d 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -397,6 +397,13 @@ lib_igt_profiling_build = static_library('igt_profiling',
 lib_igt_profiling = declare_dependency(link_with : lib_igt_profiling_build,
 				        include_directories : inc)
 
+lib_igt_stats_build = static_library('igt_stats_tools',
+	['igt_stats.c'],
+	include_directories : inc)
+
+lib_igt_stats = declare_dependency(link_with : lib_igt_stats_build,
+				   include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.53.0

