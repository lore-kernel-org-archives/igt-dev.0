Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6332DD36108
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 19:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C57D10E425;
	Tue,  5 Nov 2024 19:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWs5cr6y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AB910E425
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 19:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730833483; x=1762369483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QnmIGWDU+DUaQJZS7qnxAvBhLUP/VkGapSTozZtRt8k=;
 b=CWs5cr6yURklhOPcICpi1AsMqvr4Pf8C+Fj/yVkAA6FvA2R0mOGa4wIt
 8ZqycvvqFWdpGu0o+oxhLzUaPuxCa69yH0meanqfh8vEvLbuelVHwiIx9
 4F673StPTXx/F7na68J0W4PE173RjrWYhawNntQo0Ccb9MaHWdMi0lAF6
 phEflROnbDhuFOw2QJiKSPyJ4IYKVg90pg+7FlZtzMqJ8Ti/hxGB+MNB+
 KvADoYayIwncfdWiulnVXcbnTKsKULyrvlsyb6J9a94ZdvKOXUx8Kc0Hu
 m7OE08/dUPeJ6r7ftI08345E2Ekq6NQQr4BIvlHT5NS4210N5aSC6/lxU g==;
X-CSE-ConnectionGUID: emmRovQRTB2jt3u+ObPd6w==
X-CSE-MsgGUID: tR/ZW5NFQVS+KgrX+rtXOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30774842"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30774842"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 11:04:43 -0800
X-CSE-ConnectionGUID: AOGFi2WKQ9WwDO98pPH86A==
X-CSE-MsgGUID: d4L9mNwFTj2n6iUg/E/BHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="121616765"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.89])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 11:04:40 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] lib/igt_kmod: Stop handling _kunit suffix
Date: Tue, 05 Nov 2024 20:04:36 +0100
Message-ID: <28376074.gRfpFWEtPU@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <zjfjvp4krbqkac635t5t6wxz547lkxiagxnuayzzsckvprehlj@z4janee7isde>
References: <20241105055255.2466236-1-lucas.demarchi@intel.com>
 <6684395.tM3a2QDmDi@jkrzyszt-mobl2.ger.corp.intel.com>
 <zjfjvp4krbqkac635t5t6wxz547lkxiagxnuayzzsckvprehlj@z4janee7isde>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tuesday, 5 November 2024 15:58:04 CET Lucas De Marchi wrote:
> On Tue, Nov 05, 2024 at 11:50:05AM +0100, Janusz Krzysztofik wrote:
> >Hi Lucas,
> >
> >On Tuesday, 5 November 2024 06:52:54 CET Lucas De Marchi wrote:
> >> It's not used anywhere anymore. Remove it.
> >
> >I'm not sure.  I added this option based on KUnit documentation.  Has the
> >documentation changed since then?  I haven't been watching it.  Have you
> 
> I don't see a suffix _kunit for module names mentioned anywhere.

See https://www.kernel.org/doc/html/latest/dev-tools/kunit/style.html#test-file-and-module-names

"... The _kunit suffix is preferred, as it makes the distinction between KUnit 
 and non-KUnit tests clearer."

Thanks,
Janusz


