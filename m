Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493ABE7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 09:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4A810EAB8;
	Wed, 11 Dec 2024 09:38:28 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF7610EAB8;
 Wed, 11 Dec 2024 09:38:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/xe=5Fspin=5Fbatch?=
 =?utf-8?q?=3A_Add_spin-timestamp-check_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Dec 2024 09:38:26 -0000
Message-ID: <173390990691.1156177.8273414715971243954@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211085848.617278-1-pravalika.gurram@intel.com>
In-Reply-To: <20241211085848.617278-1-pravalika.gurram@intel.com>
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

Series: tests/xe_spin_batch: Add spin-timestamp-check (rev7)
URL   : https://patchwork.freedesktop.org/series/140933/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8147 -> IGTPW_12290
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12290 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12290, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12290/index.html

Participating hosts (45 -> 45)
------------------------------

  Additional (1): fi-ivb-3770 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12290:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@requests:
    - bat-apl-1:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-apl-1/igt@i915_selftest@live@requests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12290/bat-apl-1/igt@i915_selftest@live@requests.html

  
Known issues
------------

  Here are the changes found in IGTPW_12290 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][3] -> [ABORT][4] ([i915#12061]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-mtlp-8/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12290/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-apl-1:          [PASS][5] -> [DMESG-FAIL][6] ([i915#12435])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-apl-1/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12290/bat-apl-1/igt@i915_selftest@live.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1:
    - fi-ivb-3770:        NOTRUN -> [SKIP][7] +23 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12290/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [INCOMPLETE][8] ([i915#12904]) -> [PASS][9] +1 other test pass
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-apl-1/igt@dmabuf@all-tests.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12290/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_module_load@reload:
    - fi-cfl-8109u:       [DMESG-WARN][10] ([i915#11621] / [i915#1982]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/fi-cfl-8109u/igt@i915_module_load@reload.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12290/fi-cfl-8109u/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [DMESG-WARN][12] ([i915#11621]) -> [PASS][13] +131 other tests pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12290/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - bat-dg2-13:         [FAIL][14] ([i915#12505]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12290/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [SKIP][16] ([i915#9197]) -> [PASS][17] +2 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12290/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435
  [i915#12505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12505
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8147 -> IGTPW_12290
  * Linux: CI_DRM_15814 -> CI_DRM_15817

  CI-20190529: 20190529
  CI_DRM_15814: 6966a52cb5531bf6cc785fadba160a71cd31e7aa @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15817: 7bbcd7df9387f0d9004f997df33f7a9472d9c080 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12290: 12290
  IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12290/index.html
