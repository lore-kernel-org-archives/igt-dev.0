Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8CB6E059
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2020 17:51:23 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200313174235.19440-1-umesh.nerlige.ramappa@intel.com>
References: <20200313174235.19440-1-umesh.nerlige.ramappa@intel.com>
From: Chris Wilson <chris.p.wilson@intel.com>
Message-ID: <158412188063.8571.1183170198139991322@build.alporthouse.com>
Date: Fri, 13 Mar 2020 17:51:20 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] test/perf: Add test to verify OA TLB
 invalidation
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
To: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>, Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Umesh Nerlige Ramappa (2020-03-13 17:42:35)
> @@ -4622,6 +4708,12 @@ igt_main
>                 gen8_test_single_ctx_render_target_writes_a_counter();
>         }
>  
> +       igt_describe("Test OA TLB invalidate");
> +       igt_subtest("gen12-oa-tlb-invalidate") {
> +               igt_require(intel_gen(devid) >= 12);
> +               gen12_test_oa_tlb_invalidate();
> +       }
> +
>         igt_describe("Measure performance for a specific context using OAR in Gen 12");
>         igt_subtest("gen12-unprivileged-single-ctx-counters") {
>                 igt_require(intel_gen(devid) >= 12);

Something you might like to add is:

	igt_subtest_group {
		igt_fixture igt_require(intel_gen(devid) >= 12);

		igt_describe("Test OA TLB invalidate");
		igt_subtest("gen12-oa-tlb-invalidate")
			gen12_test_oa_tlb_invalidate();

		igt_describe("Measure performance for a specific context using OAR in Gen 12");
		igt_subtest("gen12-unprivileged-single-ctx-counters")
		...
	}

To combat the redundancy and add some visual grouping.
-Chris
---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
