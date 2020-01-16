Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEED6ED01
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2020 13:18:43 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu, 16 Jan 2020 11:49:56 +0530
Message-Id: <1579155598-4024-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 0/2] validate color tests using chamelium.
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
in color tests. This is happening due to hardware limitation (pipe rounding).
One of the solutions to fix this is by rewriting color tests and making them
compatible with chamelium.

In this patch series, color tests are modified to have frame dump comparison
instead of crc comparison using chamelium hooks. This will be useful even for
future platforms. Also, with this approach we could enable limited-range
subtest which was commented in kms_color because of crc mismatch.

Kunal Joshi (2):
  lib/igt_chamelium: added function returning a bool to compare
    framebuffer reference with framedump.
  tests/kms_color_chamelium: add subtests to validate color.

 lib/igt_chamelium.c         |   65 +++
 lib/igt_chamelium.h         |    5 +
 tests/Makefile.am           |    1 +
 tests/kms_color_chamelium.c | 1130 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build           |    1 +
 5 files changed, 1202 insertions(+)
 create mode 100644 tests/kms_color_chamelium.c

-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
