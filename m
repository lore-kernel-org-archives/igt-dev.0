Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20200508135631.8099-3-janusz.krzysztofik@linux.intel.com>
References: <20200508135631.8099-1-janusz.krzysztofik@linux.intel.com>
 <20200508135631.8099-3-janusz.krzysztofik@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158896045063.30605.10719204340280805143@build.alporthouse.com>
Date: Fri, 08 May 2020 18:54:10 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/gem_exec_nop: Remove
 submission batching
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Janusz Krzysztofik (2020-05-08 14:56:31)
>  static double nop_on_ring(int fd, uint32_t handle,
>                           const struct intel_execution_engine2 *e, int timeout,
> -                         unsigned long *out)
> +                         unsigned long *count)
>  {
>         struct drm_i915_gem_execbuffer2 execbuf;
>         struct drm_i915_gem_exec_object2 obj;
>         struct timespec start, now;
> -       unsigned long count;
> +       unsigned long total;
> +
> +       igt_assert(*count);
>  
>         memset(&obj, 0, sizeof(obj));
>         obj.handle = handle;
> @@ -93,18 +95,18 @@ static double nop_on_ring(int fd, uint32_t handle,
>         }
>         intel_detect_and_clear_missed_interrupts(fd);
>  
> -       count = 0;
> +       total = 0;
>         clock_gettime(CLOCK_MONOTONIC, &start);
>         do {
> -               for (int loop = 0; loop < 1024; loop++)
> +               for (int loop = 0; loop < *count; loop++)

This unnerves me. I expect to get this wrong when writing new callers.

There's no great reason to even have 1024 here, we can survive with
doing clock_gettime() every iteration, and just accept it as part of the
systematic cost.

>                         gem_execbuf(fd, &execbuf);
>  
> -               count += 1024;
> +               total += *count;
>                 clock_gettime(CLOCK_MONOTONIC, &now);
>         } while (elapsed(&start, &now) < timeout);
>         igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
>  
> -       *out = count;
> +       *count = total;
>         return elapsed(&start, &now);
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
