Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFE010E122
 for <igt-dev@lists.freedesktop.org>; Mon, 23 May 2022 10:21:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 May 2022 15:48:05 +0530
Message-Id: <20220523101807.3627871-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] Skip if current & requested BPC doesn't match
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

Due to the limitaion of port clock values supported for HDMI, i915
may downgrade the requested bpc for a given mode.

So, skip the subtest if the requested bpc doesn't match with crtc's
current bpc.

Bhanuprakash Modem (2):
  tests/kms_hdr: Skip if current & requested BPC doesn't match
  tests/kms_color: Skip if current & requested BPC doesn't match

 tests/kms_color.c | 22 +++++++++++++++++++++-
 tests/kms_hdr.c   | 43 +++++++++++++++++++++++++++++++++++++------
 2 files changed, 58 insertions(+), 7 deletions(-)

--
2.35.1
