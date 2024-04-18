Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31C0C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 03:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411A8113999;
	Thu, 18 Apr 2024 03:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfKQzkzG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A60113997
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 03:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713412522; x=1744948522;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1kmy/TBaYvorkX73IWaEICs8GnQHS+cmZ987evTgH8s=;
 b=TfKQzkzGjaSfqSoi8rXb5Hsn/XyKU8W1DdkWNRNRX3sg+PPCEgqGDcuO
 z07trWaqE+rnA2IBvwaR62aZVGqjrmBpBLEaMBeuawh/OpxLrpof7G7cw
 1bC43QKEjtdfAWCka3N0aoGd+e0k8p4PLRoKhoovIfdNBFj6H1sEspmjv
 OhPA8as3W9MTsCHWCsef9Q7XzCOGzRPGPPV3qqagsdlRJRXKUL/R/qSDM
 3F/zIw5yUta+efq19MJQ/jfwMXP28HswqQIu0rMgKsqBQyJc6rEqoDQEd
 woRjBCBt9fmTbFPItv3tF39KvePuY5aFoKQ/F6qgOLdGSfnJ/yZOqcJT8 A==;
X-CSE-ConnectionGUID: D/qliQ3SSYKmoCepiilQ9Q==
X-CSE-MsgGUID: EjT6sY6YSoWb1I9q8fSwVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31415439"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="31415439"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 20:55:21 -0700
X-CSE-ConnectionGUID: ORVigQA2Shu+I7GAdN4Ncg==
X-CSE-MsgGUID: suL51yYYQNeNXwlEaJK6pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="46126638"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 20:55:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 20:55:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 20:55:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 20:55:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgnwAQWNR9CWHfTfM7uAgdfuARMMi3pysbr1yUyv5HNHCWtoKPVSeAHhRzx2iTfqRafNOXXQnvBlcSx26wnV4Q4wJMuCtdCXTYtSTHGDOKqu885/dQHTJ1DyXvrRHXQtHTtjvdCn6x4L37eLKaAuVTZLxVKR9TecHjTzPvcrk8AFSDK9ZIRUlLJ6w5TQ3KKxcBFB7xqjTmsjKegvuDmOjkYeIY/76bEzSlkzncJvOzQG4YwmmKS2SF1kqZz+E+UwU81XyNrKe1IoaHNLkoQFKVZqPq2/L953nXNp5jBMV5eCZzOlKVDAByQEpLqTQhOaY990mxskYSvK/k6PZcGsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjKX4+aNHMQ24KWck7m287N4UpBQwcj2x7wmEqzofLo=;
 b=leOfdLsL8gq55KQscRgn9cKs9/tfjtp906pcEa38RRqgn5cJvJDQNqg1SbkXJUm9Bxt/3UQ3/qj7/g9n45Y/ScN6xuFbDePil0oygFfR+ydQ02w9GZRAdu6ZCiIe3pUrqHWA17yIHsAf6/v9D3MlhYgwUUQ9tauybWFKHtUjP8n2RqTSQV0xu8cH+us5Z/iRfzHX9RyGQA8qzPi1mP768j2EGV0+AAwHamQ+l4JdoNLH9BPEn8MTax4PkFAZMRkIA8cMvq/uO7PU8oFPfwSCMJOz5jNPywWq7BXdnOFMZ7lQVymqSYv2UsYvhHT4mnY5vX/hLg717PWtr+tgeOVNCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA2PR11MB4827.namprd11.prod.outlook.com (2603:10b6:806:11f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 18 Apr
 2024 03:55:18 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 03:55:18 +0000
Message-ID: <975774a1-f75b-4515-9a40-b97f96e39cfd@intel.com>
Date: Thu, 18 Apr 2024 09:25:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_wedged: Introduce test for
 wedged_mode=2
To: <igt-dev@lists.freedesktop.org>
References: <20240409221908.1077893-1-rodrigo.vivi@intel.com>
 <20240409221908.1077893-3-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240409221908.1077893-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA2PR11MB4827:EE_
X-MS-Office365-Filtering-Correlation-Id: fa4f3c3b-1e11-4308-b4a2-08dc5f5b5ca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H2mtOydBNl9AqWiw5zOt14+vMIQ8SdKaFtKOY1rdhQ4838jCjTvwoNnXg3qNEvKMKvq5dHJSQx2kL1lwI43Ri8r6MeJ0cZJ7+EY/EgkasV3VsPaKSoeEGl8csxwcAvqR1n2YMgVZ3T5acrp2zrFUHspM7qbTjbZmpSWNxivvXRvjUHJu0XIRVePDdDTi1G+x1FyIgpEiK6ocPfXz1xpg7E5mGMgOrvvU06mPHFv7IVGTzeCuaz97c9dYL8+Td7mgk+izQbWIYd3U7sLpeD2PcHN/BjQONPrlYJwqdQtvkK2jFYBbRfoP3y48i6xZ1cGtlWeT8AdVrg/UpXX1pCZnlxWXFkx0YxxG8GxKhw3xe/vhpEcQOV6whrPrFHXsz7GGthwgktm/TWQbQ48i50DhKLSO+sZXtWM+RO5KsmF6M9GJZTOmN9uQZJfSyjRP/33dymwYr0jrLHK13nkycXavIW2TdCIsvtO+QfHT3Vm+NYbJtZfo4ncgrctN9LpOHcm1TvmPwIPMrbflzRTM3T5ZB0TtPuSCsMa2MOaIW+rbMpZZNdZ+beOhx72w1FbSObtZYqA56ZxTZdiw9JCrv8MbO8so52yQQnoRcmsaX9LMGbu3utaA4uLQIw1/teE6gyl9/4eI7VbsoViTJS2OKFYOWFjdNPabS0grQ24A64FjOBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um1rVVFHckhXV1ArS3pDZVZBbHRXc2UzMFRCcERxanNnS211aXhIOWpUdnIy?=
 =?utf-8?B?TzhUaCswdWxDUjUzcE9SRkNhcEtYVytVQjJWcWVybUN5MmxscmtaM003eUFn?=
 =?utf-8?B?UkpIcnlFeHU2MlVvdnRwM090WUJOTUpJRGNyaWVXZzdXTXlPb2VhWld3S1Vt?=
 =?utf-8?B?SGY3NThUZDc4aWJDLy9JVE1kbGlRU2hPT1VDSmpJVnBOVmVUUDJwckl2QU1V?=
 =?utf-8?B?WVkrODlWTC9jVElUQ29UUTZCTDlGTi9La2Z4aWZTYnRqcWwzb1hZNHpLcHht?=
 =?utf-8?B?Vi9VZkhLY0RmQkdBWGZTemxQb0ZxUXQrWm5UVS9PTlBwSXgzdDZLb0MxOTdP?=
 =?utf-8?B?by9IQTdQbW1WMjRhQWF0MFFSMVV1SkIxSGtXaDZKUjBDNmRQYWVpcHJxdmIr?=
 =?utf-8?B?TWxYVUlJUk1McEVtYUZpT1lSb3pnNWp6eWVTS1VkQ0dQd2tKVmNiSTNUSmlY?=
 =?utf-8?B?MDRsQUx3cnJPRGJVWGVEYjY1ckRWZitORXVYbjFpM3V2WlU3VlFhNjlZcnJv?=
 =?utf-8?B?eHdNUDFQN05QZTk0MS85cFpxc1YxN0d2d0NlRTNybWN5TlZsa1VNekJGMmlh?=
 =?utf-8?B?Tll3L0dIVVVSTXhtbUYzTzdtUnUySVNyMFNpdU5vZkJ3TW1JR0dVcTBxYXFU?=
 =?utf-8?B?RFNSelZyeExlZzFoMlc2RndKUDZSeStaSzVUZlNJTDJWUTl1ODNsem1iQmhi?=
 =?utf-8?B?ZThXZVZJTHI4b2EvV3J4T2VMcjNiNS9oNkt3MkNRU2VyaUJKZ1VaY2x0T0tN?=
 =?utf-8?B?SmMzTExwQXBiRjY0UXJWYmVZOEo5cFJRMmViQlpaOFd1dHZOMGhNRDRUN0JG?=
 =?utf-8?B?VW81RlBpUzRkWmhjcUduNXhmVjVvajIvRkd6ZTZFMGd2TGZnUlV2dnQ2djZi?=
 =?utf-8?B?T0RSY2VMZHZPT2JWT29Bdkc1aXlnSzRQMEVRMjZxdWZUOFZzbUpaTnV2VFl2?=
 =?utf-8?B?TkEweEU1OHlVK2JjcG9la3o1cVU2b3JZcDFnME1XRUJBSEN5WE9VcE94ZHVH?=
 =?utf-8?B?Y2ZpUVRlVzZvSnBvU2NRYndVeFlueGpjWUZIY0RQMjVEL1I3d3J5cFFtbllL?=
 =?utf-8?B?aTBxQlI2b3pMd2FUYmhneC91NGpmdUFXYUczQkRZMmJ0Ny9nN1luZHhpc3ND?=
 =?utf-8?B?MXNaRkpxZmN5RmxoNVdsNDB2R1ZpOTRpOUlDWUJjRFFtSXBkcE5DUmVyUWRB?=
 =?utf-8?B?bDY0Q3k5TWhWWGgrUW4yZHBPMjJPbEYyUndoUmhOZHhWRkZDTTVFV0RXK1lk?=
 =?utf-8?B?TGxiR256STFnQTZvMjBJR3JrblZGUmZHZW9Tdi9HcFRNZ292VUVDZ1BVQWk5?=
 =?utf-8?B?UjdVb0hBN0wrRnhIWlQyN29BU2t3enkwTUpac3cxckFtVHdtU09CNHFpeDls?=
 =?utf-8?B?b1l2eFB2Q1pMTVA5My9LNk9WZnMxZE1KNThka2lSaHVJY09aTi9tdlczTkds?=
 =?utf-8?B?UTVMcU9GeEpRRStHVEJFcUhjSUFBRXFiMFA5eW5iRTZpSXd6VkFCUEkyaGZC?=
 =?utf-8?B?LzNHTXd0SE9RSTI0MWJjekxwNE5aMGJ0clc0a05OaS8wR2lKYXN5SDVqYWZW?=
 =?utf-8?B?OENYeHc3OTZ0OUJUelpQWDdpK0lCSjZtT1AxdUxVNGF5TDJzTVJ6ckFHZ2Mw?=
 =?utf-8?B?dVROWWVaUCs5WWVXR1E5MERRWjlWcTltYkNWYzk5SlBTSjI1SGV4SUNoMDh1?=
 =?utf-8?B?YjMxOFZKMDhlb1RNVkFXZmNub0g5VVRJQ1JKVHNXL1RoUnNBK2Zsa21INUlm?=
 =?utf-8?B?bkNSMndQWmtXbWxNM08wcXUzbVBIQzdJb2w4dlNOb0VEYUhRZnp1YVprczhU?=
 =?utf-8?B?SXZMVFkyOElXeHI0WVViS2hnV3RQUDlCVkxHRWlQZXlrVHppMjlUaHJNcjZm?=
 =?utf-8?B?d1Z3Q2lxR05ORGNac0RlVEJpNHZ4L1h6Y0d2bEpyR3J5RXV6NXhGUXFnbGJi?=
 =?utf-8?B?a2oyNTVxNHJ6Vjh6M3NySFV0YkFzdjdYVHFxUlIzNUd2b3cyUW44cVBNREl3?=
 =?utf-8?B?V2d4Sk9CeDRZWHhEN015bDFPTlNwLy9QQk1FalpKR2JqQXBlWTVMandKZU9I?=
 =?utf-8?B?SmhSUVQxcjg4VUh5dm9QcjNoVUZ3Q0dNcEp5QUZ0c1VvUWlNKzNraDFRcTJC?=
 =?utf-8?B?RnlyWUF4aHhpQmpwMHNxdmlTc01UaXhZSkV3M1M3RjdUVlg0dzU4V3Jlamd2?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa4f3c3b-1e11-4308-b4a2-08dc5f5b5ca7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 03:55:18.4187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4HZO9Vm9TX6cG2H96wy1Nm0Cki5QCKE97iPApt9hmo8I63vruUbcJLPKK+OOw6UrAzw2F5VgDeamlCa/m0dBDcOBp3Ez9iVneqXn89Stvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4827
X-OriginatorOrg: intel.com
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


On 10-04-2024 03:49, Rodrigo Vivi wrote:
> In this mode, selected with debugfs, the GPU will be declared
> as wedged at any timeout. So, let's also introduce a command
> that will surely timeout. Based on the xe_exec_threads hang.
>
> Then we confirm the GPU is back alive after a rebind.

Patch LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   tests/intel/xe_wedged.c | 69 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
>
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index ab9bf23d5..35fc905e7 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -162,10 +162,60 @@ simple_exec(int fd, struct drm_xe_engine_class_instance *eci)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +static void
> +simple_hang(int fd)
> +{
> +	struct drm_xe_engine_class_instance *eci = &xe_engine(fd, 0)->instance;
> +	uint32_t vm;
> +	uint64_t addr = 0x1a0000;
> +	struct drm_xe_exec exec_hang = {
> +		.num_batch_buffer = 1,
> +	};
> +	uint64_t spin_offset;
> +	uint32_t hang_exec_queue;
> +	size_t bo_size;
> +	uint32_t bo = 0;
> +	struct {
> +		struct xe_spin spin;
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +	} *data;
> +	struct xe_spin_opts spin_opts = { .preempt = false };
> +	int err;
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo_size = xe_bb_size(fd, sizeof(*data));
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			  vram_if_possible(fd, eci->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	data = xe_bo_map(fd, bo, bo_size);
> +	hang_exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +
> +	spin_offset = (char *)&data[0].spin - (char *)data;
> +	spin_opts.addr = addr + spin_offset;
> +	xe_spin_init(&data[0].spin, &spin_opts);
> +	exec_hang.exec_queue_id = hang_exec_queue;
> +	exec_hang.address = spin_opts.addr;
> +
> +	do {
> +		err =  igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec_hang);
> +	} while (err && errno == ENOMEM);
> +
> +	xe_exec_queue_destroy(fd, hang_exec_queue);
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   /**
>    * SUBTEST: basic-wedged
>    * Description: Force Xe device wedged after injecting a failure in GT reset
>    */
> +/**
> + * SUBTEST: wedged-at-any-timeout
> + * Description: Force Xe device wedged after a simple guc timeout
> + */
>   igt_main
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -188,6 +238,25 @@ igt_main
>   			simple_exec(fd, hwe);
>   	}
>   
> +	igt_subtest_f("wedged-at-any-timeout") {
> +		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
> +
> +		igt_debugfs_write(fd, "wedged_mode", "2");
> +		simple_hang(fd);
> +		/*
> +		 * Any ioctl after the first timeout on wedged_mode=2 is blocked
> +		 * so we cannot relly on sync objects. Let's wait a bit for
> +		 * things to settle before we confirm device as wedged and
> +		 * rebind.
> +		 */
> +		sleep(1);
> +		igt_assert_neq(simple_ioctl(fd), 0);
> +		fd = rebind_xe(fd);
> +		igt_assert_eq(simple_ioctl(fd), 0);
> +		xe_for_each_engine(fd, hwe)
> +			simple_exec(fd, hwe);
> +	}
> +
>   	igt_fixture {
>   		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
>   			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
