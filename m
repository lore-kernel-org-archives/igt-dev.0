Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6747748067601554803=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 25 Apr 2022 06:37:31 -0000
Message-ID: <165086865140.32283.14778785338800104549@emeril.freedesktop.org>
References: <20220422072825.11563-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220422072825.11563-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fisolation=2Ec_-_fix_to_poison_CACHE=5FMODE=5F0?=
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

--===============6747748067601554803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_ctx_isolation.c - fix to poison CACHE_MODE_0
URL   : https://patchwork.freedesktop.org/series/102974/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11539_full -> IGTPW_6977_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/index.html

Participating hosts (10 -> 9)
------------------------------

  Additional (3): shard-rkl shard-dg1 shard-tglu 
  Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6977_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_softpin@noreloc-s3:
    - {shard-rkl}:        NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-rkl-4/igt@gem_softpin@noreloc-s3.html
    - {shard-tglu}:       NOTRUN -> [DMESG-WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglu-1/igt@gem_softpin@noreloc-s3.html

  
Known issues
------------

  Here are the changes found in IGTPW_6977_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][3] ([fdo#111827])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb1/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][4] ([fdo#111827])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb7/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#1839])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb7/igt@feature_discovery@display-2x.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][6] ([i915#658])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb1/igt@feature_discovery@psr2.html

  * igt@gem_ccs@block-copy-uncompressed:
    - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#5327]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@gem_ccs@block-copy-uncompressed.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#5325]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb3/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_persistence@legacy-engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1099]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-snb2/igt@gem_ctx_persistence@legacy-engines-persistence.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([i915#280])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@parallel:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][11] ([i915#5076] / [i915#5614]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl1/igt@gem_exec_balancer@parallel.html
    - shard-iclb:         NOTRUN -> [SKIP][12] ([i915#4525])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb7/igt@gem_exec_balancer@parallel.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][13] ([i915#5076] / [i915#5614])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb3/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][14] ([i915#5076] / [i915#5614])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][15] ([i915#2842]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][16] ([i915#2842]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-apl:          NOTRUN -> [FAIL][17] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#2842]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-tglb:         [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][24] ([i915#2842])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-snb:          [PASS][25] -> [SKIP][26] ([fdo#109271]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-snb7/igt@gem_exec_flush@basic-wb-rw-default.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-snb6/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#112283])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb1/igt@gem_exec_params@secure-non-master.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#112283])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb5/igt@gem_exec_params@secure-non-master.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#2190])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl1/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#2190])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk6/igt@gem_huc_copy@huc-copy.html
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#2190])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb3/igt@gem_huc_copy@huc-copy.html
    - shard-kbl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#2190])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#4613])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#4613])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#4613]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#4613])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#4613])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#284])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb3/igt@gem_media_vme.html

  * igt@gem_pread@exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][39] ([i915#2658])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl1/igt@gem_pread@exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][40] ([i915#2658])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb3/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][41] ([i915#2658])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk4/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#4270]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb6/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#4270]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb1/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271]) +308 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([i915#768]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#3323])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3323])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3297])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109289]) +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb7/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][50] -> [DMESG-WARN][51] ([i915#5566] / [i915#716])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk4/igt@gen9_exec_parse@allowed-single.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk4/igt@gen9_exec_parse@allowed-single.html
    - shard-apl:          [PASS][52] -> [DMESG-WARN][53] ([i915#5566] / [i915#716]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl4/igt@gen9_exec_parse@allowed-single.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl7/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#2527] / [i915#2856]) +6 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#2856]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#1904])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109506] / [i915#2411])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#3826])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#1769])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#5286]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#5286]) +7 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          NOTRUN -> [DMESG-WARN][62] ([i915#118])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk3/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111614]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#3777]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3777]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - shard-glk:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#3777]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111615]) +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#110723])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3689]) +5 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb8/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#3886]) +4 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3689] / [i915#3886]) +6 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb2/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#3886]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#3886]) +9 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109278] / [i915#3886]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb8/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#111615] / [i915#3689]) +7 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb6/igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [fdo#111827]) +24 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl7/igt@kms_chamelium@dp-hpd-for-each-pipe.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb3/igt@kms_chamelium@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium@hdmi-crc-single:
    - shard-glk:          NOTRUN -> [SKIP][78] ([fdo#109271] / [fdo#111827]) +10 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk6/igt@kms_chamelium@hdmi-crc-single.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109278] / [i915#1149])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#109284] / [fdo#111827]) +15 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-max.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [fdo#111827]) +10 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-gamma:
    - shard-snb:          NOTRUN -> [SKIP][82] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-snb5/igt@kms_color_chamelium@pipe-d-gamma.html
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb7/igt@kms_color_chamelium@pipe-d-gamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          NOTRUN -> [TIMEOUT][84] ([i915#1319])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#3116])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([i915#3116] / [i915#3299]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [PASS][87] -> [DMESG-WARN][88] ([i915#180]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#3359]) +4 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109278] / [fdo#109279])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109278]) +26 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#3319]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#109279] / [i915#3359]) +5 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#4103]) +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-iclb:         [PASS][96] -> [FAIL][97] ([i915#2346])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:
    - shard-glk:          [PASS][98] -> [FAIL][99] ([i915#1888] / [i915#5160])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#5287]) +3 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#5287]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb4/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:
    - shard-glk:          [PASS][102] -> [DMESG-FAIL][103] ([i915#118] / [i915#1888])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk2/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk7/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109274]) +4 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb8/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#109274] / [fdo#111825]) +14 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb2/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp1:
    - shard-apl:          [PASS][106] -> [FAIL][107] ([i915#79])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([i915#2587])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([i915#2587])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([fdo#109280]) +23 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][111] ([i915#180]) +3 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-apl:          NOTRUN -> [SKIP][112] ([fdo#109271]) +201 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-tglb:         NOTRUN -> [SKIP][113] ([fdo#109280] / [fdo#111825]) +43 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#3555]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#109289]) +4 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb8/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][116] ([i915#265]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][117] ([i915#265])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-kbl:          NOTRUN -> [FAIL][118] ([fdo#108145] / [i915#265])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][119] ([fdo#108145] / [i915#265])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk5/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
    - shard-apl:          NOTRUN -> [FAIL][120] ([fdo#108145] / [i915#265])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-c-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][121] ([i915#5288])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb6/igt@kms_plane_lowres@pipe-c-tiling-4.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([fdo#111615] / [fdo#112054])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale:
    - shard-tglb:         NOTRUN -> [SKIP][123] ([i915#5235]) +3 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale.html

  * igt@kms_plane_scaling@upscale-with-rotation-factor-0-25@pipe-a-edp-1-upscale-with-rotation:
    - shard-tglb:         NOTRUN -> [SKIP][124] ([i915#5176]) +3 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@kms_plane_scaling@upscale-with-rotation-factor-0-25@pipe-a-edp-1-upscale-with-rotation.html

  * igt@kms_plane_scaling@upscale-with-rotation-factor-0-25@pipe-b-edp-1-upscale-with-rotation:
    - shard-iclb:         NOTRUN -> [SKIP][125] ([i915#5176]) +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb8/igt@kms_plane_scaling@upscale-with-rotation-factor-0-25@pipe-b-edp-1-upscale-with-rotation.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][126] ([fdo#109271] / [i915#658])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-tglb:         NOTRUN -> [SKIP][127] ([i915#2920])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-kbl:          NOTRUN -> [SKIP][128] ([fdo#109271] / [i915#658]) +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][129] ([fdo#109271] / [i915#658]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][130] ([fdo#111068] / [i915#658])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_basic:
    - shard-tglb:         NOTRUN -> [FAIL][131] ([i915#132] / [i915#3467]) +3 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb7/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][132] ([fdo#109441])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][133] -> [SKIP][134] ([fdo#109441]) +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb1/igt@kms_psr@psr2_suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         [PASS][135] -> [SKIP][136] ([i915#5519])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-glk:          NOTRUN -> [SKIP][137] ([fdo#109271]) +153 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-snb:          NOTRUN -> [SKIP][138] ([fdo#109271]) +193 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-snb2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][139] ([fdo#109271] / [i915#533]) +2 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-glk:          NOTRUN -> [SKIP][140] ([fdo#109271] / [i915#533]) +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk5/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-apl:          NOTRUN -> [SKIP][141] ([fdo#109271] / [i915#533]) +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][142] ([fdo#109271] / [i915#2437])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk9/igt@kms_writeback@writeback-fb-id.html
    - shard-kbl:          NOTRUN -> [SKIP][143] ([fdo#109271] / [i915#2437])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl3/igt@kms_writeback@writeback-fb-id.html
    - shard-tglb:         NOTRUN -> [SKIP][144] ([i915#2437])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-d-source-rg:
    - shard-tglb:         NOTRUN -> [SKIP][145] ([i915#2530]) +1 similar issue
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb8/igt@nouveau_crc@pipe-d-source-rg.html

  * igt@prime_nv_pcopy@test3_2:
    - shard-iclb:         NOTRUN -> [SKIP][146] ([fdo#109291]) +2 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb8/igt@prime_nv_pcopy@test3_2.html

  * igt@prime_nv_test@i915_import_gtt_mmap:
    - shard-tglb:         NOTRUN -> [SKIP][147] ([fdo#109291]) +4 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@prime_nv_test@i915_import_gtt_mmap.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][148] ([fdo#111656])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb2/igt@prime_vgem@coherency-gtt.html

  * igt@syncobj_wait@wait-for-submit-snapshot:
    - shard-glk:          [PASS][149] -> [FAIL][150] ([i915#5821])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk1/igt@syncobj_wait@wait-for-submit-snapshot.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk3/igt@syncobj_wait@wait-for-submit-snapshot.html

  * igt@sysfs_clients@fair-3:
    - shard-glk:          NOTRUN -> [SKIP][151] ([fdo#109271] / [i915#2994]) +3 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk8/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][152] ([fdo#109271] / [i915#2994]) +2 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl6/igt@sysfs_clients@recycle-many.html
    - shard-iclb:         NOTRUN -> [SKIP][153] ([i915#2994]) +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@split-50:
    - shard-kbl:          NOTRUN -> [SKIP][154] ([fdo#109271] / [i915#2994]) +5 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl3/igt@sysfs_clients@split-50.html
    - shard-tglb:         NOTRUN -> [SKIP][155] ([i915#2994]) +4 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@sysfs_clients@split-50.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-tglb:         NOTRUN -> [SKIP][156] ([fdo#109307])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb7/igt@tools_test@sysfs_l3_parity.html
    - shard-iclb:         NOTRUN -> [SKIP][157] ([fdo#109307])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][158] ([i915#2842]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [FAIL][160] ([i915#2842]) -> [PASS][161] +2 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-snb:          [SKIP][162] ([fdo#109271]) -> [PASS][163] +2 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-snb6/igt@gem_exec_flush@basic-wb-ro-before-default.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-snb4/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][164] ([i915#5566] / [i915#716]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl3/igt@gen9_exec_parse@allowed-all.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [DMESG-WARN][166] ([i915#5591]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-tglb5/igt@i915_selftest@live@hangcheck.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb8/igt@i915_selftest@live@hangcheck.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
    - shard-iclb:         [FAIL][168] ([i915#1888]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb2/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb3/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][170] ([i915#2346] / [i915#533]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [TIMEOUT][172] -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb1/igt@kms_fbcon_fbt@psr-suspend.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a1:
    - shard-glk:          [FAIL][174] ([i915#407]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk8/igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a1.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk9/igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-iclb:         [FAIL][176] ([i915#2546]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][178] ([i915#180]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-glk:          [FAIL][180] ([i915#1888]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk4/igt@kms_plane_lowres@pipe-b-tiling-yf.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk4/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1-planes-upscale-downscale:
    - shard-iclb:         [SKIP][182] ([i915#5235]) -> [PASS][183] +2 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1-planes-upscale-downscale.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1-planes-upscale-downscale.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
    - shard-iclb:         [INCOMPLETE][184] ([i915#5243]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb2/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb8/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][186] ([fdo#109441]) -> [PASS][187] +4 similar issues
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb8/igt@kms_psr@psr2_cursor_render.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         [SKIP][188] ([i915#5519]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][190] ([i915#180]) -> [PASS][191] +1 similar issue
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][192] ([i915#3063] / [i915#3648]) -> [FAIL][193] ([i915#232])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-tglb7/igt@gem_eio@unwedge-stress.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-tglb1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [SKIP][194] ([i915#4525]) -> [DMESG-WARN][195] ([i915#5614])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][196] ([i915#4525]) -> [DMESG-FAIL][197] ([i915#5614])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][198] ([i915#2920]) -> [SKIP][199] ([fdo#111068] / [i915#658])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb4/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][200] ([fdo#111068] / [i915#658]) -> [SKIP][201] ([i915#2920])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][202], [FAIL][203], [FAIL][204], [FAIL][205], [FAIL][206], [FAIL][207]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][208], [FAIL][209], [FAIL][210], [FAIL][211], [FAIL][212], [FAIL][213], [FAIL][214], [FAIL][215]) ([fdo#109271] / [i915#3002] / [i915#4312] / [i915#5257])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl8/igt@runner@aborted.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl7/igt@runner@aborted.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl8/igt@runner@aborted.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl7/igt@runner@aborted.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl6/igt@runner@aborted.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl6/igt@runner@aborted.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl4/igt@runner@aborted.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl2/igt@runner@aborted.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl1/igt@runner@aborted.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl6/igt@runner@aborted.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl3/igt@runner@aborted.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl8/igt@runner@aborted.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl2/igt@runner@aborted.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl7/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][216], [FAIL][217], [FAIL][218], [FAIL][219], [FAIL][220], [FAIL][221], [FAIL][222], [FAIL][223], [FAIL][224], [FAIL][225], [FAIL][226], [FAIL][227], [FAIL][228], [FAIL][229]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716]) -> ([FAIL][230], [FAIL][231], [FAIL][232], [FAIL][233], [FAIL][234], [FAIL][235], [FAIL][236], [FAIL][237], [FAIL][238], [FAIL][239], [FAIL][240], [FAIL][241], [FAIL][242], [FAIL][243]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl3/igt@runner@aborted.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl1/igt@runner@aborted.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl3/igt@runner@aborted.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl1/igt@runner@aborted.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl1/igt@runner@aborted.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl3/igt@runner@aborted.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl7/igt@runner@aborted.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl4/igt@runner@aborted.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl6/igt@runner@aborted.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl6/igt@runner@aborted.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl7/igt@runner@aborted.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl4/igt@runner@aborted.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl6/igt@runner@aborted.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl4/igt@runner@aborted.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl7/igt@runner@aborted.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl3/igt@runner@aborted.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl7/igt@runner@aborted.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl3/igt@runner@aborted.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl7/igt@runner@aborted.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl4/igt@runner@aborted.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl3/igt@runner@aborted.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl1/igt@runner@aborted.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl6/igt@runner@aborted.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl7/igt@runner@aborted.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl7/igt@runner@aborted.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl7/igt@runner@aborted.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl4/igt@runner@aborted.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3648]: https://gitlab.freedesktop.org/drm/intel/issues/3648
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3777]: https://gitlab.freedesktop.org/drm/intel/issues/3777
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4807]: https://gitlab.freedesktop.org/drm/intel/issues/4807
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4886]: https://gitlab.freedesktop.org/drm/intel/issues/4886
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4929]: https://gitlab.freedesktop.org/drm/intel/issues/4929
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
  [i915#5160]: https://gitlab.freedesktop.org/drm/intel/issues/5160
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5243]: https://gitlab.freedesktop.org/drm/intel/issues/5243
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5303]: https://gitlab.freedesktop.org/drm/intel/issues/5303
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5341]: https://gitlab.freedesktop.org/drm/intel/issues/5341
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5691]: https://gitlab.freedesktop.org/drm/intel/issues/5691
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5821]: https://gitlab.freedesktop.org/drm/intel/issues/5821
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6445 -> IGTPW_6977
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11539: 6cb847509fe9aa278324a4f9662df271c42851f8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6977: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/index.html
  IGT_6445: 8c2ac78f0d80a2af3c7b47dd2df064cdd07f24b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/index.html

--===============6747748067601554803==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_ctx_isolation.c - fix to pois=
on CACHE_MODE_0</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/102974/">https://patchwork.freedesktop.org/series/102974/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6977/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11539_full -&gt; IGTPW_6977_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/index.=
html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Additional (3): shard-rkl shard-dg1 shard-tglu <br />
  Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6977=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-rkl-4/igt@gem_softpin@noreloc-s3.html">DMESG-=
WARN</a></p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-tglu-1/igt@gem_softpin@noreloc-s3.html">DMESG=
-WARN</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6977_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-tglb1/igt@feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-iclb7/igt@feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb7/igt@feature_discovery@display-2x.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839"=
>i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb1/igt@feature_discovery@psr2.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#6=
58</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-uncompressed:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@gem_ccs@block-copy-uncompressed.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/53=
27">i915#5327</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb3/igt@gem_ccs@suspend-resume.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#=
5325</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-snb2/igt@gem_ctx_persistence@legacy-engines-=
persistence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@gem_ctx_sseu@mmap-args.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i915#2=
80</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-kbl1/igt@gem_exec_balancer@parallel.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/507=
6">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5614">i915#5614</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-iclb7/igt@gem_exec_balancer@parallel.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i9=
15#4525</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-tglb3/igt@gem_exec_balancer@parallel.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/50=
76">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5614">i915#5614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-kbl3/igt@gem_exec_balancer@parallel-ordering=
.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5076">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5614">i915#5614</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb1/igt@gem_exec_fair@basic-none-rrul@rcs0=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-a=
pl8/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11539/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/sh=
ard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 si=
milar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11539/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/s=
hard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-snb7/igt@gem_exec_flush@basic-wb-rw-default.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/sh=
ard-snb6/igt@gem_exec_flush@basic-wb-rw-default.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-tglb1/igt@gem_exec_params@secure-non-master.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2283">fdo#112283</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-iclb5/igt@gem_exec_params@secure-non-master.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2283">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-apl1/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-glk6/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-iclb3/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#21=
90</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-kbl7/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-iclb2/igt@gem_lmem_swapping@heavy-verify-mult=
i-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-tglb7/igt@gem_lmem_swapping@heavy-verify-mult=
i-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-apl1/igt@gem_lmem_swapping@heavy-verify-multi=
-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi=
-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-kbl4/igt@gem_lmem_swapping@heavy-verify-multi=
-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb3/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-kbl1/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-tglb3/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-glk4/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb6/igt@gem_pxp@create-regular-context-1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb1/igt@gem_pxp@reject-modify-context-prot=
ection-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4270">i915#4270</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-kbl6/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +308 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb1/igt@gem_render_copy@y-tiled-ccs-to-y-t=
iled-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/768">i915#768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-tglb2/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3323"=
>i915#3323</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-kbl6/igt@gem_userptr_blits@dmabuf-sync.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3323">i915#3323</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb1/igt@gem_userptr_blits@dmabuf-unsync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb7/igt@gen7_exec_parse@cmd-crossing-page.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11539/shard-glk4/igt@gen9_exec_parse@allowed-single.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-g=
lk4/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11539/shard-apl4/igt@gen9_exec_parse@allowed-single.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-a=
pl7/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) +1 s=
imilar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527"=
>i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2856">i915#2856</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@gen9_exec_parse@bb-start-out.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856"=
>i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
04">i915#1904</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on=
-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3826">i915#3826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb6/igt@kms_atomic_transition@plane-all-mo=
deset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb6/igt@kms_big_fb@4-tiled-64bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5286">i915#5286</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5286">i915#5286</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-glk3/igt@kms_big_fb@linear-32bpp-rotate-180.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb8/igt@kms_big_fb@linear-8bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-apl3/igt@kms_big_fb@x-tiled-max-hw-stride-32=
bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/3777">i915#3777</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-kbl1/igt@kms_big_fb@y-tiled-max-hw-stride-32b=
pp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3777">i915#3777</a>) +2 similar issu=
es</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-glk8/igt@kms_big_fb@y-tiled-max-hw-stride-32b=
pp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3777">i915#3777</a>) +3 similar issu=
es</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111615">fdo#111615</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb8/igt@kms_ccs@pipe-a-bad-aux-stride-y_ti=
led_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3689">i915#3689</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-glk6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-tglb2/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-apl7/igt@kms_ccs@pipe-a-crc-primary-rotation-=
180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-kbl4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb8/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb6/igt@kms_ccs@pipe-d-crc-primary-rotatio=
n-180-yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689">i915#3689</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-for-each-pipe:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-kbl7/igt@kms_chamelium@dp-hpd-for-each-pipe.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +24 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-iclb3/igt@kms_chamelium@dp-hpd-for-each-pipe.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-single:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-glk6/igt@kms_chamelium@hdmi-crc-single.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@kms_color@pipe-d-ctm-blue-to-red.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-max=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-gamma:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-snb5/igt@kms_color_chamelium@pipe-d-gamma.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-iclb7/igt@kms_color_chamelium@pipe-d-gamma.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-kbl1/igt@kms_content_protection@atomic-dpms.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1319">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb3/igt@kms_content_protection@dp-mst-lic-=
type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@kms_content_protection@dp-mst-type=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3299">i915#3299</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/=
shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x10=
-sliding.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3359">i915#3359</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-32x10=
-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a>) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x32=
-offscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3319">i915#3319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x5=
12-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3359">i915#3359</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb7/igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/4103">i915#4103</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb=
-varying-size.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109278">fdo#109278</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-trans=
itions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_6977/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tra=
nsitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6977/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888"=
>i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5160">i915#5160</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb210101=
0-blt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5287">i915#5287</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-iclb4/igt@kms_draw_crc@draw-method-xrgb210101=
0-blt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5287">i915#5287</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-glk2/igt@kms_draw_crc@draw-method-xrgb8888-render-xtile=
d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6977/shard-glk7/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.h=
tml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb8/igt@kms_flip@2x-dpms-vs-vblank-race.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
274">fdo#109274</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb2/igt@kms_flip@2x-plain-flip.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fdo#=
109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1118=
25">fdo#111825</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977=
/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-yti=
leccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:<=
/p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspen=
d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/180">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +201 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb7/igt@kms_hdr@static-toggle-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i=
915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb8/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-=
with-3-lanes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289">fdo#109289</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-glk5/igt@kms_plane_alpha_blend@pipe-c-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb6/igt@kms_plane_lowres@pipe-c-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-d=
ownscale:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb6/igt@kms_plane_scaling@planes-downscale=
-factor-0-25@pipe-b-edp-1-planes-downscale.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-rotation-factor-0-25@pipe-a-edp-1-ups=
cale-with-rotation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@kms_plane_scaling@upscale-with-rot=
ation-factor-0-25@pipe-a-edp-1-upscale-with-rotation.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +=
3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-rotation-factor-0-25@pipe-b-edp-1-ups=
cale-with-rotation:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb8/igt@kms_plane_scaling@upscale-with-rot=
ation-factor-0-25@pipe-b-edp-1-upscale-with-rotation.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +=
2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-tglb8/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-glk3/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb7/igt@kms_psr@psr2_basic.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i915#132</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3467">i915#=
3467</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-iclb1/igt=
@kms_psr@psr2_suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb8/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_6977/shard-iclb6/igt@kms_psr_stress_test@flip-primary-invalidate=
-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-glk3/igt@kms_rotation_crc@primary-y-tiled-re=
flect-x-270.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a>) +153 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-snb2/igt@kms_universal_plane@disable-primary=
-vs-flip-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +193 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
533">i915#533</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-glk5/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
533">i915#533</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
533">i915#533</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-glk9/igt@kms_writeback@writeback-fb-id.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-kbl3/igt@kms_writeback@writeback-fb-id.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-tglb5/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437"=
>i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-rg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb8/igt@nouveau_crc@pipe-d-source-rg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530"=
>i915#2530</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb8/igt@prime_nv_pcopy@test3_2.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_gtt_mmap:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb5/igt@prime_nv_test@i915_import_gtt_mmap=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109291">fdo#109291</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-tglb2/igt@prime_vgem@coherency-gtt.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111656">fd=
o#111656</a>)</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@wait-for-submit-snapshot:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-glk1/igt@syncobj_wait@wait-for-submit-snapshot.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977=
/shard-glk3/igt@syncobj_wait@wait-for-submit-snapshot.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5821">i915#5821</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-glk8/igt@sysfs_clients@fair-3.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-apl6/igt@sysfs_clients@recycle-many.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
994">i915#2994</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-iclb2/igt@sysfs_clients@recycle-many.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i9=
15#2994</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-kbl3/igt@sysfs_clients@split-50.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-tglb5/igt@sysfs_clients@split-50.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-tglb7/igt@tools_test@sysfs_l3_parity.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109307">f=
do#109307</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-iclb2/igt@tools_test@sysfs_l3_parity.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109307">f=
do#109307</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/=
shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/=
shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-snb6/igt@gem_exec_flush@basic-wb-ro-before-default.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6977/shard-snb4/igt@gem_exec_flush@basic-wb-ro-before-default.html"=
>PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-kbl3/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5=
566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i=
915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6977/shard-kbl6/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-tglb5/igt@i915_selftest@live@hangcheck.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5591">i915=
#5591</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6977/shard-tglb8/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb2/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1888">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6977/shard-iclb3/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2346">i915#2346</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-glk2/igt@kms_cursor_legacy@flip=
-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb1/igt@kms_fbcon_fbt@psr-suspend.html">TIMEOUT</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-i=
clb8/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-glk8/igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/407">i9=
15#407</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6977/shard-glk9/igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a1.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6977/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_6977/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-glk4/igt@kms_plane_lowres@pipe-b-tiling-yf.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1=
888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_69=
77/shard-glk4/igt@kms_plane_lowres@pipe-b-tiling-yf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-b-edp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-b-edp-1-planes-upscale-downscale.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/s=
hard-iclb3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-facto=
r-0-5@pipe-b-edp-1-planes-upscale-downscale.html">PASS</a> +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-=
with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb2/igt@kms_plane_scaling@scaler-with-clipping-clampi=
ng@pipe-b-edp-1-scaler-with-clipping-clamping.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5243">i915#5243</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-ic=
lb8/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler=
-with-clipping-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb8/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/s=
hard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +4 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb7/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_6977/shard-iclb8/igt@kms_psr_stress_test@invalidate-primar=
y-flip-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6977/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.htm=
l">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-tglb7/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3648">i915#36=
48</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_697=
7/shard-tglb1/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/232">i915#232</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525=
">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6977/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
614">i915#5614</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6977/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#=
5614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6977/shard-iclb4/igt@kms_psr2_sf@overlay-plane-update-continuou=
s-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11539/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl7/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11539/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl6/igt@runner@aborted.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/5257">i915#5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6977/shard-apl4/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl=
2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl6/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6977/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl8/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6977/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-apl7/igt@runner@aborted.=
html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl1/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11539/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl1/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11539/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl3/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1539/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl4/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1153=
9/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl6/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/s=
hard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl4/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shar=
d-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11539/shard-kbl4/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5257">i915#5257</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/716">i915#716</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6977/shard-kbl7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl=
3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6977/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl3/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6977/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl4/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6977/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl1/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6=
977/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl7/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/sha=
rd-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6977/shard-kbl7/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/shard-kbl4=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6977/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#18=
0</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i9=
15#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/43=
12">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5257">i915#5257</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6445 -&gt; IGTPW_6977</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11539: 6cb847509fe9aa278324a4f9662df271c42851f8 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_6977: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/index.htm=
l<br />
  IGT_6445: 8c2ac78f0d80a2af3c7b47dd2df064cdd07f24b6 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6747748067601554803==--
