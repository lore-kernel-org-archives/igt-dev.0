Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B842C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3BE10E053;
	Wed, 29 Jul 2026 11:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TygBElCF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0244D10E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322996; x=1816858996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HmOp61NaQy0PSU1k89DVKn2gozxHG3aBxvHv9gy8EJM=;
 b=TygBElCFm4ntu1V+YU+/NESL/hmmlPVvW779Mqk5AXitlBlxQQofGAFq
 5S0u9zr7AJvYPRLNPQrnZaQB1sigzYzjZRQUiG5tUnHmkf8tW/F4eKQSc
 QFqN9s1VlstZvq+yp4IjlDFe/kTBkVvB1/N2vDDu2dbq83aGSFlJ6Don2
 5zkZgzX1DwWJ6T7tcM18ir0XM+hq3qsGeBGoiWbdyAfg0PGCSeUx2dXFN
 esB/L+1rovp+P/HsZRw8OKypa1ef6Qpf4oGhx9T30gSh1cZRf2tNxlu80
 HGZb60iSHyrK154lJYMwmZ28kYDh9Ef91AxvnOnESvaYQB43wF8uk7rwI A==;
X-CSE-ConnectionGUID: fV96mFXwRBCpoIbhjlTCjw==
X-CSE-MsgGUID: jdXy6PlRRhaNpO2wkV5ckg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89743475"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89743475"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:15 -0700
X-CSE-ConnectionGUID: SOlRH6q+RhKiSIx0v7hXlg==
X-CSE-MsgGUID: 5SLvnxM5T9q5kVSnawaQcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256652723"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:15 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzCOwXsqqhBckLfWo9ggZaj6SMq9AiiHF/NmO7jA/cNnlftgE5gZoiuox4N7Z5glWQwUHEWJRwnTeA0TCFCRdGTfnpNKpTk/ibvkmC6jp6QlkvVWCeEAIK5/y+2TAkVjX9p026CyXiT8yhF61WgKL0krMjAMAI62Tpvr3gQOVkqMRM1AyYP/khmPKsIiRKq9jvzGK5B4TJo4UiPVeMaD27aQgU8kO3/KdEoKN5cbpM6slicMdeWqAhYYNQnEk2V/FkIDxBiUgDvmsDzE7dXKAdQgjfsao91jx25B9VuPqZT0G+9bygXNfvgY8x2btRPCgd/qfiBsspxL/qkhtHWp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5PqlRdFEC+87xBwQ3UKgNRMzKD7a36Hc4QKG14Ms14=;
 b=r6ZXdtV0s+4o7Ky6XykdL+CKW8PyaI62MuL3aG798XxZilXEJ6jDg7biAfigGYtpg5CbI6srRYUeHgiwYk2lgm40bB3yg/nAo7U0H8lGMOZnmyVb/iqPEccNjcxSuCM8PhzDg4Wz1/5UY91vkEwUTUsuFRhfEirkiIMhhCgGimRggvpnrlDDnfrekOmp6p6ZZAc/qxmfRMifeVeDHMYnYG38HxknBu9AYv3eevh3LbHMcacBNwRFXKm81HHHLJnFRsocG1GmMh+7AY8W1kxVFUHUliVc1/PJqi/pSUMr94WUs2V9aZae6MLowAOGfVrd301D1ZnoSvhVZJP8MQn25g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:12 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:12 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 13/31] tools/intel_gpu_frequency: link with
 minimal sub-libraries
