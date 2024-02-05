Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B8FC48291
	for <igt-dev@archiver.kernel.org>; Mon,  5 Feb 2024 09:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A7A11247F;
	Mon,  5 Feb 2024 09:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtM9fIEB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EEA11247F
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2024 09:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707125339; x=1738661339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PnOWpVHUVPIM4aTxtKLGRToQHi8Vyh0E+uqulUwB0ws=;
 b=LtM9fIEBaog+t02wQQqw7Wn3G3TBtMq1owzg3CBbrxTQNkUqOLitcxOD
 Aolm1733Ztpd97yz6mxng3n7i8rkoKJPzrwMeVDhdIMZ88al9JfIpoT8j
 1mIaRr/blJcA+HQrrNxfvKdDuBuRsOn8Z4DCPOZMPoVHPo4w7ur/3lmfW
 5Sfo5NeiZLBwcVRDDj8hPjs4ExqLsnOnDxIbCUHWm0I+oPTswlCxkyDGI
 vGErJ3TfduAXJffZ6fLJOtZA56Cy4dP+gmTbVGaL1+bhKrL6q0JYIJeu3
 e5uNdJfGIMCe8uwljBndUOWoS5/w5wL8QPxu2+XdlwyP/+jbxEY2Y6Ssz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="25929930"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="scan'208";a="25929930"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 01:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="673859"
Received: from mkuraz-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.ger.corp.intel.com) ([10.213.2.183])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 01:28:49 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] xe_live_ktest: Use xe_live_test kernel module
Date: Mon, 05 Feb 2024 10:28:45 +0100
Message-ID: <2920874.e9J7NaK4W3@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ifumqs743htqmhkxsns6zievakgadvjcbaqb7bva2cievhfu3x@igaj5s2kke66>
References: <20240202004529.552806-1-lucas.demarchi@intel.com>
 <3493194.som1txNFv6@jkrzyszt-mobl2.ger.corp.intel.com>
 <ifumqs743htqmhkxsns6zievakgadvjcbaqb7bva2cievhfu3x@igaj5s2kke66>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

On Friday, 2 February 2024 16:25:56 CET Lucas De Marchi wrote:
> On Fri, Feb 02, 2024 at 01:00:14PM +0100, Janusz Krzysztofik wrote:
> >On Friday, 2 February 2024 01:45:29 CET Lucas De Marchi wrote:
> >> https://patchwork.freedesktop.org/series/126786/ groups all the live
> >> tests into a single kernel module. Use that module to run any of the
> >> tests triggered by igt.
> >>
> >> To make the live kunit tests work, rename the subtests so they match
> >> what the kernel uses.
> >
> >Both the KUnit module name and the IGT test name clearly indicate they a=
re
>=20
> kunit is usable without igt and I'd like to continue it like that, so

I didn't say there was something wrong with that.

> what remains is the kunit module name. But then that would imply using
> both filter and filter_glob rather than simply using just filter_glob.
>=20
> >strictly related to Xe.  Then, I think that shorter subtest names, witho=
ut the
> >xe_ prefix, are better in that narrow name space.  Couldn't we then rena=
me
> >test suits on the kernel side instead of adding that redundant prefix al=
so to
> >IGT subtest names?
>=20
> I don't think it's a good alternative because the test suite names are
> global, regardless what module it comes from. For all the live tests,

You're right, our xe test suites names are in line with KUnit style=20
recommendations.

Thanks,
Janusz

> they were always prefixed with xe_. We do have some normal kunit without
> prefix, but I=B4d rather add the prefix there than remove here.
>=20
> Lucas De Marchi
>=20




