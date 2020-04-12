Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 12 Apr 2020 00:29:17 -0000
Message-ID: <158665135768.22939.14147643159411981386@emeril.freedesktop.org>
References: <20200411111427.2749626-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200411111427.2749626-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_igt=3A_Allow_=27=3A=27_in_subt?=
 =?utf-8?q?est_names?=
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

Series: series starting with [i-g-t,1/2] igt: Allow ':' in subtest names
URL   : https://patchwork.freedesktop.org/series/75832/
State : success

== Summary ==

CI Bug Log - changes from IGT_5588_full -> IGTPW_4448_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4448/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4448_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_flip@basic-flip-vs-dpms@c::dp-1} (NEW):
    - shard-kbl:          NOTRUN -> [INCOMPLETE][1] +128 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4448/shard-kbl1/igt@kms_flip@basic-flip-vs-dpms@c::dp-1.html

  * {igt@kms_flip@bo-too-big@c::edp-1} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][2] +179 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4448/shard-tglb5/igt@kms_flip@bo-too-big@c::edp-1.html

  * {igt@kms_flip@flip-vs-rmfb-interruptible@a::dp-1} (NEW):
    - shard-apl:          NOTRUN -> [INCOMPLETE][3] +127 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4448/shard-apl3/igt@kms_flip@flip-vs-rmfb-interruptible@a::dp-1.html

  * {igt@kms_flip@plain-flip-fb-recreate-interruptible@b::edp-1} (NEW):
    - shard-iclb:         NOTRUN -> [INCOMPLETE][4] +134 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4448/shard-iclb7/igt@kms_flip@plain-flip-fb-recreate-interruptible@b::edp-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_wait@busy@bcs0}:
    - shard-glk:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/shard-glk2/igt@gem_wait@busy@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4448/shard-glk1/igt@gem_wait@busy@bcs0.html

  
New tests
---------

  New tests have been introduced between IGT_5588_full and IGTPW_4448_full:

### New IGT tests (972) ###

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-absolute-wf_vblank@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-absolute-wf_vblank@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-absolute-wf_vblank@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-absolute-wf_vblank@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-absolute-wf_vblank@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-absolute-wf_vblank@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-wf_vblank@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-wf_vblank@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-wf_vblank@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-wf_vblank@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-wf_vblank@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-wf_vblank@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-busy-flip@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-busy-flip@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-busy-flip@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-busy-flip@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-busy-flip@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-busy-flip@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-dpms@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-expired-vblank@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-fences-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-fences@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-fences@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-fences@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-fences@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-fences@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-fences@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-modeset@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-modeset@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-modeset@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-modeset@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-modeset@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-modeset@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-rmfb@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-rmfb@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-rmfb@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-rmfb@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-rmfb@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-rmfb@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-suspend@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-suspend@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-suspend@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-suspend@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-suspend@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-suspend@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-wf_vblank@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-modeset-vs-vblank-race@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-nonexisting-fb@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-interruptible@b:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-interruptible@b:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@a:b::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@a:b::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@a:c::hdmi-a-1:hdmi-a-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@a:c::vga-1:hdmi-a-1:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4448/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
