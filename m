Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1138C27C5F
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 09:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEFD10E3B4;
	Mon, 10 Jun 2024 09:01:56 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157B010E3B4;
 Mon, 10 Jun 2024 09:01:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4568492682880631172=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_IGT_cleanup_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 10 Jun 2024 09:01:54 -0000
Message-ID: <171801011407.30864.15841088618507562395@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240610080150.3610871-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240610080150.3610871-1-bhanuprakash.modem@intel.com>
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

--===============4568492682880631172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: IGT cleanup (rev10)
URL   : https://patchwork.freedesktop.org/series/100801/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14905 -> IGTPW_11243
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11243 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11243, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/index.html

Participating hosts (41 -> 36)
------------------------------

  Missing    (5): bat-arls-4 bat-dg2-14 bat-dg2-11 bat-arls-1 bat-arls-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11243:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@workarounds:
    - bat-adlp-9:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14905/bat-adlp-9/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/bat-adlp-9/igt@i915_selftest@live@workarounds.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-6:
    - {bat-mtlp-9}:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14905/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-6.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-6.html

  
Known issues
------------

  Here are the changes found in IGTPW_11243 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@a-dp6:
    - {bat-mtlp-9}:       [DMESG-WARN][5] ([i915#11009]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14905/bat-mtlp-9/igt@kms_flip@basic-plain-flip@a-dp6.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/bat-mtlp-9/igt@kms_flip@basic-plain-flip@a-dp6.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6:
    - {bat-mtlp-9}:       [DMESG-FAIL][7] ([i915#11009]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14905/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-6:
    - {bat-mtlp-9}:       [FAIL][9] ([i915#10979]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14905/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-6.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-6.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580
  [i915#10979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#11060]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11060
  [i915#6121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7880 -> IGTPW_11243

  CI-20190529: 20190529
  CI_DRM_14905: c410bb641ea861fdd70c14ed8cc30d0d9a2ef587 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11243: 11243
  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/index.html

--===============4568492682880631172==
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
<tr><td><b>Series:</b></td><td>IGT cleanup (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100801/">https://patchwork.freedesktop.org/series/100801/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14905 -&gt; IGTPW_11243</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11243 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11243, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/index.html</p>
<h2>Participating hosts (41 -&gt; 36)</h2>
<p>Missing    (5): bat-arls-4 bat-dg2-14 bat-dg2-11 bat-arls-1 bat-arls-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11243:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14905/bat-adlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/bat-adlp-9/igt@i915_selftest@live@workarounds.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-6:<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14905/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-6.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11243 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14905/bat-mtlp-9/igt@kms_flip@basic-plain-flip@a-dp6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/bat-mtlp-9/igt@kms_flip@basic-plain-flip@a-dp6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14905/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14905/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979">i915#10979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11243/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-6.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7880 -&gt; IGTPW_11243</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14905: c410bb641ea861fdd70c14ed8cc30d0d9a2ef587 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11243: 11243<br />
  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4568492682880631172==--
