Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D6389AF3
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2020 20:02:35 +0000 (UTC)
Received: by mail-qv1-f69.google.com with SMTP id bn4so13899536qvb.9
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2020 12:02:30 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
Date: Tue, 17 Nov 2020 15:02:05 -0500
Message-Id: <20201117200207.92128-1-jcline@redhat.com>
In-Reply-To: <20201116221844.82283-1-jcline@redhat.com>
References: <20201116221844.82283-1-jcline@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 0/2] tests/kms_addfb_basic: Nouveau
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

Changes from v2:

* Use if statements rather than breaking out differences into subtests

Jeremy Cline (2):
  tests/kms_addfb_basic: Mark Intel-only tests as such
  tests/kms_addfb_basic: add vendor-specific errno assertions

 tests/kms_addfb_basic.c | 48 ++++++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 10 deletions(-)

-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
