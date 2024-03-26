Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD0CC54E64
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 02:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C64810E5BF;
	Tue, 26 Mar 2024 02:57:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F7F10E5BF;
 Tue, 26 Mar 2024 02:57:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6978190495100406421=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_RFC=3A_Converting_subtests_?=
 =?utf-8?q?of_kms=5Fplane_into_dynamic_subtests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Mar 2024 02:57:35 -0000
Message-ID: <171142185505.1039216.283651165019992567@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240325091646.194626-1-pranay.samala@intel.com>
In-Reply-To: <20240325091646.194626-1-pranay.samala@intel.com>
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

--===============6978190495100406421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC: Converting subtests of kms_plane into dynamic subtests
URL   : https://patchwork.freedesktop.org/series/131563/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14478_full -> IGTPW_10897_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10897_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10897_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10897_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-mtlp:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-mtlp-7/igt@gem_eio@in-flight-contexts-immediate.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@i915_hangman@gt-error-state-capture@bcs0:
    - shard-snb:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-snb4/igt@i915_hangman@gt-error-state-capture@bcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-snb7/igt@i915_hangman@gt-error-state-capture@bcs0.html

  * igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-3.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][6] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a-hdmi-a-1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a-hdmi-a-1.html

  * igt@perf_pmu@busy-check-all@ccs0:
    - shard-dg2:          [PASS][9] -> [FAIL][10] +5 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg2-1/igt@perf_pmu@busy-check-all@ccs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@perf_pmu@busy-check-all@ccs0.html

  * igt@perf_pmu@busy-check-all@vecs0:
    - shard-mtlp:         [PASS][11] -> [FAIL][12] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-mtlp-4/igt@perf_pmu@busy-check-all@vecs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@perf_pmu@busy-check-all@vecs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_14478_full and IGTPW_10897_full:

