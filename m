Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0016E428
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 13:58:58 +0000 (UTC)
Date: Thu, 24 Sep 2020 16:58:54 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200924135854.GQ7444@platvala-desk.ger.corp.intel.com>
References: <20200924123625.31755-1-petri.latvala@intel.com>
 <81475469-c5de-7c55-cee5-f33a96ba00ef@gmail.com>
 <c6549ef3-3f8f-10ba-6615-1e36b79410c2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6549ef3-3f8f-10ba-6615-1e36b79410c2@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t RFC] lib/igt_chamelium: Use curl timeout
 for xmlrpc calls
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 04:38:36PM +0300, Juha-Pekka Heikkila wrote:
> On 24.9.2020 16.25, Juha-Pekka Heikkila wrote:
> > I guess CI isn't going to run this code anywhere for now? The change
> > look ok to me. Assuming the results will be all green,
> > =

> > Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > =

> > =

> > On 24.9.2020 15.36, Petri Latvala wrote:
> > > Use of timeouts everywhere is meaningless if xmlrpc calls are allowed
> > > to be blocking forever.
> > > =

> > > Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> > > Cc: Kunal Joshi <kunal1.joshi@intel.com>
> > > Cc: Arkadiusz Hiler <arek@hiler.eu>
> > > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > ---
> > > =A0 lib/igt_chamelium.c | 12 +++++++++++-
> > > =A0 1 file changed, 11 insertions(+), 1 deletion(-)
> > > =

> > > diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> > > index d9fab902..eac893a6 100644
> > > --- a/lib/igt_chamelium.c
> > > +++ b/lib/igt_chamelium.c
> > > @@ -2427,11 +2427,21 @@ void chamelium_deinit_rpc_only(struct
> > > chamelium *chamelium)
> > > =A0 struct chamelium *chamelium_init_rpc_only(void)
> > > =A0 {
> > > =A0=A0=A0=A0=A0 struct chamelium *chamelium =3D malloc(sizeof(struct =
chamelium));
> > > +=A0=A0=A0 struct xmlrpc_clientparms clientparms;
> > > +=A0=A0=A0 struct xmlrpc_curl_xportparms curlparms;
> > > =A0=A0=A0=A0=A0 if (!chamelium)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return NULL;
> > > =A0=A0=A0=A0=A0 memset(chamelium, 0, sizeof(*chamelium));
> > > +=A0=A0=A0 memset(&clientparms, 0, sizeof(clientparms));
> > > +=A0=A0=A0 memset(&curlparms, 0, sizeof(curlparms));
> > > +
> > > +=A0=A0=A0 curlparms.timeout =3D _RECEIVER_RESPONSIVE_AFTER_RESET_SEC=
ONDS;
> =

> I just realized here's curlparms.timeout is milliseconds, not seconds.

Gah!
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
