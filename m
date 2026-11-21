Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CA8606A320
	for <igt-dev@archiver.kernel.org>; Sat, 21 Nov 2026 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=emersion.fr header.i=@emersion.fr header.a=rsa-sha256 header.s=protonmail2 header.b=lDBh4Ent
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26C810E0A9;
	Sat, 21 Nov 2026 11:55:59 +0000 (UTC)
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBA510E0A9
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Nov 2026 11:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1795261974; x=1795521174;
 bh=kyhtpRESX9V/01xP6slxE92AOLRKdlT4eeGlB53gqmE=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=lDBh4EntuCFMfUl+kedpCV7iUp0Fpqi6Plyv4PAa8Uj0pSjVC85O8a+RTSfEvoA2Q
 D+MafTRMrO4cNW1rrDJnF3Xre8sgB12zSEIGyOQjWuyjgHneGfeh5DezJcRZtK048g
 UObZ74xqNhf8NSl2R+FnCx0XKn6K8Qy4MGEDj7QJfai30ulyJjYGj6LqWfYRJ0vVWO
 Bn/ti4NUfB2VsuxbExI3AFhCkM8xZsqM423xfO3GY/WcGUadGDnzwCdPAbDUv2XoQx
 JI2flex36l++0fgJLZuVGuiSGuZ6fkGGVh4U05yO94pZyUQTyX3/UKnvKBRT8bT/ed
 vOjT0bHpkouFQ==
Date: Sat, 21 Nov 2026 11:52:49 +0000
To: igt-dev@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Gil Dekel <gildekel@google.com>, Jani Nikula <jani.nikula@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mark Yacoub <markyacoub@google.com>
Subject: [PATCH] lib/igt_hdr: switch to libdisplay-info for EDID parsing
Message-ID: <20261121115236.124211-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: a9e3dc0ac6758ff1661a1737e8fddd3d87508ebd
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace manual EDID/CTA parsing with libdisplay-info [1].

libdisplay-info is an EDID and DisplayID library. It's widely used
across Wayland compositors. It exposes both a high-level API
(with information collected across EDID/DisplayID/CTA blocks) and
a low-level API (exposing individual parsed fields from the
specifications).

Using libdisplay-info will allow IGT to drop all of its custom
parsing code. libdisplay-info takes care of the bitshifting and
value decoding. libdisplay-info has documentation, a test suite,
fuzzing, and a clone of edid-decode which can serve as an example
to figure out how to use the low-level API.

IGT has already quite a bit of hand-rolled parsing code, and we
need to start somewhere, so here is a patch leveraging
libdisplay-info for igt_hdr.

As a bonus, igt_hdr now extracts HDR static metadata from CTA
DisplayID blocks for free, because the high-level libdisplay-info
helper does this already.

[1]: https://gitlab.freedesktop.org/emersion/libdisplay-info

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Gil Dekel <gildekel@google.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
---
 Dockerfile.build-debian-arm64   |  1 +
 Dockerfile.build-debian-armhf   |  1 +
 Dockerfile.build-debian-minimal |  1 +
 Dockerfile.build-fedora         |  1 +
 lib/igt_hdr.c                   | 63 +++++----------------------------
 lib/meson.build                 |  1 +
 meson.build                     |  1 +
 7 files changed, 15 insertions(+), 54 deletions(-)

diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
index 114b9760d1f6..7a9cd1915825 100644
--- a/Dockerfile.build-debian-arm64
+++ b/Dockerfile.build-debian-arm64
@@ -26,6 +26,7 @@ RUN apt-get install -y \
 =09=09=09libpci-dev:arm64 \
 =09=09=09libpixman-1-dev:arm64 \
 =09=09=09libudev-dev:arm64 \
+=09=09=09libdisplay-info-dev:arm64 \
 =09=09=09libgsl-dev:arm64 \
 =09=09=09libasound2-dev:arm64 \
 =09=09=09libjansson-dev:arm64 \
diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
index c6527ea1eb2f..375f3e185bba 100644
--- a/Dockerfile.build-debian-armhf
+++ b/Dockerfile.build-debian-armhf
@@ -26,6 +26,7 @@ RUN apt-get install -y \
 =09=09=09libpci-dev:armhf \
 =09=09=09libpixman-1-dev:armhf \
 =09=09=09libudev-dev:armhf \
+=09=09=09libdisplay-info-dev:armhf \
 =09=09=09libgsl-dev:armhf \
 =09=09=09libasound2-dev:armhf \
 =09=09=09libjansson-dev:armhf \
diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-mini=
mal
index 573bb5139ceb..1d326250eef9 100644
--- a/Dockerfile.build-debian-minimal
+++ b/Dockerfile.build-debian-minimal
@@ -17,6 +17,7 @@ RUN apt-get install -y \
 =09=09=09libpci-dev \
 =09=09=09libpixman-1-dev \
 =09=09=09libudev-dev \
+=09=09=09libdisplay-info-dev \
 =09=09=09libxrandr-dev \
 =09=09=09libxv-dev \
 =09=09=09x11proto-dri2-dev \
diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index aacc6a87c844..db7618325a67 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -14,6 +14,7 @@ RUN dnf install -y \
 =09'pkgconfig(cairo)' \
 =09'pkgconfig(libpci)' \
 =09'pkgconfig(libudev)' \
+=09'pkgconfig(libdisplay-info)' \
 =09'pkgconfig(glib-2.0)' \
 =09'pkgconfig(gsl)' \
 =09'pkgconfig(alsa)' \
diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
index c0ed9e843163..b8175ceef1f7 100644
--- a/lib/igt_hdr.c
+++ b/lib/igt_hdr.c
@@ -11,6 +11,8 @@
 #include <termios.h>
 #include <unistd.h>
=20
+#include <libdisplay-info/info.h>
+
 /**
  * SECTION:igt_hdr
  * @short_description: HDR metadata helpers
@@ -22,33 +24,6 @@
  * output metadata construction, and blob programming utilities.
  */
=20
-/* HDR EDID parsing. */
-#define CTA_EXTENSION_VERSION=09=090x03
-#define HDR_STATIC_METADATA_BLOCK=090x06
-#define USE_EXTENDED_TAG=09=090x07
-
-static bool cta_block(const char *edid_ext)
-{
-=09/*
-=09 * Byte 1: 0x07 indicates Extended Tag
-=09 * Byte 2: 0x06 indicates HDMI Static Metadata Block
-=09 * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
-=09 *=09       where ET_0: Traditional Gamma - SDR Luminance Range
-=09 *=09             ET_1: Traditional Gamma - HDR Luminance Range
-=09 *=09             ET_2: SMPTE ST 2084
-=09 *=09             ET_3: Hybrid Log-Gamma (HLG)
-=09 *=09             ET_4 to ET_5: Reserved for future use
-=09 */
-
-=09if ((((edid_ext[0] & 0xe0) >> 5 =3D=3D USE_EXTENDED_TAG) &&
-=09      (edid_ext[1] =3D=3D HDR_STATIC_METADATA_BLOCK)) &&
-=09     (edid_ext[2] & ((1 << HDMI_EOTF_TRADITIONAL_GAMMA_HDR) |
-=09=09=09     (1 << HDMI_EOTF_SMPTE_ST2084))))
-=09=09=09return true;
-
-=09return false;
-}
-
 /**
  * igt_is_panel_hdr:
  * @fd: DRM file descriptor
@@ -63,13 +38,10 @@ static bool cta_block(const char *edid_ext)
 bool igt_is_panel_hdr(int fd, igt_output_t *output)
 {
 =09bool ok;
-=09int i, j, offset;
 =09uint64_t edid_blob_id;
 =09drmModePropertyBlobRes *edid_blob;
-=09const struct edid_ext *edid_ext;
-=09const struct edid *edid;
-=09const struct edid_cea *edid_cea;
-=09const char *cea_data;
+=09struct di_info *info;
+=09const struct di_hdr_static_metadata *hdr_static_metadata;
 =09bool ret =3D false;
=20
 =09ok =3D kmstest_get_property(fd, output->id,
@@ -82,30 +54,13 @@ bool igt_is_panel_hdr(int fd, igt_output_t *output)
 =09edid_blob =3D drmModeGetPropertyBlob(fd, edid_blob_id);
 =09igt_assert(edid_blob);
=20
-=09edid =3D (const struct edid *) edid_blob->data;
-=09igt_assert(edid);
-
-=09for (i =3D 0; i < edid->extensions_len; i++) {
-=09=09edid_ext =3D &edid->extensions[i];
-=09=09edid_cea =3D &edid_ext->data.cea;
-
-=09=09/* HDR not defined in CTA Extension Version < 3. */
-=09=09if ((edid_ext->tag !=3D EDID_EXT_CEA) ||
-=09=09    (edid_cea->revision !=3D CTA_EXTENSION_VERSION))
-=09=09=09=09continue;
-=09=09else {
-=09=09=09offset =3D edid_cea->dtd_start;
-=09=09=09cea_data =3D edid_cea->data;
-
-=09=09=09for (j =3D 0; j < offset; j +=3D (cea_data[j] & 0x1f) + 1) {
-=09=09=09=09ret =3D cta_block(cea_data + j);
+=09info =3D di_info_parse_edid(edid_blob->data, edid_blob->length);
+=09igt_assert(info);
+=09hdr_static_metadata =3D di_info_get_hdr_static_metadata(info);
=20
-=09=09=09=09if (ret)
-=09=09=09=09=09break;
-=09=09=09}
-=09=09}
-=09}
+=09ret =3D hdr_static_metadata->traditional_hdr || hdr_static_metadata->pq=
;
=20
+=09di_info_destroy(info);
 =09drmModeFreePropertyBlob(edid_blob);
=20
 =09return ret;
diff --git a/lib/meson.build b/lib/meson.build
index 3ed1369b53d1..cb861c472808 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -156,6 +156,7 @@ lib_deps =3D [
 =09libkmod,
 =09libpci,
 =09libudev,
+=09libdisplay_info,
 =09math,
 =09pciaccess,
 =09pixman,
diff --git a/meson.build b/meson.build
index eec131375e06..e7c685116b13 100644
--- a/meson.build
+++ b/meson.build
@@ -151,6 +151,7 @@ build_info +=3D 'Valgrind annotations: @0@'.format(valg=
rind.found())
 cairo =3D dependency('cairo', version : '>1.12.0', required : true)
 libpci =3D dependency('libpci', required : true)
 libudev =3D dependency('libudev', required : true)
+libdisplay_info =3D dependency('libdisplay-info', required : true)
 glib =3D dependency('glib-2.0', required : true)
=20
 libtsi =3D cc.find_library('TSI', required : false)
--=20
2.56.1


