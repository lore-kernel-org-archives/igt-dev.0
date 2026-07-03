Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F242C44501
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2121710F829;
	Fri,  3 Jul 2026 14:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0pL3AHJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501DC10E2E7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088944; x=1814624944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PZTf5xMQvLcVKAsM1D6oGy+aVi7zXYo4UX204Gbv5Ss=;
 b=O0pL3AHJsDRlL0oJyyk0dx8coIXSVLzg7XWm7aPrlDqaKyUFxAo5cYPK
 IhV0KaomNzi28TQNCl4j3yKH/ScCrTJA7YKUotfvc9GSmJNcaJIR/Xegg
 PMhwq7Kjitz4AtNwmXyl5w8INxVXInE3xVukNByLqTKsDHhNDz8WZuJYF
 8SU3Y7ZcYaVZXqnhLUMK6kloXlybBqmyBmoJXWUBXz6SmEQ1CmIxprgFL
 op+/E5nPgkr7fJIOZX/tGJoxxC2sGWSjvRTj0aWMbLQvfheQxI+lYUhCh
 /PVV6AdHhIxEfo5wpwPhV+0cBtAF3ni8zWWmWoEKxADUM19p0PWUEOij9 w==;
X-CSE-ConnectionGUID: m6mHqRYCQW2btQ48B5m30Q==
X-CSE-MsgGUID: qQPymew9QUK+MX+R0Z4+5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87756522"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87756522"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:04 -0700
X-CSE-ConnectionGUID: FoYz4BJ4RtaXfIakzolomQ==
X-CSE-MsgGUID: UOtPaVGzSuG0Qs8Zs04stw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="276341078"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:03 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMA/450p4o1YNwFTY9DS5t88L4CJKv8Vgr6GNIbi92uf56WGgvG0/Abx+8S4ImcUdfGDHvVu+c/WRsVxn1krOLP1eTOb+Tz+Rj6yLBcnyXf40h4nQx42adgAcGMcGlKxbGExAAeo9mZfoZ1Vs9zeXd1ogSwN164Jdd+rQESoSWFY0olGFeZeR8dOUKFqXrdgaZ3uPQ+bzYORub72viNmUdBYTaYAj0dg15pxmcXMe5S6sI5ri580WKsAnoxTBzJnZWNq3V8ijOqqB9uKY6+Cbuu+dNlyf5d/fETCCPw2jYGu0CoCDwfjr8DO4C6s6AikW0IvQ1j3kwiqXj3Y8FOksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7+4qfUyxJxSuU57tMvRsfniZr+U/0qH3d6fUjAg508=;
 b=tG45/JDzFu5AKyOAVB3pCIIHrto97DSBluy0ZPRIeEzTE5yEGcOQlP7vS2jf5L7QfyARO8MWpSN4DBmz8EDbfwCQXlFF6ALdCuOLyh4+CAyENBQ5vSvWZVHOgptCYHQnrH3NZl+WK5T5jIk1ncfkE13E6NVjcpMURaMxMYlSDEsUugF+Q661x328J7a06dmwhDCmHa+SVtptHBF8fPZjUfOEGKB6mcbSrK+ZiRYrJ+DOni9GUcSkPfl75xxx3gWudZvefmfXo0c+K/kvfgj/HfZllMHPTgwz7VEwllvLgZ9brBDFSh56OQ4QO6Bnt8gM1Bf7B1CVe1r75I9ZozL9Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:01 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:01 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 12/31] tools/intel_gpu_frequency: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:46 +0200
