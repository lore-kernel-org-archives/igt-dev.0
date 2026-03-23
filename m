Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E614F46133
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 14:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E493B10E0E9;
	Mon, 23 Mar 2026 14:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="vmVt1r2x";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2A410E0E9
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 14:48:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 350DD1A2F9E;
 Mon, 23 Mar 2026 14:48:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0CE275FEF6;
 Mon, 23 Mar 2026 14:48:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1F84110450FAD; Mon, 23 Mar 2026 15:48:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774277325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Jdb/2MVusSZyxlo03Uf/RuCHwzjw1QEvBdbZNwZ+nQc=;
 b=vmVt1r2xYekkILoYH8UzrvorgjPPCGA/7oQ+GGuHnYBEX6tAkXtkv2Vs+Wg0RZ5LbiucgU
 BC1bHE6quG2/DqRKvWOMZTM3XY6+7Z+Zz1Jriur9+mtpfaLylnzd3ZjYvTBgl+1XrG3iQt
 ztPDDuIOq/kJSPOr9Z+dOLC4Fj/j5kGuN95Yxj0EsBgr0Xve0fwCzTOOIFmvK3TZARpMtu
 wRtLBBJ3mgnjhg4AGLEemHsmh3doB+w16RvBNAQe4rUIJzk7VFRb9G4yuDseCDZuCSsg6e
 etUa6pvlqxJDid4zmnRdlj8R7BjK2zxNGgcAZcwn5VHddKlgH41y2oeTOh/95w==
Message-ID: <98136740-6610-46db-bc5e-f79c66ba4dce@bootlin.com>
Date: Mon, 23 Mar 2026 15:49:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 31/49] tests/unigraf: Add basic unigraf tests
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-31-a01dffc3b0cb@bootlin.com>
 <20260317164616.1ec0f5a3@kmaincent-XPS-13-7390>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260317164616.1ec0f5a3@kmaincent-XPS-13-7390>
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



