Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3244A6E530
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jun 2021 08:44:15 +0000 (UTC)
Date: Wed, 16 Jun 2021 11:46:09 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YMm6UQr4qHp/knOD@platvala-desk.ger.corp.intel.com>
References: <20210614164135.1519746-1-markyacoub@chromium.org>
 <20210615131254.5x5u2fjyy7p3uctf@outlook.office365.com>
 <e89fb09e-40c2-3b55-ae27-ed13c234bad7@amd.com>
 <CAJUqKUrDjKFf_yx9w=1TQViJr8C6QfPrYCsEqQO-1Nxou5eH9A@mail.gmail.com>
 <8f717975-4852-fb81-028a-e4c709b50014@amd.com>
 <CAJUqKUqVZb-GatjkGXChFYPXrYLCqwCe9Uu0epEASn8SMrzEfw@mail.gmail.com>
 <ae4be25c-c50d-56bb-6699-5ab6210f80bf@amd.com>
 <YMmpbOtT+CMFxbzI@platvala-desk.ger.corp.intel.com>
 <8077ffe8-8ee5-1d58-1797-69848d11d27a@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8077ffe8-8ee5-1d58-1797-69848d11d27a@amd.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_prime: Filter out devices that
 can't import buffers.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Anson Jacob <Anson.Jacob@amd.com>, igt-dev@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 16, 2021 at 10:07:18AM +0200, Christian K=F6nig wrote:
> =

> =

> Am 16.06.21 um 09:34 schrieb Petri Latvala:
> > On Tue, Jun 15, 2021 at 06:20:23PM +0200, Christian K=F6nig wrote:
> > > The alternative would be to try to create a framebuffer, but don't ta=
ke it
> > > as a failure when that fails with the correct return code.
> > This.
> > =

> > If the importing can fail for documented reasons, we should just add
> > code that checks that the error is the documented one and then
> > igt_skip(), fail the test if it's something it shouldn't.
> =

> Good point, but I don't think that this behavior is well documented
> anywhere.
> =

> I'm also pretty sure that most drivers don't correctly reject an imported
> DMA-buf for scanout when the hardware can't do this. Resulting in either
> just garbage on the screen or a lockup.
> =

> Exercising this in an unit tests is probably a good idea, but only after
> auditing all drivers for correct behavior.

The thing is, having a test for it is the best method of auditing and
being _sure_.

Being able to lockup devices with an operation that doesn't even
require root (?) sounds... slightly bad.


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
