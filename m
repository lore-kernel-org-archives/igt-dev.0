Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FC6CD6E4A
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 05:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB3C113865;
	Tue,  2 Jun 2026 05:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfdmDeO7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3E7113864
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 05:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780379370; x=1811915370;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=foEoTwYzm08d+SQN7AxSP8lGy8Y9GvA5Mh0XrV+LQkk=;
 b=lfdmDeO7T0qTotD4ufkTP9yx0d/2Evf4gK3Bg5M3N4P0pksuWUPzoI50
 tEdExssOhouPvDgKZdu833WC/N6SZVkTy/u4o3XkjyQi+jv47INdauHOC
 Jxkj4td1SwUYHvbJTNwJgCZpLCZZWigpGC6nfBhfEaE4yp5YWUhlckFiN
 0vtEi1xagyT27eyx9zw9SIqd8zBk9Uj2yh7oMsp0H2D+PWieUSD/u7F1V
 h6UmazAA70zpS6iO9rC6HZxl8hjz1HkfMjv5hPByflqjPxiX4Ws9r55P/
 ckIfoPX+JOkRZbI4P5hqZJTsxxOWtnzExiE5IilkEf8B+Eko8sesFFaUu w==;
X-CSE-ConnectionGUID: pye/+f+GT6abL13FcPsmNw==
X-CSE-MsgGUID: ZXDk5jJNQ6mbjdr5H76HrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81057661"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="81057661"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 22:49:23 -0700
X-CSE-ConnectionGUID: q2QtmpYsR82o+mqnyYapkw==
X-CSE-MsgGUID: tFiHBfrqQOWlMnY08NUAlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="267668437"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 22:49:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 22:49:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 22:49:21 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 22:49:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opMRtUPmEXga1aPddTGIb2Iq28SzpErcYC/a4upc9Wjv+3yEkTc89DnfvW1JyLB4O98MjZT1Z6ij/rpWlVIdv6abfJI9KUf2VEzIQ4l7WXHNPeshy60mXh3eaEsLnFQXiiD7aL/n1tNASd9/HaaeiQutwPP8PF56ruVDHinEZ6dDzPE9quXH7gxDSLMU3K+Vy2umDbQ7Nov6dFt/n88FglGS9rly+M8MO0Unay4RPd/uQFSggu6nCcCBmbWNX7tF+HZDvAT/2PuKrXe2B5pDd2g6NfiSfQI0poo4g6c5L5m30WISyqdGk4Es/PTruM6T6YndqyudhrtAaiAO57bptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+N0Sg5D98jfF48Nr/r21X2go97y04dIDsRlTWswmN4=;
 b=BfDZVOlt9Chq+pKvQFFwSC2Xe2Op+uwNl0ObiHe8boGfljkWnpFcR1NGbUU3/k8mYEKpDZj3gWMUMxBmbMj9NImKU9+QQ+20Ab09/r1cFdaYzgsonlXyl+ZvNtkraLDFkcMa/OAuh/8XZ/iLDtjArOelpZKtOId4oevS96pceHQ4GBsO2CZ6Dmijer2VBNHRviHqPHfYHIC1A2M6wjzJYbJoQZCrmPI2WXd7trNgE1mSpEEolUTLBYKZI0f0lTg9JndRZGW98x4X2FcYNkuTj6aG9l+kzpmoatXDSP5IvG8D04+wDcNlE4vjTUWlhRQjStr6zJ6sZK4j1Melfaf10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 05:49:11 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0071.011; Tue, 2 Jun 2026
 05:49:11 +0000
