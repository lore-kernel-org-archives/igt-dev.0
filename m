Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BF7C25B7C
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 12:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE9610E28A;
	Wed, 22 May 2024 12:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYWWGezx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F9710E28A
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 12:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716382455; x=1747918455;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=YUNvjawKSMATGSycG7oHjRUa8Kn6DX2z5yVPizb0saQ=;
 b=hYWWGezxXupXueavSgbHqPCQqvLkhJgUCm8xobqk2UK1dGOMOHdCITM3
 cHyjMulaSAt4glZUNe/gdbCZMUSvJy4jbYIjD9GxP3Stf4VJR4LN34M7x
 ywLHCGKX5kFZOLhyFxVnXEIs5p6Z9O5He1DhyUCrHzz6E1Nn/x2oVt5yY
 6UNgG0/K9qb2XFn0PLH09BCpgPiRBzi4pi65cnXgWav7nq6dZay5hhxoU
 W47HZtmOyNt1+tCIbzkkvoGRbrQOZyCv1d6dWjMw2x/Is1avdwbt6kA5o
 AKL7IPYhjDeww51bx/m/334tT4Dx5d930e3Nc+lctn60pK7+X4GqBYtgt A==;
X-CSE-ConnectionGUID: u4kZZaBESq+ywIEqo6ithw==
X-CSE-MsgGUID: X1bLvcBgQvGnCvmR9oiQ/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12861045"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="12861045"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 05:54:15 -0700
X-CSE-ConnectionGUID: qmKjkx6qRYmSQgbqpvQMOg==
X-CSE-MsgGUID: vuYgJ6lzT22/mYFOGZinUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="33391513"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 05:54:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v4] tools/mk_detect_intel_gpu: add a tool to
 detect Intel GPUs from their PCI IDs
In-Reply-To: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
Date: Wed, 22 May 2024 15:54:10 +0300
Message-ID: <87a5kiqa6l.fsf@intel.com>
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

On Wed, 22 May 2024, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> w=
rote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
> Such tool parses the Kernel drivers for both i915 and Xe and
> generates a script that helps detecting Intel GPU models.

I acknowledge the usefulness of such a tool, but to be brutally honest,
this implementation is horrible in so many levels.

IGT uses meson and avoids perl.

This has a makefile with perl to generate a header that's included in a
C program that is built and executed to generate a perl script that's
then the tool, and the generated perl script runs lspci(8).

I think there's really only one reasonable way to implement this in the
IGT context, and that's pure C, leveraging all the stuff in IGT, using
the PCI IDs listed in the IGT repo.

Or you can turn this into a separate pet project, because what you have
here does not fit IGT.

The i915_pciids.h parsing below is already stale, and you really can't
expect to get this merged and be kept up-to-date by folks updating
i915_pciids.h. IMO it's not maintainable.


BR,
Jani.


>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tools/mk_detect_intel_gpu/Makefile  |  57 ++++++++
>  tools/mk_detect_intel_gpu/get_gpu.c | 216 ++++++++++++++++++++++++++++
>  2 files changed, 273 insertions(+)
>  create mode 100644 tools/mk_detect_intel_gpu/Makefile
>  create mode 100644 tools/mk_detect_intel_gpu/get_gpu.c
>
> diff --git a/tools/mk_detect_intel_gpu/Makefile b/tools/mk_detect_intel_g=
pu/Makefile
> new file mode 100644
> index 000000000000..ea24307ce19c
> --- /dev/null
> +++ b/tools/mk_detect_intel_gpu/Makefile
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright =C2=A9 2022-2024 Intel Corporation
> +# Author: Mauro Carvalho Chehab <mchehab@kernel.org>
> +#
> +# Usage: specify either:
> +#  make KERNEL_DIR=3D<directory to copy files for both i915 and Xe Intel=
 drivers>
