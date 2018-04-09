MIME-Version: 1.0
In-Reply-To: <20180328100549.36538-1-maarten.lankhorst@linux.intel.com>
References: <20180328100549.36538-1-maarten.lankhorst@linux.intel.com>
Date: Mon, 9 Apr 2018 12:50:09 -0700
Message-ID: <CABVU7+v6mpK=+G6v9A5yo6fr4=UB0NROaiC48Z+LHzEms5+SOw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kms: Reset FIFO underruns on
 first commit after init()/reset().
From: Rodrigo Vivi <rodrigo.vivi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 28, 2018 at 3:05 AM, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
> When we set the test to its first state, we will clear FIFO underrun
> status through the debugfs, so that any underruns caused by the tests
> will not affect other tests. In particular this also resets the FBC
> FIFO underrun status, so previous failures won't affect other tests
> that depend on FBC.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=105681

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  lib/igt_kms.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 19d650a8dcf8..c943411e52d7 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3112,6 +3112,13 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
>         }
>
>         if (display->first_commit) {
> +               int fd = igt_debugfs_open(display->drm_fd, "i915_fifo_underrun_reset", O_WRONLY);
> +               if (fd >= 0) {
> +                       igt_assert_eq(write(fd, "y", 1), 1);
> +
> +                       close(fd);
> +               }
> +
>                 igt_display_drop_events(display);
>                 display->first_commit = false;
>         }
> --
> 2.16.3
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev



-- 
Rodrigo Vivi
Blog: http://blog.vivi.eng.br
