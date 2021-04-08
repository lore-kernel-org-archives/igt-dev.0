Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu,  8 Apr 2021 10:31:57 +0200
Message-Id: <20210408083157.23014-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20210408083157.23014-1-janusz.krzysztofik@linux.intel.com>
References: <20210408083157.23014-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH 2/2] intel-ci: Unblock
 core_hotunplug@*hot*bind* subtests
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Commit be529747d8ea ("intel-ci: Broaden core_hotunplug blacklist")
blamed issues triggered by hot variants[*] as responsible for random
failures in subsequently executed tests,

According to the issue history[*], last reported occurrences were
not related to core_hotunplug.  Remove *hot*bind* subtests from CI
blocklist.

[*] https://gitlab.freedesktop.org/drm/intel/-/issues/2644.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/intel-ci/blacklist.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 33f92e37f..595fd0ca6 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -112,10 +112,10 @@ igt@.*@.*pipe-f($|-.*)
 # Temporary workarounds for CI-impacting bugs
 ###############################################
 
-# Currently fails and leaves the machine in a very bad state, and
-# causes coverage loss for other tests. IOMMU related.
-# https://gitlab.freedesktop.org/drm/intel/-/issues/2644
-igt@core_hotunplug@.*(hot|plug).*
+# *plug* subtests still fail and leave the
+# machine in a very bad state, causing coverage
+# loss for other tests.  IOMMU related.
+igt@core_hotunplug@.*plug.*
 
 # hangs several gens of hosts, and has no immediate fix
 igt@device_reset@reset-bound
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
