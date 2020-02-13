Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200213192606.63025-1-dale.b.stimson@intel.com>
References: <20200213192606.63025-1-dale.b.stimson@intel.com>
Message-ID: <158162667762.4660.5467892000864292172@skylake-alporthouse-com>
Date: Thu, 13 Feb 2020 20:44:37 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t]
 lib/i915/gem_engine_topology.c - intel_get_current_engine invalid result
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
To: Dale B Stimson <dale.b.stimson@intel.com>, igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Dale B Stimson (2020-02-13 19:26:06)
> Function intel_get_current_engine() should return NULL (instead of
> engine 0) if there are no engines.

There should be some igt to put basic use of for_each_engine() though
its paces. Nothing fancy, just complete a loop....

Andi, am I imagining this? I swear saw patches from you to do the
basics.

Anyway, there should be some, and this is worth adding to them,
for_each_context_engine() on an empty engines[] and assert we do not
enter the loop.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
