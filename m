Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20210331091241.2566311-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210331091241.2566311-1-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 1 Apr 2021 15:49:20 +0100
Message-ID: <CAM0jSHPM+8DEJGo38wA=0zGtEaeN1u1rqeL9S2PjEHrZSai7bg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel_gpu_top: Document how to use JSON
 output
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Intel Graphics Development <Intel-gfx@lists.freedesktop.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 31 Mar 2021 at 10:12, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Put a note on how to use JSON output into the man page.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> References: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/100
> ---
>  man/intel_gpu_top.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
> index f6d74852558b..94fdc6520fd3 100644
> --- a/man/intel_gpu_top.rst
> +++ b/man/intel_gpu_top.rst
> @@ -81,6 +81,11 @@ Filter types: ::
>      pci      pci:[vendor=%04x/name][,device=%04x][,card=%d]
>               vendor is hex number or vendor name
>
> +JSON OUTPUT
> +===========
> +
> +To parse the JSON as output by the tool the consumer should wrap its entirety into square brackets ([ ]). This will make each sample point an JSON array element and will avoid "Multiple root elements" JSON validation error.
> +

a JSON array element

It could be argued that this should go into LIMITATIONS?

Acked-by: Matthew Auld <matthew.auld@intel.com>

>  LIMITATIONS
>  ===========
>
> --
> 2.27.0
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
