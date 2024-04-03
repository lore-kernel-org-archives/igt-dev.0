Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E30CD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 16:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2594112CA9;
	Wed,  3 Apr 2024 16:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="EjWVFFah";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927BA112CA9
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 16:24:55 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-34356f794a5so2237893f8f.1
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Apr 2024 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1712161494; x=1712766294;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fpeL1l02xJRcTfDfVx2cLZRk+iZuN/Q3US7N0obMf+8=;
 b=EjWVFFahDATDeT1bgUAohwx3ko4NBS+mNKM495QKl6JgvxAXjALGnnrVNucuC7pyUE
 EvNXcunrJQ5zk7kLOnxVomJ4vX1O2nU3+CTg6rMEoMiCJs5DaXL5TzpsZKFnI4btFgJ2
 +Q9KSoBcxKXH3DlzeLnUCCv0RPFmYFPBW87GCGZ5At3mTvVNPRmMPfzo1Zo04pOZL5b7
 EqMD3XPe2ObwR//qFLqmzbLXGVSfB4nQV7bcEsFEE+lImvgQbMAXDStO5sYGbgseeI8Y
 ZlpK4XgwL6hkqgGZTlJYZL0fGO3QkFne7rPXXYVh7VbrciKwblqXFnAj8HOGw21f9sfC
 EeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712161494; x=1712766294;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fpeL1l02xJRcTfDfVx2cLZRk+iZuN/Q3US7N0obMf+8=;
 b=Ma0o/s6oiCkWSMjMAV6p59MvQoFbWeMYtLYNZXb4P0zKGd7qETcM0ZQiF59NkXIMBW
 Rc3zj7P6SaHTbzCEn8jd5XfIqqaniifCEx8e5KkFhRL7M1RzX4pVpaH/7wfJ3uvsnf+W
 03L2WVpz7tHpHyfs2HIDUXzzC1NMN1irA0jt2KzOnNZeheyoK60yRJoRbQfIuvx/S4md
 xuhV0NsxawHuMTGoTT3uNJk/+cwjmdef8dTFwS6urRG4denL1dRXxczn6NmKk9cFO6/X
 q6W3YmETT8uk4fW0bGpTkukZ2zxw1PZo2thWpRX4zX3G8xzWhu6TL7p8nGJ9k+XH/Drd
 TS7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcR0B8GhOnOV2gC6X0WODTvOe63XgS/s4Nnr9AD6/IHoafGeQEGF7H74oqCkuIHgUwuHPaeJmrWTXz+7skILbblUTWgSCIOYxSVWKrSg==
X-Gm-Message-State: AOJu0YyGy39f9RkM5xUfWTYvz+KmQLjNroZW20SlS+6KvWHctajlk4on
 lN7G7thaTiMl6ojhGvYC+Lpbi25HjAIUrk3vFkLLUMu53DHEbGRrGT8wYxu4an8=
X-Google-Smtp-Source: AGHT+IE57BnmLbWYgrXN1vxz2v85CgekkFgO+YoXdlOJFSgkDwv5Dumss98qCVg8Ca4BQzd9KRx3BA==
X-Received: by 2002:adf:fe43:0:b0:33f:6ec1:56dd with SMTP id
 m3-20020adffe43000000b0033f6ec156ddmr4841120wrs.45.1712161493896; 
 Wed, 03 Apr 2024 09:24:53 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a056000038500b00343491b9cbesm10450651wrf.41.2024.04.03.09.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 09:24:53 -0700 (PDT)
Message-ID: <aaab8699-399e-4d1d-8922-1e303eef103e@ursulin.net>
Date: Wed, 3 Apr 2024 17:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 8/8] lib/igt_drm_clients: lazy stat process
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
 <20240402221716.1840148-9-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240402221716.1840148-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 02/04/2024 23:17, Lucas De Marchi wrote:
> Only try to get task data like pid and name when that is required.
> Typically most of the processes in a system don't have a drm fd open.
> So only open and use /proc/<pid>/stat when it's needed.

This sounds like a very good optimisation to me too and I also don't 
understand how it could be making things less efficient (as you say in 
the cover letter). Unfortunately I will not have time to cross check in 
the next week or so.

Regards,

Tvrtko

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   lib/igt_drm_clients.c | 50 +++++++++++++++++++++----------------------
>   1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
> index c174c96ab..1e9781c68 100644
> --- a/lib/igt_drm_clients.c
> +++ b/lib/igt_drm_clients.c
> @@ -367,26 +367,33 @@ static size_t readat2buf(int at, const char *name, char *buf, const size_t sz)
>   	}
>   }
>   
> -static bool get_task_name(const char *buffer, char *out, unsigned long sz)
> +static void get_task_data(int pid_dir, unsigned int *pid, char *task, size_t tasksz)
>   {
> -	char *s = index(buffer, '(');
> -	char *e = rindex(buffer, ')');
> -	unsigned int len;
> +	char buf[4096];
> +	char *s, *e;
> +	size_t len;
>   
> +	if (!readat2buf(pid_dir, "stat", buf, sizeof(buf)))
> +		return;
> +
> +	s = strchr(buf, '(');
> +	e = strchr(s, ')');
>   	if (!s || !e)
> -		return false;
> -	assert(e >= s);
> +		return;
>   
>   	len = e - ++s;
> -	if(!len || (len + 1) >= sz)
> -		return false;
> +	if (!len)
> +		return;
>   
> -	strncpy(out, s, len);
> -	out[len] = 0;
> +	if (len + 1 > tasksz)
> +		len = tasksz - 1;
>   
> -	return true;
> +	strncpy(task, s, len);
> +	task[len] = 0;
> +	*pid = atoi(buf);
>   }
>   
> +
>   static bool is_drm_fd(int fd_dir, const char *name, unsigned int *minor)
>   {
>   	struct stat stat;
> @@ -480,13 +487,11 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
>   		return clients;
>   
>   	while ((proc_dent = readdir(proc_dir)) != NULL) {
> -		unsigned int client_pid, minor = 0;
> +		unsigned int client_pid = 0, minor = 0;
>   		int pid_dir = -1, fd_dir = -1;
>   		struct dirent *fdinfo_dent;
>   		char client_name[64] = { };
>   		DIR *fdinfo_dir = NULL;
> -		char buf[4096];
> -		size_t count;
>   
>   		if (proc_dent->d_type != DT_DIR)
>   			continue;
> @@ -498,17 +503,6 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
>   		if (pid_dir < 0)
>   			continue;
>   
> -		count = readat2buf(pid_dir, "stat", buf, sizeof(buf));
> -		if (!count)
> -			goto next;
> -
> -		client_pid = atoi(buf);
> -		if (!client_pid)
> -			goto next;
> -
> -		if (!get_task_name(buf, client_name, sizeof(client_name)))
> -			goto next;
> -
>   		fd_dir = openat(pid_dir, "fd", O_DIRECTORY | O_RDONLY);
>   		if (fd_dir < 0)
>   			goto next;
> @@ -541,6 +535,12 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
>   						 minor, info.id))
>   				continue; /* Skip duplicate fds. */
>   
> +			if (!client_pid) {
> +				get_task_data(pid_dir, &client_pid, client_name,
> +					      sizeof(client_name));
> +				assert(client_pid > 0);
> +			}
> +
>   			c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_PROBE,
>   						 minor, info.id);
>   			if (!c)
