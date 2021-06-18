Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 18 Jun 2021 21:31:16 -0000
Message-ID: <162405187601.1291.16420727459415741732@emeril.freedesktop.org>
References: <20210617191256.577244-1-jason@jlekstrand.net>
In-Reply-To: <20210617191256.577244-1-jason@jlekstrand.net>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgU3RvcCBk?=
 =?utf-8?q?epending_on_context_mutation_=28rev13=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0122762902=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0122762902==
Content-Type: multipart/alternative;
 boundary="===============5826511891515925579=="

--===============5826511891515925579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Stop depending on context mutation (rev13)
URL   : https://patchwork.freedesktop.org/series/88986/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10243_full -> IGTPW_5942_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5942_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5942_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5942_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ctx_param@invalid-get-engines} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][1] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk5/igt@gem_ctx_param@invalid-get-engines.html

  * {igt@gem_ctx_param@invalid-get-ringsize} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][2] +12 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl6/igt@gem_ctx_param@invalid-get-ringsize.html

  * {igt@gem_ctx_param@invalid-set-no-zeromap} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][3] +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@gem_ctx_param@invalid-set-no-zeromap.html
    - shard-kbl:          NOTRUN -> [FAIL][4] +6 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl7/igt@gem_ctx_param@invalid-set-no-zeromap.html

  * igt@gem_eio@context-create:
    - shard-tglb:         NOTRUN -> [FAIL][5] +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb8/igt@gem_eio@context-create.html

  * igt@gem_eio@in-flight-internal-immediate:
    - shard-tglb:         [PASS][6] -> [FAIL][7] +25 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-tglb1/igt@gem_eio@in-flight-internal-immediate.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb2/igt@gem_eio@in-flight-internal-immediate.html

  * igt@gem_eio@unwedge-stress:
    - shard-glk:          [PASS][8] -> [FAIL][9] +24 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-glk8/igt@gem_eio@unwedge-stress.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk7/igt@gem_eio@unwedge-stress.html

  * igt@gem_eio@wait-1us:
    - shard-snb:          [PASS][10] -> [FAIL][11] +10 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-snb6/igt@gem_eio@wait-1us.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb7/igt@gem_eio@wait-1us.html

  * igt@gem_eio@wait-immediate:
    - shard-snb:          NOTRUN -> [FAIL][12] +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb7/igt@gem_eio@wait-immediate.html

  * igt@gem_eio@wait-wedge-10ms:
    - shard-apl:          [PASS][13] -> [FAIL][14] +7 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-apl8/igt@gem_eio@wait-wedge-10ms.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl7/igt@gem_eio@wait-wedge-10ms.html

  * igt@gem_exec_schedule@independent@vcs0:
    - shard-kbl:          [PASS][15] -> [FAIL][16] +26 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl2/igt@gem_exec_schedule@independent@vcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl3/igt@gem_exec_schedule@independent@vcs0.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-snb:          NOTRUN -> [TIMEOUT][17] +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb6/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-iclb:         [PASS][18] -> [FAIL][19] +26 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb3/igt@i915_pm_rpm@gem-idle.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb8/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_suspend@sysfs-reader:
    - shard-snb:          [PASS][20] -> [TIMEOUT][21] +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-snb6/igt@i915_suspend@sysfs-reader.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb6/igt@i915_suspend@sysfs-reader.html

  * igt@perf_pmu@multi-client@rcs0:
    - shard-snb:          NOTRUN -> [INCOMPLETE][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb5/igt@perf_pmu@multi-client@rcs0.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][23] ([i915#2369] / [i915#3063]) -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-tglb5/igt@gem_eio@unwedge-stress.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb6/igt@gem_eio@unwedge-stress.html
    - shard-iclb:         [TIMEOUT][25] ([i915#2369] / [i915#2481] / [i915#3070]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb3/igt@gem_eio@unwedge-stress.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb4/igt@gem_eio@unwedge-stress.html
    - shard-snb:          [FAIL][27] ([i915#3354]) -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-snb6/igt@gem_eio@unwedge-stress.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb6/igt@gem_eio@unwedge-stress.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][29] ([fdo#109271]) -> [TIMEOUT][30] +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-snb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10243_full and IGTPW_5942_full:

### New IGT tests (5) ###

  * igt@gem_ctx_param@invalid-get-engines:
    - Statuses : 5 fail(s)
    - Exec time: [0.01, 0.07] s

  * igt@gem_ctx_param@invalid-get-no-zeromap:
    - Statuses : 6 fail(s)
    - Exec time: [0.00, 0.03] s

  * igt@gem_ctx_param@invalid-get-ringsize:
    - Statuses : 5 fail(s)
    - Exec time: [0.01, 0.12] s

  * igt@gem_ctx_param@invalid-set-no-zeromap:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.65] s

  * igt@gem_ctx_param@invalid-set-ringsize:
    - Statuses : 5 fail(s)
    - Exec time: [0.01, 0.11] s

  

Known issues
------------

  Here are the changes found in IGTPW_5942_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_engines@invalid-engines:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#3468]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-glk6/igt@gem_ctx_engines@invalid-engines.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk9/igt@gem_ctx_engines@invalid-engines.html
    - shard-apl:          NOTRUN -> [FAIL][33] ([i915#3468])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl2/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_persistence@engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#1099]) +4 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb2/igt@gem_ctx_persistence@engines-hostile-preempt.html

  * igt@gem_ctx_shared@detached-shared-gtt:
    - shard-snb:          [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-snb7/igt@gem_ctx_shared@detached-shared-gtt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb7/igt@gem_ctx_shared@detached-shared-gtt.html

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#2411]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-tglb5/igt@gem_eio@in-flight-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-apl:          [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-apl6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#2842])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][43] -> [FAIL][44] ([i915#2842]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][45] ([i915#2842])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-snb:          NOTRUN -> [FAIL][46] ([i915#3633]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb7/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl3/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#2190])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@big-copy:
    - shard-glk:          [PASS][50] -> [FAIL][51] ([i915#307]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-glk9/igt@gem_mmap_gtt@big-copy.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk5/igt@gem_mmap_gtt@big-copy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-iclb:         [PASS][52] -> [FAIL][53] ([i915#307])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb2/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271]) +101 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl2/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#3323])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl6/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([i915#3323])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#3323])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3323])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3323])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@bb-large:
    - shard-apl:          NOTRUN -> [FAIL][60] ([i915#3296])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl8/igt@gen9_exec_parse@bb-large.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][61] ([i915#454])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [PASS][62] -> [INCOMPLETE][63] ([i915#750])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-tglb8/igt@i915_selftest@live@hangcheck.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111614])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb8/igt@kms_big_fb@linear-16bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#110725] / [fdo#111614])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          NOTRUN -> [DMESG-WARN][66] ([i915#118] / [i915#95])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-glk:          [PASS][67] -> [DMESG-WARN][68] ([i915#118] / [i915#95])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk5/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#2705])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb6/igt@kms_big_joiner@2x-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#2705])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb5/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb3/igt@kms_chamelium@hdmi-audio.html
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb5/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl3/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk2/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][76] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb7/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][77] ([i915#1319])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl1/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][78] ([i915#180])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109278]) +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#3359]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#109279] / [i915#3359]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109278] / [fdo#109279])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#3319])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][84] ([fdo#109271]) +357 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109274] / [fdo#109278])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#111825]) +10 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb1/igt@kms_flip@2x-flip-vs-rmfb.html
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109274]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb7/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][88] -> [DMESG-WARN][89] ([i915#180]) +3 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2642])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#2672])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109280]) +6 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][93] ([fdo#109271]) +58 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#110577])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb8/igt@kms_invalid_dotclock.html
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109310])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@kms_invalid_dotclock.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#533])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][97] ([fdo#108145] / [i915#265]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][98] ([fdo#108145] / [i915#265])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][99] ([i915#265])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_cursor@pipe-d-viewport-size-128:
    - shard-apl:          NOTRUN -> [SKIP][100] ([fdo#109271]) +254 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl8/igt@kms_plane_cursor@pipe-d-viewport-size-128.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([fdo#111615])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-kbl:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#658]) +2 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#658]) +4 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][104] -> [SKIP][105] ([fdo#109441]) +3 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#2437])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl7/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-a-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([i915#2530])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb6/igt@nouveau_crc@pipe-a-source-outp-complete.html
    - shard-iclb:         NOTRUN -> [SKIP][108] ([i915#2530])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb4/igt@nouveau_crc@pipe-a-source-outp-complete.html

  * igt@sysfs_clients@busy:
    - shard-kbl:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2994])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl7/igt@sysfs_clients@busy.html

  * igt@sysfs_clients@pidname:
    - shard-apl:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#2994]) +5 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl6/igt@sysfs_clients@pidname.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][111] ([i915#180]) -> [PASS][112] +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [FAIL][113] ([i915#2842]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-glk1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][115] ([i915#2842]) -> [PASS][116] +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][117] ([i915#2842]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html
    - shard-tglb:         [FAIL][119] ([i915#2842]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-tglb5/igt@gem_exec_fair@basic-pace@rcs0.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-iclb:         [FAIL][121] ([i915#307]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][123] ([i915#454]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
    - shard-apl:          [FAIL][125] ([i915#3444]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
    - shard-kbl:          [FAIL][127] ([i915#3444]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-apl:          [DMESG-WARN][129] ([i915#180]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][131] ([i915#433]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-planes:
    - shard-iclb:         [FAIL][133] ([i915#2472]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb8/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb3/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:
    - shard-glk:          [FAIL][135] ([i915#2472]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-glk2/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk1/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][137] ([i915#1226]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb2/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-scaler-with-clipping-clamping.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb6/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][139] ([fdo#109441]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb7/igt@kms_psr@psr2_primary_render.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][141] ([i915#180] / [i915#295]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][143] ([i915#155] / [i915#2828]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/index.html

--===============5826511891515925579==
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
<tr><td><b>Series:</b></td><td>Stop depending on context mutation (rev13)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88986/">https://patchwork.freedesktop.org/series/88986/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10243_full -&gt; IGTPW_5942_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5942_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5942_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5942_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_ctx_param@invalid-get-engines} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk5/igt@gem_ctx_param@invalid-get-engines.html">FAIL</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_ctx_param@invalid-get-ringsize} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl6/igt@gem_ctx_param@invalid-get-ringsize.html">FAIL</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_ctx_param@invalid-set-no-zeromap} (NEW):</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@gem_ctx_param@invalid-set-no-zeromap.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl7/igt@gem_ctx_param@invalid-set-no-zeromap.html">FAIL</a> +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@context-create:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb8/igt@gem_eio@context-create.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-internal-immediate:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-tglb1/igt@gem_eio@in-flight-internal-immediate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb2/igt@gem_eio@in-flight-internal-immediate.html">FAIL</a> +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-glk8/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk7/igt@gem_eio@unwedge-stress.html">FAIL</a> +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@wait-1us:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-snb6/igt@gem_eio@wait-1us.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb7/igt@gem_eio@wait-1us.html">FAIL</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@wait-immediate:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb7/igt@gem_eio@wait-immediate.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@wait-wedge-10ms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-apl8/igt@gem_eio@wait-wedge-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl7/igt@gem_eio@wait-wedge-10ms.html">FAIL</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@independent@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl2/igt@gem_exec_schedule@independent@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl3/igt@gem_exec_schedule@independent@vcs0.html">FAIL</a> +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-snoop:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb6/igt@gem_partial_pwrite_pread@write-snoop.html">TIMEOUT</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb3/igt@i915_pm_rpm@gem-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb8/igt@i915_pm_rpm@gem-idle.html">FAIL</a> +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-snb6/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb6/igt@i915_suspend@sysfs-reader.html">TIMEOUT</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@multi-client@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb5/igt@perf_pmu@multi-client@rcs0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-tglb5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb6/igt@gem_eio@unwedge-stress.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb3/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb4/igt@gem_eio@unwedge-stress.html">FAIL</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-snb6/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb6/igt@gem_eio@unwedge-stress.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-snb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">TIMEOUT</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10243_full and IGTPW_5942_full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@gem_ctx_param@invalid-get-engines:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.01, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-get-no-zeromap:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.00, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-get-ringsize:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.01, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-set-no-zeromap:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-set-ringsize:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.01, 0.11] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5942_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-glk6/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk9/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#3468]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl2/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb2/igt@gem_ctx_persistence@engines-hostile-preempt.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@detached-shared-gtt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-snb7/igt@gem_ctx_shared@detached-shared-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb7/igt@gem_ctx_shared@detached-shared-gtt.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-tglb5/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb1/igt@gem_eio@in-flight-suspend.html">FAIL</a> ([i915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-apl6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb7/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#3633]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl3/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl1/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-glk9/igt@gem_mmap_gtt@big-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk5/igt@gem_mmap_gtt@big-copy.html">FAIL</a> ([i915#307]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb2/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl2/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +101 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl8/igt@gen9_exec_parse@bb-large.html">FAIL</a> ([i915#3296])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-tglb8/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb2/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#750])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb8/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#111614])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk5/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb6/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb5/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb3/igt@kms_chamelium@hdmi-audio.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb5/igt@kms_chamelium@hdmi-audio.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl3/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk2/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb7/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl1/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html">SKIP</a> ([fdo#109278]) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html">SKIP</a> ([i915#3359]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +357 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb1/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> ([fdo#111825]) +10 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb7/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> ([fdo#109274]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#109280]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +58 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb8/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#110577])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#109310])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-d-viewport-size-128:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl8/igt@kms_plane_cursor@pipe-d-viewport-size-128.html">SKIP</a> ([fdo#109271]) +254 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl7/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb6/igt@nouveau_crc@pipe-a-source-outp-complete.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb4/igt@nouveau_crc@pipe-a-source-outp-complete.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl7/igt@sysfs_clients@busy.html">SKIP</a> ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl6/igt@sysfs_clients@pidname.html">SKIP</a> ([fdo#109271] / [i915#2994]) +5 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-glk1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-tglb5/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">FAIL</a> ([i915#307]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x128-random:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">FAIL</a> ([i915#3444]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">FAIL</a> ([i915#3444]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-planes:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb8/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html">FAIL</a> ([i915#2472]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb3/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-glk2/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html">FAIL</a> ([i915#2472]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-glk1/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb2/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-scaler-with-clipping-clamping.html">DMESG-WARN</a> ([i915#1226]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb6/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-scaler-with-clipping-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-iclb7/igt@kms_psr@psr2_primary_render.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180] / [i915#295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5942/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10243/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#2828]) -&gt; [PASS][144]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============5826511891515925579==--

--===============0122762902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0122762902==--
