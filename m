Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 May 2021 07:31:37 -0000
Message-ID: <162037269708.10707.17401812658750055120@emeril.freedesktop.org>
References: <1620368197-5750-1-git-send-email-jigar.bhatt@intel.com>
In-Reply-To: <1620368197-5750-1-git-send-email-jigar.bhatt@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdC9r?=
 =?utf-8?q?md=5Fhdmi=3A_Test_case_for_new_HDMI_property?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1962840734=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jigar Bhatt <jigar.bhatt@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1962840734==
Content-Type: multipart/alternative;
 boundary="===============9046661704620765699=="

--===============9046661704620765699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test/kmd_hdmi: Test case for new HDMI property
URL   : https://patchwork.freedesktop.org/series/89852/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10056 -> IGTPW_5789
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5789/index.html

Known issues
------------

  Here are the changes found in IGTPW_5789 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][1] ([fdo#109271]) +23 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5789/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5789/fi-kbl-soraka/igt@amdgpu/amd_prime@amd-to-i915.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][3] ([i915#2283])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5789/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283


Participating hosts (43 -> 39)
------------------------------

  Missing    (4): fi-ilk-m540 fi-dg1-1 fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6080 -> IGTPW_5789

  CI-20190529: 20190529
  CI_DRM_10056: ba8b31d76abe45a6e486ba8cb73c53d147984e28 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5789: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5789/index.html
  IGT_6080: 1c450c3d4df19cf1087b8ccff3b62cb51addacae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_hdmi@hdmi_vendor_product

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5789/index.html

--===============9046661704620765699==
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
<tr><td><b>Series:</b></td><td>test/kmd_hdmi: Test case for new HDMI property</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89852/">https://patchwork.freedesktop.org/series/89852/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5789/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5789/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10056 -&gt; IGTPW_5789</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5789/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5789 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5789/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_prime@amd-to-i915:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5789/fi-kbl-soraka/igt@amdgpu/amd_prime@amd-to-i915.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5789/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 39)</h2>
<p>Missing    (4): fi-ilk-m540 fi-dg1-1 fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6080 -&gt; IGTPW_5789</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10056: ba8b31d76abe45a6e486ba8cb73c53d147984e28 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5789: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5789/index.html<br />
  IGT_6080: 1c450c3d4df19cf1087b8ccff3b62cb51addacae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_hdmi@hdmi_vendor_product</p>

</body>
</html>

--===============9046661704620765699==--

--===============1962840734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1962840734==--
