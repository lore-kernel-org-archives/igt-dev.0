Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC2CC5AD49
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 11:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E878010E2A6;
	Mon, 26 May 2025 11:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZmMPxZ5N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD7E10E092
 for <igt-dev@lists.freedesktop.org>; Sun, 25 May 2025 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748155831; x=1779691831;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=5WrHLfgZOuUBKh/ZoUKdusJPpYBfnbvrh/Kzz4E+gIo=;
 b=ZmMPxZ5Nf0M4drwU9kq2rU+9udX17SzwQbbGvHiQOId9KABwxleBfWFP
 zFnEndA3xzjqkwmWvlqx/UddXX94CXc74OTxxBpB5cExU0JpS6qcT0cu9
 URRuSX7j25S0R0lvTTSRegp3jihwVu3e+TGAKkMjwEHZr3+kQLQcJZVgN
 IM5VfvWP8t4BOoQD9k/s/qQK/M0OyLgov/bNAgbHA+MIr1jgAwYSXh0rQ
 59ykncG9XksvPLz/9I7K3Ys48nJwrTSbsUh4X/C7y+ubR56RiX9FJt3Jn
 4OagFZx60DL4O7iru3Tl65OSpleTsMzDxG8Q3SyzoXzTr0cPiGRnMpzAZ Q==;
X-CSE-ConnectionGUID: Pu7b+wauQnm4Nn/YkF+KRg==
X-CSE-MsgGUID: 38k7GzN4RcOR9qa0OZIHjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50046392"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; d="scan'208";a="50046392"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 23:50:29 -0700
X-CSE-ConnectionGUID: fBGtcxn2QKq3JuLJIc1Dog==
X-CSE-MsgGUID: O7tXr2ENRQqgG/2Pn9YdIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; d="scan'208";a="141870606"
Received: from intelmailrelay-02.habana-labs.com ([10.111.11.21])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 23:50:26 -0700
Received: internal info suppressed
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 SMTP id 54P6oHSc1659627; Sun, 25 May 2025 09:50:17 +0300
Date: Sun, 25 May 2025 09:50:17 +0300
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, koby.elbaz@intel.com,
 lucas.demarchi@intel.com, ilia.levi@intel.com
Subject: Re: [PATCH] intel_reg: add support to hw address port
Message-ID: <jcfh4fgk3vdnylzqhxjxwdrtddru5ktdd3jfwapsi3d6ggu4ka@mg4vazj52b47>
References: <20250514184042.769898-1-dafna.hirschfeld@intel.com>
 <20250522170406.lwtp7wss3a6jidzk@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250522170406.lwtp7wss3a6jidzk@kamilkon-DESK.igk.intel.com>
X-Mailman-Approved-At: Mon, 26 May 2025 11:13:20 +0000
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

On 22.05.2025 19:04, Kamil Konieczny wrote:
>Hi Dafna,
>On 2025-05-14 at 21:40:42 +0300, Dafna Hirschfeld wrote:
>
>I will leave review for developers on Cc, here I have few nits.
>
>In subject, please add 'tools/' prefix, so instead of
>
>[PATCH] intel_reg: add support to hw address port
>
>it would be:
>
>[PATCH] tools/intel_reg: add support for hw address port
>
Will do.

>> For some platforms we want to access hw addresses.
>> For that we need a callback per platform that maps the hw address
>> to pci address. Add infrastructure to support that.
>>
>
>Do we need any driver support for this? If yes, will it work
>for both i915 and Xe? In that case could you point to driver
>patches for this?
>Btw it would be good to see a sample implementation for at
>least one GPU, maybe in a separate patch.

actually the purpose of this patch is not to need a driver support.
We convert in userspace the hardware address to pci address so no
driver support is needed. It can could work for any version of either i915/Xe,
Only the mapping callback should be added.
Thanks,
Dafna

