Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 02 Apr 2020 10:31:50 -0000
Message-ID: <158582351044.24295.4971134816324417139@emeril.freedesktop.org>
References: <20200402081558.389129-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200402081558.389129-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15/perf=3A_update_TGL_configs?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/i915/perf: update TGL configs
URL   : https://patchwork.freedesktop.org/series/75403/
State : success

== Summary ==

CI Bug Log - changes from IGT_5558 -> IGTPW_4395
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/index.html

Known issues
------------

  Here are the changes found in IGTPW_4395 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@requests:
    - fi-icl-u2:          [PASS][1] -> [INCOMPLETE][2] ([i915#1505] / [i915#1581])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/fi-icl-u2/igt@i915_selftest@live@requests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/fi-icl-u2/igt@i915_selftest@live@requests.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-kbl-x1275:       [DMESG-WARN][3] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][4] ([i915#62] / [i915#92]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-kbl-x1275:       [DMESG-WARN][5] ([i915#62] / [i915#92]) -> [DMESG-WARN][6] ([i915#62] / [i915#92] / [i915#95]) +6 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/fi-kbl-x1275/igt@kms_force_connector_basic@force-connector-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/fi-kbl-x1275/igt@kms_force_connector_basic@force-connector-state.html

  
  [i915#1505]: https://gitlab.freedesktop.org/drm/intel/issues/1505
  [i915#1581]: https://gitlab.freedesktop.org/drm/intel/issues/1581
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (51 -> 41)
------------------------------

  Missing    (10): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ivb-3770 fi-pnv-d510 fi-kbl-7560u fi-byt-clapper fi-bsw-nick fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5558 -> IGTPW_4395

  CI-20190529: 20190529
  CI_DRM_8236: 698ce59acca37b93bfcdee6899504be3eb113097 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4395: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/index.html
  IGT_5558: 3b55a816300d80bc5e0b995cd41ee8c8649a1ea2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
