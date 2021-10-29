Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 28 Oct 2021 19:46:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20211029024625.GA33196@jons-linux-dev-box>
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
 <20211021234044.3071069-7-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021234044.3071069-7-John.C.Harrison@Intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/8] lib/igt_sysfs: Support large files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: John.C.Harrison@Intel.com
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 04:40:42PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The syfs helper functions were all using basic 'int' data types for
> sizs, offsets, etc. when reading from sysfs. This works fine for
> little files, but not for large error capture logs (which can be
> gigabytes in sizes).
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  lib/igt_sysfs.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 6919ac361..ee75e3ef1 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -53,9 +53,11 @@
>   * provides basic support for like igt_sysfs_open().
>   */
>  
> -static int readN(int fd, char *buf, int len)
> +static ssize_t readN(int fd, char *buf, size_t len)
>  {
> -	int ret, total = 0;
> +	ssize_t ret;
> +	size_t total = 0;
> +
>  	do {
>  		ret = read(fd, buf + total, len - total);
>  		if (ret < 0)
> @@ -69,9 +71,11 @@ static int readN(int fd, char *buf, int len)
>  	return total ?: ret;
>  }
>  
> -static int writeN(int fd, const char *buf, int len)
> +static ssize_t writeN(int fd, const char *buf, size_t len)
>  {
> -	int ret, total = 0;
> +	ssize_t ret;
> +	size_t total = 0;
> +
>  	do {
>  		ret = write(fd, buf + total, len - total);
>  		if (ret < 0)
> @@ -218,8 +222,9 @@ bool igt_sysfs_set(int dir, const char *attr, const char *value)
>  char *igt_sysfs_get(int dir, const char *attr)
>  {
>  	char *buf;
> -	int len, offset, rem;
> -	int ret, fd;
> +	size_t len, offset, rem;
> +	ssize_t ret;
> +	int fd;
>  
>  	fd = openat(dir, attr, O_RDONLY);
>  	if (igt_debug_on(fd < 0))
> -- 
> 2.25.1
> 
