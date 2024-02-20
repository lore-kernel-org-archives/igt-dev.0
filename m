Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0790CC5475B
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 14:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4C810E448;
	Tue, 20 Feb 2024 14:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hJQtTnyJ";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860FF10E435
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708439421;
 bh=D0Xz700RmjGA9c2br8TNDXw4otjqwogYieAztI2QHq8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hJQtTnyJVRxUxTz6ktltvZeEUhsdVlNkYC+isL+Do+wQnumRTLs96mh1YwAkBSTHz
 8J6sSZHHRBqz17gdBBbNARq6QQBpiK/Zot6U12MqSyGArJeTgY2WpddTPZSoh1Y+3u
 mOAWvmQSPswpfXnjkjvh61ggZxIDwUcFFUpKKsNPLC23XtwF76Lj4ggX9Vk62Dc0Gu
 XU4qjVKbzMOLjV/vy518Te08GkkTwhnIxlI1b7SupqWW1Sp+wDNHlfv1JmgrrPnvYN
 I9OZwZPH340H/8+s0HDOB8ZcUm7VLeh8iOPiMd5hMW2knFFj3Qpo13o38L7wX3keZN
 7+XV/hya6/bYQ==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 592CD3780627;
 Tue, 20 Feb 2024 14:30:19 +0000 (UTC)
Message-ID: <4a1eb21a-c3bd-486c-b0ba-a65ab490ed0d@collabora.com>
Date: Tue, 20 Feb 2024 11:30:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 0/3] print info in core_getversion
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Rob Clark <robdclark@chromium.org>
References: <20240220101953.64371-1-kamil.konieczny@linux.intel.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240220101953.64371-1-kamil.konieczny@linux.intel.com>
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



On 20/02/2024 07:19, Kamil Konieczny wrote:
> Reorganize core_getversion test, make it a basic subtest which
> prints info from ioctl. Add also multigpu subtest for all drm
> cards.
> 
> Cc: Helen Koike <helen.koike@collabora.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Rob Clark <robdclark@chromium.org>
> 
> Kamil Konieczny (3):
>    tests/core_getversion: convert to subtest
>    tests/core_getversion: print version info
>    tests/core_getversion: test all drm devices
> 
>   tests/core_getversion.c | 50 ++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 44 insertions(+), 6 deletions(-)
> 

Hello,

For some reason I didn't receive the patches in my email box, so let me
write here:

On patch 3/3:

+	igt_describe("Check GET_VERSION ioctl for all drm devices.");
+	igt_subtest("multigpu") {
+		int fd2;
+
+		for (int i = 0; i < 16; ++i) {

it would be great to replace this 16 by a defined macro.

+			fd2 = __drm_open_driver_another(i, DRIVER_ANY);
+			if (fd2 == -1)
+				break;

shouldn't it be a "continue" instead of break ?

+
+			check(fd2, info, sizeof(info));
+			igt_info("%d: %s\n", i, info);
+			drm_close_driver(fd2);
+		}
+	}

Regards,
Helen
