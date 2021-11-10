Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 10 Nov 2021 13:58:45 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YYuz9dMFO4g/shU4@platvala-desk.ger.corp.intel.com>
References: <20211109180905.590773-1-robdclark@gmail.com>
 <20211109180905.590773-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109180905.590773-2-robdclark@gmail.com>
Subject: Re: [igt-dev] [PATCH igt 1/3] lib/igt_debugfs: Add helper for
 writing debugfs files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 09, 2021 at 10:09:03AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  lib/igt_debugfs.c | 16 ++++++++++++++++
>  lib/igt_debugfs.h | 12 ++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index a5bb95ca..39431068 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -351,6 +351,22 @@ void __igt_debugfs_read(int fd, const char *filename, char *buf, int size)
>  	close(dir);
>  }
>  
> +/**
> + * __igt_debugfs_write:
> + * @filename: file name
> + * @buf: buffer to be written to the debugfs file
> + * @size: size of the buffer

I see that we have this mistake in __igt_debugfs_read already but no
reason to repeat mistakes: Also document the fd parameter.


> + *
> + * This function opens the debugfs file, writes it, then closes the file.
> + */
> +void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size)
> +{
> +	int dir = igt_debugfs_dir(fd);
> +
> +	igt_sysfs_write(dir, filename, buf, size);
> +	close(dir);
> +}
> +
>  /**
>   * igt_debugfs_search:
>   * @filename: file name
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index d43ba6c6..249eb56a 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -40,6 +40,7 @@ int igt_debugfs_pipe_dir(int device, int pipe, int mode);
>  
>  int igt_debugfs_open(int fd, const char *filename, int mode);
>  void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
> +void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
>  int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size);
>  bool igt_debugfs_search(int fd, const char *filename, const char *substring);
>  
> @@ -54,6 +55,17 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
>  #define igt_debugfs_read(fd, filename, buf) \
>  		__igt_debugfs_read(fd, (filename), (buf), sizeof(buf))
>  
> +/**
> + * igt_debugfs_write:
> + * @filename: name of the debugfs file
> + * @buf: buffer to be written to the debugfs file
> + *
> + * This is just a convenience wrapper for __igt_debugfs_read. See its
> + * documentation.

Same here regarding the fd parameter as above. Also copypaste mistake
with s/debugfs_read/debugfs_write/.


-- 
Petri Latvala


> + */
> +#define igt_debugfs_write(fd, filename, buf) \
> +		__igt_debugfs_write(fd, (filename), (buf), sizeof(buf))
> +
>  /*
>   * Pipe CRC
>   */
> -- 
> 2.31.1
> 
