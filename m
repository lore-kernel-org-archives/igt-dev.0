Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AD96E0AA
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 06:33:09 +0000 (UTC)
Date: Fri, 08 Oct 2021 06:33:04 +0000
From: Simon Ser <contact@emersion.fr>
Message-ID: <K8XVZHLSqJyoETZRLZyYxZuMYGyQzd6LErIyD_cZTB1bQb4e9U9Zy9ZS9OzLz0Mfbu5zfRATD00sxNfgJpXo-klXK8EUMt1m9hnFgyc8N84=@emersion.fr>
In-Reply-To: <BN9PR12MB5145405FB299E7C2087EAE97FFB29@BN9PR12MB5145.namprd12.prod.outlook.com>
References: <20211001085319.789392-1-stylon.wang@amd.com>
 <7c206aba165a465aa14b465c72b6802c@intel.com>
 <DM8PR11MB5655AF5FCCDDD8EAB30C92B0E0AE9@DM8PR11MB5655.namprd11.prod.outlook.com>
 <20211007144038.ojiw5nzbydkfvgk2@outlook.office365.com>
 <oakr8kYGfhw6ExOrkEWsbp3jU89Fsenuurp94OdfCpOmqcab7tSAUAGLLQy4Tcro8tP5yZeSQAVzsTgGUrszteqMo5nyjdrCwYmwxypWQkE=@emersion.fr>
 <DM4PR12MB5182EFB81A2845B2F953BB57ECB19@DM4PR12MB5182.namprd12.prod.outlook.com>
 <73ec4c04-b2d1-4392-4096-7cc7076420ed@amd.com>
 <161af036-f263-7bb0-bc6d-251ae9517f42@amd.com>
 <BN9PR12MB5145405FB299E7C2087EAE97FFB29@BN9PR12MB5145.namprd12.prod.outlook.com>
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
To: "Wang, Chao-kai (Stylon)" <Stylon.Wang@amd.com>
Cc: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, "Saarinen,
 Jani" <jani.saarinen@intel.com>, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Latvala,
 Petri" <petri.latvala@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Choi,
 Nicholas" <Nicholas.Choi@amd.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Friday, October 8th, 2021 at 07:45, Wang, Chao-kai (Stylon) <Stylon.Wang=
@amd.com> wrote:

> I wanna propose to break down this patch into 2 changes:
>
> 1.  Keep theTEST_ONLY commit to check if 512x512 plane works. If not, cha=
nge the plane size to cover full CRTC.
> 2.  Add a real commit after TEST_ONLY to set output bpc to 8. This should=
 satisfy the first check that the output bpc is indeed 8

Looks like a good idea to me.
