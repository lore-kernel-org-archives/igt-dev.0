Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80628F4612E
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 14:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3850D10E041;
	Mon, 23 Mar 2026 14:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="o78FmEek";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA6810E041
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 14:39:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 89D344E427B0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 14:39:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 518745FEF6;
 Mon, 23 Mar 2026 14:39:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E9C61104507DA; Mon, 23 Mar 2026 15:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774276783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=6h2OnOUvonDrXcbzLLRFYAs4D6e2bQc/t2382qi5ghA=;
 b=o78FmEekQ0VtPyl5ZGxwrHaplnQKvUWlO3jqJzN1Ex9/BnBWgl1XlKrdbj/g7bHANK8WxY
 x18S1koJV8kcDYr1K8F4RArLChuVhP9ktd6QjpWUjfozHZwbwjIWxT7dir2OkytqEVO/DR
 MkvvCmSoalNdgsm92zbAP2mSa/mMIjZF2lzp41GwesUO451pXpoqz0mw+oJXoYqu47R2U+
 42PjIMjuQqMeTIHMBIn0wboYbMFXuBYCQWYUb34yQg/cM2GBeYh8zRAMcddNQfN5AD7bFE
 mgtU1U6P+UL3IAlwCEDsmE0DYE0tCM5A6HIsbZGhv93zhr1tIDyfTJr+z9CDCA==
Message-ID: <880a351f-698c-4a80-ad45-df26efde0e63@bootlin.com>
Date: Mon, 23 Mar 2026 15:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 05/49] lib/igt_kms: Add helper to wait for new
 connectors
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-5-a01dffc3b0cb@bootlin.com>
 <20260317155644.1d4ed9ab@kmaincent-XPS-13-7390>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260317155644.1d4ed9ab@kmaincent-XPS-13-7390>
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



On 3/17/26 15:56, Kory Maincent wrote:
> On Mon, 16 Mar 2026 17:17:26 +0100
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
>> Add list comparison utilities and a new function to wait for new
>> connectors to appear on the system.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>   lib/igt_kms.c | 97
>> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ lib/igt_kms.h |
>> 6 ++++ 2 files changed, 103 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index f0f27ccda9d8..b220de419a70 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -8322,3 +8322,100 @@ uint32_t igt_get_connector_id_from_mst_path(int
>> drm_fd, const void *mst_path)
>>   	return 0;
>>   }
>> +
>> +/**
>> + * array_contains() - Search an element in the array
>> + *
>> + * @array: Pointer to the array to search into
>> + * @array_len: Length of the array
>> + * @value: Value to search in the array
>> + *
>> + * Returns true if @array contains @value
>> + */
>> +static bool array_contains(const uint32_t *array, int array_len, uint32_t
>> value) +{
>> +	igt_assert(array_len == 0 || array);
>> +
>> +	for (int i = 0; i < array_len; i++)
>> +		if (array[i] == value)
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>> +/**
>> + * get_array_diff() - Compute and return the set difference between two
>> arrays
>> + *
>> + * @array_a: Pointer to the first array to compare
>> + * @array_a_len: Length of the first array
>> + * @array_b: Pointer to the second array to compare
>> + * @array_b_len: Length of the second array
>> + * @diff: Out pointer returning a array of items in @array_a but not
>> + *        in @array_b. Can be NULL to only count the elements.
>> + *
>> + * Returns the number of element which are in @array_a but not in @array_b.
>> + */
>> +int
>> +get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t
>> *array_b, int array_b_len,
>> +	       uint32_t **diff)
>> +{
>> +	int diff_len = 0;
>> +
>> +	igt_assert(array_a_len == 0 || array_a);
>> +	igt_assert(array_b_len == 0 || array_b);
>> +
>> +	if (diff)
>> +		*diff = NULL;
>> +
>> +	for (int i = 0; i < array_a_len; i++) {
>> +		if (!array_contains(array_b, array_b_len, array_a[i])) {
>> +			if (diff) {
>> +				*diff = reallocarray(*diff, diff_len + 1,
>> sizeof(**diff));
>> +				igt_assert(*diff);
>> +				(*diff)[diff_len] = array_a[i];
>> +			}
>> +
>> +			diff_len++;
>> +		}
>> +	}
>> +
>> +	return diff_len;
>> +}
>> +
>> +/**
>> + * kms_wait_for_new_connectors() - Wait for new connector to appear
>> + *
>> + * @newly_connected: Out pointer returning the array of connectors currently
>> + *                   found connected
>> + * @already_connected: Input pointer to array of connectors previously
>> + *                     connected
>> + * @already_connected_count: Length of @already_connected
>> + * @drm_fd: DRM file descriptor
>> + *
>> + * Returns the number of connectors not in @already_connected and currently
>> + * found connected.
>> + */
>> +int kms_wait_for_new_connectors(uint32_t **newly_connected,
>> +				const uint32_t *already_connected,
>> +				int already_connected_count, int drm_fd)
>> +{
>> +	int newly_connected_count;
>> +	struct timespec start, end;
>> +
>> +	igt_assert(newly_connected);
>> +	igt_assert(drm_fd);
> 
> Are you sure 0 can't be set as DRM file descriptor?
> With that fixed you can add my R-by.
> 

No, replaced by igt_assert_fd, thanks!

