Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3D06E1B8
 for <igt-dev@lists.freedesktop.org>; Sun, 28 Feb 2021 10:03:45 +0000 (UTC)
References: <20210227221041.541550-1-raj.khem@gmail.com>
From: Martin Peres <martin.peres@mupuf.org>
Message-ID: <c8685b17-e199-2f2d-24ef-c53688d45465@mupuf.org>
Date: Sun, 28 Feb 2021 12:03:22 +0200
MIME-Version: 1.0
In-Reply-To: <20210227221041.541550-1-raj.khem@gmail.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_edid: Allocate raw 8-bytes for
 VSDB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Khem Raj <raj.khem@gmail.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 28/02/2021 00:10, Khem Raj wrote:
> hdmi_vsdb is an element of cea_vsdb which makes the size of cea_vsdb to
> be 8 ( 3bytes ieee_oui ) + ( 5bytes hdmi_vsdb struct), its true that we
> only use 7 bytes technically we can only allocate 7byte array but since
> we are writing to elements of hdmi_vsdb struct which is sitting at offet
> 4-8 in cea_vsdb, compiler thinks we have an element which is out of
> array bounds since out allocated size is 7bytes
> 
> This errors out
> ../git/lib/igt_edid.c:365:13: error: array subscript 'struct hdmi_vsdb[0]' is partly outside array bounds of 'char[7]' [-Werror=array-bounds]
>    365 |         hdmi->src_phy_addr[0] = 0x10;
>        |             ^~
> 
> allocating one extra byte matches with size of cea_vsdb and compiler is
> happy
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Lookgs good to me, thanks!

Reviewed-by: Martin Peres <martin.peres@mupuf.org>

> ---
>   lib/igt_edid.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_edid.c b/lib/igt_edid.c
> index 1c85486d..ce09cc47 100644
> --- a/lib/igt_edid.c
> +++ b/lib/igt_edid.c
> @@ -351,7 +351,7 @@ void cea_sad_init_pcm(struct cea_sad *sad, int channels,
>   const struct cea_vsdb *cea_vsdb_get_hdmi_default(size_t *size)
>   {
>   	/* We'll generate a VSDB with 2 extension fields. */
> -	static char raw[CEA_VSDB_HDMI_MIN_SIZE + 2] = {0};
> +	static char raw[CEA_VSDB_HDMI_MIN_SIZE + 3] = {0};
>   	struct cea_vsdb *vsdb;
>   	struct hdmi_vsdb *hdmi;
>   
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
