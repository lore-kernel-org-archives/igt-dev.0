Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E2A6E0F2
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 09:09:26 +0000 (UTC)
Date: Thu, 8 Apr 2021 12:10:20 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YG7IfLSC9JLL0ka5@platvala-desk.ger.corp.intel.com>
References: <20210408002158.1318976-1-khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210408002158.1318976-1-khaled.almahallawy@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tools: Fix running intel_dp_compliance
 if it is found in the search path($PATH env variable)
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
To: Khaled Almahallawy <khaled.almahallawy@intel.com>
Cc: igt-dev@lists.freedesktop.org, shawn.c.lee@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 07, 2021 at 05:21:58PM -0700, Khaled Almahallawy wrote:
> When intel_dp_compliance binary location is part of PATH environment variable, running it from the shell without relative or full path, cause the following assertion failure because chdir:
> 
> $:~# intel_dp_compliance
> (intel_dp_compliance:3070) CRITICAL: Test assertion failure function enter_exec_path, file ../tools/igt_compliance_utils.c:56:
> (intel_dp_compliance:3070) CRITICAL: Failed assertion: ret == 0
> (intel_dp_compliance:3070) CRITICAL: Last errno: 2, No such file or directory
> (intel_dp_compliance:3070) CRITICAL: error: -1 != 0
> Stack trace:
>   #0 ../lib/igt_core.c:1726 __igt_fail_assert()
>   #1 [enter_exec_path+0x8b]
>   #2 ../tools/intel_dp_compliance.c:843 main()
>   #3 ../csu/libc-start.c:342 __libc_start_main()
>   #4 [_start+0x2e]
> Test (null) failed.
> **** DEBUG ****
> (intel_dp_compliance:3070) CRITICAL: Test assertion failure function enter_exec_path, file ../tools/igt_compliance_utils.c:56:
> (intel_dp_compliance:3070) CRITICAL: Failed assertion: ret == 0
> (intel_dp_compliance:3070) CRITICAL: Last errno: 2, No such file or directory
> (intel_dp_compliance:3070) CRITICAL: error: -1 != 0
> (intel_dp_compliance:3070) igt_core-INFO: Stack trace:
> (intel_dp_compliance:3070) igt_core-INFO:   #0 ../lib/igt_core.c:1726 __igt_fail_assert()
> (intel_dp_compliance:3070) igt_core-INFO:   #1 [enter_exec_path+0x8b]
> (intel_dp_compliance:3070) igt_core-INFO:   #2 ../tools/intel_dp_compliance.c:843 main()
> (intel_dp_compliance:3070) igt_core-INFO:   #3 ../csu/libc-start.c:342 __libc_start_main()
> (intel_dp_compliance:3070) igt_core-INFO:   #4 [_start+0x2e]
> ****  END  ****
> FAIL (-1.000s)
> 
> This patch fixes this issue.
> 
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ---
>  tools/igt_compliance_utils.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/igt_compliance_utils.c b/tools/igt_compliance_utils.c
> index d6a2e4e529d9..bcc707ae83c1 100644
> --- a/tools/igt_compliance_utils.c
> +++ b/tools/igt_compliance_utils.c
> @@ -39,22 +39,20 @@ struct termios saved_tio;
>  
>  void enter_exec_path(char **argv)
>  {
> -	char *exec_path = NULL;
> +	char exec_path[PATH_MAX];
>  	char *pos = NULL;
> -	short len_path = 0;
>  	int ret;
>  
> -	len_path = strlen(argv[0]);
> -	exec_path = (char *) malloc(len_path);
> +	memset(exec_path, 0, sizeof(exec_path));
> +	ret = readlink("/proc/self/exe", exec_path, PATH_MAX);

Does this need to be PATH_MAX - 1? A bit of a weird corner case of
having the path be exactly PATH_MAX long but would be consistent with
how readlink() is called elsewhere in IGT.

> +	igt_assert(ret != -1);
>  
> -	memcpy(exec_path, argv[0], len_path);
>  	pos = strrchr(exec_path, '/');
> -	if (pos != NULL)
> -		*(pos+1) = '\0';
> +	if(pos != NULL)
> +		*pos = '\0';

Could use dirname() for this but that's just a nitpick.



With or without those above,
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
