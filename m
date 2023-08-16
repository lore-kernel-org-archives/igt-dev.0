Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74B010E38D
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 12:48:58 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Aug 2023 14:48:42 +0200
Message-Id: <cover.1692189091.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Update documentation of Xe blitter tests
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

This tiny series updates Xe blitter tests documentation so they
are properly processed by the testplan script.

Karolina Stolarek (2):
  tests/xe_ccs: Improve test documentation
  xe/xe_exercise_blt: Improve test documentation

 tests/xe/xe_ccs.c          | 3 +++
 tests/xe/xe_exercise_blt.c | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.25.1
