Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36434E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 18:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B672B10E1A4;
	Tue,  7 Jan 2025 18:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbOLBbGN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F389310E1A4
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 18:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736273127; x=1767809127;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ma36ZDZbE9VNRNy+HlCmG2TqRnZxnP3Rwn/MKJIo7JI=;
 b=BbOLBbGNK8+zuERB8Q7FNkTNFxVkOsodg6P5VStdkfwEBrANHjUmQHcL
 u3onfj0j2bMw+kfagm17r8pDAK5IJqQroQaluqgiLf0tZ2N5DPAYiq2N4
 TJLLaNBr9B4DC2LGLBxx9EleDMTdcMNdkDO5+2WJWVGNTu+PbUCYyzKqr
 Im/+NZWWdroDts4TQL9vfQE6WbiTGx0ST+aNLRmkXIczb9Le0BLiyd8Mq
 oFeQ3JwyGM37Pl1h771BgXLGfsmVovCk7+aXT8LzejsSb/o+po7IJ3quP
 y/AM2ad+vAkFp/d4J+wV2DAoJIsaU66MyEckBSRFQ7qnDWRT/QiQXhEPL Q==;
X-CSE-ConnectionGUID: KWUQTyY9Rxq0WQnL/qDFFw==
X-CSE-MsgGUID: Ez03xfHiRcWNmh9ucDwlFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36587222"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36587222"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 10:05:27 -0800
X-CSE-ConnectionGUID: nUlEvfXBQkOByeGLeshruQ==
X-CSE-MsgGUID: TgkV4PN3TAGcwCqABSgqOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="103355556"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.171])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 10:05:26 -0800
Date: Tue, 7 Jan 2025 12:05:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 6/8] lib/xe/xe_spin: Move declarations around
Message-ID: <574ldsai4kfqovydkwuod3rzjlpp5mfxefdhptwybk34arpakt@bjhvamwtwxap>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
 <20250104071548.737612-6-lucas.demarchi@intel.com>
 <CH0PR11MB54447CFAF69F0029702F45E3E5102@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54447CFAF69F0029702F45E3E5102@CH0PR11MB5444.namprd11.prod.outlook.com>
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

On Mon, Jan 06, 2025 at 10:58:26PM +0000, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De Marchi
>Sent: Friday, January 3, 2025 11:16 PM
>To: igt-dev@lists.freedesktop.org
>Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
>Subject: [PATCH i-g-t 6/8] lib/xe/xe_spin: Move declarations around
>>
>> xe_spin.h has 3 abstractions:
>>
>> 1) the integration with igt_dummyload
>> 2) xe_spin, the bo to be exec'ed somewhere
>> 3) xe_cork, that resembles more the igt_spin, abstracting the fd, vm,
>>    bind, etc
>>
>> Group them so it's easier to understand each one.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Okay, I think I get it.  We're bundling the various functions declared in xe_spin.h
>by their purpose/interaction with the various structures, yeah?  That makes sense
>to me.

yes. We could also use separate headers for each of them, but they are
so related and in a small number that I felt it's ok to leave in the
same header.


>And even if my understanding of the purpose of this patch is wrong, I don't see
>any harm in applying it, so:
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

thanks
Lucas De Marchi
