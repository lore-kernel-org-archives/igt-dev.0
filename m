Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B07CA9EBE
	for <igt-dev@archiver.kernel.org>; Sat, 10 Oct 2026 14:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEA010E181;
	Sat, 10 Oct 2026 14:48:10 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FA510E181;
 Sat, 10 Oct 2026 14:47:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8902724026181291314=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fvm=3A_Va?=
 =?utf-8?q?lidate_host_memory_for_overcommit_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 10 Oct 2026 14:47:19 -0000
Message-ID: <179164363987.7234.3605181649899697208@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261010134809.2844905-1-sobin.thomas@intel.com>
In-Reply-To: <20261010134809.2844905-1-sobin.thomas@intel.com>
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

--===============8902724026181291314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Validate host memory for overcommit tests (rev2)
URL   : https://patchwork.freedesktop.org/series/174990/
State : success

== Summary ==

CI Bug Log - changes from IGT_9138 -> IGTPW_15969
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15969/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 fi-glk-j4005 

Known issues
------------

  Here are the changes found in IGTPW_15969 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bsw-nick:        [ABORT][1] -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9138/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15969/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@requests:
    - bat-atsm-1:         [INCOMPLETE][3] -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9138/bat-atsm-1/igt@i915_selftest@live@requests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15969/bat-atsm-1/igt@i915_selftest@live@requests.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9138 -> IGTPW_15969
  * Linux: CI_DRM_19303 -> CI_DRM_19312

  CI-20190529: 20190529
  CI_DRM_19303: 4f1de47ae94bb8aee6bc1c6105609646d9411650 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19312: 42fb41a656d70e2226e00726a8fedbe4152639ff @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15969: 15969
  IGT_9138: 9138

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15969/index.html

--===============8902724026181291314==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Validate host memory for overcommit tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174990/">https://patchwork.freedesktop.org/series/174990/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15969/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15969/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9138 -&gt; IGTPW_15969</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15969/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 fi-glk-j4005 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15969 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9138/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15969/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9138/bat-atsm-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15969/bat-atsm-1/igt@i915_selftest@live@requests.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9138 -&gt; IGTPW_15969</li>
<li>Linux: CI_DRM_19303 -&gt; CI_DRM_19312</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19303: 4f1de47ae94bb8aee6bc1c6105609646d9411650 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19312: 42fb41a656d70e2226e00726a8fedbe4152639ff @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15969: 15969<br />
  IGT_9138: 9138</p>

</body>
</html>

--===============8902724026181291314==--
