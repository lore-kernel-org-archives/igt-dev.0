Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7F7C2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 08:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5449E10E3A6;
	Mon, 24 Jun 2024 08:17:44 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB1310E3A6;
 Mon, 24 Jun 2024 08:17:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1161803943503115222=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/chamelium=3A_fixes_fo?=
 =?utf-8?q?r_chamelium_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 24 Jun 2024 08:17:42 -0000
Message-ID: <171921706263.152269.6831573232190633811@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240624071805.1356668-1-kunal1.joshi@intel.com>
In-Reply-To: <20240624071805.1356668-1-kunal1.joshi@intel.com>
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

--===============1161803943503115222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/chamelium: fixes for chamelium tests
URL   : https://patchwork.freedesktop.org/series/135270/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14991 -> IGTPW_11300
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11300/index.html

Participating hosts (36 -> 35)
------------------------------

  Missing    (1): fi-bsw-n3050 

Known issues
------------

  Here are the changes found in IGTPW_11300 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@debugfs_test@read_all_entries:
    - {bat-mtlp-9}:       [ABORT][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14991/bat-mtlp-9/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11300/bat-mtlp-9/igt@debugfs_test@read_all_entries.html

  * igt@i915_module_load@load:
    - {bat-mtlp-9}:       [DMESG-WARN][3] ([i915#11009]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14991/bat-mtlp-9/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11300/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arls-2:         [DMESG-WARN][5] ([i915#7507]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14991/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11300/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#7507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7896 -> IGTPW_11300

  CI-20190529: 20190529
  CI_DRM_14991: 408377d4531a823b039c0df70dfb2abfb028d0ea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11300: 8a4ad9ef31079e96c2d3c154c506cd09e1f6eaa8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7896: 4e6d29ee4672a172227a58ba614ce6b50223f073 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11300/index.html

--===============1161803943503115222==
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
<tr><td><b>Series:</b></td><td>tests/chamelium: fixes for chamelium tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135270/">https://patchwork.freedesktop.org/series/135270/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11300/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11300/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14991 -&gt; IGTPW_11300</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11300/index.html</p>
<h2>Participating hosts (36 -&gt; 35)</h2>
<p>Missing    (1): fi-bsw-n3050 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11300 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14991/bat-mtlp-9/igt@debugfs_test@read_all_entries.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11300/bat-mtlp-9/igt@debugfs_test@read_all_entries.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14991/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11300/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14991/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507">i915#7507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11300/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7896 -&gt; IGTPW_11300</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14991: 408377d4531a823b039c0df70dfb2abfb028d0ea @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11300: 8a4ad9ef31079e96c2d3c154c506cd09e1f6eaa8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7896: 4e6d29ee4672a172227a58ba614ce6b50223f073 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1161803943503115222==--
