Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9F5C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 07:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A842010F010;
	Tue, 16 Apr 2024 07:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="dhihuxJK";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BEE10EFC3
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 07:49:49 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-417e327773cso25051025e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1713253787; x=1713858587;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QiSAdCw9IY3TsiSwocogdX1UvibBENisFH+nW4RZSKA=;
 b=dhihuxJKTvb9Di9Gj6RbX1/VThBC+h02c8TK5HPlaRbzyPgvoBas+cBuqPWlZ83c+l
 1PZEP0ZqKRBx2BEeNe2TEWlzNNh14B/E9Mp7170DQclESg3sZu5pdhiAvK7b/NQ5DW68
 ecAlfeYMKjIhMiYm6WIl0Z2eWwMkJCfc1jqLDLEj1Ja8DnPnS0Fsdhk5Hq+PAu+NXBBG
 BrFKZWKdsDzgytoAqR4VjAGe8MfhT7EQ7Eau6/C0M/UW/vP7Uk0KsgqMfwpzNru6X85z
 go58EvXKFUEaW4mIEbeCqs7fbQCmYN6zbISpkRHqm7WauNHokGopE5MyDh7djMEyLYtC
 robg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713253787; x=1713858587;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QiSAdCw9IY3TsiSwocogdX1UvibBENisFH+nW4RZSKA=;
 b=WVXEMHTyAmZdEcyLHVJepoyA3KBBxX/9/p0sEhdXSUwsWM13Aww5wRqVmxPLfacZy+
 LmccklBpl/dfARdtvPFlJ/PNweZZrWfbl9FuhzKBiU3baz9gD1Wpfbof2QrqDa1BlNj8
 +ewsqRp7FHdOBd/S55r51vke96/v+whkQCSrUoA1PmlSEi4ZEfXTn3/R2aT5YKkSCb1Y
 lmiJXqYKM+qoGdJ33Asb2o3TNKaGYAuLWlBUoIbrtHB2VZHmpyEmYo8rN5MpnsZ0Fs5/
 IZ6ezFbPU5awT4UQ5iA/VZB1xm+YcvWc58yR1nWMSIgA6901S0GjjfxyVSpKNHCE5KFp
 n7Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6v3oNCtn7I4l8oOhmCb8KxWnXw/b+My1FToUjMYxYRQGYRSYlakaTNyLxdx/KuLWQQ+kYNJZ2Z/cMbaIKz+9UVehqeMSFBn5blcmeLA==
X-Gm-Message-State: AOJu0YzVFAHAu8H9d0YzEL+ZvZfPU0FN7Ym030u8ZtijNDQ3XrhelVJZ
 dxR73Ahae7Pl9RHL6w6UYvlALXLdPVW6KwsLN3MTRdXrXB3vq8JwaZLPLWWA+CQ=
X-Google-Smtp-Source: AGHT+IFJ1PXl6AuW4PvsnHx/PuXW+vMAquhVFnO8yrXmIjfH3mWTmKVlDH0rDc4K939toMwnrWsgxQ==
X-Received: by 2002:a05:600c:3b0d:b0:416:71ac:1bef with SMTP id
 m13-20020a05600c3b0d00b0041671ac1befmr970153wms.13.1713253787200; 
 Tue, 16 Apr 2024 00:49:47 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a05600c348d00b004186eb69a55sm5374235wmq.25.2024.04.16.00.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 00:49:46 -0700 (PDT)
Message-ID: <0b34d35a-dd06-4700-a2ab-7118fc5b660e@ursulin.net>
Date: Tue, 16 Apr 2024 08:49:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tools/gputop: toggle sysfs profiling knob if
 available for device
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, daniel@ffwll.ch,
 boris.brezillon@collabora.com, zbigniew.kempczynski@intel.com,
 healych@amazon.com, kernel@collabora.com
References: <20240402222813.277470-1-adrian.larumbe@collabora.com>
 <20240402222813.277470-3-adrian.larumbe@collabora.com>
 <20240403172236.zi7ruqdyzdto2q45@kamilkon-desk.igk.intel.com>
 <qzyjvkeieoxxalgsrv33zau34b6onf6bdababiynvy7ffbxkoj@lrfaipvmlc4n>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <qzyjvkeieoxxalgsrv33zau34b6onf6bdababiynvy7ffbxkoj@lrfaipvmlc4n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 15/04/2024 20:35, Adrián Larumbe wrote:
