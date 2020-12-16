Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <83fba7f0-b361-fddb-b2bc-6c6f9df56b1a@linux.intel.com>
References: <20201216152809.706094-1-tvrtko.ursulin@linux.intel.com>
 <20201216152809.706094-2-tvrtko.ursulin@linux.intel.com>
 <160813391912.9127.16376546917210365956@build.alporthouse.com>
 <83fba7f0-b361-fddb-b2bc-6c6f9df56b1a@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 16 Dec 2020 16:05:43 +0000
Message-ID: <160813474395.9127.1105812834127662942@build.alporthouse.com>
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

Quoting Tvrtko Ursulin (2020-12-16 16:01:30)
> 
> On 16/12/2020 15:51, Chris Wilson wrote:
> > Quoting Tvrtko Ursulin (2020-12-16 15:28:09)
> >> +static int
> >> +print_engines(struct engines *engines, double t, int lines, int w, int h)
> >> +{
> >> +       static struct engines *classes;
> >> +       struct engines *show;
> >> +
> >> +       if (class_view)
> >> +               classes = show = update_classes(classes, engines);
> > 
> > Something is not right here. Oh static, nvm.
> 
> Too hacky? Maybe "show = classes = update_classes()"would read better.

show = update_classes(engines);

with update_classes doing the if (once) classes = init_classes(engines) ?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
