Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F849D339A2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 17:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A73A10EB73;
	Fri,  5 Dec 2025 17:39:55 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBDE10EB71;
 Fri,  5 Dec 2025 17:39:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4152754334049373707=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/kms=5Fbw=3A_Correct?=
 =?utf-8?q?_skip_message_for_mx_pipe_count?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Dec 2025 17:39:54 -0000
Message-ID: <176495639425.62152.6206998132176317446@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251204182034.307117-1-alex.hung@amd.com>
In-Reply-To: <20251204182034.307117-1-alex.hung@amd.com>
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

--===============4152754334049373707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_bw: Correct skip message for mx pipe count
URL   : https://patchwork.freedesktop.org/series/158513/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8656 -> IGTPW_14160
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14160 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14160, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14160:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-dg2-8:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8656/bat-dg2-8/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/bat-dg2-8/igt@i915_pm_rpm@module-reload.html

  
New tests
---------

  New tests have been introduced between IGT_8656 and IGTPW_14160:

### New IGT tests (5) ###

  * igt@i915_selftest@basic-eu-total:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-llseek-bad:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@hwmon-write:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@parallel-random-engines:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@second-client:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_14160 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8656/bat-mtlp-8/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@requests:
    - bat-atsm-1:         [PASS][5] -> [INCOMPLETE][6] ([i915#14564])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8656/bat-atsm-1/igt@i915_selftest@live@requests.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/bat-atsm-1/igt@i915_selftest@live@requests.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-jsl-1:          [DMESG-FAIL][7] -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8656/bat-jsl-1/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/bat-jsl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [DMESG-FAIL][9] ([i915#12061]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8656/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [DMESG-FAIL][11] ([i915#12061]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8656/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [DMESG-FAIL][13] ([i915#12061] / [i915#13929]) -> [INCOMPLETE][14] ([i915#15157])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8656/bat-atsm-1/igt@i915_selftest@live.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/bat-atsm-1/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14564
  [i915#15157]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15157


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8656 -> IGTPW_14160
  * Linux: CI_DRM_17640 -> CI_DRM_17641

  CI-20190529: 20190529
  CI_DRM_17640: a36e2c7fed2132052900236e8c7aa563d339baaf @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17641: abc20a831a03dc608256340159c23e01ee6b6ead @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14160: 9f336490af536ee623b8ed8f26bca82d94bc816f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8656: 1fa8aeb0848614e6204602c5fe2949e049f087c9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/index.html

--===============4152754334049373707==
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
<tr><td><b>Series:</b></td><td>tests/kms_bw: Correct skip message for mx pipe count</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158513/">https://patchwork.freedesktop.org/series/158513/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8656 -&gt; IGTPW_14160</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14160 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14160, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/index.html</p>
<h2>Participating hosts (45 -&gt; 44)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14160:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8656/bat-dg2-8/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/bat-dg2-8/igt@i915_pm_rpm@module-reload.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8656 and IGTPW_14160:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@i915_selftest@basic-eu-total:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-llseek-bad:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@hwmon-write:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@parallel-random-engines:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@second-client:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14160 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8656/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8656/bat-atsm-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/bat-atsm-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14564">i915#14564</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8656/bat-jsl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/bat-jsl-1/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8656/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8656/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8656/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14160/bat-atsm-1/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15157">i915#15157</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8656 -&gt; IGTPW_14160</li>
<li>Linux: CI_DRM_17640 -&gt; CI_DRM_17641</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17640: a36e2c7fed2132052900236e8c7aa563d339baaf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17641: abc20a831a03dc608256340159c23e01ee6b6ead @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14160: 9f336490af536ee623b8ed8f26bca82d94bc816f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8656: 1fa8aeb0848614e6204602c5fe2949e049f087c9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4152754334049373707==--
