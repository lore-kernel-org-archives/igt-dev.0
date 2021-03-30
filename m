Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20210318162400.2065097-1-tvrtko.ursulin@linux.intel.com>
 <20210318162400.2065097-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210318162400.2065097-4-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 30 Mar 2021 16:40:04 +0100
Message-ID: <CAM0jSHMw1UfU4RghdeWW16fXzbVu40QkAMip+RXMkQ-C9hXXxw@mail.gmail.com>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 3/3]
 tests/i915/gem_watchdog: Exercise long rendering chains
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Intel Graphics Development <Intel-gfx@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 18 Mar 2021 at 16:24, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Test to demonstrate a problem with the proposed default fence expiry
> semantics where long rendering chain get silently broken.
>
> If we had fence error propagation (no clear agreement whether to do it or
> not) maybe userspace would see if, assuming fence status is looked at, but
> overall potential rendering corruption is the story in any case.
>
> Note that this is not a single long batch but just a long queue of work
> which. Could be viewed as heavy system load as well (like virtualisation
> or other types of resource sharing).
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
