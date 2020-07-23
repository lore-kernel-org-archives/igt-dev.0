Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0676E1B8
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2020 15:30:16 +0000 (UTC)
Message-ID: <e74bfdd7e756acd24973db4d79d4adafb4ba79e6.camel@intel.com>
From: Carlos Santa <carlos.santa@intel.com>
Date: Thu, 23 Jul 2020 08:29:30 -0700
In-Reply-To: <20200722075603.GR20883@platvala-desk.ger.corp.intel.com>
References: <20200721181522.20042-1-carlos.santa@intel.com>
 <20200722075603.GR20883@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 2020-07-22 at 10:56 +0300, Petri Latvala wrote:
> On Tue, Jul 21, 2020 at 11:15:21AM -0700, Carlos Santa wrote:
> > In some sandboxes the toolchain complains about missing braces
> > around initializer, however, adding an extra pair of braces
> > fixes it, see below:
> > 
> > ../tests/kms_plane_cursor.c: In function '__real_main_302':
> > ../tests/kms_plane_cursor.c:305:2 error: missing braces around
> > initializer [-Werror=missing-braces]
> > 	data_t data = { 0 };
> > 
> 
> Argh, gcc.
> 
> C++ supports initializing with empty braces ( data_t data = {}; ) and
> C doesn't, leaving only the commonly used { 0 } idiom to mean "I just
> want to zero-initialize this object, don't care about the
> structure". Even better, due to the brace elision clause in the spec,
> that construct is fully defined and means exactly fully
> zero-initializing the aggregate object regardless of its structure.
> 
> I could agree with this change if the initialization used non-zero
> values but just adding braces to make the compiler believe you really
> meant this...
> 
> I wonder if playing around with -Wmissing-initializer
> -Wno-missing-braces lets us leave the code as { 0 } for elegance,
> while still get a warning for actual incorrect use...
> 
> Which version of gcc was this on?

It was with gcc 4.9, googling around this issue seems to be a bug
within the toolchain itself: 
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119 but it looks like
the fix was never backported.

Carlos

> 
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
