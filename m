Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76782C61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 09:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06B810E3C6;
	Tue,  1 Sep 2026 09:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJladh9L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7110610E3C6
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 09:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788255822; x=1819791822;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/7iinGZDS11NGLfPUlOIW50cq5sADCdojsvOMtbnAX0=;
 b=mJladh9Lu+aU5k1StaN4uM0KNYsT6hzCkbwYaW9MNW0FFw+n62bHCpY8
 eQVllt75XXXkh5pZHmqi1R1tGyKVuqmxazKNGiXQVArUvuCchUUzgJiL5
 OZUZ4P5nQJAVlNA2biCk3sVb2qvSeDteEWtl71oiCVEtAiH8K+g5g4sF4
 Rp+EBo9cN+rq0kFk5vAJ4PFbFI9ya6oKN3RtCAoLOrlzphSuhR9Nr97FR
 stBGJua95i8Yp549v4UgTZJt6h8J04Xj9fkvmOyi8+nz0cjiA6+IeWmZr
 1NPo2HRL5fV/o55fr/ocJKkeAX1w/5pg0Lqy8KpHmwgkZW4QsEFknmf9B Q==;
X-CSE-ConnectionGUID: bcJydM/3SI6161fJ08X0cQ==
X-CSE-MsgGUID: C9x70VQPRFqW0nrlHU7mAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="106051624"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="106051624"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 02:43:41 -0700
X-CSE-ConnectionGUID: K6LXM7nbQPW/9YDD7GNwqQ==
X-CSE-MsgGUID: pfdUAut4TumGXJS5fky9Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="293880676"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 02:43:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 02:43:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 02:43:40 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.64)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 02:43:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCHIMA5qFiNdVNFIY/uo6inwBliMt4Hk9DpVZOJebQdleC41BEA0mEgPSVJD61WteoC7+aRdUMuLfrnV6O77YvTEdTXGzU8MKxYMeLjy5ma/uqmxml/y8bqIHrGiKJvrMwxiOf2I7jfFT2oEYgvr7CzByImsn3dAl8ihIXlSV0JY/YUWGsTuXe4uCv6hj5bOzUYv0ao1+yh7vrWYzywLpiTm9IHmbehcCVIaPnG9mu9Rf+AbCgX5GxmdkKYwTqUnFJGFfGM+lgWgY+BsC6mjdKwHSPCctoy9KLOwayNZtRRrGBg3+p/xRLnpybQFgD4QL3LWvwpRMNP/c1u4EDJa+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIpt1NI87hjZITAn7oHLP5MrY6u73KSSQNimQboOwgg=;
 b=E80nc9MJtLjd71kzf48dtXNk9S1xBYAxl8Vs1qiWNQeSBueT0MMbLlHjV2Pu+ZXOY2x1rbHjeGG4pxwbLgVuY9VIRyr2JCH2JebtnduegFEvdNMR5ZQJy+yR4sUdOi15i1At00VuWJ2P05ASVq06G8l7CuL6kcatKbXQZoVlqrmb9h7KtR3pcMdaa4QWA0cVVSPmvYqxfhZqMbEJ/txKdyWHEyEY8ce/+2bWQpbQi8efi1nfMVc5DrT/buacvCZVdFcHeAmRhz8ZRyyCybXzvA0dFUcwcvbZv9VdiBGko+WXjN5gJkfQDHgtmj4xJIEY3DaIifa+LloYc37r0AFhOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 PH0PR11MB9703.namprd11.prod.outlook.com (2603:10b6:510:399::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 09:43:38 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 09:43:38 +0000
Message-ID: <c7fd5d87-266b-42e5-9410-3ea05811f884@intel.com>
Date: Tue, 1 Sep 2026 15:13:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] lib/igt_drm_netlink: add get_error_counter
 support
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-5-ravi.kishore.koppuravuri@intel.com>
 <1ff57ea1-8351-460f-919a-88c817a3c2d0@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <1ff57ea1-8351-460f-919a-88c817a3c2d0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::10) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|PH0PR11MB9703:EE_
