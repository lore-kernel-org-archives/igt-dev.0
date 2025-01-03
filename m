Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D511E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 09:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F115110E39E;
	Tue,  7 Jan 2025 09:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p22Z68bm";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAE210E039
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 18:54:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF3FA5C53FF;
 Fri,  3 Jan 2025 18:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C681EC4CECE;
 Fri,  3 Jan 2025 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735930461;
 bh=bFXOFe8lDwu7ito8lhAQK4ZunYDwPV7uALHtqUCv94s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p22Z68bm0C5uRvG/VVyd2WAlZwWTqAR1P3vuzJjUHGbfK8NcYZtZrFaBi4sEKjBqw
 uKfhB4VgUwD3pYdAlB8PpLAslRMidyOkLAQTqnrxzKabe9QPCDgVVfQA71Ilby+LtR
 tMg/uc/9q6Md9006T81fdsxsVbOn3pEOdoX9OLq4i+S8m8Ew3QuVdf/57uWRkjg/Ga
 Sy3NHAJ8Y1lhHpNDpdFG2zT8Zjf/D4dbGwaqktxDSQPPZfzm356E2Oqk++LUEVqPtr
 a3e8pCKEURSoLx3xJDjY4RO89YfPUpjWLU5jiA8RVF//6QGB++vzWkoZbuclJhfF6x
 GHXlO6FKRKrQg==
Date: Fri, 3 Jan 2025 10:54:20 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 igt-dev@lists.freedesktop.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kmod: Do not explicitly unload intel
 mei driver
Message-ID: <Z3gyXKz5XyMgNwi8@bombadil.infradead.org>
References: <20241218233830.2444510-1-daniele.ceraolospurio@intel.com>
 <20241218233830.2444510-2-daniele.ceraolospurio@intel.com>
 <pkxihhlzuxpbhkl4woyz5fkri7nmrw7unqtbqwjb2ekeziweru@qwiwezhgwi4j>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pkxihhlzuxpbhkl4woyz5fkri7nmrw7unqtbqwjb2ekeziweru@qwiwezhgwi4j>
X-Mailman-Approved-At: Tue, 07 Jan 2025 09:05:45 +0000
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

On Thu, Dec 19, 2024 at 02:20:45PM -0600, Lucas De Marchi wrote:
> On Wed, Dec 18, 2024 at 03:38:30PM -0800, Daniele Ceraolo Spurio wrote:
> > The mei driver is a child of i915 on discrete, but not on integrated.
> > This means we want to unplug it before removing i915 in the former case
> > but not in the latter. Therefore, instead of manually unloading the mei
> > driver, we can unbind i915 and leave it to the kernel to unplug all the
> > dependencies. This also means that we don't need to explicitly disable
> > the vtcon anymore.
> > 
> > The other 2 dependencies are left untouched:
> > - intel_ips uses symbol_get, so the automatic dependency detection won't
> >  unload it.
> 
> and it shouldn't - that's a hack and from the linux-modules perspective
> we'd like to drop symbol_get() users. Btw, symbol_get/symbol_put only
> guarantees the module can't be removed (since there's code in the kernel
> that can still call into them). 

Totally. Also if CONFIG_TRIM_UNUSED_KSYMS=y is used, you may end up
with nulls in places where perhaps you did not expect. symbol_get()
and friends are currently used as hacks and we should slowly transform
users to use a proper API and dependencies.

> It doesn't mean the hardware can't go
> away (hotplugged or unbound from the driver). The module should be
> prepared for that. At the very least, it should handle errors from the
> function and release the symbols, but it's probably a candidate for a
> component driver.

Indeed, one way is to set a simple regstration mechanism, if the
resource is not registered then request_module() can be used.

  Luis
