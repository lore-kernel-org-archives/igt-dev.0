Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91DC6E199
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2020 18:16:30 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id y5so19861344qto.10
 for <igt-dev@lists.freedesktop.org>; Thu, 02 Jul 2020 11:16:13 -0700 (PDT)
Message-ID: <5fcb1490dd12b0e2da3fbb34e5431ab3ce162839.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Thu, 02 Jul 2020 14:16:11 -0400
MIME-Version: 1.0
Subject: [igt-dev] Getting reviews for nouveau contributions in igt?
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: lyude@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: nouveau <nouveau@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi! I haven't had much luck asking around in IRC, so I figured this would be the
next place to start. As many of you know I've been working on getting nouveau
into good shape with igt-gpu-tools, now that we've finally finished implementing
CRC support thannks to nvidia's help. I should note that the patches for this
have been accepted into nouveau, Ben's just working on rebasing them on top of
some of the display refactoring + other stuff he's been working on. So they
should appear in drm-tip in the near future, but they're still available on
patchwork for anyone who wants to try them:

   https://patchwork.freedesktop.org/series/78803/
(also needs https://patchwork.freedesktop.org/series/78915/ )

ANYWAY-the first question I had was whether anyone on here would be willing to
help me with getting acks and/or reviews for some of the nouveau-related igt
patches I've sent upstream? One of the patch series adds some nouveau-specific
CRC tests:

   https://patchwork.freedesktop.org/series/74811/

The others add some missing bits to some basic kms tests that I noticed while
doing CRC bringup:

   https://patchwork.freedesktop.org/series/74806/ - fixes false-positives in
   kms_plane plane-position-hole tests

   https://patchwork.freedesktop.org/series/74808/ - adds a test to
   kms_pipe_crc_basic to exercise disabling CRC capture on a pipe immediately
   after said pipe being disabled.

The second question that I had is in the future, for adding nouveau-specific
tests is it acceptable for me to just get reviews from other nouveau developers
or should I be trying to pull people in from this mailing list from outside the
project?

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
