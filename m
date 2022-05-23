Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4959394407430163449=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Mon, 23 May 2022 19:31:39 -0000
Message-ID: <165333429901.9280.14980478028621022082@emeril.freedesktop.org>
References: <20220523114422.19112-1-jeevan.b@intel.com>
In-Reply-To: <20220523114422.19112-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZW5hYmxl?=
 =?utf-8?q?_4-tiled_ccs_modifiers_on_dg2_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============4959394407430163449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: enable 4-tiled ccs modifiers on dg2 (rev5)
URL   : https://patchwork.freedesktop.org/series/102335/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11690_full -> IGTPW_7157_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7157_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7157_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7157_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_mc_ccs} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb8/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_mc_ccs.html
    - {shard-tglu}:       NOTRUN -> [SKIP][2] +10 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglu-8/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_mc_ccs.html

  * {igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][3] +10 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-dg1-12/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc}:
    - {shard-tglu}:       NOTRUN -> [SKIP][4] +6 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglu-1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html
    - {shard-dg1}:        NOTRUN -> [SKIP][5] +7 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-dg1-18/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html

  * {igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc}:
    - shard-tglb:         NOTRUN -> [SKIP][6] +6 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html

  * {igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1}:
    - shard-glk:          NOTRUN -> [FAIL][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk1/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@pipe-d-tiling-x:
    - {shard-dg1}:        [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-dg1-19/igt@kms_plane_lowres@pipe-d-tiling-x.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-dg1-15/igt@kms_plane_lowres@pipe-d-tiling-x.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11690_full and IGTPW_7157_full:

### New IGT tests (159) ###

  * igt@api_intel_allocator@reloc-allocator:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@simple-allocator:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_busy@parallel:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_cs_tlb@engines@bcs0:
    - Statuses : 9 pass(s)
    - Exec time: [2.15, 2.67] s

  * igt@gem_cs_tlb@engines@rcs0:
    - Statuses : 9 pass(s)
    - Exec time: [2.15, 2.16] s

  * igt@gem_cs_tlb@engines@vcs0:
    - Statuses : 9 pass(s)
    - Exec time: [2.15, 2.25] s

  * igt@gem_cs_tlb@engines@vcs1:
    - Statuses : 4 pass(s)
    - Exec time: [2.15, 2.27] s

  * igt@gem_cs_tlb@engines@vecs0:
    - Statuses : 8 pass(s)
    - Exec time: [2.15, 2.37] s

  * igt@gem_exec_async@concurrent-writes:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_gttfill@engines@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [27.38, 28.80] s

  * igt@gem_exec_parallel@basic@bcs0:
    - Statuses : 8 pass(s)
    - Exec time: [1.57, 3.57] s

  * igt@gem_exec_parallel@basic@rcs0:
    - Statuses : 8 pass(s)
    - Exec time: [1.48, 3.36] s

  * igt@gem_exec_parallel@basic@vcs0:
    - Statuses : 8 pass(s)
    - Exec time: [1.46, 3.37] s

  * igt@gem_exec_parallel@basic@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [1.58, 2.33] s

  * igt@gem_exec_parallel@basic@vecs0:
    - Statuses : 8 pass(s)
    - Exec time: [1.46, 3.38] s

  * igt@gem_exec_parallel@contexts@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [2.68, 5.37] s

  * igt@gem_exec_schedule@fifo:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@implicit-boths@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.18] s

  * igt@gem_exec_schedule@implicit-boths@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.18] s

  * igt@gem_exec_schedule@implicit-boths@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.15] s

  * igt@gem_exec_schedule@implicit-boths@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@gem_exec_schedule@implicit-boths@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.17] s

  * igt@gem_exec_schedule@implicit-write-read@vcs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.06, 0.12] s

  * igt@gem_exec_schedule@independent:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@lateslice@bcs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_exec_schedule@lateslice@rcs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_exec_schedule@lateslice@vcs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_exec_schedule@lateslice@vcs1:
    - Statuses : 5 pass(s)
    - Exec time: [0.02] s

  * igt@gem_exec_schedule@lateslice@vecs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_exec_schedule@out-order@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.18] s

  * igt@gem_exec_schedule@out-order@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.19] s

  * igt@gem_exec_schedule@out-order@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@gem_exec_schedule@out-order@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.16] s

  * igt@gem_mmap_offset@ptrace:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_wait@busy@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.51] s

  * igt@gem_wait@write-busy@all:
    - Statuses : 8 pass(s)
    - Exec time: [0.52, 0.57] s

  * igt@gem_wait@write-busy@bcs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@gem_wait@write-busy@rcs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@gem_wait@write-busy@vcs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@gem_wait@write-busy@vcs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@gem_wait@write-busy@vecs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.51, 0.53] s

  * igt@gem_wait@write-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_mc_ccs:
    - Statuses : 9 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 9 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.77] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.71] s

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.51] s

  * igt@kms_flip@2x-busy-flip@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_flip@2x-busy-flip@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_flip@2x-busy-flip@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.59] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.18] s

  * igt@kms_flip@2x-dpms-vs-vblank-race@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.12] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [11.09] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.87] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.85] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [2.01] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [14.39] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [14.01] s

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [14.02] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [13.25] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [14.01] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [12.97] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.98] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.89] s

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.83] s

  * igt@kms_flip@2x-plain-flip-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_flip@2x-plain-flip-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_flip@2x-plain-flip-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_flip@absolute-wf_vblank@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [8.77] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [10.72] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.93, 11.64] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - Statuses : 3 pass(s)
    - Exec time: [6.05, 8.14] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.63] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.53] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [10.64] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.95, 11.57] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:
    - Statuses : 3 pass(s)
    - Exec time: [5.62, 8.10] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.60] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.50] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [10.64] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.96, 11.58] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a1:
    - Statuses : 3 pass(s)
    - Exec time: [5.60, 8.10] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.61] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [8.96] s

  * igt@kms_flip@flip-vs-panning@a-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.29, 10.49] s

  * igt@kms_flip@flip-vs-panning@a-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.73, 11.34] s

  * igt@kms_flip@flip-vs-panning@a-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.65] s

  * igt@kms_flip@flip-vs-panning@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.42] s

  * igt@kms_flip@flip-vs-panning@a-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.35] s

  * igt@kms_flip@flip-vs-panning@b-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.35, 10.44] s

  * igt@kms_flip@flip-vs-panning@b-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.76, 11.25] s

  * igt@kms_flip@flip-vs-panning@b-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.39] s

  * igt@kms_flip@flip-vs-panning@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.35] s

  * igt@kms_flip@flip-vs-panning@b-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.20] s

  * igt@kms_flip@flip-vs-panning@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.33, 10.39] s

  * igt@kms_flip@flip-vs-panning@c-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.77, 11.26] s

  * igt@kms_flip@flip-vs-panning@c-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.41] s

  * igt@kms_flip@flip-vs-panning@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_flip@flip-vs-panning@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [8.77] s

  * igt@kms_flip@modeset-vs-vblank-race@a-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [4.27] s

  * igt@kms_flip@modeset-vs-vblank-race@b-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [4.22] s

  * igt@kms_flip@modeset-vs-vblank-race@c-dp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.99] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.89, 11.58] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [8.89] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.55, 10.68] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.98, 11.72] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.83] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.61] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.52] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.52, 10.62] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.93, 11.70] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.57] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.59] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [15.48] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [10.53, 10.62] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [8.90, 11.65] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [5.57] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.59] s

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [8.90] s

  * igt@kms_plane@plane-position-covered:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-accuracy-2:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-accuracy-50:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-idle-check-all@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.62, 0.63] s

  * igt@perf_pmu@enable-race:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@idle-no-semaphores:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@init-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@init-sema:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@most-busy-idle-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@multi-client:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@render-node-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@render-node-busy-idle:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@semaphore-busy@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [1.55, 1.57] s

  * igt@prime_busy@before:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@hang-wait@vcs1:
    - Statuses : 4 pass(s)
    - Exec time: [6.97, 7.04] s

  * igt@prime_vgem@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_vgem@fence-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_vgem@sync@vcs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@prime_vgem@wait:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_7157_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([i915#1839]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@feature_discovery@display-2x.html

  * igt@feature_discovery@display-3x:
    - shard-iclb:         NOTRUN -> [SKIP][11] ([i915#1839]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb6/igt@feature_discovery@display-3x.html

  * igt@gem_ccs@block-copy-inplace:
    - shard-iclb:         NOTRUN -> [SKIP][12] ([i915#5327])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@gem_ccs@block-copy-inplace.html
    - shard-tglb:         NOTRUN -> [SKIP][13] ([i915#3555] / [i915#5325])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb3/igt@gem_ccs@block-copy-inplace.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#1099])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][15] ([i915#5076] / [i915#5614]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb3/igt@gem_exec_balancer@parallel-contexts.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][16] ([i915#5076] / [i915#5614]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl4/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][17] ([i915#5614]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#4525])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][19] ([i915#2846])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl8/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][20] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][21] ([i915#2842])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk8/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-kbl:          [PASS][22] -> [FAIL][23] ([i915#2842]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl3/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][24] ([i915#2842]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#2849])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-snb:          [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-snb5/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#109283])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#112283])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_schedule@semaphore-codependency:
    - shard-snb:          NOTRUN -> [SKIP][31] ([fdo#109271]) +308 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-snb7/igt@gem_exec_schedule@semaphore-codependency.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [PASS][32] -> [DMESG-WARN][33] ([i915#118])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-glk6/igt@gem_exec_whisper@basic-queues-priority-all.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#2190])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@gem_huc_copy@huc-copy.html
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#2190])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl8/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#2190])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk1/igt@gem_huc_copy@huc-copy.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#2190])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb1/igt@gem_huc_copy@huc-copy.html
    - shard-kbl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#2190])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#4613]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#4613]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl7/igt@gem_lmem_swapping@heavy-verify-multi.html
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#4613])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@gem_lmem_swapping@heavy-verify-multi.html
    - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#4613])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl7/igt@gem_lmem_swapping@heavy-verify-multi.html
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#4613])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk2/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111656])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@gem_mmap_gtt@coherency.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109292])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][46] ([i915#2658])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][47] ([i915#2658])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk7/igt@gem_pread@exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][48] ([i915#2658])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl3/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][49] ([i915#2658]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb6/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][50] ([i915#2658])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-snb2/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][51] ([i915#2658])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl1/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#4270]) +5 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb6/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#4270]) +4 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([i915#768]) +4 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][55] ([fdo#109271]) +184 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109312])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109312])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb3/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#3297])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb8/igt@gem_userptr_blits@unsync-overlap.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([i915#3297])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb2/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109289]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109289]) +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb1/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][62] -> [DMESG-WARN][63] ([i915#5566] / [i915#716])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk6/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#2856]) +4 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb5/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#2527] / [i915#2856]) +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb1/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#1904])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([i915#4281])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#111644] / [i915#1397] / [i915#2411]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#110892]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][71] ([i915#2373])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][72] ([i915#1759])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#5903])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb1/igt@i915_suspend@basic-s3-without-i915.html
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#5903])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb5/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#1769])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb5/igt@kms_atomic_transition@plane-all-modeset-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#1769])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#5286]) +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#5286]) +4 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#111614]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#111615]) +5 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#110723]) +4 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#2705])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][84] ([i915#2705])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb5/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][85] ([fdo#109271]) +241 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl3/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#3886]) +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk7/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109278] / [i915#3886]) +8 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#3886]) +4 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#3886]) +7 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl6/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#3689] / [i915#3886]) +4 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * {igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][91] ([i915#4070]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#111615] / [i915#3689]) +6 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#3689]) +36 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb8/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_mc_ccs.html

  * {igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][94] ([i915#4098]) +9 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-2/igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs.html

  * igt@kms_chamelium@dp-crc-single:
    - shard-snb:          NOTRUN -> [SKIP][95] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-snb7/igt@kms_chamelium@dp-crc-single.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-glk:          NOTRUN -> [SKIP][96] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk8/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_chamelium@vga-frame-dump:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#109284] / [fdo#111827]) +11 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@kms_chamelium@vga-frame-dump.html

  * igt@kms_color@pipe-a-deep-color:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109278] / [i915#3555]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb6/igt@kms_color@pipe-a-deep-color.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [fdo#111827]) +14 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl3/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-apl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl3/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109284] / [fdo#111827]) +12 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@kms_color_chamelium@pipe-c-gamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][103] ([i915#1319]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl1/igt@kms_content_protection@atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb6/igt@kms_content_protection@atomic.html
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#1063])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#3116])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglb:         NOTRUN -> [SKIP][107] ([i915#3116] / [i915#3299])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([i915#3359]) +6 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([i915#3319]) +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][111] ([fdo#109279] / [i915#3359]) +3 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x512-random.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([fdo#109278]) +93 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([fdo#109274] / [fdo#109278]) +6 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#533])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl6/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#109274]) +11 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@kms_display_modes@extended-mode-basic.html
    - shard-tglb:         NOTRUN -> [SKIP][116] ([fdo#109274])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - shard-iclb:         NOTRUN -> [SKIP][117] ([i915#3528])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([i915#5287]) +2 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][119] ([i915#5287]) +3 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled.html

  * igt@kms_dsc@xrgb8888-dsc-compression:
    - shard-tglb:         NOTRUN -> [SKIP][120] ([i915#3828])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@kms_dsc@xrgb8888-dsc-compression.html
    - shard-iclb:         NOTRUN -> [SKIP][121] ([i915#3828])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb8/igt@kms_dsc@xrgb8888-dsc-compression.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([fdo#109274] / [fdo#111825]) +15 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][123] -> [FAIL][124] ([i915#2122])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [PASS][125] -> [FAIL][126] ([i915#79])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [PASS][127] -> [DMESG-WARN][128] ([i915#180]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [PASS][129] -> [DMESG-WARN][130] ([i915#180]) +4 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-glk:          [PASS][131] -> [FAIL][132] ([i915#4911])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][133] ([fdo#109280]) +31 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-iclb:         NOTRUN -> [SKIP][134] ([i915#5438])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][135] ([fdo#109280] / [fdo#111825]) +29 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-glk:          NOTRUN -> [SKIP][136] ([fdo#109271] / [i915#533])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk6/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html
    - shard-apl:          NOTRUN -> [SKIP][137] ([fdo#109271] / [i915#533])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl3/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][138] ([fdo#108145] / [i915#265])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][139] ([i915#3536]) +2 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb6/igt@kms_plane_lowres@pipe-b-tiling-x.html
    - shard-tglb:         NOTRUN -> [SKIP][140] ([i915#3536])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@kms_plane_lowres@pipe-b-tiling-x.html

  * igt@kms_plane_lowres@pipe-c-tiling-4:
    - shard-iclb:         NOTRUN -> [SKIP][141] ([i915#5288])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb3/igt@kms_plane_lowres@pipe-c-tiling-4.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][142] ([fdo#111615] / [fdo#112054])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb8/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][143] ([i915#5288])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-a-tiling-4.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale:
    - shard-tglb:         NOTRUN -> [SKIP][144] ([i915#5235]) +7 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale:
    - shard-iclb:         NOTRUN -> [SKIP][145] ([i915#5235]) +5 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         NOTRUN -> [SKIP][146] ([i915#658]) +2 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-glk:          NOTRUN -> [SKIP][147] ([fdo#109271] / [i915#658]) +1 similar issue
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk8/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
    - shard-apl:          NOTRUN -> [SKIP][148] ([fdo#109271] / [i915#658]) +2 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl4/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
    - shard-tglb:         NOTRUN -> [SKIP][149] ([i915#2920]) +1 similar issue
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglb:         NOTRUN -> [SKIP][150] ([i915#1911])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-iclb:         NOTRUN -> [SKIP][151] ([fdo#109642] / [fdo#111068] / [i915#658])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-kbl:          NOTRUN -> [SKIP][152] ([fdo#109271] / [i915#658]) +5 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl1/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-iclb:         [PASS][153] -> [SKIP][154] ([fdo#109642] / [fdo#111068] / [i915#658])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][155] ([i915#132] / [i915#3467]) +3 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb3/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         NOTRUN -> [SKIP][156] ([fdo#109441]) +4 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglb:         NOTRUN -> [SKIP][157] ([fdo#111615] / [i915#5289])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@basic@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][158] ([i915#5465]) +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-snb4/igt@kms_setmode@basic@pipe-a-vga-1.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-iclb:         NOTRUN -> [SKIP][159] ([i915#3555]) +1 similar issue
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@pipe-a-query-forked-busy-hang:
    - shard-apl:          [PASS][160] -> [SKIP][161] ([fdo#109271])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-apl3/igt@kms_vblank@pipe-a-query-forked-busy-hang.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl1/igt@kms_vblank@pipe-a-query-forked-busy-hang.html
    - shard-glk:          [PASS][162] -> [SKIP][163] ([fdo#109271])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-glk3/igt@kms_vblank@pipe-a-query-forked-busy-hang.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk9/igt@kms_vblank@pipe-a-query-forked-busy-hang.html

  * igt@kms_vblank@pipe-d-wait-forked-hang:
    - shard-apl:          NOTRUN -> [SKIP][164] ([fdo#109271]) +218 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl2/igt@kms_vblank@pipe-d-wait-forked-hang.html

  * igt@kms_vrr@flip-basic:
    - shard-tglb:         NOTRUN -> [SKIP][165] ([i915#3555]) +3 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb3/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][166] ([fdo#109271] / [i915#2437])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk2/igt@kms_writeback@writeback-fb-id.html
    - shard-apl:          NOTRUN -> [SKIP][167] ([fdo#109271] / [i915#2437])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl7/igt@kms_writeback@writeback-fb-id.html
    - shard-tglb:         NOTRUN -> [SKIP][168] ([i915#2437])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@kms_writeback@writeback-fb-id.html
    - shard-iclb:         NOTRUN -> [SKIP][169] ([i915#2437])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb2/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][170] ([fdo#109271] / [i915#2437]) +1 similar issue
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][171] ([i915#2530]) +2 similar issues
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][172] ([i915#2530]) +2 similar issues
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb3/igt@nouveau_crc@pipe-d-ctx-flip-detection.html
    - shard-iclb:         NOTRUN -> [SKIP][173] ([fdo#109278] / [i915#2530])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb7/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-iclb:         NOTRUN -> [SKIP][174] ([fdo#112283]) +1 similar issue
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb5/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_nv_api@nv_i915_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][175] ([fdo#109291]) +5 similar issues
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb3/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html

  * igt@prime_nv_api@nv_self_import:
    - shard-tglb:         NOTRUN -> [SKIP][176] ([fdo#109291]) +5 similar issues
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@prime_nv_api@nv_self_import.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-iclb:         NOTRUN -> [SKIP][177] ([fdo#109295])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb1/igt@prime_vgem@fence-flip-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][178] ([fdo#109295])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@prime_vgem@fence-flip-hang.html

  * igt@sysfs_clients@fair-1:
    - shard-glk:          NOTRUN -> [SKIP][179] ([fdo#109271] / [i915#2994]) +2 similar issues
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk3/igt@sysfs_clients@fair-1.html
    - shard-iclb:         NOTRUN -> [SKIP][180] ([i915#2994]) +3 similar issues
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb6/igt@sysfs_clients@fair-1.html
    - shard-apl:          NOTRUN -> [SKIP][181] ([fdo#109271] / [i915#2994]) +3 similar issues
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl6/igt@sysfs_clients@fair-1.html
    - shard-tglb:         NOTRUN -> [SKIP][182] ([i915#2994]) +2 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@split-50:
    - shard-kbl:          NOTRUN -> [SKIP][183] ([fdo#109271] / [i915#2994]) +3 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl7/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - {shard-rkl}:        [SKIP][184] ([i915#2582]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-2/igt@fbdev@read.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@fbdev@read.html

  * igt@fbdev@unaligned-write:
    - {shard-rkl}:        ([PASS][186], [SKIP][187]) ([i915#2582]) -> [PASS][188]
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-1/igt@fbdev@unaligned-write.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-4/igt@fbdev@unaligned-write.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@fbdev@unaligned-write.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][189] ([i915#3070]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-iclb1/igt@gem_eio@unwedge-stress.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - {shard-rkl}:        [FAIL][191] ([i915#2842]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-2/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [FAIL][193] ([i915#2842]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - {shard-tglu}:       [FAIL][195] ([i915#2842]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglu-1/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - {shard-rkl}:        ([FAIL][197], [PASS][198]) ([i915#2842]) -> [PASS][199]
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][200] ([i915#2842]) -> [PASS][201] +3 similar issues
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
    - shard-glk:          [FAIL][202] ([i915#2842]) -> [PASS][203] +1 similar issue
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-snb:          [SKIP][204] ([fdo#109271]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-snb6/igt@gem_exec_flush@basic-wb-rw-default.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-snb5/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-scanout@vecs0:
    - {shard-rkl}:        [SKIP][206] ([i915#3639]) -> [PASS][207] +3 similar issues
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-1/igt@gem_exec_reloc@basic-scanout@vecs0.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@gem_exec_reloc@basic-scanout@vecs0.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [DMESG-WARN][208] ([i915#118]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-glk4/igt@gem_exec_whisper@basic-contexts-all.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk7/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_softpin@evict-single-offset:
    - {shard-rkl}:        [FAIL][210] ([i915#4171]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-1/igt@gem_softpin@evict-single-offset.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@gem_softpin@evict-single-offset.html

  * igt@i915_pm_backlight@fade:
    - {shard-rkl}:        [SKIP][212] ([i915#3012]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-1/igt@i915_pm_backlight@fade.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@i915_pm_backlight@fade.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][214] ([i915#454]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@fences:
    - shard-iclb:         [INCOMPLETE][216] ([i915#5096]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-iclb4/igt@i915_pm_rpm@fences.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb2/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rps@waitboost:
    - {shard-rkl}:        [FAIL][218] ([i915#4016]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-1/igt@i915_pm_rps@waitboost.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-4/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-snb:          [DMESG-WARN][220] ([i915#4528]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-snb2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - {shard-dg1}:        [SKIP][222] ([i915#2575]) -> [PASS][223] +4 similar issues
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-dg1-13/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-dg1-16/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - {shard-rkl}:        [SKIP][224] ([i915#1845] / [i915#4098]) -> [PASS][225] +17 similar issues
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-1/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-rapid-movement:
    - {shard-rkl}:        ([SKIP][226], [SKIP][227]) ([fdo#112022] / [i915#4070]) -> [PASS][228]
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-2/igt@kms_cursor_crc@pipe-b-cursor-128x128-rapid-movement.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-4/igt@kms_cursor_crc@pipe-b-cursor-128x128-rapid-movement.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-128x128-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding:
    - {shard-rkl}:        [SKIP][229] ([fdo#112022] / [i915#4070]) -> [PASS][230] +2 similar issues
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-2/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:
    - {shard-rkl}:        [SKIP][231] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:
    - {shard-rkl}:        ([SKIP][233], [SKIP][234]) ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][235] +1 similar issue
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-4/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-toggle:
    - {shard-rkl}:        [SKIP][236] ([fdo#111825] / [i915#4070]) -> [PASS][237] +2 similar issues
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-2/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled:
    - {shard-rkl}:        [SKIP][238] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][239] +8 similar issues
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled:
    - {shard-rkl}:        [SKIP][240] ([i915#4098] / [i915#4369]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-4/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled:
    - {shard-rkl}:        ([SKIP][242], [SKIP][243]) ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][244]
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled.html

  * igt@kms_fbcon_fbt@psr:
    - {shard-rkl}:        [SKIP][245] ([fdo#110189] / [i915#3955]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-2/igt@kms_fbcon_fbt@psr.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][247] ([i915#2122]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-glk3/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk6/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-iclb:         [SKIP][249] ([i915#3701]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - {shard-rkl}:        ([SKIP][251], [SKIP][252]) ([i915#1849] / [i915#4098]) -> [PASS][253] +3 similar issues
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [FAIL][254] ([i915#1888] / [i915#2546]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:
    - {shard-rkl}:        [SKIP][256] ([i915#1849] / [i915#4098]) -> [PASS][257] +16 similar issues
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu.html

  * igt@kms_invalid_mode@bad-hsync-start:
    - {shard-rkl}:        [SKIP][258] ([i915#4278]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-4/igt@kms_invalid_mode@bad-hsync-start.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-start.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-b:
    - {shard-rkl}:        ([SKIP][260], [PASS][261]) ([i915#4098]) -> [PASS][262]
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-b.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-b.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-b.html

  * igt@kms_plane_cursor@pipe-a-primary-size-256:
    - {shard-dg1}:        [FAIL][263] -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-dg1-17/igt@kms_plane_cursor@pipe-a-primary-size-256.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-dg1-16/igt@kms_plane_cursor@pipe-a-primary-size-256.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][265] ([fdo#109441]) -> [PASS][266] +2 similar issues
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr@sprite_mmap_cpu:
    - {shard-rkl}:        [SKIP][267] ([i915#1072]) -> [PASS][268] +1 similar issue
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-1/igt@kms_psr@sprite_mmap_cpu.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_psr@sprite_mmap_cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - {shard-rkl}:        [SKIP][269] ([i915#5461]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@perf@gen12-mi-rpc:
    - {shard-dg1}:        [SKIP][271] ([i915#5608]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-dg1-13/igt@perf@gen12-mi-rpc.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-dg1-16/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - {shard-dg1}:        [FAIL][273] ([i915#4349]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-dg1-19/igt@perf_pmu@busy-double-start@rcs0.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-dg1-16/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@testdisplay:
    - {shard-tglu}:       [DMESG-WARN][275] ([i915#4941]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-tglu-5/igt@testdisplay.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglu-1/igt@testdisplay.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][277] ([i915#4525]) -> [DMESG-FAIL][278] ([i915#5614])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][279] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][280] ([i915#1319])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-apl8/igt@kms_content_protection@legacy.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl7/igt@kms_content_protection@legacy.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][281] ([i915#658]) -> [SKIP][282] ([i915#2920])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-iclb1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-iclb:         [SKIP][283] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][284] ([i915#5939])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-iclb3/igt@kms_psr2_su@page_flip-p010.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][285], [FAIL][286], [FAIL][287], [FAIL][288]) ([i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][289], [FAIL][290], [FAIL][291], [FAIL][292], [FAIL][293]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-apl3/igt@runner@aborted.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-apl3/igt@runner@aborted.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-apl4/igt@runner@aborted.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-apl3/igt@runner@aborted.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl7/igt@runner@aborted.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl2/igt@runner@aborted.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl6/igt@runner@aborted.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl4/igt@runner@aborted.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109292]: https://bugs.freedesktop.org/show_bug.cgi?id=109292
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3736]: https://gitlab.freedesktop.org/drm/intel/issues/3736
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4807]: https://gitlab.freedesktop.org/drm/intel/issues/4807
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4911]: https://gitlab.freedesktop.org/drm/intel/issues/4911
  [i915#4929]: https://gitlab.freedesktop.org/drm/intel/issues/4929
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5096]: https://gitlab.freedesktop.org/drm/intel/issues/5096
  [i915#5115]: https://gitlab.freedesktop.org/drm/intel/issues/5115
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5303]: https://gitlab.freedesktop.org/drm/intel/issues/5303
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5438]: https://gitlab.freedesktop.org/drm/intel/issues/5438
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * IGT: IGT_6485 -> IGTPW_7157
  * Piglit: piglit_4509 -> None

  CI_DRM_11690: 7420808c59c9be6a025f811ada6e6c860f6562b6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7157: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/index.html
  IGT_6485: 51663917b40d36086cc1c555ce4f67b22937694d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/index.html

--===============4959394407430163449==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>enable 4-tiled ccs modifiers on dg2 (rev5)</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/102335/">https://patchwork.freedesktop.org/series/102335/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7157/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11690_full -&gt; IGTPW_7157_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7157_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7157_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7157=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_mc_ccs} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb8/igt@kms_ccs@pipe-b-crc-primary-basic-4_=
tiled_dg2_mc_ccs.html">SKIP</a> +17 similar issues</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglu-8/igt@kms_ccs@pipe-b-crc-primary-basic-4=
_tiled_dg2_mc_ccs.html">SKIP</a> +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-dg1-12/igt@kms_ccs@pipe-c-random-ccs-data-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> +10 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc}:</p>
<ul>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglu-1/igt@kms_ccs@pipe-b-crc-primary-rotatio=
n-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> +6 similar issues</p>
</li>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-dg1-18/igt@kms_ccs@pipe-b-crc-primary-rotatio=
n-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc}:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-basic-4=
_tiled_dg2_rc_ccs_cc.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1}:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-glk1/igt@kms_hdr@bpc-switch-suspend@pipe-a-h=
dmi-a-1.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-x:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-dg1-19/igt@kms_plane_lowres@pipe-d-tiling-x.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/sh=
ard-dg1-15/igt@kms_plane_lowres@pipe-d-tiling-x.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11690_full and IGTPW_7157_=
full:</p>
<h3>New IGT tests (159)</h3>
<ul>
<li>
<p>igt@api_intel_allocator@reloc-allocator:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@simple-allocator:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@parallel:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_cs_tlb@engines@bcs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [2.15, 2.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_cs_tlb@engines@rcs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [2.15, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_cs_tlb@engines@vcs0:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [2.15, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_cs_tlb@engines@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.15, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_cs_tlb@engines@vecs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.15, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_async@concurrent-writes:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@engines@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [27.38, 28.80] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@basic@bcs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.57, 3.57] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@basic@rcs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.48, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@basic@vcs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.46, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@basic@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.58, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@basic@vecs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.46, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@contexts@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.68, 5.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fifo:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@implicit-boths@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.03, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@implicit-boths@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.03, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@implicit-boths@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@implicit-boths@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@implicit-boths@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@implicit-write-read@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.06, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@independent:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@lateslice@bcs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@lateslice@rcs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@lateslice@vcs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@lateslice@vcs1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@lateslice@vecs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@out-order@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@out-order@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@out-order@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@out-order@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@ptrace:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@write-busy@all:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.52, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@write-busy@bcs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.51, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@write-busy@rcs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.51, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@write-busy@vcs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.51, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@write-busy@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.51, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@write-busy@vecs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.51, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@write-wait:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdm=
i-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ac-hdmi-a1-hdm=
i-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bc-hdmi-a1-hdm=
i-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdm=
i-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ac-hdmi-a1-hdm=
i-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a1-hdm=
i-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@d-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.93, 11.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [6.05, 8.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.95, 11.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [5.62, 8.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.96, 11.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [5.60, 8.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@d-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-dp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.29, 10.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-edp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.73, 11.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-hdmi-a1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@b-dp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.35, 10.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@b-edp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.76, 11.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@b-hdmi-a1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@b-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@b-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@c-dp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.33, 10.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@c-edp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.77, 11.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@c-hdmi-a1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@c-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@d-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@a-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@b-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@c-dp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.89, 11.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@d-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.55, 10.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.98, 11.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-dp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.52, 10.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.93, 11.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-dp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.53, 10.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.90, 11.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@d-edp1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-2:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-50:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-check-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.62, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@enable-race:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@idle-no-semaphores:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@init-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@init-sema:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@multi-client:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.55, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@prime_busy@before:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.97, 7.04] s</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-wait:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@wait:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7157_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@feature_discovery@display-2x.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839"=
>i915#1839</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb6/igt@feature_discovery@display-3x.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839"=
>i915#1839</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-inplace:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb4/igt@gem_ccs@block-copy-inplace.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327">i9=
15#5327</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb3/igt@gem_ccs@block-copy-inplace.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i9=
15#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/53=
25">i915#5325</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-snb7/igt@gem_ctx_persistence@legacy-engines-=
mixed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb3/igt@gem_exec_balancer@parallel-contexts=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5076">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5614">i915#5614</a>) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-kbl4/igt@gem_exec_balancer@parallel-contexts.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5076">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5614">i915#5614</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@gem_exec_balancer@parallel-keep-su=
bmit-fence.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5614">i915#5614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb8/igt@gem_exec_balancer@parallel-out-fen=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-apl8/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">=
i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@gem_exec_fair@basic-none-rrul@rcs0=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-glk8/igt@gem_exec_fair@basic-none-vip@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-k=
bl3/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb2/igt@gem_exec_fair@basic-pace-solo@rcs0=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/sh=
ard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-snb5/igt@gem_exec_flush@basic-batch-kernel-default-uc.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7157/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@gem_exec_params@rsvd2-dirt.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">=
fdo#109283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112=
283">fdo#112283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-codependency:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-snb7/igt@gem_exec_schedule@semaphore-codepen=
dency.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +308 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-glk6/igt@gem_exec_whisper@basic-queues-priority-all.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7157/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">=
i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#21=
90</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-apl8/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-glk1/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb1/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#21=
90</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-kbl6/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@gem_lmem_swapping@basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915=
#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-kbl7/igt@gem_lmem_swapping@heavy-verify-multi=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb5/igt@gem_lmem_swapping@heavy-verify-mult=
i.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-apl7/igt@gem_lmem_swapping@heavy-verify-multi=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-glk2/igt@gem_lmem_swapping@heavy-verify-multi=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb5/igt@gem_mmap_gtt@coherency.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111656">fdo#1=
11656</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb4/igt@gem_mmap_gtt@coherency.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109292">fdo#1=
09292</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb7/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-glk7/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-apl3/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb6/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-snb2/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-kbl1/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb6/igt@gem_pxp@create-regular-context-1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
270">i915#4270</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@gem_pxp@regular-baseline-src-copy-=
readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4270">i915#4270</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-y=
f-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/768">i915#768</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-glk2/igt@gem_render_copy@yf-tiled-mc-ccs-to-=
vebox-y-tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a>) +184 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb6/igt@gem_softpin@evict-snoop-interruptib=
le.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109312">fdo#109312</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb3/igt@gem_softpin@evict-snoop-interruptib=
le.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109312">fdo#109312</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb8/igt@gem_userptr_blits@unsync-overlap.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb2/igt@gem_userptr_blits@unsync-overlap.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@gen3_render_tiledy_blits.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fd=
o#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb1/igt@gen7_exec_parse@cmd-crossing-page.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-glk2/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-glk=
6/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb5/igt@gen9_exec_parse@batch-zero-length.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2856">i915#2856</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb1/igt@gen9_exec_parse@shadow-peek.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">=
i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2856">i915#2856</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
04">i915#1904</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb3/igt@=
i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644">f=
do#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2411">i915#2411</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@i915_pm_rpm@modeset-non-lpsp-stres=
s-no-wait.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110892">fdo#110892</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@i915_selftest@live@gt_lrc.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/23=
73">i915#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@i915_selftest@live@gt_pm.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/175=
9">i915#1759</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb1/igt@i915_suspend@basic-s3-without-i915.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5903">i915#5903</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb5/igt@i915_suspend@basic-s3-without-i915.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5903">i915#5903</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb5/igt@kms_atomic_transition@plane-all-mod=
eset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1769">i915#1769</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb1/igt@kms_atomic_transition@plane-all-mod=
eset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1769">i915#1769</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb2/igt@kms_big_fb@4-tiled-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5286">i915#5286</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5286">i915#5286</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@kms_big_fb@linear-16bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb6/igt@kms_big_fb@x-tiled-64bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111614">fdo#111614</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D110723">fdo#110723</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb6/igt@kms_big_joiner@basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#270=
5</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb5/igt@kms_big_joiner@basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#270=
5</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-kbl3/igt@kms_ccs@pipe-a-bad-rotation-90-4_ti=
led_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>) +241 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-glk7/igt@kms_ccs@pipe-a-crc-sprite-planes-bas=
ic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb5/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +8 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-apl8/igt@kms_ccs@pipe-a-crc-sprite-planes-bas=
ic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-kbl6/igt@kms_ccs@pipe-b-crc-primary-basic-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_ccs@pipe-c-random-ccs-data-4_t=
iled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4070">i915#4070</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@kms_ccs@pipe-d-bad-rotation-90-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb8/igt@kms_ccs@pipe-d-crc-primary-rotatio=
n-180-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3689">i915#3689</a>) +36 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-rkl-2/igt@kms_ccs@pipe-d-random-ccs-data-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4098">i915#4098</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-snb7/igt@kms_chamelium@dp-crc-single.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-glk8/igt@kms_chamelium@hdmi-aspect-ratio.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@kms_chamelium@vga-frame-dump.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb6/igt@kms_color@pipe-a-deep-color.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278"=
>fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-kbl3/igt@kms_color_chamelium@pipe-a-degamma.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-apl3/igt@kms_color_chamelium@pipe-c-ctm-0-25=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@kms_color_chamelium@pipe-c-gamma.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-kbl1/igt@kms_content_protection@atomic.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/131=
9">i915#1319</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb6/igt@kms_content_protection@atomic.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300=
">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111066">fdo#111066</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb7/igt@kms_content_protection@atomic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063"=
>i915#1063</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb3/igt@kms_content_protection@dp-mst-lic-t=
ype-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3116">i915#3116</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb3/igt@kms_content_protection@dp-mst-lic-t=
ype-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3299">i915#3299</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x10=
-sliding.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3359">i915#3359</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-32x32=
-sliding.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3319">i915#3319</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-512x1=
70-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109279">fdo#109279</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x5=
12-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@kms_cursor_edge_walk@pipe-d-128x12=
8-top-edge.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a>) +93 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb1/igt@kms_cursor_legacy@2x-cursor-vs-fli=
p-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-kbl6/igt@kms_cursor_legacy@pipe-d-torture-bo=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb4/igt@kms_display_modes@extended-mode-bas=
ic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>) +11 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb5/igt@kms_display_modes@extended-mode-bas=
ic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pa=
ttern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3528">i915#3528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb21010=
10-pwrite-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5287">i915#5287</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb8888-=
mmap-wc-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5287">i915#5287</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@xrgb8888-dsc-compression:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb6/igt@kms_dsc@xrgb8888-dsc-compression.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/38=
28">i915#3828</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb8/igt@kms_dsc@xrgb8888-dsc-compression.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/38=
28">i915#3828</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@kms_flip@2x-blocking-absolute-wf_v=
blank-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7157/shard-glk8/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7157/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7157/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-=
kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-=
ytile-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-64bpp-ytile-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/4911">i915#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +31 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-ti=
ling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5438">i915#5438</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +29 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-glk6/igt@kms_pipe_crc_basic@disable-crc-after=
-crtc-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-apl3/igt@kms_pipe_crc_basic@disable-crc-after=
-crtc-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb6/igt@kms_plane_lowres@pipe-b-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
36">i915#3536</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb5/igt@kms_plane_lowres@pipe-b-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
36">i915#3536</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb3/igt@kms_plane_lowres@pipe-c-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb8/igt@kms_plane_lowres@pipe-d-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-a-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-a-t=
iling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-=
edp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb2/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915=
#5235</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-=
edp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb8/igt@kms_plane_scaling@planes-upscale-2=
0x20-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915=
#5235</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-cont=
inuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-glk8/igt@kms_psr2_sf@cursor-plane-move-contin=
uous-exceed-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-apl4/igt@kms_psr2_sf@cursor-plane-move-contin=
uous-exceed-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb2/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2920">i915#2920</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb6/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
11">i915#1911</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb3/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
642">fdo#109642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-kbl1/igt@kms_psr2_su@page_flip-xrgb8888.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11690/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-=
iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)=
</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb3/igt@kms_psr@psr2_cursor_plane_onoff.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
2">i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3467">i915#3467</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1094=
41">fdo#109441</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb7/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-snb4/igt@kms_setmode@basic@pipe-a-vga-1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5465=
">i915#5465</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb7/igt@kms_setmode@invalid-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-forked-busy-hang:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11690/shard-apl3/igt@kms_vblank@pipe-a-query-forked-busy-hang.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_71=
57/shard-apl1/igt@kms_vblank@pipe-a-query-forked-busy-hang.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11690/shard-glk3/igt@kms_vblank@pipe-a-query-forked-busy-hang.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_71=
57/shard-glk9/igt@kms_vblank@pipe-a-query-forked-busy-hang.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-hang:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-apl2/igt@kms_vblank@pipe-d-wait-forked-hang.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) +218 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb3/igt@kms_vrr@flip-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555=
</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-glk2/igt@kms_writeback@writeback-fb-id.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-apl7/igt@kms_writeback@writeback-fb-id.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb5/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437"=
>i915#2437</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb2/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437"=
>i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-kbl3/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@nouveau_crc@pipe-c-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2530">i915#2530</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb3/igt@nouveau_crc@pipe-d-ctx-flip-detecti=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2530">i915#2530</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb7/igt@nouveau_crc@pipe-d-ctx-flip-detecti=
on.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb5/igt@perf_pmu@event-wait@rcs0.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112283">fd=
o#112283</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_import_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-iclb3/igt@prime_nv_api@nv_i915_import_twice_=
check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109291">fdo#109291</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-tglb6/igt@prime_nv_api@nv_self_import.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291"=
>fdo#109291</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb1/igt@prime_vgem@fence-flip-hang.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">f=
do#109295</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb7/igt@prime_vgem@fence-flip-hang.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">f=
do#109295</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-glk3/igt@sysfs_clients@fair-1.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-iclb6/igt@sysfs_clients@fair-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-apl6/igt@sysfs_clients@fair-1.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7157/shard-tglb6/igt@sysfs_clients@fair-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-kbl7/igt@sysfs_clients@split-50.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994=
">i915#2994</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-2/igt@fbdev@read.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@fbd=
ev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11690/shard-rkl-1/igt@fbdev@unaligned-write.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-rkl-4/igt@=
fbdev@unaligned-write.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@fbdev@unaligned-write=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-iclb1/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3070">i915#3070</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shar=
d-iclb3/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-2/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7157/shard-rkl-2/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/s=
hard-apl6/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11690/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7157/shard-tglu-1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></=
p>
</li>
<li>
<p>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/sha=
rd-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rk=
l-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11690/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/s=
hard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +3 similar issu=
es</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11690/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/s=
hard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +1 similar issu=
e</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-snb6/igt@gem_exec_flush@basic-wb-rw-default.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7157/shard-snb5/igt@gem_exec_flush@basic-wb-rw-default.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout@vecs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-1/igt@gem_exec_reloc@basic-scanout@vecs0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3639">i915=
#3639</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7157/shard-rkl-6/igt@gem_exec_reloc@basic-scanout@vecs0.html">PASS</a> +3 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-glk4/igt@gem_exec_whisper@basic-contexts-all.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118"=
>i915#118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7157/shard-glk7/igt@gem_exec_whisper@basic-contexts-all.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-1/igt@gem_softpin@evict-single-offset.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171">i915#41=
71</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_715=
7/shard-rkl-6/igt@gem_softpin@evict-single-offset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-1/igt@i915_pm_backlight@fade.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-r=
kl-6/igt@i915_pm_backlight@fade.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb2/i=
gt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-iclb4/igt@i915_pm_rpm@fences.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/5096">i915#5096</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard=
-iclb2/igt@i915_pm_rpm@fences.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-1/igt@i915_pm_rps@waitboost.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4016">i915#4016</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rk=
l-4/igt@i915_pm_rps@waitboost.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4528"=
>i915#4528</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7157/shard-snb2/igt@i915_suspend@basic-s3-without-i915.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-dg1-13/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2575">i915=
#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7157/shard-dg1-16/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">PASS</a> +4 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-1/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12=
_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_ccs@pipe-b-bad-pixel-fo=
rmat-y_tiled_gen12_rc_ccs_cc.html">PASS</a> +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x128-rapid-movement:</p>
<ul>
<li>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11690/shard-rkl-2/igt@kms_cursor_crc@pipe-b-cursor-128x128-rapid-m=
ovement.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-4/igt@kms_cursor_crc@pipe-b-cursor-128x128-rapid-mo=
vement.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112022">fdo#112022</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor=
-128x128-rapid-movement.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-2/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
12022">fdo#112022</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-256x256=
-sliding.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-b-128x=
128-top-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:</p>
<ul>
<li>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11690/shard-rkl-4/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edg=
e.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11690/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849=
">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-b-256x256-=
left-edge.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-toggle:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-2/igt@kms_cursor_legacy@short-flip-after-cursor-tog=
gle.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_cursor_legacy@short-flip-aft=
er-cursor-toggle.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu=
-ytiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_draw_crc@draw-meth=
od-xrgb2101010-mmap-cpu-ytiled.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-4/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-u=
ntiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb21=
01010-pwrite-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled:</p>
<ul>
<li>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11690/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-y=
tiled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11690/shard-rkl-4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytil=
ed.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_draw_crc@draw-method-x=
rgb8888-mmap-gtt-ytiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D110189">fdo#110189</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shar=
d-rkl-6/igt@kms_fbcon_fbt@psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-glk3/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdm=
i-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7157/shard-glk6/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-=
a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64=
bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3701">i915#3701</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-iclb4/igt@kms_flip_scaled_crc@fl=
ip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11690/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri=
-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_11690/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-of=
fscren-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">PASS</a> +3 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb=
-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7157/shard-glk5/igt@kms_frontbuffer_tracking@fb=
c-2p-scndscrn-indfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-dra=
w-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_frontbuffer_tracking@fb=
cpsr-rgb101010-draw-mmap-cpu.html">PASS</a> +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-4/igt@kms_invalid_mode@bad-hsync-start.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4278">i915#4=
278</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_71=
57/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-start.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-b:</p>
<ul>
<li>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11690/shard-rkl-4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-b.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1169=
0/shard-rkl-6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-b.html">PASS</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/s=
hard-rkl-6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-primary-size-256:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-dg1-17/igt@kms_plane_cursor@pipe-a-primary-size-256.htm=
l">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7157/shard-dg1-16/igt@kms_plane_cursor@pipe-a-primary-size-256.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10944=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157=
/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_mmap_cpu:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-1/igt@kms_psr@sprite_mmap_cpu.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-=
rkl-6/igt@kms_psr@sprite_mmap_cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-rkl-2/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5461">i915#5461</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7157/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primar=
y-flip-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-dg1-13/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-dg1-1=
6/igt@perf@gen12-mi-rpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-dg1-19/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4=
349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_71=
57/shard-dg1-16/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-tglu-5/igt@testdisplay.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4941">i915#4941</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-tglu-=
1/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7157/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#=
5614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-apl8/igt@kms_content_protection@legacy.html">FAIL</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110321">fdo#11032=
1</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110336">f=
do#110336</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7157/shard-apl7/igt@kms_content_protection@legacy.html">TIMEOUT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-iclb1/igt@kms_psr2_sf@overlay-plane-move-continuous-exc=
eed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7157/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuo=
us-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11690/shard-iclb3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642<=
/a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7157/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11690/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-apl3/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11690/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11690/shard-apl3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/5257">i915#5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7157/shard-apl7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl=
2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7157/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/shard-apl4/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7157/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#300=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i9=
15#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52=
57">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_6485 -&gt; IGTPW_7157</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI_DRM_11690: 7420808c59c9be6a025f811ada6e6c860f6562b6 @ git://anongit.f=
reedesktop.org/gfx-ci/linux<br />
  IGTPW_7157: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7157/index.htm=
l<br />
  IGT_6485: 51663917b40d36086cc1c555ce4f67b22937694d @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============4959394407430163449==--
