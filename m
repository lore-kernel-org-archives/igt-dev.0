Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 May 2021 06:22:51 -0000
Message-ID: <162157817152.6037.14467882090490419369@emeril.freedesktop.org>
References: <20210519145337.255167-1-matthew.auld@intel.com>
In-Reply-To: <20210519145337.255167-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgREcxL0xN?=
 =?utf-8?q?EM_uAPI_basics_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1780045914=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1780045914==
Content-Type: multipart/alternative;
 boundary="===============0773838577061024424=="

--===============0773838577061024424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DG1/LMEM uAPI basics (rev2)
URL   : https://patchwork.freedesktop.org/series/90038/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10102_full -> IGTPW_5825_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5825_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5825_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5825_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_mmap_write_crc@main:
    - shard-glk:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk6/igt@kms_mmap_write_crc@main.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10102_full and IGTPW_5825_full:

### New IGT tests (6) ###

  * igt@gem_create@create-ext-placement-all:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_create@create-ext-placement-each:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_create@create-ext-placement-sanity-check:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_gpgpu_fill@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_media_fill@media-fill:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_media_fill@media-fill@smem:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_5825_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-glk:          NOTRUN -> [DMESG-WARN][2] ([i915#3457]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk5/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][3] ([i915#658]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb3/igt@feature_discovery@psr2.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][4] ([i915#180] / [i915#3457]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-glk:          NOTRUN -> [FAIL][6] ([i915#2896] / [i915#3457])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk3/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#280])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb2/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-tglb:         [PASS][8] -> [INCOMPLETE][9] ([i915#3457])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-tglb6/igt@gem_exec_balancer@bonded-dual.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb6/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#2846] / [i915#3457])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-kbl2/igt@gem_exec_fair@basic-deadline.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#2842] / [i915#3457])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fence@keep-in-fence@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][14] ([i915#3457])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk7/igt@gem_exec_fence@keep-in-fence@rcs0.html

  * igt@gem_exec_fence@parallel@vcs0:
    - shard-glk:          NOTRUN -> [FAIL][15] ([i915#3457]) +42 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk6/igt@gem_exec_fence@parallel@vcs0.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#109283]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@gem_exec_params@no-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#109283]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb3/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][18] ([i915#2389] / [i915#3457]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#118] / [i915#95]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-glk8/igt@gem_exec_whisper@basic-queues-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk3/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([i915#284])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb6/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-snb:          NOTRUN -> [INCOMPLETE][22] ([i915#3468]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
    - shard-iclb:         [PASS][23] -> [INCOMPLETE][24] ([i915#2910] / [i915#3468])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-iclb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb3/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-iclb:         [PASS][25] -> [INCOMPLETE][26] ([i915#3468])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-iclb3/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-snb:          NOTRUN -> [INCOMPLETE][27] ([i915#3468] / [i915#3485])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb2/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#768]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@yf-tiled-ccs-to-linear:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][29] ([i915#3468]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb6/igt@gem_render_copy@yf-tiled-ccs-to-linear.html
    - shard-tglb:         NOTRUN -> [INCOMPLETE][30] ([i915#3468]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@gem_render_copy@yf-tiled-ccs-to-linear.html

  * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
    - shard-apl:          NOTRUN -> [INCOMPLETE][31] ([i915#3468]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl6/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][32] ([i915#1895] / [i915#3468])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][33] ([i915#3468]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#3297])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@set-cache-level:
    - shard-kbl:          NOTRUN -> [FAIL][35] ([i915#3324])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl3/igt@gem_userptr_blits@set-cache-level.html
    - shard-tglb:         NOTRUN -> [FAIL][36] ([i915#3324])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb5/igt@gem_userptr_blits@set-cache-level.html
    - shard-iclb:         NOTRUN -> [FAIL][37] ([i915#3324])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb6/igt@gem_userptr_blits@set-cache-level.html
    - shard-glk:          NOTRUN -> [FAIL][38] ([i915#3324])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk4/igt@gem_userptr_blits@set-cache-level.html

  * igt@gem_wait@write-busy@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][39] ([i915#3457]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl7/igt@gem_wait@write-busy@bcs0.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [PASS][40] -> [DMESG-WARN][41] ([i915#180] / [i915#3457])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-kbl7/igt@gem_workarounds@suspend-resume.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl1/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#2527])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb5/igt@gen9_exec_parse@bb-large.html
    - shard-glk:          NOTRUN -> [FAIL][43] ([i915#3296])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk2/igt@gen9_exec_parse@bb-large.html
    - shard-kbl:          NOTRUN -> [FAIL][44] ([i915#3296])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl1/igt@gen9_exec_parse@bb-large.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([i915#2527])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#112306]) +5 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb6/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#112306]) +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb6/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][48] ([i915#454])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html
    - shard-tglb:         NOTRUN -> [FAIL][49] ([i915#454])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][50] ([i915#3457]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         NOTRUN -> [DMESG-WARN][51] ([i915#3457]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-mmap-type@uc:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][52] ([i915#2411])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb5/igt@i915_pm_rpm@gem-mmap-type@uc.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][53] ([i915#3475])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl3/igt@i915_pm_rpm@gem-mmap-type@uc.html

  * igt@i915_pm_rpm@gem-mmap-type@wc:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][54] ([i915#2411] / [i915#3457])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb5/igt@i915_pm_rpm@gem-mmap-type@wc.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111644] / [i915#1397] / [i915#2411])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rps@reset:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][56] ([i915#3457])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk8/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@waitboost:
    - shard-snb:          NOTRUN -> [DMESG-WARN][57] ([i915#3457])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb7/igt@i915_pm_rps@waitboost.html

  * igt@i915_pm_sseu@full-enable:
    - shard-apl:          NOTRUN -> [DMESG-WARN][58] ([i915#3457])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl7/igt@i915_pm_sseu@full-enable.html
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109288])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb6/igt@i915_pm_sseu@full-enable.html
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109288])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@i915_pm_sseu@full-enable.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][61] ([i915#180])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#110725] / [fdo#111614]) +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb8/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111614]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#110723])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#111615]) +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_joiner@basic:
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#2705])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl3/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#2705])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb3/igt@kms_big_joiner@basic.html

  * igt@kms_chamelium@dp-frame-dump:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109284] / [fdo#111827]) +12 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb5/igt@kms_chamelium@dp-frame-dump.html
    - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk7/igt@kms_chamelium@dp-frame-dump.html

  * igt@kms_color@pipe-a-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][70] ([i915#1149])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb6/igt@kms_color@pipe-a-degamma.html
    - shard-iclb:         NOTRUN -> [FAIL][71] ([i915#1149])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@kms_color@pipe-a-degamma.html

  * igt@kms_color@pipe-c-gamma:
    - shard-glk:          NOTRUN -> [FAIL][72] ([i915#71]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk8/igt@kms_color@pipe-c-gamma.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109278] / [i915#1149]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb6/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> [SKIP][74] ([fdo#109271] / [fdo#111827]) +10 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#109284] / [fdo#111827]) +23 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb8/igt@kms_color_chamelium@pipe-d-gamma.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#3116]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#3116])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#111828]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@kms_content_protection@lic.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][82] ([i915#1319])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl3/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-glk:          NOTRUN -> [FAIL][83] ([i915#3444] / [i915#3457]) +17 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278] / [fdo#109279] / [i915#3457]) +4 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          NOTRUN -> [FAIL][85] ([i915#3444] / [i915#3457]) +13 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-max-size-onscreen:
    - shard-kbl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#3457]) +28 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-max-size-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#3359] / [i915#3457]) +11 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement.html

  * igt@kms_cursor_crc@pipe-a-cursor-size-change:
    - shard-snb:          NOTRUN -> [FAIL][88] ([i915#3457]) +4 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-size-change.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#3319] / [i915#3457]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-random:
    - shard-iclb:         NOTRUN -> [FAIL][90] ([i915#3457]) +8 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
    - shard-snb:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#3457]) +29 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb5/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-dpms:
    - shard-glk:          [PASS][92] -> [FAIL][93] ([i915#3444] / [i915#3457]) +8 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk7/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
    - shard-iclb:         [PASS][94] -> [FAIL][95] ([i915#3457]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html

  * igt@kms_cursor_crc@pipe-c-cursor-size-change:
    - shard-apl:          NOTRUN -> [FAIL][96] ([i915#3444] / [i915#3457]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html

  * igt@kms_cursor_crc@pipe-d-cursor-128x42-sliding:
    - shard-tglb:         NOTRUN -> [FAIL][97] ([i915#2124] / [i915#3457]) +18 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109278] / [i915#3457]) +15 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html
    - shard-glk:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#3457]) +32 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk1/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#109279] / [i915#3359] / [i915#3457]) +9 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding:
    - shard-apl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#3457]) +17 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl7/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:
    - shard-glk:          NOTRUN -> [FAIL][102] ([i915#70]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html

  * igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109278]) +18 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb3/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge:
    - shard-kbl:          NOTRUN -> [SKIP][104] ([fdo#109271]) +169 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl4/igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][105] ([fdo#109274] / [fdo#109278]) +4 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-glk:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#533]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk7/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-apl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#533]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([fdo#109274]) +3 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([fdo#111825]) +66 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([i915#2587])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-kbl:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#2672])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
    - shard-glk:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#2672])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
    - shard-iclb:         NOTRUN -> [SKIP][113] ([i915#2587])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109285])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb6/igt@kms_force_connector_basic@force-load-detect.html
    - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#109285])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb3/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-snb:          NOTRUN -> [SKIP][116] ([fdo#109271]) +196 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#109280]) +35 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][118] ([fdo#109271]) +159 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([fdo#110577])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb2/igt@kms_invalid_dotclock.html
    - shard-iclb:         NOTRUN -> [SKIP][120] ([fdo#109310])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@kms_invalid_dotclock.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-apl:          NOTRUN -> [SKIP][121] ([fdo#109271]) +85 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
    - shard-iclb:         NOTRUN -> [SKIP][122] ([fdo#109289]) +3 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a:
    - shard-glk:          [PASS][123] -> [FAIL][124] ([i915#2472])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-glk4/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk8/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b:
    - shard-glk:          [PASS][125] -> [FAIL][126] ([i915#3192])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-glk5/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk7/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-c:
    - shard-glk:          NOTRUN -> [FAIL][127] ([i915#53]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence:
    - shard-glk:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/index.html

--===============0773838577061024424==
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
<tr><td><b>Series:</b></td><td>DG1/LMEM uAPI basics (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90038/">https://patchwork.freedesktop.org/series/90038/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10102_full -&gt; IGTPW_5825_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5825_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5825_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5825_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_mmap_write_crc@main:<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk6/igt@kms_mmap_write_crc@main.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10102_full and IGTPW_5825_full:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@gem_create@create-ext-placement-all:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-placement-each:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-placement-sanity-check:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_gpgpu_fill@basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill@smem:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5825_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk5/igt@api_intel_bb@blit-reloc-purge-cache.html">DMESG-WARN</a> ([i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb3/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-WARN</a> ([i915#180] / [i915#3457]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk3/igt@gem_ctx_persistence@smoketest.html">FAIL</a> ([i915#2896] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb2/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-tglb6/igt@gem_exec_balancer@bonded-dual.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb6/igt@gem_exec_balancer@bonded-dual.html">INCOMPLETE</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@keep-in-fence@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk7/igt@gem_exec_fence@keep-in-fence@rcs0.html">INCOMPLETE</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel@vcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk6/igt@gem_exec_fence@parallel@vcs0.html">FAIL</a> ([i915#3457]) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb3/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389] / [i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-glk8/igt@gem_exec_whisper@basic-queues-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk3/igt@gem_exec_whisper@basic-queues-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb6/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-iclb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb3/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a> ([i915#2910] / [i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-iclb3/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb2/igt@gem_mmap_gtt@fault-concurrent-x.html">INCOMPLETE</a> ([i915#3468] / [i915#3485])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([i915#768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-linear:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb6/igt@gem_render_copy@yf-tiled-ccs-to-linear.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@gem_render_copy@yf-tiled-ccs-to-linear.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl6/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html">INCOMPLETE</a> ([i915#3468]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html">INCOMPLETE</a> ([i915#1895] / [i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb2/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@set-cache-level:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl3/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb5/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb6/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk4/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_wait@write-busy@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl7/igt@gem_wait@write-busy@bcs0.html">FAIL</a> ([i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-kbl7/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl1/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> ([i915#180] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb5/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk2/igt@gen9_exec_parse@bb-large.html">FAIL</a> ([i915#3296])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl1/igt@gen9_exec_parse@bb-large.html">FAIL</a> ([i915#3296])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb6/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([fdo#112306]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb6/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> ([fdo#112306]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@i915_pm_rc6_residency@rc6-fence.html">DMESG-WARN</a> ([i915#3457]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">DMESG-WARN</a> ([i915#3457]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@uc:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb5/igt@i915_pm_rpm@gem-mmap-type@uc.html">DMESG-WARN</a> ([i915#2411])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl3/igt@i915_pm_rpm@gem-mmap-type@uc.html">DMESG-WARN</a> ([i915#3475])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb5/igt@i915_pm_rpm@gem-mmap-type@wc.html">DMESG-WARN</a> ([i915#2411] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk8/igt@i915_pm_rps@reset.html">DMESG-FAIL</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb7/igt@i915_pm_rps@waitboost.html">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl7/igt@i915_pm_sseu@full-enable.html">DMESG-WARN</a> ([i915#3457])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb6/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb8/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb2/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl3/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb3/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-frame-dump:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb5/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +12 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk7/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb6/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-gamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk8/igt@kms_color@pipe-c-gamma.html">FAIL</a> ([i915#71]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb6/igt@kms_color@pipe-d-ctm-max.html">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb8/igt@kms_color_chamelium@pipe-d-gamma.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#111828]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl3/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html">FAIL</a> ([i915#3444] / [i915#3457]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279] / [i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html">FAIL</a> ([i915#3444] / [i915#3457]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-max-size-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-max-size-onscreen.html">SKIP</a> ([fdo#109271] / [i915#3457]) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement.html">SKIP</a> ([i915#3359] / [i915#3457]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-size-change:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-size-change.html">FAIL</a> ([i915#3457]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html">SKIP</a> ([i915#3319] / [i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-256x85-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.html">FAIL</a> ([i915#3457]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb5/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109271] / [i915#3457]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-dpms:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk7/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">FAIL</a> ([i915#3444] / [i915#3457]) +8 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">FAIL</a> ([i915#3457]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-size-change:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">FAIL</a> ([i915#3444] / [i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-128x42-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-128x42-sliding.html">FAIL</a> ([i915#2124] / [i915#3457]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html">SKIP</a> ([fdo#109278] / [i915#3457]) +15 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk1/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html">SKIP</a> ([fdo#109271] / [i915#3457]) +32 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359] / [i915#3457]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl7/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html">SKIP</a> ([fdo#109271] / [i915#3457]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">FAIL</a> ([i915#70]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb3/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html">SKIP</a> ([fdo#109278]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl4/igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge.html">SKIP</a> ([fdo#109271]) +169 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk7/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb5/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb8/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> ([fdo#111825]) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([i915#2587])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> ([fdo#109271]) +196 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109280]) +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +159 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-tglb2/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#110577])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb1/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#109310])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-apl6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> ([fdo#109271]) +85 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-iclb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> ([fdo#109289]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-glk4/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk8/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a.html">FAIL</a> ([i915#2472])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10102/shard-glk5/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk7/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b.html">FAIL</a> ([i915#3192])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-c:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5825/shard-glk6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html">FAIL</a> ([i915#53]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence:</p>
<ul>
<li>shard-glk:</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0773838577061024424==--

--===============1780045914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1780045914==--
