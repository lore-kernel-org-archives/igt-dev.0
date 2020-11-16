Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5B16E02D
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2020 22:19:07 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id f9so12687135qkg.13
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2020 14:19:05 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
Date: Mon, 16 Nov 2020 17:18:42 -0500
Message-Id: <20201116221844.82283-1-jcline@redhat.com>
In-Reply-To: <20201113164940.48427-1-jcline@redhat.com>
References: <20201113164940.48427-1-jcline@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/2] tests/kms_addfb_basic: Nouveau
 support
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
To: IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi folks,

I've been going through IGT's existing tests and seeing what they
uncover when pointed at nouveau. The kms_addfb_basic tests appear to be
largely vendor-agnostic, but there's a few simple cases that need fixing
for the test suite to pass with Nouveau.

The two issues are that there are a few tests that are specifically for
Intel GPUs, and there's some minor error code differences between i915
and nouveau (which both seem to be okay based on the API docs I could
find).

Changes since the first version (thanks for the reviews and
suggestions!):

* Where the error code differences occur, I've added vendor-specific
  assertions in addition to the generic assertions of a non-zero errno.
  Since the divergence is currently quite small, I've left them inline
  with the generic tests, but they're labeled so they could be easily
  broken out into separate files if necessary.

* Some igt_info statements have been added to the generic assertions.

Jeremy Cline (2):
  tests/kms_addfb_basic: Mark Intel-only tests as such
  tests/kms_addfb_basic: add vendor-specific errno assertions

 tests/kms_addfb_basic.c | 66 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 6 deletions(-)

-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
