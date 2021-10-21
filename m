Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FCF6E425
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Oct 2021 09:21:57 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 21 Oct 2021 11:21:50 +0200
Message-Id: <20211021092152.8643-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 0/2] tests/fbdev: Additional tests for
 resolution and panning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com
Cc: Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

Add addtional tests for resolution and panning operations on fbdev
devices. Succeed on successful operations. Fail on invalid operations
or state.

DRM's simpledrm driver exposed a bug in DRM's fbdev overallocation code,
[1] which is required for fbdev page flipping. The new test cases intent
to test panning and page flipping, and detect such issues early.

Tested with the current simpledrm and a hacked version that supports fbdev
overallocation. This will also help to implement the panning functionality
for real in simpledrm and other drivers.

v3:
	* move pan-test logic into helper function (Ville)
	* fixes and comments for FB_VMODE_YWRAP
v2:
	* test horizontal resolution against line length (Ville)
	* respect FB_VMODE_YWRAP (Ville)
	* respect {x,y}panstep (Ville)

[1] https://lore.kernel.org/dri-devel/20211005070355.7680-1-tzimmermann@suse.de/

Thomas Zimmermann (2):
  tests/fbdev: Test for validity of video mode settings
  tests/fbdev: Add tests for display panning

 tests/fbdev.c | 154 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 146 insertions(+), 8 deletions(-)

--
2.33.0
