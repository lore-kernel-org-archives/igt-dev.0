Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EF0D6EC00
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 11:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C1410E1ED;
	Fri, 29 Nov 2024 11:05:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE9A10E1ED;
 Fri, 29 Nov 2024 11:04:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/intel/lobf=3A_Remov?=
 =?utf-8?q?e_lobf_supported_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Nov 2024 11:04:58 -0000
Message-ID: <173287829884.256552.12039258277747416537@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241129084006.3448688-1-animesh.manna@intel.com>
In-Reply-To: <20241129084006.3448688-1-animesh.manna@intel.com>
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

Series: tests/intel/lobf: Remove lobf supported check
URL   : https://patchwork.freedesktop.org/series/141914/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8131 -> IGTPW_12220
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12220 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12220, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12220/index.html

Participating hosts (45 -> 43)
------------------------------

  Missing    (2): bat-arls-6 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12220:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - fi-pnv-d510:        NOTRUN -> [ABORT][1] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12220/fi-pnv-d510/igt@i915_selftest@live.html

  * igt@i915_selftest@live@guc:
    - bat-adlp-11:        [PASS][2] -> [ABORT][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8131/bat-adlp-11/igt@i915_selftest@live@guc.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12220/bat-adlp-11/igt@i915_selftest@live@guc.html

  
Known issues
------------

  Here are the changes found in IGTPW_12220 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-nick:        [PASS][4] -> [INCOMPLETE][5] ([i915#12904]) +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8131/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12220/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live:
    - bat-adlp-11:        [PASS][6] -> [ABORT][7] ([i915#12435] / [i915#13009])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8131/bat-adlp-11/igt@i915_selftest@live.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12220/bat-adlp-11/igt@i915_selftest@live.html
    - fi-skl-6600u:       [PASS][8] -> [INCOMPLETE][9] ([i915#13050])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8131/fi-skl-6600u/igt@i915_selftest@live.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12220/fi-skl-6600u/igt@i915_selftest@live.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [FAIL][10] ([i915#12903]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8131/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12220/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-skl-6600u:       [FAIL][12] ([i915#2346]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8131/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12220/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - {bat-mtlp-9}:       [FAIL][14] ([i915#11989]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8131/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12220/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp7:
    - {bat-mtlp-9}:       [FAIL][16] -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8131/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp7.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12220/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp7.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [SKIP][18] ([i915#9197]) -> [PASS][19] +3 other tests pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8131/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12220/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13009
  [i915#13050]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13050
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8131 -> IGTPW_12220

  CI-20190529: 20190529
  CI_DRM_15762: 4f5b3a832a6480c82639b5500d731d7222b7eee7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12220: 12220
  IGT_8131: f846ef8f7ddf051c88504c607136a9b5392bdef7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12220/index.html
