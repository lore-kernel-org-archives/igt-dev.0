Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 14 Apr 2021 20:03:40 -0000
Message-ID: <161843062014.4307.8354076488367963617@emeril.freedesktop.org>
References: <20210414160001.100669-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20210414160001.100669-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Unblock_core=5Fhotunplug=40*hot*bind*_subtests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0265161107=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0265161107==
Content-Type: multipart/alternative;
 boundary="===============6916422002130390851=="

--===============6916422002130390851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Unblock core_hotunplug@*hot*bind* subtests
URL   : https://patchwork.freedesktop.org/series/89079/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6066_full -> IGTPW_5745_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5745_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5745_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5745_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-iclb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb8/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-tglb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb6/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-apl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl1/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-glk:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk1/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-kbl:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl3/igt@core_hotunplug@hotrebind-lateclose.html

  
Known issues
------------

  Here are the changes found in IGTPW_5745_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][6] ([fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb3/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][7] ([fdo#111827])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb8/igt@feature_discovery@chamelium.html

  * igt@gem_ctx_persistence@many-contexts:
    - shard-tglb:         NOTRUN -> [FAIL][8] ([i915#2410])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb1/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1099]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-snb2/igt@gem_ctx_persistence@process.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][10] -> [TIMEOUT][11] ([i915#2369] / [i915#3063])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-tglb3/igt@gem_eio@unwedge-stress.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          NOTRUN -> [FAIL][14] ([i915#2842]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2842]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([fdo#109283])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb7/igt@gem_exec_params@rsvd2-dirt.html
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109283])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb8/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-parallel:
    - shard-tglb:         [PASS][19] -> [TIMEOUT][20] ([i915#3183])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-tglb7/igt@gem_exec_reloc@basic-parallel.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb3/igt@gem_exec_reloc@basic-parallel.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][21] ([i915#2389]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl8/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][22] ([i915#2389]) +4 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl6/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][23] ([i915#2389])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_schedule@semaphore-codependency:
    - shard-snb:          NOTRUN -> [SKIP][24] ([fdo#109271]) +412 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-snb6/igt@gem_exec_schedule@semaphore-codependency.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#118] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-glk4/igt@gem_exec_whisper@basic-fds-forked.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk2/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#2190])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-tglb2/igt@gem_huc_copy@huc-copy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb6/igt@gem_huc_copy@huc-copy.html
    - shard-kbl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#2190])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#307]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-iclb1/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb2/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][32] ([i915#2658])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][33] ([i915#2658])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl7/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#768]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3323])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl7/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#3323])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb3/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#3323])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#3323])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk5/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#3323])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@process-exit-mmap-busy@wc:
    - shard-glk:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#1699]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk7/igt@gem_userptr_blits@process-exit-mmap-busy@wc.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#112306])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb2/igt@gen9_exec_parse@batch-invalid-length.html
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#112306])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-large:
    - shard-apl:          NOTRUN -> [FAIL][45] ([i915#3296])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl7/igt@gen9_exec_parse@bb-large.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#1937])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111644] / [i915#1397] / [i915#2411])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#110892])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb6/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_sseu@full-enable:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109288])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb2/igt@i915_pm_sseu@full-enable.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#110725] / [fdo#111614])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb8/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111614])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb3/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#111615]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#2705])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb1/igt@kms_big_joiner@basic.html
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#2705])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl7/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#2705])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb3/igt@kms_big_joiner@basic.html
    - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#2705])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk5/igt@kms_big_joiner@basic.html
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#2705])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@kms_big_joiner@basic.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +27 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl8/igt@kms_chamelium@dp-crc-multiple.html
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb3/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-snb:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +25 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-snb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl3/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-hpd-with-enabled-mode:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb3/igt@kms_chamelium@vga-hpd-with-enabled-mode.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk6/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][64] ([i915#1319]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          NOTRUN -> [TIMEOUT][65] ([i915#1319])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl3/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-random:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#3319])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-32x32-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109278] / [fdo#109279])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-max-size-random:
    - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271]) +69 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-max-size-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3359]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-random:
    - shard-apl:          [PASS][70] -> [FAIL][71] ([i915#54])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
    - shard-kbl:          [PASS][72] -> [FAIL][73] ([i915#54])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-random:
    - shard-glk:          [PASS][74] -> [FAIL][75] ([i915#54])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.html
    - shard-apl:          NOTRUN -> [FAIL][76] ([i915#54])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278]) +9 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][78] ([fdo#109271]) +152 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#111825]) +14 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109274])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb3/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-apl:          NOTRUN -> [FAIL][82] ([i915#2641]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#2642])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-kbl:          NOTRUN -> [FAIL][84] ([i915#2641])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][85] ([i915#180])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109280]) +13 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-apl:          NOTRUN -> [SKIP][87] ([fdo#109271]) +263 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109289]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb3/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109289]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][90] ([i915#180]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#533]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane@plane-position-hole-dpms-pipe-c-planes:
    - shard-kbl:          [PASS][92] -> [FAIL][93] ([i915#2472])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-kbl6/igt@kms_plane@plane-position-hole-dpms-pipe-c-planes.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl7/igt@kms_plane@plane-position-hole-dpms-pipe-c-planes.html
    - shard-apl:          NOTRUN -> [FAIL][94] ([i915#2472])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl7/igt@kms_plane@plane-position-hole-dpms-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][95] ([fdo#108145] / [i915#265]) +4 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][96] ([i915#265]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][97] ([i915#265]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][98] ([fdo#108145] / [i915#265]) +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-glk:          NOTRUN -> [FAIL][99] ([fdo#108145] / [i915#265])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#658]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk4/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html
    - shard-apl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#658]) +9 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl7/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html
    - shard-iclb:         NOTRUN -> [SKIP][102] ([i915#658])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-kbl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#658]) +4 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109441])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][105] -> [SKIP][106] ([fdo#109441]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#533])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-kbl:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#2437]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl3/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2437])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#2530]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb5/igt@nouveau_crc@pipe-a-source-rg.html
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#2530]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb3/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([fdo#109291]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb7/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html
    - shard-tglb:         NOTRUN -> [SKIP][113] ([fdo#109291])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb2/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#2994]) +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl8/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-10:
    - shard-kbl:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#2994]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl1/igt@sysfs_clients@sema-10.html

  * igt@sysfs_clients@sema-25:
    - shard-iclb:         NOTRUN -> [SKIP][116] ([i915#2994])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb2/igt@sysfs_clients@sema-25.html
    - shard-tglb:         NOTRUN -> [SKIP][117] ([i915#2994])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb5/igt@sysfs_clients@sema-25.html
    - shard-glk:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#2994])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk8/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][119] ([i915#2846]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-kbl3/igt@gem_exec_fair@basic-deadline.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [FAIL][121] ([i915#2842]) -> [PASS][122] +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-tglb:         [FAIL][123] ([i915#2842]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-tglb5/igt@gem_exec_fair@basic-pace@vecs0.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb8/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-sync@rcs0:
    - shard-kbl:          [SKIP][125] ([fdo#109271]) -> [PASS][126] +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-kbl6/igt@gem_exec_fair@basic-sync@rcs0.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl4/igt@gem_exec_fair@basic-sync@rcs0.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [DMESG-WARN][127] ([i915#118] / [i915#95]) -> [PASS][128] +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-iclb:         [INCOMPLETE][129] ([i915#1895]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-iclb3/igt@gem_exec_whisper@basic-queues-priority-all.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb5/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-glk:          [FAIL][131] ([i915#307]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-glk8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk9/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][133] ([fdo#109271]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-apl1/igt@i915_pm_dc@dc9-dpms.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl2/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [DMESG-WARN][135] ([i915#180]) -> [PASS][136] +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-glk:          [FAIL][137] ([i915#49]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][139] ([i915#180]) -> [PASS][140] +3 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/index.html

--===============6916422002130390851==
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
<tr><td><b>Series:</b></td><td>intel-ci: Unblock core_hotunplug@*hot*bind* subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89079/">https://patchwork.freedesktop.org/series/89079/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6066_full -&gt; IGTPW_5745_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5745_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5745_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5745_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb8/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb6/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl1/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk1/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl3/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5745_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb3/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb8/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb1/igt@gem_ctx_persistence@many-contexts.html">FAIL</a> ([i915#2410])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-snb2/igt@gem_ctx_persistence@process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-tglb3/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb7/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb8/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-tglb7/igt@gem_exec_reloc@basic-parallel.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb3/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> ([i915#3183])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl8/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl6/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-codependency:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-snb6/igt@gem_exec_schedule@semaphore-codependency.html">SKIP</a> ([fdo#109271]) +412 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-glk4/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk2/igt@gem_exec_whisper@basic-fds-forked.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-tglb2/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-iclb1/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb2/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">FAIL</a> ([i915#307]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl7/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb3/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk5/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap-busy@wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk7/igt@gem_userptr_blits@process-exit-mmap-busy@wc.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb2/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb5/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl7/igt@gen9_exec_parse@bb-large.html">FAIL</a> ([i915#3296])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb6/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb2/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb8/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb3/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb1/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl7/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb3/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk5/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl8/igt@kms_chamelium@dp-crc-multiple.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +27 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb3/igt@kms_chamelium@dp-crc-multiple.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-snb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl3/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb3/igt@kms_chamelium@vga-hpd-with-enabled-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk6/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl3/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-32x32-random.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-max-size-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-max-size-random.html">SKIP</a> ([fdo#109271]) +69 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding.html">SKIP</a> ([i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x42-random:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-256x85-random:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html">SKIP</a> ([fdo#109278]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">SKIP</a> ([fdo#109271]) +152 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([fdo#111825]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb3/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">FAIL</a> ([i915#2641]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> ([fdo#109280]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a> ([fdo#109271]) +263 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb3/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms-pipe-c-planes:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-kbl6/igt@kms_plane@plane-position-hole-dpms-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl7/igt@kms_plane@plane-position-hole-dpms-pipe-c-planes.html">FAIL</a> ([i915#2472])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl7/igt@kms_plane@plane-position-hole-dpms-pipe-c-planes.html">FAIL</a> ([i915#2472])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk4/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl7/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl3/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb5/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb3/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb7/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb2/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl8/igt@sysfs_clients@recycle-many.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl1/igt@sysfs_clients@sema-10.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb2/igt@sysfs_clients@sema-25.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb5/igt@sysfs_clients@sema-25.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk8/igt@sysfs_clients@sema-25.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-tglb5/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-tglb8/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-kbl6/igt@gem_exec_fair@basic-sync@rcs0.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl4/igt@gem_exec_fair@basic-sync@rcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-iclb3/igt@gem_exec_whisper@basic-queues-priority-all.html">INCOMPLETE</a> ([i915#1895]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-iclb5/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-glk8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">FAIL</a> ([i915#307]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk9/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl2/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6066/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5745/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
</li>
</ul>

</body>
</html>

--===============6916422002130390851==--

--===============0265161107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0265161107==--
