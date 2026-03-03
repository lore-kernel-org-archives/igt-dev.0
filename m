Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB00AEC1450
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 13:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763FE10E817;
	Tue,  3 Mar 2026 13:50:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9E910E820;
 Tue,  3 Mar 2026 13:50:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5467909826516142255=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_test/intel/xe=5Fvm=3A_Add?=
 =?utf-8?q?_overcommit_and_no=E2=80=91overcommit_handling_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Mar 2026 13:50:12 -0000
Message-ID: <177254581268.310425.8566869665169460421@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260302140010.1009564-1-sobin.thomas@intel.com>
In-Reply-To: <20260302140010.1009564-1-sobin.thomas@intel.com>
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

--===============5467909826516142255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

== Series Details ==

Series: test/intel/xe_vm: Add overcommit and no‑overcommit handling tests (rev2)
URL   : https://patchwork.freedesktop.org/series/161557/
State : success

== Summary ==

CI Bug Log - changes from IGT_8777 -> IGTPW_14644
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/index.html

Participating hosts (39 -> 35)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (5): bat-dg2-8 bat-atsm-1 bat-dg1-6 bat-dg2-13 bat-arls-5 

Known issues
------------

  Here are the changes found in IGTPW_14644 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-pnv-d510:        NOTRUN -> [ABORT][1] ([i915#15780])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/fi-pnv-d510/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][2] -> [DMESG-FAIL][3] ([i915#12061]) +1 other test dmesg-fail
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8777/bat-mtlp-8/igt@i915_selftest@live.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [PASS][4] -> [DMESG-FAIL][5] ([i915#12061]) +1 other test dmesg-fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8777/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - fi-pnv-d510:        NOTRUN -> [SKIP][6] +29 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [DMESG-FAIL][7] ([i915#12061]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8777/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#15780]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15780


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8777 -> IGTPW_14644
  * Linux: CI_DRM_18075 -> CI_DRM_18082

  CI-20190529: 20190529
  CI_DRM_18075: 3fe1f7a93adf8e03fb044eb57b63394afe6e139c @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18082: 3594e3a9ce7d4ad237f43ff907e9744446108603 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14644: 43a879a6a0ea96a31910b9d4140989eb91bda70c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/index.html

--===============5467909826516142255==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


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
<tr><td><b>Series:</b></td><td>test/intel/xe_vm: Add overcommit and no‑overcommit handling tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161557/">https://patchwork.freedesktop.org/series/161557/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8777 -&gt; IGTPW_14644</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/index.html</p>
<h2>Participating hosts (39 -&gt; 35)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (5): bat-dg2-8 bat-atsm-1 bat-dg1-6 bat-dg2-13 bat-arls-5 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14644 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/fi-pnv-d510/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15780">i915#15780</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8777/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8777/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8777/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14644/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8777 -&gt; IGTPW_14644</li>
<li>Linux: CI_DRM_18075 -&gt; CI_DRM_18082</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18075: 3fe1f7a93adf8e03fb044eb57b63394afe6e139c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18082: 3594e3a9ce7d4ad237f43ff907e9744446108603 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14644: 43a879a6a0ea96a31910b9d4140989eb91bda70c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5467909826516142255==--
