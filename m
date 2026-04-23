Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F5FFAD414
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 05:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A83F10E2F2;
	Thu, 23 Apr 2026 05:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="tudJPHc0";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D5410E2F2
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 05:46:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8BFCA1A33B8;
 Thu, 23 Apr 2026 05:46:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5A841600DD;
 Thu, 23 Apr 2026 05:46:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8783410460A06; 
 Thu, 23 Apr 2026 07:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776923177; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=HKZ9zZ79mLbBXdMhEQ2tN+H130u+wR/D/4wDM/jb6N8=;
 b=tudJPHc0Nr1H4+cKuzZRdBkLZOGdMIpKpZlrwWiGLYFazOv1+Q7n9/X/ob1WJnj1v9jYXl
 QHbVQty5oSnEZ58syfLHbK0tOoPNFM0LfddEK22PA5fJyux52VMVIFykfwCjfLeT6Uasj2
 TKfbQgPoPpVKT+zCXklvN0TF5kvgzPkprTBTu2uuyLMopwPOQ7YPSr61+2842FBzfWRWP8
 iViofl05KzqOJr/2rMryN3OZ2E+k2BHvSAxOyOBtKbTW2Ol/PV621JmLbWwueYbEgeOnk5
 50W0AoTm8qVpN9BADKGtcyCTbp5f50cfTLcrh8tc+WXvUKFXOGL+MMR2sIjiYw==
Message-ID: <b59c4709-396a-4859-96db-d6aa6e506732@bootlin.com>
Date: Thu, 23 Apr 2026 07:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v10 31/49] tests/unigraf: Add basic unigraf tests
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
 <20260331-unigraf-integration-v10-31-12266c34cc1d@bootlin.com>
 <20260420184951.0adfd89c@kmaincent-XPS-13-7390>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260420184951.0adfd89c@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 4/20/26 18:49, Kory Maincent wrote:
> On Tue, 31 Mar 2026 19:11:48 +0200
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
> 
> Only nitpicking here.
> 
> With these fixed you can add my Rd-by.
> 
> ...
> 
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
>> +		unigraf_set_sst();
>> +		unigraf_hpd_assert();
>> +		sleep(igt_default_display_detect_timeout());
>> +		igt_display_require(&display, drm_fd);
>> +		sleep(igt_default_display_detect_timeout());
>> +
>> +		unigraf_edid = unigraf_read_edid(0, &unigraf_edid_len);
>> +
>> +		for_each_connected_output(&display, output) {
>> +			if (output->config.connector->connector_type ==
>> +			    DRM_MODE_CONNECTOR_DisplayPort) {
> 
> Will there be other connector type check added in the future?
> Else you could simply do:
> if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
> 	continue;

Some unigraf devices supports HDMI too, and AFAIU, they use the same 
library. But I will switch, your proposition is easier to understand and 
it is easy to switch back when an other person wants to implement HDMI.

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
> 
> /* ... */
> I don't know the igt rules but in kernel /* ... */ is preferable.
> 
>> +		for (int i = 0; i <= max_count; i++) {
>> +			unigraf_hpd_deassert();
>> +			// Let the hardware detect the new state
> 
> Same.
> 
>> +			sleep(igt_default_display_detect_timeout());
>> +
>> +			unigraf_set_mst_stream_count(max(i, 1));
>> +			if (!i)
>> +				unigraf_set_sst();
>> +			else
>> +				unigraf_set_mst();
>> +
>> +			unigraf_hpd_assert();
>> +			// Let the hardware detect the new state
> 
> Same
> 
>> +			sleep(igt_default_display_detect_timeout());
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

