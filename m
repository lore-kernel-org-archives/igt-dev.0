Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B051611364B
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 23:52:00 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id l81so19393221oif.9
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 16:52:00 -0700 (PDT)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: igt-dev@lists.freedesktop.org,
	ryszard.knop@intel.com
Date: Tue, 28 Jun 2022 20:51:43 -0300
Message-Id: <20220628235143.79978-1-maira.canal@usp.br>
In-Reply-To: <20220628094435.854519-3-ryszard.knop@intel.com>
References: <20220628094435.854519-3-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t,2/7] runner: make the usage function variadic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 6/28/22 11:44, Ryszard Knop wrote:
> For easier error logging, make the usage() function variadic and pass
> its arguments to vfprintf. Additionally, reorder its arguments so that
> it visually matches all the printf functions.
> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---

Hi,

Overall this looks good, just a small typo.

> @@ -806,24 +808,19 @@ bool serialize_settings(struct settings *settings)
>  
>  	if (!settings->overwrite &&
>  	    faccessat(dirfd, settings_filename, F_OK, 0) == 0) {
> -		usage("Settings metadata already exists and not overwriting", stderr);
> +		usage(stderr, "Settings metadata already exists and not overwriting");
>  		return false;
>  	}
>  
>  	if (settings->overwrite &&
>  	    unlinkat(dirfd, settings_filename, 0) != 0 &&
>  	    errno != ENOENT) {
> -		usage("Error removing old settings metadata", stderr);
> +		usage(stderr, "Error removing old settings metadata");
>  		return false;
>  	}
>  
>  	if ((fd = openat(dirfd, settings_filename, O_CREAT | O_EXCL | O_WRONLY, 0666)) < 0) {
> -		char *msg;
> -
> -		asprintf(&msg, "Creating settings serialization file failed: %s", strerror(errno));
> -		usage(msg, stderr);
> -
> -		free(msg);
> +		usage(msg, "Creating settings serialization file failed: %s", strerror(errno));

I believe this should be:
    usage(stderr, "Creating settings serialization file failed: %s", strerror(errno));

Reviewed-by: Maíra Canal <maira.canal@usp.br>

Best Regards,
- Maíra Canal

>  		close(dirfd);
>  		return false;
>   }
