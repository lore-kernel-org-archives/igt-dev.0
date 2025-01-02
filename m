Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31764E77188
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 17:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5C210E775;
	Thu,  2 Jan 2025 17:15:13 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9300C10E76E;
 Thu,  2 Jan 2025 17:15:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fdrm=5Ffd?=
 =?utf-8?q?info=3A_Do_not_end_NULL_xe=5Fcork?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 02 Jan 2025 17:15:12 -0000
Message-ID: <173583811259.2099751.3817956842785045081@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250102162540.81162-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250102162540.81162-1-jonathan.cavitt@intel.com>
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

Series: tests/intel/xe_drm_fdinfo: Do not end NULL xe_cork
URL   : https://patchwork.freedesktop.org/series/143066/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8174 -> IGTPW_12377
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12377 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12377, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12377/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12377:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8174/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12377/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html

  
Known issues
------------

  Here are the changes found in IGTPW_12377 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - bat-dg2-13:         [PASS][3] -> [DMESG-WARN][4] ([i915#12253])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8174/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12377/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][5] ([i915#13350])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12377/fi-pnv-d510/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [DMESG-FAIL][6] ([i915#13393]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8174/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12377/bat-arlh-2/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-6:         [DMESG-FAIL][8] ([i915#13393]) -> [PASS][9] +1 other test pass
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8174/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12377/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12253]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253
  [i915#13350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13350
  [i915#13393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8174 -> IGTPW_12377
  * Linux: CI_DRM_15892 -> CI_DRM_15893

  CI-20190529: 20190529
  CI_DRM_15892: 08bd590935a5258ffd79355c59adffd72fb2c642 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15893: 59c846c00dda72adf1a68bf7e76bdc57039371e3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12377: 12377
  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12377/index.html
