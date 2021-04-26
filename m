Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496D66E197
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Apr 2021 09:21:43 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Mon, 26 Apr 2021 15:02:02 +0530
Message-Id: <20210426093206.9182-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/4] Test tiled display with aid of
 chamelium.]
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

 lib/igt_chamelium.c                   | 198 ++++++++++++++
 lib/igt_chamelium.h                   |  33 +++
 lib/igt_edid.c                        |  27 ++
 lib/igt_edid.h                        |  20 ++
 lib/igt_kms.c                         | 202 ++++++++++++++
 lib/igt_kms.h                         |  25 +-
 tests/intel-ci/fast-feedback.testlist |  13 +-
 tests/kms_chamelium.c                 | 378 +++++++++-----------------
 tests/kms_dp_tiled_display.c          | 119 ++++++--
 9 files changed, 736 insertions(+), 279 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
