Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C3D6E125
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2020 07:56:06 +0000 (UTC)
Date: Wed, 22 Jul 2020 10:56:03 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200722075603.GR20883@platvala-desk.ger.corp.intel.com>
References: <20200721181522.20042-1-carlos.santa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721181522.20042-1-carlos.santa@intel.com>
Subject: Re: [igt-dev] tests: add missing braces around initializer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Carlos Santa <carlos.santa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 11:15:21AM -0700, Carlos Santa wrote:
> In some sandboxes the toolchain complains about missing braces
> around initializer, however, adding an extra pair of braces
> fixes it, see below:
> 
> ../tests/kms_plane_cursor.c: In function '__real_main_302':
> ../tests/kms_plane_cursor.c:305:2 error: missing braces around initializer [-Werror=missing-braces]
> 	data_t data = { 0 };
> 

Argh, gcc.

C++ supports initializing with empty braces ( data_t data = {}; ) and
C doesn't, leaving only the commonly used { 0 } idiom to mean "I just
want to zero-initialize this object, don't care about the
structure". Even better, due to the brace elision clause in the spec,
that construct is fully defined and means exactly fully
zero-initializing the aggregate object regardless of its structure.

I could agree with this change if the initialization used non-zero
values but just adding braces to make the compiler believe you really
meant this...

I wonder if playing around with -Wmissing-initializer
-Wno-missing-braces lets us leave the code as { 0 } for elegance,
while still get a warning for actual incorrect use...

Which version of gcc was this on?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
