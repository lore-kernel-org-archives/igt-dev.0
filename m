Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4331A10E272
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 17:28:21 +0000 (UTC)
From: Jasmine Newsome <jasmine.newsome@intel.com>
Date: Mon, 14 Feb 2022 09:22:07 -0800
Message-Id: <20220214172208.3338908-1-jasmine.newsome@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] Fix for gem_spin_batch
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
Cc: jasmine.newsome@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Adding a fix to remove context persistence from
gem_spin_batch in order to pass test on GuC enabled
platforms.

Signed-off-by: Jasmine Newsome <jasmine.newsome@intel.com>

Jasmine Newsome (1):
  tests/i915/gem_spin_batch: Removing context persistence

 tests/i915/gem_spin_batch.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

-- 
2.25.1
