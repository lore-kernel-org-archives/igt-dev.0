Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E20C47DA9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 19:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76898112AE9;
	Mon, 29 Jan 2024 19:40:29 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49852112AE9;
 Mon, 29 Jan 2024 19:40:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1212663458690500538=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fato?=
 =?utf-8?q?mic=3A_fix_basic-inc-all?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Mon, 29 Jan 2024 19:40:28 -0000
Message-ID: <170655722829.806401.6043750127827286524@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240129185412.114786-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240129185412.114786-1-kamil.konieczny@linux.intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============1212663458690500538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_atomic: fix basic-inc-all
URL   : https://patchwork.freedesktop.org/series/129279/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14192 -> IGTPW_10600
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/index.html

Participating hosts (37 -> 33)
------------------------------

  Missing    (4): bat-adlp-9 bat-rpls-2 fi-snb-2520m bat-mtlp-8 

Known issues
------------

  Here are the changes found in IGTPW_10600 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hugepages:
    - bat-adlm-1:         [PASS][1] -> [INCOMPLETE][2] ([i915#10137] / [i915#9527])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14192/bat-adlm-1/igt@i915_selftest@live@hugepages.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/bat-adlm-1/igt@i915_selftest@live@hugepages.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [ABORT][3] ([i915#7911]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14192/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
  [i915#10137]: https://gitlab.freedesktop.org/drm/intel/issues/10137
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#9527]: https://gitlab.freedesktop.org/drm/intel/issues/9527


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7698 -> IGTPW_10600

  CI-20190529: 20190529
  CI_DRM_14192: f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10600: 10600
  IGT_7698: af750f5e7eaad98d40d8c924eb5f05e99d3c668b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_feature_discovery@display-1x
+igt@kms_feature_discovery@display-2x
+igt@kms_feature_discovery@display-3x
+igt@kms_feature_discovery@display-4x

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/index.html

--===============1212663458690500538==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_atomic: fix basic-inc-all</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129279/">https://patchwork.freedesktop.org/series/129279/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14192 -&gt; IGTPW_10600</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/index.html</p>
<h2>Participating hosts (37 -&gt; 33)</h2>
<p>Missing    (4): bat-adlp-9 bat-rpls-2 fi-snb-2520m bat-mtlp-8 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10600 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@hugepages:<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14192/bat-adlm-1/igt@i915_selftest@live@hugepages.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/bat-adlm-1/igt@i915_selftest@live@hugepages.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10137">i915#10137</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9527">i915#9527</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14192/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10600/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7698 -&gt; IGTPW_10600</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14192: f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10600: 10600<br />
  IGT_7698: af750f5e7eaad98d40d8c924eb5f05e99d3c668b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_feature_discovery@display-1x<br />
+igt@kms_feature_discovery@display-2x<br />
+igt@kms_feature_discovery@display-3x<br />
+igt@kms_feature_discovery@display-4x</p>

</body>
</html>

--===============1212663458690500538==--
