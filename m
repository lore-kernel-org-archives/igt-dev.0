Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B6DCD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 07:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3864310E21D;
	Mon, 15 Jun 2026 07:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGhdMPNt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1085B10E223
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 07:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781507706; x=1813043706;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=DxQTygFkGZruQ/czyVhtwphJW+16WIy+v6fRiGBWr9E=;
 b=EGhdMPNtZH+/MGLxkgoFDmG8lXblpo2rglfWhPm2TU5p1Nt936U3X5qr
 Fy56Smfgn55PIWGsEEhsWXKQfzDBEtqitTivVGzfXXwmsdteQdRcNYP5z
 X7ArIOZh7IEWKJxqVD0+baIK2UDS+3DiJCUlUAaE+NyapDkvMVxK3rezq
 4xKgvsLhG8t3qvHc0EEW7CSPgSyCa3piCHhyM2ryJePvjex0U6R453JW7
 KPw+mdguI2XsTuK7QtxDPCexxBVeneo+gL4d95T/WYFZwMFedd8vDK+qC
 sVzmuM8ZhhGHdZJoE1JYG1aCUxsoVb4BL/2+keqMEzzkqsB+hpI0NhNj+ A==;
X-CSE-ConnectionGUID: byu+HRYsT0CIWCiKFuW+8A==
X-CSE-MsgGUID: 3G1nzUPiQMqfhFC3D9s11g==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="107670394"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="107670394"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 00:15:06 -0700
X-CSE-ConnectionGUID: E4mPxxTTRDqgMCPS59+NUw==
X-CSE-MsgGUID: YKQInzEdRwq8GkaIRR1iLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247429421"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 00:15:04 -0700
Date: Mon, 15 Jun 2026 09:15:02 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: =?ISO-8859-15?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 igt-dev@lists.freedesktop.org, suraj.kandpal@intel.com
Subject: Re: [PATCH i-g-t v2 5/8] tools/vbt_decode: guess devid from VBT
 signature
