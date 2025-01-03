Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB5DE77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 23:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41B710E974;
	Fri,  3 Jan 2025 23:47:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4C810E2AA;
 Fri,  3 Jan 2025 23:47:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/igt=5Faux=2Ec=3A_sinc?=
 =?utf-8?q?e_procps-ng_4=2E0=2E5=2C_PIDS=5FVAL=28=29_takes_3_arguments=2C_no?=
 =?utf-8?q?t_4?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 03 Jan 2025 23:47:02 -0000
Message-ID: <173594802265.2862127.10935321382949550515@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250103222628.4069004-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20250103222628.4069004-1-thomas.petazzoni@bootlin.com>
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

Series: lib/igt_aux.c: since procps-ng 4.0.5, PIDS_VAL() takes 3 arguments, not 4
URL   : https://patchwork.freedesktop.org/series/143106/
State : success

== Summary ==

CI Bug Log - changes from IGT_8174 -> IGTPW_12385
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12385/index.html

Participating hosts (40 -> 36)
------------------------------

  Missing    (4): bat-rplp-1 bat-dg2-11 bat-dg2-14 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12385 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][1] -> [DMESG-FAIL][2] ([i915#13393]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8174/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12385/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [DMESG-FAIL][3] ([i915#13393]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8174/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12385/bat-arlh-2/igt@i915_selftest@live@workarounds.html

  
  [i915#13393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8174 -> IGTPW_12385
  * Linux: CI_DRM_15892 -> CI_DRM_15902

  CI-20190529: 20190529
  CI_DRM_15892: 08bd590935a5258ffd79355c59adffd72fb2c642 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15902: eaac387c7c9ff315ce63b390715371fdbb86b845 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12385: 9f108fec336b588b7d2c981d0026302935398534 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12385/index.html
