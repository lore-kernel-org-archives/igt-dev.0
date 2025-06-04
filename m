Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F45C5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 11:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1521D10E71B;
	Wed,  4 Jun 2025 11:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I16q2xHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665EE10E6A2
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 11:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749037694; x=1780573694;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=DhNdnzrwH4ytarB0yMLJGcSdys/u2+iu/NSUsuKJnKY=;
 b=I16q2xHKhKdoolLbtZbrHumQRoYfSmY/yjuZjhnc3VHA1xb4fClTsYb8
 79ECAnCyjkQGkWTO3j7GgEwaZpe/x1S3SeJNbx/S1KnYXqx5kXQAProSH
 enxz3uZIHly6ynrUrZ625/N3QhiRyY06y3K59/NkzX0bH0Hl7Tno101ji
 1oGdsP+N9yOqdEzNsW1DeJSzsjqi/MXkJC4UU84oXmKA8NaP5yL1ezjTo
 ND8JIsM/gRMMdiCzOtlWgXSli3CL1fDlRRVDlyabLhM6GpvUnwlkn9ymz
 jojaIjdm/iqCoNZPT49walL6H2b/aX5ygSpSO+DAkczm4CNDyI3wLKeU3 w==;
X-CSE-ConnectionGUID: 2oJZIrlVSma+LjuDzKcPTw==
X-CSE-MsgGUID: Qqk/Tp/SSKuzmfts4z70oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68664430"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="68664430"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 04:48:13 -0700
X-CSE-ConnectionGUID: sPq/NcHDTEujlvfK1UmuCA==
X-CSE-MsgGUID: NvwHtez0Sn+7YEbfTz3PWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="168334983"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 04:48:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1 1/2] lib/igt_psr: Skip the test when PSR is
 disabled
In-Reply-To: <SJ0PR11MB50721CC4FBE56C699B83FE5B8F62A@SJ0PR11MB5072.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250513121918.2758842-1-michal.grzelak@intel.com>
 <20250513121918.2758842-2-michal.grzelak@intel.com>
 <DM4PR11MB6312170FB25617B0A4A490AF9065A@DM4PR11MB6312.namprd11.prod.outlook.com>
 <SJ0PR11MB50721CC4FBE56C699B83FE5B8F62A@SJ0PR11MB5072.namprd11.prod.outlook.com>
Date: Wed, 04 Jun 2025 14:48:09 +0300
Message-ID: <14806d021fac55a7145795dfd254ea3ad7171e4f@intel.com>
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

On Mon, 02 Jun 2025, "Grzelak, Michal" <michal.grzelak@intel.com> wrote:
> Hi Jeevan,
>
>> -----Original Message-----
>> From: B, Jeevan <jeevan.b@intel.com>=20
>> Sent: Monday, May 26, 2025 7:38 AM
>> To: Grzelak, Michal <michal.grzelak@intel.com>; igt-dev@lists.freedeskto=
p.org
>> Cc: Grzelak, Michal <michal.grzelak@intel.com>
>> Subject: RE: [PATCH i-g-t v1 1/2] lib/igt_psr: Skip the test when PSR is=
 disabled
>
>>> -----Original Message-----
>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of=20
>>> Michal Grzelak
>>> Sent: Tuesday, May 13, 2025 5:49 PM
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: Grzelak, Michal <michal.grzelak@intel.com>
>>> Subject: [PATCH i-g-t v1 1/2] lib/igt_psr: Skip the test when PSR is=20
>>> disabled
>>>=20
>>> If PSR setup timing is not met, then PSR will stay disabled and test=20
>>> will fail anyway. Skip the test upon finding that setup timing was not =
met.
>>>=20
>>> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
>>> ---
>>>  lib/igt_psr.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/lib/igt_psr.c b/lib/igt_psr.c index 3d8f1949b..f35051ebc=20
>>> 100644
>>> --- a/lib/igt_psr.c
>>> +++ b/lib/igt_psr.c
>>> @@ -38,7 +38,7 @@ bool psr_disabled_check(int debugfs_fd)
>>>  	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
>>>  				sizeof(buf));
>>>=20
>>> -	return strstr(buf, "PSR mode: disabled\n");
>>Lets not change the format here. We can still keep it as PSR mode : disab=
led/enabled
>>> +	return strstr(buf, "PSR disabled:");
>>>  }
>>>=20
>>>  bool selective_fetch_check(int debugfs_fd, igt_output_t *output) @@=20
>>> -122,6
>>> +122,8 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode=20
>>> +mode,
>>> igt_output_t *o
>>>=20
>>>  	igt_skip_on(strstr(buf, "PSR sink not reliable: yes"));
>>>=20
>>> +	igt_skip_on(strstr(buf, "PSR setup timing not met"));
>>> +
>> I think instead of printing like this. It can be:  PSR sink not reliable=
: yes (setup timing not met)
>
> My current understanding is that kernel on JSL reports that sink is relia=
ble. But it disables PSR basing on the setup timing. Thus, questioned lines=
 in i915_edp_psr_status with this change look like this:
>
> PSR mode: disabled
> PSR sink not reliable: no (PSR setup timing not met)
>
> I thought it looks a bit misleading, because it seems like we are giving =
the reason why the sink is reliable, and not why PSR is disabled. That's wh=
y I also changed the format, to include this case. Also, because of that, i=
n the IGT test we would still need two different checks for skip, since "si=
nk not reliable:" is independent of "PSR setup timing not met".
>
> What are your thoughts on this? Should we keep the reason after "sink not=
 reliable:", change the format, or something else?

I think overall the PSR should migrate towards what we have for FBC. If
PSR is disabled, we want to know the reason.

"PSR sink not reliable: yes (setup timing not met)" is not
interesting. Moreover, "setup timing not met" is not the reason sink is
not reliable. Both "setup timing not met" *and* "sink is not reliable"
are orthogonal reasons for not enabling PSR.

I think we should go towards something like "PSR disabled: <reason>".

BR,
Jani.

--=20
Jani Nikula, Intel
