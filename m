Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E716F884
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Oct 2021 14:49:46 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4HQDkJ69lcz4x0XY
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Oct 2021 14:49:44 +0000 (UTC)
Date: Thu, 07 Oct 2021 14:49:38 +0000
From: Simon Ser <contact@emersion.fr>
Message-ID: <oakr8kYGfhw6ExOrkEWsbp3jU89Fsenuurp94OdfCpOmqcab7tSAUAGLLQy4Tcro8tP5yZeSQAVzsTgGUrszteqMo5nyjdrCwYmwxypWQkE=@emersion.fr>
In-Reply-To: <20211007144038.ojiw5nzbydkfvgk2@outlook.office365.com>
References: <20211001085319.789392-1-stylon.wang@amd.com>
 <20211002151511.vjblbkuoymw4jtyi@outlook.office365.com>
 <YVrh5zBX9mLq4Zg2@platvala-desk.ger.corp.intel.com>
 <20211004141835.uzqrsamqgdstee2q@outlook.office365.com>
 <7c206aba165a465aa14b465c72b6802c@intel.com>
 <DM8PR11MB5655AF5FCCDDD8EAB30C92B0E0AE9@DM8PR11MB5655.namprd11.prod.outlook.com>
 <20211007144038.ojiw5nzbydkfvgk2@outlook.office365.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_hdr: Fix failure to read
 output_bpc on AMD hardware
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: "Saarinen, Jani" <jani.saarinen@intel.com>, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Latvala,
 Petri" <petri.latvala@intel.com>, Stylon Wang <stylon.wang@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "nicholas.choi@amd.com" <nicholas.choi@amd.com>, Mark Yacoub <markyacoub@google.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

I don't think removing TEST_ONLY is correct? bafd90661c26 ("tests/kms_hdr: =
Add
bpc switch subtests") reads:

    v4: -Plane size back to CRTC size, regression observed in hsw again
         "Plane must cover entire CRTC" because of plane size restriction
         to 512x512. Petri/Ville suggested to use TEST_ONLY in try_commit()
         to probe whether we can use a smaller than fullscreen plane.

cc Nicholas
