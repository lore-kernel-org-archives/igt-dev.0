Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A3D10E491
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 07:46:05 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 31 May 2023 13:15:27 +0530
Message-Id: <20230531074530.367036-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/3] nv12 crc sanity check
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

New test case added for nv12 crc sanity check.

Swati Sharma (3):
  lib/igt_fb: round rgb->yuv conversion results
  tests/kms_pipe_crc_basic: add nv12 crc sanity check
  intel-ci: update fastfeedback testlist

 lib/igt_fb.c                             | 25 +++++++-----
 tests/intel-ci/fast-feedback.testlist    |  3 +-
 tests/intel-ci/xe-fast-feedback.testlist |  3 +-
 tests/kms_pipe_crc_basic.c               | 50 +++++++++++++++++-------
 4 files changed, 54 insertions(+), 27 deletions(-)

-- 
2.25.1
