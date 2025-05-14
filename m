Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A51DC3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 19:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65FE10E6F2;
	Wed, 14 May 2025 19:24:38 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB52810E6F2;
 Wed, 14 May 2025 19:24:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3608913637892118661=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Replace_intel=5Fsysfs=5Fdeb?=
 =?utf-8?q?ugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 May 2025 19:24:36 -0000
Message-ID: <174725067695.80824.3669960345003653376@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250514175140.115033-1-peter.senna@linux.intel.com>
In-Reply-To: <20250514175140.115033-1-peter.senna@linux.intel.com>
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

--===============3608913637892118661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Replace intel_sysfs_debugfs
URL   : https://patchwork.freedesktop.org/series/149023/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8364_BAT -> XEIGTPW_13128_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13128_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13128_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 9)
------------------------------

  Additional (1): bat-bmg-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13128_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@intel_sysfs_debugfs@xe-base:
    - bat-bmg-1:          NOTRUN -> [SKIP][1] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@intel_sysfs_debugfs@xe-base.html

  * igt@intel_sysfs_debugfs@xe-forcewake:
    - bat-bmg-2:          [PASS][2] -> [SKIP][3] +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-bmg-2/igt@intel_sysfs_debugfs@xe-forcewake.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-2/igt@intel_sysfs_debugfs@xe-forcewake.html
    - bat-adlp-7:         [PASS][4] -> [SKIP][5] +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-adlp-7/igt@intel_sysfs_debugfs@xe-forcewake.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-adlp-7/igt@intel_sysfs_debugfs@xe-forcewake.html
    - bat-lnl-2:          [PASS][6] -> [SKIP][7] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-lnl-2/igt@intel_sysfs_debugfs@xe-forcewake.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-lnl-2/igt@intel_sysfs_debugfs@xe-forcewake.html
    - bat-dg2-oem2:       [PASS][8] -> [SKIP][9] +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-dg2-oem2/igt@intel_sysfs_debugfs@xe-forcewake.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-dg2-oem2/igt@intel_sysfs_debugfs@xe-forcewake.html
    - bat-atsm-2:         [PASS][10] -> [SKIP][11] +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-atsm-2/igt@intel_sysfs_debugfs@xe-forcewake.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-atsm-2/igt@intel_sysfs_debugfs@xe-forcewake.html

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-adlp-vf:        [PASS][12] -> [SKIP][13] +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-adlp-vf/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-adlp-vf/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
    - bat-lnl-1:          [PASS][14] -> [SKIP][15] +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-lnl-1/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-lnl-1/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
    - bat-pvc-2:          [PASS][16] -> [SKIP][17] +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-pvc-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-pvc-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13128_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-bmg-1:          NOTRUN -> [SKIP][18] ([Intel XE#2233])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-bmg-1:          NOTRUN -> [SKIP][19] ([Intel XE#2244])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-bmg-1:          NOTRUN -> [SKIP][20] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-bmg-1:          NOTRUN -> [SKIP][21] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-1:          NOTRUN -> [SKIP][22] ([Intel XE#2229])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-bmg-1:          NOTRUN -> [SKIP][23] ([Intel XE#1420])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-1:          NOTRUN -> [SKIP][24] ([Intel XE#2245])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-bmg-1:          NOTRUN -> [SKIP][25] ([Intel XE#2236])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-bmg-1:          NOTRUN -> [SKIP][26] ([Intel XE#3342])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-end:
    - bat-adlp-vf:        [PASS][27] -> [ABORT][28] ([Intel XE#3970])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-inval-end.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-inval-end.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8364 -> IGTPW_13128
  * Linux: xe-3086-2e72fd09b4fb0823282977f0717159e47328a533 -> xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961

  IGTPW_13128: 13128
  IGT_8364: 8364
  xe-3086-2e72fd09b4fb0823282977f0717159e47328a533: 2e72fd09b4fb0823282977f0717159e47328a533
  xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961: dd6a856541dd90fa4ef755783898fcfbea3b9961

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/index.html

--===============3608913637892118661==
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
<tr><td><b>Series:</b></td><td>Replace intel_sysfs_debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149023/">https://patchwork.freedesktop.org/series/149023/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8364_BAT -&gt; XEIGTPW_13128_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13128_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13128_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 9)</h2>
<p>Additional (1): bat-bmg-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13128_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-base:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@intel_sysfs_debugfs@xe-base.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-forcewake:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-bmg-2/igt@intel_sysfs_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-2/igt@intel_sysfs_debugfs@xe-forcewake.html">SKIP</a> +3 other tests skip</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-adlp-7/igt@intel_sysfs_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-adlp-7/igt@intel_sysfs_debugfs@xe-forcewake.html">SKIP</a> +3 other tests skip</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-lnl-2/igt@intel_sysfs_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-lnl-2/igt@intel_sysfs_debugfs@xe-forcewake.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-dg2-oem2/igt@intel_sysfs_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-dg2-oem2/igt@intel_sysfs_debugfs@xe-forcewake.html">SKIP</a> +3 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-atsm-2/igt@intel_sysfs_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-atsm-2/igt@intel_sysfs_debugfs@xe-forcewake.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-adlp-vf/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-adlp-vf/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">SKIP</a> +3 other tests skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-lnl-1/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-lnl-1/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">SKIP</a> +3 other tests skip</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-pvc-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-pvc-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13128_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-end:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-inval-end.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13128/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-inval-end.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8364 -&gt; IGTPW_13128</li>
<li>Linux: xe-3086-2e72fd09b4fb0823282977f0717159e47328a533 -&gt; xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961</li>
</ul>
<p>IGTPW_13128: 13128<br />
  IGT_8364: 8364<br />
  xe-3086-2e72fd09b4fb0823282977f0717159e47328a533: 2e72fd09b4fb0823282977f0717159e47328a533<br />
  xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961: dd6a856541dd90fa4ef755783898fcfbea3b9961</p>

</body>
</html>

--===============3608913637892118661==--
