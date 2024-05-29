Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB2EC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 21:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F8011A592;
	Wed, 29 May 2024 21:13:33 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCC411A592
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 21:13:30 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239] helo=hazy.lan)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1sCQbt-00000001HhI-0i9B; Thu, 30 May 2024 00:13:26 +0300
Message-ID: <6815028c4c13d8c2d3c5080389fdfc4067dbd501.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>, Mark Yacoub
 <markyacoub@chromium.org>, Manasi Navare <navaremanasi@chromium.org>
Date: Thu, 30 May 2024 00:13:24 +0300
In-Reply-To: <20240529160646.nv6ovnpgw7ttzilz@kamilkon-DESK.igk.intel.com>
References: <20240528075855.463729-1-luciano.coelho@intel.com>
 <20240528075855.463729-2-luciano.coelho@intel.com>
 <20240529160646.nv6ovnpgw7ttzilz@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v2 1/2] lib/igt_chamelium: check
 drmModeGetConnector() return in wait_for_connected_state()
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

On Wed, 2024-05-29 at 18:06 +0200, Kamil Konieczny wrote:
> Hi Luca,

Hi Kamil,

> On 2024-05-28 at 10:58:54 +0300, Luca Coelho wrote:
>=20
> change now looks ok but why did you ignored my suggestion
> about short subject?

Oh, sorry, but I didn't _ignore_ your suggestion.  I replied to it,
expressed my opinion and explained why I didn't think it needed to be
changed.


> Please see CONTRIBUTING.md about test
> description:
> The description should contain the spirit of the test (what is
> the general idea behind the test) and *not* the letter (C to English
> translation of the test).

This is not a new test, so I think this doesn't really apply.  This is
a very specific fix in a very specific place of an existing test and I
think getting a general idea of what was wrong in the code and why it
needs to be changed is the right thing to describe here.

This text you quoted is about what should be in igt_describe() and not
in the commit message, right?



> The same principle apply to your subject description of change,
> it should be short, not 'translation from C code of a change'.
> It should also be rather short, up to 75 chars (or maybe even 65)
> to keep it all in mailing list discussion.
> You coould also look into:
> https://patchwork.freedesktop.org/series/134188/
>=20
> So imho here, instead of:
> lib/igt_chamelium: check drmModeGetConnector() return in wait_for_connect=
ed_state()

This describes what was fixed and where.


> imho better:
> lib/igt_chamelium: Fix NULL dereferencing bug in wait_for_connected_state=
()

This describes that something was fixed and where, without specifying
what was fixed.


> or even better:
> lib/igt_chamelium: Fix bug in wait_for_connected_state()

This is even more generic and there could be several bugfixes in this
function which would end up with the same commit subject...


> or maybe:
> lib/igt_chamelium: check drmModeGetConnector() return value before use

Conversely,this describes what was fixed but not where.


> You could propose other subject if you find a better description.

I generally follow the kernel's coding style.  One important part of
the subject line, IMHO, is the uniqueness and identifiability of it.=20
Like explained here[1]:

"[...]the ``summary phrase`` of your email becomes a
globally-unique identifier for that patch.  It propagates all the way
into the ``git`` changelog.  The ``summary phrase`` may later be used
in
developer discussions which refer to the patch.  People will want to
google for the ``summary phrase`` to read discussion regarding that
patch.  It will also be the only thing that people may quickly see
when, two or three months later, they are going through perhaps
thousands of patches using tools such as ``gitk`` or ``git log
--oneline``."

I admit that the subject is a bit long, but it actually contains only 5
relevant words.  The function names are rather long and, with about 20
characters of boilerplate ("lib/igt_chamelium: ") and 47 chars only in
function names, it's literally impossible to keep the subject line
inside the 70-75 recommended length while still keeping it descriptive
and unique...

But this is a different project and I'm not a maintainer, so I can do
whatever you think is right here.  Just tell me which option you prefer
and I'll resubmit my patch with it.


[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst#n652

--
Cheers,
Luca.
