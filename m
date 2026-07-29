Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82238C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3424810E631;
	Wed, 29 Jul 2026 11:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0v2eLBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9827410E4F9
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322973; x=1816858973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8AKmyVN18hkvGLkjkW/F4TV6XbaH1qygdlaqoxMO7q0=;
 b=B0v2eLBQ0uDQboAQ+zVdoFekJrQXN+bDJpOjTAydIT4TCbRCR8YbLgHV
 YW+LP9sSwAp5yZWfPZvlljVBA+DkQ+CigrGeqtcLrms1SzfHDqHyvtyHm
 onBui0mR9kdTRZm/CaEy+GDPjHVu2JTRq5Vl92tQ+cXYKTDm/0rtfUgCD
 c5d2FIMeNZMFZEwPN3CwexIiYLcvxIw1O/aXSwZgEbMbG6LsL6/AGWXoD
 iR1XfmJXRITiSUEWAc8LfahhMvZgwnZY5aMDTIGilKaQyDGwdnP5R1Cwk
 EpBXFO4JGXDyAqZwK9I/NZ8EoD1itH4Ii+SRaeJM3lDBj7l44BtTKDIP5 Q==;
X-CSE-ConnectionGUID: 6abRgOXlSiyPehfxiRvYtA==
X-CSE-MsgGUID: SW+BFD7aSWSJi3nANiEbYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89743457"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89743457"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:02:53 -0700
X-CSE-ConnectionGUID: YW9DoKVdQdWavjcy9T9s+w==
X-CSE-MsgGUID: hhHbHM0ISyG4I55tE/JV7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256652465"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:02:53 -0700
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
 15.2.2562.45; Wed, 29 Jul 2026 04:02:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1C1eKF2jnS/iMNGDN8gLp8g0/8ezaxpVcgW3RfpBIgIDtAUtcsusWMbg+7cxJ50rmFta/ADXGiuTd58KZRE2nhgVEiFFGMTNKtJFwp9uKyQyZIbGc0oxjKNUu6tvLot2Fhdy6dHFiwzyDdoEfqPQM1R0jaoCrvAwHWe2210J7ZXIT+R4mx3c1iVTXoHYh/CKEzTAkxj+Vg5f2zCIUoWmXAgKcC+BQ2pHPqXFm687i+Pmzb5TK0knAM8EGm4hfYi7an1ER2TYZ4S7FBRiftBjCryIyKldoS4Teq//C7Ka8WUGhe+DcLWFq8izTOGH9SnIwGktA/saQ6uxNS0DlOifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2pyRX8b1+FrC9hWukmAimWPGXGYw/9uXphN3t/6Eyo=;
 b=Yg/6oHp596KvMTuyrpHXB+wr6/K0b5dpiJ2ImbOBDZ1n6p0S798PezU8dcrpnEpuZR0PFOd3poDY02yssLxUZQqTGqhqOCVUYinu1CPkpuzvrSEoLagrQS2iTnjs43bDrZCveTNJyttXu0jkd9N0piRfUNev2M3IY+7SBsRW1jH+wvyLxZAmRfQYQ6PEYWW+6PuyZbu/JEnhSBhjwv3ckfQb4nIdHQtcJ+H77jIQVunP+ktU19g7BVdK1FMH76NRFfpwblUHNONNgmE05lo9iwwwHwacfrliOKyPFpCVq+yW1qrlvye7SFwmICrd8xR84muYabtgVXU6Fy3ceyi+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 29 Jul
 2026 11:02:50 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:02:50 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 03/31] tools/igt_stats: link with minimal
 sub-libraries
