Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ED5EEA84E
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 21:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9DC10E282;
	Thu, 12 Feb 2026 21:19:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CA010E282;
 Thu, 12 Feb 2026 21:19:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0969379420111635766=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_test/intel/xe=5Fvm=3A_Add_o?=
 =?utf-8?q?vercommit_and_no=E2=80=91overcommit_handling_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Feb 2026 21:19:56 -0000
Message-ID: <177093119636.250801.4737197693089566480@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260212190305.804221-1-sobin.thomas@intel.com>
In-Reply-To: <20260212190305.804221-1-sobin.thomas@intel.com>
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

--===============0969379420111635766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

== Series Details ==

Series: test/intel/xe_vm: Add overcommit and no‑overcommit handling tests
URL   : https://patchwork.freedesktop.org/series/161557/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8753_BAT -> XEIGTPW_14547_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14547_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14547_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-dg2-oem2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14547_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_vm@large-split-binds-268435456:
    - bat-ptl-1:          [PASS][1] -> [SKIP][2] +13 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-ptl-1/igt@xe_vm@large-split-binds-268435456.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-ptl-1/igt@xe_vm@large-split-binds-268435456.html
    - bat-lnl-1:          [PASS][3] -> [SKIP][4] +13 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-lnl-1/igt@xe_vm@large-split-binds-268435456.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-lnl-1/igt@xe_vm@large-split-binds-268435456.html

  * igt@xe_vm@munmap-style-unbind-front:
    - bat-wcl-1:          [PASS][5] -> [SKIP][6] +13 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-wcl-1/igt@xe_vm@munmap-style-unbind-front.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-wcl-1/igt@xe_vm@munmap-style-unbind-front.html

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - bat-ptl-2:          [PASS][7] -> [SKIP][8] +13 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-ptl-2/igt@xe_vm@munmap-style-unbind-one-partial.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-ptl-2/igt@xe_vm@munmap-style-unbind-one-partial.html
    - bat-adlp-vm:        [PASS][9] -> [SKIP][10] +13 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-adlp-vm/igt@xe_vm@munmap-style-unbind-one-partial.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-adlp-vm/igt@xe_vm@munmap-style-unbind-one-partial.html

  * igt@xe_vm@munmap-style-unbind-userptr-front:
    - bat-adlp-7:         [PASS][11] -> [SKIP][12] +13 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-adlp-7/igt@xe_vm@munmap-style-unbind-userptr-front.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-adlp-7/igt@xe_vm@munmap-style-unbind-userptr-front.html

  * igt@xe_vm@munmap-style-unbind-userptr-one-partial:
    - bat-lnl-2:          [PASS][13] -> [SKIP][14] +13 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-lnl-2/igt@xe_vm@munmap-style-unbind-userptr-one-partial.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-lnl-2/igt@xe_vm@munmap-style-unbind-userptr-one-partial.html

  * igt@xe_vm@shared-pte-page:
    - bat-ptl-vm:         [PASS][15] -> [SKIP][16] +13 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-ptl-vm/igt@xe_vm@shared-pte-page.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-ptl-vm/igt@xe_vm@shared-pte-page.html
    - bat-wcl-2:          [PASS][17] -> [SKIP][18] +13 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-wcl-2/igt@xe_vm@shared-pte-page.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-wcl-2/igt@xe_vm@shared-pte-page.html

  


Build changes
-------------

  * IGT: IGT_8753 -> IGTPW_14547
  * Linux: xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92 -> xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2

  IGTPW_14547: 14547
  IGT_8753: 8753
  xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92: ec995dd44a15b6f448fa3c7c8967f71443264b92
  xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2: 8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/index.html

--===============0969379420111635766==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


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
<tr><td><b>Series:</b></td><td>test/intel/xe_vm: Add overcommit and no‑overcommit handling tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161557/">https://patchwork.freedesktop.org/series/161557/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8753_BAT -&gt; XEIGTPW_14547_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14547_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14547_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14547_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_vm@large-split-binds-268435456:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-ptl-1/igt@xe_vm@large-split-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-ptl-1/igt@xe_vm@large-split-binds-268435456.html">SKIP</a> +13 other tests skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-lnl-1/igt@xe_vm@large-split-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-lnl-1/igt@xe_vm@large-split-binds-268435456.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-front:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-wcl-1/igt@xe_vm@munmap-style-unbind-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-wcl-1/igt@xe_vm@munmap-style-unbind-front.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-ptl-2/igt@xe_vm@munmap-style-unbind-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-ptl-2/igt@xe_vm@munmap-style-unbind-one-partial.html">SKIP</a> +13 other tests skip</li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-adlp-vm/igt@xe_vm@munmap-style-unbind-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-adlp-vm/igt@xe_vm@munmap-style-unbind-one-partial.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-front:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-adlp-7/igt@xe_vm@munmap-style-unbind-userptr-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-adlp-7/igt@xe_vm@munmap-style-unbind-userptr-front.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-one-partial:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-lnl-2/igt@xe_vm@munmap-style-unbind-userptr-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-lnl-2/igt@xe_vm@munmap-style-unbind-userptr-one-partial.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pte-page:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-ptl-vm/igt@xe_vm@shared-pte-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-ptl-vm/igt@xe_vm@shared-pte-page.html">SKIP</a> +13 other tests skip</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8753/bat-wcl-2/igt@xe_vm@shared-pte-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14547/bat-wcl-2/igt@xe_vm@shared-pte-page.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8753 -&gt; IGTPW_14547</li>
<li>Linux: xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92 -&gt; xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2</li>
</ul>
<p>IGTPW_14547: 14547<br />
  IGT_8753: 8753<br />
  xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92: ec995dd44a15b6f448fa3c7c8967f71443264b92<br />
  xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2: 8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2</p>

</body>
</html>

--===============0969379420111635766==--
