Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0415010E4DD
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 12:39:28 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.22.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5C9FF580C9B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 05:39:27 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q9mG4-00FpQK-2y
 for igt-dev@lists.freedesktop.org; Thu, 15 Jun 2023 14:39:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Jun 2023 14:39:23 +0200
Message-Id: <20230615123923.3772582-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] xe-fast-feedback.testlist: better name Xe
 life KUnit tests
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

It seems that some CI jobs don't work with wildcards on testlists.
Replace them by the actual KUnit test names.

As migrate and wa tests are currently problematic, place them
at the end.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel-ci/xe-fast-feedback.testlist | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 73b9bbe656a1..53c6be0ed811 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -277,4 +277,9 @@ igt@kms_psr@cursor_plane_move
 igt@kms_psr@sprite_plane_onoff
 
 # Run KUnit tests at the end
-igt@xe_live_ktest@.*
+igt@xe_live_ktest@bo
+igt@xe_live_ktest@dmabuf
+igt@xe_live_ktest@pci
+igt@xe_live_ktest@rtp
+igt@xe_live_ktest@migrate
+igt@xe_live_ktest@wa
-- 
2.40.1
