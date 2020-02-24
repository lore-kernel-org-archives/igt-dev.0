Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <efbae310-47f4-d774-ccac-31ee30a0f96b@linux.intel.com>
References: <20200220174155.2162242-1-chris@chris-wilson.co.uk>
 <20200221135620.2794706-1-chris@chris-wilson.co.uk>
 <efbae310-47f4-d774-ccac-31ee30a0f96b@linux.intel.com>
Message-ID: <158253836125.15220.2432972756647090698@skylake-alporthouse-com>
Date: Mon, 24 Feb 2020 09:59:21 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/i915_pm_rpm: Only check for
 suspend failures after each debugfs entry
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
To: Martin Peres <martin.peres@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Martin Peres (2020-02-24 09:16:02)
> On 2020-02-21 15:56, Chris Wilson wrote:
> > Since we check before and then after each debugfs entry, we do not need
> > to check before each time as well. We will error out as soon as it does
> > fail, at all other times we know the system to be idle.
> > 
> > No impact on runtime for glk (which apparently is one of the better
> > behaving systems).
> > 
> > v2: Assert that we are currently suspended prior to opening the file,
> > i.e. that nothing else is waking up the device behind our backs.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Martin Peres <martin.peres@linux.intel.com>
> 
> This changes the purpose of this test, but checking that nothing is
> waking the driver in the background sound like a good test and could
> explain the terribly-slow runtime on some platforms!

Not really changing the underlying purpose, just removing the grace
window for the system to go to sleep by itself. If the system is waking
up behind our backs (hotplug? that we want to address and try to
capture).
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
