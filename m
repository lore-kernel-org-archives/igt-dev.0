Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4044983209022014009=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 07 Feb 2022 21:46:03 -0000
Message-ID: <164427036395.23831.14024565135941375253@emeril.freedesktop.org>
References: <20220207183437.205388-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220207183437.205388-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?api=5Fintel=5Fbb=3A_Handle_different_alignments_in_delta-check?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============4044983209022014009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/api_intel_bb: Handle different alignments in delta-check
URL   : https://patchwork.freedesktop.org/series/99785/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11197_full -> IGTPW_6600_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6600_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6600_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/index.html

Participating hosts (12 -> 8)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6600_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  
Known issues
------------

  Here are the changes found in IGTPW_6600_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-apl:          [PASS][3] -> [INCOMPLETE][4] ([i915#1373])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-apl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl8/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][5] -> [FAIL][6] ([i915#232])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb7/igt@gem_eio@kms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#4525])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb1/igt@gem_exec_balancer@parallel.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb7/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         NOTRUN -> [SKIP][9] ([i915#4525])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb5/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_capture@pi@rcs0:
    - shard-tglb:         [PASS][10] -> [INCOMPLETE][11] ([i915#3371])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb3/igt@gem_exec_capture@pi@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb5/igt@gem_exec_capture@pi@rcs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#2846])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk4/igt@gem_exec_fair@basic-deadline.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][14] -> [FAIL][15] ([i915#2842]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][16] ([i915#2842]) +5 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][17] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#2842]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][20] -> [FAIL][21] ([i915#2849])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-iclb:         [PASS][22] -> [INCOMPLETE][23] ([i915#1895])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb4/igt@gem_exec_whisper@basic-queues-forked.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb5/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_lmem_swapping@random:
    - shard-apl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#4613]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl7/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-kbl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#4613]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl3/igt@gem_lmem_swapping@smem-oom.html
    - shard-glk:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4613])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk2/igt@gem_lmem_swapping@smem-oom.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#4613])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb4/igt@gem_lmem_swapping@smem-oom.html
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#4613])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb3/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_mmap_gtt@coherency:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109292])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb2/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#4270])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb3/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#4270]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb1/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#768]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb6/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][33] ([fdo#109271]) +118 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy_redux@flink-interruptible:
    - shard-glk:          [PASS][34] -> [DMESG-WARN][35] ([i915#118]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk8/igt@gem_render_copy_redux@flink-interruptible.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk1/igt@gem_render_copy_redux@flink-interruptible.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#3297])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@gem_userptr_blits@readonly-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#3297])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb6/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-iclb:         NOTRUN -> [FAIL][38] ([i915#3318])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb7/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_mixed_blits:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#109289])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@gen3_render_mixed_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109289])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb2/igt@gen3_render_mixed_blits.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#2527] / [i915#2856]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#2856]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb8/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         NOTRUN -> [FAIL][43] ([i915#454])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [PASS][44] -> [WARN][45] ([i915#2681] / [i915#2684])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb6/igt@i915_pm_rc6_residency@rc6-fence.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         [PASS][46] -> [WARN][47] ([i915#2684])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#109506] / [i915#2411])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#111644] / [i915#1397] / [i915#2411])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#110892])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][51] -> [DMESG-WARN][52] ([i915#180]) +6 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#3777]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#3777]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111615]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> [SKIP][56] ([fdo#109271]) +95 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#110723])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278] / [i915#3886]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb5/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#3886])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#3689] / [i915#3886])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb8/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#3886]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl7/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#3886]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl7/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3689]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb3/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111615] / [i915#3689]) +7 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb6/igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb1/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-snb:          NOTRUN -> [SKIP][67] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-snb4/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk3/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl3/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109278] / [i915#1149]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb2/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-c-ctm-max:
    - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl6/igt@kms_color_chamelium@pipe-c-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][73] ([i915#1319])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content_type_change:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#1063])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb1/igt@kms_content_protection@content_type_change.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3359]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109278]) +14 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb5/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#3319]) +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109278] / [fdo#109279])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109279] / [i915#3359]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge:
    - shard-glk:          [PASS][80] -> [DMESG-WARN][81] ([i915#118] / [i915#1888]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk9/igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk5/igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#109274] / [fdo#111825]) +5 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_dsc@basic-dsc-enable:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([i915#3840])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb2/igt@kms_dsc@basic-dsc-enable.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109274])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1:
    - shard-glk:          [PASS][86] -> [FAIL][87] ([i915#2122])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk6/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk9/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-glk:          [PASS][88] -> [FAIL][89] ([i915#2546])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-snb:          NOTRUN -> [SKIP][90] ([fdo#109271]) +70 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][91] ([i915#180]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][92] ([fdo#109271]) +44 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109280]) +12 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#109280] / [fdo#111825]) +16 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([i915#1187])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-kbl:          [PASS][96] -> [DMESG-WARN][97] ([i915#180]) +10 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][98] ([fdo#108145] / [i915#265])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
    - shard-apl:          NOTRUN -> [FAIL][99] ([fdo#108145] / [i915#265])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][100] ([fdo#108145] / [i915#265]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_lowres@pipe-a-tiling-yf:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#3536])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb4/igt@kms_plane_lowres@pipe-a-tiling-yf.html
    - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#111615] / [fdo#112054])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb3/igt@kms_plane_lowres@pipe-a-tiling-yf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#111068] / [i915#658])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr@psr2_basic:
    - shard-tglb:         NOTRUN -> [FAIL][104] ([i915#132] / [i915#3467])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@kms_psr@psr2_basic.html
    - shard-iclb:         NOTRUN -> [SKIP][105] ([fdo#109441])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb8/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][106] -> [SKIP][107] ([fdo#109441]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][108] ([IGT#2])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl7/igt@kms_sysfs_edid_timing.html

  * igt@kms_writeback@writeback-check-output:
    - shard-kbl:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2437])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl7/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-a-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#2530]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb5/igt@nouveau_crc@pipe-a-source-outp-inactive.html

  * igt@nouveau_crc@pipe-d-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#2530]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb1/igt@nouveau_crc@pipe-d-source-outp-inactive.html
    - shard-iclb:         NOTRUN -> [SKIP][112] ([fdo#109278] / [i915#2530])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb8/igt@nouveau_crc@pipe-d-source-outp-inactive.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([fdo#112283])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb4/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglb:         NOTRUN -> [SKIP][114] ([fdo#112283])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb3/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#109291]) +4 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb6/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test_semaphore:
    - shard-iclb:         NOTRUN -> [SKIP][116] ([fdo#109291]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb3/igt@prime_nv_pcopy@test_semaphore.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][117] ([fdo#111656]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_clients@fair-1:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([i915#2994]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@sysfs_clients@fair-1.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - {shard-tglu}:       [TIMEOUT][119] ([i915#3063] / [i915#3648]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglu-3/igt@gem_eio@unwedge-stress.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglu-5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][121] ([i915#4525]) -> [PASS][122] +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb5/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@pi@vcs0:
    - shard-iclb:         [INCOMPLETE][123] ([i915#3371]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb7/igt@gem_exec_capture@pi@vcs0.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb3/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-apl:          [SKIP][125] ([fdo#109271]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][127] ([i915#2842]) -> [PASS][128] +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [FAIL][129] ([i915#2842]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][131] ([i915#2190]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb7/igt@gem_huc_copy@huc-copy.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_softpin@allocator-evict-all-engines:
    - shard-glk:          [FAIL][133] ([i915#4171]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk6/igt@gem_softpin@allocator-evict-all-engines.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk5/igt@gem_softpin@allocator-evict-all-engines.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [SKIP][135] ([i915#4281]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/index.html

--===============4044983209022014009==
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
<tr><td><b>Series:</b></td><td>tests/api_intel_bb: Handle different alignments in delta-check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/99785/">https://patchwork.freedesktop.org/series/99785/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11197_full -&gt; IGTPW_6600_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6600_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6600_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/index.html</p>
<h2>Participating hosts (12 -&gt; 8)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6600_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_crc@pipe-a-cursor-dpms:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6600_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-apl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl8/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a> ([i915#1373])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb7/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@gem_eio@kms.html">FAIL</a> ([i915#232])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb1/igt@gem_exec_balancer@parallel.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb7/igt@gem_exec_balancer@parallel.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb5/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb3/igt@gem_exec_capture@pi@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb5/igt@gem_exec_capture@pi@rcs0.html">INCOMPLETE</a> ([i915#3371])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk4/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb4/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb5/igt@gem_exec_whisper@basic-queues-forked.html">INCOMPLETE</a> ([i915#1895])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl7/igt@gem_lmem_swapping@random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl3/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([fdo#109271] / [i915#4613]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk2/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb4/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb3/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb2/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#109292])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb3/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb1/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb6/igt@gem_render_copy@linear-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +118 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy_redux@flink-interruptible:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk8/igt@gem_render_copy_redux@flink-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk1/igt@gem_render_copy_redux@flink-interruptible.html">DMESG-WARN</a> ([i915#118]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb6/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb7/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb2/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb8/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb6/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#180]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#109271]) +95 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#110723])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb5/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb8/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl7/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl7/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb3/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb6/igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb1/igt@kms_chamelium@dp-hpd-storm-disable.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-snb4/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk3/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl3/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb2/igt@kms_color@pipe-d-ctm-0-5.html">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl6/igt@kms_color_chamelium@pipe-c-ctm-max.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl6/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb1/igt@kms_content_protection@content_type_change.html">SKIP</a> ([i915#1063])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html">SKIP</a> ([i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb5/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html">SKIP</a> ([fdo#109278]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html">SKIP</a> ([i915#3319]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk9/igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk5/igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge.html">DMESG-WARN</a> ([i915#118] / [i915#1888]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb2/igt@kms_dsc@basic-dsc-enable.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk6/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk9/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">FAIL</a> ([i915#2546])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +70 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +44 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109280]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">DMESG-WARN</a> ([i915#180]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-yf:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb4/igt@kms_plane_lowres@pipe-a-tiling-yf.html">SKIP</a> ([i915#3536])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb3/igt@kms_plane_lowres@pipe-a-tiling-yf.html">SKIP</a> ([fdo#111615] / [fdo#112054])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@kms_psr@psr2_basic.html">FAIL</a> ([i915#132] / [i915#3467])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb8/igt@kms_psr@psr2_basic.html">SKIP</a> ([fdo#109441])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl7/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl7/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-inactive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb5/igt@nouveau_crc@pipe-a-source-outp-inactive.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-inactive:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb1/igt@nouveau_crc@pipe-d-source-outp-inactive.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb8/igt@nouveau_crc@pipe-d-source-outp-inactive.html">SKIP</a> ([fdo#109278] / [i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb4/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb3/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb6/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test_semaphore:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb3/igt@prime_nv_pcopy@test_semaphore.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([fdo#111656]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb2/igt@sysfs_clients@fair-1.html">SKIP</a> ([i915#2994]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglu-3/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#3063] / [i915#3648]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglu-5/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb5/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> ([i915#4525]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb7/igt@gem_exec_capture@pi@vcs0.html">INCOMPLETE</a> ([i915#3371]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-iclb3/igt@gem_exec_capture@pi@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-apl7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-evict-all-engines:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk6/igt@gem_softpin@allocator-evict-all-engines.html">FAIL</a> ([i915#4171]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600/shard-glk5/igt@gem_softpin@allocator-evict-all-engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6600">PASS</a></li>
</ul>
</li>
</ul>

</body>
</html>

--===============4044983209022014009==--
