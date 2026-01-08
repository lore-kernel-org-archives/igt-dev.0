Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF08FD1D480
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 16:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FA910E369;
	Thu,  8 Jan 2026 16:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VtpXh7WL";
	dkim-atps=neutral
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B9B10E369
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 16:36:26 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2a0d5c365ceso25243095ad.3
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Jan 2026 08:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767890186; x=1768494986; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3bCmVtRNie9GvyPIRYyTlC3ZrrLABD3YY/ImZ7G6Ls=;
 b=VtpXh7WLxlJjjNcpe/dRLEo77B2dHwTHKb1X4pgu34KGnhKRqYyrzOD730wqGLe2v1
 1YKeyESXFPp/QISDIScCKOAUBhxlsxmLgsgm3VRXyGHlA8g/sjaVPZ63amYr3SUINdBR
 QHHH23WFfctnY5o0jETCGjgByaZ1R/W0CdHHgMw8ACZtIkrtKomHY9gyL3VfNUUT6Bgm
 pS6nBkjqoDzohBYSWmXz4bqI/GzB2iRGDvjJtk9CTPBZ/MmT93FTTEqfdS7BS9PGq8oc
 o3eyaAvPSO5S+1IxJ5NzjhnTzV7qtkdnZvddgVIxmz0P2I+65FFKlK+KCFndn66bvqK0
 Nbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767890186; x=1768494986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/3bCmVtRNie9GvyPIRYyTlC3ZrrLABD3YY/ImZ7G6Ls=;
 b=FNE1gdTyGWxmFCfakroqNzwBCR6YtF61B1vThVxCs9G/lZmRftsGx5uRLlK1rxFSSG
 VXQ6lW5Nnk4yPkPfij/610/j9b+sYeuXCgjkMKPoGxWbHb9BMdAfh4j3hYk/ekl3Epne
 rregBdhyrsXwTdrxXUoio3c1DK0A44RPNsUKzWG3nppDKxjO9E9oeX1+pkwMuSplYCig
 D4KNhxJR6OziKC3zFCmgcQniDouBNxZr3nCLhspjnf919xXl6fCP5VUn7s+Gl5uDZQuX
 bE8bwxFHlSKTZog8UqYxYCIl/tGbiaHiGrwW2bakodZrKvWsuCTS6C/KwGBYZK4+mwd8
 qQlA==
X-Gm-Message-State: AOJu0Ywagc9molzNpymWVoIeiniJ3N8Fy9QQRRx4+34ugAq0DqWgO7dx
 yn42xB6kcBMBSPyIv17kL+9aGpY9wjLAKn06QE9cbm+3kCUDFcairhP2tmdxfpEz6px3aoAl8WC
 ApVN9OoOq79Biblp5rK/9OyqtLuOLdtQ=
X-Gm-Gg: AY/fxX6kQKDsYUnzDFaTXGt9gny9mAC9R/83URWjMqF0thYSLhHS/HIk54+E+B9mAOi
 /IBpbutnouiQajdqvtlDzBfth38YO+aRYwDs9Ek10iDlFQc37c10pRYKykvYs/CIglxTCLOUvKe
 IRQc1boE6YHHk1ITOwiKZLppk+vUrdPmLo7oWWavze5+Tol6RSiKxWK+UQMbevOpqL3XUteliog
 miLZ3B9L/mTlbuY5ysNGWDY3qx6ckfOifTwZMTF71lJ35wlfM8ZDYnQJfesZsWB8hyCqsRbbejp
 lUXCpWSZVhfOqSk0El6sf3XHST7rmg==
X-Google-Smtp-Source: AGHT+IGmjVK30dqeN/dN5m0NFoLj+bZR3/wzlz0U8UzajI6sjK2PFjBoGBqflVJrjyI01SP4BXelz+RcR5kUpoxcI+8=
X-Received: by 2002:a17:902:da81:b0:2a1:3ee3:c6ae with SMTP id
 d9443c01a7336-2a3ee4f4e27mr68615025ad.59.1767890186143; Thu, 08 Jan 2026
 08:36:26 -0800 (PST)
