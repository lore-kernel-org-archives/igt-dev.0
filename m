Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57512CF044D
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 10:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC6E10E6DC;
	Wed,  9 Oct 2024 10:56:50 +0000 (UTC)
X-Greylist: delayed 2051 seconds by postgrey-1.36 at gabe;
 Wed, 09 Oct 2024 10:56:49 UTC
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285ED10E6DC
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 10:56:49 +0000 (UTC)
Received: from 91-155-255-253.elisa-laajakaista.fi ([91.155.255.253]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1syTps-00000000MBI-0o2s; Wed, 09 Oct 2024 13:22:36 +0300
Message-ID: <7661c15eee36e3da3a3bb4f342cc2298c8051c74.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>, 
 igt-dev@lists.freedesktop.org
Date: Wed, 09 Oct 2024 13:22:26 +0300
In-Reply-To: <20230327181202.6797-1-mohammed.thasleem@intel.com>
References: <20230327181202.6797-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_dc: Add DC5 retention flops test
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

On Mon, 2023-03-27 at 23:42 +0530, Mohammed Thasleem wrote:
> This test validates the display engine entry to DC5 state while
> eDP PSR is active on Pipe B from display version 30 onwards.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.

