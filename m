Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E3CC4828F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 16:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CCE10E951;
	Thu,  8 Feb 2024 16:08:58 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A7310E93D;
 Thu,  8 Feb 2024 16:08:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2284207471813644959=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/kms=5Fasync=5Fflip=3A?=
 =?utf-8?q?_Reduce_the_clobbering_area_used_for_CRC_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 08 Feb 2024 16:08:57 -0000
Message-ID: <170740853754.1106256.17099612518680241117@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240208121039.13701-1-vandita.kulkarni@intel.com>
In-Reply-To: <20240208121039.13701-1-vandita.kulkarni@intel.com>
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

--===============2284207471813644959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flip: Reduce the clobbering area used for CRC test
URL   : https://patchwork.freedesktop.org/series/129666/
State : success

== Summary ==

CI Bug Log - changes from IGT_7706 -> IGTPW_10650
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/index.html

Participating hosts (39 -> 35)
------------------------------

  Missing    (4): bat-mtlp-8 fi-cfl-8109u fi-apl-guc fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10650 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][1] -> [ABORT][2] ([i915#7911])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7706/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@gem_exec_create@basic@smem:
    - {bat-arls-1}:       [DMESG-WARN][3] ([i915#10194]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7706/bat-arls-1/igt@gem_exec_create@basic@smem.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/bat-arls-1/igt@gem_exec_create@basic@smem.html

  * igt@kms_addfb_basic@bad-pitch-1024:
    - {bat-arls-2}:       [INCOMPLETE][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7706/bat-arls-2/igt@kms_addfb_basic@bad-pitch-1024.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/bat-arls-2/igt@kms_addfb_basic@bad-pitch-1024.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#10196]: https://gitlab.freedesktop.org/drm/intel/issues/10196
  [i915#10200]: https://gitlab.freedesktop.org/drm/intel/issues/10200
  [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
  [i915#10207]: https://gitlab.freedesktop.org/drm/intel/issues/10207
  [i915#10208]: https://gitlab.freedesktop.org/drm/intel/issues/10208
  [i915#10209]: https://gitlab.freedesktop.org/drm/intel/issues/10209
  [i915#10212]: https://gitlab.freedesktop.org/drm/intel/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/intel/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/intel/issues/10214
  [i915#10215]: https://gitlab.freedesktop.org/drm/intel/issues/10215
  [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7706 -> IGTPW_10650

  CI-20190529: 20190529
  CI_DRM_14242: aed7e9419a8e3775ed46af4cff2de11d7e76c960 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10650: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/index.html
  IGT_7706: dd38bc402e08b8a6c9ef26a2f5b8a9a9034cb435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/index.html

--===============2284207471813644959==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flip: Reduce the clobbering area used for CRC test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129666/">https://patchwork.freedesktop.org/series/129666/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7706 -&gt; IGTPW_10650</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/index.html</p>
<h2>Participating hosts (39 -&gt; 35)</h2>
<p>Missing    (4): bat-mtlp-8 fi-cfl-8109u fi-apl-guc fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10650 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7706/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_create@basic@smem:</p>
<ul>
<li>{bat-arls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7706/bat-arls-1/igt@gem_exec_create@basic@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/bat-arls-1/igt@gem_exec_create@basic@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-1024:</p>
<ul>
<li>{bat-arls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7706/bat-arls-2/igt@kms_addfb_basic@bad-pitch-1024.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/bat-arls-2/igt@kms_addfb_basic@bad-pitch-1024.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7706 -&gt; IGTPW_10650</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14242: aed7e9419a8e3775ed46af4cff2de11d7e76c960 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10650: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10650/index.html<br />
  IGT_7706: dd38bc402e08b8a6c9ef26a2f5b8a9a9034cb435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2284207471813644959==--
