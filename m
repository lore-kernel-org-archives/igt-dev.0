Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A639C10F81C
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jan 2022 06:50:03 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed,  5 Jan 2022 07:49:45 +0100
Message-Id: <20220105064945.9640-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220105064945.9640-1-zbigniew.kempczynski@intel.com>
References: <20220105064945.9640-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/fast-feedback.testlist: Add
 gem_softpin@safe-start subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This test takes up to few hundred of milliseconds and exercises
detecting of safe starting offset and alignment to use on discrete
where memory regions constraints could differ on different gens.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Acked-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index de1c6cb46..38a90ceb6 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -45,6 +45,7 @@ igt@gem_render_tiled_blits@basic
 igt@gem_ringfill@basic-all
 igt@gem_softpin@allocator-basic
 igt@gem_softpin@allocator-basic-reserve
+igt@gem_softpin@safe-start
 igt@gem_sync@basic-all
 igt@gem_sync@basic-each
 igt@gem_tiled_blits@basic
-- 
2.32.0
