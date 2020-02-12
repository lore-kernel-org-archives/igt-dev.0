Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A925B6F4BE
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2020 10:55:55 +0000 (UTC)
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
Date: Wed, 12 Feb 2020 10:55:50 +0000
Message-ID: <d7e41438582999e2e22a557d443430da0d00c335.camel@intel.com>
References: <20200212091401.26642-1-dominik.grzegorzek@intel.com>
 <158150173353.5188.12750572995970677206@skylake-alporthouse-com>
In-Reply-To: <158150173353.5188.12750572995970677206@skylake-alporthouse-com>
Content-Language: en-US
Content-ID: <A3B98CE53296294BA801AFFAAC2094F2@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_exec_alignment.c: Update to
 be completable in a rational time.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 2020-02-12 at 10:02 +0000, Chris Wilson wrote:
> Quoting Dominik Grzegorzek (2020-02-12 09:14:01)
> > +       /*
> > +        * Due to the high complexity of searching holes in virtual
> > memory,
> > +        * number of objects has to be limited. The algorithm for
> > each alignment
> > +        * performs execbuffer multiple times and doubles number of
> > objects
> > +        * in every iteration till timeout is reached.
> > +        **/
> >         for (alignment = 4096; alignment < gtt_size; alignment <<=
> > 1) {
> > -               for (i = 0; i < count; i++)
> > -                       execobj[i].alignment = alignment;
> > +               alignment_set_timeout(TIMEOUT);
> > +               clock_gettime(CLOCK_MONOTONIC, &start);
> 
> I was thinking we made the timeout global and just run the test for a
> maximum of N secs and see how far into the alignment loop we get?
> 
> There's no reason to believe that higher power of two alignments
> provide
> any different path coverage, just as noted we find ourselves in
> increasingly fragmented virtual space. If you want a challenge,
> supplement this with a priority-inversion test case... (Where a low
> priority client can create a mess in their own address space, causing
> a
> delay [>10ms] of a high priority client. It's a clear and present
> bug.)
> -Chris
Is that priority-inversion test case cricial for you? What about
just making the timout global for now? 
--------------------------------------------------------------------

Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek
przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by
others is strictly prohibited.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
