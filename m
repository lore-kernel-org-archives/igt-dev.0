Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BB710E092
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 10:23:45 +0000 (UTC)
Date: Tue, 25 Jul 2023 12:23:34 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Message-ID: <20230725102334.deyxsrhdtlu4m4da@zkempczy-mobl2>
References: <20230718121443.445343-1-kunal1.joshi@intel.com>
 <20230718121443.445343-3-kunal1.joshi@intel.com>
 <20230720100245.2lref6sw6j7btr7k@zkempczy-mobl2>
 <74f54cd8-cbeb-a97f-9af1-4b64072ad2d6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74f54cd8-cbeb-a97f-9af1-4b64072ad2d6@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_fb: on xe driver switch
 from rendercopy to blitcopy
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jul 25, 2023 at 03:46:19PM +0530, Joshi, Kunal1 wrote:
>    On 7/20/2023 3:32 PM, Zbigniew Kempczyński wrote:
> 
>  On Tue, Jul 18, 2023 at 05:44:43PM +0530, Kunal Joshi wrote:
> 
>  on xe driver use blitcopy for everything where otherwise would
>  use rendercopy.
> 
>  Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>  ---
>   lib/igt_fb.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
>  diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>  index 6ce4b735a..f4bc800fe 100644
>  --- a/lib/igt_fb.c
>  +++ b/lib/igt_fb.c
>  @@ -2529,7 +2529,7 @@ static bool use_enginecopy(const struct igt_fb *fb)
>          if (!is_intel_device(fb->fd))
>                  return false;
>  
>  -       if (!is_xe_device(fb->fd) && blitter_ok(fb))
>  +       if (blitter_ok(fb))
>                  return false;
> 
>  I stared to this and for me it looks we disable rendercopy at all
>  for i915 as well for xe even if rendercopy is same for i915 and xe
>  (intel-bb should handle this).
> 
>  --
>  Zbigniew
> 
> 
>    Hello Zbigniew,
> 
>    Blitter is preferred over render copy for perf/power and render copy is 
>    preferred for feature.
>    JP's changes are considering that fact. With this info does this patch
>    look good?

Yes, if preference is to use blitter instead of render this change looks
good for me. So you may add my r-b:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
 
> 
>    Thanks and Regards
>    Kunal Joshi
