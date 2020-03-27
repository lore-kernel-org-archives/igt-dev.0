Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Mar 2020 01:11:03 -0000
Message-ID: <158527146342.17236.10940625854336255083@emeril.freedesktop.org>
References: <20200327002301.16434-1-swathi.dhanavanthri@intel.com>
In-Reply-To: <20200327002301.16434-1-swathi.dhanavanthri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliOiBz?=
 =?utf-8?q?ync_i915=5Fpciids=2Eh_with_kernel_=28rev6=29?=
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
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: sync i915_pciids.h with kernel (rev6)
URL   : https://patchwork.freedesktop.org/series/50957/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8197 -> IGTPW_4361
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/index.html

Known issues
------------

  Here are the changes found in IGTPW_4361 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bxt-dsi:         [PASS][1] -> [INCOMPLETE][2] ([fdo#103927] / [i915#656])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/fi-bxt-dsi/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@requests:
    - fi-icl-u2:          [PASS][3] -> [INCOMPLETE][4] ([fdo#109644] / [fdo#110464])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/fi-icl-u2/igt@i915_selftest@live@requests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/fi-icl-u2/igt@i915_selftest@live@requests.html
    - fi-icl-guc:         [PASS][5] -> [INCOMPLETE][6] ([fdo#109644] / [fdo#110464])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/fi-icl-guc/igt@i915_selftest@live@requests.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/fi-icl-guc/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [PASS][7] -> [DMESG-WARN][8] ([IGT#4])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bwr-2160:        [INCOMPLETE][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/fi-bwr-2160/igt@i915_selftest@live@late_gt_pm.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/fi-bwr-2160/igt@i915_selftest@live@late_gt_pm.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109644]: https://bugs.freedesktop.org/show_bug.cgi?id=109644
  [fdo#110464]: https://bugs.freedesktop.org/show_bug.cgi?id=110464
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656


Participating hosts (44 -> 36)
------------------------------

  Additional (2): fi-kbl-r fi-kbl-7500u 
  Missing    (10): fi-bdw-5557u fi-hsw-4200u fi-byt-j1900 fi-hsw-peppy fi-byt-squawks fi-bsw-cyan fi-skl-lmem fi-bdw-samus fi-bsw-nick fi-skl-6600u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5539 -> IGTPW_4361

  CI-20190529: 20190529
  CI_DRM_8197: 198bab1da198b9d6d5c36d52704dd4abab6e81a8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4361: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/index.html
  IGT_5539: e7aae12e37771a8b7796ba252574eb832a5839c3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
