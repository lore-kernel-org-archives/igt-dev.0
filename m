Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C635A10E760
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 18:52:05 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 00:23:16 +0530
Message-Id: <20220926185321.2897136-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 0/5] IGT test cleanup
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

-> Sanitize the state before starting the subtest
-> On test exit add missing igt_display_fini
-> close drm_fd wherever we haven't

Kunal Joshi (5):
  tests/chamelium/kms_chamelium.c: test cleanup
  tests/i915/kms_pipe_b_c_ivb.c: test cleanup
  tests/i915/kms_pwrite_crc.c: cleanup
  tests/kms_invalid_mode.c
  tests/kms_hdmi_inject: test cleanup

 tests/chamelium/kms_chamelium.c | 48 +++++++++++++++++++++++++++++++++
 tests/i915/kms_pipe_b_c_ivb.c   | 31 +++++++++++++++++++++
 tests/i915/kms_pwrite_crc.c     | 28 ++++++++++++-------
 tests/kms_hdmi_inject.c         |  2 ++
 tests/kms_invalid_mode.c        |  1 +
 5 files changed, 100 insertions(+), 10 deletions(-)

-- 
2.25.1
