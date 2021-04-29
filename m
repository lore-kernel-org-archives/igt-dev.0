Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C896F383
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Apr 2021 15:32:49 +0000 (UTC)
Date: Thu, 29 Apr 2021 18:32:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YIrRnQo3Fgpz0s+3@intel.com>
References: <20210427222548.1778-1-ville.syrjala@linux.intel.com>
 <a5ad5d3f-8f59-2e0b-d648-eb3ead077141@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5ad5d3f-8f59-2e0b-d648-eb3ead077141@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_async_flips: Fix flip
 timestamp checks
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 11:07:53AM +0530, Karthik B S wrote:
> On 4/28/2021 3:55 AM, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> > Check the flip timestamp from the event (not the time we got the
> > event) against the vblank timestamps. Also if things are going
> > well we should expect the flip timestamp to in fact match the
> > first vblank timestamp, so allow them to be equal.
> =

> Hi,
> =

> During the initial implementation, the timestamp returned by the kernel =

> was vblank timestamp and we were not sending back the flip timestamp.
> =

> So we were calculating the time in the event rather than using the event =

> timestamp.

That approach doesn't make too much sense since the two vblank
timestamps we're comparing against could both be in the future.
That happens if the flip is completed already during the first vblank.
But I haven't actually checked when the hw completes the flip when
scheduled during a vblank.

> =

> Is this now updated to return the flip timestamp? If not, we would =

> always have flip time stamp same as the previous vblank time stamp?

Looks like it just returns the last stored timestamp as before.
Which doesn't really make sense. At the very least we should
make sure the timestam and seq number are updated to reflect
the current frame. So if we do something like

1. wait for vblank
2. wait for several frames
3. async flip

then the event would now carry the timestamp from that ancient
vblank wait. Well, at least that's how it looks from the code,
still need to double check it. And the test should probably be
extended to catch stuff like that.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
