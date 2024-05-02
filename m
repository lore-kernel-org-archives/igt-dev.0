Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5393FC25B4F
	for <igt-dev@archiver.kernel.org>; Thu,  2 May 2024 10:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADCF10E2CF;
	Thu,  2 May 2024 10:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="J2iZsz1A";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8410F10E2CF
 for <igt-dev@lists.freedesktop.org>; Thu,  2 May 2024 10:20:51 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-41b869326daso43870105e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 02 May 2024 03:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1714645250; x=1715250050;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jxy1uLR3EAjAb4p0qWT1MKZISuWX+ia28P9UdSZhbHI=;
 b=J2iZsz1AvR5X5YSy6J9Okfii1pXGoedsBxgfL83XVHnCCdoLbN4jxSln3i/B7LGFS0
 LHp6efZIPjil98O0/rug6CykQGCeWp6gDuTj/1b8Ij3l7Wu/bZ4gGf5xU2cjZR3muCmb
 Esskm98GuPQuDQdWnTKYEDeMnPMY/Lb7XMhbPm8XEZGVfKTqdb9faD8yh7GkWctEhoy3
 TfEA1WFl+rIJpgkMefay0GtgLC17BMMtqpmOTaSUuIuoBfqN2qNhQjqbmIGvox+IE2bY
 dqi4djZc1L/r+WBYDRWGgjvgMfLQWMQ0swWiS1RJmLC91BL3ta2CMfuv2jBQfHqhkLl0
 xweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714645250; x=1715250050;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jxy1uLR3EAjAb4p0qWT1MKZISuWX+ia28P9UdSZhbHI=;
 b=JruN2igg+ba12q64TpKQLByX7RInA3My8zHhi0IhVrv1usCP6APFupuYl/Hyiy+R+p
 luWLN/4zaeQRm8xaYUFrZ6ymzA0DIQFayMOjhRa0EJwKfu30iRyH5YHjSSEX3jeG8d+y
 RjSWESBjMNBPK1ILpQQL4VVqXcfkzPUtkT2LWmMENWpgNMiZ+TesQl+ZdOkwujTzZ4Mj
 klUh9eKq0C60hJCWl+ZPSIY2rt1AJhHvh/jZWPsEw1CGXQim9sQLw5hmzEiivrHWtMng
 vO3jYesMJLqnSJlAcPS3N6JUTSYcev78LYE5VRfJZloZSLJ/yoTKxTO1PLYn/2YMtN8C
 I6BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxlKD41Z0niG8vXmYiLkCJdgCgm4tyemDP+NbUV3OOuv3pe3szVIUY+Frb5xYlU5s9unkwy46o60yfcEPjQvQRdTPGrCK+e0PmPt3omA==
X-Gm-Message-State: AOJu0YxTUOUtYpc+f4CUN27Dzcpay85GbxC5DpJL3MrXIVcjRc4Htj8z
 lB9s0Yp+dIVtFpKnvvpNsxfmHDF02FpSX7M2L22W35twuN9bjLM5eA4A9ipmF58=
X-Google-Smtp-Source: AGHT+IEA/01hBZCRfHvGVRtRf5qbT0eg24kdUrNZMTfgSKKcne3d9lvtwyDs2Gmhi6hzNweETlgWQA==
X-Received: by 2002:a05:600c:4590:b0:418:e4ac:70b7 with SMTP id
 r16-20020a05600c459000b00418e4ac70b7mr1371894wmo.11.1714645249584; 
 Thu, 02 May 2024 03:20:49 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm1444766wmq.7.2024.05.02.03.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 03:20:49 -0700 (PDT)
Message-ID: <238aa521-ba0d-47a7-aba5-67b88d75c758@ursulin.net>
Date: Thu, 2 May 2024 11:20:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/igt_drm_clients: lazy stat process
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240501174001.121324-1-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240501174001.121324-1-lucas.demarchi@intel.com>
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


On 01/05/2024 18:38, Lucas De Marchi wrote:
> Only try to get task data like pid and name when that is required.
> Typically most of the processes in a system don't have a drm fd open.
> So only open and use /proc/<pid>/stat when it's needed.
> 
> For the data below, system is running with just a single drm client:
> 
> Before:
>   Performance counter stats for './build/tools/gputop -d 0.1 -n 10':
> 
>              507.19 msec task-clock                       #    0.334 CPUs utilized
>                  29      context-switches                 #   57.178 /sec
>                   4      cpu-migrations                   #    7.887 /sec
>                  75      page-faults                      #  147.874 /sec
>         (...)
>         1.518253637 seconds time elapsed
>         0.007989000 seconds user
>         0.503351000 seconds sys
> 
> After:
>   Performance counter stats for './build/tools/gputop -d 0.1 -n 10':
> 
>              384.01 msec task-clock                       #    0.275 CPUs utilized
>                  17      context-switches                 #   44.270 /sec
>                   1      cpu-migrations                   #    2.604 /sec
>                  74      page-faults                      #  192.705 /sec
>         (...)
>         1.397640800 seconds time elapsed
>         0.008106000 seconds user
>         0.385048000 seconds sys
> 
> Looking only at the execution time of igt_drm_clients_scan() over 10
> runs.
> Before: 47138890 nsec
> After:  33978388 nsec
> 
> So in both methods it shows a ~25% speedup. It is expected that in a
> system with more clients this won't be as high.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> Extracted as is from https://patchwork.freedesktop.org/series/132059/ as
> not really related.
> 
>   lib/igt_drm_clients.c | 50 +++++++++++++++++++++----------------------
>   1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
> index 40d494441..ab0c2cec2 100644
> --- a/lib/igt_drm_clients.c
> +++ b/lib/igt_drm_clients.c
> @@ -368,26 +368,33 @@ static size_t readat2buf(int at, const char *name, char *buf, const size_t sz)
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
> @@ -481,13 +488,11 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
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
> @@ -499,17 +504,6 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
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
> @@ -542,6 +536,12 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
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

Nice improvement and well spotted!

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
