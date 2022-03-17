Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D616310EB11
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Mar 2022 12:00:01 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qx21so10138113ejb.13
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Mar 2022 05:00:01 -0700 (PDT)
Message-ID: <58191a43-fbd9-1c14-9f38-7cf7df1b0e13@gmail.com>
Date: Thu, 17 Mar 2022 13:59:53 +0200
MIME-Version: 1.0
Content-Language: en-US
To: venkata.sai.patnana@intel.com, igt-dev@lists.freedesktop.org
References: <20220316122454.19360-1-venkata.sai.patnana@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220316122454.19360-1-venkata.sai.patnana@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_edge_walk: Reduce
 NCRCS count for simulation platform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 16.3.2022 14.24, venkata.sai.patnana@intel.com wrote:
> From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> 
> currently NCRCS value is 128, it is taking more than expected on
> simulation, hence reduced to 10.
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> ---
>   tests/kms_cursor_edge_walk.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index cce562e0e7..9d5f3f6295 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -102,7 +102,7 @@ static void cursor_move(data_t *data, int x, int y, int i)
>   
>   #define XSTEP 8
>   #define YSTEP 8
> -#define NCRC 128
> +#define NCRC SLOW_QUICK(128, 10)
>   
>   static void test_edge_pos(data_t *data, int sx, int ex, int y, bool swap_axis)
>   {