### New IGT tests (196) ###

  * igt@kms_plane@pixel-format-ab24:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-ab24@pipe-a-4:
    - Statuses : 4 pass(s)
    - Exec time: [0.54, 1.00] s

  * igt@kms_plane@pixel-format-ab24@pipe-a-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.59, 0.97] s

  * igt@kms_plane@pixel-format-ab24@pipe-a-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.63, 0.97] s

  * igt@kms_plane@pixel-format-ab24@pipe-b-4:
    - Statuses : 4 pass(s)
    - Exec time: [0.53, 0.86] s

  * igt@kms_plane@pixel-format-ab24@pipe-b-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.59, 0.90] s

  * igt@kms_plane@pixel-format-ab24@pipe-b-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.59, 0.90] s

  * igt@kms_plane@pixel-format-ab30:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-ab30@pipe-a-4:
    - Statuses : 5 pass(s)
    - Exec time: [0.54, 1.09] s

  * igt@kms_plane@pixel-format-ab30@pipe-a-linear:
    - Statuses : 5 pass(s)
    - Exec time: [0.59, 1.31] s

  * igt@kms_plane@pixel-format-ab30@pipe-a-x:
    - Statuses : 5 pass(s)
    - Exec time: [0.61, 1.19] s

  * igt@kms_plane@pixel-format-ab30@pipe-b-4:
    - Statuses : 5 pass(s)
    - Exec time: [0.52, 1.03] s

  * igt@kms_plane@pixel-format-ab30@pipe-b-linear:
    - Statuses : 5 pass(s)
    - Exec time: [0.59, 1.17] s

  * igt@kms_plane@pixel-format-ab30@pipe-b-x:
    - Statuses : 5 pass(s)
    - Exec time: [0.59, 1.17] s

  * igt@kms_plane@pixel-format-ab4h:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-ab4h@pipe-a-4:
    - Statuses : 5 pass(s)
    - Exec time: [0.55, 1.05] s

  * igt@kms_plane@pixel-format-ab4h@pipe-a-linear:
    - Statuses : 5 pass(s)
    - Exec time: [0.55, 1.22] s

  * igt@kms_plane@pixel-format-ab4h@pipe-a-x:
    - Statuses : 5 pass(s)
    - Exec time: [0.57, 1.14] s

  * igt@kms_plane@pixel-format-ab4h@pipe-b-4:
    - Statuses : 5 pass(s)
    - Exec time: [0.52, 1.05] s

  * igt@kms_plane@pixel-format-ab4h@pipe-b-linear:
    - Statuses : 5 pass(s)
    - Exec time: [0.55, 1.07] s

  * igt@kms_plane@pixel-format-ab4h@pipe-b-x:
    - Statuses : 5 pass(s)
    - Exec time: [0.55, 1.00] s

  * igt@kms_plane@pixel-format-ar24:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-ar24@pipe-a-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.55, 1.28] s

  * igt@kms_plane@pixel-format-ar24@pipe-a-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.60, 1.63] s

  * igt@kms_plane@pixel-format-ar24@pipe-a-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.62, 1.47] s

  * igt@kms_plane@pixel-format-ar24@pipe-b-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.53, 1.30] s

  * igt@kms_plane@pixel-format-ar24@pipe-b-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.62, 1.51] s

  * igt@kms_plane@pixel-format-ar24@pipe-b-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.60, 1.51] s

  * igt@kms_plane@pixel-format-ar30:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-ar30@pipe-a-4:
    - Statuses : 5 pass(s)
    - Exec time: [0.55, 1.76] s

  * igt@kms_plane@pixel-format-ar30@pipe-a-linear:
    - Statuses : 5 pass(s)
    - Exec time: [0.59, 1.42] s

  * igt@kms_plane@pixel-format-ar30@pipe-a-x:
    - Statuses : 5 pass(s)
    - Exec time: [0.62, 1.80] s

  * igt@kms_plane@pixel-format-ar30@pipe-b-4:
    - Statuses : 5 pass(s)
    - Exec time: [0.53, 1.80] s

  * igt@kms_plane@pixel-format-ar30@pipe-b-linear:
    - Statuses : 5 pass(s)
    - Exec time: [0.58, 1.78] s

  * igt@kms_plane@pixel-format-ar30@pipe-b-x:
    - Statuses : 5 pass(s)
    - Exec time: [0.58, 1.78] s

  * igt@kms_plane@pixel-format-ar4h:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-ar4h@pipe-a-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.54, 1.79] s

  * igt@kms_plane@pixel-format-ar4h@pipe-a-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.55, 1.42] s

  * igt@kms_plane@pixel-format-ar4h@pipe-a-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.58, 1.78] s

  * igt@kms_plane@pixel-format-ar4h@pipe-b-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.52, 1.75] s

  * igt@kms_plane@pixel-format-ar4h@pipe-b-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.55, 1.69] s

  * igt@kms_plane@pixel-format-ar4h@pipe-b-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.56, 1.70] s

  * igt@kms_plane@pixel-format-c8:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-c8@pipe-a-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.54, 1.91] s

  * igt@kms_plane@pixel-format-c8@pipe-a-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.64, 1.74] s

  * igt@kms_plane@pixel-format-c8@pipe-a-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.67, 1.90] s

  * igt@kms_plane@pixel-format-c8@pipe-b-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.53, 1.86] s

  * igt@kms_plane@pixel-format-c8@pipe-b-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.64, 1.84] s

  * igt@kms_plane@pixel-format-c8@pipe-b-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.64, 1.83] s

  * igt@kms_plane@pixel-format-nv12@pipe-a-4:
    - Statuses : 7 pass(s)
    - Exec time: [0.54, 1.77] s

  * igt@kms_plane@pixel-format-nv12@pipe-a-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.75, 2.47] s

  * igt@kms_plane@pixel-format-nv12@pipe-a-x:
    - Statuses : 7 pass(s)
    - Exec time: [0.67, 1.76] s

  * igt@kms_plane@pixel-format-nv12@pipe-b-4:
    - Statuses : 7 pass(s)
    - Exec time: [0.52, 1.73] s

  * igt@kms_plane@pixel-format-nv12@pipe-b-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.82, 2.33] s

  * igt@kms_plane@pixel-format-nv12@pipe-b-x:
    - Statuses : 7 pass(s)
    - Exec time: [0.63, 1.82] s

  * igt@kms_plane@pixel-format-p010@pipe-a-4:
    - Statuses : 7 pass(s)
    - Exec time: [0.55, 1.82] s

  * igt@kms_plane@pixel-format-p010@pipe-a-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.75, 2.44] s

  * igt@kms_plane@pixel-format-p010@pipe-a-x:
    - Statuses : 7 pass(s)
    - Exec time: [0.66, 1.79] s

  * igt@kms_plane@pixel-format-p010@pipe-b-4:
    - Statuses : 7 pass(s)
    - Exec time: [0.53, 1.78] s

  * igt@kms_plane@pixel-format-p010@pipe-b-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.81, 2.34] s

  * igt@kms_plane@pixel-format-p010@pipe-b-x:
    - Statuses : 7 pass(s)
    - Exec time: [0.64, 1.83] s

  * igt@kms_plane@pixel-format-p012:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-p012@pipe-a-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.55, 1.81] s

  * igt@kms_plane@pixel-format-p012@pipe-a-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.74, 2.32] s

  * igt@kms_plane@pixel-format-p012@pipe-a-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.68, 1.78] s

  * igt@kms_plane@pixel-format-p012@pipe-b-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.52, 1.88] s

  * igt@kms_plane@pixel-format-p012@pipe-b-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.82, 2.15] s

  * igt@kms_plane@pixel-format-p012@pipe-b-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.65, 1.78] s

  * igt@kms_plane@pixel-format-p016:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-p016@pipe-a-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.51, 1.80] s

  * igt@kms_plane@pixel-format-p016@pipe-a-linear:
    - Statuses : 6 pass(s)
    - Exec time: [1.05, 2.55] s

  * igt@kms_plane@pixel-format-p016@pipe-a-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.65, 1.75] s

  * igt@kms_plane@pixel-format-p016@pipe-b-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.53, 1.80] s

  * igt@kms_plane@pixel-format-p016@pipe-b-linear:
    - Statuses : 6 pass(s)
    - Exec time: [1.06, 2.32] s

  * igt@kms_plane@pixel-format-p016@pipe-b-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.63, 1.76] s

  * igt@kms_plane@pixel-format-rg16:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-rg16@pipe-a-4:
    - Statuses : 4 pass(s)
    - Exec time: [0.54, 1.80] s

  * igt@kms_plane@pixel-format-rg16@pipe-a-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.60, 1.25] s

  * igt@kms_plane@pixel-format-rg16@pipe-a-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.65, 1.80] s

  * igt@kms_plane@pixel-format-rg16@pipe-b-4:
    - Statuses : 4 pass(s)
    - Exec time: [0.54, 1.82] s

  * igt@kms_plane@pixel-format-rg16@pipe-b-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.60, 1.76] s

  * igt@kms_plane@pixel-format-rg16@pipe-b-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.59, 1.77] s

  * igt@kms_plane@pixel-format-uyvy@pipe-a-4:
    - Statuses : 7 pass(s)
    - Exec time: [0.56, 1.77] s

  * igt@kms_plane@pixel-format-uyvy@pipe-a-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.85, 2.31] s

  * igt@kms_plane@pixel-format-uyvy@pipe-a-x:
    - Statuses : 7 pass(s)
    - Exec time: [0.64, 1.75] s

  * igt@kms_plane@pixel-format-uyvy@pipe-b-4:
    - Statuses : 7 pass(s)
    - Exec time: [0.53, 1.76] s

  * igt@kms_plane@pixel-format-uyvy@pipe-b-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.86, 2.15] s

  * igt@kms_plane@pixel-format-uyvy@pipe-b-x:
    - Statuses : 7 pass(s)
    - Exec time: [0.60, 1.74] s

  * igt@kms_plane@pixel-format-vyuy:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-vyuy@pipe-a-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.55, 1.79] s

  * igt@kms_plane@pixel-format-vyuy@pipe-a-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.84, 2.24] s

  * igt@kms_plane@pixel-format-vyuy@pipe-a-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.62, 1.79] s

  * igt@kms_plane@pixel-format-vyuy@pipe-b-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.53, 1.80] s

  * igt@kms_plane@pixel-format-vyuy@pipe-b-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.85, 2.14] s

  * igt@kms_plane@pixel-format-vyuy@pipe-b-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.61, 1.79] s

  * igt@kms_plane@pixel-format-xb24@pipe-a-4:
    - Statuses : 7 pass(s)
    - Exec time: [0.53, 1.81] s

  * igt@kms_plane@pixel-format-xb24@pipe-a-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.60, 1.64] s

  * igt@kms_plane@pixel-format-xb24@pipe-a-x:
    - Statuses : 7 pass(s)
    - Exec time: [0.64, 1.82] s

  * igt@kms_plane@pixel-format-xb24@pipe-b-4:
    - Statuses : 7 pass(s)
    - Exec time: [0.52, 1.81] s

  * igt@kms_plane@pixel-format-xb24@pipe-b-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.60, 1.77] s

  * igt@kms_plane@pixel-format-xb24@pipe-b-x:
    - Statuses : 7 pass(s)
    - Exec time: [0.60, 1.78] s

  * igt@kms_plane@pixel-format-xb30:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-xb30@pipe-a-4:
    - Statuses : 5 pass(s)
    - Exec time: [0.54, 1.76] s

  * igt@kms_plane@pixel-format-xb30@pipe-a-linear:
    - Statuses : 5 pass(s)
    - Exec time: [0.59, 1.61] s

  * igt@kms_plane@pixel-format-xb30@pipe-a-x:
    - Statuses : 5 pass(s)
    - Exec time: [0.61, 1.79] s

  * igt@kms_plane@pixel-format-xb30@pipe-b-4:
    - Statuses : 5 pass(s)
    - Exec time: [0.53, 1.81] s

  * igt@kms_plane@pixel-format-xb30@pipe-b-linear:
    - Statuses : 5 pass(s)
    - Exec time: [0.59, 1.82] s

  * igt@kms_plane@pixel-format-xb30@pipe-b-x:
    - Statuses : 5 pass(s)
    - Exec time: [0.60, 1.81] s

  * igt@kms_plane@pixel-format-xb4h:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-xb4h@pipe-a-4:
    - Statuses : 5 pass(s)
    - Exec time: [0.54, 1.02] s

  * igt@kms_plane@pixel-format-xb4h@pipe-a-linear:
    - Statuses : 5 pass(s)
    - Exec time: [0.56, 1.24] s

  * igt@kms_plane@pixel-format-xb4h@pipe-a-x:
    - Statuses : 5 pass(s)
    - Exec time: [0.58, 1.17] s

  * igt@kms_plane@pixel-format-xb4h@pipe-b-4:
    - Statuses : 5 pass(s)
    - Exec time: [0.52, 0.99] s

  * igt@kms_plane@pixel-format-xb4h@pipe-b-linear:
    - Statuses : 5 pass(s)
    - Exec time: [0.56, 1.09] s

  * igt@kms_plane@pixel-format-xb4h@pipe-b-x:
    - Statuses : 5 pass(s)
    - Exec time: [0.55, 1.09] s

  * igt@kms_plane@pixel-format-xr24@pipe-a-4:
    - Statuses : 7 pass(s)
    - Exec time: [0.54, 1.85] s

  * igt@kms_plane@pixel-format-xr24@pipe-a-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.59, 1.64] s

  * igt@kms_plane@pixel-format-xr24@pipe-a-x:
    - Statuses : 7 pass(s)
    - Exec time: [0.64, 1.79] s

  * igt@kms_plane@pixel-format-xr24@pipe-b-4:
    - Statuses : 7 pass(s)
    - Exec time: [0.54, 1.83] s

  * igt@kms_plane@pixel-format-xr24@pipe-b-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.60, 1.75] s

  * igt@kms_plane@pixel-format-xr24@pipe-b-x:
    - Statuses : 7 pass(s)
    - Exec time: [0.59, 1.77] s

  * igt@kms_plane@pixel-format-xr30:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-xr30@pipe-a-4:
    - Statuses : 4 pass(s)
    - Exec time: [0.55, 1.15] s

  * igt@kms_plane@pixel-format-xr30@pipe-a-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.60, 1.76] s

  * igt@kms_plane@pixel-format-xr30@pipe-a-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.61, 1.76] s

  * igt@kms_plane@pixel-format-xr30@pipe-b-4:
    - Statuses : 4 pass(s)
    - Exec time: [0.53, 1.16] s

  * igt@kms_plane@pixel-format-xr30@pipe-b-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.59, 2.66] s

  * igt@kms_plane@pixel-format-xr30@pipe-b-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.59, 1.75] s

  * igt@kms_plane@pixel-format-xr4h:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-xr4h@pipe-a-4:
    - Statuses : 5 pass(s)
    - Exec time: [0.53, 1.73] s

  * igt@kms_plane@pixel-format-xr4h@pipe-a-linear:
    - Statuses : 5 pass(s)
    - Exec time: [0.54, 1.65] s

  * igt@kms_plane@pixel-format-xr4h@pipe-a-x:
    - Statuses : 5 pass(s)
    - Exec time: [0.57, 1.72] s

  * igt@kms_plane@pixel-format-xr4h@pipe-b-4:
    - Statuses : 5 pass(s)
    - Exec time: [0.51, 1.76] s

  * igt@kms_plane@pixel-format-xr4h@pipe-b-linear:
    - Statuses : 5 pass(s)
    - Exec time: [0.55, 1.76] s

  * igt@kms_plane@pixel-format-xr4h@pipe-b-x:
    - Statuses : 5 pass(s)
    - Exec time: [0.55, 1.78] s

  * igt@kms_plane@pixel-format-xv30:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-xv30@pipe-a-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.55, 1.76] s

  * igt@kms_plane@pixel-format-xv30@pipe-a-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.73, 1.95] s

  * igt@kms_plane@pixel-format-xv30@pipe-a-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.62, 1.78] s

  * igt@kms_plane@pixel-format-xv30@pipe-b-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.53, 1.76] s

  * igt@kms_plane@pixel-format-xv30@pipe-b-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.82, 2.10] s

  * igt@kms_plane@pixel-format-xv30@pipe-b-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.60, 1.81] s

  * igt@kms_plane@pixel-format-xv36@pipe-a-4:
    - Statuses : 7 pass(s)
    - Exec time: [0.53, 1.76] s

  * igt@kms_plane@pixel-format-xv36@pipe-a-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.73, 1.95] s

  * igt@kms_plane@pixel-format-xv36@pipe-a-x:
    - Statuses : 7 pass(s)
    - Exec time: [0.64, 1.72] s

  * igt@kms_plane@pixel-format-xv36@pipe-b-4:
    - Statuses : 7 pass(s)
    - Exec time: [0.53, 1.77] s

  * igt@kms_plane@pixel-format-xv36@pipe-b-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.82, 2.07] s

  * igt@kms_plane@pixel-format-xv36@pipe-b-x:
    - Statuses : 7 pass(s)
    - Exec time: [0.60, 1.80] s

  * igt@kms_plane@pixel-format-xv48:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-xv48@pipe-a-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.55, 1.78] s

  * igt@kms_plane@pixel-format-xv48@pipe-a-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.74, 2.09] s

  * igt@kms_plane@pixel-format-xv48@pipe-a-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.64, 1.78] s

  * igt@kms_plane@pixel-format-xv48@pipe-b-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.53, 1.76] s

  * igt@kms_plane@pixel-format-xv48@pipe-b-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.82, 2.12] s

  * igt@kms_plane@pixel-format-xv48@pipe-b-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.60, 1.74] s

  * igt@kms_plane@pixel-format-xyuv:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-xyuv@pipe-a-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.55, 1.79] s

  * igt@kms_plane@pixel-format-xyuv@pipe-a-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.75, 1.97] s

  * igt@kms_plane@pixel-format-xyuv@pipe-a-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.62, 1.78] s

  * igt@kms_plane@pixel-format-xyuv@pipe-b-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.51, 1.80] s

  * igt@kms_plane@pixel-format-xyuv@pipe-b-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.82, 2.14] s

  * igt@kms_plane@pixel-format-xyuv@pipe-b-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.58, 1.76] s

  * igt@kms_plane@pixel-format-y210:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-y210@pipe-a-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.54, 1.79] s

  * igt@kms_plane@pixel-format-y210@pipe-a-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.76, 1.93] s

  * igt@kms_plane@pixel-format-y210@pipe-a-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.62, 1.80] s

  * igt@kms_plane@pixel-format-y210@pipe-b-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.53, 1.80] s

  * igt@kms_plane@pixel-format-y210@pipe-b-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.82, 2.12] s

  * igt@kms_plane@pixel-format-y210@pipe-b-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.59, 1.79] s

  * igt@kms_plane@pixel-format-y212:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-y212@pipe-a-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.55, 1.77] s

  * igt@kms_plane@pixel-format-y212@pipe-a-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.73, 1.87] s

  * igt@kms_plane@pixel-format-y212@pipe-a-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.62, 1.80] s

  * igt@kms_plane@pixel-format-y212@pipe-b-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.54, 1.76] s

  * igt@kms_plane@pixel-format-y212@pipe-b-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.82, 2.15] s

  * igt@kms_plane@pixel-format-y212@pipe-b-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.60, 1.79] s

  * igt@kms_plane@pixel-format-y216:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-y216@pipe-a-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.55, 1.76] s

  * igt@kms_plane@pixel-format-y216@pipe-a-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.73, 1.39] s

  * igt@kms_plane@pixel-format-y216@pipe-a-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.62, 1.81] s

  * igt@kms_plane@pixel-format-y216@pipe-b-4:
    - Statuses : 6 pass(s)
    - Exec time: [0.52, 1.82] s

  * igt@kms_plane@pixel-format-y216@pipe-b-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.82, 2.10] s

  * igt@kms_plane@pixel-format-y216@pipe-b-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.59, 1.75] s

  * igt@kms_plane@pixel-format-yuyv@pipe-a-4:
    - Statuses : 7 pass(s)
    - Exec time: [0.54, 1.78] s

  * igt@kms_plane@pixel-format-yuyv@pipe-a-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.86, 2.27] s

  * igt@kms_plane@pixel-format-yuyv@pipe-a-x:
    - Statuses : 7 pass(s)
    - Exec time: [0.62, 1.81] s

  * igt@kms_plane@pixel-format-yuyv@pipe-b-4:
    - Statuses : 7 pass(s)
    - Exec time: [0.52, 1.77] s

  * igt@kms_plane@pixel-format-yuyv@pipe-b-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.86, 2.16] s

  * igt@kms_plane@pixel-format-yuyv@pipe-b-x:
    - Statuses : 7 pass(s)
    - Exec time: [0.61, 1.78] s

  * igt@kms_plane@pixel-format-yvyu:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-yvyu@pipe-a-4:
    - Statuses : 5 pass(s)
    - Exec time: [0.53, 1.79] s

  * igt@kms_plane@pixel-format-yvyu@pipe-a-linear:
    - Statuses : 5 pass(s)
    - Exec time: [0.83, 2.29] s

  * igt@kms_plane@pixel-format-yvyu@pipe-a-x:
    - Statuses : 5 pass(s)
    - Exec time: [0.61, 1.80] s

  * igt@kms_plane@pixel-format-yvyu@pipe-b-4:
    - Statuses : 5 pass(s)
    - Exec time: [0.51, 1.77] s

  * igt@kms_plane@pixel-format-yvyu@pipe-b-linear:
    - Statuses : 5 pass(s)
    - Exec time: [0.84, 2.16] s

  * igt@kms_plane@pixel-format-yvyu@pipe-b-x:
    - Statuses : 5 pass(s)
    - Exec time: [0.59, 1.82] s

  

