Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447026E139
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2020 21:01:23 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id n12so15235943qtr.6
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2020 14:01:20 -0700 (PDT)
Date: Tue, 18 Aug 2020 17:01:15 -0400
From: Jeremy Cline <jcline@redhat.com>
Message-ID: <20200818210115.GA53828@dev.jcline.org>
References: <20200417211025.109574-4-lyude@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200417211025.109574-4-lyude@redhat.com>
Content-Disposition: inline
Subject: Re: [igt-dev] [i-g-t, v3,
 3/5] lib/igt_debugfs: Add igt_debugfs_pipe_dir()
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On Fri, Apr 17, 2020 at 05:10:23PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Like igt_debugfs_connector_dir(), but for pipes instead.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  lib/igt_debugfs.c | 29 +++++++++++++++++++++++++++++
>  lib/igt_debugfs.h |  1 +
>  2 files changed, 30 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index bf6be552..3c3b11e1 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -260,6 +260,35 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode)
>  	return ret;
>  }
>  
> +/**
> + * igt_debugfs_pipe_dir:
> + * @device: fd of the device
> + * @pipe: index of pipe
> + * @mode: mode bits as used by open()
> + *
> + * This opens the debugfs directory corresponding to the pipe index on the
> + * device for use with igt_sysfs_get() and related functions.
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int igt_debugfs_pipe_dir(int device, int pipe, int mode)
> +{
> +	char buf[128];
> +	int dir, ret;
> +
> +	dir = igt_debugfs_dir(device);
> +	if (dir < 0)
> +		return dir;
> +
> +	snprintf(buf, sizeof(buf), "crtc-%d", pipe);
> +	ret = openat(dir, buf, mode);
> +
> +	close(dir);
> +
> +	return ret;
> +}
> +

There seems to be a lot of overlap between this,
igt_debugfs_connector_dir(), and igt_debugfs_open(). As far as I can
tell, the latter two functions are completely identical so it's unclear
to me what the advantage of using one over the other is.

If I'm not mistaken igt_debugfs_pipe_dir() could be reduced to:

{
    char buf[128];
    snprintf(buf, sizeof(buf), "crtc-%d", pipe);
    return igt_debugfs_open(device, buf, mode);
}

and the docblock could just note it's sugar for igt_debugfs_open().

- Jeremy

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
