Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C916E2C0
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 13:32:03 +0000 (UTC)
Date: Fri, 21 Feb 2020 15:31:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200221133153.GN13686@intel.com>
References: <1582286887-23159-1-git-send-email-juhapekka.heikkila@gmail.com>
 <158228779749.30577.13907167889704375473@skylake-alporthouse-com>
 <8b77c078-a89f-2b90-37bc-b7b2ee689866@gmail.com>
 <158229098521.30577.509445839669102035@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158229098521.30577.509445839669102035@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: increase
 timeout for nonblocking flip wait
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 01:16:25PM +0000, Chris Wilson wrote:
> Quoting Juha-Pekka Heikkila (2020-02-21 13:12:46)
> > On 21.2.2020 14.23, Chris Wilson wrote:
> > > Quoting Juha-Pekka Heikkila (2020-02-21 12:08:07)
> > >> When run on more than one monitor there may be modeset in queue
> > >> which will block flip. Kernel will timeout with modeset at
> > >> ten seconds so lets wait in test also that same ten seconds at
> > >> maximum.
> > > =

> > > 10s! You are joking, right? For a modeset that should not be there?
> > =

> > 10s sounded quite big number to me too but that is from Ville. This tes=
t =

> > is now failing because modeset + flip take more than one second, on my =

> > ICL box with eDP + HDMI connected it becomes 1.19s. Arek is talking =

> > about test box where it is more than two seconds. Anyway if 10s is what =

> > kernel is waiting in the worst case I don't think test should be more =

> > strict.
> =

> I think the kernel is broken. From a UX perspective that needs fixing.

10s is the flip_done timeout. We shouldn't need quite that long.
IIRC the max panel power cycle delay we can program is something
like 5s.

I had a quick look at the test case but couldn't quite figure out
what specifically it was trying to say with the different timeouts.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
