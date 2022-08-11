Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2447113548
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Aug 2022 05:15:48 +0000 (UTC)
Date: Thu, 11 Aug 2022 08:13:25 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
Message-ID: <YvSP9eoSZZw5tqKl@platvala-desk.ger.corp.intel.com>
References: <20220810134453.951186-1-ryszard.knop@intel.com>
 <20220810134453.951186-2-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810134453.951186-2-ryszard.knop@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] runner: Remove some unused values
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

On Wed, Aug 10, 2022 at 03:44:53PM +0200, Ryszard Knop wrote:
> These values were immediately overwritten or left unused, remove them.
> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  runner/resultgen.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 38d90bda..479d6d4f 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -621,7 +621,7 @@ static void process_dynamic_subtest_output(const char *piglit_name,
>  
>  	for (k = begin_idx + 1; k < result_idx; k++) {
>  		struct json_object *current_dynamic_test = NULL;
> -		int dyn_result_idx = -1;
> +		int dyn_result_idx;
>  		char dynamic_name[256];
>  		char dynamic_piglit_name[256];
>  		const char *dynbeg, *dynend;
> @@ -748,7 +748,7 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
>  	matches = find_matches(buf, bufend, needles);
>  
>  	for (i = 0; i < subtests->size; i++) {
> -		int begin_idx = -1, result_idx = -1;
> +		int begin_idx, result_idx;
>  		const char *resulttext;
>  		const char *beg, *end;
>  		double time;
> @@ -975,7 +975,6 @@ static bool fill_from_dmesg(int fd,
>  	FILE *f = fdopen(fd, "r");
>  	char piglit_name[256];
>  	char dynamic_piglit_name[256];
> -	ssize_t read;
>  	size_t i;
>  	GRegex *re;
>  
> @@ -988,7 +987,7 @@ static bool fill_from_dmesg(int fd,
>  		return false;
>  	}
>  
> -	while ((read = getline(&line, &linelen, f)) > 0) {
> +	while (getline(&line, &linelen, f) > 0) {
>  		char *formatted;
>  		unsigned flags;
>  		unsigned long long ts_usec;
> -- 
> 2.37.1
> 
