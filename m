Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9391FC44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DE710F026;
	Wed, 15 Jul 2026 12:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkpeqOWT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E9B10F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117737; x=1815653737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HQdFkdVfRyeSNY3TOln9c87NW+kwqiHrB+xoDahWxxk=;
 b=NkpeqOWT1rw6VgWbql2aVbdha0W03gFF8uIOd0G2Vp35Yryqk5xwDcrL
 ofUMfeTXLLCjQIiF58V5wA3wk8VH9E0USRQllMtqsT84xOR+/d+IvoE6G
 4LQRcCMxCeARRt/8AS15UjlZT1UO4gT2Y9VamffZh9VuQ5PSFRX+939NA
 vOpilTE+RhLwUx0Uh8+xloIMNblOxP5OjdcejaPIjBI4UeN0jDIPLrtrb
 5KroOuabIxhX5X4iSrHCNKRpTMXlEhC9uBJ0pu8oYlyIh+Yu41sVOYxau
 lvOvEPP/9DNgc0OSs0cQEOYAWM//rT03YPPQ+K4WwP1bZTS0/P0SLOyEl w==;
X-CSE-ConnectionGUID: 74jLWN7jS2Ozru7WqoqZgw==
X-CSE-MsgGUID: WwdlyORgR5Ka0cuBJjrHtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84607045"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84607045"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:37 -0700
X-CSE-ConnectionGUID: +WQXgEKgT8mJ5uVUMNROEA==
X-CSE-MsgGUID: avE69T0eSo6mNyIlNGmbuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255659577"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:36 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJl6Ycl0zAP335qP7E7y0l659PooaWSriVhmFL81fGuei3jCzaOV4dvV46X9TJ8m2uFL70NvinCOCZiEzCn5H1MxBj6wXQ/8LWpS7Hyik7gtJ8zEnQE8CrH8Wqg9hb4QRk9/T5BDYiQV+6eKBJxyqEyYGSd6iH7vFz9+8GkNyaeSnci6mjrWbRAyVJgG7NuKxKP4JLwbuciEcAydn8NAoevL6TGYsVLcIbsZ97jFy9Iid+ZvMCBn24J9+M9LS9Y0GG99YUXE3DOwgSo/dq1M+u6ZPIcGXDDveyw0tUSJ6v+oJVI97woRtpUY2Z2rjyLFB7eVlmcprQRp6oRMgRvPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/mvLNbOIa4VHdIZa9mfnZ75ZxHsoexdZKsqNo8rV0U=;
 b=aa4YoEAMTrcjF/C2RrgUBvVQjPuy+ADtpXtpxiWzKYu4Fev8GoCorOhwU6oTzjJl8so771szLcvN1ed8E/c7w1P7pO4kmBxAE6vzkLNfiN1cyaHAdaV1aeoh3CdPqyifkHz6egm3Hh1JRX9fKq4pUmRyOnk+1toRx8WsM8oDLiYOplZw4eomkDb5/4I9l3L/c2rubkgvnRjFs5PX8pT1LkRFi6SxADF4Va6mjeuM2fifvekzS68OL/TBKU+NPCDrbsB3ScIkRxL2oFVjOnqeVf0Zn2DmTJA8rchNmiEe6f1ot9sSoG47FXMu1wZQZGlPIASwsffLZW/I+Rhj+1RpGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:33 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:32 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 17/31] tools/intel_error_decode: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:27 +0200
