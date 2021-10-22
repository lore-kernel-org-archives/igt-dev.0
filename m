Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3857268611409406086=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 22 Oct 2021 04:21:14 -0000
Message-ID: <163487647447.14704.7829607464745103839@emeril.freedesktop.org>
References: <20211022001844.36634-1-matthew.brost@intel.com>
In-Reply-To: <20211022001844.36634-1-matthew.brost@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fbalancer=3A_Test_parallel_execbuf?=
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
To: Matthew Brost <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============3857268611409406086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_balancer: Test parallel execbuf
URL   : https://patchwork.freedesktop.org/series/96161/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10773_full -> IGTPW_6347_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6347_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_balancer@parallel-contexts} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@gem_exec_balancer@parallel-contexts.html

  * {igt@gem_exec_balancer@parallel-out-fence} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +7 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb7/igt@gem_exec_balancer@parallel-out-fence.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10773_full and IGTPW_6347_full:

### New IGT tests (8) ###

  * igt@gem_exec_balancer@parallel:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_balancer@parallel-balancer:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_balancer@parallel-bb-first:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_balancer@parallel-contexts:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_balancer@parallel-ordering:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_balancer@parallel-out-fence:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_6347_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#1839])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb6/igt@feature_discovery@display-2x.html

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][4] ([i915#3002])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-snb5/igt@gem_create@create-massive.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][5] ([i915#3002])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl3/igt@gem_create@create-massive.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][6] ([i915#3002])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl1/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_eio@unwedge-stress:
    - shard-glk:          [PASS][8] -> [TIMEOUT][9] ([i915#2369])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-glk7/igt@gem_eio@unwedge-stress.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk8/igt@gem_eio@unwedge-stress.html
    - shard-tglb:         [PASS][10] -> [TIMEOUT][11] ([i915#2369] / [i915#3063] / [i915#3648])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb3/igt@gem_eio@unwedge-stress.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@gem_eio@unwedge-stress.html

  * {igt@gem_exec_balancer@parallel-out-fence} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][12] ([fdo#109271]) +42 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk6/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl2/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2842]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#2842]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][19] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#109313])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#109313])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_params@no-bsd:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#109283])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb7/igt@gem_exec_params@no-bsd.html
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#109283])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb6/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#112283])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb6/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#118])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-glk9/igt@gem_exec_whisper@basic-normal.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk6/igt@gem_exec_whisper@basic-normal.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#4270])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb7/igt@gem_pxp@create-protected-buffer.html
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#4270])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#3323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#3297])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-kbl:          NOTRUN -> [FAIL][31] ([i915#3318])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl1/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109289])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb7/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1436] / [i915#716])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-kbl2/igt@gen9_exec_parse@allowed-all.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl7/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#2856])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@gen9_exec_parse@shadow-peek.html
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#2856])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb2/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [PASS][37] -> [FAIL][38] ([i915#4275])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-iclb4/igt@i915_pm_dc@dc9-dpms.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb4/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#111644] / [i915#1397] / [i915#2411])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#109288])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109302])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          NOTRUN -> [INCOMPLETE][42] ([i915#3921])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-snb6/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-tglb:         [PASS][45] -> [INCOMPLETE][46] ([i915#456])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb5/igt@i915_suspend@sysfs-reader.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111614]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb3/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#110725] / [fdo#111614])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3777]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111615])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#2705])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][52] ([fdo#109271] / [i915#3886]) +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109278] / [i915#3886]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#3689] / [i915#3886])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#3886]) +7 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb8/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#3886]) +10 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#3689]) +8 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271]) +254 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl7/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl1/igt@kms_chamelium@vga-hpd.html

  * igt@kms_chamelium@vga-hpd-after-suspend:
    - shard-glk:          NOTRUN -> [SKIP][61] ([fdo#109271] / [fdo#111827])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk5/igt@kms_chamelium@vga-hpd-after-suspend.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> [SKIP][62] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-snb6/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-kbl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_content_protection@srm:
    - shard-apl:          NOTRUN -> [TIMEOUT][65] ([i915#1319])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][66] ([i915#2105])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109279] / [i915#3359]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#3359]) +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-random:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3319])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x32-random.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][70] ([fdo#109271]) +409 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109274] / [fdo#109278])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][72] -> [FAIL][73] ([i915#2346])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#3528])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][75] -> [FAIL][76] ([i915#2122])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-glk3/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-hdmi-a1-hdmi-a2.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][77] -> [DMESG-WARN][78] ([i915#180]) +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#111825]) +20 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109280]) +7 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][81] ([i915#180])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         [PASS][82] -> [INCOMPLETE][83] ([i915#2411] / [i915#456])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb2/igt@kms_frontbuffer_tracking@psr-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb7/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][84] ([i915#180]) +6 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#1187])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb5/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#533]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl6/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-tglb:         [PASS][87] -> [INCOMPLETE][88] ([i915#2828] / [i915#456])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][89] ([i915#456])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][90] ([fdo#108145] / [i915#265]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][91] ([i915#265])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][92] ([fdo#108145] / [i915#265]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][93] ([i915#265])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#3536])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb3/igt@kms_plane_lowres@pipe-a-tiling-y.html
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#3536])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#658]) +4 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-kbl:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#658]) +5 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#2920]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#1911])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][100] ([i915#132] / [i915#3467])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][101] -> [SKIP][102] ([fdo#109441]) +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb5/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][103] ([fdo#109271]) +231 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#533]) +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#2437]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl7/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#2530])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html

  * igt@prime_nv_test@i915_import_cpu_mmap:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109291])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb5/igt@prime_nv_test@i915_import_cpu_mmap.html
    - shard-tglb:         NOTRUN -> [SKIP][108] ([fdo#109291])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@prime_nv_test@i915_import_cpu_mmap.html

  * igt@prime_vgem@basic-userptr:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([i915#3301])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@prime_vgem@basic-userptr.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([fdo#109295])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@prime_vgem@fence-write-hang.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#2994]) +4 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl8/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@sema-10:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#2994]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb7/igt@sysfs_clients@sema-10.html
    - shard-kbl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#2994])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl1/igt@sysfs_clients@sema-10.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [FAIL][114] ([i915#2842]) -> [PASS][115] +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html
    - shard-iclb:         [FAIL][116] ([i915#2842]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][118] ([i915#2849]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][120] ([i915#2190]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][122] ([i915#454]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@forcewake:
    - shard-tglb:         [INCOMPLETE][124] ([i915#2411] / [i915#456]) -> [PASS][125] +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb7/igt@i915_suspend@forcewake.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb5/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [DMESG-WARN][126] ([i915#118]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][128] ([i915#180]) -> [PASS][129] +5 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglb:         [INCOMPLETE][130] ([i915#456]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb7/igt@kms_fbcon_fbt@psr-suspend.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-kbl:          [FAIL][132] ([i915#79]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-tglb:         [INCOMPLETE][134] ([i915#2828] / [i915#456]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@kms_frontbuffer_trackin

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/index.html

--===============3857268611409406086==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_balancer: Test parallel execbuf</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/96161/">https://patchwork.freedesktop.org/series/96161/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10773_full -&gt; IGTPW_6347_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6347_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec_balancer@parallel-contexts} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_balancer@parallel-out-fence} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb7/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> +7 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10773_full and IGTPW_6347_full:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6347_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb6/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-snb5/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl3/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl1/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-glk7/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb3/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i915#3648])</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_balancer@parallel-out-fence} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk6/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([fdo#109271]) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl2/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb7/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb6/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb6/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-glk9/igt@gem_exec_whisper@basic-normal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk6/igt@gem_exec_whisper@basic-normal.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb7/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl1/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb7/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-kbl2/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl7/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> ([i915#1436] / [i915#716])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb2/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-iclb4/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb4/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#4275])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-snb6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#3921])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb5/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb7/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb3/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb8/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs.html">SKIP</a> ([fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html">SKIP</a> ([i915#3689]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl7/igt@kms_cdclk@mode-transition.html">SKIP</a> ([fdo#109271]) +254 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl1/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk5/igt@kms_chamelium@vga-hpd-after-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-snb6/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-0-75.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl8/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl2/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen.html">SKIP</a> ([i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x32-random.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +409 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#3528])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-glk3/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> ([fdo#111825]) +20 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> ([fdo#109280]) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb2/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb7/igt@kms_frontbuffer_tracking@psr-suspend.html">INCOMPLETE</a> ([i915#2411] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> ([i915#180]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb5/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl6/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> ([i915#2828] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">INCOMPLETE</a> ([i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb3/igt@kms_plane_lowres@pipe-a-tiling-y.html">SKIP</a> ([i915#3536])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@kms_plane_lowres@pipe-a-tiling-y.html">SKIP</a> ([i915#3536])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@kms_psr2_su@page_flip.html">SKIP</a> ([i915#1911])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@kms_psr@psr2_cursor_plane_onoff.html">FAIL</a> ([i915#132] / [i915#3467])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb5/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html">SKIP</a> ([fdo#109271]) +231 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl7/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_cpu_mmap:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb5/igt@prime_nv_test@i915_import_cpu_mmap.html">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@prime_nv_test@i915_import_cpu_mmap.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@prime_vgem@basic-userptr.html">SKIP</a> ([i915#3301])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb8/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([fdo#109295])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-apl8/igt@sysfs_clients@fair-7.html">SKIP</a> ([fdo#109271] / [i915#2994]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb7/igt@sysfs_clients@sema-10.html">SKIP</a> ([i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl1/igt@sysfs_clients@sema-10.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb2/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-iclb7/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb7/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#2411] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb5/igt@i915_suspend@forcewake.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb7/igt@kms_fbcon_fbt@psr-suspend.html">INCOMPLETE</a> ([i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10773/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> ([i915#2828] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6347/shard-tglb1/igt@kms_frontbuffer_trackin">PASS</a></li>
</ul>
</li>
</ul>

</body>
</html>

--===============3857268611409406086==--
