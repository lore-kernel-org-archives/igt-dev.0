Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4876EB1C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2020 12:23:00 +0000 (UTC)
Date: Fri, 20 Mar 2020 14:22:57 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200320122257.GT9497@platvala-desk.ger.corp.intel.com>
References: <20200316160452.29636-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316160452.29636-1-lyude@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/tests/igt_describe: Use __FILE__ in
 JUST_C_OUTPUT and DESCRIBE_ALL_OUTPUT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 12:04:52PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> We currently manually specify the name of the source file by-hand here,
> however this causes problems if the user tries to build with compile
> flags like -fdebug-prefix-map since the source file names will then
> differ from what's hardcoded here - causing tests to fail.
> 
> So, fix that by using __FILE__ instead.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

This also fixes building when the build directory is not directly in
source root.


Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/tests/igt_describe.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/tests/igt_describe.c b/lib/tests/igt_describe.c
> index 6f3a4319..94d42fbe 100644
> --- a/lib/tests/igt_describe.c
> +++ b/lib/tests/igt_describe.c
> @@ -101,33 +101,33 @@ static void fake_main(int argc, char **argv) {
>  static const char DESCRIBE_ALL_OUTPUT[] = \
>  	"the top level description\n"
>  	"\n"
> -	"SUB A ../lib/tests/igt_describe.c:36:\n"
> +	"SUB A " __FILE__ ":36:\n"
>  	"  Basic A\n"
>  	"\n"
> -	"SUB B ../lib/tests/igt_describe.c:45:\n"
> +	"SUB B " __FILE__ ":45:\n"
>  	"  Group with B, C & D\n"
>  	"\n"
>  	"  Basic B\n"
>  	"\n"
> -	"SUB C ../lib/tests/igt_describe.c:54:\n"
> +	"SUB C " __FILE__ ":54:\n"
>  	"  Group with B, C & D\n"
>  	"\n"
>  	"  Group with C & D\n"
>  	"\n"
>  	"  Basic C\n"
>  	"\n"
> -	"SUB D ../lib/tests/igt_describe.c:58:\n"
> +	"SUB D " __FILE__ ":58:\n"
>  	"  Group with B, C & D\n"
>  	"\n"
>  	"  Group with C & D\n"
>  	"\n"
> -	"SUB E ../lib/tests/igt_describe.c:66:\n"
> +	"SUB E " __FILE__ ":66:\n"
>  	"  NO DOCUMENTATION!\n"
>  	"\n"
> -	"SUB F ../lib/tests/igt_describe.c:71:\n"
> +	"SUB F " __FILE__ ":71:\n"
>  	"  NO DOCUMENTATION!\n"
>  	"\n"
> -	"SUB G ../lib/tests/igt_describe.c:80:\n"
> +	"SUB G " __FILE__ ":80:\n"
>  	"  this description should be so long that it wraps itself nicely in the terminal this\n"
>  	"  description should be so long that it wraps itself nicely in the terminal this description\n"
>  	"  should be so long that it wraps itself nicely in the terminal this description should be so\n"
> @@ -135,17 +135,17 @@ static const char DESCRIBE_ALL_OUTPUT[] = \
>  	"  wraps itself nicely in the terminal this description should be so long that it wraps itself\n"
>  	"  nicely in the terminal\n"
>  	"\n"
> -	"SUB F ../lib/tests/igt_describe.c:87:\n"
> +	"SUB F " __FILE__ ":87:\n"
>  	"  verylongwordthatshoudlbeprintedeventhoughitspastthewrppinglimitverylongwordthatshoudlbeprintedeventhoughitspastthewrappinglimit\n"
>  	"  verylongwordthatshoudlbeprintedeventhoughitspastthewrappinglimitverylongwordthatshoudlbeprintedeventhoughitspastthewrappinglimit\n"
>  	"\n"
> -	"SUB G ../lib/tests/igt_describe.c:91:\n"
> +	"SUB G " __FILE__ ":91:\n"
>  	"  Subtest with dynamic subsubtests\n\n";
>  
>  static const char JUST_C_OUTPUT[] = \
>  	"the top level description\n"
>  	"\n"
> -	"SUB C ../lib/tests/igt_describe.c:54:\n"
> +	"SUB C " __FILE__ ":54:\n"
>  	"  Group with B, C & D\n"
>  	"\n"
>  	"  Group with C & D\n"
> -- 
> 2.24.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
