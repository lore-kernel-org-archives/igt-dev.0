Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5551776244301296693=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Mon, 30 May 2022 10:12:20 -0000
Message-ID: <165390554005.17901.12819216279080495975@emeril.freedesktop.org>
References: <20220530062959.18257-1-karthik.b.s@intel.com>
In-Reply-To: <20220530062959.18257-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fasync=5Fflips=3A_Cleanup?=
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

--===============5551776244301296693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Cleanup
URL   : https://patchwork.freedesktop.org/series/104493/
State : success

== Summary ==

CI Bug Log - changes from IGT_6496_full -> IGTPW_7184_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7184_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@bo-too-small:
    - {shard-dg1}:        [PASS][1] -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-dg1-19/igt@kms_addfb_basic@bo-too-small.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-dg1-18/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_atomic_interruptible@legacy-dpms@hdmi-a-3-pipe-a:
    - {shard-dg1}:        NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-dg1-18/igt@kms_atomic_interruptible@legacy-dpms@hdmi-a-3-pipe-a.html

  
New tests
---------

  New tests have been introduced between IGT_6496_full and IGTPW_7184_full:

### New IGT tests (72) ###

  * igt@gem_exec_schedule@submit-late-slice@bcs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@submit-late-slice@rcs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@submit-late-slice@vcs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@submit-late-slice@vcs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@gem_exec_schedule@submit-late-slice@vecs0:
    - Statuses : 8 pass(s)
    - Exec time: [0.02, 0.06] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.30, 2.45] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.23, 3.27] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.31, 2.35] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 3.26] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.31, 2.35] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.21, 3.25] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.27, 2.40] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.21, 3.22] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [2.12, 2.61] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 2.29] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 3.26] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [2.10, 2.31] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.26, 2.30] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.20] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [2.10, 2.29] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.13] s

  * igt@kms_async_flips@crc@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.51] s

  * igt@kms_async_flips@crc@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.31] s

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.73] s

  * igt@kms_async_flips@crc@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_async_flips@crc@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_async_flips@crc@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.33] s

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.48] s

  * igt@kms_async_flips@crc@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@crc@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.39] s

  * igt@kms_async_flips@crc@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.33] s

  * igt@kms_async_flips@crc@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.47] s

  * igt@kms_async_flips@invalid-async-flip@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.43] s

  * igt@kms_async_flips@invalid-async-flip@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 1.23] s

  * igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_async_flips@invalid-async-flip@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.33] s

  * igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 1.23] s

  * igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_async_flips@invalid-async-flip@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.30] s

  * igt@kms_async_flips@invalid-async-flip@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.22, 1.27] s

  * igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_async_flips@invalid-async-flip@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_async_flips@test-cursor@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.40] s

  * igt@kms_async_flips@test-cursor@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 1.24] s

  * igt@kms_async_flips@test-cursor@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.57] s

  * igt@kms_async_flips@test-cursor@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@test-cursor@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.30] s

  * igt@kms_async_flips@test-cursor@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 1.28] s

  * igt@kms_async_flips@test-cursor@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.33] s

  * igt@kms_async_flips@test-cursor@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@test-cursor@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.31] s

  * igt@kms_async_flips@test-cursor@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.22] s

  * igt@kms_async_flips@test-cursor@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.30] s

  * igt@kms_async_flips@test-cursor@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_async_flips@test-cursor@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [20.27] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [20.29] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  

