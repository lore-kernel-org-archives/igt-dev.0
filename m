Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB270C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 13:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC6F10FB48;
	Wed, 20 Mar 2024 13:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AeGlyBM/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E21210FB48
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710940872; x=1742476872;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7caCLPqcR32JN0FWKsaLP+VdnhQdf0BiciGaXWbpvdY=;
 b=AeGlyBM/Esb6PxkjgWyxt8D6X7EdTigBHigRDIBkdl7PFg9ALY83WzVp
 xjknJuGjK81PV6HfRH4qfjQFu8hBl6MtIXpdkYPSDJYv9cwNsuOuPTJ+P
 FnLznEEBgA5vS3ipx2buh0i7DUK4nIqx/R+nMqoT4Ip/94hiNijv2l3rj
 bvwijcYSXsizFYMX/8Eva6fEjyr6rQ9wTTtLp6pb0SO7no7g1Byynt9hx
 cSE++cCh/j5O6PGC1HcQODRuRiP6ksi1ycf3I83OS6FZqdhPKqAcCWs9f
 qqHbUYOx04GYqTbr/9OAdKCVRH9eh8WBlW7TLbEeefA5hMlt+d2WdMWPn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="6041037"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="6041037"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 06:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="18825893"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 06:21:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 06:21:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 06:21:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 06:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rtq/mNNz+aORdjoCfs9830UkaXF08TUlmrd17S3qWfm8IWhnITOUWYFZbz6nMVlwPOeVWXxRRF951s3+JbN2ZfzLQgS+FYejezTW4xMdl3f7+PuTA+10vWDO4UAIdUUQTIUv/w4DE03NKsDh0ZEwBezkM/ue4jQoMcqZ5LXHdvk35ddYGFwp4C1Dad+3Sh0m+B5bhg7xFeZHTuXMahN6vLMR/EjMs4klRzaTeDK9S8Dm7DW9yf6AVPLIr8iy1XCmJfX2lAxMhAl36eU9oyhqDD6KqWOeVZoYI32Krm3sVUQyZ6O+6bHxz5Kaar3tk5l0dM2JNjQG8dGsVp2HcMp4Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2HfY/EwUOuJojCdqjHrenUu7d5olEJKG6aWqsfiObE=;
 b=h/1qvqx2cc13tXRKCRrvroiNXPmcYjNvPACo46gjDpc1ojunuGDawhWz5xnUvKdsBVgZBGF8silxsfT31CTZBAWH9yTnuWwM3SLtzPaQH2kJyWS4U7vFhSD36oOOFq/VvQCVinJPNWzw3oOIsfet/mhYX5efYTi7ox/vp7BLfGo86ym1M4EUoyGQdge1IA6RPUmK4t/BxgHkRSxG8O+Vk1aRr1Z07s+p3EVAJswYAq7C9PKtgUyw2l98UNH4+jIEPnfYJKgfdPxowzmTNFsR/cvuOnl0peRLTrxqjFXsJ60crYQiHHrUYa/SBY9q8zRW09jGIom+IVeuvbHcxJbEPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA2PR11MB5148.namprd11.prod.outlook.com (2603:10b6:806:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Wed, 20 Mar
 2024 13:21:07 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 13:21:07 +0000
Message-ID: <56a386a4-b83c-4b1c-bcbc-ec3a7cac1810@intel.com>
Date: Wed, 20 Mar 2024 18:51:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] lib/igt_kms: add helper to enable/disable force
 joiner
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240310142721.874315-1-kunal1.joshi@intel.com>
 <20240310142721.874315-4-kunal1.joshi@intel.com>
 <55d5762f-7ca5-453a-8d08-a34e89ad6350@intel.com>
