Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82E589F85
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 09:29:18 +0000 (UTC)
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>) id 1mDO75-0004Kg-Sh
 for igt-dev@lists.freedesktop.org; Tue, 10 Aug 2021 12:31:59 +0300
Date: Tue, 10 Aug 2021 12:31:59 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YRJHjwZCYjCVP6bp@platvala-desk.ger.corp.intel.com>
References: <20210810092619.16556-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210810092619.16556-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_edid: Properly pad display
 descriptor strings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 10, 2021 at 12:26:19PM +0300, Petri Latvala wrote:
> Display descriptor strings should be terminated with LF (when less
> than 13 bytes) and padded with space. Currently the termination is
> there but we're missing the padding.
> 
> As a drive-by, this fixes the below compile warning by making sure
> strncpy has enough room.
> 
> [206/1103] Compiling C object lib/libigt-igt_edid_c.a.p/igt_edid.c.o
> In file included from /usr/include/string.h:495,
>                  from ../lib/igt_edid.c:29:
> In function ‘strncpy’,
>     inlined from ‘detailed_timing_set_string’ at ../lib/igt_edid.c:186:2:
> /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: warning: ‘__builtin_strncpy’ specified bound 13 equals destination size [-Wstringop-truncation]
>   106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> ---
>  lib/igt_edid.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_edid.c b/lib/igt_edid.c
> index 6fe984d9..908959f4 100644
> --- a/lib/igt_edid.c
> +++ b/lib/igt_edid.c
> @@ -183,7 +183,8 @@ void detailed_timing_set_string(struct detailed_timing *dt,
>  
>  	np->type = type;
>  
> -	strncpy(ds->str, str, sizeof(ds->str));
> +	memset(ds->str, ' ', sizeof(ds->str));
> +	strncpy(ds->str, str, sizeof(ds->str) - 1);

And that is completely the incorrect thing to do, ignore this patch.


>  	len = strlen(str);
>  	if (len < sizeof(ds->str))
>  		ds->str[len] = '\n';
> -- 
> 2.29.2
> 
