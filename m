Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F17C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 06:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27E510E129;
	Thu, 18 Jan 2024 06:29:33 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 18 Jan 2024 06:29:32 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B2D10E129
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 06:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705559372; x=1737095372;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Ld4cBktXwD/b2IdSY2LDRP1xgNVx+i94Y2EN0QMdWOs=;
 b=RdblG2uZjoyw//Gf4usbr8mFpmTVEP5ZT4Y8AZz9XYNtT0G6o9aI0Ijk
 z8OhFqF4pA2UbmJNxhaeC8/BMmMJ26oU386axg/peZwyUYx85kg0U9a2W
 srWFjvLIv1wYGv5nH5dDu1JXW2X28uLq3AKEZd2OrRyMu/B+WmS4MmB0+
 /QKB5+5n9DGXM94bmpTZf/qfWq1K2rP4/qzQT/JSggKVELlLHqnq0O/D8
 e+VlSsKBRkI4BN/6+IMXsbp7nLcRA8grBosMVWZbwvtViFsFbN6d3Hwyc
 tYC7mu9En3YQoq5Vwi7QARSHHQ8B63bNDtl7hrPakcgC4tXnahZh58Mni w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="248748"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="248748"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 22:22:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="19022720"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.213.81.131])
 ([10.213.81.131])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 22:22:23 -0800
Message-ID: <45f19834-694b-4f26-86d7-4db563a0b935@intel.com>
Date: Thu, 18 Jan 2024 11:52:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib/igt_kms: add helpers for big joiner debugfs
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20240110113906.523857-1-kunal1.joshi@intel.com>
 <20240110113906.523857-2-kunal1.joshi@intel.com>
 <2012b655-b96d-4782-9d69-92666bb57060@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <2012b655-b96d-4782-9d69-92666bb57060@intel.com>
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

Hi Bhanu,

On 17-Jan-24 11:46 PM, Modem, Bhanuprakash wrote:
> 
> On 10-01-2024 05:09 pm, Kunal Joshi wrote:
>> From: Swati Sharma <swati2.sharma@intel.com>
>>
>> Add helpers for big joiner debugfs.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   lib/igt_kms.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_kms.h |  3 +++
>>   2 files changed, 78 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index e4dea1a60..0208eccc4 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -6368,3 +6368,78 @@ int get_num_scalers(int drm_fd, enum pipe pipe)
>>       return num_scalers;
>>   }
>> +
>> +static int write_bigjoiner_debugfs(int drmfd, char *connector_name, 
>> const char *file_name,
>> +                   const char *write_buf)
> 
> IMHO, we need to drop this static function and move the logic to 
> igt_force_bigjoiner_enable()

Why?

> 
>> +{
>> +    int debugfs_fd = igt_debugfs_dir(drmfd);
>> +    int len = strlen(write_buf);
>> +    int ret;
>> +    char file_path[128] = {0};
>> +
>> +    sprintf(file_path, "%s/%s", connector_name, file_name);
>> +
>> +    ret = igt_sysfs_write(debugfs_fd, file_path, write_buf, len);
>> +
>> +    close(debugfs_fd);
>> +
>> +    if (ret > 0)
>> +        return 0;
>> +
>> +    return ret;
>> +}
>> +
>> +static bool check_bigjoiner_debugfs(int drmfd, char *connector_name,
>> +                    const char *check_str)
> 
> we need to drop this static function and move the logic to 
> igt_is_force_bigjoiner_enabled()
> 
>> +{
>> +    char file_name[128] = {0};
>> +    char buf[512];
>> +
>> +    sprintf(file_name, "%s/i915_bigjoiner_force_enable", 
>> connector_name);
>> +
>> +    igt_debugfs_read(drmfd, file_name, buf);
>> +
>> +    return strstr(buf, check_str);
>> +}
>> +
>> +/**
>> + * igt_is_force_bigjoiner_enabled:
>> + * @drmfd: A drm file descriptor
>> + * @connector_name: Name of the libdrm connector we're going to use
>> + *
>> + * Returns: True if Big Joiner is force enabled (via debugfs) for the 
>> given connector,
>> + * false otherwise.
>> + */
>> +bool igt_is_force_bigjoiner_enabled(int drmfd, char *connector_name)
>> +{
>> +    return check_bigjoiner_debugfs(drmfd, connector_name, "Bigjoiner 
>> enable: 1");
>> +}
>> +
>> +/**
>> + * igt_force_bigjoiner_enable:
>> + * @drmfd: A drm file descriptor
>> + * @connector_name: Name of the libdrm connector we're going to use
>> + *
>> + * Returns: 0 on success or negative error code, in case of failure.
>> + */
>> +int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool 
>> enable)
>> +{
>> +    return write_bigjoiner_debugfs(drmfd, connector_name, 
>> "i915_bigjoiner_force_enable", enable ? "1" : "0");
>> +}
>> +
>> +/**
>> + * igt_get_bigjoiner_debugfs_fd:
> 
> Not understood the purpose of this helper.
> 
> igt_debugfs_connector_dir() will give the directory fd, then we can 
> perform igt_debugfs_simple_read() or igt_sysfs_write() with that fd.

This is getting used here 
https://patchwork.freedesktop.org/patch/574033/?series=128266&rev=2

> 
> - Bhanu
> 
>> + * @drmfd: A drm file descriptor
>> + * @connector_name: Name of the libdrm connector we're going to use
>> + *
>> + * Returns: fd of the Big Joiner debugfs for the given connector,
>> + * else returns -1.
>> + */
>> +int igt_get_bigjoiner_debugfs_fd(int drmfd, char *connector_name)
>> +{
>> +    char file_name[128] = {0};
>> +
>> +    sprintf(file_name, "%s/i915_bigjoiner_force_enable", 
>> connector_name);
>> +
>> +    return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
>> +}
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index b3882808b..2d000d54d 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1218,5 +1218,8 @@ bool intel_pipe_output_combo_valid(igt_display_t 
>> *display);
>>   bool igt_check_output_is_dp_mst(igt_output_t *output);
>>   int igt_get_dp_mst_connector_id(igt_output_t *output);
>>   int get_num_scalers(int drm_fd, enum pipe pipe);
>> +bool igt_is_force_bigjoiner_enabled(int drmfd, char *connector_name);
>> +int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool 
>> enable);
>> +int igt_get_bigjoiner_debugfs_fd(int drmfd, char *connector_name);
>>   #endif /* __IGT_KMS_H__ */
