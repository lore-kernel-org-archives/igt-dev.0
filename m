Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5C3CF5390
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 14:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22B810E7EC;
	Wed, 23 Oct 2024 14:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WL7u8cAD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5256610E1A1
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729693415; x=1761229415;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=J81iAGfAmsY0jxR6+rWiYTBJwuhWtUQltoagl+nsUKI=;
 b=WL7u8cADGwkrA2Hp2mFi1Ss03z67F++/NvwmnaxPctPrm06CRSmVqjBr
 AHMX0X3U5cB2QI2A3Rk2qy2KfK6BGu1RPTSmgh9Iq2Gv3Ai6vjTue4DML
 MJXrNF/ufsoCbKkt3Nysz4iEStyZanDEQXF0v+vBXdgIrtD0OTdPBmC5v
 tDa5qXYAKmwpfgoG/39Dzw0svhlyNCbjBe4u9YK+251Mbj2HxMw4SgIwE
 SZof0IbNnEeuoq3uWKyJDz39gnMkM6T1k0dNm4U+h8fu8NxbjHWCIBmCY
 jDwGwVNvBX4wIhc8LmijUooHIjRf9Qin7G0swfVV7E7U/lMJbB942rFYW w==;
X-CSE-ConnectionGUID: /2ghG1H4Txa9Iv6i5bfXfA==
X-CSE-MsgGUID: 9oxSKfynS/OAVLw4Yhm2vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40402312"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40402312"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 07:23:35 -0700
X-CSE-ConnectionGUID: FiQjyAyNQXGaGonANT4z0g==
X-CSE-MsgGUID: ABTZ9rSGQ0uKz6zysazDAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="79798815"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.100.141])
 ([10.245.100.141])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 07:23:32 -0700
Message-ID: <aabfce6d-d9ca-419e-b62a-dd38aaa0d0e8@linux.intel.com>
Date: Wed, 23 Oct 2024 16:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 2/6] lib/igt_sriov_device: add helper for
 resetting SR-IOV device
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com
References: <20241021200737.941384-1-marcin.bernatowicz@linux.intel.com>
 <20241021200737.941384-3-marcin.bernatowicz@linux.intel.com>
 <47c21095-f55b-4421-aec8-76ff5da86e29@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <47c21095-f55b-4421-aec8-76ff5da86e29@intel.com>
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



On 10/22/2024 12:10 PM, Michal Wajdeczko wrote:
> 
> 
> On 21.10.2024 22:07, Marcin Bernatowicz wrote:
>> Reset is initiated by writing 1 to device's sysfs reset attribute.
> 
> FLR is not SR-IOV only concept, FLR can be supported by any other PCI
> device, it's just mandatory for the VFs, so maybe these SR-IOV helpers
> should be built on top native helpers:
> 
> igt_trigger_reset(dir)
> {
> 	igt_sysfs_set(dir, "reset", "1")
> }
> 
> igt_reset_device(fd)
> {
> 	dir = igt_get_device_dir(fd)
> 	igt_trigger_reset(dir)
> }
> 
> igt_sriov_get_vf_device_dir(fd, n)
> {
> 	igt_assert(n);
> 	return ...("virtfn%u", n)
> }
> 
> igt_sriov_reset_vf(fd, n)
> {
> 	dir = igt_sriov_get_vf_device_dir(fd, n)
> 	igt_trigger_reset(dir)
> }
> 
Maybe I don't follow, but this patch contains the equivalent 
implementation for:

igt_sriov_get_vf_device_dir(fd, n)
igt_sriov_reset_vf(fd, n)

with the difference that we allow n == 0 (treat PF as VF0).

The common point would be int igt_device_trigger_reset(int dev_dir) (if 
placed in lib/igt_device), but I find it a bit confusing as the param is 
a device directory and not the DRM device fd.

igt_reset_device(fd) is not very usable for existing device_reset test 
as we unbind the driver before reset.

>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Narasimha C V <narasimha.c.v@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   lib/igt_sriov_device.c | 51 ++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_sriov_device.h |  2 ++
>>   2 files changed, 53 insertions(+)
>>
>> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
>> index d20c74823..2b83cd43c 100644
>> --- a/lib/igt_sriov_device.c
>> +++ b/lib/igt_sriov_device.c
>> @@ -413,3 +413,54 @@ int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num)
>>   
>>   	return fd;
>>   }
>> +
>> +/**
>> + * igt_sriov_device_reset_exists:
>> + * @pf: PF device file descriptor
>> + * @vf_num: VF number (1-based to identify single VF) or 0 for PF
>> + *
>> + * Check if reset attribute exists for a given SR-IOV device.
>> + *
>> + * Returns:
>> + * True if reset attribute exists, false otherwise.
>> + */
>> +bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num)
>> +{
>> +	int sysfs;
>> +	bool reset_exists;
>> +
>> +	sysfs = igt_sriov_device_sysfs_open(pf, vf_num);
>> +	if (sysfs < 0)
>> +		return false;
>> +
>> +	reset_exists = igt_sysfs_has_attr(sysfs, "reset");
>> +	close(sysfs);
>> +
>> +	return reset_exists;
>> +}
>> +
>> +/**
>> + * igt_sriov_device_reset:
>> + * @pf: PF device file descriptor
>> + * @vf_num: VF number (1-based to identify single VF) or 0 for PF
>> + *
>> + * Trigger FLR on a given VF.
>> + *
>> + * Returns:
>> + * True on success, false on failure.
>> + */
>> +bool igt_sriov_device_reset(int pf, unsigned int vf_num)
>> +{
>> +	int sysfs;
>> +	bool ret;
>> +
>> +	sysfs = igt_sriov_device_sysfs_open(pf, vf_num);
>> +	if (sysfs < 0)
>> +		return false;
>> +
>> +	igt_debug("Initiating FLR on VF%d\n", vf_num);
>> +	ret = igt_sysfs_set(sysfs, "reset", "1");
>> +	close(sysfs);
>> +
>> +	return ret;
>> +}
>> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
>> index dc95a4c78..4b63ceb22 100644
>> --- a/lib/igt_sriov_device.h
>> +++ b/lib/igt_sriov_device.h
>> @@ -31,6 +31,8 @@ bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
>>   void igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num);
>>   void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num);
>>   int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
>> +bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
>> +bool igt_sriov_device_reset(int pf, unsigned int vf_num);
>>   
>>   /**
>>    * for_each_sriov_vf - Helper for running code on each VF
> 

