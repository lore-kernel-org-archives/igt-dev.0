Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A052C36013
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 22:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9061410E161;
	Thu, 27 Mar 2025 22:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="q+kOIvi/";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561A510E0FF
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 22:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hJD/GDqz3jXMzIcV/QFtvS15ChuUl1thhLFdKcU9Bw0=; b=q+kOIvi/0Ys4Pt0O7WLmyI4JBg
 IgYagNcZFxaPWCSdxrRIi+QFmKNbvsiR9kmx+DG7CJXeDJ0i2lCTNqQ442cOjdXYKgC+DTpLmv04S
 8sTbjQT021MV33VKYXQ3lEH3+/PmjDl8y+mv2LVGn4tBEqqOWfCvHRE9Ul0UivHOqgTjE4X0+H+dQ
 EpwhHMOVn2kbqFDH6N9pZCpbbqun5VRj0h0GVM0jDbXcYjXW4Yabj8wb9J0OvclAvXFqd1fsa4wjq
 97vEpUwayqlMKTgE4Eg9/s1N5S4IVy+TsDJ83skUNSrlu9T36ycVIVP/kOeKvgrcZokZDRuhERoWU
 jpfvIeaA==;
Received: from [191.204.197.72] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1txvWC-007Qr7-On; Thu, 27 Mar 2025 23:16:09 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v4 0/3] tests/kms_async_flips: Create subtest for overlay
 planes
Date: Thu, 27 Mar 2025 19:15:58 -0300
Message-ID: <20250327221601.19086-1-andrealmeid@igalia.com>
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

André Almeida (3):
  tests/kms_async_flips: Check for atomic async flip cap
  kms_async_flips: Refactor data options
  tests/kms_async_flips: Create subtest for overlay planes

 tests/kms_async_flips.c | 86 +++++++++++++++++++++++++++++++++++------
 1 file changed, 74 insertions(+), 12 deletions(-)

-- 
2.49.0

