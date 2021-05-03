Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B002D6E8F0
 for <igt-dev@lists.freedesktop.org>; Mon,  3 May 2021 18:26:11 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id r9so9328516ejj.3
 for <igt-dev@lists.freedesktop.org>; Mon, 03 May 2021 11:26:11 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Mon,  3 May 2021 20:25:53 +0200
Message-Id: <20210503182555.12284-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] Add support for testing of 16 bpc fixed point
 framebuffers.
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
To: igt-dev@lists.freedesktop.org
Cc: mario.kleiner.de@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

This has been so far tested on AMD RaveRidge with DCN-1 display
engine. It requires a Cairo 1.17.2 snapshot or later - tested with 
the current 1.17.4 snapshot.

What was tested?

kms_plane --run-subtest pixel-format-pipe-A-planes

on current drm-next, with my 16 bpc framebuffer format patches for
AMD DC applied.

Thanks to Ville for pointers on what to change.

Note that on my machine igt master needed additional hacks to make the
kms_plane test sort of work at all on AMD, even without these new test case.
Seems at least igt kms_plane is not quite up to date for current amdgpu-kms
in recent kernels. E.g., it didn't get very far on Linux 5.8, but failed even
faster on Linux 5.12 with the new DCC and DCC_RETILE modifiers exposed.

Atm. only FMT_MOD_LINEAR seems to work on recent kernels. But this is a
different topic...

-mario


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
