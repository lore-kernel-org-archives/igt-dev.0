Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DD210E291
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 06:37:41 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Sep 2022 12:09:07 +0530
Message-Id: <20220928063912.2963498-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/5] IGT test cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sanitize the state before starting the subtest

On test exit add missing igt_display_fini and
close drm_fd wherever we haven't

Kunal Joshi (5):
  tests/chamelium/kms_chamelium: test cleanup
  tests/i915/kms_pipe_b_c_ivb: test cleanup
  tests/i915/kms_pwrite_crc: test cleanup
  tests/kms_hdmi_inject: test cleanup
  tests/kms_invalid_mode: test cleanup

 tests/chamelium/kms_chamelium.c | 15 +++++++++++++++
 tests/i915/kms_pipe_b_c_ivb.c   |  7 +++++++
 tests/i915/kms_pwrite_crc.c     | 10 +++++-----
 tests/kms_hdmi_inject.c         |  2 ++
 tests/kms_invalid_mode.c        |  1 +
 5 files changed, 30 insertions(+), 5 deletions(-)

-- 
2.25.1
