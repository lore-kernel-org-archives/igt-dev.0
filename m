Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A453AE7717F
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 22:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FDC10E248;
	Fri, 13 Dec 2024 22:00:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B10E10E248;
 Fri, 13 Dec 2024 22:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fvm=3A_Ch?=
 =?utf-8?q?eck_negative_cases_for_vm=5Fcreate/destroy_ioctl?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Dec 2024 22:00:17 -0000
Message-ID: <173412721710.2274263.16530327767156893277@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213185735.652032-1-pravalika.gurram@intel.com>
In-Reply-To: <20241213185735.652032-1-pravalika.gurram@intel.com>
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

Series: tests/intel/xe_vm: Check negative cases for vm_create/destroy ioctl
URL   : https://patchwork.freedesktop.org/series/142580/
State : success

== Summary ==

CI Bug Log - changes from IGT_8156 -> IGTPW_12317
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12317/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12317:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp6:
    - {bat-mtlp-9}:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8156/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp6.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12317/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp6.html

  
Known issues
------------

  Here are the changes found in IGTPW_12317 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-apl-1:          [PASS][3] -> [FAIL][4] ([i915#12903])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8156/bat-apl-1/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12317/bat-apl-1/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-arls-5:         NOTRUN -> [ABORT][5] ([i915#12061])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12317/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][6] -> [ABORT][7] ([i915#12061]) +1 other test abort
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8156/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12317/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-arls-5:         [PASS][8] -> [ABORT][9] ([i915#12061])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8156/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12317/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [ABORT][10] ([i915#12061]) -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8156/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12317/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-apl-1:          [DMESG-WARN][12] ([i915#12921]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8156/bat-apl-1/igt@kms_flip@basic-flip-vs-dpms.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12317/bat-apl-1/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-apl-1:          [DMESG-WARN][14] ([i915#12918]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8156/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12317/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-modeset@c-dp1:
    - bat-apl-1:          [DMESG-WARN][16] -> [PASS][17] +1 other test pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8156/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12317/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12918]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12918
  [i915#12921]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12921


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8156 -> IGTPW_12317
  * Linux: CI_DRM_15838 -> CI_DRM_15843

  CI-20190529: 20190529
  CI_DRM_15838: a752f9b5366a071e41f973b51842b6af5817f2a2 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15843: 3002940575eb5832d1fb8d10fd6311467b29c6d7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12317: 93c6dac8380df1aaca3638431fd9a9a33266edf4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8156: edf352a96646c8d793f0c1eb11795112f9bde725 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12317/index.html
