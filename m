Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E11CFA452
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 16:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDAE10E195;
	Wed, 23 Oct 2024 16:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LP9eb90W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10F310E195
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 16:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729701957; x=1761237957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1E0FyTzj+n4W95DGSZvP8nlK++wlLx4+hHB8Iu/Uz70=;
 b=LP9eb90W3xQ9Gx2AWYeUQ0cgipayaP7TXc652f3+IzAbCtbAE+QQOhdq
 UssX3Zt7MAu34M1Q0jqqojCTcBLAF6bCCUKj7E/V4HN/ihREEEPF4UcEb
 Cau0iS3DWeaqhX+DR9PO9pCj0UnMQ95DiczyKXLdPifUpaB8r5qJZpvqx
 S4ZMy6t3oU1uqzPADQ38O4bIgD0AkcE5KNUrizBiuwRiEz1VJ4Lcu8rJC
 5Wx2IijDd96Sy6FKjrOSOXXhyO50UIo7LVaZaSQ/TLr2ZItcCX6D3GYn/
 14hitcV3kMSzzUha+Gu9o6Q6nB+zAKQABbGOVDvW0+tbI0TB+EwSmcYnZ A==;
X-CSE-ConnectionGUID: QHUjEOUETk+AM8eN6faShQ==
X-CSE-MsgGUID: Ui9K+zbpSDKIpzIyaf3AqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40418226"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40418226"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 09:45:57 -0700
X-CSE-ConnectionGUID: q8ZzCvNtQP2r5Qe0w/eTpQ==
X-CSE-MsgGUID: CYjwSPJCSdSvpoxi8lBlOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="117768107"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.27])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 09:45:56 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 2/2] intel-ci/xe.blocklist: remove drm_fdinfo
Date: Wed, 23 Oct 2024 18:45:37 +0200
Message-ID: <20241023164537.83876-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023164537.83876-1-kamil.konieczny@linux.intel.com>
References: <20241023164537.83876-1-kamil.konieczny@linux.intel.com>
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

After rename of drm_fdinfo into i915_fdinfo we no longer
need this test in Xe blocklist.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index f9ef612c4..6fe893f7a 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -33,7 +33,6 @@ igt@kms_selftest.*
 ##################################################################
 igt@debugfs.*
 igt@device_reset
-igt@drm_fdinfo
 igt@drm_read
 igt@dumb.*
 igt@prime_.*
-- 
2.47.0

