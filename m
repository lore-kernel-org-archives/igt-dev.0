Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E479DC47258
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 15:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8305910F310;
	Wed, 31 Jan 2024 15:24:55 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59EF10F310;
 Wed, 31 Jan 2024 15:24:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3768642608507570071=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Fill_block-copy_test_gap_for_u?=
 =?utf-8?q?naligned_sizes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 31 Jan 2024 15:24:54 -0000
Message-ID: <170671469467.878359.2636476131237024879@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240131132558.208971-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240131132558.208971-1-zbigniew.kempczynski@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============3768642608507570071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fill block-copy test gap for unaligned sizes (rev2)
URL   : https://patchwork.freedesktop.org/series/129362/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7699_BAT -> XEIGTPW_10612_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10612_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10612_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10612_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [PASS][1] -> [SKIP][2] +9 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][3] ([Intel XE#455]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_psr@psr-cursor-plane-move}:
    - bat-adlp-7:         [PASS][5] -> [SKIP][6] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10612_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-set-prop:
    - bat-adlp-7:         [PASS][7] -> [SKIP][8] ([i915#6077]) +30 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-adlp-7:         [PASS][9] -> [SKIP][10] ([Intel XE#540]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-7:         [PASS][11] -> [SKIP][12] ([Intel XE#829]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-adlp-7:         [PASS][13] -> [SKIP][14] ([Intel XE#780])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_prop_blob@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_prop_blob@basic.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][15] ([Intel XE#1033]) -> [SKIP][16] ([Intel XE#783])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7699 -> IGTPW_10612
  * Linux: xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457 -> xe-709-5838c317a0ee7374a555d6a030748e6f0f6638f8

  IGTPW_10612: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10612/index.html
  IGT_7699: 7699
  xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457: c655e0fd28045dbaa581d04bf7cc266eec1c3457
  xe-709-5838c317a0ee7374a555d6a030748e6f0f6638f8: 5838c317a0ee7374a555d6a030748e6f0f6638f8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/index.html

--===============3768642608507570071==
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
<tr><td><b>Series:</b></td><td>Fill block-copy test gap for unaligned sizes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129362/">https://patchwork.freedesktop.org/series/129362/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7699_BAT -&gt; XEIGTPW_10612_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10612_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10612_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10612_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_psr@psr-cursor-plane-move}:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10612_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_prop_blob@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10612/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7699 -&gt; IGTPW_10612</li>
<li>Linux: xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457 -&gt; xe-709-5838c317a0ee7374a555d6a030748e6f0f6638f8</li>
</ul>
<p>IGTPW_10612: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10612/index.html<br />
  IGT_7699: 7699<br />
  xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457: c655e0fd28045dbaa581d04bf7cc266eec1c3457<br />
  xe-709-5838c317a0ee7374a555d6a030748e6f0f6638f8: 5838c317a0ee7374a555d6a030748e6f0f6638f8</p>

</body>
</html>

--===============3768642608507570071==--
