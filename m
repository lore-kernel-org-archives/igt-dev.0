Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E646EA1C
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Feb 2021 14:23:53 +0000 (UTC)
Date: Thu, 18 Feb 2021 16:23:54 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YC54ejgwR6md84pT@platvala-desk.ger.corp.intel.com>
References: <20210218093859.29006-1-kunal1.joshi@intel.com>
 <20210218093859.29006-2-kunal1.joshi@intel.com>
 <YC5rIZA4rtyjkU9v@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YC5rIZA4rtyjkU9v@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/igt_chamelium: Added toggle for
 fsm_handling
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
Cc: igt-dev@lists.freedesktop.org, mukunda.pramodh.kumar@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 18, 2021 at 03:26:57PM +0200, Petri Latvala wrote:
> On Thu, Feb 18, 2021 at 03:08:57PM +0530, Kunal Joshi wrote:
> > Added bool fsm_handling
> > 
> > Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> > ---
> >  lib/igt_chamelium.c | 4 ++--
> >  lib/igt_chamelium.h | 2 ++
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> > index 585fdfa8..0f1bfddc 100644
> > --- a/lib/igt_chamelium.c
> > +++ b/lib/igt_chamelium.c
> > @@ -327,7 +327,7 @@ static xmlrpc_value *__chamelium_rpc_va(struct chamelium *chamelium,
> >  	 * to handle the chamelium attempting FSM, we have to fork into another
> >  	 * thread and have that handle hotplugging displays
> >  	 */
> > -	if (fsm_port) {
> > +	if (fsm_port && fsm_handling) {
> >  		monitor_args.chamelium = chamelium;
> >  		monitor_args.port = fsm_port;
> >  		monitor_args.mon = igt_watch_uevents();
> > @@ -355,7 +355,7 @@ static xmlrpc_value *__chamelium_rpc_va(struct chamelium *chamelium,
> >  		/* i2c error, let's try to retry */
> >  	}
> >  
> > -	if (fsm_port) {
> > +	if (fsm_port && fsm_handling) {
> >  		pthread_cancel(fsm_thread_id);
> >  		pthread_join(fsm_thread_id, NULL);
> >  		igt_cleanup_uevents(monitor_args.mon);
> > diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> > index 359f4ab3..5177279d 100644
> > --- a/lib/igt_chamelium.h
> > +++ b/lib/igt_chamelium.h
> > @@ -100,6 +100,8 @@ struct chamelium_edid;
> >   */
> >  #define CHAMELIUM_MAX_AUDIO_CHANNELS 8
> >  
> > +bool fsm_handling;
> 
> You need to make this 'extern' and define it in
> lib/igt_chamelium.c. This will fail to build with a gcc that defaults
> to -fno-common (version 10 I think?) instead of -fcommon.

Forgot to mention that it needs to be initialized to true if the tests
are not fiddling with it, right?

Oh and that name is also bad for an externally accessible variable in
the library. igt_chamelium_allow_fsm_handling or something maybe?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
