Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE26C606A31E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=emersion.fr header.i=@emersion.fr header.a=rsa-sha256 header.s=protonmail2 header.b=EjdFyoWd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6042D11227F;
	Thu, 26 Nov 2026 10:03:40 +0000 (UTC)
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch
 [109.224.244.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BB511227A
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 10:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1795687339; x=1795946539;
 bh=lO9NCia0E6SBvml4t/wDyX4O+Aoqo9I+yAoOsy3gRUA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=EjdFyoWdW1SDK3FvJlXFDhuJ9EDwGvZ3mWeTWXL0RRtuhj0kDXchcfLC8spA2FSd0
 Fh4ohcto6uLCqu9wlqkrDRgEqHTFxPek/Or/6uqSd3aZE+f71nJUM0UYAZcHbDoWER
 2I6EKvaqjWWlTIo35BkjgxS8s77Lp3VJwchs2RjKJ/Ke6kXigVcjlSvN7ed5AbmeUw
 1GhPE+h9S0/BjBH72zIT3gpSXAIWp74XZze9g/OCx7twOskaAxHywBbDDf4hLT9jgk
 EtCGWR2pDF3gOJENz8O4cXp5fuBvmfGWQobBk0vETzH+lvDcNaWErQJ6HRFUDu8j3o
 3oZz4zmQuLlnA==
Date: Thu, 26 Nov 2026 10:02:14 +0000
To: igt-dev@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Gil Dekel <gildekel@google.com>, Jani Nikula <jani.nikula@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mark Yacoub <markyacoub@google.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH v2 2/2] meson: require libdisplay-info v0.4.0
Message-ID: <20261126100201.606756-2-contact@emersion.fr>
In-Reply-To: <20261126100201.606756-1-contact@emersion.fr>
References: <20261126100201.606756-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 216ee5abf3f88d756aa794e6ef51523a8ca23614
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

This version looks up CTA extension blocks nested inside a DisplayID
extension block. This is required for upcoming tests leveraging
igt_hdr helpers.

On systems not shipping a new enough libdisplay-info, a wrap file [1] is
provided so that Meson can automatically download and link to an
up-to-date subproject [2]. This eases developer setup when IGT is built
on distributions such as Debian. This behavior is typically disabled
when packaging software via the wrap_mode=3Dnodownload option (see e.g.
the arch-meson wrapper [3] used for Arch Linux packaging).

A slightly newer commit is pulled in by the wrap to avoid compiling
a bunch of unnecessary v4l-utils code when libdisplay-info is used
as a subproject [4].

v2: new commit (Gil)

[1]: https://mesonbuild.com/Wrap-dependency-system-manual.html
[2]: https://mesonbuild.com/Subprojects.html
[3]: https://gitlab.archlinux.org/archlinux/packaging/packages/meson/-/blob=
/9fe4433580978cc020c813019b77238ce65ab38d/arch-meson#L19
[4]: https://gitlab.freedesktop.org/emersion/libdisplay-info/-/merge_reques=
ts/219

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Gil Dekel <gildekel@google.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
---
 meson.build                      | 2 +-
 subprojects/libdisplay-info.wrap | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 subprojects/libdisplay-info.wrap

diff --git a/meson.build b/meson.build
index e7c685116b13..ead7be9c5eb0 100644
--- a/meson.build
+++ b/meson.build
@@ -151,7 +151,7 @@ build_info +=3D 'Valgrind annotations: @0@'.format(valg=
rind.found())
 cairo =3D dependency('cairo', version : '>1.12.0', required : true)
 libpci =3D dependency('libpci', required : true)
 libudev =3D dependency('libudev', required : true)
-libdisplay_info =3D dependency('libdisplay-info', required : true)
+libdisplay_info =3D dependency('libdisplay-info', version : '>=3D0.4.0', r=
equired : true)
 glib =3D dependency('glib-2.0', required : true)
=20
 libtsi =3D cc.find_library('TSI', required : false)
diff --git a/subprojects/libdisplay-info.wrap b/subprojects/libdisplay-info=
.wrap
new file mode 100644
index 000000000000..6a771b10030f
--- /dev/null
+++ b/subprojects/libdisplay-info.wrap
@@ -0,0 +1,3 @@
+[wrap-git]
+url =3D https://gitlab.freedesktop.org/emersion/libdisplay-info.git
+revision =3D 548330bca9bd3c6518cf4c6b38c954cfaabe782d
--=20
2.56.1


