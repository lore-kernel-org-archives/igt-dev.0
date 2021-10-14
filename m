Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED506E1D2
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 17:39:43 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id x27so29947532lfa.9
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 10:39:43 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Thu, 14 Oct 2021 20:39:31 +0300
Message-Id: <20211014173934.12375-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] simlplify kms_cursor_crc test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

Put alpha and size change tests to use same path as all other tests

Juha-Pekka Heikkila (3):
  tests/kms_cursor_crc: move create_cursor_fb above alpha tests
  tests/kms_cursor_crc: take alpha into use when draw cursor
  tests/kms_cursor_crc: use same test path for alpha and size tests as
    all other tests

 tests/kms_cursor_crc.c | 191 ++++++++++++-----------------------------
 1 file changed, 57 insertions(+), 134 deletions(-)

-- 
2.28.0
