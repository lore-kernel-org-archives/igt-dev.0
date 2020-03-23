Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 23 Mar 2020 07:49:57 -0000
Message-ID: <158494979723.9808.9192586856071333777@emeril.freedesktop.org>
References: <20200323064607.7041-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200323064607.7041-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fcreate=3A_Reverted_device_reopen_logic?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ctx_create: Reverted device reopen logic
URL   : https://patchwork.freedesktop.org/series/74958/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8172 -> IGTPW_4339
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/index.html

Known issues
------------

  Here are the changes found in IGTPW_4339 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bxt-dsi:         [PASS][1] -> [INCOMPLETE][2] ([fdo#103927] / [i915#656])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/fi-bxt-dsi/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-icl-u2:          [PASS][3] -> [FAIL][4] ([i915#976])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - {fi-ehl-1}:         [INCOMPLETE][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-ehl-1/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/fi-ehl-1/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (39 -> 41)
------------------------------

  Additional (8): fi-bsw-n3050 fi-hsw-peppy fi-snb-2520m fi-kbl-7500u fi-gdg-551 fi-skl-lmem fi-bsw-nick fi-snb-2600 
  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5526 -> IGTPW_4339

  CI-20190529: 20190529
  CI_DRM_8172: b53e00acaa550df13d601f258011b180013c5d38 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4339: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/index.html
  IGT_5526: f49ebeee9f54d6f23c60a842f75f65561d452ab0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4339/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
