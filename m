Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DF410E460
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 12:47:48 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 21 Jun 2023 12:47:36 +0000
Message-Id: <20230621124737.1827262-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/1] Add xe_mmap & xe_create tests to f-f
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

v2: Sort tests alphabetically

Katarzyna Dec (1):
  tests/intel-ci: Add xe_mmap & xe_create tests to f-f

 tests/intel-ci/xe-fast-feedback.testlist | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.34.1
