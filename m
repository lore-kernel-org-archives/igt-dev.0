Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 17 Mar 2021 18:43:10 -0000
Message-ID: <161600659069.17366.10399913498813493645@emeril.freedesktop.org>
References: <20210316110434.101381-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210316110434.101381-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdC9p?=
 =?utf-8?q?915/gem=5Fexec=5Freloc=3A_check_reloc_support_in_GEM?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1654339563=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1654339563==
Content-Type: multipart/alternative;
 boundary="===============7363731204394357018=="

--===============7363731204394357018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test/i915/gem_exec_reloc: check reloc support in GEM
URL   : https://patchwork.freedesktop.org/series/88005/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9860_full -> IGTPW_5607_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5607_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5607_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5607_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][1] ([i915#2105]) -> ([FAIL][2], [FAIL][3])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-kbl7/igt@kms_content_protection@uevent.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl1/igt@kms_content_protection@uevent.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl7/igt@kms_content_protection@uevent.html

  
Known issues
------------

  Here are the changes found in IGTPW_5607_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> ([SKIP][4], [PASS][5]) ([i915#658])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb4/igt@feature_discovery@psr2.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_create@create-clear:
    - shard-iclb:         [PASS][6] -> [FAIL][7] ([i915#3160])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-iclb6/igt@gem_create@create-clear.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@gem_create@create-clear.html

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-kbl:          NOTRUN -> ([DMESG-WARN][8], [PASS][9]) ([i915#180]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> ([SKIP][10], [SKIP][11]) ([fdo#109271] / [i915#1099]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb6/igt@gem_ctx_persistence@engines-mixed.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#1099]) +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb2/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> ([SKIP][13], [SKIP][14]) ([i915#280])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb8/igt@gem_ctx_sseu@mmap-args.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb5/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [PASS][15] -> ([PASS][16], [INCOMPLETE][17]) ([i915#1895] / [i915#3031])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-iclb3/igt@gem_exec_balancer@hang.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@gem_exec_balancer@hang.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb1/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][18] -> ([FAIL][19], [FAIL][20]) ([i915#2846])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-glk4/igt@gem_exec_fair@basic-deadline.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk7/igt@gem_exec_fair@basic-deadline.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk5/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> ([FAIL][21], [FAIL][22]) ([i915#2842])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][23] ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk4/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-iclb:         NOTRUN -> ([FAIL][24], [FAIL][25]) ([i915#2842])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-tglb:         NOTRUN -> ([FAIL][26], [FAIL][27]) ([i915#2842])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb5/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][28] ([i915#2842])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][29] -> ([FAIL][30], [FAIL][31]) ([i915#2842])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][32] -> ([FAIL][33], [PASS][34]) ([i915#2842]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> ([SKIP][35], [SKIP][36]) ([fdo#109283])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@gem_exec_params@no-vebox.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb8/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> ([SKIP][37], [SKIP][38]) ([fdo#109283])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb7/igt@gem_exec_params@no-vebox.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb1/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_reloc@basic-many-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][39] ([i915#2389])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb4/igt@gem_exec_reloc@basic-many-active@vcs1.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> ([FAIL][40], [FAIL][41]) ([i915#2389])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-iclb:         [PASS][42] -> ([DMESG-WARN][43], [PASS][44]) ([i915#2803])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-iclb5/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb1/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb2/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_whisper@basic-contexts:
    - shard-glk:          [PASS][45] -> ([PASS][46], [DMESG-WARN][47]) ([i915#118] / [i915#95]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-glk8/igt@gem_exec_whisper@basic-contexts.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk5/igt@gem_exec_whisper@basic-contexts.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk3/igt@gem_exec_whisper@basic-contexts.html

  * igt@gem_mmap_gtt@big-copy:
    - shard-glk:          [PASS][48] -> ([PASS][49], [FAIL][50]) ([i915#307])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-glk9/igt@gem_mmap_gtt@big-copy.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk4/igt@gem_mmap_gtt@big-copy.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk8/igt@gem_mmap_gtt@big-copy.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][51] ([i915#2658])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb7/igt@gem_pwrite@basic-exhaustion.html
    - shard-iclb:         NOTRUN -> ([WARN][52], [WARN][53]) ([i915#2658])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb1/igt@gem_pwrite@basic-exhaustion.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@gem_pwrite@basic-exhaustion.html
    - shard-kbl:          NOTRUN -> ([WARN][54], [WARN][55]) ([i915#2658])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl3/igt@gem_pwrite@basic-exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][56] ([i915#2658])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl7/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][57] ([i915#2658])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb2/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][58] ([i915#2658])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk9/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> ([SKIP][59], [SKIP][60]) ([i915#768])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][61] ([i915#3002])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl2/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [INCOMPLETE][62] ([i915#2502] / [i915#2667])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl6/igt@gem_userptr_blits@vma-merge.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#112306])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb3/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-iclb:         NOTRUN -> ([SKIP][64], [SKIP][65]) ([fdo#112306])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@gen9_exec_parse@basic-rejected-ctx-param.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-apl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#658])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][67] -> ([PASS][68], [FAIL][69]) ([i915#454])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109289] / [fdo#111719])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - shard-iclb:         NOTRUN -> ([SKIP][71], [SKIP][72]) ([fdo#109289])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271]) +29 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          NOTRUN -> ([SKIP][74], [SKIP][75]) ([fdo#109271]) +127 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> ([SKIP][76], [SKIP][77]) ([fdo#109302])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@i915_query@query-topology-unsupported.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@live@client:
    - shard-glk:          [PASS][78] -> [DMESG-FAIL][79] ([i915#3047])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-glk6/igt@i915_selftest@live@client.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk3/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [PASS][80] -> ([PASS][81], [INCOMPLETE][82]) ([i915#2782])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-snb7/igt@i915_selftest@live@hangcheck.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb2/igt@i915_selftest@live@hangcheck.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb5/igt@i915_selftest@live@hangcheck.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-iclb:         NOTRUN -> ([SKIP][83], [SKIP][84]) ([i915#1769])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb2/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> ([SKIP][85], [SKIP][86]) ([fdo#110725] / [fdo#111614]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb4/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo:
    - shard-snb:          NOTRUN -> ([SKIP][87], [SKIP][88]) ([fdo#109271]) +252 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb2/igt@kms_ccs@pipe-a-ccs-on-another-bo.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb6/igt@kms_ccs@pipe-a-ccs-on-another-bo.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> ([SKIP][89], [SKIP][90]) ([fdo#109271] / [fdo#111827]) +5 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl1/igt@kms_chamelium@hdmi-hpd-storm.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl2/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> ([SKIP][91], [SKIP][92]) ([fdo#109271] / [fdo#111827]) +12 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl3/igt@kms_chamelium@vga-hpd.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl8/igt@kms_chamelium@vga-hpd.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> ([SKIP][93], [SKIP][94]) ([fdo#109271] / [fdo#111827]) +12 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb5/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-b-ctm-0-75:
    - shard-iclb:         NOTRUN -> ([FAIL][95], [FAIL][96]) ([i915#1149] / [i915#315])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@kms_color@pipe-b-ctm-0-75.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb2/igt@kms_color@pipe-b-ctm-0-75.html

  * igt@kms_color@pipe-b-degamma:
    - shard-tglb:         NOTRUN -> ([FAIL][97], [FAIL][98]) ([i915#1149])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb5/igt@kms_color@pipe-b-degamma.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb8/igt@kms_color@pipe-b-degamma.html
    - shard-iclb:         NOTRUN -> ([FAIL][99], [FAIL][100]) ([i915#1149])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb7/igt@kms_color@pipe-b-degamma.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color@pipe-d-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109278] / [i915#1149])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@kms_color@pipe-d-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> [SKIP][102] ([fdo#109271] / [fdo#111827]) +14 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-kbl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl4/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-apl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [fdo#111827]) +14 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl3/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-iclb:         NOTRUN -> ([SKIP][105], [SKIP][106]) ([fdo#109284] / [fdo#111827]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb4/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb8/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html
    - shard-tglb:         NOTRUN -> ([SKIP][107], [SKIP][108]) ([fdo#109284] / [fdo#111827])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb8/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb7/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html
    - shard-glk:          NOTRUN -> ([SKIP][110], [SKIP][111]) ([fdo#109271] / [fdo#111827]) +2 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk7/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk4/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> ([SKIP][112], [SKIP][113]) ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-negative.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-negative.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
    - shard-glk:          NOTRUN -> ([SKIP][114], [SKIP][115]) ([fdo#109271]) +21 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html
    - shard-iclb:         NOTRUN -> ([SKIP][116], [SKIP][117]) ([fdo#109278] / [fdo#109279])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html
    - shard-tglb:         NOTRUN -> ([SKIP][118], [SKIP][119]) ([fdo#109279])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([fdo#109278] / [fdo#109279])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][121] ([fdo#109279])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
    - shard-glk:          [PASS][122] -> ([DMESG-FAIL][123], [PASS][124]) ([i915#118] / [i915#70] / [i915#95])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk7/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk5/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-iclb:         NOTRUN -> ([SKIP][125], [SKIP][126]) ([fdo#109274] / [fdo#109278]) +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][127] ([fdo#109274] / [fdo#109278])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-kbl:          NOTRUN -> ([DMESG-FAIL][128], [DMESG-FAIL][129]) ([IGT#6])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
    - shard-apl:          NOTRUN -> [DMESG-FAIL][130] ([IGT#6]) +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         NOTRUN -> [SKIP][131] ([fdo#109278])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb7/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-iclb:         NOTRUN -> ([SKIP][132], [SKIP][133]) ([fdo#109278]) +8 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb2/igt@kms_cursor_legacy@pipe-d-torture-bo.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb4/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-kbl:          NOTRUN -> [SKIP][134] ([fdo#109271] / [i915#533])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-glk:          NOTRUN -> ([SKIP][135], [SKIP][136]) ([fdo#109271] / [i915#533])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk7/igt@kms_cursor_legacy@pipe-d-torture-bo.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk5/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_dp_dsc@basic-dsc-enable-dp:
    - shard-tglb:         NOTRUN -> [SKIP][137] ([fdo#109349])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb3/igt@kms_dp_dsc@basic-dsc-enable-dp.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         NOTRUN -> ([SKIP][138], [SKIP][139]) ([i915#426])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-tglb:         NOTRUN -> [SKIP][140] ([i915#426])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-iclb:         NOTRUN -> ([SKIP][141], [SKIP][142]) ([fdo#109274]) +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][143] -> ([PASS][144], [DMESG-WARN][145]) ([i915#180]) +6 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [PASS][146] -> [DMESG-WARN][147] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-tglb8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-apl:          [PASS][148] -> ([DMESG-WARN][149], [PASS][150]) ([i915#180])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [PASS][151] -> [DMESG-WARN][152] ([i915#180])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-apl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> ([SKIP][153], [SKIP][154]) ([fdo#109271] / [i915#2642])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-apl:          NOTRUN -> ([FAIL][155], [FAIL][156]) ([i915#2641])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-apl:          NOTRUN -> ([SKIP][157], [SKIP][158]) ([fdo#109271] / [i915#2672])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-apl:          [PASS][159] -> ([FAIL][160], [FAIL][161]) ([i915#49])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-prims

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html

--===============7363731204394357018==
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
<tr><td><b>Series:</b></td><td>test/i915/gem_exec_reloc: check reloc support in GEM</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88005/">https://patchwork.freedesktop.org/series/88005/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9860_full -&gt; IGTPW_5607_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5607_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5607_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5607_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@uevent:<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-kbl7/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl1/igt@kms_content_protection@uevent.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl7/igt@kms_content_protection@uevent.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5607_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb4/igt@feature_discovery@psr2.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a>) ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-iclb6/igt@gem_create@create-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@gem_create@create-clear.html">FAIL</a> ([i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PASS</a>) ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb6/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a>) ([fdo#109271] / [i915#1099]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb2/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb8/igt@gem_ctx_sseu@mmap-args.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb5/igt@gem_ctx_sseu@mmap-args.html">SKIP</a>) ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hang:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-iclb3/igt@gem_exec_balancer@hang.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@gem_exec_balancer@hang.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb1/igt@gem_exec_balancer@hang.html">INCOMPLETE</a>) ([i915#1895] / [i915#3031])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-glk4/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk7/igt@gem_exec_fair@basic-deadline.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk5/igt@gem_exec_fair@basic-deadline.html">FAIL</a>) ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a>) ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk4/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a>) ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb5/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a>) ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>) ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a>) ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@gem_exec_params@no-vebox.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb8/igt@gem_exec_params@no-vebox.html">SKIP</a>) ([fdo#109283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb7/igt@gem_exec_params@no-vebox.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb1/igt@gem_exec_params@no-vebox.html">SKIP</a>) ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb4/igt@gem_exec_reloc@basic-many-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a>) ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-iclb5/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb1/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb2/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a>) ([i915#2803])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-glk8/igt@gem_exec_whisper@basic-contexts.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk5/igt@gem_exec_whisper@basic-contexts.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk3/igt@gem_exec_whisper@basic-contexts.html">DMESG-WARN</a>) ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-glk9/igt@gem_mmap_gtt@big-copy.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk4/igt@gem_mmap_gtt@big-copy.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk8/igt@gem_mmap_gtt@big-copy.html">FAIL</a>) ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb1/igt@gem_pwrite@basic-exhaustion.html">WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@gem_pwrite@basic-exhaustion.html">WARN</a>) ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html">WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl3/igt@gem_pwrite@basic-exhaustion.html">WARN</a>) ([i915#2658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb2/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk9/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a>) ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl2/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl6/igt@gem_userptr_blits@vma-merge.html">INCOMPLETE</a> ([i915#2502] / [i915#2667])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb3/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a>) ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl3/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@i915_pm_dc@dc6-psr.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a>) ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289] / [fdo#111719])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a>) ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([fdo#109271]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a>) ([fdo#109271]) +127 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@i915_query@query-topology-unsupported.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@i915_query@query-topology-unsupported.html">SKIP</a>) ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-glk6/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk3/igt@i915_selftest@live@client.html">DMESG-FAIL</a> ([i915#3047])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-snb7/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb2/igt@i915_selftest@live@hangcheck.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb5/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a>) ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb2/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a>) ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb4/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a>) ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb2/igt@kms_ccs@pipe-a-ccs-on-another-bo.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb6/igt@kms_ccs@pipe-a-ccs-on-another-bo.html">SKIP</a>) ([fdo#109271]) +252 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl1/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl2/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl3/igt@kms_chamelium@vga-hpd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl8/igt@kms_chamelium@vga-hpd.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb5/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@kms_color@pipe-b-ctm-0-75.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb2/igt@kms_color@pipe-b-ctm-0-75.html">FAIL</a>) ([i915#1149] / [i915#315])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb5/igt@kms_color@pipe-b-degamma.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb8/igt@kms_color@pipe-b-degamma.html">FAIL</a>) ([i915#1149])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb7/igt@kms_color@pipe-b-degamma.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@kms_color@pipe-b-degamma.html">FAIL</a>) ([i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@kms_color@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl4/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl3/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb4/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb8/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a>) ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb8/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb7/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a>) ([fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk7/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk4/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-negative:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKIP</a>) ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html">SKIP</a>) ([fdo#109271]) +21 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html">SKIP</a>) ([fdo#109278] / [fdo#109279])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html">SKIP</a>) ([fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk7/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk5/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html">PASS</a>) ([i915#118] / [i915#70] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a>) ([fdo#109274] / [fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">DMESG-FAIL</a>) ([IGT#6])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">DMESG-FAIL</a> ([IGT#6]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb7/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</a> ([fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb2/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb4/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a>) ([fdo#109278]) +8 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk7/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-glk5/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a>) ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-dp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb3/igt@kms_dp_dsc@basic-dsc-enable-dp.html">SKIP</a> ([fdo#109349])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a>) ([i915#426])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-iclb5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a>) ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a>) ([i915#180]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-tglb8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">PASS</a>) ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-apl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a>) ([fdo#109271] / [i915#2642])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">FAIL</a>) ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/shard-apl8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a>) ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-prims">PASS</a> -&gt; ([FAIL][160], [FAIL][161]) ([i915#49])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============7363731204394357018==--

--===============1654339563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1654339563==--
