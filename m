Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <9103010.GsyPYnKGBp@jkrzyszt-desk.ger.corp.intel.com>
References: <20191113125240.3781-1-chris@chris-wilson.co.uk>
 <8042207.s0vteSJg9S@jkrzyszt-desk.ger.corp.intel.com>
 <157529875955.27263.14886639874940144583@skylake-alporthouse-com>
 <9103010.GsyPYnKGBp@jkrzyszt-desk.ger.corp.intel.com>
Message-ID: <158221443894.8112.10215153774301281983@skylake-alporthouse-com>
Date: Thu, 20 Feb 2020 16:00:38 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 9/9] i915: Exercise
 I915_CONTEXT_PARAM_RINGSIZE
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Janusz Krzysztofik (2020-02-20 15:57:24)
> Hi Chris,
> 
> On Monday, December 2, 2019 3:59:19 PM CET Chris Wilson wrote:
> > Quoting Janusz Krzysztofik (2019-12-02 14:42:58)
> > > Hi Chris,
> > > 
> > > I have a few questions rather than comments.  I hope they are worth spending 
> > > your time.
> > > 
> > > On Wednesday, November 13, 2019 1:52:40 PM CET Chris Wilson wrote:
> > > > I915_CONTEXT_PARAM_RINGSIZE specifies how large to create the command
> > > > ringbuffer for logical ring contects. This directly affects the number
> > > 
> > > s/contects/contexts/
> > > 
> > > > of batches userspace can submit before blocking waiting for space.
> > > > 
> > > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Have you got this patch still queued somewhere?  As UMD has accepted the 
> solution and are ready with changes on their side, I think we need to merge it 
> soon, and the kernel side as well.

Link? That's all I need to merge the kernel...
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
