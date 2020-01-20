Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FB06E8DB
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2020 11:19:12 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Mon, 20 Jan 2020 09:50:24 +0530
Message-Id: <1579494027-2018-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Test tiled display with aid of
 chamelium.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

As of now we have kms_dp_tiled_display test which needs a physical
panel.Added changes to have chamelium act as a tiled panel and then
execute the test.

Kunal Joshi (3):
  Make basic chamelium function accessible to other tests.
  Added structures and functions to generate tiled edids.
  Added a subtest where chamelium acts as a tiled panel.

 lib/igt_chamelium.c          | 152 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_chamelium.h          |  33 ++++++++++
 lib/igt_edid.c               |  27 ++++++++
 lib/igt_edid.h               |  20 ++++++
 lib/igt_kms.c                | 102 +++++++++++++++++++++++++++++
 lib/igt_kms.h                |   2 +
 tests/kms_chamelium.c        |  81 +----------------------
 tests/kms_dp_tiled_display.c | 111 ++++++++++++++++++++++++-------
 8 files changed, 424 insertions(+), 104 deletions(-)

-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
