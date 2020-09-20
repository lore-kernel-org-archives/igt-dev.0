Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D01589CDD
 for <igt-dev@lists.freedesktop.org>; Sun, 20 Sep 2020 18:28:13 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Sun, 20 Sep 2020 23:58:25 +0530
Message-Id: <20200920182829.132808-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 0/4] Test tiled display with aid of
 chamelium.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

As of now we have kms_dp_tiled_display test which needs a physical
panel. Added changes to have chamelium act as a tiled panel and then
execute the test.

Kunal Joshi (4):
  Make basic chamelium function accessible to other tests
  Added structures and functions to generate tiled edids
  Added a subtest where chamelium acts as a tiled panel
  HAX: Run in BAT

 lib/igt_chamelium.c                   | 253 +++++++++++++++++++++++
 lib/igt_chamelium.h                   |  45 +++++
 lib/igt_edid.c                        |  27 +++
 lib/igt_edid.h                        |  20 ++
 lib/igt_kms.c                         | 125 ++++++++++++
 lib/igt_kms.h                         |   3 +
 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/kms_chamelium.c                 | 281 ++++++++------------------
 tests/kms_dp_tiled_display.c          | 119 ++++++++---
 9 files changed, 648 insertions(+), 226 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
