Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 29 Jan 2020 14:35:38 +0200
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <20200129123538.GA6475@intel.intel>
References: <20200129121602.1106978-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129121602.1106978-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Fix is_physical_engine
 advancement
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Chris,

On Wed, Jan 29, 2020 at 12:16:02PM +0000, Chris Wilson wrote:
> Update the local var e after iterating to the next engine when searching
> for the next non-virtual engine. Otherwise, it is prone to loop forever.

Do I remember correctly that you sent this once already?

In any case,

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
