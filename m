Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49651C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 05:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE0B10E17B;
	Wed, 21 Feb 2024 05:06:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD2610E17B;
 Wed, 21 Feb 2024 05:06:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3689682821499998296=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_64k_page_test_coverage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 21 Feb 2024 05:06:33 -0000
Message-ID: <170849199331.178297.14799673861944382793@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221033107.3731001-1-matthew.brost@intel.com>
In-Reply-To: <20240221033107.3731001-1-matthew.brost@intel.com>
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

--===============3689682821499998296==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: 64k page test coverage
URL   : https://patchwork.freedesktop.org/series/130166/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14305 -> IGTPW_10707
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10707/index.html

Participating hosts (40 -> 36)
------------------------------

  Missing    (4): fi-cfl-8109u bat-kbl-2 bat-jsl-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10707:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@uncore:
    - {bat-arls-2}:       NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10707/bat-arls-2/igt@i915_selftest@live@uncore.html

  
Known issues
------------

  Here are the changes found in IGTPW_10707 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@vgem_basic@create:
    - {bat-arls-2}:       [FAIL][2] -> [PASS][3] +4 other tests pass
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14305/bat-arls-2/igt@vgem_basic@create.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10707/bat-arls-2/igt@vgem_basic@create.html

  * igt@vgem_basic@dmabuf-mmap:
    - {bat-arls-2}:       [INCOMPLETE][4] -> [PASS][5] +6 other tests pass
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14305/bat-arls-2/igt@vgem_basic@dmabuf-mmap.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10707/bat-arls-2/igt@vgem_basic@dmabuf-mmap.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#10196]: https://gitlab.freedesktop.org/drm/intel/issues/10196
  [i915#10212]: https://gitlab.freedesktop.org/drm/intel/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/intel/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/intel/issues/10214
  [i915#10215]: https://gitlab.freedesktop.org/drm/intel/issues/10215
  [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7718 -> IGTPW_10707

  CI-20190529: 20190529
  CI_DRM_14305: 4b8a238dee9c18201f3652695414587cd2ef6d8f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10707: 10707
  IGT_7718: 40e8b9122853f455c84afcfa56469a6bc9a0d564 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 1521 lines
--- 95 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10707/index.html

--===============3689682821499998296==
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
<tr><td><b>Series:</b></td><td>64k page test coverage</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130166/">https://patchwork.freedesktop.org/series/130166/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10707/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10707/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14305 -&gt; IGTPW_10707</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10707/index.html</p>
<h2>Participating hosts (40 -&gt; 36)</h2>
<p>Missing    (4): fi-cfl-8109u bat-kbl-2 bat-jsl-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10707:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@uncore:<ul>
<li>{bat-arls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10707/bat-arls-2/igt@i915_selftest@live@uncore.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10707 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@vgem_basic@create:</p>
<ul>
<li>{bat-arls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14305/bat-arls-2/igt@vgem_basic@create.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10707/bat-arls-2/igt@vgem_basic@create.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@dmabuf-mmap:</p>
<ul>
<li>{bat-arls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14305/bat-arls-2/igt@vgem_basic@dmabuf-mmap.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10707/bat-arls-2/igt@vgem_basic@dmabuf-mmap.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7718 -&gt; IGTPW_10707</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14305: 4b8a238dee9c18201f3652695414587cd2ef6d8f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10707: 10707<br />
  IGT_7718: 40e8b9122853f455c84afcfa56469a6bc9a0d564 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 1521 lines<br />
--- 95 lines</p>

</body>
</html>

--===============3689682821499998296==--
