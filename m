Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633156FD5A
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2020 14:59:24 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu, 23 Jan 2020 13:30:38 +0530
Message-Id: <1579766442-20285-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t v4 0/4] validate color tests using chamelium.
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>, ville.syrjala@intel.com, petri.latvala@intel.com, daniel.vetter@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

For gen11+ platforms, there are frequent crc mismatch issues observed
in color tests. This is happening due to hardware limitation
(pipe rounding). One of the solutions to fix this is by rewriting
color tests and making them compatible with chamelium.

In this patch series, color tests are modified to have frame dump
comparison instead of crc comparison using chamelium hooks. This
will be useful even for future platforms. Also, with this approach
we could enable limited-range subtest which was commented in kms_color
because of crc mismatch.

Kunal Joshi (4):
  lib/igt_chamelium Added chamelium_frame_match_or_dumpn which returns
    bool that the captured frame matches with reference framebuffer
  Moved common function in kms_color and kms_color_chamelium to
    kms_color_helper.c
  tests/kms_color_chamelium: add subtests to validate color
  HAX: Run in BAT

 lib/igt_chamelium.c                   |  25 +-
 lib/igt_chamelium.h                   |   5 +
 tests/Makefile.am                     |   3 +
 tests/Makefile.sources                |  13 +-
 tests/intel-ci/fast-feedback.testlist |  66 +++
 tests/kms_color.c                     | 383 +----------------
 tests/kms_color.h                     | 105 +++++
 tests/kms_color_chamelium.c           | 759 ++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.c              | 386 +++++++++++++++++
 tests/meson.build                     |  19 +-
 10 files changed, 1378 insertions(+), 386 deletions(-)
 create mode 100644 tests/kms_color.h
 create mode 100644 tests/kms_color_chamelium.c
 create mode 100644 tests/kms_color_helper.c

-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
