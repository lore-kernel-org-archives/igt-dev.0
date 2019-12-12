Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Dec 2019 08:12:06 -0000
Message-ID: <157613832692.32008.3938750070622433821@emeril.freedesktop.org>
References: <20191211204636.16222-1-sunpeng.li@amd.com>
In-Reply-To: <20191211204636.16222-1-sunpeng.li@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_t?=
 =?utf-8?q?ests/kms=5Fcolor=3A_Add_10bpc_frame_buffer_parameterization_to_?=
 =?utf-8?q?subtests?=
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
To: sunpeng.li@amd.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_color: Add 10bpc frame buffer parameterization to subtests
URL   : https://patchwork.freedesktop.org/series/70782/
State : failure

== Summary ==

ERROR! This series introduces new undocumented tests:

kms_color@pipe-A-10bpc-ctm-0-25
kms_color@pipe-A-10bpc-ctm-0-5
kms_color@pipe-A-10bpc-ctm-0-75
kms_color@pipe-A-10bpc-ctm-blue-to-red
kms_color@pipe-A-10bpc-ctm-green-to-red
kms_color@pipe-A-10bpc-ctm-max
kms_color@pipe-A-10bpc-ctm-negative
kms_color@pipe-A-10bpc-ctm-red-to-blue
kms_color@pipe-A-10bpc-degamma
kms_color@pipe-A-10bpc-gamma
kms_color@pipe-A-10bpc-legacy-gamma
kms_color@pipe-B-10bpc-ctm-0-25
kms_color@pipe-B-10bpc-ctm-0-5
kms_color@pipe-B-10bpc-ctm-0-75
kms_color@pipe-B-10bpc-ctm-blue-to-red
kms_color@pipe-B-10bpc-ctm-green-to-red
kms_color@pipe-B-10bpc-ctm-max
kms_color@pipe-B-10bpc-ctm-negative
kms_color@pipe-B-10bpc-ctm-red-to-blue
kms_color@pipe-B-10bpc-degamma
kms_color@pipe-B-10bpc-gamma
kms_color@pipe-B-10bpc-legacy-gamma
kms_color@pipe-C-10bpc-ctm-0-25
kms_color@pipe-C-10bpc-ctm-0-5
kms_color@pipe-C-10bpc-ctm-0-75
kms_color@pipe-C-10bpc-ctm-blue-to-red
kms_color@pipe-C-10bpc-ctm-green-to-red
kms_color@pipe-C-10bpc-ctm-max
kms_color@pipe-C-10bpc-ctm-negative
kms_color@pipe-C-10bpc-ctm-red-to-blue
kms_color@pipe-C-10bpc-degamma
kms_color@pipe-C-10bpc-gamma
kms_color@pipe-C-10bpc-legacy-gamma
kms_color@pipe-D-10bpc-ctm-0-25
kms_color@pipe-D-10bpc-ctm-0-5
kms_color@pipe-D-10bpc-ctm-0-75
kms_color@pipe-D-10bpc-ctm-blue-to-red
kms_color@pipe-D-10bpc-ctm-green-to-red
kms_color@pipe-D-10bpc-ctm-max
kms_color@pipe-D-10bpc-ctm-negative
kms_color@pipe-D-10bpc-ctm-red-to-blue
kms_color@pipe-D-10bpc-degamma
kms_color@pipe-D-10bpc-gamma
kms_color@pipe-D-10bpc-legacy-gamma
kms_color@pipe-E-10bpc-ctm-0-25
kms_color@pipe-E-10bpc-ctm-0-5
kms_color@pipe-E-10bpc-ctm-0-75
kms_color@pipe-E-10bpc-ctm-blue-to-red
kms_color@pipe-E-10bpc-ctm-green-to-red
kms_color@pipe-E-10bpc-ctm-max
kms_color@pipe-E-10bpc-ctm-negative
kms_color@pipe-E-10bpc-ctm-red-to-blue
kms_color@pipe-E-10bpc-degamma
kms_color@pipe-E-10bpc-gamma
kms_color@pipe-E-10bpc-legacy-gamma
kms_color@pipe-F-10bpc-ctm-0-25
kms_color@pipe-F-10bpc-ctm-0-5
kms_color@pipe-F-10bpc-ctm-0-75
kms_color@pipe-F-10bpc-ctm-blue-to-red
kms_color@pipe-F-10bpc-ctm-green-to-red
kms_color@pipe-F-10bpc-ctm-max
kms_color@pipe-F-10bpc-ctm-negative
kms_color@pipe-F-10bpc-ctm-red-to-blue
kms_color@pipe-F-10bpc-degamma
kms_color@pipe-F-10bpc-gamma
kms_color@pipe-F-10bpc-legacy-gamma

Can you document them as per the requirement in the [CONTRIBUTING.md]?

[Documentation] has more details on how to do this.

Here are few examples:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/0316695d03aa46108296b27f3982ec93200c7a6e
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/443cc658e1e6b492ee17bf4f4d891029eb7a205d

Thanks in advance!

[CONTRIBUTING.md]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/CONTRIBUTING.md#L19
[Documentation]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe

Other than that, pipeline status: SUCCESS.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/87844 for the overview.

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/87844
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
