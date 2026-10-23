Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B812B606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=IKj6FLvh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF1010E0AA;
	Fri, 23 Oct 2026 14:53:21 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA4F10E0AA
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 14:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=eg66y+Fx3LmACMULXQoWdCYUY9nx0xv0jiDpZzURHVQ=; b=
 IKj6FLvhCo6SqFKDYjO2y07w3AARBO7h4gRFp3QoGiPPkXwcB5lANwdTqoi92tNg7Jf07BdbWuWr0
 BkNdKV35Xk923KqJBEHOXyLw7nv9+J0RxF1TKdSEy4Re5XtHYz7hZzCpgXjvUf4sUBd+ZnMn+hZj+
 tBAk9Ciiq1PCDgWbYTLR+2UHVm9+C+LnQFKnmDo8cfj5GHZveOYNruoJKpyzD1/tJnV14YyRWyOWw
 F/dIOtrHCgApN4q2mFIV/ngGLKmw+F5PEqaZZ7radDDUSMi9CZK2pA/9uicSgAwtsJsna41GpVBcI
 OiXT1wvp1bb2JwpyOh+CeiXVALajaVYp2w==;
Received: from [81.79.79.1] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xKGbN-007ynx-9N; Fri, 23 Oct 2026 16:50:37 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: David Francis <David.Francis@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t 00/10] amdgpu CRIU igts and more
Date: Fri, 23 Oct 2026 15:50:22 +0100
Message-ID: <20261023145032.22650-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I'll be out for a week so sending this a bit incomplete in case you want to
review. What is missing are test cases for context change handle and driver
managed copy.

Patch 1 - Independent fix.

Patch 2 - Adds missing coverage for existing DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES.

So 1 & 2 can be reviewed and pulled in regardless.

Patches 3 & 4 - Coverage for UAPI I add in the CRIU series, this one:
  https://lore.kernel.org/amd-gfx/20261019130159.11739-1-tvrtko.ursulin@igalia.com/

Patches 5-10 - This is my manual test I use to test the render node CRIU
end-to-end. Basically subtests are test scenarios which set up things and then
wait for me to trigger the dump. Then you restore and the test finishes.

Tvrtko Ursulin (10):
  drm-uapi/amdgpu: Sync with upstream header
  tests/amd/gem_list_handles: Add basic test for
    DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES
  tests/amd/gem_list_handles: Test the userptr flag
  tests/amd/gem_list_contexts: Add basic test for
    DRM_IOCTL_AMDGPU_GEM_LIST_CONTEXTS
  tests/amd/criu: Add some basic test cases
  tests/amd/criu: Test with more than one buffer
  tests/amd/criu: Add userptr tests
  tests/amd/criu: Add context handling tests
  tests/amd/criu: Add a busy client test
  tests/amd/criu: Add buffer object content verification tests

 include/drm-uapi/amdgpu_drm.h       | 164 +++++++++---
 lib/amdgpu/amd_command_submission.c |  20 +-
 lib/amdgpu/amd_compute.c            |   4 +-
 lib/amdgpu/amd_deadlock_helpers.c   |   4 +-
 lib/amdgpu/amd_ip_blocks.h          |  14 +
 tests/amdgpu/amd_criu.c             | 389 ++++++++++++++++++++++++++++
 tests/amdgpu/amd_list_contexts.c    | 233 +++++++++++++++++
 tests/amdgpu/amd_list_handles.c     | 184 +++++++++++++
 tests/amdgpu/meson.build            |   3 +
 9 files changed, 968 insertions(+), 47 deletions(-)
 create mode 100644 tests/amdgpu/amd_criu.c
 create mode 100644 tests/amdgpu/amd_list_contexts.c
 create mode 100644 tests/amdgpu/amd_list_handles.c

-- 
2.56.0

