Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79265E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 22:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B9A10F1D6;
	Fri,  6 Dec 2024 22:30:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AF810F1C3;
 Fri,  6 Dec 2024 22:30:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Initial_PTL_support_=28re?=
 =?utf-8?q?v4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Clint Taylor" <clinton.a.taylor@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Dec 2024 22:30:56 -0000
Message-ID: <173352425634.3465139.12638984079180672234@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
In-Reply-To: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
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

Series: Initial PTL support (rev4)
URL   : https://patchwork.freedesktop.org/series/141325/
State : success

== Summary ==

CI Bug Log - changes from IGT_8143 -> IGTPW_12272
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12272/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12272 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [PASS][1] -> [FAIL][2] ([i915#12903])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12272/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-dg2-11:         [PASS][3] -> [SKIP][4] ([i915#9197]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12272/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-nick:        [INCOMPLETE][5] ([i915#12904]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12272/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live@workarounds:
    - {bat-arls-6}:       [ABORT][7] ([i915#12061]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12272/bat-arls-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp2:
    - fi-cfl-8109u:       [DMESG-WARN][9] ([i915#12914]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@c-dp2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12272/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@c-dp2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#12914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12914
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8143 -> IGTPW_12272
  * Linux: CI_DRM_15803 -> CI_DRM_15804

  CI-20190529: 20190529
  CI_DRM_15803: 261a0301bda5af29477bd710465a8886e8609a4d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15804: 21f6d267c4a3e02cd75de5641f8786e427ce8fa8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12272: e26156877bc2dfd899a3b422c1abfe883836995a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8143: 515351a02a01f459212197f47ff91053551dcfab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12272/index.html