Date: Wed, 29 Jul 2026 13:03:30 +0200
Message-ID: <cc5550d4b89b9ce64648ff1381af6a90fd2d95f2.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS7PR11MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: a4eab9b7-d31d-4624-2372-08deed60fb74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Gr76OodjjHvi0OUZUAyXg5fgx6LcmhznFWeRb02DXw7NC2fVAZ9oJrp4NnxqVmy7vA0mIzft3wF5k4LTrXuNQyj3a0uy4+Kl6Y535OTUgeZ9Qz8CiG4FS9zqeszxBpogxrANyEOAruJsYZvdua8IeQyhq8U14a3Iw8nahrApjuiQsdwQ6dvDIHN/U8eG0+gOHOPXMTdBKcTm3EctrZSpOmY0TQzhM+r12tnk9sOAyzNEiZowS0sIE0a/py/l66U0JJj7chDlpPuAp6xtuYyrjs8VgaQFFpvc4F/RltB8F0qxGJ4YB0pVZ5Oec5pFgPgTJ43iIpkQApmWq7O6vyAd6u0whRN/C7SQhAKKgkMcJocXr+inXAw+HEV0I+GLfVU7sO+klzheq66MJK6+HSEqJm5pSmc0oOOgynMTFL5wYQPG4kpr81g5Ot5pJh29xKRvC3v+SGJHCB0kNzcBkhnjqpP37miufCAMgjQ+SubNSeeTwB+YHn+j0WhdvWjZkhrW/z6Zf14rnrm6KFhibtI8bPFFGEQW+7vMqMrw0YHq9CmSvdt1cLZmcH2K1CoFc0rsSZFFThYH7gBRC8dp8+C4VgrgZM2jqMQvuApQa/ak5PZ0uC/x8PvZLRmVbaqG9JmceH2aUxh4px5e+Tn15Qi47J/vD4ti15h5wLe7Kuu3zZo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tvkM5jucNJ2+Vx7NY11kakdDLGOI1P+slZ2sUIoI8KQIbnpNkg0FyTWV7Qjo?=
 =?us-ascii?Q?+Uab3SEmCpJHlDJ/HB4PxK8+iqnM31JduwGavNjzeobJvQBnzZzCitA1gHA4?=
 =?us-ascii?Q?s4KIIVWX0whESeK0U8nY7ozcXWNZP70CXQbfV4kqBRSwiSsSa0eG0STp9EVf?=
 =?us-ascii?Q?ZP6k2SjQwBA0naapLfhfHZDJGrDPYhxMAmYB9ftk+s7yB1qkKMTOmUiRlshU?=
 =?us-ascii?Q?iHR/AV8EcdU8XfcQ2RF9R0cajdpac2zgNq+ZI29SyUBARsk3Ijzc+HXCLfCa?=
 =?us-ascii?Q?oK53OL01KQI6Bq0LDWe4nj2yedzGWbO7EU4Rg/miHRSZIgvNyUhKhuezBLRw?=
 =?us-ascii?Q?Uu83usCrYA9OLIRPCrBFosEnR5lY8DfVlrU1LxohYLMYMzUTQ2Xe8HDIe7DK?=
 =?us-ascii?Q?B4DzzQ/kX0ylMN+CPkBvUohJ/pxT359ip3UrHx+BEDcYBSZnxhUlQwMl5Xdj?=
 =?us-ascii?Q?jyxjCJpl2R9g+/mlXo5o2/rTOg8uycZzoIBIWrkSePigTTnrErEmE3OM3jUQ?=
 =?us-ascii?Q?TQOqWJhSx22HttTvC5asYveZ2uralKdD3m9pbY3XkfI3+jGXDRr3/uBATa+U?=
 =?us-ascii?Q?kVOYCjtg9QCZQgHeyxWLAmmmPO+NE5vzo7H0+LfAEzU9mEZEqzCXAxdvAsRT?=
 =?us-ascii?Q?lvQ2FAzA1J3PmzK5ZDBrBFe8ei6T0/KCFHq9fW+pMm/WkVXU6ynExyKTq0O9?=
 =?us-ascii?Q?w41ShBhymGNVfWDd6PzImqnXjfICq6GlW0yYli9/34ZI3W6kJLJA7M+qxpGG?=
 =?us-ascii?Q?P5CBkawoEOvfB3AwOZPJCHg7Z+8PhfbrpyD02Ho9/Mk9nYC+DLgpVE6pFQlA?=
 =?us-ascii?Q?hqTHjMPU8zqD6pdOx53zPb6yI62fTkPtzwSzBqSWG7Cyct7ivf9cd1X0ChkK?=
 =?us-ascii?Q?f/pmuUPZyhPJmNr70StEaEDtpqXFcxsiZrZoku21jgIQGfLvGw5kvN5mJGAv?=
 =?us-ascii?Q?eoWsVroL3fYgUJiKK87t/EWUWwfESedE6oAJw8GgwtGo/R3k/cVI0KlZh9DC?=
 =?us-ascii?Q?GEdoA+2i4vYesYHjf6vmYXvURAz/IAPMZE8yhZ/VqY0GJJQOrN1qFOOkcYfk?=
 =?us-ascii?Q?XTA+2Ka8xR+b7W4mbXMYeeo06WyoBD0GQ8IXFKDDqnp/eW49LatHouvk0doP?=
 =?us-ascii?Q?8dU0eRtDvMMk8ZLFaELbYBbKkqGL2gdSP97TQtNrDO/BPv05BRJg3ZZhf4KR?=
 =?us-ascii?Q?0ab7Iaouv8eczf/QOOgaj28c3+gQoAw3RQjcA/iavKiI6lj8/S4k3LqRbX8w?=
 =?us-ascii?Q?S9O26NjiwrEN6KefRE5p9DctHFbdmANCzbSkYZNIBv/tAbXAywGXHW+BeH0+?=
 =?us-ascii?Q?eeqUyO+ADkw9leFV67yOvf5UATElXdM4iPa5R6k2XCOqw0f74dieKCpF+lHy?=
 =?us-ascii?Q?/cQqpYu0d1laafATo1dmuxnMpdYRgy25bFeYjF+HAUelOMrEt8OCXoASdrnm?=
 =?us-ascii?Q?gLYGay4Fknyqn72iwdsaXDHsYrC/QlQrmwq0A+VSEhRLgqQ5GfwLfbZOWBIu?=
 =?us-ascii?Q?M9GdJG0fAGMTGzS619XWgYvmcOxLFC71O8Yt1KfxzaQ8w5TmN6kcrA8s1Kb4?=
 =?us-ascii?Q?ARpFwvRVDgtTb2kXnRvQ9BTN7QR2vZeQziSylG3mQoxa+gd4NxLJV+iX/aNq?=
 =?us-ascii?Q?qJUqWYm+fZVW+o8o+u2BDyTBNl8cqvddtZD9dEtQyTgBAyOezRxQdxlIvxA8?=
 =?us-ascii?Q?ivhsSmaoD01Y5tP2AtDmEp4wCa2GTrWnKPA7s/bpUsDrZNREVG/dFTHOod7w?=
 =?us-ascii?Q?QgzquT3LZC8GXQ6kdI2D20h4/G/s+OE=3D?=
