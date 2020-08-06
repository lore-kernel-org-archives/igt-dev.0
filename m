Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C509B6E899
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 08:43:52 +0000 (UTC)
Date: Thu, 6 Aug 2020 11:43:50 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200806084350.GX20883@platvala-desk.ger.corp.intel.com>
References: <20200723235458.43684-1-carlos.santa@intel.com>
 <20200724070822.GY20883@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724070822.GY20883@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH v2] tests: use an empty brace initializer
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

On Fri, Jul 24, 2020 at 10:08:22AM +0300, Petri Latvala wrote:
> On Thu, Jul 23, 2020 at 04:54:58PM -0700, Carlos Santa wrote:
> > In some sandboxes the toolchain complains about missing
> > braces around initializer, however, using an empty
> > initializer is enough to shut out the compiler.
> > 
> > ../tests/kms_plane_cursor.c: In function '__real_main_302':
> > ../tests/kms_plane_cursor.c:305:2 error: missing braces around
> > initializer [-Werror=missing-braces]
> > 	data_t data = { 0 };
> > 
> > v2:
> >    Use an empty initializer { } instead of { 0 } <Petri, Latvala>
> 
> Remove the comma, I'm "Petri Latvala" :)
> 
> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>



And after a momentary brain failure, this is now also merged.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
