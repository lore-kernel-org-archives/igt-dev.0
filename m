Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2711B10E1D3
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 08:45:17 +0000 (UTC)
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 10:45:03 +0200
Message-Id: <20231114084504.159561-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 0/1] tests/kms_flip: add provision to
 ignore long HPDs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add provision to ignore long HPDs based on the IGNORE_LONG_HPD
environment variable in kms_flip tests

Vinod Govindapillai (1):
  tests/kms_flip: add possibility to ignore long HPDs

 tests/kms_flip.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.34.1
