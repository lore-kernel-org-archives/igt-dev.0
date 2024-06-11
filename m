Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D12C27C5E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 07:14:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4645110E0F5;
	Tue, 11 Jun 2024 07:14:27 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124D710E0F5;
 Tue, 11 Jun 2024 07:14:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8446315485174751986=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_IGT_KMS_Test_cleanup_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 11 Jun 2024 07:14:26 -0000
Message-ID: <171809006606.66418.12676584915292791251@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
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

--===============8446315485174751986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: IGT KMS Test cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/134685/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14917 -> IGTPW_11247
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11247/index.html

Participating hosts (40 -> 35)
------------------------------

  Missing    (5): fi-kbl-7567u fi-bsw-n3050 fi-snb-2520m fi-glk-j4005 bat-mtlp-8 

New tests
---------

  New tests have been introduced between CI_DRM_14917 and IGTPW_11247:

### New IGT tests (2) ###

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-8:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-8:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  

Known issues
------------

  Here are the changes found in IGTPW_11247 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - {bat-mtlp-9}:       [CRASH][1] ([i915#10911]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14917/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11247/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_heartbeat:
    - bat-arls-1:         [DMESG-WARN][3] ([i915#10999]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14917/bat-arls-1/igt@i915_selftest@live@gt_heartbeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11247/bat-arls-1/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@objects:
    - bat-arls-1:         [DMESG-FAIL][5] ([i915#10262]) -> [PASS][6] +26 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14917/bat-arls-1/igt@i915_selftest@live@objects.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11247/bat-arls-1/igt@i915_selftest@live@objects.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10262]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262
  [i915#10580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580
  [i915#10911]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
  [i915#10999]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10999
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#11060]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11060
  [i915#11328]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11328
  [i915#6121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121
  [i915#8585]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8585


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7880 -> IGTPW_11247

  CI-20190529: 20190529
  CI_DRM_14917: 34997e6c7d5e203ee9b54b8da59270ead2a82c59 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11247: 42e1813d438fd5a17ad3e3408d712eb7beab642b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11247/index.html

--===============8446315485174751986==
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
<tr><td><b>Series:</b></td><td>IGT KMS Test cleanup (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134685/">https://patchwork.freedesktop.org/series/134685/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11247/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11247/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14917 -&gt; IGTPW_11247</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11247/index.html</p>
<h2>Participating hosts (40 -&gt; 35)</h2>
<p>Missing    (5): fi-kbl-7567u fi-bsw-n3050 fi-snb-2520m fi-glk-j4005 bat-mtlp-8 </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_14917 and IGTPW_11247:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-8:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-8:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11247 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14917/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911">i915#10911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11247/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14917/bat-arls-1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10999">i915#10999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11247/bat-arls-1/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@objects:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14917/bat-arls-1/igt@i915_selftest@live@objects.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11247/bat-arls-1/igt@i915_selftest@live@objects.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7880 -&gt; IGTPW_11247</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14917: 34997e6c7d5e203ee9b54b8da59270ead2a82c59 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11247: 42e1813d438fd5a17ad3e3408d712eb7beab642b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8446315485174751986==--
