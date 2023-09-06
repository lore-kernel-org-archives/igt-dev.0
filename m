Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D4F10E1B5
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 09:33:07 +0000 (UTC)
Date: Wed, 6 Sep 2023 11:33:02 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <20230906113302.3ef9f439@maurocar-mobl2>
In-Reply-To: <f4a9b8a5-ec49-b685-71e6-954e93894398@intel.com>
References: <20230905125356.1659246-1-bhanuprakash.modem@intel.com>
 <20230905125356.1659246-2-bhanuprakash.modem@intel.com>
 <f4a9b8a5-ec49-b685-71e6-954e93894398@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [i-g-t V2 1/7] tests/intel/pm: Rename
 i915_pm_backlight to kms_pm_backlight
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 6 Sep 2023 13:23:24 +0530
"Sharma, Swati2" <swati2.sharma@intel.com> wrote:

> > --- a/tests/intel/i915_pm_backlight.c
> > +++ b/tests/intel/kms_pm_backlight.c
> > @@ -1,27 +1,6 @@
> > +// SPDX-License-Identifier: MIT
> >   /*
> > - * Copyright =C2=A9 2015 Intel Corporation
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including th=
e next
> > - * paragraph) shall be included in all copies or substantial portions =
of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING
> > - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER=
 DEALINGS
> > - * IN THE SOFTWARE.
> > - *
> > - * Author:
> > - *    Antti Koskipaa <antti.koskipaa@linux.intel.com>
> > + * Copyright =C2=A9 2023 Intel Corporation
> >    *
> >    */ =20
>=20
> We can't remove old copyright. This has to remain same. With new IGT we=20
> are using SPDX, older IGT will continue using already existing copyright.

I'm not a lawyer, but let me give my 2 cents here.

IMO, the best is to have a change like that on a separate patch, as this is
not related to "Rename i915_pm_backlight to kms_pm_backlight".

Now, the above changeset is actually doing two changes:

1. It is replacing a MIT text by a SPDX equivalent. This should be fine,
   provided that you keep the original copyright date - eventually adding
   2023 to it. So:

	 * Copyright =C2=A9 2015 Intel Corporation
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a
	 * copy of this software and associated documentation files (the "Software=
"),
	 * to deal in the Software without restriction, including without limitati=
on
	 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
	 * and/or sell copies of the Software, and to permit persons to whom the
	 * Software is furnished to do so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice (including the ne=
xt
	 * paragraph) shall be included in all copies or substantial portions of t=
he
	 * Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
	 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
	 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
	 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
	 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEA=
LINGS
	 * IN THE SOFTWARE.

   can be replaced by either:

	// SPDX-License-Identifier: MIT
	/* Copyright =C2=A9 2015 Intel Corporation  */

   or:

	// SPDX-License-Identifier: MIT
	/* Copyright =C2=A9 2015, 2023 Intel Corporation  */

2. It is also stripping authorship rights. Depending on the jurisdiction,
   authorship rights are explicitly protected. Laws may even prevent it to
   be sellable. They're also forever protected.

   So, for instance, even if you buy a picture from Salvador Dali, even
   buying its copyrights, you can't remove his signature and replace by
   yours.

   So, with regards to this change:
=09
	- * Author:
	- *    Antti Koskipaa <antti.koskipaa@linux.intel.com>

   NACK.

Regards,
Mauro
