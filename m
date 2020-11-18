Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000886E441
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2020 15:23:52 +0000 (UTC)
Received: by mail-qv1-f70.google.com with SMTP id x9so1500549qvt.16
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2020 07:23:50 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
Date: Wed, 18 Nov 2020 10:23:27 -0500
Message-Id: <20201118152329.98315-1-jcline@redhat.com>
In-Reply-To: <20201117200207.92128-1-jcline@redhat.com>
References: <20201117200207.92128-1-jcline@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 0/2] tests/kms_addfb_basic: Nouveau
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

Changes from v3:

* Add debug log to indicate which framebuffer is being tested in the
  "too-high" subtest. Thanks to Petri Latvala for the feedback!

Jeremy Cline (2):
  tests/kms_addfb_basic: Mark Intel-only tests as such
  tests/kms_addfb_basic: add vendor-specific errno assertions

 tests/kms_addfb_basic.c | 49 ++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 10 deletions(-)

-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
