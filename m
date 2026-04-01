Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0821076361
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 04:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B9710ED00;
	Wed,  1 Apr 2026 04:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6D6qEKM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6115B10E337
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 04:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775018806; x=1806554806;
 h=message-id:date:from:to:subject:mime-version;
 bh=pMqjzDIo+1DsR5ZNjubz14nMLodAaTDi21NJCIQf6mY=;
 b=Q6D6qEKMLG+1Aai2g7F3NOG2oImrtwYTFgTPadP6q4Svy82mbgnbja2l
 1GA3h1jS+K3gXvWN0PFDspA6n4eCGi8kh23JqLBkaGJw8uwZqhNrTGHqT
 2Hp3gFfgY5DpP+I8vzHuhZp0mrU88V1qgSrmcAlC6F7u3oShIpiH5rkUU
 OXy1oMC2Zsy+7P9jYkQFIGg3k+C5B/qDxR+W14uGkhPHPskLzHF3ymcon
 RSeOiiGMtoftyluN3GRrzDMr94gUK8ikJWgv4SYxVgny3qifxFfQQHPf9
 lbueBPAJEGBatzHlTO93l1vLkOYGDjTOpZ70sN4ESq5U1oZF6md4e9Hty w==;
X-CSE-ConnectionGUID: 5Jjuke//QiSzJ8kOkjqCYA==
X-CSE-MsgGUID: g+ofbhpXSFmyNfm4tht+Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75085856"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208,217";a="75085856"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 21:46:46 -0700
X-CSE-ConnectionGUID: 3sI6PjvmSwGVALX4eS7lWw==
X-CSE-MsgGUID: O13o6TkDSPKnkzyzS1AxUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
 d="scan'208,217";a="225558975"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 21:46:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 21:46:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 21:46:44 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 21:46:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yl0DlFwzhIZ5oKmKQnjjQiyjCas0h0MWqfwkFHhlWxRAHuAkbxJS6M5C7Y/1RfIt7gdZl7VCw16JNV9o3tPwLy8VxRR4kiAff7E1LHr9rIWEF4cfqG7F2OvJbu/LAZmDF7P8sD7LBHQCpVSUJoL4E6R9107MGks/e90AJz/eYmaq1vxJyKmUXXGEUc9l0mvZqrYYy2faUT5TncBrAhnrzt6O6TWoFpk6lotRAYU0eAX4B3cEXRxAyX3uK4nzrQQD2AnKYyM+lud2Ooz+VGYHHJj4uQ0G5gXrbDUxy4Nfndr/eUGGB7eIgunegp5xG+sVCFrOC5+LUwa+l+N/2pJ1nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XsOysNwC+xZNVW8VnssdIObQHFLYBMOIP4eMoxISCM=;
 b=EMkpkQJFRO8xpFxQLV11TCWQ37jvy8LXsZy2qN8utP+3Xog1Mq0Ex4D8LpUspHDw2Nb22JLsCefQO/m6cRBl5Kd1zzHTQqLWJ+ZXV/vMCMik3d1Hy/kelGiMAcz1MRBTaXzkBXxFtvvdTR2I9zsM0gvOejmRBhQhvc6CKyhgO/6++gPgtplex0LrOAE7s3l/gMSJHwjVXHX2moYqzjGYoJ55ehJrFH62sDu6IjO43BRSaZasWQLufQDOpqCF5J5VDfAGMkWE1wt8YnFnDn9Ga8iSU6RXLulQVSBvBypCqUV3Q+t3OXgWQOgTxDGbckKLOS7DXOEvVG8F9BT3gfQ5aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4271.namprd11.prod.outlook.com (2603:10b6:208:188::20)
 by SN7PR11MB6727.namprd11.prod.outlook.com (2603:10b6:806:265::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 04:46:36 +0000
Received: from MN2PR11MB4271.namprd11.prod.outlook.com
 ([fe80::ad93:3c20:1286:59a2]) by MN2PR11MB4271.namprd11.prod.outlook.com
 ([fe80::ad93:3c20:1286:59a2%4]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 04:46:36 +0000
Content-Type: multipart/alternative;
 boundary="------------1zHSg04W5nfKyuxx7FdxJZQF"
Message-ID: <677294d6-34d6-4557-ab0a-95edd284492b@intel.com>
Date: Wed, 1 Apr 2026 10:16:28 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
To: <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>,
 <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v2 2/4] tests/kms_vrr: Avoid unnecessary PSR disable
X-ClientProxiedBy: MA0PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::13) To MN2PR11MB4271.namprd11.prod.outlook.com
 (2603:10b6:208:188::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4271:EE_|SN7PR11MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 067b109f-7cc0-4071-8130-08de8fa9a7b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: qrENXdeav/VjEBD7ECwZXiNtlrx4nvJwTgAbNBTjeJI715RjCAPsPvXM3MzE0k4USH/coHnJuyZZwBjBvS8UhSzwkg5wA4ARa7gxXDsmJjRpgY9UHJGkASgTSCvNLaU/3fjkCu4lCzbU7CUDT1ZiE29FfV7rznASOhTMu1zPZCzhM4cs7daJv+ixdeGw2gHjabaeKfT3AYQ73npnUB5uwVEQ81T+Jx9Kf4HRye1LZW1OdNcsaem7FSwYEG8FK4H3zOBq2SyFe4+hQIAPxvAzB/WrhlvKXx7/5eI63kpLWEBwnOL7Zik2//YgXwcJlDAHJf26G4Uv2Mh7Tmz4UZRYh5IChX4q40ijWH4VlvlYMMQGyepck+2erl6nMFae8pG396qYZN7K60sK7FHDmHnfp5X38V/smJKk+J4tPRxmHp6PcqdAiAFWjerGZ+nBFsC711I2bU76jbXzD+Ll1+FCbFKfAJeQcl/zOHwAH6F6EqIOf5fGcrVT2LHTbMxpOo8W5ROeq7uKoBOKfewh3y1Ibz0w83dxeZhIzqekcpEbh8yp2dbEI+eQWR+Ef53y/mW8NXV3+2ylfYpvF66PKznY5oJfc9y/ON/YdTMNv9jB6BBocwoa3a/BdRnIaCd0nFKYk6OqXdK7xOfrUa40+dZclkGN0BL6e4BTFcg3eBAY9q31jn8kEjIcY6ou6dAxpcIacmIFWGyVo8FlkeMGgfJM2ppKZawTUxlEh56ORV1S5I4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG1aKzR1QnRuN043VjZGQTZOdktyR3JWUzdlNTVjUk9NN0NMWWNGUjhDMjND?=
 =?utf-8?B?bm9nUFpJMzhBdmRGd1kxVkpuWnVUeHV3eGhpSGRDYnJMbDczd3dnMUE4dmpy?=
 =?utf-8?B?WjkwMmRUelRFRHhzM2w1L0NSa3JsUFFlb3ZCRmd6ajNZWEFETjVsV2g3VVdP?=
 =?utf-8?B?VlRXTDZ6ZEp0U1MyWE1CbkxYdkd1Q0xLc1ovQmxBZUszbjliSmtlRGRBNnZR?=
 =?utf-8?B?ZGx0Vm1KYWRkMHprZ2Rmd1RpMklPdkFLMERsK2o1RXI1WGZGVTVaVUUwS3h1?=
 =?utf-8?B?OG9YbmxhUk40d1Rtd1YzQklVL1l5RmdaTm1VRXRXcXh1b1JtdURmaFV3NVdk?=
 =?utf-8?B?Mitrdnp4YnRTbk44blYzZjAyZjhFSzdKdGwyNUJySmFLS3dHOWsyZzVWWGY5?=
 =?utf-8?B?UWtMSEIzdit0bm1Ea1cwd25Ubi95QUNuOVJJaHpMcDdWb01ORjVWNWJ3Sjlx?=
 =?utf-8?B?M3pWOHJBcTB4ajh6RURBMHZzRGhKTk9aWC92SzVPa3RrdmRaM29seTlBQ1Bt?=
 =?utf-8?B?VGtqWnNlaW1Jd0pWdmZFZnFhM0dkUThXQ050ZjNzSTNFUTlXRitjUFhuK0pI?=
 =?utf-8?B?bkIyc2lxL3ZSZXlvcVYzRTgxRE1zTCtjYk92UW9uL1NDWDdKQy9qSlhmTG5Z?=
 =?utf-8?B?RGttUWhhdUhOMFg2bFZsQXlOaUF0b0FCMFA4OG5WbndSVG1oUU5ZbEFJb0Fl?=
 =?utf-8?B?SkZla0NsRFp4cVhnczdleCtkNnZHZ2pnanVtbHYzbmRrNXpWWitzZy9ERVA0?=
 =?utf-8?B?WWNmY1ZNVlNVTkpFSkdjdWFCYmQ0Z2FPeWxMNGxCR1hTNVNSaEZuWS95em9k?=
 =?utf-8?B?SmtHMHlXL1hLMlhCMnpvZlR5RnhRNmw2dS9CbzkxaWNtNFE2MWl5WnJZTzZJ?=
 =?utf-8?B?Ump0Y3k0KzYwTFRWbjVBRTZOUzdrS1l1d1pPNlJJTW00RWxVL3VkU0JlS0NW?=
 =?utf-8?B?NkFaRWIrTFl4c3RuK1NiMnA3M1djSDZoaUgvMUtuV21BblBHUFB4NTNVV2Fj?=
 =?utf-8?B?dmtyTloyaVdhbUxYN01JZEx3Si91YjUvb2hXT2xkdmJBcUVadWFPSnVXRXA2?=
 =?utf-8?B?cmtSOGlOU0FrOGZZdWRCUkFiQzJxRWpnZkx4aHpjWUdkb01GUTNVMGRKUGRE?=
 =?utf-8?B?VnFkb25WY0JJQTdBOUJpbmNGU09qNGVFY3cvY3YweDRnVVkyalQ1ek5sbTNU?=
 =?utf-8?B?QkEzWWMvUzFhMTFyU2p6ZjF3aXRIOXdhcXJlamtjM0tLeXIyUzF1VmNPWU5M?=
 =?utf-8?B?NzY1bGFOYjNvM3hIaUwxdFk4QjBwMWlrUUE5cDVZa3lGRjU3ai8xVFh1d0dS?=
 =?utf-8?B?VzlzYmN2SWF2UzlyaUFFSkFXanZUNjB4SkF5R2ZxUk9XMDFrS0Rmc0ppMkhX?=
 =?utf-8?B?RlR6YVF2U3YyS0ZGS29hMkJYWVRwV0lFcEFMU09QclF5bUlJUkJoNTJSNXc4?=
 =?utf-8?B?bFVSWFBaN1lTdFdyN1lzazVMTlBPZWhhZUh0czdIQXMzMFZGR09veCtmSUUx?=
 =?utf-8?B?bjV4UkNDR251S2dNRzA1QzZiTUZOYVV5UFU1R3dZdURRZ3QrdVNHSEFtc1dF?=
 =?utf-8?B?dmFRRzU4MlNQL2RxOGRuWlBjUE1KZTVXT1locWQrS2w0SVRYNVQrZEliOE5T?=
 =?utf-8?B?SFlBd0J0eU50eGxiYkxFSDRmaGNGUUJuM3ZOTlJJbDdtdkJGRmw4YjJvbGZn?=
 =?utf-8?B?TWpWZUR5U2o5cm0zV29IcEZKQ21wZ3J5NWZ3Wm1LeGpCc3hsNkRKMmRYMC95?=
 =?utf-8?B?QkkvWnQ2N1IvQWs3WUxwcFNaYTFwUk5zaGw3aXd3ckk1ZW4rZXFLeWYzdElU?=
 =?utf-8?B?cXdjNXNLV3hHcEpldXFhU3ZLV2dCQmtaSEZVYzZrV3RHbElxQTd0eksrellB?=
 =?utf-8?B?UDQ4VXRjc0I5c0RqYkF2S3lpTHdoYTlVTW53U3VHUkdhWkNmVTNaR0RBYUov?=
 =?utf-8?B?ajJpUGh2eHNiN0RTWWJRd0F0ZUpkbDJraDQwVG9NTUlkUy9ob1lsL2d2TGdj?=
 =?utf-8?B?VmNReTNodmZ6NjFwUWVMaFk4aExtV2xlVy91UnNrYTFNK2QxRjF1WHZHRFEy?=
 =?utf-8?B?Q1BHVGs1Y3QrRUcyQUFnTTlRalJCbGQrRjJzc2VBOFBTSVhjSDF3YzVwVzZm?=
 =?utf-8?B?Yjk1VnJnQktobGE0WUZxT0NueXFqZTE1NUYwRjZBZUVFM3hUNXhBWFpqS0Vv?=
 =?utf-8?B?NnpOTGNyY0dXT0VkdTJySENSZFJtNFpJdEIvL1gyUlNJZ2hGZ0ZOZHJ1WEpv?=
 =?utf-8?B?TEVoVzJJb1NCbHR5MUJ3R1BVTTd1bHNEU081QkdGbnpoSHJjWG9wU1pHckh6?=
 =?utf-8?B?K2ZrMk9EU1ZuZzVSODkyVVdOZlVvNFpMb3pLQ205RzdxTkJMWmNDU0ZrV2Ni?=
 =?utf-8?Q?uJcCVtPBx6jHTPfA=3D?=
X-Exchange-RoutingPolicyChecked: YRQ/OVYpm3aUniMIeUV3HR5Yu6rAddQl3lsKEQT+21dPAX4tDb976PniDA1zIG8uWriUuMLIlxEKkJ8V+0i5giZI8IBnEf5cykV7cBvPMIlDF5Lc6Yq+mqV86QrfHenO0CwofT8lvR7H7SGm6uSLicRHhufMdJfI+wz8JaHZQDutumOL55DcV0zWFmuH6eas+UZaU9SYhIcf6nWumEfwpcN8c4xnupVoaKfAwHawqlyuufWFL+ehy240ZenPGR0LTnbGl3WRsyAsnA0HiHMqnSCLEZg2PB279b0VNhOx3OfHPkJQV6+YECWUKtEfn0l7ivOPjqRuLzZB8zKQIAF4TA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 067b109f-7cc0-4071-8130-08de8fa9a7b8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 04:46:36.7215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkEMjMFbtR0/aQ3LuyynEGdFwD3qrJrgTalXYmm4wqPUXRMv2Ps5ltdME4740JZXGukIDEdTgwl1kLdfTYTMSvKqhEh3TAhS46qYSO3/zho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6727
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

--------------1zHSg04W5nfKyuxx7FdxJZQF
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jeevan,

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan B
Sent: Wednesday, March 25, 2026 10:22 PM
To: igt-dev@lists.freedesktop.org
Cc: Samala, Pranay <pranay.samala@intel.com>; B, Jeevan <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 2/4] tests/kms_vrr: Avoid unnecessary PSR disable

