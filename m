Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA7BC44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F45710F033;
	Wed, 15 Jul 2026 12:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3GvkEus";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59A610F021
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117713; x=1815653713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+O1ES/LlQFr/vtmlagqcCXcMi+CQfjdhchonTqp5PWg=;
 b=l3GvkEus6D2wGMRBRjaiw8sfGTgBVxzYm3hieR8famvchmrnbdg3epUv
 xG7waP5plUzaBnnlKJw2jgOXNCPIDjSus6ziy8picMr57v/PsGYDXzjdx
 UDMc7vT/NZOXRVU2wU8Ghbc5+kntx5mRetHDLmYn4GAsnuHG3cSURrWvf
 Pbpubkl/u+vzqhIJkVm7Y9jCjLLRmucI6x9asT1Q/dSbcwQHgTRwn4YTP
 HJ/dTavm7cOGan5nZwsGrAN9fTdNsupYSGTHHoaQe/4z5AnW2PJrH4bYl
 XuDeDHUeUrlYDbW4NUcyi/lU/R1W0SpioKJScXrH2hDs0GDVZrPyfYKrz g==;
X-CSE-ConnectionGUID: 183MurnpRE2udnBSSNJRTQ==
X-CSE-MsgGUID: Za2+ahveRAOf+bk+rEPMUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84607002"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84607002"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:12 -0700
X-CSE-ConnectionGUID: 4Xy8Zwf7S2u6hhyg8iN5Gw==
X-CSE-MsgGUID: 0M3O9JHQTY2bDHPP2fniKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255659453"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:12 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.12)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bB7g2yJWbmqSQrxzOwIjy5oHetPpP+v80UfZSqVUQ2p5chgZlKgsGPJWytzgBDbwcIzgHejeL+Px2J1AR0Oosa1oZUzgA057iX5iNJ648GiLDlfH0BaF4GUGq20wSN5tIC+U1Qr8mhwHW+wxOCP7EbNlrl3nGRMW5ic7wUZQ7txJz5N9yyH8CDNM+SokeUkK0rmfc0US2wyX45ZwqtL4FKC5dwlCs/T78enu0DXfpyCKCEJYKG91fIFHPxM1SJoCweyEReDKXPd2iFS6qEeV6TG8malo4KZhbyB3grrIItkE6U0aZjK24+L83gNS4HCSkAabQiyq7KvZh8+OBbI5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3/VxmLe2bydEtiL3uhUzQkL2rL20DNn6sYcXhtAEMU=;
 b=mFKH4Y8aSzZbdvOB/x69QFlTcr+Rmh1giGdfROpHBn94eHheS2zBD+uVsizIOZQZ18yJONGR+H/sPb9qB8bDwkNVEg8hyEVHjUIYfnpjIECuYUuEPdFuxYSkH6Dil2OydIzYEyZ6SypjrnuIXzeaeU+s3Be+FilZUSUHuiwK9gqspg3WbnutGtWg9oOPLkQSlJZLAqCc9FpRmJ2R6dCKdozxi3/FavhH3R6p6ZoaWtDiQqGHiN+moQ2ehEF4rop6nwijY+E5qjBbwbDRJ1Tyrcdf2cW9Ukl+aDoG2fW3Xj2UvUCSOEH+A32e4rDKBTr1RMwa4O/bR/OT09XdY5ItOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:08 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:08 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 07/31] lib/igt_device_scan: wire to use static
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:17 +0200
Message-ID: <2c6063b9fe9ba076bc3d7b86045dee13639bd9c4.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 0774b42d-a1e6-4b14-7a1d-08dee26ab621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 4wlCT8TeHBZLG/Iowzm6MzdchtF7+TFqz39vxHRAu2V/br+OE6qaKQNkqPmM8fECfE9DzXDO2vaDVa2nqn+57ggUWOYQLVEBuE2ViQp5TX+e8ZWjU4s8dt6FSpr8ErvEvjPGzEOBCS1tVzvnbxufhhJKlTtl82ZSwDA/7snrBXI2qgF6cHt1MRZxjClefCqcEmbDmYpP6lLPMwD1HCTO1BzfBOvFZivmv8fUaTQZBeBX5bDoyBH+zDwHueI+5b3gSUl4yJm01OEseTcG/jTUNJFUTDQrRIVzpjdPHPj6Jivw+rYj9xHjHfTzu+bcDBwMJAOtncOxZsXmzLxCesXjcAHi3ZQ6pWpu+Q4ovSH9KhNuhmw7YT1KpCHnJUeJB+ysSUGuRBjmSP6iCUFY40aWB6PcWnFLLHVi7YIenhtCDWD5TlRrDUnnsePE1Xc3T/hEqZncn+lUEndLD6eUW6iSSzGy50aduMAOCtycP1Q1ejFE1yUpWFIRaGN1uafw+csHSjZm9ypDd/PixoxDSLhRH2wEdGOH2C1hG+L+bCZMgLr1+WxEGxEGk1hYbRCZs4fGkgDekzVxWYr6vTQ1dZXyBfwKD9NB/E/QS/Q3aJk6HNn9ZxsEXBw6YPUrfgv7RyRZqo1PCoHHzaQ6Jv9mIbXzm2a1IlKfXUM1SbkxD2jFTqg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TRJYpKSSzGeA7J3TcDSU7pSU/YJJZbJCk0xtYcnpuyMeSWVM4TfSrrXS7sLY?=
 =?us-ascii?Q?jC+OvkKLEAR8Wx62K3A7Tm2ZF6qS7W+eCqtVIpbfsmryJnjTPrVUWBr9otNf?=
 =?us-ascii?Q?9PCjQ9BmA29UCLV3NVMkxvNxMAhqGwFFraWjQHh8nRVGF5kbpY4tX2Wybuz0?=
 =?us-ascii?Q?9lfS3tDLFPYg3MGe+ngxkaOac4BaGJNlw9wEuC2mjk9dgUrhE4fgO4RC2B+W?=
 =?us-ascii?Q?eJnQjcppqKrutRxPiU0IQ5Qvtv0qXosK1v/Lka0p7w3m0KWVpc3/Y5irpo2B?=
 =?us-ascii?Q?T6AJBcFN2yxK82ev426C/HHlbC7zpfoRJvwxnEKmeVF+McKAogmmGb+jkJNr?=
 =?us-ascii?Q?uoytGsiyGDQMEEhU42W/y07RAp8vg7x+nUI88KW2ZMBpFhGW9JrL64LhfIP1?=
 =?us-ascii?Q?Bq02kFfqw9Zi9UuaDwrhKyYCDN8x81h7/+/E6g7mQhayoF1HBJB0vd8PuCCn?=
 =?us-ascii?Q?PepXhFZjHqlRopJdz8cqozsS2aZToGvoz6wkDZO/7ulffoe4csLuhv/R2WDP?=
 =?us-ascii?Q?Gvt/ZZGeSP/O/wcfPJP3Ua7wdl9aKjGIigRw6s56zxJa9oC2Lzgj/f7t2TaM?=
 =?us-ascii?Q?XuyzapNS1pX6Cd3g0r0FODGcu9mhlKVCVfNCB0ueE0f2FbjVqNJxvX/tgbbW?=
 =?us-ascii?Q?VnZr3KjvUOe9VdJ/VytXgflhZwQ5ucarL2lN9ZDe2iQs9fWaF/VjNdKrlMnL?=
 =?us-ascii?Q?W/vS8kpjnUMTuY0v7Gtw53JkNKgKxfjXGo2aT5wOT49btKoCd7JJ5yoJexkp?=
 =?us-ascii?Q?sVRUQ35acW82tq8BVxQLJySX5olWtSDh6f8I7u0ahnstwOPMJbvoHj47wpWl?=
 =?us-ascii?Q?ihRhu24eWwmpBVu0CKt3DH3GKK7SQioFUVErjP2APE841ARXCoSo/ApiOudg?=
 =?us-ascii?Q?Vvb2fOSI91ZsP8hMeax3q4PqPY47Wf15eC51WGiZbdtpibryekGqlro7Xu1E?=
 =?us-ascii?Q?9rUvJeNEq4vpPGKX79lzaR0xbjbiX5zy0FcgY1+51jl32KxOulUHUGHRkVAf?=
 =?us-ascii?Q?1DZnqTBoXakFdt1e+nJJeaBoUh6YbohWBCL6lYJ50D3/HXRztBPF9SoQywEm?=
 =?us-ascii?Q?2EIjS8quhoTCxQ79UiBV7xcx/Vu8Kmv+T0OcmNyTV2V12tXnRIgPjwEUZxUG?=
 =?us-ascii?Q?sUUyejmjR31ehI9HIUEa+Q2uNV23cuNehxVvTNSl0xMebZEN/kMj5ZXce4jP?=
 =?us-ascii?Q?S812xAMRYT10lC+OAUBOp6em+1IWO4/HIiITvvetCRb6Jv4ktYMThcxmqj+L?=
 =?us-ascii?Q?/I6wkJy3bSsHAiCk7/xm8oXr5WpBQ34pFjfxQ7Rv0V8oqTKCGIY+CSyN2dJ0?=
 =?us-ascii?Q?HbK9qkUfz+4aiyruGeexWSEngoY1Dm3s+ncIRA0j6BGRS8AWh2SXMnOUM47R?=
 =?us-ascii?Q?o6sMD1zoCJshm8Y+9hFpPFrNBPt894wAu2mUfe7P7ewWYxY73vjoGsqqkbAE?=
 =?us-ascii?Q?32/Rf3jaQjbjukwq9De2QTPYePg7SbCF3XNDEHCDVxxZVpIX0aQJ9bmJdqtP?=
 =?us-ascii?Q?EEU+ZGkeESPlyUSUnMWO7Nv3QkIbnnnLTdb9Qwzu7rHYU0OIV3VWoZNcJ7KS?=
 =?us-ascii?Q?8ZZyyurNIVbAPd713caLSMDcKH+TPrC+PaSHV9EPdPUbF6WxzXdo9XrPnF9r?=
 =?us-ascii?Q?qxwECLM83F4e4BfIgl3XdjCjPthrtHN1oiGTh2UbyWEoiMHbqw+p1vh8DT0X?=
 =?us-ascii?Q?H/hMYLG3aatFVLAQvBYLminn3rfSzlJUxFfCaXTD619BfklRCs/oU7ccc04Q?=
 =?us-ascii?Q?Ce9Aq25pMYGuAZS1p249Wm/m24SQiMg=3D?=
