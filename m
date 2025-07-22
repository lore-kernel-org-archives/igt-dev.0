Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A73C83F27
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 04:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37F910E5DF;
	Tue, 22 Jul 2025 04:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7FJref3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300A010E5DF
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 04:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753157154; x=1784693154;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pUnkSOUr3pJydR4y3LbenXXHN3S88GRU/kduCa4HcqA=;
 b=a7FJref3uuc/bgjB6QiC5vSNDRoPGpAhpdKzQhz4cLP3ewExTPghpG2I
 W5au+vkR+KoCY9GSXwlzv5EdRGKZNLLxhdJY0z6QX50ALtpCU8OqyK2T7
 ScNjjOPxeYXhkFd0M91G/zRaZdxxUZZkaTmLuNHC8ih8K8N2mCcq5hL5E
 2kNsREUMikI3oAzInPuKAkKi0u8ER/HOFmiYIhrL1KX3SQavfCscVescG
 otRJvZd7pS6vY2rhBxFQBWp+j0dGGcHpNpBPuCdRtjwUBiJbQCExBh5Rp
 dDDmJmu4IfJd48eji3tbEjwIenPKgz3Q5eTB/xRmrdnlQisfZEzmY1uSh g==;
X-CSE-ConnectionGUID: TB/ctir7Rx2LqHjzvWmu3g==
X-CSE-MsgGUID: 8fy8vqLiTC2hOuH3t2zpHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="65955937"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="65955937"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 21:05:54 -0700
X-CSE-ConnectionGUID: c+2WHn53TluUMshzq38rog==
X-CSE-MsgGUID: ET00zU6vSmeyS0au83m4BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="159743614"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 21:05:52 -0700
Date: Tue, 22 Jul 2025 07:05:49 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pm: Introduce i2c subtests
Message-ID: <aH8OHZquwBBvODfQ@black.fi.intel.com>
References: <20250719163101.3459754-1-raag.jadav@intel.com>
 <aH4YMMLcvuiRS2l9@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aH4YMMLcvuiRS2l9@kuha.fi.intel.com>
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

On Mon, Jul 21, 2025 at 01:36:32PM +0300, Heikki Krogerus wrote:
> On Sat, Jul 19, 2025 at 10:01:01PM +0530, Raag Jadav wrote:
> > Introduce subtests for i2c adapter which is used to control on-board
> > OEM sensors on selected devices. This will test D3hot/D3cold transition
> > after i2c adapter access for the devices that support it.
> > 
> > v2: Define macros for AMC constants (Lucas)
> >     s/index/adapter (Lucas)
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> Looks good to me. FWIW:
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks Heikki.

The BAT failures seems unrelated to the patch. So anything I can do to
move this forward?

Raag

> > ---
> >  tests/intel/xe_pm.c | 98 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 98 insertions(+)
> > 
> > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > index 16b5fc686..ca935d518 100644
> > --- a/tests/intel/xe_pm.c
> > +++ b/tests/intel/xe_pm.c
> > @@ -11,12 +11,18 @@
> >   * Test category: functionality test
> >   */
> >  
> > +#include <dirent.h>
> >  #include <limits.h>
> >  #include <fcntl.h>
> >  #include <string.h>
> > +#include <sys/ioctl.h>
> > +
> > +#include <linux/i2c-dev.h>
> > +#include <linux/i2c.h>
> >  
> >  #include "igt.h"
> >  #include "lib/igt_device.h"
> > +#include "lib/igt_kmod.h"
> >  #include "lib/igt_pm.h"
> >  #include "lib/igt_sysfs.h"
> >  #include "lib/igt_syncobj.h"
> > @@ -38,6 +44,10 @@
> >  #define PREFETCH (0x1 << 1)
> >  #define UNBIND_ALL (0x1 << 2)
> >  
> > +/* AMC slave details */
> > +#define I2C_AMC_ADDR	0x40
> > +#define I2C_AMC_REG	0x00
> > +
> >  enum mem_op {
> >  	READ,
> >  	WRITE,
> > @@ -779,6 +789,87 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
> >  	}
> >  }
> >  
> > +static int find_i2c_adapter(device_t device, int sysfs_fd)
> > +{
> > +	int adapter_fd, i2c_adapter = -1;
> > +	struct dirent *dirent;
> > +	char adapter[32];
> > +	DIR *dir;
> > +
> > +	/* Make sure the /dev/i2c-* files exist */
> > +	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
> > +
> > +	snprintf(adapter, sizeof(adapter), "%s.%hu", "device/i2c_designware",
> > +		 (device.pci_xe->bus << 8) | (device.pci_xe->dev));
> > +	adapter_fd = openat(sysfs_fd, adapter, O_RDONLY);
> > +	igt_require_fd(adapter_fd);
> > +
> > +	dir = fdopendir(adapter_fd);
> > +	igt_assert(dir);
> > +
> > +	/* Find the i2c adapter */
> > +	while ((dirent = readdir(dir))) {
> > +		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
> > +			sscanf(dirent->d_name, "i2c-%d", &i2c_adapter);
> > +			break;
> > +		}
> > +	}
> > +
> > +	closedir(dir);
> > +	close(adapter_fd);
> > +	return i2c_adapter;
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
> > +	uint8_t addr = I2C_AMC_ADDR, reg = I2C_AMC_REG, buf;
> > +	int i2c_adapter, i2c_fd;
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
> > +	i2c_adapter = find_i2c_adapter(device, sysfs_fd);
> > +	igt_assert_lte(0, i2c_adapter);
> > +
> > +	snprintf(i2c_dev, sizeof(i2c_dev), "/dev/i2c-%hd", i2c_adapter);
> > +	i2c_fd = open(i2c_dev, O_RDWR);
> > +	igt_assert_fd(i2c_fd);
> > +
> > +	/* Perform an i2c transaction to trigger adapter wake */
> > +	igt_info("Accessing slave 0x%hhx on %s\n", addr, i2c_dev);
> > +	igt_assert_lte(0, igt_ioctl(i2c_fd, I2C_RDWR, &msgset));
> > +
> > +	close(i2c_fd);
> > +	return true;
> > +}
> > +
> >  igt_main
> >  {
> >  	device_t device;
> > @@ -889,6 +980,13 @@ igt_main
> >  			cleanup_d3(device);
> >  		}
> >  
> > +		igt_subtest_f("%s-i2c", d->name) {
> > +			igt_assert(setup_d3(device, d->state));
> > +			igt_assert(i2c_test(device, sysfs_fd));
> > +			igt_assert(in_d3(device, d->state));
> > +			cleanup_d3(device);
> > +		}
> > +
> >  		igt_subtest_f("%s-multiple-execs", d->name) {
> >  			igt_assert(setup_d3(device, d->state));
> >  			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0);
> > -- 
> > 2.34.1
> 
> -- 
> heikki
