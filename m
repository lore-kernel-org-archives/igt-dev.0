Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Jul 2020 10:17:06 -0000
Message-ID: <159437622666.20498.7235216047929814537@emeril.freedesktop.org>
References: <20200710093234.1438712-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200710093234.1438712-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/6=5D_lib/i915=3A_Report_unknown_dev?=
 =?utf-8?q?ice_as_the_future?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/6] lib/i915: Report unknown device as the future
URL   : https://patchwork.freedesktop.org/series/79336/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8725 -> IGTPW_4753
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/index.html

Known issues
------------

  Here are the changes found in IGTPW_4753 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-whl-u:           [PASS][1] -> [DMESG-WARN][2] ([i915#95])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/fi-whl-u/igt@i915_pm_backlight@basic-brightness.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/fi-whl-u/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-kefka:       [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-n3050:       [PASS][5] -> [DMESG-WARN][6] ([i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - fi-icl-u2:          [PASS][7] -> [DMESG-WARN][8] ([i915#1982]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-tgl-u2:          [PASS][9] -> [DMESG-WARN][10] ([i915#402])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/fi-tgl-u2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/fi-tgl-u2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  
#### Possible fixes ####

  * igt@core_auth@basic-auth:
    - fi-byt-j1900:       [DMESG-WARN][11] ([i915#1982]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/fi-byt-j1900/igt@core_auth@basic-auth.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/fi-byt-j1900/igt@core_auth@basic-auth.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-tgl-u2:          [INCOMPLETE][13] ([i915#1932] / [i915#2045]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/fi-tgl-u2/igt@i915_selftest@live@gem_contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/fi-tgl-u2/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-x1275:       [DMESG-WARN][15] ([i915#62] / [i915#92] / [i915#95]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/fi-kbl-x1275/igt@kms_busy@basic@flip.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/fi-kbl-x1275/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-icl-u2:          [DMESG-WARN][17] ([i915#1982]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-plain-flip@c-dsi1:
    - {fi-tgl-dsi}:       [DMESG-WARN][19] ([i915#1982]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/fi-tgl-dsi/igt@kms_flip@basic-plain-flip@c-dsi1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/fi-tgl-dsi/igt@kms_flip@basic-plain-flip@c-dsi1.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-kbl-x1275:       [DMESG-WARN][21] ([i915#1982] / [i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][22] ([i915#62] / [i915#92])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/fi-kbl-x1275/igt@gem_exec_suspend@basic-s3.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/fi-kbl-x1275/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-kbl-x1275:       [DMESG-WARN][23] ([i915#62] / [i915#92]) -> [DMESG-WARN][24] ([i915#62] / [i915#92] / [i915#95]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/fi-kbl-x1275/igt@kms_force_connector_basic@force-connector-state.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/fi-kbl-x1275/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-x1275:       [DMESG-WARN][25] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][26] ([i915#62] / [i915#92]) +6 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8725/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1932]: https://gitlab.freedesktop.org/drm/intel/issues/1932
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2045]: https://gitlab.freedesktop.org/drm/intel/issues/2045
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (40 -> 33)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5729 -> IGTPW_4753

  CI-20190529: 20190529
  CI_DRM_8725: 9f7e9d663d77cf702a3510d9ae9fbf37c813b759 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4753: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/index.html
  IGT_5729: a048d54f58dd70b07dbeb4541b273ec230ddb586 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_schedule@fairslice
+igt@gem_exec_schedule@fairslice-all
+igt@gem_exec_schedule@fair-flow
+igt@gem_exec_schedule@fair-flow-ping
+igt@gem_exec_schedule@fair-flow-share
+igt@gem_exec_schedule@fair-half
+igt@gem_exec_schedule@fair-next
+igt@gem_exec_schedule@fair-next-ping
+igt@gem_exec_schedule@fair-next-share
+igt@gem_exec_schedule@fair-none
+igt@gem_exec_schedule@fair-none-ping
+igt@gem_exec_schedule@fair-none-rrul
+igt@gem_exec_schedule@fair-none-share
+igt@gem_exec_schedule@fair-none-solo
+igt@gem_exec_schedule@fair-none-vip
+igt@gem_exec_schedule@fair-pace
+igt@gem_exec_schedule@fair-pace-ping
+igt@gem_exec_schedule@fair-pace-share
+igt@gem_exec_schedule@fair-pace-solo
+igt@gem_exec_schedule@fair-spare
+igt@gem_exec_schedule@fair-sync
+igt@gem_exec_schedule@fair-sync-solo
+igt@gem_exec_schedule@fair-sync-vip
+igt@gem_exec_schedule@fair-throttle
+igt@gem_exec_schedule@fair-throttle-rrul
+igt@gem_exec_schedule@fair-throttle-share
+igt@gem_exec_schedule@fair-throttle-solo
+igt@gem_exec_schedule@fair-throttle-vip
+igt@gem_softpin@active

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4753/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
