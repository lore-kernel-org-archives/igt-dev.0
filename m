Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AA510E31D
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 09:18:56 +0000 (UTC)
Date: Tue, 6 Jun 2023 11:18:50 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230606111850.5fc2d92d@maurocar-mobl2>
In-Reply-To: <2084363.bB369e8A3T@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
 <2633155.BddDVKsqQX@jkrzyszt-mobl2.ger.corp.intel.com>
 <20230606102144.1b392ba5@maurocar-mobl2>
 <2084363.bB369e8A3T@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 6/8] lib/igt_kmod: place KUnit tests on
 a subtest
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

On Tue, 06 Jun 2023 10:41:40 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> > > > +	 * and for documentation.
> > > > +	 */
> > > > +	igt_subtest_with_dynamic("all-tests")    
> > > 
> > > Why can't we use module_name as subtest name?  
> > 
> > We can, but this preserves the old behavior. So, the existing documentation
> > won't break.  
> 
> Where is this old behavior documented?  In the current code I can't find any 
> occurrence of "test-all" other than inside igt_kmod.c:igt_ksleftest(), not 
> documented in any way.
> 
> Wasn't the old behavior a result of a limitation rather than a feature?

Take a look at igt_kselftests():

        igt_subtest_with_dynamic(filter ?: "all-tests") {
                igt_list_for_each_entry_safe(tl, tn, &tests, link) {
                        unsigned long taints;

                        igt_dynamic_f("%s", unfilter(filter, tl->name))
                                igt_kselftest_execute(&tst, tl, options, result);
                        free(tl);

The default when "filter" is not used is "all-tests".

Regards,
Mauro
