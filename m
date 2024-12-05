Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113C1E7716E
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 23:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FBE10EFD8;
	Thu,  5 Dec 2024 23:10:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9769D10EFD5;
 Thu,  5 Dec 2024 23:10:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1980914998659173434=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_prevent_consecutive_unplug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Dec 2024 23:10:04 -0000
Message-ID: <173344020460.3127338.10708198626032116262@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205094052.1259373-1-kunal1.joshi@intel.com>
In-Reply-To: <20241205094052.1259373-1-kunal1.joshi@intel.com>
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

--===============1980914998659173434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: prevent consecutive unplug
URL   : https://patchwork.freedesktop.org/series/142152/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8139_BAT -> XEIGTPW_12252_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12252_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12252_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12252_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe} (NEW):
    - bat-lnl-1:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-bmg-2:          NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-bmg-1:          NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-lnl-2:          NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-dg2-oem2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-lnl-1:          [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8139/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  
New tests
---------

  New tests have been introduced between XEIGT_8139_BAT and XEIGTPW_12252_BAT:

### New IGT tests (2) ###

  * igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12252_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe} (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][8] ([Intel XE#1024]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-atsm-2/igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe.html

  * {igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe} (NEW):
    - bat-adlp-vf:        NOTRUN -> [SKIP][9] ([Intel XE#2463]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-adlp-vf/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html
    - bat-pvc-2:          NOTRUN -> [SKIP][10] ([Intel XE#1024]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-pvc-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463


Build changes
-------------

  * IGT: IGT_8139 -> IGTPW_12252

  IGTPW_12252: 12252
  IGT_8139: b0c59bb94e6c990589eb6825c1436ce412804dae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2328-1b7746f770882ce40dacae683e8e65657c40c2b7: 1b7746f770882ce40dacae683e8e65657c40c2b7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/index.html

--===============1980914998659173434==
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
<tr><td><b>Series:</b></td><td>prevent consecutive unplug</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142152/">https://patchwork.freedesktop.org/series/142152/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8139_BAT -&gt; XEIGTPW_12252_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12252_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12252_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12252_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe} (NEW):</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html">SKIP</a> +1 other test skip</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html">SKIP</a> +1 other test skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html">SKIP</a> +1 other test skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-dg2-oem2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8139/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8139_BAT and XEIGTPW_12252_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12252_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-atsm-2/igt@kms_chamelium_hpd@dp-hpd-for-each-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe} (NEW):</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-adlp-vf/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>) +1 other test skip</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12252/bat-pvc-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8139 -&gt; IGTPW_12252</li>
</ul>
<p>IGTPW_12252: 12252<br />
  IGT_8139: b0c59bb94e6c990589eb6825c1436ce412804dae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2328-1b7746f770882ce40dacae683e8e65657c40c2b7: 1b7746f770882ce40dacae683e8e65657c40c2b7</p>

</body>
</html>

--===============1980914998659173434==--
