Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489DBCDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F4D10E070;
	Wed, 24 Jun 2026 08:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmJiHggN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144AE10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290860; x=1813826860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RctBYh6XUCRF84nXux6MK/52gThTFTqJ1ieOhzocV6Q=;
 b=fmJiHggNTWDz1GCNh+EGkJLKn55zKDpox/VY7tHfKRa9n1Kf6gw3GieR
 WiUBPWyLX0g0DFjSCJwv1PKQ0IRw+ha1cAx582Zor8IvoDec9ERRp+mhd
 81EfY+KhoLQnxks9JJiAOUUHS7gzdFqX5SRsfNhCvGHjxmFXjtAdKuIa7
 4j+is710XyAKeQUwTtqSkPHH5W8MJXxa+oaRpwS8mr+LPnkBR2PRMI6VF
 XYbOEkG8aVdFxtde+0sbPZSoFPpCij1VdQkrPmxHusvSVvxkVhQe8z4ty
 87Tlb5dUMnMx33OXsBgQ+3p5bXJDj2JUBCNWC0X8siUeB0/CHJoSFPWD5 A==;
X-CSE-ConnectionGUID: wg5t5QPmTyWdOSYrrAEg0g==
X-CSE-MsgGUID: UOABUf+JSi6f9XzL6A0Wgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142240"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142240"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:40 -0700
X-CSE-ConnectionGUID: 6v/2O1UHRgqap0eXT4LShA==
X-CSE-MsgGUID: yJt+sNOmQJ2kNTjhqGwNsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="245432136"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:39 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stL/PJ3M2LkF6BfkWqAknR3jzgRm9IyZ1Qz18BjGEShaDKwBMDzji0LyZdl8F2ayJno0eQiujq+RB4TFbvZgQc8tIqUYv/Q5R8yHFVACadNGqDnUtCNTo3waoytFkx3O7lAjVuC0/pTld6DtmYf67lzqKJVgIsVsO1KeIitDMADL9n/kd+vIkwjSxvNZlk40oEz3SS+RBzcNMThYBZkjyE+JpuCFiDhJPbvmsi2uPoh+KMisXM+WUuh8XnIGDasOXEu7Qe6cg+nfaZUnPw3FEuIqhqIVJz9rPVkP9uK2+lcOKUGCTLbfgjcBWoVktAhFsKI4p2Lrwb0itOmSvpjAFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOHygjplOdgU8CEgArrBYP3ajYQcf5jxfGvmFfH+WWc=;
 b=mWQ5NAYfayvAGrcqmbuS/32gZCeewn86PvgArYFtoO/uGjUl6eoCf7Kk2X8o7tYugi+BIdsgQxp0oWgC32NbiVUW8Ys79zYrZs/LpYSE/okGnI2QuyHv3azDE2X/e6byGP+zoLP9Io4X2nUB+i0dNYUNc7SLv2Mb+s9qSDGPaKsuRiDGOv7g12XuhlFXc0gWDX40M1LVUhqDnMJ74c4LBXgHsy7+fDHk4cfA7JFTI6FjEg3bQJOjTXofYVxeQ9vRvN93z1l3MR3lYtdGnrTyin+Y97qCm0GBPoLlenWL5QEf1JDVEGmafC7sZxAewwY57aQt3vyyjwcXRbOeWSE1+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:34 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:34 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 08/25] tools: intel_gpu_frequency: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:15 +0200
