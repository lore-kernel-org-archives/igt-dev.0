Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 20 Mar 2020 10:17:19 -0000
Message-ID: <158469943976.11039.12518893838683761801@emeril.freedesktop.org>
References: <20200316160452.29636-1-lyude@redhat.com>
In-Reply-To: <20200316160452.29636-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL3Rl?=
 =?utf-8?q?sts/igt=5Fdescribe=3A_Use_=5F=5FFILE=5F=5F_in_JUST=5FC=5FOUTPUT?=
 =?utf-8?q?_and_DESCRIBE=5FALL=5FOUTPUT_=28rev2=29?=
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
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/tests/igt_describe: Use __FILE__ in JUST_C_OUTPUT and DESCRIBE_ALL_OUTPUT (rev2)
URL   : https://patchwork.freedesktop.org/series/74751/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8160 -> IGTPW_4328
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/index.html

Known issues
------------

  Here are the changes found in IGTPW_4328 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-skl-lmem:        [PASS][1] -> [DMESG-FAIL][2] ([i915#933])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][3] -> [FAIL][4] ([i915#323])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_prop_blob@basic:
    - fi-apl-guc:         [PASS][5] -> [FAIL][6] ([i915#1491])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/fi-apl-guc/igt@kms_prop_blob@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/fi-apl-guc/igt@kms_prop_blob@basic.html

  
  [i915#1491]: https://gitlab.freedesktop.org/drm/intel/issues/1491
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#933]: https://gitlab.freedesktop.org/drm/intel/issues/933


Participating hosts (37 -> 40)
------------------------------

  Additional (6): fi-bsw-n3050 fi-byt-j1900 fi-cfl-8109u fi-skl-6600u fi-bsw-nick fi-skl-6700k2 
  Missing    (3): fi-byt-clapper fi-byt-squawks fi-bsw-cyan 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5523 -> IGTPW_4328

  CI-20190529: 20190529
  CI_DRM_8160: 6ba1729e5025761ab74914f6b8aa3288f493e9c7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4328: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/index.html
  IGT_5523: cf6d524007ac51a7d5a48503ea3dd5f01fd4ebab @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
