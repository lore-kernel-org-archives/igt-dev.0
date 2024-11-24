Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED9AE668A4
	for <igt-dev@archiver.kernel.org>; Sun, 24 Nov 2024 10:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683CF10E20F;
	Sun, 24 Nov 2024 10:39:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467E010E00D;
 Sun, 24 Nov 2024 10:39:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Async_flip_with_atomic_c?=
 =?utf-8?q?ommit_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Nov 2024 10:39:06 -0000
Message-ID: <173244474630.2400440.17905794775176160200@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121115451.2917187-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241121115451.2917187-1-santhosh.reddy.guddati@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

== Series Details ==

Series: Async flip with atomic commit (rev4)
URL   : https://patchwork.freedesktop.org/series/139163/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15725_full -> IGTPW_12157_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12157_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12157_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12157_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_cs_tlb@engines@rcs0:
    - shard-rkl:          [PASS][1] -> [DMESG-WARN][2] +30 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-5/igt@gem_cs_tlb@engines@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-4/igt@gem_cs_tlb@engines@rcs0.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu-1:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [PASS][4] -> [DMESG-FAIL][5] +1 other test dmesg-fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-dg2:          [PASS][6] -> [SKIP][7] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-5/igt@i915_pm_rpm@reg-read-ioctl.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc (NEW):
    - shard-dg1:          NOTRUN -> [SKIP][8] +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][9] +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc (NEW):
    - shard-tglu-1:       NOTRUN -> [SKIP][10] +7 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][14] +9 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_vblank@wait-idle-hang:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][15] +6 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-2/igt@kms_vblank@wait-idle-hang.html

  
#### Warnings ####

  * igt@core_getversion@all-cards:
    - shard-dg2:          [FAIL][16] ([i915#12869]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@core_getversion@all-cards.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@core_getversion@all-cards.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          [SKIP][18] ([i915#4270]) -> [TIMEOUT][19] +1 other test timeout
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-7/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [DMESG-FAIL][20] ([i915#12964]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-3/igt@gem_tiled_swapping@non-threaded.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-5/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2:          [SKIP][22] ([i915#2575]) -> [SKIP][23] +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@kms_flip@2x-flip-vs-suspend.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [SKIP][24] ([i915#9519]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-dg2:          [SKIP][26] -> [INCOMPLETE][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@kms_psr@fbc-pr-sprite-blt.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-8/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          [FAIL][28] ([i915#9100]) -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-1/igt@perf@non-zero-reason.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@perf@non-zero-reason.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][30] +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-9/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15725_full and IGTPW_12157_full:

### New IGT tests (108) ###

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.51] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 51.42] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-linear:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.09, 2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-x:
    - Statuses : 3 pass(s)
    - Exec time: [2.07, 2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.13, 2.53] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.58] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.56] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.63] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-linear:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.15, 2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-x:
    - Statuses : 2 pass(s)
    - Exec time: [2.07, 2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.56] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.62] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.67] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.26] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-linear:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.10, 2.03] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-x:
    - Statuses : 3 pass(s)
    - Exec time: [2.05, 2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.55] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.56] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.11] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.62] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-linear:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.15, 2.03] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-x:
    - Statuses : 2 pass(s)
    - Exec time: [2.05, 2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.51] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.58] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.12] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.11] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.67] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-4-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-4-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.22] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-4-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-linear:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.15, 2.03] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-x:
    - Statuses : 2 pass(s)
    - Exec time: [2.05, 2.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.51] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.11] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-linear:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.54] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.65] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.26] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-4-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-4-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-4-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.03] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.05] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.11] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-4-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-4-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.26] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-4-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@crc-atomic:
    - Statuses : 3 pass(s)
    - Exec time: [4.67, 9.57] s

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.23] s

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.19] s

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.77] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.17] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_async_flips@test-cursor-atomic:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.19] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.14] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_async_flips@test-time-stamp-atomic:
    - Statuses : 4 pass(s)
    - Exec time: [0.52, 3.57] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.23] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.25] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.26] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.25] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  

