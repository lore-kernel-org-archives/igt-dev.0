Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6748132809844160723=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Mon, 02 Oct 2023 13:52:00 -0000
Message-ID: <169625472019.3205.15989401231609395881@emeril.freedesktop.org>
References: <20231002104846.21443-1-nirmoy.das@intel.com>
In-Reply-To: <20231002104846.21443-1-nirmoy.das@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/in?=
 =?utf-8?q?tel/gem=5Feio=3A_Skip_stress_test_on_BCS0_for_MTL?=
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

--===============6748132809844160723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_eio: Skip stress test on BCS0 for MTL
URL   : https://patchwork.freedesktop.org/series/124517/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7508_BAT -> XEIGTPW_9900_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_9900_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#480]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7508/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9900/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * IGT: IGT_7508 -> IGTPW_9900
  * Linux: xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313 -> xe-405-13da205daec6272347232c2c523fe8cde8b67e35

  IGTPW_9900: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/index.html
  IGT_7508: f366406b05ca6b3d16eaa734a91e0833bd159f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313: 22fcf2404f56a8e7aea6734298e0b2b265136313
  xe-405-13da205daec6272347232c2c523fe8cde8b67e35: 13da205daec6272347232c2c523fe8cde8b67e35

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9900/index.html

--===============6748132809844160723==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_eio: Skip stress test on BCS0 for MTL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124517/">https://patchwork.freedesktop.org/series/124517/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9900/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9900/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7508_BAT -&gt; XEIGTPW_9900_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9900_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7508/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9900/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7508 -&gt; IGTPW_9900</li>
<li>Linux: xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313 -&gt; xe-405-13da205daec6272347232c2c523fe8cde8b67e35</li>
</ul>
<p>IGTPW_9900: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/index.html<br />
  IGT_7508: f366406b05ca6b3d16eaa734a91e0833bd159f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313: 22fcf2404f56a8e7aea6734298e0b2b265136313<br />
  xe-405-13da205daec6272347232c2c523fe8cde8b67e35: 13da205daec6272347232c2c523fe8cde8b67e35</p>

</body>
</html>

--===============6748132809844160723==--
