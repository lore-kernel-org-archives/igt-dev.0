Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20200618104747.24005-10-tvrtko.ursulin@linux.intel.com>
References: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
 <20200618104747.24005-10-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159247895295.4042.7104358099170023321@build.alporthouse.com>
Date: Thu, 18 Jun 2020 12:15:52 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 10/11] gem_wsim: Fix calibration handling
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

Quoting Tvrtko Ursulin (2020-06-18 11:47:46)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Intended use case was that run without arguments prints out the
> calibrations which can be simply copied and pasted to the -n argument and
> things should just work.
> 
> Two problems we need to solve: If the print out loops shows zero
> calibrations (engine not present) they are later rejected and also if some
> calibration is not given it is only an error if it needs to be used
> (engine present).
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Good enough,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