> On 03.04.2024 19:22, Kamil Konieczny wrote:
>> Hi Adrián,
>> On 2024-04-02 at 23:27:45 +0100, Adrián Larumbe wrote:
>>> For every DRM device that enables its job accounting HW from user space,
>>> toggle it right before obtaining per-client fdinfo numbers.
>>>
>>> Make sure profiling status is returned to its original state before
>>> exiting, by handling the SIGINT signal just like in intel_gpu_top.
>>>
>>> Also dynamically link gputop against igt lib instead of separate per-file
>>> static libraries to avoid dependence cascade because of using igt_sysfs
>>> functions.
>>>
>>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>> ---
>>>   tools/gputop.c    | 30 +++++++++++++++++++++++++++++-
>>>   tools/meson.build |  2 +-
>>>   2 files changed, 30 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tools/gputop.c b/tools/gputop.c
>>> index 71e28f43ee4c..5b390cbdb3e7 100644
>>> --- a/tools/gputop.c
>>> +++ b/tools/gputop.c
>>> @@ -26,8 +26,10 @@
>>>   #include <sys/sysmacros.h>
>>>   #include <stdbool.h>
>>>   
>>> +#include "igt_device_scan.h"
>>>   #include "igt_drm_clients.h"
>>>   #include "igt_drm_fdinfo.h"
>>> +#include "igt_profiling.h"
>>>   #include "drmtest.h"
>>>   
>>>   static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
>>> @@ -243,9 +245,17 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
>>>   
>>>   }
>>>   
>>> +static volatile bool stop_top;
>>> +
>>> +static void sigint_handler(int  sig)
>>> +{
>>> +	stop_top = true;
>>> +}
>>> +
>>>   int main(int argc, char **argv)
>>>   {
>>>   	unsigned int period_us = 2e6;
>>> +	struct igt_profiled_device *profiled_devices = NULL;
>>>   	struct igt_drm_clients *clients = NULL;
>>>   	int con_w = -1, con_h = -1;
>>>   
>>> @@ -253,9 +263,22 @@ int main(int argc, char **argv)
>>>   	if (!clients)
>>>   		exit(1);
>>>   
>>> +	igt_devices_scan(false);
>>> +
>>> +	profiled_devices = igt_devices_profiled();
>>> +	if (profiled_devices != NULL)
>>> +		igt_devices_toggle_profiling(profiled_devices, true);
>>> +
>>> +	if (signal(SIGINT, sigint_handler) == SIG_ERR) {
>>> +		fprintf(stderr, "Failed to install signal handler!\n");
>>> +		igt_devices_toggle_profiling(profiled_devices, false);
>>> +		free(profiled_devices);
>>> +		profiled_devices = NULL;
>>> +	}
>>> +
>>>   	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>>>   
>>> -	for (;;) {
>>> +	while (!stop_top) {
>>>   		struct igt_drm_client *c, *prevc = NULL;
>>>   		int i, engine_w = 0, lines = 0;
>>>   		struct winsize ws;
>>> @@ -293,5 +316,10 @@ int main(int argc, char **argv)
>>>   		usleep(period_us);
>>>   	}
>>>   
>>> +	if (profiled_devices != NULL) {
>>> +		igt_devices_toggle_profiling(profiled_devices, false);
>>> +		free(profiled_devices);
>>> +	}
>>> +
>>>   	return 0;
>>>   }
>>> diff --git a/tools/meson.build b/tools/meson.build
>>> index ac79d8b5840c..a126d6cad7ba 100644
>>> --- a/tools/meson.build
>>> +++ b/tools/meson.build
>>> @@ -68,7 +68,7 @@ endif
>>>   executable('gputop', 'gputop.c',
>>>              install : true,
>>>              install_rpath : bindir_rpathdir,
>>> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
>>> +           dependencies : [lib_igt, lib_igt_drm_clients, math])
>>
>> Why not creating lib_igt_profiling with only needed dependeces and
>> adding it here? Before your patch:
>>
>> ldd build/tools/gputop
>>
>> linux-vdso.so.1 (0x00007ffc5e120000)
>> libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007bf0a4200000)
>> /lib64/ld-linux-x86-64.so.2 (0x00007bf0a452b000)
>>
>> After:
>>
>> ldd gputop |wc -l
>> 78
> 
> I guess if dynamic library dependencies are seen as undesirable for gputop, then
> I'll try to do as you suggested, but I suspect a hypothetical lib_igt_profiling
> static library will contain most of the object files in igt_lib's lib_sources
> list of files.

It is correct that a goal so far was to avoid linking tools/ (outside 
tests/ even) with igt_igt. But you use quite a lot of lib_igt stuff in 
this work right? I am not sure it is easy to split it all out into 
separate libraries. Question for IGT maintainers.

Regards,

Tvrtko

> 
>> Regards,
>> Kamil
>>
>>>   
>>>   intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>>>   executable('intel_l3_parity', sources : intel_l3_parity_src,
>>> -- 
>>> 2.44.0
>>>
> 
> Adrian Larumbe
