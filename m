Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9655CCDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5AA10EE1B;
	Wed, 24 Jun 2026 08:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CGoYG5Cu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F47F10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290862; x=1813826862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gzU75uzMvrKYlfo+uTX/zbtsTWLAbnTlDbObrQM1S6k=;
 b=CGoYG5CusnaT92LJuxcNGo1//bM7uNkEFVjrM45ezTrHUCfnKX9Wg9Iz
 9mw/atrLsLR3Z1VNv52oB3ziiJb49RH/WkgaDg1RwlDJioL5UcVFYi3ui
 cIaL7seTmut5tsop8eZOUfkS3Nx5eczG99UTBdd2bAX7LlDgecvKUUVje
 lPbshT1r/YfOjzgFbizS2N9iNq0/zmr+BdV4gmTMRCf2u/69ho3ru7eIf
 JOdID9+DCEupNn5ZKQ/5aVFsz5wvqcmMojXN+pF74J4Y1GbGCtwCvzCU4
 BLOqGRCW1Fwe0cUWyYoAJeXa3PQo9YCkv44JnP/JiHSNBjuo+eFqoDz9m w==;
X-CSE-ConnectionGUID: mMtQgWnmT7GfHnCTTn/ENQ==
X-CSE-MsgGUID: WFTtnpz7TSaOhXubmhuAqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142244"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142244"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:41 -0700
X-CSE-ConnectionGUID: qjYV4AfPQSe2E6nL8lzbRg==
X-CSE-MsgGUID: 8p7c/u8sQAyCF4oRpBmLvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="254865310"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:40 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clIQiduZfy3/oGxcyVp1OAR4FAjjTvnAtO8C4YTfabnheuQ9v+qJ9XAgh7dwDrcIBG5D8P1heY5GSC9Fwnb6H6DyyPgaiQaFKOR29bLM8f/mX3pRihSFgz2LAff/pYdtvzoGj5eEvx9ZA1MCjaTZwGFOy9x/N1Pw/cR1yUtjWC996LtCRYjXIHBZI72rZ473Fy/OAt0ASghEENExZPKg7MsHBa5p/BWIGtv5/FF81gJmlRfFR3d7nncqzUyF9MFwQ79vKGgBKIxj4gjC53qQgfZaN+YOgiu1Ut36SqepEWtAGAkPd+GFUcp5t9krNkjpqZYxAZRCsbDtmOhIDIRDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiQdSaS82ab6GaVarLpcQ3/hyVOSPSOttlDuH6lwrGE=;
 b=EUI4mjFnc67m9pi33Hrqrr+BiJ7e8PYfoGcsVk9GcnpiIFdLlIw1mV8Mw0X5YYz6WE9qxOfLh6jyWcFws5oqHHRWHFlJyJ8TGPqlrnaZFowgYMb1cYIM5xKqsgSEkHOWjBDDR/Yj7NEtPDMDuWuXsNGK1jgFaf/MTy89PtM5Nag6fIMeOXaQL818x5KZC4aw/+SKnXfAPMI2P3sfkIh69x6KCSmZOlOUCXvPuMQHnSFV4UcX+apqRc7VnT3mtWQYO8qtYNiSeT0WCKw5epLDZ+KzAc/PGKdShHAAGMs7TNHgdkI424DlS17JEyVTI0D406aSqL6OIVU/5/FSfoHelQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:37 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:37 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 09/25] lib/i915: intel_decode: replace igt.h with
 minimal headers
