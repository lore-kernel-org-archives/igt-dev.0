Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Sat, 29 Feb 2020 01:34:48 +0200
From: Andi Shyti <andi@etezian.org>
Message-ID: <20200228233448.GE11891@jack.zhora.eu>
References: <20200228104340.2895082-1-chris@chris-wilson.co.uk>
 <20200228104340.2895082-4-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228104340.2895082-4-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH i-g-t 4/5] i915: Exercise sysfs heartbeat
 controls
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

On Fri, Feb 28, 2020 at 10:43:39AM +0000, Chris Wilson wrote:
> We [will] expose various per-engine scheduling controls. One of which,
> 'heartbeat_duration_ms', defines how often we send a heartbeat down the
> engine to check upon the health of the engine. If a heartbeat does not
> complete within the interval (or two), the engine is declared hung.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Someone with not a good eye might swear to have read this patch
once, and at patch 5/5 he will ask again the same question.

Why don't we put together in a library the things that patch
3/4/5 have in common?

Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
