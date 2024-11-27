Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFE2D609CE
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 10:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7870B10E031;
	Wed, 27 Nov 2024 10:40:28 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1200C10E031;
 Wed, 27 Nov 2024 10:40:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/gem=5Fctx=5Fp?=
 =?utf-8?q?ersistence=3A_Wait_for_context_termination_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 Nov 2024 10:40:28 -0000
Message-ID: <173270402806.3676557.7871142603469706181@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127094528.7041-1-krzysztof.niemiec@intel.com>
In-Reply-To: <20241127094528.7041-1-krzysztof.niemiec@intel.com>
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

Series: tests/intel/gem_ctx_persistence: Wait for context termination (rev4)
URL   : https://patchwork.freedesktop.org/series/140582/
State : success

== Summary ==

CI Bug Log - changes from IGT_8127 -> IGTPW_12205
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12205:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@perf:
    - {bat-mtlp-9}:       [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/bat-mtlp-9/igt@i915_selftest@live@perf.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/bat-mtlp-9/igt@i915_selftest@live@perf.html

  
Known issues
------------

  Here are the changes found in IGTPW_12205 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@saturated-hostile:
    - fi-elk-e7500:       NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-elk-e7500/igt@gem_ctx_persistence@saturated-hostile.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-bsw-nick/igt@gem_ctx_persistence@saturated-hostile.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-hsw-4770/igt@gem_ctx_persistence@saturated-hostile.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-pnv-d510/igt@gem_ctx_persistence@saturated-hostile.html
    - fi-ilk-650:         NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-ilk-650/igt@gem_ctx_persistence@saturated-hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - bat-mtlp-6:         NOTRUN -> [SKIP][8] ([i915#5882]) +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/bat-mtlp-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
    - bat-dg2-9:          NOTRUN -> [SKIP][9] ([i915#5882]) +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/bat-dg2-9/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-blb-e6850/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][11] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-ivb-3770/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@bcs0:
    - bat-arlh-3:         NOTRUN -> [SKIP][12] ([i915#11473]) +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/bat-arlh-3/igt@gem_ctx_persistence@saturated-hostile-nopreempt@bcs0.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0:
    - bat-arls-5:         NOTRUN -> [SKIP][13] ([i915#11473] / [i915#5882]) +6 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/bat-arls-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
    - bat-dg2-11:         NOTRUN -> [SKIP][14] ([i915#5882]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/bat-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html
    - bat-dg2-14:         NOTRUN -> [SKIP][15] ([i915#5882]) +7 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/bat-dg2-14/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vecs0:
    - bat-mtlp-8:         NOTRUN -> [SKIP][16] ([i915#5882]) +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/bat-mtlp-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vecs0.html
    - bat-arlh-2:         NOTRUN -> [SKIP][17] ([i915#11346] / [i915#11473]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/bat-arlh-2/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vecs0.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vecs1:
    - bat-dg2-8:          NOTRUN -> [SKIP][18] ([i915#5882]) +7 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/bat-dg2-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vecs1.html

  * igt@gem_ctx_persistence@smoketest:
    - fi-pnv-d510:        NOTRUN -> [SKIP][19] ([i915#1099])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-pnv-d510/igt@gem_ctx_persistence@smoketest.html
    - fi-ilk-650:         NOTRUN -> [SKIP][20] ([i915#1099])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-ilk-650/igt@gem_ctx_persistence@smoketest.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][21] ([i915#1099])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-blb-e6850/igt@gem_ctx_persistence@smoketest.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][22] ([i915#1099])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-hsw-4770/igt@gem_ctx_persistence@smoketest.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][23] ([i915#1099])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-ivb-3770/igt@gem_ctx_persistence@smoketest.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][24] ([i915#1099])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-elk-e7500/igt@gem_ctx_persistence@smoketest.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][25] ([i915#1099])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-bsw-nick/igt@gem_ctx_persistence@smoketest.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adls-6:         [PASS][26] -> [FAIL][27] ([i915#12903])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/bat-adls-6/igt@i915_pm_rpm@module-reload.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/bat-adls-6/igt@i915_pm_rpm@module-reload.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg1-7:          [FAIL][28] ([i915#12903]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/bat-dg1-7/igt@i915_pm_rpm@module-reload.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - fi-kbl-7567u:       [DMESG-WARN][30] ([i915#12926]) -> [PASS][31] +1 other test pass
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:
    - fi-kbl-7567u:       [DMESG-WARN][32] ([i915#12920]) -> [PASS][33] +1 other test pass
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8127/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11473
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12920
  [i915#12926]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12926
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8127 -> IGTPW_12205
  * Linux: CI_DRM_15749 -> CI_DRM_15751

  CI-20190529: 20190529
  CI_DRM_15749: 739a2506c44a0be22cc842d2c625a05ed21c1198 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15751: 441e225c838a29660f3f1c29cc2a617572e63099 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12205: c5546c541da260ba6ee3559ef1731707d5d5ed84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/index.html