On 3/17/26 16:46, Kory Maincent wrote:
> On Mon, 16 Mar 2026 17:17:52 +0100
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
>> Adds two tests to validate unigraf communication.
>>
>> unigraf-connect checks if the device is connected and if the EDID is
>> properly applied.
>>
>> ungiraf-reconnect checks if the device can be connected/reconnected
>> using SST and MST configurations.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   tests/meson.build                    |   4 +
>>   tests/unigraf/meson.build            |  12 +++
>>   tests/unigraf/unigraf_connectivity.c | 138
>> +++++++++++++++++++++++++++++++++++ 3 files changed, 154 insertions(+)
>>
>> diff --git a/tests/meson.build b/tests/meson.build
>> index cecb4a8ae34a..4d3399d0eff4 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -475,6 +475,10 @@ foreach prog : intel_progs
>>   	endif
>>   endforeach
>>   
>> +if libtsi.found()
>> +	subdir('unigraf')
>> +endif
>> +
>>   if chamelium.found()
>>   	foreach prog : chamelium_progs
>>   		testexe = executable(prog,
>> diff --git a/tests/unigraf/meson.build b/tests/unigraf/meson.build
>> new file mode 100644
>> index 000000000000..4ef8c32151e4
>> --- /dev/null
>> +++ b/tests/unigraf/meson.build
>> @@ -0,0 +1,12 @@
>> +unigraf_progs = [
>> +	'unigraf_connectivity',
>> +]
>> +
>> +foreach prog : unigraf_progs
>> +	test_executables += executable(prog, prog + '.c',
>> +				       dependencies : test_deps,
>> +				       install_dir : unigrafdir,
>> +				       install_rpath : unigraf_rpathdir,
>> +				       install : true)
>> +	test_list += join_paths('unigraf', prog)
>> +endforeach
>> diff --git a/tests/unigraf/unigraf_connectivity.c
>> b/tests/unigraf/unigraf_connectivity.c new file mode 100644
>> index 000000000000..b35149a4de9a
>> --- /dev/null
>> +++ b/tests/unigraf/unigraf_connectivity.c
>> @@ -0,0 +1,138 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Google
>> + *
>> + * Authors:
>> + *   Louis Chauvet <louis.chauvet@bootlin.com>
>> + */
>> +
>> +#include <stdint.h>
>> +#include <stdlib.h>
>> +#include <unistd.h>
>> +#include <xf86drmMode.h>
>> +
>> +#include "drmtest.h"
>> +#include "igt_aux.h"
>> +#include "igt_core.h"
>> +#include "igt_kms.h"
>> +#include "unigraf/unigraf.h"
>> +
>> +/**
>> + * TEST: unigraf connectivity
>> + * Category: Core
>> + * Description: Testing connectivity with a unigraf device
>> + *
>> + * SUBTEST: unigraf-connect-edid
>> + * Description: Verify that the unigraf device is properly connected to the
>> DUT
>> + *              and that the correct EDID is detected and read.
>> + *
>> + * SUBTEST: unigraf-connect-mst
>> + * Description: Ensure that the DUT can correctly detect and handle the
>> unigraf device
>> + *              when it is configured to operate in MST mode.
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Test basic unigraf connectivity");
>> +int igt_main()
>> +{
>> +	int drm_fd;
>> +
>> +	igt_fixture() {
>> +		drm_fd = drm_open_driver_master(DRIVER_ANY);
>> +	}
>> +
>> +	igt_describe("Make sure that the unigraf device is connected to the
>> DUT and EDID is properly detected");
>> +	igt_subtest("unigraf-connect-edid") {
>> +		drmModePropertyBlobPtr edid_blob = NULL;
>> +		struct igt_display display;
>> +		uint64_t edid_blob_id;
>> +		igt_output_t *output;
>> +		uint32_t unigraf_edid_len;
>> +		void *unigraf_edid;
>> +		bool found = false;
>> +
>> +		/*
>> +		 * Sleep are required to allow hardware to configure/detect
>> the current
>> +		 * configuration
>> +		 */
>> +		unigraf_require_device(drm_fd);
>> +		unigraf_hpd_deassert();
>> +		sleep(igt_default_display_detect_timeout());
> 
> The default display detect timeout is 10 second so you are waiting 10s here?
> 
>> +		unigraf_set_sst();
>> +		unigraf_hpd_assert();
>> +		sleep(igt_default_display_detect_timeout());
> 
> 10 more seconds?
> 
>> +		igt_display_require(&display, drm_fd);
>> +		sleep(igt_default_display_detect_timeout());
> 
> again!
> 
> Does the hardware so slow that it need 30s to configure and detect the
> configuration?

The delays are needed, but you are right, I will try with shorter 
default to see if the test is flacky.

>> +
>> +		unigraf_edid = unigraf_read_edid(0, &unigraf_edid_len);
>> +
>> +		for_each_connected_output(&display, output) {
>> +			if (output->config.connector->connector_type ==
>> +			    DRM_MODE_CONNECTOR_DisplayPort) {
>> +				igt_assert(kmstest_get_property(drm_fd,
>> +
>> output->config.connector->connector_id,
>> +
>> DRM_MODE_OBJECT_CONNECTOR, "EDID",
>> +								NULL,
>> &edid_blob_id, NULL));
>> +				edid_blob = drmModeGetPropertyBlob(drm_fd,
>> edid_blob_id);
>> +				if (!edid_blob)
>> +					continue;
>> +
>> +				if (!memcmp(unigraf_edid, edid_blob->data,
>> +					    min(edid_blob->length,
>> unigraf_edid_len)))
>> +					found = true;
>> +
>> +				drmModeFreePropertyBlob(edid_blob);
>> +
>> +				if (found)
>> +					break;
>> +			}
>> +		}
>> +		igt_assert_f(found, "No output with the correct EDID was
>> found\n"); +
>> +		free(unigraf_edid);
>> +	}
>> +
>> +	igt_describe("Make sure that the unigraf device can be used as a MST
>> device");
>> +	igt_subtest("unigraf-connect-mst") {
>> +		int newly_connected_count, already_connected_count, diff_len;
>> +		uint32_t *newly_connected = NULL, *already_connected = NULL,
>> *diff = NULL;
>> +		int max_count;
>> +
>> +		unigraf_require_device(drm_fd);
>> +		max_count = unigraf_get_mst_stream_max_count();
>> +
>> +		unigraf_hpd_deassert();
>> +
>> +		already_connected_count =
>> igt_get_connected_connectors(drm_fd, &already_connected); +
>> +		igt_debug("Already connected count: %d\n",
>> already_connected_count); +
>> +		// i = 0 is SST so we need to process max_count + 1 streams
>> +		for (int i = 0; i <= max_count; i++) {
>> +			unigraf_hpd_deassert();
>> +			// Let the hardware detect the new state
>> +			sleep(igt_default_display_detect_timeout());
> 
> 10s?
> 
>> +
>> +			unigraf_set_mst_stream_count(max(i, 1));
>> +			if (!i)
>> +				unigraf_set_sst();
>> +			else
>> +				unigraf_set_mst();
>> +
>> +			unigraf_hpd_assert();
>> +			// Let the hardware detect the new state
>> +			sleep(igt_default_display_detect_timeout());
> 
> 10s?
> 
>> +
>> +			newly_connected_count =
>> kms_wait_for_new_connectors(&newly_connected,
>> +
>> already_connected,
>> +
>> already_connected_count,
>> +
>> drm_fd); +
>> +			diff_len = get_array_diff(newly_connected,
>> newly_connected_count,
>> +						  already_connected,
>> already_connected_count, &diff); +
>> +			igt_assert_f(diff_len == max(i, 1),
>> +				     "Invalid connected connector count,
>> expected %d found %d\n",
>> +				     max(i, 1), diff_len);
>> +		}
>> +	}
>> +}
>>
> 
> 
> 

