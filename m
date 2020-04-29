Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <c989a6dc-152c-7a6f-5ca4-7732c5f66c61@intel.com>
References: <20200429145113.588577-1-chris@chris-wilson.co.uk>
 <c989a6dc-152c-7a6f-5ca4-7732c5f66c61@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158817253952.4620.8004487048097223425@build.alporthouse.com>
Date: Wed, 29 Apr 2020 16:02:19 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] perf: Flush the work between rounds of
 gen8-unprivileged-single-ctx-counter
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-04-29 15:57:41)
> Oh... Is that on a low end platform?

glk. But it was mostly that it got stuck in the rut of hitting -EAGAIN.

/* This needs to be investigated... From time
 * to time, the work we kick off doesn't seem
 * to happen. WTH?? */

Hmm. And that's before we release everything, so yes the leak is real
and not being slow.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
