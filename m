Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5B36E091
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Mar 2021 22:21:38 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Thu, 18 Mar 2021 18:21:22 -0400
Message-Id: <20210318222124.970997-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/2] tests/kms_cursor_crc: Test 32x32
 cursors
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
To: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Older nvidia hardware only has 32x32 and 64x64 cursors, so we want to
make sure to test 32x32 cursors.

Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>

Lyude Paul (2):
  tests/kms_cursor_crc: Probe kernel for cursor size support
  tests/kms_cursor_crc: Test 32x32 cursors

 tests/kms_cursor_crc.c | 133 ++++++++++++++++++++++++-----------------
 1 file changed, 77 insertions(+), 56 deletions(-)

-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
