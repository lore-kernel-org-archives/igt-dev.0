Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20200731091548.815898-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200731091548.815898-1-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 31 Jul 2020 10:53:52 +0100
Message-ID: <CAM0jSHOOK695iA8CpqTOnO7qPuKs5h9mBZ+zNbYC+Ai62aOseA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ctx_ringsize: Manually control
 timeout
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
Cc: igt-dev@lists.freedesktop.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 31 Jul 2020 at 10:15, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Manually setup the signal handler for SIGARLM so that we can dump some
> debug information for test failures.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Acked-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
