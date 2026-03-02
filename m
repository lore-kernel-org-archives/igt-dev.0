Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF75E9B360
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 10:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6579210E489;
	Mon,  2 Mar 2026 10:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZXPqUBJj";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1336510E489
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 10:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772448328;
 bh=AJAQuhh6n34xhvf0H2rUw8Cc2fb8mvc43Ch/BsGKvGQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZXPqUBJj3YR0og/NKBI0Sv8E+TBGqZxRjDNXDS9uUqiVOeOPUx0P5mDpiJXLW082l
 azJUdLaJhG3oKWv3wkMefcuCxPHI4Smsa8cp+FpKr3PJmQg1kq+mqGta2Qvr/rnXLH
 Lz6iT4vcd+9TMHhdDz4zTAHEhb/DPlbegujQeu/G5IlgZ89oo8nLGtRD7tllvTxurN
 0wpQQYIRV8B6s24dlnJ3q64DUWuccpP2lGnDj6DdJ/mLbW4peLc6aiasU7gaMOqcCF
 9ss7mBdDzcEPKKIZlpsPkA6AMfhgyyjvwdNBkoViJKEsO8HywSo/tEKBNAYPKtO5qT
 fxoOQZUHSiavA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8340217E0D04;
 Mon,  2 Mar 2026 11:45:28 +0100 (CET)
Date: Mon, 2 Mar 2026 11:45:24 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Daniel Almeida
 <daniel.almeida@collabora.com>
Subject: Re: [PATCH i-g-t v2] panthor: Enable compilation on big-endian arch
Message-ID: <20260302114524.57fa1959@fedora>
In-Reply-To: <e863d999b0bc37aba10242c707320aabb6cffd4e@intel.com>
References: <20260219150524.92665-1-kamil.konieczny@linux.intel.com>
 <e863d999b0bc37aba10242c707320aabb6cffd4e@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 23 Feb 2026 12:49:38 +0200
Jani Nikula <jani.nikula@intel.com> wrote:

> On Thu, 19 Feb 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > Compilation of Panthor was broken on big-endian due to a guard in
> > pathor lib against such arch. Fix this and create and use
> > function for skipping all panthor tests on such machines.
> >
> > Also while at it, init fd so it could be safely used at last
> > fixture.  
> 
> What about DRIVER_ANY tests?
> 
> Seems like the cleaner option would be to amend drm_open_driver() with
> something like:
> 
> 	if (chipset & DRIVER_PANTHOR)
> 		skip on big endian
> 
> instead of sprinkling the skips everywhere.

FWIW, I'm fine with this approach too.
