Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5481BE77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 16:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152F210E2DB;
	Mon,  6 Jan 2025 16:28:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E7410E908;
 Mon,  6 Jan 2025 16:28:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_Remove_redundant_hotplug?=
 =?utf-8?q?_detection_assertion?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 06 Jan 2025 16:28:21 -0000
Message-ID: <173618090110.278991.6034238205156540620@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106094259.931356-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250106094259.931356-1-ramanaidu.naladala@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

== Series Details ==

Series: Remove redundant hotplug detection assertion
URL   : https://patchwork.freedesktop.org/series/143141/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15908_full -> IGTPW_12391_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/index.html

Participating hosts (12 -> 10)
------------------------------

  Missing    (2): pig-kbl-iris shard-glk-0 

Known issues
------------

  Here are the changes found in IGTPW_12391_full that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_module_load@load:
    - shard-glk:          ([PASS][1], [PASS][2], [DMESG-WARN][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25]) ([i915#118]) -> ([PASS][26], [PASS][27], [PASS][28], [PASS][29], [PASS][30], [PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk5/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk6/igt@i915_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk5/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk2/igt@i915_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk1/igt@i915_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk3/igt@i915_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk4/igt@i915_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk1/igt@i915_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk3/igt@i915_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk5/igt@i915_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk3/igt@i915_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk2/igt@i915_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk1/igt@i915_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk2/igt@i915_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk1/igt@i915_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk7/igt@i915_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk8/igt@i915_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk7/igt@i915_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk6/igt@i915_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk9/igt@i915_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk7/igt@i915_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk9/igt@i915_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk6/igt@i915_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk7/igt@i915_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15908/shard-glk9/igt@i915_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk6/igt@i915_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk7/igt@i915_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk5/igt@i915_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk1/igt@i915_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk2/igt@i915_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk4/igt@i915_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk1/igt@i915_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk7/igt@i915_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk2/igt@i915_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk1/igt@i915_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk7/igt@i915_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk8/igt@i915_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk6/igt@i915_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk5/igt@i915_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk8/igt@i915_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk4/igt@i915_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk3/igt@i915_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk8/igt@i915_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk9/igt@i915_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk6/igt@i915_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk3/igt@i915_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk5/igt@i915_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk9/igt@i915_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk3/igt@i915_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/shard-glk9/igt@i915_module_load@load.html

  
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8174 -> IGTPW_12391
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_15908: f06efdfad9d0e9f5cb74404ac98e1a5b3b246567 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12391: b30c905319556f0f67860479cd2d1f5c6586bab5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12391/index.html
