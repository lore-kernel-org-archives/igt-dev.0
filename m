Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23186C48260
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 15:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85B410EBB0;
	Fri, 16 Feb 2024 15:21:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F5D10EBB0;
 Fri, 16 Feb 2024 15:21:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5480058587598113246=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_drm-uapi/xe=3A_Remove_unused_f?=
 =?utf-8?q?lags?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 16 Feb 2024 15:21:17 -0000
Message-ID: <170809687769.37759.14403002311756721135@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240216141847.7-1-francois.dugast@intel.com>
In-Reply-To: <20240216141847.7-1-francois.dugast@intel.com>
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

--===============5480058587598113246==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm-uapi/xe: Remove unused flags
URL   : https://patchwork.freedesktop.org/series/130005/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7716_BAT -> XEIGTPW_10686_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10686_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10686_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10686_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - bat-pvc-2:          [PASS][1] -> [SKIP][2] +9 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10686/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  


Build changes
-------------

  * IGT: IGT_7716 -> IGTPW_10686
  * Linux: xe-789-55724f2a1075fcace79fd49ea0c2b7b5600d7ba8 -> xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7

  IGTPW_10686: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10686/index.html
  IGT_7716: 7716
  xe-789-55724f2a1075fcace79fd49ea0c2b7b5600d7ba8: 55724f2a1075fcace79fd49ea0c2b7b5600d7ba8
  xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7: 2b0582c5f6c84859252ce7da41fc8829c88e17a7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10686/index.html

--===============5480058587598113246==
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
<tr><td><b>Series:</b></td><td>drm-uapi/xe: Remove unused flags</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130005/">https://patchwork.freedesktop.org/series/130005/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10686/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10686/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7716_BAT -&gt; XEIGTPW_10686_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10686_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10686_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10686_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7716/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10686/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7716 -&gt; IGTPW_10686</li>
<li>Linux: xe-789-55724f2a1075fcace79fd49ea0c2b7b5600d7ba8 -&gt; xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7</li>
</ul>
<p>IGTPW_10686: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10686/index.html<br />
  IGT_7716: 7716<br />
  xe-789-55724f2a1075fcace79fd49ea0c2b7b5600d7ba8: 55724f2a1075fcace79fd49ea0c2b7b5600d7ba8<br />
  xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7: 2b0582c5f6c84859252ce7da41fc8829c88e17a7</p>

</body>
</html>

--===============5480058587598113246==--