X-Exchange-RoutingPolicyChecked: Ww2Yk0dv9KpOVSbTP4O8Xq82JC7whnjKaQvHn8r5cg2AEHFa5foGeSLTeksQoRV4RFIK8utZuLrmKdteVyK6uFDSIPbiBiV4vm7+u5bPtZZh3rPgou9i4D5DP9kKvrqAWDE039rkUKH5FfhOQk8Bz4rPSOGut5qOqJ1WoJ8HlV2WrSwX2VY3ZXi4K41E/cFgsVGZdaqr0MePgPW1NKUoclDmD7+612JTKizafBkCwKAofQmGeu1eAnVUF/m7L2Tkyasf056RwS9mimCV6hr2z1UoR/1o8jhM5d8qlb+HBEcvR1eG+VvkK0yTcm529tD3TCfGX7+hG1ad3fGY9sfUHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0774b42d-a1e6-4b14-7a1d-08dee26ab621
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:08.4838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2nPJ28BafqegajkR03XUPFVQVIqtlS6pwegZa8Z3yMKgIAtjJjA6QoICQK/u78G4/YDuyPl3QHb3OVGB66h3gmFq5tmQYSoQyuv12MEJBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
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

Drop the directly compiled igt_tools_stub.c from lib_igt_device_scan
and link lib_igt_tools_stub and lib_igt_drm_stub instead. Compiling
igt_tools_stub.c directly would cause duplicate symbol errors when a
tool links both lib_igt_device_scan and lib_igt_tools_stub.

Add libdrm and pciaccess to scan_dep so tools linking lib_igt_device_scan
pick up the right dependencies.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 lib/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/meson.build b/lib/meson.build
index 484a912d7..2c1fbcd43 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -367,22 +367,24 @@ lib_igt_drm_stub = declare_dependency(link_with : lib_igt_drm_stub_build,
 
 scan_dep = [
 	glib,
+	libdrm,
 	libpci,
 	libudev,
+	pciaccess,
 ]
 
 lib_igt_device_scan_build = static_library('igt_device_scan',
 	['igt_device_scan.c',
 	'igt_list.c',
 	'igt_map.c',
-	'igt_tools_stub.c',
 	'intel_device_info.c',
 	'intel_cmds_info.c',
 	],
-	dependencies : scan_dep,
+	dependencies : [scan_dep, lib_igt_drm_stub, lib_igt_tools_stub],
 	include_directories : inc)
 
 lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
+				  dependencies : [libdrm, pciaccess],
 				  include_directories : inc)
 
 lib_igt_drm_clients_build = static_library('igt_drm_clients',
-- 
2.53.0

