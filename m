Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A880FE7718A
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 10:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337FB10EF52;
	Fri, 20 Dec 2024 10:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="XrJ7RdTf";
	dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A93110EF52
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 10:15:08 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so12280245e9.3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 02:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1734689707; x=1735294507;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/2BXmEdFFl9JkvSyGGJF+UN3Vbswx2MMIvD1YNGhOpU=;
 b=XrJ7RdTfJo53EK6bTADZL0mDjKDjh4/xCeEt55Pvug34NTMTVojG+KSZ6aUppEMQjF
 iEMACydGjgARMF8xnIwDjN5iRXqHDXVXLeEwssGX6lVNdQ4LJvQ5gkJMeJ+d40InD8WF
 UfdOaQ+t9rWL0x3JlVJ+5lb0XvwZIVKsb57rVPyGDBst6gne9/BqGUuPToofsKwBfzOC
 tm9ImekbyyHaW5cqQAg9xVcM+fVBhjaHX23zrQm49xQ4S1ybzgwHBZaU1FK0u+4e6JIQ
 oOLqJTRz7Jl62BNMf/IuUNlQ/9yC08B5f1SSM5ntBugLrZwKUn50MbR+6cCqEKhZUyL/
 52fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734689707; x=1735294507;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/2BXmEdFFl9JkvSyGGJF+UN3Vbswx2MMIvD1YNGhOpU=;
 b=RcsqirIrJ87ab/Hhi2LKW8NTEyj5YKQf2iOdEqeQRyONsIDhGKORGQ89vf28i6v8jL
 CsbPuW5PBJ4TiADkZXYG3xKFAxO7aB9NUb8YCGLCqDgdy6jIgRbRN/UqcqGVP1ld4OIS
 zkYzj6Hca0TjbnuorNraynDpKiUStNkfSa4/GWhLa9vsrv07JSyeBlbq+HaMXtJTc91F
 S2ferprwILe7pboS0KhwLyoF9ATBC7/gLCqWjpqkkBXGko5CsTawMTZGwprBxZYu5/IH
 lH5GyIkGv8umQWQjNCg42V9pilWp0KdOkrBnQFwEBYtKHeb53DWnkeAm/deo/qw4DMpt
 twHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx/j+EQ/tGi6jUQY7CxQbLKsVpDGYQNiub24ZF+F6D/fEJqsBC7WimuA6NFxK7V85Afkp+hzCY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS6nk96dQ9ir2OaEixk3ONI9aisss4Odzj/r61fucWVveo2SnC
 MuEO4sYZkO5VoKSHvepI88N2/HhY3wU35QHGpzGdrnCnVFKWTFwEzlM10HadOfs=
X-Gm-Gg: ASbGnctW51CMVINXlxZBipWJK0fY/ETGLi+YPJnBPJ4kK41MYtzf4r8mP34mWGREQMw
 BYgp3P9vNy8NtYIwh9O5Z39hVM5aydyvYW0wmpmHUHssqDeyAs9dt7ydY6++kiXVyqzHfhgCdwJ
 lkZqMAFvI1YeqKgUg9LRlixvZnKogUozWbBt95L2hmpycz1xBOaM9vnATrIqEcB4dB+q/KajA9w
 vasBhAfwlsXKsZC2OuQ9/irX/T67Xcn7EmJL0g4rSKiJSHVcZ6UIvrHtCM42YKvScvzHhJB
X-Google-Smtp-Source: AGHT+IEhLs7l4M2iucwP0LBIVLQXErxDIdfGVuE6OiYMUpZspGL2E/zjijIDJYzCJsBJmoPAl5P/Aw==
X-Received: by 2002:a5d:64c8:0:b0:388:c75c:e839 with SMTP id
 ffacd0b85a97d-38a223f7167mr2145163f8f.42.1734689706801; 
 Fri, 20 Dec 2024 02:15:06 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4365c08afcbsm52232025e9.21.2024.12.20.02.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2024 02:15:06 -0800 (PST)
Message-ID: <7d77e830-54c1-42c0-9402-16937697d2bb@ursulin.net>
Date: Fri, 20 Dec 2024 10:15:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 0/4] tools/gputop: Add PMU stats
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20241220003734.69174-1-vinay.belgaumkar@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241220003734.69174-1-vinay.belgaumkar@intel.com>
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


On 20/12/2024 00:37, Vinay Belgaumkar wrote:
> Use the PMU support being added in
> https://patchwork.freedesktop.org/series/139121/ to add freq/c6 stats.

Brace yourself for the customary "why". So yes, why?

Gputop so far was a reference showcase for DRM fdinfo, nothing more. Why 
add a _subset_ of PMU stats to it? Any other drivers could be wired up? 
How far do people intend to grow it, considering alternatives with nicer 
UI and more featureful exist?

Or in case the conclusion ends up being "yes", then lets at least share 
some more code between intel_gpu_top and this work. Ie. make it in a way 
gputop completely subsumes and replaces intel_gpu_top might be an idea.

Regards,

Tvrtko

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> Vinay Belgaumkar (4):
>    tools/gputop: Define data structs for PMU stats
>    lib/igt_drm_clients: Add pdev and driver info
>    lib/igt_perf: Add utils to extract PMU event info
>    tools/gputop: Add GT freq and c6 stats
> 
>   lib/igt_drm_clients.c |   6 ++
>   lib/igt_drm_clients.h |   4 +
>   lib/igt_perf.c        |  68 +++++++++++++
>   lib/igt_perf.h        |   2 +
>   tools/gputop.c        | 225 ++++++++++++++++++++++++++++++++++++++++++
>   tools/meson.build     |   2 +-
>   6 files changed, 306 insertions(+), 1 deletion(-)
> 
