Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32512606A336
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 20:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81CB10E8D2;
	Wed,  4 Nov 2026 20:27:37 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F62A10E8D2;
 Wed,  4 Nov 2026 20:26:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4018542194603736260=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/kms=5Fsetmode=3A_Con?=
 =?utf-8?q?vert_to_igt=5Fdisplay_atomic_API_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Nov 2026 20:26:41 -0000
Message-ID: <179382400164.120612.1747651241883365692@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261104063442.2208555-1-jeevan.b@intel.com>
In-Reply-To: <20261104063442.2208555-1-jeevan.b@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4018542194603736260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Convert to igt_display atomic API (rev3)
URL   : https://patchwork.freedesktop.org/series/164189/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9177_FULL -> XEIGTPW_16100_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_16100_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_16100_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_16100_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_setmode@invalid-clone-single-crtc@pipe-a-dp-2-hdmi-a-3:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc@pipe-a-dp-2-hdmi-a-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc@pipe-a-dp-2-hdmi-a-3.html

  
New tests
---------

  New tests have been introduced between XEIGT_9177_FULL and XEIGTPW_16100_FULL:

### New IGT tests (80) ###

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_sharpness_filter@filter-basic:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 4.99] s

  * igt@kms_sharpness_filter@filter-basic@pipe-a-edp-1-basic:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 0.43] s

  * igt@kms_sharpness_filter@filter-basic@pipe-b-edp-1-basic:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.52] s

  * igt@kms_sharpness_filter@filter-basic@pipe-c-edp-1-basic:
    - Statuses : 2 pass(s)
    - Exec time: [1.43, 1.49] s

  * igt@kms_sharpness_filter@filter-basic@pipe-d-edp-1-basic:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_sharpness_filter@filter-dpms:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 9.78] s

  * igt@kms_sharpness_filter@filter-dpms@pipe-a-edp-1-dpms:
    - Statuses : 2 pass(s)
    - Exec time: [1.59, 1.61] s

  * igt@kms_sharpness_filter@filter-dpms@pipe-b-edp-1-dpms:
    - Statuses : 2 pass(s)
    - Exec time: [2.71, 2.75] s

  * igt@kms_sharpness_filter@filter-dpms@pipe-c-edp-1-dpms:
    - Statuses : 2 pass(s)
    - Exec time: [2.61, 2.71] s

  * igt@kms_sharpness_filter@filter-dpms@pipe-d-edp-1-dpms:
    - Statuses : 1 pass(s)
    - Exec time: [2.70] s

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 5.35] s

  * igt@kms_sharpness_filter@filter-scaler-downscale@pipe-a-edp-1-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.53] s

  * igt@kms_sharpness_filter@filter-scaler-downscale@pipe-b-edp-1-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.48, 1.56] s

  * igt@kms_sharpness_filter@filter-scaler-downscale@pipe-c-edp-1-downscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.58, 1.60] s

  * igt@kms_sharpness_filter@filter-scaler-downscale@pipe-d-edp-1-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_sharpness_filter@filter-scaler-upscale:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 5.30] s

  * igt@kms_sharpness_filter@filter-scaler-upscale@pipe-a-edp-1-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.52] s

  * igt@kms_sharpness_filter@filter-scaler-upscale@pipe-b-edp-1-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.48, 1.52] s

  * igt@kms_sharpness_filter@filter-scaler-upscale@pipe-c-edp-1-upscale:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.61] s

  * igt@kms_sharpness_filter@filter-scaler-upscale@pipe-d-edp-1-upscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_sharpness_filter@filter-strength:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.04, 29.01] s

  * igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.40] s

  * igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.51] s

  * igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-191:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.52] s

  * igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-255:
    - Statuses : 2 pass(s)
    - Exec time: [1.48, 1.52] s

  * igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-64:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.51] s

  * igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.43, 1.49] s

  * igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.46, 1.50] s

  * igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-191:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.49] s

  * igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-255:
    - Statuses : 2 pass(s)
    - Exec time: [1.46, 1.51] s

  * igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-64:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.50] s

  * igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.46, 1.49] s

  * igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.48] s

  * igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-191:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.48] s

  * igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-255:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.48] s

  * igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-64:
    - Statuses : 2 pass(s)
    - Exec time: [1.46, 1.48] s

  * igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-128:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-191:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-255:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-64:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_sharpness_filter@filter-suspend:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 9.42] s

  * igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend:
    - Statuses : 2 pass(s)
    - Exec time: [3.42, 4.79] s

  * igt@kms_sharpness_filter@filter-suspend@pipe-c-edp-1-suspend:
    - Statuses : 1 pass(s)
    - Exec time: [4.37] s

  * igt@kms_sharpness_filter@filter-suspend@pipe-d-edp-1-suspend:
    - Statuses : 1 pass(s)
    - Exec time: [4.60] s

  * igt@kms_sharpness_filter@filter-tap:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 5.58] s

  * igt@kms_sharpness_filter@filter-tap@pipe-a-edp-1-tap-5:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.31] s

  * igt@kms_sharpness_filter@filter-tap@pipe-b-edp-1-tap-5:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.40] s

  * igt@kms_sharpness_filter@filter-tap@pipe-c-edp-1-tap-5:
    - Statuses : 2 pass(s)
    - Exec time: [1.25, 1.39] s

  * igt@kms_sharpness_filter@filter-tap@pipe-d-edp-1-tap-5:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_sharpness_filter@filter-toggle:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 5.76] s

  * igt@kms_sharpness_filter@filter-toggle@pipe-a-edp-1-toggle:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.61] s

  * igt@kms_sharpness_filter@filter-toggle@pipe-b-edp-1-toggle:
    - Statuses : 2 pass(s)
    - Exec time: [1.60, 1.71] s

  * igt@kms_sharpness_filter@filter-toggle@pipe-c-edp-1-toggle:
    - Statuses : 2 pass(s)
    - Exec time: [1.65, 1.69] s

  * igt@kms_sharpness_filter@filter-toggle@pipe-d-edp-1-toggle:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.03, 1.52] s

  * igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-a-edp-1-invalid-filter-with-plane:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 0.42] s

  * igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-b-edp-1-invalid-filter-with-plane:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.36] s

  * igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-c-edp-1-invalid-filter-with-plane:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 0.35] s

  * igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-d-edp-1-invalid-filter-with-plane:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.03, 0.61] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-a-edp-1-invalid-filter-with-scaler:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.22] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-b-edp-1-invalid-filter-with-scaler:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.12] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-c-edp-1-invalid-filter-with-scaler:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.12] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-d-edp-1-invalid-filter-with-scaler:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.05, 10.87] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-aspec:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.49] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-fulls:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.38] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-b-edp-1-invalid-filter-with-scaling-mode-aspec:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.51] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-b-edp-1-invalid-filter-with-scaling-mode-fulls:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.38] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-c-edp-1-invalid-filter-with-scaling-mode-aspec:
    - Statuses : 2 pass(s)
    - Exec time: [1.39, 1.52] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-c-edp-1-invalid-filter-with-scaling-mode-fulls:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.52] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-d-edp-1-invalid-filter-with-scaling-mode-aspec:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-d-edp-1-invalid-filter-with-scaling-mode-fulls:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.02, 4.87] s

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
    - Statuses : 2 pass(s)
    - Exec time: [0.33, 0.36] s

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-b-edp-1-invalid-plane-with-filter:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.43] s

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-c-edp-1-invalid-plane-with-filter:
    - Statuses : 2 pass(s)
    - Exec time: [1.31, 1.53] s

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-d-edp-1-invalid-plane-with-filter:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_16100_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose-with-load:
    - shard-bmg:          [PASS][3] -> [ABORT][4] ([Intel XE#9463])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-7/igt@core_hotunplug@hotreplug-lateclose-with-load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@core_hotunplug@hotreplug-lateclose-with-load.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#8583])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-2/igt@intel_hwmon@hwmon-write.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#5947])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2370])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][9] ([Intel XE#6925])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2327]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-90.html
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5901]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2328] / [Intel XE#7367])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#5850])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#5851])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#5808]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#7679]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7679])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#367]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#367]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-6/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#367]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2652]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          [PASS][24] -> [INCOMPLETE][25] ([Intel XE#7084] / [Intel XE#8150])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#3432]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#5822]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +7 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2325] / [Intel XE#7358])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#5824])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-3/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2252]) +6 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#2252]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#6969]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#6974])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7642])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@kms_content_protection@mei-interface.html
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#5845])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2320]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#5900]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#5962]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-bmg:          [PASS][41] -> [INCOMPLETE][42] ([Intel XE#7935] / [Intel XE#8151])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][43] -> [DMESG-WARN][44] ([Intel XE#7774] / [Intel XE#9522])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-9/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#5962] / [Intel XE#7343]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#9532])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-3/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#9534])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#9527])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst-direct-train.html
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#9527])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#9535])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#5907])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#4422] / [Intel XE#7442])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4156] / [Intel XE#7425])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#8680])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1138] / [Intel XE#7344])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][56] ([Intel XE#2316]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7178] / [Intel XE#7349])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][59] ([Intel XE#7178]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7179])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#5800] / [Intel XE#6312]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#4141]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#5812]) +36 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7061] / [Intel XE#7356])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#6312]) +6 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2311]) +33 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#7061])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#7865]) +14 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][69] ([Intel XE#7061]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2313]) +39 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][71] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#1503])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#5917] / [Intel XE#6174])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#6901]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
    - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#6901]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][77] ([Intel XE#6900])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#6911] / [Intel XE#7466])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#7591])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#8303]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][81] ([Intel XE#7283]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@kms_plane@pixel-format-x-tiled-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#7283]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#5844]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#5021] / [Intel XE#7377])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#4596] / [Intel XE#5854])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#5020] / [Intel XE#7348])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#6886]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-ptl:          NOTRUN -> [SKIP][89] ([Intel XE#1131])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#8399])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-ptl:          NOTRUN -> [SKIP][92] ([Intel XE#5849])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#6814] / [Intel XE#7428])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-9/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#7304]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#1489]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
    - shard-ptl:          NOTRUN -> [SKIP][96] ([Intel XE#5858] / [Intel XE#7304]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][97] ([Intel XE#5858]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#7413])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_psr@fbc-pr-no-drrs.html
    - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#1406]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][101] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-6/igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2330] / [Intel XE#5813])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-ptl:          NOTRUN -> [SKIP][103] ([Intel XE#5813])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][104] -> [INCOMPLETE][105] ([Intel XE#8479]) +2 other tests incomplete
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-1/igt@kms_setmode@basic.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-9/igt@kms_setmode@basic.html
    - shard-ptl:          [PASS][106] -> [INCOMPLETE][107] ([Intel XE#8479])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-ptl-7/igt@kms_setmode@basic.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic-no-cpu-idle:
    - shard-ptl:          NOTRUN -> [INCOMPLETE][108] ([Intel XE#8479])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@kms_setmode@basic-no-cpu-idle.html
    - shard-lnl:          [PASS][109] -> [INCOMPLETE][110] ([Intel XE#8479]) +1 other test incomplete
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-lnl-3/igt@kms_setmode@basic-no-cpu-idle.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-lnl-4/igt@kms_setmode@basic-no-cpu-idle.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-ptl:          NOTRUN -> [SKIP][111] ([Intel XE#5910])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-toggle (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#6503]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [PASS][113] -> [FAIL][114] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#1499] / [Intel XE#9271])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
    - shard-bmg:          [PASS][116] -> [ABORT][117] ([Intel XE#9279]) +1 other test abort
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-10/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html

  * igt@xe_evict@evict-mixed-threads-large-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][118] ([Intel XE#5764]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@xe_evict@evict-mixed-threads-large-multi-vm.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][119] ([Intel XE#7482]) +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@xe_exec_balancer@many-cm-virtual-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-ptl:          NOTRUN -> [SKIP][121] ([Intel XE#5575] / [Intel XE#7484]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#8374]) +8 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][123] ([Intel XE#8374]) +6 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch.html

  * igt@xe_exec_multi_queue@exec-sanity:
    - shard-ptl:          NOTRUN -> [SKIP][124] ([Intel XE#8364]) +14 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@xe_exec_multi_queue@exec-sanity.html

  * igt@xe_exec_multi_queue@max-queues-basic:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#8364]) +16 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-basic.html

  * igt@xe_exec_reset@gt-stress-reset-destroy-vm-context:
    - shard-ptl:          [PASS][126] -> [DMESG-WARN][127] ([Intel XE#8652])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-ptl-1/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-3/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-ptl:          NOTRUN -> [SKIP][128] ([Intel XE#8369])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#8378]) +7 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][130] ([Intel XE#8378]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html

  * igt@xe_madvise@atomic-cpu:
    - shard-ptl:          NOTRUN -> [SKIP][131] ([Intel XE#7980])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@xe_madvise@atomic-cpu.html

  * igt@xe_mmap@vram:
    - shard-ptl:          NOTRUN -> [SKIP][132] ([Intel XE#5776])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@xe_mmap@vram.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#6964]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html
    - shard-ptl:          NOTRUN -> [SKIP][134] ([Intel XE#6964]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html

  * igt@xe_page_reclaim@random:
    - shard-ptl:          NOTRUN -> [SKIP][135] ([Intel XE#7793]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@xe_page_reclaim@random.html
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#7793])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-8/igt@xe_page_reclaim@random.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#7590]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-3/igt@xe_pat@xa-app-transient-media-off.html
    - shard-ptl:          NOTRUN -> [SKIP][138] ([Intel XE#7590])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-ptl:          NOTRUN -> [SKIP][139] ([Intel XE#6867])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-6/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [PASS][140] -> [ABORT][141] ([Intel XE#9362])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-ptl-2/igt@xe_pm@s4-mocs.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@xe_pm@s4-mocs.html
    - shard-lnl:          [PASS][142] -> [DMESG-WARN][143] ([Intel XE#7727]) +1 other test dmesg-warn
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-lnl-8/igt@xe_pm@s4-mocs.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-lnl-4/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-ptl:          [PASS][144] -> [DMESG-WARN][145] ([Intel XE#7727])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-ptl-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-ptl:          NOTRUN -> [SKIP][146] ([Intel XE#7599])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#944])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [PASS][149] -> [FAIL][150] ([Intel XE#6569])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
    - shard-ptl:          NOTRUN -> [SKIP][151] ([Intel XE#9597]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][152] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][154] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][156] ([Intel XE#8399]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][158] ([Intel XE#2029] / [Intel XE#7395]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@xe_configfs@ctx-restore-post-bb-invalid:
    - shard-bmg:          [ABORT][160] ([Intel XE#9463]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-4/igt@xe_configfs@ctx-restore-post-bb-invalid.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@xe_configfs@ctx-restore-post-bb-invalid.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-ptl:          [ABORT][162] ([Intel XE#9362]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-ptl-3/igt@xe_pm@s4-vm-bind-userptr.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [FAIL][164] ([Intel XE#9254]) -> [PASS][165] +2 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_pm_residency@idle-residency@gt0:
    - shard-bmg:          [FAIL][166] -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-1/igt@xe_pm_residency@idle-residency@gt0.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@xe_pm_residency@idle-residency@gt0.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [FAIL][168] ([Intel XE#6569]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][170] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][171] ([Intel XE#2426] / [Intel XE#5848])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][172] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][173] ([Intel XE#2426] / [Intel XE#5848])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5844]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5844
  [Intel XE#5845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5845
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849
  [Intel XE#5850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5850
  [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
  [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
  [Intel XE#5947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479
  [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9279
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9522
  [Intel XE#9527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527
  [Intel XE#9532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9532
  [Intel XE#9534]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9534
  [Intel XE#9535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9535
  [Intel XE#9597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597


Build changes
-------------

  * IGT: IGT_9177 -> IGTPW_16100
  * Linux: xe-6058-34c3200b517db45a621c4963d87759823be13bbd -> xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560

  IGTPW_16100: 16100
  IGT_9177: 9177
  xe-6058-34c3200b517db45a621c4963d87759823be13bbd: 34c3200b517db45a621c4963d87759823be13bbd
  xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560: d11bbfdac0f3d443b367857ffe683ae6bb80d560

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/index.html

--===============4018542194603736260==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Convert to igt_display atomic API (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164189/">https://patchwork.freedesktop.org/series/164189/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9177_FULL -&gt; XEIGTPW_16100_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_16100_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_16100_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_16100_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_setmode@invalid-clone-single-crtc@pipe-a-dp-2-hdmi-a-3:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc@pipe-a-dp-2-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc@pipe-a-dp-2-hdmi-a-3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9177_FULL and XEIGTPW_16100_FULL:</p>
<h3>New IGT tests (80)</h3>
<ul>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 4.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic@pipe-a-edp-1-basic:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.38, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic@pipe-b-edp-1-basic:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic@pipe-c-edp-1-basic:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.43, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic@pipe-d-edp-1-basic:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 9.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms@pipe-a-edp-1-dpms:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.59, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms@pipe-b-edp-1-dpms:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.71, 2.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms@pipe-c-edp-1-dpms:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.61, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms@pipe-d-edp-1-dpms:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 5.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale@pipe-a-edp-1-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale@pipe-b-edp-1-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.48, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale@pipe-c-edp-1-downscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.58, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale@pipe-d-edp-1-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 5.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale@pipe-a-edp-1-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale@pipe-b-edp-1-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.48, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale@pipe-c-edp-1-upscale:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale@pipe-d-edp-1-upscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.04, 29.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-191:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-255:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.48, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-a-edp-1-strength-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.43, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.46, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-191:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-255:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.46, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-b-edp-1-strength-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.46, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-191:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-255:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-c-edp-1-strength-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.46, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-191:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-255:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength@pipe-d-edp-1-strength-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 9.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.42, 4.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend@pipe-c-edp-1-suspend:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend@pipe-d-edp-1-suspend:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 5.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap@pipe-a-edp-1-tap-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap@pipe-b-edp-1-tap-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap@pipe-c-edp-1-tap-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.25, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap@pipe-d-edp-1-tap-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 5.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle@pipe-a-edp-1-toggle:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle@pipe-b-edp-1-toggle:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.60, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle@pipe-c-edp-1-toggle:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.65, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle@pipe-d-edp-1-toggle:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.03, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-a-edp-1-invalid-filter-with-plane:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.38, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-b-edp-1-invalid-filter-with-plane:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-c-edp-1-invalid-filter-with-plane:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane@pipe-d-edp-1-invalid-filter-with-plane:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.03, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-a-edp-1-invalid-filter-with-scaler:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-b-edp-1-invalid-filter-with-scaler:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-c-edp-1-invalid-filter-with-scaler:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler@pipe-d-edp-1-invalid-filter-with-scaler:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.05, 10.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-aspec:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-fulls:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-b-edp-1-invalid-filter-with-scaling-mode-aspec:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-b-edp-1-invalid-filter-with-scaling-mode-fulls:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-c-edp-1-invalid-filter-with-scaling-mode-aspec:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.39, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-c-edp-1-invalid-filter-with-scaling-mode-fulls:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-d-edp-1-invalid-filter-with-scaling-mode-aspec:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-d-edp-1-invalid-filter-with-scaling-mode-fulls:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 4.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.33, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-b-edp-1-invalid-plane-with-filter:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-c-edp-1-invalid-plane-with-filter:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.31, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-d-edp-1-invalid-plane-with-filter:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16100_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose-with-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-7/igt@core_hotunplug@hotreplug-lateclose-with-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@core_hotunplug@hotreplug-lateclose-with-load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-2/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-3/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583">Intel XE#8583</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947">Intel XE#5947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925">Intel XE#6925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5850">Intel XE#5850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851">Intel XE#5851</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-6/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-3/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5845">Intel XE#5845</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-9/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9522">Intel XE#9522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-3/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9532">Intel XE#9532</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9534">Intel XE#9534</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527">Intel XE#9527</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527">Intel XE#9527</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9535">Intel XE#9535</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917">Intel XE#5917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174">Intel XE#6174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@kms_plane@pixel-format-x-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5844">Intel XE#5844</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849">Intel XE#5849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-9/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-6/igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-1/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-9/igt@kms_setmode@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +2 other tests incomplete</li>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-ptl-7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-4/igt@kms_setmode@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-no-cpu-idle:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@kms_setmode@basic-no-cpu-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-lnl-3/igt@kms_setmode@basic-no-cpu-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-lnl-4/igt@kms_setmode@basic-no-cpu-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910">Intel XE#5910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-10/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9279">Intel XE#9279</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@xe_evict@evict-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@xe_exec_balancer@many-cm-virtual-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@exec-sanity:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@xe_exec_multi_queue@exec-sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-destroy-vm-context:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-ptl-1/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-3/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-cpu:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@xe_madvise@atomic-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-7/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-8/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-3/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-6/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867">Intel XE#6867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-ptl-2/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-1/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-lnl-8/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-lnl-4/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-ptl-8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-5/igt@xe_pm@s4-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-10/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-8/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597">Intel XE#9597</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-post-bb-invalid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-4/igt@xe_configfs@ctx-restore-post-bb-invalid.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-6/igt@xe_configfs@ctx-restore-post-bb-invalid.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-ptl-3/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-ptl-2/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-1/igt@xe_pm_residency@idle-residency@gt0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@xe_pm_residency@idle-residency@gt0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9177/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16100/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9177 -&gt; IGTPW_16100</li>
<li>Linux: xe-6058-34c3200b517db45a621c4963d87759823be13bbd -&gt; xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560</li>
</ul>
<p>IGTPW_16100: 16100<br />
  IGT_9177: 9177<br />
  xe-6058-34c3200b517db45a621c4963d87759823be13bbd: 34c3200b517db45a621c4963d87759823be13bbd<br />
  xe-6059-d11bbfdac0f3d443b367857ffe683ae6bb80d560: d11bbfdac0f3d443b367857ffe683ae6bb80d560</p>

</body>
</html>

--===============4018542194603736260==--