Date: Wed, 24 Jun 2026 10:47:16 +0200
Message-ID: <c2f41066e4b11feffee458813a5e2333299f78da.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: a2e3b6c3-0a9d-4df9-21bb-08ded1cd3dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: s3DsWMnnT5pRAD5eQ5E0ayqOwvuFSOe4UAySosHRAA6Eo6501WQpfRmI0XMuEPgJJeU5Xn9fQDyHDOAbgU5OuIg1kBBMG9bI2btSxON2V8HjPVaDjFxIfY5zm/9UFSPUCROvNFcHjPdEu7WXx0LUljNlNwcD0CaKSKvlD85z3DeAAjmtNkpHl16q2EJ1sUwo7etXMcLkQXCi+9JyoMn+XrfOH2ilyPN5+YuIyd+43Ecra0gfKqIc7o/b7r1sj6wEui+2NM0U/8AD+0b7uNYxLRrySoGFCX9qg01manALAikJeM2Z7MEeevVNtvYjzaiZTFz0P8ereCxoomi4MAqjjfW56cP1bmeRVUYcAObXhAprbSD6xpUp9aH0oXlXTfbHUqat0cVgMQyzsf0mIxDNl9CPo2QM/sQF0OnWQCujkbYpDVrXFVHOTBZt77kePfLgfor6Q+4YpzW+YF+596yvVsSO325nknJy2jve9/tBgkHl4S6oQYVw8twCVytzfxmSIQ4G1dr+mPcmCZ4Sm69JFqd6YUCEqz598qfKTXsVxaA5rZbuQsO+embxbIbP7DDnoo5wUZDyi7AfegAbNit5gSsazY1i4i5+LlF7IWzv+0S79KBtWjTauZDNxUhzeagNAgRjdPuLAjv7MBNP3YkTewcY57NNfhp3jjyWvQg1kgk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N0/2wDScHItEnWdYL5fNoqX5VyUV2dHI91W7UvY7PBAI9eqLscJw6TTFNzrx?=
 =?us-ascii?Q?Msci4xemFnU6dnEC9nJ5KPJFN566f2a1+wLj/LSU9ph9W+T01VLmzvq63t7O?=
 =?us-ascii?Q?41ka/+bA6MyqOkaA+/vrkN9efS3TonRcfTXp3vcJlNb6B6nHUJL83qIJu1v6?=
 =?us-ascii?Q?SBnl7w2YEtZxlelkak8zgycL5qfCFxUo+wJwLR+S+9Jm92m9gfDn7r6NKSis?=
 =?us-ascii?Q?+rSSoWFY1SEci6Jiuv2gtoz8eMM6wFRdBe7S+MZgcw2erZd8j5qdXAwwvj0i?=
 =?us-ascii?Q?g6M53163aydjmojLe8zpRkbsnoduc51Ryf72TgQBlFwZ0SMPa/xkJ5yP7h/D?=
 =?us-ascii?Q?jMZJvPH+CNjAlYxS7KLGYjfKwhUZNEmQSUUHySoCZmnHlvqomCjhnr8Ck+5Z?=
 =?us-ascii?Q?9d0Me3b0QEG0lQF0kuwYduHgUlWlMRO+wR4E/puiemOXp2mBSZ35BExicW7f?=
 =?us-ascii?Q?iIM9EX3E8Pd3BMAJNhfpad40w2nl4JD8eR5k+sXpjxYRrj9IjBijCRn+KwOi?=
 =?us-ascii?Q?mKNmGmnF8Y/S60kKiNO0LpruWmJMRF8L0soEWitenG3pPGK6T9NtGKXQ00LY?=
 =?us-ascii?Q?KanjNihN5mhSSq2SodnaGGvYuQxkcfNNrtKrU/Vb1nT/yGsqdhkQ9uiANq9Q?=
 =?us-ascii?Q?/JX3Wbug3cPhfneo1M0FSoUCm399FWUcRrv8QY49PWNkW7VdV2DX2bQxKRyE?=
 =?us-ascii?Q?6xqrTwqdPAp4rupsBYeu/S4G6XmClvxepyxPnNUU8wSGDlYn9YLiA05x+q8f?=
 =?us-ascii?Q?68XVwXbqG/lw4pWfADUjHMHngvStrWjvTsWk6/S0iM4bSE2mBZazqt9y30s7?=
 =?us-ascii?Q?14jpFiyUD/ZMdYSGKRttayBMH7T5/33wKZrnMipHW2lVzct0Ns+WLA8crk/k?=
 =?us-ascii?Q?iAq/+PZEBvOjsHUYIKUONE9wDykIIlAxAlXXPgsnrECxtKF9YlvUAARq7Egk?=
 =?us-ascii?Q?mWcPgaeMs44BSgW21VF7nClJ2YGCPZLDfKXpNUO7x419Sbix2U80v5K+2CXk?=
 =?us-ascii?Q?AKro9SVTwGVrvFytSbrDuJ34yD7GmP+7Hsw5TVgZK36YPVpCuF2FRfJf30FU?=
 =?us-ascii?Q?ge3vbVFdcozho8JVfT8duorCslYZzVZNgdW5ARwh08Xka7wCAGAlgjMK3ht9?=
 =?us-ascii?Q?unNvi23Rpue7x2PRsCvDH0OQ26BUX1vtOH++PbONCFx9+raDG/B1HPiMoGZh?=
 =?us-ascii?Q?OyB2Z8ldKA12RrEafwSXjDSUs5pGF8aIkNIuGzKMOAX2mFnJQTgm5mGnRSDY?=
 =?us-ascii?Q?iD2Em6/clLDsD6sybSpXWxlvN+2VMg2UFDU6q57epmRpgZxYVpDGIwVM96lN?=
 =?us-ascii?Q?Xnl1SSv9EO2FiN7Rm3H9838uZJHtChQs3G9WM092IN9Yz2teLsIFdt1xEoxu?=
 =?us-ascii?Q?EPm4mU909kt9mEXsHIuXjVWPvnZxRdrkNBhoRMqVXzXoa1dZke2b/mCr+rYy?=
 =?us-ascii?Q?fBdnsAVOJLP5p5b8eBynOkZ2X1I6xFmAwxCw2+lOluEJgMOiiuC/Nelgeyom?=
 =?us-ascii?Q?cKQ/bqH/0AlMEYh/HrXot6+BoNQ8duN6hJMyB0/vIxsKrPbu46NkAGEERcZ0?=
 =?us-ascii?Q?2YQ65pD/FZhb+Eq0JdXmP8X67FWb+9etiNzzAhvu8kqpSvbLLAwRryVsz/13?=
 =?us-ascii?Q?+wUQMODG4/Q2qgLGJ1fLapqwI2Ro8Dl6ixb6eN8SMiWRbQtnTClqLmtAjriA?=
 =?us-ascii?Q?SfaLHr7y9+cSKfwCGxpetFJnRhfYsOWWyKzP48Pd9ZU32dl2/5sUqN/z9dHA?=
 =?us-ascii?Q?qUKvxG/hsuyT3C5hRI/5+oRJEhygxM8=3D?=
