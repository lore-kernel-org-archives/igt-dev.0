Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE47810E50E
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 19:30:50 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 31 May 2023 21:30:40 +0200
Message-Id: <20230531193043.558461-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Add absolute user fence timeout
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

According to kernel proposal https://patchwork.freedesktop.org/series/118670/
add abstime and change relative to use nanoseconds instead of jiffies.

Zbigniew Kempczyński (3):
  xe/xe_ioctl: Add xe_wait_ufence_abstime() helper
  xe/xe_ioctl: Return remaining timeout of user fence wait
  tests/xe_waitfence: Add abstime wait subtest

 lib/xe/xe_ioctl.c       | 24 +++++++++++++++++++++++-
 lib/xe/xe_ioctl.h       |  5 ++++-
 tests/xe/xe_waitfence.c | 38 ++++++++++++++++++++++++++++++++++----
 3 files changed, 61 insertions(+), 6 deletions(-)

-- 
2.34.1
