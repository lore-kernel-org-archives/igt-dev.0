Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C13C47422
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 07:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E3010EA9C;
	Mon, 29 Jan 2024 07:14:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A4610EA9C;
 Mon, 29 Jan 2024 07:14:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0409905867443940863=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv2=2C1/7=5D_lib/xe/ioctl=3A_introduce_xe=5Fbb=5Fsize=28=29_h?=
 =?utf-8?q?elper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 29 Jan 2024 07:14:11 -0000
Message-ID: <170651245149.789298.5359484985254286001@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240125105646.313561-1-matthew.auld@intel.com>
In-Reply-To: <20240125105646.313561-1-matthew.auld@intel.com>
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

--===============0409905867443940863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/7] lib/xe/ioctl: introduce xe_bb_size() helper
URL   : https://patchwork.freedesktop.org/series/129158/
State : success

== Summary ==

CI Bug Log - changes from IGT_7692 -> IGTPW_10588
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/index.html

Participating hosts (37 -> 35)
------------------------------

  Missing    (2): bat-rpls-2 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10588 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][1] -> [ABORT][2] ([i915#7911])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - fi-skl-guc:         [PASS][3] -> [DMESG-FAIL][4] ([i915#10112])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/fi-skl-guc/igt@i915_selftest@live@hangcheck.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][5] -> [FAIL][6] ([i915#10164])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10112]: https://gitlab.freedesktop.org/drm/intel/issues/10112
  [i915#10164]: https://gitlab.freedesktop.org/drm/intel/issues/10164
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7692 -> IGTPW_10588

  CI-20190529: 20190529
  CI_DRM_14178: cad255f28ccca6529104b9497a8d7302ae7eb88a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10588: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/index.html
  IGT_7692: 5d9c29c620701497323bf3721146da57efa50952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/index.html

--===============0409905867443940863==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/7] lib/xe/ioctl: introduce xe_bb_size() helper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129158/">https://patchwork.freedesktop.org/series/129158/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7692 -&gt; IGTPW_10588</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/index.html</p>
<h2>Participating hosts (37 -&gt; 35)</h2>
<p>Missing    (2): bat-rpls-2 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10588 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10112">i915#10112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10164">i915#10164</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7692 -&gt; IGTPW_10588</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14178: cad255f28ccca6529104b9497a8d7302ae7eb88a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10588: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/index.html<br />
  IGT_7692: 5d9c29c620701497323bf3721146da57efa50952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0409905867443940863==--
