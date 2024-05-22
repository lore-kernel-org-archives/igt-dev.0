Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C15C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 12:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5E610E2A4;
	Wed, 22 May 2024 12:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HtXJqCjD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A6810E2C8
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 12:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716381233; x=1747917233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6gyDzuLuZ0HySwYVdrrezKkA9qLzXA1fjR1w5RjXXhY=;
 b=HtXJqCjD9CstZZ3VCfvTEy9lac+ObgwlbiN0U4j1jj0tOdImmU0vQVlY
 gXKP3/lyWDNjKyytk5CmeqZwL1+G7cywSwAHvqj2nsW2dw2yic9qq8Twc
 cQmz4LePRY3AgKNQAN+zr5J3W78k5qHoG1XxTi5HWVbWVP8Ds0FIC2aQ+
 SGrjWSudvltQTfHKJZlRPuIhCcnytuifqJcZ0o2DFqzYQ2l44UhY8jxoq
 2b2NzoO7swtG+2eCVK0AsXxYtOMMgwjPb11zAG2gOUKLoipwFqJqJdRCr
 JIBpkQpgQa1yp/8tEeuusef5Ky/Vd06D0Np5qsJ0Pyb0w/8hhjEzMEW5P A==;
X-CSE-ConnectionGUID: v7fBTnH3QRa5hu2Nevo9Bw==
X-CSE-MsgGUID: RrDDZtBEQrW6gcDsJy0k5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="30150093"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="30150093"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 05:33:53 -0700
X-CSE-ConnectionGUID: 0NilKwtZQ3mNMwpse5KtlQ==
X-CSE-MsgGUID: SicFownCQN2/iqyOTgGEJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="33262573"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 05:33:51 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel: Make Mega feature field mandatory in
 test documentation
Date: Wed, 22 May 2024 12:33:22 +0000
Message-Id: <20240522123322.779571-3-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522123322.779571-1-katarzyna.piecielska@intel.com>
References: <20240522123322.779571-1-katarzyna.piecielska@intel.com>
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

Once we have Mega feature in place for Core tests, let's make it
mandatory, so every new test has full needed documentation.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/intel/i915_test_config.json | 1 +
 tests/intel/xe_test_config.json   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index 3b3afb2fd..1a1c1aafa 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -43,6 +43,7 @@
                 },
                 "Mega feature": {
                     "_properties_": {
+                        "mandatory": true,
                         "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
                     },
                     "Sub-category": {
diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 89c6c7ef6..4556025f7 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -31,6 +31,7 @@
                 },
                 "Mega feature": {
                     "_properties_": {
+                        "mandatory": true,
                         "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
                     },
                     "Sub-category": {
-- 
2.34.1

