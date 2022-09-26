Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7526610E657
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 06:18:33 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.59.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D68A9580BE2
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Sep 2022 23:18:30 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1ochRk-000Rhk-39
 for igt-dev@lists.freedesktop.org; Mon, 26 Sep 2022 08:18:28 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Sep 2022 08:18:16 +0200
Message-Id: <73f42b1217fc93fd9e155d0ee5b7667bd6daae9b.1664173031.git.mchehab@kernel.org>
In-Reply-To: <cover.1664173031.git.mchehab@kernel.org>
References: <cover.1664173031.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 71/76] kms_content_protection: Close device before
 exit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Close the device fd before we check for leaks during the atexit
handlers.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/76] at: https://lore.kernel.org/all/cover.1664173031.git.mchehab@kernel.org/

 tests/kms_content_protection.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 3041f1cddf8b..095cc94b446b 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -839,5 +839,6 @@ igt_main
 	igt_fixture {
 		test_content_protection_cleanup();
 		igt_display_fini(&data.display);
+		close(data.drm_fd);
 	}
 }
-- 
2.37.3
