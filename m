Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D45E77197
	for <igt-dev@archiver.kernel.org>; Sun,  5 Jan 2025 08:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B5B10E050;
	Sun,  5 Jan 2025 08:30:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8294710E050;
 Sun,  5 Jan 2025 08:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_lib/amdgpu=3A_Extract_PCI_device_address_from_file_descript?=
 =?utf-8?q?or?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 05 Jan 2025 08:30:10 -0000
Message-ID: <173606581053.3665830.304262069810895456@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250105071551.113830-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250105071551.113830-1-vitaly.prosyak@amd.com>
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

Series: series starting with [1/3] lib/amdgpu: Extract PCI device address from file descriptor
URL   : https://patchwork.freedesktop.org/series/143116/
State : success

== Summary ==

CI Bug Log - changes from IGT_8174 -> IGTPW_12388
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-atsm-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12388 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [DMESG-FAIL][1] ([i915#13393]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8174/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/bat-arlh-2/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-6:         [DMESG-FAIL][3] ([i915#13393]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8174/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
  [i915#13393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8174 -> IGTPW_12388
  * Linux: CI_DRM_15892 -> CI_DRM_15903

  CI-20190529: 20190529
  CI_DRM_15892: 08bd590935a5258ffd79355c59adffd72fb2c642 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15903: 3491399dc8f0c0c3bcec5316c66e60f5f44e1f10 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12388: 12388
  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/index.html
