Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 12 May 2020 12:00:31 -0000
Message-ID: <158928483133.18140.9475125616967809631@emeril.freedesktop.org>
References: <20200512102447.9249-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200512102447.9249-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Fnop=3A_=22headless=22_requires_submicrosecond_prec?=
 =?utf-8?q?ision?=
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

Series: tests/gem_exec_nop: "headless" requires submicrosecond precision
URL   : https://patchwork.freedesktop.org/series/77186/
State : success

== Summary ==

CI Bug Log - changes from IGT_5651 -> IGTPW_4560
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/index.html

Known issues
------------

  Here are the changes found in IGTPW_4560 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-cfl-8109u:       [PASS][1] -> [INCOMPLETE][2] ([i915#1874])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/fi-cfl-8109u/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/fi-cfl-8109u/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][3] -> [DMESG-FAIL][4] ([i915#165])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-skl-guc:         [INCOMPLETE][5] ([i915#1874]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/fi-skl-guc/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/fi-skl-guc/igt@i915_selftest@live@execlists.html
    - fi-skl-6700k2:      [INCOMPLETE][7] ([i915#1874]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/fi-skl-6700k2/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/fi-skl-6700k2/igt@i915_selftest@live@execlists.html

  
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1874]: https://gitlab.freedesktop.org/drm/intel/issues/1874


Participating hosts (50 -> 43)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5651 -> IGTPW_4560

  CI-20190529: 20190529
  CI_DRM_8467: 1a0f0c378117fc90f421a692698ad85963ecdb3a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4560: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/index.html
  IGT_5651: e54e2642f1967ca3c488db32264607df670d1dfb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
