Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7D3D70DEE
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 20:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF9C10E4A0;
	Thu, 28 Nov 2024 20:52:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5062710E4A0;
 Thu, 28 Nov 2024 20:52:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Finvalid=5Fmod?=
 =?utf-8?q?e=3A_Attempt_divide-by-zero_in_drm=5Fmode=5Fvrefresh=28=29_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 28 Nov 2024 20:52:40 -0000
Message-ID: <173282716032.42531.7198961420570574896@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127110012.13349-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20241127110012.13349-1-ville.syrjala@linux.intel.com>
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

Series: tests/kms_invalid_mode: Attempt divide-by-zero in drm_mode_vrefresh() (rev2)
URL   : https://patchwork.freedesktop.org/series/141836/
State : success

== Summary ==

CI Bug Log - changes from IGT_8130 -> IGTPW_12217
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12217 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/bat-apl-1/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/bat-apl-1/igt@i915_pm_rpm@module-reload.html
    - bat-rpls-4:         [PASS][3] -> [FAIL][4] ([i915#12903])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-arls-5:         NOTRUN -> [ABORT][5] ([i915#12061])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][6] -> [ABORT][7] ([i915#12061])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg1-7:          [FAIL][8] ([i915#12903]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@requests:
    - {bat-arls-6}:       [INCOMPLETE][10] -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/bat-arls-6/igt@i915_selftest@live@requests.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/bat-arls-6/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [ABORT][12] ([i915#12061]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-plain-flip@a-dp1:
    - bat-apl-1:          [DMESG-WARN][14] -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/bat-apl-1/igt@kms_flip@basic-plain-flip@a-dp1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/bat-apl-1/igt@kms_flip@basic-plain-flip@a-dp1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2:
    - fi-cfl-8109u:       [DMESG-WARN][16] -> [PASS][17] +2 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8130/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8130 -> IGTPW_12217
  * Linux: CI_DRM_15759 -> CI_DRM_15760

  CI-20190529: 20190529
  CI_DRM_15759: 5379d0a88558b73308ad82f163e80b863626e90b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15760: 2ad46928583b63ad6dc40ef74dfdac2d3125f3c8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12217: 47770ec3ce7e646b821666d2dd925d30edd577c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8130: 52c84deb5f45bcbd3c2b22d1fcff01d4c522cb62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/index.html
