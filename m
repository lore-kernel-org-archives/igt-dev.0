Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568CCC48286
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 01:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131AA10EEBF;
	Fri,  2 Feb 2024 01:48:30 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2C110EEBF;
 Fri,  2 Feb 2024 01:48:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4636998221134064805=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_live_test_renames?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 02 Feb 2024 01:48:27 -0000
Message-ID: <170683850797.935547.5177859016180822947@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202004529.552806-1-lucas.demarchi@intel.com>
In-Reply-To: <20240202004529.552806-1-lucas.demarchi@intel.com>
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

--===============4636998221134064805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: live test renames
URL   : https://patchwork.freedesktop.org/series/129449/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14210 -> IGTPW_10631
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10631 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10631, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10631/index.html

Participating hosts (39 -> 36)
------------------------------

  Missing    (3): bat-adlm-1 fi-snb-2520m fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10631:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14210/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10631/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@debugfs_test@basic-hwmon:
    - {bat-arls-2}:       [SKIP][3] ([i915#9318]) -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14210/bat-arls-2/igt@debugfs_test@basic-hwmon.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10631/bat-arls-2/igt@debugfs_test@basic-hwmon.html

  
Known issues
------------

  Here are the changes found in IGTPW_10631 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - bat-adlp-9:         [ABORT][5] ([i915#10021]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14210/bat-adlp-9/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10631/bat-adlp-9/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10021]: https://gitlab.freedesktop.org/drm/intel/issues/10021
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7701 -> IGTPW_10631

  CI-20190529: 20190529
  CI_DRM_14210: 18a9fefd9e05291cbe792d358bbdc04dc6d21adb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10631: 10631
  IGT_7701: 7701


Testlist changes
----------------

+igt@xe_live_ktest@xe_bo
+igt@xe_live_ktest@xe_dmabuf
+igt@xe_live_ktest@xe_migrate
+igt@xe_live_ktest@xe_mocs
-igt@xe_ccs@block-copy-compressed-inc-dimension
-igt@xe_ccs@block-copy-uncompressed-inc-dimension
-igt@xe_exercise_blt@fast-copy-inc-dimension
-igt@xe_live_ktest@bo
-igt@xe_live_ktest@dmabuf
-igt@xe_live_ktest@migrate
-igt@xe_live_ktest@mocs

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10631/index.html

--===============4636998221134064805==
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
<tr><td><b>Series:</b></td><td>live test renames</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129449/">https://patchwork.freedesktop.org/series/129449/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10631/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10631/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14210 -&gt; IGTPW_10631</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10631 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10631, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10631/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): bat-adlm-1 fi-snb-2520m fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10631:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14210/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10631/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@debugfs_test@basic-hwmon:<ul>
<li>{bat-arls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14210/bat-arls-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10631/bat-arls-2/igt@debugfs_test@basic-hwmon.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10631 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14210/bat-adlp-9/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10021">i915#10021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10631/bat-adlp-9/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7701 -&gt; IGTPW_10631</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14210: 18a9fefd9e05291cbe792d358bbdc04dc6d21adb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10631: 10631<br />
  IGT_7701: 7701</p>
<h2>Testlist changes</h2>
<p>+igt@xe_live_ktest@xe_bo<br />
+igt@xe_live_ktest@xe_dmabuf<br />
+igt@xe_live_ktest@xe_migrate<br />
+igt@xe_live_ktest@xe_mocs<br />
-igt@xe_ccs@block-copy-compressed-inc-dimension<br />
-igt@xe_ccs@block-copy-uncompressed-inc-dimension<br />
-igt@xe_exercise_blt@fast-copy-inc-dimension<br />
-igt@xe_live_ktest@bo<br />
-igt@xe_live_ktest@dmabuf<br />
-igt@xe_live_ktest@migrate<br />
-igt@xe_live_ktest@mocs</p>

</body>
</html>

--===============4636998221134064805==--
