Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7964CC021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 17:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3344710E737;
	Tue, 18 Feb 2025 17:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2PVArHt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0353D10E737
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 17:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739899533; x=1771435533;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yA6AQgtQQ3EikHoVfmQ1ENEnSoKxCHLQ4nl+NAP+Bmw=;
 b=i2PVArHtK2q5ZXfrWkK2x2R31HBUqOcesVxCj32GwCAMN5paHDKs0AlK
 Zhia3X3IsZ8+SHzSqrV+gY+fkH+zfGc63cOVvSFv6Lntcaoxd/B90HEBu
 TzpbnxzJkm3xBcJdnxCH/vdmibI81NQ0h5Sb1KXWYqTmgbqg/ACB4JCFe
 3Tvigcob9COvVEVTrLLmkRxEa8a67sN/BSP8B41LPERr8nuZP0Q16C6bj
 PL6kHjh1ed8aV1uhDKHQf7huo8a8b+5DhVASKOOmps7HdBR2Td2WYaLag
 zPk06FQd8ou9q26ciR4KcCGh6NtgAyM8i3WNEYp5FOfPIDnfIR/vYs+tO A==;
X-CSE-ConnectionGUID: Eu8oUsICTSeV3wh7qkEFkw==
X-CSE-MsgGUID: jep3M9aZR2ucZYpCOjFojg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52038877"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52038877"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 09:25:32 -0800
X-CSE-ConnectionGUID: QdWWVLEITVm2xvA07pOnOw==
X-CSE-MsgGUID: BCq6SA/1SceMdn/j+FS4SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114929403"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 09:25:31 -0800
Date: Tue, 18 Feb 2025 18:25:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tools/intel_reg: Add --pci-slot option
Message-ID: <20250218172528.5lfrkvfsqji42ayg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250131213733.142894-1-kamil.konieczny@linux.intel.com>
 <xc6requiewswst7w4vpl5beezwwotlqqrg4efy34ynvyexk6jk@bqndrc7rgmla>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <xc6requiewswst7w4vpl5beezwwotlqqrg4efy34ynvyexk6jk@bqndrc7rgmla>
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

Hi Krzysztof,
On 2025-02-12 at 13:40:15 +0000, Krzysztof Karas wrote:
> Hi Kamil,
> 
> [...]
> >  	printf(" --all          Decode registers for all known platforms. Implies --decode\n");
> > +	printf(" --pci-slot     Decode registers for platform described by PCI slot\n"
> > +	       "		<domain>:<bus>:<device>[.<func>]\n");
> You could include information that if PCI slot is not provided,
> then the first matching Intel device (starting with 0000:00:02.0)
> will be chosen.
> 

If user will not provide any input for slot she/he can just
use it without this option and this is already a default
behaviour but I agree, it could be clarified so I will add it.

Btw all options are optional (see printed help).

> [...]
> > +static int parse_pci_slot_name(struct igt_pci_slot *st, const char *slot_name)
> > +{
> > +	int i;
> > +
> > +	st->domain = 0;
> > +	st->bus = 0;
> > +	st->dev = 0;
> > +	st->func = 0;
> If you zeroed bdf: struct igt_pci_slot bdf = {}; before calling
> parse_pci_slot_name(), then it could become:
> 
> return sscanf(slot_name, "%x:%x:%x.%x", &st->domain, &st->bus, &st->dev, &st->func);
> 

Right, will change.

> > +	i = sscanf(slot_name, "%x:%x:%x.%x", &st->domain, &st->bus, &st->dev, &st->func);
> > +
> > +	return i;
> > +}
> > +
> > +static bool is_graphics_card_valid(struct pci_device *pci_dev)
> > +{
> > +	if (!pci_dev) {
> > +		fprintf(stderr, "Graphics card not found\n");
> > +		return false;
> > +	}
> > +	if (pci_device_probe(pci_dev) != 0) {
> > +		fprintf(stderr, "Couldn't probe graphics card\n");
> > +		return false;
> > +	}
> > +	if (pci_dev->vendor_id != 0x8086) {
> > +		fprintf(stderr, "Graphics card is non-intel\n");
> > +		return false;
> > +	}
> > +	return true;
> > +}
> This function checks whether a pci_dev can be found, probed and
> has Intel as vendor - there technically is no information about
> this device being a GPU. You could change the name to something
> like: "is_pci_device_valid" (unless there is a way to determine
> a device is a GPU, then that addition would be better).
> 
> [...]

Right, I will change this into is_intel_card_valid()
and also improve error prints plus style (newlines after
closing brackets).

> >  int main(int argc, char *argv[])
> >  {
> > -	int ret, i, index;
> > +	int i, index;
> >  	char *endp;
> > +	char *opt_slot = NULL;
> >  	enum opt opt;
> >  	const struct command *command = NULL;
> >  	struct config config = {
> > @@ -1191,6 +1264,7 @@ int main(int argc, char *argv[])
> >  		.fd = -1,
> >  	};
> >  	bool help = false;
> > +	int ret = EXIT_FAILURE;
> this ret variable is not used up till ret = command->function(),
> so I don't think there is a benefit to adding a certain error
> code to it, unless you'd change all "return EXIT_FAILURE;"
> to "return ret;".
> 
> [...]
> > -	if (read_reg_spec(&config) < 0)
> > -		return EXIT_FAILURE;
> > -
> > -	ret = command->function(&config, argc, argv);
> > +	if (read_reg_spec(&config) >= 0)
> > +		ret = command->function(&config, argc, argv);
> This is unrelated to adding "--pci-slot" - it could be placed in
> a separate patch or mentioned in commit message as a cleanup.

Ah, good catch, I should resist unneeded refactoring, I will
revert this so no big changes here.

> 
> I also noticed that the intel_reg program is not very resistant
> to user misinput: if you attempt to use "read" option with
> a device that does not have a certain register, then the program
> crashes with assestion failures.
> 
> Best regards,
> Krzysztof

Please provide example(s) how did you run it so I could
reproduce it.

Regards,
Kamil

