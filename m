Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 15 Feb 2020 03:14:30 -0000
Message-ID: <158173647093.4011.12466207013953293584@emeril.freedesktop.org>
References: <20200215023331.41469-1-dale.b.stimson@intel.com>
In-Reply-To: <20200215023331.41469-1-dale.b.stimson@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbW1pb19i?=
 =?utf-8?q?ase_via_debugfs_infrastructure_+_gem=5Fctx=5Fisolation?=
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
To: Dale B Stimson <dale.b.stimson@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: mmio_base via debugfs infrastructure + gem_ctx_isolation
URL   : https://patchwork.freedesktop.org/series/73493/
State : success

== Summary ==

CI Bug Log - changes from IGT_5443 -> IGTPW_4159
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/index.html

Known issues
------------

  Here are the changes found in IGTPW_4159 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [INCOMPLETE][1] ([i915#45]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/fi-byt-j1900/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [INCOMPLETE][3] ([i915#45]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5443/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#937]: https://gitlab.freedesktop.org/drm/intel/issues/937


Participating hosts (50 -> 39)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (12): fi-ilk-m540 fi-hsw-4200u fi-hsw-peppy fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-cfl-8109u fi-skl-6700k2 fi-skl-lmem fi-bdw-samus fi-skl-6600u fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5443 -> IGTPW_4159

  CI-20190529: 20190529
  CI_DRM_7943: 865945b076689b2e99bc1c52fad95cec05cff9ed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4159: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/index.html
  IGT_5443: 1f357d4ec46aa5dd3484c33255b88391ecbd33a5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4159/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
