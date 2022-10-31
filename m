Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3F810E18B
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 10:16:38 +0000 (UTC)
Date: Mon, 31 Oct 2022 12:16:35 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <Y1+gg2wP0NynvQDc@platvala-desk.ger.corp.intel.com>
References: <20221010145708.1986912-1-petri.latvala@intel.com>
 <20221010145708.1986912-7-petri.latvala@intel.com>
 <Y1vgKu0XDdAaEhKa@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1vgKu0XDdAaEhKa@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t 7/7] runner: Disable socket
 communications for now
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 28, 2022 at 03:59:06PM +0200, Kamil Konieczny wrote:
> Hi Petri,
> 
> On 2022-10-10 at 17:57:08 +0300, Petri Latvala wrote:
> > Currently, having i915 CI systems test the socket communications when
> > testing is impossible. If a test hangs completely, the incomplete set
> > of results are processed into results.json with an older IGT version
> > from a previous post-merge build, which is unable to parse socket
> > communications. Disable them for now.
> > 
> > This commit will get reverted after suitable testing has been possible
> > to execute.
> 
> imho this is a little unclear why adding var is acutally disabling
> anything, but maybe it is that current CI do not have it ?

Exactly that. Prevent the feature from being used by requiring an
environment variable that isn't set in CI.

> 
> > 
> > Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> > ---
> >  runner/executor.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/runner/executor.c b/runner/executor.c
> > index 125f08a2..f6f27d48 100644
> > --- a/runner/executor.c
> > +++ b/runner/executor.c
> > @@ -1657,7 +1657,8 @@ static int execute_next_entry(struct execute_state *state,
> >  
> >  		sigprocmask(SIG_UNBLOCK, sigmask, NULL);
> >  
> > -		if (socketfd >= 0 && !getenv("IGT_RUNNER_DISABLE_SOCKET_COMMUNICATION")) {
> > +		if (socketfd >= 0 && !getenv("IGT_RUNNER_DISABLE_SOCKET_COMMUNICATION") &&
> > +		    getenv("IGT_RUNNER_ENABLE_SOCKET_COMMUNICATION")) {
> 
> what about IGT_RUNNER_ENABLE_SOCKET_COMMUNICATION_REMOVE_ME ? 
> or IGT_RUNNER_ENABLE_SOCKET_COMMUNICATION_REMOVE_FIXME ? 
> Or maybe you plan to keep it here and remove _DISABLE_ one ?

I plan to keep the DISABLE variable as a killswitch. I'll rename the
enable var to make it clear it's not there to stay.


-- 
Petri Latvala
