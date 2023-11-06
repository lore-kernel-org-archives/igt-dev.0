Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1416832491430716321=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Mon, 06 Nov 2023 14:38:33 -0000
Message-ID: <169928151374.20422.4923397608414997748@emeril.freedesktop.org>
References: <20231106123518.588528-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231106123518.588528-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_s?=
 =?utf-8?q?tarting_with_=5BCI=2C1/9=5D_tests/i915/drm=5Ffdinfo=3A_Check_en?=
 =?utf-8?q?gine_info_is_supported?=
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
List-ID: <igt-dev@lists.freedesktop.org>

--===============1416832491430716321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/9] tests/i915/drm_fdinfo: Check engine info is supported
URL   : https://patchwork.freedesktop.org/series/126023/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7573_BAT -> XEIGTPW_10121_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10121_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10121_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_10121_BAT prevented too many machines from booting.

  Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7573 -> IGTPW_10121
  * Linux: xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2 -> xe-471-fc457bcc18109467961edc92c80b238009f6a9fb

  IGTPW_10121: 10121
  IGT_7573: 69485d223b256208614e9949a4a7e84bde52d5f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2: 58dfdb8dc78e5668f9891c798ec3191863c1e0d2
  xe-471-fc457bcc18109467961edc92c80b238009f6a9fb: fc457bcc18109467961edc92c80b238009f6a9fb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10121/index.html

--===============1416832491430716321==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/9] tests/i915/drm_fdinfo: Check engine info is supported</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126023/">https://patchwork.freedesktop.org/series/126023/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10121/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10121/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7573_BAT -&gt; XEIGTPW_10121_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10121_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10121_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_10121_BAT prevented too many machines from booting.</p>
<p>Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7573 -&gt; IGTPW_10121</li>
<li>Linux: xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2 -&gt; xe-471-fc457bcc18109467961edc92c80b238009f6a9fb</li>
</ul>
<p>IGTPW_10121: 10121<br />
  IGT_7573: 69485d223b256208614e9949a4a7e84bde52d5f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2: 58dfdb8dc78e5668f9891c798ec3191863c1e0d2<br />
  xe-471-fc457bcc18109467961edc92c80b238009f6a9fb: fc457bcc18109467961edc92c80b238009f6a9fb</p>

</body>
</html>

--===============1416832491430716321==--
