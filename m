Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D399BC4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 20:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483F510FC12;
	Wed, 24 Apr 2024 20:49:13 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0A610FC12;
 Wed, 24 Apr 2024 20:49:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5760911775955680444=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Add_mocs_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 24 Apr 2024 20:49:11 -0000
Message-ID: <171399175138.1648713.11568917620771102305@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424200856.1194881-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20240424200856.1194881-1-janga.rahul.kumar@intel.com>
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

--===============5760911775955680444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add mocs tests (rev2)
URL   : https://patchwork.freedesktop.org/series/131430/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7823_BAT -> XEIGTPW_11064_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11064_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11064_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11064_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_debugfs@gt:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/bat-pvc-2/igt@xe_debugfs@gt.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11064/bat-pvc-2/igt@xe_debugfs@gt.html
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/bat-dg2-oem2/igt@xe_debugfs@gt.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11064/bat-dg2-oem2/igt@xe_debugfs@gt.html
    - bat-atsm-2:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/bat-atsm-2/igt@xe_debugfs@gt.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11064/bat-atsm-2/igt@xe_debugfs@gt.html
    - bat-adlp-7:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/bat-adlp-7/igt@xe_debugfs@gt.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11064/bat-adlp-7/igt@xe_debugfs@gt.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_debugfs@gt:
    - {bat-lnl-1}:        [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/bat-lnl-1/igt@xe_debugfs@gt.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11064/bat-lnl-1/igt@xe_debugfs@gt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7823 -> IGTPW_11064
  * Linux: xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7 -> xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8

  IGTPW_11064: 11064
  IGT_7823: 61121a2eac4d191ad9f3077948c8ba19686fbb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7: 7ec59c2fcb5419f0d48b7918200be26e360388e7
  xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8: ad654139fd5a7773f0310b5f745c105cdba520e8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11064/index.html

--===============5760911775955680444==
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
<tr><td><b>Series:</b></td><td>Add mocs tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131430/">https://patchwork.freedesktop.org/series/131430/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11064/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11064/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7823_BAT -&gt; XEIGTPW_11064_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11064_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11064_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11064_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_debugfs@gt:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/bat-pvc-2/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11064/bat-pvc-2/igt@xe_debugfs@gt.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/bat-dg2-oem2/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11064/bat-dg2-oem2/igt@xe_debugfs@gt.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/bat-atsm-2/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11064/bat-atsm-2/igt@xe_debugfs@gt.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/bat-adlp-7/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11064/bat-adlp-7/igt@xe_debugfs@gt.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_debugfs@gt:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/bat-lnl-1/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11064/bat-lnl-1/igt@xe_debugfs@gt.html">FAIL</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7823 -&gt; IGTPW_11064</li>
<li>Linux: xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7 -&gt; xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8</li>
</ul>
<p>IGTPW_11064: 11064<br />
  IGT_7823: 61121a2eac4d191ad9f3077948c8ba19686fbb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7: 7ec59c2fcb5419f0d48b7918200be26e360388e7<br />
  xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8: ad654139fd5a7773f0310b5f745c105cdba520e8</p>

</body>
</html>

--===============5760911775955680444==--
