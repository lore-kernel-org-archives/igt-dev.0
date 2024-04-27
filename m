Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B041C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 06:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EDD10FFA0;
	Mon, 29 Apr 2024 06:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ourmail.work header.i=@ourmail.work header.b="kEc+jJNi";
	dkim-atps=neutral
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D3C1127CB
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Apr 2024 07:07:00 +0000 (UTC)
Date: Sat, 27 Apr 2024 07:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ourmail.work;
 s=default; t=1714201617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HfnoYtwRsdq8efeTLLJarbc0ji2AaIO2xjaMwarjWlE=;
 b=kEc+jJNiTFIw59esenPBMNc5bGeIcubAqyFAJ5bvuLp9ka7+vUrPF+T8Qt9Sc6Wy9Atbyg
 HQ3NU+Z0/5nAM/pQMAl0sjPP9eFG8iTNq7VMugWarWu1chNATGI9KuJ8/w6NmsOGryaemw
 fSGJxk0xmJODdtZ+YErnACxcsgL5Usc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Reagan Bohan <reagan@ourmail.work>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Reagan Bohan <xbjfk.github@gmail.com>
Subject: Re: [PATCH 2/3] Change sys/poll.h to poll.h
Message-ID: <20240427070648.6wqhmo663su3mliv@reagan.home.arpa>
References: <20240421232204.31704-1-reagan@ourmail.work>
 <20240421232204.31704-3-reagan@ourmail.work>
 <20240422154810.tz7xjqkviqiaz5bj@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422154810.tz7xjqkviqiaz5bj@kamilkon-DESK.igk.intel.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 29 Apr 2024 06:21:21 +0000
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

Hi Kamil,

I am relatively inexperienced with email patches, so I appreciate your
patience.

> In what project is it emitting this?

musl libc installs sys/poll.h as a header which just includes poll.h and
emits a warning (with #warning), so each usage of sys/poll.h emits a
noisy compiler warning.

I will take the rest of your feedback into account and send a new patch
soon.
