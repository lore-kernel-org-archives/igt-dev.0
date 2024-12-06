Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28507E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 12:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC8E10E2E5;
	Fri,  6 Dec 2024 12:33:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB0510E2E5;
 Fri,  6 Dec 2024 12:33:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_GPGPU_support_for_MTL_pla?=
 =?utf-8?q?tform_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Nishit" <nishit.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Dec 2024 12:33:21 -0000
Message-ID: <173348840111.3337989.4980222151542676189@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205132814.3440727-1-nishit.sharma@intel.com>
In-Reply-To: <20241205132814.3440727-1-nishit.sharma@intel.com>
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

Series: GPGPU support for MTL platform (rev6)
URL   : https://patchwork.freedesktop.org/series/142149/
State : success

== Summary ==

CI Bug Log - changes from IGT_8139 -> IGTPW_12262
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12262/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12262 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-11:         [PASS][1] -> [FAIL][2] ([i915#12903])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12262/bat-dg2-11/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-arlh-2:         [PASS][3] -> [INCOMPLETE][4] ([i915#13194])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/bat-arlh-2/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12262/bat-arlh-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [PASS][5] -> [INCOMPLETE][6] ([i915#13269])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12262/bat-arlh-2/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-6:         [PASS][7] -> [ABORT][8] ([i915#12061]) +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12262/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-2:
    - fi-cfl-8109u:       [PASS][9] -> [DMESG-WARN][10] ([i915#12914]) +2 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/fi-cfl-8109u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12262/fi-cfl-8109u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-2.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-11:         [SKIP][11] ([i915#9197]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12262/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12914
  [i915#13194]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13194
  [i915#13269]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13269
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8139 -> IGTPW_12262
  * Linux: CI_DRM_15796 -> CI_DRM_15799

  CI-20190529: 20190529
  CI_DRM_15796: 1b7746f770882ce40dacae683e8e65657c40c2b7 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15799: e57b4b7cd137e0ae00d2601b4b55ab7f504da422 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12262: 12262
  IGT_8139: b0c59bb94e6c990589eb6825c1436ce412804dae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12262/index.html
