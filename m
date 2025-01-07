Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4B0E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 09:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5588810E17D;
	Tue,  7 Jan 2025 09:29:08 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E3110E17D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 09:29:07 +0000 (UTC)
Received: from 91-155-254-72.elisa-laajakaista.fi ([91.155.254.72]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1tV5tY-00000003WkG-2J7h; Tue, 07 Jan 2025 11:29:06 +0200
Message-ID: <c546ee2ec5e5372dd1fb03af5be6f767af56eb59.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com, 
 kunal1.joshi@intel.com
Date: Tue, 07 Jan 2025 11:29:02 +0200
In-Reply-To: <a853ffa69cd2c4e436a9d6517f586727b37cff6a.camel@coelho.fi>
References: <20250103153333.4253-1-santhosh.reddy.guddati@intel.com>
 <a853ffa69cd2c4e436a9d6517f586727b37cff6a.camel@coelho.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v2] lib/igt_kms: Backup connector modes before
 sorting
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

On Tue, 2025-01-07 at 08:43 +0200, Luca Coelho wrote:
> On Fri, 2025-01-03 at 21:03 +0530, Santhosh Reddy Guddati wrote:
> > Backup connector modes before sorting to ensure the original mode
> > is not changed if the joiner is not found.This will skip updating
> > connector->mode[0] if joiner is not available.

I just realized that the commit message is not correct anymore.  Please
fix that if you haven't merged this yet.

--
Luca.



> > v2: Dont sort the modes, instead check for the required modes (Luca Coe=
lho)
> >=20
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13287
> > Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com=
>
> > ---
>=20
> Looks good.
>=20
> Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
>=20
> --
> Cheers,
> Luca.

