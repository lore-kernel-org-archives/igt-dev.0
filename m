Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29801E94629
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 02:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8C010E14E;
	Tue, 10 Feb 2026 02:50:15 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8420F10E14E;
 Tue, 10 Feb 2026 02:50:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0423175350634606709=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_kms=5Fflip=3A_limit_numbe?=
 =?utf-8?q?r_of_subtests_run?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Feb 2026 02:50:14 -0000
Message-ID: <177069181434.240118.13439404040051360046@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260210001026.3923885-1-michal.grzelak@intel.com>
In-Reply-To: <20260210001026.3923885-1-michal.grzelak@intel.com>
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

--===============0423175350634606709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_flip: limit number of subtests run
URL   : https://patchwork.freedesktop.org/series/161389/
State : success

== Summary ==

CI Bug Log - changes from IGT_8746 -> IGTPW_14522
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/index.html

Participating hosts (42 -> 41)
------------------------------

  Additional (1): bat-atsm-1 
  Missing    (2): bat-dg2-13 fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8746 and IGTPW_14522:

### New IGT tests (47) ###

  * igt@fbdev@info:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_basic@basic@vecs1-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exec_basic@basic@vecs1-smem:
    - Statuses : 4 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@basic-await@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.11] s

  * igt@gem_exec_fence@basic-busy@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@gem_exec_fence@basic-wait@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@gem_exec_fence@nb-await@vecs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.06, 0.09] s

  * igt@i915_pm_rpm@module-reload:
    - Statuses : 37 pass(s) 4 skip(s)
    - Exec time: [0.0, 35.22] s

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-0:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-1024:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-128:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-256:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-32:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-63:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-65536:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_addfb_basic@bad-pitch-999:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@basic:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bo-too-small:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_addfb_basic@invalid-get-prop:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_addfb_basic@invalid-get-prop-any:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@invalid-set-prop:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@no-handle:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@size-max:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_addfb_basic@small-bo:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_addfb_basic@too-high:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_addfb_basic@too-wide:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@unused-handle:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_addfb_basic@unused-modifier:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@unused-offsets:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@unused-pitches:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_busy@basic@flip:
    - Statuses : 32 pass(s)
    - Exec time: [0.35, 1.01] s

  * igt@kms_busy@basic@modeset:
    - Statuses : 31 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.46] s

  * igt@kms_flip@basic-flip-vs-dpms:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 12.56] s

  * igt@kms_flip@basic-flip-vs-modeset:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 12.87] s

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 12.58] s

  * igt@kms_flip@basic-plain-flip:
    - Statuses : 32 pass(s) 9 skip(s)
    - Exec time: [0.0, 10.19] s

  * igt@kms_force_connector_basic@force-connector-state:
    - Statuses : 36 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.02] s

  * igt@kms_force_connector_basic@force-edid:
    - Statuses : 36 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_force_connector_basic@prune-stale-modes:
    - Statuses : 36 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.73] s

  * igt@kms_frontbuffer_tracking@basic:
    - Statuses : 31 pass(s) 10 skip(s)
    - Exec time: [0.0, 5.39] s

  * igt@kms_hdmi_inject@inject-audio:
    - Statuses : 31 pass(s) 10 skip(s)
    - Exec time: [0.0, 0.80] s

  * igt@kms_prop_blob@basic:
    - Statuses : 40 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_setmode@basic-clone-single-crtc:
    - Statuses : 41 skip(s)
    - Exec time: [0.0, 0.41] s

  

Known issues
------------

  Here are the changes found in IGTPW_14522 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][1] ([i915#1849] / [i915#2582])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@fbdev@info.html

  * igt@fbdev@read:
    - bat-atsm-1:         NOTRUN -> [SKIP][2] ([i915#2582]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@fbdev@read.html

  * igt@gem_mmap@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][3] ([i915#4083])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][4] ([i915#4079])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][5] ([i915#4077]) +4 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic@basic:
    - bat-atsm-1:         NOTRUN -> [SKIP][6] ([i915#15657])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@gem_tiled_pread_basic@basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-atsm-1:         NOTRUN -> [SKIP][7] ([i915#6621])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@workarounds:
    - bat-atsm-1:         NOTRUN -> [DMESG-FAIL][8] ([i915#12061]) +1 other test dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@i915_selftest@live@workarounds.html

  * igt@kms_addfb_basic@size-max (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][9] ([i915#6077]) +37 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@kms_addfb_basic@size-max.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-1:         NOTRUN -> [SKIP][10] ([i915#6078]) +22 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-atsm-1:         NOTRUN -> [SKIP][11] ([i915#6093]) +4 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-atsm-1:         NOTRUN -> [SKIP][12] ([i915#1836]) +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_prop_blob@basic (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][13] ([i915#7357])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@kms_prop_blob@basic.html

  * igt@kms_setmode@basic-clone-single-crtc (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][14] ([i915#6094])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-write:
    - bat-atsm-1:         NOTRUN -> [SKIP][15] +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@prime_vgem@basic-write.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#15657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6094
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#7357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7357


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8746 -> IGTPW_14522
  * Linux: CI_DRM_17961 -> CI_DRM_17964

  CI-20190529: 20190529
  CI_DRM_17961: 5e0595fbb024e9b7e243a7ca8a028f93a37883f2 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17964: d2a98b98376b6a16c835a131b12f295848c656db @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14522: 14522
  IGT_8746: 8746

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/index.html

--===============0423175350634606709==
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
<tr><td><b>Series:</b></td><td>kms_flip: limit number of subtests run</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161389/">https://patchwork.freedesktop.org/series/161389/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8746 -&gt; IGTPW_14522</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Additional (1): bat-atsm-1 <br />
  Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8746 and IGTPW_14522:</p>
<h3>New IGT tests (47)</h3>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic@vecs1-lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic@vecs1-smem:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vecs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>Statuses : 37 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 35.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-1024:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-256:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-32:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-63:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-65536:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-get-prop:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-get-prop-any:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@no-handle:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@small-bo:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-modifier:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-pitches:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>Statuses : 32 pass(s)</li>
<li>Exec time: [0.35, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>Statuses : 31 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 12.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 12.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 12.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>Statuses : 32 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 10.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>Statuses : 36 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>Statuses : 36 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>Statuses : 36 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>Statuses : 31 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 5.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>Statuses : 31 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>Statuses : 40 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0, 0.41] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14522 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@kms_addfb_basic@size-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6093">i915#6093</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7357">i915#7357</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc (NEW):</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6094">i915#6094</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14522/bat-atsm-1/igt@prime_vgem@basic-write.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8746 -&gt; IGTPW_14522</li>
<li>Linux: CI_DRM_17961 -&gt; CI_DRM_17964</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17961: 5e0595fbb024e9b7e243a7ca8a028f93a37883f2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17964: d2a98b98376b6a16c835a131b12f295848c656db @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14522: 14522<br />
  IGT_8746: 8746</p>

</body>
</html>

--===============0423175350634606709==--
