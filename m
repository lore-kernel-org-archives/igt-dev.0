Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200211143048.12260-1-janusz.krzysztofik@linux.intel.com>
References: <20200211143048.12260-1-janusz.krzysztofik@linux.intel.com>
Message-ID: <158143949995.3635.18328569070749519341@skylake-alporthouse-com>
Date: Tue, 11 Feb 2020 16:44:59 +0000
Subject: Re: [igt-dev] [RFC PATCH i-g-t v2] tests/gem_userptr_blits: Enhance
 invalid mapping exercise
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

Quoting Janusz Krzysztofik (2020-02-11 14:30:48)
> @@ -2009,8 +2016,31 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
>                 igt_subtest("invalid-null-pointer")
>                         test_invalid_null_pointer(fd);
>  
> -               igt_subtest("invalid-gtt-mapping")
> -                       test_invalid_gtt_mapping(fd);
> +               igt_describe("Verify userptr on top of GTT mapping to GEM object will fail");
> +               igt_subtest("invalid-gtt-mapping") {
> +                       gem_require_mappable_ggtt(fd);
> +                       test_invalid_mapping(fd, I915_MMAP_OFFSET_GTT);
> +               }

#include "i915/gem_mman.h"
igt_subtest_with_dynamic("invalid-mmap-offset") {
	for_each_mmap_offset_type(t) {
		igt_dynamic_f("%s", t->name)
			test_invalid_mapping(fd, t);

In test_invalid_mapping, instead of do_ioctl(MMAP_OFFSET) use
igt_require(igt_ioctl(MMAP_OFFSET, &arg) == 0);

(Or igt_require_f if you like to keep the spiel.)

		}
	}
}
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
