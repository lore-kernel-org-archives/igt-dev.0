Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0976942001055507031=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>
Date: Sun, 27 Mar 2022 06:39:18 -0000
Message-ID: <164836315833.4442.13957143783408956339@emeril.freedesktop.org>
References: <1648251706-30978-1-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1648251706-30978-1-git-send-email-quic_abhinavk@quicinc.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fconcurrent=3A_check_if_second_primary_plane_is_valid_=28r?=
 =?utf-8?q?ev3=29?=
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

--===============0976942001055507031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_concurrent: check if second primary plane is valid (rev3)
URL   : https://patchwork.freedesktop.org/series/101755/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11407_full -> IGTPW_6832_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/index.html

Participating hosts (11 -> 9)
------------------------------

  Additional (2): shard-rkl shard-dg1 
  Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6832_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_schedule@u-submit-golden-slice@vecs0:
    - {shard-dg1}:        NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-dg1-12/igt@gem_exec_schedule@u-submit-golden-slice@vecs0.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - {shard-rkl}:        NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  
Known issues
------------

  Here are the changes found in IGTPW_6832_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][3] ([i915#5441]) +13 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@api_intel_bb@blit-noreloc-purge-cache.html
    - shard-apl:          NOTRUN -> [INCOMPLETE][4] ([i915#5441])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl4/igt@api_intel_bb@blit-noreloc-purge-cache.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][5] ([i915#1373] / [i915#5441])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb3/igt@core_hotunplug@unbind-rebind.html

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][6] ([fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb2/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#1839])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@feature_discovery@display-2x.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#3555] / [i915#5325])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb3/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-iclb:         NOTRUN -> [SKIP][9] ([i915#5327])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb2/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([fdo#109314])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-snb4/igt@gem_ctx_persistence@process.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([i915#280])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][13] ([i915#5076]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb2/igt@gem_exec_balancer@parallel-contexts.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][14] ([i915#5076])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl3/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][15] ([i915#5076])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#4525]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][17] ([i915#5076])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb6/igt@gem_exec_balancer@parallel-ordering.html
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][18] ([i915#5076])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#2846])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][21] ([i915#2842]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][22] ([i915#2842]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][23] ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][24] ([i915#2842])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#109283]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#109283] / [i915#4877])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb2/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#112283])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb3/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_params@secure-non-root:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#112283]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb5/igt@gem_exec_params@secure-non-root.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#4613]) +7 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613]) +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl8/igt@gem_lmem_swapping@parallel-multi.html
    - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#4613]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-kbl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#4613]) +6 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl1/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#4613]) +6 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb7/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-glk:          NOTRUN -> [DMESG-WARN][34] ([i915#118])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk4/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][35] ([i915#2658])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][36] ([i915#2658])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-snb7/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][37] ([i915#2658])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#4270]) +5 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb8/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#4270]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb3/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#768]) +7 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_softpin@evict-snoop:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109312])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb7/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][42] -> [DMESG-WARN][43] ([i915#180])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-kbl6/igt@gem_softpin@noreloc-s3.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#3297]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb3/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([i915#3297]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#109289]) +8 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb5/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109289]) +6 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb2/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([i915#2856]) +4 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@gen9_exec_parse@allowed-all.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][49] ([i915#1436] / [i915#716])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#2527] / [i915#2856]) +6 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_backlight@bad-brightness:
    - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271]) +380 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk7/igt@i915_pm_backlight@bad-brightness.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#4281])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#4281])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#110892])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109302])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@i915_query@query-topology-unsupported.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109302])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb7/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][58] ([i915#2373])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb5/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][59] ([i915#1759])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb5/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          NOTRUN -> [DMESG-WARN][60] ([i915#180]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#404])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#404])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#1769])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#5286]) +5 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#5286]) +6 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][66] ([i915#5441]) +6 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl6/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#110725] / [fdo#111614]) +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb8/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#111614]) +7 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-snb:          [PASS][69] -> [INCOMPLETE][70] ([i915#5441]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-snb4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-snb5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-kbl:          [PASS][71] -> [INCOMPLETE][72] ([i915#5441]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-kbl1/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl3/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-glk:          NOTRUN -> [INCOMPLETE][73] ([i915#5441])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk5/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][74] ([i915#1373] / [i915#5441])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][75] ([i915#1373] / [i915#5441])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl1/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-snb:          NOTRUN -> [INCOMPLETE][76] ([i915#5441]) +5 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-snb2/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][77] ([i915#2828] / [i915#5441])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#3777]) +8 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglb:         [PASS][79] -> [INCOMPLETE][80] ([i915#5441]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-tglb6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-iclb:         [PASS][81] -> [INCOMPLETE][82] ([i915#5441]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-iclb8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
    - shard-glk:          [PASS][83] -> [INCOMPLETE][84] ([i915#5441]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-glk2/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk3/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][85] ([i915#5441]) +7 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#3777]) +6 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#110723]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#111615]) +10 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#3777]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271]) +402 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#2705])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#3689]) +9 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#3886]) +6 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl3/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#3886]) +17 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#111615] / [i915#3689]) +12 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#3886]) +17 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk5/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109278] / [i915#3886]) +15 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#3689] / [i915#3886]) +4 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:
    - shard-snb:          NOTRUN -> [SKIP][99] ([fdo#109271]) +608 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-snb7/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#3742])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb7/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [fdo#111827]) +32 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl4/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][102] ([fdo#109271] / [fdo#111827]) +28 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-snb4/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109278] / [i915#1149]) +3 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb5/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [fdo#111827]) +24 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#109284] / [fdo#111827]) +27 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb7/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#109284] / [fdo#111827]) +27 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][108] ([fdo#109271] / [fdo#111827]) +31 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk2/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([i915#3116])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([i915#3116] / [i915#3299])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][111] ([i915#1319]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl7/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([fdo#109300] / [fdo#111066]) +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][113] ([i915#1319])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#1063]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb2/igt@kms_content_protection@uevent.html
    - shard-apl:          NOTRUN -> [FAIL][115] ([i915#2105])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][116] ([fdo#109278] / [fdo#109279]) +7 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][117] ([i915#3319]) +6 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([fdo#109279] / [i915#3359]) +11 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#3359]) +10 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([fdo#109274] / [fdo#109278]) +5 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][121] -> [FAIL][122] ([i915#2346])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-iclb:         NOTRUN -> [FAIL][123] ([i915#2346])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-glk:          NOTRUN -> [FAIL][124] ([i915#4534])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk1/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-tglb:         NOTRUN -> [SKIP][125] ([i915#426])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][126] ([i915#5287]) +5 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb8/igt@kms_draw_crc@draw-method-rgb565-blt-4tiled.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:
    - sh

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/index.html

--===============0976942001055507031==
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
<tr><td><b>Series:</b></td><td>tests/kms_concurrent: check if second primary plane is valid (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101755/">https://patchwork.freedesktop.org/series/101755/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11407_full -&gt; IGTPW_6832_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/index.html</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Additional (2): shard-rkl shard-dg1 <br />
  Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6832_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@vecs0:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-dg1-12/igt@gem_exec_schedule@u-submit-golden-slice@vecs0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6832_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-noreloc-purge-cache:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@api_intel_bb@blit-noreloc-purge-cache.html">INCOMPLETE</a> ([i915#5441]) +13 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl4/igt@api_intel_bb@blit-noreloc-purge-cache.html">INCOMPLETE</a> ([i915#5441])</p>
</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb3/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> ([i915#1373] / [i915#5441])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb2/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb3/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#5325])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb2/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#5327])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-snb4/igt@gem_ctx_persistence@process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb2/igt@gem_exec_balancer@parallel-contexts.html">DMESG-WARN</a> ([i915#5076]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl3/igt@gem_exec_balancer@parallel-contexts.html">DMESG-WARN</a> ([i915#5076])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.html">DMESG-WARN</a> ([i915#5076])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> ([i915#4525]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb6/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL</a> ([i915#5076])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl7/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL</a> ([i915#5076])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb2/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283] / [i915#4877])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb3/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb5/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> ([i915#4613]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl8/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk1/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl1/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([fdo#109271] / [i915#4613]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb7/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#4613]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk4/igt@gem_partial_pwrite_pread@reads-snoop.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-snb7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk3/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb8/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb3/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html">SKIP</a> ([i915#768]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb7/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-kbl6/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl1/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb3/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb5/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109289]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb2/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([fdo#109289]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2856]) +4 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl3/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> ([i915#1436] / [i915#716])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527] / [i915#2856]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk7/igt@i915_pm_backlight@bad-brightness.html">SKIP</a> ([fdo#109271]) +380 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#110892])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb7/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb5/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> ([i915#2373])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb5/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> ([i915#1759])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl2/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> ([i915#5286]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([i915#5286]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl6/igt@kms_big_fb@linear-16bpp-rotate-180.html">INCOMPLETE</a> ([i915#5441]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb8/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-snb4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-snb5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">INCOMPLETE</a> ([i915#5441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-kbl1/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl3/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">INCOMPLETE</a> ([i915#5441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk5/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">INCOMPLETE</a> ([i915#5441])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">INCOMPLETE</a> ([i915#1373] / [i915#5441])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl1/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">INCOMPLETE</a> ([i915#1373] / [i915#5441])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-snb2/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">INCOMPLETE</a> ([i915#5441]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">INCOMPLETE</a> ([i915#2828] / [i915#5441])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-tglb6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">INCOMPLETE</a> ([i915#5441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-iclb8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">INCOMPLETE</a> ([i915#5441]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-glk2/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk3/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">INCOMPLETE</a> ([i915#5441]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">INCOMPLETE</a> ([i915#5441]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#110723]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#111615]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#109271]) +402 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl3/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk5/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +15 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-snb7/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs.html">SKIP</a> ([fdo#109271]) +608 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb7/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl4/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +32 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-snb4/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb5/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109278] / [i915#1149]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb7/igt@kms_color_chamelium@pipe-b-ctm-0-75.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk2/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl7/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-kbl6/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb2/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#1063]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-apl2/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html">SKIP</a> ([i915#3319]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html">SKIP</a> ([i915#3359]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-glk1/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">FAIL</a> ([i915#4534])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/shard-iclb8/igt@kms_draw_crc@draw-method-rgb565-blt-4tiled.html">SKIP</a> ([i915#5287]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:</p>
<ul>
<li>sh</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0976942001055507031==--
