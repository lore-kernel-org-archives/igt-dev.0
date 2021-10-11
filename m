Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB06C89C13
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Oct 2021 14:07:22 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 11 Oct 2021 16:07:17 +0200
Message-Id: <20211011140719.11733-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] tests/fbdev: Additional tests for resolution
 and panning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

Add addtional tests for resolution and panning operations on fbdev
devices. Succeed on successful operations. Fail on invalid operations
or state.

DRM's simpledrm driver exposed a bug in DRM's fbdev overallocation code,
[1] which is required for fbdev pageflipping. The new test cases intent
to test panning and page flipping, and detect such issues early.

Tested with the current simpledrm and a hacked version that supports fbdev
overallocation. This will also help to implement the panning functionality
for real in simpledrm and other drivers.

[1] https://lore.kernel.org/dri-devel/20211005070355.7680-1-tzimmermann@suse.de/

Thomas Zimmermann (2):
  tests/fbdev: Test for validity of video mode settings
  tests/fbdev: Add tests for display panning

 tests/fbdev.c | 135 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 127 insertions(+), 8 deletions(-)

--
2.33.0
