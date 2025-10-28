Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6A1CCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 09:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31ECD10E067;
	Tue, 28 Oct 2025 09:58:53 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E7210E067;
 Tue, 28 Oct 2025 09:58:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1535064368797676771=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fsurvivabil?=
 =?utf-8?q?ity=3A_Add_xe=5Fsurvivability_test_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 28 Oct 2025 09:58:52 -0000
Message-ID: <176164553226.62065.8744070406391927128@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251028082856.3197023-5-sk.anirban@intel.com>
In-Reply-To: <20251028082856.3197023-5-sk.anirban@intel.com>
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

--===============1535064368797676771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_survivability: Add xe_survivability test (rev7)
URL   : https://patchwork.freedesktop.org/series/154342/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8598_BAT -> XEIGTPW_13953_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13953_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13953_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13953_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_survivability@i2c-functionality (NEW):
    - bat-lnl-2:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-lnl-2/igt@xe_survivability@i2c-functionality.html
    - bat-ptl-2:          NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-ptl-2/igt@xe_survivability@i2c-functionality.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-dg2-oem2/igt@xe_survivability@i2c-functionality.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-adlp-vm/igt@xe_survivability@i2c-functionality.html

  * igt@xe_survivability@runtime-survivability (NEW):
    - bat-bmg-2:          NOTRUN -> [DMESG-WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-bmg-2/igt@xe_survivability@runtime-survivability.html
    - bat-bmg-1:          NOTRUN -> [DMESG-WARN][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-bmg-1/igt@xe_survivability@runtime-survivability.html
    - bat-adlp-7:         NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-adlp-7/igt@xe_survivability@runtime-survivability.html
    - bat-atsm-2:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-atsm-2/igt@xe_survivability@runtime-survivability.html
    - bat-ptl-1:          NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-ptl-1/igt@xe_survivability@runtime-survivability.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-ptl-vm/igt@xe_survivability@runtime-survivability.html
    - bat-lnl-1:          NOTRUN -> [SKIP][11] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-lnl-1/igt@xe_survivability@runtime-survivability.html
    - bat-pvc-2:          NOTRUN -> [SKIP][12] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-pvc-2/igt@xe_survivability@runtime-survivability.html

  
New tests
---------

  New tests have been introduced between XEIGT_8598_BAT and XEIGTPW_13953_BAT:

### New IGT tests (2) ###

  * igt@xe_survivability@i2c-functionality:
    - Statuses : 2 pass(s) 10 skip(s)
    - Exec time: [0.0, 2.15] s

  * igt@xe_survivability@runtime-survivability:
    - Statuses : 2 dmesg-warn(s) 10 skip(s)
    - Exec time: [0.0, 4.36] s

  



Build changes
-------------

  * IGT: IGT_8598 -> IGTPW_13953
  * Linux: xe-3994-de43fe70c436c359e7478a5532d873f87357cb4e -> xe-3995-894bc3ad572262b3c29e8cf0352adaa07275dbfc

  IGTPW_13953: 60fa312b4ed819fb456ce1305f57a62bd93bbf9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8598: 8598
  xe-3994-de43fe70c436c359e7478a5532d873f87357cb4e: de43fe70c436c359e7478a5532d873f87357cb4e
  xe-3995-894bc3ad572262b3c29e8cf0352adaa07275dbfc: 894bc3ad572262b3c29e8cf0352adaa07275dbfc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/index.html

--===============1535064368797676771==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_survivability: Add xe_survivability test (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154342/">https://patchwork.freedesktop.org/series/154342/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8598_BAT -&gt; XEIGTPW_13953_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13953_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13953_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13953_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_survivability@i2c-functionality (NEW):</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-lnl-2/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-ptl-2/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-dg2-oem2/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-adlp-vm/igt@xe_survivability@i2c-functionality.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability (NEW):</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-bmg-2/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-bmg-1/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a></li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-adlp-7/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-atsm-2/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-ptl-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-ptl-vm/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-lnl-1/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13953/bat-pvc-2/igt@xe_survivability@runtime-survivability.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8598_BAT and XEIGTPW_13953_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@xe_survivability@i2c-functionality:</p>
<ul>
<li>Statuses : 2 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 2.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s) 10 skip(s)</li>
<li>Exec time: [0.0, 4.36] s</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8598 -&gt; IGTPW_13953</li>
<li>Linux: xe-3994-de43fe70c436c359e7478a5532d873f87357cb4e -&gt; xe-3995-894bc3ad572262b3c29e8cf0352adaa07275dbfc</li>
</ul>
<p>IGTPW_13953: 60fa312b4ed819fb456ce1305f57a62bd93bbf9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8598: 8598<br />
  xe-3994-de43fe70c436c359e7478a5532d873f87357cb4e: de43fe70c436c359e7478a5532d873f87357cb4e<br />
  xe-3995-894bc3ad572262b3c29e8cf0352adaa07275dbfc: 894bc3ad572262b3c29e8cf0352adaa07275dbfc</p>

</body>
</html>

--===============1535064368797676771==--
