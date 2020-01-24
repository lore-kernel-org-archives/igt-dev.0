Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094106E2E4
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 10:12:01 +0000 (UTC)
Date: Fri, 24 Jan 2020 12:11:33 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200124101133.GO25209@platvala-desk.ger.corp.intel.com>
References: <1579766442-20285-1-git-send-email-kunal1.joshi@intel.com>
 <1579766442-20285-4-git-send-email-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579766442-20285-4-git-send-email-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/4] tests/kms_color_chamelium: add
 subtests to validate color
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: ville.syrjala@intel.com, igt-dev@lists.freedesktop.org, daniel.vetter@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 23, 2020 at 01:30:41PM +0530, Kunal Joshi wrote:
> To validate color subtests using chamelium, subtests modified
> to do frame dump comparison instead of crc comparison.
> Tests require chamelium and will validate color features
> at pipe level.
> =

> (v2)
>         Comparing framedump with framebuffer reference instead of
>         comparing two framedump.
> (v3)
>         Moved common functions with kms_color to lib/igt_color
> (v4)
>         Added changes to skip the tests if there is no connected port with
>         chamelium.
>         Rearranged position of valid_output.
> =

> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Suggested-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  tests/kms_color_chamelium.c | 759 ++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 759 insertions(+)
>  create mode 100644 tests/kms_color_chamelium.c
> =

> diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
> new file mode 100644
> index 0000000..b6b6731
> --- /dev/null
> +++ b/tests/kms_color_chamelium.c
> @@ -0,0 +1,759 @@
> +/*
> + * Copyright =A9 2020 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#include "kms_color.h"
> +
> +IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");

" using chamelium to verify instead of CRC"


Otherwise looks like what it claims, a "chamelium port" of
kms_color. Whoever feels like it gets to do even more refactoring to
get the two tests to share more code, a job for later.

With the description augmented,

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
