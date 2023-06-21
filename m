Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1247510E0B7
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 09:56:07 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 21 Jun 2023 09:55:50 +0000
Message-Id: <20230621095551.1823862-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] tests/intel-ci: Add xe_mmap & xe_create
 tests to f-f
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


Adding new tests to BATs:

igt@xe_create@create-engines-noleak
igt@xe_create@create-engines-leak
igt@xe_create@create-massive-size
igt@xe_mmap@bad-flags
igt@xe_mmap@bad-extensions
igt@xe_mmap@bad-object

Katarzyna Dec (1):
  tests/intel-ci: Add xe_mmap & xe_create tests to f-f

 tests/intel-ci/xe-fast-feedback.testlist | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.34.1
