Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2549859460715205050=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Fri, 10 Jun 2022 18:19:57 -0000
Message-ID: <165488519777.16746.17879565423931506198@emeril.freedesktop.org>
References: <20220530083913.23871-1-karthik.b.s@intel.com>
In-Reply-To: <20220530083913.23871-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Fjoiner=3A_Convert_test_to_dynamic_=28rev4=29?=
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

--===============2549859460715205050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_big_joiner: Convert test to dynamic (rev4)
URL   : https://patchwork.freedesktop.org/series/103207/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11730_full -> IGTPW_7245_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7245_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7245_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/index.html

Participating hosts (10 -> 10)
------------------------------

  Additional (3): shard-rkl shard-dg1 shard-tglu 
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7245_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-kbl:          [PASS][1] -> ([PASS][2], [INCOMPLETE][3])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl4/igt@i915_suspend@basic-s3-without-i915.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@i915_suspend@basic-s3-without-i915.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@i915_suspend@basic-s3-without-i915.html

  
Known issues
------------

  Here are the changes found in IGTPW_7245_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglb:         NOTRUN -> ([SKIP][4], [SKIP][5]) ([i915#3555] / [i915#5325])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb5/igt@gem_ccs@ctrl-surf-copy.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb7/igt@gem_ccs@ctrl-surf-copy.html
    - shard-iclb:         NOTRUN -> ([SKIP][6], [SKIP][7]) ([i915#5327])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@gem_ccs@ctrl-surf-copy.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb7/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> ([SKIP][8], [SKIP][9]) ([fdo#109271] / [i915#1099])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb4/igt@gem_ctx_persistence@hostile.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb7/igt@gem_ctx_persistence@hostile.html

  * igt@gem_eio@in-flight-immediate:
    - shard-tglb:         [PASS][10] -> ([TIMEOUT][11], [PASS][12]) ([i915#3063])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-tglb3/igt@gem_eio@in-flight-immediate.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb5/igt@gem_eio@in-flight-immediate.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb7/igt@gem_eio@in-flight-immediate.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         NOTRUN -> ([TIMEOUT][13], [PASS][14]) ([i915#3070])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@gem_eio@unwedge-stress.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@gem_eio@unwedge-stress.html
    - shard-snb:          NOTRUN -> ([FAIL][15], [FAIL][16]) ([i915#3354])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb5/igt@gem_eio@unwedge-stress.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb6/igt@gem_eio@unwedge-stress.html
    - shard-tglb:         NOTRUN -> ([FAIL][17], [FAIL][18]) ([i915#5784])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@gem_eio@unwedge-stress.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [PASS][19] -> ([SKIP][20], [SKIP][21]) ([i915#4525]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb7/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [PASS][22] -> ([PASS][23], [SKIP][24]) ([i915#4525])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][25] -> ([FAIL][26], [PASS][27]) ([i915#2842])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][28] -> ([FAIL][29], [FAIL][30]) ([i915#2842])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         [PASS][31] -> ([FAIL][32], [FAIL][33]) ([i915#2842]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-tglb6/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-glk:          [PASS][34] -> ([FAIL][35], [FAIL][36]) ([i915#2842])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-glk5/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk1/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk4/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-glk:          [PASS][37] -> ([PASS][38], [FAIL][39]) ([i915#2842]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk3/igt@gem_exec_fair@basic-none@vcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk8/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         NOTRUN -> ([FAIL][40], [FAIL][41]) ([i915#2842])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][42] ([i915#2842])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][43] -> ([FAIL][44], [PASS][45]) ([i915#2842]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-snb:          [PASS][46] -> [SKIP][47] ([fdo#109271]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-snb4/igt@gem_exec_flush@basic-uc-rw-default.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb6/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-snb:          [PASS][48] -> ([SKIP][49], [PASS][50]) ([fdo#109271]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-snb5/igt@gem_exec_flush@basic-uc-set-default.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb6/igt@gem_exec_flush@basic-uc-set-default.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb4/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_nop@basic-parallel:
    - shard-glk:          [PASS][51] -> ([DMESG-WARN][52], [PASS][53]) ([i915#118])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-glk6/igt@gem_exec_nop@basic-parallel.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk1/igt@gem_exec_nop@basic-parallel.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk2/igt@gem_exec_nop@basic-parallel.html

  * igt@gem_exec_params@secure-non-root:
    - shard-iclb:         NOTRUN -> ([SKIP][54], [SKIP][55]) ([fdo#112283])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb7/igt@gem_exec_params@secure-non-root.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@gem_exec_params@secure-non-root.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][56] -> ([PASS][57], [SKIP][58]) ([i915#2190])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-tglb1/igt@gem_huc_copy@huc-copy.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-kbl:          NOTRUN -> ([SKIP][59], [SKIP][60]) ([fdo#109271] / [i915#4613])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl6/igt@gem_lmem_swapping@smem-oom.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-iclb:         NOTRUN -> ([SKIP][61], [SKIP][62]) ([i915#4270])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> ([SKIP][63], [SKIP][64]) ([i915#768]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][65] -> ([PASS][66], [DMESG-WARN][67]) ([i915#180]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglb:         NOTRUN -> ([SKIP][68], [SKIP][69]) ([i915#2527] / [i915#2856])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@gen9_exec_parse@bb-chained.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@gen9_exec_parse@bb-chained.html
    - shard-iclb:         NOTRUN -> ([SKIP][70], [SKIP][71]) ([i915#2856])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb5/igt@gen9_exec_parse@bb-chained.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][72] -> ([SKIP][73], [SKIP][74]) ([fdo#109271])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl8/igt@i915_pm_dc@dc9-dpms.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> ([SKIP][75], [SKIP][76]) ([fdo#109303])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb2/igt@i915_query@query-topology-known-pci-ids.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html
    - shard-iclb:         NOTRUN -> ([SKIP][77], [SKIP][78]) ([fdo#109303])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@i915_query@query-topology-known-pci-ids.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@i915_query@query-topology-known-pci-ids.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-glk:          NOTRUN -> ([SKIP][79], [SKIP][80]) ([fdo#109271]) +25 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-tglb:         NOTRUN -> ([SKIP][81], [SKIP][82]) ([i915#5286])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-iclb:         NOTRUN -> ([SKIP][83], [SKIP][84]) ([i915#5286]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-glk:          [PASS][85] -> ([PASS][86], [FAIL][87]) ([i915#5138])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-glk2/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk9/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-iclb:         NOTRUN -> ([SKIP][88], [SKIP][89]) ([fdo#110723])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> ([SKIP][90], [SKIP][91]) ([fdo#109271] / [i915#3886]) +4 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> ([SKIP][92], [SKIP][93]) ([i915#3689]) +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#3886])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl6/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> ([SKIP][95], [SKIP][96]) ([fdo#109271] / [i915#3886])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl3/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl8/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - shard-iclb:         NOTRUN -> ([SKIP][97], [SKIP][98]) ([fdo#109278]) +8 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs.html
    - shard-tglb:         NOTRUN -> ([SKIP][99], [SKIP][100]) ([i915#6095])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb2/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb1/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_chamelium@dp-audio:
    - shard-apl:          NOTRUN -> ([SKIP][101], [SKIP][102]) ([fdo#109271] / [fdo#111827]) +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl7/igt@kms_chamelium@dp-audio.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl8/igt@kms_chamelium@dp-audio.html
    - shard-tglb:         NOTRUN -> ([SKIP][103], [SKIP][104]) ([fdo#109284] / [fdo#111827]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@kms_chamelium@dp-audio.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb5/igt@kms_chamelium@dp-audio.html
    - shard-glk:          NOTRUN -> ([SKIP][105], [SKIP][106]) ([fdo#109271] / [fdo#111827]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk1/igt@kms_chamelium@dp-audio.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk2/igt@kms_chamelium@dp-audio.html
    - shard-iclb:         NOTRUN -> ([SKIP][107], [SKIP][108]) ([fdo#109284] / [fdo#111827]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@kms_chamelium@dp-audio.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_chamelium@dp-audio.html
    - shard-snb:          NOTRUN -> ([SKIP][109], [SKIP][110]) ([fdo#109271] / [fdo#111827])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb6/igt@kms_chamelium@dp-audio.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb4/igt@kms_chamelium@dp-audio.html

  * igt@kms_chamelium@dp-hpd-after-suspend:
    - shard-apl:          NOTRUN -> [SKIP][111] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl4/igt@kms_chamelium@dp-hpd-after-suspend.html

  * igt@kms_chamelium@dp-hpd-with-enabled-mode:
    - shard-kbl:          NOTRUN -> [SKIP][112] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@kms_chamelium@dp-hpd-with-enabled-mode.html

  * igt@kms_color@pipe-b-deep-color:
    - shard-kbl:          NOTRUN -> [SKIP][113] ([fdo#109271]) +35 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@kms_color@pipe-b-deep-color.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> [SKIP][114] ([fdo#109271] / [fdo#111827])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> ([SKIP][115], [SKIP][116]) ([fdo#109271] / [fdo#111827]) +15 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          NOTRUN -> [TIMEOUT][117] ([i915#1319])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl1/igt@kms_content_protection@atomic.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][118] ([i915#1319])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> ([SKIP][119], [SKIP][120]) ([fdo#109279] / [i915#3359])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html
    - shard-iclb:         NOTRUN -> ([SKIP][121], [SKIP][122]) ([fdo#109278] / [fdo#109279])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen:
    - shard-snb:          NOTRUN -> [SKIP][123] ([fdo#109271]) +18 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen:
    - shard-kbl:          NOTRUN -> ([SKIP][124], [SKIP][125]) ([fdo#109271]) +168 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen.html
    - shard-tglb:         NOTRUN -> ([SKIP][126], [SKIP][127]) ([i915#3359]) +2 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][128] ([fdo#109278]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-tglb:         NOTRUN -> ([SKIP][129], [SKIP][130]) ([i915#4103]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][131] -> ([FAIL][132], [PASS][133]) ([i915#2346])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-tglb:         [PASS][134] -> ([PASS][135], [FAIL][136]) ([i915#2346] / [i915#533])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-glk:          [PASS][137] -> ([PASS][138], [FAIL][139]) ([i915#2346] / [i915#533])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> ([SKIP][140], [SKIP][141]) ([fdo#109271] / [i915#533]) +2 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_cursor_legacy@pipe-d-torture-bo.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl6/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-apl:          NOTRUN -> [SKIP][142] ([fdo#109271] / [i915#533])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
    - shard-iclb:         NOTRUN -> ([SKIP][143], [SKIP][144]) ([i915#5287])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb5/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html
    - shard-tglb:         NOTRUN -> ([SKIP][145], [SKIP][146]) ([i915#5287])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][147] -> ([PASS][148], [INCOMPLETE][149]) ([i915#180])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [PASS][150] -> ([FAIL][151], [PASS][152]) ([i915#4767])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-tglb:         NOTRUN -> ([SKIP][153], [SKIP][154]) ([fdo#109274] / [fdo#111825])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-iclb:         NOTRUN -> ([SKIP][155], [SKIP][156]) ([fdo#109274]) +1 similar issue
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-apl:          NOTRUN -> ([SKIP][157], [SKIP][158]) ([fdo#109271]) +42 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl8/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl4/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-tglb:         [PASS][159] -> ([PASS][160], [FAIL][161]) ([i915#79])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
    - shard-apl:          [PASS][162] -> ([FAIL][163], [PASS][164]) ([i915#79])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl6/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][165] -> [DMESG-WARN][166] ([i915#180])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
    - shard-iclb:         [PASS][167] -> ([DMESG-WARN][168], [PASS][169]) ([i915#2867])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb7/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb4/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb8/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-iclb:         [PASS][170] -> ([PASS][171], [SKIP][172]) ([i915#3701]) +1 similar issue
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][173] -> ([DMESG-WARN][174], [PASS][175]) ([i915#180] / [i915#1982])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-tglb:         NOTRUN -> ([SKIP][176], [SKIP][177]) ([fdo#109280] / [fdo#111825]) +1 similar issue
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-snb:          NOTRUN -> ([SKIP][178], [SKIP][179]) ([fdo#109271]) +16 similar issues
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-iclb:         [PASS][180] -> ([FAIL][181], [PASS][182]) ([i915#1888] / [i915#2546])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> ([SKIP][183], [SKIP][184]) ([fdo#109280]) +3 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [PASS][185] -> [FAIL][186] ([i915#1188])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
    - shard-kbl:          [PASS][187] -> ([FAIL][188], [PASS][189]) ([i915#1188])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl7/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          [PASS][190] -> ([DMESG-WARN][191], [PASS][192]) ([i915#180]) +3 similar issues
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-kbl:          NOTRUN -> [FAIL][193] ([fdo#108145] / [i915#265])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-iclb:         [PASS][194] -> ([SKIP][195], [PASS][196]) ([i915#5176]) +1 similar issue
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-iclb:         [PASS][197] -> ([SKIP][198], [SKIP][199]) ([fdo#109642] / [fdo#111068] / [i915#658])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-kbl:          NOTRUN -> ([SKIP][200], [SKIP][201]) ([fdo#109271] / [i915#658]) +2 similar issues
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@kms_psr2_su@page_flip-nv12.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-kbl:          NOTRUN -> [SKIP][202] ([fdo#109271] / [i915#658]) +1 similar issue
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-apl:          NOTRUN -> [SKIP][203] ([fdo#109271] / [i915#658])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-tglb:         NOTRUN -> [FAIL][204] ([i915#132] / [i915#3467])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         NOTRUN -> ([SKIP][205], [SKIP][206]) ([fdo#109441]) +1 similar issue
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][207] -> ([SKIP][208], [SKIP][209]) ([fdo#109441])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb4/igt@kms_psr@psr2_sprite_plane_onoff.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][210] -> ([SKIP][211], [PASS][212]) ([fdo#109441])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb5/igt@kms_psr@psr2_suspend.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-iclb:         NOTRUN -> ([SKIP][213], [SKIP][214]) ([i915#5289])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-tglb:         NOTRUN -> ([SKIP][215], [SKIP][216]) ([i915#5289])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> ([SKIP][217], [SKIP][218]) ([i915#2530])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb1/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html
    - shard-iclb:         NOTRUN -> ([SKIP][219], [SKIP][220]) ([i915#2530])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb4/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb8/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-apl:          NOTRUN -> [SKIP][221] ([fdo#109271]) +14 similar issues
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl1/igt@perf@per-context-mode-unprivileged.html

  * igt@prime_nv_pcopy@test_semaphore:
    - shard-tglb:         NOTRUN -> ([SKIP][222], [SKIP][223]) ([fdo#109291])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@prime_nv_pcopy@test_semaphore.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@prime_nv_pcopy@test_semaphore.html
    - shard-iclb:         NOTRUN -> ([SKIP][224], [SKIP][225]) ([fdo#109291])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb5/igt@prime_nv_pcopy@test_semaphore.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@prime_nv_pcopy@test_semaphore.html

  * igt@sw_sync@sync_merge_same:
    - shard-kbl:          NOTRUN -> ([FAIL][226], [FAIL][227]) ([i915#6140])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@sw_sync@sync_merge_same.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@sw_sync@sync_merge_same.html

  * igt@sysfs_clients@fair-0:
    - shard-iclb:         NOTRUN -> ([SKIP][228], [SKIP][229]) ([i915#2994])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@sysfs_clients@fair-0.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb7/igt@sysfs_clients@fair-0.html

  * igt@sysfs_clients@fair-3:
    - shard-kbl:          NOTRUN -> [SKIP][230] ([fdo#109271] / [i915#2994])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl6/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@recycle-many:
    - shard-kbl:          NOTRUN -> ([SKIP][231], [SKIP][232]) ([fdo#109271] / [i915#2994])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@sysfs_clients@recycle-many.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@drm_read@short-buffer-block:
    - shard-kbl:          [DMESG-WARN][233] ([i915#62] / [i915#92]) -> [PASS][234] +3 similar issues
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl3/igt@drm_read@short-buffer-block.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@drm_read@short-buffer-block.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-apl:          [DMESG-WARN][235] ([i915#180]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][237] ([i915#180]) -> [PASS][238] +4 similar issues
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_capture@pi@rcs0:
    - shard-iclb:         [INCOMPLETE][239] ([i915#3371]) -> ([PASS][240], [PASS][241])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb6/igt@gem_exec_capture@pi@rcs0.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb5/igt@gem_exec_capture@pi@rcs0.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@gem_exec_capture@pi@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][242] ([i915#2842]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [FAIL][244] ([i915#2842]) -> ([PASS][245], [PASS][246]) +1 similar issue
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl1/igt@gem_exec_fair@basic-none@vcs0.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl1/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-snb:          [SKIP][247] ([fdo#109271]) -> [PASS][248] +1 similar issue
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-snb6/igt@gem_exec_flush@basic-uc-ro-default.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb5/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][249] ([i915#454]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [SKIP][251] ([i915#4281]) -> ([PASS][252], [PASS][253])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb8/igt@i915_pm_dc@dc9-dpms.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [DMESG-WARN][254] ([i915#5591]) -> ([PASS][255], [PASS][256])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-tglb5/igt@i915_selftest@live@hangcheck.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb7/igt@i915_selftest@live@hangcheck.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb5/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][257] ([i915#180]) -> ([PASS][258], [PASS][259]) +4 similar issues
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl1/igt@i915_suspend@forcewake.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@i915_suspend@forcewake.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@i915_suspend@forcewake.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1:
    - shard-kbl:          [DMESG-WARN][260] ([i915#62] / [i915#92]) -> ([PASS][261], [PASS][262]) +17 similar issues
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl3/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl6/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          [DMESG-WARN][263] ([i915#180]) -> ([PASS][264], [PASS][265]) +1 similar issue
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl8/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl8/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl4/igt@kms_flip@flip-vs-suspend@b-dp1.html
    - shard-kbl:          [INCOMPLETE][266] ([i915#3614]) -> ([PASS][267], [PASS][268])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl3/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl6/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][269] ([i915#1982] / [i915#62] / [i915#92]) -> ([PASS][270], [PASS][271])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl3/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp1.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp1.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-iclb:         [SKIP][272] ([i915#3701]) -> ([PASS][273], [PASS][274])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-kbl:          [FAIL][275] ([i915#1188]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl3/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-dp-1:
    - shard-kbl:          [SKIP][277] ([fdo#109271]) -> ([PASS][278], [PASS][279])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-dp-1.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-dp-1.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-dp-1.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][280] ([fdo#109441]) -> [PASS][281]
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-tglb:         [FAIL][282] ([i915#5784]) -> ([PASS][283], [FAIL][284]) ([i915#5784])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-tglb3/igt@gem_eio@kms.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@gem_eio@kms.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb5/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][285] ([i915#4525]) -> ([PASS][286], [SKIP][287]) ([i915#4525]) +1 similar issue
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb6/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][288] ([i915#6117]) -> ([SKIP][289], [SKIP][290]) ([i915#4525])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [FAIL][291] ([i915#2842]) -> ([FAIL][292], [PASS][293]) ([i915#2842])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][294] ([i915#2842]) -> ([PASS][295], [FAIL][296]) ([i915#2842])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-iclb:         [FAIL][297] ([i915#2849]) -> ([FAIL][298], [PASS][299]) ([i915#2849])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-snb:          [SKIP][300] ([fdo#109271]) -> ([PASS][301], [SKIP][302]) ([fdo#109271])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-snb6/igt@gem_exec_flush@basic-wb-prw-default.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb4/igt@gem_exec_flush@basic-wb-prw-default.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb6/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][303] ([i915#658]) -> ([SKIP][304], [SKIP][305]) ([i915#588] / [i915#658])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-kbl:          [SKIP][306] ([fdo#109271] / [i915#92]) -> ([SKIP][307], [SKIP][308]) ([fdo#109271]) +14 similar issues
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_color_chamelium@pipe-c-ctm-green-to-red:
    - shard-kbl:          [SKIP][309] ([fdo#109271] / [fdo#111827] / [i915#92]) -> ([SKIP][310], [SKIP][311]) ([fdo#109271] / [fdo#111827])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl3/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [SKIP][312] ([fdo#109271] / [i915#92]) -> ([TIMEOUT][313], [TIMEOUT][314]) ([i915#1319])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl3/igt@kms_content_protection@srm.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_content_protection@srm.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@kms_content_protection@srm.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-iclb:         [SKIP][315] ([i915#3701]) -> ([SKIP][316], [PASS][317]) ([i915#3701])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-dp-1:
    - shard-kbl:          [SKIP][318] ([fdo#109271] / [i915#92]) -> [SKIP][319] ([fdo#109271]) +3 similar issues
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-kbl3/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-dp-1.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-dp-1.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         [SKIP][320] ([i915#2920]) -> ([SKIP][321], [SKIP][322]) ([fdo#111068] / [i915#658])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb5/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][323] ([fdo#111068] / [i915#658]) -> [SKIP][324] ([i915#2920])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][325] ([fdo#111068] / [i915#658]) -> ([SKIP][326], [SKIP][327]) ([fdo#111068] / [i915#2920] / [i915#658]) +1 similar issue
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-iclb:         [SKIP][328] ([i915#658]) -> ([SKIP][329], [SKIP][330]) ([i915#2920] / [i915#658]) +1 similar issue
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][331] ([fdo#109441]) -> ([PASS][332], [SKIP][333]) ([fdo#109441]) +2 similar issues
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][334], [FAIL][335], [FAIL][336], [FAIL][337], [FAIL][338]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][339], [FAIL][340], [FAIL][341], [FAIL][342], [FAIL][343], [FAIL][344], [FAIL][345], [FAIL][346], [FAIL][347], [FAIL][348]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl2/igt@runner@aborted.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl8/igt@runner@aborted.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl3/igt@runner@aborted.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl3/igt@runner@aborted.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl2/igt@runner@aborted.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl8/igt@runner@aborted.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl3/igt@runner@aborted.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl6/igt@runner@aborted.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl3/igt@runner@aborted.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl6/igt@runner@aborted.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl2/igt@runner@aborted.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl8/igt@runner@aborted.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl8/igt@runner@aborted.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl2/igt@runner@aborted.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
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
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
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
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
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
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
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
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3354]: https://gitlab.freedesktop.org/drm/intel/issues/3354
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3371]: https://gitlab.freedesktop.org/drm/intel/issues/3371
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3614]: https://gitlab.freedesktop.org/drm/intel/issues/3614
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3963]: https://gitlab.freedesktop.org/drm/intel/issues/3963
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
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
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4929]: https://gitlab.freedesktop.org/drm/intel/issues/4929
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5264]: https://gitlab.freedesktop.org/drm/intel/issues/5264
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5303]: https://gitlab.freedesktop.org/drm/intel/issues/5303
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6076]: https://gitlab.freedesktop.org/drm/intel/issues/6076
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#6141]: https://gitlab.freedesktop.org/drm/intel/issues/6141
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6510 -> IGTPW_7245
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11730: 5e7f37992081d4600d6329a745ab7edb2ee42bcd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7245: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/index.html
  IGT_6510: dacfa80158d586cd0fe322f25f5275f224a946dd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/index.html

--===============2549859460715205050==
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
<tr><td><b>Series:</b></td><td>tests/kms_big_joiner: Convert test to dynami=
c (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/103207/">https://patchwork.freedesktop.org/series/103207/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7245/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7245/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11730_full -&gt; IGTPW_7245_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7245_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7245_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/index.=
html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>Additional (3): shard-rkl shard-dg1 shard-tglu <br />
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7245=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl4/igt@i915_suspend@basic-s3-without-i915.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/s=
hard-kbl7/igt@i915_suspend@basic-s3-without-i915.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@i915_su=
spend@basic-s3-without-i915.html">INCOMPLETE</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7245_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb5/igt@gem_ccs@ctrl-surf-copy.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-t=
glb7/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@gem_ccs@ctrl-surf-copy.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-i=
clb7/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/5327">i915#5327</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-snb4/igt@gem_ctx_persistence@hostile.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sh=
ard-snb7/igt@gem_ctx_persistence@hostile.html">SKIP</a>) (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-immediate:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-tglb3/igt@gem_eio@in-flight-immediate.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-t=
glb5/igt@gem_eio@in-flight-immediate.html">TIMEOUT</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb7/igt@gem_eio@in-flig=
ht-immediate.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@gem_eio@unwedge-stress.html">TIMEO=
UT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shar=
d-iclb1/igt@gem_eio@unwedge-stress.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3070">i915#3070</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-snb5/igt@gem_eio@unwedge-stress.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-sn=
b6/igt@gem_eio@unwedge-stress.html">FAIL</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3354">i915#3354</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@gem_eio@unwedge-stress.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-t=
glb5/igt@gem_eio@unwedge-stress.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245=
/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb7/igt@ge=
m_exec_balancer@parallel-contexts.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html=
">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7245/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-ic=
lb5/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard=
-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb5/igt@gem_exec_fair@=
basic-flow@rcs0.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245=
/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb8/igt@ge=
m_exec_fair@basic-none-share@rcs0.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11730/shard-tglb6/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sh=
ard-tglb3/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@gem_exe=
c_fair@basic-none-vip@rcs0.html">FAIL</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11730/shard-glk5/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sha=
rd-glk1/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk4/igt@gem_exec_f=
air@basic-none-vip@rcs0.html">FAIL</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-=
glk3/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk8/igt@gem_exec_fair@bas=
ic-none@vcs0.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rc=
s0.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7245/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard=
-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@gem_exec_fair@b=
asic-pace@vecs0.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-snb4/igt@gem_exec_flush@basic-uc-rw-default.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sh=
ard-snb6/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-snb5/igt@gem_exec_flush@basic-uc-set-default.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/=
shard-snb6/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb4/igt@gem_=
exec_flush@basic-uc-set-default.html">PASS</a>) (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +5 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_nop@basic-parallel:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-glk6/igt@gem_exec_nop@basic-parallel.html">PASS</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-gl=
k1/igt@gem_exec_nop@basic-parallel.html">DMESG-WARN</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk2/igt@gem_exec_nop@ba=
sic-parallel.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-iclb7/igt@gem_exec_params@secure-non-root.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_72=
45/shard-iclb6/igt@gem_exec_params@secure-non-root.html">SKIP</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112283">fdo#112283</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/i=
gt@gem_huc_copy@huc-copy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i=
915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-kbl6/igt@gem_lmem_swapping@smem-oom.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sha=
rd-kbl7/igt@gem_lmem_swapping@smem-oom.html">SKIP</a>) (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@gem_pxp@verify-pxp-stale-buf-exec=
ution.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7245/shard-iclb6/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4270">i91=
5#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@gem_render_copy@yf-tiled-to-vebox=
-y-tiled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7245/shard-iclb3/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/768=
">i915#768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sh=
ard-kbl4/igt@gem_workarounds@suspend-resume-fd.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@gem_worka=
rounds@suspend-resume-fd.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/180">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@gen9_exec_parse@bb-chained.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sha=
rd-tglb6/igt@gen9_exec_parse@bb-chained.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-iclb5/igt@gen9_exec_parse@bb-chained.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sha=
rd-iclb1/igt@gen9_exec_parse@bb-chained.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl8/igt@i=
915_pm_dc@dc9-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7245/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a>) (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb2/igt@i915_query@query-topology-known-pc=
i-ids.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7245/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html">SKI=
P</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109303">f=
do#109303</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@i915_query@query-topology-known-pc=
i-ids.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7245/shard-iclb6/igt@i915_query@query-topology-known-pci-ids.html">SKI=
P</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109303">f=
do#109303</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-glk6/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0-hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk2/igt@kms_big_fb@4-tiled-max-hw-=
stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>) (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +25 similar =
issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-0-hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@kms_big_fb@4-tiled-max-h=
w-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-iclb5/igt@kms_big_fb@4-tiled-max-hw-stride-=
64bpp-rotate-180-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-glk2/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sh=
ard-glk9/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk4/igt@kms_big_f=
b@y-tiled-32bpp-rotate-0.html">FAIL</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride=
-64bpp-rotate-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@kms_big_fb@yf-tiled-max-hw-stride=
-64bpp-rotate-0-hflip.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_ccs@pipe-a-missing-ccs-buffer-=
y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-=
basic-4_tiled_dg2_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-p=
lanes-basic-4_tiled_dg2_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-kbl6/igt@kms_ccs@pipe-c-random-ccs-data-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-apl3/igt@kms_ccs@pipe-c-random-ccs-data-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-apl8/igt@kms_ccs@pipe-c-random-ccs-data-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@kms_ccs@pipe-d-crc-primary-basic-4=
_tiled_dg2_rc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_ccs@pipe-d-crc-primary-basic-4_ti=
led_dg2_rc_ccs.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>) +8 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb2/igt@kms_ccs@pipe-d-crc-primary-basic-4=
_tiled_dg2_rc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7245/shard-tglb1/igt@kms_ccs@pipe-d-crc-primary-basic-4_ti=
led_dg2_rc_ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6095">i915#6095</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-audio:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-apl7/igt@kms_chamelium@dp-audio.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-ap=
l8/igt@kms_chamelium@dp-audio.html">SKIP</a>) (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar is=
sues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@kms_chamelium@dp-audio.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-t=
glb5/igt@kms_chamelium@dp-audio.html">SKIP</a>) (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar =
issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-glk1/igt@kms_chamelium@dp-audio.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-gl=
k2/igt@kms_chamelium@dp-audio.html">SKIP</a>) (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar is=
sue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@kms_chamelium@dp-audio.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-i=
clb1/igt@kms_chamelium@dp-audio.html">SKIP</a>) (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar =
issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-snb6/igt@kms_chamelium@dp-audio.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-sn=
b4/igt@kms_chamelium@dp-audio.html">SKIP</a>) (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-after-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-apl4/igt@kms_chamelium@dp-hpd-after-suspend.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@kms_chamelium@dp-hpd-with-enabled-m=
ode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@kms_color@pipe-b-deep-color.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-0-25=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-blu=
e-to-red.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7245/shard-kbl7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html=
">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7245/shard-apl1/igt@kms_content_protection@atomic.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/131=
9">i915#1319</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_content_protection@atomic.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/131=
9">i915#1319</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-sliding.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7245/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding=
.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3359">i915#3359</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-sliding.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7245/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding=
.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-128x42=
-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-32x10-=
onscreen.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7245/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen.htm=
l">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +168 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-32x10=
-onscreen.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7245/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3359">i915#3359</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_cursor_legacy@basic-busy-flip-b=
efore-cursor-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278">fdo#109278</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor-atomic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4103">i915#4103</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7245/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tran=
sitions.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7245/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transiti=
ons.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11730/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@kms_cursor_legacy@flip-vs-curs=
or-atomic-transitions-varying-size.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@kms_cursor_legacy@fl=
ip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11730/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transit=
ions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7245/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor=
-atomic-transitions-varying-size.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk9/igt@kms_cursor_legacy@flip-=
vs-cursor-atomic-transitions-varying-size.html">FAIL</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_cursor_legacy@pipe-d-torture-bo=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7245/shard-kbl6/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a>) (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/533">i915#=
533</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7245/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb21010=
10-blt-4tiled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7245/shard-iclb5/igt@kms_draw_crc@draw-method-xrgb2101010-blt-=
4tiled.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5287">i915#5287</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb21010=
10-blt-4tiled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7245/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-blt-=
4tiled.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5287">i915#5287</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11730/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl1/=
igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.=
html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/180">i915#180</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11730/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/=
igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4767">i915#4767</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb2/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7245/shard-tglb1/igt@kms_flip@2x-flip-vs-expired-vblank-inter=
ruptible.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111825">fdo#111825</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7245/shard-iclb2/igt@kms_flip@2x-flip-vs-expired-vblank-inter=
ruptible.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109274">fdo#109274</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-apl8/igt@kms_flip@2x-nonexisting-fb-interru=
ptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7245/shard-apl4/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SK=
IP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@b-edp1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7245/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interrupt=
ible@b-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7245/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@b-edp1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_724=
5/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl6/igt@k=
ms_flip@flip-vs-expired-vblank@b-dp1.html">PASS</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7245/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb7/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7245/shard-iclb4/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7245/shard-iclb8/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html"=
>PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2867=
">i915#2867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp=
-ytile-downscaling.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp=
-ytile-to-32bpp-ytile-downscaling.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_flip_scaled_crc@f=
lip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3701">i915#3701</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245=
/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl2/i=
gt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7245/shard-tglb2/igt@kms_frontbuffer_tracking@fbc=
psr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-snb4/igt@kms_frontbuffer_tracking@psr-1p-pr=
imscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7245/shard-snb7/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +16 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-=
indfb-move.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-primsc=
rn-spr-indfb-move.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_frontbuffer_tracking@psr-1p-prims=
crn-spr-indfb-move.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/s=
hard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl7/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard=
-kbl3/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@kms_hdr@bpc-swi=
tch@pipe-a-dp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1188">i915#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7245/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMES=
G-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/=
shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">PASS</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a=
>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb6/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-b-edp-1.html">PASS</a> -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@kms_plane_sca=
ling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sha=
rd-iclb1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-fo=
rmats@pipe-b-edp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5176">i915#5176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sh=
ard-iclb6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb7/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a>) (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@kms_psr2_su@page_flip-nv12.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sha=
rd-kbl6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a>) (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_psr2_su@page_flip-xrgb8888.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7245/shard-apl1/igt@kms_psr2_su@page_flip-xrgb8888.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@kms_psr@psr2_cursor_blt.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i915#=
132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3467">=
i915#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_724=
5/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sha=
rd-iclb4/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@kms_psr@ps=
r2_sprite_plane_onoff.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb5/ig=
t@kms_psr@psr2_suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS<=
/a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo=
#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-iclb4/igt@kms_rotation_crc@primary-4-tiled-r=
eflect-x-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7245/shard-iclb8/igt@kms_rotation_crc@primary-4-tiled-reflect-x=
-180.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5289">i915#5289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb1/igt@kms_rotation_crc@primary-4-tiled-r=
eflect-x-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7245/shard-tglb6/igt@kms_rotation_crc@primary-4-tiled-reflect-x=
-180.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5289">i915#5289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb1/igt@nouveau_crc@pipe-a-ctx-flip-skip-c=
urrent-frame.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7245/shard-tglb6/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-f=
rame.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2530">i915#2530</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-iclb4/igt@nouveau_crc@pipe-a-ctx-flip-skip-c=
urrent-frame.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7245/shard-iclb8/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-f=
rame.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-apl1/igt@perf@per-context-mode-unprivileged.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test_semaphore:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-tglb3/igt@prime_nv_pcopy@test_semaphore.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/=
shard-tglb6/igt@prime_nv_pcopy@test_semaphore.html">SKIP</a>) (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-iclb5/igt@prime_nv_pcopy@test_semaphore.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/=
shard-iclb2/igt@prime_nv_pcopy@test_semaphore.html">SKIP</a>) (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sw_sync@sync_merge_same:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@sw_sync@sync_merge_same.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-=
kbl7/igt@sw_sync@sync_merge_same.html">FAIL</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/6140">i915#6140</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@sysfs_clients@fair-0.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-ic=
lb7/igt@sysfs_clients@fair-0.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2994">i915#2994</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-kbl6/igt@sysfs_clients@fair-3.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@sysfs_clients@recycle-many.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sha=
rd-kbl3/igt@sysfs_clients@recycle-many.html">SKIP</a>) (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-block:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl3/igt@drm_read@short-buffer-block.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/92">i915#9=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245=
/shard-kbl7/igt@drm_read@short-buffer-block.html">PASS</a> +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7245/shard-apl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7245/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PAS=
S</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb6/igt@gem_exec_capture@pi@rcs0.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3371">i915#337=
1</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_724=
5/shard-iclb5/igt@gem_exec_capture@pi@rcs0.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@gem_exec_cap=
ture@pi@rcs0.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7245/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-apl1/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/=
shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl1/igt@gem_exec_fa=
ir@basic-none@vcs0.html">PASS</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-snb6/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7245/shard-snb5/igt@gem_exec_flush@basic-uc-ro-default.html">PASS</a> +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb=
2/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-i=
clb8/igt@i915_pm_dc@dc9-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html">=
PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-tglb5/igt@i915_selftest@live@hangcheck.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5591">i915=
#5591</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7245/shard-tglb7/igt@i915_selftest@live@hangcheck.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb5/igt@i91=
5_selftest@live@hangcheck.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl1/igt@i915_suspend@forcewake.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/sha=
rd-kbl1/igt@i915_suspend@forcewake.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@i915_suspend@forcewak=
e.html">PASS</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl3/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/62">i915#62</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/92">i915#92</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7245/shard-kbl1/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_724=
5/shard-kbl6/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html">PASS</a>) =
+17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11730/shard-apl8/igt@kms_flip@flip-vs-suspend@b-dp1.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#=
180</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
245/shard-apl8/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl4/igt@kms_=
flip@flip-vs-suspend@b-dp1.html">PASS</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11730/shard-kbl3/igt@kms_flip@flip-vs-suspend@b-dp1.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3614">i915=
#3614</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7245/shard-kbl6/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@kms_=
flip@flip-vs-suspend@b-dp1.html">PASS</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl3/igt@kms_flip@plain-flip-ts-check-interruptible@a-d=
p1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/62">i915#62</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/92">i915#92</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@kms_flip@plain-flip-ts-check-in=
terruptible@a-dp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_flip@plain-flip-ts-check-interrupt=
ible@a-dp1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64=
bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3701">i915#3701</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@kms_flip_scaled_crc@f=
lip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb3/igt@kms_flip_=
scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">PASS</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl3/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i=
915#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7245/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl3/igt@kms_plane_scaling@planes-downscale-factor-0-75=
@pipe-b-dp-1.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@kms_plane_scaling@planes-down=
scale-factor-0-75@pipe-b-dp-1.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl7/igt@kms_plane_scaling@planes-d=
ownscale-factor-0-75@pipe-b-dp-1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10944=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245=
/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-tglb3/igt@gem_eio@kms.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-tglb6/igt@g=
em_eio@kms.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7245/shard-tglb5/igt@gem_eio@kms.html">FAIL</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb6/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4525">i915#4525</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7245/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fenc=
e.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7245/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i=
915#4525</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i91=
5#6117</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7245/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/=
igt@gem_exec_balancer@parallel-ordering.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/=
shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@gem_exec_fa=
ir@basic-none@vcs1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11730/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#28=
42</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_72=
45/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-glk6/igt@gem_=
exec_fair@basic-throttle@rcs0.html">FAIL</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11730/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#2=
849</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
245/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb8/igt@g=
em_exec_fair@basic-throttle@rcs0.html">PASS</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2849">i915#2849</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-snb6/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7245/shard-snb4/igt@gem_exec_flush@basic-wb-prw-default.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-snb6/i=
gt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a>) (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245=
/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb1/igt@i915_p=
m_dc@dc3co-vpb-simulation.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/588">i915#588</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/92"=
>i915#92</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7245/shard-kbl6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl3/i=
gt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +14 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-green-to-red:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl3/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/92">i915#92</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-kbl3/igt@kms_color_chamelium@pipe-c-ctm-gre=
en-to-red.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7245/shard-kbl7/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.ht=
ml">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl3/igt@kms_content_protection@srm.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245=
/shard-kbl3/igt@kms_content_protection@srm.html">TIMEOUT</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl1/igt@kms_conten=
t_protection@srm.html">TIMEOUT</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/1319">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp=
-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3701">i915#3701</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_flip_scaled_crc@flip=
-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@kms_flip_scaled=
_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3701">i915#3701</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-=
dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-kbl3/igt@kms_plane_scaling@plane-downscale-with-modifie=
rs-factor-0-25@pipe-a-dp-1.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-kbl4/igt@kms_plane_scal=
ing@plane-downscale-with-modifiers-factor-0-25@pipe-a-dp-1.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915=
#2920</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7245/shard-iclb1/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb5/ig=
t@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a>) (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-continuous-s=
f.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-c=
ontinuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-d=
mg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7245/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.ht=
ml">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7245/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dm=
g-area-big-fb.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7245/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-a=
rea-big-fb.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2920">i915#2920</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11730/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
245/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-iclb6/igt@kms=
_psr@psr2_cursor_plane_move.html">SKIP</a>) (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11730/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl8/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11730/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11730/shard-apl3/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11730/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/s=
hard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7245/shard-apl3/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-ap=
l6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7245/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl6/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7245/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl8/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7245/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/shard-apl2/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7245/shard-apl8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257=
</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6510 -&gt; IGTPW_7245</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11730: 5e7f37992081d4600d6329a745ab7edb2ee42bcd @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7245: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7245/index.htm=
l<br />
  IGT_6510: dacfa80158d586cd0fe322f25f5275f224a946dd @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2549859460715205050==--
