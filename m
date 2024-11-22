Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F715D75E30
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 12:01:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE74210E27E;
	Fri, 22 Nov 2024 12:01:10 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BE010E27E;
 Fri, 22 Nov 2024 12:01:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_gputop=3A_Add_memory_only?=
 =?utf-8?q?_utilization_type?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christian Gmeiner" <christian.gmeiner@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 Nov 2024 12:01:09 -0000
Message-ID: <173227686910.1685060.7846396247261870569@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121093822.3863544-1-christian.gmeiner@gmail.com>
In-Reply-To: <20241121093822.3863544-1-christian.gmeiner@gmail.com>
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

Series: gputop: Add memory only utilization type
URL   : https://patchwork.freedesktop.org/series/141689/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8122 -> IGTPW_12174
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12174 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12174, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12174/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12174:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-rpls-4:         [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8122/bat-rpls-4/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12174/bat-rpls-4/igt@i915_selftest@live.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - fi-kbl-7567u:       [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8122/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12174/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_12174 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][5] -> [INCOMPLETE][6] ([i915#12904]) +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8122/bat-apl-1/igt@dmabuf@all-tests.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12174/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_module_load@reload:
    - bat-twl-2:          [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8122/bat-twl-2/igt@i915_module_load@reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12174/bat-twl-2/igt@i915_module_load@reload.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-11:         [PASS][9] -> [SKIP][10] ([i915#9197])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8122/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12174/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-nick:        [INCOMPLETE][11] ([i915#12904]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8122/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12174/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [FAIL][13] ([i915#12903]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8122/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12174/bat-dg2-11/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [ABORT][15] ([i915#12061]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8122/bat-mtlp-8/igt@i915_selftest@live.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12174/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [ABORT][17] ([i915#12061]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8122/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12174/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - fi-kbl-7567u:       [DMESG-WARN][19] ([i915#12926]) -> [PASS][20] +3 other tests pass
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8122/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12174/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12695]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12695
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#12926]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12926
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8122 -> IGTPW_12174
  * Linux: CI_DRM_15727 -> CI_DRM_15729

  CI-20190529: 20190529
  CI_DRM_15727: bb17c42521f57b592e9ad49daca1f9f9045d3199 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15729: d571d186fd9e588dd4acdbbde1fb0935b84c233a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12174: 12174
  IGT_8122: 8122

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12174/index.html
