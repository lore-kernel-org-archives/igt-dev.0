Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Content-Type: multipart/alternative;
 boundary="===============4468722180316471733=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Tue, 22 Feb 2022 15:57:50 -0000
Message-ID: <164554547020.23044.9843783176243977331@emeril.freedesktop.org>
References: <20220218194651.25977-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20220218194651.25977-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/api=5Fintel=5Fallocator=3A_change_copy_instruction_for_new?=
 =?utf-8?q?_gens?=
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

--===============4468722180316471733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/api_intel_allocator: change copy instruction for new gens
URL   : https://patchwork.freedesktop.org/series/100424/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11251_full -> IGTPW_6654_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/index.html

Participating hosts (13 -> 8)
------------------------------

  Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 

Known issues
------------

  Here are the changes found in IGTPW_6654_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-snb2/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][2] ([i915#5076])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_capture@pi@vecs0:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][3] ([i915#1373] / [i915#3371])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@gem_exec_capture@pi@vecs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][4] ([i915#2842]) +5 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][5] ([i915#2842])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk4/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-tglb:         NOTRUN -> [FAIL][6] ([i915#2842]) +5 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-kbl:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#4613]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl4/igt@gem_lmem_swapping@heavy-verify-random.html
    - shard-tglb:         NOTRUN -> [SKIP][12] ([i915#4613]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb6/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-iclb:         NOTRUN -> [SKIP][13] ([i915#4613])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb3/igt@gem_lmem_swapping@random-engines.html
    - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#4613])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl8/igt@gem_lmem_swapping@random-engines.html
    - shard-glk:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#4613])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk9/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#4270]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#768]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb3/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109312])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#109312])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb6/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#3297])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][21] ([i915#4991])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@gem_userptr_blits@input-checking.html
    - shard-iclb:         NOTRUN -> [DMESG-WARN][22] ([i915#4991])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb7/igt@gem_userptr_blits@input-checking.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][23] ([i915#4991])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl7/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#3297]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#109289])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@gen7_exec_parse@basic-rejected.html
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109289])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@gen7_exec_parse@basic-rejected.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [PASS][27] -> [TIMEOUT][28] ([i915#3953])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-tglb1/igt@i915_module_load@reload-with-fault-injection.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#1904])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#658])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109293] / [fdo#109506])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109506] / [i915#2411])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#111644] / [i915#1397] / [i915#2411])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#110892])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-kbl4/igt@i915_suspend@sysfs-reader.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#1769])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [PASS][39] -> [DMESG-WARN][40] ([i915#118]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111614]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#3777]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#3777])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111615]) +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3777]) +5 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#3886]) +15 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109278] / [i915#3886]) +6 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3886]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk2/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3886]) +7 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl4/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3689] / [i915#3886]) +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3689]) +5 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#111615] / [i915#3689]) +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb3/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl2/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109278] / [i915#1149]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb2/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk9/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109284] / [fdo#111827]) +13 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-max.html

  * igt@kms_content_protection@content_type_change:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109300] / [fdo#111066]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb8/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#3116] / [i915#3299])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-glk:          NOTRUN -> [SKIP][62] ([fdo#109271]) +60 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk7/igt@kms_content_protection@srm.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][63] ([i915#1319])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][64] ([i915#1319])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#1063]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][66] ([i915#180]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3359]) +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#3319])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#109279] / [i915#3359]) +6 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109278]) +23 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#4103])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#533])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl4/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][74] -> [FAIL][75] ([i915#5160])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109274]) +4 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#109274] / [fdo#111825]) +12 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb3/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [PASS][78] -> [DMESG-WARN][79] ([i915#180]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#2587])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-glk:          [PASS][81] -> [FAIL][82] ([i915#4911])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][83] -> [DMESG-WARN][84] ([i915#180] / [i915#1982])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109280]) +14 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-snb:          NOTRUN -> [SKIP][86] ([fdo#109271]) +116 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-snb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#109280] / [fdo#111825]) +29 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271]) +259 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#1187])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#1839]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#533]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][92] ([fdo#108145] / [i915#265]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-glk:          NOTRUN -> [FAIL][93] ([fdo#108145] / [i915#265])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][94] ([i915#265])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][95] ([i915#265])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][96] ([fdo#108145] / [i915#265]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_lowres@pipe-d-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#3536])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-none.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#111615] / [fdo#112054]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#1911])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@kms_psr2_su@page_flip-nv12.html
    - shard-apl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#658]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl7/igt@kms_psr2_su@page_flip-nv12.html
    - shard-glk:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#658]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk5/igt@kms_psr2_su@page_flip-nv12.html
    - shard-iclb:         NOTRUN -> [FAIL][102] ([i915#4148])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html
    - shard-kbl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#658]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr2_basic:
    - shard-tglb:         NOTRUN -> [FAIL][104] ([i915#132] / [i915#3467]) +4 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb3/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][105] -> [SKIP][106] ([fdo#109441]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109441]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-d-wait-forked-hang:
    - shard-apl:          NOTRUN -> [SKIP][108] ([fdo#109271]) +138 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl7/igt@kms_vblank@pipe-d-wait-forked-hang.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2437])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl3/igt@kms_writeback@writeback-check-output.html
    - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#2437])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@kms_writeback@writeback-check-output.html
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#2437])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#2437])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk7/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-kbl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#2437]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-d-source-rg:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#2530])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@nouveau_crc@pipe-d-source-rg.html

  * igt@prime_nv_pcopy@test1_macro:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#109291]) +6 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@prime_nv_pcopy@test1_macro.html

  * igt@prime_nv_pcopy@test3_3:
    - shard-iclb:         NOTRUN -> [SKIP][116] ([fdo#109291]) +6 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@prime_nv_pcopy@test3_3.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#109295])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb4/igt@prime_vgem@fence-flip-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][118] ([fdo#109295])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb5/igt@prime_vgem@fence-flip-hang.html

  * igt@syncobj_timeline@invalid-transfer-non-existent-point:
    - shard-apl:          NOTRUN -> [DMESG-WARN][119] ([i915#5098])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl7/igt@syncobj_timeline@invalid-transfer-non-existent-point.html

  * igt@syncobj_timeline@transfer-timeline-point:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][120] ([i915#5098])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl7/igt@syncobj_timeline@transfer-timeline-point.html

  * igt@sysfs_clients@fair-7:
    - shard-kbl:          NOTRUN -> [SKIP][121] ([fdo#109271] / [i915#2994])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@sysfs_clients@fair-7.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@many-contexts:
    - shard-tglb:         [FAIL][122] ([i915#2410]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-tglb1/igt@gem_ctx_persistence@many-contexts.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb6/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-snb:          [FAIL][124] ([i915#4409]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-snb7/igt@gem_eio@in-flight-contexts-1us.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-snb7/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-kbl:          [FAIL][126] ([i915#2842]) -> [PASS][127] +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-kbl3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-iclb:         [FAIL][128] ([i915#2842]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [FAIL][130] ([i915#2842]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-glk9/igt@gem_exec_fair@basic-none@rcs0.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][132] ([i915#2849]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-iclb5/igt@gem_exec_fai

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/index.html

--===============4468722180316471733==
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
<tr><td><b>Series:</b></td><td>tests/i915/api_intel_allocator: change copy instruction for new gens</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100424/">https://patchwork.freedesktop.org/series/100424/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11251_full -&gt; IGTPW_6654_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/index.html</p>
<h2>Participating hosts (13 -&gt; 8)</h2>
<p>Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6654_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-snb2/igt@gem_ctx_persistence@engines-hostile.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@gem_exec_balancer@parallel-keep-in-fence.html">DMESG-WARN</a> ([i915#5076])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vecs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@gem_exec_capture@pi@vecs0.html">INCOMPLETE</a> ([i915#1373] / [i915#3371])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl4/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb6/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([i915#4613]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb3/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl8/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk9/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb3/igt@gem_render_copy@linear-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb6/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb7/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl7/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-tglb1/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.html">TIMEOUT</a> ([i915#3953])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#1904])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-kbl4/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +15 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk2/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl4/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb3/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl2/igt@kms_chamelium@hdmi-audio.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb2/igt@kms_color@pipe-d-ctm-0-5.html">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +7 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk9/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-max.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb8/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk7/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#109271]) +60 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl1/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#1063]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html">SKIP</a> ([i915#3359]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html">SKIP</a> ([fdo#109278]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl4/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html">FAIL</a> ([i915#5160])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> ([fdo#109274]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb3/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">FAIL</a> ([i915#4911])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> ([i915#180] / [i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109280]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-snb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> ([fdo#109271]) +116 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +259 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb2/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#1839]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-none.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-yf.html">SKIP</a> ([fdo#111615] / [fdo#112054]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#1911])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html">FAIL</a> ([i915#4148])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb3/igt@kms_psr@psr2_basic.html">FAIL</a> ([i915#132] / [i915#3467]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-hang:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl7/igt@kms_vblank@pipe-d-wait-forked-hang.html">SKIP</a> ([fdo#109271]) +138 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl3/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb6/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk7/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-rg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb7/igt@nouveau_crc@pipe-d-source-rg.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_macro:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb8/igt@prime_nv_pcopy@test1_macro.html">SKIP</a> ([fdo#109291]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb1/igt@prime_nv_pcopy@test3_3.html">SKIP</a> ([fdo#109291]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb4/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb5/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-transfer-non-existent-point:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl7/igt@syncobj_timeline@invalid-transfer-non-existent-point.html">DMESG-WARN</a> ([i915#5098])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@transfer-timeline-point:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-apl7/igt@syncobj_timeline@transfer-timeline-point.html">DMESG-FAIL</a> ([i915#5098])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@sysfs_clients@fair-7.html">SKIP</a> ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-tglb1/igt@gem_ctx_persistence@many-contexts.html">FAIL</a> ([i915#2410]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-tglb6/igt@gem_ctx_persistence@many-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-snb7/igt@gem_eio@in-flight-contexts-1us.html">FAIL</a> ([i915#4409]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-snb7/igt@gem_eio@in-flight-contexts-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-kbl3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-kbl3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-glk9/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6654/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11251/shard-iclb5/igt@gem_exec_fai">FAIL</a> ([i915#2849]) -&gt; [PASS][133]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4468722180316471733==--