Message-ID: <d67b2dfd656e75571edcd45e17ee1507edc9fb7b.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7c4d9b48-7789-4d20-6792-08dee26ac43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: uWIEBZ4v/CB8K7Mf7QZZfrWXcEOBDBPKoNOQa/2g96jghkHSEFV8WS+XQfzxnIT3uz/IyI04lCckiFg1W/UQ9gW208gPodaXpEE+MvlYmdmMUC258ev35QopfAc72CYwIgPfKCi+qlwKWQesAJrCTobueXmKvWNbNE7L8nuPMTM2xpCvOk7NhTGPDMcwui2JsJWH3N4enZV5Qyu9vjB6XX87H90NvAHJ+Q3ICr7B2Za6z0ahW6JnsfWt0RcW8OgnkDYV+1AkO2kyVXfBDkXx8R1ZP6KH927idkgT9chbOnZJ0vzp8EGF1wBWhOVX31PX5cJIb6CPlfmJntgbP5gWnII1//AfZDdEv3ETMB2w4JJ4J4QwN6EiGHDZLP2sO9ztOFwmK7tFAhP44iH3sbUaNwEd9BMlI5ghr6A05WXT8cDCj8OrPW7N0wgji93hAGD7FPtlBTe4al6LPmIHSrmH1nyLeH58/gzgSzgJRvCr/IEskr0mwDfXU7F+5Xf5syW3AVJTuG1A572dEZFS5x99msVTamRAvK/a/DYD8DTtWMQP3SRFt0RNoi+qFMHrPw1Zlu8ZXo9MYpSeVZy90XnVxA1FUbb8Q7c3rgtkI9V6r9XwmyVuLlRwe6OpTGfxxj8e6FCB1DCq9ppd7zYB+C3Ayq30GSy7J3WNENEviZ4Eohc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qTtDU9Hy3X9HQvSJqyT+x0OoyG1847SGH7CJ/b/p3Xnu2T2hPdYSj8LQNjms?=
 =?us-ascii?Q?qhijdgeM3Xl377gwn25gcNMZn56tWyf2+cbJ4Jh7f9akEif0+DMaR8c8l9ZS?=
 =?us-ascii?Q?csgay8xhbmjwjh+FF9f/8aXSDMEUgpPE6eiufPbnUXLSpBNHLsRas8/lnjgB?=
 =?us-ascii?Q?RYPNxPkyICdvbViP8ccbZyZFaCxn/IDJoTH7DyhuSAb/1CvsCpXkHVtlp/5W?=
 =?us-ascii?Q?wnXp/dI4FtdQErAVR8e9PfXQ8zgjWRXiZ/IhuPRPPy6f2xKdSVVTMamgIbSl?=
 =?us-ascii?Q?H+FYS+NOiIuTfajiHugxVL3Amv+P0nF1nJX0O+Hs72Ok2LYXn55QAUX7aEDS?=
 =?us-ascii?Q?pPp/u/7TafytRk4rPbQfzDl6o0u+uC7dMgVm9/DQk0HbsoHmVEfXF0v6zVaw?=
 =?us-ascii?Q?W/EfYvSPgsHoj+LkeEYB452jCUoMgLxwhaYnCb0z1XyWgTcRQvttz1eyLV1Z?=
 =?us-ascii?Q?DDU3LyStqaLNNTvv2y8PG4pib3O8knhXNW4E0t0kh/FHyZDbTfzuFRYmtJ4H?=
 =?us-ascii?Q?e4uvS+/hTJLyEOlz7rUlFZ9ndhbBrAdlQoHuI1MQ3ABLI+IaBRkwHk8yjjS5?=
 =?us-ascii?Q?j/cBzz9G8PCw710H3oZX7C8Lk+sb6wAct+ni3+9Ijf+eT6JKDnpqY0usHR1u?=
 =?us-ascii?Q?93GzDXXLrt4Lcx5REVvpc3Ei+iRy83iib4cnfzwxKcvM1IswZBnDmx8GXbKP?=
 =?us-ascii?Q?h1qdau/K9pHVdOqZ8fBLfu77BQyzgUz7annIMzQRy5QdvkDpqQX/kGsa6Vu+?=
 =?us-ascii?Q?xXqTlCnj/tkKC3LrC2q3KPtzfUyK+0hZlS+VMZoI8rOLJSXWCKpvKXHFNyld?=
 =?us-ascii?Q?CgBeW5UQfu807s2LpM5TMmhVUPdB1MN8IJDVNsvBhTr/pUOM2mqk0IbZwQeC?=
 =?us-ascii?Q?j/o9+lRQVCrDEjCdlyeEh7V7r7ZmGIhw6oDk67Bo4VJCOMOXp0j9yNOoILKZ?=
 =?us-ascii?Q?GFc6UqZuCQDTt2c0OwXtQADoDxJ5aySTYy1xVvhWCq3L+edv5FVWzhr9PAFG?=
 =?us-ascii?Q?+PfhwsYATlfoOJvj0LluSUas46Vl78mvMB7zSV9faL/F8QIs9eou82U8rDYo?=
 =?us-ascii?Q?sviNmMa2kvm9yGdJbD0rB2QjwEVqZ854jDewNJlua4OON3dhCtysMvnJwoYE?=
 =?us-ascii?Q?uQid/mchmcc7jj/CH2W4cxkutbCZP747Jrg6sRg+KrBxc+7eU5skI2cx3hNr?=
 =?us-ascii?Q?IeRDftkNf8BHwrb7uAudGpoovrF3QZjbT6h7v5oesS9uwlMLy+b4Xjb/uXUP?=
 =?us-ascii?Q?1dK9lX8lfcn49KWeCAN4JdjWyYMV1XrtVLgzQ1ODVB6khMKwn5dUsK5xTBsq?=
 =?us-ascii?Q?SVEVK7FSiGGEnGh3cyN9ttkFfkSvhpHg/UIu9Sm0FxCOl/DOLlOpbS6FqiqI?=
 =?us-ascii?Q?ZfXXRP0pMRPGwKcq+WZA1tH70lB4qYiU0nm8QAKR9Pj5+z+MCDJXl4ebfGTH?=
 =?us-ascii?Q?9IvgXmhHOhh3FVHayNggUgLSvSRKChLc4aPZ97MwGexpEw3jB/ELPXCijEpE?=
 =?us-ascii?Q?ORkWkPax6FmU/QA0NNWn577QtohvcYfrLfoO0IepPpOHYAGUthM25igWL4+J?=
 =?us-ascii?Q?QJ6YsyO3ccw2KjFHRKv/QPQIzdnCjm54GtqRZw4M9ERpZNdA2RR3EeO6rFo0?=
 =?us-ascii?Q?vmc4NjGJwpXAhBbXV9wMYcGya8AD2Bmdh7uy2/YanoNTyspLYiItNnYHmFo6?=
 =?us-ascii?Q?v9/jXFbh4anW9E+w1dRQmJuDGugxVNg89nrn9TuQEsjmifrRr5xIydjfSsD9?=
 =?us-ascii?Q?lTUWBnmuNr7v1TMLMTAIwokLKU/COdk=3D?=
