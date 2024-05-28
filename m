Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A624C25B7E
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 07:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFFC11200B;
	Tue, 28 May 2024 07:41:28 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7A211200B
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 07:41:26 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1sBrSU-00000001FN6-42kv; Tue, 28 May 2024 10:41:23 +0300
Message-ID: <e74bea415044ea9d73e79e788b33563604eaff41.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>
Date: Tue, 28 May 2024 10:41:21 +0300
In-Reply-To: <20240523102429.wbwantolqbanskcv@kamilkon-DESK.igk.intel.com>
References: <20240523084426.284894-1-luciano.coelho@intel.com>
 <20240523084426.284894-3-luciano.coelho@intel.com>
 <20240523102429.wbwantolqbanskcv@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 2/2] tests/intel: check drmModeGetConnector()
 return value in i915_pm_rpm
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

On Thu, 2024-05-23 at 12:24 +0200, Kamil Konieczny wrote:
> Hi Luca,
> On 2024-05-23 at 11:44:26 +0300, Luca Coelho wrote:
> > The drmModeGetConnector() function can return NULL in some cases, so
> > we need to check the return value before accessing it.  This is not
> > being checked in init_mode_set_data(), so fix that.
> >=20
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  tests/intel/i915_pm_rpm.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> > index 52e00489da70..10a545f173de 100644
> > --- a/tests/intel/i915_pm_rpm.c
> > +++ b/tests/intel/i915_pm_rpm.c
> > @@ -515,6 +515,12 @@ static void init_mode_set_data(struct mode_set_dat=
a *data)
> >  			data->connectors[i] =3D
> >  				drmModeGetConnector(drm_fd,
> >  						    data->res->connectors[i]);
> > +			if (!data->connectors[i]) {
> > +				igt_warn("Could not read connector %u\n",
> --------------------^^^^
> Why warn? imho igt_debug would be better.

We would previously crash here, which is a test failure.  I think a
warn would also cause the test to fail, but in a more graceful way.  I
considered using igt_debug(), but thought that at least for now the
test should fail when this happens.  But I'll change it to igt_debug(),
as you asked.

--
Cheers,
Luca.
