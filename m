Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBA6D7879A
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 17:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBE610E9F1;
	Thu, 21 Nov 2024 17:10:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCD410E9F1;
 Thu, 21 Nov 2024 17:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Update_image_assets_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Nov 2024 17:10:30 -0000
Message-ID: <173220903098.1246934.18407320318698016013@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121133958.3382633-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20241121133958.3382633-1-ramanaidu.naladala@intel.com>
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

Series: Update image assets (rev2)
URL   : https://patchwork.freedesktop.org/series/141539/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8119 -> IGTPW_12161
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12161 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12161, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12161/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12161:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_3d:
    - bat-rplp-1:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12161/bat-rplp-1/igt@kms_3d.html
    - bat-adlp-11:        NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12161/bat-adlp-11/igt@kms_3d.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_3d:
    - {bat-mtlp-9}:       NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12161/bat-mtlp-9/igt@kms_3d.html

  
Known issues
------------

  Here are the changes found in IGTPW_12161 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d:
    - bat-apl-1:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12161/bat-apl-1/igt@kms_3d.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12161/fi-blb-e6850/igt@kms_3d.html
    - bat-arlh-2:         NOTRUN -> [SKIP][6] ([i915#11346])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12161/bat-arlh-2/igt@kms_3d.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12161/fi-pnv-d510/igt@kms_3d.html

  
#### Possible fixes ####

  * igt@kms_chamelium_edid@dp-edid-read:
    - bat-dg2-13:         [FAIL][8] ([i915#12505]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8119/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12161/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12505


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8119 -> IGTPW_12161

  CI-20190529: 20190529
  CI_DRM_15725: e46649e7764a9f6868ccbcba7b8b23b413303380 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12161: 12161
  IGT_8119: 8119

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12161/index.html
