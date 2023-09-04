Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4340410E2DF
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Sep 2023 08:13:54 +0000 (UTC)
Date: Mon, 4 Sep 2023 10:13:49 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Message-ID: <20230904101349.1ca5359a@maurocar-mobl2>
In-Reply-To: <04716618-79f7-3a07-93bd-bb234bf85599@intel.com>
References: <20230901051808.1369104-1-bhanuprakash.modem@intel.com>
 <20230901092019.44f35b7e@maurocar-mobl2>
 <4c6de075-f0b3-fae0-cf6c-48f177f3ced3@intel.com>
 <20230901120845.71ddfe41@maurocar-mobl2>
 <04716618-79f7-3a07-93bd-bb234bf85599@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] scripts/test_list: Allow unrecognized
 field:values in testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 1 Sep 2023 18:09:30 +0530
"Modem, Bhanuprakash" <bhanuprakash.modem@intel.com> wrote:

> Hi Mauro,
> 
> On Fri-01-09-2023 03:38 pm, Mauro Carvalho Chehab wrote:
> > On Fri, 1 Sep 2023 14:32:09 +0530
> > "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com> wrote:
> >   
> >> Hi Mauro,
> >>
> >> On Fri-01-09-2023 12:50 pm, Mauro Carvalho Chehab wrote:  
> >>> On Fri,  1 Sep 2023 10:48:08 +0530
> >>> Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
> >>>      
> >>>> As non-Intel vendors also contributing to KMS tests, allow
> >>>> them to re-use the existing testplan documentation along with
> >>>> their own definitions of field:values pair in test config json.
> >>>>
> >>>> Instead of aborting, just throw a warning about this unrecognized
> >>>> field:values.
> >>>>
> >>>> Example:
> >>>> tests/kms_color.c:994: Warning: unrecognized field in tests/kms_test_config.json  ==> Foo: bla  
> >>>
> >>> IMO, there's no need to to that. I mean, if someone wants to add
> >>> a new field, he can just patch tests/kms_test_config.json, adding the
> >>> new "Foo" field at kms_test_config.json:  
> >>
> >> Non-Intel people may not use kms_test_config.json since it is designed
> >> for Intel supported (tests/kms_*.c & tests/intel/kms_*.c) tests
> >> (Probably we may need to rename it to intel_kms_test_config.json).  
> > 
> > The infra is designed to be generic, and not Intel driver specific.
> > I'm even sending patches to Kernel upstream to also use it:
> > 
> > 	https://lore.kernel.org/linux-doc/cover.1693550658.git.mchehab@kernel.org/T/#t
> > 	  
> >> So, non-Intel vendors are also allowed to include few kms tests
> >> (tests/kms_*.c) in their own testplan. Also, we can't restrict them to
> >> use the same testplan as kms_test_config.json.  
> > 
> > Hmm... so you're thinking about having a tests/kms_foo.c file that will
> > be included on both:
> > 
> > 	vendor_a/kms_test_config.json
> > 
> > and:
> > 
> > 	vendor_b/kms_test_config.json
> > 
> > Yes, that's possible. We actually have one or two cases at i915
> > and xe for some tests that aren't driver-specific. As the i915
> > JSON config file has an extra field ("Feature"), I added it to
> > Xe driver as well. This is used currently only for those
> > generic tests that are used on both.
> >   
> >> Example:
> >> Suppose, some non-Intel vendor (xyz) created a xyz_kms_test_config.json
> >> with the "Foo" field defined in it, and updated the documentation of
> >> tests/kms_*.c accordingly. Since Intel's kms_test_config.json is also
> >> using tests/kms_*.c and not aware of "Foo" can lead the failure.  
> > 
> > Currently, the developer who created/updated vendor_a/kms_test_config.json
> > and tests/kms_foo.c will have a compilation error pointing to it. Such
> > developer will then know that the new field also needs to be at
> > vendor_b/kms_test_config.json and can submit a patch against it to
> > solve the error.  
> 
> Agreed, but the vendor_b needs to maintain something (field:values) that 
> he don't even know/care about.

Well, it is either documenting something on a test he'll be using, or
the new test should be excluded from vendor_b/kms_test_config.json.

> > 
> > If we apply your patch, it means that it will generate a warning and
> > someone from vendor_b will need later to identify what happened and
> > copy the (possible) definition from vendor_a/kms_test_config.json to
> > suppress the warning.  
> 
> Yeah, There is no way to suppress the warning except maintaining the 
> definitions in both places.

There is an alternative: have one or more "core" ("common"?) json files
for tests that are driver agnostic. I almost did that instead of adding
a couple of core tests to both xe and i915.

> > It works, but it means an extra step. So, while I would prefer to not
> > merge this change, I won't oppose on converting it into a warning.
> > If you decide to go ahead and merge it, you can add my acked-by.  
> 
> We can hold this for sometime, till we get the better solution.

Ok.

Regards,
Mauro
