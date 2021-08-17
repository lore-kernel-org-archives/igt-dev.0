Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452FF6E197
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 13:43:52 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Tue, 17 Aug 2021 16:45:21 +0300
Message-Id: <20210817134523.1390961-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/kms_plane_*: Reset display before
 execution tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Reset display before executing tests. This way display state is
in known state even if the previous test has failed.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>

Mika Kahola (2):
  tests/kms_plane_multiple: Reset display before testing
  tests/kms_plane_lowres: Reset display before testing

 tests/kms_plane_lowres.c   | 2 ++
 tests/kms_plane_multiple.c | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.27.0
