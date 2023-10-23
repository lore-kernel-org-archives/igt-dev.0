Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D7910E256
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 20:59:13 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-49369d29be3so1618023e0c.3
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 13:59:13 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 Oct 2023 20:56:30 +0000
Message-ID: <20231023205910.3556533-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 0/8] tests/kms_vrr: Modify kms_vrr to allow
 flicker profiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Second revision of the set. New version addresses the review comments
from Bhanu and adds a new maxmin subtest which alternates the rate
between max and min every frame.

Sean Paul (8):
  tests/kms_vrr: Move fb0 and fb1 to an array
  tests/kms_vrr: Move vtest_ns into data_t
  tests/kms_vrr: Allow test rate to be altered from the command line
  tests/kms_vrr: Allow test duration to be specified from the command
    line
  tests/kms_vrr: Change the pattern displayed in the test
  tests/kms_vrr: Add ability to flip static image for flicker profiling
  tests/kms_vrr: Allow for multiple rates in a test
  tests/kms_vrr: Add a max/min test to oscillate between rates

 tests/kms_vrr.c | 213 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 156 insertions(+), 57 deletions(-)

-- 
Sean Paul, Software Engineer, Google / Chromium OS