> +# or:
> +#  make XE_DIR=3D<directory to copy files for Xe Intel driver> I915_DIR=
=3D<directory to copy files for i915 Intel driver>
> +
> +XE_DIR :=3D
> +I915_DIR :=3D
> +
> +all: intel_detect_gpu.pl
> +
> +clean:
> +	rm i915_pciids.h i915_id.h xe_pciids.h xe_pci.c get_gpu intel_detect_gp=
u.pl
> +
> +ifneq ($(KERNEL_DIR),)
> +  XE_DIR :=3D $(KERNEL_DIR)
> +  I915_DIR :=3D $(KERNEL_DIR)
> +endif
> +
> +ifeq ($(XE_DIR),)
> +  $(error Need a directory with the XE driver)
> +endif
> +
> +ifeq ($(I915_DIR),)
> +  $(error Need a directory with the i915 driver)
> +endif
> +
> +intel_detect_gpu.pl: get_gpu
> +	./get_gpu >intel_detect_gpu.pl
> +	chmod 755 intel_detect_gpu.pl
> +
> +i915_pciids.h:
> +	cp ${I915_DIR}/include/drm/i915_pciids.h .
> +	sed s,"(unsigned long) info }","info }", -i i915_pciids.h
> +
> +xe_pci_ids.h:
> +	cp ${XE_DIR}/include/drm/xe_pciids.h .
> +
> +xe_pci.c:
> +	cp ${XE_DIR}/drivers/gpu/drm/xe/xe_pci.c .
> +
> +i915_id.h: i915_pciids.h xe_pci.c
> +	echo "static struct pci_device_id pci_ids[] =3D {" > i915_id.h
> +	tac i915_pciids.h |grep define|perl -ne 'if (/define\s+INTEL_(\w+)_IDS/=
) { print "\tINTEL_$$1_IDS(\"$$1\"),\n" }' >> i915_id.h
> +
> +	cat xe_pci.c|perl -ne 'if (m/(XE_)([\w_]+)(_IDS\(INTEL_VGA_DEVICE)/) { =
print "\t$$1$$2$$3, \"$$2\"),\n"}' >> i915_id.h
> +
> +	echo "};" >> i915_id.h
> +
> +get_gpu: get_gpu.c i915_id.h i915_pciids.h xe_pci_ids.h
> +	gcc -g -Wall get_gpu.c -o get_gpu
> +
> +.PHONY: i915_id.h i915_pciids.h
> diff --git a/tools/mk_detect_intel_gpu/get_gpu.c b/tools/mk_detect_intel_=
gpu/get_gpu.c
> new file mode 100644
> index 000000000000..44fee08d398b
> --- /dev/null
> +++ b/tools/mk_detect_intel_gpu/get_gpu.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2022-2024 Intel Corporation
> + * Author: Mauro Carvalho Chehab <mchehab@kernel.org>
> + */
> +
> +
> +#include "i915_pciids.h"
> +#include "xe_pciids.h"
> +
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdlib.h>
> +
> +struct pci_device_id {
> +	unsigned int vendor, device;
> +	unsigned int subvendor, subdevice;
> +	unsigned int class, class_mask;
> +	char *name;
> +};
> +
> +#include "i915_id.h"
> +
> +#define ARRAY_SIZE(arr) sizeof(arr)/sizeof(*arr)
> +
> +#define TGL "TGL_12"
> +
> +int cmpfunc (const void *_a, const void *_b) {
> +        int ret;
> +
> +        const struct pci_device_id *a =3D _a;
> +        const struct pci_device_id *b =3D _b;
> +
> +        ret =3D strcmp(a->name, b->name);
> +        if (ret)
> +                return ret;
> +
> +        ret =3D a->vendor - b->vendor;
> +        if (ret)
> +                return ret;
> +
> +        ret =3D a->device - b->device;
> +        if (ret)
> +                return ret;
> +
> +        ret =3D a->subvendor - b->subvendor;
> +        if (ret)
> +                return ret;
> +
> +        ret =3D a->subdevice - b->subdevice;
> +        if (ret)
> +                return ret;
> +
> +        ret =3D a->class - b->class;
> +        if (ret)
> +                return ret;
> +
> +        ret =3D a->class_mask - b->class_mask;
> +
> +        return ret;
> +}
> +
> +
> +int main(void)
> +{
> +	int i;
> +	int shown[0x10000] =3D { [0 ... 0xffff] =3D -1 };
> +	int ignore[ARRAY_SIZE(pci_ids)] =3D { 0 };
> +	int other[ARRAY_SIZE(pci_ids)] =3D { [0 ... ARRAY_SIZE(pci_ids) - 1] =
=3D -1 };
> +	char last[80] =3D "";
> +
> +	printf("#!/usr/bin/perl\n\n");
> +	printf("$ENV{'LC_ALL'} =3D 'C';\n\n");
> +
> +        qsort(pci_ids, ARRAY_SIZE(pci_ids), sizeof(*pci_ids), cmpfunc);
> +
> +	/*
> +	 * Step 1: Handle non-subvendor specific devices, discovering duplicates
> +	 */
> +	for (i =3D 0; i < ARRAY_SIZE(pci_ids); i++) {
> +		if (pci_ids[i].subvendor !=3D (unsigned int)-1)
> +			continue;
> +
> +		if (!strncmp(pci_ids[i].name, TGL, strlen(TGL))) {
> +			char *tmp =3D strdup(pci_ids[i].name);
> +			pci_ids[i].name =3D tmp;
> +			strcpy(pci_ids[i].name + 3, tmp + strlen(TGL));
> +		}
> +
> +		if (shown[pci_ids[i].device] >=3D 0) {
> +			ignore[i] =3D i;
> +
> +                        // If it is duplicated, just ignore it
> +                        if (!cmpfunc(&pci_ids[i], &pci_ids[shown[pci_ids=
[i].device]]))
> +                                continue;
> +
> +			fprintf(stderr, "PCI ID: %04x:%04x %s is a subtype of %s\n",
> +			        pci_ids[i].vendor, pci_ids[i].device,
> +			        pci_ids[i].name,
> +				pci_ids[shown[pci_ids[i].device]].name);
> +
> +			other[shown[pci_ids[i].device]] =3D i;
> +			continue;
> +		}
> +		shown[pci_ids[i].device] =3D i;
> +
> +		if (pci_ids[i].device =3D=3D 0x56c0)
> +			pci_ids[i].name =3D "ATS_M1";
> +
> +		if (pci_ids[i].device =3D=3D 0x56c1)
> +			pci_ids[i].name =3D "ATS_M3";
> +
> +		fprintf(stderr, "Adding: %s: vendor: %04x:%04x\n",
> +		        pci_ids[i].name,
> +		        pci_ids[i].vendor, pci_ids[i].device);
> +	}
> +
> +	/*
> +	 * Step 2: output array with all other devices
> +	 */
> +	printf("my %%intel_pci_id =3D (");
> +
> +	for (i =3D 0; i < ARRAY_SIZE(pci_ids); i++) {
> +		if (ignore[i] > 0)
> +			continue;
> +
> +		if (strcmp(last, pci_ids[i].name)) {
> +			strcpy(last, pci_ids[i].name);
> +			printf("\n");
> +		}
> +
> +		printf("\t\"%04x:%04x\" =3D> \"%s\",\n",
> +		       pci_ids[i].vendor, pci_ids[i].device,
> +		       pci_ids[i].name
> +		);
> +	}
> +	printf(");\n\n");
> +
> +	/*
> +	 * Step 3: output array with all other devices
> +	 */
> +	printf("my %%intel_pci_id_alt_name =3D (");
> +
> +	last[0] =3D '\0';
> +	for (i =3D 0; i < ARRAY_SIZE(pci_ids); i++) {
> +		if (ignore[i] > 0)
> +			continue;
> +
> +		if (other[i] < 0)
> +			continue;
> +
> +		if (strcmp(last, pci_ids[i].name)) {
> +			strcpy(last, pci_ids[i].name);
> +			printf("\n\t# %s alternative names\n", pci_ids[i].name);
> +		}
> +
> +		printf("\t\"%04x:%04x\" =3D> \"%s\",\n",
> +		       pci_ids[i].vendor, pci_ids[i].device,
> +		       pci_ids[other[i]].name
> +		);
> +	}
> +	printf(");\n\n");
> +
> +	/*
> +	 * Step 4: output array for devices with subvendor/subdevice
> +	 */
> +	printf("my %%intel_pci_subvendor_id =3D (\n");
> +
> +	for (i =3D 0; i < ARRAY_SIZE(pci_ids); i++) {
> +		if (pci_ids[i].subvendor =3D=3D (unsigned int) -1)
> +			continue;
> +
> +		fprintf(stderr, "Adding: %s: vendor: %04x:%04x, subvendor: %04x:%04x\n=
",
> +		        pci_ids[i].name,
> +		        pci_ids[i].vendor, pci_ids[i].device,
> +		        pci_ids[i].subvendor, pci_ids[i].subdevice);
> +
> +		printf("\t\"%04x:%04x %04x:%04x\" =3D> \"%s\",\n",
> +		       pci_ids[i].vendor, pci_ids[i].device,
> +		       pci_ids[i].subvendor, pci_ids[i].subdevice,
> +		       pci_ids[i].name
> +		);
> +
> +		ignore[i] =3D 1;
> +	}
> +	printf(");\n\n");
> +
> +	printf("sub fix_id($) {\n");
> +	printf("\tmy $id =3D shift;\n");
> +	printf("\t$id =3D $intel_pci_id{$id} if defined($intel_pci_id{$id});\n"=
);
> +	printf("\treturn $id;\n}\n\n");
> +	printf("my @gpus;\n");
> +	printf("my $id;\n\n");
> +	printf("open IN, \"lspci -nm|\";\n");
> +	printf("while (<IN>) {\n");
> +	printf("\tif (m/\"(8086)\"\\s\"([\\da-f]+)\".*\"([^\\\"]*)\"\\s\"([^\\\=
"]*\")/) {\n");
> +	printf("\t\tmy $pci_id_sub =3D \"$1:$2 $3:$4\";\n");
> +	printf("\t\tmy $pci_id =3D \"$1:$2\";\n");
> +	printf("\t\tif (defined($intel_pci_subvendor_id{$pci_id_sub})) {\n");
> +	printf("\t\t\t$id =3D $intel_pci_subvendor_id{$pci_id};\n");
> +	printf("\t\t} elsif (defined($intel_pci_id{$pci_id})) {\n");
> +	printf("\t\t\t$id =3D $intel_pci_id{$pci_id};\n");
> +	printf("\t\t}\n");
> +	printf("\t\tif ($id) {\n");
> +	printf("\t\t\tmy $subtype =3D \"\";\n");
> +	printf("\t\t\t$subtype =3D \" (\" . $intel_pci_id_alt_name{$pci_id} .\"=
)\" if defined($intel_pci_id_alt_name{$pci_id});\n");
> +	printf("\t\t\tprint \"Detected GPU PCI device: $id$subtype, PCI ID: $pc=
i_id\\n\";\n");
> +	printf("\t\t\tundef($id);\n");
> +	printf("\t\t\tpush @gpus, $id;\n\t\t}\n\t}\n}\n");
> +	printf("close IN;\n\n");
> +	printf("if (@gpus =3D=3D 0) {\n");
> +	printf("\tprint STDERR \"Warning: No Intel GPUs detected.\\n\";\n");
> +	printf("} elsif (@gpus > 1) {\n");
> +	printf("\tprint STDERR \"Warning: More than one Intel GPUs detected.\\n=
\";\n");
> +	printf("}\n");
> +}

--=20
Jani Nikula, Intel