Message-ID: <33850636f7e24839aa2013cb81217d5306c8504d.1783088106.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783088106.git.sebastian.brzezinka@intel.com>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: c16a6ba7-eac3-4e3d-ce61-08ded90f6d1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: TMpTWkrz/Zy6nOSQwVkx9Y8IUs+pJ1q2ibNvm6EjJzzZ9/PWdzSIuekqaOIVSl3eRpQubCz76PeajJsIZbGx5So9KsmOhNMHrlEbosa3kVUTnfWUXlpuoydkQB2FXc3m1Lsd/Ms+k53rRRuzs//Rk6erQmGG5c9SB2IziuGrpDYfa7QGjTnfUmhGOYAczzJ/RL67eYw31O5F2wLSvyfqKjKdt1s9aeiK2MOL1W4cY2kQw3287h343lKPxfmzvPoOhQyqZhRwz3kFiADxc0bU8M1EtRF2bd3tB9GGN6whxc0hYDB9Ck6Eun18epRxaA7IhybPhCbxfF5Y8TPBer6ZHLHb9SsV4FvbRCVZPBWYPFvmGeOrDrDNaRuSG5K9K/ohTPfw9PKNhuYXpzdTwUmaYaI3k8JrMmMxtzBAWc0Dnx7Klh1a56FGGJ1pxTI75f7AEmSALpj37sQHlszq0ri7HYTm/VwPz2i+hGJHGDY/Uv3b1OhsZ1QCqVHWKmxrQvVqhaCnLQBeJCY75akDgBnDSGO1XPT/ij/jyU6mKEVosl0/hK+sndm5uShBVf8Z01KXr5Bh757DglyAmRDekiOVHmlxLF1XqLp00Pdn3YHA/UBlilbNxNJcmTrbf4YPTgYG72LCVm5XbCN3xL338XIuF5lrPlEbggvmK0e5U9i2P94=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zhzECjSvXdfaHlSDqLH+ExaT8oZ3cWUHUabPFjCOp7LRHhXNiPqNQyxOItIo?=
 =?us-ascii?Q?eLvsSXtirK7Dw/mcxmusmh4/HJdD7D55dCPfdEKzqVKf6115kzcPbHCgFhmt?=
 =?us-ascii?Q?abIj+OaNfLejAoAoeuixxleeD/2gUQYx9URw8xuXdrPrIkRf3xAJi34lqpy4?=
 =?us-ascii?Q?hkT0z1SR9pmaNYpEI4eQHqYCo7EvTG+5eCJKRh7Ib4Slix4sPiJEnZqzNOj+?=
 =?us-ascii?Q?VIWS86frugsA1nzaWSWYn+tHPOgAYFDS8pasiCoIbfRfQM+Kkrg9DZBxTo7H?=
 =?us-ascii?Q?ikD17iaeS/+BeNG0AB6PbAXxrW9m3QPjyPmksTKCG6fkOEU+1ViYUuBK7seN?=
 =?us-ascii?Q?A04hdyPUWRXWlkl9uFXvNyY6jGiE8mkMgl8njFDMqvlSTW/cu12zIhbmaQpX?=
 =?us-ascii?Q?0sCMSsofEyQ8PXucGq4LfgXQXdwBJN8+GQOb5FQ7K7hmThGj1w5loN73NLDw?=
 =?us-ascii?Q?bqSYyCrBVkjxNNrfv07AXn/vCcstN2QX+eAeH9DSyrZBHPzPRjWn2j5Qch1x?=
 =?us-ascii?Q?qBHaURdkuTl7hBIYPgGXnA3Q4rWkiht4n0DkyKCxMgZq2glyls1Tcj/45Kcr?=
 =?us-ascii?Q?dvlSPyFJ7Go1gDuwXXRtwUkuFMcnHkjP6ju3hRKwBN/vhpbQKJr72px1bh2u?=
 =?us-ascii?Q?SePS+fJc96H8oEKYuzE+q/8VlvXqAz1smV7TcH9QPHcTAA9beTrPMuhEGkru?=
 =?us-ascii?Q?PIkdKiDc92DVplq5rqPldovvQjACEXKfydSSQYc5n0E8jVouNUAXaqX1bKpb?=
 =?us-ascii?Q?R97DO2Xw4hjtnJebVmu3B0pXWHw2ao8Qt5LVKsGNCQmc8QYL2MQdBDukk1Qd?=
 =?us-ascii?Q?IC3NPt15nu4COSisB4vQME9MrB6LE1jkJyOD3pcSULBeKBsKlV4BNzcyWtbn?=
 =?us-ascii?Q?gQOELKUY73qWng3f9jV8Cb3rvKl+9iu2Vd+TltWS7Megg0zSeWNtx9A2+3Jj?=
 =?us-ascii?Q?2lY/DuUl6vbjwOWYuGK4mLFG7ZNm+TZBySI5a/khtv7EVMZaL1LTsDenAVK6?=
 =?us-ascii?Q?+TpZAEEfKr4nGEz9w8XaEt+jzW76RW1Oy6NJ3locyut8raiIVSCjoSlwxBGS?=
 =?us-ascii?Q?GFImNf13MCadF8SwvcuiJ+0aNXoogi8cEfSjW3IGoglyKbz8dJSIRdA5sPVY?=
 =?us-ascii?Q?gYqjD1KTq2BNwffV/nFp7bmRY20zggUC5EzmQfEstRea5ShHyNtuGzQtIsFl?=
 =?us-ascii?Q?ZGcnV56ho/0QTunf9ua4ipuS5A9bcYFGoVCG+PyETFIx73/x3ZU2K+nkVO2c?=
 =?us-ascii?Q?2gBNe8BGApV9ecDNjTQQHWpGjqDSheNKsKs7+7qGBdfTiu7zIxTeMRjb4eBB?=
 =?us-ascii?Q?lqSDkQ5MoSP9HPDxD8uteW0+ATnxc+nx+gSxoE2bCW+Qs3JdMAKDS5iUz4uG?=
 =?us-ascii?Q?dwPGJAXV2uO+ZJLxc5ciW6kMdr+Wy7LzPi2SEPvEF9jHGAL5XTTeVuziF10c?=
 =?us-ascii?Q?Nz0rgYVbX8z8bCkkhRZcH7ZyR4dvP0dwTe0ry8Po9PlI5bGbVfw7YAVraxI1?=
 =?us-ascii?Q?EW4D+5spceCsyiZBGELbds8foU3XVZwJHd29MoyGJMDUZQyzlBfv/Ck02p48?=
 =?us-ascii?Q?6stW6cKrf3txAa+CTsn5z+E+Y7Iptk745IQx8QWR/lM39o3MOltON6ZCO7uh?=
 =?us-ascii?Q?XnrVJeencZotdSGAeCX6bY4G8zr0iiP/idiAmsr2aRMMCl+j0EaKQHEwhZAk?=
 =?us-ascii?Q?CMq0TP/w/aHnZTr/2WcPRAuYlvrrBKhv8fJ0zQvVUR6GDe6DnfloJZFNsPNk?=
 =?us-ascii?Q?u0uwBcMPBpw0yKbn5EuKLBB2Lg6AeR0=3D?=
X-Exchange-RoutingPolicyChecked: Nkf6O9HacrTYs050qTJW8gLB25DRTH9KXlac0976/RxP0cqY5yR2IKbtZnUXGXxbQy8TpTT6lQKcnHokiUeDcq6vkhrTld1sm8JZjaDdtQfBQutUs/kPZIaUNzeBjFk7sTjypcd1Y/P6JvIN/ybJBTFmSxt3qQH9QTWTL1oELNtEWr5cXjyCgXNo80xoCVwijfJr5VETYkyrZbsHVzk2b75WljQtKqPLzp3OP9kxDHudxK5Sp6UTge+7TXlVepwGSzdVsvsxJHl4xj04OE+Mq0bzUbuvgGf8BcMcQp/X+yodzsBhn1W2nD89fhxMLBpu/XHfa2fMEZpQbO7QM0/IQw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c16a6ba7-eac3-4e3d-ce61-08ded90f6d1f
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:01.4111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPtsSv2B9ezv6KNYtzbKBtu/6eb4BKGxmZ1+9xj2CPr9v2hnSsizJh9kbp424balOgnO2GjEDEH5f7o6TJ7GH51yNncdcZhBxz4IzMbfhp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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

