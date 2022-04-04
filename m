Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3567805465274532222=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melissa Wen" <mwen@igalia.com>
Date: Mon, 04 Apr 2022 18:12:39 -0000
Message-ID: <164909595901.4272.9402428448644401321@emeril.freedesktop.org>
References: <20220331145344.2503592-1-mwen@igalia.com>
In-Reply-To: <20220331145344.2503592-1-mwen@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Falpha=5Fblend=3A_refactor_alpha-7efc_for_clearer_?=
 =?utf-8?q?validation?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============3567805465274532222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_alpha_blend: refactor alpha-7efc for clearer validation
URL   : https://patchwork.freedesktop.org/series/102026/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11435_full -> IGTPW_6851_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/index.html

Participating hosts (12 -> 9)
------------------------------

  Additional (1): shard-dg1 
  Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 

Known issues
------------

  Here are the changes found in IGTPW_6851_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][1] ([i915#1839])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@feature_discovery@display-2x.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][2] ([i915#658])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb6/igt@feature_discovery@psr2.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-glk:          NOTRUN -> [SKIP][3] ([fdo#109271]) +120 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#5327]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@gem_ccs@suspend-resume.html
    - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#5325]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-massive:
    - shard-apl:          NOTRUN -> [DMESG-WARN][6] ([i915#4991])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl2/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@idempotent:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-snb4/igt@gem_ctx_persistence@idempotent.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#280])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-tglb:         NOTRUN -> [FAIL][9] ([i915#232])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][10] ([i915#5076]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl6/igt@gem_exec_balancer@parallel.html
    - shard-iclb:         NOTRUN -> [DMESG-WARN][11] ([i915#5076])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb4/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([i915#4525])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-iclb4/igt@gem_exec_balancer@parallel-balancer.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][14] ([i915#5076]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@gem_exec_balancer@parallel-keep-in-fence.html
    - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#4525])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb7/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][18] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][19] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk4/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][24] ([i915#2842]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#2842]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-snb:          NOTRUN -> [SKIP][27] ([fdo#109271]) +184 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-snb4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109313])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#109313])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109283])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb8/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109283] / [i915#4877])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb3/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#112283])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb1/igt@gem_exec_params@secure-non-root.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#112283])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@gem_exec_params@secure-non-root.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#4613])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#4270]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb5/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#4270]) +4 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_softpin@allocator-evict-all-engines:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#4171])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-glk1/igt@gem_softpin@allocator-evict-all-engines.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk9/igt@gem_softpin@allocator-evict-all-engines.html

  * igt@gem_softpin@evict-snoop:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#109312])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3297]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#3297])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb7/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109289]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb7/igt@gen7_exec_parse@chained-batch.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#109289]) +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#2527] / [i915#2856]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([i915#2856]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb4/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][46] -> [FAIL][47] ([i915#454])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#4281])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#1937])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#1937])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#1937])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#1902])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109289] / [fdo#111719])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#110892])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109506] / [i915#2411])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([i915#5286]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271]) +229 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#5286]) +6 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111614]) +4 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-apl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#3777]) +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - shard-glk:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#3777]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#110725] / [fdo#111614])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#3777]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-glk:          [PASS][65] -> [DMESG-WARN][66] ([i915#118]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-glk3/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk4/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-glk:          [PASS][67] -> [FAIL][68] ([i915#5138])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-glk4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk1/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#110723]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#111615]) +5 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#2705])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb6/igt@kms_big_joiner@invalid-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#2705])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3689] / [i915#3886]) +5 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#3886]) +7 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#3886]) +10 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109278] / [i915#3886]) +6 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#111615] / [i915#3689]) +7 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#3886]) +10 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl8/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#3689]) +11 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_chamelium@dp-crc-fast:
    - shard-snb:          NOTRUN -> [SKIP][80] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-snb7/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#109284] / [fdo#111827]) +19 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd:
    - shard-glk:          NOTRUN -> [SKIP][82] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk1/igt@kms_chamelium@hdmi-hpd.html

  * igt@kms_color@pipe-b-deep-color:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109278] / [i915#3555])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb8/igt@kms_color@pipe-b-deep-color.html

  * igt@kms_color@pipe-d-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278] / [i915#1149])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@kms_color@pipe-d-gamma.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl3/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-b-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl1/igt@kms_color_chamelium@pipe-b-degamma.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][88] ([i915#1319])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl6/igt@kms_content_protection@atomic.html
    - shard-apl:          NOTRUN -> [TIMEOUT][89] ([i915#1319])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#1063]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#3116] / [i915#3299])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109300] / [fdo#111066])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb7/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][93] ([i915#2105])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109278] / [fdo#109279]) +4 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109278]) +22 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#3319]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#3359]) +10 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#109279] / [i915#3359]) +8 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#4103]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([fdo#109274])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#5287]) +3 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([i915#5287]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([fdo#109274] / [fdo#111825] / [i915#3966])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][105] ([fdo#109274]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([fdo#109274] / [fdo#111825]) +12 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][107] ([i915#180]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl4/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-glk:          [PASS][108] -> [FAIL][109] ([i915#4911])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([fdo#109285])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([fdo#109280]) +24 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([fdo#109280] / [fdo#111825]) +49 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#533]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl3/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html
    - shard-kbl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#533])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl6/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][115] ([fdo#108145] / [i915#265]) +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][116] ([fdo#108145] / [i915#265]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][117] ([fdo#108145] / [i915#265]) +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk5/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([fdo#111615] / [fdo#112054])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_lowres@pipe-c-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#5288]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb3/igt@kms_plane_lowres@pipe-c-tiling-4.html
    - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#5288])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb8/igt@kms_plane_lowres@pipe-c-tiling-4.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-tglb:         NOTRUN -> [SKIP][121] ([i915#3536])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([i915#5176]) +7 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale:
    - shard-iclb:         NOTRUN -> [SKIP][123] ([i915#5235]) +2 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb7/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale.html

  * igt@kms_plane_scaling@scaler-with-rotation-unity-scaling@pipe-b-edp-1-scaler-with-rotation:
    - shard-iclb:         NOTRUN -> [SKIP][124] ([i915#5176]) +5 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@kms_plane_scaling@scaler-with-rotation-unity-scaling@pipe-b-edp-1-scaler-with-rotation.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         NOTRUN -> [SKIP][125] ([i915#1836])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb8/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         NOTRUN -> [SKIP][126] ([i915#1836])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb3/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-apl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#658]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/index.html

--===============3567805465274532222==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_alpha_blend: refactor alpha-7efc for clearer validation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102026/">https://patchwork.freedesktop.org/series/102026/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11435_full -&gt; IGTPW_6851_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/index.html</p>
<h2>Participating hosts (12 -&gt; 9)</h2>
<p>Additional (1): shard-dg1 <br />
  Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6851_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb6/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([fdo#109271]) +120 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#5327]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#5325]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl2/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@idempotent:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-snb4/igt@gem_ctx_persistence@idempotent.html">SKIP</a> ([fdo#109271] / [i915#1099]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@gem_eio@kms.html">FAIL</a> ([i915#232])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl6/igt@gem_exec_balancer@parallel.html">DMESG-WARN</a> ([i915#5076]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb4/igt@gem_exec_balancer@parallel.html">DMESG-WARN</a> ([i915#5076])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-iclb4/igt@gem_exec_balancer@parallel-balancer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@gem_exec_balancer@parallel-keep-in-fence.html">DMESG-WARN</a> ([i915#5076]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb7/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> ([i915#4525])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk4/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-snb4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109271]) +184 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb8/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb3/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283] / [i915#4877])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb1/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl6/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb5/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-evict-all-engines:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-glk1/igt@gem_softpin@allocator-evict-all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk9/igt@gem_softpin@allocator-evict-all-engines.html">FAIL</a> ([i915#4171])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb1/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb7/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb7/igt@gen7_exec_parse@chained-batch.html">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a> ([fdo#109289]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527] / [i915#2856]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb4/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#1902])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289] / [fdo#111719])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#110892])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109506] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#5286]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#109271]) +229 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#5286]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-glk3/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk4/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">DMESG-WARN</a> ([i915#118]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-glk4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk1/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([fdo#110723]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#111615]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl8/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-snb7/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk1/igt@kms_chamelium@hdmi-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb8/igt@kms_color@pipe-b-deep-color.html">SKIP</a> ([fdo#109278] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@kms_color@pipe-d-gamma.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl3/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl1/igt@kms_color_chamelium@pipe-b-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl6/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl2/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#1063]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb7/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#109300] / [fdo#111066])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl3/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement.html">SKIP</a> ([fdo#109278]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen.html">SKIP</a> ([i915#3319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html">SKIP</a> ([i915#3359]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html">SKIP</a> ([i915#5287]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled.html">SKIP</a> ([i915#5287]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([fdo#109274] / [fdo#111825] / [i915#3966])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl4/igt@kms_flip@flip-vs-suspend@b-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11435/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">FAIL</a> ([i915#4911])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> ([fdo#109280]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +49 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl3/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl6/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-glk5/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb7/igt@kms_plane_lowres@pipe-b-tiling-yf.html">SKIP</a> ([fdo#111615] / [fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-4:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb3/igt@kms_plane_lowres@pipe-c-tiling-4.html">SKIP</a> ([i915#5288]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb8/igt@kms_plane_lowres@pipe-c-tiling-4.html">SKIP</a> ([i915#5288])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb6/igt@kms_plane_lowres@pipe-c-tiling-x.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb2/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation.html">SKIP</a> ([i915#5176]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb7/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale.html">SKIP</a> ([i915#5235]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation-unity-scaling@pipe-b-edp-1-scaler-with-rotation:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb3/igt@kms_plane_scaling@scaler-with-rotation-unity-scaling@pipe-b-edp-1-scaler-with-rotation.html">SKIP</a> ([i915#5176]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-iclb8/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6851/shard-tglb3/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3567805465274532222==--
