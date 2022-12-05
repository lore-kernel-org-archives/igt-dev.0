Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC9610E0EC
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 06:12:23 +0000 (UTC)
Date: Mon, 5 Dec 2022 07:12:08 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20221205071208.5f9ff446@maurocar-mobl2>
In-Reply-To: <20221202205705.58879-4-kamil.konieczny@linux.intel.com>
References: <20221202205705.58879-1-kamil.konieczny@linux.intel.com>
 <20221202205705.58879-4-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/7] lib/igt_core: add prefix to logging
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri,  2 Dec 2022 21:57:01 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Allow to store prefix for logs and print it before any message.
> This will allow to diagnose on wich GPU occurred problems when
> tested on multi-GPU machines.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  lib/igt_core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 68ae7289..65b7be64 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -348,6 +348,8 @@ static struct {
>  	uint8_t start, end;
>  } log_buffer;
>  static pthread_mutex_t log_buffer_mutex = PTHREAD_MUTEX_INITIALIZER;
> +#define LOG_PREFIX_SIZE 32
> +char log_prefix[LOG_PREFIX_SIZE] = { 0 };
>  
>  GKeyFile *igt_key_file;
>  
> @@ -3105,8 +3107,12 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>  	program_name = command_str;
>  #endif
>  
> -	if (asprintf(&thread_id, "[thread:%d] ", gettid()) == -1)
> -		thread_id = NULL;
> +	if (igt_thread_is_main()) {
> +		thread_id = strdup(log_prefix);
> +	} else {
> +		if (asprintf(&thread_id, "%s[thread:%d] ", log_prefix, gettid()) == -1)
> +			thread_id = NULL;
> +	}
>  
>  	if (!thread_id)
>  		return;