Date: Wed, 29 Jul 2026 13:03:20 +0200
Message-ID: <c1d27ec2e7e1a346abd47f8d0069aa896e9fcc1c.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 512f7ee7-d57f-463e-22d2-08deed60ee19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|10067099003|6133799003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: 6geOzl2W4A14+k5UR7w2gHFDRDlS+phT19r8RYhPEuF7vw9LhI5gIHOH0Nh2LbnECBSqoUnXg1l4zY3XPAewIDex/Jn5jdo7QX4+blhL+ngFZs67HIKDTs4nqyyqowA1WxF1lpW9qbiYP0H0HLyasol0QHbJWavstF30DM8i97jU45wQN/mg6KRSxFEM4HpWrMZzvj9dqqxmSbOHcScA6WTN84lGRANWHnnau88b1kQxEAl1I0a0HoWaTBr98LzRTnKlkRnzKFEuK+nAo5NWxqyGKu2neKtWfyszSqLf5VWuST8p5kka7MNMtCj7ySJ/2nRfS+6aqpcxkpsUm2Iz5hpIato1WJuBGub0y0BwaDTaeEYwdHp9twODcT6lbOdcsHNZ+asTlcxww76welfdTME/T6cW3YNU6V6KvJjtoUeT2NwXrB35048MQPhSyjbd0AUsNFdU/Gqu6hZWtWIHu1+NyXXPwf0K0EpKPjeHlAhkO7xdk48ihR0E0CjOyNk2ArAHyzoC4JarY+l3oKDyAv0tCbZGALgW77ewLMSreRC0lOAgnJra0Dya9Ag0GjtNEA7MLz7y/hRvVtunHuxWV/zuqKEW95KUovQvhy1ZbFRP0bBsjGjvn+fduwQRTw2i6NkXspjHEi4vfJFDepzAUaMTY6NbHc3MwIdWVnBpqE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(10067099003)(6133799003)(56012099006)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0OIUC4fEiMblOBh04GWWPgFn+T6FpPHRo6jiN0NrzE3hQk/MmYzw3hFcpNE3?=
 =?us-ascii?Q?ku0pO8TWuUQdcEuVCCKFeRYq1RDqbDgsKs/sBgFM7IsNxj6IXf0TdCtbv1W4?=
 =?us-ascii?Q?IhqEZu4BZrepQ7RDsxVa/fYLovOWHju86nIwsDQSNJsN3YpmYoOnrArX4X5X?=
 =?us-ascii?Q?3M/gWBXoPvDmTz+gYySMBjdQGUfPM2mcJvtxb8HwVaNkhVHFJmo8XUrQrJPz?=
 =?us-ascii?Q?zQ7tXCYmop22KMPGomEgdoRQ/6SGcNaZflZ9MAtV0JpTtfTYfBdAXVSbAitV?=
 =?us-ascii?Q?OVihQ5wBwwYG4yFc6INhUfrX8QpZhsHYis4VQPVxPPuAG+SR3zrJCAAk3rRW?=
 =?us-ascii?Q?8nJnAKxDCsBN7YdrprvaLsNBFUezZlhDeyACHS4J0VnwIXmENR/36nNkgqM8?=
 =?us-ascii?Q?tQf2tUgEow50XQ1nIwpuYDH2BVrFB87NyJ7lXunB8/MsM4/30jK7VxUlL5QS?=
 =?us-ascii?Q?8eOfmKlxaixm4/Asues3/aWUgTl1V1iWMr3gU9e4jQf30V70yOvVW05C1s7O?=
 =?us-ascii?Q?4AnsAAxANmpqz2XpPA0gmG6eOihvd82hXPmYAbpoDw6LocFiPcse5G9WWM74?=
 =?us-ascii?Q?p47kl50dce5LlyQ2oRy5C/TzdQpmMCsb/eXZace8YkD/srlGagHfvugwVzs9?=
 =?us-ascii?Q?UPhQk+TeAhroqNJIdq7lgEau0Wp4RuREok26HfGtZYi/khaBpTmO21RW3jy5?=
 =?us-ascii?Q?L4Br1wUpEAx8HWkQci5/lqvNyncSo7cer38UanX6Eb3MRqK90y+8F0TEPF5R?=
 =?us-ascii?Q?aY4nUoSU0FxtFNu0W9zuSEdSWcKrfmtk3U3pyu+/rZ2JAD7VXL6WvUNcZNcG?=
 =?us-ascii?Q?Ik7xkpDbEU7cIv3tNLttZsZkqgemsyTYVrro8pKZNfUbzeWOYyETR81DTiTT?=
 =?us-ascii?Q?ZzvkhNcGPnXQ7yyr/TcT+U2dehsCIB2m+fb6a7NdsTR6In7GKxHcZAkwQui+?=
 =?us-ascii?Q?93oRymajcToLnKft4jUTvpj3/tjZ6R9EbDKPK7UTJdqEqLawPil/+DPZ6KLo?=
 =?us-ascii?Q?oxTQ2QtxBeOEm0F0sKqDsgtQS+Wj+tUC5DPb1QcFTf2bb+8eQnJS+oMx2W5V?=
 =?us-ascii?Q?f/pkolho9cpmIiwKvh+JAq1rTXh11O9XGNovwVkTSAciqbB+LUy9Hw55Elhl?=
 =?us-ascii?Q?XBatDXCHC4zfKptuCqQQk+nRhN5bbMagSjha3YtdT0/8cHZ02rdzgKxvIwQz?=
 =?us-ascii?Q?Ehw7tqu1jLWwy5nQJlw5oaxEZqEaMLQq3Sow8awUJuFjw/W2lIldN9DvbO6h?=
 =?us-ascii?Q?ucy8EM0d2sc7QjC7nsSu9e7MTfpllLfFacpfUc6krwq9iot3IHYf6z1zD/ap?=
 =?us-ascii?Q?V+MhL77sOgwl1y1jfwVDVRBq3N0KzFCZPMNcIEOEnUcX8Kh0v/sFKtMu31Y8?=
 =?us-ascii?Q?DQRt+kT+9wdYD5aGp6xo4cHi47TTNNRs7XIPaqoZf9UpZKWN1AM+Nq3PBznT?=
 =?us-ascii?Q?mK4EUMVOar3CRlObd2oVqTdoITB8gw7/qdXgavFG4HwvJ5kkvAAeoXyTmysG?=
 =?us-ascii?Q?MKHaVDE26/Rjdu+BzZ3VToqee2XCjqM8p9HlId5kyiLmHDZzin9HVtomEari?=
 =?us-ascii?Q?JOFHYqmyGCXQLYgXAMqjQeDCrgdX37+3rMqkok9/3xZKmnv4FJhkSK27pXpM?=
 =?us-ascii?Q?2oMlmBkqYmTBfGMa0nS8k8WK3+VRxZEQt7+tTy7PVFk8ShaiFqpQmtLXPhQQ?=
 =?us-ascii?Q?oaxR1N9aQCdPfcsxhdq3arkIZweY9i7VRC81/qE9SmmdjIfSKdJOydCLoarH?=
 =?us-ascii?Q?TP20S949ZYaXD+9u9vY+U25AZZTjdF8=3D?=
