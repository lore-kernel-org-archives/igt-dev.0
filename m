Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200211004255.GA2535@jack.zhora.eu>
References: <20200211003742.863630-1-chris@chris-wilson.co.uk>
 <20200211004255.GA2535@jack.zhora.eu>
Message-ID: <158141747934.5235.15646593670790864278@skylake-alporthouse-com>
Date: Tue, 11 Feb 2020 10:37:59 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_exec_nop: Keep a
 copy of the names
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

Quoting Andi Shyti (2020-02-11 00:42:55)
> Hi Chris,
> 
> On Tue, Feb 11, 2020 at 12:37:42AM +0000, Chris Wilson wrote:
> > The engine names are now stored inside the iterator and not as static
> > strings. If we wish to use them later, we need to make a copy.
> 
> But we are not using them later. Your patch just copies and frees
> an array.

They are used inside an igt_info() in the child processes. Output at the
moment is quite strange.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
