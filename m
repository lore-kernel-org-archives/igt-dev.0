Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2B96F9EB
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 15:54:14 +0000 (UTC)
Date: Thu, 30 Jan 2020 17:54:10 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200130155410.GE13686@intel.com>
References: <20200130151229.984-1-ville.syrjala@linux.intel.com>
 <158039830112.18112.1082852252008596408@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158039830112.18112.1082852252008596408@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/vec: Add igt_vec
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

On Thu, Jan 30, 2020 at 03:31:41PM +0000, Chris Wilson wrote:
> Quoting Ville Syrjala (2020-01-30 15:12:27)
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Add a small std::vector lookalike which grows as needed.
> > =

> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  lib/Makefile.sources |  2 ++
> >  lib/igt_vec.c        | 86 ++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_vec.h        | 40 +++++++++++++++++++++
> >  lib/meson.build      |  1 +
> >  4 files changed, 129 insertions(+)
> >  create mode 100644 lib/igt_vec.c
> >  create mode 100644 lib/igt_vec.h
> > =

> > diff --git a/lib/Makefile.sources b/lib/Makefile.sources
> > index 631d6714e5ce..3e573f267e15 100644
> > --- a/lib/Makefile.sources
> > +++ b/lib/Makefile.sources
> > @@ -62,6 +62,8 @@ lib_source_list =3D             \
> >         igt_sysrq.h             \
> >         igt_x86.h               \
> >         igt_x86.c               \
> > +       igt_vec.c               \
> > +       igt_vec.h               \
> >         igt_vgem.c              \
> >         igt_vgem.h              \
> >         instdone.c              \
> > diff --git a/lib/igt_vec.c b/lib/igt_vec.c
> > new file mode 100644
> > index 000000000000..dc4a6172fc8d
> > --- /dev/null
> > +++ b/lib/igt_vec.c
> > @@ -0,0 +1,86 @@
> > +/*
> > + * Copyright =A9 2020 Intel Corporation
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > + * copy of this software and associated documentation files (the "Soft=
ware"),
> > + * to deal in the Software without restriction, including without limi=
tation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > + * and/or sell copies of the Software, and to permit persons to whom t=
he
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice (including th=
e next
> > + * paragraph) shall be included in all copies or substantial portions =
of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER=
 DEALINGS
> > + * IN THE SOFTWARE.
> > + */
> > +
> > +#include <stdlib.h>
> > +#include <string.h>
> > +
> > +#include "igt_core.h"
> > +#include "igt_vec.h"
> > +
> > +void igt_vec_init(struct igt_vec *vec, int elem_size)
> > +{
> > +       memset(vec, 0, sizeof(*vec));
> > +       vec->elem_size =3D elem_size;
> > +}
> > +
> > +void igt_vec_fini(struct igt_vec *vec)
> > +{
> > +       free(vec->elems);
> > +       memset(vec, 0, sizeof(*vec));
> > +}
> > +
> > +void *igt_vec_elem(const struct igt_vec *vec, int idx)
> > +{
> > +       igt_assert(idx < vec->len);
> > +
> > +       return vec->elems + idx * vec->elem_size;
> > +}
> > +
> > +void igt_vec_push(struct igt_vec *vec, void *elem)
> > +{
> > +       if (vec->len >=3D vec->size) {
> > +               vec->size =3D vec->size ? vec->size * 2 : 8;
> > +               vec->elems =3D realloc(vec->elems, vec->size * vec->ele=
m_size);
> > +               igt_assert(vec->elems);
> > +       }
> > +
> > +       vec->len++;
> > +       memcpy(igt_vec_elem(vec, vec->len - 1), elem, vec->elem_size);
> =

> I would have split this into =

> =

> void *igt_vec_grow(struct igt_vec *vec)
> {
>        if (vec->len++ >=3D vec->size) {
>                vec->size =3D vec->size ? vec->size * 2 : 8;
>                vec->elems =3D realloc(vec->elems, vec->size * vec->elem_s=
ize);
>                igt_assert(vec->elems);
>        }
> =

>        return igt_vec_elem(vec, vec->len - 1);
> }
> =

> igt_vec_push(vec, elem)
> {
> 	memcpy(igt_vec_grow(vec), elem, vec->size);
> }
> =

> since we are happy to throw assertions and not worry too much about
> error propagation.

I can paint it like that.

> =

> > +
> > +       vec->len++;
> > +}
> > +
> > +int igt_vec_length(const struct igt_vec *vec)
> > +{
> > +       return vec->len;
> > +}
> > +
> > +int igt_vec_index(const struct igt_vec *vec, void *elem)
> > +{
> > +       for (int i =3D 0; i < vec->len; i++) {
> > +               if (!memcmp(igt_vec_elem(vec, i), elem, vec->elem_size))
> > +                       return i;
> > +       }
> > +
> > +       return -1;
> > +}
> > +
> > +void igt_vec_remove(struct igt_vec *vec, int idx)
> > +{
> > +       igt_assert(idx < vec->len);
> > +
> > +       if (idx < vec->len - 1)
> > +               memmove(igt_vec_elem(vec, idx),
> > +                       igt_vec_elem(vec, idx + 1),
> > +                       (vec->len - 1 - idx) * vec->elem_size);
> =

> memmove of 0 not to your liking?

Don't think I've ever figured out if it works as expected.

> =

> > +
> > +       vec->len--;
> > +}
> > diff --git a/lib/igt_vec.h b/lib/igt_vec.h
> > new file mode 100644
> > index 000000000000..de2549a45841
> > --- /dev/null
> > +++ b/lib/igt_vec.h
> > @@ -0,0 +1,40 @@
> > +/*
> > + * Copyright =A9 2020 Intel Corporation
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > + * copy of this software and associated documentation files (the "Soft=
ware"),
> > + * to deal in the Software without restriction, including without limi=
tation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > + * and/or sell copies of the Software, and to permit persons to whom t=
he
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice (including th=
e next
> > + * paragraph) shall be included in all copies or substantial portions =
of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER=
 DEALINGS
> > + * IN THE SOFTWARE.
> > + */
> > +
> > +#ifndef __IGT_VEC_H__
> > +#define __IGT_VEC_H__
> > +
> > +struct igt_vec {
> > +       void *elems;
> > +       int elem_size, size, len;
> =

> I would have used char[0] and casting just to have a variable length
> struct :)

Then we'd have to reallocate the whole struct to grow it.
Wouldn't work since the caller owns the struct.

> =

> I might have also used longs throughout instead of ints, or in this day
> and age, size_t.

I was actually thinking of something smaller since I doubt anyone
wants to use this with large amounts of data due to O(n).

> =

> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> -Chris

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
