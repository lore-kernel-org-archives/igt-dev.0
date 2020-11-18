Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A62A6E40F
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2020 13:07:51 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 18 Nov 2020 13:07:42 +0000
Message-Id: <20201118130742.2088282-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Remove blacklisting for
 perf_pmu/cpu-hotplug
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

While this regularly breaks upstream, that is also a good reason to keep
testing! Let's see if upstream is in a working mood.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/intel-ci/blacklist.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 37a049335..c6af22b30 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -113,11 +113,6 @@ igt@.*@.*pipe-f($|-.*)
 # Temporary workarounds for CI-impacting bugs
 ###############################################
 
-# https://gitlab.freedesktop.org/drm/intel/issues/1714
-# Since 5.7-rc1, this test has produced tens of megabytes of kernel
-# logs.
-igt@perf_pmu@cpu-hotplug
-
 # Currently fails and leaves the machine in a very bad state, and
 # causes coverage loss for other tests. IOMMU related.
 # https://gitlab.freedesktop.org/drm/intel/-/issues/2644
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
