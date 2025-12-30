Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB42E95A77
	for <igt-dev@archiver.kernel.org>; Tue, 30 Dec 2025 11:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C017D10E8B7;
	Tue, 30 Dec 2025 11:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wxxz6KyK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC1410E72F
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Dec 2025 11:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767092570; x=1798628570;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CHuOlC0thSc9IAFdLLLVXJS3EA/AIoSef3MLLMU5zSc=;
 b=Wxxz6KyKR6U8neJlZKQAu1J919QX22Rt1KFa1A2LbxowQhRL7uEPeEdm
 c6OSieOyIrq2CW2+Ye9jowyd4Porj/dDzAqrAmBdEidmjZwtxqp8B02N4
 zuL4qINCCl7Qe6wpbZBz5boXFZi9k9vGuPOmHmsFXjLYEYTkuLAnchwD7
 4UK0djFP7IN3PpESqXI4uwiXvCchinQ5oa9kHYuqrh/doDBidf/L7oWp5
 h79PrU+CquqQolJVxQvtdx0HF+xziwkmp+xnulBfGYmgFA4Zv0TLZBivO
 JeDi4GjMGYS9405fyiGugSSS+ifzlphSBxHEZcWbGManxqNedjeOB69t+ g==;
X-CSE-ConnectionGUID: 49Z5n7TmTzmlE1OTgh/VVg==
X-CSE-MsgGUID: HRS0kQuZQb2wL4DBTW9F7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68623003"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="68623003"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 03:02:50 -0800
X-CSE-ConnectionGUID: dwFSe9pmQQ2yenLfgCdX1g==
X-CSE-MsgGUID: rSbyisWRQwGBvl4CEsQTgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="238627198"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 03:02:48 -0800
Date: Tue, 30 Dec 2025 12:02:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juhapekka.heikkila@gmail.com>
Cc: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
Subject: Re: [PATCH i-g-t 3/7] tests/kms_plane: add test and limitations for
 odd height planar tests
Message-ID: <20251230110242.vsul5xioucarnttw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juhapekka.heikkila@gmail.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
References: <20251216185215.1281390-1-swati2.sharma@intel.com>
 <20251216185215.1281390-4-swati2.sharma@intel.com>
 <CAJ=qYWSSCwkoGfbR6iMK+zYndCTp9W6gSPrvHMoLtw_DYc7C0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ=qYWSSCwkoGfbR6iMK+zYndCTp9W6gSPrvHMoLtw_DYc7C0w@mail.gmail.com>
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

Hi all,
On 2025-12-19 at 14:56:14 +0200, Juha-Pekka Heikkilä wrote:
> Seems this patch has become bit broken somewhere on the way. I quickly
> notice display_ver is left at value -1 which cannot work
> 
> My original patch back when this was created had there this
> 
> -       igt_require(intel_display_ver(devid) >= 9);
> +       display_ver = intel_display_ver(devid);
> +       igt_require(display_ver >= 9);
> 
> which is now missing; that is what I quickly noticed. Probably should
> see the entire thing through it is otherwise working.
> 
> /Juha-Pekka
> 
> 
> On Tue, Dec 16, 2025 at 8:45 PM Swati Sharma <swati2.sharma@intel.com> wrote:
> >
> > From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>

Please fix From: here:

Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>

> >
> > With NVL need to disable odd height and odd src y for semiplanar
> > yuv formats. With older devices check with crc odd src y didn't
> > break framebuffer on screen.
> >
> > Bspec: 68903
> >
> > Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>

Same here:
Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>

Should it be both uppercase 'J' and 'P'? Also in other patch.

Regards,
Kamil

> > ---
> >  tests/kms_plane.c | 70 +++++++++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 65 insertions(+), 5 deletions(-)
> >
[cut]
