Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13617C04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 06:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBE7112ADC;
	Mon, 29 Apr 2024 06:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ourmail.work header.i=@ourmail.work header.b="n+P2snu7";
	dkim-atps=neutral
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com
 [91.218.175.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113E11127D2
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Apr 2024 07:11:22 +0000 (UTC)
Date: Sat, 27 Apr 2024 07:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ourmail.work;
 s=default; t=1714201881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LKN/Y/uAYc2xhX+tAC64+S77RgdPD/+TCKPctJ1abTw=;
 b=n+P2snu7FmtNfxomtVC/Y3vh4jf8p/XX5N3dBWxCiNGwNfksJmZzKc0V2gACr+PPq+u7az
 n9MI53mywP9iR2+H9LItG+Pfmr+gxLDFItgTs/StAwHFaCss1D0+XNALeL8RAesz+ZKNLf
 7AwcIKgnS0QirWlz6wPURlDS00u/sbQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Reagan Bohan <reagan@ourmail.work>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Reagan Bohan <xbjfk.github@gmail.com>
Subject: Re: [PATCH 1/3] Define _LARGEFILE64_SOURCE for musl libc
Message-ID: <20240427071117.5scno7yy6vdeh5xh@reagan.home.arpa>
References: <20240421232204.31704-1-reagan@ourmail.work>
 <20240421232204.31704-2-reagan@ourmail.work>
 <20240422153633.nxt7bcjnznyiaglu@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422153633.nxt7bcjnznyiaglu@kamilkon-DESK.igk.intel.com>
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

> Why only in these two files? Maybe better place whould be to
> detect musl libc compilation and add it into meson define?

Yes, I agree adding it to meson.build is a better approach, but I think
doing so without a check for musl libc is best, because:
a) musl developers have a policy against having an easy way of checking
for musl libc - https://openwall.com/lists/musl/2013/03/29/13
b) AFAICT, there should be no affect on glibc, and all tests still pass.

Thanks,
Reagan
