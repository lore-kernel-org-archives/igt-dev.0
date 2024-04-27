Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6AFC4345F
	for <igt-dev@archiver.kernel.org>; Sat, 27 Apr 2024 11:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1A710E5F2;
	Sat, 27 Apr 2024 11:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ourmail.work header.i=@ourmail.work header.b="ydwbPdgA";
	dkim-atps=neutral
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74E610E5F2
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Apr 2024 11:28:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ourmail.work;
 s=default; t=1714216871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOIsYmjjuRWjby9w3TukfjO4c+MQy1Sj0xVHkC5AzPA=;
 b=ydwbPdgA0EC854xaO4GpJKeLF4ARd+kdQ+G9RKnDnzC1ITJcqv9JfJzUH48rkE23G2nAQj
 BIpM6hyW/rqHjMdLaMgfiWYbGhv8YHCieeNrDB3S2LUAXYdW8WTjBWjWdaD4POtw3xw7T+
 2TRyV5anpImg+iWrIEf01Vj76Isp59Q=
From: Reagan Bohan <reagan@ourmail.work>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 0/7] Misc musl fixes.
Date: Sat, 27 Apr 2024 11:18:38 +0000
Message-ID: <20240427112045.10987-1-reagan@ourmail.work>
In-Reply-To: <20240421232204.31704-1-reagan@ourmail.work>
References: <20240421232204.31704-1-reagan@ourmail.work>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hello,

In this version I have defined _LARGEFILE64_SOURCE in the meson.build
instead of the individual files, split up the change of poll.h, and
rewrote commit messages to be more concise.

