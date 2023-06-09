Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1995C10E69D
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 12:59:51 +0000 (UTC)
Date: Fri, 9 Jun 2023 14:59:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230609125946.cvu6qu4w4nwqflle@kamilkon-desk1>
References: <20230607080352.950226-1-janga.rahul.kumar@intel.com>
 <20230607080352.950226-3-janga.rahul.kumar@intel.com>
 <DM6PR11MB449233FD8B085B73EC3180678D51A@DM6PR11MB4492.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM6PR11MB449233FD8B085B73EC3180678D51A@DM6PR11MB4492.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/xe_vm.c: Add Negative test to
 VM error capture
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-06-09 at 05:44:22 +0000, Dandamudi, Priyanka wrote:
> 
> 
> > From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > 
> > Add negative test to check invalid arguments.
> > 
> > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > ---
> >  tests/xe/xe_vm.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c index 0da6c847..7f369fc4
> > 100644
> > --- a/tests/xe/xe_vm.c
> > +++ b/tests/xe/xe_vm.c
> > @@ -1638,6 +1638,31 @@ vm_error_capture_address(int fd)
> >  	xe_vm_destroy(fd, vm);
> >  }
> > 
> > +/**
> > + * SUBTEST: vm-error-capture-address-invalid-val
> > + * Description: Negative test to check vm error capture
> > + * Functionality: error capture
> > + * Run type: FULL
> > + * TODO: change ``'Run type' == FULL`` to a better category

[...cut...]

> > 
> > +	igt_subtest("vm-error-capture-address-invalid-val")
> > +		vm_error_capture_address_invalid_val(fd);
> > +
> >  	igt_fixture {
> >  		xe_device_put(fd);
> >  		close(fd);
> LGTM,
> Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

We should drop/change this, see reply from Matthew about uAPI
changing.

Regards,
Kamil

> > --
> > 2.25.1
> 
