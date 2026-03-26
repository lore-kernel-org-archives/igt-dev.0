Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E5F106F303
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 08:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3843F10EA01;
	Thu, 26 Mar 2026 08:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFLY/Un+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6495410E9F0
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774514601; x=1806050601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MYM1BMX6hj45p5NlGMMX/u4hBfv11Uko+cXlOXgFnvw=;
 b=jFLY/Un+FKC8SwEEen/h4/ui6iMEf91vMm9Y8nbcuKesxO1i/e8mf0nD
 nnHi3j/j6PACeNHqYu9ObtxWxTFiXVkDDTUtiZJZb53F358Vrd46LrxZr
 bW/LZ6HyYgh1pXJjI84UK80t9NcB4qLcS97Nq4ifHwLUMWctTEmTN007t
 IbRrQ0io8D+dGG4oJ4diH8fQc7mu2utA4VAX3dDX2obqZNkNJePtyMafk
 r93aKZaEadK4ZVrXMNhEZMaw4x+I9WOXoZRjSAZZ+5sA41C3GSdD2AYs9
 OrIMPa8VoAH2gWqyxElufMWI0QO9ChWN+XbB+8FBMGltsrk6/XTkOpMYF Q==;
X-CSE-ConnectionGUID: qb4etjuGR/+QTCYMQY1m/w==
X-CSE-MsgGUID: quHiUVomSuSQpCgvKoIO/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75450321"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75450321"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:43:21 -0700
X-CSE-ConnectionGUID: H0BwTyvHQ0umGXBd8f6Ikg==
X-CSE-MsgGUID: /bzwX6v2QkKHhtVoj+LsqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224875019"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:43:19 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v5 5/5] intel-ci: Add *-planes-random chamelium test to
 Xe blocklist
Date: Thu, 26 Mar 2026 14:34:17 +0530
Message-ID: <20260326090417.864673-6-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326090417.864673-1-sowmiya.s@intel.com>
References: <20260326090417.864673-1-sowmiya.s@intel.com>
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

From: Mohammed Bilal <mohammed.bilal@intel.com>

Tests are exhaustive and pick random configurations, results are
non-deterministic on each run.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 80a0ee904..80cc98608 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -132,3 +132,14 @@ igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
 # driver does not support VGA connector types.
 ##################################################################
 igt@kms_chamelium.*@.*vga.*
+###############################################
+# Tends to generate invalid configurations
+# using CCS planes or configurations that
+# exceed HW capabilities resulting in sporadic
+# failure with -EINVAL.
+#
+# Maintaining extra constraints for Intel's HW
+# is too costly in comparison to the value
+# provided.
+###############################################
+igt@kms_chamelium_frames@hdmi-.*-planes-random
-- 
2.48.1

