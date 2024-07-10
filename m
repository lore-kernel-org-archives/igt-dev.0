Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A92C3DA42
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 16:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C9910E281;
	Wed, 10 Jul 2024 16:30:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D9110E28E;
 Wed, 10 Jul 2024 16:30:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3259644094930515966=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_=2Egitlab-ci=3A_Add_explainati?=
 =?utf-8?q?on_to_run_CI_locally?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 10 Jul 2024 16:30:48 -0000
Message-ID: <172062904860.106000.568697196029014584@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240710-gitlab-ci-local-v1-1-9c8d1dabeeeb@bootlin.com>
In-Reply-To: <20240710-gitlab-ci-local-v1-1-9c8d1dabeeeb@bootlin.com>
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

--===============3259644094930515966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: .gitlab-ci: Add explaination to run CI locally
URL   : https://patchwork.freedesktop.org/series/135941/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7922_BAT -> XEIGTPW_11393_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11393_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][1] ([i915#5274])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([Intel XE#929]) +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] ([Intel XE#1091]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([Intel XE#288]) +32 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#255])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][6] ([Intel XE#977])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][7] ([Intel XE#979]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip:
    - bat-dg2-oem2:       [ABORT][8] ([Intel XE#1553]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7922/bat-dg2-oem2/igt@kms_flip@basic-plain-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@kms_flip@basic-plain-flip.html

  * igt@kms_flip@basic-plain-flip@a-dp3:
    - bat-dg2-oem2:       [ABORT][10] -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7922/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@a-dp3.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@a-dp3.html

  * igt@kms_flip@basic-plain-flip@b-dp3:
    - bat-dg2-oem2:       [DMESG-WARN][12] ([Intel XE#1553]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7922/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@b-dp3.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@b-dp3.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7922 -> IGTPW_11393

  IGTPW_11393: 11393
  IGT_7922: 325d4f4efbf869f93d3b4479046713d0ce7220e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1589-28c3b18581a110660a7c42bb988a12a3b1f6d402: 28c3b18581a110660a7c42bb988a12a3b1f6d402

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/index.html

--===============3259644094930515966==
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
<tr><td><b>Series:</b></td><td>.gitlab-ci: Add explaination to run CI locally</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135941/">https://patchwork.freedesktop.org/series/135941/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7922_BAT -&gt; XEIGTPW_11393_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11393_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7922/bat-dg2-oem2/igt@kms_flip@basic-plain-flip.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@kms_flip@basic-plain-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7922/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@a-dp3.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@a-dp3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7922/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@b-dp3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11393/bat-dg2-oem2/igt@kms_flip@basic-plain-flip@b-dp3.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7922 -&gt; IGTPW_11393</li>
</ul>
<p>IGTPW_11393: 11393<br />
  IGT_7922: 325d4f4efbf869f93d3b4479046713d0ce7220e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1589-28c3b18581a110660a7c42bb988a12a3b1f6d402: 28c3b18581a110660a7c42bb988a12a3b1f6d402</p>

</body>
</html>

--===============3259644094930515966==--
