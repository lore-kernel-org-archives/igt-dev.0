Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FC410E368
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Aug 2023 08:49:06 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  1 Aug 2023 10:48:51 +0200
Message-Id: <20230801084853.42075-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 0/2] Add atomic DRM cursor hotspot test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: belmouss@redhat.com, javierm@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add test to verify the kernel patch at [1].

The test modifies the hotspot x and y properties and
checks that they get properly updated after every
display commit.

Note: the patch adds a DRM capability definition taken
directly from the kernel patch. Once the definition
lands on IGT after the drm.h is updated, the local
definition shall be removed.

[1] - https://lists.freedesktop.org/archives/dri-devel/2023-July/414509.html

Albert Esteve (2):
  igt_kms: add hotspot plane property
  kms_cursor_legacy: modeset-atomic-cursor-hotspot

 lib/igt_kms.c             | 10 +++++
 lib/igt_kms.h             |  9 +++++
 tests/kms_cursor_legacy.c | 79 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+)

-- 
2.40.0
