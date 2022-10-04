Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2566100874891320328=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Tue, 04 Oct 2022 15:49:04 -0000
Message-ID: <166489854411.14072.7593189211683858273@emeril.freedesktop.org>
References: <20220830084836.12231-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20220830084836.12231-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fhangman=3A_fail_only_after_freeing_spinners_=28rev5=29?=
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

--===============2566100874891320328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/i915_hangman: fail only after freeing spinners (rev5)
URL   : https://patchwork.freedesktop.org/series/106946/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12197_full -> IGTPW_7883_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/index.html

Participating hosts (12 -> 9)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7883_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_module_load@resize-bar:
    - {shard-dg1}:        [FAIL][1] ([i915#6458]) -> ([FAIL][2], [DMESG-FAIL][3]) ([i915#6458])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-dg1-19/igt@i915_module_load@resize-bar.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-dg1-12/igt@i915_module_load@resize-bar.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-dg1-15/igt@i915_module_load@resize-bar.html

  * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:
    - {shard-rkl}:        NOTRUN -> ([SKIP][4], [SKIP][5]) +69 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-3/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-5/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html

  * igt@nouveau_crc@pipe-a-source-outp-complete:
    - {shard-rkl}:        NOTRUN -> [SKIP][6] +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-4/igt@nouveau_crc@pipe-a-source-outp-complete.html

  * igt@prime_nv_api@i915_self_import_to_different_fd:
    - {shard-dg1}:        NOTRUN -> ([SKIP][7], [SKIP][8]) +54 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-dg1-12/igt@prime_nv_api@i915_self_import_to_different_fd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-dg1-19/igt@prime_nv_api@i915_self_import_to_different_fd.html

  * igt@prime_nv_pcopy@test1_micro:
    - {shard-dg1}:        NOTRUN -> [SKIP][9] +24 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-dg1-13/igt@prime_nv_pcopy@test1_micro.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12197_full and IGTPW_7883_full:

### New IGT tests (11) ###

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_lease@empty_lease@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_lease@empty_lease@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@empty_lease@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@empty_lease@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@setcrtc_implicit_plane@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_lease@setcrtc_implicit_plane@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_lease@setcrtc_implicit_plane@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_lease@setcrtc_implicit_plane@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  

Known issues
------------

  Here are the changes found in IGTPW_7883_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [PASS][10] -> ([SKIP][11], [SKIP][12]) ([i915#4525]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [PASS][13] -> ([PASS][14], [SKIP][15]) ([i915#4525]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][16] -> ([FAIL][17], [FAIL][18]) ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> ([FAIL][19], [FAIL][20]) ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-glk:          NOTRUN -> ([FAIL][21], [FAIL][22]) ([i915#2842])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk9/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk8/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-iclb:         NOTRUN -> ([FAIL][23], [FAIL][24]) ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-glk:          [PASS][25] -> ([FAIL][26], [PASS][27]) ([i915#2842]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk5/igt@gem_exec_fair@basic-none@vcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][28] ([i915#2842])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][29] -> ([FAIL][30], [PASS][31]) ([i915#2842]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-bsd:
    - shard-tglb:         NOTRUN -> ([SKIP][32], [SKIP][33]) ([fdo#109283])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@gem_exec_params@no-bsd.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@gem_exec_params@no-bsd.html
    - shard-iclb:         NOTRUN -> ([SKIP][34], [SKIP][35]) ([fdo#109283])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@gem_exec_params@no-bsd.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-iclb:         [PASS][36] -> ([PASS][37], [INCOMPLETE][38]) ([i915#6755])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb5/igt@gem_exec_whisper@basic-queues-priority.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@gem_exec_whisper@basic-queues-priority.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#4613])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl2/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> ([SKIP][40], [SKIP][41]) ([fdo#109271] / [i915#4613]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk1/igt@gem_lmem_swapping@random-engines.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@gem_lmem_swapping@random-engines.html
    - shard-iclb:         NOTRUN -> ([SKIP][42], [SKIP][43]) ([i915#4613]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@gem_lmem_swapping@random-engines.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify:
    - shard-apl:          NOTRUN -> ([SKIP][44], [SKIP][45]) ([fdo#109271] / [i915#4613]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@gem_lmem_swapping@verify.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@gem_lmem_swapping@verify.html
    - shard-tglb:         NOTRUN -> ([SKIP][46], [SKIP][47]) ([i915#4613]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@gem_lmem_swapping@verify.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@gem_lmem_swapping@verify.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-iclb:         NOTRUN -> ([SKIP][48], [SKIP][49]) ([i915#4270])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-tglb:         NOTRUN -> ([SKIP][50], [SKIP][51]) ([i915#4270])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> ([SKIP][52], [SKIP][53]) ([i915#768])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> ([SKIP][54], [SKIP][55]) ([i915#3297])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@gem_userptr_blits@dmabuf-unsync.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-iclb:         NOTRUN -> ([SKIP][56], [SKIP][57]) ([i915#3297])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          NOTRUN -> ([DMESG-WARN][58], [PASS][59]) ([i915#5566] / [i915#716])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][60] -> ([PASS][61], [DMESG-WARN][62]) ([i915#5566] / [i915#716])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk7/igt@gen9_exec_parse@allowed-single.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@gen9_exec_parse@allowed-single.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglb:         NOTRUN -> ([SKIP][63], [SKIP][64]) ([i915#2527] / [i915#2856])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@gen9_exec_parse@unaligned-jump.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@gen9_exec_parse@unaligned-jump.html
    - shard-iclb:         NOTRUN -> ([SKIP][65], [SKIP][66]) ([i915#2856])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gen9_exec_parse@unaligned-jump.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [PASS][67] -> ([DMESG-WARN][68], [DMESG-WARN][69]) ([i915#180])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl8/igt@i915_suspend@forcewake.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/igt@i915_suspend@forcewake.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-tglb:         NOTRUN -> ([PASS][70], [INCOMPLETE][71]) ([i915#6987])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_addfb_basic@legacy-format.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-tglb:         NOTRUN -> ([SKIP][72], [SKIP][73]) ([i915#5286])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> ([SKIP][74], [SKIP][75]) ([i915#5286])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> ([SKIP][76], [SKIP][77]) ([fdo#110725] / [fdo#111614])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> ([SKIP][78], [SKIP][79]) ([fdo#111614])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-glk:          [PASS][80] -> ([DMESG-FAIL][81], [DMESG-FAIL][82]) ([i915#118] / [i915#1888])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk8/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk8/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#111615])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglb:         NOTRUN -> ([SKIP][84], [SKIP][85]) ([fdo#111615]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109278]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
    - shard-iclb:         NOTRUN -> ([SKIP][87], [SKIP][88]) ([fdo#109278]) +5 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][89], [SKIP][90]) ([i915#3689] / [i915#3886])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> ([SKIP][91], [SKIP][92]) ([fdo#109271] / [i915#3886]) +9 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
    - shard-glk:          NOTRUN -> ([SKIP][93], [SKIP][94]) ([fdo#109271] / [i915#3886]) +5 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk9/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> ([SKIP][95], [SKIP][96]) ([fdo#109278] / [i915#3886]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#3886])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> ([SKIP][98], [SKIP][99]) ([i915#3689] / [i915#6095]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][100], [SKIP][101]) ([i915#3689]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][102], [SKIP][103]) ([fdo#111615] / [i915#3689]) +2 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-frame-dump:
    - shard-apl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@kms_chamelium@dp-frame-dump.html

  * igt@kms_chamelium@dp-hpd:
    - shard-glk:          NOTRUN -> ([SKIP][105], [SKIP][106]) ([fdo#109271] / [fdo#111827]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk2/igt@kms_chamelium@dp-hpd.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@kms_chamelium@dp-hpd.html
    - shard-snb:          NOTRUN -> ([SKIP][107], [SKIP][108]) ([fdo#109271] / [fdo#111827]) +3 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb7/igt@kms_chamelium@dp-hpd.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb2/igt@kms_chamelium@dp-hpd.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-tglb:         NOTRUN -> ([SKIP][109], [SKIP][110]) ([fdo#109284] / [fdo#111827]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_chamelium@hdmi-audio.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-iclb:         NOTRUN -> ([SKIP][111], [SKIP][112]) ([fdo#109284] / [fdo#111827]) +3 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_chamelium@hdmi-cmp-planar-formats.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@kms_chamelium@hdmi-cmp-planar-formats.html
    - shard-snb:          NOTRUN -> [SKIP][113] ([fdo#109271] / [fdo#111827])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb5/igt@kms_chamelium@hdmi-cmp-planar-formats.html
    - shard-tglb:         NOTRUN -> [SKIP][114] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium@hdmi-crc-nonplanar-formats:
    - shard-glk:          NOTRUN -> [SKIP][115] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk6/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html

  * igt@kms_color@ctm-0-75@pipe-a-edp-1:
    - shard-iclb:         NOTRUN -> ([FAIL][116], [FAIL][117]) ([i915#315] / [i915#6946]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@kms_color@ctm-0-75@pipe-a-edp-1.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_color@ctm-0-75@pipe-a-edp-1.html

  * igt@kms_color@ctm-0-75@pipe-b-edp-1:
    - shard-tglb:         NOTRUN -> ([FAIL][118], [FAIL][119]) ([i915#315]) +3 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_color@ctm-0-75@pipe-b-edp-1.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_color@ctm-0-75@pipe-b-edp-1.html

  * igt@kms_color_chamelium@ctm-0-50:
    - shard-apl:          NOTRUN -> ([SKIP][120], [SKIP][121]) ([fdo#109271] / [fdo#111827]) +4 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_color_chamelium@ctm-0-50.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@kms_color_chamelium@ctm-0-50.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][122] ([i915#2105])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> ([PASS][123], [DMESG-WARN][124]) ([i915#180])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html

  * igt@kms_cursor_legacy@cursora-vs-flipb@atomic:
    - shard-iclb:         NOTRUN -> ([SKIP][125], [SKIP][126]) ([fdo#109274]) +5 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb@atomic.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@kms_cursor_legacy@cursora-vs-flipb@atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb@varying-size:
    - shard-tglb:         NOTRUN -> ([SKIP][127], [SKIP][128]) ([fdo#109274] / [fdo#111825]) +5 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_cursor_legacy@cursora-vs-flipb@varying-size.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_cursor_legacy@cursora-vs-flipb@varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [PASS][129] -> ([FAIL][130], [FAIL][131]) ([i915#2346]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][132] ([i915#6375])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][133] ([i915#2672]) +3 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> ([SKIP][134], [SKIP][135]) ([i915#2587] / [i915#2672])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][136] ([i915#2587] / [i915#2672]) +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][137] ([i915#3555]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> ([SKIP][138], [SKIP][139]) ([i915#2672]) +2 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][140] ([i915#2672] / [i915#3555])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-iclb:         NOTRUN -> ([SKIP][141], [SKIP][142]) ([fdo#109280]) +11 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-tglb:         NOTRUN -> ([SKIP][143], [SKIP][144]) ([i915#6497]) +4 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-tglb:         NOTRUN -> ([SKIP][145], [SKIP][146]) ([fdo#109280] / [fdo#111825]) +9 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][147] ([fdo#109271]) +40 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
    - shard-tglb:         NOTRUN -> [SKIP][148] ([fdo#109280] / [fdo#111825]) +1 similar issue
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglb:         NOTRUN -> ([SKIP][149], [SKIP][150]) ([fdo#109289])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
    - shard-iclb:         NOTRUN -> [SKIP][151] ([fdo#109289])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-apl:          [PASS][152] -> ([PASS][153], [DMESG-WARN][154]) ([i915#180])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-apl:          NOTRUN -> [SKIP][155] ([fdo#109271]) +28 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:
    - shard-tglb:         NOTRUN -> ([SKIP][156], [SKIP][157]) ([i915#6988]) +28 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          NOTRUN -> ([SKIP][158], [SKIP][159]) ([fdo#109271]) +218 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-glk:          NOTRUN -> [SKIP][160] ([fdo#109271]) +12 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant:
    - shard-glk:          NOTRUN -> ([SKIP][161], [SKIP][162]) ([fdo#109271]) +151 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk8/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html
    - shard-iclb:         NOTRUN -> [SKIP][163] ([i915#6988])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
    - shard-tglb:         NOTRUN -> [SKIP][164] ([i915#6988]) +5 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min:
    - shard-iclb:         NOTRUN -> ([SKIP][165], [SKIP][166]) ([i915#6988]) +33 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-glk:          NOTRUN -> [SKIP][167] ([fdo#109271] / [i915#658])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [PASS][168] -> ([SKIP][169], [SKIP][170]) ([fdo#109642] / [fdo#111068] / [i915#658])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@kms_psr2_su@page_flip-xrgb8888.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-apl:          NOTRUN -> ([SKIP][171], [SKIP][172]) ([fdo#109271] / [i915#658])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_psr2_su@page_flip-xrgb8888.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][173] -> ([SKIP][174], [SKIP][175]) ([fdo#109441]) +1 similar issue
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglb:         [PASS][176] -> ([SKIP][177], [PASS][178]) ([i915#5519])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_sequence@get-forked@edp-1-pipe-c:
    - shard-tglb:         [PASS][179] -> ([PASS][180], [INCOMPLETE][181]) ([i915#7035])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb3/igt@kms_sequence@get-forked@edp-1-pipe-c.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_sequence@get-forked@edp-1-pipe-c.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_sequence@get-forked@edp-1-pipe-c.html

  * igt@kms_vblank@pipe-b-accuracy-idle:
    - shard-glk:          [PASS][182] -> ([FAIL][183], [PASS][184]) ([i915#43])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk3/igt@kms_vblank@pipe-b-accuracy-idle.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@kms_vblank@pipe-b-accuracy-idle.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk7/igt@kms_vblank@pipe-b-accuracy-idle.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> ([SKIP][185], [SKIP][186]) ([fdo#109271] / [i915#533])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl2/igt@kms_vblank@pipe-d-wait-idle.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-glk:          NOTRUN -> ([SKIP][187], [SKIP][188]) ([fdo#109271] / [i915#2437])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@kms_writeback@writeback-invalid-parameters.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> ([SKIP][189], [SKIP][190]) ([i915#6971]) +44 similar issues
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@nouveau_crc@pipe-a-ctx-flip-detection.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@nouveau_crc@pipe-a-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-c-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][191] ([i915#6971]) +2 similar issues
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@nouveau_crc@pipe-c-source-outp-inactive.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [PASS][192] -> ([DMESG-WARN][193], [PASS][194]) ([i915#2867])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb1/igt@perf_pmu@module-unload.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@perf_pmu@module-unload.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@perf_pmu@module-unload.html

  * igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> ([SKIP][195], [SKIP][196]) ([i915#6971]) +39 similar issues
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test3_5:
    - shard-snb:          NOTRUN -> ([SKIP][197], [SKIP][198]) ([fdo#109271]) +151 similar issues
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb4/igt@prime_nv_pcopy@test3_5.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb2/igt@prime_nv_pcopy@test3_5.html

  * igt@prime_nv_pcopy@test_semaphore:
    - shard-tglb:         NOTRUN -> [SKIP][199] ([i915#6971]) +7 similar issues
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@prime_nv_pcopy@test_semaphore.html

  * igt@sysfs_clients@sema-25:
    - shard-apl:          NOTRUN -> ([SKIP][200], [SKIP][201]) ([fdo#109271] / [i915#2994]) +1 similar issue
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl2/igt@sysfs_clients@sema-25.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@sysfs_clients@sema-25.html
    - shard-tglb:         NOTRUN -> ([SKIP][202], [SKIP][203]) ([i915#2994]) +1 similar issue
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@sysfs_clients@sema-25.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@sysfs_clients@sema-25.html
    - shard-glk:          NOTRUN -> ([SKIP][204], [SKIP][205]) ([fdo#109271] / [i915#2994]) +1 similar issue
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk8/igt@sysfs_clients@sema-25.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk9/igt@sysfs_clients@sema-25.html

  * igt@sysfs_clients@split-10:
    - shard-iclb:         NOTRUN -> ([SKIP][206], [SKIP][207]) ([i915#2994]) +1 similar issue
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@sysfs_clients@split-10.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@sysfs_clients@split-10.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-apl:          [DMESG-WARN][208] ([i915#180]) -> ([PASS][209], [PASS][210])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl8/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - {shard-rkl}:        [SKIP][211] ([i915#6247]) -> ([PASS][212], [PASS][213])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-2/igt@gem_exec_endless@dispatch@bcs0.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-1/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][214] ([i915#2842]) -> ([PASS][215], [PASS][216])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - {shard-rkl}:        [DMESG-FAIL][217] ([i915#3692]) -> ([PASS][218], [PASS][219])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-1/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-2/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - {shard-rkl}:        [FAIL][220] ([i915#4998] / [i915#6778]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctxn.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-2/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * igt@gem_pwrite@basic-random:
    - {shard-rkl}:        [SKIP][222] ([i915#3282]) -> [PASS][223] +1 similar issue
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-6/igt@gem_pwrite@basic-random.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-5/igt@gem_pwrite@basic-random.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - {shard-rkl}:        [SKIP][224] ([i915#3281]) -> [PASS][225] +1 similar issue
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_softpin@evict-single-offset:
    - {shard-rkl}:        [FAIL][226] ([i915#4171]) -> ([PASS][227], [PASS][228])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@gem_softpin@evict-single-offset.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-3/igt@gem_softpin@evict-single-offset.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-1/igt@gem_softpin@evict-single-offset.html

  * igt@gem_workarounds@suspend-resume:
    - {shard-tglu}:       [DMESG-WARN][229] ([i915#5122]) -> ([PASS][230], [PASS][231])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglu-3/igt@gem_workarounds@suspend-resume.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglu-3/igt@gem_workarounds@suspend-resume.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglu-4/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][232] ([i915#5566] / [i915#716]) -> ([PASS][233], [PASS][234])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@gen9_exec_parse@allowed-all.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - {shard-rkl}:        [SKIP][235] ([i915#6258]) -> ([PASS][236], [PASS][237])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-1/igt@i915_hangman@engine-engine-error@bcs0.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-4/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [DMESG-WARN][238] ([i915#4528]) -> ([PASS][239], [PASS][240])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-snb5/igt@i915_module_load@reload-no-display.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb4/igt@i915_module_load@reload-no-display.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb6/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_dc@dc9-dpms:
    - {shard-rkl}:        [SKIP][241] ([i915#3361]) -> ([PASS][242], [PASS][243])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@i915_pm_dc@dc9-dpms.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-2/igt@i915_pm_dc@dc9-dpms.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rps@engine-order:
    - shard-apl:          [FAIL][244] ([i915#6537]) -> ([PASS][245], [PASS][246])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl7/igt@i915_pm_rps@engine-order.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/igt@i915_pm_rps@engine-order.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@i915_pm_rps@engine-order.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [DMESG-WARN][247] ([i915#180]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@i915_suspend@debugfs-reader.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp1:
    - shard-apl:          [FAIL][249] ([i915#79]) -> [PASS][250] +1 similar issue
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         [SKIP][251] ([i915#5235]) -> ([PASS][252], [PASS][253]) +2 similar issues
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@perf@polling-small-buf:
    - shard-tglb:         [FAIL][254] ([i915#1722]) -> ([PASS][255], [PASS][256])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb8/igt@perf@polling-small-buf.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@perf@polling-small-buf.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@perf@polling-small-buf.html

  
#### Warnings ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][257] ([i915#658]) -> ([SKIP][258], [PASS][259]) ([i915#658])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb6/igt@feature_discovery@psr2.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@feature_discovery@psr2.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][260] ([i915#4525]) -> ([PASS][261], [SKIP][262]) ([i915#4525]) +1 similar issue
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb6/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][263] ([i915#6117]) -> ([SKIP][264], [FAIL][265]) ([i915#4525] / [i915#6117])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [FAIL][266] ([i915#2842]) -> ([PASS][267], [FAIL][268]) ([i915#2842])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [FAIL][269] ([i915#2842]) -> ([PASS][270], [FAIL][271]) ([i915#2842])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][272] ([i915#658]) -> ([SKIP][273], [SKIP][274]) ([i915#588] / [i915#658])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][275] ([i915#3989] / [i915#454]) -> ([PASS][276], [FAIL][277]) ([i915#3989] / [i915#454])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][278] ([i915#180]) -> ([PASS][279], [DMESG-WARN][280]) ([i915#180]) +1 similar issue
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][281] ([i915#2920]) -> ([SKIP][282], [SKIP][283]) ([i915#658]) +1 similar issue
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][284] ([fdo#111068] / [i915#658]) -> ([SKIP][285], [SKIP][286]) ([fdo#111068] / [i915#2920] / [i915#658])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-iclb:         [SKIP][287] ([fdo#109642] / [fdo#111068] / [i915#658]) -> ([SKIP][288], [FAIL][289]) ([fdo#109642] / [fdo#111068] / [i915#5939] / [i915#658]) +1 similar issue
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@kms_psr2_su@page_flip-nv12.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][290] ([fdo#109441]) -> ([PASS][291], [SKIP][292]) ([fdo#109441]) +3 similar issues
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][293], [FAIL][294], [FAIL][295], [FAIL][296], [FAIL][297], [FAIL][298]) ([i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][299], [FAIL][300], [FAIL][301], [FAIL][302], [FAIL][303], [FAIL][304], [FAIL][305], [FAIL][306], [FAIL][307], [FAIL][308]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@runner@aborted.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl6/igt@runner@aborted.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@runner@aborted.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl8/igt@runner@aborted.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl2/igt@runner@aborted.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@runner@aborted.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@runner@aborted.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@runner@aborted.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@runner@aborted.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/igt@runner@aborted.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@runner@aborted.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@runner@aborted.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl2/igt@runner@aborted.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@runner@aborted.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/igt@runner@aborted.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3692]: https://gitlab.freedesktop.org/drm/intel/issues/3692
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#4998]: https://gitlab.freedesktop.org/drm/intel/issues/4998
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6251]: https://gitlab.freedesktop.org/drm/intel/issues/6251
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6355]: https://gitlab.freedesktop.org/drm/intel/issues/6355
  [i915#6375]: https://gitlab.freedesktop.org/drm/intel/issues/6375
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6458]: https://gitlab.freedesktop.org/drm/intel/issues/6458
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6755]: https://gitlab.freedesktop.org/drm/intel/issues/6755
  [i915#6778]: https://gitlab.freedesktop.org/drm/intel/issues/6778
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6971]: https://gitlab.freedesktop.org/drm/intel/issues/6971
  [i915#6987]: https://gitlab.freedesktop.org/drm/intel/issues/6987
  [i915#6988]: https://gitlab.freedesktop.org/drm/intel/issues/6988
  [i915#6989]: https://gitlab.freedesktop.org/drm/intel/issues/6989
  [i915#7035]: https://gitlab.freedesktop.org/drm/intel/issues/7035
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6668 -> IGTPW_7883
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12197: cafa326de8e7860d45639e61bf66ec9c218207b1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7883: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/index.html
  IGT_6668: 5f29c9369550164b35b65baaaeba4b370f434cf1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/index.html

--===============2566100874891320328==
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
<tr><td><b>Series:</b></td><td>i915/i915_hangman: fail only after freeing s=
pinners (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/106946/">https://patchwork.freedesktop.org/series/106946/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7883/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7883/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12197_full -&gt; IGTPW_7883_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/index.=
html</p>
<h2>Participating hosts (12 -&gt; 9)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7883=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-dg1-19/igt@i915_module_load@resize-bar.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6458">i915#6458<=
/a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/=
shard-dg1-12/igt@i915_module_load@resize-bar.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-dg1-15/igt@i915_modu=
le_load@resize-bar.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6458">i915#6458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-rkl-3/igt@kms_plane_alpha_blend@pipe-d-cons=
tant-alpha-max.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7883/shard-rkl-5/igt@kms_plane_alpha_blend@pipe-d-constant-al=
pha-max.html">SKIP</a>) +69 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-rkl-4/igt@nouveau_crc@pipe-a-source-outp-com=
plete.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_self_import_to_different_fd:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-dg1-12/igt@prime_nv_api@i915_self_import_to=
_different_fd.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7883/shard-dg1-19/igt@prime_nv_api@i915_self_import_to_differe=
nt_fd.html">SKIP</a>) +54 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_micro:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-dg1-13/igt@prime_nv_pcopy@test1_micro.html">=
SKIP</a> +24 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12197_full and IGTPW_7883_=
full:</p>
<h3>New IGT tests (11)</h3>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty_lease@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty_lease@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty_lease@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty_lease@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc_implicit_plane@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc_implicit_plane@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc_implicit_plane@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc_implicit_plane@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7883_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883=
/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@ge=
m_exec_balancer@parallel-bb-first.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883=
/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@ge=
m_exec_balancer@parallel-contexts.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/s=
hard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/igt@gem_exe=
c_fair@basic-none-solo@rcs0.html">FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
883/shard-tglb8/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-glk9/igt@gem_exec_fair@basic-none-vip@rcs0.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
83/shard-glk8/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</=
p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gem_exec_fair@basic-none-vip@rcs0.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
883/shard-iclb2/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-glk5/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-=
glk2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@gem_exec_fair@bas=
ic-none@vcs0.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/s=
hard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@gem_ex=
ec_fair@basic-throttle@rcs0.html">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@gem_exec_params@no-bsd.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-t=
glb8/igt@gem_exec_params@no-bsd.html">SKIP</a>) (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109283">fdo#109283</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@gem_exec_params@no-bsd.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-i=
clb4/igt@gem_exec_params@no-bsd.html">SKIP</a>) (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109283">fdo#109283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb5/igt@gem_exec_whisper@basic-queues-priority.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
883/shard-iclb1/igt@gem_exec_whisper@basic-queues-priority.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/=
igt@gem_exec_whisper@basic-queues-priority.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/6755">i915#6755</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-apl2/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-glk1/igt@gem_lmem_swapping@random-engines.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_788=
3/shard-glk3/igt@gem_lmem_swapping@random-engines.html">SKIP</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613=
</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@gem_lmem_swapping@random-engines.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
83/shard-iclb2/igt@gem_lmem_swapping@random-engines.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +=
2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-apl7/igt@gem_lmem_swapping@verify.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-=
apl6/igt@gem_lmem_swapping@verify.html">SKIP</a>) (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 similar =
issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@gem_lmem_swapping@verify.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard=
-tglb5/igt@gem_lmem_swapping@verify.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 similar issues=
</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gem_pxp@protected-raw-src-copy-not=
-readible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7883/shard-iclb8/igt@gem_pxp@protected-raw-src-copy-not-readible.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@gem_pxp@protected-raw-src-copy-not=
-readible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7883/shard-tglb2/igt@gem_pxp@protected-raw-src-copy-not-readible.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gem_render_copy@y-tiled-to-vebox-=
y-tiled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7883/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/768">=
i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@gem_userptr_blits@dmabuf-unsync.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_788=
3/shard-tglb2/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@gem_userptr_blits@dmabuf-unsync.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_788=
3/shard-iclb3/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-apl7/igt@gen9_exec_parse@allowed-all.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
883/shard-apl3/igt@gen9_exec_parse@allowed-all.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-glk7/igt@gen9_exec_parse@allowed-single.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard=
-glk3/igt@gen9_exec_parse@allowed-single.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@gen9_exec_parse=
@allowed-single.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5566">i915#5566</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@gen9_exec_parse@unaligned-jump.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883=
/shard-tglb5/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)=
</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gen9_exec_parse@unaligned-jump.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883=
/shard-iclb8/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-apl8/igt@i915_suspend@forcewake.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/ig=
t@i915_suspend@forcewake.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@i915_suspend@forcewake.ht=
ml">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_addfb_basic@legacy-format.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883=
/shard-tglb7/igt@kms_addfb_basic@legacy-format.html">INCOMPLETE</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/6987">i915#6987</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
83/shard-tglb8/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</=
p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
83/shard-iclb1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</=
p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
883/shard-iclb2/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a>) (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110725">fdo#110725</a=
> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111614">fdo#1=
11614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-90.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
883/shard-tglb8/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a>) (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111614">fdo#111614</a=
>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-glk8/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/sh=
ard-glk8/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">DMESG-FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@kms=
_big_fb@x-tiled-16bpp-rotate-0.html">DMESG-FAIL</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-180-hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_big_fb@yf-tiled-=
max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a>) (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D111615">fdo#111615</a>) +1 =
similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_ccs@pipe-a-bad-rotation-90-y_t=
iled_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@kms_ccs@pipe-a-ccs-on-another-bo-=
y_tiled_gen12_rc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y=
_tiled_gen12_rc_ccs.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109278">fdo#109278</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_ccs@pipe-b-crc-sprite-planes-=
basic-y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-pl=
anes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-apl8/igt@kms_ccs@pipe-b-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7883/shard-apl1/igt@kms_ccs@pipe-b-missing-ccs-buffer=
-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-glk5/igt@kms_ccs@pipe-b-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7883/shard-glk9/igt@kms_ccs@pipe-b-missing-ccs-buffer=
-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@kms_ccs@pipe-b-missing-ccs-buffer-=
y_tiled_gen12_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@kms_ccs@pipe-b-missing-ccs-buff=
er-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-apl6/igt@kms_ccs@pipe-b-random-ccs-data-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_ccs@pipe-c-bad-pixel-format-4=
_tiled_dg2_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_ccs@pipe-c-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-=
basic-y_tiled_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_ccs@pipe-c-crc-sprite-planes-basi=
c-y_tiled_ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_ccs@pipe-d-bad-pixel-format-y=
f_tiled_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7883/shard-tglb3/igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_cc=
s.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-frame-dump:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-apl6/igt@kms_chamelium@dp-frame-dump.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-glk2/igt@kms_chamelium@dp-hpd.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3=
/igt@kms_chamelium@dp-hpd.html">SKIP</a>) (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues=
</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-snb7/igt@kms_chamelium@dp-hpd.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb2=
/igt@kms_chamelium@dp-hpd.html">SKIP</a>) (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues=
</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_chamelium@hdmi-audio.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shar=
d-tglb1/igt@kms_chamelium@hdmi-audio.html">SKIP</a>) (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109284">fdo#109284</a> / <a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_chamelium@hdmi-cmp-planar-form=
ats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7883/shard-iclb8/igt@kms_chamelium@hdmi-cmp-planar-formats.html">SKIP</a=
>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fdo#1=
09284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11182=
7">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7883/shard-snb5/igt@kms_chamelium@hdmi-cmp-planar-format=
s.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_chamelium@hdmi-cmp-planar-forma=
ts.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-glk6/igt@kms_chamelium@hdmi-crc-nonplanar-fo=
rmats.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@kms_color@ctm-0-75@pipe-a-edp-1.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
83/shard-iclb1/igt@kms_color@ctm-0-75@pipe-a-edp-1.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/315">i915#315</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6946">i915#6946</a>=
) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_color@ctm-0-75@pipe-b-edp-1.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
83/shard-tglb2/igt@kms_color@ctm-0-75@pipe-b-edp-1.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/315">i915#315</a>) +3 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-0-50:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_color_chamelium@ctm-0-50.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/s=
hard-apl3/igt@kms_color_chamelium@ctm-0-50.html">SKIP</a>) (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) =
+4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_content_protection@uevent.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105"=
>i915#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-apl6/igt@kms_cursor_crc@cursor-suspend@pipe=
-a-dp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7883/shard-apl3/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html">=
DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb@atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flip=
b@atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7883/shard-iclb4/igt@kms_cursor_legacy@cursora-vs-flipb@atomic.html=
">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
74">fdo#109274</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb@varying-size:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_cursor_legacy@cursora-vs-flip=
b@varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7883/shard-tglb2/igt@kms_cursor_legacy@cursora-vs-flipb@varyi=
ng-size.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111825">fdo#111825</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7883/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-tran=
sitions.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7883/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transiti=
ons.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2346">i915#2346</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/6375">i915#6375</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@kms_fl=
ip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2587">i915#2587</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672=
</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms=
_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2672">i915#2672</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#355=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/6497">i915#6497</a>) +4 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>)=
 +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7883/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-prim=
scrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>) +40 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-pri=
mscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_pipe_b_c_ivb@enable-pipe-c-whi=
le-b-has-3-lanes.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b=
-has-3-lanes.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_pipe_b_c_ivb@enable-pipe-c-whil=
e-b-has-3-lanes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-a-planes.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7883/shard-apl2/igt@kms_plane@plane-panning-bottom-right-=
suspend@pipe-a-planes.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-apl3/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend@pipe-a-planes.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-consta=
nt-alpha-min.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a>) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_plane_alpha_blend@pipe-b-cove=
rage-7efc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7883/shard-tglb7/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
988">i915#6988</a>) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-=
basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7883/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">SKI=
P</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a>) +218 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7883/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-alpha-b=
asic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a>) +12 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-covera=
ge-vs-premult-vs-constant.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7883/shard-glk8/igt@kms_plane_alpha_blend@pipe-c-c=
overage-vs-premult-vs-constant.html">SKIP</a>) (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +151 similar issues<=
/p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_plane_alpha_blend@pipe-c-covera=
ge-vs-premult-vs-constant.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6988">i915#6988</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_plane_alpha_blend@pipe-d-alpha=
-transparent-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6988">i915#6988</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@kms_plane_alpha_blend@pipe-d-cons=
tant-alpha-min.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7883/shard-iclb2/igt@kms_plane_alpha_blend@pipe-d-constant-al=
pha-min.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/6988">i915#6988</a>) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-glk6/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-exceed-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12197/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard=
-iclb7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@kms_psr2_su@p=
age_flip-xrgb8888.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_psr2_su@page_flip-xrgb8888.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/=
shard-apl6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>) (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</=
p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shar=
d-iclb4/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@kms_psr@psr2=
_primary_page_flip.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-tglb8/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7883/shard-tglb3/igt@kms_psr_stress_test@invalidate-primary-fli=
p-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7883/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@edp-1-pipe-c:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-tglb3/igt@kms_sequence@get-forked@edp-1-pipe-c.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_788=
3/shard-tglb5/igt@kms_sequence@get-forked@edp-1-pipe-c.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@=
kms_sequence@get-forked@edp-1-pipe-c.html">INCOMPLETE</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/7035">i915#7035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-glk3/igt@kms_vblank@pipe-b-accuracy-idle.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shar=
d-glk5/igt@kms_vblank@pipe-b-accuracy-idle.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk7/igt@kms_vblank@pi=
pe-b-accuracy-idle.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/43">i915#43</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-apl2/igt@kms_vblank@pipe-d-wait-idle.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/sh=
ard-apl3/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a>) (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-glk5/igt@kms_writeback@writeback-invalid-pa=
rameters.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7883/shard-glk8/igt@kms_writeback@writeback-invalid-parameters.html=
">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@nouveau_crc@pipe-a-ctx-flip-detec=
tion.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7883/shard-iclb7/igt@nouveau_crc@pipe-a-ctx-flip-detection.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6971">i915#=
6971</a>) +44 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-inactive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@nouveau_crc@pipe-c-source-outp-ina=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/6971">i915#6971</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-tglb1/igt@perf_pmu@module-unload.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/=
igt@perf_pmu@module-unload.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@perf_pmu@module-unload=
.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2867">i915#2867</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@prime_nv_api@nv_i915_reimport_twi=
ce_check_flink_name.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7883/shard-tglb7/igt@prime_nv_api@nv_i915_reimport_twice=
_check_flink_name.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/6971">i915#6971</a>) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_5:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-snb4/igt@prime_nv_pcopy@test3_5.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-s=
nb2/igt@prime_nv_pcopy@test3_5.html">SKIP</a>) (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +151 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test_semaphore:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@prime_nv_pcopy@test_semaphore.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6971=
">i915#6971</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-apl2/igt@sysfs_clients@sema-25.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl=
3/igt@sysfs_clients@sema-25.html">SKIP</a>) (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +1 similar issue<=
/p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@sysfs_clients@sema-25.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tg=
lb8/igt@sysfs_clients@sema-25.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2994">i915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7883/shard-glk8/igt@sysfs_clients@sema-25.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk=
9/igt@sysfs_clients@sema-25.html">SKIP</a>) (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +1 similar issue<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@sysfs_clients@split-10.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-=
iclb1/igt@sysfs_clients@split-10.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-apl8/igt@gem_ctx_isolation@preservation-s3@rcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7883/shard-apl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shar=
d-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6247">i915#624=
7</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_788=
3/shard-rkl-2/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-1/igt@gem_ex=
ec_endless@dispatch@bcs0.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7883/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt=
@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctx0.html">DMESG-FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3692">i915=
#3692</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7883/shard-rkl-1/igt@gem_ppgtt@blt-vs-render-ctx0.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-2/igt@gem=
_ppgtt@blt-vs-render-ctx0.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctxn:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctxn.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4998">i915#4998<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6778">i915=
#6778</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7883/shard-rkl-2/igt@gem_ppgtt@blt-vs-render-ctxn.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-6/igt@gem_pwrite@basic-random.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-=
rkl-5/igt@gem_pwrite@basic-random.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i9=
15#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7883/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">PASS</a> =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-5/igt@gem_softpin@evict-single-offset.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171">i915#41=
71</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
83/shard-rkl-3/igt@gem_softpin@evict-single-offset.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-1/igt@gem=
_softpin@evict-single-offset.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-tglu-3/igt@gem_workarounds@suspend-resume.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5122">i=
915#5122</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7883/shard-tglu-3/igt@gem_workarounds@suspend-resume.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglu-4/i=
gt@gem_workarounds@suspend-resume.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-glk5/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5=
566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i=
915#716</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7883/shard-glk3/igt@gen9_exec_parse@allowed-all.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk2/igt@gen9=
_exec_parse@allowed-all.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6258">i=
915#6258</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7883/shard-rkl-1/igt@i915_hangman@engine-engine-error@bcs0.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rk=
l-4/igt@i915_hangman@engine-engine-error@bcs0.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-snb5/igt@i915_module_load@reload-no-display.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4528"=
>i915#4528</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7883/shard-snb4/igt@i915_module_load@reload-no-display.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb6=
/igt@i915_module_load@reload-no-display.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-5/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-r=
kl-2/igt@i915_pm_dc@dc9-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-3/igt@i915_pm_dc@dc9-dpms.html">=
PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-apl7/igt@i915_pm_rps@engine-order.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/6537">i915#6537</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard=
-apl8/igt@i915_pm_rps@engine-order.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@i915_pm_rps@engine-or=
der.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-apl1/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#18=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883=
/shard-apl7/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915=
#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
83/shard-apl3/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html">PASS</a> +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_plane=
_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/s=
hard-iclb5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-facto=
r-0-5@pipe-b-edp-1.html">PASS</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-tglb8/igt@perf@polling-small-buf.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-=
tglb2/igt@perf@polling-small-buf.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@perf@polling-small-buf=
.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb6/igt@feature_discovery@psr2.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-ic=
lb6/igt@feature_discovery@psr2.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@feature_discovery@psr2.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb6/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4525">i915#4525</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7883/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fenc=
e.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7883/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i=
915#4525</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i91=
5#6117</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7883/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/=
igt@gem_exec_balancer@parallel-ordering.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/6117">i915#6117</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7883/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk9/igt@g=
em_exec_fair@basic-none-rrul@rcs0.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7883/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/=
igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883=
/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@i915_p=
m_dc@dc3co-vpb-simulation.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/588">i915#588</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-=
iclb5/igt@i915_pm_dc@dc6-psr.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3989">=
i915#3989</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-apl6/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180<=
/a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/=
shard-apl6/igt@i915_suspend@sysfs-reader.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@i915_suspend@sy=
sfs-reader.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2920">i915#2920</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7883/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continu=
ous-exceed-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7883/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-continuous-=
exceed-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-d=
mg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7883/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.ht=
ml">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642<=
/a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7883/shard-iclb6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@=
kms_psr2_su@page_flip-nv12.html">FAIL</a>) (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
883/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms=
_psr@psr2_sprite_plane_move.html">SKIP</a>) (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12197/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl6/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12197/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl8/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_12197/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@runner@aborted.=
html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4312">i915#4312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7883/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7883/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7883/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7883/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883=
/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@runner@aborted.html">FAIL=
</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6668 -&gt; IGTPW_7883</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12197: cafa326de8e7860d45639e61bf66ec9c218207b1 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7883: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/index.htm=
l<br />
  IGT_6668: 5f29c9369550164b35b65baaaeba4b370f434cf1 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2566100874891320328==--
