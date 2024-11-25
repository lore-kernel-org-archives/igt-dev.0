Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CF2D58D5C
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 15:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03C210E676;
	Mon, 25 Nov 2024 15:01:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7E210E676;
 Mon, 25 Nov 2024 15:01:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fexec=5Fs?=
 =?utf-8?q?tore=3A_Introduce_long-shader_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 Nov 2024 15:01:48 -0000
Message-ID: <173254690872.2853666.721803978918600890@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241125135645.6776-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20241125135645.6776-1-dominik.karol.piatkowski@intel.com>
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

Series: tests/intel/xe_exec_store: Introduce long-shader tests
URL   : https://patchwork.freedesktop.org/series/141750/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8124 -> IGTPW_12189
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12189 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12189, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/index.html

Participating hosts (44 -> 44)
------------------------------

  Additional (1): fi-glk-j4005 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12189:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@perf:
    - fi-skl-6600u:       [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8124/fi-skl-6600u/igt@i915_selftest@live@perf.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/fi-skl-6600u/igt@i915_selftest@live@perf.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8124/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - {bat-mtlp-9}:       [PASS][5] -> [FAIL][6] +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8124/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
    - {bat-mtlp-9}:       NOTRUN -> [FAIL][7] +4 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html

  * igt@prime_vgem@basic-fence-flip:
    - {bat-mtlp-9}:       [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8124/bat-mtlp-9/igt@prime_vgem@basic-fence-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/bat-mtlp-9/igt@prime_vgem@basic-fence-flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_12189 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-glk-j4005:       NOTRUN -> [SKIP][10] ([i915#2190])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-glk-j4005:       NOTRUN -> [SKIP][11] ([i915#4613]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [PASS][12] -> [FAIL][13] ([i915#12903])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8124/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/bat-dg2-11/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-arls-5:         NOTRUN -> [ABORT][14] ([i915#12061])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][15] -> [ABORT][16] ([i915#12061])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8124/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/bat-arls-5/igt@i915_selftest@live@workarounds.html

  * igt@kms_psr@psr-primary-page-flip:
    - fi-glk-j4005:       NOTRUN -> [SKIP][17] +10 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-8:          [ABORT][18] ([i915#13025]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8124/bat-dg2-8/igt@core_hotunplug@unbind-rebind.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/bat-dg2-8/igt@core_hotunplug@unbind-rebind.html

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [INCOMPLETE][20] ([i915#12904]) -> [PASS][21] +1 other test pass
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8124/bat-apl-1/igt@dmabuf@all-tests.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adls-6:         [FAIL][22] ([i915#12903]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8124/bat-adls-6/igt@i915_pm_rpm@module-reload.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/bat-adls-6/igt@i915_pm_rpm@module-reload.html
    - bat-rpls-4:         [FAIL][24] ([i915#12903]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8124/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - bat-apl-1:          [DMESG-WARN][26] ([i915#12921]) -> [PASS][27] +1 other test pass
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8124/bat-apl-1/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/bat-apl-1/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12695]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12695
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#12921]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12921
  [i915#13025]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13025
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8124 -> IGTPW_12189
  * Linux: CI_DRM_15737 -> CI_DRM_15738

  CI-20190529: 20190529
  CI_DRM_15737: 4d723d57180a3aafc1a510bc08ef42f4b03671a7 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15738: b21f1413ea1860e80fd278112e820e6dadfc9df9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12189: 12189
  IGT_8124: 8124

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12189/index.html