MIME-Version: 1.0
References: <20260107151004.327093-1-juhapekka.heikkila@gmail.com>
 <20260107151004.327093-2-juhapekka.heikkila@gmail.com>
 <176780133253.14086.11727954615085076706@intel.com>
 <CAJ=qYWQ+Kq1egCr3U1rVCyo-jo57rzGUDyqF3Z30WRJ4-LmKYw@mail.gmail.com>
 <20260108120845.o34q2kszyy73pbky@kamilkon-DESK.igk.intel.com>
 <b2954021c862f98c125f9f2d46726c453a13ee7b.camel@intel.com>
In-Reply-To: <b2954021c862f98c125f9f2d46726c453a13ee7b.camel@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 8 Jan 2026 18:36:13 +0200
X-Gm-Features: AQt7F2oT7LavHaBjybIGpLK4WaJXVc-NF168zPKCVRLuHxs8StKn_0wFATI2IIw
Message-ID: <CAJ=qYWRKyHKemgWceWHJQWKhjOwTtmf3bpTi_4H6dUYqrwQ4KA@mail.gmail.com>
Subject: Re: [RFC PATCH i-g-t 1/1] runner: add possibility to compress dmesgs
 inside json
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "Sousa, Gustavo" <gustavo.sousa@intel.com>, 
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>, 
 "Musial, Ewelina" <ewelina.musial@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Thu, Jan 8, 2026 at 2:49=E2=80=AFPM Knop, Ryszard <ryszard.knop@intel.co=
m> wrote:
>
> On Thu, 2026-01-08 at 13:08 +0100, Kamil Konieczny wrote:
> > Hi Juha-Pekka,
> > On 2026-01-07 at 18:49:52 +0200, Juha-Pekka Heikkil=C3=A4 wrote:
> > > On Wed, Jan 7, 2026 at 5:55=E2=80=AFPM Gustavo Sousa <gustavo.sousa@i=
ntel.com> wrote:
> > > >
> > > > Quoting Juha-Pekka Heikkila (2026-01-07 12:10:04-03:00)
> > > > > Here added compress-js parameter for runner. What it does is at p=
er test level
> > > >
> > > > Maybe rename it to --compress-json-dmesg to be more precise?
> >
> > Can we have it an option for using outside compressor? Like:
> > --compress-with=3Dxz
> >
> > I tested both gzip and xz and the latter was even better.
> > zlib could be hold as a fall-through, when no on-system is
> > availabe or one given in option do not work.
>
> There's also zstd which compresses better and faster than all of the
> above (tested on archived, complete results.json).
>

Compression scheme is not difficult to change on this; as I see it the
only thing to consider is all those places where compression would
need to be opened, they would be able to do it.

> > >
> > > Yea, that can be changed. I'm waiting to hear also from CI people, I
> > > could've gone and compressed those other fields too but I understood
> > > from CI people they want to keep things searchable, hence for now I
> > > did stick just with dmesg as those are always the biggest blobs.
> > >
> >
> > +cc Ryszard and Ewelina
> > Cc: Ewelina Musial <ewelina.musial@intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
>
> I don't like this tbh:
>
> - Compressing individual keys within the document causes the overall
> document to compress significantly worse. We already archive compressed
> logs for some pipelines, and those would need far more space with this.
> (This does not happen everywhere because some legacy scripts have
> issues with compressed logs, but doing it here would not really solve
> the problem, rather delay it a bit.)

I understand concern regarding double compression efficiency (and the
base64 overhead), but 'would need far more space' seems like a strong
claim. While I agree the outer archival compression won't be able to
re-compress these keys, the input file itself is essentially smaller.
Even with the base64 overhead and the loss of "second pass"
compression, I wouldn't expect the final archive to be significantly
larger than current raw logs.

