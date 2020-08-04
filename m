Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Aug 2020 12:37:16 -0000
Message-ID: <159654463617.12582.14546693484777686084@emeril.freedesktop.org>
References: <20200804085057.349998-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200804085057.349998-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHM6?=
 =?utf-8?q?_Add_timeline_semaphore_tests_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0710962354=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0710962354==
Content-Type: multipart/alternative;
 boundary="===============3752849111421425007=="

--===============3752849111421425007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests: Add timeline semaphore tests (rev5)
URL   : https://patchwork.freedesktop.org/series/79248/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8838_full -> IGTPW_4848_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4848_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-submitted-signaled} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +126 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb1/igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-submitted-signaled.html

  * {igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +126 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-tglb3/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8838_full and IGTPW_4848_full:

### New IGT tests (133) ###

  * igt@gem_exec_fence@invalid-timeline-fence-array:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-timeline-chain-engines:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-timeline-export:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-timeline-invalid-flags:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-timeline-invalid-wait:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-timeline-multiple-ext-nodes:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-timeline-repeat:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-timeline-signal:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-timeline-unused-fence:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@syncobj-timeline-wait:
    - Statuses : 2 timeout(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@32bits-limit:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@device-signal-unordered:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@device-submit-unordered:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-all-for-submit-available-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-all-for-submit-available-unsubmitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-all-for-submit-available-unsubmitted-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-all-for-submit-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-all-for-submit-submitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-all-for-submit-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-all-for-submit-unsubmitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-all-for-submit-unsubmitted-submitted:
    - Statuses :
    - Exec time: [None] s

  * igt@syncobj_timeline@etime-multi-wait-all-for-submit-unsubmitted-submitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-all-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-all-submitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-for-submit-available-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-for-submit-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-for-submit-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-for-submit-unsubmitted-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-multi-wait-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-single-wait-all-for-submit-available-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-single-wait-all-for-submit-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-single-wait-all-for-submit-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-single-wait-all-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-single-wait-for-submit-available-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-single-wait-for-submit-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-single-wait-for-submit-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@etime-single-wait-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@host-signal-ordered:
    - Statuses :
    - Exec time: [None] s

  * igt@syncobj_timeline@host-signal-points:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-submitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-unsubmitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-query-bad-pad:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-query-illegal-handle:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-query-one-illegal-handle:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-query-zero-handles:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-signal-bad-pad:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-signal-illegal-handle:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-signal-illegal-point:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-signal-one-illegal-handle:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-signal-zero-handles:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-single-wait-all-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-single-wait-available-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-single-wait-unsubmitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-transfer-bad-pad:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-transfer-illegal-handle:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-transfer-non-existent-point:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-wait-bad-flags:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-wait-illegal-handle:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@invalid-wait-zero-handles:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-all-available-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-all-available-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-all-available-submitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-all-for-submit-available-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-all-for-submit-available-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-all-for-submit-available-submitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-all-for-submit-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-all-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-available-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-available-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-available-submitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-for-submit-available-signaled:
    - Statuses :
    - Exec time: [None] s

  * igt@syncobj_timeline@multi-wait-for-submit-available-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-for-submit-available-submitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-for-submit-available-unsubmitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-for-submit-available-unsubmitted-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-for-submit-available-unsubmitted-submitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-for-submit-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-for-submit-submitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-for-submit-unsubmitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-for-submit-unsubmitted-submitted-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@multi-wait-submitted-signaled:
    - Statuses :
    - Exec time: [None] s

  * igt@syncobj_timeline@reset-during-wait-for-submit:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@reset-multiple-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@reset-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@reset-unsignaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@signal:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@signal-array:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@signal-point-0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@single-wait-all-available-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@single-wait-all-available-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@single-wait-all-for-submit-available-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@single-wait-all-for-submit-available-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@single-wait-all-for-submit-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@single-wait-all-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@single-wait-available-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@single-wait-available-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@single-wait-for-submit-available-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@single-wait-for-submit-available-submitted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@single-wait-for-submit-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@single-wait-signaled:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@transfer-timeline-point:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@wait-all-complex:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@wait-all-delayed-signal:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@wait-all-for-submit-complex:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@wait-all-for-submit-delayed-submit:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@wait-all-for-submit-snapshot:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@wait-all-interrupted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@wait-all-snapshot:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@wait-any-complex:
    - Statuses :
    - Exec time: [None] s

  * igt@syncobj_timeline@wait-any-interrupted:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@wait-any-snapshot:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@wait-delayed-signal:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@wait-for-submit-complex:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@wait-for-submit-delayed-submit:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@syncobj_timeline@wait-for-submit-snapshot:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4848_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][5] -> [SKIP][6] ([i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pread@display:
    - shard-hsw:          [PASS][7] -> [TIMEOUT][8] ([i915#1958])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw5/igt@gem_pread@display.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw8/igt@gem_pread@display.html
    - shard-snb:          [PASS][9] -> [TIMEOUT][10] ([i915#1958]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-snb5/igt@gem_pread@display.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-snb1/igt@gem_pread@display.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#454])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][13] -> [WARN][14] ([i915#1519]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][15] -> [DMESG-FAIL][16] ([i915#118] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-glk1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-iclb:         [PASS][17] -> [DMESG-WARN][18] ([i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_cursor@pipe-b-overlay-size-128:
    - shard-snb:          [PASS][21] -> [SKIP][22] ([fdo#109271]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-snb2/igt@kms_plane_cursor@pipe-b-overlay-size-128.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-snb4/igt@kms_plane_cursor@pipe-b-overlay-size-128.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][25] -> [FAIL][26] ([i915#31])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw8/igt@kms_setmode@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw2/igt@kms_setmode@basic.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#1542])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-iclb4/igt@perf@blocking-parameterized.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb7/igt@perf@blocking-parameterized.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-tglb1/igt@perf_pmu@module-unload.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-tglb2/igt@perf_pmu@module-unload.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-hsw:          [PASS][31] -> [FAIL][32] ([i915#2258]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw5/igt@prime_busy@hang-wait@bcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw1/igt@prime_busy@hang-wait@bcs0.html

  
#### Possible fixes ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][33] ([i915#1436] / [i915#1635] / [i915#716]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-apl2/igt@gen9_exec_parse@allowed-all.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-apl7/igt@gen9_exec_parse@allowed-all.html
    - shard-kbl:          [DMESG-WARN][35] ([i915#1436] / [i915#716]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-kbl2/igt@gen9_exec_parse@allowed-all.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-kbl7/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_addfb_basic@small-bo:
    - shard-apl:          [TIMEOUT][37] ([i915#1635] / [i915#1958]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-apl3/igt@kms_addfb_basic@small-bo.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-apl6/igt@kms_addfb_basic@small-bo.html
    - shard-snb:          [TIMEOUT][39] ([i915#1958]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-snb1/igt@kms_addfb_basic@small-bo.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-snb5/igt@kms_addfb_basic@small-bo.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-iclb:         [DMESG-WARN][41] ([i915#1982]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-iclb3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
    - shard-glk:          [DMESG-FAIL][43] ([i915#118] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-hsw:          [TIMEOUT][45] ([i915#1958]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw7/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][49] ([i915#2055]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][51] ([i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-iclb:         [FAIL][53] ([i915#49]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglb:         [DMESG-WARN][55] ([i915#1982]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][57] ([fdo#109642] / [fdo#111068]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][59] ([i915#1635] / [i915#31]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-apl8/igt@kms_setmode@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-apl1/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][61] ([i915#31]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-kbl7/igt@kms_setmode@basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-kbl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-query-forked-busy-hang:
    - shard-apl:          [DMESG-WARN][63] ([i915#1635] / [i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-apl2/igt@kms_vblank@pipe-a-query-forked-busy-hang.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-apl8/igt@kms_vblank@pipe-a-query-forked-busy-hang.html

  * igt@prime_busy@after-wait@vcs0:
    - shard-hsw:          [FAIL][65] ([i915#2258]) -> [PASS][66] +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw6/igt@prime_busy@after-wait@vcs0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw5/igt@prime_busy@after-wait@vcs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-apl:          [TIMEOUT][67] ([i915#1635] / [i915#1958]) -> [INCOMPLETE][68] ([i915#1635] / [i915#1958])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-apl3/igt@gem_exec_reloc@basic-concurrent16.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-apl2/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-hsw:          [SKIP][69] ([fdo#109271]) -> [TIMEOUT][70] ([i915#1958]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-snb:          [TIMEOUT][71] ([i915#1958]) -> [SKIP][72] ([fdo#109271])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-snb1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-snb4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-snb:          [SKIP][73] ([fdo#109271]) -> [TIMEOUT][74] ([i915#1958]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-snb1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-snb1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/index.html

--===============3752849111421425007==
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
<tr><td><b>Series:</b></td><td>tests: Add timeline semaphore tests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79248/">https://patchwork.freedesktop.org/series/79248/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8838_full -&gt; IGTPW_4848_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4848_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-submitted-signaled} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb1/igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-submitted-signaled.html">SKIP</a> +126 similar issues</li>
</ul>
</li>
<li>
<p>{igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-tglb3/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled.html">SKIP</a> +126 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8838_full and IGTPW_4848_full:</p>
<h3>New IGT tests (133)</h3>
<ul>
<li>
<p>igt@gem_exec_fence@invalid-timeline-fence-array:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-timeline-chain-engines:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-timeline-export:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-timeline-invalid-flags:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-timeline-invalid-wait:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-timeline-multiple-ext-nodes:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-timeline-repeat:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-timeline-signal:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-timeline-unused-fence:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-timeline-wait:</p>
<ul>
<li>Statuses : 2 timeout(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@32bits-limit:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@device-signal-unordered:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@device-submit-unordered:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-all-for-submit-available-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-all-for-submit-available-unsubmitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-all-for-submit-available-unsubmitted-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-all-for-submit-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-all-for-submit-submitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-all-for-submit-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-all-for-submit-unsubmitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-all-for-submit-unsubmitted-submitted:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-all-for-submit-unsubmitted-submitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-all-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-all-submitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-for-submit-available-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-for-submit-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-for-submit-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-for-submit-unsubmitted-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-single-wait-all-for-submit-available-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-single-wait-all-for-submit-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-single-wait-all-for-submit-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-single-wait-all-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-single-wait-for-submit-available-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-single-wait-for-submit-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-single-wait-for-submit-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-single-wait-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@host-signal-ordered:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@host-signal-points:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-submitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-unsubmitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-query-bad-pad:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-query-illegal-handle:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-query-one-illegal-handle:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-query-zero-handles:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-signal-bad-pad:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-signal-illegal-handle:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-signal-illegal-point:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-signal-one-illegal-handle:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-signal-zero-handles:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-single-wait-all-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-single-wait-available-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-single-wait-unsubmitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-transfer-bad-pad:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-transfer-illegal-handle:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-transfer-non-existent-point:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-bad-flags:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-illegal-handle:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-all-available-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-all-available-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-all-available-submitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-all-for-submit-available-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-all-for-submit-available-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-all-for-submit-available-submitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-all-for-submit-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-all-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-available-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-available-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-available-submitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-for-submit-available-signaled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-for-submit-available-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-for-submit-available-submitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-for-submit-available-unsubmitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-for-submit-available-unsubmitted-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-for-submit-available-unsubmitted-submitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-for-submit-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-for-submit-submitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-for-submit-unsubmitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-for-submit-unsubmitted-submitted-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-submitted-signaled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@reset-during-wait-for-submit:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@reset-multiple-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@reset-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@reset-unsignaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@signal:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@signal-array:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@signal-point-0:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@single-wait-all-available-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@single-wait-all-available-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@single-wait-all-for-submit-available-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@single-wait-all-for-submit-available-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@single-wait-all-for-submit-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@single-wait-all-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@single-wait-available-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@single-wait-available-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@single-wait-for-submit-available-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@single-wait-for-submit-available-submitted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@single-wait-for-submit-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@single-wait-signaled:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@transfer-timeline-point:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-all-complex:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-all-delayed-signal:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-all-for-submit-complex:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-all-for-submit-delayed-submit:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-all-for-submit-snapshot:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-all-interrupted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-all-snapshot:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-any-complex:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-any-interrupted:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-any-snapshot:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-delayed-signal:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-for-submit-complex:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-for-submit-delayed-submit:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-for-submit-snapshot:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4848_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw5/igt@gem_pread@display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw8/igt@gem_pread@display.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-snb5/igt@gem_pread@display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-snb1/igt@gem_pread@display.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-glk1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">DMESG-WARN</a> (<a href="">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-overlay-size-128:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-snb2/igt@kms_plane_cursor@pipe-b-overlay-size-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-snb4/igt@kms_plane_cursor@pipe-b-overlay-size-128.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw8/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw2/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-iclb4/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb7/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-tglb1/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-tglb2/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@bcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw5/igt@prime_busy@hang-wait@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw1/igt@prime_busy@hang-wait@bcs0.html">FAIL</a> ([i915#2258]) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-apl2/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / [i915#716]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-apl7/igt@gen9_exec_parse@allowed-all.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-kbl2/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / [i915#716]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-kbl7/igt@gen9_exec_parse@allowed-all.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@small-bo:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-apl3/igt@kms_addfb_basic@small-bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-apl6/igt@kms_addfb_basic@small-bo.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-snb1/igt@kms_addfb_basic@small-bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-snb5/igt@kms_addfb_basic@small-bo.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-iclb3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-random:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw7/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> ([i915#2055]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">DMESG-WARN</a> (<a href="">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-iclb7/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-apl8/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / [i915#31]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-apl1/igt@kms_setmode@basic.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-kbl7/igt@kms_setmode@basic.html">FAIL</a> ([i915#31]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-kbl6/igt@kms_setmode@basic.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-forked-busy-hang:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-apl2/igt@kms_vblank@pipe-a-query-forked-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-apl8/igt@kms_vblank@pipe-a-query-forked-busy-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@after-wait@vcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw6/igt@prime_busy@after-wait@vcs0.html">FAIL</a> ([i915#2258]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw5/igt@prime_busy@after-wait@vcs0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-apl3/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-apl2/igt@gem_exec_reloc@basic-concurrent16.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-hsw2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-hsw8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-random:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-snb1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-snb4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8838/shard-snb1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4848/shard-snb1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============3752849111421425007==--

--===============0710962354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0710962354==--
