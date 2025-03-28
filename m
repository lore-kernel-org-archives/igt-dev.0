Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEC1C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 06:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DE910E982;
	Fri, 28 Mar 2025 06:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCjKs7vG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB0510E982
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 06:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743142457; x=1774678457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4gSukgoZzOLzVu6N1m3I2uBcFt2e5NW6Hmwlof9KLFM=;
 b=WCjKs7vG6hj3gTQXig0g4wMRaxP29cyKBo6lEncQFoqM5HniJdWEzLz6
 PlgaaJfduIngqCHg2f/kCD4bk1QJE5OLhgFfpeKnuenElJAKdX8PYRSvd
 u5lvn0yZkK7FDiT6cz0KYZxgw/Kkv9xhDlGnIwHzhm60mm8gDoUSHgAbA
 v608bsbW8aklw77fZWT85Jsgf877c6D+uV0u3vav15XQ5iI17LQkst5bk
 4o45GGVJ+c1OeYBrw8wFD2G7K5zrjLTg1Cl4+ggbspHghr/X+NB2Rd0Ii
 yJOh/LK2SBfVXN8ZRiI1fv5qX0PMx6NRFRjC+6hUO2ZlGbryeAUIo90W+ Q==;
X-CSE-ConnectionGUID: FGmq4Kg1TIe3jblGvhHvWQ==
X-CSE-MsgGUID: qcnCwGN1RVChOTX27bgsKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="54699124"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="54699124"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 23:14:15 -0700
X-CSE-ConnectionGUID: BTQrSAksQvucfE46ZdmsSQ==
X-CSE-MsgGUID: KvrO/yJQRSObS+Wy7cQ9SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="162594224"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 23:14:14 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_display_modes: Move
 intel_pipe_output_combo_valid before igt_output_set_pipe
Date: Fri, 28 Mar 2025 11:59:58 +0530
Message-Id: <20250328062958.1500649-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

Having this check after igt_output_set_pipe causes a commit failure,
so we need to check intel_pipe_output_combo_valid before setting pipe.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 588820170..3e388bb33 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -199,12 +199,12 @@ static void run_extendedmode_test(data_t *data) {
 
 					igt_display_reset(display);
 
-					igt_output_set_pipe(output1, pipe1);
-					igt_output_set_pipe(output2, pipe2);
-
 					if (!intel_pipe_output_combo_valid(display))
 						continue;
 
+					igt_output_set_pipe(output1, pipe1);
+					igt_output_set_pipe(output2, pipe2);
+
 					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
 						      kmstest_pipe_name(pipe1),
 						      igt_output_name(output1),
-- 
2.25.1

