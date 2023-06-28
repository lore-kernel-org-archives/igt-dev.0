Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFB610E0B8
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 18:57:14 +0000 (UTC)
Date: Wed, 28 Jun 2023 20:57:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: IGT GPU Tools <igt-dev@lists.freedesktop.org>
Message-ID: <20230628185710.wzd6pujtmzvcmuw4@kamilkon-desk1>
References: <20230623230954.115437-1-jshargo@chromium.org>
 <20230623230954.115437-3-jshargo@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230623230954.115437-3-jshargo@chromium.org>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/igt_aux: Make "is_mountpoint"
 public ("igt_is_mountpoint")
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi James,

On 2023-06-23 at 19:09:53 -0400, James Shargo wrote:
> From: Jim Shargo <jshargo@chromium.org>
> 
> This change supports the subsequent testing of ConfigFS-based VKMS
> features, which require their own mounting.
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> ---
>  lib/igt_aux.c     | 25 +++++++++++++++++++++++++
>  lib/igt_aux.h     |  2 ++
>  lib/igt_debugfs.c | 29 ++---------------------------
>  3 files changed, 29 insertions(+), 27 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 386e25783..4ec5fc154 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -1970,6 +1970,31 @@ bool igt_allow_unlimited_files(void)
>  	return setrlimit(RLIMIT_NOFILE, &rlim) == 0;
>  }
>  

Add documentation.

Regards,
Kamil

> +bool igt_is_mountpoint(const char *path)
> +{
> +	char buf[strlen(path) + 4];
> +	struct stat st;
> +	dev_t dev;
> +
> +	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/.", path), sizeof(buf));
> +	if (stat(buf, &st))
> +		return false;
> +
> +	if (!S_ISDIR(st.st_mode))
> +		return false;
> +
> +	dev = st.st_dev;
> +
> +	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/..", path), sizeof(buf));
> +	if (stat(buf, &st))
> +		return false;
> +
> +	if (!S_ISDIR(st.st_mode))
> +		return false;
> +
> +	return dev != st.st_dev;
> +}
> +
>  /**
>   * vfs_file_max: report maximum number of files
>   *
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index fb76b0313..298c610f2 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -311,6 +311,8 @@ double igt_stop_siglatency(struct igt_mean *result);
>  
>  bool igt_allow_unlimited_files(void);
>  
> +bool igt_is_mountpoint(const char *path);
> +
>  int igt_is_process_running(const char *comm);
>  int igt_terminate_process(int sig, const char *comm);
>  void igt_lsof(const char *dpath);
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index a7b54bae5..63fc6b9e7 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -67,37 +67,12 @@
>   * General debugfs helpers
>   */
>  
> -static bool is_mountpoint(const char *path)
> -{
> -	char buf[strlen(path) + 4];
> -	struct stat st;
> -	dev_t dev;
> -
> -	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/.", path), sizeof(buf));
> -	if (stat(buf, &st))
> -		return false;
> -
> -	if (!S_ISDIR(st.st_mode))
> -		return false;
> -
> -	dev = st.st_dev;
> -
> -	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/..", path), sizeof(buf));
> -	if (stat(buf, &st))
> -		return false;
> -
> -	if (!S_ISDIR(st.st_mode))
> -		return false;
> -
> -	return dev != st.st_dev;
> -}
> -
>  static const char *__igt_debugfs_mount(void)
>  {
> -	if (is_mountpoint("/sys/kernel/debug"))
> +	if (igt_is_mountpoint("/sys/kernel/debug"))
>  		return "/sys/kernel/debug";
>  
> -	if (is_mountpoint("/debug"))
> +	if (igt_is_mountpoint("/debug"))
>  		return "/debug";
>  
>  	if (mount("debug", "/sys/kernel/debug", "debugfs", 0, 0))
> -- 
> 2.41.0.162.gfafddb0af9-goog
> 