Use output instead of NULL in PSR helpers so PSR is disabled only when 
supported by the sink, avoiding unnecessary global checks and ensuring 
correct behavior on multi-eDP setups.

Signed-off-by: Jeevan B <jeevan.b@intel.com <mailto:jeevan.b@intel.com>>

---

tests/kms_vrr.c | 6 +++---

1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 
ec0692b2f..ec17366c8 100644

--- a/tests/kms_vrr.c

+++ b/tests/kms_vrr.c

@@ -912,9 +912,9 @@ test_lobf(data_t *data, igt_crtc_t *crtc, 
igt_output_t *output,

igt_skip("%s: Aux-less ALPM not enabled, LOBF not supported.\n",

igt_output_name(output));

-if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||

-psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))

-psr_disable(data->drm_fd, data->debugfs_fd, NULL);

+if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, output) ||

+psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, output))

+psr_disable(data->drm_fd, data->debugfs_fd, output);

}

This patch is to update the debugfs. on that part it is LGTM. But 
observed one issue, As per the above psr check logic it is only checking 
panel replay and psr1 mode. If psr2 is enabled test will skip due to 
lobf and psr2 are mutually exclusive. Better this needs to be fix in 
other patch or this patch.

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",

--

2.43.0


--------------1zHSg04W5nfKyuxx7FdxJZQF
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jeevan,</p>
    <p class="MsoPlainText"><a name="_MailOriginal">-----Original
        Message-----<br>
        From: igt-dev &lt;igt-dev-bounces@lists.freedesktop.org&gt; On
        Behalf Of Jeevan
        B<br>
        Sent: Wednesday, March 25, 2026 10:22 PM<br>
        To: igt-dev@lists.freedesktop.org<br>
        Cc: Samala, Pranay &lt;pranay.samala@intel.com&gt;; B, Jeevan
        &lt;jeevan.b@intel.com&gt;<br>
        Subject: [PATCH i-g-t v2 2/4] tests/kms_vrr: Avoid unnecessary
        PSR disable</a></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">&nbsp;</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">Use
        output
        instead of NULL in PSR helpers so PSR is disabled only when
        supported by the
        sink, avoiding unnecessary global checks and ensuring correct
        behavior on
        multi-eDP setups.</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">&nbsp;</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">Signed-off-by:
        Jeevan B &lt;</span><a href="mailto:jeevan.b@intel.com"><span style="mso-bookmark:
