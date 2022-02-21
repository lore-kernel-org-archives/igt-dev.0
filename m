Return-path: <SRS0=ONlT=TE=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Content-Type: multipart/alternative;
 boundary="===============6781490777252583835=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 21 Feb 2022 20:22:05 -0000
Message-ID: <164547492535.21415.6287187697358735290@emeril.freedesktop.org>
References: <20220221140342.2487679-1-matthew.auld@intel.com>
In-Reply-To: <20220221140342.2487679-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_test/i915/gem=5Fctx=5Fshared?=
 =?utf-8?q?=3A_prefer_gem=5Fmmap=5F=5Fdevice=5Fcoherent?=
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

--===============6781490777252583835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] test/i915/gem_ctx_shared: prefer gem_mmap__device_coherent
URL   : https://patchwork.freedesktop.org/series/100499/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11263_full -> IGTPW_6667_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/index.html

Participating hosts (13 -> 8)
------------------------------

  Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 

Known issues
------------

  Here are the changes found in IGTPW_6667_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-snb4/igt@gem_ctx_persistence@process.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][2] ([i915#280])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@in-flight-immediate:
    - shard-tglb:         [PASS][3] -> [TIMEOUT][4] ([i915#3063])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-tglb6/igt@gem_eio@in-flight-immediate.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb3/igt@gem_eio@in-flight-immediate.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][5] ([i915#3354])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-snb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][6] ([i915#5076])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#2846])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][9] ([i915#2842]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][10] ([i915#2842]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][11] ([i915#2842]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb5/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][12] -> [FAIL][13] ([i915#2842]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][14] ([i915#2842]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#118]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-glk1/igt@gem_exec_suspend@basic-s3@smem.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk7/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#4613]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb5/igt@gem_lmem_swapping@heavy-random.html
    - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#4613]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@gem_lmem_swapping@heavy-random.html
    - shard-apl:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#4613]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl7/igt@gem_lmem_swapping@heavy-random.html
    - shard-glk:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#4613]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk2/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-kbl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#4613]) +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl3/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#111656])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@gem_mmap_gtt@coherency.html
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#109292])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb5/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pread@exhaustion:
    - shard-iclb:         NOTRUN -> [WARN][24] ([i915#2658])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb2/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][25] ([i915#2658])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl7/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#4270]) +4 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4270]) +5 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb2/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][28] ([fdo#109271]) +291 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-glk:          NOTRUN -> [SKIP][29] ([fdo#109271]) +97 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk8/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#768]) +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#3297]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb6/igt@gem_userptr_blits@access-control.html
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#3297]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb5/igt@gem_userptr_blits@access-control.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][33] ([i915#180])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#109289]) +4 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109289]) +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb6/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#2527] / [i915#2856]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb1/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#2856]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb8/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][38] ([i915#454])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][39] ([i915#454])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109293] / [fdo#109506]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109506] / [i915#2411]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#4387])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb6/igt@i915_pm_sseu@full-enable.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#4387])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb3/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109303])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb3/igt@i915_query@query-topology-known-pci-ids.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109303])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb1/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          NOTRUN -> [DMESG-WARN][46] ([i915#180])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl3/igt@i915_suspend@forcewake.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#1769])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb5/igt@kms_atomic_transition@plane-all-modeset-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#1769])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111614]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#3777]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-glk:          NOTRUN -> [SKIP][52] ([fdo#109271] / [i915#3777])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#3777]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#111615]) +6 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#110723]) +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#3886]) +6 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111615] / [i915#3689]) +9 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#3689] / [i915#3886]) +7 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb5/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#3886]) +16 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl1/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#3886]) +6 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278] / [i915#3886]) +13 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3689]) +4 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb6/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_chamelium@dp-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [fdo#111827]) +10 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl4/igt@kms_chamelium@dp-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-crc-single:
    - shard-glk:          NOTRUN -> [SKIP][64] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk4/igt@kms_chamelium@hdmi-crc-single.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109278] / [i915#1149]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb3/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-snb:          NOTRUN -> [SKIP][67] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109284] / [fdo#111827]) +14 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb7/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#109284] / [fdo#111827]) +15 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][71] ([i915#1319])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl6/igt@kms_content_protection@atomic.html
    - shard-apl:          NOTRUN -> [TIMEOUT][72] ([i915#1319])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl8/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content_type_change:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb3/igt@kms_content_protection@content_type_change.html
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#1063]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb3/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#3116]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#3116] / [i915#3299]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#109279] / [i915#3359]) +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109278]) +51 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109278] / [fdo#109279]) +4 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#3319]) +4 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-max-size-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#3359]) +9 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-max-size-sliding.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109274] / [fdo#109278]) +4 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([i915#426])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#426])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb6/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109274]) +8 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb8/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][86] -> [FAIL][87] ([i915#79])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#109274] / [fdo#111825]) +14 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          [PASS][89] -> [DMESG-WARN][90] ([i915#180]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl1/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#2587])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-iclb:         [PASS][92] -> [SKIP][93] ([i915#3701])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-iclb4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][94] ([fdo#109271]) +186 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109280]) +43 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([fdo#109280] / [fdo#111825]) +47 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][97] -> [DMESG-WARN][98] ([i915#180]) +5 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#1187])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb1/igt@kms_hdr@static-toggle-suspend.html
    - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#1187])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([i915#4278])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb1/igt@kms_invalid_mode@clock-too-high.html
    - shard-iclb:         NOTRUN -> [SKIP][102] ([i915#4278])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb8/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#533]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#533])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#533]) +4 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl7/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][106] ([fdo#108145] / [i915#265]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-glk:          NOTRUN -> [FAIL][107] ([fdo#108145] / [i915#265])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][108] ([fdo#108145] / [i915#265]) +4 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([i915#3536]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb3/igt@kms_plane_lowres@pipe-a-tiling-none.html
    - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#3536]) +2 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb1/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_plane_lowres@pipe-a-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][111] ([fdo#111615] / [fdo#112054])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-yf.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#2920]) +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb1/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-glk:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#658]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk4/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#111068] / [i915#658]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-apl:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#658]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglb:         NOTRUN -> [SKIP][116] ([i915#1911])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-kbl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#658]) +4 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-tglb:         NOTRUN -> [FAIL][118] ([i915#132] / [i915#3467]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         NOTRUN -> [SKIP][119] ([fdo#109441]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb7/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][120] -> [SKIP][121] ([fdo#109441])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb8/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([i915#5030]) +3 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb2/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][123] ([i915#5030]) +2 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb4/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][124] -> [FAIL][125] ([i915#31])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-apl7/igt@kms_setmode@basic.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl1/igt@kms_setmode@basic.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][126] ([fdo#109309])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@kms_tv_load_detect@load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][127] ([fdo#109309])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][128] ([fdo#109271] / [i915#2437])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk7/igt@kms_writeback@writeback-fb-id.html
    - shard-apl:          NOTRUN -> [SKIP][129] ([fdo#109271] / [i915#2437])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl1/igt@kms_writeback@writeback-fb-id.html
    - shard-iclb:         NOTRUN -> [SKIP][130] ([i915#2437])
   [130]: https://intel-gfx-ci.01.org/tree/dr

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/index.html

--===============6781490777252583835==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] test/i915/gem_ctx_shared: prefer gem_mmap__device_coherent</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100499/">https://patchwork.freedesktop.org/series/100499/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11263_full -&gt; IGTPW_6667_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/index.html</p>
<h2>Participating hosts (13 -&gt; 8)</h2>
<p>Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6667_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-snb4/igt@gem_ctx_persistence@process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-immediate:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-tglb6/igt@gem_eio@in-flight-immediate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb3/igt@gem_eio@in-flight-immediate.html">TIMEOUT</a> ([i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-snb7/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl3/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL</a> ([i915#5076])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb5/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-glk1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk7/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> ([i915#118]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb5/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl7/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk2/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl3/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([fdo#109271] / [i915#4613]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#111656])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb5/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#109292])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#4270]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb2/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> ([i915#4270]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +291 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk8/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html">SKIP</a> ([fdo#109271]) +97 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb6/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb5/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@gen3_render_tiledy_blits.html">SKIP</a> ([fdo#109289]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb6/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> ([fdo#109289]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb1/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb8/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb6/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb3/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb3/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb1/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl3/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb5/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> ([fdo#111615]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#110723]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb5/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl1/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb6/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl4/igt@kms_chamelium@dp-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-single:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk4/igt@kms_chamelium@hdmi-crc-single.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb3/igt@kms_color@pipe-d-ctm-max.html">SKIP</a> ([fdo#109278] / [i915#1149]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb7/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +15 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl6/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl8/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb3/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb3/igt@kms_content_protection@content_type_change.html">SKIP</a> ([i915#1063]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116] / [i915#3299]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement.html">SKIP</a> ([fdo#109278]) +51 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen.html">SKIP</a> ([i915#3319]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-max-size-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-max-size-sliding.html">SKIP</a> ([i915#3359]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb6/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb8/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([fdo#109274]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl1/igt@kms_flip@flip-vs-suspend@b-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-iclb4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> ([fdo#109271]) +186 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +47 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> ([i915#180]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb1/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> ([i915#4278])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb8/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> ([i915#4278])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl7/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-none:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb3/igt@kms_plane_lowres@pipe-a-tiling-none.html">SKIP</a> ([i915#3536]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb1/igt@kms_plane_lowres@pipe-a-tiling-none.html">SKIP</a> ([i915#3536]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-yf.html">SKIP</a> ([fdo#111615] / [fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb1/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([i915#2920]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk4/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#1911])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-kbl6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@kms_psr@psr2_cursor_mmap_gtt.html">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb7/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-iclb2/igt@kms_psr@psr2_primary_blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb8/igt@kms_psr@psr2_primary_blt.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb2/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html">SKIP</a> ([i915#5030]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb4/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html">SKIP</a> ([i915#5030]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/shard-apl7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl1/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-tglb7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-iclb7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-glk7/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6667/shard-apl1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/dr">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6781490777252583835==--