X-Exchange-RoutingPolicyChecked: kT8tOeggPMKqpbtbM27oHm9AdxZrIynozegjaRItAtPAzpzcBJMA+BFre3X1gs+ua5H9LCQMh2V59swYc/13T9sCj2/9VsQzW6AWMRdw84udLt7zpQ5bP8pp06NLcgnJY0Qd+HL3GLsBFfGRcoK6NneOFDbZRZU1RyG5LciKPqD1DdDoEQr2ZovuX9V0Fc/HomD+kX5MxlTa17kVyRe/vhaFbX8D7wffY3FhABiRU+LNDAa+tDHQ8+G5HU117EGPVWWnnvoy/1LDBh4I51x/lTr+K+t7hdrOLDNmsJJ+HY3wTq423MzkOFG+MYHoJ/Lu1BsP5gp+Yl9UBA8bfZva6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 512f7ee7-d57f-463e-22d2-08deed60ee19
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:02:50.3315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W49sPRK49tNrHCUtQejCgJP14y12VCwdAnsWssIXWxa9IR4CLuvBjLtR078pebsBCm+OgZIxK4M7a6OHRtvVsfgVgryc1STItc1WEqGJQhk=
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

igt_stats only needs the statistics helpers and a small assert stub.
Link it against lib_igt_stats and lib_igt_tools_stub instead of the
full libigt.so stack.

ldd before: 35  (ldd | wc -l)
ldd after:   4  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..286a718c8 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -14,7 +14,6 @@ endforeach
 tools_progs = [
 	'igt_facts',
 	'igt_power',
-	'igt_stats',
 	'intel_audio_dump',
 	'intel_backlight',
 	'intel_bios_dumper',
@@ -58,6 +57,11 @@ foreach prog : tools_progs
 		   install : true)
 endforeach
 
+executable('igt_stats', 'igt_stats.c',
+	   dependencies : [lib_igt_stats, lib_igt_tools_stub, math],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

