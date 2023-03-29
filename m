Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5912110E16F
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 05:18:48 +0000 (UTC)
From: pallavi.mishra@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Date: Wed, 29 Mar 2023 10:58:46 +0530
Message-Id: <20230329052848.1076928-1-pallavi.mishra@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Increase timeout for GuC submission
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

From: Pallavi Mishra <pallavi.mishra@intel.com>

Increase reset timeout as resets can take a bit longer with GuC
submission because an error capture is done and with a large GuC log (16
MB) these take a while.

Don't run 'off' section as with GuC submission we don't handle
dynamically changing the timeslice duration from 'off' to 'on' on a
currently running context. This is not bug in GuC submission rather an
architectural decision to not implement this as there is no user aside
from IGTs.

Pallavi Mishra (2):
  [igt-dev][PATCH i-g-t] tests/i915: Increase timeout for GuC submission
  [igt-dev][PATCH i-g-t] i915/sysfs_timeslice_duration: skip off subtest
    for GuC submission

 tests/i915/sysfs_heartbeat_interval.c |  2 +-
 tests/i915/sysfs_timeslice_duration.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.25.1
