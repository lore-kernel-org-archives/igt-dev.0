Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15571FC592C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 11:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B298810E8D4;
	Thu, 26 Feb 2026 11:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PsUM9CuQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F285110E8D4
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 11:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772104803; x=1803640803;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=65Heuo4stQyQ3hsaKqO2/UIYdJuZv0p3tie+O2UQ+AM=;
 b=PsUM9CuQu+/syYjPZpWALG3nSB8suOyGwjpS15GBEUALOUU+SRKgM2Is
 UHkpx9Q0ExwcbnHqoIYbZaYhSL9kDKf8JJi+IZsdZipHm63ZBxLAlhgM0
 B4IpbAuhzc7FYjvm0PM5e2tpjhOKF87no4HpXTuiOaO7fzGYfRXcG/6b0
 XvgCTgPfa56ZYBcFJ4AbOSMN7SgW56R9Dfs07yN4gdNaPSHrs2cIUsPj1
 Oy4RSlKu/CA6/9SMGIGA/xaUHpP0wHstRXpuVK4sG/qkkheEZAeoRK0p7
 oakjlRN1GODUA3Yy2glDq7iyppPH6YL8fNbrCXk/dVLUWwWWQlixkgtF+ Q==;
X-CSE-ConnectionGUID: YS8XXS4xRPe5n+yMJVfTjw==
X-CSE-MsgGUID: +vrveaYKTFGW6mKVt8O/EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73207049"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73207049"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 03:20:02 -0800
X-CSE-ConnectionGUID: 5risI5UmRKSby/YG+n+tEA==
X-CSE-MsgGUID: PsMJ4T0LQ6CumoFh4iZBEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="215649820"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 03:20:02 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 03:20:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 03:20:01 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 03:20:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGfcYEJMdH46qrWap5RjDoUtCA8vRZC5cDX+mSTDD3U3S/yXH6EarCGDe5vgVi1BNAF4ohJh4sa84HX2yR6Jdv+NOvkEE2moLtjn5m5FvstVCXxuQWuul1KLVu3f8ZEAqol3VpGCPC6DYm0z6pTC6JDO8fJUv/IneYcyQTGUsCwxTPqo8GBw2ngfGE8JAb9KGD46yABu2qCXYPvsepbsTP0X7IGonAQyiIwUPBZ2CaJVFl7ebwwlaecNDMaV1O8yYFHsIbX+aQ3TpM7fBF9N9bxHZEiKjhIG1D05zSi7c9kX0rqmRw2vyXnA3v9Fd7lmE+6CJOC5XS7EHWAshDn/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eS2P2JZUWh4uYVfQHxo9Aqqzt990d+j6wql44qIldxU=;
 b=GIjN5vjck9mHvpZp1XvCrfSaL9o9QzXPTCntY45fXeP5EraVx5RoSVPn+G+pd38GPr33pmKjzb4H83HkuDpElyBSBbxmsKeTELRc4nA346MU4SkgDSs3x0X/2qyabXqneLUfHzmSzo8mPt+WLMDj0Oz4up9pvXkgKrRhOg2q6dst41XAp+mZbWaPDfwqfaptqvrihDhpU7AzGFpW1sYZAYVCi6u0yvik+WM9ua6zVIfHOaGX03kd2oQsw42O1jCTNkcaoC0yVcWunlAaP8Kj0Jl4SJjtfWc5YUpl57YnuA3W6hkdlahXj+Jzy2aO7/W5ZARL8TyTpusLm7z+K2udDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.14; Thu, 26 Feb 2026 11:19:53 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 11:19:52 +0000
Message-ID: <b81e0542-eae0-4983-8a5f-fa52c78a4f91@intel.com>
Date: Thu, 26 Feb 2026 16:49:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_async_flips: validate mode before
 proceeding with fb creation
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <karthik.b.s@intel.com>,
 <swati2.sharma@intel.com>
