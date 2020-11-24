Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <4ab1f514-83cb-c9e2-1feb-a1c054023e4a@linux.intel.com>
References: <20201124123251.4147819-1-chris@chris-wilson.co.uk>
 <20201124123450.4188664-1-chris@chris-wilson.co.uk>
 <4ab1f514-83cb-c9e2-1feb-a1c054023e4a@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 24 Nov 2020 13:41:39 +0000
Message-ID: <160622529926.28476.13471148278568889360@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Cast negative debugfs values to u64
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-11-24 13:28:15)
> 
> On 24/11/2020 12:34, Chris Wilson wrote:
> > -             igt_sysfs_set(dir, "i915_wedged", "-1");
> > +             igt_sysfs_printf(dir, "i915_wedged", "%llu", -1ull);
> 
> Set to printf conversion is okay. Maybe we could later add 
> igt_sysfs_setu32 for simplicity but maybe it would also be too much api.

Yup, I thought printf would be generic enough to cover all users, and
was not convinced that wrapping the common integers added enough
convenience as printf is a ubiquitous API.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
