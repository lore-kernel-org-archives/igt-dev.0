Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5833A6ECD9
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Nov 2021 15:54:37 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Fri, 19 Nov 2021 10:53:42 -0500
Message-ID: <20211119155344.2709274-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 0/2] test/amdgpu: Add multi-eDP support to
 ABM test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, harry.wentland@amd.com, Nicholas.Choi@amd.com, markyacoub@chromium.org
Cc: Mikita Lipski <mikita.lipski@amd.com>, Roman Li <romli@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

We recently enabled multiple-eDP support on amdgpu. As a result, this
patchset adds tests to cover this case.

Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Roman Li <romli@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>

Mikita Lipski (1):
  tests/amdgpu: Add multi-eDP support to ABM test

Roman Li (1):
  amdgpu/amd_abm: Double convergence timeout

 tests/amdgpu/amd_abm.c | 268 +++++++++++++++++++++++------------------
 1 file changed, 154 insertions(+), 114 deletions(-)

-- 
2.25.1
