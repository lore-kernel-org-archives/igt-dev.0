Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30C5C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 17:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDAA10F3A9;
	Thu, 21 Mar 2024 17:22:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D73510F3A9;
 Thu, 21 Mar 2024 17:22:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2701814419775635007=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Add_mocs_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Mar 2024 17:22:14 -0000
Message-ID: <171104173464.941104.11322456978440211903@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321151637.3320911-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20240321151637.3320911-1-janga.rahul.kumar@intel.com>
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

--===============2701814419775635007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add mocs tests
URL   : https://patchwork.freedesktop.org/series/131430/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7774_BAT -> XEIGTPW_10873_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10873_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10873_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-dg2-oem2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10873_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_debugfs@gt:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7774/bat-pvc-2/igt@xe_debugfs@gt.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10873/bat-pvc-2/igt@xe_debugfs@gt.html
    - bat-atsm-2:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7774/bat-atsm-2/igt@xe_debugfs@gt.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10873/bat-atsm-2/igt@xe_debugfs@gt.html
    - bat-adlp-7:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7774/bat-adlp-7/igt@xe_debugfs@gt.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10873/bat-adlp-7/igt@xe_debugfs@gt.html

  


Build changes
-------------

  * IGT: IGT_7774 -> IGTPW_10873
  * Linux: xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2 -> xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31

  IGTPW_10873: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10873/index.html
  IGT_7774: 7774
  xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2: 9ae91289c9ed219b53a3fbd25be9f414651ce4f2
  xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31: 0cd99ca612f004f19c35f4966a584f0a729bbc31

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10873/index.html

--===============2701814419775635007==
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
<tr><td><b>Series:</b></td><td>Add mocs tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131430/">https://patchwork.freedesktop.org/series/131430/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10873/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10873/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7774_BAT -&gt; XEIGTPW_10873_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10873_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10873_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10873_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_debugfs@gt:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7774/bat-pvc-2/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10873/bat-pvc-2/igt@xe_debugfs@gt.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7774/bat-atsm-2/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10873/bat-atsm-2/igt@xe_debugfs@gt.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7774/bat-adlp-7/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10873/bat-adlp-7/igt@xe_debugfs@gt.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7774 -&gt; IGTPW_10873</li>
<li>Linux: xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2 -&gt; xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31</li>
</ul>
<p>IGTPW_10873: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10873/index.html<br />
  IGT_7774: 7774<br />
  xe-971-9ae91289c9ed219b53a3fbd25be9f414651ce4f2: 9ae91289c9ed219b53a3fbd25be9f414651ce4f2<br />
  xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31: 0cd99ca612f004f19c35f4966a584f0a729bbc31</p>

</body>
</html>

--===============2701814419775635007==--
