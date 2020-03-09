Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDC76E40D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2020 11:19:05 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Mon, 9 Mar 2020 11:19:03 +0000
Message-ID: <ac9ace63e65f68f798006b1cade6e042e91ce6a3.camel@intel.com>
References: <1583333427-18040-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1583333427-18040-1-git-send-email-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Content-ID: <122420D1C1FA2542A55130125EBD6240@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: increase
 timeout for nonblocking flip wait
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 2020-03-04 at 16:50 +0200, Juha-Pekka Heikkila wrote:
> When run on more than one monitor there may be modeset in queue
> which will block flip. Kernel will timeout with modeset at
> ten seconds so lets wait in test also that same ten seconds at
> maximum.
> =

> V2 Ville Syrj=E4l=E4: lets just wait for five seconds
Let's just do this.

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> =

> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>


> ---
>  tests/kms_cursor_legacy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index f41f68d..d5f95b8 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -251,7 +251,7 @@ static void flip_nonblocking(igt_display_t
> *display, enum pipe pipe_id, bool ato
>  	igt_plane_t *primary =3D igt_pipe_get_plane_type(pipe,
> DRM_PLANE_TYPE_PRIMARY);
>  	int ret;
>  =

> -	igt_set_timeout(1, "Scheduling page flip\n");
> +	igt_set_timeout(5, "Scheduling page flip\n");
>  	if (!atomic) {
>  		/* Schedule a nonblocking flip for the next vblank */
>  		do {
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