_MailOriginal"><span style="color:windowtext;text-decoration:none;text-underline:
none">jeevan.b@intel.com</span></span></a><span style="mso-bookmark:_MailOriginal">&gt;</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">---</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal"><span style="mso-spacerun:yes">&nbsp;</span>tests/kms_vrr.c | 6 +++---</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal"><span style="mso-spacerun:yes">&nbsp;</span>1 file changed, 3
        insertions(+), 3
        deletions(-)</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">&nbsp;</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">diff
        --git
        a/tests/kms_vrr.c b/tests/kms_vrr.c index ec0692b2f..ec17366c8
        100644</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">---
        a/tests/kms_vrr.c</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">+++
        b/tests/kms_vrr.c</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">@@
        -912,9 +912,9
        @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t
        *output,</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal"><span style="mso-spacerun:yes">&nbsp;</span><span style="mso-tab-count:3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>igt_skip(&quot;%s:
        Aux-less ALPM not enabled, LOBF not supported.\n&quot;,</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal"><span style="mso-spacerun:yes">&nbsp;</span><span style="mso-tab-count:4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span><span style="mso-spacerun:yes">&nbsp;</span>igt_output_name(output));</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal"><span style="mso-spacerun:yes">&nbsp;</span></span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">-<span style="mso-tab-count:2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>if
        (psr_sink_support(data-&gt;drm_fd, data-&gt;debugfs_fd,
        PSR_MODE_1, NULL) ||</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">-<span style="mso-tab-count:2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp; </span>psr_sink_support(data-&gt;drm_fd,
        data-&gt;debugfs_fd, PR_MODE, NULL))</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">-<span style="mso-tab-count:3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>psr_disable(data-&gt;drm_fd,
        data-&gt;debugfs_fd, NULL);</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">+<span style="mso-tab-count:2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>if
        (psr_sink_support(data-&gt;drm_fd, data-&gt;debugfs_fd,
        PSR_MODE_1, output) ||</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">+<span style="mso-tab-count:2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp; </span>psr_sink_support(data-&gt;drm_fd,
        data-&gt;debugfs_fd, PR_MODE, output))</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">+<span style="mso-tab-count:3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>psr_disable(data-&gt;drm_fd,
        data-&gt;debugfs_fd, output);</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal"><span style="mso-spacerun:yes">&nbsp;</span><span style="mso-tab-count:1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>}</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">This
        patch is to update the debugfs. on that part it is LGTM. But
        observed one issue, As per the above psr check logic it is only
        checking panel replay and psr1 mode. If psr2 is enabled test
        will skip due to lobf and psr2 are mutually exclusive. Better
        this needs to be fix in other patch or this patch.</span></p>
    <p style="margin:0in;font-family:Menlo;font-size:9.5pt;color:#333333"><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal"><span style="mso-spacerun:yes">&nbsp;</span><span style="mso-tab-count:1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>igt_info(&quot;LOBF
        test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n&quot;,</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">--</span></p>
    <p class="MsoPlainText"><span style="mso-bookmark:_MailOriginal">2.43.0</span></p>
    <p><br>
    </p>
  </body>
</html>

--------------1zHSg04W5nfKyuxx7FdxJZQF--