X-Exchange-RoutingPolicyChecked: PiR43InPuBWKkxn/WJUIOeqnzHqjsf//wi+9JnV0v9rtAQPhZLmmcc1wkIRscrKEnJfmpMRAFkD/UcWfmYdm3reKXMmyn4HN+6gbwcWzgsKeijIR354EJ0rPToycnc7HJZgXTcB+/fuDU8fPhftLfSiTLiuT75O7nN0b6AmGgH7BjZhVtEZQSXY2s/AJZpmH6WJoM7ZW9+Dqha/otMAPmuzCpajb8Q1A2Zu4ll/DgEmd/ncRL01IlWU77fJgkrnObNYMnoFpFMWr0+CbhLzuJ/qC/TxA/n3yduKfvvXy6LoCLGLPlS+7HCEN+wmQId79RSzhN0kdzkDIovstxOqlbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e3b6c3-0a9d-4df9-21bb-08ded1cd3dde
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:37.2005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhgpdjFwH52BfF+WKyii9hrWk9xvbC/OOq0fyOfOtlOTPGX1Km8J1kHYpUx/NAyO6qf1AtJHftlu/dP+pUgcGSU/arH+sp+cHUtXIc/KrWo=
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

intel_decode.c only uses two symbols from the IGT universe:
intel_gen() and intel_get_device_info(), both provided by
intel_chipset.h.  The DRM_PRINTFLIKE macro used for the
instr_out() format attribute is provided by xf86drm.h.

This is a prerequisite for building intel_decode.c into a static
sub-library (lib_i915_decode) that tools can link without pulling
in the full libigt.so stack.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/i915/intel_decode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/i915/intel_decode.c b/lib/i915/intel_decode.c
index b78993c47..7e21d1cff 100644
--- a/lib/i915/intel_decode.c
+++ b/lib/i915/intel_decode.c
@@ -29,7 +29,8 @@
 #include <stdarg.h>
 #include <string.h>
 
-#include "igt.h"
+#include <xf86drm.h>
+#include "intel_chipset.h"
 #include "intel_decode.h"
 
 /* Struct for tracking intel_decode state. */
-- 
2.53.0

