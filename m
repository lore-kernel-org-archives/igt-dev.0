Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D24E7718A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 09:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE85510E2A3;
	Thu, 19 Dec 2024 09:38:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1334B10E2A3;
 Thu, 19 Dec 2024 09:38:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/gem=5Fpxp=3A_?=
 =?utf-8?q?Fix_requirements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Dec 2024 09:38:04 -0000
Message-ID: <173460108406.369544.1329951346305824151@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241216153129.50964-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241216153129.50964-1-kamil.konieczny@linux.intel.com>
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

Series: tests/intel/gem_pxp: Fix requirements
URL   : https://patchwork.freedesktop.org/series/142659/
State : success

== Summary ==

CI Bug Log - changes from IGT_8157 -> IGTPW_12326
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12326 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][1] -> [ABORT][2] ([i915#12061]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8157/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-arlh-2:         [PASS][3] -> [ABORT][4] ([i915#12061]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8157/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/bat-arlh-2/igt@i915_selftest@live@workarounds.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][5] ([i915#13350])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/fi-pnv-d510/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - {bat-arls-6}:       [ABORT][6] ([i915#12061]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8157/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13350


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8157 -> IGTPW_12326
  * Linux: CI_DRM_15848 -> CI_DRM_15855

  CI-20190529: 20190529
  CI_DRM_15848: 63be16e210b1c3e43b43d8ca9b7e17f15142d2c3 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15855: 8bfb48c045396305771aaea35f06d5ef3bf3a191 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12326: 2db9f685a997db9f93d6e0c034b3a2b48cd3ef92 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8157: 48a70f6795e6d68b9fae275261ae3b09d3401fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/index.html
