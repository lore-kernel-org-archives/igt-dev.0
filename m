Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EBDD5B873
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 22:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFA810E54C;
	Mon, 15 Dec 2025 22:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wi+K1u8t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7942010E548
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 22:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765838209; x=1797374209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ts4KA0lQULW4l6hNoEalvAgvCDe71gcQpMRV7kMZqkg=;
 b=Wi+K1u8tln5YekgyY4BZp9DtYBnB6WCfsW6i1DrIEUlPGYqW3qsTRwRL
 wwRXyZZXPMg8rAJEPrnMU3K9M20WWv6SExNfJ9H1ETlZj4HzaQSEM0UYs
 oov8t9g/kHl5efftDC2D8PIPW6jcMXuuofgDvsfBok0UobMFVKCwod46+
 ElRBOh8L3CrQ5loE769bQSioYBWgoJxXO5I6qI0wyKhEr8I0cH7dzXPsa
 Ov2JQrYZbNMXUzlYwr/3Rg92283OVX71upu1WT+quewNEoV1YIMbQ7q7n
 dlbWiK+yR9+g36cQvQZzJOhvUXhVvqxNZyDlNMCjSilIvYF+QWWgF99Gp Q==;
X-CSE-ConnectionGUID: uaQMaYUzRhOujJa2cG5BpA==
X-CSE-MsgGUID: DndNbRNmSqaPWQKlugr9pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78389421"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="78389421"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:36:49 -0800
X-CSE-ConnectionGUID: ZDMK6YqBTjqVr1S6YJyVxw==
X-CSE-MsgGUID: gT/QRf/qSIOPl6g1qqAJpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197740280"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.94])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:36:48 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/4] tests/prime_udl: Create subtests
Date: Mon, 15 Dec 2025 23:36:37 +0100
Message-ID: <20251215223639.117028-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
References: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
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

Refactor code and create opening fixture, subtests and cleanup
fixture.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/prime_udl.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tests/prime_udl.c b/tests/prime_udl.c
index c3e92be1e..117663a30 100644
--- a/tests/prime_udl.c
+++ b/tests/prime_udl.c
@@ -123,16 +123,21 @@ static void test2(void)
 
 int igt_simple_main()
 {
-	igt_assert(find_and_open_devices() >= 0);
-
-	igt_skip_on(udl_fd == -1);
-	igt_skip_on(intel_fd == -1);
+	igt_fixture() {
+		igt_assert(find_and_open_devices() >= 0);
+		igt_skip_on(udl_fd == -1);
+		igt_skip_on(intel_fd == -1);
+	}
 
 	/* create an object on the i915 */
-	test1();
+	igt_subtest("share-import")
+		test1();
 
-	test2();
+	igt_subtest("share-import-addfb")
+		test2();
 
-	close(intel_fd);
-	close(udl_fd);
+	igt_fixture() {
+		close(intel_fd);
+		close(udl_fd);
+	}
 }
-- 
2.52.0

