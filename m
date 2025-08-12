Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7689ACA0EC4
	for <igt-dev@archiver.kernel.org>; Tue, 12 Aug 2025 15:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1651C10E03C;
	Tue, 12 Aug 2025 15:48:33 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAF110E03C;
 Tue, 12 Aug 2025 15:48:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7643956599970174138=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fvm=3A_Exte?=
 =?utf-8?q?nd_coverage_for_bind_with_invalid_flag?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christoph Manszewski" <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 12 Aug 2025 15:48:31 -0000
Message-ID: <175501371169.230491.16271289722152818334@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250812130142.37988-1-christoph.manszewski@intel.com>
In-Reply-To: <20250812130142.37988-1-christoph.manszewski@intel.com>
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

--===============7643956599970174138==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Extend coverage for bind with invalid flag
URL   : https://patchwork.freedesktop.org/series/152831/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8491_BAT -> XEIGTPW_13569_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13569_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8491/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13569/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8491 -> IGTPW_13569
  * Linux: xe-3524-27315c7bb830e06a1e63fe1fd656fda48365805c -> xe-3525-fa2a0dc7a379f3279cb68fc59e1b355e3530ae9e

  IGTPW_13569: 7ba7847870304158c8d039bde0d6ae35ced952d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8491: 8491
  xe-3524-27315c7bb830e06a1e63fe1fd656fda48365805c: 27315c7bb830e06a1e63fe1fd656fda48365805c
  xe-3525-fa2a0dc7a379f3279cb68fc59e1b355e3530ae9e: fa2a0dc7a379f3279cb68fc59e1b355e3530ae9e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13575/index.html

--===============7643956599970174138==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Extend coverage for bind with invalid flag</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152831/">https://patchwork.freedesktop.org/series/152831/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13575/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13575/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8491_BAT -&gt; XEIGTPW_13569_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13569_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8491/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13569/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8491 -&gt; IGTPW_13569</li>
<li>Linux: xe-3524-27315c7bb830e06a1e63fe1fd656fda48365805c -&gt; xe-3525-fa2a0dc7a379f3279cb68fc59e1b355e3530ae9e</li>
</ul>
<p>IGTPW_13569: 7ba7847870304158c8d039bde0d6ae35ced952d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8491: 8491<br />
  xe-3524-27315c7bb830e06a1e63fe1fd656fda48365805c: 27315c7bb830e06a1e63fe1fd656fda48365805c<br />
  xe-3525-fa2a0dc7a379f3279cb68fc59e1b355e3530ae9e: fa2a0dc7a379f3279cb68fc59e1b355e3530ae9e</p>

</body>
</html>

--===============7643956599970174138==--
