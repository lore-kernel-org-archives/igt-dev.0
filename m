Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68469C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 15:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2DB10E3C4;
	Mon, 24 Mar 2025 15:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQ2OlSgA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D3910E3C4
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 15:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742829007; x=1774365007;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yMAHsIL+rdsEZzlnDaBxGLT7oOLkephKHjbut5hWLrI=;
 b=MQ2OlSgA4gefO2ARcVr4vrnEBRxEw+z5wqjovNDaHewatxSU+QNMW912
 S18th5BkQ7yfqYwQ+dZH9ZEE+mzRSEYGtagdopVzkGPY7iKNATXtn/nzp
 m1zLEAz8pgrPLnpYCnHlUhdVXbnOqZLvOgXCZgJBugLL4LySUO3w4aWR0
 GYMVmbA8krKoCtE7vwzeNWQdIkzCsNCWbY9CunchxJ2bnIxyAjbKjNfcP
 TJ6hCZh0rKNNHtUPp5XQ1rA1hgEVLBpedN9OKeufPy2055CTsDRTACot0
 aQCjQJIXC2Hxl0FiX/4VfQXo1lEtP6u5v6sm8DaSEDviv1erE97xCl40e A==;
X-CSE-ConnectionGUID: B7Z1mrlkTxafjwpvHX2TMw==
X-CSE-MsgGUID: M6BfmA/tQdilVdid2iBFEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47821672"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="47821672"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 08:09:40 -0700
X-CSE-ConnectionGUID: ztMyJzEZQJ6Vs+Y2hWo1kQ==
X-CSE-MsgGUID: kbOvHbwiQuWqS6FY0f5c0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="128248148"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 08:09:37 -0700
Date: Mon, 24 Mar 2025 17:09:34 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: rodrigo.vivi@intel.com, heikki.krogerus@linux.intel.com,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH i-g-t v1] tests/intel/xe_pm: Introduce i2c subtests
Message-ID: <Z-F1rnn1Qsu5K7_j@black.fi.intel.com>
References: <20250321173205.40076-1-raag.jadav@intel.com>
 <gpuu6yaldphekd7ldyjxybovon433apvjxgocm6njiks4bhc4i@g3duhoz773uy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gpuu6yaldphekd7ldyjxybovon433apvjxgocm6njiks4bhc4i@g3duhoz773uy>
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

On Mon, Mar 24, 2025 at 09:39:15AM -0500, Lucas De Marchi wrote:
> On Fri, Mar 21, 2025 at 11:02:05PM +0530, Raag Jadav wrote:
> > Introduce subtests for i2c adapter which is used to control on-board
> > OEM sensors on selected devices. This will test D3hot/D3cold transition
> > after i2c adapter access for the devices that support it.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > tests/intel/xe_pm.c | 95 +++++++++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 95 insertions(+)
> > 
> > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > index 19b0d5ef7..233e63d17 100644
> > --- a/tests/intel/xe_pm.c
> > +++ b/tests/intel/xe_pm.c
> > @@ -11,12 +11,18 @@
> >  * Test category: functionality test
> >  */
> > 
> > +#include <dirent.h>
> > #include <limits.h>
> > #include <fcntl.h>
> > #include <string.h>
> > +#include <sys/ioctl.h>
> > +
> > +#include <linux/i2c-dev.h>
> > +#include <linux/i2c.h>
> > 
> > #include "igt.h"
> > #include "lib/igt_device.h"
> > +#include "lib/igt_kmod.h"
> > #include "lib/igt_pm.h"
> > #include "lib/igt_sysfs.h"
> > #include "lib/igt_syncobj.h"
> > @@ -774,6 +780,88 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
> > 	}
> > }
> > 
> > +static int find_i2c_index(device_t device, int sysfs_fd)
> 
> s/index/adapter/
> 
> 
> I'm very confused here... how is this related to power management to be
> a subtest in xe_pm?

Ah, this will make more sense when we have driver patches from Heikki.
This is to provide CI coverage for them.

> Back in the days when I was working with IOT, it used to be the case
> that distros weren't enabling spidev/i2c-dev. Did things change and we
> can use them in what's used for CI?

My understanding is that the edge folks will be having their own distro
for the customers.

> > +{
> > +	int adapter_fd, i2c_index = -1;
> > +	struct dirent *dirent;
> > +	char adapter[32];
> > +	DIR *dir;
> > +
> > +	/* Make sure the /dev/i2c-* files exist */
> > +	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
> > +
> > +	snprintf(adapter, sizeof(adapter) - 1, "%s.%hu", "device/i2c_designware",
> > +		 (device.pci_xe->bus << 8) | (device.pci_xe->dev));
> > +	adapter_fd = openat(sysfs_fd, adapter, O_RDONLY);
> > +	igt_require_fd(adapter_fd);
> > +
> > +	dir = fdopendir(adapter_fd);
> > +	igt_assert(dir);
> > +
> > +	/* Find the i2c device node index */
> > +	while ((dirent = readdir(dir))) {
> > +		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
> > +			sscanf(dirent->d_name, "i2c-%d", &i2c_index);
> > +			break;
> > +		}
> > +	}
> > +
> > +	closedir(dir);
> > +	close(adapter_fd);
> > +	return i2c_index;
> > +}
> > +
> > +/**
> > + * SUBTEST: %s-i2c
> > + * Description:
> > + * 	Validate whether the device is able to suspend after i2c adapter access.
> > + * Functionality: pm-d3
> > + * GPU requirements: D3 feature should be supported
> > + *
> > + * arg[1]:
> > + *
> > + * @d3hot:	d3hot
> > + * @d3cold:	d3cold
> > + */
> > +static bool i2c_test(device_t device, int sysfs_fd)
> > +{
> > +	/* AMC slave details */
> > +	uint8_t addr = 0x40, reg = 0x0, buf;
> 
> as part of the AMC protocol, it'd be better to have proper defines.

You mean macros? I thought we'd have something more "typed" ;)

> > +	int i2c_index, i2c_fd;
> > +	char i2c_dev[16];
> > +	struct i2c_msg msgs[] = {
> > +		{
> > +			.addr = addr,
> > +			.flags = 0,
> > +			.len = sizeof(reg),
> > +			.buf = &reg,
> > +		}, {
> > +			.addr = addr,
> > +			.flags = I2C_M_RD,
> > +			.len = sizeof(buf),
> > +			.buf = &buf,
> > +		}
> > +	};
> > +	struct i2c_rdwr_ioctl_data msgset = {
> > +		.msgs = msgs,
> > +		.nmsgs = ARRAY_SIZE(msgs),
> > +	};
> > +
> > +	i2c_index = find_i2c_index(device, sysfs_fd);
> > +	igt_assert(i2c_index >= 0);
> > +
> > +	snprintf(i2c_dev, sizeof(i2c_dev) - 1, "/dev/i2c-%hhd", i2c_index);
> > +	i2c_fd = open(i2c_dev, O_RDWR);
> > +	igt_assert_fd(i2c_fd);
> 
> 
> wouldn't this fail if we don't have the needed kernel config or

We wouldn't be at this point without the config.

Hint: igt_require(igt_kmod_load("i2c-dev", NULL) == 0)

> > +
> > +	/* Perform an i2c transaction to trigger adapter wake */
> > +	igt_info("Accessing slave 0x%hhx on %s\n", addr, i2c_dev);
> > +	igt_assert(igt_ioctl(i2c_fd, I2C_RDWR, &msgset) >= 0);
> 
> or... the platform doesn't support talking to amc. Usually these cases
> are skips, not failures.

Yep.

Hint: igt_require_fd(adapter_fd)

Raag
