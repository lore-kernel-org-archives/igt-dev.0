Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73719606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 08:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142E21123ED;
	Thu, 22 Oct 2026 08:28:34 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CBE1123ED;
 Thu, 22 Oct 2026 08:27:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5672822508963293287=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_add_coverage_for_xe=5Fpxp?=
 =?utf-8?q?=5Fdebugfs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 Oct 2026 08:27:46 -0000
Message-ID: <179265766640.55582.17007847057364350743@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261022054420.180035-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20261022054420.180035-1-shivtej.eknath.patil@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5672822508963293287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add coverage for xe_pxp_debugfs (rev2)
URL   : https://patchwork.freedesktop.org/series/175588/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9158_BAT -> XEIGTPW_16031_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_16031_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_16031_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_16031_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pxp@pxp-debugfs-info (NEW):
    - bat-ptl-vm:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/bat-ptl-vm/igt@xe_pxp@pxp-debugfs-info.html
    - bat-atsm-2:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/bat-atsm-2/igt@xe_pxp@pxp-debugfs-info.html

  
New tests
---------

  New tests have been introduced between XEIGT_9158_BAT and XEIGTPW_16031_BAT:

### New IGT tests (1) ###

  * igt@xe_pxp@pxp-debugfs-info:
    - Statuses : 8 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.06] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_16031_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pxp@pxp-debugfs-info (NEW):
    - bat-bmg-1:          NOTRUN -> [SKIP][3] ([Intel XE#4733])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/bat-bmg-1/igt@xe_pxp@pxp-debugfs-info.html
    - bat-bmg-vm:         NOTRUN -> [SKIP][4] ([Intel XE#4733])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/bat-bmg-vm/igt@xe_pxp@pxp-debugfs-info.html
    - bat-bmg-2:          NOTRUN -> [SKIP][5] ([Intel XE#4733])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/bat-bmg-2/igt@xe_pxp@pxp-debugfs-info.html
    - bat-adlp-7:         NOTRUN -> [SKIP][6] ([Intel XE#4733])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/bat-adlp-7/igt@xe_pxp@pxp-debugfs-info.html

  
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733


Build changes
-------------

  * IGT: IGT_9158 -> IGTPW_16031

  IGTPW_16031: 16031
  IGT_9158: c06ac65c584387323e8322c258d74cea1ce07b18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5997-dccfdbc40b10720efe537dfc63de84eed983fc8f: dccfdbc40b10720efe537dfc63de84eed983fc8f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/index.html

--===============5672822508963293287==
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
<tr><td><b>Series:</b></td><td>add coverage for xe_pxp_debugfs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175588/">https://patchwork.freedesktop.org/series/175588/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9158_BAT -&gt; XEIGTPW_16031_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_16031_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_16031_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_16031_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pxp@pxp-debugfs-info (NEW):<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/bat-ptl-vm/igt@xe_pxp@pxp-debugfs-info.html">SKIP</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/bat-atsm-2/igt@xe_pxp@pxp-debugfs-info.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9158_BAT and XEIGTPW_16031_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_pxp@pxp-debugfs-info:<ul>
<li>Statuses : 8 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16031_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pxp@pxp-debugfs-info (NEW):<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/bat-bmg-1/igt@xe_pxp@pxp-debugfs-info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/bat-bmg-vm/igt@xe_pxp@pxp-debugfs-info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/bat-bmg-2/igt@xe_pxp@pxp-debugfs-info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16031/bat-adlp-7/igt@xe_pxp@pxp-debugfs-info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9158 -&gt; IGTPW_16031</li>
</ul>
<p>IGTPW_16031: 16031<br />
  IGT_9158: c06ac65c584387323e8322c258d74cea1ce07b18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5997-dccfdbc40b10720efe537dfc63de84eed983fc8f: dccfdbc40b10720efe537dfc63de84eed983fc8f</p>

</body>
</html>

--===============5672822508963293287==--