> Documentation mentions that the config option usually ends with
> _KUNIT_TEST: https://www.kernel.org/doc/html/latest/dev-tools/kunit/start.html#configuring-the-kernel
> 
> looking for modules ending in _kunit:
> 	$ git grep '=.*_kunit\.o'
> 	drivers/net/ethernet/microchip/vcap/Makefile:obj-$(CONFIG_VCAP_KUNIT_TEST) +=  vcap_model_kunit.o
> 	kernel/Makefile:obj-$(CONFIG_RESOURCE_KUNIT_TEST) += resource_kunit.o
> 	lib/Makefile:obj-$(CONFIG_STRING_KUNIT_TEST) += string_kunit.o
> 	lib/Makefile:obj-$(CONFIG_STRING_HELPERS_KUNIT_TEST) += string_helpers_kunit.o
> 	lib/Makefile:obj-$(CONFIG_CPUMASK_KUNIT_TEST) += cpumask_kunit.o
> 	lib/Makefile:obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
> 	lib/Makefile:obj-$(CONFIG_CHECKSUM_KUNIT) += checksum_kunit.o
> 	lib/Makefile:obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o
> 	lib/Makefile:obj-$(CONFIG_SLUB_KUNIT_TEST) += slub_kunit.o
> 	lib/Makefile:obj-$(CONFIG_MEMCPY_KUNIT_TEST) += memcpy_kunit.o
> 	lib/Makefile:obj-$(CONFIG_IS_SIGNED_TYPE_KUNIT_TEST) += is_signed_type_kunit.o
> 	lib/Makefile:obj-$(CONFIG_OVERFLOW_KUNIT_TEST) += overflow_kunit.o
> 	lib/Makefile:obj-$(CONFIG_STACKINIT_KUNIT_TEST) += stackinit_kunit.o
> 	lib/Makefile:obj-$(CONFIG_FORTIFY_KUNIT_TEST) += fortify_kunit.o
> 	lib/Makefile:obj-$(CONFIG_SIPHASH_KUNIT_TEST) += siphash_kunit.o
> 	lib/Makefile:obj-$(CONFIG_USERCOPY_KUNIT_TEST) += usercopy_kunit.o
> 	lib/math/Makefile:obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
> 	lib/math/tests/Makefile:obj-$(CONFIG_INT_POW_TEST) += int_pow_kunit.o
> 	rust/Makefile:obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
> 	sound/core/Makefile:obj-$(CONFIG_SND_CORE_TEST) += sound_kunit.o
> 
> vs:
> 
> 	$ git grep '=.*_test\.o' | wc -l 
> 	87
> 
> I think the behavior is a bit surprising because when passing NULL it
> actually runs *all* the testsuites. It's not a shortcut to handle
> modules like e.g. usercopy_kunit.o / siphash_kunit.o
> that have the testsuite called usercopy / siphash. Instead it's
> a way to group the tests for igt reporting purposes. We could very well
> just keep the suffix or use a hardcoded "all". Or did I misread the
> handling of this arg?
> 
> Currently there are no users in igt for modules ending in _kunit and I
> don't think we are going to add one any time soon. We can always come
> back and revert this if needed.
> 
> >checked if core drm doesn't use that suffix?   If it is still documented then
> >what if we decide to run kunit tests from other subsytems (dma-buf? iommu?)
> 
> Using lib/stackinit_kunit.c as example: we could do either
> 
> 	igt_kunit("stackinit_kunit", NULL, NULL)
> 	or
> 	igt_kunit("stackinit_kunit", "stackinit", NULL)
> 
> The difference would only be the name of the igt subtest.
> 
> Lucas De Marchi
> 
> >and it occurs they still use it?
> >
> >Thanks,
> >Janusz
> >
> >>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  lib/igt_kmod.c | 5 +----
> >>  1 file changed, 1 insertion(+), 4 deletions(-)
> >>
> >> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> >> index 4eeab79ec..58edac8fa 100644
> >> --- a/lib/igt_kmod.c
> >> +++ b/lib/igt_kmod.c
> >> @@ -1189,7 +1189,7 @@ static void __igt_kunit(struct igt_ktest *tst,
> >>   *	   if NULL then test cases from all test suites provided by the module
> >>   *	   are executed as dynamic sub-subtests of one IGT subtest, which name
> >>   *	   is derived from the module name by cutting off its optional trailing
> >> - *	   _test or _kunit suffix
> >> + *	   _test suffix
> >>   * @opts: options to load the module
> >>   *
> >>   * Loads the test module, parses its (k)tap dmesg output, then unloads it
> >> @@ -1213,9 +1213,6 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
> >>  		if (!igt_debug_on(!subtest)) {
> >>  			char *suffix = strstr(subtest, "_test");
> >>
> >> -			if (!suffix)
> >> -				suffix = strstr(subtest, "_kunit");
> >> -
> >>  			if (suffix)
> >>  				*suffix = '\0';
> >>  		}
> >>
> >
> >
> >
> >
> 




