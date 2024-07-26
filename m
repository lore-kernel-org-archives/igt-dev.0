Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C3AC3DA49
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 10:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BCA10E32A;
	Fri, 26 Jul 2024 10:14:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E96B10E32A;
 Fri, 26 Jul 2024 10:14:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4402030441547506309=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fexec=5Fthread?=
 =?utf-8?q?s=3A_decrease_number_of_batches_for_simulation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 26 Jul 2024 10:14:32 -0000
Message-ID: <172198887251.385581.3816999252578178369@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240726-xe_exec_threads_limit_simul-v1-1-4c3f6e8da448@intel.com>
In-Reply-To: <20240726-xe_exec_threads_limit_simul-v1-1-4c3f6e8da448@intel.com>
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

--===============4402030441547506309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_threads: decrease number of batches for simulation
URL   : https://patchwork.freedesktop.org/series/136557/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7939_BAT -> XEIGTPW_11474_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (6 -> 6)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11474_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_evict@evict-beng-small-multi-vm:
    - {bat-bmg-1}:        [DMESG-WARN][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7939/bat-bmg-1/igt@xe_evict@evict-beng-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11474/bat-bmg-1/igt@xe_evict@evict-beng-small-multi-vm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7939 -> IGTPW_11474

  IGTPW_11474: 11474
  IGT_7939: 7939
  xe-1671-edd84625d093bb52bfb1c0c6feb12cff308d81b7: edd84625d093bb52bfb1c0c6feb12cff308d81b7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11474/index.html

--===============4402030441547506309==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_threads: decrease number of batches for simulation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136557/">https://patchwork.freedesktop.org/series/136557/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11474/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11474/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7939_BAT -&gt; XEIGTPW_11474_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (6 -&gt; 6)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11474_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict@evict-beng-small-multi-vm:<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7939/bat-bmg-1/igt@xe_evict@evict-beng-small-multi-vm.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11474/bat-bmg-1/igt@xe_evict@evict-beng-small-multi-vm.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7939 -&gt; IGTPW_11474</li>
</ul>
<p>IGTPW_11474: 11474<br />
  IGT_7939: 7939<br />
  xe-1671-edd84625d093bb52bfb1c0c6feb12cff308d81b7: edd84625d093bb52bfb1c0c6feb12cff308d81b7</p>

</body>
</html>

--===============4402030441547506309==--
