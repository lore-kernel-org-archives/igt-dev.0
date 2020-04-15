Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00656E91F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2020 08:36:13 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 15 Apr 2020 09:35:44 +0100
Message-Id: <20200415083544.2869748-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Blacklist perf_pmu@cpu-hotplug
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>, Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

CPU hotplugging is causing an infinite OOPS due to some broken core
hotplug code. It generates several hundred megabytes of oops log
clogging up CI for days.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
Cc: Martin Peres <martin.peres@linux.intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/intel-ci/blacklist.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 264f76482..ddcdb38ff 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -108,3 +108,8 @@ igt@i915_suspend@shrink
 ###############################################
 igt@.*@.*pipe-e($|-.*)
 igt@.*@.*pipe-f($|-.*)
+###############################################
+# Currently NOTOURBUG; rendered unusable
+# Remember to re-evaluate on new rc!
+###############################################
+igt@perf_pmu@cpu-hotplug
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
