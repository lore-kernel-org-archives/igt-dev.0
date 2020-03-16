Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 16 Mar 2020 10:54:26 +0000
Message-Id: <20200316105427.517192-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] intel-ci: Tweak blacklist for very long
 running stability tests
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

To exclude yynamic tests just use  their group name?

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/intel-ci/blacklist.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 948b47569..184c23c37 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -60,9 +60,9 @@ igt@gem_sync@(?!.*basic).*
 igt@gem_tiled_swapping@(?!non-threaded).*
 igt@gem_userptr_blits@(major|minor|forked|mlocked|swapping).*
 igt@gem_wait@.*hang.*
-igt@sysfs_heartbeat_timeout@long.*
-igt@sysfs_preemption_timeout@off.*
-igt@sysfs_timeslice_duration@off.*
+igt@sysfs_heartbeat_timeout@long
+igt@sysfs_preemption_timeout@off
+igt@sysfs_timeslice_duration@off
 ###############################################
 # GEM: Not worth fixing
 ###############################################
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
