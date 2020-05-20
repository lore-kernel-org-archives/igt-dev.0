Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <158997609575.8153.10522585692912987684@build.alporthouse.com>
References: <20200520103853.2484519-1-chris@chris-wilson.co.uk>
 <0b2857c3-25aa-775c-b559-3de68b9ec032@linux.intel.com>
 <158997609575.8153.10522585692912987684@build.alporthouse.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158997647985.8153.12187123507086139445@build.alporthouse.com>
Date: Wed, 20 May 2020 13:07:59 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tools/intel_gpu_top:
 Include total package power
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Chris Wilson (2020-05-20 13:01:35)
> Quoting Tvrtko Ursulin (2020-05-20 12:54:19)
> > 
> > On 20/05/2020 11:38, Chris Wilson wrote:
> > > @@ -1083,10 +1154,10 @@ print_header(struct engines *engines, double t,
> > >               printf("\033[H\033[J");
> > >   
> > >               if (lines++ < con_h)
> > > -                     printf("intel-gpu-top - %s/%s MHz;  %s%% RC6; %s %s; %s irqs/s\n",
> > > +                     printf("intel-gpu-top - %s/%s MHz;  %s%% RC6; %s/%s W; %s irqs/s\n",
> > 
> > Detecting the unit was also a good thing to have so why drop it?
> 
> Because I'm lazy and reused some packaged code rather than try and
> repackage the code here. Even too lazy to add libigt_rapl.la.

Also, we would only ever report W or mW as the SI unit, the choose is
ours and whatever we choose requires adjusting of the reported rapl
scalefactor. Since we measure in seconds, the rapl scalefactor itself
would have to convert from horsepower into J for the results to make
sense, and defined that way.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
