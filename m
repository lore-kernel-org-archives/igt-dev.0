Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDD8E77188
	for <igt-dev@archiver.kernel.org>; Sat,  4 Jan 2025 21:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FA210E07A;
	Sat,  4 Jan 2025 21:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XW5RdtSG";
	dkim-atps=neutral
X-Greylist: delayed 83879 seconds by postgrey-1.36 at gabe;
 Sat, 04 Jan 2025 21:44:32 UTC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BD110E011
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Jan 2025 21:44:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30CEF1C0002;
 Sat,  4 Jan 2025 21:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736027070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UW9j0l0ZWQW7tlWgdH+dxrBgAn7YO8mX3Mf2WTBwyc=;
 b=XW5RdtSGLNA0QMAiB/TXDjE7aQ+5ASMHrQyqvcUWl3/w8jzeLIaGNQdHZtjCzJP0Rnq91I
 ndKINaFNhMGm5qp9JxnxU3V+/rlkZ7dVMR73Ti2lfjUpfL77mJo455L9t0dttqAEO7k3Oo
 7C99lQWM+HjtB17bTCCjNPrkaMkHSyfzQU/nE9lTmZeTUkTrH40hyTX+dAFyJDkRt5Fxa0
 LWsjiKJy4zBy5LkOD+7EO/CY3LR8/WczA4zhoyQ+wqD9FgavCht+TZE/1+tQ0+XQpFUuAd
 wB6PJjaCHKBC27HsUf+/nnXvR+sB9yov+LXtMZNQZ82xzWrnX0YPbap+ebEsDg==
Date: Sat, 4 Jan 2025 22:44:29 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/igt_aux.c: since procps-ng 4.0.5, PIDS_VAL()
 takes 3 arguments, not 4
Message-ID: <20250104224429.0d3d00de@windsurf>
In-Reply-To: <BL1PR11MB5445B391A20BFCB58D2EE8D7E5152@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20250103222628.4069004-1-thomas.petazzoni@bootlin.com>
 <BL1PR11MB5445B391A20BFCB58D2EE8D7E5152@BL1PR11MB5445.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.petazzoni@bootlin.com
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

Hello Jonathan,

Thanks for the quick feedback!

On Fri, 3 Jan 2025 23:33:27 +0000
"Cavitt, Jonathan" <jonathan.cavitt@intel.com> wrote:

> "HAVE_LIBPROC2_POST_4_0_5_API" works as a name for this new tag,
> though I wonder if "HAVE_LIBPROC2_NO_INFO" would also work?

I don't have a strong opinion on the macro name, but "NO_INFO" sounds
very generic. Here we're just talking about the "info" argument of this
specific PIDS_VAL() macro.

It is worth mentioning that I had reported the issue to upstream
procps-ng and they don't consider it as a bug:

  https://gitlab.com/procps-ng/procps/-/issues/366

Also, they said that the SONAME has changed. Which they indeed did in:

  https://gitlab.com/procps-ng/procps/-/commit/f8d20531f840e280fcbe1f3a0634ab72c9b4e74d

So maybe our macro name should be based somehow on this SONAME, which
identifies the API version?

> I don't see any other granular version checks in the meson build file (at
> least, I don't see any that aren't strict version requirements for certain
> dependencies), so AFAICT this type of tag is fairly novel.  So whatever
> name we end up choosing may end up inadvertently becoming a 
> standard naming convention for future tags like this one.

Note that I am not entirely happy with it being a version check.
Ideally, we shouldn't check the version, but rather test the feature
itself: build a simple program that uses the 4 argument variant of
PIDS_VAL() and decide depending on the success/failure which variant we
should use. This is generally less fragile than a version check, at
least IMO.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
