Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3904105A593
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 12:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869CF10E42E;
	Thu, 12 Mar 2026 12:35:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D5310E42E;
 Thu, 12 Mar 2026 12:35:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8506609019137685485=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel-ci=3A_Add_NVL_d?=
 =?utf-8?q?isplay_and_core_blocklists_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aditya Chauhan" <aditya.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Mar 2026 12:35:10 -0000
Message-ID: <177331891000.350678.142473921238765843@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260312074832.51575-1-aditya.chauhan@intel.com>
In-Reply-To: <20260312074832.51575-1-aditya.chauhan@intel.com>
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

--===============8506609019137685485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: Add NVL display and core blocklists (rev2)
URL   : https://patchwork.freedesktop.org/series/163030/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8798_BAT -> XEIGTPW_14742_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-atsm-2 

Known issues
------------

  Here are the changes found in XEIGTPW_14742_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7483])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8798/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14742/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][3] ([Intel XE#2229])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14742/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][4] ([Intel XE#7483]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8798/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14742/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][6] ([Intel XE#7249]) -> [DMESG-WARN][7] ([Intel XE#7433])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8798/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14742/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483


Build changes
-------------

  * IGT: IGT_8798 -> IGTPW_14742
  * Linux: xe-4704-169ea69ad8f2fb0a126608399386e4580bb2d0b0 -> xe-4705-a0e231ebb0df84f6febf147ee5fcaafd40c2dafe

  IGTPW_14742: 79ac3166394c85f863a54dedc6924af5e3328046 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8798: 8798
  xe-4704-169ea69ad8f2fb0a126608399386e4580bb2d0b0: 169ea69ad8f2fb0a126608399386e4580bb2d0b0
  xe-4705-a0e231ebb0df84f6febf147ee5fcaafd40c2dafe: a0e231ebb0df84f6febf147ee5fcaafd40c2dafe

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14742/index.html

--===============8506609019137685485==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: Add NVL display and core blocklists (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163030/">https://patchwork.freedesktop.org/series/163030/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14742/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14742/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8798_BAT -&gt; XEIGTPW_14742_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-atsm-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14742_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8798/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14742/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14742/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8798/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14742/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8798/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249">Intel XE#7249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14742/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8798 -&gt; IGTPW_14742</li>
<li>Linux: xe-4704-169ea69ad8f2fb0a126608399386e4580bb2d0b0 -&gt; xe-4705-a0e231ebb0df84f6febf147ee5fcaafd40c2dafe</li>
</ul>
<p>IGTPW_14742: 79ac3166394c85f863a54dedc6924af5e3328046 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8798: 8798<br />
  xe-4704-169ea69ad8f2fb0a126608399386e4580bb2d0b0: 169ea69ad8f2fb0a126608399386e4580bb2d0b0<br />
  xe-4705-a0e231ebb0df84f6febf147ee5fcaafd40c2dafe: a0e231ebb0df84f6febf147ee5fcaafd40c2dafe</p>

</body>
</html>

--===============8506609019137685485==--
