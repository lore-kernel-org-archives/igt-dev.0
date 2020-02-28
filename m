Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200228233448.GE11891@jack.zhora.eu>
References: <20200228104340.2895082-1-chris@chris-wilson.co.uk>
 <20200228104340.2895082-4-chris@chris-wilson.co.uk>
 <20200228233448.GE11891@jack.zhora.eu>
Message-ID: <158293304248.29794.5765520201928001036@skylake-alporthouse-com>
Date: Fri, 28 Feb 2020 23:37:22 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 4/5] i915: Exercise sysfs
 heartbeat controls
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
To: Andi Shyti <andi@etezian.org>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Andi Shyti (2020-02-28 23:34:48)
> On Fri, Feb 28, 2020 at 10:43:39AM +0000, Chris Wilson wrote:
> > We [will] expose various per-engine scheduling controls. One of which,
> > 'heartbeat_duration_ms', defines how often we send a heartbeat down the
> > engine to check upon the health of the engine. If a heartbeat does not
> > complete within the interval (or two), the engine is declared hung.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Someone with not a good eye might swear to have read this patch
> once, and at patch 5/5 he will ask again the same question.
> 
> Why don't we put together in a library the things that patch
> 3/4/5 have in common?

They are. It's basically a repeating pattern of testing with local
assumptions. For the sole reason that I'm not very inventive.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