>
> - This also does not solve the 2GB file limit for json-c. You can still
> hit it with difficult to compress logs, and since you're doing it per
> key, the compression ratio is not that great. The solution here is to
> switch this library to something else, like Jansson or yyjson, which
> handle >2GB cases just fine.

Let's not forget we're talking about logs here which don't have binary
data, any deflate algorithm should work quite well on those. As I
understood from Kamil's offline comment >2GB became less than 300MB.
While it is just one test it still did even better than my limited
tests. ~6x reduction would be quite massive safety margin.

>
> - Compressed bytes -> base64 to save them in the JSON again makes the
> compression ratio worse. :(
>
> Instead of this change, CI side should get the visualizer and i915-
> infra scripts modified to handle compressed files everywhere.

I've already had mr going this direction but nobody ever did touch it
https://gitlab.freedesktop.org/gfx-ci/i915-infra/-/merge_requests/112

>
> Thanks, Ryszard
>
> > > >
> > > > > for results.json in dmesg key is written text "compressed" to mai=
ntain
> > > > > compatibility and on the side of it is written new key dmesg-comp=
ressed which
> > > > > contain dmesg ran through zlib and base64 encoded.
> > > >
> > > > Should this be only about compressing dmesg for results.json? Or sh=
ould
> > > > we take a step back and make it compress the dmesg files in the res=
ults
> > > > directory and then that would also be reflected in results.json?
> > >
> > > That's a possibility; TBH I just didn't think about doing that at
> > > earlier stage. Idea on this anyway is to save space on CI storage.
> > >
> >
> > Compression is one possibility but it do not solve problem with
> > very big logs, like over 2GB. I was thinkning about cutting successfull
> > log into only begin+end lines of dmesg, so developers could find them
> > later in dmesg saved outside of json. Also it should be done for big on=
es,
> > not all of them.
> >
> > Btw your idea is good for IGT gitlab issue:
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/21
> > [IGT runner] allow attachments to results.json
> >
> > and few others around it:
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/22
> > [IGT runner] allow tests to attach test-specific results
> >
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/14
> > [igt_runner] Collect pstore data and attach it to dmesg output when res=
uming or reporting
> >
> > All of them rely on possibility to attach new files into results.
> >
> > > >
> > > > By the way, do you know if we have good compression rate on existin=
g
> > > > data?
> > >
> > > On my super limited test with this change, with kms tests the overall
> > > size of json came down to around 1/6 of original size. I'll still nee=
d
> > > to experiment more with that.
> > >
> >
> > Hmm, let me test it on one sample where json itself was >=3D 2GB
> > and see if it could help.
> >
> > Regards,
> > Kamil
> >
> >
> > > >
> > > > >
> > > > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > > > ---
> > > > > runner/resultgen.c    | 117 ++++++++++++++++++++++++++++++++++++-=
-----
> > > > > runner/runner_tests.c |   2 +
> > > > > runner/settings.c     |   7 +++
> > > > > runner/settings.h     |   1 +
> > > > > 4 files changed, 112 insertions(+), 15 deletions(-)
> > > > >
> > > > > diff --git a/runner/resultgen.c b/runner/resultgen.c
> > > > > index 1f7e79f24..ef6385598 100644
> > > > > --- a/runner/resultgen.c
> > > > > +++ b/runner/resultgen.c
> > > > > @@ -8,6 +8,7 @@
> > > > > #include <sys/stat.h>
> > > > > #include <sys/types.h>
> > > > > #include <unistd.h>
> > > > > +#include <zlib.h>
> > > > >
> > > > > #include <json.h>
> > > > >
> > > > > @@ -961,12 +962,61 @@ static void generate_formatted_dmesg_line(c=
har *message,
> > > > >         *f =3D '\0';
> > > > > }
> > > > >
> > > > > +static struct json_object *encode_compressed_base64(const char *=
data, size_t len)
> > > > > +{
> > > > > +        uLongf destLen;
> > > > > +        unsigned char *dest;
> > > > > +        gchar *b64_text;
> > > > > +        struct json_object *obj;
> > > > > +
> > > > > +        if (len =3D=3D 0)
> > > > > +                return NULL;
> > > > > +
> > > > > +        destLen =3D compressBound(len);
> > > > > +        dest =3D malloc(destLen);
> > > > > +
> > > > > +        if (!dest)
> > > > > +                return NULL;
> > > > > +
> > > > > +        if (compress(dest, &destLen, (const unsigned char*)data,=
 len) !=3D Z_OK) {
> > > > > +                free(dest);
> > > > > +                return NULL;
> > > > > +        }
> > > > > +
> > > > > +        b64_text =3D g_base64_encode((const guchar *)dest, (gsiz=
e)destLen);
> > > > > +        obj =3D json_object_new_string(b64_text);
> > > > > +
> > > > > +        g_free(b64_text);
> > > > > +        free(dest);
> > > > > +        return obj;
> > > > > +}
> > > > > +
> > > > > static void add_dmesg(struct json_object *obj,
> > > > > -                      const char *dmesg, size_t dmesglen,
> > > > > -                      const char *warnings, size_t warningslen)
> > > > > +                      struct settings *settings, const char *dme=
sg,
> > > > > +                      size_t dmesglen, const char *warnings, siz=
e_t warningslen)
> > > > > {
> > > > > -        json_object_object_add(obj, "dmesg",
> > > > > -                               new_escaped_json_string(dmesg, dm=
esglen));
> > > > > +        bool used_compression =3D false;
> > > > > +        struct json_object *compressed_obj;
> > > > > +
> > > > > +        if (settings && settings->compress_dmesg && dmesglen > 0=
) {
> > > > > +        compressed_obj =3D encode_compressed_base64(dmesg, dmesg=
len);
> > > > > +
> > > > > +                if (compressed_obj) {
> > > > > +                        json_object_object_add(obj, "dmesg",
> > > > > +                                               json_object_new_s=
tring("compressed"));
> > > >
> > > > Yep, this is not very useful, but can help avoid potential crashes =
of
> > > > existing tools that consume results.json today.  Nitpick: I would g=
o
> > > > with "<compressed>" or "(compressed)".
> > > >
> > > > > +                        json_object_object_add(obj, "dmesg-compr=
essed",
> > > > > +                                               compressed_obj);
> > > >
> > > > Maybe "dmesg-gz" or "dmesg.gz" to express the compression format?
> > > >
> > > > Another option is to have some key dedicated for that, e.g.:
> > > >
> > > >     "dmesg-compression": "gz",
> > > >     "dmesg-compressed": "...",
> > > >
> > > > This would allow other formats in the future.
> > >
> > > Those format magics are normally in the beginning of the data and als=
o
> > > here once decode base64, compression format becomes visible.
> > >
> > > >
> > > > --
> > > > Gustavo Sousa
> > > >
> > > > > +                        used_compression =3D true;
> > > > > +                } else {
> > > > > +                        fprintf(stderr, "igt_resultgen: Compress=
ion failed, falling back to raw dmesg.\n");
> > > > > +                }
> > > > > +        }
> > > > > +
> > > > > +        /* If compression wasn't requested, or if it failed, wri=
te raw dmesg */
> > > > > +        if (!used_compression) {
> > > > > +                json_object_object_add(obj, "dmesg",
> > > > > +                                       new_escaped_json_string(d=
mesg, dmesglen));
> > > > > +        }
> > > > >
> > > > >         if (warnings) {
> > > > >                 json_object_object_add(obj, "dmesg-warnings",
> > > > > @@ -974,7 +1024,8 @@ static void add_dmesg(struct json_object *ob=
j,
> > > > >         }
> > > > > }
> > > > >
> > > > > -static void add_empty_dmesgs_where_missing(struct json_object *t=
ests,
> > > > > +static void add_empty_dmesgs_where_missing(struct settings *sett=
ings,
> > > > > +                                           struct json_object *t=
ests,
> > > > >                                            char *binary,
> > > > >                                            struct subtest_list *s=
ubtests)
> > > > > {
> > > > > @@ -987,7 +1038,7 @@ static void add_empty_dmesgs_where_missing(s=
truct json_object *tests,
> > > > >                 generate_piglit_name(binary, subtests->subs[i].na=
me, piglit_name, sizeof(piglit_name));
> > > > >                 current_test =3D get_or_create_json_object(tests,=
 piglit_name);
> > > > >                 if (!json_object_object_get_ex(current_test, "dme=
sg", NULL)) {
> > > > > -                        add_dmesg(current_test, "", 0, NULL, 0);
> > > > > +                        add_dmesg(current_test, settings, "", 0,=
 NULL, 0);
> > > > >                 }
> > > > >
> > > > >                 for (k =3D 0; k < subtests->subs[i].dynamic_size;=
 k++) {
> > > > > @@ -995,7 +1046,7 @@ static void add_empty_dmesgs_where_missing(s=
truct json_object *tests,
> > > > >                                                          dynamic_=
piglit_name, sizeof(dynamic_piglit_name));
> > > > >                         current_test =3D get_or_create_json_objec=
t(tests, dynamic_piglit_name);
> > > > >                         if (!json_object_object_get_ex(current_te=
st, "dmesg", NULL)) {
> > > > > -                                add_dmesg(current_test, "", 0, N=
ULL, 0);
> > > > > +                                add_dmesg(current_test, settings=
, "", 0, NULL, 0);
> > > > >                         }
> > > > >                 }
> > > > >         }
> > > > > @@ -1048,7 +1099,12 @@ static bool fill_from_dmesg(int fd,
> > > > >                 if ((subtest =3D strstr(message, STARTING_SUBTEST=
_DMESG)) !=3D NULL) {
> > > > >                         if (current_test !=3D NULL) {
> > > > >                                 /* Done with the previous subtest=
, file up */
> > > > > -                                add_dmesg(current_test, dmesg, d=
mesglen, warnings, warningslen);
> > > > > +                                add_dmesg(current_test,
> > > > > +                                          settings,
> > > > > +                                          dmesg,
> > > > > +                                          dmesglen,
> > > > > +                                          warnings,
> > > > > +                                          warningslen);
> > > > >
> > > > >                                 free(dmesg);
> > > > >                                 free(warnings);
> > > > > @@ -1056,7 +1112,12 @@ static bool fill_from_dmesg(int fd,
> > > > >                                 dmesglen =3D warningslen =3D 0;
> > > > >
> > > > >                                 if (current_dynamic_test !=3D NUL=
L)
> > > > > -                                        add_dmesg(current_dynami=
c_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warning=
s_len);
> > > > > +                                        add_dmesg(current_dynami=
c_test,
> > > > > +                                                  settings,
> > > > > +                                                  dynamic_dmesg,
> > > > > +                                                  dynamic_dmesg_=
len,
> > > > > +                                                  dynamic_warnin=
gs,
> > > > > +                                                  dynamic_warnin=
gs_len);
> > > > >
> > > > >                                 free(dynamic_dmesg);
> > > > >                                 free(dynamic_warnings);
> > > > > @@ -1075,7 +1136,12 @@ static bool fill_from_dmesg(int fd,
> > > > >                     (dynamic_subtest =3D strstr(message, STARTING=
_DYNAMIC_SUBTEST_DMESG)) !=3D NULL) {
> > > > >                         if (current_dynamic_test !=3D NULL) {
> > > > >                                 /* Done with the previous dynamic=
 subtest, file up */
> > > > > -                                add_dmesg(current_dynamic_test, =
dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
> > > > > +                                add_dmesg(current_dynamic_test,
> > > > > +                                          settings,
> > > > > +                                          dynamic_dmesg,
> > > > > +                                          dynamic_dmesg_len,
> > > > > +                                          dynamic_warnings,
> > > > > +                                          dynamic_warnings_len);
> > > > >
> > > > >                                 free(dynamic_dmesg);
> > > > >                                 free(dynamic_warnings);
> > > > > @@ -1116,9 +1182,20 @@ static bool fill_from_dmesg(int fd,
> > > > >         free(line);
> > > > >
> > > > >         if (current_test !=3D NULL) {
> > > > > -                add_dmesg(current_test, dmesg, dmesglen, warning=
s, warningslen);
> > > > > +                add_dmesg(current_test,
> > > > > +                          settings,
> > > > > +                          dmesg,
> > > > > +                          dmesglen,
> > > > > +                          warnings,
> > > > > +                          warningslen);
> > > > > +
> > > > >                 if (current_dynamic_test !=3D NULL) {
> > > > > -                        add_dmesg(current_dynamic_test, dynamic_=
dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
> > > > > +                        add_dmesg(current_dynamic_test,
> > > > > +                                  settings,
> > > > > +                                  dynamic_dmesg,
> > > > > +                                  dynamic_dmesg_len,
> > > > > +                                  dynamic_warnings,
> > > > > +                                  dynamic_warnings_len);
> > > > >                 }
> > > > >         } else {
> > > > >                 /*
> > > > > @@ -1134,17 +1211,27 @@ static bool fill_from_dmesg(int fd,
> > > > >                          * there are would have skip as their res=
ult
> > > > >                          * anyway.
> > > > >                          */
> > > > > -                        add_dmesg(current_test, dmesg, dmesglen,=
 NULL, 0);
> > > > > +                        add_dmesg(current_test,
> > > > > +                                  settings,
> > > > > +                                  dmesg,
> > > > > +                                  dmesglen,
> > > > > +                                  NULL,
> > > > > +                                  0);
> > > > >                 }
> > > > >
> > > > >                 if (subtests->size =3D=3D 0) {
> > > > >                         generate_piglit_name(binary, NULL, piglit=
_name, sizeof(piglit_name));
> > > > >                         current_test =3D get_or_create_json_objec=
t(tests, piglit_name);
> > > > > -                        add_dmesg(current_test, dmesg, dmesglen,=
 warnings, warningslen);
> > > > > +                        add_dmesg(current_test,
> > > > > +                                  settings,
> > > > > +                                  dmesg,
> > > > > +                                  dmesglen,
> > > > > +                                  warnings,
> > > > > +                                  warningslen);
> > > > >                 }
> > > > >         }
> > > > >
> > > > > -        add_empty_dmesgs_where_missing(tests, binary, subtests);
> > > > > +        add_empty_dmesgs_where_missing(settings, tests, binary, =
subtests);
> > > > >
> > > > >         free(dmesg);
> > > > >         free(dynamic_dmesg);
> > > > > diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> > > > > index 908979982..3ea221ffa 100644
> > > > > --- a/runner/runner_tests.c
> > > > > +++ b/runner/runner_tests.c
> > > > > @@ -484,6 +484,7 @@ int igt_main()
> > > > >                                        "--collect-script", "/usr/=
bin/true",
> > > > >                                        "--hook", "echo hello",
> > > > >                                        "--hook", "echo world",
> > > > > +                                       "--compress-js",
> > > > >                                        "--prune-mode=3Dkeep-subte=
sts",
> > > > >                                        "test-root-dir",
> > > > >                                        "path-to-results",
> > > > > @@ -1000,6 +1001,7 @@ int igt_main()
> > > > >                                                "--hook", "echo he=
llo",
> > > > >                                                "--hook", "echo he=
llo\necho newline",
> > > > >                                                "--hook", "echo he=
llo\necho newline\\still the second line",
> > > > > +                                               "--compress-js",
> > > > >                                                testdatadir,
> > > > >                                                dirname,
> > > > >                         };
> > > > > diff --git a/runner/settings.c b/runner/settings.c
> > > > > index 3ccf71870..7d7320d62 100644
> > > > > --- a/runner/settings.c
> > > > > +++ b/runner/settings.c
> > > > > @@ -33,6 +33,7 @@ enum {
> > > > >         OPT_COV_RESULTS_PER_TEST,
> > > > >         OPT_HOOK,
> > > > >         OPT_HELP_HOOK,
> > > > > +        OPT_COMPRESS_JSON_DMESG,
> > > > >         OPT_VERSION,
> > > > >         OPT_PRUNE_MODE,
> > > > >         OPT_HELP =3D 'h',
> > > > > @@ -704,6 +705,7 @@ bool parse_options(int argc, char **argv,
> > > > >                 {"collect-script", required_argument, NULL, OPT_C=
ODE_COV_SCRIPT},
> > > > >                 {"hook", required_argument, NULL, OPT_HOOK},
> > > > >                 {"help-hook", no_argument, NULL, OPT_HELP_HOOK},
> > > > > +                {"compress-js", no_argument, NULL, OPT_COMPRESS_=
JSON_DMESG},
> > > > >                 {"multiple-mode", no_argument, NULL, OPT_MULTIPLE=
},
> > > > >                 {"inactivity-timeout", required_argument, NULL, O=
PT_TIMEOUT},
> > > > >                 {"per-test-timeout", required_argument, NULL, OPT=
_PER_TEST_TIMEOUT},
> > > > > @@ -815,6 +817,9 @@ bool parse_options(int argc, char **argv,
> > > > >                 case OPT_HELP_HOOK:
> > > > >                         igt_hook_print_help(stdout, "--hook");
> > > > >                         goto error;
> > > > > +                case OPT_COMPRESS_JSON_DMESG:
> > > > > +                        settings->compress_dmesg =3D true;
> > > > > +                        break;
> > > > >                 case OPT_MULTIPLE:
> > > > >                         settings->multiple_mode =3D true;
> > > > >                         break;
> > > > > @@ -1253,6 +1258,7 @@ bool serialize_settings(struct settings *se=
ttings)
> > > > >         SERIALIZE_INT(f, settings, enable_code_coverage);
> > > > >         SERIALIZE_INT(f, settings, cov_results_per_test);
> > > > >         SERIALIZE_STR(f, settings, code_coverage_script);
> > > > > +        SERIALIZE_INT(f, settings, compress_dmesg);
> > > > >         SERIALIZE_STR_ARRAY(f, settings, cmdline.argv, cmdline.ar=
gc);
> > > > >
> > > > >         if (settings->sync) {
> > > > > @@ -1371,6 +1377,7 @@ bool read_settings_from_file(struct setting=
s *settings, FILE *f)
> > > > >                 PARSE_INT(settings, name, val, enable_code_covera=
ge);
> > > > >                 PARSE_INT(settings, name, val, cov_results_per_te=
st);
> > > > >                 PARSE_STR(settings, name, val, code_coverage_scri=
pt);
> > > > > +                PARSE_STR(settings, name, val, compress_dmesg);
> > > > >                 PARSE_STR_ARRAY(settings, name, val, cmdline.argv=
, cmdline.argc);
> > > > >
> > > > >                 printf("Warning: Unknown field in settings file: =
%s =3D %s\n",
> > > > > diff --git a/runner/settings.h b/runner/settings.h
> > > > > index 6c58c3282..09711c052 100644
> > > > > --- a/runner/settings.h
> > > > > +++ b/runner/settings.h
> > > > > @@ -81,6 +81,7 @@ struct settings {
> > > > >         char *code_coverage_script;
> > > > >         bool enable_code_coverage;
> > > > >         bool cov_results_per_test;
> > > > > +        bool compress_dmesg;
> > > > >         struct {
> > > > >                 int argc;
> > > > >                 char **argv;
> > > > > --
> > > > > 2.43.0
> > > > >
