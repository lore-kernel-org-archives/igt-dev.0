Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 22 Feb 2021 21:34:27 -0000
Message-ID: <161402966798.19116.7969186425098260294@emeril.freedesktop.org>
References: <20210222170950.179310-1-jose.souza@intel.com>
In-Reply-To: <20210222170950.179310-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpsr2=5Fsf=3A_Enable_selective_fetch_feature_in_kernel?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1805242279=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1805242279==
Content-Type: multipart/alternative;
 boundary="===============4171263196480424045=="

--===============4171263196480424045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_psr2_sf: Enable selective fetch feature in kernel
URL   : https://patchwork.freedesktop.org/series/87294/
State : success

== Summary ==

CI Bug Log - changes from IGT_6012_full -> IGTPW_5544_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5544_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5544_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5544_full:

### IGT changes ###

#### Warnings ####

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][1], [FAIL][2], [FAIL][3]) ([i915#2724]) -> ([FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8]) ([i915#1814] / [i915#3002])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-apl7/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-apl1/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-apl1/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl2/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl1/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl2/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl8/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl8/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_5544_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-hsw:          NOTRUN -> [WARN][9] ([i915#2283])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw2/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([fdo#109314])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb3/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          NOTRUN -> [FAIL][12] ([i915#2846])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#2842]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         NOTRUN -> [FAIL][14] ([i915#2842]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb3/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2842]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#2849])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#112283])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb2/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][20] ([i915#2389]) +4 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl2/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][21] ([i915#2803])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb8/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#118] / [i915#95])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          NOTRUN -> [DMESG-WARN][24] ([i915#118] / [i915#95])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][25] ([i915#2658])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl6/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][26] ([i915#2658])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-snb7/igt@gem_pwrite@basic-exhaustion.html
    - shard-hsw:          NOTRUN -> [WARN][27] ([i915#2658])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw7/igt@gem_pwrite@basic-exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][28] ([i915#2658])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl2/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][29] ([i915#2658])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][30] ([fdo#109271]) +298 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#768]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb1/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][32] ([i915#3002]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl2/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#1317]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb1/igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#1317]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb2/igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc.html

  * igt@gem_userptr_blits@process-exit-mmap@gtt:
    - shard-kbl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#1699]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl4/igt@gem_userptr_blits@process-exit-mmap@gtt.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][36] ([i915#2724])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-snb5/igt@gem_userptr_blits@vma-merge.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-hsw:          [PASS][37] -> [INCOMPLETE][38] ([i915#2880])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-hsw8/igt@i915_module_load@reload-with-fault-injection.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][39] -> [WARN][40] ([i915#1519])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111644] / [i915#1397] / [i915#2411])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#110892])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb1/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [PASS][43] -> [INCOMPLETE][44] ([i915#151] / [i915#155])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl1/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109288])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#109303])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109303])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          NOTRUN -> [DMESG-WARN][48] ([i915#180])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#110725] / [fdo#111614])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111614])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb7/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111615]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-hsw:          NOTRUN -> [SKIP][52] ([fdo#109271]) +108 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-kbl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#2705])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +31 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl4/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +24 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl2/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color@pipe-a-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][56] ([i915#1149])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb1/igt@kms_color@pipe-a-degamma.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - shard-iclb:         NOTRUN -> [FAIL][57] ([i915#1149] / [i915#315])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb7/igt@kms_color@pipe-b-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [FAIL][58] ([i915#1149] / [i915#315])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb3/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color@pipe-d-degamma:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278] / [i915#1149])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb8/igt@kms_color@pipe-d-degamma.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-hsw:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw8/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb1/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
    - shard-glk:          NOTRUN -> [SKIP][62] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk9/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][65] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][66] ([i915#1319]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb5/igt@kms_content_protection@legacy.html
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#111828]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][69] ([i915#1319])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl7/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-128x42-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109278]) +11 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#109279]) +4 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][73] ([fdo#109271]) +317 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-snb6/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#533]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk1/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109274]) +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-glk:          [PASS][77] -> [FAIL][78] ([i915#79])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][79] -> [DMESG-WARN][80] ([i915#180]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-kbl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#2672]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#2672])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#2642])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-apl:          NOTRUN -> [FAIL][84] ([i915#2641])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-glk:          [PASS][85] -> [FAIL][86] ([i915#49])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][87] ([i915#155])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271]) +207 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109280]) +14 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#111825]) +27 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][91] ([fdo#109271]) +64 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#1187])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb5/igt@kms_hdr@static-toggle-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][93] ([i915#1187])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb5/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#110577])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb8/igt@kms_invalid_dotclock.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#533]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][96] ([fdo#108145] / [i915#265]) +3 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][97] ([fdo#108145] / [i915#265])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][98] ([fdo#108145] / [i915#265]) +4 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-none:
    - shard-hsw:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#533]) +17 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw2/igt@kms_plane_multiple@atomic-pipe-d-tiling-none.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:
    - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#658]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-apl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#658]) +6 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([i915#658]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-kbl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#658]) +8 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [PASS][104] -> [SKIP][105] ([fdo#109441]) +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb6/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-hsw:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#1072]) +4 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][107] ([IGT#2])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl1/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#533]) +5 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl2/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-kbl:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2437])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl6/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#2437]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([i915#2530])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb1/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#2530]) +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb2/igt@nouveau_crc@pipe-d-ctx-flip-detection.html
    - shard-iclb:         NOTRUN -> [SKIP][113] ([fdo#109278] / [i915#2530])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb1/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109291]) +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html

  * igt@prime_nv_test@i915_import_pread_pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#109291]) +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb3/igt@prime_nv_test@i915_import_pread_pwrite.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][116] ([fdo#111656])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb6/igt@prime_vgem@coherency-gtt.html
    - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#109292])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb3/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_clients@recycle:
    - shard-tglb:         [PASS][118] -> [FAIL][119] ([i915#3028])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-tglb8/igt@sysfs_clients@recycle.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb5/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@recycle-many:
    - shard-iclb:         NOTRUN -> [FAIL][120] ([i915#3028])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb6/igt@sysfs_clients@recycle-many.html
    - shard-kbl:          NOTRUN -> [FAIL][121] ([i915#3028])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl2/igt@sysfs_clients@recycle-many.html
    - shard-tglb:         NOTRUN -> [FAIL][122] ([i915#3028])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb7/igt@sysfs_clients@recycle-many.html
    - shard-snb:          NOTRUN -> [FAIL][123] ([i915#3028])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-snb7/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@split-10@bcs0:
    - shard-glk:          [PASS][124] -> [SKIP][125] ([fdo#109271] / [i915#3026])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-glk7/igt@sysfs_clients@split-10@bcs0.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk2/igt@sysfs_clients@split-10@bcs0.html
    - shard-apl:          NOTRUN -> [SKIP][126] ([fdo#109271] / [i915#3026])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl1/igt@sysfs_clients@split-10@bcs0.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [TIMEOUT][127] ([i915#2918]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk9/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [FAIL][129] ([i915#2842]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [FAIL][131] ([i915#2842]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          [FAIL][133] ([i915#2842]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [DMESG-WARN][135] ([i915#118] / [i915#95]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-glk6/igt@gem_exec_whisper@basic-contexts-all.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk9/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@kms_cursor_legacy@curs

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/index.html

--===============4171263196480424045==
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
<tr><td><b>Series:</b></td><td>tests/kms_psr2_sf: Enable selective fetch feature in kernel</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87294/">https://patchwork.freedesktop.org/series/87294/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6012_full -&gt; IGTPW_5544_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5544_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5544_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5544_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-apl1/igt@runner@aborted.html">FAIL</a>) ([i915#2724]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl8/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#3002])</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5544_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw2/igt@core_hotunplug@unbind-rebind.html">WARN</a> ([i915#2283])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb3/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb3/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb2/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl2/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb8/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> ([i915#2803])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl6/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-snb7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl2/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +298 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb1/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl2/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb1/igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb2/igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@gtt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl4/igt@gem_userptr_blits@process-exit-mmap@gtt.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-snb5/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-hsw8/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw7/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#2880])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw7/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1519])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb1/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl1/igt@i915_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> ([i915#151] / [i915#155])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb2/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb7/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> ([fdo#109271]) +108 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl4/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl2/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-degamma:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb1/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb7/igt@kms_color@pipe-b-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb3/igt@kms_color@pipe-b-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-degamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb8/igt@kms_color@pipe-d-degamma.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw8/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb1/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk9/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-0-5.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl4/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb5/igt@kms_content_protection@legacy.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb6/igt@kms_content_protection@legacy.html">SKIP</a> ([fdo#111828]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl7/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-128x42-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-128x42-offscreen.html">SKIP</a> ([fdo#109278]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109279]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-snb6/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +317 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk1/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> ([i915#155])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) +207 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> ([fdo#109280]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#111825]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +64 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb5/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb5/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb8/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#110577])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-none:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw2/igt@kms_plane_multiple@atomic-pipe-d-tiling-none.html">SKIP</a> ([fdo#109271] / [i915#533]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-iclb2/igt@kms_psr@psr2_dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb6/igt@kms_psr@psr2_dpms.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-hsw2/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> ([fdo#109271] / [i915#1072]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl1/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl2/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb1/igt@nouveau_crc@pipe-b-source-outp-inactive.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb2/igt@nouveau_crc@pipe-d-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb1/igt@nouveau_crc@pipe-d-ctx-flip-detection.html">SKIP</a> ([fdo#109278] / [i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb4/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_pread_pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb3/igt@prime_nv_test@i915_import_pread_pwrite.html">SKIP</a> ([fdo#109291]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb6/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([fdo#111656])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb3/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([fdo#109292])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-tglb8/igt@sysfs_clients@recycle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb5/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#3028])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-iclb6/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl2/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb7/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-snb7/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10@bcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-glk7/igt@sysfs_clients@split-10@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk2/igt@sysfs_clients@split-10@bcs0.html">SKIP</a> ([fdo#109271] / [i915#3026])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl1/igt@sysfs_clients@split-10@bcs0.html">SKIP</a> ([fdo#109271] / [i915#3026])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@close-replace-race:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html">TIMEOUT</a> ([i915#2918]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk9/igt@gem_ctx_persistence@close-replace-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6012/shard-glk6/igt@gem_exec_whisper@basic-contexts-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5544/shard-glk9/igt@gem_exec_whisper@basic-contexts-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@curs</p>
</li>
</ul>

</body>
</html>

--===============4171263196480424045==--

--===============1805242279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1805242279==--
