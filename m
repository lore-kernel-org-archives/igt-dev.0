Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Mar 2020 05:51:23 -0000
Message-ID: <158528828334.17237.17809331051438981890@emeril.freedesktop.org>
References: <20200327050435.8531-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200327050435.8531-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fnop=3A-Fixed_Crash_issue_seen_on_few_platform?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_nop:-Fixed Crash issue seen on few platform (rev3)
URL   : https://patchwork.freedesktop.org/series/75145/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8198 -> IGTPW_4363
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/index.html

Known issues
------------

  Here are the changes found in IGTPW_4363 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@requests:
    - fi-icl-u2:          [PASS][1] -> [INCOMPLETE][2] ([fdo#109644] / [fdo#110464])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/fi-icl-u2/igt@i915_selftest@live@requests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/fi-icl-u2/igt@i915_selftest@live@requests.html

  
#### Warnings ####

  * igt@gem_linear_blits@basic:
    - fi-glk-dsi:         [SKIP][3] ([fdo#109271]) -> [INCOMPLETE][4] ([i915#58] / [k.org#198133])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/fi-glk-dsi/igt@gem_linear_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/fi-glk-dsi/igt@gem_linear_blits@basic.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109644]: https://bugs.freedesktop.org/show_bug.cgi?id=109644
  [fdo#110464]: https://bugs.freedesktop.org/show_bug.cgi?id=110464
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (40 -> 42)
------------------------------

  Additional (5): fi-hsw-peppy fi-gdg-551 fi-ivb-3770 fi-kbl-7560u fi-snb-2600 
  Missing    (3): fi-byt-clapper fi-bsw-cyan fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5539 -> IGTPW_4363

  CI-20190529: 20190529
  CI_DRM_8198: a421a6390d4a76e4df310bfe9adb78dde7207249 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4363: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/index.html
  IGT_5539: e7aae12e37771a8b7796ba252574eb832a5839c3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
