Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C72FD66B8E
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 23:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D347810E0CC;
	Tue, 26 Nov 2024 23:46:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C1E10E0CC;
 Tue, 26 Nov 2024 23:46:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fwedged?=
 =?utf-8?q?=3A_Manage_verbosity_of_GT_reset_fault_injection?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Nov 2024 23:46:13 -0000
Message-ID: <173266477348.3524169.748249155806704953@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126230240.1780940-1-matthew.d.roper@intel.com>
In-Reply-To: <20241126230240.1780940-1-matthew.d.roper@intel.com>
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

Series: tests/intel/xe_wedged: Manage verbosity of GT reset fault injection
URL   : https://patchwork.freedesktop.org/series/141810/
State : success

== Summary ==

CI Bug Log - changes from IGT_8126 -> IGTPW_12203
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/index.html

Participating hosts (45 -> 43)
------------------------------

  Missing    (2): fi-glk-j4005 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12203 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-nick:        [PASS][1] -> [INCOMPLETE][2] ([i915#12904]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adls-6:         [PASS][3] -> [FAIL][4] ([i915#12903])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/bat-adls-6/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/bat-adls-6/igt@i915_pm_rpm@module-reload.html
    - bat-rpls-4:         [PASS][5] -> [FAIL][6] ([i915#12903])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][7] -> [ABORT][8] ([i915#12061]) +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/bat-mtlp-8/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-adlp-9:         [PASS][9] -> [ABORT][10] ([i915#9413]) +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/bat-adlp-9/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/bat-adlp-9/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][11] -> [ABORT][12] ([i915#12061]) +1 other test abort
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-6:         [PASS][13] -> [ABORT][14] ([i915#12061]) +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [PASS][15] -> [SKIP][16] ([i915#9197]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg1-7:          [FAIL][17] ([i915#12903]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-rplp-1:         [ABORT][19] -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/bat-rplp-1/igt@i915_selftest@live.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/bat-rplp-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-rplp-1:         [ABORT][21] ([i915#9413]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/bat-rplp-1/igt@i915_selftest@live@gt_lrc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/bat-rplp-1/igt@i915_selftest@live@gt_lrc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8126 -> IGTPW_12203
  * Linux: CI_DRM_15747 -> CI_DRM_15749

  CI-20190529: 20190529
  CI_DRM_15747: 7cd4d1589e461d61330ec272c448bc6d1b9da35e @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15749: 739a2506c44a0be22cc842d2c625a05ed21c1198 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12203: 12203
  IGT_8126: 8126

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/index.html