Known issues
------------

  Here are the changes found in IGTPW_12157_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#8411])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-7/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#6230])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-2/igt@api_intel_bb@crc32.html

  * igt@core_getversion@basic:
    - shard-dg2:          NOTRUN -> [FAIL][33] ([i915#12866])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@core_getversion@basic.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#9318])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-4/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#8414]) +30 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@drm_fdinfo@isolation@vecs0.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#8414]) +9 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-1/igt@drm_fdinfo@virtual-busy-all.html

  * igt@fbdev@info:
    - shard-dg2:          [PASS][37] -> [SKIP][38] ([i915#1849] / [i915#2582])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-10/igt@fbdev@info.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@fbdev@info.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#2582])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@fbdev@unaligned-read.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#3936])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-1/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3555] / [i915#9323])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#9323])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu-1:       NOTRUN -> [SKIP][43] ([i915#9323]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#9323])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#3555] / [i915#9323])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-5/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][46] -> [INCOMPLETE][47] ([i915#7297])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][48] ([i915#7697])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-4/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#7697])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-10/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#8562])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-2/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#8562])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-5/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_engines@execute-allforone:
    - shard-dg2:          [PASS][52] -> [SKIP][53] ([i915#2575]) +153 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-5/igt@gem_ctx_engines@execute-allforone.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@gem_ctx_engines@execute-allforone.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][54] ([i915#1099])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#8555])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg1:          NOTRUN -> [FAIL][56] ([i915#11980] / [i915#12580])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][57] ([i915#280]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@gem_ctx_sseu@engines.html
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#280])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#280]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-7/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][60] ([i915#10030] / [i915#7975] / [i915#8213])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-1/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4771])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu-1:       NOTRUN -> [FAIL][62] ([i915#6117])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][63] ([i915#11713])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-3/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#6334]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#6334]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-7/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4812]) +6 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@gem_exec_fence@submit.html
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4812]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-1/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3539] / [i915#4852]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_reloc@basic-cpu-wc:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3281]) +14 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@gem_exec_reloc@basic-cpu-wc.html

  * igt@gem_exec_reloc@basic-gtt-active:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3281]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-7/igt@gem_exec_reloc@basic-gtt-active.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#3281]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         [PASS][72] -> [ABORT][73] ([i915#7975] / [i915#8213]) +1 other test abort
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-9/igt@gem_exec_suspend@basic-s4-devices.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4860]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-3/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#12936])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#4613]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4565]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          [PASS][78] -> [SKIP][79] ([i915#12936]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-6/igt@gem_lmem_swapping@parallel-multi.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][80] ([i915#4613]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#12193]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-glk:          NOTRUN -> [SKIP][82] ([i915#4613]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-glk2/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][83] ([i915#5493]) +1 other test timeout
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#4613]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-6/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#284])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#284])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-5/igt@gem_media_vme.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4083]) +8 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4077]) +12 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#4077]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#4083]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-6/igt@gem_mmap_wc@bad-object.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][91] ([i915#2658]) +1 other test warn
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-glk3/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3282]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-10/igt@gem_pread@snoop.html
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#3282])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-4/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#3282]) +7 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][95] ([i915#2658])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-tglu-1:       NOTRUN -> [SKIP][96] ([i915#4270])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][97] ([i915#12917]) +1 other test timeout
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-2/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4270])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#4270]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-10/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4270]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#5190] / [i915#8428]) +7 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-4/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#2575] / [i915#5190])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4079]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4079])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4885])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-2/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#4885])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#3297]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-5/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#3297] / [i915#3323])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-9/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#3297]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-8/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3297] / [i915#4880]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3297]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#3297]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#3297]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#2856])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-2/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#2527])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-7/igt@gen9_exec_parse@bb-start-out.html
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#2527]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-tglu-1:       NOTRUN -> [SKIP][117] ([i915#2527] / [i915#2856])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#2527] / [i915#2856]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-2/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][119] -> [ABORT][120] ([i915#12928])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][121] +10 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [PASS][122] -> [FAIL][123] ([i915#12548] / [i915#3591]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-rkl:          [PASS][124] -> [DMESG-WARN][125] ([i915#12964]) +2 other tests dmesg-warn
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-4/igt@i915_pm_rpm@gem-idle.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-4/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#11681] / [i915#6621])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#5723])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-10/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [DMESG-WARN][128] ([i915#1982] / [i915#9311])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-glk3/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-glk:          NOTRUN -> [DMESG-WARN][129] ([i915#9311])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-glk3/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [PASS][130] -> [INCOMPLETE][131] ([i915#4817])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#7707])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#4212])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-8/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - shard-dg2:          [PASS][134] -> [SKIP][135] ([i915#2575] / [i915#5190])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-6/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#4212]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#8709]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#8709]) +7 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-17/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][139] ([i915#5286]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#5286]) +6 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-10/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#5286])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#4538] / [i915#5286]) +7 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#5286]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#3638]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#3638])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#5190]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#4538] / [i915#5190]) +6 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#4538]) +8 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][149] +87 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#6095]) +59 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#10307] / [i915#6095]) +113 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-10/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#12313])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#6095]) +20 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#12313]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#6095]) +79 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#12313])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#12313]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#6095]) +170 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#6095]) +73 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#3742])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#7828]) +15 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#7828]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-4/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#7828]) +6 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#7828]) +3 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#7828]) +8 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-5/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#3116] / [i915#3299]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-4/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#3299])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#6944] / [i915#9424])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-10/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#9424])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-8/igt@kms_content_protection@lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#9424])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-1/igt@kms_content_protection@lic-type-1.html
    - shard-tglu-1:       NOTRUN -> [SKIP][172] ([i915#6944] / [i915#9424])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_content_protection@lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#9424])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#7118])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-6/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#7116])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#7118] / [i915#9424])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-5/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-tglu-1:       NOTRUN -> [SKIP][177] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#3555]) +7 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#12976])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3555]) +4 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#12976]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#12976])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#12976]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#4103])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#4103] / [i915#4213]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#4103])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#4103] / [i915#4213])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#8588])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-9/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#3804])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#1257])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#8812])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#3840])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#3840])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][194] ([i915#3555] / [i915#3840])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#3555] / [i915#3840])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#3555] / [i915#3840]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-10/igt@kms_dsc@dsc-with-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#3555] / [i915#3840])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#3840] / [i915#9053])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#3469])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#3469]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][201] ([i915#2065] / [i915#4854])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#1839])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#1839])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#658])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#3637]) +7 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#8381]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#9934]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-5/igt@kms_flip@2x-plain-flip.html
    - shard-tglu-1:       NOTRUN -> [SKIP][208] ([i915#3637]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#9934]) +10 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][210] ([i915#2122]) +5 other tests fail
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-8/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2:          [PASS][211] -> [FAIL][212] ([i915#2122])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-10/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
    - shard-rkl:          [PASS][213] -> [FAIL][214] ([i915#2122]) +2 other tests fail
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1:
    - shard-snb:          [PASS][215] -> [FAIL][216] ([i915#2122]) +7 other tests fail
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-dp4:
    - shard-dg2:          NOTRUN -> [FAIL][217] ([i915#2122]) +2 other tests fail
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-10/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-dp4.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#8381])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-6/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-panning@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][219] ([i915#12964]) +1 other test dmesg-warn
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-4/igt@kms_flip@flip-vs-panning@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#2672] / [i915#3555])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#2587] / [i915#2672]) +5 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#2672] / [i915#3555]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#2587] / [i915#2672]) +6 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#2672] / [i915#3555] / [i915#5190])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#2672]) +4 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][227] ([i915#2672] / [i915#3555]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#2587] / [i915#2672]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#2672] / [i915#3555]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#2672] / [i915#3555]) +6 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#2672]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#5274])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-5/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][233] +61 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-tglu-1:       NOTRUN -> [SKIP][234] +58 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][235] +38 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#5354]) +29 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-snb:          [PASS][237] -> [SKIP][238] +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#1825]) +9 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#8708]) +14 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#5439])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#3458]) +7 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#10433] / [i915#3458])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#3458] / [i915#4423])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#9766])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-17/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#3023]) +7 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#4423])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#3458]) +17 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#8708]) +24 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#3555] / [i915#8228]) +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#3555] / [i915#8228]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-7/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#12713])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#3555] / [i915#8228])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-2/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#12339])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#12339]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-17/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#6301])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#6301]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#6301])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-9/igt@kms_panel_fitting@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#6301])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-2/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#6301])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@bad-source:
    - shard-dg1:          [PASS][261] -> [DMESG-WARN][262] ([i915#4423])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg1-12/igt@kms_pipe_crc_basic@bad-source.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-17/igt@kms_pipe_crc_basic@bad-source.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][263] ([i915#12178])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-glk5/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][264] ([i915#7862]) +1 other test fail
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-glk5/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][265] ([i915#12169])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-glk9/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][266] ([i915#10647]) +1 other test fail
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-glk9/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#3555])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-5/igt@kms_plane_lowres@tiling-yf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#3555]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#12247] / [i915#9423]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#12247]) +7 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][271] ([i915#12247]) +4 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-dg2:          [PASS][272] -> [SKIP][273] ([i915#2575] / [i915#9423]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#12247]) +15 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#12247]) +18 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#12247] / [i915#6953] / [i915#9423]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#12247] / [i915#6953])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#12247] / [i915#6953])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#12247]) +13 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#2575] / [i915#9423])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-snb:          NOTRUN -> [SKIP][281] +71 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-snb1/igt@kms_pm_backlight@fade.html
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#9812])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-4/igt@kms_pm_backlight@fade.html
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#5354])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#9685]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#9685])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#3828])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#5978])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][288] -> [SKIP][289] +29 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2:          [PASS][290] -> [SKIP][291] ([i915#12937])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-10/igt@kms_pm_rpm@basic-rte.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [PASS][292] -> [SKIP][293] ([i915#9519])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#12937]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#9519]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][296] -> [SKIP][297] ([i915#12916])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#9519]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#6524] / [i915#6805])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-10/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#11520]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#11520]) +6 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][302] ([i915#11520]) +6 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][303] ([i915#11520]) +13 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-glk3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#11520]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-2/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#11520]) +10 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#9683]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu-1:       NOTRUN -> [SKIP][307] ([i915#9683]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#9732]) +27 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-9/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#1072] / [i915#9732]) +16 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-5/igt@kms_psr@psr2-primary-mmap-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#1072] / [i915#9732]) +9 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-4/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][311] ([i915#9732]) +12 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#1072] / [i915#9732]) +32 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][313] +437 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-glk5/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#5289])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#5289]) +2 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#2575]) +91 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#3555])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#9906]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#9906]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-5/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#3555] / [i915#9906])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#9906])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#9906])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#2437])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-2/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-tglu-1:       NOTRUN -> [SKIP][324] ([i915#2437] / [i915#9412])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-glk:          NOTRUN -> [SKIP][325] ([i915#2437])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-glk9/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#2437])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-7/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#2437] / [i915#9412])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-17/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#2437])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-17/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#2436])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#2434])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-12/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#2433])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@stress-open-close:
    - shard-dg2:          [PASS][332] -> [SKIP][333] ([i915#12506]) +8 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-10/igt@perf@stress-open-close.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@perf@stress-open-close.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#8850])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#12506]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-dg1:          NOTRUN -> [FAIL][336] ([i915#11943]) +1 other test fail
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#8516])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-14/igt@perf_pmu@rc6-all-gts.html
    - shard-tglu:         NOTRUN -> [SKIP][338] ([i915#8516])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-6/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_busy@hang:
    - shard-rkl:          [PASS][339] -> [DMESG-WARN][340] ([i915#12917]) +1 other test dmesg-warn
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-2/igt@prime_busy@hang.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-1/igt@prime_busy@hang.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#3291] / [i915#3708])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-8/igt@prime_vgem@basic-read.html
    - shard-rkl:          NOTRUN -> [SKIP][342] ([i915#3291] / [i915#3708])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-1/igt@prime_vgem@basic-read.html
    - shard-dg1:          NOTRUN -> [SKIP][343] ([i915#3708])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#3708] / [i915#4077])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-2/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#3708] / [i915#4077])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-13/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#9917]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-10/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#9917])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#9917]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][349] ([i915#12910]) +9 other tests fail
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5:
    - shard-tglu-1:       NOTRUN -> [FAIL][350] ([i915#12910]) +9 other tests fail
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-tglu:         NOTRUN -> [FAIL][351] ([i915#12564] / [i915#9781])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-5/igt@syncobj_wait@invalid-wait-zero-handles.html
    - shard-glk:          NOTRUN -> [FAIL][352] ([i915#12564] / [i915#9781])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-glk5/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         [ABORT][353] ([i915#12817] / [i915#5507]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-8/igt@device_reset@unbind-reset-rebind.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-10/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@eof:
    - shard-dg2:          [SKIP][355] ([i915#2582]) -> [PASS][356] +2 other tests pass
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@fbdev@eof.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-4/igt@fbdev@eof.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglu:         [FAIL][357] ([i915#11980] / [i915#12580]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-2/igt@gem_ctx_persistence@hostile.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-tglu-10/igt@gem_ctx_persistence@hostile.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][359] ([i915#12543] / [i915#5784]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg1-18/igt@gem_eio@reset-stress.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg1-17/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fence@syncobj-repeat:
    - shard-rkl:          [DMESG-WARN][361] -> [PASS][362] +2 other tests pass
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-3/igt@gem_exec_fence@syncobj-repeat.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-rkl-2/igt@gem_exec_fence@syncobj-repeat.html

  * igt@gem_linear_blits@interruptible:
    - shard-dg2:          [INCOMPLETE][363] -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-2/igt@gem_linear_blits@interruptible.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-10/igt@gem_linear_blits@interruptible.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-dg2:          [SKIP][365] ([i915#12936]) -> [PASS][366]
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_vm_create@execbuf:
    - shard-dg2:          [SKIP][367] ([i915#2575]) -> [PASS][368] +117 other tests pass
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_vm_create@execbuf.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-6/igt@gem_vm_create@execbuf.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][369] -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [INCOMPLETE][371] ([i915#12455]) -> [PASS][372] +1 other tes

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12157/index.html
