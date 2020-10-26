Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440E76E098
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2020 10:47:54 +0000 (UTC)
Date: Mon, 26 Oct 2020 12:47:49 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20201026104749.GH6112@intel.com>
References: <20201021085956.5bgbdcmoh357v3tx@smtp.gmail.com>
 <20201022103702.GJ6112@intel.com>
 <2b624f9f-2bfc-3ffe-655c-1bca869dd9f2@gmail.com>
 <20201023114725.yq76vg6grquqing7@smtp.gmail.com>
 <a340a4a0-ca76-50b6-75aa-fab8507c8c33@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a340a4a0-ca76-50b6-75aa-fab8507c8c33@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_cursor_crc: refactoring
 cursor-alpha subtests
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
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 12:13:56AM +0200, Juha-Pekka Heikkila wrote:
> On 23.10.2020 14.47, Melissa Wen wrote:
> > On 10/22, Juha-Pekka Heikkila wrote:
> >> On 22.10.2020 13.37, Ville Syrj=E4l=E4 wrote:
> >>> On Wed, Oct 21, 2020 at 05:59:56AM -0300, Melissa Wen wrote:
> >>>> Considering just a fully opaque or fully transparent cursor is not e=
nough
> >>>> to check the composition of an ARGB cursor plane. For example, the c=
airo
> >>>> ARGB32 format uses pre-multiplied alpha, and this representation may=
 only
> >>>> be evident when testing a translucent cursor.
> >>>>
> >>>> Therefore, this patch refactors the cursor-alpha-opaque and
> >>>> cursor-alpha-transparent subtests into just one subtest (cursor-alph=
a)
> >>>> that checks the alpha blending of a white cursor, with different alp=
ha
> >>>> values, in the primary plane. This refactoring also generates some s=
etup
> >>>> stuffs savings.
> >>>
> >>> Black background means you can't actually tell the
> >>> difference between premultiplied blending and no
> >>> blending.
> >>>
> >>> Oh, I guess restore_image() does end up painting
> >>> the test pattern into the primary plane's fb? Are
> >>> we guaranteed to position the cursor over some non-black
> >>> parts?
> >>>
> >>> The other obvious concern is whether hardware and software
> >>> blending will produce the exact same results or not. I do see
> >>> you use 1/4 steps for the alpha, which I guess can make that
> >>> more likely.
> >>
> >> I don't think verifying those blending levels will be possible when
> >> comparing hw vs sw image, to me it seemed different gens behave differ=
ent
> >> with cursor alpha. On this test to make it fail reliably even with alp=
ha
> >> value 1.0 one just need to change from cursor image white sub block in=
to
> >> grey level 0.5.
> >>
> > Hi, Ville and Juha-Pekka
> > =

> > Thanks for feedback.
> > =

> > To be honest, I'm a little confused by the issues you raised.
> > Maybe I'm not getting it right.
> > =

> > (1) We currently have two test cases to check the composition of the
> > cursor plane with the primary: alpha =3D 0 and alpha =3D 1, both with s=
olid
> > black background and white cursor. For these cases, the premultiplied or
> > straight alpha blending behave equally, since the cursor is just all 00
> > or all FF.
> > =

> > but for any other non-extreme alpha value, if the alpha blending is
> > straight, it will end up "applying alpha twice". For example, if I
> > remember correctly, cairo draws a white cursor alpha 0.5 =3D 80808080; =
and
> > doing a *straight* alpha blending on black background results in
> > FF404040. And this is why this patch checks the composition for extreme
> > and non-extreme alpha values.
> > Another way could be just to check a third alpha value, without all
> > these alpha levels... I mean, if you think checking non-extreme values
> > makes sense.
> > =

> > (2) On the other hand, I guess that the "CRC mismatch for alpha =3D 0.5"
> > for IGTPW_5080 is not really related to the proper composition, but it
> > is a rounding issue (225 * 0.5 =3D 127.5). Because it didn't fail for a=
ny
> > other non-extreme alpha levels and to get 128 without rounding issue,
> > alpha should be 0.502.
> > =

> > Therefore, if the problem here is rounding, would be better to take this
> > problematic case off, right?
> > =

> =

> ..just some random thoughts..
> =

> All cursor tests are running with alpha enabled, most of them just set =

> it to maximum value. This is because cursor plane did support only pixel =

> formats with alpha. As for those alphas, this test for example =

> kms_cursor_crc@pipe-*-cursor-*x*-onscreen is quite fragile across =

> platforms with alphas even if it explicitly doesn't try to test alpha, =

> from this I draw those alphas generally are not behaving same in all =

> platforms.
> =

> For those differences on gens with alpha behavior on kernel side you'll =

> find in intel_display.c icl_set_pipe_chicken(..) where is set display wa =

> #1153 which was put in place just to make cursor tests happy for icl =

> back in time. I was checking same bit for tgl but didn't find one hence =

> I was correcting colors some time ago on this test to 'safe' colors (see =

> 43fa6db in igt git log). Earlier there was in use colors which had 0.5 =

> value failing the test, this sound really familiar to your 0.5 alpha =

> problem. TBH it is interesting when you run test on tgl with 0.5 alpha =

> and it _doesn't_ fail because using those 0.5 colors on tgl did fail =

> this test.
> =

> As for your conclusion I think you are spot on this issue is about =

> rounding but I don't know was there a promise on hw side 0.5 means same =

> as what Cairo does. It was on test results now failing only on glk for =

> you? With those terms knowing alpha subtest is as fragile as everything =

> else on kms_cursor_crc that could be pushed upstream knowing there is =

> history baggage to drag on. IGT anyway is already committed to idea of =

> what some alpha/color/.. value mean for cairo will mean same thing for =

> display hw, there is kms_color struggling with similar problems.
> =

> I wonder what does Ville think about that Cairo vs hw issue?

One thing we could try is the "throw away some lsbs using the LUT"
trick from kms_plane pixel format tests. But depending on the blending
formula implemented in the hw I guess even that might not always work.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