X-Exchange-RoutingPolicyChecked: GVs5ArIEXbyYC3Fl1XWm1u2u8IQh1oJykwZY2NXVK2Psg/D5aiX0CdI5Sam90UKwPoBlZpinE3WAYsY3p7FoWlmBgNwhBt8PEYrhCbFGfVwI6hHEUVApdVi20xmbrcXE5obmb4RHzZ1EIGSddvvbANuAZnkylq+DNLcmLWZsiDlvsq3xX0amFObzX0v58MB0MCjX0Ofh7zdcy3uzVU0zVfItlVpMoQLmmotYlWmunL7xIF5FqQXDUpSmmt55LvwYiren/G+xv6xVNdoAeeVJ7e635a8sLX3s0TbK1MTMhdXtxBx6+5SPX62X76o57u9sJMlUePLZz2P4VOYxcYR7mA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4eab9b7-d31d-4624-2372-08deed60fb74
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:12.6006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zo30hRPylzWn9crL63BkXcePrKfIvhvY3QybJjQ2nX4HSPhUun3VKyU35cYC4GrU6hiysNtfiXZjmhkJjVKsH6H39N0lZVjZAhrVnv8iIzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
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

intel_gpu_frequency needs only intel_gen/devid helpers and a DRM device
opener to query the GPU frequency.  Link it against lib_igt_chipset for
the devid helpers and lib_igt_drm_stub for driver detection and device
opening, instead of the full libigt.so stack.

ldd before: 35  (ldd intel_gpu_frequency | wc -l)
ldd after:   5  (ldd intel_gpu_frequency | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 53aa31056..01400f53e 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -23,7 +23,6 @@ tools_progs = [
 	'intel_dump_decode',
 	'intel_error_decode',
 	'intel_forcewaked',
-	'intel_gpu_frequency',
 	'intel_framebuffer_dump',
 	'intel_gpu_time',
 	'intel_gtt',
@@ -66,6 +65,11 @@ executable('intel_firmware_decode', 'intel_firmware_decode.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_gpu_frequency', 'intel_gpu_frequency.c',
+	   dependencies : [lib_igt_chipset, lib_igt_tools_stub, lib_igt_drm_stub],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

