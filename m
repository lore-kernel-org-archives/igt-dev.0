Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E43D609CE
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 10:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8B910E031;
	Wed, 27 Nov 2024 10:40:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FEB10E031;
 Wed, 27 Nov 2024 10:40:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9218646225755820870=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/gem=5Fctx=5Fper?=
 =?utf-8?q?sistence=3A_Wait_for_context_termination_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 Nov 2024 10:40:04 -0000
Message-ID: <173270400433.3666921.944906009940259492@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127094528.7041-1-krzysztof.niemiec@intel.com>
In-Reply-To: <20241127094528.7041-1-krzysztof.niemiec@intel.com>
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

--===============9218646225755820870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_ctx_persistence: Wait for context termination (rev4)
URL   : https://patchwork.freedesktop.org/series/140582/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8127_BAT -> XEIGTPW_12205_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12205_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12205_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12205_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@saturated-hostile:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-adlp-vf/igt@gem_ctx_persistence@saturated-hostile.html
    - bat-lnl-1:          NOTRUN -> [SKIP][2] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-lnl-1/igt@gem_ctx_persistence@saturated-hostile.html
    - bat-pvc-2:          NOTRUN -> [SKIP][3] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-pvc-2/igt@gem_ctx_persistence@saturated-hostile.html
    - bat-bmg-2:          NOTRUN -> [SKIP][4] +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-bmg-2/igt@gem_ctx_persistence@saturated-hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - bat-bmg-1:          NOTRUN -> [SKIP][5] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-bmg-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
    - bat-adlp-7:         NOTRUN -> [SKIP][6] +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-adlp-7/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
    - bat-lnl-2:          NOTRUN -> [SKIP][7] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-lnl-2/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_persistence@smoketest:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][8] +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-dg2-oem2/igt@gem_ctx_persistence@smoketest.html
    - bat-atsm-2:         NOTRUN -> [SKIP][9] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-atsm-2/igt@gem_ctx_persistence@smoketest.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12205_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#3517]) +2 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [PASS][12] -> [DMESG-WARN][13] ([Intel XE#3429]) +31 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][14] -> [FAIL][15] ([Intel XE#1861])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][16] -> [SKIP][17] ([Intel XE#455]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#3429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429
  [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8127 -> IGTPW_12205
  * Linux: xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198 -> xe-2283-441e225c838a29660f3f1c29cc2a617572e63099

  IGTPW_12205: c5546c541da260ba6ee3559ef1731707d5d5ed84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198: 739a2506c44a0be22cc842d2c625a05ed21c1198
  xe-2283-441e225c838a29660f3f1c29cc2a617572e63099: 441e225c838a29660f3f1c29cc2a617572e63099

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/index.html

--===============9218646225755820870==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_ctx_persistence: Wait for context termination (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140582/">https://patchwork.freedesktop.org/series/140582/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8127_BAT -&gt; XEIGTPW_12205_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12205_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12205_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12205_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-adlp-vf/igt@gem_ctx_persistence@saturated-hostile.html">SKIP</a> +2 other tests skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-lnl-1/igt@gem_ctx_persistence@saturated-hostile.html">SKIP</a> +2 other tests skip</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-pvc-2/igt@gem_ctx_persistence@saturated-hostile.html">SKIP</a> +2 other tests skip</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-bmg-2/igt@gem_ctx_persistence@saturated-hostile.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-bmg-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> +2 other tests skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-adlp-7/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> +2 other tests skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-lnl-2/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-dg2-oem2/igt@gem_ctx_persistence@smoketest.html">SKIP</a> +2 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-atsm-2/igt@gem_ctx_persistence@smoketest.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12205_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517">Intel XE#3517</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429">Intel XE#3429</a>) +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12205/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8127 -&gt; IGTPW_12205</li>
<li>Linux: xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198 -&gt; xe-2283-441e225c838a29660f3f1c29cc2a617572e63099</li>
</ul>
<p>IGTPW_12205: c5546c541da260ba6ee3559ef1731707d5d5ed84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198: 739a2506c44a0be22cc842d2c625a05ed21c1198<br />
  xe-2283-441e225c838a29660f3f1c29cc2a617572e63099: 441e225c838a29660f3f1c29cc2a617572e63099</p>

</body>
</html>

--===============9218646225755820870==--
