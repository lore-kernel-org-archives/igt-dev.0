Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1176412AEFD
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jun 2022 08:01:50 +0000 (UTC)
From: Luca Coelho <luca@coelho.fi>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Jun 2022 10:42:36 +0300
Message-Id: <20220607074240.1202404-1-luca@coelho.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] tests/kms_sysfs_edid_timing: rework
 thresholds
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

From: Luca Coelho <luciano.coelho@intel.com>

Hi,

There were a few issues with the kms_sysfs_edid_timing test:

* The per connector threshold was too short;
* A warning was issued when the test should actually fail;
* The test description was cryptic;
* Total probing mean was proposed but not implemented.

Address all these issues by reworking the way we test the time it
takes to probe single connectors, mean of single connectors and add a
check for a mean of all connectors.

Please review.

--
Cheers,
Luca.

Luca Coelho (4):
  tests/kms_sysfs_edid_timing: increase max time thresholds
  tests/kms_sysfs_edid_timing: fail if probing a single connector takes
    too long
  tests/kms_sysfs_edid_timing: clarify test description and thresholds
  tests/kms_sysfs_edid_timing: add total mean assertion threshold

 tests/kms_sysfs_edid_timing.c | 48 +++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 19 deletions(-)

-- 
2.36.1
