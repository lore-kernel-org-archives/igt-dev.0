Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7651C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 08:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2B311A2C6;
	Thu, 25 Apr 2024 08:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KtvVeIPd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800FA11A2C6
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714035127; x=1745571127;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=zs/AEGCb7yBeG75BpcyIyEv+dUKFphXovkbZGShZxOo=;
 b=KtvVeIPddWGJcTV0Xmj6MwxMawZ+Pa7mztzulwD7OdgcVXojgYsyGEa7
 wC6ShMQfPF8D7UftRkt6EwmzkR7lW1T7oI36s8gax5q2hYzY0svK/dmjO
 GVbVYU7P4N9+sCYinfkKrQgDYvdh6ZG/1vIVy7ggJ6W1w4D5piENCYR0s
 k/wKa2ClepMafyuUL0DpcMoXp0mbkQNVTWLWmL95EVdAC1wedOYVHo29Y
 O5PLrQGv8X+O3quhGvRTH1j9TpNVBT8GEqm2OV50YyCpTMBYbQUaLBhcU
 opnHsq2OH0rQ7AY8XHMPdDv70/OcMEJfRm+VN9NxAvWHw2UDlaeO5KahG A==;
X-CSE-ConnectionGUID: uWbpb4V5RpaEsVchC3JJfA==
X-CSE-MsgGUID: 7OYeFAezQ6KN0x3anY39fA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20395943"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="20395943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 01:52:07 -0700
X-CSE-ConnectionGUID: 23r3N9MnQnqivB0DUCTYvA==
X-CSE-MsgGUID: SHkpq0suTA6usIGuGjUAug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="62479115"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 01:52:07 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 98C80206D89D
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 01:52:06 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rzupo-00000000b1K-2SXQ for igt-dev@lists.freedesktop.org;
 Thu, 25 Apr 2024 10:52:04 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] tests/intel/kms_test_config.json: fix indentation
Date: Thu, 25 Apr 2024 10:49:22 +0200
Message-ID: <20240425085203.142195-2-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425085203.142195-1-mauro.chehab@linux.intel.com>
References: <20240425085203.142195-1-mauro.chehab@linux.intel.com>
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

There are some wrong indentation at Run Type. Fix it.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/kms_test_config.json | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 7c37c831b72c..5c8db82dfc73 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -23,9 +23,9 @@
                     "exclude": [
                         { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/blacklist.txt" },
                             { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
-                        ]
-                    }
-                },
+                    ]
+                }
+            },
             "Category": {
                 "_properties_": {
                     "description": "Contains the major group for the tested functionality 'Display'"
-- 
2.44.0

