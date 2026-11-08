Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5F3606A31C
	for <igt-dev@archiver.kernel.org>; Sun,  8 Nov 2026 13:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1696F10E07F;
	Sun,  8 Nov 2026 13:09:18 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958E110E07F
 for <igt-dev@lists.freedesktop.org>; Sun,  8 Nov 2026 13:08:27 +0000 (UTC)
Received: from 85-156-80-143.elisa-laajakaista.fi ([85.156.80.143]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xQ2dE-000000055ux-3mdw; Sun, 08 Nov 2026 15:08:25 +0200
Message-ID: <c8e5dd58b1ec7db021eef2e1edca91d6a39d2788.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 igt-dev@lists.freedesktop.org
Date: Sun, 08 Nov 2026 15:08:37 +0200
In-Reply-To: <20261015131616.3172918-5-juhapekka.heikkila@gmail.com>
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
 <20261015131616.3172918-5-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
Subject: Re: [PATCH i-g-t 5/9] tests/kms_plane_scaling: add
 plane-upscale-max-crc subtest
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

On Thu, 2026-10-15 at 16:16 +0300, Juha-Pekka Heikkila wrote:
> Add the upscaling counterpart to plane-downscale-max-crc. The
> destination is a thin band spanning the scaled axis and the source is
> a crop of that same framebuffer, shrunk by a binary search until the
> kernel stops accepting the configuration. The maximally upscaled solid
> colour fill must produce the same crc as an unscaled crop of exactly
> the destination size.
>=20
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
