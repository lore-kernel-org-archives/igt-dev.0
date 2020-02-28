Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 28 Feb 2020 23:27:19 +0200
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <20200228212719.GL1514@intel.intel>
References: <20200228104340.2895082-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228104340.2895082-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] i915: Start putting the mmio_base
 to wider use
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Chris,

On Fri, Feb 28, 2020 at 10:43:36AM +0000, Chris Wilson wrote:
> Several tests depend upon the implicit engine->mmio_base but have no
> means of determining the physical layout. Since the kernel has started
> providing this information, start putting it to use.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Looks good!

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Andi
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