Known issues
------------

  Here are the changes found in IGTPW_10897_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8411]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#8411])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#6230])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8411])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#9318])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-8/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#7701])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#8414]) +18 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-7/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8414]) +16 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8414]) +40 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [PASS][22] -> [FAIL][23] ([i915#7742])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][24] ([i915#7742])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#3555] / [i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#9323]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@gem_ccs@suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#9323])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#6335])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#8555]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-7/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#8555]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][31] ([i915#1099])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-snb1/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_ctx_sseu@mmap-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][34] -> [FAIL][35] ([i915#5784])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg1-16/igt@gem_eio@reset-stress.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#4771])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4771]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-1/igt@gem_exec_balancer@bonded-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4771])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4036])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#4525])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4812]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#6334]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@many-4k-zero:
    - shard-dg2:          NOTRUN -> [FAIL][43] ([i915#9606])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@gem_exec_capture@many-4k-zero.html

  * igt@gem_exec_endless@dispatch@vcs0:
    - shard-dg2:          [PASS][44] -> [TIMEOUT][45] ([i915#3778] / [i915#7016])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg2-11/igt@gem_exec_endless@dispatch@vcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@gem_exec_endless@dispatch@vcs0.html

  * igt@gem_exec_fair@basic-flow:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4473] / [i915#4771])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-1/igt@gem_exec_fair@basic-flow.html

  * igt@gem_exec_fair@basic-none-share:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-6/igt@gem_exec_fair@basic-none-share.html

  * igt@gem_exec_fair@basic-pace:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3539]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_exec_fair@basic-pace.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][49] ([i915#2842])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-rkl:          [PASS][50] -> [FAIL][51] ([i915#2842])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][52] ([i915#2842])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglu:         [PASS][53] -> [FAIL][54] ([i915#2842])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-tglu-2/igt@gem_exec_fair@basic-pace@rcs0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3539]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_fence@concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4812])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3539] / [i915#4852]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#5107])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#5107])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3281]) +11 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#3281]) +9 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#3281]) +14 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_reloc@basic-write-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#3281]) +9 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@gem_exec_reloc@basic-write-wc-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4537] / [i915#4812])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4537] / [i915#4812]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#7276])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4812]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4860]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4860]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#4860]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@heavy-multi@lmem0:
    - shard-dg2:          [PASS][71] -> [FAIL][72] ([i915#10378])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg2-1/igt@gem_lmem_swapping@heavy-multi@lmem0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@gem_lmem_swapping@heavy-multi@lmem0.html

  * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][73] ([i915#10378])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][74] ([i915#4613]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk9/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [PASS][75] -> [TIMEOUT][76] ([i915#5493])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#4613]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#4613]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-6/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4613])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4565])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#8289])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@gem_media_fill@media-fill.html
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#8289])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-1/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#284])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-5/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@coherency:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4077]) +9 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4077]) +14 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4077]) +6 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-6/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_wc@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4083]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@gem_mmap_wc@read-write.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4083]) +7 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#4083]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#3282]) +6 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@gem_partial_pwrite_pread@reads-uncached.html
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#3282]) +6 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-5/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@uncached:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#3282]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@gem_pread@uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][93] ([i915#2658])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk8/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#4270]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-6/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4270]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#4270]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#4270]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#4270]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#3282]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#5190] / [i915#8428]) +9 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-8/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#8428]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4079]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#4079])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4885])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-8/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4079]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-1/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#3297]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#3297])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#3297])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-5/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#3297] / [i915#4880])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@mmap-offset-banned@gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#3297]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@gem_userptr_blits@mmap-offset-banned@gtt.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#3297] / [i915#4958])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#3297]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#2527] / [i915#2856]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-2/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#2527]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#2527]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#2856]) +5 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_fb_tiling:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4881])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@i915_fb_tiling.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [PASS][118] -> [INCOMPLETE][119] ([i915#9849])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-snb1/igt@i915_module_load@reload-no-display.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-snb2/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [PASS][120] -> [INCOMPLETE][121] ([i915#9820])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#6412])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#8431])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#6621]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-8/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#8925])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@i915_pm_rps@thresholds-park@gt0.html

  * igt@i915_pm_rps@thresholds@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#8925])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@i915_pm_rps@thresholds@gt0.html
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#8925])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@i915_pm_rps@thresholds@gt0.html

  * igt@i915_pm_rps@thresholds@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#3555] / [i915#8925])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@i915_pm_rps@thresholds@gt1.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#6245])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][130] ([i915#9311])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][131] ([i915#7443])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#4212]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#4212]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#4215])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#4212]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#3826])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#8709]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#8709]) +11 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#9531])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#5286]) +6 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#5286]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-7/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#5286])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#4538] / [i915#5286]) +6 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#3638]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#4538] / [i915#5190]) +16 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#3638]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#5190]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#6187]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [FAIL][149] ([i915#3743])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#4538]) +5 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][151] +12 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#6095]) +91 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#6095]) +27 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#6095]) +27 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#6095]) +69 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#10278])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#10307] / [i915#6095]) +183 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#3742])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#4087]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-8/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#7828]) +9 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#7828]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-9/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#7828]) +7 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#7828]) +13 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#7828]) +7 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#7118] / [i915#9424])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][167] ([i915#7173])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@content-type-change:
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#6944] / [i915#9424])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#3299]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#3116]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#3116] / [i915#3299])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-9/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#9424]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#9424]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-1/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#9424]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#6944] / [i915#7116] / [i915#7118])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#8814]) +3 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#3555] / [i915#8814]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#3359]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#3555]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-3/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#3555]) +6 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#3359]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#3555]) +7 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#3359]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#4103]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#4103]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#5354]) +44 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#9809]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][189] -> [FAIL][190] ([i915#2346]) +1 other test fail
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#9067])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-dg2:          [PASS][192] -> [DMESG-WARN][193] ([i915#10166])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg2-1/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#9723])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#9723])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#3555]) +7 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#3555] / [i915#3840])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#3555] / [i915#3840]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-8/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#3469])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#1839])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#1839])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#1839]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#658])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#4881])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-1/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][205] -> [FAIL][206] ([i915#2122]) +2 other tests fail
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-snb2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#3637]) +5 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][208] +39 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#8381]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#8381]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#9934]) +5 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][212] +28 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#3637]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-10/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#8381]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#2672]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#2672]) +4 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#2672]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#2587] / [i915#2672])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#2587] / [i915#2672]) +8 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#3555] / [i915#8810])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#2672] / [i915#3555])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          [PASS][222] -> [FAIL][223] ([i915#6880])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#3023]) +22 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#8708]) +23 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][226] +63 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][227] +45 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#1825]) +37 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#5439])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#9766])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#10070])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#8708]) +21 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][233] +352 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#8708]) +10 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#3458]) +22 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#3458]) +21 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#1825]) +21 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][238] +63 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#3555] / [i915#8228])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#3555] / [i915#8228]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@kms_hdr@static-swap.html
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#3555] / [i915#8228])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-3/igt@kms_hdr@static-swap.html
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#3555] / [i915#8228]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_hdr@static-swap.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#4816])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#4816])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#6301])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][246] ([i915#7862]) +1 other test fail
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk8/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#3582]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-7/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#8821])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#6953])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#6953] / [i915#9423])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][251] ([i915#8292])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#9423]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#9423]) +7 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#9423]) +11 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#9423]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#5235] / [i915#9423]) +11 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#5235]) +15 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#5235] / [i915#9423] / [i915#9728]) +7 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#5235]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#5235]) +7 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#5354]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#9812]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-4/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#9685])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#3361])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@kms_pm_dc@dc6-dpms.html
    - shard-tglu:         [PASS][265] -> [FAIL][266] ([i915#9295])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-tglu-4/igt@kms_pm_dc@dc6-dpms.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#9685]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@kms_pm_dc@dc6-psr.html
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#9685])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#3361])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#9340])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#9519])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#9519])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][273] -> [SKIP][274] ([i915#9519]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#6524] / [i915#6805]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#4348])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@kms_psr2_su@page_flip-nv12.html
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#9683])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#9683])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#1072] / [i915#9673] / [i915#9732]) +5 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-primary-blt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#9688]) +6 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@kms_psr@fbc-psr-primary-blt@edp-1.html

  * igt@kms_psr@pr-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#1072] / [i915#9732]) +25 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#1072] / [i915#9732]) +26 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-primary-render:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#9732]) +9 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-8/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#1072] / [i915#9732]) +21 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-rkl:          [PASS][285] -> [INCOMPLETE][286] ([i915#8875] / [i915#9475] / [i915#9569])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-3/igt@kms_rotation_crc@primary-rotation-90.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#5289]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][288] ([i915#4235]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#4235]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg1:          NOTRUN -> [FAIL][290] ([IGT#2] / [i915#6493])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-tglu:         [PASS][291] -> [FAIL][292] ([i915#9196])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#8808] / [i915#9906])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-6/igt@kms_vrr@flip-basic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#9906])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#9906])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-6/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#2437] / [i915#9412]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#2437]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#2437])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][299] ([i915#9100])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf@stress-open-close@0-rcs0:
    - shard-glk:          [PASS][300] -> [ABORT][301] ([i915#8190])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-glk8/igt@perf@stress-open-close@0-rcs0.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk2/igt@perf@stress-open-close@0-rcs0.html

  * igt@perf_pmu@busy-check-all@rcs0:
    - shard-mtlp:         [PASS][302] -> [FAIL][303] ([i915#4349]) +2 other tests fail
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-mtlp-4/igt@perf_pmu@busy-check-all@rcs0.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@perf_pmu@busy-check-all@rcs0.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [PASS][304] -> [FAIL][305] ([i915#4349]) +6 other tests fail
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#8850])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#8516])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][308] ([i915#5493])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-8/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#3708])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#3708]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#3291] / [i915#3708])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#3291] / [i915#3708])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#3708])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#9917]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#9917])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-mtlp:         NOTRUN -> [SKIP][316] ([i915#9917])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#9917])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-5/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@syncobj_timeline@invalid-wait-zero-handles:
    - shard-glk:          NOTRUN -> [FAIL][318] ([i915#9781])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk8/igt@syncobj_timeline@invalid-wait-zero-handles.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-mtlp:         NOTRUN -> [FAIL][319] ([i915#9779])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@syncobj_wait@invalid-wait-zero-handles.html
    - shard-dg2:          NOTRUN -> [FAIL][320] ([i915#9779])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@syncobj_wait@invalid-wait-zero-handles.html
    - shard-glk:          NOTRUN -> [FAIL][321] ([i915#9779])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk3/igt@syncobj_wait@invalid-wait-zero-handles.html

  * igt@v3d/v3d_get_param@get-bad-flags:
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#2575]) +7 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-6/igt@v3d/v3d_get_param@get-bad-flags.html

  * igt@v3d/v3d_perfmon@get-values-invalid-pad:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#2575]) +15 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@v3d/v3d_perfmon@get-values-invalid-pad.html

  * igt@v3d/v3d_submit_csd@job-perfmon:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#2575]) +16 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@v3d/v3d_submit_csd@job-perfmon.html

  * igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#7711]) +8 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem.html

  * igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:
    - shard-mtlp:         NOTRUN -> [SKIP][326] ([i915#7711]) +6 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html

  * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#7711]) +9 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html

  * igt@vc4/vc4_tiling@set-bad-flags:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#2575]) +8 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-6/igt@vc4/vc4_tiling@set-bad-flags.html

  * igt@vc4/vc4_tiling@set-get:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#7711]) +8 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@vc4/vc4_tiling@set-get.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@virtual-idle:
    - shard-rkl:          [FAIL][330] ([i915#7742]) -> [PASS][331] +1 other test pass
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-5/igt@drm_fdinfo@virtual-idle.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][332] ([i915#5784]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg1-16/igt@gem_eio@unwedge-stress.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-rkl:          [FAIL][334] ([i915#2842]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-3/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-rkl:          [DMESG-WARN][336] -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-3/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-6/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
    - shard-dg2:          [FAIL][338] ([i915#10378]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg2-2/igt@gem_lmem_swapping@

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/index.html

--===============6978190495100406421==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>RFC: Converting subtests of kms_plane into dynamic subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131563/">https://patchwork.freedesktop.org/series/131563/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14478_full -&gt; IGTPW_10897_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10897_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10897_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10897_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-mtlp-7/igt@gem_eio@in-flight-contexts-immediate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@gem_eio@in-flight-contexts-immediate.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-error-state-capture@bcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-snb4/igt@i915_hangman@gt-error-state-capture@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-snb7/igt@i915_hangman@gt-error-state-capture@bcs0.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_atomic_transition@plane-all-transition@pipe-b-hdmi-a-3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-4.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a-hdmi-a-1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-check-all@ccs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg2-1/igt@perf_pmu@busy-check-all@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@perf_pmu@busy-check-all@ccs0.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-check-all@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-mtlp-4/igt@perf_pmu@busy-check-all@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@perf_pmu@busy-check-all@vecs0.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_14478_full and IGTPW_10897_full:</p>
<h3>New IGT tests (196)</h3>
<ul>
<li>
<p>igt@kms_plane@pixel-format-ab24:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab24@pipe-a-4:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.54, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab24@pipe-a-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.59, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab24@pipe-a-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.63, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab24@pipe-b-4:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.53, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab24@pipe-b-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.59, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab24@pipe-b-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.59, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab30:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab30@pipe-a-4:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.54, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab30@pipe-a-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.59, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab30@pipe-a-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.61, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab30@pipe-b-4:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.52, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab30@pipe-b-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.59, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab30@pipe-b-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.59, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab4h:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab4h@pipe-a-4:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.55, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab4h@pipe-a-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.55, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab4h@pipe-a-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.57, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab4h@pipe-b-4:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.52, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab4h@pipe-b-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.55, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ab4h@pipe-b-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.55, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar24:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar24@pipe-a-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.55, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar24@pipe-a-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.60, 1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar24@pipe-a-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.62, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar24@pipe-b-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.53, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar24@pipe-b-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.62, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar24@pipe-b-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.60, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar30:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar30@pipe-a-4:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.55, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar30@pipe-a-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.59, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar30@pipe-a-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.62, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar30@pipe-b-4:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.53, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar30@pipe-b-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.58, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar30@pipe-b-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.58, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar4h:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar4h@pipe-a-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.54, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar4h@pipe-a-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.55, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar4h@pipe-a-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.58, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar4h@pipe-b-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.52, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar4h@pipe-b-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.55, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-ar4h@pipe-b-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.56, 1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-c8:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-c8@pipe-a-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.54, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-c8@pipe-a-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.64, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-c8@pipe-a-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.67, 1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-c8@pipe-b-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.53, 1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-c8@pipe-b-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.64, 1.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-c8@pipe-b-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.64, 1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-nv12@pipe-a-4:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.54, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-nv12@pipe-a-linear:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.75, 2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-nv12@pipe-a-x:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.67, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-nv12@pipe-b-4:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.52, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-nv12@pipe-b-linear:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.82, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-nv12@pipe-b-x:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.63, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p010@pipe-a-4:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.55, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p010@pipe-a-linear:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.75, 2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p010@pipe-a-x:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.66, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p010@pipe-b-4:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.53, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p010@pipe-b-linear:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.81, 2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p010@pipe-b-x:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.64, 1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p012:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p012@pipe-a-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.55, 1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p012@pipe-a-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.74, 2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p012@pipe-a-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.68, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p012@pipe-b-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.52, 1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p012@pipe-b-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.82, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p012@pipe-b-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.65, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p016:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p016@pipe-a-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.51, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p016@pipe-a-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.05, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p016@pipe-a-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.65, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p016@pipe-b-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.53, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p016@pipe-b-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.06, 2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-p016@pipe-b-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.63, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-rg16:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-rg16@pipe-a-4:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.54, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-rg16@pipe-a-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.60, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-rg16@pipe-a-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.65, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-rg16@pipe-b-4:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.54, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-rg16@pipe-b-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.60, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-rg16@pipe-b-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.59, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-uyvy@pipe-a-4:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.56, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-uyvy@pipe-a-linear:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.85, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-uyvy@pipe-a-x:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.64, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-uyvy@pipe-b-4:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.53, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-uyvy@pipe-b-linear:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.86, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-uyvy@pipe-b-x:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.60, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-vyuy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-vyuy@pipe-a-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.55, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-vyuy@pipe-a-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.84, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-vyuy@pipe-a-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.62, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-vyuy@pipe-b-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.53, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-vyuy@pipe-b-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.85, 2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-vyuy@pipe-b-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.61, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb24@pipe-a-4:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.53, 1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb24@pipe-a-linear:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.60, 1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb24@pipe-a-x:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.64, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb24@pipe-b-4:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.52, 1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb24@pipe-b-linear:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.60, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb24@pipe-b-x:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.60, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb30:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb30@pipe-a-4:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.54, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb30@pipe-a-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.59, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb30@pipe-a-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.61, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb30@pipe-b-4:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.53, 1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb30@pipe-b-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.59, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb30@pipe-b-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.60, 1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb4h:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb4h@pipe-a-4:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.54, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb4h@pipe-a-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.56, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb4h@pipe-a-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.58, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb4h@pipe-b-4:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.52, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb4h@pipe-b-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.56, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xb4h@pipe-b-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.55, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr24@pipe-a-4:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.54, 1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr24@pipe-a-linear:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.59, 1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr24@pipe-a-x:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.64, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr24@pipe-b-4:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.54, 1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr24@pipe-b-linear:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.60, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr24@pipe-b-x:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.59, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr30:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr30@pipe-a-4:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.55, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr30@pipe-a-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.60, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr30@pipe-a-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.61, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr30@pipe-b-4:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.53, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr30@pipe-b-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.59, 2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr30@pipe-b-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.59, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr4h:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr4h@pipe-a-4:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.53, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr4h@pipe-a-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.54, 1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr4h@pipe-a-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.57, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr4h@pipe-b-4:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.51, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr4h@pipe-b-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.55, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xr4h@pipe-b-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.55, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv30:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv30@pipe-a-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.55, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv30@pipe-a-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.73, 1.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv30@pipe-a-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.62, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv30@pipe-b-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.53, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv30@pipe-b-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.82, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv30@pipe-b-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.60, 1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv36@pipe-a-4:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.53, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv36@pipe-a-linear:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.73, 1.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv36@pipe-a-x:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.64, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv36@pipe-b-4:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.53, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv36@pipe-b-linear:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.82, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv36@pipe-b-x:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.60, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv48:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv48@pipe-a-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.55, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv48@pipe-a-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.74, 2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv48@pipe-a-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.64, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv48@pipe-b-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.53, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv48@pipe-b-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.82, 2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xv48@pipe-b-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.60, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xyuv:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xyuv@pipe-a-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.55, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xyuv@pipe-a-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.75, 1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xyuv@pipe-a-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.62, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xyuv@pipe-b-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.51, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xyuv@pipe-b-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.82, 2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-xyuv@pipe-b-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.58, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y210:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y210@pipe-a-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.54, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y210@pipe-a-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.76, 1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y210@pipe-a-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.62, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y210@pipe-b-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.53, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y210@pipe-b-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.82, 2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y210@pipe-b-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.59, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y212:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y212@pipe-a-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.55, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y212@pipe-a-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.73, 1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y212@pipe-a-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.62, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y212@pipe-b-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.54, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y212@pipe-b-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.82, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y212@pipe-b-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.60, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y216:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y216@pipe-a-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.55, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y216@pipe-a-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.73, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y216@pipe-a-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.62, 1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y216@pipe-b-4:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.52, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y216@pipe-b-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.82, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y216@pipe-b-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.59, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yuyv@pipe-a-4:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.54, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yuyv@pipe-a-linear:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.86, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yuyv@pipe-a-x:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.62, 1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yuyv@pipe-b-4:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.52, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yuyv@pipe-b-linear:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.86, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yuyv@pipe-b-x:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.61, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yvyu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yvyu@pipe-a-4:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.53, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yvyu@pipe-a-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.83, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yvyu@pipe-a-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.61, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yvyu@pipe-b-4:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.51, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yvyu@pipe-b-linear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.84, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yvyu@pipe-b-x:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.59, 1.82] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10897_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-8/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-7/igt@drm_fdinfo@busy-hang@rcs0.html">SKIP</a> ([i915#8414]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@drm_fdinfo@busy-idle-check-all@vcs1.html">SKIP</a> ([i915#8414]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> ([i915#8414]) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-6/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-7/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-snb1/igt@gem_ctx_persistence@hostile.html">SKIP</a> ([i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg1-16/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-1/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#4771]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@gem_exec_balancer@sliced.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-zero:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@gem_exec_capture@many-4k-zero.html">FAIL</a> ([i915#9606])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg2-11/igt@gem_exec_endless@dispatch@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@gem_exec_endless@dispatch@vcs0.html">TIMEOUT</a> ([i915#3778] / [i915#7016])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-1/igt@gem_exec_fair@basic-flow.html">SKIP</a> ([i915#4473] / [i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-6/igt@gem_exec_fair@basic-none-share.html">SKIP</a> ([i915#3539] / [i915#4852]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_exec_fair@basic-pace.html">SKIP</a> ([i915#3539]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-tglu-2/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@gem_exec_fair@basic-sync.html">SKIP</a> ([i915#3539]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@concurrent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@gem_exec_fence@concurrent.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([i915#5107])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a> ([i915#3281]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> ([i915#3281]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@gem_exec_reloc@basic-write-wc-noreloc.html">SKIP</a> ([i915#3281]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#7276])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#4860]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> ([i915#4860]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg2-1/igt@gem_lmem_swapping@heavy-multi@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@gem_lmem_swapping@heavy-multi@lmem0.html">FAIL</a> ([i915#10378])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html">FAIL</a> ([i915#10378])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk9/igt@gem_lmem_swapping@massive-random.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@gem_lmem_swapping@verify.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-1/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-5/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([i915#4077]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> ([i915#4077]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-6/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@gem_mmap_wc@read-write.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@gem_mmap_wc@write-prefaulted.html">SKIP</a> ([i915#4083]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@gem_mmap_wc@write-read.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#3282]) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-5/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#3282]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@gem_pread@uncached.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk8/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-6/igt@gem_pxp@create-regular-buffer.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@gem_readwrite@read-bad-handle.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-8/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#8428]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#4079]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-8/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-1/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#4079]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-5/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-banned@gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@gem_userptr_blits@mmap-offset-banned@gtt.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-2/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2527]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@i915_fb_tiling.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-snb1/igt@i915_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-snb2/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> ([i915#9849])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html">SKIP</a> ([i915#8431])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-8/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#6621]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@i915_pm_rps@thresholds-park@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@i915_pm_rps@thresholds@gt0.html">SKIP</a> ([i915#8925])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@i915_pm_rps@thresholds@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@i915_pm_rps@thresholds@gt1.html">SKIP</a> ([i915#3555] / [i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-4/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> ([i915#7443])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286]) +6 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-7/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538] / [i915#5286]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#3638]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> ([i915#5190]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#6187]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([i915#3743])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#4538]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> ([i915#6095]) +91 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#6095]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html">SKIP</a> ([i915#6095]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#6095]) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> ([i915#10278])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#6095]) +183 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-8/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-9/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> ([i915#7828]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-9/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-1/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424]) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-6/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-8/igt@kms_content_protection@srm.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> ([i915#8814]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> ([i915#3555] / [i915#8814]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#3359]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-3/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> ([i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#3359]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> ([i915#3359]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([i915#5354]) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([i915#9809]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg2-1/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> ([i915#10166])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-8/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-1/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-snb2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#2122]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> ([i915#3637]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> +39 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> ([i915#9934]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-10/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> ([i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#8381]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#3555] / [i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#3023]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([i915#1825]) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> ([i915#10070])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> +352 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> ([i915#3458]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> ([i915#3458]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> ([i915#1825]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-3/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk8/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html">FAIL</a> ([i915#7862]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-7/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html">SKIP</a> ([i915#3582]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#9423]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-3.html">SKIP</a> ([i915#9423]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#5235] / [i915#9423]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html">SKIP</a> ([i915#5235]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2.html">SKIP</a> ([i915#5235] / [i915#9423] / [i915#9728]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1.html">SKIP</a> ([i915#5235]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#5235]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> ([i915#5354]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> ([i915#9812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#3361])</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-tglu-4/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3361])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524] / [i915#6805]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#4348])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> ([i915#1072] / [i915#9673] / [i915#9732]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@kms_psr@fbc-psr-primary-blt@edp-1.html">SKIP</a> ([i915#9688]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_psr@pr-sprite-render.html">SKIP</a> ([i915#1072] / [i915#9732]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-8/igt@kms_psr@psr2-primary-render.html">SKIP</a> ([i915#9732]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-14/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> ([i915#1072] / [i915#9732]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-3/igt@kms_rotation_crc@primary-rotation-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_rotation_crc@primary-rotation-90.html">INCOMPLETE</a> ([i915#8875] / [i915#9475] / [i915#9569])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-8/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> ([i915#4235]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> ([i915#4235]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2] / [i915#6493])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#8808] / [i915#9906])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-17/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-6/igt@kms_vrr@max-min.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> ([i915#9100])</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close@0-rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-glk8/igt@perf@stress-open-close@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk2/igt@perf@stress-open-close@0-rcs0.html">ABORT</a> ([i915#8190])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-check-all@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-mtlp-4/igt@perf_pmu@busy-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@perf_pmu@busy-check-all@rcs0.html">FAIL</a> ([i915#4349]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-16/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-8/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> ([i915#5493])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@prime_vgem@basic-fence-flip.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3708]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@prime_vgem@basic-read.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> ([i915#9917]) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-5/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-5/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk8/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-2/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> ([i915#9779])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> ([i915#9779])</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-glk3/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> ([i915#9779])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@get-bad-flags:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-6/igt@v3d/v3d_get_param@get-bad-flags.html">SKIP</a> ([i915#2575]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-pad:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-15/igt@v3d/v3d_perfmon@get-values-invalid-pad.html">SKIP</a> ([i915#2575]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@job-perfmon:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-11/igt@v3d/v3d_submit_csd@job-perfmon.html">SKIP</a> ([i915#2575]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-13/igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem.html">SKIP</a> ([i915#7711]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-mtlp-4/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html">SKIP</a> ([i915#7711]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-3/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html">SKIP</a> ([i915#7711]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@set-bad-flags:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-tglu-6/igt@vc4/vc4_tiling@set-bad-flags.html">SKIP</a> ([i915#2575]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@set-get:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg2-2/igt@vc4/vc4_tiling@set-get.html">SKIP</a> ([i915#7711]) +8 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-5/igt@drm_fdinfo@virtual-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg1-16/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-dg1-18/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-3/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-4/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-rkl-3/igt@gem_exec_whisper@basic-contexts-priority-all.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10897/shard-rkl-6/igt@gem_exec_whisper@basic-contexts-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14478/shard-dg2-2/igt@gem_lmem_swapping@">FAIL</a> ([i915#10378]) -&gt; [PASS][339]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6978190495100406421==--
