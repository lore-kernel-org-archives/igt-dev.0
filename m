Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DC018AE95
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Aug 2022 05:15:39 +0000 (UTC)
Date: Thu, 11 Aug 2022 08:12:59 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
Message-ID: <YvSP26UsSpeJ3ivF@platvala-desk.ger.corp.intel.com>
References: <20220810134453.951186-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810134453.951186-1-ryszard.knop@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] runner: Check for strchr result in
 parse_dmesg_line
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 03:44:52PM +0200, Ryszard Knop wrote:
> The intent here most likely was that if strchr returns NULL, the error
> below is printed out, but the condition was to check if the provided
> buffer was not NULL.
> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>

Yes.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  runner/resultgen.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 6ecf325b..38d90bda 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -864,7 +864,7 @@ static bool parse_dmesg_line(char* line,
>  	}
>  
>  	*message = strchr(line, ';');
> -	if (!message) {
> +	if (*message == NULL) {
>  		fprintf(stderr, "No ; found in kmsg record, this shouldn't happen\n");
>  		return false;
>  	}
> -- 
> 2.37.1
> 
