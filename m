Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6296890036758429496=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 15 Nov 2021 11:14:44 -0000
Message-ID: <163697488436.2946.1652702379712764970@emeril.freedesktop.org>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIElH?=
 =?utf-8?q?T_support_for_plane_color_management?=
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6296890036758429496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add IGT support for plane color management
URL   : https://patchwork.freedesktop.org/series/96895/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10881 -> IGTPW_6398
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/index.html

Participating hosts (40 -> 35)
------------------------------

  Additional (1): fi-snb-2520m 
  Missing    (6): fi-kbl-soraka bat-dg1-6 fi-tgl-u2 bat-dg1-5 fi-icl-u2 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_6398 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bsw-nick:        NOTRUN -> [SKIP][1] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/fi-bsw-nick/igt@kms_chamelium@dp-crc-fast.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-bsw-nick:        NOTRUN -> [SKIP][2] ([fdo#109271]) +55 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/fi-bsw-nick/igt@prime_vgem@basic-fence-flip.html

  * igt@runner@aborted:
    - fi-snb-2520m:       NOTRUN -> [FAIL][3] ([i915#2426])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/fi-snb-2520m/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_ringfill@basic-all:
    - fi-bsw-nick:        [DMESG-WARN][4] ([i915#3428]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10881/fi-bsw-nick/igt@gem_ringfill@basic-all.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/fi-bsw-nick/igt@gem_ringfill@basic-all.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6280 -> IGTPW_6398

  CI-20190529: 20190529
  CI_DRM_10881: ec2cf62da73ea8fd5f28c1a20468296bcae41d4a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6398: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/index.html
  IGT_6280: 246bfd31dba6bf184b26b170d91d72c90a54be6b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+++ 138 lines
--- 0 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/index.html

--===============6296890036758429496==
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
<tr><td><b>Series:</b></td><td>Add IGT support for plane color management</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/96895/">https://patchwork.freedesktop.org/series/96895/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10881 -&gt; IGTPW_6398</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/index.html</p>
<h2>Participating hosts (40 -&gt; 35)</h2>
<p>Additional (1): fi-snb-2520m <br />
  Missing    (6): fi-kbl-soraka bat-dg1-6 fi-tgl-u2 bat-dg1-5 fi-icl-u2 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6398 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/fi-bsw-nick/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/fi-bsw-nick/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +55 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/fi-snb-2520m/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_ringfill@basic-all:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10881/fi-bsw-nick/igt@gem_ringfill@basic-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/fi-bsw-nick/igt@gem_ringfill@basic-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6280 -&gt; IGTPW_6398</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10881: ec2cf62da73ea8fd5f28c1a20468296bcae41d4a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6398: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6398/index.html<br />
  IGT_6280: 246bfd31dba6bf184b26b170d91d72c90a54be6b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+++ 138 lines<br />
--- 0 lines</p>

</body>
</html>

--===============6296890036758429496==--
