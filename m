Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69479606A32C
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 11:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IO0aeRuF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0571E10E18C;
	Mon, 23 Nov 2026 11:32:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57E710E18C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 11:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795433510; x=1826969510;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mJCAE5eJdP9DNsg9bCF9HvqxSfXPclQfDa14hPJgQ3Q=;
 b=IO0aeRuFYdHNiaY2J0GdcnKEGrHEGY3EShE+WYh2bd0Ur0X0JlcPizlK
 jTwBk4coG4OyzY6H1LQ+yy7biziLTo22OHHmTcAx3rW6Fn+PPerxlm8sU
 cj2IdSxiWzZEraqgkdOKY+xoaKqFQOE1iu7Ye9yACAm54UHRPInyioyfo
 oCrU/0Vqa6MXWX/oGW76UvR+NhStxg7gnubaxdlqgrEK2WmEHkqCuzLR6
 1UcqV0OSTsRuEJbS2lAGfxmHwfwrVdUFx3gZDO0d2asd3mZaMjIat9Svo
 H2z8cVDv88cycQuCWiX0bwNKS8QDp0n+/btp3s5js/f+SzydmaB4D3MOZ w==;
X-CSE-ConnectionGUID: DyIcgDkIS0aT1jJZiuxOPA==
X-CSE-MsgGUID: dQVg1vivTxS6Hta90twS2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4146297"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4146297"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:31:50 -0800
X-CSE-ConnectionGUID: l9dDlFacQ06XTInWpMBfDA==
X-CSE-MsgGUID: xHqEGNxnRlyYveQBuziHyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11177132"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:31:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: Gil Dekel <gildekel@google.com>, igt-dev@lists.freedesktop.org, Swati
 Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mark Yacoub <markyacoub@google.com>, kunal1.joshi@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t 0/3] lib/igt_hdr: Find HDR in DisplayID EDIDs
In-Reply-To: <8dbiQ-xKIF5RNdybtcEVmHNWSf03BlJaPre_6_aNt7aSjmvw1EgoZ5aoOI-2-mxrCT-6i0BTv5XighYrhZEpvugCRa8rUTQ4YAqPL3cVmwU=@emersion.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261114222911.1405626-1-gildekel@google.com>
 <7d0886fd698760ab0b2163f6853b64f76199d4ee@intel.com>
 <CA++eeRP3m6kv-zu-Ea9WQOcyWZay77rjmut4R=5+twRpRETcrw@mail.gmail.com>
 <412e328e1721b30468a2fa1b8e93215b2fa30c11@intel.com>
 <8dbiQ-xKIF5RNdybtcEVmHNWSf03BlJaPre_6_aNt7aSjmvw1EgoZ5aoOI-2-mxrCT-6i0BTv5XighYrhZEpvugCRa8rUTQ4YAqPL3cVmwU=@emersion.fr>
Date: Mon, 23 Nov 2026 13:31:44 +0200
Message-ID: <3fd2ec3aa32a752e4291d7bf9327fe60bf3f0b79@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 21 Nov 2026, Simon Ser <contact@emersion.fr> wrote:
> On Wednesday, November 18th, 2026 at 11:46, Jani Nikula <jani.nikula@intel.com> wrote:
>
>> On Mon, 16 Nov 2026, Gil Dekel <gildekel@google.com> wrote:
>> > Hi Jani,
>> >
>> > On Mon, Nov 16, 2026 at 11:40:12AM +0200, Jani Nikula wrote:
>> >> I suggested using libdisplay-info in IGT in April [1]. Has anything
>> >> happened in that front?
>> >>
>> >> The more EDID parsing gets added to IGT, the harder it will be to
>> >> migrate, and the cost of maintaining the local parser increases.
>> >
>> > Nothing I am aware of, and I agree libdisplay-info is the right
>> > long-term direction for IGT. Driving a tree-wide migration (build/CI
>> > dependencies and converting existing lib/igt_edid callers) is beyond
>> > what I can take on right now, though.
>> 
>> Well, it's beyond what *anyone* can take on right now, always.
>> 
>> I keep bringing this up, because more and more EDID parsing keeps
>> getting added, incrementally in small pieces. And it becomes harder for
>> anyone to migrate. Or to maintain.
>
> I don't think the goal should be to migrate everything, everywhere,
> all at once. Nobody can tackle the migration this way. I would
> recommend to migrate incrementally, ideally spreading the effort on
> multiple people. One way to do this would be to ask people to migrate
> a function to libdi instead of adding a new feature to igt_edid if
> that's not a lot more work. Another way would be to freeze igt_edid
> after a given amount of time.

I think the main problem has been that nobody's taken even the first
steps towards adopting libdisplay-info, and it's been hard to block new
EDID parsing on that. But with the libdisplay-info basics in place,
thanks to you, I think the bare minimum going forward should be to
require all new stuff and modification of old stuff to migrate to
libdisplay-info.

>> > I kept the parser delta here minimal so it won't get in the way of that
>> > migration:
>> > - 1/3 isolates the check behind igt_is_edid_hdr(data, size), fixes two
>> >   OOB/overwrite bugs in the CTA loop, and adds unit tests in
>> >   lib/tests/igt_hdr - leaving a single tested function to swap over
>> >   when libdisplay-info lands.
>> > - 2/3 is ~38 net lines reusing lib/igt_edid.h's edid_dispid structs to
>> >   pass DisplayID 0x81 CTA blocks into the same CTA helper, unblocking
>> >   kms_hdr on DisplayID 2.0 eDP OLED panels today.
>> > - 3/3 switches kms_hdr invalid-hdr to /dev/kmsg (no EDID changes).
>> >
>> > Would you be open to landing this series in the meantime so DisplayID
>> > HDR panels aren't blocked while IGT figures out its libdisplay-info
>> > path?
>> 
>> I'm not an IGT maintainer. I don't make the decisions. I'm only
>> commenting on what I personally view as a gradually happening train
>> wreck. Nobody's causing the train wreck, and everyone is. *shrug*.
>> 
>> Cc: Simon, maybe we could nerd snipe him to add the scaffolding to use
>> libdisplay-info. :p
>
> I've sent a small patch to convert igt_hdr, and it also happens to
> supersede this patch for free:
> https://lists.freedesktop.org/archives/igt-dev/2026-November/118994.html
>
> I won't be able to spend a lot of time on this, but I would be happy
> to reply to questions, provide some support and perhaps send an
> occasional migration patch from time to time.

Simon, I think you already contributed the part with the most
impact. Much appreciated! Thanks!

BR,
Jani.


-- 
Jani Nikula, Intel
