Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 09 Jun 2021 20:52:34 -0000
Message-ID: <162327195474.27478.14292512084220773845@emeril.freedesktop.org>
References: <20210609173632.248880-1-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgU3RvcCBk?=
 =?utf-8?q?epending_on_context_mutation_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1998028390=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1998028390==
Content-Type: multipart/alternative;
 boundary="===============4903572371797255520=="

--===============4903572371797255520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Stop depending on context mutation (rev6)
URL   : https://patchwork.freedesktop.org/series/88986/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10198_full -> IGTPW_5906_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5906_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5906_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5906_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_engines@invalid-engines:
    - shard-iclb:         [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-iclb2/igt@gem_ctx_engines@invalid-engines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb4/igt@gem_ctx_engines@invalid-engines.html

  * {igt@gem_ctx_param@invalid-get-engines} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][3] +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk8/igt@gem_ctx_param@invalid-get-engines.html

  * {igt@gem_ctx_param@invalid-set-no-zeromap} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][4] +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb3/igt@gem_ctx_param@invalid-set-no-zeromap.html
    - shard-kbl:          NOTRUN -> [FAIL][5] +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl4/igt@gem_ctx_param@invalid-set-no-zeromap.html
    - shard-snb:          NOTRUN -> [FAIL][6] +5 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb2/igt@gem_ctx_param@invalid-set-no-zeromap.html
    - shard-tglb:         NOTRUN -> [FAIL][7] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb8/igt@gem_ctx_param@invalid-set-no-zeromap.html

  * {igt@gem_ctx_param@invalid-set-ringsize} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl8/igt@gem_ctx_param@invalid-set-ringsize.html

  * igt@gem_ctx_param@vm:
    - shard-glk:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-glk7/igt@gem_ctx_param@vm.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk3/igt@gem_ctx_param@vm.html
    - shard-tglb:         [PASS][11] -> [FAIL][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-tglb2/igt@gem_ctx_param@vm.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb1/igt@gem_ctx_param@vm.html
    - shard-kbl:          [PASS][13] -> [FAIL][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl3/igt@gem_ctx_param@vm.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl2/igt@gem_ctx_param@vm.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10198_full and IGTPW_5906_full:

### New IGT tests (5) ###

  * igt@gem_ctx_param@invalid-get-engines:
    - Statuses : 4 fail(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_ctx_param@invalid-get-no-zeromap:
    - Statuses : 5 fail(s)
    - Exec time: [0.01] s

  * igt@gem_ctx_param@invalid-get-ringsize:
    - Statuses : 5 fail(s)
    - Exec time: [0.00, 0.03] s

  * igt@gem_ctx_param@invalid-set-no-zeromap:
    - Statuses : 5 fail(s)
    - Exec time: [0.00, 0.02] s

  * igt@gem_ctx_param@invalid-set-ringsize:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.11] s

  

Known issues
------------

  Here are the changes found in IGTPW_5906_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_engines@invalid-engines:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#3468])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-glk3/igt@gem_ctx_engines@invalid-engines.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk2/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-apl8/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl8/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#1099]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_shared@create-shared-gtt:
    - shard-snb:          [PASS][20] -> [SKIP][21] ([fdo#109271]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-snb7/igt@gem_ctx_shared@create-shared-gtt.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb5/igt@gem_ctx_shared@create-shared-gtt.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][22] ([i915#3354])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_endless@dispatch@vecs0:
    - shard-iclb:         [PASS][23] -> [INCOMPLETE][24] ([i915#2502])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-iclb1/igt@gem_exec_endless@dispatch@vecs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb4/igt@gem_exec_endless@dispatch@vecs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#2846])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl3/igt@gem_exec_fair@basic-deadline.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][27] ([i915#2842]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][28] ([i915#2842]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][29] ([i915#2842]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#2842])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl2/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#2842]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#109283]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb1/igt@gem_exec_params@no-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109283]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb3/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][36] ([i915#2389])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl1/igt@gem_exec_suspend@basic-s3.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl3/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][39] -> [SKIP][40] ([i915#2190])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-tglb2/igt@gem_huc_copy@huc-copy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb6/igt@gem_huc_copy@huc-copy.html
    - shard-kbl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#2190])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#284])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb8/igt@gem_media_vme.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][43] ([i915#2658])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb5/igt@gem_pwrite@basic-exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][44] ([i915#2658])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3323])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#3297])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#3297])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb7/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][48] ([i915#2724])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb5/igt@gem_userptr_blits@vma-merge.html
    - shard-apl:          NOTRUN -> [FAIL][49] ([i915#3318])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl1/igt@gem_userptr_blits@vma-merge.html
    - shard-iclb:         NOTRUN -> [FAIL][50] ([i915#3318])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb1/igt@gem_userptr_blits@vma-merge.html
    - shard-glk:          NOTRUN -> [FAIL][51] ([i915#3318])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk4/igt@gem_userptr_blits@vma-merge.html
    - shard-kbl:          NOTRUN -> [FAIL][52] ([i915#3318])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl2/igt@gem_userptr_blits@vma-merge.html
    - shard-tglb:         NOTRUN -> [FAIL][53] ([i915#3318])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb7/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109289]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb1/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#112306]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb6/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#112306])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb8/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109303])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb3/igt@i915_query@query-topology-known-pci-ids.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109303])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb4/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][59] ([i915#3462])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl3/igt@i915_selftest@live@execlists.html

  * igt@kms_addfb_basic@no-handle:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][60] ([i915#62])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl6/igt@kms_addfb_basic@no-handle.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-kbl:          [PASS][61] -> [DMESG-WARN][62] ([i915#180] / [i915#1982] / [i915#62])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb3/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111614]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk5/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl2/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [fdo#111827]) +10 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl2/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> [SKIP][68] ([fdo#109271] / [fdo#111827]) +25 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb2/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          NOTRUN -> [TIMEOUT][72] ([i915#1319])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl7/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#109279] / [i915#3359])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen.html
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3319]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#3359])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][77] ([i915#180] / [i915#62]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl6/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][78] ([fdo#109271]) +433 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109278]) +10 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb2/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@pipe-c-forked-move:
    - shard-kbl:          [PASS][81] -> [DMESG-WARN][82] ([i915#62]) +6 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl1/igt@kms_cursor_legacy@pipe-c-forked-move.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl6/igt@kms_cursor_legacy@pipe-c-forked-move.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#533]) +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl3/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         NOTRUN -> [CRASH][84] ([i915#3494])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
    - shard-tglb:         NOTRUN -> [CRASH][85] ([i915#3494])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109274])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][87] -> [FAIL][88] ([i915#79])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][89] ([i915#180]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2672])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-kbl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#2642])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#111615])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb8/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109280]) +11 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#111825]) +14 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][95] ([fdo#109271]) +42 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#1187])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb8/igt@kms_hdr@static-toggle-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#1187])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#110577])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb7/igt@kms_invalid_dotclock.html
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109310])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb7/igt@kms_invalid_dotclock.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#109289]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb6/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_plane@plane-panning-top-left@pipe-b-planes:
    - shard-kbl:          [PASS][101] -> [DMESG-WARN][102] ([i915#180] / [i915#62]) +28 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl6/igt@kms_plane@plane-panning-top-left@pipe-b-planes.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl6/igt@kms_plane@plane-panning-top-left@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][103] ([fdo#108145] / [i915#265]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
    - shard-kbl:          NOTRUN -> [FAIL][104] ([fdo#108145] / [i915#265])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][105] ([i915#265])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#658]) +4 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([i915#658])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html
    - shard-kbl:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#658])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl6/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html
    - shard-glk:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#658])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk6/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html
    - shard-tglb:         NOTRUN -> [SKIP][110] ([i915#2920])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][111] -> [SKIP][112] ([fdo#109642] / [fdo#111068] / [i915#658])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb3/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][113] -> [SKIP][114] ([fdo#109441]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb6/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-tglb:         NOTRUN -> [FAIL][115] ([i915#132] / [i915#3467])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb6/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][116] ([fdo#109271]) +227 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl1/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#2437])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl7/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][118] ([i915#2530])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb1/igt@nouveau_crc@pipe-c-ctx-flip-detection.html
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#2530])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb7/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@prime_nv_api@i915_nv_double_import:
    - shard-tglb:         NOTRUN -> [SKIP][120] ([fdo#109291]) +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb6/igt@prime_nv_api@i915_nv_double_import.html

  * igt@prime_nv_pcopy@test2:
    - shard-kbl:          NOTRUN -> [SKIP][121] ([fdo#109271]) +74 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl4/igt@prime_nv_pcopy@test2.html
    - shard-iclb:         NOTRUN -> [SKIP][122] ([fdo#109291]) +2 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb6/igt@prime_nv_pcopy@test2.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][123] ([fdo#109271] / [i915#2994]) +3 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl6/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@split-10:
    - shard-iclb:         NOTRUN -> [SKIP][124] ([i915#2994])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb5/igt@sysfs_clients@split-10.html
    - shard-tglb:         NOTRUN -> [SKIP][125] ([i915#2994])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb3/igt@sysfs_clients@split-10.html
    - shard-glk:          NOTRUN -> [SKIP][126] ([fdo#109271] / [i915#2994])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk9/igt@sysfs_clients@split-10.html
    - shard-kbl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#2994])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl1/igt@sysfs_clients@split-10.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][128] ([i915#180]) -> [PASS][129] +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [DMESG-WARN][130] ([i915#180]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-apl8/igt@gem_eio@in-flight-suspend.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][132] ([i915#2846]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-glk7/igt@gem_exec_fair@basic-deadline.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][134] ([i915#2842]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-apl:          [SKIP][136] ([fdo#109271]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          [FAIL][138] ([i915#2842]) -> [PASS][139] +1 similar issue
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl3/igt@gem_exec_fair@basic-none@vecs0.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl4/igt@gem_exec_fair@basic-

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/index.html

--===============4903572371797255520==
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
<tr><td><b>Series:</b></td><td>Stop depending on context mutation (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88986/">https://patchwork.freedesktop.org/series/88986/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10198_full -&gt; IGTPW_5906_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5906_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5906_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5906_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-iclb2/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb4/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_ctx_param@invalid-get-engines} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk8/igt@gem_ctx_param@invalid-get-engines.html">FAIL</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_ctx_param@invalid-set-no-zeromap} (NEW):</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb3/igt@gem_ctx_param@invalid-set-no-zeromap.html">FAIL</a> +4 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl4/igt@gem_ctx_param@invalid-set-no-zeromap.html">FAIL</a> +4 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb2/igt@gem_ctx_param@invalid-set-no-zeromap.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb8/igt@gem_ctx_param@invalid-set-no-zeromap.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_ctx_param@invalid-set-ringsize} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl8/igt@gem_ctx_param@invalid-set-ringsize.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@vm:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-glk7/igt@gem_ctx_param@vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk3/igt@gem_ctx_param@vm.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-tglb2/igt@gem_ctx_param@vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb1/igt@gem_ctx_param@vm.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl3/igt@gem_ctx_param@vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl2/igt@gem_ctx_param@vm.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10198_full and IGTPW_5906_full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@gem_ctx_param@invalid-get-engines:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-get-no-zeromap:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-get-ringsize:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.00, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-set-no-zeromap:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@invalid-set-ringsize:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.11] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5906_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-glk3/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk2/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-apl8/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl8/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed-process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@create-shared-gtt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-snb7/igt@gem_ctx_shared@create-shared-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb5/igt@gem_ctx_shared@create-shared-gtt.html">SKIP</a> ([fdo#109271]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb6/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vecs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-iclb1/igt@gem_exec_endless@dispatch@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb4/igt@gem_exec_endless@dispatch@vecs0.html">INCOMPLETE</a> ([i915#2502])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl2/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb1/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb3/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl1/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl3/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-tglb2/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl3/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb8/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb5/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl3/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb7/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb5/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl1/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb1/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk4/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl2/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb7/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb1/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb6/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([fdo#112306]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb8/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb3/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb4/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl3/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@no-handle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl6/igt@kms_addfb_basic@no-handle.html">DMESG-WARN</a> ([i915#62])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#180] / [i915#1982] / [i915#62])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb3/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk5/igt@kms_chamelium@dp-hpd-storm-disable.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl2/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl2/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb2/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl7/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen.html">SKIP</a> ([i915#3319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl6/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html">DMESG-WARN</a> ([i915#180] / [i915#62]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +433 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb2/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html">SKIP</a> ([fdo#109278]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-c-forked-move:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl1/igt@kms_cursor_legacy@pipe-c-forked-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl6/igt@kms_cursor_legacy@pipe-c-forked-move.html">DMESG-WARN</a> ([i915#62]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl3/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">CRASH</a> ([i915#3494])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html">CRASH</a> ([i915#3494])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb5/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb8/igt@kms_flip_tiling@flip-changes-tiling-yf.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#109280]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> ([fdo#111825]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb3/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb7/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#110577])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb7/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#109310])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb6/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-b-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl6/igt@kms_plane@plane-panning-top-left@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl6/igt@kms_plane@plane-panning-top-left@pipe-b-planes.html">DMESG-WARN</a> ([i915#180] / [i915#62]) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> ([i915#658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl6/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk6/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> ([i915#2920])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb3/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb6/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb6/igt@kms_psr@psr2_sprite_mmap_cpu.html">FAIL</a> ([i915#132] / [i915#3467])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl1/igt@kms_vblank@pipe-d-ts-continuation-idle.html">SKIP</a> ([fdo#109271]) +227 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl7/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb1/igt@nouveau_crc@pipe-c-ctx-flip-detection.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb7/igt@nouveau_crc@pipe-c-ctx-flip-detection.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_import:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb6/igt@prime_nv_api@i915_nv_double_import.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl4/igt@prime_nv_pcopy@test2.html">SKIP</a> ([fdo#109271]) +74 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb6/igt@prime_nv_pcopy@test2.html">SKIP</a> ([fdo#109291]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl6/igt@sysfs_clients@fair-7.html">SKIP</a> ([fdo#109271] / [i915#2994]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-iclb5/igt@sysfs_clients@split-10.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb3/igt@sysfs_clients@split-10.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk9/igt@sysfs_clients@split-10.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl1/igt@sysfs_clients@split-10.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-apl8/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl1/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-glk7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-glk2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-apl7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10198/shard-kbl3/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5906/shard-kbl4/igt@gem_exec_fair@basic-">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4903572371797255520==--

--===============1998028390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1998028390==--