In-Reply-To: <55d5762f-7ca5-453a-8d08-a34e89ad6350@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::25) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA2PR11MB5148:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab3e3be-6935-4dd9-6a18-08dc48e09a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: THuHsTHKtycoUaR/YIKM6e7mcYBKdsKbDct//G5klhNSAUeFNbLBy7rAokfSCJMKNLLTyIf87b1HnOTizH7ylIXTEe8YUQJy2OFD64S2LTR9EfDNmxVfQ0VssE3rFLi6ZnrTMq2GLgJH5HUV+MyY1IyoZtuqQJJm6WKuwd8iJBF6iTox4pL1HEH//cv4uvwvpBY5raixlTY/6h6VS4FdxVfeNlofb3p+AJmTj1sz/7J/IBonq4Svnuh3N5/Y/rMCRhIW1ZvOobTLe6/swRzgrIKpmzgSJirNXX3nOmKgpIwix9kKgYh//Axd574u2P1a9oIiN+mDO4uTqBkY6q7KExYwfFR4cm9aMLvUcdlv4sDR9qpr5DX2coFRfFWApGAU4AbFIY4ayPjg8z300bPxxeiPg9LSrZ9Oqsi9H2/pBogL8F9P5DtufjtYWCBdRR4+DwZVXGmk91Y6TY4ruXNDzR8p1x26ZDWQTw1sh5a9sVxDdScWIrQz+okWHBz2bplBKCNbhi/LLLHPn+UR3kAkKerqNGqi+AybRdiT9AbIGZilxiFo0jK5gHxI3rkJK/byCFahhf+UuA3mGMMraJafwClInLuILZFsKlIOlvK6wZYqEfHM8zGAHgI/Tj7mUWIK9Ill4GRMi7Vhf+OovyfDDvIJRhzBupsByT+7dcXI5tk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?encybVNpOEJjc1dVOEhMaGZEcWRmUVBGY202a3I5NFpnenBwblFLMEdrWkdY?=
 =?utf-8?B?QkJITE1VMWswRWl5aG5JY0dUVUh4a3ZWNVFqTGZBSjJENFdmOGZ4Vld6Unly?=
 =?utf-8?B?b1FyZmxxbmN4bEV4aVBZc0d2WkE2dnJ2OU90SDEwZEFteDdmZmZSSVpuNkgv?=
 =?utf-8?B?alVwTGw3dWhyZFVWUGtrUnIvUDRGWkZFMW1XeTBVdDRiYWM3UVJOVmNtZ3VU?=
 =?utf-8?B?VHJ4ZWx4RUpPWkRTNC9qZ2VnNlJDc1pkRGM1SklOc3BCU1lEMU5NcURGanZH?=
 =?utf-8?B?VVpxZ0dJUkNjZXhra2JMLzdGMFZwa2ZoZU9VYVdmVzlVZGJ5ZnVTaUNPcVhW?=
 =?utf-8?B?aEIvV2svS1FBV3lkejg4MXJySzE3bmhQaE5aYmpKV1pZTzFXbUIwbU5jQ2pK?=
 =?utf-8?B?RlMzdTEva05QUzNLQjZ5MHlXRWc4NWdmTU5qSWlNVVFSM2JEQjNtQlkwOWdL?=
 =?utf-8?B?MHN0T2tjQnl5d0hzUEhJcjJEZmZkeW5kdzkrNWlVdFExVVl1RnlSYWRiWmx2?=
 =?utf-8?B?eXQ5d0RFVVJkckJSSjRFVlNFRGc4U1pITkJJS3N1WDRmZnREdVA2VEVrNkxr?=
 =?utf-8?B?SG9wNi91ZTVzMFNSK2hRUEN3QVorUnNDbWtFZGRacW41N3lsVXJNeCtjYzVv?=
 =?utf-8?B?Y2lVRHFKVUthb041YXdmMmk3VG5WTkFZKzNvUThiMlBOUGovd0lsUlFOWkdB?=
 =?utf-8?B?Z2w1bUlkbWVXaEJOT3ozV0V5QXRXek96K1dlU1VYdG94VjU1N3JWS1lUTTdv?=
 =?utf-8?B?L3pqeDBZV2hoYjZIbTI3Nm9iL2xFdldkR2tYYUxsSFNqTEtJWkIwRm93QTl0?=
 =?utf-8?B?RGlJdlNSa3QwWE52cEdBZmFadnd0d2NZOE12S2R2a1RwKzBIc2RFTHhpRzdO?=
 =?utf-8?B?K1oremIreFJpMEtCbnFpOHZQcVcwcXdEMy9lcHh5ZmR0dWFGcDBuVnNUN21x?=
 =?utf-8?B?UEtZenNiWWJnbmlLMHBZQWo3QUhVZ3BOZm11K3hoVDBDaVp3ZFBvOWQvbEdq?=
 =?utf-8?B?VGljUG5GU3ZmaXFwTzdkT3dsRG9GOXhOVDdvM0dLem03U1ZVUSsyWUJ6QmxS?=
 =?utf-8?B?RGdJdmJXM3dmUVRmT3lrbWc4TnhwNkp3L2FPWkVhbXo2U3MxRGFrYS9OZE5S?=
 =?utf-8?B?bklwVXczcFNjWHJubVRDaUFja0NaVUM3RXA1cFBpZzRjOTZWYjZ5OStjQSsz?=
 =?utf-8?B?NzExVHNZc0kwKzF2VHI5VFdpYnRVVFU0aytiQ0tRWUFUSk9CcFZZVEY0RmQ5?=
 =?utf-8?B?LzQrRW1tTnhzSTJLb0VUUjVFcDZCMnZxTm5xdWdIaHI4emRvc3Y2QWJ4Vnlo?=
 =?utf-8?B?MzZKUU1XSzdxTXo3NWUrKzJZSFhpcG55R2NTMmJpZmp6cFZrSllrZWRwMVJz?=
 =?utf-8?B?cnN4WEJZUTV0QWIwWm9mbVU2d0Q0ZWlTYWU0aVd2VTBBemNmTmhlZjB6ZWZl?=
 =?utf-8?B?S0pBRk1WZGxDMjA4bkFoUnAwT25HdmJXQlpXVHVDR1pLYjY3ak1UcFU2WGRZ?=
 =?utf-8?B?V0t3WU11UmFWTU5HZmE5Zmk0TmhYWXdjTDR4UXBJcUtkTTFRQ3VQUTByemlF?=
 =?utf-8?B?NURZY1ZodnEwSVhOTWZuQlZWNjlYYXJIL3RqNnBNc013cSsrdW5Yd2Y2NmhN?=
 =?utf-8?B?OXRyOTFodUJEQkF6dFVDVkxCbUl2VU1VelNxck5Vd1BPaXVUNHNjNXZJS0pD?=
 =?utf-8?B?QjEwMjZZSmhKYTQ3c2FwME4vUDhhd3l5NEpndDQvNEQraEZYRS9wZ0hNYzIv?=
 =?utf-8?B?NkpjbGhtc0Q2Q2NXT0s4YUV3QitUa1drdkR6RHhhTmtpejF6T3VXb29CWlQv?=
 =?utf-8?B?K3ZuRjVnUTlDRlZwWmVJU3Rwa29YOHRlM2NDR0ZCckxPLzdNcHMyeFVWSllw?=
 =?utf-8?B?bldkZUcvbHVrWHlLZW9YZnNsWmRLV096TWp6cTRmYTQ4Q0ZOQUdWQk1oWXZj?=
 =?utf-8?B?dEV5dFRlandOdHdPKzlyYkI0MzArR3FYeFZ4TFIxbnFRNS8weHc0U0huZi9I?=
 =?utf-8?B?NmJNOTJmbU11Mkc2bUM1MmQwV0wzVUE1YWlic3cwcjhXLzh4VTBlZWFGcmk1?=
 =?utf-8?B?SGM3VERnUnFzRk9iSUJ3TnJ2SHJnd3MyMThydXdheER2dzZtcVJXWUlUeU9T?=
 =?utf-8?B?TVhqZG1NSjRaVXJhQkhkaldxZko1ZUdYRG9PbCt1cUViQk5aaE13Z3dtbUNJ?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab3e3be-6935-4dd9-6a18-08dc48e09a39
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 13:21:07.8308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0Hgs7IF+zcBsNL/pvO7Pu2P8EGWUmrD71fOYBvaz7bFekjyYb/eCv3//dsGaWyKr0zFuO58h4VKCkarDTIKCumoFUMXTHMUAQWsx0dStsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5148
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


