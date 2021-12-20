Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA6111A43E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Dec 2021 09:45:17 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
Date: Mon, 20 Dec 2021 15:11:51 +0530
Message-Id: <20211220094153.282527-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Replacing DRM calls in few tests.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

In this series:
  -> Replacing of drm calls with the library calls.
  
Ananya Sharma (2):
tests/kms_draw_crc: replacing drmModeRmFb with igt_remove_fb
tests/kms_lease: replacing drmModeAtomicCommit

 tests/kms_draw_crc.c | 6 +++++-
 tests/kms_lease.c    | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.25.1
