Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6463093118405072529=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Dec 2021 17:27:14 -0000
Message-ID: <163898443471.8234.4045346074133738665@emeril.freedesktop.org>
References: <20211208105446.1410270-1-mastanx.katragadda@intel.com>
In-Reply-To: <20211208105446.1410270-1-mastanx.katragadda@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_balcklist_gem=5Fexec=5Falignment=40pi-shared_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Katragadda, MastanX" <mastanx.katragadda@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6463093118405072529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: balcklist gem_exec_alignment@pi-shared (rev2)
URL   : https://patchwork.freedesktop.org/series/97237/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10973_full -> IGTPW_6477_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6477_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6477_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/index.html

Participating hosts (11 -> 7)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6477_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-apl7/igt@gem_workarounds@suspend-resume.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl8/igt@gem_workarounds@suspend-resume.html

  
Known issues
------------

  Here are the changes found in IGTPW_6477_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-4x:
    - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#1839]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@feature_discovery@display-4x.html
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#1839]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb3/igt@feature_discovery@display-4x.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-snb2/igt@gem_ctx_persistence@processes.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][6] -> [TIMEOUT][7] ([i915#3063] / [i915#3648])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-tglb7/igt@gem_eio@unwedge-stress.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#4525]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb1/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk8/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#2842]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb5/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][14] ([i915#2842]) +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#2849])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#4613]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb2/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-kbl:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#4613]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#4613])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb3/igt@gem_lmem_swapping@verify.html
    - shard-glk:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#4613])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk5/igt@gem_lmem_swapping@verify.html
    - shard-apl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#4613])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl8/igt@gem_lmem_swapping@verify.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#4270]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb1/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#4270]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#768])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#3297]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#3297]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-apl:          NOTRUN -> [SKIP][27] ([fdo#109271]) +77 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl4/igt@gen7_exec_parse@basic-offset.html
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109289]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb5/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109289]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb2/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#2856]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb4/igt@gen9_exec_parse@valid-registers.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#2856]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb6/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][32] ([i915#454])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         NOTRUN -> [WARN][35] ([i915#2681] / [i915#2684])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][36] -> [DMESG-WARN][37] ([i915#180]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-apl1/igt@i915_suspend@sysfs-reader.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          NOTRUN -> [DMESG-WARN][38] ([i915#118])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#111614])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#110725] / [fdo#111614])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111615]) +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#110723]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271]) +116 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#3777])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-kbl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3777])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#3777])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3886]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl8/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109278] / [i915#3886]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3886]) +7 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl4/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#3886]) +5 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3689] / [i915#3886]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb5/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#111615] / [i915#3689]) +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb1/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3689]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb6/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-glk:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk4/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb5/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl4/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-snb6/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl8/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][61] ([i915#2105])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl6/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#111828]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb2/igt@kms_content_protection@uevent.html
    - shard-apl:          NOTRUN -> [FAIL][63] ([i915#2105])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl7/igt@kms_content_protection@uevent.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-glk:          [PASS][65] -> [DMESG-WARN][66] ([i915#118]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3319]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3359]) +6 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109279] / [i915#3359]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][71] ([fdo#109271]) +150 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-snb6/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109278]) +28 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb3/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#4103])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109274]) +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb5/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][76] -> [DMESG-WARN][77] ([i915#180]) +6 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][78] -> [INCOMPLETE][79] ([i915#636])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#2587])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-iclb:         [PASS][81] -> [SKIP][82] ([i915#3701])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-glk:          NOTRUN -> [SKIP][83] ([fdo#109271]) +78 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#111825]) +41 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109280]) +25 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([i915#1187])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb3/igt@kms_hdr@static-toggle-suspend.html
    - shard-iclb:         NOTRUN -> [SKIP][87] ([i915#1187])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][88] ([fdo#108145] / [i915#265])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][89] ([i915#265])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-apl:          NOTRUN -> [FAIL][90] ([i915#265])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][91] ([i915#265])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#3536])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb1/igt@kms_plane_lowres@pipe-b-tiling-none.html
    - shard-iclb:         NOTRUN -> [SKIP][93] ([i915#3536])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb8/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#1836])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb5/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#1836])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb3/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#658]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html
    - shard-glk:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#658]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#2920]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html
    - shard-kbl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#658]) +4 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html
    - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#2920])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#658]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#1911])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2_dpms:
    - shard-tglb:         NOTRUN -> [FAIL][103] ([i915#132] / [i915#3467]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb3/igt@kms_psr@psr2_dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109441]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb6/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][105] -> [SKIP][106] ([fdo#109441])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#533]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-apl:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#533])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl8/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-glk:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#533])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk1/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-check-output:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#2437])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb5/igt@kms_writeback@writeback-check-output.html
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#2437])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb3/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-kbl:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#2437])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-c-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([i915#2530])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb1/igt@nouveau_crc@pipe-c-source-rg.html

  * igt@nouveau_crc@pipe-d-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#2530]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb6/igt@nouveau_crc@pipe-d-source-outp-inactive.html

  * igt@prime_nv_api@i915_nv_double_import:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#109291]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@prime_nv_api@i915_nv_double_import.html

  * igt@prime_udl:
    - shard-iclb:         NOTRUN -> [SKIP][116] ([fdo#109291]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb6/igt@prime_udl.html

  * igt@sysfs_clients@split-10:
    - shard-iclb:         NOTRUN -> [SKIP][117] ([i915#2994])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb3/igt@sysfs_clients@split-10.html
    - shard-tglb:         NOTRUN -> [SKIP][118] ([i915#2994])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb8/igt@sysfs_clients@split-10.html
    - shard-kbl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#2994])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl1/igt@sysfs_clients@split-10.html

  
#### Possible fixes ####

  * igt@drm_import_export@prime:
    - shard-tglb:         [INCOMPLETE][120] ([i915#750]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-tglb5/igt@drm_import_export@prime.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb1/igt@drm_import_export@prime.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][122] ([i915#658]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-iclb6/igt@feature_discovery@psr2.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-apl:          [TIMEOUT][124] ([i915#3063]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-apl2/igt@gem_eio@in-flight-contexts-immediate.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl1/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][126] ([i915#2846]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-kbl3/igt@gem_exec_fair@basic-deadline.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl2/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [FAIL][128] ([i915#2846]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-glk7/igt@gem_exec_fair@basic-deadline.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk9/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [FAIL][130] ([i915#2842]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         [FAIL][132] ([i915#2842]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [DMESG-WARN][134] ([i915#118]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-180.h

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/index.html

--===============6463093118405072529==
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
<tr><td><b>Series:</b></td><td>intel-ci: balcklist gem_exec_alignment@pi-shared (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/97237/">https://patchwork.freedesktop.org/series/97237/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10973_full -&gt; IGTPW_6477_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6477_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6477_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/index.html</p>
<h2>Participating hosts (11 -&gt; 7)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6477_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_workarounds@suspend-resume:<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-apl7/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl8/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6477_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb3/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@processes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-snb2/igt@gem_ctx_persistence@processes.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-tglb7/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#3063] / [i915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb1/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> ([i915#4525]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk8/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb5/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb2/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb3/igt@gem_lmem_swapping@verify.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk5/igt@gem_lmem_swapping@verify.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl8/igt@gem_lmem_swapping@verify.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb1/igt@gem_pxp@create-valid-protected-context.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb2/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl4/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109271]) +77 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb5/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109289]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb2/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb4/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-apl1/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl1/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111614])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111615]) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#110723]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271]) +116 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl8/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl4/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb5/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb1/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb6/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk4/igt@kms_chamelium@hdmi-aspect-ratio.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb5/igt@kms_chamelium@hdmi-cmp-planar-formats.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl4/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-snb6/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl8/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl6/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb2/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#111828]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl7/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb8/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x42-random:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html">DMESG-WARN</a> ([i915#118]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html">SKIP</a> ([i915#3319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen.html">SKIP</a> ([i915#3359]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-snb6/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +150 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb3/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html">SKIP</a> ([fdo#109278]) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb5/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> ([fdo#109274]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">INCOMPLETE</a> ([i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> ([fdo#109271]) +78 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#111825]) +41 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109280]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb3/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-none:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb1/igt@kms_plane_lowres@pipe-b-tiling-none.html">SKIP</a> ([i915#3536])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb8/igt@kms_plane_lowres@pipe-b-tiling-none.html">SKIP</a> ([i915#3536])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb5/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb3/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html">SKIP</a> ([i915#2920]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html">SKIP</a> ([i915#2920])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#1911])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb3/igt@kms_psr@psr2_dpms.html">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb6/igt@kms_psr@psr2_dpms.html">SKIP</a> ([fdo#109441]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl8/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk1/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb5/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb3/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb1/igt@nouveau_crc@pipe-c-source-rg.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-inactive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb6/igt@nouveau_crc@pipe-d-source-outp-inactive.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_import:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb7/igt@prime_nv_api@i915_nv_double_import.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb6/igt@prime_udl.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb3/igt@sysfs_clients@split-10.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb8/igt@sysfs_clients@split-10.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl1/igt@sysfs_clients@split-10.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_import_export@prime:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-tglb5/igt@drm_import_export@prime.html">INCOMPLETE</a> ([i915#750]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-tglb1/igt@drm_import_export@prime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-iclb6/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-apl2/igt@gem_eio@in-flight-contexts-immediate.html">TIMEOUT</a> ([i915#3063]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl1/igt@gem_eio@in-flight-contexts-immediate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-glk7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk9/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-iclb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10973/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6477/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-180.h">PASS</a></li>
</ul>
</li>
</ul>

</body>
</html>

--===============6463093118405072529==--
