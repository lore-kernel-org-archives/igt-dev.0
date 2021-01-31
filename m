Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 31 Jan 2021 04:48:53 -0000
Message-ID: <161206853307.18205.8164316830684227823@emeril.freedesktop.org>
References: <20210131031153.3399123-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210131031153.3399123-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaW50ZWxf?=
 =?utf-8?q?gpu=5Ftop=3A_Hide_unused_clients?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1801473965=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1801473965==
Content-Type: multipart/alternative;
 boundary="===============6822162283956017436=="

--===============6822162283956017436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel_gpu_top: Hide unused clients
URL   : https://patchwork.freedesktop.org/series/86486/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9706_full -> IGTPW_5452_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5452_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5452_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5452_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb7/igt@gem_exec_balancer@hang.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb1/igt@gem_exec_balancer@hang.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-snb:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-snb6/igt@kms_async_flips@alternate-sync-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-snb4/igt@kms_async_flips@alternate-sync-async-flip.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@sysfs_clients@recycle}:
    - shard-apl:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-apl3/igt@sysfs_clients@recycle.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl4/igt@sysfs_clients@recycle.html
    - shard-tglb:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-tglb1/igt@sysfs_clients@recycle.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb5/igt@sysfs_clients@recycle.html

  
Known issues
------------

  Here are the changes found in IGTPW_5452_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][9] ([i915#658]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb3/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html
    - shard-hsw:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-hsw6/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][12] ([i915#1037] / [i915#180])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl8/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][19] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][20] ([i915#2389]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl1/igt@gem_exec_reloc@basic-wide-active@bcs0.html
    - shard-glk:          NOTRUN -> [FAIL][21] ([i915#2389]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk7/igt@gem_exec_reloc@basic-wide-active@bcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][22] ([i915#2389]) +4 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb7/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][23] ([i915#2389]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@rcs0.html
    - shard-kbl:          NOTRUN -> [FAIL][24] ([i915#2389]) +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl4/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#2190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#768]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#109312])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb7/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#110542])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb7/igt@gem_userptr_blits@coherency-sync.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109290])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb8/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#1317]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb2/igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#110426] / [i915#1704])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#110426] / [i915#1704])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][33] -> [DMESG-WARN][34] ([i915#1436] / [i915#716])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk3/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#112306])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb8/igt@gen9_exec_parse@basic-rejected.html
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#112306]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb7/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#2527])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb1/igt@gen9_exec_parse@bb-large.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#2527])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb5/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#2856])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb6/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-hsw:          [PASS][40] -> [INCOMPLETE][41] ([i915#2880])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-hsw6/igt@i915_module_load@reload-with-fault-injection.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-hsw2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         NOTRUN -> [FAIL][42] ([i915#454])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#1937])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271]) +153 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          NOTRUN -> [DMESG-WARN][45] ([i915#180])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl3/igt@i915_suspend@forcewake.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#1769])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb7/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#110725] / [fdo#111614])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#111614]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#111615]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl8/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-after-suspend:
    - shard-snb:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-snb5/igt@kms_chamelium@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium@vga-hpd-enable-disable-mode:
    - shard-glk:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk1/igt@kms_chamelium@vga-hpd-enable-disable-mode.html

  * igt@kms_color@pipe-a-ctm-0-25:
    - shard-tglb:         NOTRUN -> [FAIL][53] ([i915#1149] / [i915#315])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb3/igt@kms_color@pipe-a-ctm-0-25.html

  * igt@kms_color@pipe-d-ctm-green-to-red:
    - shard-hsw:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#533]) +5 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-hsw2/igt@kms_color@pipe-d-ctm-green-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278] / [i915#1149])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb3/igt@kms_color@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb5/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-hsw:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-hsw6/igt@kms_color_chamelium@pipe-d-ctm-max.html
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-max.html
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl1/igt@kms_color_chamelium@pipe-d-ctm-max.html
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][61] ([i915#1319])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl7/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][62] ([i915#1319])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl2/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][63] ([i915#2105])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl1/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111828]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb6/igt@kms_content_protection@uevent.html
    - shard-apl:          NOTRUN -> [FAIL][65] ([i915#2105])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl4/igt@kms_content_protection@uevent.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][67] -> [DMESG-WARN][68] ([i915#180])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109278]) +5 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-dpms.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [PASS][70] -> [FAIL][71] ([i915#2346]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109274]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#2672])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#2672])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2672])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#2587])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-apl:          NOTRUN -> [FAIL][77] ([i915#2641])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-snb:          NOTRUN -> [FAIL][78] ([i915#2546]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#111825]) +41 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][80] ([fdo#109271]) +75 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack:
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271]) +49 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109280]) +23 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271]) +63 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][84] ([fdo#108145] / [i915#265])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][85] ([i915#265])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-apl:          NOTRUN -> [FAIL][86] ([i915#265])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][87] ([i915#265])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-hsw:          NOTRUN -> [SKIP][88] ([fdo#109271]) +60 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-hsw7/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#658]) +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#658]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#2920])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-glk:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#658]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk1/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#2920]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@kms_psr@cursor_render:
    - shard-hsw:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#1072]) +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-hsw8/igt@kms_psr@cursor_render.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][95] -> [SKIP][96] ([fdo#109441]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109441]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#109309])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#533]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_vrr@flip-basic:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#109502])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb5/igt@kms_vrr@flip-basic.html

  * igt@nouveau_crc@pipe-b-source-rg:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([i915#2530]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb3/igt@nouveau_crc@pipe-b-source-rg.html

  * igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([fdo#109278] / [i915#2530])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb2/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109289])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb5/igt@perf@per-context-mode-unprivileged.html
    - shard-tglb:         NOTRUN -> [SKIP][104] ([fdo#109289])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb1/igt@perf@per-context-mode-unprivileged.html

  * igt@prime_nv_api@nv_i915_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][105] ([fdo#109291]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb4/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html

  * igt@prime_nv_api@nv_self_import:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([fdo#109291]) +3 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb2/igt@prime_nv_api@nv_self_import.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109295])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb7/igt@prime_vgem@fence-flip-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][108] ([fdo#109295]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb6/igt@prime_vgem@fence-flip-hang.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][109] ([i915#2842]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][111] ([i915#2842]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-tglb:         [FAIL][113] ([i915#2842]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-tglb5/igt@gem_exec_fair@basic-pace@vecs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb2/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-tglb:         [DMESG-WARN][115] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:
    - shard-kbl:          [FAIL][117] ([i915#54]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
    - shard-apl:          [FAIL][119] ([i915#54]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][121] ([i915#180]) -> [PASS][122] +4 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][123] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][124] +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb6/igt@kms_psr2_su@frontbuffer.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [SKIP][125] ([fdo#109441]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * {igt@sysfs_clients@busy@vcs0}:
    - shard-glk:          [FAIL][127] -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-glk8/igt@sysfs_clients@busy@vcs0.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk7/igt@sysfs_clients@busy@vcs0.html

  * {igt@sysfs_clients@recycle}:
    - shard-iclb:         [FAIL][129] -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb7/igt@sysfs_clients@recycle.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb3/igt@sysfs_clients@recycle.html
    - shard-kbl:          [FAIL][131] -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-kbl2/igt@sysfs_clients@recycle.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl7/igt@sysfs_clients@recycle.html

  * {igt@sysfs_clients@split-10@bcs0}:
    - shard-glk:          [SKIP][133] ([fdo#109271]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-glk2/igt@sysfs_clients@split-10@bcs0.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk6/igt@sysfs_clients@split-10@bcs0.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][135] ([i915#2681] / [i915#2684]) -> [WARN][136] ([i915#1804] / [i915#2684])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-iclb:         [SKIP][137] ([i915#658]) -> [SKIP][138] ([i915#2920]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][139], [FAIL][140]) ([i915#2295] / [i915#2505]) -> ([FAIL][141], [FAIL][142], [FAIL][143]) ([i915#142] / [i915#2292] / [i915#2295] / [i915#2505] / [i915#2722] / [i915#54])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-hsw8/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-hsw4/igt@runne

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/index.html

--===============6822162283956017436==
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
<tr><td><b>Series:</b></td><td>intel_gpu_top: Hide unused clients</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86486/">https://patchwork.freedesktop.org/series/86486/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9706_full -&gt; IGTPW_5452_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5452_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5452_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5452_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@hang:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb7/igt@gem_exec_balancer@hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb1/igt@gem_exec_balancer@hang.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-snb6/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-snb4/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@sysfs_clients@recycle}:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-apl3/igt@sysfs_clients@recycle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl4/igt@sysfs_clients@recycle.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-tglb1/igt@sysfs_clients@recycle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb5/igt@sysfs_clients@recycle.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5452_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb3/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-hsw6/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl8/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> ([i915#1037] / [i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl1/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk7/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb7/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl4/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl8/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html">SKIP</a> ([i915#768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb7/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb7/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#110542])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb8/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#109290])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb2/igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([fdo#110426] / [i915#1704])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([fdo#110426] / [i915#1704])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-glk4/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk3/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> ([i915#1436] / [i915#716])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb8/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb7/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> ([fdo#112306]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb1/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb5/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-hsw6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-hsw2/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#2880])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109271]) +153 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl3/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb7/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111615]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl8/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-snb5/igt@kms_chamelium@hdmi-hpd-after-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk1/igt@kms_chamelium@vga-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb3/igt@kms_color@pipe-a-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-green-to-red:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-hsw2/igt@kms_color@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109271] / [i915#533]) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb3/igt@kms_color@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109278] / [i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb5/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-hsw6/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +8 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl1/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl7/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl2/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl1/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb6/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#111828]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl4/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb6/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-dpms.html">SKIP</a> ([fdo#109278]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> ([i915#2346]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb5/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([i915#2587])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html">FAIL</a> ([i915#2546]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#111825]) +41 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> ([fdo#109271]) +75 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack.html">SKIP</a> ([fdo#109271]) +49 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack.html">SKIP</a> ([fdo#109280]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +63 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-hsw7/igt@kms_plane_lowres@pipe-b-tiling-yf.html">SKIP</a> ([fdo#109271]) +60 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html">SKIP</a> ([i915#2920])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk1/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([i915#2920]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_render:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-hsw8/igt@kms_psr@cursor_render.html">SKIP</a> ([fdo#109271] / [i915#1072]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb5/igt@kms_vrr@flip-basic.html">SKIP</a> ([fdo#109502])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-rg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb3/igt@nouveau_crc@pipe-b-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb2/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html">SKIP</a> ([fdo#109278] / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb5/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb1/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_import_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb4/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb2/igt@prime_nv_api@nv_self_import.html">SKIP</a> ([fdo#109291]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb7/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([fdo#109295]) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-tglb5/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb2/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb6/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@busy@vcs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-glk8/igt@sysfs_clients@busy@vcs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk7/igt@sysfs_clients@busy@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@recycle}:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb7/igt@sysfs_clients@recycle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb3/igt@sysfs_clients@recycle.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-kbl2/igt@sysfs_clients@recycle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-kbl7/igt@sysfs_clients@recycle.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@split-10@bcs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-glk2/igt@sysfs_clients@split-10@bcs0.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-glk6/igt@sysfs_clients@split-10@bcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5452/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-hsw8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9706/shard-hsw4/igt@runne">FAIL</a>) ([i915#2295] / [i915#2505]) -&gt; ([FAIL][141], [FAIL][142], [FAIL][143]) ([i915#142] / [i915#2292] / [i915#2295] / [i915#2505] / [i915#2722] / [i915#54])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6822162283956017436==--

--===============1801473965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1801473965==--
