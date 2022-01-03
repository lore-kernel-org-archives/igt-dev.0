Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6451090353019982412=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 03 Jan 2022 10:24:46 -0000
Message-ID: <164120548676.4700.2260663881898756038@emeril.freedesktop.org>
References: <20220103082136.22621-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20220103082136.22621-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fcapture=3A_Adding_Local_memory_support?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6451090353019982412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_exec_capture: Adding Local memory support
URL   : https://patchwork.freedesktop.org/series/98446/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11042_full -> IGTPW_6528_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6528_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6528_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/index.html

Participating hosts (13 -> 7)
------------------------------

  Missing    (6): pig-kbl-iris shard-tglu pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6528_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-iclb5/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb1/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html
    - shard-glk:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-glk1/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-glk7/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11042_full and IGTPW_6528_full:

### New IGT tests (119) ###

  * igt@gem_ctx_engines@independent@all:
    - Statuses : 5 pass(s)
    - Exec time: [0.14, 0.49] s

  * igt@gem_ctx_engines@independent@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.29] s

  * igt@gem_ctx_engines@independent@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.25] s

  * igt@gem_ctx_engines@independent@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.22] s

  * igt@gem_ctx_engines@independent@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.08] s

  * igt@gem_ctx_engines@independent@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.05, 0.24] s

  * igt@gem_exec_async@forked-writes:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_async@forked-writes@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.06] s

  * igt@gem_exec_async@forked-writes@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.07] s

  * igt@gem_exec_async@forked-writes@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.06] s

  * igt@gem_exec_async@forked-writes@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_async@forked-writes@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.06] s

  * igt@gem_exec_balancer@nohangcheck:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.60] s

  * igt@gem_exec_balancer@noheartbeat:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.62] s

  * igt@gem_exec_balancer@persistence:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.54] s

  * igt@gem_exec_balancer@sequential:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.58] s

  * igt@gem_exec_create@legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fair@basic-deadline:
    - Statuses : 3 fail(s) 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 11.40] s

  * igt@gem_exec_fair@basic-flow:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fair@basic-flow@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [4.92, 6.70] s

  * igt@gem_exec_fair@basic-none:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fair@basic-none-rrul:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [5.03, 5.42] s

  * igt@gem_exec_fair@basic-none-share:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [5.42, 7.01] s

  * igt@gem_exec_fair@basic-none-solo:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - Statuses : 5 fail(s)
    - Exec time: [6.27, 8.29] s

  * igt@gem_exec_fair@basic-none-vip:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [5.57, 5.76] s

  * igt@gem_exec_fair@basic-none@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.01, 5.66] s

  * igt@gem_exec_fair@basic-none@rcs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [5.38, 5.68] s

  * igt@gem_exec_fair@basic-none@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [5.49, 6.08] s

  * igt@gem_exec_fair@basic-none@vcs1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [5.49, 5.91] s

  * igt@gem_exec_fair@basic-none@vecs0:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [4.58, 6.01] s

  * igt@gem_exec_fair@basic-pace:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fair@basic-pace-share:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [4.41, 6.95] s

  * igt@gem_exec_fair@basic-pace-solo:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - Statuses : 4 fail(s) 1 pass(s)
    - Exec time: [4.47, 5.57] s

  * igt@gem_exec_fair@basic-pace@bcs0:
    - Statuses : 2 fail(s) 2 skip(s)
    - Exec time: [0.01, 4.42] s

  * igt@gem_exec_fair@basic-pace@rcs0:
    - Statuses : 2 fail(s) 2 pass(s)
    - Exec time: [4.46, 4.79] s

  * igt@gem_exec_fair@basic-pace@vcs0:
    - Statuses : 2 fail(s) 2 pass(s)
    - Exec time: [4.40, 4.77] s

  * igt@gem_exec_fair@basic-pace@vcs1:
    - Statuses : 2 fail(s)
    - Exec time: [4.41, 4.42] s

  * igt@gem_exec_fair@basic-pace@vecs0:
    - Statuses : 2 fail(s) 2 pass(s)
    - Exec time: [4.41, 4.75] s

  * igt@gem_exec_fair@basic-sync:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fair@basic-sync@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [4.76, 6.86] s

  * igt@gem_exec_fair@basic-throttle:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [4.76, 6.12] s

  * igt@gem_exec_schedule@preempt-user:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@preempt-user@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.10] s

  * igt@gem_exec_schedule@preempt-user@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@preempt-user@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@preempt-user@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@gem_exec_schedule@preempt-user@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@u-independent:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@u-independent@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.04, 0.23] s

  * igt@gem_exec_schedule@u-independent@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.06, 0.23] s

  * igt@gem_exec_schedule@u-independent@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.10, 0.21] s

  * igt@gem_exec_schedule@u-independent@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@gem_exec_schedule@u-independent@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.10, 0.20] s

  * igt@gem_exec_schedule@u-lateslice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@u-lateslice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_schedule@u-lateslice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_schedule@u-lateslice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_schedule@u-lateslice@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.02] s

  * igt@gem_exec_schedule@u-lateslice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_schedule@u-semaphore-codependency:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_exec_schedule@u-semaphore-noskip:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@gem_exec_schedule@u-semaphore-resolve:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@gem_exec_schedule@u-semaphore-user:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_exec_schedule@u-submit-early-slice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@u-submit-early-slice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [80.03, 100.04] s

  * igt@gem_exec_schedule@u-submit-early-slice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [80.04, 100.04] s

  * igt@gem_exec_schedule@u-submit-early-slice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [80.04, 100.04] s

  * igt@gem_exec_schedule@u-submit-early-slice@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [100.03, 100.04] s

  * igt@gem_exec_schedule@u-submit-early-slice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [80.04, 100.05] s

  * igt@gem_exec_schedule@u-submit-golden-slice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@u-submit-golden-slice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [80.03, 100.03] s

  * igt@gem_exec_schedule@u-submit-golden-slice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [80.04, 100.04] s

  * igt@gem_exec_schedule@u-submit-golden-slice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [80.03, 100.04] s

  * igt@gem_exec_schedule@u-submit-golden-slice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [100.03, 100.04] s

  * igt@gem_exec_schedule@u-submit-golden-slice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [80.04, 100.04] s

  * igt@gem_exec_schedule@u-submit-late-slice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@u-submit-late-slice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@u-submit-late-slice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.08] s

  * igt@gem_exec_schedule@u-submit-late-slice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@u-submit-late-slice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_schedule@u-submit-late-slice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.08] s

  * igt@gem_softpin@32b-excludes-last-page:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_softpin@full:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_softpin@zero:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gen9_exec_parse@shadow-peek:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@i915_hangman@engine-error:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_hangman@engine-error@bcs0:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@i915_hangman@engine-error@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@i915_hangman@engine-error@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@i915_hangman@engine-error@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@i915_hangman@engine-error@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@i915_hangman@engine-hang:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_hangman@engine-hang@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [6.64, 7.03] s

  * igt@i915_hangman@engine-hang@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [6.34, 15.54] s

  * igt@i915_hangman@engine-hang@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [6.97, 7.04] s

  * igt@i915_hangman@engine-hang@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [6.98] s

  * igt@i915_hangman@engine-hang@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [6.97, 7.04] s

  * igt@kms_atomic_transition@modeset-transition:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs:
    - Statuses : 6 pass(s)
    - Exec time: [0.89, 21.86] s

  * igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:
    - Statuses : 1 pass(s)
    - Exec time: [12.64] s

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - Statuses : 5 pass(s)
    - Exec time: [0.74, 12.22] s

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:
    - Statuses : 1 pass(s)
    - Exec time: [13.17] s

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - Statuses : 6 pass(s)
    - Exec time: [0.90, 22.21] s

  * igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs:
    - Statuses : 1 pass(s)
    - Exec time: [13.39] s

  * igt@kms_atomic_transition@modeset-transition@1x-outputs:
    - Statuses : 6 pass(s)
    - Exec time: [0.74, 21.98] s

  * igt@kms_atomic_transition@modeset-transition@2x-outputs:
    - Statuses : 1 pass(s)
    - Exec time: [13.08] s

  * igt@perf_pmu@gt-awake:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@invalid-open:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@perf_pmu@rc6-suspend:
    - Statuses : 6 pass(s)
    - Exec time: [7.78, 9.80] s

  

