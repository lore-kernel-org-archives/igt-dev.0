Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31113606A31E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FUuAljrV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9877B10E298;
	Wed, 25 Nov 2026 09:49:16 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8623410E603
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 18:13:50 +0000 (UTC)
Received: by mail-dl1-f53.google.com with SMTP id
 a92af1059eb24-1ae7fc5681dso18846c88.1
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 10:13:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795544030; cv=none;
 d=google.com; s=arc-20260327;
 b=leNonjKt/MpGfA7XHZqS+22I0cv9kZxqCgs8lA5tnFVLGu44leminYXelYdz+4Fcys
 WqcALMJ/rPQ3slHCPctUqUrhLqrUTasw/tGhNph4fB9SxgF82e966Yd7Ba7Rb4w2mut+
 NTcn8GG/CBIXi549apApwJqySz7IVcYypw60LlttEzGk6FhDc4AJ0UOOaeGGKrJGQVn1
 xDkuRIiCiym/t16tmhaVHtm/F0U6ekN7m+SGIdJX7TXiNtrY8Nyvv5qk4gETMMj9CdfU
 YqAlpt3a/PV5KbPpf8NwyTFk+90LsintwQR9Z2mgt9ORiVILqGK4DgopqQwjRzMnAPkV
 HjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:mime-version:references
 :in-reply-to:dkim-signature;
 bh=GIze7OkjeIkTBx+ZDG+qgqp44Izrh6o/rEQnPmGKznY=;
 fh=+xHqR3B5FumEE7b0LrCehONs8vx+1nwDU7wiZCfB9Lw=;
 b=j2qw6aZg9zesC8TmemHcARi2FyRG/AQ8/rSW9egq7TeJcqxzgyPKP81Bn+oBG8EBhM
 kNd0pLwRWJNDWlyD0eQbB3ndBMxUDU4OCq388unfKeAO8+SPmnzDTKTDqmlg52DMH9xJ
 EZ5fT2hrH065YEL2jzfU2NBG98sAAR/XlBzCCWTccuGsQuGz7WIbGHV+sR0eODVbJcXR
 9Z7LdZtsR8YXlpBNAkNcxKeVz9m6kv6oShUxrZVGJMO0P5ncUGVNeoGflZzPPkZtZdzK
 cA+USyiE1bpzGdlI2o1L5wKZln0YudKZuleVYylBl+vONF76qNPy+Ma2G268+kcrFMFU
 M4Qw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1795544030; x=1796148830;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=GIze7OkjeIkTBx+ZDG+qgqp44Izrh6o/rEQnPmGKznY=;
 b=FUuAljrVxX560yIZtiiBRYhjGVNLQuHJCW5iYnxDTDQ9B49WhPmrEYky+zfP47HVza
 RconmKKKEyCyUfvBOfSYQcoY5TYPuKe7RQ3c+xUAmacrPS6nu+P6QGU2fqLvyoO4xLxK
 B+58Ixge3+FKTtdYt+NUnhfuB/aVMf0NuIGI66ymDQjDSt5Pv5pBetSiyeQydmgkT/zm
 5boYhgd0vnJF/QRXq8KTHN99Uo9CjxjJ1+RtFLkkNWN8563hQ92FGKK138WKe8BygqL8
 E9dxPo9fdpE8maJS3eUgm7Xo9/kQsFlitDIjZdZN6h3DiNefuLqV/RerYe3eR+/Szhy2
 c1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795544030; x=1796148830;
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=GIze7OkjeIkTBx+ZDG+qgqp44Izrh6o/rEQnPmGKznY=;
 b=XQZ/TOOQ8l1VZ8SawPSdrTdG7mHwXKDjT3XVJ9+HVbodLRXZTxy0TyE9H1eLQH2Suo
 wKZAnf53VP0VZwOB10urlxySSHVmrQwLyUgZaEzMixlqgmoXDNvf3egtRN5L3uf3MJrf
 spplZpGPmnKiQ4Sbt13nGTmHWTA918Tk37VVyoUxdPI61NY7MO/BImanYQuD2Zt+jP0U
 PzRlC4jNPysOn0b87CfLSUTiNJetLGsf4AyPiPx4Z7O2m/0k0uD3Lpz5cnSj+BHcDa7e
 iv4TDBhf48OKgfzRqZMD2m+P0ncmcACbIAZCC1sWbkldvi847rcJPFfJkWC6EX+ccQwM
 I/sw==
X-Gm-Message-State: APuU4Z+0ENTvLRkSTfPGmBN4XYxTprd+BbEYyX3dMIWLduM4+JQ1GfV6
 WGVlaZJ9YZXpDGWHW0iNohcAasIYq5Kir0vIxCu62HAsPLnpWlVa2kOHDdkiCFF1cFrAGB/heVk
 cyOav9D+dpqTkTt6sgNOAwL5CfuBJRl/NkwGtQUckB8pxeMPM2f/6v5OO
X-Gm-Gg: AZFdTZcrzubyhLFtnQmRXwvBJ9IUKy2fhAzXeWvl3f8ct04f4uWazkDg2aIxP2MioRM
 OTDW1DfpIakHYBCaCAGVN0X5gYtg3B1Mt8mT4eupTtx5WWW+YIzhZt7v3kC9RDOqDNQ4nh94KJB
 haYh7mB+aKanIMZfSX6XY7IDGeTkNAs5bEQsq3Q5Br7iPUyT6GuT8Deiq4YBF5vZnbZkhpaoNMM
 3Zl1SCfrpYqkwToFN5CcFykiPnJtqdPKJM9TfC3Fzgxd1ETOv8OtSmmOoIaorNMBbQDL0w+1tHY
 PMozCPoIpTZOGX+PhGn/GxpUcdodeYIi+mqmGrGMmeV6G5shGVpCpfda2fDOmobFTwxAjcG/R5D
 WryaLh9vE4z+7sWPgonHLFcKAfTa6PZAkckWg8ooYWdS5AfPluyDsUv1p4b3iFXErhtPm
X-Received: by 2002:a05:701a:cca2:10b0:139:90c3:391b with SMTP id
 a92af1059eb24-1b56336e369mr3099827c88.1.1795544028863; Tue, 24 Nov 2026
 10:13:48 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 13:13:48 -0500
In-Reply-To: <20261115001917.2933254-1-gildekel@google.com>
References: <20261114222911.1405626-1-gildekel@google.com>
 <20261115001917.2933254-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Gil Dekel <gildekel@google.com>
Date: Tue, 24 Nov 2026 13:13:48 -0500
X-Gm-Features: Aa3M54rekljj4xPa07WBQo-9hVsPrG7ZDat8pc0gS2Tal_TK7DQij4vVqjVtT54
Message-ID: <CA++eeRMKOEtOuHVCz3jG8OA9eOK1BDLfWa0J=9RPMjbb4znKyw@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 0/3] lib/igt_hdr: Find HDR in DisplayID EDIDs
To: igt-dev@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>, Jani Nikula <jani.nikula@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>, 
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 25 Nov 2026 09:48:20 +0000
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

Simon's libdisplay-info conversion [1] covers what patches 1/3 and 2/3
do here, so please consider those two withdrawn. Sincere thanks to
Simon for stepping in and putting that patch together. I tested it on
the panel that motivated this series and left feedback on his thread.

Patch 3/3 (reading /dev/kmsg in invalid-hdr) doesn't depend on the
EDID parsing; I'll resend it on its own.

Thanks,
Gil

[1] https://lists.freedesktop.org/archives/igt-dev/2026-November/118994.html
