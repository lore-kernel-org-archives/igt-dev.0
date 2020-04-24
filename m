Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Thu, 23 Apr 2020 21:26:01 -0400
Message-Id: <20200424012605.2279679-1-rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v8 0/4] Add support for testing writeback
 connectors
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
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nd <nd@arm.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Simon Ser <contact@emersion.fr>, Liviu Dudau <Liviu.Dudau@arm.com>, Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>, Brian Starkey <Brian.Starkey@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

A couple of months ago, I updated and re-submitted a patchset made by
Brian Starkey and Liviu Dudau for adding a writeback connectors test to
IGT. It is important to highlight that DRM already have writeback
connectors support, which is a way to expose in DRM the hardware
functionality from display engines that allows writing back into memory
the result of the DE's composition of supported planes.

After I resubmitted the patchset, Simon Ser provides a long and detailed
review for all of the patches (thanks Simon). Additionally, Maxime
Ripard tested the previous series in an ARM32 architecture and provided
his feedback for making this patchset portable (thanks Maxime). I
finally had time to go through all the details and prepare this new
version. Follows some notes:

1. Patchset author

Brian Starkey is the original author of this patchset, and I'm just
trying to upstream his changes. Note that during this patch submission,
the mail server from google going to overwrite Brian's mail by mine;
this happens on the mail server side for avoiding malicious users to
send emails as someone else. Note that I could spend time figuring out
how to fix it, but I think this is not worth since I can fix it during
the merge process (if it got accepted).

2. Drop the clone commits from the series

After Simon's review, we decided to drop the last two patches of the
original series since it was related to cloning output, and VKMS does
not support it yet. However, after we finish with this series, I can try
to take a look at this feature or maybe propose it as a GSoC/Outreachy
project.

Most of the changes happened in the second patch.

3. Cross-platform improvements

Thanks

Brian Starkey (4):
  lib/igt_kms: Add writeback support
  kms_writeback: Add initial writeback tests
  lib: Add function to hash a framebuffer
  kms_writeback: Add writeback-check-output

 lib/igt_fb.c           |  63 ++++++
 lib/igt_fb.h           |   2 +
 lib/igt_kms.c          |  57 ++++++
 lib/igt_kms.h          |   6 +
 tests/Makefile.sources |   1 +
 tests/kms_writeback.c  | 443 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |   1 +
 7 files changed, 573 insertions(+)
 create mode 100644 tests/kms_writeback.c

-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