In-Reply-To: <a43e799387cd3b6bca43ebc8ca01533e61944fbe@intel.com>
Message-ID: <32a15e48-38fb-61f5-4378-0876b4b23f25@intel.com>
References: <20260608124121.3131410-1-michal.grzelak@intel.com>
 <20260608124121.3131410-6-michal.grzelak@intel.com>
 <0996de35feb92695fa211aafb9adcdce7e770f50@intel.com>
 <ail_J2_jB238ws74@intel.com>
 <a43e799387cd3b6bca43ebc8ca01533e61944fbe@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-448954767-1781507705=:605841"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-448954767-1781507705=:605841
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 11 Jun 2026, Jani Nikula wrote:
> On Wed, 10 Jun 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>> On Wed, Jun 10, 2026 at 05:42:58PM +0300, Jani Nikula wrote:
>>> On Mon, 08 Jun 2026, Michał Grzelak <michal.grzelak@intel.com> wrote:
>>>> Nowadays Device ID needs to be passed to decode VBT precisely. VBT lacks
>>>> it since VBT has been moved from PCI ROM into opregion.
>>>>
>>>> However we can narrow from which platform VBT originated basing on VBT
>>>> signature.
>>>>
>>>> Add a command-line option to guess devid using VBT signature. Create an
>>>> array of signatures and check if any of those is a substring of
>>>> signature extracted from given VBT. Map each signature into first Device
>>>> ID of a platform picked from include/drm/intel/pciids.h. Log that devid
>>>> has not been matched if signature is not found.
>>>>
>>>> Note that the platform-specific name should appear after "$VBT ", hence
>>>> the match.
>>>>
>>>> Suggested-by: Jani Nikula <jani.nikula@intel.com>
>>>> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
>>>> ---
>>>>  tools/intel_vbt_decode.c | 36 +++++++++++++++++++++++++++++++++++-
>>>>  1 file changed, 35 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
>>>> index 5681643f4b..ec82b00939 100644
>>>> --- a/tools/intel_vbt_decode.c
>>>> +++ b/tools/intel_vbt_decode.c
>>>> @@ -77,6 +77,7 @@ struct context {
>>>>  	uint32_t devid;
>>>>  	int panel_type, panel_type2;
>>>>  	int sdvo_panel_type;
>>>> +	bool devid_from_signature;
>>>>  	bool dump_all_panel_types;
>>>>  	bool hexdump;
>>>>  };
>>>> @@ -3693,6 +3694,31 @@ static int get_sdvo_panel_type(struct context *context)
>>>>  	return panel_type;
>>>>  }
>>>>
>>>> +static int
>>>> +get_devid_from_signature(const char *vbt_signature)
>>>> +{
>>>> +	int i;
>>>> +
>>>> +	const char *signature[] = {"PANTHERLAKE",
>>>> +				   "LUNARLAKE",
>>>> +				   "METEORLAKE",
>>>> +				   "JASPERLAKE",
>>
>> That's a somewhat weird selection of platforms.
>
> Come to think of it, I wonder how hard and/or useful it would be to add
> some fuzzy lookup into intel_device_info.c based on the signature. It
> would bypass the need to add anything here.
>
>>
>>>> +				   NULL};
>>>> +
>>>> +	int devid[] = {0xB080, /* PTL */
>>>> +		       0x6420, /* LNL */
>>>> +		       0x7D40, /* MTL */
>>>> +		       0x4E51, /* JSL */
>>>> +		       0x0};
>>>
>>> Please use a struct, something along the lines of:
>>>
>>> 	static const struct {
>>> 		const char *signature;
>>> 		uint16_t devid;
>>> 	} devids[] = {
>>> 		{ .signature = "PANTHERLAKE", .devid = 0xb080, },
>>> 		...
>>> 	};
>>>
>>> Then you can also ditch the /* PTL */ etc. comments.
>>>
>>>> +
>>>> +	for (i = 0; signature[i]; i++)
>>>> +		if (strstr(vbt_signature, signature[i]))
>>>> +			return devid[i];
>>>> +
>>>> +	fprintf(stderr, "Warning: cannot find devid for signature %s\n", vbt_signature);
>>>
>>> This should be a fallback, please don't warn anything here. Only one
>>> warning for the whole devid thing.
>>>
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static int
>>>>  get_device_id(unsigned char *bios, int size)
>>>>  {
>>>> @@ -4108,6 +4134,7 @@ enum opt {
>>>>  	OPT_PANEL_TYPE2,
>>>>  	OPT_PANEL_EDID,
>>>>  	OPT_PANEL_EDID2,
>>>> +	OPT_VBT_DEVID,
>>>>  	OPT_ALL_PANELS,
>>>>  	OPT_HEXDUMP,
>>>>  	OPT_BLOCK,
>>>> @@ -4162,6 +4189,8 @@ int main(int argc, char **argv)
>>>>  		{ "panel-edid",	required_argument,	NULL,	OPT_PANEL_EDID },
>>>>  		{ "panel-type2",	required_argument,	NULL,	OPT_PANEL_TYPE2 },
>>>>  		{ "panel-edid2",	required_argument,	NULL,	OPT_PANEL_EDID2 },
>>>> +		{ "devid-from-signature",
>>>> +				no_argument,		NULL,	OPT_VBT_DEVID },
>>>>  		{ "all-panels",	no_argument,		NULL,	OPT_ALL_PANELS },
>>>>  		{ "hexdump",	no_argument,		NULL,	OPT_HEXDUMP },
>>>>  		{ "block",	required_argument,	NULL,	OPT_BLOCK },
>>>> @@ -4207,6 +4236,9 @@ int main(int argc, char **argv)
>>>>  		case OPT_PANEL_EDID2:
>>>>  			panel_edid2 = optarg;
>>>>  			break;
>>>> +		case OPT_VBT_DEVID:
>>>> +			context.devid_from_signature = true;
>>>> +			break;
>>>>  		case OPT_ALL_PANELS:
>>>>  			context.dump_all_panel_types = true;
>>>>  			break;
>>>> @@ -4313,6 +4345,8 @@ int main(int argc, char **argv)
>>>>  	context.bdb = (const struct bdb_header *)(VBIOS + bdb_off);
>>>>  	context.size = size;
>>>>
>>>> +	if (!context.devid && context.devid_from_signature)
>>>> +		context.devid = get_devid_from_signature((char *) vbt->signature);
>>>
>>> This should be last. The priority should be:
>>>
>>> 	1. command-line, if set
>>> 	2. environment variable, if set
>>> 	3. VBIOS, if available
>>> 	4. deduce from signature, if requested
>>>
>>> Come to think of it, not sure about the "if requested". Maybe just use
>>> it if not otherwise specified. This is userspace decoding, not kernel,
>>> after all.
>>>
>>> Ville, thoughts?
>>
>> Yeah, could probably just take the fallback when we don't know
>> any better.
>>
>> But I'm thinking we should just add the devid to the VBT dump produced
>> by the kernel. Would avoid having to guess, especially since vendors
>> have been known to sometime reuse older VBTs across platforms. Perhaps
>> just prepend the VBT image with a PCIR structure which can then be
>> parsed by the code in get_device_id().
>
> Maybe should've thought of that when we added i915_vbt... I wonder
> what's going to break if we do this?

Should we assume that there are -/no users who load VBT from different
devid than they're currently running, eg. from other SKU? Thinking what
should happen in case of mismatch, especially given that there is no
tool in IGT to craft/modify a brand new VBT.

BR,
Michał

>
> Anyway, even if we added it, not all VBTs are going to have it. I think
> the idea behind the patch at hand is sound, and it should be added as a
> fallback. The kernel part can be added separately, and if we follow the
> order outlined above, it'll take precedence over the guesses here.
>
> BR,
> Jani.
>
>
>>
>>>
>>>>  	if (!context.devid) {
>>>>  		const char *devid_string = getenv("DEVICE");
>>>>  		if (devid_string) {
>>>> @@ -4326,7 +4360,7 @@ int main(int argc, char **argv)
>>>>  	if (!context.devid)
>>>>  		context.devid = get_device_id(VBIOS, size);
>>>>  	if (!context.devid)
>>>> -		fprintf(stderr, "Warning: could not find PCI device ID!\n");
>>>> +		fprintf(stderr, "Warning: could not find PCI device ID! Use --devid or --devid-from-signature\n");
>>>>
>>>>  	if (context.panel_type == -1)
>>>>  		context.panel_type = get_panel_type(&context, false);
>>>
>>> --
>>> Jani Nikula, Intel
>
> -- 
> Jani Nikula, Intel
>
--8323329-448954767-1781507705=:605841--
