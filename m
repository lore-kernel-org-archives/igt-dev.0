Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1920556940328458400=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Dec 2021 12:20:25 -0000
Message-ID: <164000282508.24545.11898424983425226544@emeril.freedesktop.org>
References: <20211220094153.282527-1-ananya.sharma@intel.com>
In-Reply-To: <20211220094153.282527-1-ananya.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgUmVwbGFj?=
 =?utf-8?q?ing_DRM_calls_in_few_tests=2E?=
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
To: Ananya Sharma <ananya.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1920556940328458400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Replacing DRM calls in few tests.
URL   : https://patchwork.freedesktop.org/series/98226/
State : success

== Summary ==

CI Bug Log - changes from IGT_6314_full -> IGTPW_6507_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_6507_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6507_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6507_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled:
    - shard-snb:          [SKIP][1] ([fdo#109271]) -> [FAIL][2] +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-snb4/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-snb6/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html

  
Known issues
------------

  Here are the changes found in IGTPW_6507_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-3x:
    - shard-iclb:         NOTRUN -> [SKIP][3] ([i915#1839])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb7/igt@feature_discovery@display-3x.html

  * igt@gem_ctx_persistence@engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1099])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-snb4/igt@gem_ctx_persistence@engines-cleanup.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-snb:          [PASS][5] -> [FAIL][6] ([i915#4409])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-snb2/igt@gem_eio@in-flight-contexts-10ms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-snb7/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#4525])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb7/igt@gem_exec_balancer@parallel-contexts.html
    - shard-iclb:         NOTRUN -> [SKIP][8] ([i915#4525])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb3/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2846])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-glk5/igt@gem_exec_fair@basic-deadline.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk7/igt@gem_exec_fair@basic-deadline.html
    - shard-apl:          NOTRUN -> [FAIL][11] ([i915#2846])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][14] ([i915#2842]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#2842]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][19] ([i915#2842]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][20] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][21] ([i915#2842]) +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#2842])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-iclb3/igt@gem_exec_fair@basic-pace@vecs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109283]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb2/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#109283])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb3/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-kbl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#4613]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl4/igt@gem_lmem_swapping@heavy-verify-random.html
    - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#4613]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb3/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl1/igt@gem_lmem_swapping@parallel-multi.html
    - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#4613]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk6/igt@gem_lmem_swapping@parallel-multi.html
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#4613]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb2/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#4270]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb7/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#4270])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb6/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#768]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb4/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109312])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb2/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#109312])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb5/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#3297])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb5/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#3297]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][40] ([i915#2724])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-snb5/igt@gem_userptr_blits@vma-merge.html
    - shard-apl:          NOTRUN -> [FAIL][41] ([i915#3318])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl1/igt@gem_userptr_blits@vma-merge.html
    - shard-iclb:         NOTRUN -> [FAIL][42] ([i915#3318])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb2/igt@gem_userptr_blits@vma-merge.html
    - shard-glk:          NOTRUN -> [FAIL][43] ([i915#3318])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk6/igt@gem_userptr_blits@vma-merge.html
    - shard-tglb:         NOTRUN -> [FAIL][44] ([i915#3318])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb5/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271]) +51 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk3/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109289]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb6/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109289]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb2/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][48] -> [SKIP][49] ([fdo#109271]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#1937])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#1937])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#110892])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#111644] / [i915#1397] / [i915#2411])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#110725] / [fdo#111614])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-glk:          [PASS][55] -> [DMESG-WARN][56] ([i915#118])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-glk4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-glk:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#3777])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3777])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#3777])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111615]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#111615] / [i915#3689]) +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb1/igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#3886]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278] / [i915#3886]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#3886]) +7 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3886]) +8 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl7/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#3689] / [i915#3886]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3689]) +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb3/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@dp-crc-fast:
    - shard-snb:          NOTRUN -> [SKIP][68] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-snb7/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-hpd-storm:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb6/igt@kms_chamelium@dp-hpd-storm.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl1/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-crc-nonplanar-formats:
    - shard-glk:          NOTRUN -> [SKIP][71] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk1/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl3/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109278] / [i915#1149])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb4/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][76] ([i915#1319])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl2/igt@kms_content_protection@lic.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109300] / [fdo#111066])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb4/igt@kms_content_protection@lic.html
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#111828])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb2/igt@kms_content_protection@lic.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][79] ([i915#1319])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl1/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#3319]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109278]) +32 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#3359]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][83] ([i915#180])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-random:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109279] / [i915#3359]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-iclb:         [PASS][86] -> [FAIL][87] ([i915#2370])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-iclb3/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109274] / [fdo#109278]) +3 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#3788])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb8/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109274]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb7/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [PASS][91] -> [FAIL][92] ([i915#79])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
    - shard-iclb:         [PASS][93] -> [SKIP][94] ([i915#3701])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html

  * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-yf-ccs:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][95] ([i915#1226])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl3/igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-yf-ccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([fdo#111825]) +28 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109280]) +27 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          NOTRUN -> [SKIP][98] ([fdo#109271]) +174 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-apl:          NOTRUN -> [SKIP][99] ([fdo#109271]) +117 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl7/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#533])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-kbl:          [PASS][101] -> [DMESG-WARN][102] ([i915#180]) +6 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][103] ([i915#265]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#3536])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb5/igt@kms_plane_lowres@pipe-b-tiling-none.html
    - shard-iclb:         NOTRUN -> [SKIP][105] ([i915#3536])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb1/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([fdo#111615] / [fdo#112054])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([i915#1836])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb5/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-kbl:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#658]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl4/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([i915#1911])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb6/igt@kms_psr2_su@page_flip-nv12.html
    - shard-apl:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#658])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl8/igt@kms_psr2_su@page_flip-nv12.html
    - shard-glk:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#658])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk4/igt@kms_psr2_su@page_flip-nv12.html
    - shard-iclb:         NOTRUN -> [SKIP][112] ([fdo#111068] / [i915#658])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr2_basic:
    - shard-tglb:         NOTRUN -> [FAIL][113] ([i915#132] / [i915#3467])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb6/igt@kms_psr@psr2_basic.html
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109441]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb8/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][115] -> [SKIP][116] ([fdo#109441]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][117] ([IGT#2])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl6/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-snb:          NOTRUN -> [SKIP][118] ([fdo#109271]) +116 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-snb2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][119] -> [DMESG-WARN][120] ([i915#180] / [i915#295])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-a-wait-busy-hang:
    - shard-glk:          [PASS][121] -> [SKIP][122] ([fdo#109271])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-glk9/igt@kms_vblank@pipe-a-wait-busy-hang.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk9/igt@kms_vblank@pipe-a-wait-busy-hang.html

  * igt@nouveau_crc@pipe-a-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][123] ([i915#2530])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb2/igt@nouveau_crc@pipe-a-source-outp-complete.html
    - shard-iclb:         NOTRUN -> [SKIP][124] ([i915#2530])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb6/igt@nouveau_crc@pipe-a-source-outp-complete.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][125] -> [DMESG-WARN][126] ([i915#262] / [i915#2867])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-iclb2/igt@perf_pmu@module-unload.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb3/igt@perf_pmu@module-unload.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-iclb:         NOTRUN -> [SKIP][127] ([fdo#109291]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb1/igt@prime_nv_api@i915_nv_import_vs_close.html

  * igt@prime_nv_pcopy@test3_1:
    - shard-tglb:         NOTRUN -> [SKIP][128] ([fdo#109291])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb8/igt@prime_nv_pcopy@test3_1.html

  * igt@sysfs_clients@sema-25:
    - shard-iclb:         NOTRUN -> [SKIP][129] ([i915#2994]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb7/igt@sysfs_clients@sema-25.html
    - shard-kbl:          NOTRUN -> [SKIP][130] ([fdo#109271] / [i915#2994]) +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl7/igt@sysfs_clients@sema-25.html
    - shard-tglb:         NOTRUN -> [SKIP][131] ([i915#2994]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb7/igt@sysfs_clients@sema-25.html

  * igt@sysfs_clients@split-50:
    - shard-apl:          NOTRUN -> [SKIP][132] ([fdo#109271] / [i915#2994]) +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl3/igt@sysfs_clients@split-50.html
    - shard-glk:          NOTRUN -> [SKIP][133] ([fdo#109271] / [i915#2994]) +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk7/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][134] ([i915#2481] / [i915#3070]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-iclb4/igt@gem_eio@unwedge-stress.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [FAIL][136] ([i915#2842]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-glk8/igt@gem_exec_fair@basic-p

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/index.html

--===============1920556940328458400==
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
<tr><td><b>Series:</b></td><td>Replacing DRM calls in few tests.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98226/">https://patchwork.freedesktop.org/series/98226/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6314_full -&gt; IGTPW_6507_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_6507_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6507_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6507_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-snb4/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-snb6/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html">FAIL</a> +15 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6507_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb7/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-cleanup:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-snb4/igt@gem_ctx_persistence@engines-cleanup.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-snb2/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-snb7/igt@gem_eio@in-flight-contexts-10ms.html">FAIL</a> ([i915#4409])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb7/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4525])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb3/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4525])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-glk5/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-iclb3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb2/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb3/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl4/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb3/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl1/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk6/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb2/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb7/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb6/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb4/igt@gem_render_copy@linear-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb2/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb5/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb5/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb6/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-snb5/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl1/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb2/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk6/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb5/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk3/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> ([fdo#109271]) +51 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb6/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> ([fdo#109289]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb2/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([fdo#109271]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-glk4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb1/igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk5/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl7/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb3/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-snb7/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb6/igt@kms_chamelium@dp-hpd-storm.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl1/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk1/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl3/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb4/igt@kms_color@pipe-d-ctm-max.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl2/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb4/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb2/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#111828])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl1/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html">SKIP</a> ([fdo#109278]) +32 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html">SKIP</a> ([i915#3359]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-iclb3/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> ([i915#2370])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb8/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">SKIP</a> ([i915#3788])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb7/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-yf-ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl3/igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-yf-ccs.html">DMESG-WARN</a> ([i915#1226])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([fdo#111825]) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +174 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl7/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> ([fdo#109271]) +117 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">DMESG-WARN</a> ([i915#180]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-none:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb5/igt@kms_plane_lowres@pipe-b-tiling-none.html">SKIP</a> ([i915#3536])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb1/igt@kms_plane_lowres@pipe-b-tiling-none.html">SKIP</a> ([i915#3536])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html">SKIP</a> ([fdo#111615] / [fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb5/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl4/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#1911])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk4/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb6/igt@kms_psr@psr2_basic.html">FAIL</a> ([i915#132] / [i915#3467])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb8/igt@kms_psr@psr2_basic.html">SKIP</a> ([fdo#109441]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl6/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-snb2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html">SKIP</a> ([fdo#109271]) +116 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180] / [i915#295])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-wait-busy-hang:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-glk9/igt@kms_vblank@pipe-a-wait-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk9/igt@kms_vblank@pipe-a-wait-busy-hang.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb2/igt@nouveau_crc@pipe-a-source-outp-complete.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb6/igt@nouveau_crc@pipe-a-source-outp-complete.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-iclb2/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb3/igt@perf_pmu@module-unload.html">DMESG-WARN</a> ([i915#262] / [i915#2867])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb1/igt@prime_nv_api@i915_nv_import_vs_close.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb8/igt@prime_nv_pcopy@test3_1.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb7/igt@sysfs_clients@sema-25.html">SKIP</a> ([i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-kbl7/igt@sysfs_clients@sema-25.html">SKIP</a> ([fdo#109271] / [i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-tglb7/igt@sysfs_clients@sema-25.html">SKIP</a> ([i915#2994]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-apl3/igt@sysfs_clients@split-50.html">SKIP</a> ([fdo#109271] / [i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-glk7/igt@sysfs_clients@split-50.html">SKIP</a> ([fdo#109271] / [i915#2994]) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-iclb4/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2481] / [i915#3070]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6507/shard-iclb3/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6314/shard-glk8/igt@gem_exec_fair@basic-p">FAIL</a> ([i915#2842]) -&gt; [PASS][137]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1920556940328458400==--
