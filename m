Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E33A89E0D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2020 09:47:19 +0000 (UTC)
Date: Mon, 23 Mar 2020 15:07:20 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20200323093719.GA7154@intel.com>
References: <20200323063248.5261-1-anshuman.gupta@intel.com>
 <20200323063248.5261-5-anshuman.gupta@intel.com>
 <140df64efa22434ea6c4e349ccd2bf71@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <140df64efa22434ea6c4e349ccd2bf71@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/5] tests/i915_pm_lpsp:
 screens-disabled subtest use igt_wait
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
To: "Peres, Martin" <martin.peres@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-03-23 at 12:35:29 +0530, Peres, Martin wrote:
> On 2020-03-23 08:32, Anshuman Gupta wrote:
> > Some times delayed audio codec disabling causes failure
> > of test, using igt_wait to check lpsp after disabling all outputs.
> 
> Seems like this answers my question on patch 2/5: We are sending audio
> to the screen even when we do not have anything to send...
> 
> I know there are some screens that take ages to re-enable sound after
> not getting any for a while, but waiting 10 or even 30s without sound
> before disabling it does not sound like a terrible idea. My TV
> automatically disables sound after way less than that anyway.
> 
> So, to me, this is a driver bug.
> 
> That being said, the patch is fine even if your reason for it is not
> acceptable.
Thanks Martin for comment, i will drop this patch, remove the
unloading of sound moudles from 2/5 patch, and will send an update.
Thanks,
Anshuman Gupta, 
> 
> Martin
> > 
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  tests/i915/i915_pm_lpsp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
> > index 0ce694e6..5f15c034 100644
> > --- a/tests/i915/i915_pm_lpsp.c
> > +++ b/tests/i915/i915_pm_lpsp.c
> > @@ -91,7 +91,7 @@ static void screens_disabled_subtest(data_t *data)
> >  		igt_display_commit(&data->display);
> >  	}
> >  
> > -	igt_assert(lpsp_is_enabled(data));
> > +	igt_assert(igt_wait(lpsp_is_enabled(data), 1000, 100));
> >  }
> >  
> >  static void check_output_lpsp(data_t *data)
> > 
> 

> pub  2048R/33A53379 2019-12-02 Martin Peres <martin.peres@linux.intel.com>
> sub  2048R/C5E7DE5F 2019-12-02 [expires: 2020-12-01]

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
