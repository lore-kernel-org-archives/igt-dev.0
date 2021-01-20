Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20210120111115.846341-1-chris@chris-wilson.co.uk>
 <20210120111115.846341-2-chris@chris-wilson.co.uk>
In-Reply-To: <20210120111115.846341-2-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 20 Jan 2021 11:58:18 +0000
Message-ID: <CAM0jSHPqTXnnJEhOLjkFMWKwSc6Y1Fq8YugR51gWQ3PXXXoLcQ@mail.gmail.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 2/2] i915/gem_create:
 Exercise an impossible allocation
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
Cc: igt-dev@lists.freedesktop.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 20 Jan 2021 at 11:11, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> The largest processor in the works can support 57b of address space, far
> more memory than we can afford to use in CI! It is safe to assume that
> we will not have 64b processors for some time, so we can use the top bit
> to exercise our oversized object detection.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
