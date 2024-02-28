Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404C1C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 18:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE33F10E287;
	Wed, 28 Feb 2024 18:52:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9103B10E296;
 Wed, 28 Feb 2024 18:52:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2086359721436717952=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fcompute=5F?=
 =?utf-8?q?preempt=3A_Add_compute-preempt-many_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Feb 2024 18:52:32 -0000
Message-ID: <170914635259.375736.14202888392737764708@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228162118.14654-1-nirmoy.das@intel.com>
In-Reply-To: <20240228162118.14654-1-nirmoy.das@intel.com>
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

--===============2086359721436717952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_compute_preempt: Add compute-preempt-many (rev2)
URL   : https://patchwork.freedesktop.org/series/130326/
State : success

== Summary ==

CI Bug Log - changes from IGT_7733 -> IGTPW_10749
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10749/index.html

Participating hosts (42 -> 36)
------------------------------

  Missing    (6): bat-kbl-2 fi-bsw-n3050 fi-apl-guc fi-snb-2520m bat-jsl-1 bat-arls-3 

Known issues
------------

  Here are the changes found in IGTPW_10749 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][1] -> [ABORT][2] ([i915#7911])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7733/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10749/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gem_contexts:
    - bat-atsm-1:         [PASS][3] -> [INCOMPLETE][4] ([i915#10094] / [i915#10137])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7733/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10749/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_engines:
    - {bat-adls-6}:       [TIMEOUT][5] ([i915#10026]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7733/bat-adls-6/igt@i915_selftest@live@gt_engines.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10749/bat-adls-6/igt@i915_selftest@live@gt_engines.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10026]: https://gitlab.freedesktop.org/drm/intel/issues/10026
  [i915#10094]: https://gitlab.freedesktop.org/drm/intel/issues/10094
  [i915#10137]: https://gitlab.freedesktop.org/drm/intel/issues/10137
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7733 -> IGTPW_10749

  CI-20190529: 20190529
  CI_DRM_14360: 3bdccc6629ee909a167daedd6a8b75f6967ab726 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10749: 10749
  IGT_7733: aef5f474230d00901e4e80da00ce696eb99f71e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_compute_preempt@compute-preempt-many

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10749/index.html

--===============2086359721436717952==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_compute_preempt: Add compute-preempt-many (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130326/">https://patchwork.freedesktop.org/series/130326/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10749/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10749/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7733 -&gt; IGTPW_10749</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10749/index.html</p>
<h2>Participating hosts (42 -&gt; 36)</h2>
<p>Missing    (6): bat-kbl-2 fi-bsw-n3050 fi-apl-guc fi-snb-2520m bat-jsl-1 bat-arls-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10749 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7733/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10749/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7733/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10749/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10094">i915#10094</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10137">i915#10137</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_engines:<ul>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7733/bat-adls-6/igt@i915_selftest@live@gt_engines.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10026">i915#10026</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10749/bat-adls-6/igt@i915_selftest@live@gt_engines.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7733 -&gt; IGTPW_10749</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14360: 3bdccc6629ee909a167daedd6a8b75f6967ab726 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10749: 10749<br />
  IGT_7733: aef5f474230d00901e4e80da00ce696eb99f71e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_compute_preempt@compute-preempt-many</p>

</body>
</html>

--===============2086359721436717952==--
