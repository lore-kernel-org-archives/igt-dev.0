Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B3CED7B95
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 09:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F0D10E570;
	Tue, 14 Apr 2026 09:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="RQAUaKKM";
	dkim-atps=neutral
Received: from mail-244105.protonmail.ch (mail-244105.protonmail.ch
 [109.224.244.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F322A10E570
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 09:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1776160522; x=1776419722;
 bh=KmPSKngoKr1P6gyHU0jhtJgXz4x9FsUfqawcfL2c4IQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=RQAUaKKMQRFDKIRwZgt7tcK7xfRYfdbkZQXx8Ud+IJx5EoPLCKelPPV0qcXdHYxVE
 v8L3B6JZRdoRxlShbtHpzzyMovjyyYJveWKAHHnENkZaR6YXH9jyBfFZOzuTpg/4Sf
 cchxj3CqdxvSs1WobZQCeVV+IdcMmibTUfrqV2Z9ybCRGPgEKSAVshWVNjm7A7xw+9
 zDOt0Deyq3sxQFOmrnc/+G7DX4T9eP3XCOwrVpxzMMc8g1IysW2/hwIt7laZgmfZ5v
 kACYeAhxYxwhLgui6ipoP+XebIOub3Jlcvja2UjwtTVG9UFBiwpdarL8NI6LlugYKw
 CX0r3qobzbCfw==
Date: Tue, 14 Apr 2026 09:55:17 +0000
To: Jani Nikula <jani.nikula@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org,
 Arun R Murthy <arun.r.murthy@gmail.com>
Subject: Re: [PATCH i-g-t 1/6] lib/igt_edid: add EDID serial extraction helpers
Message-ID: <K7xrJsOwlaFXFv5FvEBWeHTGD43V8E_wOB2le5-va6Lo46r_-a7_lKBZQgi2XYyZbKdSPF-SsHJpXJjgnTOtZaLffttjx_M5ujLI5XMqlJI=@emersion.fr>
In-Reply-To: <57222f9789fda352ed26606c1f80e35fcdeb3d37@intel.com>
References: <20260409043714.284108-1-kunal1.joshi@intel.com>
 <20260409043714.284108-2-kunal1.joshi@intel.com>
 <57222f9789fda352ed26606c1f80e35fcdeb3d37@intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 2608b0cb7d8beee2a9a8c8e1b12531057fb96878
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tuesday, April 14th, 2026 at 11:11, Jani Nikula <jani.nikula@intel.com> =
wrote:

> On Thu, 09 Apr 2026, Kunal Joshi <kunal1.joshi@intel.com> wrote:
> > Add helpers to extract serial identification from EDID data.
> >
> >  - edid_get_serial_string(): extract ASCII serial from descriptor 0xFF
> >  - edid_get_serial_number(): extract 32-bit serial from EDID header
> >  - edid_get_any_serial(): convenience helper that tries ASCII serial
> >    first, then falls back to 32-bit header serial formatted as hex
> >
> > These are needed by the connector helper and USB4 switch test suite
> > for EDID-based display verification after dock/undock events.
>=20
> Time to consider using libdisplay-info [1] in IGT?

I think that would make a lot of sense. Feel free to ping me if you have
any questions or if the library is missing anything that IGT needs.

Simon