>
>Regards,
>Kamil
>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
>> ---
>>  tools/intel_reg.c      | 48 +++++++++++++++++++++++++++++++++++-------
>>  tools/intel_reg_spec.c | 36 +++++++++++++++++++++++++++++++
>>  tools/intel_reg_spec.h |  5 +++++
>>  3 files changed, 81 insertions(+), 8 deletions(-)
>>
>> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
>> index 49afe91c0..28df7904f 100644
>> --- a/tools/intel_reg.c
>> +++ b/tools/intel_reg.c
>> @@ -519,12 +519,17 @@ static int read_register(struct config *config, struct reg *reg, uint32_t *valp)
>>  		break;
>>  	case PORT_MCHBAR_16:
>>  	case PORT_MMIO_16:
>> +	case PORT_HWADDR_16:
>>  		val = INREG16(reg->mmio_offset + reg->addr);
>>  		break;
>>  	case PORT_MCHBAR_8:
>>  	case PORT_MMIO_8:
>> +	case PORT_HWADDR_8:
>>  		val = INREG8(reg->mmio_offset + reg->addr);
>>  		break;
>> +	case PORT_HWADDR_32:
>> +		val = INREG(reg->mmio_offset + reg->addr);
>> +		break;
>>  	case PORT_MMIO_VGA_AR:
>>  		val = vga_ar_read(reg->addr, true);
>>  		break;
>> @@ -610,6 +615,7 @@ static int write_register(struct config *config, struct reg *reg, uint32_t val)
>>  		break;
>>  	case PORT_MCHBAR_16:
>>  	case PORT_MMIO_16:
>> +	case PORT_HWADDR_16:
>>  		if (val > 0xffff) {
>>  			fprintf(stderr, "value 0x%08x out of range for port %s\n",
>>  				val, reg->port_desc.name);
>> @@ -619,6 +625,7 @@ static int write_register(struct config *config, struct reg *reg, uint32_t val)
>>  		break;
>>  	case PORT_MCHBAR_8:
>>  	case PORT_MMIO_8:
>> +	case PORT_HWADDR_8:
>>  		if (val > 0xff) {
>>  			fprintf(stderr, "value 0x%08x out of range for port %s\n",
>>  				val, reg->port_desc.name);
>> @@ -626,6 +633,9 @@ static int write_register(struct config *config, struct reg *reg, uint32_t val)
>>  		}
>>  		OUTREG8(reg->mmio_offset + reg->addr, val);
>>  		break;
>> +	case PORT_HWADDR_32:
>> +		OUTREG(reg->mmio_offset + reg->addr, val);
>> +		break;
>>  	case PORT_MMIO_VGA_AR:
>>  		if (val > 0xff) {
>>  			fprintf(stderr, "value 0x%08x out of range for port %s\n",
>> @@ -750,6 +760,14 @@ static int parse_engine(struct reg *reg, const char *s)
>>  	return reg->engine == NULL;
>>  }
>>
>> +/*
>> + * Get codename for a gen5+ platform to be used for finding register spec file.
>> + */
>> +static const char *get_codename(uint32_t devid)
>> +{
>> +	return intel_get_device_info(devid)->codename;
>> +}
>> +
>>  /* s has [(PORTNAME|PORTNUM|ENGINE|MMIO-OFFSET):](REGNAME|REGADDR) */
>>  static int parse_reg(struct config *config, struct reg *reg, const char *s)
>>  {
>> @@ -792,6 +810,28 @@ static int parse_reg(struct config *config, struct reg *reg, const char *s)
>>  	case PORT_MCHBAR_8:
>>  		reg->mmio_offset = mcbar_offset(config->devid);
>>  		break;
>> +	case PORT_HWADDR_32:
>> +	case PORT_HWADDR_16:
>> +	case PORT_HWADDR_8:
>> +		{
>> +			uint64_t dev_addr = strtoull(p, &endp, 16);
>> +			uint32_t pci_addr;
>> +			const char *codename = get_codename(config->devid);
>> +
>> +			ret = hwaddr_to_pciaddr(codename, dev_addr, &pci_addr);
>> +			if (ret) {
>> +				if (ret == -ENOENT)
>> +					fprintf(stderr, "platform %s does not support hwaddr\n",
>> +						codename);
>> +				else
>> +					fprintf(stderr,
>> +						"mapping hw addr 0x%llx to pci bar failed (%d)\n",
>> +						dev_addr, ret);
>> +
>> +				return ret;
>> +			}
>> +			return set_reg_by_addr(config, reg, pci_addr);
>> +		}
>>  	default:
>>  		break;
>>  	}
>> @@ -1077,14 +1117,6 @@ static int intel_reg_help(struct config *config, int argc, char *argv[])
>>  	return EXIT_SUCCESS;
>>  }
>>
>> -/*
>> - * Get codename for a gen5+ platform to be used for finding register spec file.
>> - */
>> -static const char *get_codename(uint32_t devid)
>> -{
>> -	return intel_get_device_info(devid)->codename;
>> -}
>> -
>>  /*
>>   * Get register definitions filename for devid in dir. Return 0 if found,
>>   * negative error code otherwise.
>> diff --git a/tools/intel_reg_spec.c b/tools/intel_reg_spec.c
>> index 632db6b9f..f98d51928 100644
>> --- a/tools/intel_reg_spec.c
>> +++ b/tools/intel_reg_spec.c
>> @@ -32,6 +32,26 @@
>>
>>  #include "intel_reg_spec.h"
>>
>> +struct hwaddr {
>> +	const char *codename;
>> +	int (*hwaddr_lookup)(uint64_t dev_addr, uint32_t *pci_addr);
>> +};
>> +
>> +static const struct hwaddr hwaddr_lookups[] = {
>> +	{ .codename = NULL, /* sentinel */}
>> +};
>> +
>> +int hwaddr_to_pciaddr(const char *codename, uint64_t dev_addr, uint32_t *pci_addr)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; hwaddr_lookups[i].codename; i++) {
>> +		if (strcmp(codename, hwaddr_lookups[i].codename) == 0)
>> +			return hwaddr_lookups[i].hwaddr_lookup(dev_addr, pci_addr);
>> +	}
>> +	return -ENOENT;
>> +}
>> +
>>  static const struct port_desc port_descs[] = {
>>  	{
>>  		.name = "mmio",
>> @@ -83,6 +103,22 @@ static const struct port_desc port_descs[] = {
>>  		.port = PORT_MMIO_VGA_CR,
>>  		.stride = 1,
>>  	},
>> +	{
>> +		.name = "hwaddr",
>> +		.port = PORT_HWADDR_32,
>> +		.stride = 4,
>> +	},
>> +	{
>> +		.name = "hwaddr16",
>> +		.port = PORT_HWADDR_16,
>> +		.stride = 2,
>> +	},
>> +	{
>> +		.name = "hwaddr8",
>> +		.port = PORT_HWADDR_8,
>> +		.stride = 1,
>> +	},
>> +
>>  	{
>>  		.name = "portio",
>>  		.port = PORT_PORTIO,
>> diff --git a/tools/intel_reg_spec.h b/tools/intel_reg_spec.h
>> index af396a294..ccf4fd366 100644
>> --- a/tools/intel_reg_spec.h
>> +++ b/tools/intel_reg_spec.h
>> @@ -34,6 +34,10 @@ enum port_addr {
>>  	PORT_MCHBAR_16,
>>  	PORT_MCHBAR_8,
>>
>> +	PORT_HWADDR_32,
>> +	PORT_HWADDR_16,
>> +	PORT_HWADDR_8,
>> +
>>  	PORT_MMIO_VGA_AR,
>>  	PORT_MMIO_VGA_SR,
>>  	PORT_MMIO_VGA_GR,
>> @@ -86,6 +90,7 @@ static inline void *recalloc(void *ptr, size_t nmemb, size_t size)
>>  	return realloc(ptr, nmemb * size);
>>  }
>>
>> +int hwaddr_to_pciaddr(const char* codename, uint64_t dev_addr, uint32_t *pci_addr);
>>  int parse_port_desc(struct reg *reg, const char *s);
>>  ssize_t intel_reg_spec_builtin(struct reg **regs, uint32_t devid);
>>  ssize_t intel_reg_spec_file(struct reg **regs, const char *filename);
>> --
>> 2.34.1
>>
