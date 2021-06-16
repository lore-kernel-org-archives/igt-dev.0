Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B956E511
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jun 2021 07:32:12 +0000 (UTC)
Date: Wed, 16 Jun 2021 10:34:04 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YMmpbOtT+CMFxbzI@platvala-desk.ger.corp.intel.com>
References: <20210614164135.1519746-1-markyacoub@chromium.org>
 <20210615131254.5x5u2fjyy7p3uctf@outlook.office365.com>
 <e89fb09e-40c2-3b55-ae27-ed13c234bad7@amd.com>
 <CAJUqKUrDjKFf_yx9w=1TQViJr8C6QfPrYCsEqQO-1Nxou5eH9A@mail.gmail.com>
 <8f717975-4852-fb81-028a-e4c709b50014@amd.com>
 <CAJUqKUqVZb-GatjkGXChFYPXrYLCqwCe9Uu0epEASn8SMrzEfw@mail.gmail.com>
 <ae4be25c-c50d-56bb-6699-5ab6210f80bf@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae4be25c-c50d-56bb-6699-5ab6210f80bf@amd.com>
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

On Tue, Jun 15, 2021 at 06:20:23PM +0200, Christian K=F6nig wrote:
> The alternative would be to try to create a framebuffer, but don't take it
> as a failure when that fails with the correct return code.

This.

If the importing can fail for documented reasons, we should just add
code that checks that the error is the documented one and then
igt_skip(), fail the test if it's something it shouldn't.

As a general rule the tests goes to hardware specific subdirs if the
interface tested is hardware-specific. This interface is not, just the
behaviour.


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
