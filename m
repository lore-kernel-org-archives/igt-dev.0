Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 28 May 2020 14:47:05 -0000
Message-ID: <159067722573.684.399283009623777264@emeril.freedesktop.org>
References: <20200528133835.5087-1-rohan.garg@collabora.com>
In-Reply-To: <20200528133835.5087-1-rohan.garg@collabora.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcGFuZnJv?=
 =?utf-8?q?st=3A_Test_labeling_functionality?=
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
To: Rohan Garg <rohan.garg@collabora.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: panfrost: Test labeling functionality
URL   : https://patchwork.freedesktop.org/series/77742/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8547 -> IGTPW_4619
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/index.html

Known issues
------------

  Here are the changes found in IGTPW_4619 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@client:
    - fi-bsw-nick:        [PASS][1] -> [INCOMPLETE][2] ([i915#1909])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/fi-bsw-nick/igt@i915_selftest@live@client.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/fi-bsw-nick/igt@i915_selftest@live@client.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [FAIL][3] ([i915#62]) -> [SKIP][4] ([fdo#109271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1909]: https://gitlab.freedesktop.org/drm/intel/issues/1909
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62


Participating hosts (50 -> 43)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5682 -> IGTPW_4619

  CI-20190529: 20190529
  CI_DRM_8547: 055c59085e117a2433d3862d645e049e30f3a2dc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4619: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/index.html
  IGT_5682: e5371a99a877be134c6ad5361a5f03843a66f775 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@panfrost_bo_label@clear-label
+igt@panfrost_bo_label@get-label
+igt@panfrost_bo_label@label-too-long
+igt@panfrost_bo_label@set-bad-handle
+igt@panfrost_bo_label@set-label

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
