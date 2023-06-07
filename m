Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57BF10E3E7
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 06:31:30 +0000 (UTC)
Date: Wed, 7 Jun 2023 08:31:26 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230607063126.pfpyrrsyoagpbbmt@zkempczy-mobl2>
References: <20230605181753.40607-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230605181753.40607-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Don't assert if fd path is
 unreachable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 05, 2023 at 08:17:53PM +0200, Kamil Konieczny wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Processes come and go, access to the /proc/$tid/fd/ is unreliable. Don't
> assert when dumping the debug info of what the process has open if that
> process is already destroyed.
> 
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_aux.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index f2b9671e3..386e25783 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -1451,16 +1451,18 @@ igt_show_stat(const pid_t tid, const char *cmd, int *state, const char *fn)
>  static void
>  __igt_lsof_fds(const pid_t tid, const char *cmd, int *state, char *proc_path, const char *dir)
>  {
> +	/* default fds or kernel threads */
> +	static const char *default_fds[] = { "/dev/pts", "/dev/null" };
>  	struct dirent *d;
>  	struct stat st;
>  	char path[PATH_MAX];
>  	char *fd_lnk;
> +	DIR *dp;
>  
> -	/* default fds or kernel threads */
> -	const char *default_fds[] = { "/dev/pts", "/dev/null" };
> +	dp = opendir(proc_path);
> +	if (!dp)
> +		return;
>  
> -	DIR *dp = opendir(proc_path);
> -	igt_assert(dp);

Ok, asserting on missing process is not good idea. I would just
add some igt_warn() or igt_debug() about missing process in this case.
Regardless decision to add this or not:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  again:
>  	while ((d = readdir(dp))) {
>  		char *copy_fd_lnk;
> @@ -1780,7 +1782,8 @@ __igt_lsof_audio_and_kill_proc(const pid_t tid, const char *cmd, const uid_t eui
>  	dp = opendir(proc_path);
>  	if (!dp && errno == ENOENT)
>  		return 0;
> -	igt_assert(dp);
> +	if (!dp)
> +		return 1;
>  
>  	while ((d = readdir(dp))) {
>  		if (*d->d_name == '.')
> -- 
> 2.39.2
> 
