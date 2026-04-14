Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D075F9D0D6
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 15:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18D810E0EA;
	Tue, 14 Apr 2026 15:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSI1JDXg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384DB10E0ED
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 15:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776181904; x=1807717904;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=xlNy0BGvO081Dc/R75Y/zTshxjDup+/tBwzY1p25iNw=;
 b=mSI1JDXgnlFPr2RJ3VahbzqoRxoQKhwYrC6Cwl+UL6mWC77mrrc93xNh
 /FJUDstOhWsezwvMJO8PidKAQ7ByVQi0fsbyDoPsCCW4OFdhN9KvlKPj0
 akdFEc+9q567N0EJv0bkW9QQI7FxBZge3bPJDgYbK5o/bBVOkdYPv7pNq
 Kc7KdhfPJ435ASwXGr5bhebt0cptJ2L8OUVn/49luEtkt/06QFXCH9J2E
 q7w+dhzM9gIhr8V54NtzRmLdukpKbDEAo3BYKmsR4wjrd07z8a85Irf/G
 1jqfncfB94bv/O3RYHT8gzhdvpFbpqdYEaLR+7U3UKgd+ytVWsBO3coRu Q==;
X-CSE-ConnectionGUID: 3RgUECZ9QDGK0jXgg4XenA==
X-CSE-MsgGUID: SBxBHqi7QyKr7JnSa85cQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77021574"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77021574"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 08:51:44 -0700
X-CSE-ConnectionGUID: X6iqf5MwSceqNqUs2mDdwQ==
X-CSE-MsgGUID: RIGpy5U7RjKfvBx/SszXqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225830025"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 08:51:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/16] igt: clean up typedef usage, use
 for_each_output() more
In-Reply-To: <ad5KbvOAgWfOiyG6@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1776150714.git.jani.nikula@intel.com>
 <ad5KbvOAgWfOiyG6@intel.com>
Date: Tue, 14 Apr 2026 18:51:39 +0300
Message-ID: <cd012ba649468272cbd655b47c98b108ebb38efd@intel.com>
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

On Tue, 14 Apr 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Apr 14, 2026 at 10:14:20AM +0300, Jani Nikula wrote:
>> This series spiraled into a few things:
>>=20
>> - use typedefs like igt_foo_t more consistently instead of struct
>>   igt_foo
>
> I'm not a huge fan of the typedefs but getting rid of them now
> would involve a gargantuan patch. So best to just accept them
> I guess.

Yeah, in general I'd reserve typedefs for opaque types that you really
aren't supposed to look at. It feels weird to have some foo_t and then
go on to access its members implicitly assuming it's a struct.

But I think that ship has sailed, and we're better off focusing on
consistency here.

And we're just a couple of brainwashed kernel developers avoiding
typedefs. ;)

> Series is
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed the lot.

BR,
Jani.


--=20
Jani Nikula, Intel
