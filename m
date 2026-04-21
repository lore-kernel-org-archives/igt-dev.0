Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD91F94CA7
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 20:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5239910ED8C;
	Tue, 21 Apr 2026 20:21:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D280910E21B;
 Tue, 21 Apr 2026 20:21:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0561039017976814260=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fvm=3A_Add_?=
 =?utf-8?q?support_for_overcommit_tests_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas, Sobin" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 Apr 2026 20:21:21 -0000
Message-ID: <177680288185.482719.17603318312565987729@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260420150001.270588-1-sobin.thomas@intel.com>
In-Reply-To: <20260420150001.270588-1-sobin.thomas@intel.com>
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

--===============0561039017976814260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Add support for overcommit tests (rev7)
URL   : https://patchwork.freedesktop.org/series/163579/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8865_BAT -> XEIGTPW_15022_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  Additional (1): bat-ptl-vm 
  Missing    (1): bat-bmg-1 

Known issues
------------

  Here are the changes found in XEIGTPW_15022_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7483])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-vm:         NOTRUN -> [SKIP][3] ([Intel XE#5764]) +10 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_balancer@twice-parallel-basic:
    - bat-ptl-vm:         NOTRUN -> [SKIP][4] ([Intel XE#7482]) +17 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-ptl-vm/igt@xe_exec_balancer@twice-parallel-basic.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-ptl-vm:         NOTRUN -> [SKIP][5] ([Intel XE#5775])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-ptl-vm:         NOTRUN -> [SKIP][6] ([Intel XE#5776])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-ptl-vm/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-vm:         NOTRUN -> [SKIP][7] ([Intel XE#5777] / [Intel XE#7590])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-ptl-vm:         NOTRUN -> [SKIP][8] ([Intel XE#5771] / [Intel XE#7590])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-vm:         NOTRUN -> [SKIP][9] ([Intel XE#5780] / [Intel XE#7590])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][10] ([Intel XE#7483]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590


Build changes
-------------

  * IGT: IGT_8865 -> IGTPW_15022
  * Linux: xe-4921-898b5aa235c5b269d6c745fd84270b296aa75469 -> xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169

  IGTPW_15022: 9d650b233260626857dc5de0eb3db7289854dadd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8865: 1c23bc1bdf01bf0ded2344cb217d7fe88de3b726 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4921-898b5aa235c5b269d6c745fd84270b296aa75469: 898b5aa235c5b269d6c745fd84270b296aa75469
  xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169: 33d3b65ec51f2bddafa26a80249e26c78435f169

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/index.html

--===============0561039017976814260==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Add support for overcommit tests (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163579/">https://patchwork.freedesktop.org/series/163579/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8865_BAT -&gt; XEIGTPW_15022_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>Additional (1): bat-ptl-vm <br />
  Missing    (1): bat-bmg-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15022_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-basic:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-ptl-vm/igt@xe_exec_balancer@twice-parallel-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-ptl-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15022/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8865 -&gt; IGTPW_15022</li>
<li>Linux: xe-4921-898b5aa235c5b269d6c745fd84270b296aa75469 -&gt; xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169</li>
</ul>
<p>IGTPW_15022: 9d650b233260626857dc5de0eb3db7289854dadd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8865: 1c23bc1bdf01bf0ded2344cb217d7fe88de3b726 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4921-898b5aa235c5b269d6c745fd84270b296aa75469: 898b5aa235c5b269d6c745fd84270b296aa75469<br />
  xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169: 33d3b65ec51f2bddafa26a80249e26c78435f169</p>

</body>
</html>

--===============0561039017976814260==--