Message-ID: <14099ad6-d967-4a3b-ac64-999d1006ea0b@intel.com>
Date: Tue, 2 Jun 2026 11:19:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/3] tests/intel/kms_pipe_stress: fix plane
 source crop and separate cursor loop
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <ramanaidu.naladala@intel.com>
References: <20260527071940.3285269-1-sowmiya.s@intel.com>
 <20260527071940.3285269-3-sowmiya.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260527071940.3285269-3-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0203.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::13) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|MN0PR11MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 819968ee-6713-4e19-29d4-08dec06aabda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: XCgPF/gsF8HWcC0bT9G5+bzvWQaaM/p4XEntqoAqUQIh1cJ4Yaocy3w6L1nT0sFVPczytxY5A13KOnu8j65pXge18Hjesnb1qkQuy7pdBb0R2HPrEhM/Lf0xeGCsUApViHh1akdCRnHF1B2I8Q0OJKnUaB612yJpJlg1snffqL6xOA7OH21kOAD6jwb9sWz4NjAzFppOdDssm6bYcFHuP+kymL7TU+25OvyKXh8p/mCS7kOPJKxtn2MW1dPwUnKTpSX+Q2lfr56P7QVKnK2c/VVOhdE7c6qXve+391IaJlR05u9tqoM2o1VVrONgAEYE6moqlXOYw7uwAzD4wV9edMzOS6ZhZItnZy7DVmEO0Sl1MS0si4TMNQvZxZJQXPYramcNE+tsLcRZsYGxxYv1YTeh2asXiZ5E01KRHsrdA0E1bEG/Adm6+X8T5VF3UbNJTRlnI4h8JmT9daUc+Gba94WxxSKkUphttCo/YJwLlqiiU97KjhA3gF5KlTDkfgwT+m/GDGomWjC08cN5JEaZ3+PWAD6hkhyLRIXazoXC57wLxM1kaLDRP3rd1Wj6Rfp0hNYyXpNTca1FkjhHjxHuBfY+0CpJC0V1qQdJ/hpUTSAL3mHsE5GauRPSW3kuCiurIwsdObT3ki2XN1xYQcyZ1g8LoWwNiIcGCAqoQnVXdrdmG5ojCYMAbdKfeiMK5jbd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VURZbmdlNGdxRHFtNkEreHJRK1ZFUlA0TWh2Z0l2cDEyRFMwdUc1VnR1YU82?=
 =?utf-8?B?REd2Y015VG9Sd1lET2FFTFg4a1l6STBmSDNFalZmQ3czckdjK2d6bVVrekxy?=
 =?utf-8?B?c0JyWndNMER4Z3g5WTZIaHdiZTJ2ZEpoZURoWVI0cjc4NW4rQ0dwL21aY1Jt?=
 =?utf-8?B?eU10N3hFUVVqakd4T3ZZSVd1eStKbVBhNjJwNG1vZnJNdDVIcjRpdmZYcDJN?=
 =?utf-8?B?MjRRZEs1aVVxSnJCUVNPNWZIL2N5aUVKM2JBMHdCM2VRVDlZSDZIQVh1Znlt?=
 =?utf-8?B?eC95ZUZLTlRXaWEzVjVpc3VYZnN1RTZOOElxL0RQa01aWThlMkR3VEh6K0ZX?=
 =?utf-8?B?RGJ0YkxlTis4T2NJMDVPMnFkRTk3TWpOSlYvSHdXT1ROb3dZSFlTY0tvNzM2?=
 =?utf-8?B?WG1OK1Q5b0VGNUdIcFVCaVk4VGsvclhuS05HN0Z0QUFRc29tZklpVDl0M0Zv?=
 =?utf-8?B?akg3R1RialpvSTR5UFFWbXRLbTBoVUZWZDgvbG5sMCtXT0MvUGhaTGIrYVg4?=
 =?utf-8?B?dGk1eEd0a21kZ3JVVVVOVlhJMU1qSVZpTGYxNlhtZnRQcVlUOTdFS0JJU3Jj?=
 =?utf-8?B?NkMzT1JsOWdrbUppT3ZvMUJOWklXek5WcVVyWFVraUZkR1p4dzg5Z212dEEr?=
 =?utf-8?B?WmRkNHJGRldKZWViK2p1VXZTS3JBazR6b2gxMm16dWNha3hzclpodWFBYnFj?=
 =?utf-8?B?S2lyOSs4Yi93aW9Rd3hhVk1OVnpiT3E3YjY0SmllK0lEWlVZS0s3dmh6cU9x?=
 =?utf-8?B?dDRwWGt2S2JjTGdxcHNWWG5RQkdTTitITGI4dkxRSnU0azhrTFVMTkluWkVP?=
 =?utf-8?B?QkI3eTJxekRVUnZDS3U0V2lxYStDNlNuQnVNNlZsUnAwVkltYk41QTJHZ1RK?=
 =?utf-8?B?TkV4azd0b3l1a3lXR1M1Qnd4eTFqVm03SG1ZNUlxdjZ2NnQvdjlITmFFcG9q?=
 =?utf-8?B?Qkc5ZHR3eXV3bnY4R21nZDN5VnZranZCMFhVVGRGZUV6Uk5DODVEc0pyTUgy?=
 =?utf-8?B?NGNMSU1BVWYrcitET1IzSjlOM1g2eFIvaVNyQ1RTRW9LZmZMU0dOa0xkenBL?=
 =?utf-8?B?RGR1WHJKUjhIRFB4RVRTbWFoR0dTbzIxRVBoWm1mcjFHSko0TXVHeWN3ZWpB?=
 =?utf-8?B?d2s4dmlQSWNxZm9xTE9RRkl2dW1XZkJHdFEwaFFVNlcyZzNhcHdyNVFHU0Zj?=
 =?utf-8?B?TjlZSDlQc1RwNVd4QkNRSTZxem8yRWRMN2ptaE1OQ0ZoVzk5V05jWXQ3aUQ3?=
 =?utf-8?B?UVpWUVM3R3lRWms0YXJ1b25aV0o5Q2dOZmRPc2lnZGc3MkUydFNJNlBwRzNN?=
 =?utf-8?B?UFZIWFVpalB1NFNVVlJ3T1ltOWQwWGVlSnRNWVE1SUVlTTVpL1hsUTVua2c2?=
 =?utf-8?B?TGZXNU80YkNBYTNNRmpMLzFFMm1MSXNSZ1h0bkozRit3UnJta3Z4VnEvV1RK?=
 =?utf-8?B?QzNOUXU0OU5UNlBZUStIODdnNmt4aFR6VWd4K1VmYWxYQit5d0pmNjV0SG1v?=
 =?utf-8?B?NHpMT213eUdONCtvQVdnb2NwM2dFeFhERm5sZmdFSTRhTEVYSUlZK1lWVnpQ?=
 =?utf-8?B?OGFucWk4djNjL052U05FQ3A2Z3hjSkFneHAxNmtiNVpaYllHeEtXZmlaMHpq?=
 =?utf-8?B?THNET2p4cTgvWDZqU1FmcmRja0tRU2liMTF6cjlxdldmaWphek4wbHB0MElC?=
 =?utf-8?B?Y2tjZVJVUklYb3ZwTGdWR01BdTFvd1c3V2dYUERQWjFDWGdySzdZSGxZRHh4?=
 =?utf-8?B?OEJldjZET3h5c2hPVnI2YytRMS8rdHpMdmZYQVYxWWR6QWFkdUhHY3U2NVJ2?=
 =?utf-8?B?MEo4MUFwLzBVN3hGNjJvNldYVWJZK2pkUExBaUkydHpXSVdsQjFMYnBPbmhR?=
 =?utf-8?B?dURDdjJBekpCWG9ycVl4R21aY285OFV5dzRMclU5K3UxTmhDWkdsVHU2S080?=
 =?utf-8?B?NXRYdzhTRlRVMk9qWmhDOFpyLzl5Z016b1hKb2EvcmNxL0RBM1N2blV3czN1?=
 =?utf-8?B?RGFYTWhDd2djaWltUTFMOVFhZE1xTDgzdUhWZ3FMZ09tMEprSnNyUUJVUEgz?=
 =?utf-8?B?bEJtUGxWa00yZXM0RVNWbGdnVjJJdHI3S3RGM1FJUnlQNEtlR1AxMk9raUx6?=
 =?utf-8?B?NVVrTVhyTWUraitzS3VjUVpOQjYrb0FWcFlualhVVWJWWmNnbmllME14Rmdo?=
 =?utf-8?B?cXNUUjJVYW1DK3Q4dzRwOGJCRk50czliZmREL2thY1pGaGU4UVdrR2llRWpL?=
 =?utf-8?B?SkorbnVLaEhhbmpGYWNEZG5IU1RvRXMyOUluWWU3YUk3T3lUQVBwUEdxZjh5?=
 =?utf-8?B?UU1wc3F2QzRJTjFVYVFFSEtCZXlMa1k0KzBiaERDaHRiMTIxSlVEUT09?=
