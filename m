Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <160813391912.9127.16376546917210365956@build.alporthouse.com>
References: <20201216152809.706094-1-tvrtko.ursulin@linux.intel.com>
 <20201216152809.706094-2-tvrtko.ursulin@linux.intel.com>
 <160813391912.9127.16376546917210365956@build.alporthouse.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 16 Dec 2020 15:52:58 +0000
Message-ID: <160813397817.9127.12175358127476553962@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] intel_gpu_top: Aggregate engine
 busyness per class
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Chris Wilson (2020-12-16 15:51:59)
> Quoting Tvrtko Ursulin (2020-12-16 15:28:09)
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > Similarly to how top(1) handles SMP, we can default to showing engines of
> > a same class as a single bar graph entry.
> > 
> > To achieve this a little bit of hackery is employed. PMU sampling is left
> > as is and only at the presentation layer we create a fake set of engines,
> > one for each class, summing and normalizing the load respectively.
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Where were my manners?
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
