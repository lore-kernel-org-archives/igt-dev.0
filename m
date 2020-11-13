Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCF36E51C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2020 16:50:40 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id l67so6062002qte.6
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2020 08:50:36 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
Date: Fri, 13 Nov 2020 11:49:38 -0500
Message-Id: <20201113164940.48427-1-jcline@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/kms_addfb_basic: Nouveau support
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

I considered breaking out the vendor-specific tests into a separate
file, but decided to start with a less-invasive change first and see
what people think.

Jeremy Cline (2):
  tests/kms_addfb_basic: Mark Intel-only tests as such
  tests/kms_addfb_basic: Relax errno assertions

 tests/kms_addfb_basic.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