X-MS-Office365-Filtering-Correlation-Id: f90cb885-4f0a-41b2-a973-08df080d7ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: QOIi+wKgP9LWusH+YNlToknK/CcIYOu1pxKvBB9Fey5qa12AQCr6q138Cxiy4GBPQ0JDatfwh8XEEjgRLgBLdrCjJY1JnBxHcc8qWeZQkd9HIwKzbbMauTGzCWOh5P9W3vFFgqs3yF/VfbyF8xL6ery9zHj7yyofOauadqvvKAgcu1AwO5RCS+yEZZbcQ+nM2gungvM0+M2vbkaS6IBFx9TNKZvOkIlTxINxc7rZ3/nyEq1z8TwUhavLo+JpYqG1A6RKDW07F23vfXB0Xln0N5nvvBvitKEQLbs+kjpWLvsMJUrD0u5M7FLQ0XNVNaG5H0h4WqvCrGVLFWfTZ0JX/p27e1yXCL4q7WNMDluxyxEDvYtGGS6JP90TU+TshBt/FjfVUrf8KiurollxaaarAevNP9rCRJ1e9WWEYt/DbsCxnYZD/mHh8pLsxcHocx597S4B8bXEmszjGNHceiNTgogsuLmfJB6s2H2pL20CWi5j4oMQpMCkNGVxOQgPN5QtbHUkfaKFgRoqPFBkVVXod8swmrm1UHV8wAevXl5WOKuXgZNJHdDEgKvzkg4lLDU8hLCqp4qNBeGN48pMYVwMJXsEb0AOdKvmGEXoSyepYy/WMQyV5/rkv2iBSFZMGWlpsv0dlL2D+PYnb8fdsqIJRHyGQRWtzbhRUgBV4KpQ4JY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWtPMXU3bTdDaVNPUEZ0QWtuVEQwYzNrbXptT0U4anMzWVViZmdpeHV6a1R6?=
 =?utf-8?B?M0hTR003eVgrOEVWWG1DVUNHa2VEcnBoRjRoQnBqMndrc1JndW5HYnppbUdM?=
 =?utf-8?B?MFpMTy8xem5NTmY2N2lmUDhOS3Nkc2wxQ2NVN28vYU1oaEJCTjM5L1V2Z1Fy?=
 =?utf-8?B?eXExbUdueUlicHpxOThSak4wSnhzMjArV1pURjUza2xMTnFhcEppWlp0RVJM?=
 =?utf-8?B?OTBERW4wL2FiYWpNWlY4YjlKMDRUV1BFeHI4ZXlSRjV6WGkzS3M0MnBzaUt6?=
 =?utf-8?B?OC9tRGZCRGs0QmpaU2Y1d0dvbkhIZlZLaHpraTZOaG5BQUxuK2Uvcmg2ZzNm?=
 =?utf-8?B?VmMvWTlENHV5TkhHeTJKa1NqZ21RanJMcU9sU1NXaG1vNlJ4dE1QL2IyT0Zz?=
 =?utf-8?B?VHJuZkMzN3J3a1ArZWtzLzc1bVhhUDhsZWRpS2RyQUJEUk4yZ0RQd1BLRE55?=
 =?utf-8?B?TUxHQjZpTW5tUWNTMkU5TVBuUkhlZmRIMk54eVBBK3E4VU9kaUJkVUhZMC9L?=
 =?utf-8?B?MWxwUFBEa0pza2Z5SjFCaVM1VUs1TTRjTU1FOUxISXgrQUF5VkxIMC84aDd3?=
 =?utf-8?B?U2czdk5Dekc5Q2VReGV3Qm1pV2RMMngyYnZtZlhHSXdMNDNtRDZOMWwwM2ND?=
 =?utf-8?B?NEh1WExFMlJETXhRQWkxRVVYaC9vaXR0Z3R1YWNaSUZvTWxLWXdkWHFHV1Vx?=
 =?utf-8?B?dW9sNEg2YXFvbFVBYWtiY0ZyV3VBa3QxRU5idlJhUTNBSm9hVFArRTQ2QTl5?=
 =?utf-8?B?Q2lqdGxMNzgvMEVQb0VVbXIwcU9QRkpnK3k5NEZEVFB1VlhTN3paa1BiOGtp?=
 =?utf-8?B?OVhPTUIrNTlycjA0dDhOT2lRK2ZOei9LbjhLanZRTG1ZT3Q5a1orRkNSb084?=
 =?utf-8?B?c1gvZDdhclIvZ0JBZE5xWkd3QTF1a2FZTWNZQkJXdC8vMlA1emswSjl5UHBs?=
 =?utf-8?B?aUJGS1VnQ2t4bkY0NXlxZ05GdXpETXdwbGU2UVdhVjhKLzF3TEhja0lzMUNk?=
 =?utf-8?B?R0kxbkVRcXRYelVIV29udHJxbkx3UU5QaVNucG41d0ZHalRiSFBVTjY1TmVp?=
 =?utf-8?B?bkM1a2RXN0tDbVVzRHlJUUZzOG12LzNxREN4RXNmbmV0SmdBY2doMFRtY1Qr?=
 =?utf-8?B?TlVmK3NQWjRNcXJVQkNpMzRmYVNNcFczckxGT3A5MWdkMVBHR1VXRTJOQnpK?=
 =?utf-8?B?US85c0lrRk1IOE9xd29jZkRYcHB4UmJlbldVdk9WOTZ6N0RvYzFVMHRRYlBq?=
 =?utf-8?B?ZUJJYlhIZEhXK2N3T1U2azdWMUd1UXc2TWFQVjVDQi85OFlUa0FCV2dmSnpw?=
 =?utf-8?B?bjlpRXpGeHo3Z1FUZWpXOEJYenBQMVR5SGI5S0p4WVNhNUZwOUhRWW1GTmg2?=
 =?utf-8?B?YXAvTWdNdWxDZGFWZmxrNnE0UDE2KzV4T05jZ0hpZnBTdXNwc1VkUHpWV0ow?=
 =?utf-8?B?eG9JVHJpR1hhQXZkaG9zeWZ0MnowL0dFY1paTzBUUHhEMGcrOUdyYnV0aVFw?=
 =?utf-8?B?WjJueUVMR0dkWFI0SUh2NHdhUGFiNWgwWXA5UVBSRzhzdjFJRkxVRWFoQjFR?=
 =?utf-8?B?c0Jld08yc0w4b3d3UGkwR0NTTzMwMWFoWkNOVC9GN2JHSlNyVUk4NzI1U2k0?=
 =?utf-8?B?M053L1N4aG41OFN3c2w1U253bFBCT3BvWjhMbm1XaWNzOHN4UHV1N0h2N0NN?=
 =?utf-8?B?cFN0K3hWMWdRMG5lcWRhQkZBWDczVExLMzE2UkNwN21OdWx1bFNxank5cjBI?=
 =?utf-8?B?Vm9mU1MwV0E1Wmh2NS9iUXA3eDZJZERUTlBsVEFQSXg0SWZwSmJtWkJ2VEdI?=
 =?utf-8?B?S2c1dTJLQWdUQkZoQzZkb0s1Ujk1Z2VkVjVKVmQwc0lxLzZQVUlxMXYxekRF?=
 =?utf-8?B?NkpCdlF0TUYzQ0RMYnVBVFI5UHFRbWZZZ2hvc00velF1M244WXJrRU4xV0oz?=
 =?utf-8?B?ZFdLOHFjS1JoZGVVMVBWZmdjVG11eXRIVkJKK0VNK01mTWVReTNONm81eHBL?=
 =?utf-8?B?VU9rSEQ1d0ZNb010d1Y5RnNabzUyWUpISmVTQ3hPTWdYQS81Y09Jc0RReXM3?=
 =?utf-8?B?d0QxSThDTmtvWXl3aVJoY2tTZ1dVMjI3b2I2N01mM0dRYjg3dkRXS0wxMHp0?=
 =?utf-8?B?Zm5YQy93Z3c1VVU0NGcrbmVJYjR5R0tLeFBmNHVQdmRYTjhnRlNJRGJwa0w3?=
 =?utf-8?B?Uit3L0x6NnRlTS9Fb2JwQTI3aXc3M3dINWJxdEo4NlNFM25zcG9zU05yMGZU?=
 =?utf-8?B?MEN2S3cyME9CaGpBOGE3ME5OY1dvbGZzNklRdXQyZkZxYU5CeDB6VWhYcTll?=
 =?utf-8?B?eXJST1BrTlRGMlpMVStMaFZybjlLMXUrNFVQOFRFK2F4M0FuNkpXMDJOSUZS?=
 =?utf-8?Q?116+mRDUd2lVbhxxOSbV+RfcgrGU0v/KfxQKD?=
