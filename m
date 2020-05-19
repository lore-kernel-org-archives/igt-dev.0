Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <87367wmchn.fsf@gaia.fi.intel.com>
References: <20200519100217.1761103-1-chris@chris-wilson.co.uk>
 <87367wmchn.fsf@gaia.fi.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158988527579.7442.212594116383142939@build.alporthouse.com>
Date: Tue, 19 May 2020 11:47:55 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] i915: Add gem_exec_endless
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
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Mika Kuoppala (2020-05-19 11:43:16)
> Chris Wilson <chris@chris-wilson.co.uk> writes:
> > +static void supervisor_dispatch(struct supervisor *sv, uint64_t addr)
> > +{
> > +     WRITE_ONCE(*sv->dispatch, 64 << 10);
> 
> addr << 10 ?

addr :)
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
