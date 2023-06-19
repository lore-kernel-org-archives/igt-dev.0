Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894DB10E099
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 05:33:02 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 07:32:46 +0200
Message-Id: <20230619053250.322791-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/4] Add absolute user fence timeout
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

According to kernel proposal:
	https://patchwork.freedesktop.org/series/118670/

add abstime and change relative to use nanoseconds instead of jiffies.

v2: separate changes for reltime and abstime (Kamil)
    change abstime timeout behavior to stay intact (Chris)
v3: use int64_t instead long to avoid being truncate on 32bit archs (Kamil)

Zbigniew Kempczyński (4):
  lib/xe_ioctl: Add xe_wait_ufence_abstime() helper
  lib/xe_ioctl: Return remaining timeout of user fence wait
  tests/xe_waitfence: Rename vague subtest name "test" to reltime
  tests/xe_waitfence: Add abstime subtest for user fence

 lib/xe/xe_ioctl.c                        | 43 ++++++++++++++++++++--
 lib/xe/xe_ioctl.h                        |  9 +++--
 tests/intel-ci/xe-fast-feedback.testlist |  2 +-
 tests/xe/xe_waitfence.c                  | 45 ++++++++++++++++++++----
 4 files changed, 86 insertions(+), 13 deletions(-)

-- 
2.34.1
