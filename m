Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0049474899624301980=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Tue, 31 May 2022 08:28:32 -0000
Message-ID: <165398571235.17348.3739347467333693220@emeril.freedesktop.org>
References: <20220531053648.19856-1-karthik.b.s@intel.com>
In-Reply-To: <20220531053648.19856-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fasync=5Fflips=3A_Cleanup_=28rev2=29?=
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

--===============0049474899624301980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/104493/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11710_full -> IGTPW_7193_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7193_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7193_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7193_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@many-contexts:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-tglb2/igt@gem_ctx_persistence@many-contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb2/igt@gem_ctx_persistence@many-contexts.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-iclb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb3/igt@i915_pm_rpm@gem-evict-pwrite.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb4/igt@i915_pm_rpm@gem-evict-pwrite.html

  * {igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-3} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][5] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-3.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
    - {shard-rkl}:        NOTRUN -> [FAIL][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11710_full and IGTPW_7193_full:

### New IGT tests (66) ###

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.31, 2.42] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 3.27] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.63] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.28, 2.33] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 3.26] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 2.34] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.31, 2.33] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 3.25] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.16, 2.33] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.16, 3.21] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 3.26] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 3.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.36] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_async_flips@crc@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.38, 2.49] s

  * igt@kms_async_flips@crc@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.33] s

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [2.17, 2.65] s

  * igt@kms_async_flips@crc@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@crc@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.38, 2.41] s

  * igt@kms_async_flips@crc@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.26, 3.32] s

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [2.16, 2.44] s

  * igt@kms_async_flips@crc@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@crc@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.38, 2.40] s

  * igt@kms_async_flips@crc@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.27, 3.33] s

  * igt@kms_async_flips@crc@pipe-c-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [2.17, 2.39] s

  * igt@kms_async_flips@crc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.26] s

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.16, 2.25] s

  * igt@kms_async_flips@invalid-async-flip@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.42] s

  * igt@kms_async_flips@invalid-async-flip@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 1.24] s

  * igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.73] s

  * igt@kms_async_flips@invalid-async-flip@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.31] s

  * igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.22, 1.25] s

  * igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.35] s

  * igt@kms_async_flips@invalid-async-flip@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.31] s

  * igt@kms_async_flips@invalid-async-flip@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 1.22] s

  * igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.38] s

  * igt@kms_async_flips@invalid-async-flip@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_async_flips@invalid-async-flip@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@test-time-stamp@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.44] s

  * igt@kms_async_flips@test-time-stamp@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.22, 1.28] s

  * igt@kms_async_flips@test-time-stamp@pipe-a-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.14, 0.70] s

  * igt@kms_async_flips@test-time-stamp@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@test-time-stamp@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.35] s

  * igt@kms_async_flips@test-time-stamp@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 1.28] s

  * igt@kms_async_flips@test-time-stamp@pipe-b-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.12, 0.38] s

  * igt@kms_async_flips@test-time-stamp@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@test-time-stamp@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.34] s

  * igt@kms_async_flips@test-time-stamp@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.22, 1.28] s

  * igt@kms_async_flips@test-time-stamp@pipe-c-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.12, 0.41] s

  * igt@kms_async_flips@test-time-stamp@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_async_flips@test-time-stamp@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.17] s

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_7193_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-snb5/igt@gem_ctx_persistence@processes.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl3/igt@gem_eio@in-flight-suspend.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#2842]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [PASS][12] -> [FAIL][13] ([i915#2842]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         [PASS][14] -> [FAIL][15] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][16] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#2842]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-snb:          [PASS][19] -> [SKIP][20] ([fdo#109271]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-apl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#4613]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl4/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-snb:          NOTRUN -> [SKIP][22] ([fdo#109271]) +110 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-snb6/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#109289])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb6/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#109289])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb7/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#5566] / [i915#716]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-glk4/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#5566] / [i915#716])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl7/igt@gen9_exec_parse@allowed-single.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl6/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#454])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl2/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271]) +56 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#5286]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#5286]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271]) +24 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-kbl7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#3886])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-glk6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109278] / [i915#3886])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#3886]) +4 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl1/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#3689]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb1/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html
    - shard-glk:          NOTRUN -> [SKIP][42] ([fdo#109271]) +18 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-glk6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109278]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb7/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb1/igt@kms_chamelium@hdmi-hpd-storm.html
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-glk3/igt@kms_chamelium@hdmi-hpd-storm.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb7/igt@kms_chamelium@hdmi-hpd-storm.html
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html
    - shard-snb:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-snb6/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl3/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109279] / [i915#3359]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278] / [fdo#109279])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][52] ([i915#180])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3359])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109274] / [fdo#111825]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#5287])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][57] ([i915#5287])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109274])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109280]) +6 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109280] / [fdo#111825]) +6 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#533]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#533])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html
    - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#533])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-glk1/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][64] ([fdo#108145] / [i915#265])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#3536])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb6/igt@kms_plane_lowres@pipe-a-tiling-x.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#3536])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb8/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-apl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#658]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl7/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#2920])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
    - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#658])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-glk3/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#2920])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
    - shard-kbl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#658])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][72] -> [SKIP][73] ([fdo#109441]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#2437])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb5/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2437])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-glk7/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#2437])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb6/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-kbl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#2437])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-kbl6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#2437]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl8/igt@kms_writeback@writeback-pixel-formats.html

  * igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109291])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb3/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109291])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb2/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html

  * igt@sysfs_clients@busy:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#2994]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl3/igt@sysfs_clients@busy.html

  * igt@sysfs_clients@split-25:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([i915#2994])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb3/igt@sysfs_clients@split-25.html
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#2994])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-kbl4/igt@sysfs_clients@split-25.html
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#2994])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb7/igt@sysfs_clients@split-25.html
    - shard-glk:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#2994])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-glk3/igt@sysfs_clients@split-25.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - {shard-rkl}:        [SKIP][86] ([i915#2582]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-2/igt@fbdev@nullptr.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-1/igt@fbdev@nullptr.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [FAIL][88] ([i915#5784]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-tglb1/igt@gem_eio@unwedge-stress.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [SKIP][90] ([i915#4525]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb7/igt@gem_exec_balancer@parallel-bb-first.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][92] ([i915#2842]) -> [PASS][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [FAIL][94] ([i915#2842]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-snb:          [SKIP][96] ([fdo#109271]) -> [PASS][97] +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-snb6/igt@gem_exec_flush@basic-uc-pro-default.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-snb5/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [DMESG-WARN][98] ([i915#118]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-glk8/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][100] ([i915#2190]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglb5/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_backlight@basic-brightness:
    - {shard-rkl}:        [SKIP][102] ([i915#3012]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-4/igt@i915_pm_backlight@basic-brightness.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [SKIP][104] ([i915#4281]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html
    - {shard-tglu}:       [SKIP][106] ([i915#4281]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-tglu-5/igt@i915_pm_dc@dc9-dpms.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tglu-2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - {shard-dg1}:        [SKIP][108] ([i915#1937]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-dg1-18/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-dg1-13/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rpm@fences:
    - {shard-rkl}:        [SKIP][110] ([i915#1849]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-2/igt@i915_pm_rpm@fences.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - {shard-dg1}:        [SKIP][112] ([i915#1397]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-dg1-18/igt@i915_pm_rpm@modeset-lpsp.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-dg1-16/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [INCOMPLETE][114] ([i915#3921]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-snb5/igt@i915_selftest@live@hangcheck.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-snb7/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@sysfs-reader:
    - {shard-dg1}:        [SKIP][116] ([i915#2575]) -> [PASS][117] +14 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-dg1-12/igt@i915_suspend@sysfs-reader.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-dg1-16/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][118] ([i915#118] / [i915#1888]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - {shard-rkl}:        [SKIP][120] ([i915#1845] / [i915#4098]) -> [PASS][121] +23 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-rapid-movement:
    - {shard-rkl}:        [SKIP][122] ([fdo#112022] / [i915#4070]) -> [PASS][123] +6 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-1/igt@kms_cursor_crc@pipe-b-cursor-64x21-rapid-movement.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-64x21-rapid-movement.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - {shard-rkl}:        [SKIP][124] ([fdo#111825] / [i915#4070]) -> [PASS][125] +6 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@pipe-c-single-move:
    - {shard-rkl}:        [SKIP][126] ([i915#4070]) -> [PASS][127] +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-6/igt@kms_cursor_legacy@pipe-c-single-move.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-5/igt@kms_cursor_legacy@pipe-c-single-move.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
    - {shard-rkl}:        [SKIP][128] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][129] +3 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [INCOMPLETE][130] ([i915#180] / [i915#1982]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - {shard-rkl}:        [SKIP][132] ([i915#3701]) -> [PASS][133] +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - {shard-rkl}:        [SKIP][134] ([i915#1849] / [i915#4098]) -> [PASS][135] +23 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_invalid_mode@uint-max-clock:
    - {shard-rkl}:        [SKIP][136] ([i915#4278]) -> [PASS][137] +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-5/igt@kms_invalid_mode@uint-max-clock.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid:
    - {shard-rkl}:        [SKIP][138] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][139] +1 similar issue
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-5/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-x:
    - {shard-rkl}:        [SKIP][140] ([i915#3558] / [i915#4070]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-1/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html

  * igt@kms_psr@cursor_blt:
    - {shard-rkl}:        [SKIP][142] ([i915#1072]) -> [PASS][143] +2 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-1/igt@kms_psr@cursor_blt.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_psr@cursor_blt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][144] ([fdo#109441]) -> [PASS][145] +1 similar issue
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-snb:          [DMESG-WARN][146] ([i915#5090]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-snb4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-snb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@perf@polling-small-buf:
    - {shard-rkl}:        [FAIL][148] ([i915#1722]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-2/igt@perf@polling-small-buf.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@perf@polling-small-buf.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-snb:          [DMESG-WARN][150] -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-snb4/igt@perf_pmu@cpu-hotplug.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-snb7/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@rc6-suspend:
    - shard-apl:          [DMESG-WARN][152] ([i915#180]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl6/igt@perf_pmu@rc6-suspend.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl1/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][154] -> [SKIP][155] ([i915#4525])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][156] ([i915#658]) -> [SKIP][157] ([i915#2920])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][158] ([i915#2920]) -> [SKIP][159] ([i915#658])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][160] ([i915#2920]) -> [SKIP][161] ([fdo#111068] / [i915#658])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][162] ([fdo#111068] / [i915#658]) -> [SKIP][163] ([i915#2920])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][164], [FAIL][165], [FAIL][166], [FAIL][167]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][168], [FAIL][169], [FAIL][170], [FAIL][171], [FAIL][172]) ([fdo#109271] / [i915#3002] / [i915#4312] / [i915#5257])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl3/igt@runner@aborted.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl6/igt@runner@aborted.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl6/igt@runner@aborted.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl1/igt@runner@aborted.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl2/igt@runner@aborted.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl2/igt@runner@aborted.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl6/igt@runner@aborted.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl6/igt@runner@aborted.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5090]: https://gitlab.freedesktop.org/drm/intel/issues/5090
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6079]: https://gitlab.freedesktop.org/drm/intel/issues/6079
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6500 -> IGTPW_7193
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11710: d2798c4b9213f0d14080bdeef58e692a2c01a0bf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7193: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/index.html
  IGT_6500: de4c6076a0f38ad3522b08931748f59d59a925ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/index.html

--===============0049474899624301980==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Cleanup (rev2)</td></=
tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/104493/">https://patchwork.freedesktop.org/series/104493/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7193/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11710_full -&gt; IGTPW_7193_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7193_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7193_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7193=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-tglb2/igt@gem_ctx_persistence@many-contexts.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/sh=
ard-tglb2/igt@gem_ctx_persistence@many-contexts.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-evict-pwrite:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-iclb3/igt@i915_pm_rpm@gem-evict-pwrite.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-i=
clb4/igt@i915_pm_rpm@gem-evict-pwrite.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a=
-hdmi-a-3} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-dg1-18/igt@kms_plane_scaling@plane-downscale=
-with-modifiers-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> +3 similar issue=
s</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check-interr=
uptible@b-edp1.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11710_full and IGTPW_7193_=
full:</p>
<h3>New IGT tests (66)</h3>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.31, 2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 3.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.28, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.31, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.16, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.16, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 3.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.38, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.17, 2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.38, 2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.26, 3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.16, 2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.38, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.27, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.17, 2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.16, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.22, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.22, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.14, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.12, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.22, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.12, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-=
hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-=
hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-=
hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-=
hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7193_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@processes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-snb5/igt@gem_ctx_persistence@processes.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-apl3/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl6/=
igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-g=
lk2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-=
apl7/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/s=
hard-iclb2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-=
kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +4 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-wb.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7193/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-apl4/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-snb6/igt@gen7_exec_parse@oacontrol-tracking.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +110 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-tglb6/igt@gen7_exec_parse@oacontrol-tracking.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-iclb7/igt@gen7_exec_parse@oacontrol-tracking.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-glk5/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-glk=
4/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-apl7/igt@gen9_exec_parse@allowed-single.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-=
apl6/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb3/igt@i=
915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl2/igt@i9=
15_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-apl8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +56 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-tglb2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-iclb3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-kbl7/igt@kms_big_fb@yf-tiled-max-hw-stride-32=
bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a>) +24 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-3=
2bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D111615">fdo#111615</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-glk6/igt@kms_ccs@pipe-c-bad-rotation-90-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-iclb6/igt@kms_ccs@pipe-c-bad-rotation-90-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-apl1/igt@kms_ccs@pipe-c-crc-primary-basic-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-tglb1/igt@kms_ccs@pipe-c-crc-sprite-planes-ba=
sic-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-glk6/igt@kms_ccs@pipe-c-crc-sprite-planes-bas=
ic-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>) +18 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-iclb7/igt@kms_ccs@pipe-d-bad-aux-stride-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278">fdo#109278</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-tglb1/igt@kms_chamelium@hdmi-hpd-storm.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284"=
>fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-glk3/igt@kms_chamelium@hdmi-hpd-storm.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-iclb7/igt@kms_chamelium@hdmi-hpd-storm.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284"=
>fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-snb6/igt@kms_chamelium@hdmi-hpd-storm.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-apl3/igt@kms_chamelium@vga-hpd-without-ddc.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-512x17=
0-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3359">i915#3359</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x17=
0-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspen=
d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x1=
70-rapid-movement.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-tglb5/igt@kms_cursor_legacy@cursorb-vs-flipa-=
atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111825">fdo#111825</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipa-=
atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109278">fdo#109278</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb8888-m=
map-cpu-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5287">i915#5287</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-iclb4/igt@kms_draw_crc@draw-method-xrgb8888-m=
map-cpu-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5287">i915#5287</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-iclb8/igt@kms_flip@2x-flip-vs-suspend-interr=
uptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +6 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +6 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-d.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-d-f=
rame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-glk1/igt@kms_pipe_crc_basic@read-crc-pipe-d-f=
rame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-tglb6/igt@kms_plane_lowres@pipe-a-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
36">i915#3536</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-iclb8/igt@kms_plane_lowres@pipe-a-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
36">i915#3536</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-apl7/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-tglb2/igt@kms_psr2_sf@overlay-plane-update-co=
ntinuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-glk3/igt@kms_psr2_sf@overlay-plane-update-con=
tinuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-co=
ntinuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-con=
tinuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard=
-iclb1/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-tglb5/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-glk7/igt@kms_writeback@writeback-invalid-para=
meters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-iclb6/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-kbl6/igt@kms_writeback@writeback-invalid-para=
meters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-apl8/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-tglb3/igt@prime_nv_api@nv_i915_reimport_twice=
_check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-iclb2/igt@prime_nv_api@nv_i915_reimport_twice=
_check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109291">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-apl3/igt@sysfs_clients@busy.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i9=
15#2994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-iclb3/igt@sysfs_clients@split-25.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-kbl4/igt@sysfs_clients@split-25.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-tglb7/igt@sysfs_clients@split-25.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7193/shard-glk3/igt@sysfs_clients@split-25.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-2/igt@fbdev@nullptr.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-1/igt@=
fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-tglb1/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-t=
glb7/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-iclb7/igt@gem_exec_balancer@parallel-bb-first.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7193/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7193/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/s=
hard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-snb6/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7193/shard-snb5/igt@gem_exec_flush@basic-uc-pro-default.html">PASS</a> +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i=
915#118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7193/shard-glk8/igt@gem_exec_whisper@basic-queues-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tg=
lb5/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-4/igt@i915_pm_backlight@basic-brightness.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3012">i915=
#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7193/shard-rkl-6/igt@i915_pm_backlight@basic-brightness.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11710/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-iclb1=
/igt@i915_pm_dc@dc9-dpms.html">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11710/shard-tglu-5/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-tg=
lu-2/igt@i915_pm_dc@dc9-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-dg1-18/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1937">=
i915#1937</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7193/shard-dg1-13/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-2/igt@i915_pm_rpm@fences.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6=
/igt@i915_pm_rpm@fences.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-dg1-18/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shar=
d-dg1-16/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-snb5/igt@i915_selftest@live@hangcheck.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#=
3921</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
193/shard-snb7/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-dg1-12/igt@i915_suspend@sysfs-reader.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/sha=
rd-dg1-16/igt@i915_suspend@sysfs-reader.html">PASS</a> +14 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i9=
15#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/188=
8">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7193/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#=
1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098"=
>i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7193/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> =
+23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-rapid-movement:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-1/igt@kms_cursor_crc@pipe-b-cursor-64x21-rapid-move=
ment.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D112022">fdo#112022</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-64=
x21-rapid-movement.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825=
">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7193/shard-rkl-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.h=
tml">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-c-single-move:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-6/igt@kms_cursor_legacy@pipe-c-single-move.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070">i9=
15#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7193/shard-rkl-5/igt@kms_cursor_legacy@pipe-c-single-move.html">PASS</a> =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xt=
iled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_draw_crc@draw-method-=
xrgb8888-mmap-gtt-xtiled.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915=
#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7193/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3701">i915#3701</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_flip_scaled_c=
rc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">PASS</a> +1 si=
milar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-=
shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_frontbuffer_tr=
acking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a> +23 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-5/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4278">i915#42=
78</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_719=
3/shard-rkl-6/igt@kms_invalid_mode@uint-max-clock.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-5/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-m=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7193/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-=
constant-alpha-mid.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-x:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-1/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/355=
8">i915#3558</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7193/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-x=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-1/igt@kms_psr@cursor_blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-rkl-6=
/igt@kms_psr@cursor_blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_71=
93/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-snb4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5090">i915#5090</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7193/shard-snb6/igt@kms_vblank@pipe-a-ts-continuation-dpms=
-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-rkl-2/igt@perf@polling-small-buf.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-r=
kl-6/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-snb4/igt@perf_pmu@cpu-hotplug.html">DMESG-WARN</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-snb7=
/igt@perf_pmu@cpu-hotplug.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-apl6/igt@perf_pmu@rc6-suspend.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-=
apl1/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/=
shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-cont=
inuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7193/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuo=
us-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7193/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11710/shard-iclb4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7193/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11710/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl6/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11710/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl1/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5257">i915#5257</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl2/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard=
-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7193/shard-apl6/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/shard-apl6/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7193/shard-apl6/igt@runner@aborted.html">FAIL</a>) (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#300=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i9=
15#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52=
57">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6500 -&gt; IGTPW_7193</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11710: d2798c4b9213f0d14080bdeef58e692a2c01a0bf @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7193: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7193/index.htm=
l<br />
  IGT_6500: de4c6076a0f38ad3522b08931748f59d59a925ce @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============0049474899624301980==--