Known issues
------------

  Here are the changes found in IGTPW_6528_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#658])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-iclb2/igt@feature_discovery@psr2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb4/igt@feature_discovery@psr2.html

  * igt@gem_create@create-massive:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][7] ([i915#3002])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb1/igt@gem_create@create-massive.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-apl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-apl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-apl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][10] -> [FAIL][11] ([i915#232])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-tglb5/igt@gem_eio@kms.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb5/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         NOTRUN -> [SKIP][12] ([i915#4525])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb3/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#4525])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-deadline (NEW):
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#2846])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0 (NEW):
    - shard-iclb:         [FAIL][17] ([i915#2842]) -> [FAIL][18] ([i915#2852])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0 (NEW):
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#2842]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0 (NEW):
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#2842])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-kbl1/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl7/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1 (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][23] ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0 (NEW):
    - shard-tglb:         [PASS][24] -> [FAIL][25] ([i915#2842])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4613]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-apl6/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-kbl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#4613]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#4613])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb6/igt@gem_lmem_swapping@verify-random.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#4613])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb5/igt@gem_lmem_swapping@verify-random.html
    - shard-glk:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-glk4/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_pread@exhaustion:
    - shard-iclb:         NOTRUN -> [WARN][31] ([i915#2658])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb8/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#4270])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb7/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][33] ([fdo#109271]) +93 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#768]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109312])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb8/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109289])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb8/igt@gen7_exec_parse@batch-without-end.html
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#109289]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb1/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#2856]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb3/igt@gen9_exec_parse@bb-start-far.html
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#2856])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb2/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][40] -> [FAIL][41] ([i915#454])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109293] / [fdo#109506])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_suspend@forcewake:
    - shard-snb:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-snb7/igt@i915_suspend@forcewake.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-snb5/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111615])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3777])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109278] / [i915#3886]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb5/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3886]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl6/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3689])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb7/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#3886]) +7 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-apl1/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278]) +10 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb7/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html

  * igt@kms_chamelium@hdmi-hpd-after-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb6/igt@kms_chamelium@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-apl4/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [PASS][56] -> [DMESG-WARN][57] ([i915#180] / [i915#203] / [i915#62] / [i915#92]) +20 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_color@pipe-a-gamma:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][58] ([i915#62] / [i915#92]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl3/igt@kms_color@pipe-a-gamma.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][59] ([i915#118])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-glk4/igt@kms_color@pipe-a-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109279] / [i915#3359])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][62] ([fdo#109271]) +36 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-snb5/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_dsc@basic-dsc-enable:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#3840])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb7/igt@kms_dsc@basic-dsc-enable.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][65] -> [FAIL][66] ([i915#79]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109274]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb1/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp1:
    - shard-kbl:          [PASS][68] -> [DMESG-FAIL][69] ([i915#62])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-kbl4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][70] -> [DMESG-WARN][71] ([i915#180]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-iclb:         [PASS][72] -> [SKIP][73] ([i915#3701])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
    - shard-glk:          [PASS][74] -> [FAIL][75] ([i915#1888] / [i915#2546])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-kbl:          [PASS][76] -> [DMESG-WARN][77] ([i915#203] / [i915#62] / [i915#92]) +7 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109280]) +10 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-gl

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/index.html

--===============6451090353019982412==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/i915/gem_exec_capture: Adding Local memory support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98446/">https://patchwork.freedesktop.org/series/98446/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11042_full -&gt; IGTPW_6528_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6528_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6528_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/index.html</p>
<h2>Participating hosts (13 -&gt; 7)</h2>
<p>Missing    (6): pig-kbl-iris shard-tglu pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6528_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-iclb5/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb1/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-glk1/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-glk7/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11042_full and IGTPW_6528_full:</p>
<h3>New IGT tests (119)</h3>
<ul>
<li>
<p>igt@gem_ctx_engines@independent@all:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.14, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.05, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_async@forked-writes:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_async@forked-writes@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.01, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_async@forked-writes@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.01, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_async@forked-writes@vcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_async@forked-writes@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_async@forked-writes@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@nohangcheck:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@persistence:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.54] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sequential:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@legacy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 11.40] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [4.92, 6.70] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [5.03, 5.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [5.42, 7.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [6.27, 8.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [5.57, 5.76] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.01, 5.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [5.38, 5.68] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [5.49, 6.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [5.49, 5.91] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [4.58, 6.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s)</li>
<li>Exec time: [4.41, 6.95] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>Statuses : 4 fail(s) 1 pass(s)</li>
<li>Exec time: [4.47, 5.57] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 2 skip(s)</li>
<li>Exec time: [0.01, 4.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 2 pass(s)</li>
<li>Exec time: [4.46, 4.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>Statuses : 2 fail(s) 2 pass(s)</li>
<li>Exec time: [4.40, 4.77] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [4.41, 4.42] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>Statuses : 2 fail(s) 2 pass(s)</li>
<li>Exec time: [4.41, 4.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [4.76, 6.86] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [4.76, 6.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.04, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.06, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.10, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.10, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-semaphore-codependency:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-semaphore-noskip:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-semaphore-resolve:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-semaphore-user:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [80.03, 100.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [80.04, 100.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [80.04, 100.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [100.03, 100.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [80.04, 100.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [80.03, 100.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [80.04, 100.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [80.03, 100.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [100.03, 100.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [80.04, 100.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.03, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@32b-excludes-last-page:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@full:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@zero:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-error:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-error@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-error@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-error@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-error@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-error@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-hang:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-hang@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [6.64, 7.03] s</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-hang@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [6.34, 15.54] s</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-hang@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [6.97, 7.04] s</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-hang@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.98] s</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-hang@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [6.97, 7.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing@1x-outputs:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.89, 21.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.74, 12.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.90, 22.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition@1x-outputs:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.74, 21.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition@2x-outputs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.08] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@gt-awake:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@invalid-open:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [7.78, 9.80] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6528_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb4/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb1/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-apl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-apl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-tglb5/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb5/igt@gem_eio@kms.html">FAIL</a> ([i915#232])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb3/igt@gem_exec_balancer@parallel.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline (NEW):</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0 (NEW):</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0 (NEW):</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0 (NEW):</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-kbl1/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl7/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1 (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0 (NEW):</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-apl6/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb5/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-glk4/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb8/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb7/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +93 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb8/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb8/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb1/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb3/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb2/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-snb7/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-snb5/igt@i915_suspend@forcewake.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#111615])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb5/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl6/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb7/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_ccs.html">SKIP</a> ([i915#3689])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-apl1/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb7/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html">SKIP</a> ([fdo#109278]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb6/igt@kms_chamelium@hdmi-hpd-after-suspend.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-apl4/igt@kms_chamelium@vga-edid-read.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html">DMESG-WARN</a> ([i915#180] / [i915#203] / [i915#62] / [i915#92]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-gamma:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl3/igt@kms_color@pipe-a-gamma.html">DMESG-WARN</a> ([i915#62] / [i915#92]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-glk4/igt@kms_color@pipe-a-gamma.html">DMESG-WARN</a> ([i915#118])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html">SKIP</a> ([fdo#109279] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-snb5/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb7/igt@kms_dsc@basic-dsc-enable.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb1/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-kbl4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp1.html">DMESG-FAIL</a> ([i915#62])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html">FAIL</a> ([i915#1888] / [i915#2546])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11042/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">DMESG-WARN</a> ([i915#203] / [i915#62] / [i915#92]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6528/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-gl</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6451090353019982412==--
