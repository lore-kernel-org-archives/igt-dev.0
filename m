Return-path: <SRS0=itlh=TC=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953DF10E1DD
 for <igt-dev@lists.freedesktop.org>; Sat, 19 Feb 2022 01:35:58 +0000 (UTC)
From: Jasmine Newsome <jasmine.newsome@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Feb 2022 17:32:13 -0800
Message-Id: <20220219013215.3531766-1-jasmine.newsome@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Fix for gem_spin_batch
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jasmine.newsome@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Saving more context info for added convenience in spinner.
Also adding a fix to remove context persistence from
gem_spin_batch in order to pass test on GuC enabled
platforms.

Signed-off-by: Jasmine Newsome <jasmine.newsome@intel.com>

Jasmine Newsome (2):
  lib/igt_dummyload: Save spin->opts as part of the spinner
  tests/i915/gem_spin_batch: Removing context persistence

 lib/igt_dummyload.c         |  1 +
 lib/igt_dummyload.h         | 43 ++++++++++++++++++++-----------------
 tests/i915/gem_spin_batch.c |  4 ++--
 3 files changed, 26 insertions(+), 22 deletions(-)

-- 
2.25.1
