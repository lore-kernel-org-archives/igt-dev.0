Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE233C3DA45
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 16:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A5110E294;
	Thu, 11 Jul 2024 16:43:02 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B2610E294;
 Thu, 11 Jul 2024 16:43:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7739607220265165722=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel-ci/xe=2Eblocklist?=
 =?utf-8?q?=3A_Blocklist_SR-IOV_stress_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Jul 2024 16:43:00 -0000
Message-ID: <172071618088.126981.9622543030657596915@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240711151437.996509-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240711151437.996509-1-marcin.bernatowicz@linux.intel.com>
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

--===============7739607220265165722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci/xe.blocklist: Blocklist SR-IOV stress tests
URL   : https://patchwork.freedesktop.org/series/136001/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7924_BAT -> XEIGTPW_11401_BAT
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

  Here are the changes found in XEIGTPW_11401_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#886]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#1932])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-lnl-1:          NOTRUN -> [SKIP][4] ([Intel XE#1091])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-pvc-2:          NOTRUN -> [SKIP][5] ([Intel XE#1932])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][6] ([Intel XE#1091])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-atsm-2:         NOTRUN -> [SKIP][7] ([Intel XE#1932])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7924 -> IGTPW_11401
  * Linux: xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13 -> xe-1596-e07122bf67b924e3cf597c65a6fb6b36b394f069

  IGTPW_11401: 11401
  IGT_7924: 6e6ecdef9f167ff987f6d323f3ff6429c01b25e0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13: 36e90f69c967f4cbcdd02c40c9ef25694ffb1a13
  xe-1596-e07122bf67b924e3cf597c65a6fb6b36b394f069: e07122bf67b924e3cf597c65a6fb6b36b394f069

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/index.html

--===============7739607220265165722==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci/xe.blocklist: Blocklist SR-IOV stress tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136001/">https://patchwork.freedesktop.org/series/136001/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7924_BAT -&gt; XEIGTPW_11401_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11401_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7924 -&gt; IGTPW_11401</li>
<li>Linux: xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13 -&gt; xe-1596-e07122bf67b924e3cf597c65a6fb6b36b394f069</li>
</ul>
<p>IGTPW_11401: 11401<br />
  IGT_7924: 6e6ecdef9f167ff987f6d323f3ff6429c01b25e0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13: 36e90f69c967f4cbcdd02c40c9ef25694ffb1a13<br />
  xe-1596-e07122bf67b924e3cf597c65a6fb6b36b394f069: e07122bf67b924e3cf597c65a6fb6b36b394f069</p>

</body>
</html>

--===============7739607220265165722==--
