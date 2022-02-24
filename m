Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C5B10EBF1
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 12:49:17 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Feb 2022 18:16:31 +0530
Message-Id: <20220224124633.33327-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/2] Replacing DRM calls in few tests.
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

In this series:
	->we are replacing the DRM calls with the library calls.

Ananya Sharma (2):
  tests/i915/kms_draw_crc-replacing drmModeRmFb with igt_remove_fb.
  tests/kms_lease-replacing drmModeAtomicCommit.

 tests/i915/kms_draw_crc.c | 23 ++++++++---------------
 tests/kms_lease.c         |  4 ++--
 2 files changed, 10 insertions(+), 17 deletions(-)

-- 
2.25.1
