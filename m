Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 11 Nov 2021 15:19:57 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YY0YfV4WECXFMhYw@platvala-desk.ger.corp.intel.com>
References: <20211111003453.209115-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211111003453.209115-1-andrealmeid@collabora.com>
Subject: Re: [igt-dev] [RFC PATCH 0/1] drm: selftest: Convert to KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>
Cc: linux-kselftest@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, maira.canal@usp.br, Daniel Latypov <dlatypov@google.com>, n@nfraprado.net, Brendan Higgins <brendanhiggins@google.com>, leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org, arthur.grillo@usp.br, igt-dev@lists.freedesktop.org, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, ~lkcamp/discussion@lists.sr.ht, isabbasso@riseup.net, linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 09:34:52PM -0300, Andr=E9 Almeida wrote:
> Hi,
>=20
> This RFC is a preview of the progress we made in the KUnit hackathon[0].
> This patch, made by Ma=EDra and Arthur, converts the damage helper test
> from the original DRM selftest framework to use the KUnit framework.
>=20
> [0] https://groups.google.com/g/kunit-dev/c/YqFR1q2uZvk/m/IbvItSfHBAAJ
>=20
> The IGT part of this work can be found here:
> https://gitlab.freedesktop.org/isinyaaa/igt-gpu-tools/-/tree/introduce-ku=
nit

IGT side approach looks good. There's a couple of obscure bugs that I
spotted but nothing that is unfixable when it's time to review in
detail.


--=20
Petri Latvala
