Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92F8D44D51
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 11:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890ED10E6B4;
	Wed,  6 Nov 2024 11:40:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0DF10E6B4;
 Wed,  6 Nov 2024 11:40:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8715445368322110744=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2Cv2=2C1/2=5D_tests/kms=5Fflip=3A_Updating_the_skip_message?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 06 Nov 2024 11:40:06 -0000
Message-ID: <173089320676.1416389.14291957149742979603@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241106100021.1831921-1-pranay.samala@intel.com>
In-Reply-To: <20241106100021.1831921-1-pranay.samala@intel.com>
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

--===============8715445368322110744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/kms_flip: Updating the skip message
URL   : https://patchwork.freedesktop.org/series/140996/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8099_BAT -> XEIGTPW_12047_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12047_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12047_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-7 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12047_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - bat-bmg-2:          NOTRUN -> [SKIP][1] +15 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-bmg-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - bat-lnl-2:          NOTRUN -> [SKIP][2] +15 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-lnl-2/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12047_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - bat-lnl-1:          NOTRUN -> [FAIL][3] ([Intel XE#1701]) +3 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - bat-lnl-1:          NOTRUN -> [SKIP][4] ([Intel XE#3279]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#455]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-dg2-oem2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - bat-adlp-vf:        NOTRUN -> [SKIP][6] ([Intel XE#2463]) +15 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-adlp-vf/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - bat-bmg-1:          NOTRUN -> [SKIP][7] ([Intel XE#2370]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-transition-fencing:
    - bat-atsm-2:         NOTRUN -> [SKIP][8] ([Intel XE#1024]) +15 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-atsm-2/igt@kms_atomic_transition@plane-all-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking:
    - bat-pvc-2:          NOTRUN -> [SKIP][9] ([Intel XE#1024]) +15 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-pvc-2/igt@kms_atomic_transition@plane-all-transition-nonblocking.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][10] -> [FAIL][11] ([Intel XE#886]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8099/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_8099 -> IGTPW_12047
  * Linux: xe-2170-2b31f47649daecf2da6611c70072dfbe4914c22a -> xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541

  IGTPW_12047: d5dc1208853e52597bc13af5adeaf9a135fcda84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8099: 27be46dee80b6b0de80f9fa3cd9bb5f55edccaf8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2170-2b31f47649daecf2da6611c70072dfbe4914c22a: 2b31f47649daecf2da6611c70072dfbe4914c22a
  xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541: e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/index.html

--===============8715445368322110744==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] tests/kms_flip: Updating the skip message</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140996/">https://patchwork.freedesktop.org/series/140996/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8099_BAT -&gt; XEIGTPW_12047_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12047_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12047_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12047_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-bmg-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-lnl-2/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12047_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-dg2-oem2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-adlp-vf/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>) +15 other tests skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-atsm-2/igt@kms_atomic_transition@plane-all-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-pvc-2/igt@kms_atomic_transition@plane-all-transition-nonblocking.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8099/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12047/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8099 -&gt; IGTPW_12047</li>
<li>Linux: xe-2170-2b31f47649daecf2da6611c70072dfbe4914c22a -&gt; xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541</li>
</ul>
<p>IGTPW_12047: d5dc1208853e52597bc13af5adeaf9a135fcda84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8099: 27be46dee80b6b0de80f9fa3cd9bb5f55edccaf8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2170-2b31f47649daecf2da6611c70072dfbe4914c22a: 2b31f47649daecf2da6611c70072dfbe4914c22a<br />
  xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541: e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541</p>

</body>
</html>

--===============8715445368322110744==--
