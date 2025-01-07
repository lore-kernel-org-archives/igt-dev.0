Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C164CE77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 06:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B8310E2EF;
	Tue,  7 Jan 2025 06:43:49 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4028910E2EF
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 06:43:48 +0000 (UTC)
Received: from 91-155-254-72.elisa-laajakaista.fi ([91.155.254.72]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1tV3JX-00000003WcV-3tql; Tue, 07 Jan 2025 08:43:44 +0200
Message-ID: <a853ffa69cd2c4e436a9d6517f586727b37cff6a.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com, 
 kunal1.joshi@intel.com
Date: Tue, 07 Jan 2025 08:43:42 +0200
In-Reply-To: <20250103153333.4253-1-santhosh.reddy.guddati@intel.com>
References: <20250103153333.4253-1-santhosh.reddy.guddati@intel.com>
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

On Fri, 2025-01-03 at 21:03 +0530, Santhosh Reddy Guddati wrote:
> Backup connector modes before sorting to ensure the original mode
> is not changed if the joiner is not found.This will skip updating
> connector->mode[0] if joiner is not available.
>=20
> v2: Dont sort the modes, instead check for the required modes (Luca Coelh=
o)
>=20
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13287
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---

Looks good.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
