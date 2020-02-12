Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 12 Feb 2020 16:33:09 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200212143309.GS25209@platvala-desk.ger.corp.intel.com>
References: <20200127121818.2492460-1-chris@chris-wilson.co.uk>
 <20200127121818.2492460-4-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127121818.2492460-4-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] i915: Exercise sysfs heartbeat
 controls
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

On Mon, Jan 27, 2020 at 12:18:17PM +0000, Chris Wilson wrote:
> We [will] expose various per-engine scheduling controls. One of which,
> 'heartbeat_duration_ms', defines how often we send a heartbeat down the
> engine to check upon the health of the engine. If a heartbeat does not
> complete within the interval (or two), the engine is declared hung.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/Makefile.sources                |   3 +
>  tests/i915/sysfs_heartbeat_interval.c | 466 ++++++++++++++++++++++++++
>  tests/meson.build                     |   1 +
>  3 files changed, 470 insertions(+)
>  create mode 100644 tests/i915/sysfs_heartbeat_interval.c
> 
> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index fc9e04e97..fd6f67a73 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -102,6 +102,9 @@ TESTS_progs = \
>  	vgem_slow \
>  	$(NULL)
>  
> +TESTS_progs += sysfs_heartbeat_interval
> +sysfs_heartbeat_interval_SOURCES = i915/sysfs_heartbeat_interval

Another missing .c


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