References: <20260225110510.1801049-1-santhosh.reddy.guddati@intel.com>
 <aaAI0zP8UVB6TAjS@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <aaAI0zP8UVB6TAjS@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::11) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|DM4PR11MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: f44ffc1e-9fbb-4f48-f35c-08de7528f64c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 2dhh4Z/t31AcUtE+eKEppRwDkmp3rK60aCRZUwVhzu3FXSVnffnehV1kXJbOW/9NafPIFvjTf1hDn1PNT8FbgNO6kdqiKH4Ubeu9RaWYJoS9Tum+OopKKEVmN5SdL7lpe+wvGXTdZzuxvCB4KAwLL2qpvXzoDxayWs/65U4BNRZwONaCzqyPVib7Vw3Zca40twCCPIBKXJiqcmKKFenDKRWdHaa+Supml3/ymYc78TAqI4KEwpalYtdL8ZsW8ULRo2uqduNKFR8/JsyNKzCgAwrmaCt75+bkDsjHu2uk6hRrDS0g/2G8XAGZ20kvU1AICNYe+AmTnJMhR6PLMBiasqKFDRPX70SPCTBG9VsbaLABe3LiacPEqC85tUTGFjUMPtZD00UjL4/ctLK0bK8+slRZB54jbvlUAzsp+xFgJPBcSXm9EfR2kloz3ABj/2JL8hCi06XwmYIRHHyqZ/7h4FB4v7P0ON8BX1goC/TeF2mTNyG737VHoHgoOSyGBGRP6ZLTo3HL3HjsjGiy/3/8k4JnA9AC39G41PBthEai8UWElAMCKSlcL8mli3TQmMENDBrJKBUrqNNlduZkJK2zBfccyUvSOIN+Eko8WcazIILsP0HE3ITS4W85Wi2E8rQJIKGGUb4QqRQ/sXUR3HK4vg4+bgm2A4IdUmWBDddaUUXfp771Q9lgQvUgDToXSbXC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEl0SjRuWkJEVkk2SVpyczBKRmo5OVRjR3IzM2xUWXJsenNHMFdINGhnb1cz?=
 =?utf-8?B?c3JaRTZXNW9hMVFyZXdmNHB1WEF5eGhqV1FxS3hQTVhBRVJDZGZuWnBFQ0t1?=
 =?utf-8?B?c2ZOcjRIR1lLQnN5WE5HZ2tHNlhrS1dRSGNLdnM4RjRScVBNbXZldFJIT3JH?=
 =?utf-8?B?TjEwWUhLeFVPSTJEZkJobnRmNlk1dHY5Y0tBbkZDMDl5YUNYdHVUYTJsUUZy?=
 =?utf-8?B?dDhkeCtVWUhrZ1ExdnFGNWhVQno3akh0ckUzY0FibS9GREVIRDMzbUgxSjBX?=
 =?utf-8?B?dHVNUG01MDg0MlF0cyszdXMzSG5Tck5mUEZvYkZMUm5hVURHcEVNbUNQcFVH?=
 =?utf-8?B?Yy9adERhd3hyK2JTV0xEN0xONUJoOWJBdFh1bjNhTHA2V2E3ME9pUkhvWFRD?=
 =?utf-8?B?a3hqVTlhdXdJM0pLTEV6U0pjbjg0eGZxbGl1cDNYNUQ1VHZwd0ZHdHhNZjlC?=
 =?utf-8?B?eEFtek5DTnZtMnp3SFEybTJBMTVIYVJ5ZjF2YysxaWxIaFhOd3lndmUzYnFo?=
 =?utf-8?B?Vk9qaFBGemhlU2JtOUJZdmJabTRpUjZ3R2RrSWgvSW1OZEZ0L0t4cFIxYkN2?=
 =?utf-8?B?a2pyYWp3NWN5T2YyVDBqRzI1QTF6V1NYZnY0eWNZcGxWWmVMYThKU21oTmFk?=
 =?utf-8?B?VWRxWHFETWcrKzNTVHVFUVBuZHlhVUZ4MHZRa1NyZlhwamtBSGdqZnY5RTdD?=
 =?utf-8?B?NFRobktsN3JZbDdWQUhsSm5rMDJWR1l2QUIzME5QSGczSDNEYVFJYjdpa1gr?=
 =?utf-8?B?eWtTVzRMMXQ4Z1JuZUFKTnJTVTMzamlGM3FVZlFGVDhtNEtsT1Q1L3RUM1BJ?=
 =?utf-8?B?TVh4VWRsL2g2UDRkemtvbmlmYXJxL0xHRkJUM0dJTjZnZnp4ME1ZcnhLcWdT?=
 =?utf-8?B?TWREeUhFWk5OSkNMTmt3aWtBYjBKbkwwWTRBZGNzVkhQNy83R3lpcmlPRUla?=
 =?utf-8?B?MGlSdStGSXV5YzRFaEZVQVFZVVA0NzdQbTVKNjhiZnZlS05DYmNPS2xxeVpF?=
 =?utf-8?B?ckVnVm1WTXZPRk9vVkVTbXM5a0liaWZ6b1JUMHZmRHd6eVJxSlNkZGp2Q0p1?=
 =?utf-8?B?b1M0VjRQRGFHcTloYmpFT2hjWjBhaU5hd1pxYlFrK1ZFOHU4L3l6TTFjNlly?=
 =?utf-8?B?MTk3a0xEa2xVc2UrdGRXeWxaN2hOT1FWSFQyUGsya1gxMEM4Qms0NjU4bjJF?=
 =?utf-8?B?TGFEWXBVZFJwWmxOREM0RzZ1Mm9pd1R1d2kwdnVBUnNQVXUrdXZkaGFSTUY0?=
 =?utf-8?B?dGVySlRkNUtGUGwyazVHb0ZHa1VFa09xS2VURlRhTkRaR3lLQzZ2amRCWTBW?=
 =?utf-8?B?R1dSSHB4cmdBbkRSeEJBN0NKM0ZEdGsvSXVrdWU2YlZVcy80SVVYQW8wVGVq?=
 =?utf-8?B?UUs2SWlRV0dNV1BtdC90OExYdWZXM0UycDYwNDZKVXZUQ0FtMWJYc0RsQzA2?=
 =?utf-8?B?LzQxSURXVDBVaVNhUXBQeGpWS3NvRzNESGF2cTNId2RCSm1uM3h3MDZFTmht?=
 =?utf-8?B?azI0TlNOVzJFZW4xZXliVHhGYkxzVlpkci8xdDBZUmxRNEFUTmFBTHgyRXBq?=
 =?utf-8?B?eEJmSW9KN01kWHpyTzlxTWZQSWpOZXIvckE3ak96YUwxVmIxRUduWW5kWUps?=
 =?utf-8?B?NTdkYnhlSTEyQW1ZTEErdWpGdWpLU1Q2dmZSUk1xaEtybFRLTWVlcnhKMmJE?=
 =?utf-8?B?RTh5R2U1bmxPUUJjYWtxVUkzbENrTDZRY2RWcEZSVE5BSklzbDJjenNQYy9Q?=
 =?utf-8?B?d1MwSE05OFJ3S0xxRm9hUnVVYTJwWUxZM1IvTTVuQ0Z0YlJGYW9GN1M0ek95?=
 =?utf-8?B?bXJiR2thbjIzSzk1aTNlQTJGdGtxSklPNEJicU5FZUphTy9HUnlTTnAva2F2?=
 =?utf-8?B?MW9tSDIxYzJXOXk4RHZpUkROcGdtcWFmVTlWV2R6cXkxM2FPNmw3TFRrWHdD?=
 =?utf-8?B?M2hYUTEzeGRRdUhaaytTNVFRSGpDMjNNaUdHbDBqN2ZPTkMzNHZvV05PME1X?=
 =?utf-8?B?TjI4aWJBQTYraWpTMzBLVTlEeE0rYlFtemthcVFmazhyMytudTVxeUl1dE5k?=
 =?utf-8?B?Q0MxbEtsYzRlcm41U1lpVVdBNFZ2Y1FTRjIrM1k0dXNBT0ZoTTF1dExKYjVn?=
 =?utf-8?B?L0RPN2pTU29UdXlEN0ZDNUFGSnRKdHFYR0RWUXJVYWFJbzVUMUYzOTdvU2g1?=
 =?utf-8?B?MllzUlZRaVFDUFQ0T29sMVZndDRLZ3FHMk14N1pyQWVZUE1hVWdpREhadk1p?=
 =?utf-8?B?Q0UzU2NmKzhTZ05SZ2tZWEM4RituQjIvSmVWK3FmdmVyako3VFlDOGludG5R?=
 =?utf-8?B?YlA0SVNhNVF6dUV2aExzaGZDaTVPTG5VdDdURlJJZ3NjRUc1Mi9xRlNKeVFD?=
 =?utf-8?Q?HA9JRcdsjMiwS5LTXGkgB+BKnjduMxA5fD7z+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f44ffc1e-9fbb-4f48-f35c-08de7528f64c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:19:52.5608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HUn85hbO/dsDNqjO0AOL06IlSPVtulcveHfZFvueeo1ecHsnNhSrQmrgagHghbtdb3UD7s+S2Fc7X1XEWHP0KrP7S5nhNj4zAD5+jv9eCUGXuF7XkzrNbeRjojle2x/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6335
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



