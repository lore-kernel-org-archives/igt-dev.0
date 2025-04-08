Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11407C369A5
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 22:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65BA10E7A2;
	Tue,  8 Apr 2025 22:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GFpUhw2C";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9645710E791
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 22:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PjwvWuFPTQLSK024lbPPi/0PsmpqtNRR6Qb7jsF7qmk=; b=GFpUhw2CMtpOzzMwkwj7GFCQrU
 Ns19dVnrxUwSyKkN+CCkkAwt1GHNv8Q0ixBM6UTBOKnKGYHkBQ0gR9CkZvzywLDA26ORTMGA9YCDe
 SAm1rv/j0ddJ7W5qaox65mJCECYFd/pPTPjjjwgERsmVKEjhKoOGPuzCr1yjTcwfyY6lWyh1u8m6L
 cNZ66qAJDfqVhJVR+44djUTaYgq5DdqG3ZWprlCc7HqxmOzRIR08smkA4V48Y3Vj3mbOyDdBh/wd9
 KblY8BynVj/Q8oAHEJV/1GXWCg+PqhxxrfQ5oyYu14aK9B6lfWRilk/Yv+TIgBtsWmP4fAoAoR3kk
 +ss5gvXw==;
Received: from [187.57.129.172] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u2HYB-00DbcU-St; Wed, 09 Apr 2025 00:36:12 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v7 0/4] tests/kms_async_flips: Create subtest for overlay
 planes
Date: Tue,  8 Apr 2025 19:36:00 -0300
Message-ID: <20250408223604.289309-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

This patchset creates a subtest for overlay planes. This is supported by amdgpu
and is merged in the kernel:

https://lore.kernel.org/lkml/173948734065.719858.7405160715916126757.b4-ty@linaro.org/

v7:
 - igt_has_drm_cap() asserts only if it was a bad fd. The rest is up to the
 caller to assert or require.
 - we now have different errors for when the cap is not supported by the driver,
 and when the cap doesn't exist in the kernel

v6:
 - Added missing `test_init_ops()` for "overlay-atomic" test
 - Reworked `test_init_fbs()`: it destroys all buffers when the modifier
 changes, and recreate then if they are need for the next test. It also destroys
 overlay buffers if they are not needed anymore

v5:
 - Added a new patch "lib/ioctl_wrappers: let the caller handle capability check
   result" by Melissa Wen
 - This patch solved an issue that the test was exiting instead of skipping when
   the driver did not support ATOMIC_ASYNC_PAGE_FLIP
 - test_finish() is now called test_init_ops() and is called in the beginning of
   every test. This was done because some asserts prevented the test to reach
   the final of the run_test() function.
 - Fixed a typo to correctly set the overlay fb to the overlay plane
 - Added code to remove the overlay fb by the end of the test
 - Fixed a bug that test_init_fbs() was skipping the fb creation for overlay
   planes
 - Fixed require_overlay_flip_support() by changing the fb to be flipped with
   the async flip

v4:
 - Created a patch to check for DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP, so drivers
 without support for it, skips instead of failing (Melissa)
 - Encapsulated all test paths options into a function to easy maintenance (Melissa)
 - Brought back test description for GitLab compilation

v3:
 - Fixed a bug that was mixing `alternate_sync_async = true` with the overlay path
 - Refactored how the test parameters are being set/unset (patch 1/2)
 - Fixed a bug where a primary buffer was being used with an overlay plane

v2: Add test description for GitLab compilation

André Almeida (4):
  lib/ioctl_wrappers: let the caller handle capability check result
  tests/kms_async_flips: Check for atomic async flip cap
  kms_async_flips: Refactor data options
  tests/kms_async_flips: Create subtest for overlay planes

 lib/ioctl_wrappers.c    |  17 ++++--
 lib/ioctl_wrappers.h    |   2 +-
 tests/kms_async_flips.c | 131 ++++++++++++++++++++++++++++++++++------
 3 files changed, 126 insertions(+), 24 deletions(-)

-- 
2.49.0