X-Exchange-RoutingPolicyChecked: HWg7NVs+2auhlNowwgf8vRUvz2Ydflivfs3gdEH6Mdvfa6FjsVd4rGDzxYteF545d+2k/easOTAyrQ+2qo1bRbR55Ou0xQ+7y5CT2WsdfIcMcOaaMyRKodcvpirgIHApgLCS/LOcjHtkMNLoazLJIji2sieIwtVxLiVduS9r5ZqrtQ+5ECivDUYLUMnn5PtsjrUeseZw13BiMCIyNrXOjtUSvEFfnv18ONcSOSx2c+9togE7drOvyWBMhNJkpQbnkR5IZ6revZ5D6fzyKOqxEsXJzFYS1F670RhjqLsZbp0FfADw4nf5gtmIehBiC6eaGhaq9eUuegvPrd6hBt6BHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 819968ee-6713-4e19-29d4-08dec06aabda
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 05:49:11.7363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WU9nPeM+IeEUdfWRPWZ4+WqdwcwhhtZwtR4HN7hFMGHO5TUTJoWqVPqz7Dqc35u3+BdnthuUO4wiRJnK8de7MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
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

Hi Sowmiya

On 27-05-2026 12:49 pm, Sowmiya S wrote:
> Pass 3/4 destination size as initial source crop to
> universal_plane_set_fb() to avoid an immediate
> downscale. Keep source in sync with igt_fb_set_size()
> in the reduction loop so the downscale ratio never
> exceeds the hardware limit (~3x).
>
> Move cursor handling out of the overlay loop into a
> dedicated second for_each_plane_on_crtc loop with a
> DRM_MODE_ATOMIC_TEST_ONLY commit.If the test commit
> rejects the cursor (e.g. unsupported format or modifier),
> disable it gracefully so the final commit with only overlay
> planes can succeed.
Please split the patch into 2
>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>   tests/intel/kms_pipe_stress.c | 110 +++++++++++++++++++++-------------
>   1 file changed, 68 insertions(+), 42 deletions(-)
>
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 8724a674c..a84433b9d 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -425,57 +425,83 @@ static int crtc_stress(struct data *data, igt_output_t *output,
>   	if (!data->num_planes[crtc->pipe] || !new_mode)
>   		return 0;
>   
> -	for_each_plane_on_crtc(crtc,
> -			       plane) {
> +	/* Set up overlay/primary planes up to the configured limit. */
> +	for_each_plane_on_crtc(crtc, plane) {
>   		int plane_width, plane_height;
> -		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
> -			cursor_plane_set_fb(plane,
> -					    &data->cursor_fb[crtc->pipe],
> -					    cursor_width, cursor_height);
> -			plane_width = cursor_width;
> -			plane_height = cursor_height;
> -		} else {
> -			universal_plane_set_fb(plane,
> -					       &data->fb[crtc->pipe * MAX_PLANES + i],
> -					       mode->hdisplay, mode->vdisplay);
>   
> -			plane_width = (mode->hdisplay * 3) / 4;
> -			plane_height = (mode->vdisplay * 3) / 4;
> +		if (plane->type == DRM_PLANE_TYPE_CURSOR)
> +			continue;
>   
> -			ret = try_plane_scaling(data, plane, plane_width, plane_height);
> +		plane_width = (mode->hdisplay * 3) / 4;
> +		plane_height = (mode->vdisplay * 3) / 4;
>   
> -			while (ret) {
> -				if (plane_width <= cursor_width || plane_height <= cursor_height)
> -					break;
> +		/*
> +		 * Set the source crop to match the initial destination
> +		 * size (no upscaling).  Keeping source == destination
> +		 * prevents the downscale ratio from exceeding the
> +		 * hardware limit (~3×) when the destination is halved
> +		 * in the reduction loop below.
> +		 */
> +		universal_plane_set_fb(plane,
> +				       &data->fb[crtc->pipe * MAX_PLANES + i],
> +				       plane_width, plane_height);
>   
> -				plane_width /= 2;
> -				plane_height /= 2;
> +		ret = try_plane_scaling(data, plane, plane_width, plane_height);
>   
> -				ret = try_plane_scaling(data, plane, plane_width, plane_height);
> +		while (ret) {
> +			if (plane_width <= cursor_width || plane_height <= cursor_height)
> +				break;
>   
> -				igt_info("Reduced plane %d size to %dx%d\n",
> -					 plane->index, plane_width, plane_height);
> -			}
> -			if (ret) {
> -				igt_info("Plane %d pipe %d try commit failed, exiting\n", i,
> -					 crtc->pipe);
> -				data->num_planes[crtc->pipe] = i;
> -				igt_info("Max num planes for pipe %d set to %d\n",
> -					 crtc->pipe, i);
> -				/*
> -				 * We have now determined max amount of full sized planes, we will just
> -				 * keep it in mind and be smarter next time. Also lets remove unneeded fbs.
> -				 * Don't destroy cursor_fb as will take care about it at the end.
> -				 */
> +			plane_width /= 2;
> +			plane_height /= 2;
> +
> +			/* Keep source crop in sync with the reduced destination. */
> +			igt_fb_set_size(&data->fb[crtc->pipe * MAX_PLANES + i],
> +					plane, plane_width, plane_height);
> +
> +			ret = try_plane_scaling(data, plane, plane_width, plane_height);
> +
> +			igt_info("Reduced plane %d size to %dx%d\n",
> +				 plane->index, plane_width, plane_height);
> +		}
> +		if (ret) {
> +			igt_info("Plane %d pipe %d try commit failed, exiting\n", i,
> +				 crtc->pipe);
> +			data->num_planes[crtc->pipe] = i;
> +			igt_info("Max num planes for pipe %d set to %d\n",
> +				 crtc->pipe, i);
> +			/*
> +			 * We have now determined max amount of full sized planes, we will just
> +			 * keep it in mind and be smarter next time. Also lets remove unneeded fbs.
> +			 * Don't destroy cursor_fb as will take care about it at the end.
> +			 */
> +			igt_plane_set_fb(plane, NULL);
> +			cleanup_plane_fbs(data, crtc, i, MAX_PLANES);
> +		}
> +
> +		if (++i >= data->num_planes[crtc->pipe])
> +			break;
> +	}
> +
> +	/*
> +	 * Always attempt to enable the cursor plane.  First validate it with
> +	 * a TEST_ONLY commit: some format/modifier combinations (e.g.
> +	 * XRGB8888, 4-tiled) are not accepted by the cursor hardware.
> +	 * If the test commit rejects the cursor, gracefully disable it so
> +	 * the final actual commit with only overlay planes can succeed.
> +	 */
> +	for_each_plane_on_crtc(crtc, plane) {
> +		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
> +			cursor_plane_set_fb(plane,
> +					    &data->cursor_fb[crtc->pipe],
> +					    cursor_width, cursor_height);
> +			if (igt_display_try_commit_atomic(&data->display,
> +							  DRM_MODE_ATOMIC_TEST_ONLY |
> +							  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL)) {
>   				igt_plane_set_fb(plane, NULL);
> -				cleanup_plane_fbs(data,
> -						  crtc,
> -						  i,
> -						  MAX_PLANES);
> +				igt_info("Cursor fb not supported by hw (format/modifier), disabling\n");
>   			}
> -
> -			if (++i >= data->num_planes[crtc->pipe])
> -				break;
> +			break;
>   		}
>   	}
>   
