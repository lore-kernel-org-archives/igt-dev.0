Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBCEC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 10:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DA510E9E0;
	Fri,  2 Aug 2024 10:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDe+cYKz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1C310E9D3
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Aug 2024 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722593661; x=1754129661;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=B3E6ZeLbF4VDeFwd8DiPJ/HFjY0IgZ4H52kePbqVXTc=;
 b=XDe+cYKzV5dcqL5UPgLyshoG5HGHbGr0rab+/GceBGnIrqvBhevFwwq/
 5gM1S9lKk8dp5FZdR/q2YhKGqdH+DPdshrIlTfQjsCm0CwXwabbVYF8QF
 5cjftT9CAkp6iamPOHJbMXLM6FfOgDAmeB0AckjueQldeUpidrn0GH4HX
 MoytbZ0OhTi+v3/3FiI5BtKR851jhx2HAPSJwGtL012r7JBNgTkvgigdI
 l+wJ/5C6Ru+07v2+9LeFIAly6vjR2o1atU+IRksdm0McD48TZTb5WqbX+
 MYJqOUnH3saMNjWGqXt5VPDgkvstRrd1c/hOL+PpZLYx+hCGUF7zHLuqh A==;
X-CSE-ConnectionGUID: 3LRJg+w9RZKEgzNQp22+JQ==
X-CSE-MsgGUID: aXo69e9dTrm0myaK+hNcEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20777694"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="20777694"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 03:14:20 -0700
X-CSE-ConnectionGUID: bUhH4/H6RKGGUHG5CSoEQw==
X-CSE-MsgGUID: t+EAlRKIQDyzgdvwLG1ffA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="55272378"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.70])
 ([10.245.246.70])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 03:14:17 -0700
Message-ID: <669d9d0b-8399-458f-9a64-999ebe53e952@intel.com>
Date: Fri, 2 Aug 2024 12:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 02/66] tests/xe_eudebug: Test eudebug connection
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-3-christoph.manszewski@intel.com>
 <ebc973df97d338f9e4c4475613fdd484399c56cf.camel@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ebc973df97d338f9e4c4475613fdd484399c56cf.camel@intel.com>
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

Hi Dominik,

since this file was already published last year I was told by Kamil that 
leaving '2023' is the appropriate approach.

Thanks,
Christoph

On 1.08.2024 11:16, Grzegorzek, Dominik wrote:
> On Tue, 2024-07-30 at 13:44 +0200, Christoph Manszewski wrote:
>> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>>
>> Add basic tests checking xe eudebug connection capability.
>>
>> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
>> ---
>>   tests/intel/xe_eudebug.c | 135 +++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build        |   1 +
>>   2 files changed, 136 insertions(+)
>>   create mode 100644 tests/intel/xe_eudebug.c
>>
>> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
>> new file mode 100644
>> index 000000000..44a491319
>> --- /dev/null
>> +++ b/tests/intel/xe_eudebug.c
>> @@ -0,0 +1,135 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
> * Copyright © 2024 Intel Corporation
> And thats for all the files.
> 
> Regards, Dominik
>> + */
>> +
>> +/**
>> + * TEST: Test EU Debugger functionality
>> + * Category: Core
>> + * Mega feature: EUdebug
>> + * Sub-category: EUdebug tests
>> + * Functionality: eu debugger framework
>> + * Test category: functionality test
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
>> +/**
>> + * SUBTEST: basic-connect
>> + * Description:
>> + *	Exercise XE_EUDEBG_CONNECT ioctl with passing
>> + *	valid and invalid params.
>> + */
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
>> +/**
>> + * SUBTEST: basic-close
>> + * Description:
>> + *	Test whether eudebug can be reattached after closure.
>> + */
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
> 
