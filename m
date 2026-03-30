Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591C3FB3CE2
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 09:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F015A10E540;
	Mon, 30 Mar 2026 09:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6kjEjFM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B11610E540
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774863457; x=1806399457;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9G3i03a6AcnIyKYA/46U9dkfqOuyxWQgRCTvLF4Cj8o=;
 b=Z6kjEjFMqE1GbK+Bc0opYRFh5pq7Ni16AjMFk0mHPl3jrvF0dbgxcZjO
 CmfrPm/fecAbw2y2S3ol8o210bRGGn4iB/pSEnJaGryXi3Xj9adr/W3Z1
 WzgeQjqsA64Lw/qcq+HidtrJkr5aIji0cXbxRrdr/l0AojYZG8bypPC82
 2S2Tk7IIvjbId5f9hxzG85/uYh+1PF0shNbS3+20CG0Z2+2cs8zQMHNdM
 p1doEeD1QlYvWttDSIqannbadt3VVybKYhpx4E45W+yMDw2ReIuFyc+0M
 aUNJo/sV8NaXz3qHfcTFwp+7BfCH07jyPrdeJMs7+ebroyQZUs4NpxMDr A==;
X-CSE-ConnectionGUID: vVxR9FrkT/y2WxZlt+SAEQ==
X-CSE-MsgGUID: EjrTGW59So6Ugid9qzpbbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75918399"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75918399"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 02:37:37 -0700
X-CSE-ConnectionGUID: R/DqE/XaTM2f+Epo4babsg==
X-CSE-MsgGUID: Re2ZPZaqSnGLt6dNoLwibQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="225906038"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 02:32:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 02:32:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 02:32:57 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 02:32:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUPVlM9dkY472i8z1rne/w3LrBtpLM13xV/3eAqnvpvS1Klw064xC1IujUCGfxMAn6cc6BOpBrZNsFpo1dENoD4e0ieOMy8sGom46+cFZ3eWa9pFPn/0BYs4WWG21QsqGGIKJO5Q30Wh0wc/fqlumEDcD5TZdARX0lDlb9LPaQ9otcNrRX3JQhEoXP9C6gz5s8bcBbdbZhyMEFCOrDSGNX2vHDawG8BhP2GLoocFt8/Jborci3WnyF5v0g2hhWmhvC/QXSosfitYnIPpqN8vDPNDLiVlHd7z2al55Jvb5+/1jkVME4aCYzX5/DPxgR08joHpiOjACzASaksjGizuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SnwB913qdY0dD2xSqU7akeIZ4REY4r9DJlV/Ji4Aqk=;
 b=ZRKtwRkyXreRJpbRPnaetr3fsG48jAbnEUKkeEDWY+vfvsT6r/DmIz8HPt/dErmXd+30lSriqtJIUAXzFSrDdcBBbP16kisWHu2Kb+ALGjoBCp9DkhD9tYHuTvmpenuLmj3jD07fRUPXnG4uOIz/Gxf5O5s/20XwIGX7zyuO0P5MjhECZ8mkBV44Xa/DY93xfBxavwciVqg4PH0tHWJwPm5IRkD/9RoX8Pox+PV/AdK1sQR7hVxTUUwQPqB0TGoo+EmoY3VGOHE2fwWUC52k/Bh3QB10b+seK9XPl1kFuh1ZbyLIohBEFDPz+NWUJ5qvBdIDvuKTr8ZKPNerA2jtjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH3PR11MB8517.namprd11.prod.outlook.com (2603:10b6:610:1ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Mon, 30 Mar
 2026 09:32:53 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.20.9723.013; Mon, 30 Mar 2026
 09:32:53 +0000
Message-ID: <1319a8bf-3c58-4d57-ac32-440380401a13@intel.com>
Date: Mon, 30 Mar 2026 15:02:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_setmode: Add HDMI 2.0 clock limit for
 mode selection
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260130055416.198799-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260130055416.198799-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0045.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH3PR11MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8139d8-a3d4-4d5d-2162-08de8e3f5105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: i7yKT/5sas6ZsjDF9MPDCaz1B80wxxkLQp98GkanbYn4IinXlqcNK9VVxuXzyzqb9IARCZ+4C/KKXsKGc4CE84W8Wi4DetVSAgZr6yJg/m+LGmcxfNWdG5tdMNIkOP+rRRsTQpHF8StzW2RY5awxeJQkaCDYROADcYILS6doJrBZBEf403cquj2u8+LUNhFM/Cd2L1D+Y7tnSzQCfUWJDUKsUIe3A0sx6N9tgqyNTrAHJo6htNskcGAoEVzYENcVu0Kb53y8B7UlEFFMXJHUJa7ERZnBTtypa4+vk5vQb1HooipKSXhKYMc6tg8IKwoZodLASrOh6+u//Mf60DPhFLeiJIIOSOE+ueQi4DreddCNunqs1yH6m0k5scKsqmU0PQfWITlzBARxBj+3o2dK/XR3QAklNBJEde4baD9eouUk5jx49z5kKXJhToigkhc+uMC1BOWm+Sy/zGUIbzfiDdUTQdrNigiMy5T26sG9k3RYlYRE1oo5VJOThTZ7pSelw6EUiQlDf04xvv2Io814F48FofhvmQnPHapOAGSrTS3EdoDqZVDu1nTV/wtqdqZ6w07OcU2VhqgDglG4Wv3dAvkuJDLg/BA+CuXg1BsDYXcx2DmJ90XdPwe9HxO36o1D6tr9v4eVhAZDsvRcOImTyM5iZy98maFdHOs/3oPL4t+EkJf72Q4PsiDp/dTP4bSUfBcIID9dtV36gwlVr5FcTPhqE4jDwMbefDYGYBwpdB8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUIvcG1aM1M1d0g3bDJnY2tvRjA4dDhzVDVzWjBkVWt3VEE4aXBXSGR0QTF6?=
 =?utf-8?B?TnkxT0FYYUJtcGFZdkZOME9GL2hXaTMvTzZldWFIeWV6WDJHWkFVTEl2Wmp4?=
 =?utf-8?B?WlN1V1FmQU4vaXR4d2hUeDdLR0tSOVhTZjdiTElFNnVmM3ZlMkRHSWpaR2Np?=
 =?utf-8?B?dkV0MWxkc3Z4bG1sejl0Z1ZzcE5Ub2p3Z3cydnAxYzV5UnQxcVRvVTZVUXpM?=
 =?utf-8?B?Q1VUZ09mRXFRendBNjg4WU1NeE9aT2FwcS9NeXJxZFlWKzV2Z2J2dzlEQVUv?=
 =?utf-8?B?RDRCM3RhK1h6Z2tZRWIrQXgrNGFqdi9RWlQrTDgwREttRVczV1A2anE1QXlW?=
 =?utf-8?B?NkxmSkRJZmJ6NFh3YW80MUVHOVFEVE96U0JIbjMzbFFHZkVBbzR5eUQzbkds?=
 =?utf-8?B?NjE4MGZycm95TndRTDF1WXNpZHVRbDcybnR0dVoyb2VJMzVBSXE0VVVLbWpa?=
 =?utf-8?B?TE5HcnNxeXB0V1BrdWVVWk9QVExYanN0cDVET3pROXF4cWZYUXloemhSN1B6?=
 =?utf-8?B?ZHVjeGNQVHVEV2w3eVhpblZSdXdKWGkyS0pDQVNlaW5zNGFlZHFjaGx1RzRx?=
 =?utf-8?B?R3YvOUIyc1FhVHNKRjQ5NDdLYVFwWldRVFN6dE9DY29wd3RQdE41eUUrOG5L?=
 =?utf-8?B?ZVQvaFZHK0xSV0F5c3FXeS95YkpRNnphajlMZ1h1S3F6V3NoVWpadlFwZVNK?=
 =?utf-8?B?dGtHSFpaWWhtV0lldVoycDljQlJqQWN4dUNULzJLcEx0cmJjZkxKcnFKb255?=
 =?utf-8?B?TEhieXZmSTJSV1RHU1BEdTZHbEJHM05sVERIWGNUMUdDUHFTSEZtc3F0UDRy?=
 =?utf-8?B?WmM2alc1NVo0aytMRTc4R215emQrRGo5OTJ1R1JKa0VJL0dQWUl3ckw2c0Uv?=
 =?utf-8?B?NDNOTXBxRi9pQXQyZmFyQlpFTEh6UndtNXFsVEZ0bmNkK0lmVUxudGZPUk91?=
 =?utf-8?B?cnJlNVJ6R2FzUlVyZU5DVE9UL2dFYmRDcHY2bkh6M3EvZnFDQldmaGlkd0ps?=
 =?utf-8?B?UlNlT3U0bEU2OVI0WFMwcC9kc1N6ZFplWXFSS2tBK2ppV29JZkllTnFUWVl3?=
 =?utf-8?B?UWQrektCVGpjM2cra05LdjJKWFp2UHdKU3E0M0RMOFRpNEtMSTBOTE0xeTBt?=
 =?utf-8?B?b1RSVitTYW15Z2cxbVNLcFFaa1BIWkR2bFdraG1Kc0h0Tkc2U1JGSTRIa2V3?=
 =?utf-8?B?ZnRML09VVUJNVmUwanpqSmxUcHE0ekM4ZThzNVhNL1RMN0dVOTFacllxdDdm?=
 =?utf-8?B?TmtlQnF6RncySlRHMU53OTJaMkxBSFpJY1FXb29nWS9wMk1vWjRiWE5EcWhv?=
 =?utf-8?B?TDc1b0xsWGlOUmtBemlXVXBQTHUrdkJFcnVMbWNka1BxZVNvcFNaRFlSUjFK?=
 =?utf-8?B?ZG9UeklzbTBmSEZCMlF6Wk1LdEtySm1MWkdFdFcrTlRvS053MDArck9VZzhS?=
 =?utf-8?B?SFM4RU5IQmJwRUNUdHp4dUxTbGVaaWJqQW9ieVRwamt4R1p6V3MxQVdyWks4?=
 =?utf-8?B?NVBwWDlsYUpsNlpGZzZrZGZVWFNzN21RdlI4V3VvL0E0eEUrK1ZQUjIvbEdS?=
 =?utf-8?B?a3BoeVhJVlNtSk1ldGFqcGtkU1dwQWdFaXFrdis4ZWVPNmVCSFlpZmFmV3Rr?=
 =?utf-8?B?bXlzbkIvMmpiTUpkeHhteGtMUkNPS2hMWi8xbGlZR0NUY21YbForbnlYZjVQ?=
 =?utf-8?B?SkNLdUREN1ZEYUg2Sm1leGszN2xmRzFTVUEwQ0lidkdGRDdtWC9kSnpaNS84?=
 =?utf-8?B?bGdGVUxyaEZpVWZTNGthcitHMXU4UnBJdU1jOW9YNGtkTVVaeFlpUitHVFlR?=
 =?utf-8?B?UG1VOWgxZXNJUVJrY3lIemVCU1QwNkdZallOdExQelBPU3dkZVJacjVlV2hK?=
 =?utf-8?B?YjZLUktDRkhBckZaT2E1bjZveWd3dHpjQnM1TTl0OEprRGpjdkdSbUFBSTNZ?=
 =?utf-8?B?aDZrU1U5WmhlelBJNk0ydjdJZFdFV3ptWWs4ZmZLSVBYaG9aa0txZnZxeVRs?=
 =?utf-8?B?eUdtOWxhaUxWREtCdlB1cE5lQXYvMVdaNHF4RzRFTXRJbXI1QnRRUGxsenY1?=
 =?utf-8?B?elE5Vmpud1BpN210U1B6R3Q4cVdPbkNVemtqMU1mdjlNQm1YbDFlV2hDZVVL?=
 =?utf-8?B?YjJIclhrZ3BPZlRvOGgva0ZLYlozUUN3Q1lVcG5QQ3FVeTdiaCtjbUZCczRr?=
 =?utf-8?B?RnBKa1lhT3JWUDZFdExwcVhhZWY1elE1YmxTOVkxNXU0aUlYTGZvcHZtRXl3?=
 =?utf-8?B?YVY3WDQrV3RlYXpRUE91bDVJNzlhbk1mZWJHOXRoVGpMdFdiMWZuZTIyMnAy?=
 =?utf-8?B?NHFlZkFPY2hGTDk3N1lBN2Z0bDgxN0kyaFJ0SzZoVXU4RllVQitGUU9Bci8w?=
 =?utf-8?Q?GAJ+4iBynmb2Id20=3D?=
X-Exchange-RoutingPolicyChecked: EtdQyGIbP5OUcHbCghmdp3huMyjT5zeibOhiJ1cRvFBfBEU6CKxQQdpPaxJoLodPLXpUo28qDuwpa87oyR7U6w2EDymQFlcLgwf+NPS7FHjsQCis+Bjb7vo6M4NYwY/bi/KBpRMsJUbYIy3yCPDmLWFtSluAYnmlARCxSXyH+HWzpqJhS44UdNowTPwEDippeB7E3xBq4xac4HB8gAuZh7w0AQ0S0hTNlbgtWa3Txmmy/+ZnYjTfJhUkVf79r46Hmd/xRLStQthbpV/arOXeyBuWxvd2A7hQxD5o3PV+3qyvAldqLWSjjN0auXhW3+UO9TdbUcMFTWFXXKVbLLDDDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8139d8-a3d4-4d5d-2162-08de8e3f5105
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 09:32:52.9902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGJ8gMnp3JHtBiPdtq7EtO1cO0ozQboYYStg3PXziUZrKZHIbsbEJaPGvx5+6CQ+7F0WGmciDVj+qSiQse8hMT2sd21TCV+8hk4YlCOqme8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8517
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


On 1/30/2026 11:24 AM, Jeevan B wrote:
> eDP modes with high clock rates were being forced on HDMI 2.0 displays,
> causing kernel to reject with EINVAL. Add clock validation to skip
> incompatible eDP modes and fall back to supported modes.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_setmode.c | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 9c0649e17..4b2f16751 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -79,6 +79,9 @@
>   /* restricted pipe count */
>   #define CRTC_RESTRICT_CNT 2
>   
> +/* Clock limit for HDMI 2.0 */
> +#define HDMI_2_0_MAX_CLOCK_KHZ 600000
> +
>   static int drm_fd;
>   static drmModeRes *drm_resources;
>   static int filter_test_id;
> @@ -270,8 +273,25 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>   				if (conn->modes[j].clock < mode->clock)
>   					mode = &conn->modes[j];
>   			}
> -			*mode_ret = *mode;
> -			return;
> +
> +			/* Check clock limit for HDMI 2.0 */
> +			bool hdmi_compatible = true;
> +
> +			for (int k = 0; k < crtc->connector_count; k++) {
> +				drmModeConnector *other_conn = crtc->cconfs[k].connector;
> +
> +				if ((other_conn->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +				    other_conn->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
> +				    mode->clock > HDMI_2_0_MAX_CLOCK_KHZ) {

Hmm perhaps can use a helper : hdmi_connector_exceeds_hdmi20_limit()

static bool hdmi_connector_mode_exceeds_hdmi20_limit(drmModeConnector 
*connector,
                              drmModeModeInfo *mode)
{
     if (connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
         connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
         return false;

     return mode->clock > HDMI_2_0_MAX_CLOCK_KHZ;
}

> +					hdmi_compatible = false;
> +					break;
> +				}
> +			}
> +
> +			if (hdmi_compatible && crtc_supports_mode(crtc, mode)) {

Need to drop crtc_supports_mode(crtc, mode) here, otherwise it will try 
to match this mode.

This will prevent the test to use eDP modes that might not be enumerated 
in external panels but can still be supported.


Regards,

Ankit


> +				*mode_ret = *mode;
> +				return;
> +			}
>   		}
>   	}
>   
