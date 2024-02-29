Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C94BC48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 07:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D2910E0AE;
	Thu, 29 Feb 2024 07:56:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD3A10E0AE;
 Thu, 29 Feb 2024 07:56:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7969556352576201907=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_uniquelly_identify_a_featur?=
 =?utf-8?q?e_at_documentation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 Feb 2024 07:56:33 -0000
Message-ID: <170919339384.395588.7264434232437816346@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
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

--===============7969556352576201907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: uniquelly identify a feature at documentation
URL   : https://patchwork.freedesktop.org/series/130545/
State : success

== Summary ==

CI Bug Log - changes from IGT_7736 -> IGTPW_10756
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10756/index.html

Participating hosts (41 -> 36)
------------------------------

  Missing    (5): fi-apl-guc fi-snb-2520m fi-glk-j4005 bat-jsl-1 bat-mtlp-8 

Known issues
------------

  Here are the changes found in IGTPW_10756 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7567u:       [CRASH][1] ([i915#9947]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7736/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10756/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - bat-adln-1:         [INCOMPLETE][3] ([i915#10137]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7736/bat-adln-1/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10756/bat-adln-1/igt@i915_selftest@live@hangcheck.html

  
  [i915#10137]: https://gitlab.freedesktop.org/drm/intel/issues/10137
  [i915#9947]: https://gitlab.freedesktop.org/drm/intel/issues/9947


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7736 -> IGTPW_10756

  CI-20190529: 20190529
  CI_DRM_14362: eec7a135b960c7b83b13a7c821e30f956074e439 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10756: 10756
  IGT_7736: 7736


Testlist changes
----------------

-igt@kms_vrr@max-min

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10756/index.html

--===============7969556352576201907==
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
<tr><td><b>Series:</b></td><td>uniquelly identify a feature at documentation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130545/">https://patchwork.freedesktop.org/series/130545/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10756/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10756/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7736 -&gt; IGTPW_10756</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10756/index.html</p>
<h2>Participating hosts (41 -&gt; 36)</h2>
<p>Missing    (5): fi-apl-guc fi-snb-2520m fi-glk-j4005 bat-jsl-1 bat-mtlp-8 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10756 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7736/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9947">i915#9947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10756/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7736/bat-adln-1/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10137">i915#10137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10756/bat-adln-1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7736 -&gt; IGTPW_10756</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14362: eec7a135b960c7b83b13a7c821e30f956074e439 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10756: 10756<br />
  IGT_7736: 7736</p>
<h2>Testlist changes</h2>
<p>-igt@kms_vrr@max-min</p>

</body>
</html>

--===============7969556352576201907==--
