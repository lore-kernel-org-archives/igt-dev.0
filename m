Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <554d9a81-771d-b709-5986-48dd71171f02@linux.intel.com>
References: <20210210093756.61424-1-tvrtko.ursulin@linux.intel.com>
 <20210210093756.61424-2-tvrtko.ursulin@linux.intel.com>
 <161295335978.6673.9313077497176923458@build.alporthouse.com>
 <554d9a81-771d-b709-5986-48dd71171f02@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 10 Feb 2021 11:03:37 +0000
Message-ID: <161295501705.6673.2584106864195297509@build.alporthouse.com>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 2/3] intel_gpu_top:
 Aggregate clients by PID by default
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
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2021-02-10 10:55:44)
> 
> On 10/02/2021 10:35, Chris Wilson wrote:
> > Quoting Tvrtko Ursulin (2021-02-10 09:37:55)
> > Ok, that works very well. Hmm. The sort order does seem a little jumpy
> > though. May I suggest ac->id = -c->pid; instead of num;
> 
> Done it although I thought 1st pass being sort by pid already, num as id 
> would follow a stable order. I guess your point was inversion to 
> preserve order when cycling sort modes?

I thought that makes more sense for 'aggregate-by-pid', that it should
either be in ascending/descending pid order for idle.

It just felt very jumpy; it may have been tiny amount of %busy, but I
suspected it may have been slightly unstable sorting with changing
clients.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
