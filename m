Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEDDC48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 20:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CE310E11C;
	Mon,  4 Mar 2024 20:53:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7E110E187;
 Mon,  4 Mar 2024 20:53:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7974110506335607067=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/2=5D_lib/igt=5Ffb=3A_Use_engine_copy_for_MC/RC_CCS_formats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 Mar 2024 20:53:34 -0000
Message-ID: <170958561464.502968.11194433911895426278@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304104710.3253030-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240304104710.3253030-1-bhanuprakash.modem@intel.com>
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

--===============7974110506335607067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/igt_fb: Use engine copy for MC/RC CCS formats
URL   : https://patchwork.freedesktop.org/series/130663/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7745_BAT -> XEIGTPW_10770_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10770_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10770_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10770_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-x:
    - bat-adlp-7:         NOTRUN -> [FAIL][1] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-x.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs:
    - bat-adlp-7:         NOTRUN -> [SKIP][2] +11 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs.html

  * igt@kms_plane@pixel-format:
    - bat-pvc-2:          NOTRUN -> [SKIP][3] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-pvc-2/igt@kms_plane@pixel-format.html
    - bat-atsm-2:         NOTRUN -> [SKIP][4] +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-atsm-2/igt@kms_plane@pixel-format.html
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][5] +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_plane@pixel-format.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs}:
    - bat-atsm-2:         NOTRUN -> [SKIP][6] +14 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-atsm-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * {igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-dp-3}:
    - bat-dg2-oem2:       NOTRUN -> [TIMEOUT][7] +1 other test timeout
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-dg2-oem2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-dp-3.html

  * {igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs}:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][8] +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-dg2-oem2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * {igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-edp-1}:
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][9] +4 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-edp-1.html

  * {igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs}:
    - bat-pvc-2:          NOTRUN -> [SKIP][10] +14 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-pvc-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10770_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - bat-atsm-2:         NOTRUN -> [SKIP][11] ([Intel XE#1024])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-atsm-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][12] ([Intel XE#1033] / [Intel XE#324] / [Intel XE#358])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][13] ([Intel XE#801]) +11 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-dg2-oem2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y:
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][14] ([Intel XE#324]) +1 other test dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y:
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][15] ([Intel XE#324]) +1 other test dmesg-fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-y-rc-ccs:
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][16] ([Intel XE#1033]) +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-y-rc-ccs.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-y-mc-ccs:
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][17] ([Intel XE#1033])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-y-mc-ccs.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-linear-to-y-mc-ccs:
    - bat-adlp-7:         NOTRUN -> [FAIL][18] ([Intel XE#616]) +30 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-linear-to-y-mc-ccs.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-x-to-y-mc-ccs:
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][19] ([Intel XE#1033] / [Intel XE#358]) +1 other test dmesg-fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-x-to-y-mc-ccs.html

  * igt@kms_plane@pixel-format-source-clamping:
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][20] ([Intel XE#358]) +2 other tests dmesg-fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][21] -> [SKIP][22] ([Intel XE#455]) +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7745/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][23] ([Intel XE#616]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7745/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801


Build changes
-------------

  * IGT: IGT_7745 -> IGTPW_10770
  * Linux: xe-890-1636103d7fa7ca9dedb181d611cd214af79b04d1 -> xe-892-e8bc216572501440efb20e112bb5aa60599f1863

  IGTPW_10770: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10770/index.html
  IGT_7745: 838ad56bf511c1caf56851c661fb5828c0440e3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-890-1636103d7fa7ca9dedb181d611cd214af79b04d1: 1636103d7fa7ca9dedb181d611cd214af79b04d1
  xe-892-e8bc216572501440efb20e112bb5aa60599f1863: e8bc216572501440efb20e112bb5aa60599f1863

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/index.html

--===============7974110506335607067==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] lib/igt_fb: Use engine copy for MC/RC CCS formats</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130663/">https://patchwork.freedesktop.org/series/130663/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7745_BAT -&gt; XEIGTPW_10770_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10770_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10770_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10770_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-x:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-x.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y-rc-ccs.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-pvc-2/igt@kms_plane@pixel-format.html">SKIP</a> +3 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-atsm-2/igt@kms_plane@pixel-format.html">SKIP</a> +2 other tests skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_plane@pixel-format.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs}:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-atsm-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-dp-3}:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-dg2-oem2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-dp-3.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs}:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-dg2-oem2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-edp-1}:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-edp-1.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs}:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-pvc-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10770_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-atsm-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-dg2-oem2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-y-rc-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-y-mc-ccs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-linear-to-y-mc-ccs:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-linear-to-y-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +30 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-x-to-y-mc-ccs:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-x-to-y-mc-ccs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_plane@pixel-format-source-clamping.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7745/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7745/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10770/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7745 -&gt; IGTPW_10770</li>
<li>Linux: xe-890-1636103d7fa7ca9dedb181d611cd214af79b04d1 -&gt; xe-892-e8bc216572501440efb20e112bb5aa60599f1863</li>
</ul>
<p>IGTPW_10770: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10770/index.html<br />
  IGT_7745: 838ad56bf511c1caf56851c661fb5828c0440e3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-890-1636103d7fa7ca9dedb181d611cd214af79b04d1: 1636103d7fa7ca9dedb181d611cd214af79b04d1<br />
  xe-892-e8bc216572501440efb20e112bb5aa60599f1863: e8bc216572501440efb20e112bb5aa60599f1863</p>

</body>
</html>

--===============7974110506335607067==--
