Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCE66E082
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2020 06:15:49 +0000 (UTC)
Date: Tue, 24 Mar 2020 11:35:52 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20200324060551.GA12157@intel.com>
References: <20200323063248.5261-1-anshuman.gupta@intel.com>
 <20200323063248.5261-2-anshuman.gupta@intel.com>
 <ed6f16b6a7384617b0214849ce0c6ed3@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed6f16b6a7384617b0214849ce0c6ed3@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/5] lib/igt_pm: Add lib func to get
 lpsp capability
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
To: "Peres, Martin" <martin.peres@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-03-23 at 12:25:25 +0530, Peres, Martin wrote:
> On 2020-03-23 08:32, Anshuman Gupta wrote:
> > This lib function evaluate the lpsp capability from
> > the connector specific debugfs attribute i915_lpsp_info.
> > 
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  lib/igt_pm.c | 27 +++++++++++++++++++++++++++
> >  lib/igt_pm.h |  1 +
> >  2 files changed, 28 insertions(+)
> > 
> > diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> > index 9d441e1b..7a6cab7c 100644
> > --- a/lib/igt_pm.c
> > +++ b/lib/igt_pm.c
> > @@ -37,6 +37,7 @@
> >  #include <dirent.h>
> >  
> >  #include "drmtest.h"
> > +#include "igt_kms.h"
> >  #include "igt_pm.h"
> >  #include "igt_aux.h"
> >  #include "igt_sysfs.h"
> > @@ -827,3 +828,29 @@ bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
> >  
> >  	return true;
> >  }
> > +
> > +/**
> > + * igt_output_is_lpsp_capable:
> > + * @drm_fd: fd to drm device
> > + * @output: igt output for which lpsp capability need to be evaluated
> > + * Check lpsp capability for a given output.
> > + *
> > + * Returns:
> > + * True if given output is lpsp capable otherwise false.
> > + */
> > +bool igt_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
> 
> Do we have a file for i915-specific features? If not, maybe prefixing
> the function with i915 would help readers understand that this is an
> i915-specific function.
I am unable to find any igt lib file for i915-features.
IMO this is a power feature, igt_pm.c suits it.
I will change the prefix to i915_ but all other 
function in this file are using igt_ prefix,
i hope that will not be an issue.
Thanks,
Anshuman Gupta. 
> 
> > +{
> > +	char buf[256];
> > +	int fd, len;
> > +
> > +	fd = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> > +	igt_require(fd >= 0);
> > +	len = igt_debugfs_simple_read(fd, "i915_lpsp_info", buf, sizeof(buf));
> > +
> > +	if (len < 0)
> > +		igt_assert_eq(len, -ENODEV);
> > +
> > +	close(fd);
> > +
> > +	return strstr(buf, "LPSP capable");
> > +}
> > diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> > index 5e438452..076d8c27 100644
> > --- a/lib/igt_pm.h
> > +++ b/lib/igt_pm.h
> > @@ -53,5 +53,6 @@ enum igt_runtime_pm_status igt_get_runtime_pm_status(void);
> >  bool igt_wait_for_pm_status(enum igt_runtime_pm_status status);
> >  bool igt_pm_dmc_loaded(int debugfs);
> >  bool igt_pm_pc8_plus_residencies_enabled(int msr_fd);
> > +bool igt_output_is_lpsp_capable(int drm_fd, igt_output_t *output);
> >  
> >  #endif /* IGT_PM_H */
> > 
> 

> pub  2048R/33A53379 2019-12-02 Martin Peres <martin.peres@linux.intel.com>
> sub  2048R/C5E7DE5F 2019-12-02 [expires: 2020-12-01]

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