Message-ID: <10b62e1b458cc33a24ad17d22bd81859192bdcb4.1782288071.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782288071.git.sebastian.brzezinka@intel.com>
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::28) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|CH3PR11MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b100c07-8bf9-449d-c6c2-08ded1cd3c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: wVocGSEnixEftXy6JgyjhmEg8G5h4GiuFksuR/xhXRIKSkI+BRgS1B0NiVww0ffeALjlnCdlPNbkx6GUNira1ktNdZ9jkAyuUGPEIgQW1mGtmlhK67aFK2yUGoUGdu4RutL/+LAyn0YtOXn9rApug+PWUgo2NahTRo/XrrxdhDJ/H3f/jlX9MCi7sBGOqoW/K/MpoSH/gaK/63wLNoSz0V/rB5L7BUxnKY0lAiE8397Fpc/IcfvGBRIX2ysSkvvlMdevS0vxEHXb0Sbt8lgctR3Lo51GiqycbBalPmmdlh6Hbqeub4aAtH2kGWJD3b0hJlrzTQmuTL8zeMmgEWfEOetieYqFujtIA9oz/g8uNzgvNYCXbh8lzZ3ddsaZ5Qy19teTfMfBZphO3pf3VudCgfhkB2kflf30dIpKkuNu1OfkkTJd1A/c8utCrR/va33dxyBT935dauMmz5+QJ3KbuGviJF/rf1A3WImNOb4R3s1TLdelphI3obkfrz+3NGthT5U3r4SQFZ2gyCwphbrcY78h/d3r6e2KB7hOCBYlI4RXwuYixATnrLlfBS8ikyftS0aj69ImKiHrlPEA7yIE3jrlOAYdjWbBgEvqop0OX26yvo3Nz0tKmib6HFqhjjYt0Cp07p889j5ono+Df4VyeGEjaY9PTR7IbNjnpMw+/aI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GUXzJtoMbN5whGZsk0Zis+aUQ3eU2ggccbxjQWoFVBXiahkz9WR0lSzuI1tX?=
 =?us-ascii?Q?VYjlVRNUuNPUWqqw2tLZJaN0M3p0TM2RTVsyzB0EZAqnl+t0m9D6fXnadvvp?=
 =?us-ascii?Q?7K7OfGDnjdsd3bVO8bsY7Af0jqJAQvRqH+PrrEBZQqV7uku005OLPn8oqUJO?=
 =?us-ascii?Q?gQvupPKnQS52gXitlZvIKu6IB12icsg26CV3so0ved9c9KDv6U+LHfWrb4az?=
 =?us-ascii?Q?kix0QJrUCr8Bl8OYixc9i2AVLCcMC7lcPHGjL1wFt0B2RQkyAb1Xwmcc2C7o?=
 =?us-ascii?Q?srvt+WKbofFp9Rd0Bnw+B3vqZxu1P1YHjPppQbaDvAwaLeiMANhPW4gwkURI?=
 =?us-ascii?Q?JGdm6ZRfRlDCI8rj7+2BnxXLxfIGrepodkc4FHW82vWGsQwqrxLxH/dSD+SE?=
 =?us-ascii?Q?ykSX+szUx5+h5o9hJzi9BBoGHtv7eIQkQ8w1ns6es99VmnRMl96+z8+T9PhF?=
 =?us-ascii?Q?Xob4OgdWtig7m1Q5g6AjUchj6WP41D/5T77RBE4QzQ7ojiUzXwp6SzBQRk3X?=
 =?us-ascii?Q?FJmLLWOwzCsz6acc1P+U2SG8hnkkWwLdkESDdIkVOYfEJQMXru23pUJncDsi?=
 =?us-ascii?Q?ITwroHLVYNq29hdPQcldjzpDFpNFmCe5JoR53X8QLt5BjaFnFlRU2btdQm4O?=
 =?us-ascii?Q?s63FFdqTLMDNTn54QrFSCG5auSGyxqPe7PQX9PmN4jaXyNPm0rbKsqve/vIh?=
 =?us-ascii?Q?nGzD6tl0yYxKiE8j2+0iB+4+rrH8Ob7AHtbsoX8SAW+iid9iXEsfn7yDU3Cm?=
 =?us-ascii?Q?xoEqE6Uups/DtUfSWrlK9wXYIC8+imtEEF5TWFnP4rKT264OJbv8/VZq25hS?=
 =?us-ascii?Q?hIgbNWPSH+ejtjvK71tJLI3qjtj0C8JGxNuo2VqVueBW3q4EQxdqU06ETQfv?=
 =?us-ascii?Q?IByHrGs1CDdFI4kJwqUC0EUGnxCm/F38zzH2Wc6yOemt5BRX88ZGNHPyikXr?=
 =?us-ascii?Q?SP4KZAcljJ1BJg2pOoCM+Nxcjj9ofFV+PjK9Zq0QqljZUjUDpmvPDn2mLw8c?=
 =?us-ascii?Q?6Af4xRpCJvVj8JIQ96dvKJdr6DMKvmavPg5b2x3gRyAgN92OIAf24GtpzPxP?=
 =?us-ascii?Q?1ajK2vOqTx3kFJCUQms8uDLOP6Y6UKwhIAAOlJpgvPwkUP+cuLitgNxUAOL6?=
 =?us-ascii?Q?bd9hz5PritbpZWonR8RISQDZrOM3l4P+gG90J5+F7sbQ+aa2dkYjIB0sMMKh?=
 =?us-ascii?Q?0C/rFILDDOFhJiGKlcxV8mlPNkTX+0Zp6DBeH4K/Um849D4PiUfbT1jOo6cW?=
 =?us-ascii?Q?Q7/bc3hI0oDTB8tTBWqGnK6iXMZjfFX+Qhyty2TBSOrWVSFzlP8JorORHSST?=
 =?us-ascii?Q?qqnHp8Pax6Hrlacb4zVrfKlW1+a3Of+Khq6zy/1XRInlQh63nB4XoWUeW96B?=
 =?us-ascii?Q?0zHXi14FwzWXPSi5QvwpgTtjg5t6ezEWMCpVPQej2u3ZM+arHbaJHK32HIYW?=
 =?us-ascii?Q?bq31/MWAvmF+ZMswAbsrldtf20oRWkpWmQ8HhXPHfppwPSrJkolsF/jw5WQS?=
 =?us-ascii?Q?7e0TmLSQgGL9iCfmbgVWv1oPF/+HpPQdH6lhXKmHDb9BnWRZb6PJAS4wZOgx?=
 =?us-ascii?Q?wX5v6cfz72YgjmrtCNFuH2zbKFAc9McDfawz7IGmJtvxBMvkcT1j8TcDe8eT?=
 =?us-ascii?Q?Gvqw9p+sDjzmvvH2ZRLNKmXA9T1dr5RmzSFhzv0p3M1UijgR56fMuy6qYQIK?=
 =?us-ascii?Q?mBzA/9ChSPIm5HWaYWN9+3ybXpYkKJAhRgbexYaNq9oTnGeQuaIAfLJmhJya?=
 =?us-ascii?Q?essLQbDdCyEDjbimGJM/Rw9xOmHpM4Q=3D?=
X-Exchange-RoutingPolicyChecked: UGzcBUFQWIubaOsKOPZSNa4JCc5y/qqms8lh2biOqN8v99Kljsns10GglgGiqgotWWL2rJRQwWv4yzavO4cQon++lZBE3GnAx6dI33HJmCGNJp7a06cohn1tpx9hRnjQuCz0qC+PyXkrKvfEEHFnxoCnlzZKv3H/SFKznbKBMJQjJEfvQWorhV0GWMrsJS1UleCVT50iPEZDL9ZM7TcNZgUyF02txfGB4Cx0Wch85+mbn+wO6oF+9+RcBHWHqyg/CewDGNIPlsavzPyOJGDaEa4InmgBGHhJwWlIAum4/LuF07LcmcAXki9TR24buH1J6zAvk/9PUgTEj8rTYW/SrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b100c07-8bf9-449d-c6c2-08ded1cd3c75
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:34.8568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHJNRWbhq7Fk+dggZnvZGhCwObcBhSUXYgXNCd4CKd0N1TApFDhPom5iw3PLjs7h/CGHO31N8R8gEsyRbVugC9MPTj1xM2No8B3cj+3MEXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8776
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

