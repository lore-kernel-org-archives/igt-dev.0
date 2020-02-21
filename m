Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BB689DB2
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 09:00:57 +0000 (UTC)
From: Martin Peres <martin.peres@linux.intel.com>
Date: Fri, 21 Feb 2020 11:00:47 +0200
Message-Id: <20200221090047.221255-1-martin.peres@linux.intel.com>
In-Reply-To: <20200220153209.210767-1-martin.peres@linux.intel.com>
References: <20200220153209.210767-1-martin.peres@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] intel-ci: add a pre-merge blacklist to
 reduce the testing queue
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
List-ID: <igt-dev@lists.freedesktop.org>

When arriving at the office on Monday morning, the reported queue
size was ~100 hours. This defeats the point of pre-merge testing and
vastly exceeds our target of ~6 hours.

We have a lot of work needed to reduce testing time, but this patches
reduces the reported run time by 15-30% depending on the platforms:

 - shard-skl: 23.9 -> 18.2 minutes (18.5%)
 - shard-kbl: 21.2 -> 16.2 minutes (20%)
 - shard-apl: 25.9 -> 18.5 minutes (24.3%)
 - shard-glk: 24.7 -> 17.6 minutes (24.8%)
 - shard-icl: 25.1 -> 16.7 minutes (28.7%)
 - shard-tgl: 28.2 -> 19.6 minutes (26.4%)

The reason why the reported runtime is so low compared to the
actual time is due to:

 - Unaccounted time spent outside of the IGT subtests (exec(), fixtures)
 - Unaccounted time spent in suspend (monotonic clock, 20s / suspend)
 - Boot time / extra reboots between shards to workaround kernel failures
 - Intel GFX CI shard scheduling overhead
 - More?

Tomi and Petri are working on reducing these overheads by detecting the
bad conditions and rebooting the machine only at this point rather than
between every single shard, and increasing the size of the shard test
lists to reduce the per-shard CI overhead.

Because of this, the actual savings are way smaller in percentage
but still compound over the tens of executions we do per week:

 - shard-skl: ~58 -> ~52 minutes
 - shard-kbl: ~50 -> ~45 minutes
 - shard-apl: ~53 -> ~46 minutes
 - shard-glk: ~38 -> ~31 minutes
 - shard-icl: ~47 -> ~39 minutes
 - shard-tgl: ~60 -> ~51 minutes

More work needed, but we'll get there :)

v2:
 - Avoid using | in the regular expressions (Petri Latvala)
 - Update the description for igt@gem_pwrite@big-.* (Chris Wilson)
 - Drop igt@sw_sync@sync_expired_merge (fixed by Chris Wilson)
 - Drop igt@gem_eio@kms (fixed by Chris Wilson)
 - Drop igt@perf@gen12-mi-rpc as it is serious kernel bug (Chris Wilson)
 - Add links to issues tracking this for all blacklisted item

NOTICE: The above numbers have not been edited for the v2 since
        blacklisting or improving the runtime dramatically yields the
        same results, and only igt@perf@gen12-mi-rpc is back to being
        slow.

Signed-off-by: Martin Peres <martin.peres@linux.intel.com>
---
 tests/intel-ci/README                  |   7 +
 tests/intel-ci/blacklist-pre-merge.txt | 204 +++++++++++++++++++++++++
 2 files changed, 211 insertions(+)
 create mode 100644 tests/intel-ci/blacklist-pre-merge.txt

diff --git a/tests/intel-ci/README b/tests/intel-ci/README
index e3289933..07b32b54 100644
--- a/tests/intel-ci/README
+++ b/tests/intel-ci/README
@@ -37,6 +37,13 @@ blacklist.txt
 This file contains regular expressions (one per line) for tests that
 are not to be executed in full suite test rounds.
 
+=======================
+blacklist-pre-merge.txt
+=======================
+
+This file contains regular expressions (one per line) for tests that
+are not to be executed in pre-merge full suite test rounds.
+
 =============
 meta.testlist
 =============
diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
new file mode 100644
index 00000000..be30bdfe
--- /dev/null
+++ b/tests/intel-ci/blacklist-pre-merge.txt
@@ -0,0 +1,204 @@
+###############################################################################
+# This test has caught regressions in the past, but the feature is rarely used
+# by our users, yet it is responsible a significant portion of our execution
+# time:
+#
+# - shard-skl: 10.2% (~22 minutes)
+# - shard-kbl: 6% (~8 minutes)
+# - shard-apl: 3.9% (~7 minutes)
+# - shard-glk: 8% (~18 minutes)
+# - shard-icl: 11% (~22 minutes)
+# - shard-tgl: 7.1% (~14 minutes)
+#
+# Some patches already appeared to reduce the run time so this will likely not
+# remain for long.
+#
+# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1280
+#
+# Data acquired on 2020-02-19 by Martin Peres
+###############################################################################
+igt@kms_rotation_crc@.*
+
+
+###############################################################################
+# These 4 tests catching a lot of unrelated issues and are responsible for a
+# significant portion of our execution time:
+#
+# - shard-skl: 1.6% (~4 minutes)
+# - shard-kbl: 0.4% (30 seconds)
+# - shard-apl: 0.2% (20 seconds)
+# - shard-glk: 0.2% (30 seconds)
+# - shard-icl: 6% (~12 minutes)
+# - shard-tgl: 6% (~12 minutes)
+#
+# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1281
+#
+# Data acquired on 2020-02-19 by Martin Peres
+###############################################################################
+igt@i915_pm_rpm@legacy-planes(-dpms)?
+igt@i915_pm_rpm@universal-planes(-dpms)?
+
+
+###############################################################################
+# These tests are checking the obj->mm.get_page cache which is used for all
+# page lookups in the driver by using a rather outdated method (pwrite) because
+# it is harder to predictably exercise the cache from userspace.
+#
+# Until these 8 tests are replaced with a kernel selftest and removed from IGT,
+# let's blacklist them for pre-merge testing as they are responsible for a
+# significant portion of our execution time:
+#
+# - shard-skl: 0.1% (~15 seconds)
+# - shard-kbl: 3.5% (~4.5 minutes)
+# - shard-apl: 10% (~18 minutes)
+# - shard-glk: 6.3% (~14 minutes)
+# - shard-icl: 1.7% (~3.5 minutes)
+# - shard-tgl: 1.6% (~3 minutes)
+#
+# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1283
+#
+# Data acquired on 2020-02-19 by Martin Peres
+###############################################################################
+igt@gem_pwrite@big-.*
+
+
+###############################################################################
+# These 4 tests are covering an edge case which should never be hit by users
+# unless we already are in a bad situation, yet they are responsible for a
+# significant portion of our execution time:
+#
+# - shard-skl: 2% (~5 minutes)
+# - shard-kbl: 4% (~5 minutes)
+# - shard-apl: 2.7% (~5 minutes)
+# - shard-glk: 4.5% (~10 minutes)
+# - shard-icl: 2.5% (~5 minutes)
+# - shard-tgl: 3.5% (~7 minutes)
+#
+# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1284
+#
+# Data acquired on 2020-02-20 by Martin Peres
+###############################################################################
+igt@kms_flip@flip-vs-modeset-vs-hang(-interruptible)?
+igt@kms_flip@flip-vs-panning-vs-hang(-interruptible)?
+
+
+###############################################################################
+# These 28 tests are covering an edge case which should never be hit by users
+# unless we already are in a bad situation, yet they are responsible for a
+# significant portion of our execution time:
+#
+# - shard-skl: 1.7% (~4 minutes)
+# - shard-kbl: 2.8% (~3.5 minutes)
+# - shard-apl: 2.2% (~4 minutes)
+# - shard-glk: 1.8% (~4 minutes)
+# - shard-icl: 1.9% (~4 minutes)
+# - shard-tgl: 2.8% (~5.5 minutes)
+#
+# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1285
+#
+# Data acquired on 2020-02-20 by Martin Peres
+###############################################################################
+igt@kms_busy@.*hang.*
+
+
+###############################################################################
+# This test is reading one file at a time while being suspended, which makes
+# testing extremelly slow. This is a developer-only feature which is also used
+# by IGT extensively so removing it may make it harder for developers to
+# understand what they regressed, but given the amount of time we can save, I
+# this is an acceptable trade-off (easy-to-read report vs CI exec time):
+#
+# - shard-skl: 0.5% (~1 minute)
+# - shard-kbl: 0.1% (~2 seconds)
+# - shard-apl: 0.1% (~2 seconds)
+# - shard-glk: 0.1% (~2 seconds)
+# - shard-icl: 0.6% (~1.5 minutes)
+# - shard-tgl: 0.7% (~1.5 minutes)
+#
+# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1279
+#
+# Data acquired on 2020-02-20 by Martin Peres
+###############################################################################
+igt@i915_pm_rpm@debugfs-read
+
+
+###############################################################################
+# Modern userspace does not depend on the GTT anymore, so let's drop the
+# slowest tests from pre-merge testing:
+#
+# - shard-skl: 2.7% (~6.5 minutes)
+# - shard-kbl: 2% (~2.5 minutes)
+# - shard-apl: 4.7% (~8.5 minutes)
+# - shard-glk: 3.5% (~8 minutes)
+# - shard-icl: 4.2% (~8.5 minutes)
+# - shard-tgl: 2.5% (~4.5 minutes)
+#
+# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1286
+#
+# Data acquired on 2020-02-20 by Martin Peres
+###############################################################################
+igt@gem_fence_thrash@bo-write-verify-threaded-[xy]
+igt@gem_tiled_blits@interruptible
+igt@gem_tiled_fence_blits@normal
+igt@gem_tiled_blits@normal
+igt@gem_tiled_wc
+
+
+###############################################################################
+# This is a useful test, but it mostly tests the HW rather than the driver.
+# Very few regressions should be caught by this test as the driver code should
+# be relatively left untouched. Hopefully, it will get optimized to be made
+# useful in pre-merge as well:
+#
+# - shard-skl: 1% (~2.5 minutes)
+# - shard-kbl: 1.5% (~2 minutes)
+# - shard-apl: 1.4% (~2.5 minutes)
+# - shard-glk: 2% (~4.5 minutes)
+# - shard-icl: 2.7% (~5.5 minutes)
+# - shard-tgl: 2.3% (~4.5 minutes)
+#
+# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1287
+#
+# Data acquired on 2020-02-20 by Martin Peres
+###############################################################################
+igt@kms_plane@pixel-format-pipe-[a-d]-planes(-source-clamping)?
+
+
+###############################################################################
+# This test is doing nothing more than waiting for the driver to be suspended
+# before issueing a modeset. However, it never failed while testing for this
+# in the past year, so we probably just want to drop the amount of rounds to
+# reduce the runtime, but let's just blacklist it in pre-merge for now:
+#
+# - shard-skl: 1% (~2.5 minute)
+# - shard-kbl: 0.9% (~1 minute)
+# - shard-apl: 0.6% (~1 minute)
+# - shard-glk: 0.5% (~1 minute)
+# - shard-icl: 1.1% (~2.5 minutes)
+# - shard-tgl: 1.4% (~2.5 minutes)
+#
+# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1288
+#
+# Data acquired on 2020-02-20 by Martin Peres
+###############################################################################
+igt@i915_pm_rpm@modeset-stress-extra-wait
+
+
+###############################################################################
+# These 2 tests are stressing the re-usability of objects. It does not look
+# like we have had issues with this outside of the gen7 ppgtt issue, which
+# does not counterbalance its overall execution time.
+#
+# - shard-skl: 2% (~5 minutes)
+# - shard-kbl: 1% (~1.5 minutes)
+# - shard-apl: 1.7% (~3 minutes)
+# - shard-glk: 1% (2.5 minutes)
+# - shard-icl: 0.5% (1 minute)
+# - shard-tgl: 0.5% (1 minute)
+#
+# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1289
+#
+# Data acquired on 2020-02-20 by Martin Peres
+###############################################################################
+igt@gem_exec_reuse@baggage
+igt@gem_exec_reuse@contexts
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
