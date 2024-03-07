Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E756DC48BF6
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 12:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9106310F431;
	Thu,  7 Mar 2024 12:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/9PAxUz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EACB10F431
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709816202; x=1741352202;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jgq6Op1VauMwTW4dn+jnB9B4i7/XMz18YOfCoLZbI/Y=;
 b=c/9PAxUzVKS/WKHZByOb25OQJEMhL9bXTgiQN5h9fNCcEaeh+Zv/RtAe
 OXvMdxGl7dxv9cpcuT/zy0SUKSymtt9US1H8K90Tl56K911+swrxayAny
 KaM8+pSVPMbf97ZG+0NJBcxBf7+g893ZTwerW5oYHQ7MdsfQRsfvHxhKB
 xQQUicqXYEQXvrYNRIwWvsSVtLMXjN1T4zuYAmL57I9wurb52Wr2tGH0l
 nSHdGY38Tax5K5TxqzwD9hkG3Tv0lJWMn5gjDKHGodF97S766ij+FwHv5
 mMHsSxTHj2L1k5ETWSyMW/+nwzELAscYiYCVZsbFE4QIMCDtc2O6J0EfJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15203521"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="15203521"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 04:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="33255949"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 04:56:41 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3E8F9580D94;
 Thu,  7 Mar 2024 04:56:40 -0800 (PST)
Date: Thu, 7 Mar 2024 13:56:37 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 10/24] tests/intel: Introduce Flat-ccs subcategory
Message-ID: <20240307135637.0f8acadd@maurocar-mobl2>
In-Reply-To: <IA1PR11MB60975081ED0579C87D1E6E9786202@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-11-katarzyna.piecielska@intel.com>
 <20240304161651.2cc0f015@maurocar-mobl2>
 <IA1PR11MB60975081ED0579C87D1E6E9786202@IA1PR11MB6097.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Thu, 7 Mar 2024 09:50:02 +0000
"Piecielska, Katarzyna" <katarzyna.piecielska@intel.com> wrote:

> > Let's introduce flat-ccs subcategory.
> >=20
> > Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> > ---
> >  tests/intel/gem_ccs.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c index=20
> > 3442ecfd3..e6257aeac 100644
> > --- a/tests/intel/gem_ccs.c
> > +++ b/tests/intel/gem_ccs.c
> > @@ -20,6 +20,9 @@
> >   * TEST: gem ccs
> >   * Description: Exercise gen12 blitter with and without flatccs compre=
ssion
> >   * Feature: flat_ccs_mapping
> > + * Sub-category: Flat-ccs
> > + * Category: Desktop \ Server
> > + * Functionality: block-copy =20
>=20
> LGTM.
>=20
> A minor nitpick: on some places like "Desktop \ Server" you're using the =
left/reverse backslash, while on others, you're using the right one.=20
>=20
> I would standardize it to always use "/".

>> Looking at i915 for DII I see only 'Desktop \ Server'. If we want to sta=
ndardize that - let's do that in separate commit.

Yeah, sure.=20

Regards,
Mauro
