Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 02 Jun 2020 13:28:35 -0000
Message-ID: <159110451599.21430.16907193078003383725@emeril.freedesktop.org>
References: <20200602101916.30459-1-petri.latvala@intel.com>
In-Reply-To: <20200602101916.30459-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Adapt_to_device-based_DRM_logging_changes?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: runner: Adapt to device-based DRM logging changes
URL   : https://patchwork.freedesktop.org/series/77912/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8571 -> IGTPW_4639
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4639/index.html

Known issues
------------

  Here are the changes found in IGTPW_4639 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-icl-u2:          [PASS][1] -> [DMESG-WARN][2] ([i915#289]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/fi-icl-u2/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4639/fi-icl-u2/igt@i915_module_load@reload.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-whl-u:           [PASS][3] -> [DMESG-WARN][4] ([i915#95]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/fi-whl-u/igt@i915_pm_backlight@basic-brightness.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4639/fi-whl-u/igt@i915_pm_backlight@basic-brightness.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([i915#1982]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/fi-tgl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4639/fi-tgl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-bsw-n3050:       [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4639/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-kbl-soraka:      [PASS][9] -> [DMESG-WARN][10] ([i915#1982])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4639/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-bsw-kefka:       [PASS][11] -> [DMESG-WARN][12] ([i915#1982])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4639/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-icl-guc:         [PASS][13] -> [DMESG-WARN][14] ([i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/fi-icl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4639/fi-icl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-kbl-x1275:       [PASS][15] -> [DMESG-WARN][16] ([i915#62] / [i915#92] / [i915#95]) +6 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/fi-kbl-x1275/igt@kms_force_connector_basic@force-connector-state.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4639/fi-kbl-x1275/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-x1275:       [PASS][17] -> [DMESG-WARN][18] ([i915#62] / [i915#92]) +20 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8571/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4639/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (50 -> 44)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5690 -> IGTPW_4639

  CI-20190529: 20190529
  CI_DRM_8571: 0536dff30eff69abcf6355bdd9b9fdf45a560099 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4639: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4639/index.html
  IGT_5690: bea881189520a9cccbb1c1cb454ac5b6fdaea40e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4639/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
