Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 31 Jan 2020 20:39:25 -0000
Message-ID: <158050316549.13120.16424412124000337964@emeril.freedesktop.org>
References: <20200131201554.12832-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200131201554.12832-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/4=5D_lib/igt=5Fkms=3A_Return_t?=
 =?utf-8?q?he_first_overlay_not_the_last_one?=
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/4] lib/igt_kms: Return the first overlay not the last one
URL   : https://patchwork.freedesktop.org/series/72844/
State : failure

== Summary ==

ERROR! This series introduces new undocumented tests:

kms_legacy_colorkey@dst-colorkey-C8
kms_legacy_colorkey@dst-colorkey-RGB565
kms_legacy_colorkey@dst-colorkey-XBGR2101010
kms_legacy_colorkey@dst-colorkey-XRGB8888
kms_legacy_colorkey@dst-colorkey-YUYV
kms_legacy_colorkey@src-colorkey-C8
kms_legacy_colorkey@src-colorkey-RGB565
kms_legacy_colorkey@src-colorkey-XBGR2101010
kms_legacy_colorkey@src-colorkey-XRGB8888
kms_legacy_colorkey@src-colorkey-YUYV
kms_legacy_colorkey_basic@invalid-plane-id
kms_legacy_colorkey_basic@pipe-A-dst-colorkey
kms_legacy_colorkey_basic@pipe-A-invalid-flags
kms_legacy_colorkey_basic@pipe-A-no-colorkey
kms_legacy_colorkey_basic@pipe-A-src-colorkey
kms_legacy_colorkey_basic@pipe-B-dst-colorkey
kms_legacy_colorkey_basic@pipe-B-invalid-flags
kms_legacy_colorkey_basic@pipe-B-no-colorkey
kms_legacy_colorkey_basic@pipe-B-src-colorkey
kms_legacy_colorkey_basic@pipe-C-dst-colorkey
kms_legacy_colorkey_basic@pipe-C-invalid-flags
kms_legacy_colorkey_basic@pipe-C-no-colorkey
kms_legacy_colorkey_basic@pipe-C-src-colorkey
kms_legacy_colorkey_basic@pipe-D-dst-colorkey
kms_legacy_colorkey_basic@pipe-D-invalid-flags
kms_legacy_colorkey_basic@pipe-D-no-colorkey
kms_legacy_colorkey_basic@pipe-D-src-colorkey
kms_legacy_colorkey_basic@pipe-E-dst-colorkey
kms_legacy_colorkey_basic@pipe-E-invalid-flags
kms_legacy_colorkey_basic@pipe-E-no-colorkey
kms_legacy_colorkey_basic@pipe-E-src-colorkey
kms_legacy_colorkey_basic@pipe-F-dst-colorkey
kms_legacy_colorkey_basic@pipe-F-invalid-flags
kms_legacy_colorkey_basic@pipe-F-no-colorkey
kms_legacy_colorkey_basic@pipe-F-src-colorkey

Can you document them as per the requirement in the [CONTRIBUTING.md]?

[Documentation] has more details on how to do this.

Here are few examples:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/0316695d03aa46108296b27f3982ec93200c7a6e
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/443cc658e1e6b492ee17bf4f4d891029eb7a205d

Thanks in advance!

[CONTRIBUTING.md]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/CONTRIBUTING.md#L19
[Documentation]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe

Other than that, pipeline status: SUCCESS.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/103848 for the overview.

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/103848
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
