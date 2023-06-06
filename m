Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20230526130001.71730-1-nunes.erico@gmail.com>
 <CAK4VdL1Y0pc7=mCnSBwqtawg1WrC3NoSuMQGG0BR-S+TenskDA@mail.gmail.com>
 <20230605092210.tyc4imcsvfyifc7z@zkempczy-mobl2>
In-Reply-To: <20230605092210.tyc4imcsvfyifc7z@zkempczy-mobl2>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 6 Jun 2023 16:43:16 +0200
Message-ID: <CAK4VdL1FM6bAk80GCq0-mThNPRM_4MbHt9f9rbrw66ork=VCug@mail.gmail.com>
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/3] Initial tests for the lima drm
 driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, anarsoul@gmail.com, yuq825@gmail.com,
 lima@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On Mon, Jun 5, 2023 at 11:22=E2=80=AFAM Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
> I'm not the maintainer but sometimes I put my fingers here and there
> so I got a question and a nit. Do you have people involved in the
> project who contains the hardware and may verify test is working fine?

I'm one of the project contributors in both mesa and kernel, I should
be able to test/review contributions on what is related to the
specific hardware. Other project contributors are in cc.
As a side note I also noticed that there is hardware enrolled in
kernel-ci which can run the tests. Currently they already run igt, but
run generic igt tests since there have been no hardware specific ones
until now, and we could change it with these new tests.

> And definitely they can better review internal aspects of the test.
> IGT imo is correct place to put your tests in, only what I would change
> is to create additional 'lima/' directory. We treat 'tests/' directory
> as common so your specific driver tests should land to separate dir.
> lib/igt_lima.* is fine, but lima_gem_new.c should land to 'lima/'.

I'm fine with that, I'll change it in the next revision.

Thanks

Erico
