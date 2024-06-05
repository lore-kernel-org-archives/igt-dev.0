Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7B0C27C53
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 15:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B0010E350;
	Wed,  5 Jun 2024 15:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQ27Q7Ei";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E451610E350
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717601284; x=1749137284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o7cnFiZxQ7hpX8QuCIJ4koWIXJbhOyVQuczOoig8Do0=;
 b=NQ27Q7EiolvGNW5TwQMkLazSJyqcbAIWsBJazz7LhJPbR/NSokf1/buz
 iiACqnUzn3A3T7Vcws1AktyaFHAropcnVZ2JDnSdz+36mR04UqOdmgWMD
 gE6jsuz12hhoA+VvUjj2E6OQ2szarZnAkTymMnYms5tsHleL0isyx/yXk
 1d7yVJuT0q80QEHwFwhaFdBEucDK9wGg3SmSbadJY2/lqV1Z/1CBTdgwk
 I68DcZZjSowUqZlGsWDrHwx9NBrrcrC6D8r3Wsxad1W31hWQnr6UZR0Fo
 ZtTu5xtj47TvlD3YT6jMFl6XUS9ghWkROQg/qACnbJvwJLR/BByCR2i7K Q==;
X-CSE-ConnectionGUID: fkn6zC7iTIGbJinJcSQ1dw==
X-CSE-MsgGUID: x/+NirvhRTmofBUPvLc4zw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="11923009"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="11923009"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 08:28:03 -0700
X-CSE-ConnectionGUID: Jm/Acu8lRhCOyn7npL+cag==
X-CSE-MsgGUID: s+9uHtXlQz276A/lCsS3vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37557687"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 08:28:02 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 matthew.brost@intel.com, john.c.harrison@intel.com,
 stuart.summers@intel.com
Subject: [PATCH i-g-t 2/2] test/intel/xe_exec_reset: Synchronize cm-gt-reset
 gt resets
Date: Wed,  5 Jun 2024 08:12:48 -0700
Message-Id: <20240605151248.2736694-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605151248.2736694-1-jonathan.cavitt@intel.com>
References: <20240605151248.2736694-1-jonathan.cavitt@intel.com>
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

The cm-gt-reset test has the potential to race with itself on the gt
reset, so force the gt reset to be synchronous here.  The race condition
occurs because the test does not have a fencing mechanism (I.E.
dma-fence) to protect against this race, unlike in the gt-reset test
case, for example.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index ed67284800..5a5ce32837 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -530,7 +530,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	if (flags & GT_RESET)
-		xe_force_gt_reset(fd, eci->gt_id, false);
+		xe_force_gt_reset(fd, eci->gt_id, true);
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_EXEC_QUEUES) {
-- 
2.25.1

