Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0E7EE57CC
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 00:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2AC10E981;
	Thu, 12 Sep 2024 00:18:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1307C10E981;
 Thu, 12 Sep 2024 00:18:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5421293230221839470=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/*=5Fquery=3A_Ad?=
 =?utf-8?q?d_new_hwconfig_table_entry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Sep 2024 00:18:05 -0000
Message-ID: <172610028506.989178.12780541460807731010@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240910011238.254204-1-julia.filipchuk@intel.com>
In-Reply-To: <20240910011238.254204-1-julia.filipchuk@intel.com>
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

--===============5421293230221839470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/*_query: Add new hwconfig table entry
URL   : https://patchwork.freedesktop.org/series/138436/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15398 -> IGTPW_11715
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11715/index.html

Participating hosts (38 -> 37)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (2): bat-arls-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_11715 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - fi-pnv-d510:        NOTRUN -> [SKIP][1] +33 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11715/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-arls-5:         [PASS][2] -> [INCOMPLETE][3] ([i915#11320])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15398/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11715/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - bat-arls-5:         [DMESG-WARN][4] ([i915#11637] / [i915#1982]) -> [DMESG-WARN][5] ([i915#11637])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15398/bat-arls-5/igt@i915_module_load@reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11715/bat-arls-5/igt@i915_module_load@reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196
  [i915#11320]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11320
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723
  [i915#11726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8013 -> IGTPW_11715

  CI-20190529: 20190529
  CI_DRM_15398: 024375dea928f05b859b457ceaff8c2b33609121 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11715: 11715
  IGT_8013: 8013

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11715/index.html

--===============5421293230221839470==
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
<tr><td><b>Series:</b></td><td>tests/intel/*_query: Add new hwconfig table entry</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138436/">https://patchwork.freedesktop.org/series/138436/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11715/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11715/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15398 -&gt; IGTPW_11715</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11715/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (2): bat-arls-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11715 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11715/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15398/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11715/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11320">i915#11320</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15398/bat-arls-5/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11715/bat-arls-5/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8013 -&gt; IGTPW_11715</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15398: 024375dea928f05b859b457ceaff8c2b33609121 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11715: 11715<br />
  IGT_8013: 8013</p>

</body>
</html>

--===============5421293230221839470==--
