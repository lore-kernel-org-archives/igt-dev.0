Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 05 Mar 2020 16:34:51 -0000
Message-ID: <158342609191.17235.4220513481784436698@emeril.freedesktop.org>
References: <20200305152256.13716-1-daniel.t.mrzyglod@intel.com>
In-Reply-To: <20200305152256.13716-1-daniel.t.mrzyglod@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliOiBt?=
 =?utf-8?q?ove_upper=5F32=5Fbits=28=29_and_lower=5F32=5Fbits=28=29_to_libr?=
 =?utf-8?q?ary_=28rev2=29?=
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
To: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: move upper_32_bits() and lower_32_bits() to library (rev2)
URL   : https://patchwork.freedesktop.org/series/74199/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8069 -> IGTPW_4265
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/index.html

Known issues
------------

  Here are the changes found in IGTPW_4265 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [PASS][1] -> [DMESG-WARN][2] ([i915#44])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][3] ([fdo#111096] / [i915#323]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44


Participating hosts (48 -> 44)
------------------------------

  Additional (3): fi-blb-e6850 fi-ivb-3770 fi-skl-6600u 
  Missing    (7): fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-tgl-y fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5494 -> IGTPW_4265

  CI-20190529: 20190529
  CI_DRM_8069: c8673f18b2ca3b343206c2ba65d6f1020a93614c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4265: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/index.html
  IGT_5494: 48fa8e88bffa16b141d8c29a93638d795a2652c8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
