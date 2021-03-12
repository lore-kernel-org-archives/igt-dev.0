Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 12 Mar 2021 21:08:03 -0000
Message-ID: <161558328319.8354.9220601764239555594@emeril.freedesktop.org>
References: <20210312191814.65588-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20210312191814.65588-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=3A_Add_test_to_query_CS_timestamp_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0700480612=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0700480612==
Content-Type: multipart/alternative;
 boundary="===============5433063933082450691=="

--===============5433063933082450691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/perf: Add test to query CS timestamp (rev4)
URL   : https://patchwork.freedesktop.org/series/87553/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9855_full -> IGTPW_5596_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5596_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5596_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5596_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_query@cs-cycles-invalid} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb8/igt@i915_query@cs-cycles-invalid.html
    - shard-tglb:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb7/igt@i915_query@cs-cycles-invalid.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-glk:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-glk6/igt@kms_color@pipe-b-ctm-max.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk8/igt@kms_color@pipe-b-ctm-max.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9855_full and IGTPW_5596_full:

### New IGT tests (2) ###

  * igt@i915_query@cs-cycles:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_query@cs-cycles-invalid:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5596_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([fdo#111827])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb3/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][6] ([fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb7/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-4x:
    - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#1839])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb7/igt@feature_discovery@display-4x.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([i915#658])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-iclb2/igt@feature_discovery@psr2.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb6/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099]) +4 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-snb6/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2846])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-glk3/igt@gem_exec_fair@basic-deadline.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#2842]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#109313])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][22] ([i915#2389]) +4 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb8/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-snb:          NOTRUN -> [FAIL][23] ([i915#2389]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-snb5/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][24] ([i915#2389])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb1/igt@gem_exec_reloc@basic-many-active@vcs1.html

  * igt@gem_exec_reloc@basic-parallel:
    - shard-apl:          NOTRUN -> [TIMEOUT][25] ([i915#3183])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl1/igt@gem_exec_reloc@basic-parallel.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-kbl:          [PASS][26] -> [DMESG-WARN][27] ([i915#1610] / [i915#2803])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-kbl4/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl1/igt@gem_exec_schedule@u-fairslice@rcs0.html
    - shard-apl:          [PASS][28] -> [DMESG-WARN][29] ([i915#1610])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-apl6/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl8/igt@gem_exec_schedule@u-fairslice@rcs0.html
    - shard-glk:          [PASS][30] -> [DMESG-WARN][31] ([i915#1610] / [i915#2803])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-glk4/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk3/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - shard-iclb:         [PASS][32] -> [DMESG-WARN][33] ([i915#2803])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-iclb1/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb4/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-glk:          [PASS][34] -> [DMESG-WARN][35] ([i915#118] / [i915#95])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-glk3/igt@gem_exec_whisper@basic-fds-forked-all.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk2/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#2190])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][37] ([i915#2658])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl2/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][38] ([i915#2658])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-snb2/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#768]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb2/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109312])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb3/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109312])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb1/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
    - shard-snb:          NOTRUN -> [SKIP][42] ([fdo#109271]) +355 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-snb7/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - shard-apl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#1699]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl2/igt@gem_userptr_blits@process-exit-mmap@wb.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][44] ([i915#2724])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-snb5/igt@gem_userptr_blits@vma-merge.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#112306])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb6/igt@gen9_exec_parse@allowed-single.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#112306])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb2/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#110892])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb4/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#111644] / [i915#1397] / [i915#2411])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109293] / [fdo#109506])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109506] / [i915#2411])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb3/igt@i915_pm_rpm@pc8-residency.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#1769])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#1769])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#110725] / [fdo#111614])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#111614]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111615]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#110723]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_joiner@basic:
    - shard-kbl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#2705])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl2/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#2705])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb1/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_chamelium@hdmi-audio-edid:
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl4/igt@kms_chamelium@hdmi-audio-edid.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl8/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color@pipe-a-ctm-0-25:
    - shard-iclb:         NOTRUN -> [FAIL][61] ([i915#1149] / [i915#315])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb8/igt@kms_color@pipe-a-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [FAIL][62] ([i915#1149] / [i915#315])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb2/igt@kms_color@pipe-a-ctm-0-25.html

  * igt@kms_color@pipe-a-degamma:
    - shard-iclb:         NOTRUN -> [FAIL][63] ([i915#1149]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb7/igt@kms_color@pipe-a-degamma.html

  * igt@kms_color@pipe-b-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][64] ([i915#1149]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb2/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color@pipe-c-degamma:
    - shard-apl:          [PASS][65] -> [FAIL][66] ([i915#71])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-apl1/igt@kms_color@pipe-c-degamma.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl3/igt@kms_color@pipe-c-degamma.html
    - shard-kbl:          [PASS][67] -> [FAIL][68] ([i915#71])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-kbl3/igt@kms_color@pipe-c-degamma.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl1/igt@kms_color@pipe-c-degamma.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb2/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-c-degamma:
    - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk9/igt@kms_color_chamelium@pipe-c-degamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-5:
    - shard-snb:          NOTRUN -> [SKIP][71] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-snb5/igt@kms_color_chamelium@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#109284] / [fdo#111827]) +9 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb1/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][74] ([i915#1319]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content_type_change:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109300] / [fdo#111066])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb8/igt@kms_content_protection@content_type_change.html
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#111828])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb8/igt@kms_content_protection@content_type_change.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278] / [fdo#109279])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#109279]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109278]) +7 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge:
    - shard-kbl:          NOTRUN -> [SKIP][80] ([fdo#109271]) +160 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl4/igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][82] ([IGT#6])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-tglb:         NOTRUN -> [FAIL][83] ([i915#2346])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#111825]) +20 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:
    - shard-tglb:         NOTRUN -> [FAIL][85] ([i915#2122])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][86] ([i915#180])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [PASS][87] -> [DMESG-WARN][88] ([i915#180]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#2642])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-glk:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2642])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-kbl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#2642])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109280]) +15 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][93] -> [SKIP][94] ([i915#433])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#533]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][96] ([i915#265])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][97] ([fdo#108145] / [i915#265]) +4 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][98] ([fdo#108145] / [i915#265]) +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk1/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
    - shard-apl:          NOTRUN -> [FAIL][99] ([fdo#108145] / [i915#265]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#112054])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109274]) +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-scaling:
    - shard-apl:          NOTRUN -> [INCOMPLETE][102] ([i915#3182]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl3/igt@kms_plane_scaling@plane-scaling.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([i915#1836])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb4/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#658]) +4 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#658]) +4 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-1:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#658]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-glk:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#658]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk2/igt@kms_psr2_su@frontbuffer.html
    - shard-tglb:         NOTRUN -> [FAIL][108] ([i915#2596])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][109] -> [SKIP][110] ([fdo#109441]) +3 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb6/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-glk:          NOTRUN -> [SKIP][111] ([fdo#109271]) +45 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([fdo#109441]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][113] ([fdo#109309])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb2/igt@kms_tv_load_detect@load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109309])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][115] ([fdo#109271]) +188 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl7/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-apl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#2437])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][117] ([i915#2530]) +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb6/igt@nouveau_crc@pipe-a-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([i915#2530]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb1/igt@nouveau_crc@pipe-c-source-outp-complete.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-iclb:         NOTRUN -> [SKIP][119] ([fdo#112283])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb7/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglb:         NOTRUN -> [SKIP][120] ([fdo#112283])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb5/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-tglb:         NOTRUN -> [SKIP][121] ([fdo#109291]) +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb3/igt@prime_nv_api@i915_nv_import_vs_close.html
    - shard-iclb:         NOTRUN -> [SKIP][122] ([fdo#109291]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb2/igt@prime_nv_api@i915_nv_import_vs_close.html

  * igt@sysfs_clients@recycle:
    - shard-glk:          [PASS][123] -> [FAIL][124] ([i915#3028])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-glk8/igt@sysfs_clients@recycle.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk8/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@recycle-many:
    - shard-snb:          NOTRUN -> [FAIL][125] ([i915#3028])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-snb6/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@gem_create@create-clear:
    - shard-glk:          [FAIL][126] ([i915#1888] / [i915#3160]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-glk3/igt@gem_create@create-clear.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk6/igt@gem_create@create-clear.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [DMESG-WARN][128] ([i915#180]) -> [PASS][129] +4 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [FAIL][130] ([i915#2842]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-kbl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         [FAIL][132] ([i915#2842]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-iclb:         [INCOMPLETE][134] -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-iclb7/igt@gem_exec_whisper@basic-contexts-priority.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb5/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][136] ([i915#2190]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@big-copy:
    - shard-glk:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/index.html

--===============5433063933082450691==
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
<tr><td><b>Series:</b></td><td>i915/perf: Add test to query CS timestamp (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87553/">https://patchwork.freedesktop.org/series/87553/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9855_full -&gt; IGTPW_5596_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5596_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5596_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5596_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_query@cs-cycles-invalid} (NEW):</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb8/igt@i915_query@cs-cycles-invalid.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb7/igt@i915_query@cs-cycles-invalid.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-max:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-glk6/igt@kms_color@pipe-b-ctm-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk8/igt@kms_color@pipe-b-ctm-max.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9855_full and IGTPW_5596_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@i915_query@cs-cycles:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_query@cs-cycles-invalid:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5596_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb3/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb7/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb7/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb6/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-snb6/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-glk3/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-snb5/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb1/igt@gem_exec_reloc@basic-many-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl1/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> ([i915#3183])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-kbl4/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl1/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610] / [i915#2803])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-apl6/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl8/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-glk4/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk3/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610] / [i915#2803])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-iclb1/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb4/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> ([i915#2803])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-glk3/igt@gem_exec_whisper@basic-fds-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk2/igt@gem_exec_whisper@basic-fds-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-snb2/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb2/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb3/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb1/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-snb7/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html">SKIP</a> ([fdo#109271]) +355 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl2/igt@gem_userptr_blits@process-exit-mmap@wb.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-snb5/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb6/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb2/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb4/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109293] / [fdo#109506])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb3/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb6/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#110723]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl2/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio-edid:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl4/igt@kms_chamelium@hdmi-audio-edid.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl8/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-0-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb8/igt@kms_color@pipe-a-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb2/igt@kms_color@pipe-a-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-degamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb7/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb2/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-degamma:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-apl1/igt@kms_color@pipe-c-degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl3/igt@kms_color@pipe-c-degamma.html">FAIL</a> ([i915#71])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-kbl3/igt@kms_color@pipe-c-degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl1/igt@kms_color@pipe-c-degamma.html">FAIL</a> ([i915#71])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb2/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-degamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk9/igt@kms_color_chamelium@pipe-c-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-snb5/igt@kms_color_chamelium@pipe-d-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb1/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl7/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb8/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb8/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#111828])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html">SKIP</a> ([fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html">SKIP</a> ([fdo#109278]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl4/igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge.html">SKIP</a> ([fdo#109271]) +160 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">DMESG-FAIL</a> ([IGT#6])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> ([fdo#111825]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk1/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaling:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl3/igt@kms_plane_scaling@plane-scaling.html">INCOMPLETE</a> ([i915#3182]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb4/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk2/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb6/igt@kms_psr2_su@frontbuffer.html">FAIL</a> ([i915#2596])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb6/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk2/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> ([fdo#109271]) +45 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb3/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl7/igt@kms_vblank@pipe-d-ts-continuation-idle.html">SKIP</a> ([fdo#109271]) +188 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-apl3/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb6/igt@nouveau_crc@pipe-a-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb1/igt@nouveau_crc@pipe-c-source-outp-complete.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb7/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb5/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb3/igt@prime_nv_api@i915_nv_import_vs_close.html">SKIP</a> ([fdo#109291]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb2/igt@prime_nv_api@i915_nv_import_vs_close.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-glk8/igt@sysfs_clients@recycle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk8/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#3028])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-snb6/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-glk3/igt@gem_create@create-clear.html">FAIL</a> ([i915#1888] / [i915#3160]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-glk6/igt@gem_create@create-clear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-kbl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-iclb7/igt@gem_exec_whisper@basic-contexts-priority.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-iclb5/igt@gem_exec_whisper@basic-contexts-priority.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9855/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5596/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy:</p>
<ul>
<li>shard-glk:</li>
</ul>
</li>
</ul>

</body>
</html>

--===============5433063933082450691==--

--===============0700480612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0700480612==--
