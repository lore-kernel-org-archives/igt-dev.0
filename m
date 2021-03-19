Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 19 Mar 2021 05:29:52 -0000
Message-ID: <161613179265.8628.1164131406053374429@emeril.freedesktop.org>
References: <20210318235426.448465-1-lucas.demarchi@intel.com>
In-Reply-To: <20210318235426.448465-1-lucas.demarchi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdG9vbC9s?=
 =?utf-8?q?sgpu=3A_Fix_memory_leak_when_no_device_is_found?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0182135405=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0182135405==
Content-Type: multipart/alternative;
 boundary="===============2271183520050204975=="

--===============2271183520050204975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tool/lsgpu: Fix memory leak when no device is found
URL   : https://patchwork.freedesktop.org/series/88148/
State : success

== Summary ==

CI Bug Log - changes from IGT_6039_full -> IGTPW_5626_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/index.html

Known issues
------------

  Here are the changes found in IGTPW_5626_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][1] ([fdo#111827])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb7/igt@feature_discovery@chamelium.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#1099]) +4 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-snb5/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][3] -> [FAIL][4] ([i915#2842]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#2842])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk1/igt@gem_exec_fair@basic-none@vecs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk2/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#2849])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-tglb:         NOTRUN -> [SKIP][9] ([fdo#109283])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb1/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([fdo#112283])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb8/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][11] ([i915#2389]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb2/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][12] ([i915#2389])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][13] ([i915#2389]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl2/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_exec_reloc@basic-parallel:
    - shard-apl:          NOTRUN -> [TIMEOUT][14] ([i915#3183])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl2/igt@gem_exec_reloc@basic-parallel.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][15] ([i915#2389]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-glk:          [PASS][16] -> [DMESG-WARN][17] ([i915#1610] / [i915#2803])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk2/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk7/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][18] -> [DMESG-WARN][19] ([i915#118] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#1317]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb1/igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
    - shard-kbl:          NOTRUN -> [SKIP][21] ([fdo#109271]) +33 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl3/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#1317]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb5/igt@gem_userptr_blits@mmap-offset-invalidate-active@wc.html

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#1699]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl7/igt@gem_userptr_blits@process-exit-mmap@wb.html

  * igt@gem_vm_create@destroy-race:
    - shard-tglb:         [PASS][24] -> [TIMEOUT][25] ([i915#2795])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-tglb3/igt@gem_vm_create@destroy-race.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb5/igt@gem_vm_create@destroy-race.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#112306])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb8/igt@gen9_exec_parse@batch-zero-length.html
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#112306])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb3/igt@gen9_exec_parse@batch-zero-length.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][28] ([i915#454])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([i915#151] / [i915#155])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][31] ([i915#2373])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb8/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][32] ([i915#1759] / [i915#2291])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb8/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          NOTRUN -> [INCOMPLETE][33] ([i915#2782])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-snb5/igt@i915_selftest@live@hangcheck.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][34] -> [FAIL][35] ([i915#2597])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-tglb8/igt@kms_async_flips@test-time-stamp.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb2/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#110723])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#2705])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-glk:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk9/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@vga-hpd-fast:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb5/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_color@pipe-b-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][42] ([i915#1149])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb3/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb3/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-negative:
    - shard-snb:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-snb6/igt@kms_color_chamelium@pipe-a-ctm-negative.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][46] ([i915#1319])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109278] / [fdo#109279])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding:
    - shard-apl:          [PASS][48] -> [FAIL][49] ([i915#54])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
    - shard-glk:          [PASS][50] -> [FAIL][51] ([i915#54])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
    - shard-kbl:          [PASS][52] -> [FAIL][53] ([i915#54])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-random:
    - shard-glk:          NOTRUN -> [SKIP][54] ([fdo#109271]) +56 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk3/igt@kms_cursor_crc@pipe-d-cursor-256x256-random.html
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109279]) +4 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][57] ([fdo#109271]) +268 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][59] ([IGT#6]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109274])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
    - shard-glk:          NOTRUN -> [FAIL][61] ([i915#79])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [PASS][62] -> [DMESG-WARN][63] ([i915#180]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-apl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-kbl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#2672])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#2672])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#2587])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111825]) +24 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109280]) +5 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#110577])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb8/igt@kms_invalid_dotclock.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#533])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk9/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][71] ([fdo#108145] / [i915#265]) +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-glk:          NOTRUN -> [FAIL][72] ([fdo#108145] / [i915#265])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][73] ([fdo#108145] / [i915#265])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][74] ([i915#265])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#658]) +5 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][76] -> [SKIP][77] ([fdo#109642] / [fdo#111068] / [i915#658])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109441])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][79] -> [SKIP][80] ([fdo#109441])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271]) +201 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl3/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#533]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-glk:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#2437])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#2530]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb2/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-c-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#2530])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb6/igt@nouveau_crc@pipe-c-source-rg.html

  * igt@perf@polling-small-buf:
    - shard-glk:          [PASS][86] -> [FAIL][87] ([i915#1722])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk9/igt@perf@polling-small-buf.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk5/igt@perf@polling-small-buf.html

  * igt@prime_nv_test@i915_import_pread_pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#109291]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb5/igt@prime_nv_test@i915_import_pread_pwrite.html

  * igt@sysfs_clients@busy@vcs1:
    - shard-kbl:          [PASS][89] -> [FAIL][90] ([i915#3009])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl7/igt@sysfs_clients@busy@vcs1.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl6/igt@sysfs_clients@busy@vcs1.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          [PASS][91] -> [FAIL][92] ([i915#3028])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-apl2/igt@sysfs_clients@recycle-many.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl6/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@split-10@bcs0:
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#3026])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl2/igt@sysfs_clients@split-10@bcs0.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][94] ([i915#658]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb3/igt@feature_discovery@psr2.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][96] ([i915#2369] / [i915#3063]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-tglb8/igt@gem_eio@unwedge-stress.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][98] ([i915#2846]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk2/igt@gem_exec_fair@basic-deadline.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [FAIL][100] ([i915#2842]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][102] ([i915#2842]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-glk:          [FAIL][104] ([i915#2842]) -> [PASS][105] +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk1/igt@gem_exec_fair@basic-none@vcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         [FAIL][106] ([i915#2842]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-tglb:         [DMESG-WARN][108] ([i915#2803]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-tglb7/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb7/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [DMESG-WARN][110] ([i915#118] / [i915#95]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk8/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-iclb:         [FAIL][112] ([i915#307]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb3/igt@gem_mmap_gtt@cpuset-medium-copy.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb5/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [DMESG-WARN][114] ([i915#180]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-apl7/igt@i915_suspend@forcewake.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl7/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [FAIL][116] ([i915#54]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
    - shard-apl:          [FAIL][118] ([i915#54]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
    - shard-glk:          [FAIL][120] ([i915#54]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [DMESG-WARN][122] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:
    - shard-glk:          [FAIL][124] ([i915#2122]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk8/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk4/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-iclb:         [FAIL][126] ([i915#49]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][128] ([fdo#109441]) -> [PASS][129] +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@sysfs_clients@recycle-many:
    - shard-kbl:          [FAIL][130] ([i915#3028]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl4/igt@sysfs_clients@recycle-many.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl3/igt@sysfs_clients@recycle-many.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][132] ([i915#658]) -> [SKIP][133] ([i915#588])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][134] ([i915#2684]) -> [WARN][135] ([i915#2681] / [i915#2684])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_content_protection@atomic:
    - shard-iclb:         [FAIL][136] ([i915#3144]) -> [SKIP][137] ([fdo#109300] / [fdo#111066])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb1/igt@kms_content_protection@atomic.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@uevent:
    - shard-iclb:         [FAIL][138] ([i915#3137]) -> [SKIP][139] ([fdo#109300] / [fdo#111066])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb1/igt@kms_content_protection@uevent.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb8/igt@kms_content_protection@uevent.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-iclb:         [SKIP][140] ([i915#658]) -> [SKIP][141] ([i915#2920]) +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-iclb:         [SKIP][142] ([i915#2920]) -> [SKIP][143] ([i915#658]) +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][144], [FAIL][145], [FAIL][146]) ([i915#1814] / [i915#2724] / [i915#3002]) -> ([FAIL][147], [FAIL][148]) ([i915#2724] / [i915#3002])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl2/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl4/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl4/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl2/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl4/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][149], [FAIL][150], [FAIL][151]) ([i915#1814] / [i915#2724] / [i915#3002]) -> ([FAIL][152], [FAIL][153]) ([i915#2724] / [i915#3002])
   [149]: https://intel-gfx-ci.01.o

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/index.html

--===============2271183520050204975==
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
<tr><td><b>Series:</b></td><td>tool/lsgpu: Fix memory leak when no device is found</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88148/">https://patchwork.freedesktop.org/series/88148/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6039_full -&gt; IGTPW_5626_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5626_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb7/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-snb5/igt@gem_ctx_persistence@smoketest.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk1/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk2/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb1/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb8/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl2/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl2/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> ([i915#3183])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk2/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk7/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610] / [i915#2803])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb1/igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl3/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html">SKIP</a> ([fdo#109271]) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb5/igt@gem_userptr_blits@mmap-offset-invalidate-active@wc.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl7/igt@gem_userptr_blits@process-exit-mmap@wb.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@destroy-race:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-tglb3/igt@gem_vm_create@destroy-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb5/igt@gem_vm_create@destroy-race.html">TIMEOUT</a> ([i915#2795])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb8/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb3/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb5/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl1/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl3/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> ([i915#151] / [i915#155])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb8/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> ([i915#2373])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb8/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> ([i915#1759] / [i915#2291])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-snb5/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-tglb8/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb2/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2597])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk9/igt@kms_chamelium@dp-hpd-storm-disable.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb5/igt@kms_chamelium@vga-hpd-fast.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb3/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb3/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-negative:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-snb6/igt@kms_color_chamelium@pipe-a-ctm-negative.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl7/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-random:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk3/igt@kms_cursor_crc@pipe-d-cursor-256x256-random.html">SKIP</a> ([fdo#109271]) +56 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-256x256-random.html">SKIP</a> ([fdo#109278]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109279]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +268 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">DMESG-FAIL</a> ([IGT#6]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-apl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([i915#2587])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> ([fdo#111825]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109280]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb8/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#110577])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk9/igt@kms_pipe_crc_basic@read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb1/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl3/igt@kms_vblank@pipe-d-ts-continuation-idle.html">SKIP</a> ([fdo#109271]) +201 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb2/igt@nouveau_crc@pipe-c-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb6/igt@nouveau_crc@pipe-c-source-rg.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk9/igt@perf@polling-small-buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk5/igt@perf@polling-small-buf.html">FAIL</a> ([i915#1722])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_pread_pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb5/igt@prime_nv_test@i915_import_pread_pwrite.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl7/igt@sysfs_clients@busy@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl6/igt@sysfs_clients@busy@vcs1.html">FAIL</a> ([i915#3009])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-apl2/igt@sysfs_clients@recycle-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl6/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10@bcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl2/igt@sysfs_clients@split-10@bcs0.html">SKIP</a> ([fdo#109271] / [i915#3026])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb3/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-tglb8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb1/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk6/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk1/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-tglb7/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb7/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk8/igt@gem_exec_whisper@basic-fds-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb3/igt@gem_mmap_gtt@cpuset-medium-copy.html">FAIL</a> ([i915#307]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb5/igt@gem_mmap_gtt@cpuset-medium-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-apl7/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl7/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-glk8/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-glk4/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl4/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl3/igt@sysfs_clients@recycle-many.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#588])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb1/igt@kms_content_protection@atomic.html">FAIL</a> ([i915#3144]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb3/igt@kms_content_protection@atomic.html">SKIP</a> ([fdo#109300] / [fdo#111066])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb1/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#3137]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb8/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#109300] / [fdo#111066])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6039/shard-kbl4/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2724] / [i915#3002]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5626/shard-kbl4/igt@runner@aborted.html">FAIL</a>) ([i915#2724] / [i915#3002])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.o">FAIL</a>, [FAIL][150], [FAIL][151]) ([i915#1814] / [i915#2724] / [i915#3002]) -&gt; ([FAIL][152], [FAIL][153]) ([i915#2724] / [i915#3002])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2271183520050204975==--

--===============0182135405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0182135405==--
