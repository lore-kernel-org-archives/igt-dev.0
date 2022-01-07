Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3379999707251191612=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 Jan 2022 13:25:49 -0000
Message-ID: <164156194958.24389.11003785887882704793@emeril.freedesktop.org>
References: <20220106100043.14843-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220106100043.14843-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHN0?=
 =?utf-8?q?art_offset_and_alignment_detection_=28rev7=29?=
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

--===============3379999707251191612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add start offset and alignment detection (rev7)
URL   : https://patchwork.freedesktop.org/series/98402/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11052_full -> IGTPW_6540_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6540_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6540_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/index.html

Participating hosts (13 -> 8)
------------------------------

  Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6540_full:

### IGT changes ###

#### Possible regressions ####

  * igt@sysfs_heartbeat_interval@nopreempt@vcs1:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglb3/igt@sysfs_heartbeat_interval@nopreempt@vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb2/igt@sysfs_heartbeat_interval@nopreempt@vcs1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_create@busy-create:
    - {shard-tglu}:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-8/igt@gem_create@busy-create.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglu-7/igt@gem_create@busy-create.html

  * igt@i915_pm_dc@dc6-psr:
    - {shard-tglu}:       NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglu-2/igt@i915_pm_dc@dc6-psr.html

  * igt@runner@aborted:
    - {shard-tglu}:       ([FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9]) ([i915#3002] / [i915#3690] / [i915#4312]) -> ([FAIL][10], [FAIL][11], [FAIL][12]) ([i915#3002] / [i915#4312])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-7/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-7/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-5/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-3/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglu-6/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglu-7/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglu-3/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11052_full and IGTPW_6540_full:

### New IGT tests (1) ###

  * igt@gem_softpin@safe-alignment:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_6540_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1099])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-snb2/igt@gem_ctx_persistence@engines-persistence.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#280]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb5/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#4525]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb1/igt@gem_exec_balancer@parallel.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb7/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#2842]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-kbl1/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl3/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          NOTRUN -> [FAIL][21] ([i915#2842]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl3/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#2842]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][26] ([i915#2842])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#2849])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#109283])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb7/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#112283])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb6/igt@gem_exec_params@secure-non-root.html
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#112283])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb8/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [PASS][32] -> [DMESG-WARN][33] ([i915#118]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk1/igt@gem_exec_whisper@basic-queues-forked.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk9/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-kbl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#4613])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl4/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#4613])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb1/igt@gem_lmem_swapping@parallel-multi.html
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#4613])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb2/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111656])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb2/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#4270])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb1/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#4270])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb2/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][40] -> [DMESG-WARN][41] ([i915#180]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#2856])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb1/igt@gen9_exec_parse@bb-start-far.html
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#2527] / [i915#2856])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb2/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][44] ([i915#454])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][45] ([i915#454]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#1937])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#1937])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#111614])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb6/igt@kms_big_fb@linear-16bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#110725] / [fdo#111614])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb8/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-iclb:         [PASS][50] -> [FAIL][51] ([i915#1888])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [i915#3777])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271]) +102 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#3886]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#3886]) +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl8/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#3886])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk4/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109278] / [i915#3886]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#3689] / [i915#3886])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3689]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb6/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][60] ([fdo#109271]) +163 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl6/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278]) +13 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb7/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#111615] / [i915#3689]) +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb3/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-frame-dump:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb6/igt@kms_chamelium@dp-frame-dump.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl7/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl7/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109278] / [i915#1149])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb2/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][67] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk7/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb2/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-snb:          NOTRUN -> [SKIP][69] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-snb6/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb1/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][71] ([i915#1319])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl8/igt@kms_content_protection@atomic-dpms.html
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#1063]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb7/igt@kms_content_protection@atomic-dpms.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][73] ([i915#1319])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb7/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109279] / [i915#3359]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-snb:          [PASS][76] -> [SKIP][77] ([fdo#109271])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-snb4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-snb6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding:
    - shard-kbl:          [PASS][79] -> [INCOMPLETE][80] ([i915#794])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#3359]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-snb:          NOTRUN -> [SKIP][82] ([fdo#109271]) +48 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-snb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109274] / [fdo#109278])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@pipe-d-forked-move:
    - shard-glk:          NOTRUN -> [SKIP][84] ([fdo#109271]) +21 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk6/igt@kms_cursor_legacy@pipe-d-forked-move.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-kbl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#533]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl1/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_dsc@basic-dsc-enable:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([i915#3840])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb6/igt@kms_dsc@basic-dsc-enable.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          NOTRUN -> [INCOMPLETE][87] ([i915#180])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][88] ([i915#180] / [i915#636])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109274] / [fdo#111825]) +4 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109274]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb7/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][91] -> [FAIL][92] ([i915#2122])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk6/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk9/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-tglb:         [PASS][93] -> [FAIL][94] ([i915#79])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-iclb:         [PASS][95] -> [SKIP][96] ([i915#3701]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#109280] / [fdo#111825]) +13 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109280]) +10 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-apl:          [PASS][99] -> [DMESG-WARN][100] ([i915#180]) +4 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][101] ([fdo#108145] / [i915#265]) +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-glk:          NOTRUN -> [FAIL][102] ([fdo#108145] / [i915#265])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][103] ([fdo#108145] / [i915#265]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([i915#3536]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb3/igt@kms_plane_lowres@pipe-b-tiling-x.html

  * igt@kms_plane_lowres@pipe-d-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#3536]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb8/igt@kms_plane_lowres@pipe-d-tiling-y.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-kbl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#658])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
    - shard-apl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#658])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][108] -> [SKIP][109] ([fdo#109441]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-tglb:         NOTRUN -> [FAIL][110] ([i915#132] / [i915#3467]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb8/igt@kms_psr@psr2_sprite_mmap_cpu.html
    - shard-iclb:         NOTRUN -> [SKIP][111] ([fdo#109441])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-glk:          [PASS][112] -> [FAIL][113] ([i915#1888] / [i915#65])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk7/igt@kms_rotation_crc@primary-rotation-90.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-iclb:         [PASS][114] -> [FAIL][115] ([i915#1888] / [i915#65])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb1/igt@kms_rotation_crc@sprite-rotation-180.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb6/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][116] ([IGT#2])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl6/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          NOTRUN -> [FAIL][117] ([IGT#2])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl6/igt@kms_sysfs_edid_timing.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#2437])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl1/igt@kms_writeback@writeback-check-output.html
    - shard-kbl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#2437])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl1/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-b-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#2530])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb3/igt@nouveau_crc@pipe-b-source-rg.html

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][121] ([i915#2530]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb1/igt@nouveau_crc@pipe-c-source-outp-complete.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [PASS][122] -> [FAIL][123] ([i915#1542])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk8/igt@perf@polling-parameterized.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk2/igt@perf@polling-parameterized.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-iclb:         NOTRUN -> [SKIP][124] ([fdo#109291])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb3/igt@prime_nv_api@i915_nv_import_twice.html
    - shard-tglb:         NOTRUN -> [SKIP][125] ([fdo#109291])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb8/igt@prime_nv_api@i915_nv_import_twice.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@many-contexts:
    - {shard-tglu}:       [INCOMPLETE][126] -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-7/igt@gem_ctx_persistence@many-contexts.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglu-1/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [FAIL][128] ([i915#232]) -> [PASS][129] +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglb3/igt@gem_eio@unwedge-stress.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [SKIP][130] ([i915#4525]) -> [PASS][131] +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-iclb:         [FAIL][132] ([i915#2846]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb7/igt@gem_exec_fair@basic-deadline.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [FAIL][134] ([i915#2842]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][136] ([i915#454]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [FAIL][138] ([i915#4275]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-apl1/igt@i915_pm_dc@dc9-dpms.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl1/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - {shard-tglu}:       [FAIL][140] ([i915#3825]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_D

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/index.html

--===============3379999707251191612==
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
<tr><td><b>Series:</b></td><td>Add start offset and alignment detection (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98402/">https://patchwork.freedesktop.org/series/98402/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11052_full -&gt; IGTPW_6540_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6540_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6540_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/index.html</p>
<h2>Participating hosts (13 -&gt; 8)</h2>
<p>Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6540_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@sysfs_heartbeat_interval@nopreempt@vcs1:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglb3/igt@sysfs_heartbeat_interval@nopreempt@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb2/igt@sysfs_heartbeat_interval@nopreempt@vcs1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_create@busy-create:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-8/igt@gem_create@busy-create.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglu-7/igt@gem_create@busy-create.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglu-2/igt@i915_pm_dc@dc6-psr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>{shard-tglu}:       (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-3/igt@runner@aborted.html">FAIL</a>) ([i915#3002] / [i915#3690] / [i915#4312]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglu-6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglu-7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglu-3/igt@runner@aborted.html">FAIL</a>) ([i915#3002] / [i915#4312])</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11052_full and IGTPW_6540_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_softpin@safe-alignment:<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6540_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-snb2/igt@gem_ctx_persistence@engines-persistence.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb5/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb1/igt@gem_exec_balancer@parallel.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb7/igt@gem_exec_balancer@parallel.html">SKIP</a> ([i915#4525]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-kbl1/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl3/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl3/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb7/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb6/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb8/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk1/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk9/igt@gem_exec_whisper@basic-queues-forked.html">DMESG-WARN</a> ([i915#118]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl4/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb1/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb2/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb2/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#111656])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb1/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> ([i915#4270])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb2/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb1/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb2/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2527] / [i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb7/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb6/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#111614])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb8/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">FAIL</a> ([i915#1888])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#109271]) +102 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl8/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk4/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb6/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl6/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271]) +163 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb7/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([fdo#109278]) +13 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb3/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-frame-dump:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb6/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl7/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl7/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb2/igt@kms_color@pipe-d-ctm-blue-to-red.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk7/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb2/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-snb6/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb1/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl8/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb7/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#1063]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl6/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb7/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-snb4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-snb6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html">INCOMPLETE</a> ([i915#794])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html">SKIP</a> ([i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-snb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> ([fdo#109271]) +48 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-forked-move:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk6/igt@kms_cursor_legacy@pipe-d-forked-move.html">SKIP</a> ([fdo#109271]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl1/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb6/igt@kms_dsc@basic-dsc-enable.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180] / [i915#636])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb7/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk6/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk9/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#3701]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([fdo#109280]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html">DMESG-WARN</a> ([i915#180]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb3/igt@kms_plane_lowres@pipe-b-tiling-x.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-y:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb8/igt@kms_plane_lowres@pipe-d-tiling-y.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb8/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb8/igt@kms_psr@psr2_sprite_mmap_cpu.html">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> ([fdo#109441])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk7/igt@kms_rotation_crc@primary-rotation-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk3/igt@kms_rotation_crc@primary-rotation-90.html">FAIL</a> ([i915#1888] / [i915#65])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb1/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb6/igt@kms_rotation_crc@sprite-rotation-180.html">FAIL</a> ([i915#1888] / [i915#65])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl6/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl6/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl1/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-kbl1/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb3/igt@nouveau_crc@pipe-b-source-rg.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb1/igt@nouveau_crc@pipe-c-source-outp-complete.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk8/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk2/igt@perf@polling-parameterized.html">FAIL</a> ([i915#1542])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb3/igt@prime_nv_api@i915_nv_import_twice.html">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb8/igt@prime_nv_api@i915_nv_import_twice.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglu-7/igt@gem_ctx_persistence@many-contexts.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglu-1/igt@gem_ctx_persistence@many-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-tglb3/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#232]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-tglb6/igt@gem_eio@unwedge-stress.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([i915#4525]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-glk6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11052/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#4275]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_D">FAIL</a> ([i915#3825]) -&gt; [PASS][141]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3379999707251191612==--
