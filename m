Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 12 Apr 2020 00:50:07 -0000
Message-ID: <158665260728.22939.10108326676300222393@emeril.freedesktop.org>
References: <20200411111427.2749626-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200411111427.2749626-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=5D_igt=3A_Allow_=27=3A=27_in_subtest_na?=
 =?utf-8?q?mes_=28rev2=29?=
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

Series: series starting with [i-g-t] igt: Allow ':' in subtest names (rev2)
URL   : https://patchwork.freedesktop.org/series/75832/
State : success

== Summary ==

CI Bug Log - changes from IGT_5588_full -> IGTPW_4449_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4449/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4449_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a::edp-1} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4449/shard-tglb8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a::edp-1.html

  * {igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c::dp-1} (NEW):
    - shard-kbl:          NOTRUN -> [INCOMPLETE][2] +8 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4449/shard-kbl6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c::dp-1.html

  * {igt@kms_flip@flip-vs-fences-interruptible@b::dp-1} (NEW):
    - shard-apl:          NOTRUN -> [INCOMPLETE][3] +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4449/shard-apl2/igt@kms_flip@flip-vs-fences-interruptible@b::dp-1.html

  
New tests
---------

  New tests have been introduced between IGT_5588_full and IGTPW_4449_full:

### New IGT tests (974) ###

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.49] s

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.37] s

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.46] s

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.37] s

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.45] s

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.37] s

  * igt@kms_flip@2x-absolute-wf_vblank@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.52] s

  * igt@kms_flip@2x-absolute-wf_vblank@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.37] s

  * igt@kms_flip@2x-absolute-wf_vblank@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.47] s

  * igt@kms_flip@2x-absolute-wf_vblank@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.37] s

  * igt@kms_flip@2x-absolute-wf_vblank@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.43] s

  * igt@kms_flip@2x-absolute-wf_vblank@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.37] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.51] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.37] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.47] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.38] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.43] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.34] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.67] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.68] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.44] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-wf_vblank@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.97] s

  * igt@kms_flip@2x-blocking-wf_vblank@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.66] s

  * igt@kms_flip@2x-blocking-wf_vblank@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.75] s

  * igt@kms_flip@2x-blocking-wf_vblank@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.66] s

  * igt@kms_flip@2x-blocking-wf_vblank@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.73] s

  * igt@kms_flip@2x-blocking-wf_vblank@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.62] s

  * igt@kms_flip@2x-busy-flip@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_flip@2x-busy-flip@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@2x-busy-flip@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_flip@2x-busy-flip@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@2x-busy-flip@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_flip@2x-busy-flip@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.28] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.87] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.83] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.86] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.07] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.91] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.77] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.86] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.05] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.84] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.80] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.65] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.75] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.66] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.72] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.65] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.80] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.66] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.73] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.65] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.73] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.66] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.87] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.69] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.76] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.65] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.74] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.64] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@2x-flip-vs-dpms@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.35] s

  * igt@kms_flip@2x-flip-vs-dpms@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.99] s

  * igt@kms_flip@2x-flip-vs-dpms@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.06] s

  * igt@kms_flip@2x-flip-vs-dpms@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.94] s

  * igt@kms_flip@2x-flip-vs-dpms@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.09] s

  * igt@kms_flip@2x-flip-vs-dpms@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.93] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.54] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.23] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.51] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.22] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.48] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.21] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.48] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.24] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.44] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.22] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.42] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.22] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.56] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.30] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.70] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.26] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.66] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.30] s

  * igt@kms_flip@2x-flip-vs-fences@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.53] s

  * igt@kms_flip@2x-flip-vs-fences@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.34] s

  * igt@kms_flip@2x-flip-vs-fences@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.57] s

  * igt@kms_flip@2x-flip-vs-fences@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.24] s

  * igt@kms_flip@2x-flip-vs-fences@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.66] s

  * igt@kms_flip@2x-flip-vs-fences@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.28] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [30.36] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [12.04] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [30.01] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [12.03] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [30.03] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [11.97] s

  * igt@kms_flip@2x-flip-vs-modeset@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.44] s

  * igt@kms_flip@2x-flip-vs-modeset@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.95] s

  * igt@kms_flip@2x-flip-vs-modeset@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.11] s

  * igt@kms_flip@2x-flip-vs-modeset@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.99] s

  * igt@kms_flip@2x-flip-vs-modeset@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.02] s

  * igt@kms_flip@2x-flip-vs-modeset@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.99] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.59] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.45] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.52] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.39] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.46] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.37] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [20.38] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [12.63] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [19.97] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [12.02] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [20.02] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [11.97] s

  * igt@kms_flip@2x-flip-vs-panning@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.51] s

  * igt@kms_flip@2x-flip-vs-panning@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.22] s

  * igt@kms_flip@2x-flip-vs-panning@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.50] s

  * igt@kms_flip@2x-flip-vs-panning@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.23] s

  * igt@kms_flip@2x-flip-vs-panning@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.49] s

  * igt@kms_flip@2x-flip-vs-panning@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.21] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.51] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.19] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.46] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.19] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.45] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.19] s

  * igt@kms_flip@2x-flip-vs-rmfb@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.47] s

  * igt@kms_flip@2x-flip-vs-rmfb@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.21] s

  * igt@kms_flip@2x-flip-vs-rmfb@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.45] s

  * igt@kms_flip@2x-flip-vs-rmfb@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.21] s

  * igt@kms_flip@2x-flip-vs-rmfb@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.44] s

  * igt@kms_flip@2x-flip-vs-rmfb@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.21] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.99] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.73] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.83] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.62] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.92] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.66] s

  * igt@kms_flip@2x-flip-vs-suspend@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.93] s

  * igt@kms_flip@2x-flip-vs-suspend@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-suspend@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.93] s

  * igt@kms_flip@2x-flip-vs-suspend@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-suspend@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.80] s

  * igt@kms_flip@2x-flip-vs-suspend@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.13] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.28] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.09] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.08] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.06] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.10] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.16] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.99] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.11] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.99] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.08] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.97] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.42] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.88] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.35] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.89] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.13] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.88] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.19] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.45] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.36] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_flip@2x-nonexisting-fb@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.03] s

  * igt@kms_flip@2x-nonexisting-fb@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_flip@2x-nonexisting-fb@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_flip@2x-nonexisting-fb@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.78] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.49] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.73] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.51] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.71] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.51] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.91] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.50] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.72] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.49] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.71] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.50] s

  * igt@kms_flip@2x-plain-flip-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.84] s

  * igt@kms_flip@2x-plain-flip-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.56] s

  * igt@kms_flip@2x-plain-flip-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.79] s

  * igt@kms_flip@2x-plain-flip-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.54] s

  * igt@kms_flip@2x-plain-flip-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.78] s

  * igt@kms_flip@2x-plain-flip-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.56] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.82] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.64] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.77] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.58] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.73] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.60] s

  * igt@kms_flip@2x-plain-flip-ts-check@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.80] s

  * igt@kms_flip@2x-plain-flip-ts-check@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.50] s

  * igt@kms_flip@2x-plain-flip-ts-check@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.75] s

  * igt@kms_flip@2x-plain-flip-ts-check@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.51] s

  * igt@kms_flip@2x-plain-flip-ts-check@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [10.73] s

  * igt@kms_flip@2x-plain-flip-ts-check@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.49] s

  * igt@kms_flip@2x-plain-flip@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.81] s

  * igt@kms_flip@2x-plain-flip@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.56] s

  * igt@kms_flip@2x-plain-flip@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.80] s

  * igt@kms_flip@2x-plain-flip@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.54] s

  * igt@kms_flip@2x-plain-flip@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.79] s

  * igt@kms_flip@2x-plain-flip@

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4449/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
