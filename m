Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 16 Nov 2021 06:59:46 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YZM6wpV9Yy1/prh2@platvala-desk.ger.corp.intel.com>
References: <20211116003042.439107-1-robdclark@gmail.com>
 <20211116003042.439107-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116003042.439107-3-robdclark@gmail.com>
Subject: Re: [igt-dev] [PATCH igt v3 2/4] lib/igt_debugfs: Add helper for
 detecting debugfs files
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

On Mon, Nov 15, 2021 at 04:30:40PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a helper that can be used with, for ex, igt_require() so that tests
> can be skipped if the kernel is too old.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/igt_debugfs.c | 21 +++++++++++++++++++++
>  lib/igt_debugfs.h |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index dd6f2995..7211c410 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -307,6 +307,27 @@ int igt_debugfs_open(int device, const char *filename, int mode)
>  	return ret;
>  }
>  
> +/**
> + * igt_debugfs_exists:
> + * @device: the drm device file fd
> + * @filename: file name
> + * @mode: mode bits as used by open()
> + *
> + * Test that the specified debugfs file exists and can be opened with the
> + * requested mode.
> + */
> +bool igt_debugfs_exists(int device, const char *filename, int mode)
> +{
> +	int fd = igt_debugfs_open(device, filename, mode);
> +
> +	if (fd >= 0) {
> +		close(fd);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  /**
>   * igt_debugfs_simple_read:
>   * @filename: file name
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index b4867681..37e85067 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -39,6 +39,7 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
>  int igt_debugfs_pipe_dir(int device, int pipe, int mode);
>  
>  int igt_debugfs_open(int fd, const char *filename, int mode);
> +bool igt_debugfs_exists(int fd, const char *filename, int mode);
>  void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
>  void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
>  int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size);
> -- 
> 2.33.1
> 
