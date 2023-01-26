Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 26 Jan 2023 18:08:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230126170823.2cbgkn2ffksfyomj@kamilkon-desk1>
References: <20230112174730.1101192-1-tvrtko.ursulin@linux.intel.com>
 <20230112174730.1101192-2-tvrtko.ursulin@linux.intel.com>
 <20230126153938.3iotcb52eawnwbcl@kamilkon-desk1>
 <e3b0efd8-7e4a-9bdf-4725-128c4637e806@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e3b0efd8-7e4a-9bdf-4725-128c4637e806@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] intel_gpu_top: Fix man page
 formatting
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-01-26 at 16:09:29 +0000, Tvrtko Ursulin wrote:
> 
> On 26/01/2023 15:39, Kamil Konieczny wrote:
> > On 2023-01-12 at 17:47:27 +0000, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > 
> > > New lines are not respected when rst2man generates the page so try to work
> > > around that by followin advice from the Internet.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Thanks! Later I noticed there is one more thing which currently renders
> badly, this line:
> 
>   -o <file path | ->
> 
> Are you okay with re-review if I can fix that one too and respin?

Yes, no problem, I can review respin.

Regards,
Kamil

> 
> Regards,
> 
> Tvrtko
> 
> > > ---
> > >   man/intel_gpu_top.rst | 15 ++++++++-------
> > >   1 file changed, 8 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
> > > index 748c7740c800..b0c95446a011 100644
> > > --- a/man/intel_gpu_top.rst
> > > +++ b/man/intel_gpu_top.rst
> > > @@ -53,13 +53,14 @@ RUNTIME CONTROL
> > >   Supported keys:
> > > -    'q'    Exit from the tool.
> > > -    'h'    Show interactive help.
> > > -    '1'    Toggle between aggregated engine class and physical engine mode.
> > > -    'n'    Toggle display of numeric client busyness overlay.
> > > -    's'    Toggle between sort modes (runtime, total runtime, pid, client id).
> > > -    'i'    Toggle display of clients which used no GPU time.
> > > -    'H'    Toggle between per PID aggregation and individual clients.
> > > +|
> > > +|    'q'    Exit from the tool.
> > > +|    'h'    Show interactive help.
> > > +|    '1'    Toggle between aggregated engine class and physical engine mode.
> > > +|    'n'    Toggle display of numeric client busyness overlay.
> > > +|    's'    Toggle between sort modes (runtime, total runtime, pid, client id).
> > > +|    'i'    Toggle display of clients which used no GPU time.
> > > +|    'H'    Toggle between per PID aggregation and individual clients.
> > >   DEVICE SELECTION
> > >   ================
> > > -- 
> > > 2.34.1
> > > 
