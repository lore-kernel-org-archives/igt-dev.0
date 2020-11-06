Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8996E199
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2020 08:30:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri,  6 Nov 2020 09:29:47 +0100
Message-Id: <20201106082955.8939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 0/8] Test cases for fbdev
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: daniel.vetter@ffwll.ch, chris@chris-wilson.co.uk, petri.latvala@intel.com
Cc: igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

This patchset adds read and write tests for fbdev. It compares the content
of the framebuffer and reference buffer. A number of the special cases
near the EOF are also tested.

Depending on the implementation (sys, cfb), fbdev read/write changes its
semantics. Together with a kernel patches [1] these test cases intend to
provide a reference.

v2:
	* move tests into subtest groups
	* do setup in igt_fixtures (Daniel, Chris, Petri)
	* add additional tests for unaligned access and NULL-pointer
	  buffers (Daniel)

[1] https://patchwork.freedesktop.org/series/80038/

Thomas Zimmermann (8):
  tests/fbdev: Move existing tests into separate subgroups
  tests/fbdev: Map framebuffer in igt_fixture
  tests/fbdev: Add tests for read operations on framebuffer
  tests/fbdev: Add tests for unaligned reads on framebuffer memory
  tests/fbdev: Add tests for write operations on framebuffer
  tests/fbdev: Add tests for unaligned writes on framebuffer memory
  tests/fbdev: Add tests for accessing framebuffer near EOF
  tests/fbdev: Add tests for read/writing with NULL-pointer buffers

 tests/fbdev.c | 228 ++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 213 insertions(+), 15 deletions(-)

--
2.29.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
