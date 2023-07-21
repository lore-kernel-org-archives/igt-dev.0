Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6043F10E199
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jul 2023 13:05:10 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 21 Jul 2023 15:04:55 +0200
Message-Id: <20230721130458.64856-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/3] Add atomic DRM cursor hotspot test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: belmouss@redhat.com, Albert Esteve <aesteve@redhat.com>, javierm@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add test to verify the kernel patch at [1].

The test modifies the hotspot x and y properties and
checks that they get properly updated after every
display commit.

The first git commit updating the drm header shall be removed,
and update the header properly after the kernel patch has
landed.

[1] - https://lists.freedesktop.org/archives/dri-devel/2023-July/414509.html

Albert Esteve (3):
  drm header update: temp commit
  igt_kms: add hotspot plane property
  kms_cursor_legacy: modeset-atomic-cursor-hotspot

 include/drm-uapi/drm.h    | 54 +++++++++++++++++++++++++++-
 lib/igt_kms.c             |  9 +++++
 lib/igt_kms.h             |  4 ++-
 tests/kms_cursor_legacy.c | 75 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 140 insertions(+), 2 deletions(-)

-- 
2.40.0
