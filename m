Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADC7606A321
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 07:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC32B10E523;
	Thu, 12 Nov 2026 07:32:04 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A44810EA79;
 Thu, 12 Nov 2026 07:31:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3889870883255194406=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/i915=5Fpm=5F?=
 =?utf-8?q?rpm=3A_Print_reason_for_skipping_PC8_subtest_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hiresh Kumar Yadav" <hiresh.kumar.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Nov 2026 07:31:09 -0000
Message-ID: <179446866921.13845.17348561804628716429@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261111100742.1983913-1-hiresh.kumar.yadav@intel.com>
In-Reply-To: <20261111100742.1983913-1-hiresh.kumar.yadav@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=0.1 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MPART_ALT_DIFF_COUNT,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3889870883255194406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/i915_pm_rpm: Print reason for skipping PC8 subtest (rev3)
URL   : https://patchwork.freedesktop.org/series/177832/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19493_full -> IGTPW_16134_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16134_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16134_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16134_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-mtlp:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-3/igt@kms_fbcon_fbt@psr-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-tglu:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-7/igt@kms_pm_rpm@basic-rte.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-7/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@pm-tiling:
    - shard-tglu:         [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-7/igt@kms_pm_rpm@pm-tiling.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-7/igt@kms_pm_rpm@pm-tiling.html

  
#### Warnings ####

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg2:          [SKIP][9] ([i915#17434] / [i915#17450]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg2-6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-rkl:          [SKIP][11] ([i915#17434] / [i915#17450]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-dg1:          [SKIP][13] ([i915#17434] / [i915#17450]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg1-15/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglu:         [SKIP][15] ([i915#17434] / [i915#17450]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-mtlp:         [SKIP][17] ([i915#17450]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-mtlp:         [INCOMPLETE][19] ([i915#15582]) -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  
Known issues
------------

  Here are the changes found in IGTPW_16134_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#8411]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-glk:          NOTRUN -> [SKIP][22] ([i915#17576])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@api_intel_bb@crc32.html
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#6230])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-noreloc-purge-cache-simple:
    - shard-snb:          NOTRUN -> [SKIP][24] ([i915#17641])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@api_intel_bb@object-noreloc-purge-cache-simple.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#11078]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-glk11:        NOTRUN -> [SKIP][26] ([i915#17537])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#17753])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@device_reset@unbind-reset-rebind.html

  * igt@dmabuf@dma-buf-fence-chain:
    - shard-glk:          NOTRUN -> [SKIP][28] ([i915#17712])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk1/igt@dmabuf@dma-buf-fence-chain.html

  * igt@fbdev@pan:
    - shard-snb:          NOTRUN -> [FAIL][29] ([i915#15792])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@fbdev@pan.html

  * igt@gem_barrier_race@remote-request:
    - shard-snb:          NOTRUN -> [SKIP][30] ([i915#17589]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@gem_barrier_race@remote-request.html

  * igt@gem_basic@multigpu-create-close:
    - shard-snb:          NOTRUN -> [SKIP][31] ([i915#17675])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@gem_basic@multigpu-create-close.html
    - shard-glk:          NOTRUN -> [SKIP][32] ([i915#17697])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@semaphore:
    - shard-snb:          NOTRUN -> [SKIP][33] ([i915#17671])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#3555] / [i915#9323])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-copy-uncompressed:
    - shard-snb:          NOTRUN -> [SKIP][35] ([i915#17499]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gem_ccs@block-copy-uncompressed.html
    - shard-glk11:        NOTRUN -> [SKIP][36] ([i915#17499])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gem_ccs@block-copy-uncompressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-glk:          NOTRUN -> [SKIP][37] ([i915#17499]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#3555] / [i915#9323])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#9323]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#9323])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#9323])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#7697])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-glk:          NOTRUN -> [SKIP][43] ([i915#17513])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-mtlp:         NOTRUN -> [FAIL][44] ([i915#17176]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][45] ([i915#13356] / [i915#16466]) +1 other test incomplete
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-snb:          NOTRUN -> [ABORT][46] ([i915#15840]) +10 other tests abort
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-glk:          NOTRUN -> [SKIP][47] ([i915#17535])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#17444])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#8555])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-snb:          NOTRUN -> [SKIP][50] ([i915#17621]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][51] ([i915#1099]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_shared@q-promotion:
    - shard-snb:          NOTRUN -> [SKIP][52] ([i915#17342]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@gem_ctx_shared@q-promotion.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-glk:          NOTRUN -> [SKIP][53] ([i915#17496])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#280]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#280]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-9/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][56] ([i915#13356] / [i915#13390])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4812]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@gem_exec_balancer@bonded-true-hang.html
    - shard-snb:          NOTRUN -> [SKIP][58] ([i915#17587]) +14 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#8555]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-glk:          NOTRUN -> [SKIP][60] ([i915#17547]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@gem_exec_balancer@parallel-contexts.html
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#4525]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#4525])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-4/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4812]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@pi:
    - shard-snb:          NOTRUN -> [SKIP][64] ([i915#17610]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@gem_exec_capture@pi.html

  * igt@gem_exec_fence@parallel:
    - shard-snb:          NOTRUN -> [SKIP][65] ([i915#17599]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@gem_exec_fence@parallel.html

  * igt@gem_exec_fence@submit:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4812])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-snb:          NOTRUN -> [SKIP][67] ([i915#17612])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3539] / [i915#4852]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3539]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-glk11:        NOTRUN -> [SKIP][70] ([i915#17565])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gem_exec_params@rsvd2-dirt.html
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#17453])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#17416]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_exec_params@secure-non-master.html
    - shard-glk11:        NOTRUN -> [SKIP][73] ([i915#17523])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#17416])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-4/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#14544] / [i915#3281]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#3281])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#3281]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#3281]) +8 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#3281]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@gem_exec_reloc@basic-write-wc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#4537] / [i915#4812])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-chain.html
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4537] / [i915#4812])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-snb:          NOTRUN -> [SKIP][82] ([i915#17590]) +13 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][83] ([i915#13196] / [i915#13356]) +1 other test incomplete
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-tglu:         [PASS][84] -> [ABORT][85] ([i915#15840]) +2 other tests abort
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-7/igt@gem_exec_suspend@basic-s3@smem.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-4/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-mtlp:         [PASS][86] -> [INCOMPLETE][87] ([i915#13356] / [i915#7975]) +1 other test incomplete
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-1/igt@gem_exec_suspend@basic-s4-devices.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-snb:          NOTRUN -> [SKIP][88] ([i915#17628])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-snb:          NOTRUN -> [SKIP][89] ([i915#17655]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_exercise_blt@fast-copy:
    - shard-snb:          NOTRUN -> [SKIP][90] ([i915#17622])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@gem_exercise_blt@fast-copy.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#4860]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4860])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#4860])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#2190])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@gem_huc_copy@huc-copy.html
    - shard-snb:          NOTRUN -> [SKIP][95] ([i915#17468])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@gem_huc_copy@huc-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#2190])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-9/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][97] ([i915#17456] / [i915#2190])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#4565]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@massive:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#4613])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-1/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#4613]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-snb:          NOTRUN -> [SKIP][101] ([i915#17503]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#12193]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-glk11:        NOTRUN -> [SKIP][103] ([i915#17503])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-glk:          NOTRUN -> [SKIP][104] ([i915#17503] / [i915#4613]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#4613]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#4077]) +6 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-3/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_gtt@hang-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#4077]) +6 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@gem_mmap_gtt@hang-busy.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#4083]) +6 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@close:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#4083]) +9 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_mmap_wc@close.html

  * igt@gem_mmap_wc@write:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#4083]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@gem_mmap_wc@write.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#3282]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#3282]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_ppgtt@shrink-vs-evict-pinned:
    - shard-snb:          NOTRUN -> [SKIP][113] ([i915#17615])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@gem_ppgtt@shrink-vs-evict-pinned.html

  * igt@gem_pread@exhaustion:
    - shard-glk10:        NOTRUN -> [WARN][114] ([i915#2658])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-glk11:        NOTRUN -> [SKIP][115] ([i915#17521])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-snb:          NOTRUN -> [SKIP][116] ([i915#17521]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#4270])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          [PASS][118] -> [SKIP][119] ([i915#4270])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#4270]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4270]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-glk:          NOTRUN -> [SKIP][122] ([i915#17521]) +4 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_readwrite@beyond-eob:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#3282]) +9 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@gem_readwrite@beyond-eob.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#3282])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-snb:          NOTRUN -> [SKIP][125] ([i915#17492]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-glk11:        NOTRUN -> [SKIP][126] ([i915#17492])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#8428])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][128] ([i915#17492]) +7 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-snb:          NOTRUN -> [SKIP][129] ([i915#17591]) +7 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#5190] / [i915#8428]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#8411]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#17430])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@gem_softpin@evict-snoop.html
    - shard-snb:          NOTRUN -> [SKIP][133] ([i915#17471]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@gem_softpin@evict-snoop.html
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#17430])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-4/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#4885])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@gem_softpin@evict-snoop.html
    - shard-glk:          NOTRUN -> [SKIP][136] ([i915#17551])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk1/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#4885])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][138] ([i915#13356] / [i915#13809] / [i915#16193])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@gem_softpin@noreloc-s3.html
    - shard-rkl:          [PASS][139] -> [INCOMPLETE][140] ([i915#13809] / [i915#16226])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@gem_softpin@noreloc-s3.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#4079])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@gem_tiled_pread_pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#4079])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-glk:          NOTRUN -> [SKIP][143] ([i915#16871])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk9/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#3297]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#3297]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#3297] / [i915#3323])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#3297]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          NOTRUN -> [SKIP][148] ([i915#17507]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#3297]) +4 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-glk11:        NOTRUN -> [SKIP][150] ([i915#17507])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#3282] / [i915#3297])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@gem_userptr_blits@forbidden-operations.html
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#3282] / [i915#3297])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#3282] / [i915#3297])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#3297] / [i915#4880])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#3297])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-glk10:        NOTRUN -> [SKIP][156] ([i915#17507])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-glk:          NOTRUN -> [SKIP][157] ([i915#17507]) +5 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_vm_create@create-ext:
    - shard-snb:          NOTRUN -> [SKIP][158] ([i915#17596]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@gem_vm_create@create-ext.html

  * igt@gen3_render_tiledx_blits:
    - shard-glk:          NOTRUN -> [SKIP][159] ([i915#17511])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@gen3_render_tiledx_blits.html
    - shard-snb:          NOTRUN -> [SKIP][160] ([i915#17511])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@gen3_render_tiledx_blits.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#17455]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@gen3_render_tiledx_blits.html

  * igt@gen3_render_tiledy_blits:
    - shard-glk:          NOTRUN -> [SKIP][162] ([i915#17578])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@gen3_render_tiledy_blits.html
    - shard-snb:          NOTRUN -> [SKIP][163] ([i915#17578])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-snb:          NOTRUN -> [SKIP][164] ([i915#17505]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-glk:          NOTRUN -> [SKIP][165] ([i915#17505]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@gen7_exec_parse@batch-without-end.html
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#17455]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-glk10:        NOTRUN -> [SKIP][167] ([i915#17505])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-glk11:        NOTRUN -> [SKIP][168] ([i915#16871])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#2527]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-snb:          NOTRUN -> [SKIP][170] ([i915#17597]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#2527] / [i915#2856]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-2/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#2856]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@gen9_exec_parse@shadow-peek.html
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#2527]) +6 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gen9_exec_parse@shadow-peek.html
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#2856]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@gen9_exec_parse@shadow-peek.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][175] ([i915#118])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_drm_fdinfo@busy-check-all:
    - shard-snb:          NOTRUN -> [SKIP][176] ([i915#17603]) +9 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@i915_drm_fdinfo@busy-check-all.html

  * igt@i915_drm_fdinfo@busy-idle@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#14073]) +11 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@i915_drm_fdinfo@busy-idle@bcs0.html

  * igt@i915_drm_fdinfo@most-busy-check-all@bcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#14073]) +6 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@i915_drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@i915_drm_fdinfo@most-busy-check-all@vecs0:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#14073]) +7 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-3/igt@i915_drm_fdinfo@most-busy-check-all@vecs0.html

  * igt@i915_drm_fdinfo@virtual-busy:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#14118])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@i915_drm_fdinfo@virtual-busy.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-glk10:        NOTRUN -> [ABORT][181] ([i915#15342]) +1 other test abort
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@intel_gt_init-enodev:
    - shard-glk10:        NOTRUN -> [SKIP][182] ([i915#17600]) +4 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#6412])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#7178])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@i915_module_load@resize-bar.html
    - shard-snb:          NOTRUN -> [SKIP][185] ([i915#17566])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@i915_module_load@resize-bar.html
    - shard-glk11:        NOTRUN -> [SKIP][186] ([i915#17566])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#8399])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-glk11:        NOTRUN -> [SKIP][188] ([i915#17526])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq:
    - shard-glk:          NOTRUN -> [SKIP][189] ([i915#17699]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@i915_pm_freq_mult@media-freq.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#14498])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-glk:          NOTRUN -> [SKIP][191] ([i915#17690])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-snb:          NOTRUN -> [SKIP][192] ([i915#17690])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#11681] / [i915#6621])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#11681])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@i915_pm_rps@thresholds.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#6245])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-snb:          NOTRUN -> [SKIP][196] ([i915#17629]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@i915_query@query-topology-known-pci-ids.html
    - shard-glk:          NOTRUN -> [SKIP][197] ([i915#17574])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-glk:          NOTRUN -> [SKIP][198] ([i915#17673])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][199] ([i915#4817] / [i915#7443])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-7/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          [PASS][200] -> [INCOMPLETE][201] ([i915#13356] / [i915#16182] / [i915#4817])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-glk1/igt@i915_suspend@sysfs-reader.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk9/igt@i915_suspend@sysfs-reader.html
    - shard-rkl:          [PASS][202] -> [INCOMPLETE][203] ([i915#4817])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@i915_suspend@sysfs-reader.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-read:
    - shard-glk10:        NOTRUN -> [SKIP][204] ([i915#11680])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#5190]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#4212]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#4212])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [FAIL][208] ([i915#14888]) +1 other test fail
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-snb:          NOTRUN -> [SKIP][209] ([i915#17562])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
    - shard-glk:          NOTRUN -> [SKIP][210] ([i915#17562])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][211] ([i915#17613]) +3 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][212] ([i915#17614]) +5 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1.html

  * igt@kms_atomic@atomic-plane-damage:
    - shard-glk:          NOTRUN -> [SKIP][213] ([i915#17485])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_atomic@atomic-plane-damage.html
    - shard-snb:          NOTRUN -> [SKIP][214] ([i915#17485])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_atomic@atomic-plane-damage.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#1769] / [i915#3555])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#4538] / [i915#5286]) +5 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#5286])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#17432] / [i915#5286]) +4 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#4538] / [i915#5286]) +4 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-glk11:        NOTRUN -> [SKIP][220] ([i915#17478]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-snb:          NOTRUN -> [SKIP][221] ([i915#17478]) +25 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-glk10:        NOTRUN -> [SKIP][222] ([i915#17478]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#17431]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#17431])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#17431])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-glk:          NOTRUN -> [SKIP][226] ([i915#17500]) +8 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-snb:          NOTRUN -> [SKIP][227] ([i915#17500]) +5 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#3828])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#3828])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-snb:          NOTRUN -> [SKIP][230] ([i915#17524])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-glk:          NOTRUN -> [SKIP][231] ([i915#17524])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#17431] / [i915#3638]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - shard-snb:          NOTRUN -> [SKIP][233] ([i915#17557])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-glk11:        NOTRUN -> [SKIP][234] ([i915#17500]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#3638]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][236] ([i915#17478]) +13 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-snb:          NOTRUN -> [SKIP][237] ([i915#17556])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#17432]) +5 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#17432]) +5 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#4538]) +7 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#4538] / [i915#5190]) +5 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#4538]) +8 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][244] ([i915#17490] / [i915#17491]) +11 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [SKIP][245] ([i915#17491]) +31 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#6095]) +19 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-glk:          NOTRUN -> [SKIP][247] ([i915#17525]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#12313]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#6095]) +158 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][250] ([i915#17490] / [i915#17491]) +39 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#10307] / [i915#6095]) +111 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#12313]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#12313])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#12313])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-snb:          NOTRUN -> [SKIP][255] ([i915#17594]) +30 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-glk10:        NOTRUN -> [SKIP][256] ([i915#17490] / [i915#17491]) +11 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][257] ([i915#17491]) +109 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#12805])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#6095]) +59 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         [PASS][260] -> [FAIL][261] ([i915#17158])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#6095]) +7 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:
    - shard-mtlp:         [PASS][263] -> [INCOMPLETE][264] ([i915#15582]) +1 other test incomplete
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#14098] / [i915#6095]) +60 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][266] ([i915#17491]) +29 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#6095]) +81 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#14544] / [i915#6095]) +5 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-glk:          NOTRUN -> [SKIP][270] ([i915#17550])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk1/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#3742])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-snb:          NOTRUN -> [SKIP][272] ([i915#17550])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#16017])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#3742])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#11151] / [i915#7828]) +7 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-2/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#11151] / [i915#7828]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-snb:          NOTRUN -> [SKIP][277] ([i915#17489])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_chamelium_color@ctm-green-to-red.html
    - shard-glk10:        NOTRUN -> [SKIP][278] ([i915#17489])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#17427]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-glk:          NOTRUN -> [SKIP][280] ([i915#17489]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_chamelium_color@ctm-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#17427]) +3 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#17427]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#17427]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_chamelium_color@gamma.html
    - shard-glk11:        NOTRUN -> [SKIP][284] ([i915#17489])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#17427]) +3 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-glk:          NOTRUN -> [SKIP][286] ([i915#17497]) +7 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html
    - shard-snb:          NOTRUN -> [SKIP][287] ([i915#17497]) +6 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
    - shard-glk11:        NOTRUN -> [SKIP][288] ([i915#17497]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#16471] / [i915#17427])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#16471] / [i915#17427]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#16471] / [i915#17427]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#11151] / [i915#7828]) +11 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#11151] / [i915#7828]) +4 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-snb:          NOTRUN -> [SKIP][294] ([i915#17483]) +16 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#11151])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#11151] / [i915#7828]) +10 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-glk:          NOTRUN -> [SKIP][297] ([i915#17483]) +18 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-glk10:        NOTRUN -> [SKIP][298] ([i915#17483]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-glk11:        NOTRUN -> [SKIP][299] ([i915#17483]) +3 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@deep-color:
    - shard-rkl:          [PASS][300] -> [SKIP][301] ([i915#12655] / [i915#3555])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_color@deep-color.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_color@deep-color.html
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#12655] / [i915#3555])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_color@deep-color.html
    - shard-glk:          NOTRUN -> [SKIP][303] ([i915#17640])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d:
    - shard-snb:          NOTRUN -> [SKIP][304] ([i915#17510]) +6 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html
    - shard-glk11:        NOTRUN -> [SKIP][305] ([i915#17510]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][306] ([i915#17510]) +7 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#16990]) +11 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#16990]) +47 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-snb:          NOTRUN -> [SKIP][309] ([i915#17508]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_content_protection@atomic-hdcp14.html
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#15865]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-9/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#15865]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#15330])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-snb:          NOTRUN -> [SKIP][313] ([i915#17502])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-glk:          NOTRUN -> [SKIP][314] ([i915#17502]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#15330] / [i915#3299])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#15330])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-10/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-glk:          NOTRUN -> [SKIP][317] ([i915#17508]) +5 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_content_protection@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#15865]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#13049]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#8814]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-snb:          NOTRUN -> [SKIP][321] ([i915#17504]) +6 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-glk11:        NOTRUN -> [SKIP][322] ([i915#17504]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-glk:          NOTRUN -> [SKIP][323] ([i915#17533]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#3555]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#3555]) +7 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@kms_cursor_crc@cursor-onscreen-max-size.html
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#3555]) +4 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#3555] / [i915#8814])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-rkl:          NOTRUN -> [FAIL][328] ([i915#13566]) +3 other tests fail
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][329] -> [FAIL][330] ([i915#13566]) +1 other test fail
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-glk:          NOTRUN -> [SKIP][331] ([i915#17504]) +4 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@kms_cursor_crc@cursor-random-max-size.html
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#3555]) +2 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#13049])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#13049]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-snb:          NOTRUN -> [SKIP][335] ([i915#17533]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][336] ([i915#13566]) +1 other test fail
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-mtlp:         [PASS][337] -> [FAIL][338] ([i915#17157]) +1 other test fail
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-6/igt@kms_cursor_crc@cursor-suspend.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#17428]) +109 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#4103])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#4103])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#4103]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#4103]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-mtlp:         NOTRUN -> [SKIP][344] ([i915#16119] / [i915#4213])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#13046] / [i915#17454] / [i915#5354]) +3 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#17428] / [i915#17454]) +2 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-glk:          NOTRUN -> [SKIP][347] ([i915#17549])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          NOTRUN -> [SKIP][348] ([i915#9067])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#9067])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [SKIP][350] ([i915#17457]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-snb:          NOTRUN -> [SKIP][351] ([i915#17457])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-glk:          NOTRUN -> [SKIP][352] ([i915#17515])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#9723])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#13691])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_display_modes@extended-mode-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#13691])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_display_modes@extended-mode-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][356] ([i915#13691])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_display_modes@extended-mode-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][357] ([i915#13691])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#3804])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-snb:          NOTRUN -> [SKIP][359] ([i915#17486]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-tglu:         NOTRUN -> [SKIP][360] ([i915#17289])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-10/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-glk11:        NOTRUN -> [SKIP][361] ([i915#17560])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-dg1:          NOTRUN -> [SKIP][362] ([i915#17287])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#17291])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-glk10:        NOTRUN -> [SKIP][364] ([i915#17664])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-mtlp:         NOTRUN -> [SKIP][365] ([i915#17290])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-glk11:        NOTRUN -> [SKIP][366] ([i915#17477])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_dp_link_training@uhbr-mst.html
    - shard-rkl:          NOTRUN -> [SKIP][367] ([i915#13748])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-dg1:          NOTRUN -> [SKIP][368] ([i915#17285])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-glk:          NOTRUN -> [SKIP][369] ([i915#17477]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
    - shard-snb:          NOTRUN -> [SKIP][370] ([i915#17477]) +2 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-snb:          NOTRUN -> [SKIP][371] ([i915#17680])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-glk11:        NOTRUN -> [SKIP][372] ([i915#17680])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][373] ([i915#8812]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-snb:          NOTRUN -> [SKIP][374] ([i915#17458]) +7 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
    - shard-glk:          NOTRUN -> [SKIP][375] ([i915#17458]) +8 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-formats-ultrajoiner:
    - shard-glk11:        NOTRUN -> [SKIP][376] ([i915#17458])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_dsc@dsc-with-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#16361]) +3 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#16361]) +6 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
    - shard-dg1:          NOTRUN -> [SKIP][379] ([i915#16361]) +3 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
    - shard-tglu:         NOTRUN -> [SKIP][380] ([i915#16361]) +2 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][381] ([i915#16361]) +3 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-snb:          NOTRUN -> [SKIP][382] ([i915#17677])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-mtlp:         NOTRUN -> [FAIL][383] ([i915#17189] / [i915#17349])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][384] ([i915#16680])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@hdr:
    - shard-glk:          NOTRUN -> [SKIP][385] ([i915#17539]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_feature_discovery@hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#16600])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_feature_discovery@hdr.html
    - shard-snb:          NOTRUN -> [SKIP][387] ([i915#17539])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@psr2:
    - shard-glk:          NOTRUN -> [SKIP][388] ([i915#17585])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk9/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][389] ([i915#14544] / [i915#658])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_feature_discovery@vrr:
    - shard-rkl:          NOTRUN -> [SKIP][390] ([i915#16600]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][391] ([i915#8381])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@kms_flip@2x-flip-vs-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][392] ([i915#8381])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-tglu:         NOTRUN -> [SKIP][393] ([i915#3637] / [i915#9934]) +6 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][394] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][395] ([i915#3637] / [i915#9934]) +6 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][396] ([i915#12745] / [i915#13356] / [i915#17183])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          NOTRUN -> [SKIP][397] ([i915#9934]) +6 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - shard-dg1:          NOTRUN -> [SKIP][398] ([i915#9934]) +6 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][399] ([i915#14544] / [i915#9934])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-dg2:          NOTRUN -> [SKIP][400] ([i915#9934]) +5 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][401] ([i915#16276] / [i915#6113]) +1 other test incomplete
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html
    - shard-glk11:        NOTRUN -> [INCOMPLETE][402] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][403] ([i915#12745] / [i915#13356] / [i915#17183])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-tglu:         NOTRUN -> [FAIL][404] ([i915#14600]) +1 other test fail
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:
    - shard-dg2:          [PASS][405] -> [FAIL][406] ([i915#14600]) +1 other test fail
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg2-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-glk10:        NOTRUN -> [SKIP][407] ([i915#17484])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][408] ([i915#17493]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-glk10:        NOTRUN -> [SKIP][409] ([i915#17522]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-snb:          NOTRUN -> [SKIP][410] ([i915#17593]) +13 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][411] ([i915#17522]) +5 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][412] ([i915#15643]) +3 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][413] ([i915#15643]) +8 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][414] ([i915#15643]) +2 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][415] ([i915#15643]) +5 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-glk11:        NOTRUN -> [SKIP][416] ([i915#17484])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][417] ([i915#15643])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][418] ([i915#15643] / [i915#5190]) +3 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-glk:          NOTRUN -> [SKIP][419] ([i915#17484]) +3 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][420] ([i915#15991] / [i915#17428] / [i915#1825]) +16 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-snb:          NOTRUN -> [SKIP][421] ([i915#17606]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-glk11:        NOTRUN -> [SKIP][422] ([i915#17559])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][423] ([i915#5439]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][424] ([i915#15989]) +17 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move:
    - shard-glk:          NOTRUN -> [SKIP][425] ([i915#17517]) +74 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][426] ([i915#17428]) +94 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][427] ([i915#17428]) +80 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:
    - shard-snb:          NOTRUN -> [SKIP][428] ([i915#17588]) +168 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][429] ([i915#15990]) +35 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary:
    - shard-dg1:          NOTRUN -> [SKIP][430] ([i915#15989]) +25 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
    - shard-rkl:          [PASS][431] -> [SKIP][432] ([i915#15989]) +6 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][433] ([i915#13356] / [i915#16056] / [i915#16593])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][434] ([i915#17559]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
    - shard-rkl:          NOTRUN -> [SKIP][435] ([i915#5439]) +1 other test skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
    - shard-snb:          NOTRUN -> [SKIP][436] ([i915#17559]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][437] ([i915#10055])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
    - shard-snb:          NOTRUN -> [SKIP][438] ([i915#17609])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][439] ([i915#10055])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
    - shard-glk11:        NOTRUN -> [SKIP][440] ([i915#17482]) +28 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][441] ([i915#15102]) +44 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][442] ([i915#15102]) +61 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][443] ([i915#15990]) +15 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][444] ([i915#5439]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-glk:          [PASS][445] -> [SKIP][446] ([i915#17517])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-snb:          NOTRUN -> [SKIP][447] ([i915#17517]) +30 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][448] ([i915#15989]) +28 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][449] ([i915#15990]) +6 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][450] ([i915#15989]) +13 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][451] ([i915#15989]) +7 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk11:        NOTRUN -> [SKIP][452] ([i915#17517]) +4 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          NOTRUN -> [SKIP][453] ([i915#15991]) +24 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][454] ([i915#15991] / [i915#17428]) +23 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][455] ([i915#15104] / [i915#15990])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][456] ([i915#15104] / [i915#15990]) +3 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][457] ([i915#15102]) +21 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][458] ([i915#17428] / [i915#1825]) +11 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][459] ([i915#15990] / [i915#8708]) +19 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][460] ([i915#15991] / [i915#5354]) +17 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][461] ([i915#15990] / [i915#8708]) +5 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][462] ([i915#17482]) +184 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][463] ([i915#15990] / [i915#8708]) +14 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][464] ([i915#15102]) +34 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][465] ([i915#17482]) +88 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][466] ([i915#14544] / [i915#17428]) +3 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk10:        NOTRUN -> [SKIP][467] ([i915#17482]) +13 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][468] ([i915#14544] / [i915#15102])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-snb:          NOTRUN -> [FAIL][469] ([i915#17104])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
    - shard-glk11:        NOTRUN -> [FAIL][470] ([i915#17102])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-rkl:          [PASS][471] -> [INCOMPLETE][472] ([i915#17110])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-2/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-snb:          NOTRUN -> [SKIP][473] ([i915#17472])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-glk:          NOTRUN -> [SKIP][474] ([i915#17498]) +4 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@kms_hdr@bpc-switch.html
    - shard-dg2:          NOTRUN -> [SKIP][475] ([i915#16518] / [i915#3555] / [i915#8228])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][476] ([i915#15436])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg1:          NOTRUN -> [SKIP][477] ([i915#12713])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-snb:          NOTRUN -> [SKIP][478] ([i915#17498]) +4 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu:         NOTRUN -> [SKIP][479] ([i915#3555] / [i915#8228])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-glk10:        NOTRUN -> [SKIP][480] ([i915#17498])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][481] ([i915#16644] / [i915#3555] / [i915#8228])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][482] ([i915#3555] / [i915#8228]) +2 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][483] ([i915#15460])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-glk:          NOTRUN -> [SKIP][484] ([i915#17567]) +2 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-snb:          NOTRUN -> [SKIP][485] ([i915#17567]) +2 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-snb:          NOTRUN -> [SKIP][486] ([i915#17575])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][487] ([i915#15458])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][488] ([i915#17512])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][489] ([i915#15460])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][490] ([i915#15458])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][491] ([i915#15458])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][492] ([i915#15638] / [i915#15722])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-glk:          NOTRUN -> [SKIP][493] ([i915#17579])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_mst@mst-suspend-read-crc.html
    - shard-rkl:          NOTRUN -> [SKIP][494] ([i915#16451])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-glk:          NOTRUN -> [SKIP][495] ([i915#17701])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg1:          NOTRUN -> [SKIP][496] ([i915#15815])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][497] ([i915#6301])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-3/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][498] ([i915#6301])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-snb:          NOTRUN -> [SKIP][499] ([i915#17577])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_panel_fitting@legacy.html
    - shard-glk:          NOTRUN -> [SKIP][500] ([i915#17577])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][501] ([i915#6301])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-snb:          NOTRUN -> [SKIP][502] ([i915#17540]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][503] ([i915#17455]) +3 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
    - shard-mtlp:         NOTRUN -> [SKIP][504] ([i915#17455]) +2 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
    - shard-glk10:        NOTRUN -> [SKIP][505] ([i915#17540])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
    - shard-dg2:          NOTRUN -> [SKIP][506] ([i915#17455]) +1 other test skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][507] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#13476] / [i915#16789] / [i915#17799]) +1 other test incomplete
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][508] ([i915#17752] / [i915#17763])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-rkl:          NOTRUN -> [SKIP][509] ([i915#14712])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][510] ([i915#118])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][511] ([i915#15709]) +3 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html
    - shard-dg2:          NOTRUN -> [SKIP][512] ([i915#15709]) +2 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-glk11:        NOTRUN -> [SKIP][513] ([i915#17479]) +1 other test skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][514] ([i915#15709]) +6 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
    - shard-dg1:          NOTRUN -> [SKIP][515] ([i915#15709]) +4 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-glk10:        NOTRUN -> [SKIP][516] ([i915#17479]) +1 other test skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-glk:          NOTRUN -> [SKIP][517] ([i915#17479]) +5 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][518] ([i915#15709]) +5 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-10/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][519] ([i915#16386]) +1 other test skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][520] ([i915#16386]) +1 other test skip
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4:
    - shard-glk:          NOTRUN -> [SKIP][521] ([i915#17494]) +3 other tests skip
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][522] ([i915#16386]) +1 other test skip
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-2/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-snb:          NOTRUN -> [SKIP][523] ([i915#17479]) +10 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-snb:          NOTRUN -> [SKIP][524] ([i915#17598])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-glk10:        NOTRUN -> [SKIP][525] ([i915#17700])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][526] ([i915#10647] / [i915#12169])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][527] ([i915#10647]) +1 other test fail
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@coverage-7efc:
    - shard-snb:          NOTRUN -> [SKIP][528] ([i915#17595]) +2 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_plane_alpha_blend@coverage-7efc.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-glk10:        NOTRUN -> [SKIP][529] ([i915#17509])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg1:          NOTRUN -> [SKIP][530] ([i915#13958]) +1 other test skip
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-snb:          NOTRUN -> [SKIP][531] ([i915#17586])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-snb:          NOTRUN -> [SKIP][532] ([i915#17626])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-glk:          NOTRUN -> [SKIP][533] ([i915#17529]) +1 other test skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
    - shard-snb:          NOTRUN -> [SKIP][534] ([i915#17528] / [i915#17529])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
    - shard-dg1:          NOTRUN -> [SKIP][535] ([i915#15329]) +4 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - shard-glk:          NOTRUN -> [SKIP][536] ([i915#17528]) +1 other test skip
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][537] ([i915#15329] / [i915#3555])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:
    - shard-glk10:        NOTRUN -> [SKIP][538] ([i915#17529]) +1 other test skip
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:
    - shard-glk10:        NOTRUN -> [SKIP][539] ([i915#17528]) +1 other test skip
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][540] ([i915#15329]) +13 other tests skip
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][541] ([i915#15329] / [i915#6953])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][542] ([i915#15329]) +3 other tests skip
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-snb:          NOTRUN -> [SKIP][543] ([i915#17528]) +16 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][544] ([i915#17529]) +8 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-glk10:        NOTRUN -> [SKIP][545] ([i915#17462])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][546] ([i915#12343])
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][547] ([i915#12343])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-glk11:        NOTRUN -> [SKIP][548] ([i915#17462])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-glk:          NOTRUN -> [SKIP][549] ([i915#17462]) +1 other test skip
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][550] ([i915#12343] / [i915#5354])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][551] ([i915#12343] / [i915#5354]) +1 other test skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][552] ([i915#12343] / [i915#5354])
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-snb:          NOTRUN -> [SKIP][553] ([i915#17462]) +1 other test skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-tglu:         [PASS][554] -> [FAIL][555] ([i915#16479])
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-10/igt@kms_pm_dc@dc5-dpms.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-2/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-glk:          [PASS][556] -> [INCOMPLETE][557] ([i915#13356] / [i915#16938])
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-glk2/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-tglu:         NOTRUN -> [SKIP][558] ([i915#9685])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-9/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][559] ([i915#15948])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@kms_pm_dc@dc5-psr.html
    - shard-rkl:          NOTRUN -> [SKIP][560] ([i915#15948])
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_pm_dc@dc5-psr.html
    - shard-snb:          NOTRUN -> [SKIP][561] ([i915#17602]) +2 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][562] ([i915#16914])
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-glk:          NOTRUN -> [SKIP][563] ([i915#17703]) +1 other test skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-glk:          NOTRUN -> [SKIP][564] ([i915#17564]) +1 other test skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_pm_dc@dc6-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][565] ([i915#15948]) +1 other test skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][566] ([i915#9340])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg1:          NOTRUN -> [SKIP][567] ([i915#4077]) +11 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_pm_rpm@cursor.html
    - shard-snb:          NOTRUN -> [SKIP][568] ([i915#17473]) +6 other tests skip
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][569] -> [SKIP][570] ([i915#15073]) +2 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][571] ([i915#15073])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][572] ([i915#15073])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][573] ([i915#15073]) +1 other test skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][574] -> [SKIP][575] ([i915#15073]) +1 other test skip
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][576] ([i915#15073])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-dg1:          NOTRUN -> [SKIP][577] ([i915#17434] / [i915#17450])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_pm_rpm@modeset-pc8-residency-stress.html
    - shard-tglu:         NOTRUN -> [SKIP][578] ([i915#17434] / [i915#17450])
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@package-g7:
    - shard-glk:          NOTRUN -> [SKIP][579] ([i915#17518])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_pm_rpm@package-g7.html
    - shard-rkl:          NOTRUN -> [SKIP][580] ([i915#15403])
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_pm_rpm@package-g7.html
    - shard-dg1:          NOTRUN -> [SKIP][581] ([i915#15403])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-rkl:          [PASS][582] -> [INCOMPLETE][583] ([i915#14419])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-5/igt@kms_pm_rpm@system-suspend-modeset.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][584] ([i915#6524] / [i915#6805])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-3/igt@kms_prime@basic-crc-hybrid.html
    - shard-rkl:          NOTRUN -> [SKIP][585] ([i915#6524])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][586] ([i915#6524]) +1 other test skip
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_prime@basic-crc-hybrid.html
    - shard-snb:          NOTRUN -> [SKIP][587] ([i915#17569]) +1 other test skip
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-glk:          NOTRUN -> [SKIP][588] ([i915#17569]) +1 other test skip
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-glk:          NOTRUN -> [SKIP][589] ([i915#17481])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][590] ([i915#11520]) +6 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][591] ([i915#11520]) +3 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][592] ([i915#11520]) +9 other tests skip
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
    - shard-rkl:          NOTRUN -> [SKIP][593] ([i915#11520]) +10 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][594] ([i915#9808])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][595] ([i915#12316]) +4 other tests skip
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][596] ([i915#11520]) +3 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][597] ([i915#11520]) +10 other tests skip
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][598] ([i915#11520]) +13 other tests skip
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-glk10:        NOTRUN -> [SKIP][599] ([i915#11520]) +1 other test skip
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          NOTRUN -> [SKIP][600] ([i915#9683]) +1 other test skip
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-glk:          NOTRUN -> [SKIP][601] ([i915#17546])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg2:          NOTRUN -> [SKIP][602] ([i915#9683])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg1:          NOTRUN -> [SKIP][603] ([i915#9683])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_psr2_su@page_flip-p010.html
    - shard-snb:          NOTRUN -> [SKIP][604] ([i915#17546])
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-blt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][605] ([i915#9688]) +12 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@kms_psr@fbc-psr-cursor-blt@edp-1.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][606] ([i915#9732]) +19 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-9/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-glk10:        NOTRUN -> [SKIP][607] ([i915#17480]) +4 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][608] ([i915#17480]) +37 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-glk11:        NOTRUN -> [SKIP][609] ([i915#17480]) +6 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][610] ([i915#1072] / [i915#9732]) +24 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-snb:          NOTRUN -> [SKIP][611] ([i915#17480]) +36 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_psr@pr-sprite-plane-onoff.html
    - shard-dg1:          NOTRUN -> [SKIP][612] ([i915#1072] / [i915#9732]) +29 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][613] ([i915#1072] / [i915#9732]) +14 other tests skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr@psr-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][614] ([i915#1072] / [i915#14544] / [i915#9732])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_psr@psr-cursor-mmap-gtt.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-glk:          NOTRUN -> [SKIP][615] ([i915#17480] / [i915#9732])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-snb:          NOTRUN -> [SKIP][616] ([i915#17554])
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg1:          NOTRUN -> [SKIP][617] ([i915#15949])
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-glk11:        NOTRUN -> [SKIP][618] ([i915#17554])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-dg1:          NOTRUN -> [SKIP][619] ([i915#5289])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][620] ([i915#5289])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-snb:          NOTRUN -> [SKIP][621] ([i915#17488]) +6 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][622] ([i915#15867]) +1 other test skip
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-glk11:        NOTRUN -> [SKIP][623] ([i915#17488])
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-glk10:        NOTRUN -> [SKIP][624] ([i915#17488])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-mtlp:         NOTRUN -> [SKIP][625] ([i915#5289])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-glk:          NOTRUN -> [SKIP][626] ([i915#17488]) +3 other tests skip
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-dg2:          NOTRUN -> [SKIP][627] ([i915#12755] / [i915#15867] / [i915#5190])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][628] ([i915#17432] / [i915#5289])
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-glk:          NOTRUN -> [SKIP][629] ([i915#17501]) +1 other test skip
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-snb:          NOTRUN -> [SKIP][630] ([i915#17501])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][631] ([i915#15106]) +6 other tests fail
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-snb:          NOTRUN -> [SKIP][632] ([i915#17604])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][633] ([i915#8623])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-snb:          NOTRUN -> [SKIP][634] ([i915#17652]) +1 other test skip
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][635] ([i915#17653]) +2 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][636] ([i915#12276] / [i915#13356]) +1 other test incomplete
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][637] ([i915#15840] / [i915#17752]) +1 other test dmesg-warn
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][638] ([i915#17752]) +1 other test dmesg-warn
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][639] ([i915#12276] / [i915#13356]) +1 other test incomplete
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-glk11:        NOTRUN -> [SKIP][640] ([i915#17520])
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-snb:          NOTRUN -> [SKIP][641] ([i915#17520])
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-glk:          NOTRUN -> [SKIP][642] ([i915#17561])
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_vrr@lobf.html
    - shard-snb:          NOTRUN -> [SKIP][643] ([i915#17561])
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][644] ([i915#11920])
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][645] ([i915#3555] / [i915#9906])
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][646] ([i915#9906]) +1 other test skip
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-glk:          NOTRUN -> [SKIP][647] ([i915#17520]) +1 other test skip
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@perf@gen12-mi-rpc:
    - shard-glk:          NOTRUN -> [SKIP][648] ([i915#17536]) +2 other tests skip
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@perf@gen12-mi-rpc.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][649] ([i915#2436])
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][650] ([i915#7387])
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@perf@global-sseu-config.html

  * igt@perf@invalid-create-userspace-config:
    - shard-snb:          NOTRUN -> [SKIP][651] ([i915#17592]) +7 other tests skip
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@perf@invalid-create-userspace-config.html

  * igt@perf@mi-rpc:
    - shard-rkl:          NOTRUN -> [SKIP][652] ([i915#2434])
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@perf@mi-rpc.html
    - shard-dg1:          NOTRUN -> [SKIP][653] ([i915#2434])
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@perf@mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][654] ([i915#2433])
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@perf@unprivileged-single-ctx-counters.html
    - shard-dg1:          NOTRUN -> [SKIP][655] ([i915#17455] / [i915#2433])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-accuracy-50@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][656] ([i915#17651]) +1 other test skip
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@perf_pmu@busy-accuracy-50@bcs0.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][657] ([i915#17416]) +1 other test skip
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@perf_pmu@event-wait@rcs0.html
    - shard-rkl:          NOTRUN -> [SKIP][658] ([i915#17416]) +1 other test skip
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@module-unload:
    - shard-glk11:        NOTRUN -> [FAIL][659] ([i915#17119])
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][660] ([i915#8516])
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-mtlp:         [PASS][661] -> [FAIL][662] ([i915#17245])
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-7/igt@perf_pmu@rc6-suspend.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-glk11:        NOTRUN -> [SKIP][663] ([i915#17583])
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-rkl:          NOTRUN -> [SKIP][664] ([i915#8516])
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@semaphore-wait-idle@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][665] ([i915#17648]) +1 other test skip
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@perf_pmu@semaphore-wait-idle@bcs0.html

  * igt@perf_pmu@semaphore-wait-idle@vcs0:
    - shard-snb:          NOTRUN -> [SKIP][666] ([i915#17637]) +3 other tests skip
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@perf_pmu@semaphore-wait-idle@vcs0.html

  * igt@prime_udl@share-import:
    - shard-dg2:          NOTRUN -> [SKIP][667] ([i915#16420])
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@prime_udl@share-import.html
    - shard-rkl:          NOTRUN -> [SKIP][668] ([i915#16420])
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@prime_udl@share-import.html
    - shard-snb:          NOTRUN -> [SKIP][669] ([i915#16420]) +1 other test skip
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@prime_udl@share-import.html

  * igt@prime_udl@share-import-addfb:
    - shard-glk10:        NOTRUN -> [SKIP][670] ([i915#16420])
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][671] ([i915#3708]) +2 other tests skip
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][672] ([i915#3708] / [i915#4077])
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][673] ([i915#3708] / [i915#4077])
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][674] ([i915#17429] / [i915#17448] / [i915#3708])
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-read-hang:
    - shard-glk:          NOTRUN -> [SKIP][675] ([i915#17467])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@prime_vgem@fence-read-hang.html

  * igt@sysfs_heartbeat_interval@precise:
    - shard-snb:          NOTRUN -> [SKIP][676] ([i915#17642]) +1 other test skip
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@sysfs_heartbeat_interval@precise.html

  * igt@sysfs_heartbeat_interval@precise@vcs0:
    - shard-snb:          NOTRUN -> [SKIP][677] ([i915#17643]) +1 other test skip
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@sysfs_heartbeat_interval@precise@vcs0.html

  * igt@sysfs_timeslice_duration@timeout:
    - shard-snb:          NOTRUN -> [SKIP][678] ([i915#17632]) +7 other tests skip
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@sysfs_timeslice_duration@timeout.html

  
#### Possible fixes ####

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          [SKIP][679] ([i915#4270]) -> [PASS][680]
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_softpin@noreloc-s3:
    - shard-tglu:         [ABORT][681] ([i915#15840]) -> [PASS][682]
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-5/igt@gem_softpin@noreloc-s3.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-4/igt@gem_softpin@noreloc-s3.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [INCOMPLETE][683] ([i915#13356] / [i915#14586]) -> [PASS][684]
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-glk6/igt@gem_workarounds@suspend-resume-fd.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [ABORT][685] ([i915#5566]) -> [PASS][686]
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-glk2/igt@gen9_exec_parse@allowed-single.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
    - shard-tglu:         [DMESG-WARN][687] ([i915#17755]) -> [PASS][688]
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-4/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-rkl:          [INCOMPLETE][689] ([i915#13356]) -> [PASS][690]
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@i915_pm_rpm@system-suspend.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg2:          [FAIL][691] ([i915#14888]) -> [PASS][692]
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         [FAIL][693] ([i915#17158]) -> [PASS][694]
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][695] ([i915#13566]) -> [PASS][696] +1 other test pass
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-mtlp:         [FAIL][697] ([i915#17214]) -> [PASS][698] +3 other tests pass
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-5/igt@kms_flip@flip-vs-suspend.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [INCOMPLETE][699] ([i915#10056]) -> [PASS][700]
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-render:
    - shard-glk:          [SKIP][701] ([i915#17517]) -> [PASS][702] +4 other tests pass
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-render.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-glk10:        [SKIP][703] ([i915#17517]) -> [PASS][704]
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-glk10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-mtlp:         [INCOMPLETE][705] ([i915#17319]) -> [PASS][706] +1 other test pass
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-2/igt@kms_hdr@bpc-switch-suspend.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010:
    - shard-mtlp:         [FAIL][707] ([i915#17172]) -> [PASS][708]
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-2/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2:          [INCOMPLETE][709] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#13476]) -> [PASS][710]
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg2-4/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [SKIP][711] ([i915#15073]) -> [PASS][712] +1 other test pass
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-8/igt@kms_pm_rpm@dpms-non-lpsp.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg1:          [SKIP][713] ([i915#15073]) -> [PASS][714] +1 other test pass
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [INCOMPLETE][715] ([i915#14419]) -> [PASS][716]
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [INCOMPLETE][717] ([i915#12276]) -> [PASS][718]
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@perf_pmu@render-node-busy-idle:
    - shard-mtlp:         [FAIL][719] ([i915#4349]) -> [PASS][720] +4 other tests pass
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@perf_pmu@render-node-busy-idle.html
    - shard-dg2:          [FAIL][721] ([i915#4349]) -> [PASS][722] +2 other tests pass
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg2-4/igt@perf_pmu@render-node-busy-idle.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-3/igt@perf_pmu@render-node-busy-idle.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          [SKIP][723] ([i915#14544] / [i915#8411]) -> [SKIP][724] ([i915#8411])
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][725] ([i915#14544] / [i915#3555] / [i915#9323]) -> [SKIP][726] ([i915#3555] / [i915#9323])
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          [SKIP][727] ([i915#14544] / [i915#4525]) -> [SKIP][728] ([i915#4525])
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-rkl:          [SKIP][729] ([i915#3281]) -> [SKIP][730] ([i915#14544] / [i915#3281])
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-active.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          [SKIP][731] ([i915#14544] / [i915#4613]) -> [SKIP][732] ([i915#4613]) +2 other tests skip
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-rkl:          [SKIP][733] ([i915#14544] / [i915#3282]) -> [SKIP][734] ([i915#3282])
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@gem_partial_pwrite_pread@write-uncached.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gen3_render_linear_blits:
    - shard-rkl:          [SKIP][735] ([i915#14544] / [i915#17455]) -> [SKIP][736] ([i915#17455])
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@gen3_render_linear_blits.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-rkl:          [SKIP][737] ([i915#17455]) -> [SKIP][738] ([i915#14544] / [i915#17455])
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@gen7_exec_parse@bitmasks.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          [SKIP][739] ([i915#14544] / [i915#2527]) -> [SKIP][740] ([i915#2527])
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@fault-injection:
    - shard-tglu:         [ABORT][741] ([i915#15342] / [i915#15840]) -> [ABORT][742] ([i915#15342])
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-4/igt@i915_module_load@fault-injection.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@i915_module_load@fault-injection.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          [SKIP][743] ([i915#14544] / [i915#7707]) -> [SKIP][744] ([i915#7707])
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@intel_hwmon@hwmon-write.html
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-rkl:          [SKIP][745] ([i915#4538] / [i915#5286]) -> [SKIP][746] ([i915#14544] / [i915#4538] / [i915#5286])
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-rkl:          [SKIP][747] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][748] ([i915#4538] / [i915#5286])
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][749] ([i915#14544] / [i915#4538]) -> [SKIP][750] ([i915#4538]) +2 other tests skip
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-rkl:          [SKIP][751] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][752] ([i915#14098] / [i915#6095]) +6 other tests skip
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][753] ([i915#14544] / [i915#6095]) -> [SKIP][754] ([i915#6095]) +3 other tests skip
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][755] ([i915#12313] / [i915#14544]) -> [SKIP][756] ([i915#12313])
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][757] ([i915#17158]) -> [INCOMPLETE][758] ([i915#15582]) +1 other test incomplete
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-edp-1:
    - shard-mtlp:         [INCOMPLETE][759] ([i915#15582]) -> [FAIL][760] ([i915#17158])
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-edp-1.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-rkl:          [SKIP][761] ([i915#14098] / [i915#6095]) -> [SKIP][762] ([i915#14098] / [i915#14544] / [i915#6095])
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-rkl:          [SKIP][763] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][764] ([i915#11151] / [i915#7828]) +3 other tests skip
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_chamelium_audio@dp-audio-edid.html
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
    - shard-rkl:          [SKIP][765] ([i915#17427]) -> [SKIP][766] ([i915#14544] / [i915#17427])
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-rkl:          [SKIP][767] ([i915#14544] / [i915#17427]) -> [SKIP][768] ([i915#17427]) +2 other tests skip
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          [SKIP][769] ([i915#14544] / [i915#15865]) -> [SKIP][770] ([i915#15865])
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_content_protection@lic-type-1.html
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][771] ([i915#15865]) -> [SKIP][772] ([i915#14544] / [i915#15865])
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@kms_content_protection@srm.html
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          [SKIP][773] ([i915#13049]) -> [SKIP][774] ([i915#13049] / [i915#14544])
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x170.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          [SKIP][775] ([i915#14544] / [i915#3555]) -> [SKIP][776] ([i915#3555]) +2 other tests skip
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-rkl:          [SKIP][777] ([i915#3555]) -> [SKIP][778] ([i915#14544] / [i915#3555])
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          [SKIP][779] ([i915#17289]) -> [SKIP][780] ([i915#14544] / [i915#17289])
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-mst.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-rkl:          [SKIP][781] ([i915#14544] / [i915#17285]) -> [SKIP][782] ([i915#17285])
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-rkl:          [SKIP][783] ([i915#14544] / [i915#16867]) -> [SKIP][784] ([i915#16867])
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          [SKIP][785] ([i915#14544] / [i915#16361]) -> [SKIP][786] ([i915#16361])
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          [SKIP][787] ([i915#9934]) -> [SKIP][788] ([i915#14544] / [i915#9934]) +1 other test skip
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          [SKIP][789] ([i915#14544] / [i915#9934]) -> [SKIP][790] ([i915#9934]) +3 other tests skip
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-rkl:          [SKIP][791] ([i915#14544] / [i915#15643]) -> [SKIP][792] ([i915#15643])
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff:
    - shard-rkl:          [SKIP][793] ([i915#14544] / [i915#17428]) -> [SKIP][794] ([i915#17428]) +23 other tests skip
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-rkl:          [INCOMPLETE][795] ([i915#16056]) -> [SKIP][796] ([i915#15989])
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][797] ([i915#17428] / [i915#1825]) -> [SKIP][798] ([i915#14544] / [i915#17428] / [i915#1825])
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          [SKIP][799] ([i915#14544] / [i915#9766]) -> [SKIP][800] ([i915#9766])
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-rkl:          [SKIP][801] ([i915#15102]) -> [SKIP][802] ([i915#14544] / [i915#15102]) +1 other test skip
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          [SKIP][803] ([i915#14544] / [i915#15102]) -> [SKIP][804] ([i915#15102]) +16 other tests skip
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-rkl:          [SKIP][805] ([i915#17428]) -> [SKIP][806] ([i915#14544] / [i915#17428]) +3 other tests skip
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-rkl:          [SKIP][807] ([i915#16644] / [i915#3555] / [i915#8228]) -> [INCOMPLETE][808] ([i915#15436])
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-2/igt@kms_hdr@bpc-switch-suspend.html
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          [SKIP][809] ([i915#14544] / [i915#16644] / [i915#3555] / [i915#8228]) -> [SKIP][810] ([i915#16644] / [i915#3555] / [i915#8228])
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_hdr@invalid-hdr.html
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][811] ([i915#14544] / [i915#15709]) -> [SKIP][812] ([i915#15709])
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          [SKIP][813] ([i915#13958] / [i915#14544]) -> [SKIP][814] ([i915#13958]) +1 other test skip
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          [SKIP][815] ([i915#14259]) -> [SKIP][816] ([i915#14259] / [i915#14544])
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         [SKIP][817] ([i915#17764]) -> [SKIP][818] ([i915#15073])
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          [SKIP][819] ([i915#14544] / [i915#9683]) -> [SKIP][820] ([i915#9683])
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-rkl:          [SKIP][821] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][822] ([i915#1072] / [i915#9732]) +5 other tests skip
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_psr@psr2-primary-mmap-gtt.html
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          [SKIP][823] ([i915#14544] / [i915#17432] / [i915#5289]) -> [SKIP][824] ([i915#17432] / [i915#5289])
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          [SKIP][825] ([i915#14544] / [i915#9906]) -> [SKIP][826] ([i915#9906]) +1 other test skip
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          [SKIP][827] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][828] ([i915#15243] / [i915#3555])
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_vrr@flip-dpms.html
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_vrr@flip-dpms.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15792
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16017]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193
  [i915#16226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16226
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16789]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16938]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16938
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102
  [i915#17104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17104
  [i915#17110]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17110
  [i915#17119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17119
  [i915#17157]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17157
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17172
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17189]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17189
  [i915#17214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17214
  [i915#17245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17245
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
  [i915#17289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289
  [i915#17290]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290
  [i915#17291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291
  [i915#17319]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17319
  [i915#17342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17342
  [i915#17349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17349
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17429]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429
  [i915#17430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#17444]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450
  [i915#17453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17456]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
  [i915#17468]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17468
  [i915#17471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17471
  [i915#17472]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17472
  [i915#17473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473
  [i915#17477]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477
  [i915#17478]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478
  [i915#17479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479
  [i915#17480]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480
  [i915#17481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17481
  [i915#17482]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482
  [i915#17483]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483
  [i915#17484]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484
  [i915#17485]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17485
  [i915#17486]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17486
  [i915#17488]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488
  [i915#17489]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489
  [i915#17490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490
  [i915#17491]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491
  [i915#17492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492
  [i915#17493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493
  [i915#17494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17494
  [i915#17496]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496
  [i915#17497]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497
  [i915#17498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498
  [i915#17499]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499
  [i915#17500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500
  [i915#17501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17501
  [i915#17502]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502
  [i915#17503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503
  [i915#17504]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504
  [i915#17505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505
  [i915#17507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
  [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
  [i915#17509]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17509
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17511]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17511
  [i915#17512]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512
  [i915#17513]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17513
  [i915#17515]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17515
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17518
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17523]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17523
  [i915#17524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17526]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526
  [i915#17528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
  [i915#17529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17535]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17535
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17537
  [i915#17539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539
  [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17549
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17551]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551
  [i915#17554]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554
  [i915#17556]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17556
  [i915#17557]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17557
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17560]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17560
  [i915#17561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561
  [i915#17562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562
  [i915#17564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564
  [i915#17565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17565
  [i915#17566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17566
  [i915#17567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
  [i915#17569]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569
  [i915#17574]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17574
  [i915#17575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17575
  [i915#17576]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576
  [i915#17577]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17577
  [i915#17578]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17578
  [i915#17579]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17579
  [i915#17583]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583
  [i915#17585]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17585
  [i915#17586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17586
  [i915#17587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17587
  [i915#17588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17588
  [i915#17589]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17589
  [i915#17590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17590
  [i915#17591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17591
  [i915#17592]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17592
  [i915#17593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17593
  [i915#17594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17594
  [i915#17595]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17595
  [i915#17596]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17596
  [i915#17597]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17597
  [i915#17598]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17598
  [i915#17599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17599
  [i915#17600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17600
  [i915#17602]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17602
  [i915#17603]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17603
  [i915#17604]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17604
  [i915#17606]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17606
  [i915#17609]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17609
  [i915#17610]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17610
  [i915#17612]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17612
  [i915#17613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17613
  [i915#17614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17614
  [i915#17615]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17615
  [i915#17621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17621
  [i915#17622]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17622
  [i915#17626]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17626
  [i915#17628]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17628
  [i915#17629]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17629
  [i915#17632]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17632
  [i915#17637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17637
  [i915#17640]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17640
  [i915#17641]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17641
  [i915#17642]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17642
  [i915#17643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17643
  [i915#17648]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17648
  [i915#17651]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17651
  [i915#17652]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17652
  [i915#17653]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17653
  [i915#17655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17655
  [i915#17664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17664
  [i915#17671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17671
  [i915#17673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17673
  [i915#17675]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17675
  [i915#17677]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17677
  [i915#17680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17680
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17690]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17690
  [i915#17697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17697
  [i915#17699]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17699
  [i915#17700]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17700
  [i915#17701]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17701
  [i915#17703]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703
  [i915#17712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17712
  [i915#17752]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17752
  [i915#17753]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17753
  [i915#17755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17755
  [i915#17763]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17763
  [i915#17764]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17764
  [i915#17799]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17799
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9186 -> IGTPW_16134
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_19493: 1434742f20cf3d14b493e40c453536b5414b9762 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16134: 50e6445e73fd7050afd90c18ac26d57f8d0838e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9186: 9186
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/index.html

--===============3889870883255194406==
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
<tr><td><b>Series:</b></td><td>tests/intel/i915_pm_rpm: Print reason for skipping PC8 subtest (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177832/">https://patchwork.freedesktop.org/series/177832/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19493_full -&gt; IGTPW_16134_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16134_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_16134_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_16134_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-3/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@kms_fbcon_fbt@psr-suspend.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-7/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-7/igt@kms_pm_rpm@basic-rte.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pm-tiling:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-7/igt@kms_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-7/igt@kms_pm_rpm@pm-tiling.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg2-6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg1-15/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16134_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576">i915#17576</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-noreloc-purge-cache-simple:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@api_intel_bb@object-noreloc-purge-cache-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17641">i915#17641</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>) +1 other test skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17537">i915#17537</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@device_reset@unbind-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17753">i915#17753</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@dma-buf-fence-chain:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk1/igt@dmabuf@dma-buf-fence-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17712">i915#17712</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@fbdev@pan.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15792">i915#15792</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_barrier_race@remote-request:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@gem_barrier_race@remote-request.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17589">i915#17589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17675">i915#17675</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17697">i915#17697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17671">i915#17671</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-uncompressed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gem_ccs@block-copy-uncompressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499">i915#17499</a>) +1 other test skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gem_ccs@block-copy-uncompressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499">i915#17499</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17513">i915#17513</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176">i915#17176</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@gem_ctx_isolation@preservation-s3@bcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466">i915#16466</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@gem_ctx_isolation@preservation-s3@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840">i915#15840</a>) +10 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17535">i915#17535</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444">i915#17444</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17621">i915#17621</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-promotion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@gem_ctx_shared@q-promotion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17342">i915#17342</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk1/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496">i915#17496</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-9/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17587">i915#17587</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547">i915#17547</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-4/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_exec_balancer@sliced.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@gem_exec_capture@pi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17610">i915#17610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@gem_exec_fence@parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17599">i915#17599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@gem_exec_fence@submit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17612">i915#17612</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17565">i915#17565</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453">i915#17453</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>) +2 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17523">i915#17523</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-4/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@gem_exec_reloc@basic-write-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@gem_exec_reloc@basic-write-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@smoketest-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@gem_exec_schedule@smoketest-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17590">i915#17590</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk1/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196">i915#13196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-7/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-4/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840">i915#15840</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-1/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@gem_exec_suspend@basic-s4-devices.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@gem_exec_whisper@basic-fds-priority-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17628">i915#17628</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gem_exec_whisper@basic-queues-forked-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17655">i915#17655</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@gem_exercise_blt@fast-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17622">i915#17622</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@gem_fenced_exec_thrash@too-many-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17468">i915#17468</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-9/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456">i915#17456</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-1/igt@gem_lmem_swapping@massive.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>) +1 other test skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-3/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@gem_mmap_gtt@hang-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@gem_mmap_wc@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_mmap_wc@close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@gem_mmap_wc@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@shrink-vs-evict-pinned:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@gem_ppgtt@shrink-vs-evict-pinned.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17615">i915#17615</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521">i915#17521</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521">i915#17521</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521">i915#17521</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@gem_readwrite@beyond-eob.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@gem_readwrite@write-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gem_render_copy@linear-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492">i915#17492</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492">i915#17492</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492">i915#17492</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17591">i915#17591</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430">i915#17430</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17471">i915#17471</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-4/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430">i915#17430</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk1/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551">i915#17551</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193">i915#16193</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16226">i915#16226</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk9/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871">i915#16871</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +4 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +4 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@create-ext:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@gem_vm_create@create-ext.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17596">i915#17596</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17511">i915#17511</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17511">i915#17511</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@gen3_render_tiledy_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17578">i915#17578</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gen3_render_tiledy_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17578">i915#17578</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505">i915#17505</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505">i915#17505</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@gen7_exec_parse@chained-batch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505">i915#17505</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871">i915#16871</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17597">i915#17597</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-2/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@gen9_exec_parse@shadow-peek.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@i915_drm_fdinfo@busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17603">i915#17603</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@i915_drm_fdinfo@busy-idle@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@i915_drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vecs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-3/igt@i915_drm_fdinfo@most-busy-check-all@vecs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@i915_drm_fdinfo@virtual-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_gt_init-enodev:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17600">i915#17600</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178">i915#7178</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17566">i915#17566</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17566">i915#17566</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526">i915#17526</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@i915_pm_freq_mult@media-freq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17699">i915#17699</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17690">i915#17690</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17690">i915#17690</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@i915_pm_rps@thresholds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17629">i915#17629</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17574">i915#17574</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17673">i915#17673</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-7/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-glk1/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk9/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680">i915#11680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17613">i915#17613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17614">i915#17614</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-plane-damage:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_atomic@atomic-plane-damage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17485">i915#17485</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_atomic@atomic-plane-damage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17485">i915#17485</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17557">i915#17557</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17556">i915#17556</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525">i915#17525</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +158 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +111 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17594">i915#17594</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +109 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +81 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550">i915#17550</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550">i915#17550</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017">i915#16017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-2/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +7 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_color@deep-color.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17640">i915#17640</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +6 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508">i915#17508</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-9/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502">i915#17502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502">i915#17502</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-10/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508">i915#17508</a>) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504">i915#17504</a>) +6 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504">i915#17504</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533">i915#17533</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +7 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_cursor_crc@cursor-random-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504">i915#17504</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533">i915#17533</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-6/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_cursor_crc@cursor-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17157">i915#17157</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +109 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17549">i915#17549</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17515">i915#17515</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17486">i915#17486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-10/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289">i915#17289</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17560">i915#17560</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287">i915#17287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291">i915#17291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17664">i915#17664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477">i915#17477</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477">i915#17477</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477">i915#17477</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17680">i915#17680</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17680">i915#17680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultrajoiner:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_dsc@dsc-with-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17677">i915#17677</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17189">i915#17189</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17349">i915#17349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539">i915#17539</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539">i915#17539</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk9/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17585">i915#17585</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) +1 other test incomplete</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg2-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17593">i915#17593</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17606">i915#17606</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559">i915#17559</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +94 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +80 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17588">i915#17588</a>) +168 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559">i915#17559</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559">i915#17559</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17609">i915#17609</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +11 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +184 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17104">i915#17104</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102">i915#17102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-2/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17110">i915#17110</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17472">i915#17472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">i915#17498</a>) +4 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436">i915#15436</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">i915#17498</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567">i915#17567</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567">i915#17567</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17575">i915#17575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512">i915#17512</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17579">i915#17579</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17701">i915#17701</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-3/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17577">i915#17577</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17577">i915#17577</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540">i915#17540</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +2 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540">i915#17540</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789">i915#16789</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17799">i915#17799</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17752">i915#17752</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17763">i915#17763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-16/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-10/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-2/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_plane@planar-pixel-format-settings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17598">i915#17598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17700">i915#17700</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_plane_alpha_blend@coverage-7efc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17595">i915#17595</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17509">i915#17509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17586">i915#17586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17626">i915#17626</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462">i915#17462</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462">i915#17462</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-10/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-2/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-glk2/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16938">i915#16938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-9/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17602">i915#17602</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703">i915#17703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564">i915#17564</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +11 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473">i915#17473</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@kms_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@kms_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17518">i915#17518</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-5/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-3/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805">i915#6805</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569">i915#17569</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569">i915#17569</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_properties@colorop-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-14/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +13 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546">i915#17546</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@kms_psr@fbc-psr-cursor-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-9/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +36 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-6/igt@kms_psr@psr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_psr@psr-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-15/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488">i915#17488</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488">i915#17488</a>) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17501">i915#17501</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17501">i915#17501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17604">i915#17604</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_vblank@ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17652">i915#17652</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17653">i915#17653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840">i915#15840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17752">i915#17752</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17752">i915#17752</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk6/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561">i915#17561</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561">i915#17561</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i915#17520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536">i915#17536</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-create-userspace-config:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb5/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17592">i915#17592</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-17/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-50@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb4/igt@perf_pmu@busy-accuracy-50@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17651">i915#17651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@perf_pmu@module-unload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17119">i915#17119</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-8/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-7/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@perf_pmu@rc6-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17245">i915#17245</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk11/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583">i915#17583</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-wait-idle@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@perf_pmu@semaphore-wait-idle@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17648">i915#17648</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-wait-idle@vcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@perf_pmu@semaphore-wait-idle@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17637">i915#17637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb1/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@prime_udl@share-import-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-18/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429">i915#17429</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467">i915#17467</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@sysfs_heartbeat_interval@precise.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17642">i915#17642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb7/igt@sysfs_heartbeat_interval@precise@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17643">i915#17643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-snb6/igt@sysfs_timeslice_duration@timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17632">i915#17632</a>) +7 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-off-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-5/igt@gem_softpin@noreloc-s3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840">i915#15840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-4/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-glk6/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk5/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-glk2/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk4/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-4/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17755">i915#17755</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@i915_pm_rpm@system-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-5/igt@kms_flip@flip-vs-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17214">i915#17214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-2/igt@kms_flip@flip-vs-suspend.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-render.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk10:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-glk10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-glk10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-2/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17319">i915#17319</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-2/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17172">i915#17172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg2-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@perf_pmu@render-node-busy-idle.html">PASS</a> +4 other tests pass</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-dg2-4/igt@perf_pmu@render-node-busy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-dg2-3/igt@perf_pmu@render-node-busy-idle.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-4/igt@i915_module_load@fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840">i915#15840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@i915_module_load@fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289">i915#17289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289">i915#17289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-2/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436">i915#15436</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17764">i915#17764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-5/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19493/shard-rkl-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/shard-rkl-8/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9186 -&gt; IGTPW_16134</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19493: 1434742f20cf3d14b493e40c453536b5414b9762 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16134: 50e6445e73fd7050afd90c18ac26d57f8d0838e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9186: 9186<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3889870883255194406==--
