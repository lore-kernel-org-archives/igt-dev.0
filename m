Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8268EEA3C4E
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 12:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1580410E7E4;
	Thu,  9 Apr 2026 12:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCivaKGf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265E610E7E3
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775737732; x=1807273732;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nlKuJgh9oBv3uSjgSj9AydJelxFMckvyDxlCkMUgZho=;
 b=JCivaKGfquAekSzaMB/CxUZ69D2um0gNwknZ3diBjCde/RNidABL56xQ
 fvCj6k2AYYj4pMMtvxvysh6kxfR1bPJJw7AK2nVPIc63y4Q3nZKXiPZlp
 CpcNwsADAHtURKMThraCfTKgPHq3X2YnNeOvKXHMSYW0TaFfa2wuv1th+
 E3F493YVcyihZAq+OSjPfVFhBu6Ttr5hZThjmE/ZSBrHPqwYIMS7DyY/h
 wbktTeP8EZZjQBBhZp84f9MHvpzZtcKWHATAa3sBzSWMYHYS2KSf/9zBC
 zE523RclBYo9aLbZJigOIoBt7YETVIEgUDg26llvzIABI1d2xU6gneas8 A==;
X-CSE-ConnectionGUID: BNBX/aLvS4+3nUhn5+M8uA==
X-CSE-MsgGUID: Bulz6S0SROC+p68n/LLRcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="79328356"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="79328356"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 05:28:50 -0700
X-CSE-ConnectionGUID: pscDYaC4SIy/8psz42tEyA==
X-CSE-MsgGUID: ckSPJf9nRPeVRDHTfGPRLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="225599300"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 05:28:48 -0700
Message-ID: <14d365148cf89a71539cd47da3eb8ad4dedfe388.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/gem_exec_endless: Use the per-gt
 interface to set frequencies
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Date: Thu, 09 Apr 2026 14:28:46 +0200
In-Reply-To: <lebova5umd6qiypupwch4wunqut7symicwhhuf3hxaa3x4p3qa@kuervnvpa4yy>
References: <20260407105212.43821-2-krzysztof.niemiec@intel.com>
 <1394b3dddf8d96243a814aa7c722e6894fd8ee89.camel@linux.intel.com>
 <lebova5umd6qiypupwch4wunqut7symicwhhuf3hxaa3x4p3qa@kuervnvpa4yy>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
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

Thanks for explanation.  Based on that ...

On Thu, 2026-04-09 at 13:46 +0200, Krzysztof Niemiec wrote:
> On 2026-04-07 at 13:42:20 GMT, Janusz Krzysztofik wrote:
> > Hi Krzysztof,
> >=20
> > On Tue, 2026-04-07 at 12:52 +0200, Krzysztof Niemiec wrote:
> > > The test alters the environment, specifically the gt frequencies, for
> > > its duration. Using the legacy interface however makes it impossible =
for
> > > the pre-test state to be restored due to its limitations in multi-gt
> > > systems.=C2=A0

... because each gt may accept values from a different range and default to
a different value that we may want to restore.

Or something similar.  That won't be too verbose, I believe.

Thanks,
Janusz


> > > Use the per-gt interface instead to properly clean up.
> >=20
> > While I think your solution may be correct, your description is not cle=
ar=C2=A0
> > enough for me.  How is it possible for the legacy interface to work as=
=C2=A0
> > expected when altering the environment, but not ant longer when restori=
ng=C2=A0
> > defaults?
> >=20
>=20
> The legacy interface can only ever emit a singular value to the GTs (the
> same value to all at once), while the per-gt interface allows granular
> control.
>=20
> So, for example, say we have two GTs - gt0 and gt1. You can set the
> frequency values (min_freq, max_freq, boost_freq are the ones set by the
> test) to those that fall in the range in between RPn and RP0. These
> values can be different for different GTs, these are from the test box
> I've been testing the patch on:
>=20
> 	root@box:/sys/class/drm/card1# cat gt/gt0/rps_RPn_freq_mhz
> 	800
> 	root@box:/sys/class/drm/card1# cat gt/gt1/rps_RPn_freq_mhz
> 	100
>=20
> 	root@box:/sys/class/drm/card1# cat gt/gt0/rps_RP0_freq_mhz
> 	2200
> 	root@box:/sys/class/drm/card1# cat gt/gt1/rps_RP0_freq_mhz
> 	1300
>=20
> So gt0 accepts values from the range 800-2200, but gt1 accepts values
> from the range 100-1300.
>=20
> However, the legacy interface reports only one set of these values:
>=20
> 	root@box:/sys/class/drm/card1# cat gt_RPn_freq_mhz
> 	800
> 	root@box:/sys/class/drm/card1# cat gt_RP0_freq_mhz
> 	2200
>=20
> Now, without the patch, the test looks at the legacy interface's RP0 and
> RPn value to alter the environment, showing a range of 800-2200. The
> test sets all frequencies to max (so 2200, as read from the legacy
> interface). This actually fails silently for gt1 in this example:
>=20
> 	root@box:/sys/class/drm/card1# echo 1300 > gt_min_freq_mhz
> 	root@box:/sys/class/drm/card1# echo 2200 > gt_min_freq_mhz
> 	-bash: echo: write error: Invalid argument
>=20
> (the failure is silent because the test doesn't check for a return value)=
.
> gt0 is set properly, gt1 stays at 100. This is because we cannot have
> the information for gt1's range of allowed values, since the legacy
> interface reports the max of these two. Changing it to the minimum of
> the two values will prevent a failure in gt1, but then gt0 will be set
> to 1300 while it can be still raised to 2200, so we're not actually
> setting the maximum value for it, which the test is trying to do. The
> per-gt interface just treats both GTs independently, reading the correct
> range for all of them, so this issue doesn't arise.
>=20
> Then, after the test is finished, the test tries to set the values back
> to what RP0 and RPn report. Let's look at the min_freq because this is a
> cause for problems in further tests that expect a restored environment.
>=20
> After test init, as I described earlier, the values for min_freq are
> 2200 and 100 for gt0 and gt1 respectively. During cleanup, the test reads
> RPn from the legacy interface, which is 800, and then sets the min_freq
> (using the legacy interface too) to this value. Now, since 800 is both in
> the 100-1300 and the 800-2200 range, this will succeed; after this values
> for min_freq are 800 and 800 for gt0 and gt1. This is a mismatch with
> the original values being 800 and 100 for gt0 and gt1.
>=20
> Note that reporting 100 from the legacy interface instead won't fix the
> problem either, as then min_freq for gt1 would be correctly set to 100,
> but setting it for gt0 would fail (100 is not in 800-2200), so the test
> would leave the values at 2200 and 100, respectively, still not
> restoring the environment properly. This is just impossible to
> accomplish using the legacy interface, because it can only ever report a
> single value for any of the attributes.
>=20
> To explain this in detail could be unneccesarily verbose for a git log,
> but if you think it's needed, I can include it.
>=20
> Thanks
> Krzysztof
>=20
> > Thanks,
> > Janusz
> >=20
