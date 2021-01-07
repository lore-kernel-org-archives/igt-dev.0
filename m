Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 07 Jan 2021 14:32:18 -0000
Message-ID: <161002993842.21182.3709962196327912639@emeril.freedesktop.org>
References: <20210106211814.3889647-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210106211814.3889647-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_Added_test_description_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0428503563=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0428503563==
Content-Type: multipart/alternative;
 boundary="===============7898257921234194996=="

--===============7898257921234194996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Added test description (rev3)
URL   : https://patchwork.freedesktop.org/series/84776/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9555_full -> IGTPW_5363_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/index.html

Known issues
------------

  Here are the changes found in IGTPW_5363_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-hsw:          NOTRUN -> [WARN][1] ([i915#2283])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw4/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-hsw:          NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#1099]) +20 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw5/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_exec_create@forked:
    - shard-glk:          [PASS][3] -> ([PASS][4], [DMESG-WARN][5]) ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk4/igt@gem_exec_create@forked.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk6/igt@gem_exec_create@forked.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk8/igt@gem_exec_create@forked.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-hsw:          NOTRUN -> [FAIL][6] ([i915#2389]) +7 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw5/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [PASS][7] -> ([DMESG-WARN][8], [DMESG-WARN][9]) ([i915#118] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk9/igt@gem_exec_whisper@basic-queues-forked.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk4/igt@gem_exec_whisper@basic-queues-forked.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk9/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_pread@exhaustion:
    - shard-hsw:          NOTRUN -> [WARN][10] ([i915#2658]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw5/igt@gem_pread@exhaustion.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][11] ([fdo#109312])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb8/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][12] ([fdo#109312])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb8/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - shard-hsw:          NOTRUN -> [SKIP][13] ([fdo#109271]) +1092 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw2/igt@gem_userptr_blits@process-exit-mmap@wc.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([fdo#110426] / [i915#1704])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb7/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][15] ([fdo#110426] / [i915#1704])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb1/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-hsw:          NOTRUN -> [FAIL][16] ([i915#2724])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw5/igt@gem_userptr_blits@vma-merge.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([fdo#112306])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb2/igt@gen9_exec_parse@allowed-single.html
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#112306])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb3/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-glk:          NOTRUN -> ([SKIP][19], [SKIP][20]) ([fdo#109271]) +18 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk4/igt@i915_pm_backlight@basic-brightness.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk3/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> ([FAIL][21], [FAIL][22]) ([i915#454])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-kbl:          [PASS][23] -> ([SKIP][24], [SKIP][25]) ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl3/igt@i915_pm_rpm@gem-execbuf.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@i915_pm_rpm@gem-execbuf.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@i915_pm_rpm@gem-execbuf.html
    - shard-apl:          [PASS][26] -> [SKIP][27] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-apl7/igt@i915_pm_rpm@gem-execbuf.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl7/igt@i915_pm_rpm@gem-execbuf.html
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([i915#579])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb8/igt@i915_pm_rpm@gem-execbuf.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb5/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [PASS][30] -> ([SKIP][31], [SKIP][32]) ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk8/igt@i915_pm_rpm@gem-execbuf.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk7/igt@i915_pm_rpm@gem-execbuf.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk1/igt@i915_pm_rpm@gem-execbuf.html
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([i915#579])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb2/igt@i915_pm_rpm@gem-execbuf.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb7/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#110892])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#111644] / [i915#1397] / [i915#2411])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#109303])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb5/igt@i915_query@query-topology-known-pci-ids.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][38] -> [FAIL][39] ([i915#2597])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb2/igt@kms_async_flips@test-time-stamp.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb8/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#110725] / [fdo#111614])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb4/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111614])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#111615]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-hsw:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +77 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw8/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-hpd-after-suspend:
    - shard-glk:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk2/igt@kms_chamelium@dp-hpd-after-suspend.html

  * igt@kms_color@pipe-b-ctm-blue-to-red:
    - shard-kbl:          [PASS][45] -> ([PASS][46], [DMESG-WARN][47]) ([i915#165] / [i915#180] / [i915#78])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl3/igt@kms_color@pipe-b-ctm-blue-to-red.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@kms_color@pipe-b-ctm-blue-to-red.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@kms_color@pipe-b-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-0-75.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb6/igt@kms_color_chamelium@pipe-b-ctm-0-75.html
    - shard-kbl:          NOTRUN -> ([SKIP][50], [SKIP][51]) ([fdo#109271] / [fdo#111827]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl7/igt@kms_color_chamelium@pipe-b-ctm-0-75.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl6/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html
    - shard-glk:          NOTRUN -> ([SKIP][53], [SKIP][54]) ([fdo#109271] / [fdo#111827]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk9/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk6/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][55] ([i915#1319])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl6/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109300] / [fdo#111066])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb2/igt@kms_content_protection@mei_interface.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111828])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb5/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278]) +4 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][59] -> ([FAIL][60], [PASS][61]) ([i915#72])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109274])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         NOTRUN -> [FAIL][63] ([i915#2122])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          NOTRUN -> [INCOMPLETE][64] ([i915#2055] / [i915#2295])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
    - shard-glk:          [PASS][65] -> ([FAIL][66], [FAIL][67]) ([i915#49]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-kbl:          [PASS][68] -> ([PASS][69], [DMESG-WARN][70]) ([i915#165]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#111825]) +8 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271]) +4 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109280]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][74] -> [SKIP][75] ([i915#433])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-kbl:          NOTRUN -> ([FAIL][76], [FAIL][77]) ([fdo#108145] / [i915#265])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][78] ([i915#265])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-kbl:          [PASS][79] -> ([DMESG-WARN][80], [PASS][81]) ([i915#180] / [i915#78])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl4/igt@kms_properties@plane-properties-legacy.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@kms_properties@plane-properties-legacy.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][82] -> [SKIP][83] ([fdo#109441]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb2/igt@kms_psr@psr2_basic.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb6/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109441])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-kbl:          [PASS][85] -> ([DMESG-WARN][86], [PASS][87]) ([i915#180])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl1/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][88] -> ([INCOMPLETE][89], [INCOMPLETE][90]) ([i915#155] / [i915#794])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][91] -> [DMESG-WARN][92] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][93] ([fdo#109271]) +48 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl4/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#109289])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb8/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@polling-parameterized:
    - shard-apl:          [PASS][95] -> [FAIL][96] ([i915#1542])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-apl8/igt@perf@polling-parameterized.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl4/igt@perf@polling-parameterized.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#112283])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb2/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#112283])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb2/igt@perf_pmu@event-wait@rcs0.html
    - shard-glk:          NOTRUN -> [SKIP][99] ([fdo#109271])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk2/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_nv_api@i915_nv_double_import:
    - shard-kbl:          NOTRUN -> ([SKIP][100], [SKIP][101]) ([fdo#109271]) +24 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@prime_nv_api@i915_nv_double_import.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl7/igt@prime_nv_api@i915_nv_double_import.html

  * igt@prime_nv_test@i915_blt_fill_nv_read:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#109291]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb2/igt@prime_nv_test@i915_blt_fill_nv_read.html
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109291]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb3/igt@prime_nv_test@i915_blt_fill_nv_read.html

  * igt@prime_vgem@sync@vcs0:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][104] ([i915#409])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb5/igt@prime_vgem@sync@vcs0.html

  
#### Possible fixes ####

  * {igt@gem_exec_fair@basic-none-share@rcs0}:
    - shard-iclb:         [FAIL][105] ([i915#2842]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * {igt@gem_exec_fair@basic-pace-share@rcs0}:
    - shard-tglb:         [FAIL][107] ([i915#2842]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * {igt@gem_exec_fair@basic-pace-solo@rcs0}:
    - shard-kbl:          [FAIL][109] ([i915#2842]) -> ([PASS][110], [PASS][111])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][112] ([i915#2389]) -> ([PASS][113], [PASS][114])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-apl:          [DMESG-WARN][115] ([i915#1610]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][117] ([i915#454]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-glk:          [DMESG-WARN][119] ([i915#118] / [i915#95]) -> ([PASS][120], [PASS][121])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk3/igt@i915_pm_rpm@cursor-dpms.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk8/igt@i915_pm_rpm@cursor-dpms.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk6/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-iclb:         [SKIP][122] ([i915#579]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb2/igt@i915_pm_rpm@reg-read-ioctl.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb4/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-tglb:         [SKIP][124] ([i915#579]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb2/igt@i915_pm_rpm@reg-read-ioctl.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb6/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-kbl:          [SKIP][126] ([fdo#109271]) -> ([PASS][127], [PASS][128])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl7/igt@i915_pm_rpm@reg-read-ioctl.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl4/igt@i915_pm_rpm@reg-read-ioctl.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl1/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-apl:          [SKIP][129] ([fdo#109271]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-apl7/igt@i915_pm_rpm@reg-read-ioctl.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl8/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-glk:          [SKIP][131] ([fdo#109271]) -> ([PASS][132], [PASS][133])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk8/igt@i915_pm_rpm@reg-read-ioctl.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk9/igt@i915_pm_rpm@reg-read-ioctl.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk4/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][134] ([i915#180]) -> ([PASS][135], [PASS][136])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][137] ([fdo#109441]) -> [PASS][138] +2 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@prime_vgem@sync@bcs0:
    - shard-tglb:         [INCOMPLETE][139] ([i915#409]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb3/igt@prime_vgem@sync@bcs0.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb5/igt@prime_vgem@sync@bcs0.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][141] ([i915#2681] / [i915#2684]) -> [WARN][142] ([i915#2684])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         [SKIP][143] ([fdo#109506] / [i915#2411]) -> [SKIP][144] ([i915#579])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         [SKIP][145] ([fdo#109293] / [fdo#109506]) -> [SKIP][146] ([i915#579])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb4/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][147], [FAIL][148]) ([i915#2295] / [i915#483]) -> ([FAIL][149], [FAIL][150], [FAIL][151]) ([i915#2295] / [i915#2426] / [i915#483])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl3/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl2/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl4/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl1/igt@runner@aborted.html
    - shard-iclb:         [FAIL][152] ([i915#2295] / [i915#2724]) -> ([FAIL][153], [FAIL][154]) ([i915#2295] / [i915#2426] / [i915#2724] / [i915#483])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb2/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb1/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][155], [FAIL][156]) ([i915#1610] / [i915#2295] / [i915#2426]) -> [FAIL][157] ([i915#2295])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-apl1/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-apl1/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl3/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][158], [FAIL][159]) ([i915#1764] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#409]) -> ([FAIL][160], [FAIL][161], [FAIL][162]) ([i915#1602] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#409])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb3/igt@runner@aborted.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb6/igt@runner@aborted.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb5/igt@runner@aborted.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb3/igt@runner@aborted.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#1092

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/index.html

--===============7898257921234194996==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Added test description (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84776/">https://patchwork.freedesktop.org/series/84776/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9555_full -&gt; IGTPW_5363_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5363_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw4/igt@core_hotunplug@unbind-rebind.html">WARN</a> ([i915#2283])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw5/igt@gem_ctx_persistence@legacy-engines-mixed-process.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1099]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk4/igt@gem_exec_create@forked.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk6/igt@gem_exec_create@forked.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk8/igt@gem_exec_create@forked.html">DMESG-WARN</a>) ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw5/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> ([i915#2389]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk9/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk4/igt@gem_exec_whisper@basic-queues-forked.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk9/igt@gem_exec_whisper@basic-queues-forked.html">DMESG-WARN</a>) ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw5/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb8/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb8/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wc:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw2/igt@gem_userptr_blits@process-exit-mmap@wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1092 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb7/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([fdo#110426] / [i915#1704])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb1/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([fdo#110426] / [i915#1704])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw5/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb2/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb3/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk4/igt@i915_pm_backlight@basic-brightness.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk3/igt@i915_pm_backlight@basic-brightness.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a>) ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl3/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-apl7/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl7/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb8/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb5/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk8/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk7/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk1/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb2/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb7/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb5/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb2/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb8/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2597])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb4/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw8/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +77 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-after-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk2/igt@kms_chamelium@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl3/igt@kms_color@pipe-b-ctm-blue-to-red.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@kms_color@pipe-b-ctm-blue-to-red.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@kms_color@pipe-b-ctm-blue-to-red.html">DMESG-WARN</a>) ([i915#165] / [i915#180] / [i915#78])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-75:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-0-75.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb6/igt@kms_color_chamelium@pipe-b-ctm-0-75.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl7/igt@kms_color_chamelium@pipe-b-ctm-0-75.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@kms_color_chamelium@pipe-b-ctm-0-75.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl6/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk9/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk6/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl6/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb2/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb5/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#111828])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a>) ([i915#72])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> ([i915#2055] / [i915#2295])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html">FAIL</a>) ([i915#49]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">DMESG-WARN</a>) ([i915#165]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> ([fdo#111825]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109280]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html">FAIL</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl4/igt@kms_properties@plane-properties-legacy.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@kms_properties@plane-properties-legacy.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@kms_properties@plane-properties-legacy.html">PASS</a>) ([i915#180] / [i915#78])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb6/igt@kms_psr@psr2_basic.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-a-functional:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl1/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">PASS</a>) ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">INCOMPLETE</a>) ([i915#155] / [i915#794])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl4/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +48 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb8/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-apl8/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl4/igt@perf@polling-parameterized.html">FAIL</a> ([i915#1542])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb2/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb2/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk2/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_import:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl2/igt@prime_nv_api@i915_nv_double_import.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl7/igt@prime_nv_api@i915_nv_double_import.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_blt_fill_nv_read:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb2/igt@prime_nv_test@i915_blt_fill_nv_read.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb3/igt@prime_nv_test@i915_blt_fill_nv_read.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@vcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb5/igt@prime_vgem@sync@vcs0.html">INCOMPLETE</a> ([i915#409])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_fair@basic-none-share@rcs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace-share@rcs0}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace-solo@rcs0}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk3/igt@i915_pm_rpm@cursor-dpms.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk8/igt@i915_pm_rpm@cursor-dpms.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk6/igt@i915_pm_rpm@cursor-dpms.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@reg-read-ioctl:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb2/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb4/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb2/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb6/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl7/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl4/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl1/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-apl7/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl8/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-glk8/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk9/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-glk4/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@bcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb3/igt@prime_vgem@sync@bcs0.html">INCOMPLETE</a> ([i915#409]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb5/igt@prime_vgem@sync@bcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109506] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109293] / [fdo#109506]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb4/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-kbl2/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-kbl1/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2426] / [i915#483])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-iclb2/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#2724]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-iclb7/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2426] / [i915#2724] / [i915#483])</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-apl1/igt@runner@aborted.html">FAIL</a>) ([i915#1610] / [i915#2295] / [i915#2426]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-apl3/igt@runner@aborted.html">FAIL</a> ([i915#2295])</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9555/shard-tglb6/igt@runner@aborted.html">FAIL</a>) ([i915#1764] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#409]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5363/shard-tglb1/igt@runner@aborted.html">FAIL</a>) ([i915#1602] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#409])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<p>[fdo#1092</p>

</body>
</html>

--===============7898257921234194996==--

--===============0428503563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0428503563==--
