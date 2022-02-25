Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2758291706783477552=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Fri, 25 Feb 2022 09:23:49 -0000
Message-ID: <164578102972.6269.132900047388888923@emeril.freedesktop.org>
References: <20220223133422.17032-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220223133422.17032-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=3AExtend_kms=5Ffrontbuffer=5Ftracking_to_test_FBC_on_multi?=
 =?utf-8?q?ple_pipes_=28rev5=29?=
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

--===============2758291706783477552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915:Extend kms_frontbuffer_tracking to test FBC on multiple pipes (rev5)
URL   : https://patchwork.freedesktop.org/series/99985/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11272_full -> IGTPW_6686_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_6686_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6686_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/index.html

Participating hosts (12 -> 8)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-dg1 pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6686_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][1] ([i915#180]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_6686_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][3] ([i915#4991])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl1/igt@gem_create@create-massive.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][4] ([i915#4991])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb6/igt@gem_create@create-massive.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][5] ([i915#4991])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl4/igt@gem_create@create-massive.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][6] ([fdo#109314])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb6/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-iclb:         NOTRUN -> [SKIP][7] ([fdo#109314])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb3/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099]) +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][9] ([i915#280])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-tglb:         [PASS][10] -> [TIMEOUT][11] ([i915#3063])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][12] ([i915#5076])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl3/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][13] ([i915#5076])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2846])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-glk4/igt@gem_exec_fair@basic-deadline.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk9/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][16] -> [FAIL][17] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][20] ([i915#2842]) +6 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][21] ([i915#2842]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         NOTRUN -> [FAIL][22] ([i915#2842]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb6/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-kbl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#4613]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl1/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-apl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#4613]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl7/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#4613])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb6/igt@gem_lmem_swapping@random-engines.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#4613]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#111656])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@gem_mmap_gtt@coherency.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109292])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb1/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#4270]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#4270]) +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#768]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@allocator-evict-all-engines:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#4171])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-glk8/igt@gem_softpin@allocator-evict-all-engines.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk8/igt@gem_softpin@allocator-evict-all-engines.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109312])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb5/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#109312])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][36] ([i915#180])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#3323])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl3/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#3323])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb8/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#3323])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3323])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#3297])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#3297])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-kbl1/igt@gem_workarounds@suspend-resume.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl1/igt@gem_workarounds@suspend-resume.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109289]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb5/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#2527] / [i915#2856]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb7/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#2856])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb4/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#1937])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271]) +169 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl1/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111644] / [i915#1397] / [i915#2411])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#110892])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#109303])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109302])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb6/igt@i915_query@query-topology-unsupported.html
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109302])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@mock@hugepages:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][55] ([i915#5123])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@i915_selftest@mock@hugepages.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][56] ([i915#5123])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl4/igt@i915_selftest@mock@hugepages.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3826])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([i915#3826])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111614]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb7/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-glk:          [PASS][61] -> [DMESG-WARN][62] ([i915#118]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-glk7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-apl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#3777]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#110723])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#111615]) +8 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#3777]) +7 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#3777]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#2705]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb5/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#2705]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb7/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#111615] / [i915#3689]) +8 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3689] / [i915#3886]) +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#3886]) +17 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl7/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109278] / [i915#3886]) +6 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#3886]) +8 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#3886]) +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#3689]) +5 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs.html

  * igt@kms_chamelium@dp-edid-read:
    - shard-snb:          NOTRUN -> [SKIP][77] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-snb6/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-glk:          NOTRUN -> [SKIP][78] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk2/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@vga-frame-dump:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109284] / [fdo#111827]) +12 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb5/igt@kms_chamelium@vga-frame-dump.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [fdo#111827]) +31 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl1/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109278] / [i915#1149]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb1/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl2/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][84] ([i915#1319]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content_type_change:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb4/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          NOTRUN -> [TIMEOUT][86] ([i915#1319]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#1063]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109278] / [fdo#109279]) +3 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#3319]) +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109278]) +28 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#3359]) +8 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#109279] / [i915#3359]) +7 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#4103])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109274] / [fdo#109278])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-apl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#533]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([i915#426])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb6/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#426])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#109274] / [fdo#111825]) +11 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][99] -> [FAIL][100] ([i915#79])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109274])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][102] -> [DMESG-WARN][103] ([i915#180]) +4 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-kbl:          NOTRUN -> [SKIP][104] ([fdo#109271]) +344 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][105] ([fdo#109280]) +29 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-snb:          NOTRUN -> [SKIP][106] ([fdo#109271]) +198 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-snb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([fdo#109280] / [fdo#111825]) +42 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][108] ([fdo#109271]) +90 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][109] -> [SKIP][110] ([i915#433])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([fdo#109289]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb4/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][112] ([fdo#108145] / [i915#265]) +3 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          NOTRUN -> [FAIL][113] ([fdo#108145] / [i915#265]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][114] ([fdo#108145] / [i915#265])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][115] ([i915#3536])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb1/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_lowres@pipe-d-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][116] ([i915#3536]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-y.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-kbl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#658]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][118] ([fdo#109441]) +2 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-tglb:         NOTRUN -> [FAIL][119] ([i915#132] / [i915#3467]) +4 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb7/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][120] ([i915#5030]) +3 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb7/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([i915#5030]) +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb8/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][122] -> [FAIL][123] ([i915#31])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-glk7/igt@kms_setmode@basic.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk9/igt@kms_setmode@basic.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][124] ([fdo#109309])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@kms_tv_load_detect@load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][125] ([fdo#109309])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][126] ([fdo#109271] / [i915#533]) +4 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl3/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_vrr@flip-basic:
    - shard-tglb:         NOTRUN -> [SKIP][127] ([fdo#109502])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb7/igt@kms_vrr@flip-basic.html
    - shard-iclb:         NOTRUN -> [SKIP][128] ([fdo#109502])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/I

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/index.html

--===============2758291706783477552==
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
<tr><td><b>Series:</b></td><td>tests/i915:Extend kms_frontbuffer_tracking to test FBC on multiple pipes (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/99985/">https://patchwork.freedesktop.org/series/99985/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11272_full -&gt; IGTPW_6686_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_6686_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6686_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/index.html</p>
<h2>Participating hosts (12 -&gt; 8)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-dg1 pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6686_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6686_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl1/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb6/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl4/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb6/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb3/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> ([i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl3/igt@gem_exec_balancer@parallel-keep-submit-fence.html">DMESG-WARN</a> ([i915#5076])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl6/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL</a> ([i915#5076])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-glk4/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk9/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb6/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl1/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl7/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb6/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#111656])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb1/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#109292])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#4270]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-evict-all-engines:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-glk8/igt@gem_softpin@allocator-evict-all-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk8/igt@gem_softpin@allocator-evict-all-engines.html">FAIL</a> ([i915#4171])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb5/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl1/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl3/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-kbl1/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl1/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb5/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> ([fdo#109289]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb7/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb4/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl1/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([fdo#109271]) +169 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb6/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@hugepages:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@i915_selftest@mock@hugepages.html">INCOMPLETE</a> ([i915#5123])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl4/igt@i915_selftest@mock@hugepages.html">INCOMPLETE</a> ([i915#5123])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb7/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-glk7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111615]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb5/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb7/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl7/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +6 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +8 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-snb6/igt@kms_chamelium@dp-edid-read.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk2/igt@kms_chamelium@dp-hpd-storm-disable.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb5/igt@kms_chamelium@vga-frame-dump.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl1/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb1/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl2/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl7/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb4/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl1/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@kms_content_protection@srm.html">SKIP</a> ([i915#1063]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html">SKIP</a> ([i915#3319]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html">SKIP</a> ([fdo#109278]) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html">SKIP</a> ([i915#3359]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html">SKIP</a> ([fdo#109279] / [i915#3359]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb6/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb5/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DMESG-WARN</a> ([i915#180]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) +344 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109280]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-snb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> ([fdo#109271]) +198 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +90 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb4/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb1/igt@kms_plane_lowres@pipe-a-tiling-x.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-y:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-y.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb7/igt@kms_psr@psr2_sprite_mmap_cpu.html">FAIL</a> ([i915#132] / [i915#3467]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb7/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html">SKIP</a> ([i915#5030]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb8/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html">SKIP</a> ([i915#5030]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11272/shard-glk7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-glk9/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb3/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-iclb6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-kbl3/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6686/shard-tglb7/igt@kms_vrr@flip-basic.html">SKIP</a> ([fdo#109502])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/I">SKIP</a> ([fdo#109502])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2758291706783477552==--
