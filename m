Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85E810E746
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 14:40:55 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.246.34.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C23EE580DA0
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 06:40:54 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1rAt53-000dAI-07
 for igt-dev@lists.freedesktop.org; Wed, 06 Dec 2023 15:40:53 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Dec 2023 15:39:39 +0100
Message-ID: <20231206144051.150420-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20231206144051.150420-1-mauro.chehab@linux.intel.com>
References: <20231206144051.150420-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/3] tests/intel/xe_media_fill: address a
 documentation warning
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

Currently, this warning is happening when building IGT:
	Warning: igt@xe_media_fill@media-fill Description documentation is missing

The documentation is there, but not for the subtests. Address it
by moving it to the right place while adding a description for the
test, as other subtests could be added there in the future.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/xe_media_fill.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_media_fill.c b/tests/intel/xe_media_fill.c
index 6b8494537038..ddda1b535ba0 100644
--- a/tests/intel/xe_media_fill.c
+++ b/tests/intel/xe_media_fill.c
@@ -30,12 +30,13 @@
  * Category: Hardware building block
  * Sub-category: Media
  * Functionality: fill surface with media block
- * Description: Basic test for the media_fill() function,
- *              a very simple workload for the Media pipeline.
+ * Description: Basic tests for the media_fill() function.
  * Feature: media
  * Test category: functionality test
  *
  * SUBTEST: media-fill
+ * Description: Basic test for the media_fill() function,
+ *              a very simple workload for the Media pipeline.
  */
 
 IGT_TEST_DESCRIPTION("Basic test for the media_fill() function, a very simple"
-- 
2.43.0
