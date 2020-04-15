Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Apr 2020 10:12:09 -0000
Message-ID: <158694552973.21014.16828123506067523726@emeril.freedesktop.org>
References: <20200414102800.2867147-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200414102800.2867147-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Iga21zX2Zs?=
 =?utf-8?q?ip=3A_Convert_to_dynamic_CRTC_test_groups_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: kms_flip: Convert to dynamic CRTC test groups (rev3)
URL   : https://patchwork.freedesktop.org/series/75827/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8295_full -> IGTPW_4458_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4458_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4458_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4458/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4458_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4458/shard-tglb8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * {igt@kms_flip@flip-vs-expired-vblank@c-dp1} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4458/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1} (NEW):
    - shard-kbl:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4458/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8295_full and IGTPW_4458_full:

### New IGT tests (761) ###

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.50] s

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.44] s

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.46] s

  * igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.55] s

  * igt@kms_flip@2x-absolute-wf_vblank@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.47] s

  * igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.44] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.54] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.47] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.45] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.64] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.49] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.44] s

  * igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.80] s

  * igt@kms_flip@2x-blocking-wf_vblank@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.77] s

  * igt@kms_flip@2x-blocking-wf_vblank@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.75] s

  * igt@kms_flip@2x-busy-flip@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_flip@2x-busy-flip@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_flip@2x-busy-flip@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.12] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.81] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.83] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.00] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.85] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.80] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.77] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.80] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.74] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.74] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_flip@2x-flip-vs-dpms@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [7.51] s

  * igt@kms_flip@2x-flip-vs-dpms@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [7.27] s

  * igt@kms_flip@2x-flip-vs-dpms@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [7.22] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.48] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.44] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.42] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.50] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.46] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.44] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.80] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.54] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.52] s

  * igt@kms_flip@2x-flip-vs-fences@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.66] s

  * igt@kms_flip@2x-flip-vs-fences@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.66] s

  * igt@kms_flip@2x-flip-vs-fences@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.46] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [31.01] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [29.95] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [30.01] s

  * igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [7.25] s

  * igt@kms_flip@2x-flip-vs-modeset@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [7.16] s

  * igt@kms_flip@2x-flip-vs-modeset@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [6.98] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.58] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.52] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.47] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [19.21] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [20.02] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [19.96] s

  * igt@kms_flip@2x-flip-vs-panning@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.52] s

  * igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.54] s

  * igt@kms_flip@2x-flip-vs-panning@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.50] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.63] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.47] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.44] s

  * igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.51] s

  * igt@kms_flip@2x-flip-vs-rmfb@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.44] s

  * igt@kms_flip@2x-flip-vs-rmfb@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.47] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.85] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.70] s

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.86] s

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.93] s

  * igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.98] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.10] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.08] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.16] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.08] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.06] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.28] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.30] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.19] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.36] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.30] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.39] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_flip@2x-nonexisting-fb@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_flip@2x-nonexisting-fb@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.80] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.72] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.74] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.77] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.75] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.73] s

  * igt@kms_flip@2x-plain-flip-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.85] s

  * igt@kms_flip@2x-plain-flip-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.81] s

  * igt@kms_flip@2x-plain-flip-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.77] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.77] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.75] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.73] s

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.82] s

  * igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.78] s

  * igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.74] s

  * igt@kms_flip@2x-plain-flip@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.88] s

  * igt@kms_flip@2x-plain-flip@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.80] s

  * igt@kms_flip@2x-plain-flip@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.79] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.96] s

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.89] s

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.73] s

  * igt@kms_flip@2x-wf_vblank-ts-check@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.89] s

  * igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.75] s

  * igt@kms_flip@2x-wf_vblank-ts-check@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.74] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.21, 10.26] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.75, 11.37] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.46] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.27] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.19] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.23, 10.26] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.69, 11.38] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.25] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.26] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.19] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.20, 10.25] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@c-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.71, 11.39] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@c-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.28] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.25] s

  * igt@kms_flip@absolute-wf_vblank-interruptible@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [8.70] s

  * igt@kms_flip@absolute-wf_vblank@a-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.29, 10.46] s

  * igt@kms_flip@absolute-wf_vblank@a-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.80, 11.42] s

  * igt@kms_flip@absolute-wf_vblank@a-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.55] s

  * igt@kms_flip@absolute-wf_vblank@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.26] s

  * igt@kms_flip@absolute-wf_vblank@a-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.32] s

  * igt@kms_flip@absolute-wf_vblank@b-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.20, 10.27] s

  * igt@kms_flip@absolute-wf_vblank@b-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.69, 11.18] s

  * igt@kms_flip@absolute-wf_vblank@b-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.25] s

  * igt@kms_flip@absolute-wf_vblank@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.26] s

  * igt@kms_flip@absolute-wf_vblank@b-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.19] s

  * igt@kms_flip@absolute-wf_vblank@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.20, 10.26] s

  * igt@kms_flip@absolute-wf_vblank@c-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.70, 11.20] s

  * igt@kms_flip@absolute-wf_vblank@c-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.26] s

  * igt@kms_flip@absolute-wf_vblank@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.24] s

  * igt@kms_flip@absolute-wf_vblank@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [8.71] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [6.91, 7.04] s

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [7.29, 8.55] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [3.82] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.66] s

  * igt@kms_flip@basic-flip-vs-dpms@a-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.17] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [6.90, 6.93] s

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [6.89, 8.12] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [3.57] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.56] s

  * igt@kms_flip@basic-flip-vs-dpms@b-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.11] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [6.90, 7.03] s

  * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [6.91, 8.12] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [3.56] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.56] s

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [6.91] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [6.90, 7.11] s

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [7.30, 8.54] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [3.79] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.58] s

  * igt@kms_flip@basic-flip-vs-modeset@a-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.15] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [6.92, 6.95] s

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [6.89, 8.12] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [3.56] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.47] s

  * igt@kms_flip@basic-flip-vs-modeset@b-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [10.14] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [6.94, 6.96] s

  * igt@kms_flip@basic-flip-vs-modeset@c-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [6.91, 8.12] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [3.56] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.46] s

  * igt@kms_flip@basic-flip-vs-modeset@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [6.92] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [3.83, 3.91] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [3.92, 5.01] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [2.41] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [5.45] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [3.81, 3.88] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [3.96, 4.97] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [5.44] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [3.81, 3.88] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [3.90, 4.99] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.90] s

  * igt@kms_flip@basic-plain-flip@a-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [3.54, 3.63] s

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [3.71, 4.61] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.95] s

  * igt@kms_flip@basic-plain-flip@b-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [3.53, 3.60] s

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [3.70, 4.59] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [1.94] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.94] s

  * igt@kms_flip@basic-plain-flip@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [3.53, 3.60] s

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [3.71, 4.54] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [1.94] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.94] s

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.71] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.21, 10.29] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.78, 11.42] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.63] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.26] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.19] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.23, 10.43] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.69, 11.38] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.29] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.26] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.19] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.21, 10.27] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.70, 11.39] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.25] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.27] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [8.71] s

  * igt@kms_flip@blocking-absolute-wf_vblank@a-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.78, 11.39] s

  * igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.62] s

  * igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.46] s

  * igt@kms_flip@blocking-absolute-wf_vblank@a-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.29] s

  * igt@kms_flip@blocking-absolute-wf_vblank@b-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.76, 11.37] s

  * igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.44] s

  * igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.27] s

  * igt@kms_flip@blocking-absolute-wf_vblank@b-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.19] s

  * igt@kms_flip@blocking-absolute-wf_vblank@c-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.70, 11.39] s

  * igt@kms_flip@blocking-absolute-wf_vblank@c-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.44] s

  * igt@kms_flip@blocking-absolute-wf_vblank@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.26] s

  * igt@kms_flip@blocking-absolute-wf_vblank@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [8.71] s

  * igt@kms_flip@blocking-wf_vblank@a-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.50, 10.57] s

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.93, 11.70] s

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.74] s

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.56] s

  * igt@kms_flip@blocking-wf_vblank@a-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.48] s

  * igt@kms_flip@blocking-wf_vblank@b-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.54, 10.64] s

  * igt@kms_flip@blocking-wf_vblank@b-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.95, 11.63] s

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.55] s

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.53] s

  * igt@kms_flip@blocking-wf_vblank@b-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.47] s

  * igt@kms_flip@blocking-wf_vblank@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.46, 10.54] s

  * igt@kms_flip@blocking-wf_vblank@c-edp1:
    - Statuses : 2 pass(s)

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4458/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