X-Exchange-RoutingPolicyChecked: Z1mr0MTRu4RXDFy1ZTMVoIK61Xo8KLX5PktqS6td1TMc3vitSEdYLxLJgz4EKF8y/v2v83DnS///O3nyqWGl9GMHLf/aYSGGYAxtR4HeWhtvefk+x+Eg206mTd/xjL+/zvMiWBZXro/SSs+oS35u1RlVka7x7IVecETtsS+1iaSDhs3JhYSEy1QB1+OZzbM/ocmS6zL4+CmevqE8i4J/j79tfY9qILwnRsqgar1HwdqG1YQ1RBravtvUD6Ne8HcMMeBeZDFSWWRnZAWl4cIt3BEYJozz7bM8QUILZoRqswIQO/fh8JK87RWkvi7d4T6N6YPmEOT/bDocnHALkOBWxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4d9b48-7789-4d20-6792-08dee26ac43f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:32.6334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpadj/d+rv/rshXmLkKFflSLfZVUDvh7rQaO4J3SiKO45f+5zpBGhVkxqwcGvDra5erKx3Fusa1h8BOQfyPpWv94CqWJl//k3esEoV26m8I=
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

intel_error_decode needs the batch decoder, chipset tables and zlib for
compressed error state handling, but not the full libigt.so stack.

Switch to linking against lib_i915_decode plus the minimal helper
libraries it relies on.

ldd before: 35  (ldd | wc -l)
ldd after:   4  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 467b8eea1..b04754c5e 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -20,7 +20,6 @@ tools_progs = [
 	'intel_display_bandwidth',
 	'intel_display_crc',
 	'intel_display_poller',
-	'intel_error_decode',
 	'intel_forcewaked',
 	'intel_framebuffer_dump',
 	'intel_gpu_time',
@@ -84,6 +83,11 @@ executable('intel_dump_decode', 'intel_dump_decode.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_error_decode', 'intel_error_decode.c',
+	   dependencies : [lib_i915_decode, pciaccess, zlib, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

