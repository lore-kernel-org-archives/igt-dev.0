Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E805710E4CB
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 12:09:55 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Wed, 07 Jun 2023 14:09:50 +0200
Message-ID: <13279393.dW097sEU6C@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <20230605180359.39899-1-kamil.konieczny@linux.intel.com>
References: <20230605180359.39899-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Shut some excessive debug messages
 up
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

On Monday, 5 June 2023 20:03:59 CEST Kamil Konieczny wrote:
> From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> 
> In case of tests which extensively use debugfs, tons of useless debug
> messages about opening a debugfs directory are emitted.  If the test fails
> then important debug messages with details of the failure, interleaved
> with sequences of those useless messages, are hard to find and read.
> 
> Replace igt_debug() with conditional igt_debug_on_f() emitting a message
> about debugfs directory path only if open() fails.
> 
> v2: emit a message on NULL debugfs path
> 
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

As an author, I'm probably not expected to provide any kind of an ack, but 
since nobody responded, I'm providing one, in case it helps you to apply the 
change to upstream.

Acked-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Thanks,
Janusz

> ---
>  lib/igt_debugfs.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index afde2da62..a7b54bae5 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -208,13 +208,16 @@ char *igt_debugfs_path(int device, char *path, int 
pathlen)
>   */
>  int igt_debugfs_dir(int device)
>  {
> +	int debugfs_dir_fd;
>  	char path[200];
>  
> -	if (!igt_debugfs_path(device, path, sizeof(path)))
> +	if (igt_debug_on(!igt_debugfs_path(device, path, sizeof(path))))
>  		return -1;
>  
> -	igt_debug("Opening debugfs directory '%s'\n", path);
> -	return open(path, O_RDONLY);
> +	debugfs_dir_fd = open(path, O_RDONLY);
> +	igt_debug_on_f(debugfs_dir_fd < 0, "path: %s\n", path);
> +
> +	return debugfs_dir_fd;
>  }
>  
>  /**
> 