X-Exchange-RoutingPolicyChecked: 1sdxnVrtZQ5HMumBpM0pe2czxqP38XZffj0cyiZkBbxEXo3uJHLxEeikPa7DWJfjBhzxwIGx/z3KQoBs6yp5gSOq21EV2ho8AYim70qBMApP+3DrzQbzZMwMYoYoEBP5c6HFD7OwKtvZdHd3zaWZilvyQEJwqXKwv8I0Q/oLTDjLnkCdwqOmUlEdqi37aLAjkEnw7329leeoLAJNzK735p4BsXvcHd2DcMH4QHS0owchp1cIUO6V4wsQCs2pPuFIVCe329M0kfJqX+Nb6g+ou5LtrQP9NyOeur+C3QZV8D1JTKEQNRPiFDtD/OJf5XOR95Fm3584Y9C3ky9n9yYlyw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f90cb885-4f0a-41b2-a973-08df080d7ffa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 09:43:38.5845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MygiYjw7e4ClZoDIlLIvbvS/crBWPEV7vMv08k43KQbacCMgMZUbkecZCoKOx6NaN5sJy2Fn0MMiBg1tJscl0eTAW3ffiiniabBJxlTCVAkGduh2lpqaye99wjJOkuHy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9703
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


On 31-08-2026 21:28, Purkait, Soham wrote:
> Hi Ravi,
>
> On 24-08-2026 22:11, Ravi Kishore Koppuravuri wrote:
>> Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.
>>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v2:Handled ACK/FINISH/ERR nl responses using separate callbacks
>>     Added a check whether error_value updated by valid callback or not
>>     Added a check whether response required for the command or not
>> ---
>> ---
>>   lib/igt_drm_netlink.c | 264 +++++++++++++++++++++++++++++++++++++++++-
>>   lib/igt_drm_netlink.h |  14 +++
>>   2 files changed, 276 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>> index fec1639b4..76223f3de 100644
>> --- a/lib/igt_drm_netlink.c
>> +++ b/lib/igt_drm_netlink.c
>> @@ -5,6 +5,7 @@
>>     #include <stdbool.h>
>>   #include <stdint.h>
>> +#include <errno.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>> @@ -17,6 +18,225 @@
>>   #include "igt_core.h"
>>   #include "igt_drm_netlink.h"
>>   +static int ras_command_cb(struct nl_msg *msg, void *arg)
>> +{
>> +    struct app_context *ctx = arg;
>> +    struct nlmsghdr *nlh;
>> +    struct genlmsghdr *gnlh;
>> +    int ret;
>> +
>> +    nlh = nlmsg_hdr(msg);
>> +    gnlh = nlmsg_data(nlh);
>> +
>> +    switch (gnlh->cmd) {
>> +    case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>> +        struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>> +
>> +        ret = genlmsg_parse(nlh, 0, attrs,
>> +                    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
>> +        if (ret < 0)
>> +            return NL_SKIP;
>> +
>> +        if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
>> +            return NL_SKIP;
>> +
>> +        ctx->error_value = 
>> nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
>> +        break;
>> +    }
>> +    default:
>> +        return NL_SKIP;
>> +    }
>> +
>> +    ctx->reply_received = true;
>> +    if (ctx->ack_received)
>> +        ctx->cmd_done = true;
>> +
>> +    return NL_OK;
>> +}
>> +
>> +static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr 
>> *err, void *arg)
>> +{
>> +    struct app_context *ctx = arg;
>> +
>> +    ctx->last_nl_error = err->error;
>> +    ctx->cmd_done = true;
>> +
>> +    return NL_STOP;
>> +}
>> +
>> +static int ras_ack_cb(struct nl_msg *msg, void *arg)
>> +{
>> +    struct app_context *ctx = arg;
>> +
>> +    ctx->ack_received = true;
>> +    if (!ctx->response_required || ctx->reply_received)
>> +        ctx->cmd_done = true;
>> +
>> +    return NL_STOP;
>> +}
>> +
>> +static int ras_finish_cb(struct nl_msg *msg, void *arg)
>> +{
>> +    struct app_context *ctx = arg;
>> +
>> +    ctx->cmd_done = true;
>> +
>> +    return NL_STOP;
>> +}
>> +
>> +static int register_callbacks(struct nl_cb *cb, struct app_context 
>> *ctx)
>> +{
>> +    int ret;
>> +
>> +    ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, 
>> ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ras_ack_cb, ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, ras_finish_cb, 
>> ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = nl_cb_err(cb, NL_CB_CUSTOM, ras_error_cb, ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    return 0;
>> +}
>> +
>> +static int send_and_recv_nl_msg(struct app_context *ctx,
>> +                struct nl_cb *cb,
>> +                struct nl_msg *msg)
>> +{
>> +    int ret;
>> +
>> +    ret = nl_send_auto(ctx->sock, msg);
>> +    nlmsg_free(msg);
>> +    if (ret < 0) {
>> +        nl_cb_put(cb);
>> +        return ret;
>> +    }
>> +
>> +    /* NL Reply and ACK arrive as separate responses */
>> +    while (!ctx->cmd_done) {
>> +        ret = nl_recvmsgs(ctx->sock, cb);
> If it is blocking, as this is being used by send_command, it will 
> block the process for
> ever if no netlink message is received.
> In that case isn't it possible to set this nl_socket in non blocking 
> mode and poll the messages?
I will add timeout here in the next revision. Thanks
>> +        if (ret < 0)
>> +            break;
>> +    }
>> +    nl_cb_put(cb);
>> +
>> +    return ret < 0 ? ret : 0;
>> +}
>> +
>> +static int send_command(struct app_context *ctx, uint8_t cmd)
>> +{
>> +    struct nl_cb *cb;
>> +    struct nl_msg *msg;
>> +    void *msg_head;
>> +    int ret;
>> +
>> +    msg = nlmsg_alloc();
>> +    if (!msg)
>> +        return -ENOMEM;
>> +
>> +    ctx->last_nl_error = 0;
>> +    ctx->cmd_done = false;
>> +    ctx->reply_received = false;
>> +    ctx->ack_received = false;
>> +    ctx->response_required = false;
>> +
>> +    msg_head = genlmsg_put(msg,
>> +                   NL_AUTO_PORT,
>> +                   NL_AUTO_SEQ,
>> +                   ctx->family_id,
>> +                   0,
>> +                   NLM_F_REQUEST | NLM_F_ACK,
>> +                   cmd,
>> +                   DRM_RAS_FAMILY_VERSION);
>> +    if (!msg_head) {
>> +        nlmsg_free(msg);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    switch (cmd) {
>> +    case DRM_RAS_CMD_GET_ERROR_COUNTER:
>> +        ctx->response_required = true;
>> +        ret = nla_put_u32(msg,
>> +                  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>> +                  ctx->node_id);
>> +        if (ret < 0) {
>> +            nlmsg_free(msg);
>> +            return ret;
>> +        }
>> +
>> +        ret = nla_put_u32(msg,
>> +                  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>> +                  ctx->error_id);
>> +        if (ret < 0) {
>> +            nlmsg_free(msg);
>> +            return ret;
>> +        }
>> +        break;
>> +    default:
>> +        nlmsg_free(msg);
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    cb = nl_cb_alloc(NL_CB_DEFAULT);
>> +    if (!cb) {
>> +        nlmsg_free(msg);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    ret = register_callbacks(cb, ctx);
> Imho setting the callbacks only once makes it more cleaner.
These callbacks are specific to the operation. Hence I am calling the 
specific callbacks for the requested operation and not registering them 
at the init.
>
> thanks,
> Soham
>
>> +    if (ret < 0) {
>> +        nl_cb_put(cb);
>> +        nlmsg_free(msg);
>> +        return ret;
>> +    }
>> +
>> +    return send_and_recv_nl_msg(ctx, cb, msg);
>> +}
>> +
>> +static int init_app_context(struct app_context *ctx)
>> +{
>> +    if (!ctx)
>> +        return -EINVAL;
>> +
>> +    ctx->sock = NULL;
>> +    ctx->node_id = UINT32_MAX;
>> +    ctx->error_id = UINT32_MAX;
>> +    ctx->error_value = 0;
>> +    ctx->last_nl_error = 0;
>> +    ctx->cmd_done = false;
>> +    ctx->reply_received = false;
>> +    ctx->ack_received = false;
>> +    ctx->response_required = false;
>> +    ctx->family_id = -1;
>> +
>> +    return 0;
>> +}
>> +
>> +static void cleanup_app_context(struct app_context *ctx)
>> +{
>> +    if (!ctx)
>> +        return;
>> +
>> +    ctx->sock = NULL;
>> +    ctx->node_id = UINT32_MAX;
>> +    ctx->error_id = UINT32_MAX;
>> +    ctx->error_value = 0;
>> +    ctx->last_nl_error = 0;
>> +    ctx->cmd_done = false;
>> +    ctx->reply_received = false;
>> +    ctx->ack_received = false;
>> +    ctx->response_required = false;
>> +    ctx->family_id = -1;
>> +}
>> +
>>   void igt_cleanup_nl_socket(struct app_context *ctx)
>>   {
>>       if (!ctx || !ctx->sock)
>> @@ -24,14 +244,20 @@ void igt_cleanup_nl_socket(struct app_context *ctx)
>>         nl_close(ctx->sock);
>>       nl_socket_free(ctx->sock);
>> -    ctx->sock = NULL;
>> -    ctx->family_id = -1;
>> +
>> +    cleanup_app_context(ctx);
>>         igt_debug("Cleaned up netlink socket.\n");
>>   }
>>     int igt_init_nl_socket(struct app_context *ctx)
>>   {
>> +    int ret;
>> +
>> +    ret = init_app_context(ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>>       ctx->sock = nl_socket_alloc();
>>       if (!ctx->sock)
>>           return -1;
>> @@ -58,3 +284,37 @@ int igt_init_nl_socket(struct app_context *ctx)
>>             DRM_RAS_FAMILY_NAME, ctx->family_id);
>>       return 0;
>>   }
>> +
>> +int igt_get_error_counter(struct app_context *ctx)
>> +{
>> +    int ret;
>> +
>> +    if (!ctx || !ctx->sock || ctx->family_id < 0)
>> +        return -EINVAL;
>> +
>> +    if (ctx->node_id == UINT32_MAX ||
>> +        ctx->error_id == UINT32_MAX ||
>> +        ctx->error_id == 0) {
>> +        igt_warn("Invalid node_id (%u) or error_id (%u) provided. "
>> +             "node_id should be >= 0 and error_id should be >= 1.\n",
>> +             ctx->node_id, ctx->error_id);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ctx->error_value = UINT32_MAX;
>> +
>> +    ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (ctx->error_value == UINT32_MAX) {
>> +        igt_warn("No valid error counter reply: node_id=%u 
>> error_id=%u kernel_error=%d\n",
>> +             ctx->node_id, ctx->error_id, ctx->last_nl_error);
>> +        return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
>> +    }
>> +
>> +    igt_debug("Retrieved error counter: node_id=%u error_id=%u 
>> value=%u\n",
>> +          ctx->node_id, ctx->error_id, ctx->error_value);
>> +
>> +    return 0;
>> +}
>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>> index f681a3a81..92ac665e2 100644
>> --- a/lib/igt_drm_netlink.h
>> +++ b/lib/igt_drm_netlink.h
>> @@ -9,17 +9,31 @@
>>   #include <stdbool.h>
>>   #include <stdint.h>
>>   +#include <linux/genetlink.h>
>> +
>> +#include <netlink/attr.h>
>> +#include <netlink/handlers.h>
>> +#include <netlink/msg.h>
>>   #include <netlink/netlink.h>
>>     #include <drm-uapi/drm_ras.h>
>>     struct app_context {
>>       struct nl_sock *sock;
>> +    uint32_t node_id;
>> +    uint32_t error_id;
>> +    uint32_t error_value;
>> +    int last_nl_error;
>> +    bool cmd_done;
>> +    bool reply_received;
>> +    bool ack_received;
>> +    bool response_required;
>>       int family_id;
>>   };
>>     void igt_cleanup_nl_socket(struct app_context *ctx);
>>   int igt_init_nl_socket(struct app_context *ctx);
>> +int igt_get_error_counter(struct app_context *ctx);
>>     #endif /* IGT_DRM_NETLINK_H */
