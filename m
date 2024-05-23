Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838F2C25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 05:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB59510E1FC;
	Thu, 23 May 2024 05:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Drx+9krh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF8A10E1FC
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 05:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716440632; x=1747976632;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SQRDO7ff96ErB4V33KAA9wWyIrDwLZNsQsCHkmpRx80=;
 b=Drx+9krhumwk52TPlVy87D3P0HIkmSNvGMWUhXhH3uI3sdBvoHtBwiT5
 YWcb7ABAjXaDXH4PrE7SNTSTErRBrkwmUxwRTwPN5hhloBlEOb3yUUXzU
 dG0e6rdjBXUPQ/Cdv9WqDmnX3Zj8f3OkOcSdRVvKA4SlP88CPr77wMxT5
 3KKWvoHBo8VEFo1VOr9PhJAEXSeEnyrCs4GG92b69VCTriaMbYw9cb0wh
 eLg6BOrYey8FPPUt1PnbUpQQW2oU/VIfTkdGQHSLKSx+aNIqLv3Wo85OL
 Z0iAwJOdYn/W5mrX7gvWysTH1gwM0181hIKkCeYyw/CJwAEoQ30KLyzP0 w==;
X-CSE-ConnectionGUID: HUgGfcJqSNutQ7EPeZGK3Q==
X-CSE-MsgGUID: 9qFspfk4SU2/vfeDa9l/BQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12846375"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12846375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 22:03:52 -0700
X-CSE-ConnectionGUID: V81qevhiSCuJy5AYrHfwEA==
X-CSE-MsgGUID: vuu16gM8Q+G2vkpWo4lizg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="38010378"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 22:03:51 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.245.152])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4947820BF42F;
 Wed, 22 May 2024 22:03:49 -0700 (PDT)
Date: Thu, 23 May 2024 07:03:46 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 kamil.konieczny@intel.com, katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v4] tools/mk_detect_intel_gpu: add a tool to
 detect Intel GPUs from their PCI IDs
Message-ID: <20240523070346.04def11b@maurocar-mobl2>
In-Reply-To: <20240522144627.tdiadqyfgk67ox55@kamilkon-DESK.igk.intel.com>
References: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
 <87a5kiqa6l.fsf@intel.com> <875xv6q8ob.fsf@intel.com>
 <20240522144627.tdiadqyfgk67ox55@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 22 May 2024 16:46:27 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Jani,
> On 2024-05-22 at 16:26:44 +0300, Jani Nikula wrote:
> > On Wed, 22 May 2024, Jani Nikula <jani.nikula@intel.com> wrote: =20
> > > On Wed, 22 May 2024, Mauro Carvalho Chehab <mauro.chehab@linux.intel.=
com> wrote: =20
> > >> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > >>
> > >> Such tool parses the Kernel drivers for both i915 and Xe and
> > >> generates a script that helps detecting Intel GPU models. =20
> > >
> > > I acknowledge the usefulness of such a tool, but to be brutally hones=
t,
> > > this implementation is horrible in so many levels.
> > >
> > > IGT uses meson and avoids perl. =20
>=20
> imho this could also be a python script.

Converting the output to a python script should be trivial and can be done
later on. The generated script has a a simple hash/dict lookup logic.

> > >
> > > This has a makefile with perl to generate a header that's included in=
 a
> > > C program that is built and executed to generate a perl script that's
> > > then the tool, and the generated perl script runs lspci(8).
> > >
> > > I think there's really only one reasonable way to implement this in t=
he
> > > IGT context, and that's pure C, leveraging all the stuff in IGT, using
> > > the PCI IDs listed in the IGT repo.
> > >
> > > Or you can turn this into a separate pet project, because what you ha=
ve
> > > here does not fit IGT.
> > >
> > > The i915_pciids.h parsing below is already stale, and you really can't
> > > expect to get this merged and be kept up-to-date by folks updating
> > > i915_pciids.h. IMO it's not maintainable. =20
>=20
> This is for making a new script, after generation there will be
> standalone program: intel_detect_gpu.pl and imho igt is missing
> a tool like lsgpu which will work _without_ kmd gpu driver loaded,
> simple enough so one can just run it.
>=20
> >=20
> > An alternative is a pure bash or Python script to run something like:
> >=20
> > 	lspci -d 8086::0300 -nn
> >  =20
>=20
> Looks like a good idea but this is also dependancy, btw
> from man:
> -nn    Show PCI vendor and device codes as both numbers and names.

The names from lspci database aren't read from ACPI. They come from
a pci.ids table that it is updated by this script:

	https://github.com/pciutils/pciutils/blob/master/update-pciids.sh

that is executed at lspci build time[1].=20

=46rom an user-maintained database at:

	https://pci-ids.ucw.cz/

According to pci-ids:

	"Submit new data

	 The database is maintained by volunteers like you, so if you have
	 any devices which are not identified properly, please help us by=20
	 adding them to the database or by fixing the existing entry."

So, the names reported by lspci depend on:
	1. someone sending updates to such database;
	2. having the contribution updated by pci-ids maintainers;
	3. having the pci id dataset updated at the running system.

It works fine when one is using a brand new distro, with an older
hardware, but on LTS distros and new hardware, it is unlikely that
lspci will use a pci.ids file with the vendor ID for new GPUs.

On the other hand, the driver source code needs to maintain a list of
the supported PCI IDs, together with some names associated to it.

Based on the information inside the driver, the generated script
will associate a vendor ID to its GPU model as written inside the
driver:

	$ ./intel_detect_gpu.pl=20
	Detected GPU PCI device: CFL (CML_U_GT2), PCI ID: 8086:9b41

This works not only for old enough GPUs to be there at the pci.ids
filled shipped at the distro, but also for brand new ones - and even
for not-yet-released ones that might be there at drm-next or on=20
internal development trees.

[1] Ok, one might run update-pciids later on to update it manually,=20
    but most people aren't aware of that - and it will still require
    someone to manually add the new PCI IDs to the project.=20

>=20
> imho we should not depend on names from lspci.
> More from man:
>=20
> -n     Show PCI vendor and device codes as numbers instead of looking the=
m up in the PCI ID list.
> -m     Dump PCI device data in a backward-compatible machine readable for=
m.
>=20
> > and annotate/filter the results based on the PCI IDs from:
> >=20
> > 	modinfo -F alias i915
> > 	modinfo -F alias xe =20
>=20
> But this one is creating one more dependancy, one should have
> modules compiled in current running kernel.
>=20
> Regards,
> Kamil
>=20
> >=20
> > You get the fancy marketing names directly from lspci, supported kernel
> > modules from modinfo, available on the system, with zero dependency on
> > PCI ID macros or names in source code.
> >=20
> > That's like a 100 lines of script that should need virtually zero
> > maintenance.
> >=20
> > Additionally, the script could match the modinfo PCI IDs against
> > /usr/share/misc/pci.ids (see man pci.ds) to show the marketing names.
> >=20
> >=20
> > BR,
> > Jani.
> >=20
> > --=20
> > Jani Nikula, Intel =20
