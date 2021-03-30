Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 30 Mar 2021 16:14:07 -0000
Message-ID: <161712084798.22473.6541052283508025960@emeril.freedesktop.org>
References: <20210330035056.52019-1-ashutosh.dixit@intel.com>
In-Reply-To: <20210330035056.52019-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNTog?=
 =?utf-8?q?Avoid_set=5Fdomain_-ENOMEM_error_with_huge_buffers?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0581480759=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0581480759==
Content-Type: multipart/alternative;
 boundary="===============0242507130325115700=="

--===============0242507130325115700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915: Avoid set_domain -ENOMEM error with huge buffers
URL   : https://patchwork.freedesktop.org/series/88561/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9914_full -> IGTPW_5675_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/index.html

Known issues
------------

  Here are the changes found in IGTPW_5675_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-clear:
    - shard-iclb:         [PASS][1] -> ([FAIL][2], [PASS][3]) ([i915#3160])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-iclb4/igt@gem_create@create-clear.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb3/igt@gem_create@create-clear.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb2/igt@gem_create@create-clear.html

  * igt@gem_ctx_persistence@clone:
    - shard-snb:          NOTRUN -> ([SKIP][4], [SKIP][5]) ([fdo#109271] / [i915#1099]) +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb7/igt@gem_ctx_persistence@clone.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb6/igt@gem_ctx_persistence@clone.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb2/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> ([SKIP][7], [SKIP][8]) ([i915#280])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb3/igt@gem_ctx_sseu@engines.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb7/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-iclb:         [PASS][9] -> ([TIMEOUT][10], [PASS][11]) ([i915#3070])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-iclb7/igt@gem_eio@in-flight-contexts-immediate.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb6/igt@gem_eio@in-flight-contexts-immediate.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb7/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][12] -> [FAIL][13] ([i915#2846])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> ([FAIL][14], [FAIL][15]) ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][16] -> ([FAIL][17], [PASS][18]) ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-iclb6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-kbl:          [PASS][21] -> ([FAIL][22], [PASS][23]) ([i915#2842])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-tglb:         [PASS][24] -> ([FAIL][25], [PASS][26]) ([i915#2842])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-tglb2/igt@gem_exec_fair@basic-pace@vcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb8/igt@gem_exec_fair@basic-pace@vcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][27] ([i915#2842])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][28] -> ([FAIL][29], [FAIL][30]) ([i915#2842]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          NOTRUN -> [FAIL][31] ([i915#2389]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> ([FAIL][32], [FAIL][33]) ([i915#2389]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl1/igt@gem_exec_reloc@basic-wide-active@bcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_schedule@semaphore-codependency:
    - shard-snb:          NOTRUN -> [SKIP][34] ([fdo#109271]) +165 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb7/igt@gem_exec_schedule@semaphore-codependency.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [PASS][35] -> ([DMESG-WARN][36], [DMESG-WARN][37]) ([i915#118] / [i915#95]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-glk8/igt@gem_exec_whisper@basic-forked-all.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk7/igt@gem_exec_whisper@basic-forked-all.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk3/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][38] -> ([PASS][39], [SKIP][40]) ([i915#2190])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-tglb1/igt@gem_huc_copy@huc-copy.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb1/igt@gem_huc_copy@huc-copy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][41] ([i915#3002])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl3/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@process-exit-mmap-busy@gtt:
    - shard-iclb:         NOTRUN -> ([SKIP][42], [SKIP][43]) ([i915#1699]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb5/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb8/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html

  * igt@gem_userptr_blits@process-exit-mmap-busy@uc:
    - shard-tglb:         NOTRUN -> ([SKIP][44], [SKIP][45]) ([i915#1699]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb5/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb6/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html
    - shard-kbl:          NOTRUN -> ([SKIP][46], [SKIP][47]) ([fdo#109271] / [i915#1699]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl1/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl6/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html

  * igt@gem_userptr_blits@process-exit-mmap-busy@wc:
    - shard-glk:          NOTRUN -> ([SKIP][48], [SKIP][49]) ([fdo#109271] / [i915#1699]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk9/igt@gem_userptr_blits@process-exit-mmap-busy@wc.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk1/igt@gem_userptr_blits@process-exit-mmap-busy@wc.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-apl:          NOTRUN -> ([SKIP][50], [SKIP][51]) ([fdo#109271]) +74 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@gen7_exec_parse@basic-offset.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-iclb:         NOTRUN -> ([SKIP][52], [SKIP][53]) ([fdo#112306])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb3/igt@gen9_exec_parse@secure-batches.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb2/igt@gen9_exec_parse@secure-batches.html
    - shard-tglb:         NOTRUN -> ([SKIP][54], [SKIP][55]) ([fdo#112306])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb8/igt@gen9_exec_parse@secure-batches.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb1/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> ([SKIP][56], [SKIP][57]) ([fdo#109271] / [i915#1937])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#1937])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> ([SKIP][59], [SKIP][60]) ([fdo#109271]) +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-iclb:         NOTRUN -> ([SKIP][61], [SKIP][62]) ([fdo#109293] / [fdo#109506])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109506] / [i915#2411])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271]) +160 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> ([SKIP][65], [SKIP][66]) ([fdo#110725] / [fdo#111614])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb8/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb5/igt@kms_big_fb@linear-64bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> ([SKIP][67], [SKIP][68]) ([fdo#111614])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb5/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180:
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271]) +4 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl2/igt@kms_ccs@pipe-d-crc-primary-rotation-180.html

  * igt@kms_chamelium@dp-edid-read:
    - shard-snb:          NOTRUN -> [SKIP][70] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb5/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> ([SKIP][71], [SKIP][72]) ([fdo#109271] / [fdo#111827]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@kms_chamelium@vga-hpd.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl1/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> ([SKIP][73], [SKIP][74]) ([fdo#109271] / [fdo#111827]) +17 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-0-25.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-negative:
    - shard-kbl:          NOTRUN -> ([SKIP][75], [SKIP][76]) ([fdo#109271] / [fdo#111827])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-negative.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-negative.html

  * igt@kms_color_chamelium@pipe-b-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> ([SKIP][77], [SKIP][78]) ([fdo#109284] / [fdo#111827])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb2/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb5/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html
    - shard-glk:          NOTRUN -> ([SKIP][79], [SKIP][80]) ([fdo#109271] / [fdo#111827])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk4/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk7/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html
    - shard-kbl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [fdo#111827])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl2/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#109284] / [fdo#111827])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_content_protection@srm:
    - shard-apl:          NOTRUN -> [TIMEOUT][84] ([i915#1319])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109279])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html
    - shard-iclb:         NOTRUN -> ([SKIP][86], [SKIP][87]) ([fdo#109278] / [fdo#109279])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][88] -> ([DMESG-WARN][89], [DMESG-WARN][90]) ([i915#180])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> ([SKIP][91], [SKIP][92]) ([fdo#111825])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
    - shard-iclb:         NOTRUN -> ([SKIP][93], [SKIP][94]) ([fdo#109274] / [fdo#109278])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> ([FAIL][95], [FAIL][96]) ([i915#2346])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-apl:          NOTRUN -> ([SKIP][97], [SKIP][98]) ([fdo#109271] / [i915#533])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@kms_cursor_legacy@pipe-d-torture-bo.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl6/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][99] -> ([FAIL][100], [FAIL][101]) ([i915#52] / [i915#54]) +4 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][102] -> ([FAIL][103], [PASS][104]) ([i915#79])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][105] -> ([PASS][106], [DMESG-WARN][107]) ([i915#180]) +9 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2:
    - shard-glk:          [PASS][108] -> ([PASS][109], [FAIL][110]) ([i915#2122])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-glk6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk9/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> ([SKIP][111], [SKIP][112]) ([fdo#109280])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
    - shard-tglb:         NOTRUN -> [SKIP][113] ([fdo#111825])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_panel_fitting@legacy:
    - shard-kbl:          NOTRUN -> ([SKIP][114], [SKIP][115]) ([fdo#109271]) +23 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl3/igt@kms_panel_fitting@legacy.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl6/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#533]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][117] -> [DMESG-WARN][118] ([i915#180] / [i915#533])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][119] ([fdo#108145] / [i915#265]) +3 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          NOTRUN -> ([FAIL][120], [FAIL][121]) ([fdo#108145] / [i915#265])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-kbl:          NOTRUN -> ([FAIL][122], [FAIL][123]) ([fdo#108145] / [i915#265])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-glk:          NOTRUN -> ([SKIP][124], [SKIP][125]) ([fdo#109271] / [i915#658])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html
    - shard-kbl:          NOTRUN -> ([SKIP][126], [SKIP][127]) ([fdo#109271] / [i915#658]) +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html
    - shard-iclb:         NOTRUN -> ([SKIP][128], [SKIP][129]) ([i915#658])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-apl:          NOTRUN -> [SKIP][130] ([fdo#109271] / [i915#658]) +5 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> ([SKIP][131], [SKIP][132]) ([fdo#109271] / [i915#658]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][133] -> ([SKIP][134], [SKIP][135]) ([fdo#109441])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> ([FAIL][136], [FAIL][137]) ([IGT#2])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@kms_sysfs_edid_timing.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-d-query-forked-hang:
    - shard-snb:          NOTRUN -> ([SKIP][138], [SKIP][139]) ([fdo#109271]) +282 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb5/igt@kms_vblank@pipe-d-query-forked-hang.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb2/igt@kms_vblank@pipe-d-query-forked-hang.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][140] ([fdo#109271] / [i915#2437])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [PASS][141] -> ([SKIP][142], [SKIP][143]) ([fdo#109271])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-glk1/igt@perf@polling-parameterized.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk2/igt@perf@polling-parameterized.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk5/igt@perf@polling-parameterized.html
    - shard-iclb:         [PASS][144] -> ([SKIP][145], [SKIP][146]) ([i915#3344])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-iclb5/igt@perf@polling-parameterized.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb4/igt@perf@polling-parameterized.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb8/igt@perf@polling-parameterized.html
    - shard-kbl:          [PASS][147] -> ([SKIP][148], [SKIP][149]) ([fdo#109271])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-kbl2/igt@perf@polling-parameterized.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl6/igt@perf@polling-parameterized.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl7/igt@perf@polling-parameterized.html
    - shard-tglb:         [PASS][150] -> [SKIP][151] ([i915#3344])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-tglb5/igt@perf@polling-parameterized.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb5/igt@perf@polling-parameterized.html
    - shard-apl:          [PASS][152] -> ([SKIP][153], [SKIP][154]) ([fdo#109271])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-apl7/igt@perf@polling-parameterized.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl6/igt@perf@polling-parameterized.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@perf@polling-parameterized.html

  * igt@sysfs_clients@create:
    - shard-apl:          NOTRUN -> [SKIP][155] ([fdo#109271] / [i915#2994])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@sysfs_clients@create.html

  * igt@sysfs_clients@recycle:
    - shard-apl:          NOTRUN -> ([SKIP][156], [SKIP][157]) ([fdo#109271] / [i915#2994])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl6/igt@sysfs_clients@recycle.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl3/igt@sysfs_clients@recycle.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@smoketest:
    - shard-iclb:         [FAIL][158] ([i915#2896]) -> ([PASS][159], [PASS][160])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-iclb7/igt@gem_ctx_persistence@smoketest.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb5/igt@gem_ctx_persistence@smoketest.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb2/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [FAIL][161] ([i915#2842]) -> ([PASS][162], [PASS][163])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][164] ([i915#2842]) -> ([PASS][165], [PAS

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/index.html

--===============0242507130325115700==
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
<tr><td><b>Series:</b></td><td>i915: Avoid set_domain -ENOMEM error with huge buffers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88561/">https://patchwork.freedesktop.org/series/88561/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9914_full -&gt; IGTPW_5675_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5675_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-iclb4/igt@gem_create@create-clear.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb3/igt@gem_create@create-clear.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb2/igt@gem_create@create-clear.html">PASS</a>) ([i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@clone:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb7/igt@gem_ctx_persistence@clone.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb6/igt@gem_ctx_persistence@clone.html">SKIP</a>) ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb2/igt@gem_ctx_persistence@engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb3/igt@gem_ctx_sseu@engines.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb7/igt@gem_ctx_sseu@engines.html">SKIP</a>) ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-iclb7/igt@gem_eio@in-flight-contexts-immediate.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb6/igt@gem_eio@in-flight-contexts-immediate.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb7/igt@gem_eio@in-flight-contexts-immediate.html">PASS</a>) ([i915#3070])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a>) ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a>) ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-iclb6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a>) ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-tglb2/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb8/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a>) ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a>) ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl1/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a>) ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-codependency:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb7/igt@gem_exec_schedule@semaphore-codependency.html">SKIP</a> ([fdo#109271]) +165 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-glk8/igt@gem_exec_whisper@basic-forked-all.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk7/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk3/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a>) ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a>) ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl3/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap-busy@gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb5/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb8/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html">SKIP</a>) ([i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap-busy@uc:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb5/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb6/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html">SKIP</a>) ([i915#1699]) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl1/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl6/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html">SKIP</a>) ([fdo#109271] / [i915#1699]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap-busy@wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk9/igt@gem_userptr_blits@process-exit-mmap-busy@wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk1/igt@gem_userptr_blits@process-exit-mmap-busy@wc.html">SKIP</a>) ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@gen7_exec_parse@basic-offset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@gen7_exec_parse@basic-offset.html">SKIP</a>) ([fdo#109271]) +74 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb3/igt@gen9_exec_parse@secure-batches.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb2/igt@gen9_exec_parse@secure-batches.html">SKIP</a>) ([fdo#112306])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb8/igt@gen9_exec_parse@secure-batches.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb1/igt@gen9_exec_parse@secure-batches.html">SKIP</a>) ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a>) ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a>) ([fdo#109271]) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a>) ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109271]) +160 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb8/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb5/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a>) ([fdo#110725] / [fdo#111614])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb5/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb6/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a>) ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl2/igt@kms_ccs@pipe-d-crc-primary-rotation-180.html">SKIP</a> ([fdo#109271]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb5/igt@kms_chamelium@dp-edid-read.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@kms_chamelium@vga-hpd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl1/igt@kms_chamelium@vga-hpd.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-negative:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-negative.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-negative.html">SKIP</a>) ([fdo#109271] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb2/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb5/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html">SKIP</a>) ([fdo#109284] / [fdo#111827])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk4/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk7/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html">SKIP</a>) ([fdo#109271] / [fdo#111827])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl2/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl6/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html">SKIP</a>) ([fdo#109278] / [fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a>) ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>) ([fdo#111825])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>) ([fdo#109274] / [fdo#109278])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a>) ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl6/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a>) ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html">FAIL</a>) ([i915#52] / [i915#54]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a>) ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a>) ([i915#180]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-glk6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk9/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html">FAIL</a>) ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a>) ([fdo#109280])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#111825])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl3/igt@kms_panel_fitting@legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl6/igt@kms_panel_fitting@legacy.html">SKIP</a>) ([fdo#109271]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> ([i915#180] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a>) ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html">FAIL</a>) ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a>) ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a>) ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a>) ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a>) ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a>) ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@kms_sysfs_edid_timing.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@kms_sysfs_edid_timing.html">FAIL</a>) ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-forked-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb5/igt@kms_vblank@pipe-d-query-forked-hang.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-snb2/igt@kms_vblank@pipe-d-query-forked-hang.html">SKIP</a>) ([fdo#109271]) +282 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-glk1/igt@perf@polling-parameterized.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk2/igt@perf@polling-parameterized.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-glk5/igt@perf@polling-parameterized.html">SKIP</a>) ([fdo#109271])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-iclb5/igt@perf@polling-parameterized.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb4/igt@perf@polling-parameterized.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb8/igt@perf@polling-parameterized.html">SKIP</a>) ([i915#3344])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-kbl2/igt@perf@polling-parameterized.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl6/igt@perf@polling-parameterized.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-kbl7/igt@perf@polling-parameterized.html">SKIP</a>) ([fdo#109271])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-tglb5/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb5/igt@perf@polling-parameterized.html">SKIP</a> ([i915#3344])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-apl7/igt@perf@polling-parameterized.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl6/igt@perf@polling-parameterized.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl8/igt@perf@polling-parameterized.html">SKIP</a>) ([fdo#109271])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl7/igt@sysfs_clients@create.html">SKIP</a> ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl6/igt@sysfs_clients@recycle.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-apl3/igt@sysfs_clients@recycle.html">SKIP</a>) ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-iclb7/igt@gem_ctx_persistence@smoketest.html">FAIL</a> ([i915#2896]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb5/igt@gem_ctx_persistence@smoketest.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-iclb2/igt@gem_ctx_persistence@smoketest.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9914/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5675/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          [FAIL][164] ([i915#2842]) -&gt; ([PASS][165], [PAS</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0242507130325115700==--

--===============0581480759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0581480759==--
