Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Mon, 6 Apr 2020 14:16:57 +0300
From: Andi Shyti <andi@etezian.org>
Message-ID: <20200406111657.GA84809@jack.zhora.eu>
References: <20200406110026.1641189-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200406110026.1641189-1-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH i-g-t] i915/gem_busy: Drop
 i915_hangcheck_info
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Chris,

On Mon, Apr 06, 2020 at 12:00:26PM +0100, Chris Wilson wrote:
> All the information for hangcheck is pulled into i915_engine_info so the
> separate dump is redundant.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Andi Shyti <andi.shyti@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

now we can get rid of i915_hangcheck_info.

Thanks,
Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