On 26-02-2026 14:18, Ville Syrjälä wrote:
> On Wed, Feb 25, 2026 at 04:35:10PM +0530, Santhosh Reddy Guddati wrote:
>> Validate mode before proceeding with creating frame buffers to avoid
>> passing invalid parameters to the ioctl.
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_async_flips.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index 014b7f347..d00b36544 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -298,6 +298,12 @@ static void test_init(data_t *data)
>>   	igt_display_commit(&data->display);
>>   
>>   	mode = igt_output_get_mode(data->output);
> 
> How would that even return some kind of invalid mode?
> And why would it be a problem only for kms_async_flips?

Please refer to below gitlab issue which occurs very sporadically 
(Closed now)
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7043

I agree this igt_output_get_mode() doesn't return an invalid mode but in 
the failure logs, fb creation is done with width=0, height=0 , so as a 
defensive checck, this is added to validate here rather asserting in 
xe_bo_create.

It is not specific to kms_async_flips, but it just exposed in this test 
path.

Thanks,
Santhosh

> 
>> +	igt_require_f(kmstest_mode_is_valid(mode),
>> +		      "Invalid mode on %s (%dx%d@%d)",
>> +		      data->output->name,
>> +		      mode ? mode->hdisplay : 0,
>> +		      mode ? mode->vdisplay : 0,
>> +		      mode ? mode->vrefresh : 0);
>>   
>>   	data->crtc_id = data->crtc->crtc_id;
>>   	data->refresh_rate = mode->vrefresh;
>> @@ -327,6 +333,12 @@ static void test_init_fbs(data_t *data)
>>   	drmModeModeInfo *mode;
>>   
>>   	mode = igt_output_get_mode(data->output);
>> +	igt_require_f(kmstest_mode_is_valid(mode),
>> +		      "Invalid mode on %s (%dx%d@%d)",
>> +		      data->output->name,
>> +		      mode ? mode->hdisplay : 0,
>> +		      mode ? mode->vdisplay : 0,
>> +		      mode ? mode->vrefresh : 0);
>>   	width = mode->hdisplay;
>>   	height = mode->vdisplay;
>>   
>> @@ -672,6 +684,12 @@ static void test_invalid(data_t *data)
>>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>>   
>>   	mode = igt_output_get_mode(data->output);
>> +	igt_require_f(kmstest_mode_is_valid(mode),
>> +		      "Invalid mode on %s (%dx%d@%d)",
>> +		      data->output->name,
>> +		      mode ? mode->hdisplay : 0,
>> +		      mode ? mode->vdisplay : 0,
>> +		      mode ? mode->vrefresh : 0);
>>   	width = mode->hdisplay;
>>   	height = mode->vdisplay;
>>   
>> -- 
>> 2.34.1
> 

