Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54E66EB3A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Feb 2021 16:25:14 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id h12so34206376lfp.9
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Feb 2021 08:25:14 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Wed,  3 Feb 2021 18:25:01 +0200
Message-Id: <20210203162503.9544-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] kms_rotation_crc fix and optimization
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

I added some comments as on Petri's wish and made incrementing of
max_crc_in_use more obvious. I could mention here also I tried storing
those reference images for reuse mid test but it didn't show as significant
reduction in execution time so I figure added complexity wasn't worth it.

/Juha-Pekka

Juha-Pekka Heikkila (2):
  tests/kms_rotation_crc: different display modes can have different crc
  HAX remove kms_rotatation_crc from premerge blacklist

 tests/intel-ci/blacklist-pre-merge.txt |  2 +-
 tests/kms_rotation_crc.c               | 62 ++++++++++++++++++++++----
 2 files changed, 54 insertions(+), 10 deletions(-)

-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
