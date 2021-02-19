Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 19 Feb 2021 14:04:37 -0000
Message-ID: <161374347790.702.150586634728379586@emeril.freedesktop.org>
References: <20210219090037.655641-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210219090037.655641-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=5Ftransition=3AAdd_subtest_description_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0382206691=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0382206691==
Content-Type: multipart/alternative;
 boundary="===============8905904535381611034=="

--===============8905904535381611034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic_transition:Add subtest description (rev2)
URL   : https://patchwork.freedesktop.org/series/86153/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9789_full -> IGTPW_5536_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5536_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5536_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5536_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_busy@close-race:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-hsw2/igt@gem_busy@close-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-hsw4/igt@gem_busy@close-race.html

  * igt@sysfs_clients@fair-1@vcs:
    - shard-kbl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl1/igt@sysfs_clients@fair-1@vcs.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9]) ([i915#1814] / [i915#2505] / [i915#602] / [i915#92]) -> ([FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14]) ([i915#2292] / [i915#2505] / [i915#3002])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-kbl7/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-kbl1/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-kbl7/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-kbl7/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-kbl6/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-kbl7/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl7/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl4/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl6/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl6/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][15], [FAIL][16], [FAIL][17]) ([i915#1814] / [i915#3002]) -> ([FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21]) ([i915#3002])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-apl1/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-apl6/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-apl8/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl7/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl7/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl3/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl6/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_5536_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][22] ([i915#3002]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl6/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [PASS][23] -> [TIMEOUT][24] ([i915#2918])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-glk8/igt@gem_ctx_persistence@close-replace-race.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-glk1/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_persistence@hostile:
    - shard-hsw:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#1099]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-hsw4/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#1099]) +5 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-snb2/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#280])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][28] ([i915#2846])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#2842])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          NOTRUN -> [FAIL][31] ([i915#2842]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#2842])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][34] ([i915#2842]) +4 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][35] ([i915#2842]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][36] -> [SKIP][37] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_reloc@basic-parallel:
    - shard-kbl:          NOTRUN -> [TIMEOUT][38] ([i915#1729])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl2/igt@gem_exec_reloc@basic-parallel.html
    - shard-apl:          NOTRUN -> [TIMEOUT][39] ([i915#1729])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl1/igt@gem_exec_reloc@basic-parallel.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][40] ([i915#2389]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl1/igt@gem_exec_reloc@basic-wide-active@bcs0.html
    - shard-glk:          NOTRUN -> [FAIL][41] ([i915#2389]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-glk3/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vecs0:
    - shard-iclb:         NOTRUN -> [FAIL][42] ([i915#2389]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb7/igt@gem_exec_reloc@basic-wide-active@vecs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#2190])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][44] ([i915#2658])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl6/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][45] ([i915#2658])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-snb6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#768])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb6/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][47] ([i915#3002])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl7/igt@gem_userptr_blits@input-checking.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][48] ([i915#3002])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-glk5/igt@gem_userptr_blits@input-checking.html
    - shard-iclb:         NOTRUN -> [DMESG-WARN][49] ([i915#3002])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb8/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@process-exit-mmap-busy@uc:
    - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#1699]) +3 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl6/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [INCOMPLETE][51] ([i915#2502] / [i915#2667])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl6/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271]) +157 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl3/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#112306])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb2/igt@gen9_exec_parse@bb-secure.html
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#112306])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb4/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][55] -> [FAIL][56] ([i915#454])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111644] / [i915#1397] / [i915#2411])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#110892])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109302])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb7/igt@i915_query@query-topology-unsupported.html
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109302])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb2/igt@i915_query@query-topology-unsupported.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#111614])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb7/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111615])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb3/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_joiner@basic:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#2705])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl8/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo:
    - shard-hsw:          NOTRUN -> [SKIP][65] ([fdo#109271]) +31 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-hsw1/igt@kms_ccs@pipe-b-ccs-on-another-bo.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-hsw:          NOTRUN -> [SKIP][66] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-hsw2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb5/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-snb:          NOTRUN -> [SKIP][68] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-snb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl4/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color@pipe-c-ctm-0-25:
    - shard-iclb:         NOTRUN -> [FAIL][70] ([i915#1149] / [i915#315])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb1/igt@kms_color@pipe-c-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [FAIL][71] ([i915#1149] / [i915#315])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb6/igt@kms_color@pipe-c-ctm-0-25.html

  * igt@kms_color@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109278] / [i915#1149])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb4/igt@kms_color@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl3/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-glk:          NOTRUN -> [SKIP][74] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-glk1/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          NOTRUN -> [TIMEOUT][76] ([i915#1319])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-apl:          NOTRUN -> [TIMEOUT][77] ([i915#1319])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109278] / [fdo#109279])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb2/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109279])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement:
    - shard-snb:          [PASS][80] -> [SKIP][81] ([fdo#109271])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-snb7/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-snb2/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][82] ([fdo#109271]) +298 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-hsw:          [PASS][83] -> [FAIL][84] ([i915#2370])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109274]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][86] -> [FAIL][87] ([i915#2122])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][88] ([i915#180]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][89] -> [DMESG-WARN][90] ([i915#180])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-kbl:          NOTRUN -> [FAIL][91] ([i915#2641]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-kbl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#2672]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#2642])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109280]) +9 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-glk:          NOTRUN -> [SKIP][95] ([fdo#109271]) +47 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([fdo#111825]) +12 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#533])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#533]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][99] ([i915#265])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][100] ([fdo#108145] / [i915#265]) +3 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][101] ([i915#265]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_cursor@pipe-d-overlay-size-256:
    - shard-hsw:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#533]) +6 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-hsw2/igt@kms_plane_cursor@pipe-d-overlay-size-256.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-kbl:          [PASS][103] -> [DMESG-WARN][104] ([i915#165] / [i915#180] / [i915#78])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-kbl7/igt@kms_plane_lowres@pipe-c-tiling-none.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_plane_lowres@pipe-d-tiling-none:
    - shard-iclb:         NOTRUN -> [SKIP][105] ([fdo#109278]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb5/igt@kms_plane_lowres@pipe-d-tiling-none.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-kbl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#658]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#658]) +3 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-1:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([i915#2920])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb3/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html
    - shard-glk:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#658])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-glk4/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html
    - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#658])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html

  * igt@kms_psr@primary_blt:
    - shard-hsw:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#1072]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-hsw2/igt@kms_psr@primary_blt.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][112] -> [SKIP][113] ([fdo#109441]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb8/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109441]) +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][115] ([i915#31])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-snb7/igt@kms_setmode@basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][116] ([IGT#2])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl6/igt@kms_sysfs_edid_timing.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#2437]) +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl8/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#2437])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-glk6/igt@kms_writeback@writeback-pixel-formats.html
    - shard-kbl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#2437]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl4/igt@kms_writeback@writeback-pixel-formats.html
    - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#2437])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb6/igt@kms_writeback@writeback-pixel-formats.html
    - shard-tglb:         NOTRUN -> [SKIP][121] ([i915#2437])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][122] ([fdo#109291]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb8/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html
    - shard-tglb:         NOTRUN -> [SKIP][123] ([fdo#109291]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb5/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test2:
    - shard-kbl:          NOTRUN -> [SKIP][124] ([fdo#109271]) +228 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl4/igt@prime_nv_pcopy@test2.html

  * igt@sysfs_clients@recycle:
    - shard-snb:          NOTRUN -> [FAIL][125] ([i915#3028])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-snb7/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@split-10@bcs0:
    - shard-apl:          NOTRUN -> [SKIP][126] ([fdo#109271] / [i915#3026])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl3/igt@sysfs_clients@split-10@bcs0.html
    - shard-kbl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#3026])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl4/igt@sysfs_clients@split-10@bcs0.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][128] ([i915#3063]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-tglb2/igt@gem_eio@unwedge-stress.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-tglb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [INCOMPLETE][130] ([i915#1895] / [i915#3031]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-iclb4/igt@gem_exec_balancer@hang.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb8/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][132] ([i915#2842]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [FAIL][134] ([i915#2842]) -> [PASS][135] +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-glk3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][136] ([i915#2849]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [DMESG-WARN][138] ([i915#118] / [i915#95]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-glk9/igt@gem_exec_whisper@basic-forked.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-glk1/igt@gem_exec_whisper@basic-forked.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][140] ([i915#1519]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][142] ([i915#180]) -> [PASS][143] +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][144] ([i915#96]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-fli

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/index.html

--===============8905904535381611034==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic_transition:Add subtest desc=
ription (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/86153/">https://patchwork.freedesktop.org/series/86153/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5536/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9789_full -&gt; IGTPW_5536_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5536_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5536_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5536=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-hsw2/igt@gem_busy@close-race.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-hsw4/igt@gem=
_busy@close-race.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1@vcs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl1/igt@sysfs_clients@fair-1@vcs.html">FAIL=
</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-kbl1/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9789/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_97=
89/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-kbl7/igt@runner@aborted.html">F=
AIL</a>) ([i915#1814] / [i915#2505] / [i915#602] / [i915#92]) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl7/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5536/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5536/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>) ([i915#2292] / [i915#2505] / [i915#3002])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9789/shard-apl6/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9789/shard-apl8/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#=
3002]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_553=
6/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_5536/shard-apl7/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard=
-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5536/shard-apl6/igt@runner@aborted.html">FAIL</a>) =
([i915#3002])</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5536_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl6/igt@gem_create@create-massive.html">DME=
SG-WARN</a> ([i915#3002]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@close-replace-race:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-glk8/igt@gem_ctx_persistence@close-replace-race.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536=
/shard-glk1/igt@gem_ctx_persistence@close-replace-race.html">TIMEOUT</a> ([=
i915#2918])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-hsw4/igt@gem_ctx_persistence@hostile.html">S=
KIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-snb2/igt@gem_ctx_persistence@legacy-engines-=
queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html">SK=
IP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-apl6/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/sha=
rd-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html=
">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/sha=
rd-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html=
">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html=
">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-k=
bl6/igt@gem_exec_fair@basic-pace@vecs0.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-kbl2/igt@gem_exec_reloc@basic-parallel.html">=
TIMEOUT</a> ([i915#1729])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-apl1/igt@gem_exec_reloc@basic-parallel.html">=
TIMEOUT</a> ([i915#1729])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-apl1/igt@gem_exec_reloc@basic-wide-active@bcs=
0.html">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-glk3/igt@gem_exec_reloc@basic-wide-active@bcs=
0.html">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vecs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-iclb7/igt@gem_exec_reloc@basic-wide-active@v=
ecs0.html">FAIL</a> ([i915#2389]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl1/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-apl6/igt@gem_pread@exhaustion.html">WARN</a>=
 ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-snb6/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-iclb6/igt@gem_render_copy@linear-to-vebox-y-=
tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-apl7/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-glk5/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-iclb8/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap-busy@uc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl6/igt@gem_userptr_blits@process-exit-mmap=
-busy@uc.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-apl6/igt@gem_userptr_blits@vma-merge.html">I=
NCOMPLETE</a> ([i915#2502] / [i915#2667])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-apl3/igt@gen7_exec_parse@basic-offset.html">=
SKIP</a> ([fdo#109271]) +157 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-tglb2/igt@gen9_exec_parse@bb-secure.html">SKI=
P</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-iclb4/igt@gen9_exec_parse@bb-secure.html">SKI=
P</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb2/igt@i9=
15_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-iclb7/igt@i915_query@query-topology-unsupport=
ed.html">SKIP</a> ([fdo#109302])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-tglb2/igt@i915_query@query-topology-unsupport=
ed.html">SKIP</a> ([fdo#109302])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-tglb7/igt@kms_big_fb@x-tiled-32bpp-rotate-90=
.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-iclb8/igt@kms_big_fb@y-tiled-64bpp-rotate-90=
.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-tglb3/igt@kms_big_fb@yf-tiled-32bpp-rotate-2=
70.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-apl8/igt@kms_big_joiner@basic.html">SKIP</a>=
 ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-hsw1/igt@kms_ccs@pipe-b-ccs-on-another-bo.ht=
ml">SKIP</a> ([fdo#109271]) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-hsw2/igt@kms_chamelium@common-hpd-after-susp=
end.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-iclb5/igt@kms_chamelium@hdmi-hpd-enable-disab=
le-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-snb7/igt@kms_chamelium@hdmi-hpd-enable-disabl=
e-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl4/igt@kms_chamelium@vga-hpd-for-each-pipe=
.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-ctm-0-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-iclb1/igt@kms_color@pipe-c-ctm-0-25.html">FAI=
L</a> ([i915#1149] / [i915#315])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-tglb6/igt@kms_color@pipe-c-ctm-0-25.html">FAI=
L</a> ([i915#1149] / [i915#315])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-iclb4/igt@kms_color@pipe-d-ctm-green-to-red.=
html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-apl3/igt@kms_color_chamelium@pipe-a-ctm-limi=
ted-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-glk1/igt@kms_color_chamelium@pipe-b-ctm-0-5.h=
tml">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-0-5.=
html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl7/igt@kms_content_protection@legacy.html"=
>TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-apl3/igt@kms_content_protection@srm.html">TI=
MEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-iclb2/igt@kms_cursor_crc@pipe-a-cursor-512x51=
2-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-512x51=
2-rapid-movement.html">SKIP</a> ([fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movement:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-snb7/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-moveme=
nt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5536/shard-snb2/igt@kms_cursor_crc@pipe-b-cursor-64x64-rapid-movemen=
t.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128=
-right-edge.html">SKIP</a> ([fdo#109271]) +298 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5536/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">=
FAIL</a> ([i915#2370])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-iclb1/igt@kms_flip@2x-plain-flip-fb-recreate=
-interruptible.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-h=
dmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5536/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a=
1-hdmi-a2.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl6/igt@kms_flip@flip-vs-suspend-interrupti=
ble@a-dp1.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-a=
pl3/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> ([i915#180])</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytileccs.html">FAIL</a> ([i915#2641]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672]) +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
eccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-cur-indfb-move.html">SKIP</a> ([fdo#109280]) +9 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-sus=
pend.html">SKIP</a> ([fdo#109271]) +47 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#111825]) +12 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-apl2/igt@kms_pipe_crc_basic@compare-crc-sani=
tycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-d.=
html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-alpha-=
transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-consta=
nt-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-=
transparent-fb.html">FAIL</a> ([i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-d-overlay-size-256:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-hsw2/igt@kms_plane_cursor@pipe-d-overlay-siz=
e-256.html">SKIP</a> ([fdo#109271] / [i915#533]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-none:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-kbl7/igt@kms_plane_lowres@pipe-c-tiling-none.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/sh=
ard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-none.html">DMESG-WARN</a> ([i91=
5#165] / [i915#180] / [i915#78])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-none:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-iclb5/igt@kms_plane_lowres@pipe-d-tiling-non=
e.html">SKIP</a> ([fdo#109278]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl1/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-apl8/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-tglb3/igt@kms_psr2_sf@plane-move-sf-dmg-area-=
1.html">SKIP</a> ([i915#2920])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-glk4/igt@kms_psr2_sf@plane-move-sf-dmg-area-1=
.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area-=
1.html">SKIP</a> ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_blt:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-hsw2/igt@kms_psr@primary_blt.html">SKIP</a> =
([fdo#109271] / [i915#1072]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5536/shard-iclb=
8/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html"=
>SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-snb7/igt@kms_setmode@basic.html">FAIL</a> ([=
i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl6/igt@kms_sysfs_edid_timing.html">FAIL</a=
> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-apl8/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> ([fdo#109271] / [i915#2437]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-glk6/igt@kms_writeback@writeback-pixel-format=
s.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-kbl4/igt@kms_writeback@writeback-pixel-format=
s.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-iclb6/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-tglb1/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-iclb8/igt@prime_nv_api@i915_nv_import_twice_c=
heck_flink_name.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-tglb5/igt@prime_nv_api@i915_nv_import_twice_c=
heck_flink_name.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-kbl4/igt@prime_nv_pcopy@test2.html">SKIP</a>=
 ([fdo#109271]) +228 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5536/shard-snb7/igt@sysfs_clients@recycle.html">FAIL</a=
> ([i915#3028])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10@bcs0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-apl3/igt@sysfs_clients@split-10@bcs0.html">SK=
IP</a> ([fdo#109271] / [i915#3026])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5536/shard-kbl4/igt@sysfs_clients@split-10@bcs0.html">SK=
IP</a> ([fdo#109271] / [i915#3026])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-tglb2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i91=
5#3063]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_55=
36/shard-tglb2/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hang:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-iclb4/igt@gem_exec_balancer@hang.html">INCOMPLETE</a> ([=
i915#1895] / [i915#3031]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5536/shard-iclb8/igt@gem_exec_balancer@hang.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL=
</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5536/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-glk3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</=
a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5536/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a>=
 +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</=
a> ([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5536/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-glk9/igt@gem_exec_whisper@basic-forked.html">DMESG-WARN<=
/a> ([i915#118] / [i915#95]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5536/shard-glk1/igt@gem_exec_whisper@basic-forked.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> =
([i915#1519]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5536/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMES=
G-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5536/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html"=
>PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9789/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-fli">FAIL</=
a> ([i915#96]) -&gt; [PASS][145]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8905904535381611034==--

--===============0382206691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0382206691==--