Known issues
------------

  Here are the changes found in IGTPW_7184_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ccs@block-copy-compressed:
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#5327]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb5/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-copy-inplace:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#3555] / [i915#5325])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@gem_ccs@block-copy-inplace.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-tglb:         [PASS][6] -> [TIMEOUT][7] ([i915#3063])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb5/igt@gem_eio@in-flight-contexts-1us.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb2/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][8] ([i915#5076] / [i915#5614])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@gem_exec_balancer@parallel-keep-in-fence.html
    - shard-iclb:         NOTRUN -> [SKIP][9] ([i915#4525])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb8/igt@gem_exec_balancer@parallel-keep-in-fence.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][10] ([i915#5076] / [i915#5614])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl3/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#2846])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][17] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][20] ([i915#2842]) +4 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][21] ([i915#2842])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][22] ([i915#2849])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#109313])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#109313])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-snb:          [PASS][25] -> [SKIP][26] ([fdo#109271]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-snb2/igt@gem_exec_flush@basic-uc-prw-default.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-snb6/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#109283]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@gem_exec_params@rsvd2-dirt.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109283])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb4/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#112283]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb8/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#112283])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_whisper@basic-queues:
    - shard-snb:          NOTRUN -> [SKIP][31] ([fdo#109271]) +211 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-snb7/igt@gem_exec_whisper@basic-queues.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#2190])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#4613]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl1/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#4613]) +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#4613]) +7 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#4613]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk1/igt@gem_lmem_swapping@verify-ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#4613]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb1/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#111656])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@gem_mmap_gtt@coherency.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109292])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb1/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-snb:          [PASS][40] -> [INCOMPLETE][41] ([i915#5161])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-y.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-snb2/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#4270]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb5/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#4270]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109312])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109312])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb3/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#3297])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-tglb:         NOTRUN -> [FAIL][47] ([i915#3318])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109289])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb8/igt@gen7_exec_parse@basic-rejected.html
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109289])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#2856]) +3 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb1/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#2527] / [i915#2856]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][52] -> [FAIL][53] ([i915#454])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#110892]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb8/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([i915#5723])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb8/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#5723])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [PASS][58] -> [DMESG-WARN][59] ([i915#5591])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb2/igt@i915_selftest@live@hangcheck.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#5903])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb2/igt@i915_suspend@basic-s3-without-i915.html
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#5903])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#5286]) +9 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#5286]) +6 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111614]) +5 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#110725] / [fdo#111614]) +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#111615]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#110723]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#6095]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109278] / [i915#3886]) +9 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#3886]) +15 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl4/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#3886]) +7 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#3689] / [i915#3886]) +6 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#111615] / [i915#3689]) +7 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#3886]) +8 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk4/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109278]) +57 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb8/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#3689]) +11 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:
    - shard-glk:          NOTRUN -> [SKIP][77] ([fdo#109271]) +157 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk2/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][78] ([fdo#109271]) +370 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl4/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#3742])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_cdclk@plane-scaling.html
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#3742])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@dp-edid-change-during-suspend:
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk8/igt@kms_chamelium@dp-edid-change-during-suspend.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109284] / [fdo#111827]) +10 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb6/igt@kms_chamelium@dp-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-snb:          NOTRUN -> [SKIP][83] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-snb4/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium@vga-frame-dump:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109284] / [fdo#111827]) +15 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb2/igt@kms_chamelium@vga-frame-dump.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109278] / [i915#1149]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb5/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-kbl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-apl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl3/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@atomic:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#1063])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb6/igt@kms_content_protection@atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109300] / [fdo#111066])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#3116]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#3116] / [i915#3299]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          NOTRUN -> [TIMEOUT][92] ([i915#1319]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][93] ([i915#2105])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109278] / [fdo#109279]) +3 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109279] / [i915#3359]) +8 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#3359]) +7 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#3319]) +3 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109274] / [fdo#109278]) +3 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][99] -> [FAIL][100] ([i915#2346])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
    - shard-iclb:         [PASS][101] -> [FAIL][102] ([i915#2346])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-glk:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#533]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk2/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-kbl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#533]) +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#4103])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#426])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([i915#5287]) +3 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb8/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([i915#5287]) +3 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([fdo#109274] / [fdo#111825]) +16 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb2/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([fdo#109274]) +4 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][111] -> [DMESG-WARN][112] ([i915#180]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglb:         NOTRUN -> [SKIP][113] ([i915#2587])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-glk:          [PASS][114] -> [FAIL][115] ([i915#4911])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-iclb:         NOTRUN -> [SKIP][116] ([i915#2587]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#109280]) +34 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][118] ([fdo#109271]) +146 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([fdo#109280] / [fdo#111825]) +45 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][120] ([i915#1839])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-iclb:         NOTRUN -> [SKIP][121] ([i915#1839])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          [PASS][122] -> [DMESG-WARN][123] ([i915#180]) +2 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][124] ([fdo#108145] / [i915#265]) +3 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][125] ([i915#265])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][126] ([fdo#108145] / [i915#265]) +2 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][127] ([fdo#108145] / [i915#265]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-tglb:         NOTRUN -> [SKIP][128] ([i915#3536]) +3 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-x.html
    - shard-iclb:         NOTRUN -> [SKIP][129] ([i915#3536]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb1/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][130] ([fdo#111615] / [fdo#112054])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb2/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][131] ([i915#5288])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-c-tiling-4.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         NOTRUN -> [SKIP][132] ([i915#1836])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb3/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-kbl:          NOTRUN -> [SKIP][133] ([fdo#109271] / [i915#658]) +5 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-tglb:         NOTRUN -> [SKIP][134] ([i915#2920]) +3 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
    - shard-glk:          NOTRUN -> [SKIP][135] ([fdo#109271] / [i915#658]) +2 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
    - shard-iclb:         NOTRUN -> [SKIP][136] ([i915#658])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][137] ([i915#2920])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][138] ([fdo#111068] / [i915#658])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-apl:          NOTRUN -> [SKIP][139] ([fdo#109271] / [i915#658]) +1 similar issue
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][140] -> [SKIP][141] ([fdo#109441]) +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         NOTRUN -> [SKIP][142] ([fdo#109441]) +3 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-tglb:         NOTRUN -> [FAIL][143] ([i915#132] / [i915#3467]) +3 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb6/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglb:         NOTRUN -> [SKIP][144] ([fdo#111615] / [i915#5289])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][145] ([fdo#109271] / [i915#533]) +1 similar issue
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl4/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_vrr@flip-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][146] ([i915#3555])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-kbl:          NOTRUN -> [SKIP][147] ([fdo#109271] / [i915#2437])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][148] ([i915#2530]) +3 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][149] ([i915#2530]) +2 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@prime_nv_api@i915_nv_double_export:
    - shard-tglb:         NOTRUN -> [SKIP][150] ([fdo#109291]) +4 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@prime_nv_api@i915_nv_double_export.html

  * igt@prime_nv_api@nv_self_import_to_different_fd:
    - shard-iclb:         NOTRUN -> [SKIP][151] ([fdo#109291]) +2 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb1/igt@prime_nv_api@nv_self_import_to_different_fd.html

  * igt@prime_vgem@basic-userptr:
    - shard-tglb:         NOTRUN -> [SKIP][152] ([fdo#109295] / [i915#3301])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb2/igt@prime_vgem@basic-userptr.html
    - shard-iclb:         NOTRUN -> [SKIP][153] ([fdo#109295] / [i915#3301])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb2/igt@prime_vgem@basic-userptr.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglb:         NOTRUN -> [SKIP][154] ([fdo#109295])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb6/igt@prime_vgem@fence-write-hang.html
    - shard-iclb:         NOTRUN -> [SKIP][155] ([fdo#109295])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb4/igt@prime_vgem@fence-write-hang.html

  * igt@syncobj_timeline@invalid-transfer-non-existent-point:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][156] ([i915#5098])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl7/igt@syncobj_timeline@invalid-transfer-non-existent-point.html

  * igt@sysfs_clients@recycle-many:
    - shard-glk:          NOTRUN -> [SKIP][157] ([fdo#109271] / [i915#2994])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk4/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-10:
    - shard-kbl:          NOTRUN -> [SKIP][158] ([fdo#109271] / [i915#2994]) +3 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl7/igt@sysfs_clients@sema-10.html

  * igt@sysfs_clients@sema-25:
    - shard-tglb:         NOTRUN -> [SKIP][159] ([i915#2994]) +3 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@sysfs_clients@sema-25.html
    - shard-iclb:         NOTRUN -> [SKIP][160] ([i915#2994]) +1 similar issue
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb6/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-iclb:         [TIMEOUT][161] ([i915#3070]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb5/igt@gem_eio@in-flight-contexts-1us.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_eio@kms:
    - shard-tglb:         [FAIL][163] ([i915#5784]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb5/igt@gem_eio@kms.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb6/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         [SKIP][165] ([i915#4525]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb6/igt@gem_exec_balancer@parallel-balancer.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb2/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [FAIL][167] ([i915#2842]) -> [PASS][168] +1 similar issue
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][169] ([i915#2842]) -> [PASS][170] +2 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-tglb:         [FAIL][171] ([i915#2842]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@i915_selftest@live@gt_pm:
    - {shard-tglu}:       [DMESG-FAIL][173] ([i915#3987]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglu-1/igt@i915_selftest@live@gt_pm.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglu-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - {shard-rkl}:        [FAIL][175] ([fdo#103375]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-rkl-2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [DMESG-WARN][177] ([i915#180]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/igt@i915_suspend@sysfs-reader.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - {shard-rkl}:        [SKIP][179] ([i915#1845] / [i915#4098]) -> [PASS][180] +4 similar issues
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-1/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-rkl-6/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - {shard-rkl}:        [SKIP][181] ([fdo#112022] / [i915#4070]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:
    - {shard-rkl}:        [SKIP][183] ([i915#4070] / [i915#4098]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-4/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - {shard-rkl}:        [SKIP][185] ([fdo#111825] / [i915#4070]) -> [PASS][186] +1 similar issue
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-iclb:         [FAIL][187] ([i915#5072]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled:
    - {shard-rkl}:        [SKIP][189] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][190] +3 similar issues
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [FAIL][191] ([i915#79]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [DMESG-WARN][193] ([i915#180]) -> [PASS][194] +1 similar issue
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][195] ([i915#1888] / [i915#2546]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - {shard-rkl}:        [SKIP][197] ([i915#1849] / [i915#4098]) -> [PASS][198] +4 similar issues
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_plane@plane-panning-bottom-right@pipe-b-planes:
    - {shard-rkl}:        [SKIP][199] ([i915#1849] / [i915#3558]) -> [PASS][200] +1 similar issue
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right@pipe-b-planes.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - {shard-rkl}:        [SKIP][201] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * {igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1}:
    - shard-iclb:         [SKIP][203] ([i915#5176]) -> [PASS][204] +1 similar issue
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * {igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1}:
    - shard-iclb:         [SKIP][205] -> [PASS][206] +2 similar issues
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][207] ([fdo#109441]) -> [PASS][208] +1 similar issue
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [FAIL][209] ([i915#5784]) -> [TIMEOUT][210] ([i915#3063])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb3/igt@gem_eio@unwedge-stress.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [DMESG-WARN][211] ([i915#5614]) -> [SKIP][212] ([i915#4525]) +2 similar issues
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [SKIP][213] ([i915#4525]) -> [DMESG-WARN][214] ([i915#5614])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb3/igt@gem_exec_balancer@parallel-out-fence.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][215] ([i915#180]) -> [FAIL][216] ([i915#4767])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][217] ([fdo#111068] / [i915#658]) -> [SKIP][218] ([i915#2920])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][219] ([i915#2920]) -> [SKIP][220] ([fdo#111068] / [i915#658]) +1 similar issue
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][221], [FAIL][222], [FAIL][223], [FAIL][224], [FAIL][225], [FAIL][226]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][227], [FAIL][228], [FAIL][229], [FAIL][230], [FAIL][231], [FAIL][232], [FAIL][233]) ([fdo#109271] / [i915#3002] / [i915#4312] / [i915#5257])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl4/igt@runner@aborted.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl2/igt@runner@aborted.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl4/igt@runner@aborted.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl4/igt@runner@aborted.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl7/igt@runner@aborted.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl6/igt@runner@aborted.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl1/igt@runner@aborted.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl2/igt@runner@aborted.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl6/igt@runner@aborted.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl4/igt@runner@aborted.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl2/igt@runner@aborted.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl6/igt@runner@aborted.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl1/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][234], [FAIL][235], [FAIL][236], [FAIL][237], [FAIL][238], [FAIL][239], [FAIL][240], [FAIL][241], [FAIL][242], [FAIL][243]) ([i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][244], [FAIL][245], [FAIL][246], [FAIL][247], [FAIL][248], [FAIL][249], [FAIL][250], [FAIL][251]) ([i915#4312] / [i915#5257])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb1/igt@runner@aborted.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb1/igt@runner@aborted.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb7/igt@runner@aborted.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb7/igt@runner@aborted.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb5/igt@runner@aborted.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb3/igt@runner@aborted.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb3/igt@runner@aborted.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb6/igt@runner@aborted.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb7/igt@runner@aborted.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb6/igt@runner@aborted.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb2/igt@runner@aborted.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@runner@aborted.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@runner@aborted.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@runner@aborted.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@runner@aborted.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@runner@aborted.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@runner@aborted.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][252], [FAIL][253], [FAIL][254], [FAIL][255], [FAIL][256], [FAIL][257], [FAIL][258], [FAIL][259], [FAIL][260], [FAIL][261], [FAIL][262], [FAIL][263], [FAIL][264]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#92]) -> ([FAIL][265], [FAIL][266], [FAIL][267], [FAIL][268], [FAIL][269], [FAIL][270], [FAIL][271], [FAIL][272], [FAIL][273], [FAIL][274], [FAIL][275]) ([i915#180] / [i915#4312] / [i915#5257])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/igt@runner@aborted.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/igt@runner@aborted.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/igt@runner@aborted.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl6/igt@runner@aborted.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/igt@runner@aborted.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl6/igt@runner@aborted.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl1/igt@runner@aborted.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl6/igt@runner@aborted.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl4/igt@runner@aborted.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl1/igt@runner@aborted.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl4/igt@runner@aborted.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl4/igt@runner@aborted.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl1/igt@runner@aborted.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl4/igt@runner@aborted.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl6/igt@runner@aborted.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl7/igt@runner@aborted.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl7/igt@runner@aborted.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl3/igt@runner@aborted.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl3/igt@runner@aborted.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl3/igt@runner@aborted.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl4/igt@runner@aborted.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl7/igt@runner@aborted.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl7/igt@runner@aborted.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl7/igt@runner@aborted.html

  
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
  [fdo#109292]: https://bugs.freedesktop.org/show_bug.cgi?id=109292
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3736]: https://gitlab.freedesktop.org/drm/intel/issues/3736
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4241]: https://gitlab.freedesktop.org/drm/intel/issues/4241
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4807]: https://gitlab.freedesktop.org/drm/intel/issues/4807
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4911]: https://gitlab.freedesktop.org/drm/intel/issues/4911
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5072]: https://gitlab.freedesktop.org/drm/intel/issues/5072
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
  [i915#5115]: https://gitlab.freedesktop.org/drm/intel/issues/5115
  [i915#5161]: https://gitlab.freedesktop.org/drm/intel/issues/5161
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5264]: https://gitlab.freedesktop.org/drm/intel/issues/5264
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5721]: https://gitlab.freedesktop.org/drm/intel/issues/5721
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6076]: https://gitlab.freedesktop.org/drm/intel/issues/6076
  [i915#6079]: https://gitlab.freedesktop.org/drm/intel/issues/6079
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6496 -> IGTPW_7184

  CI-20190529: 20190529
  CI_DRM_11705: 18a2e6dbca526f996da04741cf5ef169e810a50e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7184: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/index.html
  IGT_6496: 58a5a2d5be19b916311541401aaa48b787f9a185 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/index.html

--===============5551776244301296693==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/104493/">https://patchwork.freedesktop.org/series/104493/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7184/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6496_full -&gt; IGTPW_7184_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/index.=
html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7184=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-dg1-19/igt@kms_addfb_basic@bo-too-small.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-dg1-=
18/igt@kms_addfb_basic@bo-too-small.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@hdmi-a-3-pipe-a:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-dg1-18/igt@kms_atomic_interruptible@legacy-d=
pms@hdmi-a-3-pipe-a.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6496_full and IGTPW_7184_full=
:</p>
<h3>New IGT tests (72)</h3>
<ul>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@bcs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@rcs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vcs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vecs0:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.30, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.23, 3.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.31, 2.35] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.31, 2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.21, 3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.27, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.21, 3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.12, 2.61] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 2.29] s</li>
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
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.10, 2.31] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.26, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.10, 2.29] s</li>
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
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.09, 2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.48] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.22, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
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
<p>igt@kms_async_flips@test-cursor@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [20.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [20.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-=
hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b-=
hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-=
hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-=
hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7184_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb5/igt@gem_ccs@block-copy-compressed.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327=
">i915#5327</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-inplace:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@gem_ccs@block-copy-inplace.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-tglb5/igt@gem_eio@in-flight-contexts-1us.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tgl=
b2/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb1/igt@gem_exec_balancer@parallel-keep-in-=
fence.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5076">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5614">i915#5614</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb8/igt@gem_exec_balancer@parallel-keep-in-=
fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4525">i915#4525</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-kbl3/igt@gem_exec_balancer@parallel-keep-in-f=
ence.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5076">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5614">i915#5614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl3/i=
gt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6496/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard=
-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6496/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard=
-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-=
kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@gem_exec_fair@basic-pace@bcs0.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/28=
42">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
849">i915#2849</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb4/igt@gem_exec_flush@basic-batch-kernel-d=
efault-cmd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109313">fdo#109313</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb6/igt@gem_exec_flush@basic-batch-kernel-d=
efault-cmd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109313">fdo#109313</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-snb2/igt@gem_exec_flush@basic-uc-prw-default.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard=
-snb6/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +4 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb7/igt@gem_exec_params@rsvd2-dirt.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">f=
do#109283</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb4/igt@gem_exec_params@rsvd2-dirt.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">f=
do#109283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb8/igt@gem_exec_params@secure-non-master.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
12283">fdo#112283</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112=
283">fdo#112283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-snb7/igt@gem_exec_whisper@basic-queues.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a>) +211 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-apl6/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190"=
>i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-apl1/igt@gem_lmem_swapping@heavy-verify-mult=
i.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@gem_lmem_swapping@heavy-verify-mul=
ti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-kbl1/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-glk1/igt@gem_lmem_swapping@verify-ccs.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb1/igt@gem_lmem_swapping@verify-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">=
i915#4613</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb3/igt@gem_mmap_gtt@coherency.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111656">fdo#1=
11656</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb1/igt@gem_mmap_gtt@coherency.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109292">fdo#1=
09292</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-y.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-snb=
2/igt@gem_mmap_gtt@fault-concurrent-y.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5161">i915#5161</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb5/igt@gem_pxp@dmabuf-shared-protected-ds=
t-is-context-refcounted.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4270">i915#4270</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@gem_pxp@verify-pxp-execution-after=
-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4270">i915#4270</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb5/igt@gem_softpin@evict-snoop-interruptib=
le.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109312">fdo#109312</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb3/igt@gem_softpin@evict-snoop-interruptib=
le.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109312">fdo#109312</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@gem_userptr_blits@unsync-unmap.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/329=
7">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@gem_userptr_blits@vma-merge.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">=
i915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb8/igt@gen7_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
9">fdo#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb1/igt@gen7_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
9">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb1/igt@gen9_exec_parse@batch-invalid-leng=
th.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2856">i915#2856</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@gen9_exec_parse@bb-secure.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i9=
15#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/28=
56">i915#2856</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb3/igt@i91=
5_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@i915_pm_rpm@dpms-mode-unset-non-lp=
sp.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2411">i915#2411</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb8/igt@i915_pm_rpm@dpms-non-lpsp.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">f=
do#110892</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb8/igt@i915_query@test-query-geometry-subs=
lices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5723">i915#5723</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb1/igt@i915_query@test-query-geometry-subs=
lices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5723">i915#5723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-tglb2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3=
/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb2/igt@i915_suspend@basic-s3-without-i915.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5903">i915#5903</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb2/igt@i915_suspend@basic-s3-without-i915.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5903">i915#5903</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5286">i915#5286</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@kms_big_fb@x-tiled-16bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111614">fdo#111614</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb4/igt@kms_big_fb@x-tiled-16bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110723">fdo#110723</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-kbl4/igt@kms_ccs@pipe-c-bad-aux-stride-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-apl2/igt@kms_ccs@pipe-c-bad-pixel-format-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_ccs@pipe-c-bad-pixel-format-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689">i915#3689</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-glk4/igt@kms_ccs@pipe-c-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb8/igt@kms_ccs@pipe-d-bad-aux-stride-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@kms_ccs@pipe-d-bad-rotation-90-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-glk2/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a>) +157 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-kbl4/igt@kms_ccs@pipe-d-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +370 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_cdclk@plane-scaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#=
3742</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb3/igt@kms_cdclk@plane-scaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#=
3742</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-change-during-suspend:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-glk8/igt@kms_chamelium@dp-edid-change-during-=
suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb6/igt@kms_chamelium@dp-edid-change-during=
-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-snb4/igt@kms_chamelium@hdmi-hpd-for-each-pip=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb2/igt@kms_chamelium@vga-frame-dump.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb5/igt@kms_color@pipe-d-ctm-max.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fd=
o#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
149">i915#1149</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-0-5.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-apl3/igt@kms_color_chamelium@pipe-d-ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb6/igt@kms_content_protection@atomic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063"=
>i915#1063</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb4/igt@kms_content_protection@atomic.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300=
">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111066">fdo#111066</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb5/igt@kms_content_protection@dp-mst-lic-=
type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3116">i915#3116</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb6/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3299">i915#3299</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-kbl1/igt@kms_content_protection@legacy.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
19">i915#1319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-kbl3/igt@kms_content_protection@uevent.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105"=
>i915#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x1=
70-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109279">fdo#109279</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-512x5=
12-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-32x10=
-offscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3359">i915#3359</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-32x32=
-offscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3319">i915#3319</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-fli=
p-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6496/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7184/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transition=
s.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2346">i915#2346</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6496/shard-iclb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transition=
s.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7184/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transiti=
ons.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2346">i915#2346</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-glk2/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-kbl7/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb2/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pa=
ttern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/426">i915#426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb8/igt@kms_draw_crc@draw-method-rgb565-mm=
ap-cpu-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb8888-=
pwrite-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb2/igt@kms_flip@2x-nonexisting-fb-interru=
ptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111825">fdo#111825</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb4/igt@kms_flip@2x-wf_vblank-ts-check.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
74">fdo#109274</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
184/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">=
i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytil=
e-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7184/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to=
-64bpp-ytile-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/4911">i915#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2587">i915#2587</a>) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +34 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-apl2/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +146 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +45 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_multipipe_modeset@basic-max-pip=
e-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1839">i915#1839</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb7/igt@kms_multipipe_modeset@basic-max-pip=
e-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1839">i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_718=
4/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
36">i915#3536</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb1/igt@kms_plane_lowres@pipe-c-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
36">i915#3536</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb2/igt@kms_plane_lowres@pipe-d-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-c-t=
iling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb3/igt@kms_prime@basic-crc@first-to-secon=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1836">i915#1836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-kbl1/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/658">i915#658</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2920">i915#2920</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-glk5/igt@kms_psr2_sf@cursor-plane-move-contin=
uous-exceed-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb7=
/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1094=
41">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb6/igt@kms_psr@psr2_primary_blt.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i915=
#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3467"=
>i915#3467</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb1/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-apl4/igt@kms_vblank@pipe-d-wait-idle.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/533">i915#533</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb5/igt@kms_vrr@flip-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-kbl3/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@nouveau_crc@pipe-a-ctx-flip-skip-c=
urrent-frame.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2530">i915#2530</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb7/igt@nouveau_crc@pipe-c-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2530">i915#2530</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_export:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@prime_nv_api@i915_nv_double_export=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109291">fdo#109291</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import_to_different_fd:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-iclb1/igt@prime_nv_api@nv_self_import_to_dif=
ferent_fd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109291">fdo#109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb2/igt@prime_vgem@basic-userptr.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo=
#109295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/33=
01">i915#3301</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb2/igt@prime_vgem@basic-userptr.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo=
#109295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/33=
01">i915#3301</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb6/igt@prime_vgem@fence-write-hang.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">=
fdo#109295</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb4/igt@prime_vgem@fence-write-hang.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">=
fdo#109295</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-transfer-non-existent-point:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-kbl7/igt@syncobj_timeline@invalid-transfer-n=
on-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/5098">i915#5098</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-glk4/igt@sysfs_clients@recycle-many.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2994">i915#2994</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7184/shard-kbl7/igt@sysfs_clients@sema-10.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-tglb7/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-iclb6/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb5/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3070">i915#3070=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/=
shard-iclb7/igt@gem_eio@in-flight-contexts-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-tglb5/igt@gem_eio@kms.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb6/igt@gem_ei=
o@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#45=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_718=
4/shard-iclb2/igt@gem_exec_balancer@parallel-balancer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard=
-apl8/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6496/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/=
shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +2 simila=
r issues</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6496/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#284=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184=
/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-tglu-1/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3987">i915#3987</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/sh=
ard-tglu-2/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-4/igt@i915_suspend@fence-restore-tiled2untiled.html">FA=
IL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103375">f=
do#103375</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7184/shard-rkl-2/igt@i915_suspend@fence-restore-tiled2untiled.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-kbl7/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard=
-kbl1/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-1/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc=
_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7184/shard-rkl-6/igt@kms_ccs@pipe-b-crc-primary-bas=
ic-y_tiled_gen12_rc_ccs_cc.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112022=
">fdo#112022</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7184/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscre=
en.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-4/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070"=
>i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7184/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying=
-size.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7184/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-a=
fter-cursor-varying-size.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5072">i91=
5#5072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7184/shard-iclb2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-yti=
led.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7184/shard-rkl-6/igt@kms_draw_crc@draw-method-x=
rgb2101010-mmap-gtt-ytiled.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915=
#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_71=
84/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7184/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb=
-draw-mmap-cpu.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7184/shard-glk9/igt@kms_frontbuffer_tracking=
@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-badstride.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915=
#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098=
">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7184/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-badstride.html">PAS=
S</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right@pipe-b-plane=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3558">i915#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7184/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right=
@pipe-b-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7184/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-cons=
tant-alpha-max.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats=
@pipe-b-edp-1}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-iclb5/igt@kms_plane_sc=
aling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">=
PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-=
edp-1}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-=
factor-0-5@pipe-b-edp-1.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7184/shard-iclb4/igt@kms_plane_scaling@planes-u=
pscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html">PASS</a> +2 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-=
iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-tglb3/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb7=
/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i=
915#5614</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7184/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525=
</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb3/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4=
525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_71=
84/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#56=
14</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard=
-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7184/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continu=
ous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/29=
20">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7184/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl2/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/s=
hard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_6496/shard-apl4/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-apl7/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_6496/shard-apl6/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#43=
12</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i=
915#5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7184/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl2/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_718=
4/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl4/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard=
-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7184/shard-apl6/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-apl1/i=
gt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb1/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496=
/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb7/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tg=
lb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGT_6496/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb3/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_6496/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-tglb7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_6496/shard-tglb6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-t=
glb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7184/shard-tglb7/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb7/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7184/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7184/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-tglb3/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7184/shard-tglb5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6496/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/s=
hard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_6496/shard-kbl6/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl7/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_6496/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl1/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6496/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl4/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/=
shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6496/shard-kbl4/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6496/shard-kbl4/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_6496/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#43=
12</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i=
915#5257</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/9=
2">i915#92</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7184/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl6/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
184/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl7/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/sha=
rd-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7184/shard-kbl3/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl3=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7184/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl7/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7184/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/shard-kbl7/igt@runner@ab=
orted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5257">i915#5257</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6496 -&gt; IGTPW_7184</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11705: 18a2e6dbca526f996da04741cf5ef169e810a50e @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7184: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7184/index.htm=
l<br />
  IGT_6496: 58a5a2d5be19b916311541401aaa48b787f9a185 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5551776244301296693==--
