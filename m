Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25529CDD1C0
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 15:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F4010ECEC;
	Fri, 27 Sep 2024 15:52:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AAC10ECE6;
 Fri, 27 Sep 2024 15:52:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6881310349929884975=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Backlight_control_on_HDR-enabl?=
 =?utf-8?q?ed_eDP_panels_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Sep 2024 15:52:46 -0000
Message-ID: <172745236692.1111818.9980493712736252459@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927102038.1001578-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240927102038.1001578-1-santhosh.reddy.guddati@intel.com>
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

--===============6881310349929884975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Backlight control on HDR-enabled eDP panels (rev2)
URL   : https://patchwork.freedesktop.org/series/139050/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8035_BAT -> XEIGTPW_11824_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11824_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11824_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11824_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_hdr@brightness-with-hdr} (NEW):
    - bat-lnl-2:          NOTRUN -> [SKIP][1] +11 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-lnl-2/igt@kms_hdr@brightness-with-hdr.html
    - bat-lnl-1:          NOTRUN -> [SKIP][2] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-lnl-1/igt@kms_hdr@brightness-with-hdr.html
    - {bat-bmg-2}:        NOTRUN -> [SKIP][3] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * {igt@kms_hdr@brightness-with-suspend} (NEW):
    - bat-bmg-1:          NOTRUN -> [SKIP][4] +5 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-bmg-1/igt@kms_hdr@brightness-with-suspend.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_hdr@static-toggle-suspend:
    - {bat-bmg-2}:        NOTRUN -> [SKIP][5] +8 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-bmg-2/igt@kms_hdr@static-toggle-suspend.html

  
New tests
---------

  New tests have been introduced between XEIGT_8035_BAT and XEIGTPW_11824_BAT:

### New IGT tests (9) ###

  * igt@kms_hdr@brightness-with-dpms:
    - Statuses : 9 skip(s)
    - Exec time: [0.0, 0.41] s

  * igt@kms_hdr@brightness-with-dpms@pipe-a-dp-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-dpms@pipe-a-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-hdr:
    - Statuses : 9 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@kms_hdr@brightness-with-hdr@pipe-a-dp-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-suspend:
    - Statuses : 9 skip(s)
    - Exec time: [0.0, 0.42] s

  * igt@kms_hdr@brightness-with-suspend@pipe-a-dp-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@brightness-with-suspend@pipe-a-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11824_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_hdr@brightness-with-hdr} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][6] ([Intel XE#455]) +11 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-adlp-7/igt@kms_hdr@brightness-with-hdr.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][7] ([Intel XE#455]) +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-dg2-oem2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - bat-bmg-1:          NOTRUN -> [SKIP][8] ([Intel XE#1503])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - bat-adlp-vf:        NOTRUN -> [SKIP][9] ([Intel XE#2463]) +11 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-adlp-vf/igt@kms_hdr@static-swap.html
    - bat-lnl-1:          NOTRUN -> [SKIP][10] ([Intel XE#1503] / [Intel XE#599]) +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-lnl-1/igt@kms_hdr@static-swap.html
    - bat-pvc-2:          NOTRUN -> [SKIP][11] ([Intel XE#1024]) +11 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-pvc-2/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - bat-atsm-2:         NOTRUN -> [SKIP][12] ([Intel XE#1024]) +11 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-atsm-2/igt@kms_hdr@static-toggle-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599


Build changes
-------------

  * IGT: IGT_8035 -> IGTPW_11824
  * Linux: xe-1983-6bd25f52157328ac4b7b09a3946281957afe3bfd -> xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b

  IGTPW_11824: e2cb14644b99a41a9ff89cc9ea862fdcad15dd3c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8035: 54cf84790112f2656b38b9068d4b492fbef13d84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1983-6bd25f52157328ac4b7b09a3946281957afe3bfd: 6bd25f52157328ac4b7b09a3946281957afe3bfd
  xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b: 4d4fdd11d1cc941f2f7c1653fc07519851d9052b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/index.html

--===============6881310349929884975==
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
<tr><td><b>Series:</b></td><td>Backlight control on HDR-enabled eDP panels (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139050/">https://patchwork.freedesktop.org/series/139050/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8035_BAT -&gt; XEIGTPW_11824_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11824_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11824_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11824_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_hdr@brightness-with-hdr} (NEW):</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-lnl-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> +11 other tests skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-lnl-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> +2 other tests skip</li>
<li>{bat-bmg-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@brightness-with-suspend} (NEW):</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-bmg-1/igt@kms_hdr@brightness-with-suspend.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_hdr@static-toggle-suspend:<ul>
<li>{bat-bmg-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-bmg-2/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8035_BAT and XEIGTPW_11824_BAT:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-dpms:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-dpms@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-dpms@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-suspend:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-suspend@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11824_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_hdr@brightness-with-hdr} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-adlp-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-dg2-oem2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-adlp-vf/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>) +11 other tests skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-lnl-1/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +4 other tests skip</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-pvc-2/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11824/bat-atsm-2/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +11 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8035 -&gt; IGTPW_11824</li>
<li>Linux: xe-1983-6bd25f52157328ac4b7b09a3946281957afe3bfd -&gt; xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b</li>
</ul>
<p>IGTPW_11824: e2cb14644b99a41a9ff89cc9ea862fdcad15dd3c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8035: 54cf84790112f2656b38b9068d4b492fbef13d84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1983-6bd25f52157328ac4b7b09a3946281957afe3bfd: 6bd25f52157328ac4b7b09a3946281957afe3bfd<br />
  xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b: 4d4fdd11d1cc941f2f7c1653fc07519851d9052b</p>

</body>
</html>

--===============6881310349929884975==--
