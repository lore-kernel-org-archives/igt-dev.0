Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200122144028.27346-1-tvrtko.ursulin@linux.intel.com>
References: <20200122101043.21347-1-tvrtko.ursulin@linux.intel.com>
 <20200122144028.27346-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <157970441989.7477.13168128747438871488@skylake-alporthouse-com>
Date: Wed, 22 Jan 2020 14:46:59 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2] i915/gem_engine_topology: Generate
 engine names based on class
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-01-22 14:40:28)
>  static void init_engine(struct intel_execution_engine2 *e2,
>                         int class, int instance, uint64_t flags)
>  {
> -       const struct intel_execution_engine2 *__e2;
> -       static const char *unknown_name = "unknown",
> -                         *virtual_name = "virtual";
> +       int ret;
>  
>         e2->class    = class;
>         e2->instance = instance;
> -       e2->flags    = flags;
>  
>         /* engine is a virtual engine */
>         if (class == I915_ENGINE_CLASS_INVALID &&
>             instance == I915_ENGINE_CLASS_INVALID_VIRTUAL) {

Can this ever match?  instance is 65534 and INVALID_VIRTUAL is -2.
int class/instance should be u16?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
