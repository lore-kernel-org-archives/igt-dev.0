Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Tue, 24 Mar 2020 17:24:41 +0200
From: Andi Shyti <andi@etezian.org>
Message-ID: <20200324152441.GD131880@jack.zhora.eu>
References: <20200324125233.56308-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324125233.56308-1-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH i-g-t] i915/i915_pm_rc6_residency: Make
 ringbuffer rc6 fast
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

On Tue, Mar 24, 2020 at 12:52:33PM +0000, Chris Wilson wrote:
> The legacy ringbuffer submission lacks a fast soft-rc6
> mechanism as we have no interrupt for an idle ring. As such
> we are at the mercy of HW RC6... which is not quite as
> precise as we need to pass this test. Oh well.
> 
> Since HW is not fast enough to minimise power draw, tell the driver to
> park as soon as we know we are idle. One day, we hope for the driver to
> discover a mechanism to do this for itself, for as this test shows that
> can save us Watts!
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/1516
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
