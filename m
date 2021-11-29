Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDB26E06B
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Nov 2021 19:57:24 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Mon, 29 Nov 2021 14:56:54 -0500
Message-ID: <20211129195659.1865321-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 0/5] tests/amdgpu: Improve amd_color
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: harry.wentland@amd.com, markyacoub@google.com, nicholas.choi@amd.com, hayden.goodfellow@amd.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

amd_color is part of our CI, and it covers an essential part of our
display core features. This patchset improves amd_color by fixing issues
in some ASICs (i.e., making it more generic across AMD devices) and
expanding the coverage scenarios. Finally, this is part of making all of
our internal tests available in the upstream.

Qingqing Zhuo (1):
  tests/amdgpu: Fix test init error on Baffin

Stylon Wang (4):
  tests/amdgpu: Test plane level CTM and degamma
  tests/amdgpu: Test combination of plane degamma and CRTC regamma
  test/amdgpu: Add test description to amd_max_bpc and amd_color tests
  tests/amdgpu: fix gamma test on plane and crtc

 lib/igt_kms.c            |  10 +
 lib/igt_kms.h            |   3 +
 tests/amdgpu/amd_color.c | 500 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 513 insertions(+)

-- 
2.25.1
