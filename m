Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43776C27C77
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 13:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E343489131;
	Wed, 12 Jun 2024 13:57:59 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592E510E863
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 13:57:57 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1sHOU5-00000001aVd-2RCi; Wed, 12 Jun 2024 16:57:54 +0300
Message-ID: <e6f71e12a3378e4ed7c57c6e9ff6f25d3593e8f7.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Jani Saarinen <jani.saarinen@intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>
Date: Wed, 12 Jun 2024 16:57:52 +0300
In-Reply-To: <20240607143958.nx3qvnjerpyjmmuc@kamilkon-DESK.igk.intel.com>
References: <20240528075855.463729-1-luciano.coelho@intel.com>
 <20240528075855.463729-3-luciano.coelho@intel.com>
 <20240529163744.3tkyh44fcgjsxxy4@kamilkon-DESK.igk.intel.com>
 <2d94493d7f2827c0e5d5536ef46066b72346d3b7.camel@coelho.fi>
 <20240607143958.nx3qvnjerpyjmmuc@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel: check drmModeGetConnector()
 return in i915_pm_rpm
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

On Fri, 2024-06-07 at 16:39 +0200, Kamil Konieczny wrote:
> Hi Luca,
> On 2024-05-30 at 00:45:12 +0300, Luca Coelho wrote:
> > On Wed, 2024-05-29 at 18:37 +0200, Kamil Konieczny wrote:
> > > Hi Luca,
> > > On 2024-05-28 at 10:58:55 +0300, Luca Coelho wrote:
> > >=20
> > > this subject imho is too long:
> > >=20
> > > [PATCH i-g-t v2 2/2] tests/intel: check drmModeGetConnector() return =
in i915_pm_rpm
> > >=20
> > > It should have test name at begin, not at end:
> > >=20
> > > tests/intel/i915_pm_rpm: Fix bug in init_mode_set_data()
> > >=20
> > > or
> > >=20
> > > tests/intel/i915_pm_rpm: check drmModeGetConnector() before use
> > >=20
> > > or find out something better.
> >=20
> > This is the same as in the previous patch.  So, just tell me which one
> > of your options you want me to use and I'll do it.  No need to bike-
> > shed on this here.
> >=20
> >=20
> > > > The drmModeGetConnector() function can return NULL in some cases, s=
o
> > > > we need to check the return value before accessing it.  This is not
> > > > being checked in init_mode_set_data(), so fix that.
> > >=20
> > > Please cite few lines from bug report:
> > >=20
> > > Starting subtest: module-reload
> > > Received signal SIGSEGV.
> > > Stack trace:=20
> > > #0 [fatal_sig_handler+0x10f]
> > > #1 [killpg+0x40]
> > > #2 [setup_environment+0x33f]
> >=20
> > This is one click away, in the link I added below, but I see the
>=20
> It is better to give such info here in patch itself,
> especially as this is needed for reproduction.

I agree that sometimes it is.  But this excerpt looks mostly like noise
to me.  The only significant words there are "module-reload" and
"SIGSEGV".

--
Cheers,
Luca.
