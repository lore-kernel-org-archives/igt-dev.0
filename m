Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4122C3DA7F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 09:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977EE10E242;
	Tue, 30 Jul 2024 09:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLLgA6LP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D28110E242
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 09:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722332550; x=1753868550;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=du5rGMCu4BNUg8D8J+yuoTWsjrsKwN10RNwLjVvlQFo=;
 b=iLLgA6LP2o9fnlPZXVBt3VYOh5MQg1ArepSvrYFkdiUOBKoxSaMzheHh
 jRyBZSMKtfseHlQMCAIzz8iCTacL/Bc6C6MxrtXD3rxf8ApAOQwEiQ1ja
 ulZXV4ybW2ojy8eVXGOEjU7USeps/6kFayy+nMLRwq83+8fLhKHVAL8Jb
 iDRhm8Qpu6xOM3/5UHWf4ohczXAGm81wC7o484WBeDSajw6KOU5Zkhaay
 uMt9wT7y7QffmKBK5UuR0wbCQKsDqm8yGUkAuEFy43Wa0BSCgEhFdEk/O
 4yDe7c2dPocTDdgp4kcIth3FgZws3RyEycr2akw/qm4dUBJ7MyHikSRQM g==;
X-CSE-ConnectionGUID: VNVks89cQo6FHM9FnuLaDw==
X-CSE-MsgGUID: oPAC5lqjTMmBCdpQHySEpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="24001985"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="24001985"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 02:42:29 -0700
X-CSE-ConnectionGUID: nUQJ3rauRMWT+QBmDneJgw==
X-CSE-MsgGUID: HFr+KJGFTT+qL910Llrw8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="85230807"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.43])
 ([10.245.246.43])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 02:42:26 -0700
Message-ID: <53802982-b048-4e23-ab45-e38940d10ed8@intel.com>
Date: Tue, 30 Jul 2024 11:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/66] tests/xe_eudebug: Test eudebug connection
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
 <20240729160159.37036-2-christoph.manszewski@intel.com>
 <20240730075849.bkczbam2uyaidwx3@zkempczy-mobl2>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240730075849.bkczbam2uyaidwx3@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Zbigniew,

On 30.07.2024 09:58, Zbigniew Kempczyński wrote:
> On Mon, Jul 29, 2024 at 06:00:54PM +0200, Christoph Manszewski wrote:
>> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>>
>> Add basic tests checking xe eudebug connection capability.
>>
>> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
>> ---
>>   tests/intel/xe_eudebug.c | 115 +++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build        |   1 +
>>   2 files changed, 116 insertions(+)
>>   create mode 100644 tests/intel/xe_eudebug.c
>>
>> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
>> new file mode 100644
>> index 000000000..2bd5a44f9
>> --- /dev/null
>> +++ b/tests/intel/xe_eudebug.c
>> @@ -0,0 +1,115 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <xe_drm.h>
>> +#include "igt.h"
>> +
>> +static int __debug_connect(int fd, int *debugfd, struct drm_xe_eudebug_connect *param)
>> +{
>> +	int ret = 0;
>> +
>> +	*debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, param);
> 
> On first glance it looks it won't compile at this point.

Yes, haven't been doing format-patch for a while and missed a patch, my bad.

> 
> Christoph, may you reorder patches to make sure all of them
> will compile in the series?

Sure, before I send all patches I make sure each individual one compiles.

Thanks,
Christoph

> 
> --
> Zbigniew
> 
>> +
>> +	if (*debugfd < 0) {
>> +		ret = -errno;
>> +		igt_assume(ret != 0);
>> +	}
>> +
>> +	errno = 0;
>> +	return ret;
>> +}
>> +
>> +static void test_connect(int fd)
>> +{
>> +	struct drm_xe_eudebug_connect param = {};
>> +	int debugfd, ret;
>> +	pid_t *pid;
>> +
>> +	pid = mmap(NULL, sizeof(pid_t), PROT_WRITE,
>> +		   MAP_SHARED | MAP_ANON, -1, 0);
>> +
>> +	/* get fresh unrelated pid */
>> +	igt_fork(child, 1)
>> +		*pid = getpid();
>> +
>> +	igt_waitchildren();
>> +	param.pid = *pid;
>> +	munmap(pid, sizeof(pid_t));
>> +
>> +	ret = __debug_connect(fd, &debugfd, &param);
>> +	igt_assert(debugfd == -1);
>> +	igt_assert_eq(ret, param.pid ? -ENOENT : -EINVAL);
>> +
>> +	param.pid = 0;
>> +	ret = __debug_connect(fd, &debugfd, &param);
>> +	igt_assert(debugfd == -1);
>> +	igt_assert_eq(ret, -EINVAL);
>> +
>> +	param.pid = getpid();
>> +	param.version = -1;
>> +	ret = __debug_connect(fd, &debugfd, &param);
>> +	igt_assert(debugfd == -1);
>> +	igt_assert_eq(ret, -EINVAL);
>> +
>> +	param.version = 0;
>> +	param.flags = ~0;
>> +	ret = __debug_connect(fd, &debugfd, &param);
>> +	igt_assert(debugfd == -1);
>> +	igt_assert_eq(ret, -EINVAL);
>> +
>> +	param.flags = 0;
>> +	param.extensions = ~0;
>> +	ret = __debug_connect(fd, &debugfd, &param);
>> +	igt_assert(debugfd == -1);
>> +	igt_assert_eq(ret, -EINVAL);
>> +
>> +	param.extensions = 0;
>> +	ret = __debug_connect(fd, &debugfd, &param);
>> +	igt_assert_neq(debugfd, -1);
>> +	igt_assert_eq(ret, 0);
>> +
>> +	close(debugfd);
>> +}
>> +
>> +static void test_close(int fd)
>> +{
>> +	struct drm_xe_eudebug_connect param = { 0,  };
>> +	int debug_fd1, debug_fd2;
>> +	int fd2;
>> +
>> +	param.pid = getpid();
>> +
>> +	igt_assert_eq(__debug_connect(fd, &debug_fd1, &param), 0);
>> +	igt_assert(debug_fd1 >= 0);
>> +	igt_assert_eq(__debug_connect(fd, &debug_fd2, &param), -EBUSY);
>> +	igt_assert_eq(debug_fd2, -1);
>> +
>> +	close(debug_fd1);
>> +	fd2 = drm_open_driver(DRIVER_XE);
>> +
>> +	igt_assert_eq(__debug_connect(fd2, &debug_fd2, &param), 0);
>> +	igt_assert(debug_fd2 >= 0);
>> +	close(fd2);
>> +	close(debug_fd2);
>> +	close(debug_fd1);
>> +}
>> +
>> +igt_main
>> +{
>> +	int fd;
>> +
>> +	igt_fixture {
>> +		fd = drm_open_driver(DRIVER_XE);
>> +	}
>> +
>> +	igt_subtest("basic-connect")
>> +		test_connect(fd);
>> +
>> +	igt_subtest("basic-close")
>> +		test_close(fd);
>> +
>> +	igt_fixture
>> +		drm_close_driver(fd);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index e649466be..35bf8ed35 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -279,6 +279,7 @@ intel_xe_progs = [
>>   	'xe_dma_buf_sync',
>>   	'xe_debugfs',
>>   	'xe_drm_fdinfo',
>> +	'xe_eudebug',
>>   	'xe_evict',
>>   	'xe_evict_ccs',
>>   	'xe_exec_atomic',
>> -- 
>> 2.34.1
>>