On 3/20/2024 6:23 PM, Nautiyal, Ankit K wrote:
>
> On 3/10/2024 7:57 PM, Kunal Joshi wrote:
>> add helpers to check whether force joiner debugfs exists
>> and to enable/disable force joiner for a specific connector.
>>
>> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Cc: Karthik B S <karthik.b.s@intel.com>
>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   lib/igt_kms.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_kms.h |  2 ++
>>   2 files changed, 61 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 63c8045c7..9d0cbd329 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -6168,6 +6168,65 @@ bool bigjoiner_mode_found(int drm_fd, 
>> drmModeConnector *connector,
>>       return found;
>>   }
>>   +/**
>> + * Checks if the force big joiner is enabled for a specific connector.
>> + *
>> + * @drmfd The file descriptor of the DRM device.
>> + * @connector_name The name of the connector.
>
> I think we dont need documentation for this, as this is straight 
> forward and just static function which is called from one place.


Looking at it again, it seems we dont need this as separate function, 
just simply read and return the status in the caller.

Regards,

Ankit

>
>> + * Returns:
>> + *  true if status equals enable, false otherwise.
>> + */
>> +static bool igt_check_force_bigjoiner_status(int drmfd, char 
>> *connector_name, bool enable)
>> +{
>> +    char buf[512];
>> +    int debugfs_fd, ret;
>> +
>> +    igt_assert_f(connector_name, "Connector name cannot be NULL\n");
>> +    debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, 
>> O_RDONLY);
>> +    igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for 
>> connector %s\n", connector_name);
>> +    ret = igt_debugfs_simple_read(debugfs_fd, 
>> "i915_bigjoiner_force_enable", buf, sizeof(buf));
>> +    close(debugfs_fd);
>> +    igt_assert_f(ret > 0, "Could not read 
>> i915_bigjoiner_force_enable for connector %s\n", connector_name);
>> +    return enable ? strstr(buf, "Bigjoiner enable: 1") :
>> +                    strstr(buf, "Bigjoiner enable: 0");
>> +}
>> +
>> +bool has_force_joiner_debugfs(int drmfd, igt_output_t *output)
>
> Since this helper is expected to be used in other tests, it would be 
> good to have documentation for this.
>
> Also, imho, it would be better to use igt_* for helpers, though we 
> seem to be not following this strictly.
>
>
>> +{
>> +    char buf[512];
>> +    int debugfs_fd, ret;
>> +
>> +    igt_assert_f(output->name, "Connector name cannot be NULL\n");
>> +    debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, 
>> O_RDONLY);
>> +    igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for 
>> connector %s\n", output->name);
>
> I think we should not assert here, this will fail for platforms that 
> do not support bigjoiner. Perhaps returning false will be sufficient.
>
>
> Regards,
>
> Ankit
>
>> +    ret = igt_debugfs_simple_read(debugfs_fd, 
>> "i915_bigjoiner_force_enable", buf, sizeof(buf));
>> +    close(debugfs_fd);
>> +    return ret >= 0;
>> +}
>> +
>> +/**
>> + * Forces the enable/disable state of big joiner for a specific 
>> connector.
>> + *
>> + * @drmfd The file descriptor of the DRM device.
>> + * @connector_name The name of the connector.
>> + * @enable The desired state of big joiner (true for enable, false 
>> for disable).
>> + * Returns:
>> + *  true on success, false otherwise.
>> + */
>> +bool igt_force_bigjoiner_enable(int drmfd, char *connector_name, 
>> bool enable)
>> +{
>> +    int debugfs_fd, ret;
>> +
>> +    igt_assert_f(connector_name, "Connector name cannot be NULL\n");
>> +    debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, 
>> O_DIRECTORY);
>> +    igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for 
>> connector %s\n", connector_name);
>> +    ret = igt_sysfs_write(debugfs_fd, "i915_bigjoiner_force_enable", 
>> enable ? "1" : "0", 1);
>> +    close(debugfs_fd);
>> +    igt_assert_f(ret > 0, "Could not write 
>> i915_bigjoiner_force_enable for connector %s\n", connector_name);
>> +
>> +    return igt_check_force_bigjoiner_status(drmfd, connector_name, 
>> enable);
>> +}
>> +
>>   /**
>>    * igt_check_bigjoiner_support:
>>    * @display: a pointer to an #igt_display_t structure
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index bab8487d3..f13b7fd53 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1214,6 +1214,8 @@ int igt_get_max_dotclock(int fd);
>>   bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>>                 int max_dotclock);
>> +bool has_force_joiner_debugfs(int drmfd, igt_output_t *output);
>> +bool igt_force_bigjoiner_enable(int drmfd, char *connector_name, 
>> bool enable);
>>   bool igt_check_bigjoiner_support(igt_display_t *display);
>>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo 
>> *mode);
>>   bool intel_pipe_output_combo_valid(igt_display_t *display);
