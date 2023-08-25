Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACA610E15D
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 18:39:37 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1c11d53221cso804874fac.2
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 11:39:37 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 18:36:15 +0000
Message-ID: <20230825183934.1271156-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/6] tests/kms_vrr: Modify kms_vrr to allow flicker
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

Do some cleanup in the kms_vrr test and add some optional command line
arguments to alter the target refresh rate for the test. This allows us
to profile VRR flicker on panels at the low end of the refresh range.

Sean Paul (6):
  tests/kms_vrr: Move fb0 and fb1 to an array
  tests/kms_vrr: Move vtest_ns into data_t
  tests/kms_vrr: Allow test rate to be altered from the command line
  tests/kms_vrr: Allow test duration to be specified from the command
    line
  tests/kms_vrr: Change the pattern displayed in the test
  test/kms_vrr: Add ability to flip static image for flicker profiling

 tests/kms_vrr.c | 138 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 92 insertions(+), 46 deletions(-)

-- 
Sean Paul, Software Engineer, Google / Chromium OS
