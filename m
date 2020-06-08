Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 08 Jun 2020 09:26:01 -0000
Message-ID: <159160836114.14460.11514496133750463953@emeril.freedesktop.org>
References: <20200608085621.28382-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20200608085621.28382-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcontent=5Fprotection=3A?=
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
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_content_protection:
URL   : https://patchwork.freedesktop.org/series/78113/
State : success

== Summary ==

CI Bug Log - changes from IGT_5698 -> IGTPW_4655
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/index.html

Known issues
------------

  Here are the changes found in IGTPW_4655 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-kefka:       [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-icl-u2:          [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
#### Possible fixes ####

  * {igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1}:
    - fi-icl-u2:          [DMESG-WARN][5] ([i915#1982]) -> [PASS][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-kbl-x1275:       [DMESG-WARN][7] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][8] ([i915#62] / [i915#92]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-x1275:       [DMESG-WARN][9] ([i915#62] / [i915#92]) -> [DMESG-WARN][10] ([i915#62] / [i915#92] / [i915#95]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (48 -> 43)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (6): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5698 -> IGTPW_4655

  CI-20190529: 20190529
  CI_DRM_8599: 41ca9ea98b74c926c923e84931b9b4a4c3955e08 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4655: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/index.html
  IGT_5698: b6ba988cc22ccb02cf174b520d3d8d7bd4158d76 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_content_protection@hdcp-1_4
+igt@kms_content_protection@hdcp-2_2
-igt@kms_content_protection@atomic
-igt@kms_content_protection@atomic-dpms
-igt@kms_content_protection@content_type_change
-igt@kms_content_protection@legacy
-igt@kms_content_protection@lic
-igt@kms_content_protection@mei_interface
-igt@kms_content_protection@srm
-igt@kms_content_protection@type1
-igt@kms_content_protection@uevent

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
