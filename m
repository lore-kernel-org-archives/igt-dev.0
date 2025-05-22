Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3108C54E90
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 14:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE2410E72D;
	Thu, 22 May 2025 14:43:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3503810E72D;
 Thu, 22 May 2025 14:43:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6254091707948857745=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Replace_intel=5Fsysfs=5Fd?=
 =?utf-8?q?ebugfs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 May 2025 14:43:33 -0000
Message-ID: <174792501319.14490.4158426621362725757@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250522110126.628720-1-peter.senna@linux.intel.com>
In-Reply-To: <20250522110126.628720-1-peter.senna@linux.intel.com>
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

--===============6254091707948857745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Replace intel_sysfs_debugfs (rev2)
URL   : https://patchwork.freedesktop.org/series/149023/
State : success

== Summary ==

CI Bug Log - changes from IGT_8375 -> IGTPW_13170
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8375 and IGTPW_13170:

### New IGT tests (2) ###

  * igt@core_debugfs@debugfs-read-all-entries:
    - Statuses : 42 pass(s)
    - Exec time: [0.0, 0.34] s

  * igt@core_sysfs@sysfs-read-all-entries:
    - Statuses : 42 pass(s)
    - Exec time: [0.0, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_13170 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@basic-wait:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2] ([i915#13400]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-rpls-4/igt@gem_exec_fence@basic-wait.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-rpls-4/igt@gem_exec_fence@basic-wait.html

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][3] -> [DMESG-FAIL][4] ([i915#14243]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-arlh-3/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-arlh-3/igt@i915_selftest@live.html
    - bat-dg2-14:         [PASS][5] -> [ABORT][6] ([i915#13696] / [i915#14201])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-dg2-14/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-dg2-14/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_heartbeat:
    - bat-dg2-14:         [PASS][7] -> [ABORT][8] ([i915#14201])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-dg2-14/igt@i915_selftest@live@gt_heartbeat.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-dg2-14/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@hugepages:
    - bat-arlh-2:         NOTRUN -> [DMESG-FAIL][9] ([i915#14243])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-arlh-2/igt@i915_selftest@live@hugepages.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [ABORT][10] ([i915#13571]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gem:
    - bat-arlh-2:         [ABORT][12] ([i915#13723]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-arlh-2/igt@i915_selftest@live@gem.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-arlh-2/igt@i915_selftest@live@gem.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [ABORT][14] ([i915#13723]) -> [DMESG-FAIL][15] ([i915#14243])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-arlh-2/igt@i915_selftest@live.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-arlh-2/igt@i915_selftest@live.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#13571]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13571
  [i915#13696]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696
  [i915#13723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723
  [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
  [i915#14243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8375 -> IGTPW_13170

  CI-20190529: 20190529
  CI_DRM_16582: 444fd022f6c4f5245b1e8f797805ab3917235d3d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13170: c5ee107302ae60c83083510fedd83ff0bbcc0f04 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8375: 8375

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/index.html

--===============6254091707948857745==
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
<tr><td><b>Series:</b></td><td>Replace intel_sysfs_debugfs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149023/">https://patchwork.freedesktop.org/series/149023/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8375 -&gt; IGTPW_13170</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/index.html</p>
<h2>Participating hosts (45 -&gt; 44)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8375 and IGTPW_13170:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@core_debugfs@debugfs-read-all-entries:</p>
<ul>
<li>Statuses : 42 pass(s)</li>
<li>Exec time: [0.0, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@core_sysfs@sysfs-read-all-entries:</p>
<ul>
<li>Statuses : 42 pass(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13170 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-wait:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-rpls-4/igt@gem_exec_fence@basic-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-rpls-4/igt@gem_exec_fence@basic-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-arlh-3/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243">i915#14243</a>) +1 other test dmesg-fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-dg2-14/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-dg2-14/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696">i915#13696</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-dg2-14/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-dg2-14/igt@i915_selftest@live@gt_heartbeat.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-arlh-2/igt@i915_selftest@live@hugepages.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243">i915#14243</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-rpls-4/igt@i915_pm_rpm@module-reload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13571">i915#13571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-rpls-4/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-arlh-2/igt@i915_selftest@live@gem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723">i915#13723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-arlh-2/igt@i915_selftest@live@gem.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/bat-arlh-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723">i915#13723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/bat-arlh-2/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243">i915#14243</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8375 -&gt; IGTPW_13170</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16582: 444fd022f6c4f5245b1e8f797805ab3917235d3d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13170: c5ee107302ae60c83083510fedd83ff0bbcc0f04 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8375: 8375</p>

</body>
</html>

--===============6254091707948857745==--
