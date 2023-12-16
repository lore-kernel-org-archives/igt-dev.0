Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH i-g-t 0/4] Add tests for solid fill planes
Date: Fri, 15 Dec 2023 16:40:20 -0800
Message-ID: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev.lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>, Simon Ser <contact@emersion.fr>, Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20231216004020.xPf0LhNIXCLtqFQ5kMN4GIxc4Wo0poVr8n_0aQTtKQ4@z>

Add corresponding IGT tests for solid fill planes [1] in kms_atomic.

This series does the following:
- Fix a dangling pipe_crc_t object in the plane_immutable_zpos test
- Add solid_fill and pixel_source to IGT plane property enum
- Change IGT commit behavior to support solid fill planes
- Add dynamic subtests for solid fill planes in kms_atomic

[1] https://patchwork.freedesktop.org/series/110283/

---
Jessica Zhang (4):
      tests/kms_atomic: Free pipe_crc object
      lib: Add support for solid_fill and pixel_source plane properties
      tests/kms_atomic: Add solid fill plane subtest
      tests/kms_atomic: Add subtest for solid fill cursor planes

 lib/igt_kms.c      |  37 ++++++++++++++--
 lib/igt_kms.h      |   4 ++
 tests/kms_atomic.c | 122 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 160 insertions(+), 3 deletions(-)
---
base-commit: ced22f8bf4263ff395dc852c86b682e62a7a1c1b
change-id: 20230810-solid-fill-5acd9b2d42fc

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>
