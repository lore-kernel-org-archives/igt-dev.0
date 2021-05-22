Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 22 May 2021 22:09:23 -0000
Message-ID: <162172136377.490.8466485970668077344@emeril.freedesktop.org>
References: <20210521060237.774731-1-viswax.krishna.raveendra.talabattula@intel.com>
In-Reply-To: <20210521060237.774731-1-viswax.krishna.raveendra.talabattula@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=3A_test_pass_for_no_caching_case_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0547297365=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: viswax.krishna.raveendra.talabattula@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0547297365==
Content-Type: multipart/alternative;
 boundary="===============3431597346528655997=="

--===============3431597346528655997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915: test pass for no caching case (rev3)
URL   : https://patchwork.freedesktop.org/series/90346/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10118_full -> IGTPW_5831_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/index.html

Known issues
------------

  Here are the changes found in IGTPW_5831_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-snb5/igt@gem_ctx_persistence@engines-hostile-preempt.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][2] ([i915#280])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][3] ([i915#3354])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-snb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][4] -> [FAIL][5] ([i915#2846])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-kbl2/igt@gem_exec_fair@basic-deadline.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl3/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [PASS][6] -> [FAIL][7] ([i915#2846])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-glk1/igt@gem_exec_fair@basic-deadline.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk2/igt@gem_exec_fair@basic-deadline.html
    - shard-apl:          NOTRUN -> [FAIL][8] ([i915#2846])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][9] -> [FAIL][10] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][11] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#2842] / [i915#3468])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][17] ([i915#2389]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl7/igt@gem_exec_reloc@basic-wide-active@bcs0.html
    - shard-glk:          NOTRUN -> [FAIL][18] ([i915#2389]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk6/igt@gem_exec_reloc@basic-wide-active@bcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][19] ([i915#2389]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][20] ([i915#2389]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@gem_exec_reloc@basic-wide-active@rcs0.html
    - shard-kbl:          NOTRUN -> [FAIL][21] ([i915#2389]) +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl4/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#118] / [i915#95])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-glk:          [PASS][24] -> [INCOMPLETE][25] ([i915#2055] / [i915#3468])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-glk1/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-iclb:         [PASS][26] -> [FAIL][27] ([i915#307])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][28] ([i915#3468])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-snb:          NOTRUN -> [INCOMPLETE][29] ([i915#3468])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-snb2/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_mmap_offset@clear:
    - shard-glk:          [PASS][30] -> [FAIL][31] ([i915#3160])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-glk7/igt@gem_mmap_offset@clear.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk5/igt@gem_mmap_offset@clear.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][32] ([i915#2658])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][33] ([i915#2658])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk7/igt@gem_pread@exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][34] ([i915#2658])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl2/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][35] ([i915#2658])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][36] ([i915#2658])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-snb6/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][37] ([i915#2658])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl7/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271]) +224 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl6/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#768]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3297])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#110542])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@gem_userptr_blits@coherency-sync.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109290])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#3323])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([i915#3297]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109289]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#109289]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#112306]) +6 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#112306]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb7/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-large:
    - shard-kbl:          NOTRUN -> [FAIL][49] ([i915#3296])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl7/igt@gen9_exec_parse@bb-large.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3288])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb5/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         NOTRUN -> [FAIL][51] ([i915#3343])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109293] / [fdo#109506])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109506] / [i915#2411])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#110892])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-tglb:         [PASS][55] -> [INCOMPLETE][56] ([i915#456])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-tglb8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb5/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#110725] / [fdo#111614]) +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#111614]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#110723])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111615]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_joiner@basic:
    - shard-apl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#2705])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl3/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo:
    - shard-snb:          NOTRUN -> [SKIP][62] ([fdo#109271]) +264 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-snb6/igt@kms_ccs@pipe-a-ccs-on-another-bo.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk6/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl3/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109284] / [fdo#111827]) +14 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109278] / [i915#1149]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109284] / [fdo#111827]) +10 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb7/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-snb:          NOTRUN -> [SKIP][68] ([fdo#109271] / [fdo#111827]) +14 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes:
    - shard-kbl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl1/igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes.html

  * igt@kms_content_protection@legacy:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109300] / [fdo#111066]) +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@kms_content_protection@legacy.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][72] ([i915#1319]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#111828]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb5/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][74] ([i915#1319]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][75] ([i915#2105])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#3319]) +4 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278] / [fdo#109279]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:
    - shard-kbl:          NOTRUN -> [FAIL][78] ([i915#3444])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
    - shard-apl:          NOTRUN -> [FAIL][79] ([i915#3444])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#109279] / [i915#3359]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-apl:          [PASS][81] -> [FAIL][82] ([i915#3444])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - shard-kbl:          [PASS][83] -> [FAIL][84] ([i915#3444])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-b-cursor-max-size-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#3359]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-max-size-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109278]) +31 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271]) +165 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl7/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109274] / [fdo#109278]) +7 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_dp_dsc@basic-dsc-enable-dp:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109349])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@kms_dp_dsc@basic-dsc-enable-dp.html
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109349])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-dp.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-tglb:         NOTRUN -> [CRASH][91] ([i915#3494])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109274]) +6 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#111825]) +30 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
    - shard-kbl:          [PASS][94] -> [FAIL][95] ([i915#79])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-kbl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109280]) +32 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][97] ([fdo#109271]) +74 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][98] -> [SKIP][99] ([i915#433])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][100] ([i915#180]) +4 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([fdo#110577])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb5/igt@kms_invalid_dotclock.html
    - shard-iclb:         NOTRUN -> [SKIP][102] ([fdo#109310])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_invalid_dotclock.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#533])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][104] ([fdo#108145] / [i915#265])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][105] ([fdo#108145] / [i915#265]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][106] ([fdo#108145] / [i915#265]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][107] ([i915#265])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([fdo#112054])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([i915#658]) +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
    - shard-kbl:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#658]) +3 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#2920]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html
    - shard-glk:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#658])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk9/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_su@page_flip:
    - shard-apl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#658]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109441]) +5 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-tglb:         NOTRUN -> [FAIL][115] ([i915#132] / [i915#3467]) +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#533]) +3 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl7/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_vrr@flipline:
    - shard-tglb:         NOTRUN -> [SKIP][117] ([fdo#109502])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@kms_vrr@flipline.html
    - shard-iclb:         NOTRUN -> [SKIP][118] ([fdo#109502])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-iclb:         NOTRUN -> [SKIP][119] ([i915#2437])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][120] ([i915#2530])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb1/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html
    - shard-iclb:         NOTRUN -> [SKIP][121] ([i915#2530]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-iclb:         NOTRUN -> [SKIP][122] ([fdo#112283])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglb:         NOTRUN -> [SKIP][123] ([fdo#112283])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb7/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_mmap_coherency@write:
    - shard-glk:          NOTRUN -> [DMESG-WARN][124] ([i915#118] / [i915#95])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk9/igt@prime_mmap_coherency@write.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-iclb:         NOTRUN -> [SKIP][125] ([fdo#109291]) +4 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@prime_nv_test@nv_write_i915_gtt_mmap_read:
    - shard-tglb:         NOTRUN -> [SKIP][126] ([fdo#109291]) +2 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-iclb:         NOTRUN -> [SKIP][127] ([fdo#109295])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@prime_vgem@fence-flip-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][128] ([fdo#109295])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@prime_vgem@fence-flip-hang.html

  * igt@sysfs_clients@fair-0:
    - shard-tglb:         NOTRUN -> [SKIP][129] ([i915#2994])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@sysfs_clients@fair-0.html
    - shard-glk:          NOTRUN -> [SKIP][130] ([fdo#109271] / [i915#2994])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk9/igt@sysfs_clients@fair-0.html
    - shard-iclb:         NOTRUN -> [SKIP][131] ([i915#2994]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@sysfs_clients@fair-0.html

  * igt@sysfs_clients@fair-3:
    - shard-kbl:          NOTRUN -> [SKIP][132] ([fdo#109271] / [i915#2994]) +2 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl3/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][133] ([fdo#109271] / [i915#2994]) +2 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl6/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [FAIL][134] ([i915#2842]) -> [PASS][135] +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-glk9/igt@gem_exec_fair@basic-none@rcs0.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [FAIL][136] ([i915#2842]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-tglb2/igt@gem_exec_fair@basic-pace@rcs0.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-glk:          [INCOMPLETE][138] ([i915#2055] / [i915#3468]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-glk1/igt@gem_mmap_gtt@cpuset-basic

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/index.html

--===============3431597346528655997==
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
<tr><td><b>Series:</b></td><td>tests/i915: test pass for no caching case (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90346/">https://patchwork.freedesktop.org/series/90346/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10118_full -&gt; IGTPW_5831_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5831_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-snb5/igt@gem_ctx_persistence@engines-hostile-preempt.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-snb2/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-glk1/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842] / [i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl7/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk6/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl4/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-glk1/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">INCOMPLETE</a> ([i915#2055] / [i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@gem_mmap_gtt@fault-concurrent-x.html">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-snb2/igt@gem_mmap_gtt@fault-concurrent-y.html">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-glk7/igt@gem_mmap_offset@clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk5/igt@gem_mmap_offset@clear.html">FAIL</a> ([i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-snb6/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl6/igt@gem_render_copy@linear-to-vebox-y-tiled.html">SKIP</a> ([fdo#109271]) +224 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#110542])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#109290])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl7/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> ([fdo#109289]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([fdo#112306]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb7/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> ([fdo#112306]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl7/igt@gen9_exec_parse@bb-large.html">FAIL</a> ([i915#3296])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb5/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#3343])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#110892])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-tglb8/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb5/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> ([i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl3/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-snb6/igt@kms_ccs@pipe-a-ccs-on-another-bo.html">SKIP</a> ([fdo#109271]) +264 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk6/igt@kms_chamelium@hdmi-aspect-ratio.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl3/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb7/igt@kms_color_chamelium@pipe-b-ctm-0-75.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl1/igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@kms_content_protection@legacy.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl3/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb5/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#111828]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl1/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl3/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen.html">SKIP</a> ([i915#3319]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html">FAIL</a> ([i915#3444])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html">FAIL</a> ([i915#3444])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a> ([i915#3444])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a> ([i915#3444])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-max-size-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-max-size-onscreen.html">SKIP</a> ([i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html">SKIP</a> ([fdo#109278]) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl7/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">SKIP</a> ([fdo#109271]) +165 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-dp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@kms_dp_dsc@basic-dsc-enable-dp.html">SKIP</a> ([fdo#109349])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-dp.html">SKIP</a> ([fdo#109349])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html">CRASH</a> ([i915#3494])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> ([fdo#109274]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb5/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> ([fdo#111825]) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-kbl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#109280]) +32 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +74 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> ([i915#180]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb5/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#110577])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#109310])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#658]) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html">SKIP</a> ([i915#2920]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk9/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl6/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@kms_psr@psr2_primary_mmap_gtt.html">FAIL</a> ([i915#132] / [i915#3467]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl7/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@kms_vrr@flipline.html">SKIP</a> ([fdo#109502])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@kms_vrr@flipline.html">SKIP</a> ([fdo#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb1/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb6/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb7/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_mmap_coherency@write:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk9/igt@prime_mmap_coherency@write.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@prime_nv_api@i915_nv_import_twice.html">SKIP</a> ([fdo#109291]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_gtt_mmap_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb3/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb3/igt@sysfs_clients@fair-0.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk9/igt@sysfs_clients@fair-0.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-iclb5/igt@sysfs_clients@fair-0.html">SKIP</a> ([i915#2994]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-kbl3/igt@sysfs_clients@fair-3.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-apl6/igt@sysfs_clients@recycle-many.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-glk9/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-tglb2/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5831/shard-tglb2/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10118/shard-glk1/igt@gem_mmap_gtt@cpuset-basic">INCOMPLETE</a> ([i915#2055] / [i915#3468]) -&gt; [PASS][139]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3431597346528655997==--

--===============0547297365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0547297365==--
