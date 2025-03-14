Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1846DC282DE
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 00:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFBE10E95A;
	Fri, 14 Mar 2025 00:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPR77Cxp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999F410E95A
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 00:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741911667; x=1773447667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oJKaNJ5hczZxorbFYcgghTFw1qD7ijOEggcTbC3X7Hc=;
 b=DPR77CxpxiEsKZRM9INrUJC8UKbMOUdaharmuORJViorY+UXDYwZmrfd
 tkPVaerOKyPTvhC2SUzhLikg8sqmmgwIwuL9Bc9EDp/dXQUhFv0eWEuU3
 MD4kvXTvBe9B1G8b7uN3Vr5qJ2OCRejlRnwc5kLwDTADMWONq8Im8RTLe
 cMxEyjPlmcPR1/JVgh3eukL6vML2nT4GtJqqqlKohnfJudhpj/7oPmI2I
 yNgR2S+E2g5LOtkoWdgEFrpnYd8i4KX4Hin094mF5R9XX00l0s+vUr3Yw
 l82L2kJOHO9Cmjl/48Ourt/+j13qPuhAxVS4HQBt9UkkT9ZO5Bpafvqrr Q==;
X-CSE-ConnectionGUID: Va//HOrhSIWAL8Org0CvNg==
X-CSE-MsgGUID: d9ALN+W0QvSo/jeLyuXRWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="46703107"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="46703107"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 17:21:06 -0700
X-CSE-ConnectionGUID: 2EOaF5fQTqWeZTAeYKPkEw==
X-CSE-MsgGUID: taZVxLhETkKw/X/CV8z81Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126149588"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 17:21:06 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/xe_oa: Don't limit sync tests to render
 engine
Date: Thu, 13 Mar 2025 17:20:57 -0700
Message-ID: <20250314002058.220854-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314002058.220854-1-ashutosh.dixit@intel.com>
References: <20250314002058.220854-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

OA sync tests need not be limited to render engine only. Extend them to use
any engine using __for_one_hwe_in_oag macro instead.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 245481f8a3..2c48623a3b 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4905,7 +4905,7 @@ igt_main
 
 		for (const struct sync_section *s = sync_sections; s->name; s++) {
 			igt_subtest_with_dynamic_f("syncs-%s", s->name) {
-				__for_one_render_engine(hwe)
+				__for_one_hwe_in_oag(hwe)
 					test_syncs(hwe, s->sync_type, s->flags);
 			}
 		}
-- 
2.48.1

