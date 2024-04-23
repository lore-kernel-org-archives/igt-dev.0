Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B52C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 07:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D98310FB13;
	Tue, 23 Apr 2024 07:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4aVpgOZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F21D10FB12
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 07:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713855905; x=1745391905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sngfQjwvfrqdlp8rinv2PGwmXQoZWx87MvLj0YIwN94=;
 b=f4aVpgOZ3jCd2UiBSopoGt8Z6qZa1mwdgTU/F2jaMLgDGInawyJtKlAw
 ok3p/Z4K1W3uQDVm5/CSKCB6l0/2wkqO0lL29anXV79oY8X8OvBeVShgk
 wfMCorkGFNLbLl2UO6K0z/H5x+Gorj4YnEox1oE9Xzy6A+netW+Z9522G
 SEKMd+JDRYYYGbjkRErl54wbgFE4jACnadP+72e+yWV5mAwxgM1XWQs16
 ohc9lwcNVhp1+Sxt8RqOq2WJb/mUCjwO0grGzyO1xEkDL2N9MJECqECzV
 bd1r92ZMpX0A77BRsf2eDjxRHSlBeyVBCBaqj2cC7BfYoK+QmOkqbSzgv Q==;
X-CSE-ConnectionGUID: egX+HIPqRaqbQbzOUORYwA==
X-CSE-MsgGUID: RAY5Ptb9QBa9CUcyd4bQ8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20119561"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20119561"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 00:05:05 -0700
X-CSE-ConnectionGUID: ZYVpDEw8RZCP3hdgP4Qj9Q==
X-CSE-MsgGUID: PyYqUSrCQpSrJPC/7/2t0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24781089"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.22])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 00:05:04 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 2/2] lib/intel_batchbuffer: Be ready to use xe2
 render-copy on newer hardware
Date: Tue, 23 Apr 2024 09:04:49 +0200
Message-Id: <20240423070449.150518-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423070449.150518-1-zbigniew.kempczynski@intel.com>
References: <20240423070449.150518-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Newer hardware seems to have same 3D functionality so lets prepare
batchbuffer to reuse Xe2 pipeline and shader for render-copy.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/intel_batchbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index c8c6e9a193..824e928319 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -660,7 +660,7 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int devid)
 		copy = mtl_render_copyfunc;
 	else if (IS_DG2(devid))
 		copy = gen12p71_render_copyfunc;
-	else if (IS_GEN(devid, 20))
+	else if (AT_LEAST_GEN(devid, 20))
 		copy = xe2_render_copyfunc;
 	else if (IS_GEN12(devid))
 		copy = gen12_render_copyfunc;
-- 
2.34.1

