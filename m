Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E701AD37480
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 12:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D9110E12B;
	Thu, 17 Oct 2024 12:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PLXodPo3";
	dkim-atps=neutral
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6366F10E083
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 12:27:08 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-20cceb8d8b4so5414635ad.1
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 05:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729168028; x=1729772828; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WHC8BJsYJ9HPf+ZXXvVhx0r3TUEgcRHvpJFVMB4yulE=;
 b=PLXodPo3kjbwNysa5BVdgRt4+BmqOg00TouXb+mb01YRaMCs5rM77czCAL9Sj27js+
 f4JHhRmG9uEm0GvajdLSjMC3gWgPBhnD+tO/DbeKmMj1+Vdy2z+Hb3oRbiiKmxlk2q9b
 +IErMy2WqFgEiYrqyQk//8zLQfydcnIJXETKmvLyh6tDnhPX1aQzDQIE7kEnVe6QksQf
 k1f4xoh5qNXfBqjd+WV2WkYdDD5xQQOWcuHeG9CdVa/2ZvIDEw7xTmthRCSrly4sXlhq
 jtM5TwHLVxVNteM/fcYQnDyqrTDnPuYeHtCUTEwHdFZ8vM4X0hHHW7Zd6JwnxSqViDRl
 mjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729168028; x=1729772828;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WHC8BJsYJ9HPf+ZXXvVhx0r3TUEgcRHvpJFVMB4yulE=;
 b=Od8a7tVb6nLO6rI/iymhN56aEDdJEFtc/KEqXjC8xJ4EUxF44Q7ND/3qfdADt788Y6
 xuea7VXxVUiqgCUfhb2mDd4yfv9KHBjMgIq2RFokLbrkehezKqmHx4uxg7PRcQzH3wI/
 dGGeQm7hBypS/VIfO5CYs/paxulgFkP1+IFCPTz9FcssY0MG3fW0nYwePanuhfDAzRtW
 0SuWV6xWjSkQIkb/yctbfgot0A5wqXPoOcF9YuZ6nuxsxsr/e9IU77vAp/Oj7uc2cxhg
 J6GX+3RKTSVmIA/7EkuZ5A3GLiD0ROUbF5g48Gv5ElTQ4JlrryMnRfMZZOyAK7rKmaSd
 C8xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ7uO7LZzDOHhSwcg9i1WNW43mwNpQAktqQH8nj33mjiKldUH8UwgBM+BMlMmHbwFG3l/j+IXx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGp3BS8ek9A9i3dKt8oI+q4U/IP21yWuLqNLqkpYmwbZPbKsX4
 B4fwK4suXnWfMLhFLSYoBWvO7qXPcwXM6uo5Y891GTFxIvfd9iWCbA/yw7S+CJC+kLQsbAZMMg=
 =
X-Google-Smtp-Source: AGHT+IHL7emwZahW2uRCT8Y05xKzkbejKN14litx89NPL5VKxAnJNZ7DCl/RNirDVCkhwE2e33s8gA==
X-Received: by 2002:a17:902:c945:b0:20c:8f98:5dbb with SMTP id
 d9443c01a7336-20d47925907mr39009345ad.16.1729168027849; 
 Thu, 17 Oct 2024 05:27:07 -0700 (PDT)
Received: from [134.134.137.78] ([134.134.137.78])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20d1805ca6bsm43374145ad.267.2024.10.17.05.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 05:27:07 -0700 (PDT)
Message-ID: <4cc748ba-51a3-4f16-9e6b-dbfc4123afa6@gmail.com>
Date: Thu, 17 Oct 2024 17:57:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] MAINTAINERS: Change Bhanuprakash's email address
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20241017121852.45488-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@gmail.com>
In-Reply-To: <20241017121852.45488-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 17 Oct 2024 12:37:41 +0000
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


On 17-10-2024 05:48 pm, Kamil Konieczny wrote:
> Current one will become inactive in few weeks.
> 
> Cc: Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Acked-by: Bhanuprakash Modem <bhanuprakash.modem@gmail.com>

> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1a310ef26..90c3c0880 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2,5 +2,5 @@ Petri Latvala <adrinael@adrinael.net>
>   Arkadiusz Hiler <arek@hiler.eu>
>   Kamil Konieczny <kamil.konieczny@linux.intel.com>
>   Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> -Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> +Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
>   Ashutosh Dixit <ashutosh.dixit@intel.com>

