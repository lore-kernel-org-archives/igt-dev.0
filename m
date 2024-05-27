Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C350DC25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 05:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100EB10E245;
	Mon, 27 May 2024 05:33:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C302C10E245;
 Mon, 27 May 2024 05:33:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6496168207404819780=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Update_kms=5Fplane_test_=28?=
 =?utf-8?q?rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 27 May 2024 05:33:09 -0000
Message-ID: <171678798979.2211934.18437377252937967917@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240524084807.480971-1-pranay.samala@intel.com>
In-Reply-To: <20240524084807.480971-1-pranay.samala@intel.com>
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

--===============6496168207404819780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update kms_plane test (rev2)
URL   : https://patchwork.freedesktop.org/series/134006/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14818 -> IGTPW_11194
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11194/index.html

Participating hosts (38 -> 35)
------------------------------

  Missing    (3): fi-kbl-8809g fi-elk-e7500 fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11194:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - {bat-mtlp-9}:       NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11194/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
Known issues
------------

  Here are the changes found in IGTPW_11194 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-edp-1:
    - bat-mtlp-8:         [PASS][2] -> [DMESG-WARN][3] ([i915#9157])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14818/bat-mtlp-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-edp-1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11194/bat-mtlp-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-edp-1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-modeset@b-dp6:
    - {bat-mtlp-9}:       [DMESG-FAIL][4] ([i915#11009]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14818/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@b-dp6.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11194/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@b-dp6.html

  * igt@kms_flip@basic-flip-vs-modeset@d-dp7:
    - {bat-mtlp-9}:       [FAIL][6] ([i915#6121]) -> [PASS][7] +5 other tests pass
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14818/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@d-dp7.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11194/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@d-dp7.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#6121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121
  [i915#9157]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9157


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7871 -> IGTPW_11194

  CI-20190529: 20190529
  CI_DRM_14818: ecacdcfd7d3355d063c223b9b2abb09d1ba0cb1c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11194: 9f492fa860cd7ab2dc1edfa41d21e8ed35d04d4c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11194/index.html

--===============6496168207404819780==
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
<tr><td><b>Series:</b></td><td>Update kms_plane test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134006/">https://patchwork.freedesktop.org/series/134006/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11194/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11194/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14818 -&gt; IGTPW_11194</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11194/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Missing    (3): fi-kbl-8809g fi-elk-e7500 fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11194:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc:<ul>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11194/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11194 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-edp-1:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14818/bat-mtlp-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11194/bat-mtlp-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9157">i915#9157</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14818/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@b-dp6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11194/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@b-dp6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp7:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14818/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@d-dp7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11194/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@d-dp7.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7871 -&gt; IGTPW_11194</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14818: ecacdcfd7d3355d063c223b9b2abb09d1ba0cb1c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11194: 9f492fa860cd7ab2dc1edfa41d21e8ed35d04d4c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6496168207404819780==--
