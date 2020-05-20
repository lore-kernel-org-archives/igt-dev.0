Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <0b2857c3-25aa-775c-b559-3de68b9ec032@linux.intel.com>
References: <20200520103853.2484519-1-chris@chris-wilson.co.uk>
 <0b2857c3-25aa-775c-b559-3de68b9ec032@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158997609575.8153.10522585692912987684@build.alporthouse.com>
Date: Wed, 20 May 2020 13:01:35 +0100
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] tools/intel_gpu_top:
 Include total package power
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-05-20 12:54:19)
> 
> On 20/05/2020 11:38, Chris Wilson wrote:
> > @@ -1083,10 +1154,10 @@ print_header(struct engines *engines, double t,
> >               printf("\033[H\033[J");
> >   
> >               if (lines++ < con_h)
> > -                     printf("intel-gpu-top - %s/%s MHz;  %s%% RC6; %s %s; %s irqs/s\n",
> > +                     printf("intel-gpu-top - %s/%s MHz;  %s%% RC6; %s/%s W; %s irqs/s\n",
> 
> Detecting the unit was also a good thing to have so why drop it?

Because I'm lazy and reused some packaged code rather than try and
repackage the code here. Even too lazy to add libigt_rapl.la.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
