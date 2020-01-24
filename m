Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D813E6FFFE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 10:01:49 +0000 (UTC)
Date: Fri, 24 Jan 2020 12:01:20 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200124100120.GM25209@platvala-desk.ger.corp.intel.com>
References: <1579766442-20285-1-git-send-email-kunal1.joshi@intel.com>
 <1579766442-20285-2-git-send-email-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579766442-20285-2-git-send-email-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/4] lib/igt_chamelium Added
 chamelium_frame_match_or_dumpn which returns bool that the captured frame
 matches with reference framebuffer
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: ville.syrjala@intel.com, igt-dev@lists.freedesktop.org, daniel.vetter@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

The subject line needs to be shortened.

How about

lib/chamelium: Add a non-asserting frame match function

On Thu, Jan 23, 2020 at 01:30:39PM +0530, Kunal Joshi wrote:
> Added chamelium_frame_match_or_dump which returns bool that the captured
> frame matches with reference framebuffer.
> 
> (v2)
>         Removed previously added function chamelium_assert_frame_dump_eq.
> 
> (v3)
>         No change.
> 
> (v4)
>         Removed duplicate function code chamelium_assert_frame_dump_match
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Suggested-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  lib/igt_chamelium.c | 25 +++++++++++++++++++++++--
>  lib/igt_chamelium.h |  5 +++++
>  2 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 9971f51..95166e2 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -1583,6 +1583,27 @@ void chamelium_assert_frame_match_or_dump(struct chamelium *chamelium,
>  					  struct igt_fb *fb,
>  					  enum chamelium_check check)
>  {
> +	igt_assert(chamelium_frame_match_or_dump(chamelium, port,
> +						 frame, fb, check));
> +}
> +
> +/**
> + * chamelium_assert_frame_match_or_dump:
               ^^^^^^^
	       wrong name here



Otherwise LGTM.

With those fixed,
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
