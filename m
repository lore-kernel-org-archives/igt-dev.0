Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 26 Feb 2020 16:11:54 -0000
Message-ID: <158273351405.21009.11481242621068310009@emeril.freedesktop.org>
References: <20200226125746.12249-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200226125746.12249-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Refresh_map-fixed-invalidate*_subtests?=
 =?utf-8?q?_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_userptr_blits: Refresh map-fixed-invalidate* subtests (rev3)
URL   : https://patchwork.freedesktop.org/series/73405/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8007 -> IGTPW_4227
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/index.html

Known issues
------------

  Here are the changes found in IGTPW_4227 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([CI#94] / [i915#402]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
#### Possible fixes ####

  * igt@gem_flink_basic@bad-flink:
    - fi-tgl-y:           [DMESG-WARN][3] ([CI#94] / [i915#402]) -> [PASS][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/fi-tgl-y/igt@gem_flink_basic@bad-flink.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/fi-tgl-y/igt@gem_flink_basic@bad-flink.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (48 -> 45)
------------------------------

  Additional (1): fi-tgl-u 
  Missing    (4): fi-byt-squawks fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5469 -> IGTPW_4227

  CI-20190529: 20190529
  CI_DRM_8007: 8dbfb8dcfb623026de73fdb617785f507064af89 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4227: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/index.html
  IGT_5469: 4f875016eb1ebc211b8aadb280ae16c7e6cdc8ba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
