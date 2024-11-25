Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD74ED3B7DF
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 06:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9E810E388;
	Mon, 25 Nov 2024 06:10:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38E610E386;
 Mon, 25 Nov 2024 06:10:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fdsc=3A?=
 =?utf-8?q?_Add_meaningfull_skip_message?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 Nov 2024 06:10:42 -0000
Message-ID: <173251504281.2721053.15516758992405308334@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241125032420.1945935-1-pranay.samala@intel.com>
In-Reply-To: <20241125032420.1945935-1-pranay.samala@intel.com>
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

Series: tests/intel/kms_dsc: Add meaningfull skip message
URL   : https://patchwork.freedesktop.org/series/141738/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15737_full -> IGTPW_12183_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12183_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12183_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12183_full:

### IGT changes ###

#### Possible regressions ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2:          [PASS][1] -> [SKIP][2] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-7/igt@device_reset@unbind-reset-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [PASS][3] -> [DMESG-FAIL][4] +3 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-2/igt@gem_exec_suspend@basic-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-7/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          NOTRUN -> [TIMEOUT][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-snb1/igt@gem_tiled_swapping@non-threaded.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-snb2/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-6/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-rkl:          [PASS][9] -> [SKIP][10] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-5/igt@i915_pm_rpm@gem-execbuf.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-4/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][12] +5 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-7/igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1.html

  * igt@sysfs_heartbeat_interval@nopreempt:
    - shard-rkl:          [PASS][13] -> [DMESG-WARN][14] +49 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-4/igt@sysfs_heartbeat_interval@nopreempt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-1/igt@sysfs_heartbeat_interval@nopreempt.html

  
