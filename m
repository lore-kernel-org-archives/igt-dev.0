Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A716EFD23E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 09:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FDD10E734;
	Wed, 25 Feb 2026 09:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ipc/W5zd";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB37210E073
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 09:59:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1C0501A12FE
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 09:59:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E7D1F5FDE5;
 Wed, 25 Feb 2026 09:59:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 22CED1036924D; Wed, 25 Feb 2026 10:59:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1772013594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=dELlvjr4KIMaic/SUWqcdVtI7x6sfCCHO4bhDMr+JrM=;
 b=ipc/W5zdODQZTnK1P0hBfMpzPnEav8uRIBKic9U52u3hW4UOURuFG8Snr80zn/rJEW/OcA
 Jq/hCHbZpGqEGn4MZJ371oig9iMOUUmVUJe5fpx5cAMjnaZ0Jvmqm6pUE93km/MLp/eRD+
 r5agBxyUHXzVbeMAWWwKrgq0jOg82Y8ta7DWrzRcjSOJ/V+/gwV83dJDI5HdyXKI+oGrYw
 7QR+AYPVTtjIA7Rriyxx1VQoyBPpC4XJLClp8cx/KCrUrMKyGtbjlSdYbBbhJoVDlluCN3
 tOpBDWdWFZNdMlNCzbi8MjUlfSs16C+rk6oCWXBhyacVY1uZ8rLDY0M07vluQg==
Message-ID: <848b0604-01e1-4d24-a53b-b7e6c5e9a2f5@bootlin.com>
Date: Wed, 25 Feb 2026 11:00:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 41/48] lib/igt_dp: Create generic helpers for DP
 information
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-41-73dc9143c8c1@bootlin.com>
 <20260223165631.4e296595@kmaincent-XPS-13-7390>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260223165631.4e296595@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



On 2/23/26 16:56, Kory Maincent wrote:
> On Mon, 23 Feb 2026 13:09:48 +0100
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
>> With the introduction of unigraf tests, there is no reason to limit the
>> implementation to intel. Create easly extendable generic functions to
>> help supporting multiple GPU.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   lib/igt_dp.c    | 177
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++ lib/igt_dp.h    |
>> 30 ++++++++++ lib/meson.build |   1 +
>>   3 files changed, 208 insertions(+)
>>
>> diff --git a/lib/igt_dp.c b/lib/igt_dp.c
>> new file mode 100644
>> index 000000000000..0920a43af5e9
>> --- /dev/null
>> +++ b/lib/igt_dp.c
>> @@ -0,0 +1,177 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Google
>> + *
>> + * Authors:
>> + *   Louis Chauvet <louis.chauvet@bootlin.com>
>> + */
>> +
>> +#include "drmtest.h"
>> +#include "i915/i915_dp.h"
>> +#include "igt_amd.h"
> 
> I think this header is useless, there is no amd function call here.
> 
>> +#include "igt_core.h"
>> +#include "igt_kms.h"
>> +#include <stdint.h>
>> +#include "igt_dp.h"
> 
> stdint include should be at the top.
> We often put system header before local header.
> 
>> +
>> +/**
>> + * igt_dp_get_current_link_rate: Get current link rate on a display port
>> + * @drm_fd: DRM file descriptor
>> + * @output: igt_output_t object representing the display port
>> + *
>> + * Returns:
>> + * The current link rate in kb/s, or a negative error code on failure.
>> + */
>> +int igt_dp_get_current_link_rate(int drm_fd, igt_output_t *output)
>> +{
>> +	if (is_intel_device(drm_fd))
>> +		/*
>> +		 * i915_dp_get_current_link_rate returns the value in tens
>> of kb/s because
>> +		 * that what the kernel uses. Convert it to kb/s to have a
>> sane unit...
>> +		 */
>> +		return i915_dp_get_current_link_rate(drm_fd, output) * 10;
>> +
>> +	igt_assert_f(false, "Current drm device is not able to report used
>> link rate\n");
>> +	return -EINVAL;
>> +}
> 
> I usually do the other way around:
> if (!is_intel_device(...)) {
> 	igt_assert(...);
> 	return -EINVAL
> }
> 
> return i915_dp_get_current_link_rate(drm_fd, output) * 10;
> 
> but well that's only my coding style I am also ok with that.

The goal is to be able to easly add amd, qualcom, whatever like this:

if (is_intel())
	return intel_...
if (is_amd())
	return amd_...
...

> ...
> 
>> +void igt_dp_wait_pending_retrain(int drm_fd, igt_output_t *output)
>> +{
>> +	double timeout = igt_default_display_detect_timeout();
>> +	struct timespec start, now;
>> +	double elapsed;
>> +
>> +	clock_gettime(CLOCK_MONOTONIC, &start);
>> +
>> +	while (1) {
>> +		if (!igt_dp_get_pending_retrain(drm_fd, output))
>> +			return;
>> +
>> +		clock_gettime(CLOCK_MONOTONIC, &now);
>> +		elapsed = (now.tv_sec - start.tv_sec) +
>> +					(now.tv_nsec - start.tv_nsec) / 1e9;
>> +
>> +		if (elapsed >= timeout)
>> +			break;
>> +		usleep(10);
> 
> 10us? I think you wanted 10ms here.

Yes, I don't know how to count :-)

> Regards,

