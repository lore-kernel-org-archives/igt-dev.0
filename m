Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74ADE6E054
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jan 2021 08:12:08 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Tue,  5 Jan 2021 13:43:49 +0530
Message-Id: <20210105081352.82045-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 0/3] Test tiled display with aid of
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

Kunal Joshi (3):
  Make basic chamelium function accessible to other tests
  Added structures and functions to generate tiled edids
  Added a subtest where chamelium acts as a tiled panel

 lib/igt_chamelium.c          | 198 ++++++++++++++++++
 lib/igt_chamelium.h          |  33 +++
 lib/igt_edid.c               |  27 +++
 lib/igt_edid.h               |  20 ++
 lib/igt_kms.c                | 202 +++++++++++++++++++
 lib/igt_kms.h                |  25 ++-
 tests/kms_chamelium.c        | 378 ++++++++++++-----------------------
 tests/kms_dp_tiled_display.c | 119 ++++++++---
 8 files changed, 729 insertions(+), 273 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
