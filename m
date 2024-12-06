Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08FCE7717B
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 22:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B5110E068;
	Fri,  6 Dec 2024 22:54:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09C410E068;
 Fri,  6 Dec 2024 22:54:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_Revert_=22tests/intel/xe=5Fsysfs=5Ftimeslice=5Fduration=3A_?=
 =?utf-8?q?Restore_preempt_timeout=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Dec 2024 22:54:15 -0000
Message-ID: <173352565565.3465139.9958017178476656898@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206215459.128077-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241206215459.128077-1-jonathan.cavitt@intel.com>
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

Series: series starting with [1/2] Revert "tests/intel/xe_sysfs_timeslice_duration: Restore preempt timeout"
URL   : https://patchwork.freedesktop.org/series/142255/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8143 -> IGTPW_12273
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12273 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12273, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12273:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-14:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/bat-dg2-14/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/bat-dg2-14/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - fi-glk-j4005:       [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/fi-glk-j4005/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/fi-glk-j4005/igt@i915_selftest@live.html
    - bat-arls-5:         NOTRUN -> [ABORT][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/bat-arls-5/igt@i915_selftest@live.html
    - bat-dg2-11:         [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/bat-dg2-11/igt@i915_selftest@live.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/bat-dg2-11/igt@i915_selftest@live.html

  * igt@i915_selftest@live@perf:
    - bat-arls-5:         [PASS][8] -> [ABORT][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/bat-arls-5/igt@i915_selftest@live@perf.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/bat-arls-5/igt@i915_selftest@live@perf.html

  * igt@kms_flip@basic-plain-flip@c-dp1:
    - fi-kbl-7567u:       [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/fi-kbl-7567u/igt@kms_flip@basic-plain-flip@c-dp1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/fi-kbl-7567u/igt@kms_flip@basic-plain-flip@c-dp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_12273 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@load:
    - bat-twl-1:          [PASS][12] -> [DMESG-WARN][13] ([i915#1982])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/bat-twl-1/igt@i915_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/bat-twl-1/igt@i915_module_load@load.html

  * igt@i915_pm_rpm@module-reload:
    - bat-dg1-7:          [PASS][14] -> [FAIL][15] ([i915#12903])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][16] -> [ABORT][17] ([i915#12061]) +1 other test abort
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/bat-mtlp-8/igt@i915_selftest@live.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-kbl-7567u:       [PASS][18] -> [DMESG-WARN][19] ([i915#12920]) +2 other tests dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-dg2-11:         [PASS][20] -> [SKIP][21] ([i915#9197])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - {bat-arls-6}:       [ABORT][22] ([i915#12061]) -> [PASS][23] +1 other test pass
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/bat-arls-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp2:
    - fi-cfl-8109u:       [DMESG-WARN][24] ([i915#12914]) -> [PASS][25] +1 other test pass
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8143/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@c-dp2.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@c-dp2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12914
  [i915#12920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12920
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8143 -> IGTPW_12273
  * Linux: CI_DRM_15803 -> CI_DRM_15804

  CI-20190529: 20190529
  CI_DRM_15803: 261a0301bda5af29477bd710465a8886e8609a4d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15804: 21f6d267c4a3e02cd75de5641f8786e427ce8fa8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12273: 12273
  IGT_8143: 515351a02a01f459212197f47ff91053551dcfab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12273/index.html
