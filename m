Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055E86E527
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 13:47:51 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 19 Nov 2020 14:47:38 +0100
Message-Id: <20201119134746.28020-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v5 0/8] Test cases for fbdev
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
To: petri.latvala@intel.com, chris@chris-wilson.co.uk, daniel.vetter@ffwll.ch
Cc: igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

This patchset adds read and write tests for fbdev. It compares the content
of the framebuffer and reference buffer. A number of the special cases
near the EOF are also tested.

Depending on the implementation (sys, cfb), fbdev read/write changes its
semantics. Together with a kernel patches [1] these test cases intend to
provide a reference.

v5:
	* test mmap() with igt_assert() (Daniel, Chris)
v4:
	* declare variables as volatile where necessary (Petri)
	* replace igt_require() with igt_assert() in several places (Petri)
	* clarify several error messages (Petri)
	* update CI
v3:
	* put igt_describe() before the block it describes (Petri)
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

 tests/fbdev.c                         | 223 ++++++++++++++++++++++++--
 tests/intel-ci/fast-feedback.testlist |   8 +-
 2 files changed, 214 insertions(+), 17 deletions(-)

--
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
