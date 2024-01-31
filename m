Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D846BC47DB3
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 11:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C097113B7B;
	Wed, 31 Jan 2024 11:43:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312FF113B7B
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 11:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706701402; x=1738237402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hpxmjNloZBcVD9mDSYUECFDeQvRUrX0W4028Htgxk/0=;
 b=IuqY5r1PN6kIZ230CFAelfRJviVs9H0cZ+v0BCXYhjGk6TmeoGYAPBd6
 w0yH9zUobsP70kpAHyEnl5r051uMD/jL5G6cB1FhJUm/fY9G4JbhpBvhJ
 FkQmVEidzdR+SKHQivg6ul1HkvT4AFsoP4+TOARc/BL3/u8rfMKoPpC90
 rZuUEwZErM5IaYPw7fO+hEyua5VzPmaJW1oRT9bdsdaHpSpK5/UqMZR4e
 j0s2F+frrs2qNtOmCwyefZNIyUqnKRpAWGfzBkjenFKMZ7TS9e74CwaAI
 dDANv8D3jPdoBustZFcoTZYlUtmP2L9P/Qr4SHALt5RPBTI9IEQFkBKxF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434748560"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="434748560"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 03:43:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="961583650"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="961583650"
Received: from akurkina-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.19.208])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 03:43:20 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] tests/intel/xe_pat: assert flat CSS support for xe2
Date: Wed, 31 Jan 2024 11:43:05 +0000
Message-ID: <20240131114305.202871-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131114305.202871-1-matthew.auld@intel.com>
References: <20240131114305.202871-1-matthew.auld@intel.com>
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
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Xe2+ should support flat CCS compression, and here we are using
compressed PAT index modes. Assert the platform indeed has flat CCS
here, otherwise something is likely wrong.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_pat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 40256bada..3d7d7400c 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -1049,6 +1049,7 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
 
 	igt_subtest_with_dynamic("pat-index-xe2") {
 		igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
+		igt_assert(HAS_FLATCCS(dev_id));
 		subtest_pat_index_modes_with_regions(fd, xe2_pat_index_modes,
 						     ARRAY_SIZE(xe2_pat_index_modes));
 	}
-- 
2.43.0

