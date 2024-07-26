Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CF5C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 18:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6428C10E09C;
	Fri, 26 Jul 2024 18:34:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D05210E046;
 Fri, 26 Jul 2024 18:34:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6750923042313835655=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel-ci/xe-sriov-vf?=
 =?utf-8?q?=2Eblocklist=2Etxt=3A_Blocklist_for_SR-IOV_VF_BAT_runs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 26 Jul 2024 18:34:37 -0000
Message-ID: <172201887730.386938.17022204136155782752@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240726170959.1378586-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240726170959.1378586-1-marcin.bernatowicz@linux.intel.com>
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

--===============6750923042313835655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci/xe-sriov-vf.blocklist.txt: Blocklist for SR-IOV VF BAT runs (rev2)
URL   : https://patchwork.freedesktop.org/series/136202/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15139 -> IGTPW_11479
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11479/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): fi-snb-2520m fi-elk-e7500 

Known issues
------------

  Here are the changes found in IGTPW_11479 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@gt_mocs:
    - bat-adlp-11:        [INCOMPLETE][1] ([i915#9413]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15139/bat-adlp-11/igt@i915_selftest@live@gt_mocs.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11479/bat-adlp-11/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - {bat-arlh-3}:       [INCOMPLETE][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15139/bat-arlh-3/igt@i915_selftest@live@guc_multi_lrc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11479/bat-arlh-3/igt@i915_selftest@live@guc_multi_lrc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7940 -> IGTPW_11479

  CI-20190529: 20190529
  CI_DRM_15139: 422ad8b018bb44eb6aec55db31d0881aef32539e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11479: faea0c79b4a21edb0d01cf4d84783b386bf248ff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11479/index.html

--===============6750923042313835655==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci/xe-sriov-vf.blocklist.txt: Blocklist for SR-IOV VF BAT runs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136202/">https://patchwork.freedesktop.org/series/136202/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11479/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11479/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15139 -&gt; IGTPW_11479</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11479/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): fi-snb-2520m fi-elk-e7500 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11479 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15139/bat-adlp-11/igt@i915_selftest@live@gt_mocs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11479/bat-adlp-11/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_multi_lrc:</p>
<ul>
<li>{bat-arlh-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15139/bat-arlh-3/igt@i915_selftest@live@guc_multi_lrc.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11479/bat-arlh-3/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7940 -&gt; IGTPW_11479</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15139: 422ad8b018bb44eb6aec55db31d0881aef32539e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11479: faea0c79b4a21edb0d01cf4d84783b386bf248ff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6750923042313835655==--