#### Warnings ####

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          [DMESG-WARN][15] -> [DMESG-FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][17] ([i915#12713]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-4/igt@kms_hdr@brightness-with-hdr.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][19] ([i915#9519]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_lmem_evict@dontneed-evict-race:
    - {shard-dg2-9}:      NOTRUN -> [INCOMPLETE][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-9/igt@gem_lmem_evict@dontneed-evict-race.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15737_full and IGTPW_12183_full:

### New IGT tests (268) ###

  * igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-a-hdmi-a-1-10bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-a-hdmi-a-1-12bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-a-hdmi-a-1-8bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-a-hdmi-a-4-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-a-hdmi-a-4-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-a-hdmi-a-4-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-b-hdmi-a-1-10bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-b-hdmi-a-1-12bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-b-hdmi-a-1-8bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-b-hdmi-a-4-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-b-hdmi-a-4-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-b-hdmi-a-4-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-c-hdmi-a-1-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-c-hdmi-a-1-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-c-hdmi-a-1-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-c-hdmi-a-4-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-c-hdmi-a-4-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-c-hdmi-a-4-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-d-hdmi-a-1-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-d-hdmi-a-1-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-d-hdmi-a-1-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-d-hdmi-a-4-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-d-hdmi-a-4-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc@pipe-d-hdmi-a-4-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb16161616f-10bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb16161616f-12bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb16161616f-8bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb2101010-10bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb2101010-12bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb2101010-8bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xyuv8888-10bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xyuv8888-12bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xyuv8888-8bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-yuyv-10bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-yuyv-12bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-yuyv-8bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb16161616f-10bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb16161616f-12bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb16161616f-8bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb2101010-10bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb2101010-12bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb2101010-8bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xyuv8888-10bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xyuv8888-12bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xyuv8888-8bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-yuyv-10bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-yuyv-12bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-yuyv-8bpc:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb16161616f-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb16161616f-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb16161616f-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb2101010-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb2101010-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb2101010-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xyuv8888-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xyuv8888-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xyuv8888-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-yuyv-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-yuyv-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-yuyv-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb16161616f-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb16161616f-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb16161616f-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb2101010-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb2101010-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb2101010-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xyuv8888-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xyuv8888-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xyuv8888-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-yuyv-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-yuyv-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-yuyv-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-1-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-1-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-1-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-4-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-4-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-4-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-1-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-1-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-1-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-4-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-4-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-4-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-1-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-1-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-1-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-4-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-4-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-4-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-1-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-1-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-1-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-4-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-4-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-4-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-dp-4-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-dp-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-dp-4-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-dp-4-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-4-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-4-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-4-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-dp-4-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-dp-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-dp-4-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-dp-4-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-1-xrgb16161616f:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-1-xyuv8888:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-4-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-4-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-4-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-dp-4-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-dp-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-dp-4-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-dp-4-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-4-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-4-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-4-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-dp-4-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-dp-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-dp-4-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-dp-4-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-1-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-1-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-4-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-4-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-4-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-dp-4-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-dp-4-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-dp-4-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-dp-4-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-dp-4-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-dp-4-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-1-ycbcr420-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-1-ycbcr420-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-1-ycbcr420-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-1-ycbcr444-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-1-ycbcr444-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-1-ycbcr444-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-4-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-4-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-4-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-4-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-4-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-4-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-dp-4-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-dp-4-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-dp-4-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-dp-4-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-dp-4-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-dp-4-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-1-ycbcr420-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-1-ycbcr420-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-1-ycbcr420-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-1-ycbcr444-10bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-1-ycbcr444-12bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-1-ycbcr444-8bpc:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-4-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-4-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-4-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-4-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-4-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-4-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-dp-4-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-dp-4-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-dp-4-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-dp-4-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-dp-4-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-dp-4-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-1-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-1-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-1-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-1-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-1-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-1-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-4-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-4-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-4-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-4-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-4-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-4-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-4-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-4-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-4-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-4-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-4-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-dp-4-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-1-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-1-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-1-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-1-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-1-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-1-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-4-ycbcr420-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-4-ycbcr420-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-4-ycbcr420-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-4-ycbcr444-10bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-4-ycbcr444-12bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-4-ycbcr444-8bpc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-1-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-1-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-2-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-2-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-3-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-3-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-4-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-4-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-1-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-1-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-2-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-2-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-3-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-3-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-4-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-4-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-1-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-1-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-3-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-3-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-4-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-4-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-1-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-1-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-3-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-3-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-4-ycbcr420:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-4-ycbcr444:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_12183_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@default-alignment:
    - shard-dg2:          NOTRUN -> [SKIP][22] +40 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-11/igt@api_intel_allocator@default-alignment.html

  * igt@api_intel_allocator@two-level-inception:
    - shard-dg2:          [PASS][23] -> [SKIP][24] +28 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-8/igt@api_intel_allocator@two-level-inception.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-11/igt@api_intel_allocator@two-level-inception.html

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#8411])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-5/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#8411])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-4/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#6230])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-4/igt@api_intel_bb@crc32.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#11078])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-3/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#8414]) +7 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-12/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@busy@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#8414]) +8 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-4/igt@drm_fdinfo@busy@rcs0.html

  * igt@fbdev@info:
    - shard-dg2:          [PASS][31] -> [SKIP][32] ([i915#1849] / [i915#2582])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-6/igt@fbdev@info.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-11/igt@fbdev@info.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          [PASS][33] -> [SKIP][34] ([i915#2582])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-5/igt@fbdev@unaligned-read.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-11/igt@fbdev@unaligned-read.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#7697]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-12/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][36] ([i915#3555] / [i915#9323])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3555] / [i915#9323])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-14/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#9323])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#13008])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#13008])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-9/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][41] ([i915#9323]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [PASS][42] -> [FAIL][43] ([i915#9561]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-10/igt@gem_ctx_freq@sysfs.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-4/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#8555]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][45] ([i915#11980] / [i915#12580])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-5/igt@gem_ctx_persistence@hostile.html
    - shard-rkl:          NOTRUN -> [FAIL][46] ([i915#11980] / [i915#12580])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-4/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> [FAIL][47] ([i915#11980] / [i915#12580])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@gem_ctx_persistence@hostile.html
    - shard-snb:          NOTRUN -> [SKIP][48] ([i915#1099]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-snb4/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#280]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu-1:       NOTRUN -> [SKIP][50] ([i915#280])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][51] ([i915#5784])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-12/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4812]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-14/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4036])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-1/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][54] ([i915#11965] / [i915#12558]) +2 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-3/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_capture@capture@vecs1-smem:
    - shard-dg2:          NOTRUN -> [FAIL][55] ([i915#11965]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-3/igt@gem_exec_capture@capture@vecs1-smem.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4812]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-8/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3539])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3539] / [i915#4852]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-3/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3539] / [i915#4852]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3281]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-6/igt@gem_exec_reloc@basic-write-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#3281]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-1/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3281]) +15 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4537] / [i915#4812]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-3/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          [PASS][64] -> [ABORT][65] ([i915#7975] / [i915#8213]) +1 other test abort
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg1-13/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4860]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4860]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-7/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-dg2:          [PASS][68] -> [SKIP][69] ([i915#12936]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-3/igt@gem_lmem_swapping@heavy-random.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-11/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#12193])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4565])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#12936])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#4613]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#4613]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [TIMEOUT][75] ([i915#5493]) +1 other test timeout
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - shard-dg1:          NOTRUN -> [DMESG-WARN][76] ([i915#5493]) +1 other test dmesg-warn
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#4613]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-9/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-glk:          NOTRUN -> [SKIP][78] ([i915#4613]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-glk9/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#284])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@big-copy:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4077]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-4/igt@gem_mmap_gtt@big-copy.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4083]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-7/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#2575]) +55 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-11/igt@gem_mmap_wc@invalid-flags.html
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4083]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#3282]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-10/igt@gem_partial_pwrite_pread@write-uncached.html
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#3282]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-2/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][86] ([i915#2658]) +1 other test warn
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-glk5/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu-1:       NOTRUN -> [WARN][87] ([i915#2658])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#3282]) +7 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#4270])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-1/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4270]) +5 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#12975])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-6/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-tglu:         [PASS][92] -> [SKIP][93] ([i915#4270])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-tglu-4/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-8/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#4270]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-5/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#4270])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-6/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#5190] / [i915#8428]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-7/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#2575] / [i915#5190]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#4885])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_pread_basic:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#4079])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@gem_tiled_pread_basic.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4879])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-14/igt@gem_unfence_active_buffers.html
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4879])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-7/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][102] ([i915#3323])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#3297] / [i915#3323])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#3297]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#3282] / [i915#3297])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-4/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#3282] / [i915#3297])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-3/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#3297]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#3297] / [i915#4958])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-4/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#3297]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-3/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#2856]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-8/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#2527]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-1/igt@gen9_exec_parse@bb-chained.html
    - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#2527] / [i915#2856]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#2527]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#2527] / [i915#2856]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-2/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu-1:       NOTRUN -> [ABORT][115] ([i915#12817] / [i915#13010] / [i915#9820])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#7178])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#8399]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-6/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][118] ([i915#6590]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-dg1:          [PASS][119] -> [FAIL][120] ([i915#12739] / [i915#3591])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#11681] / [i915#6621])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-7/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#11681] / [i915#6621])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#11681])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-7/igt@i915_pm_rps@thresholds-park.html
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#11681])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_selftest@mock:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][125] ([i915#9311]) +1 other test dmesg-warn
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-8/igt@i915_selftest@mock.html

  * igt@i915_selftest@perf:
    - shard-tglu:         [PASS][126] -> [ABORT][127] ([i915#13010]) +1 other test abort
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-tglu-10/igt@i915_selftest@perf.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-4/igt@i915_selftest@perf.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - shard-dg2:          [PASS][128] -> [SKIP][129] ([i915#2575] / [i915#5190])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#4212]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#4212])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-4/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#8709]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-12/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#8709]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#1769] / [i915#3555])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#5286]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#5286]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#5286]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538] / [i915#5286]) +5 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#5286])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#3638]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#3638]) +6 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#5190]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#4538] / [i915#5190]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][144] +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#4538]) +7 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-12/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#6095]) +84 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-2/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#10307] / [i915#6095]) +113 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#6095]) +151 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#10307] / [i915#10434] / [i915#6095])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#12805]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#6095]) +72 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#12805])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#6095]) +20 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#12313]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#6095]) +29 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#12313]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#12313])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3742])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-2/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#3742])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#11616] / [i915#7213]) +4 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#7828]) +8 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#7828]) +9 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#7828])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#7828]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-6/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][165] ([i915#7828]) +6 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-snb:          NOTRUN -> [SKIP][166] +79 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-snb4/igt@kms_content_protection@atomic-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#7118] / [i915#9424])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-2/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#7118] / [i915#9424])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#3299])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#3299]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-14/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#6944] / [i915#9424])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#9424])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-10/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#9424])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-2/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#9424])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#6944] / [i915#7116] / [i915#7118])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-5/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#7116] / [i915#9424]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#12976]) +4 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#3555]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#12976]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#12976]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#3555]) +6 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#3555])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#12976])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#12976]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#5354]) +23 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg1:          NOTRUN -> [FAIL][187] ([i915#2346])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#4103])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#4103] / [i915#4213])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#4103])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#9723])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#9723])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#9723])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-12/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#8588])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#3804])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#3555]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-3/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#1257])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-4/igt@kms_dp_aux_dev.html
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#1257])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-5/igt@kms_dp_aux_dev.html
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#1257])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-8/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-pwrite:
    - shard-rkl:          [PASS][200] -> [DMESG-WARN][201] ([i915#12964]) +8 other tests dmesg-warn
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-2/igt@kms_draw_crc@draw-method-pwrite.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-2/igt@kms_draw_crc@draw-method-pwrite.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#3469])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#3955])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3469])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#2065] / [i915#4854])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-3/igt@kms_feature_discovery@chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#4854])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-5/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#4854])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-4/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#4854])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-13/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#1839])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#9337])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-12/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#9337])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#658])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-5/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#658])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#3637]) +9 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][215] -> [FAIL][216] ([i915#2122]) +1 other test fail
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-snb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#8381]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#3637]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-snb:          NOTRUN -> [FAIL][219] ([i915#2122]) +1 other test fail
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#9934]) +7 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][221] -> [FAIL][222] ([i915#2122]) +1 other test fail
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-glk3/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-glk9/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#9934]) +7 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#9934]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#8381])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-6/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-tglu:         NOTRUN -> [FAIL][226] ([i915#2122]) +4 other tests fail
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-2/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#2672] / [i915#3555]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#2672] / [i915#3555] / [i915#5190])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#2672]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#2587] / [i915#2672] / [i915#3555])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#2587] / [i915#2672]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][233] ([i915#2672] / [i915#3555]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][234] ([i915#2587] / [i915#2672]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#2587] / [i915#2672]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#2672] / [i915#3555]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2:          [PASS][237] -> [FAIL][238] ([i915#6880]) +1 other test fail
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-snb:          [PASS][239] -> [SKIP][240] +7 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#1825]) +15 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#8708]) +26 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][243] +63 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#10433] / [i915#3458]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#9766])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#9766])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#3458]) +12 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#3023]) +5 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#8708]) +14 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#3458]) +26 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][251] +115 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#3555] / [i915#8228])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-8/igt@kms_hdr@static-toggle.html
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#3555] / [i915#8228])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#10656])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#12394])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#12339])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#12339])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#1839])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#6301])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglu-1:       NOTRUN -> [SKIP][260] +35 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][261] ([i915#12756])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][262] ([i915#12178])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-glk2/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][263] ([i915#7862]) +1 other test fail
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-glk2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][264] ([i915#12177])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-glk5/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][265] ([i915#10647]) +1 other test fail
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-glk5/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu:         NOTRUN -> [FAIL][266] ([i915#8292]) +1 other test fail
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#2575] / [i915#9423]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-11/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#12247] / [i915#9423])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#12247]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#12247]) +12 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#12247]) +18 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2:          [PASS][272] -> [SKIP][273] ([i915#2575] / [i915#9423]) +5 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#12247] / [i915#6953])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#12247] / [i915#6953])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][276] ([i915#12247]) +4 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#12247] / [i915#3555])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#12247] / [i915#3555] / [i915#9423])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#12247] / [i915#3555])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#12247]) +11 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#5354]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-17/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu-1:       NOTRUN -> [SKIP][282] ([i915#9812])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#9812])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-6/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#5354])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [PASS][285] -> [SKIP][286] ([i915#4281])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#9340])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#3828])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-tglu-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#8430])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/shard-dg1-18/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@fences-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#12937])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_121

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12183/index.html
