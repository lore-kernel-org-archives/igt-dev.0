Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F98EFCD95
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 11:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A558D10E4D1;
	Mon,  9 Mar 2026 11:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIF/gIpX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B581810E4D1
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 11:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773054147; x=1804590147;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=huG3SFLJKOzImQtR7SrbOTUQjuh6OWqnESRQXtnGP9k=;
 b=AIF/gIpX9HRqtV172gwHMaYSSW/0JmqHtt24st5Ccb8sMPWD/IPWg+JS
 /z7zXOyy9q5EFmWWNJgskYwmVTeQbf6fkZGDbGZSJjhbyD8d5c16o/Mfv
 prGBTy0lC9Rlf7OAAoUy33WLS5R2k+mAHWWTfBHE1NUQvYEFUKZXLxsaW
 bqESOKYS/b27yZ8oQXF2sVDJwGa90IG0oDsTcZLQnPSWiWt8DlpQ+BENU
 2cXRwmEXYQQQ0j6Rfi58WEbwuzTro9TNLo46CF1W4qpNfrOLRxsJ7Kkhc
 KeOcCQvSfotzuLVhHMQKLubNpi60iJ/DbOMIgNIGkZBLu9N05TDCqwhKU Q==;
X-CSE-ConnectionGUID: 3HlQ0RPkTdCiq/tLxg/nQw==
X-CSE-MsgGUID: CogMNSxSRqS0hZ9waCyGog==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74043634"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74043634"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:02:23 -0700
X-CSE-ConnectionGUID: ulzmLGG2SZ6zxvdN1rYRVw==
X-CSE-MsgGUID: 2xllpIpQTOWOmJGZU+TFzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="218925473"
Received: from rvinayku-mobl1.gar.corp.intel.com (HELO [10.247.170.133])
 ([10.247.170.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:02:21 -0700
Message-ID: <b9215c41-315c-4a1c-b091-3cef36b675b5@intel.com>
Date: Mon, 9 Mar 2026 16:32:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/6] lib/igt_edid: add EDID serial extraction helpers
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, igt-dev@lists.freedesktop.org
References: <20260225212859.876713-2-kunal1.joshi@intel.com>
 <64b4bad8-09ff-4c5c-81d8-7d6767f4c472@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <64b4bad8-09ff-4c5c-81d8-7d6767f4c472@intel.com>
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

Hello Arun,

Thanks for looking at the patches,

On 09-03-2026 15:00, Murthy, Arun R wrote:
> On 26-02-2026 02:58, Kunal Joshi wrote:
>> Add helpers to extract serial identification from EDID data.
>>
>>   - edid_get_serial_string(): extract ASCII serial from descriptor 0xFF
>>   - edid_get_serial_number(): extract 32-bit serial from EDID header
>>   - edid_get_any_serial(): convenience helper that tries ASCII serial
>>     first, then falls back to 32-bit header serial formatted as hex
>>
>> These are needed by the connector helper and USB4 switch test suite
>> for EDID-based display verification after dock/undock events.
>>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   lib/igt_edid.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_edid.h |  5 +++
>>   2 files changed, 96 insertions(+)
>>
>> diff --git a/lib/igt_edid.c b/lib/igt_edid.c
>> index c68ccf671..e7fcbf0b9 100644
>> --- a/lib/igt_edid.c
>> +++ b/lib/igt_edid.c
>> @@ -249,6 +249,97 @@ void edid_get_monitor_name(const struct edid 
>> *edid, char *name, size_t name_size
>>       name[0] = '\0';
>>   }
>>   +/**
>> + * edid_get_serial_string:
>> + * @edid: EDID structure
>> + * @serial: buffer to write serial string
>> + * @serial_size: size of serial buffer; must be > 1
>> + *
>> + * Extract the serial string from EDID descriptor block type 0xFF.
>> + * The descriptor payload is a 13-byte fixed-width field; trailing
>> + * whitespace is stripped and the result is NUL-terminated.
>> + * @serial is left empty when no 0xFF descriptor is found.
>> + */
>> +void edid_get_serial_string(const struct edid *edid,
>> +                char *serial, size_t serial_size)
> We are trying to get the timings so rather than a generic name 
> serial_string, can this be replaced with get_detailed_timings ?
Spec section 3.10.3.1
defines tag FFh as Display Product Serial Number Descriptor, not a 
detailed timing descriptor

Section 3.10.3
Notes display descriptors are not a detailed timing.
>> +{
>> +    size_t copy_len, i, n;
>> +
>> +    igt_assert(edid);
>> +    igt_assert(serial);
>> +    igt_assert(serial_size > 1);
>> +    serial[0] = '\0';
>> +
>> +    for (i = 0; i < DETAILED_TIMINGS_LEN; i++) {
>> +        const uint8_t *d = (const uint8_t *)&edid->detailed_timings[i];
>> +
>> +        if (d[0] != 0x00 || d[1] != 0x00 || d[2] != 0x00)
>> +            continue;
>> +
>> +        if (d[3] != EDID_DETAIL_MONITOR_SERIAL || d[4] != 0x00)
>> +            continue;
>> +
>> +        /* Descriptor string payload is 13 bytes starting at d[5] */
>> +        copy_len = serial_size - 1 < 13 ? serial_size - 1 : 13;
>> +        memcpy(serial, &d[5], copy_len);
> Can strncpy() be used instead?
strncpy() is not a better fit here. The EDID serial field is a
fixed-width 13-byte payload, not a NUL-terminated C string. Copying the
bounded payload with memcpy(), then explicitly NUL-terminating the
destination and trimming trailing whitespace/newline, matches the EDID
encoding better.
>> +        serial[copy_len] = '\0';
>> +
>> +        for (n = strlen(serial);
>> +             n > 0 && isspace((unsigned char)serial[n - 1]); n--)
>> +            serial[n - 1] = '\0';
>> +
>> +        return;
>> +    }
>> +}
>> +
>> +/**
>> + * edid_get_serial_number:
>> + * @edid: EDID structure
>> + *
>> + * Extract the 32-bit serial number from the EDID base block header
>> + * (bytes 12–15, the manufacturer/product section).  This is different
>> + * from the ASCII serial string in descriptor block 0xFF.
>> + *
>> + * Returns: 32-bit serial number (little-endian), 0 if absent.
>> + */
>> +uint32_t edid_get_serial_number(const struct edid *edid)
>> +{
>> +    return (uint32_t)edid->serial[0] |
>> +           ((uint32_t)edid->serial[1] << 8) |
>> +           ((uint32_t)edid->serial[2] << 16) |
>> +           ((uint32_t)edid->serial[3] << 24);
>> +}
>> +
>> +/**
>> + * edid_get_any_serial:
> No description added?
Description of the function is present below

Thanks and Regards
Kunal Joshi
>
>
> Thanks and Regards,
> Arun R Murthy
> --------------------
>> + * @edid: EDID structure
>> + * @serial: buffer to write serial string
>> + * @serial_size: size of serial buffer; must be > 1
>> + *
>> + * Convenience helper that tries to extract a serial identifier from 
>> EDID.
>> + * First tries the ASCII serial string descriptor (0xFF). If that is 
>> empty,
>> + * falls back to the 32-bit header serial number formatted as 8-char 
>> hex.
>> + * If neither source provides a usable serial (no 0xFF descriptor 
>> and the
>> + * header serial is 0), @serial is left empty.
>> + */
>> +void edid_get_any_serial(const struct edid *edid,
>> +             char *serial, size_t serial_size)
>> +{
>> +    uint32_t serial_num;
>> +
>> +    igt_assert(edid);
>> +    igt_assert(serial);
>> +    igt_assert(serial_size > 1);
>> +
>> +    edid_get_serial_string(edid, serial, serial_size);
>> +    if (serial[0])
>> +        return;
>> +
>> +    serial_num = edid_get_serial_number(edid);
>> +    if (serial_num != 0)
>> +        snprintf(serial, serial_size, "%08X", serial_num);
>> +}
>> +
>>   static void edid_set_mfg(struct edid *edid, const char mfg[static 3])
>>   {
>>       edid->mfg_id[0] = (mfg[0] - '@') << 2 | (mfg[1] - '@') >> 3;
>> diff --git a/lib/igt_edid.h b/lib/igt_edid.h
>> index be0ccf529..d9e396065 100644
>> --- a/lib/igt_edid.h
>> +++ b/lib/igt_edid.h
>> @@ -457,5 +457,10 @@ void *dispid_block_tiled(void *ptr,
>>                int hsize, int vsize,
>>                const char *topology_id);
>>   void edid_get_monitor_name(const struct edid *edid, char *name, 
>> size_t name_size);
>> +void edid_get_serial_string(const struct edid *edid,
>> +                char *serial, size_t serial_size);
>> +uint32_t edid_get_serial_number(const struct edid *edid);
>> +void edid_get_any_serial(const struct edid *edid,
>> +             char *serial, size_t serial_size);
>>     #endif
