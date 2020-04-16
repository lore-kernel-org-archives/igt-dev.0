Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E4F6EB1F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2020 07:10:29 +0000 (UTC)
Date: Thu, 16 Apr 2020 10:10:27 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200416071027.GU9497@platvala-desk.ger.corp.intel.com>
References: <20200415212406.102082-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415212406.102082-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tools/registers/tgl: Fix
 tigerlake_delta file decode
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
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 02:24:06PM -0700, Jos=E9 Roberto de Souza wrote:
> It was missing a ")" to be properly parsed.
> =

> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tools/registers/tigerlake_delta.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/tools/registers/tigerlake_delta.txt b/tools/registers/tigerl=
ake_delta.txt
> index e82049b99..c7fc2dc24 100644
> --- a/tools/registers/tigerlake_delta.txt
> +++ b/tools/registers/tigerlake_delta.txt
> @@ -110,7 +110,7 @@
>  ('PLANE_COLOR_CTL_5_D', '0x735cc', '')
>  ('PLANE_COLOR_CTL_6_D', '0x736cc', '')
>  ('PLANE_COLOR_CTL_7_D', '0x737cc', '')
> -('PLANE_OFFSET_1_D', '0x731a4', ''
> +('PLANE_OFFSET_1_D', '0x731a4', '')
>  ('PLANE_OFFSET_2_D', '0x732a4', '')
>  ('PLANE_OFFSET_3_D', '0x733a4', '')
>  ('PLANE_OFFSET_4_D', '0x734a4', '')
> -- =

> 2.26.1
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
