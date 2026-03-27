Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F343910BA428
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 05:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADC310E2ED;
	Fri, 27 Mar 2026 05:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JwZajKlb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9717D10E2ED
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 05:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774587941; x=1806123941;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p80akrrTix3kd/8BFk7mEEGHyuLiUPpzM5fuz05Ku1Y=;
 b=JwZajKlb3TE/40NdMWxj/QnRYld2miiIz8pRKuTKzi5ZijDdU5Omukks
 yTTytKdsqHbBueeBSX/jK63V5WcWIxOmmdqAowMN3B/wBeNltix8LIjPq
 dlWxDgaFGt5rbXyc5s3db3aOw7PtJ5pWh3YUhG25+04fyYAPkniT/K8Pj
 RF6T7uJ39CSFKBTg/i0T24mWPLRDxc3sklD2UbTZtBfQGQMdYQwCHCdr+
 pkxnmHEsKlJp7ycHj8Cc/QTdjfrGHJA/EkSF+2IKvY+PXO69/ftm1TQ6n
 6H4rdsbwoPYnWB8AOMZfj94zPXQz1Arl5G4Fe2/oCfcis1IVBBIUUc3T6 g==;
X-CSE-ConnectionGUID: I1hvC542SWuc50G+ySedYg==
X-CSE-MsgGUID: gOiBqFSQSUmdEyXnWXEMsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79516401"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="79516401"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 22:05:40 -0700
X-CSE-ConnectionGUID: UZKVgjDNSYe7RQCUx7KROA==
X-CSE-MsgGUID: rM+qlTOtSsKSacP3ILsPew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="220809003"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 22:05:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 22:05:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 22:05:39 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.34)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 22:05:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoKTLe70zZok1m3qLunZKm615ij2WyqCjhmCyoZWamD2TRs1NJq6olYznMMQrzz4aTcNuo0yOrZ4IEyM0IIOCaflfQfMA2s6gW/8UNx5iKo2fmEkiU2MQ/61QqSfw51rCaaKXOo0eo2aghkE5aJ2On4LJvTQ8ZOjE9HMW/HdmZcWCosrlG/9mdDwq0FcYrpdpATTCThgiRuQlc1lAW9GS+YPOsWY0cSuo4UEapOf/hpa5n0FS3/VUfitM/YKwFAFSSrT8NhP8JYdgiLsGIrM5P3KJnj/4detiEJ+h5fT0wA7Fp3lxoK+5axC/InFiDsDGUxXm/hnOCRUwvGbtqr2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbESUiF0f/FW4ZwGP+Fx4uFF1bOrj1xB/4hvDhUruEs=;
 b=nNbRAcS7TI29g/YRNvdLxCHac5TItpI/G2UED0+FLwpIZ8nOqkAf9B6Ulg6eKyHdo5n0wZ8BSqR33fHQFVUHZ4jzVG3ak/JHw1TbTnrZZEBNyr+0eH6bkM3owVE+W9IhNTT09ZbT4Kt3U6vdovcLqqvNHNO5XGwwEqihcH4uwJK3URD0Nf6fgcqQLMahMa6M4MYz48uqg26dAfqo/N+QbX9ninM/H2QgZGIJFAbwIOG716wbYb8Styo1eqIUGhW0XToXydHbezhNSSoPmsR0PkZdPDdxzsPdPszFOykWN7SzptQQgEEReTKLEpYgPDjNPSwtLlTfptdfXx4OVs1lpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.10; Fri, 27 Mar 2026 05:05:37 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9769.009; Fri, 27 Mar 2026
 05:05:37 +0000
Message-ID: <dffdb94b-fa11-4381-8249-983edfa4d99a@intel.com>
Date: Fri, 27 Mar 2026 10:35:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/kms_fbc_dirty_rect: check the plane
 size before fbc dirty rect tests
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260326072555.160329-1-vinod.govindapillai@intel.com>
 <20260326072555.160329-5-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260326072555.160329-5-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0182.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::17) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e501691-b50c-4c4a-0511-08de8bbe7bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: ItamVqFK7MK5TuQ5cu4bZ3ifDHIESPba5/Lqf+O5S048GTvVSql1xXp0bY9ipPlFCpNLhaVY2OJq/osQhSyOn+h3RVmK8/ue59oTPRZqBa8ci26Zr2njF5PgKT+t76pCUzugOroAEXzpPYiAnaI2tewN/mZeNyLyVWBtdHvmXXctUzqhaO1APta0kvz6M4TxPnJQVpblj62VbKy9n8O4auds6kobXvpdqH/iE6c8vIXqL+ByldFMsorEuhZiJAs9eGwhj4JCmBOuyuRYQfbMKLGN/ptLToqm+f1D22CY/u9iGNTQfup0IOHjs7eP2ezkKFqVzKPJBEmYqCdp6v/ILvI3BQlajmJH9Nd4qUun76jtVtFdfo9NTEYybz55da59V6VvaORr6RI1jQDXeMhUo8ISz55CA29qccg+QO+v4EE7EN/AKM+yrpQ2N2IKr66jBgOCCIKm6fNMzm4bpoUq1fn5PIiRpyrs2vo7Y8/EgIiWuLxLWOabVARHYYX7Wu62QPDF3D7e7SSrOZ/hG6kFko5kCu9PS5HQwm3+EJiFZUF2HIDhDm7bXW7LwNHPlQUOkLoYCQ7k6FsDVmpUub2kdBcCqsWm7FYCqlrUAepIc9HAUxm0yafP8SG66McjNkUv5YZQcxVMvJAxKsU3ZnZ4pb55R0Ez1kHKNFgbyMXu/R0LZZBBYctnwzc0FHUKxsFzTll2HMZH53QlfCu8gJCmFDmINY4pa/+XNuD9d5l0H8w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QS9rSUFvNTR0aTBCOGo1NjFJRUIzWHhGenU3TWl2a1E2c1dkaWk4SlVhRmM0?=
 =?utf-8?B?RDhWd2x2RUxsVnBrVnk3TjcveEdCOXhTb3BINytnZDBDNXFZbGFFOWJ0b1FL?=
 =?utf-8?B?UlIwamFVUkZ2Lzdtb1F0MWZlaXF2eDBCMGFrdE5qTFYreTBNVVgrY1F2L05u?=
 =?utf-8?B?cGY5NGpxN3pOSVRzeWJCUkpTbVZ0aDMzQmdaZXVLRUpWcW9RS09zT3VtL0du?=
 =?utf-8?B?VkFmV3N0bEprcDMrSlhTeWRDZUxibDZKbklWUHBWQmFiUVlaZ256cXF3Qk9X?=
 =?utf-8?B?VlVlL2wwWEV4MjVaOEluQ3VZOGlJZVdOYU1OWGlOMFFyM1doWVBWU3I0WC96?=
 =?utf-8?B?U0F4bDR4c3pEL1ZKdXQvMDcwWFdTc3R3MHN5YTcyRFQ2Z0ZWODIzK0dnNUFI?=
 =?utf-8?B?U21RaHNOUjRLV2pHMzBnSUJvSGwwcnVLZTB3bDQ1NXRaSUllUXNDRWZzWU5E?=
 =?utf-8?B?aDFZSjBKZzhmWlg3bTRtYTF6c0NwWWxTaFZaN3htcGIxM2wxa0dzck8rbi90?=
 =?utf-8?B?WXlkQWlRUWNqRE92MzNTRFZZdVJzYzJQTDZQM0xRT3p3SFFNTTZvZCtHOHFL?=
 =?utf-8?B?MkpDdDFjQnhmTjJrWWR2UWZ3blVKNjB4dkptUVdLelV4RGlvdjRoTERvVmhz?=
 =?utf-8?B?OFpGTEg4ZDR4VUJVbTkvNk44b3kxMWdsU0F4Z1VpVU5qY0ljMEZOR25pNGVY?=
 =?utf-8?B?K0ZVSDdKUkltYklBTHdDWnQwY3pOMGZ5VGllL2swZ05pNFFYRUp0M0VpZnFU?=
 =?utf-8?B?ZG1ZZjN4U1NFSmtmNGlhVU95V2t0VFVuSDBYMXBJTnlkeEZwRTZMNEo0WE1y?=
 =?utf-8?B?bzJyTjFxL0c1NGl3S0dHQ3l0N3dqUjdDUjllVVd5UzRUUGNhVkRicXhyQzhs?=
 =?utf-8?B?V3BESHhObzRXR2hOYVlaWXRMa3VnUTZ2YXZYK0Z4dW52RmdqK1dKOHVYWXVy?=
 =?utf-8?B?VndsNlJJRmdGUnM1NWZaWmlRa25DdUsvUS9MRmdTMjFwM2xoVWY3RlVCRUlL?=
 =?utf-8?B?RHBPZ3NSOXlYcFdsWGpkR2hPOWY0MGtoeFQyVm9TY0hLNUJpUE1FdnFidktl?=
 =?utf-8?B?QS9ER2o2QXJQNko0WERwc2tLTXhyVUVJTjlwQ1Y2dmVBRGZwYlBPYng5MTBt?=
 =?utf-8?B?TDdQYXp5VHlrVnE1L3Q1REd0emlvOHNqZzE5T1ArdzNMQjJjL2p3RzBmNVJB?=
 =?utf-8?B?Vm1YS3BqOWJMUFR0RzNVNWhucHpwNDY1Y3ova04yVFVFcmFRditxMTBWUmJn?=
 =?utf-8?B?UmxOVkw1cFp5cHpWVlJlOFJTYjVUV1o0bm5uUE5TTGhLeFlnNngweUtBTVZI?=
 =?utf-8?B?NTlqWGdVSGt6eXFsV1F3bHR6Yy9ncFBrT1luNkMyVVFlU0p4MHZCZHlGN1BB?=
 =?utf-8?B?akoyS3FqQkI4WkhGNjFvTmpsbzZ4L2NSOTl4RmVQS1ZmajlTZSszSWk0ZUFy?=
 =?utf-8?B?ZmZ2L3FETXhkRTRqU05xd0VkWHQzdWw3bVA4SWhWSnBXcDE5SFlDb3JVYlhH?=
 =?utf-8?B?bmlxRHRVYitoWFdPOENoY0VPR0VXZ2kvVUZheHA1N2JQNmh0OWVPOGNiUU4x?=
 =?utf-8?B?Rk51TG1rUjB0QUx2aUJsY1RYSis1bXBoYWFaNVNHNjBsbmtvT3E0RDJiNkRm?=
 =?utf-8?B?ODNTSk5YQ1dNbExqK1hXQlJabDFMYzhHZmFGeHM1Tm5wb0QrN1lHd0J1RDVt?=
 =?utf-8?B?RktPakc1T0VuckltdnZJYWNzMGRWK1JyRTZyMVNZc1FlU0tVMHdqdGtMVVQy?=
 =?utf-8?B?NHhLNm1XTFRzTm1rdTY4RWxWZ3czYzlpbGxqaXowb3FKNlQxQ21FS1FIOXhh?=
 =?utf-8?B?aHM4cWs5OGdsY2UzckE2Z25IRVI2SC9CQnc5OWxvV1dOWXoybCtZSzJvbDlz?=
 =?utf-8?B?TERKbVV1OXdDKytybmxFY29MT21DaWpBNEliMDgydUhFRzZydExhL3gwaGFF?=
 =?utf-8?B?NUtuMS83dmk2c05BSEszSVZLWlQvSDNmcGVBaVBSRFlKSmwrTkxpb01Bd2tx?=
 =?utf-8?B?ZlhKbFFNa21BbStFVHRjRTN1RWVZY3UvVEMzVEJ6bTJqd3BBR1ZrbXZKSWR4?=
 =?utf-8?B?Wk50Ti91NCtrWmhLSkpRMDUyRkFWd0wyQmhtR2kvbExTSVMvQkR5dllJVFo5?=
 =?utf-8?B?bmhiTW1IbGRtZzRLTitVeTJWK1ZpTnBxR1BlTTl6SzlTbEhEVFF6bzVERDJI?=
 =?utf-8?B?cVNqS2hGS0w3UVFEeEpxR1l0L2RCYjVkd3RhU3ZPN3YwQWU3TXJoZlNpNVkz?=
 =?utf-8?B?aFZ5a1IxK0lVMnovTEV0ZFY0dWh5YjV3NjFpc3puYzdXYjVyKzAwVjV0Vytx?=
 =?utf-8?B?N1I3K1FIc1l2SjYrcmsyNGZVb3RnTXU5eDFvNXVDSkFrc0V2Qmh1eFhjVitN?=
 =?utf-8?Q?cpKgqdjVt9zR6mEdHeq+Pwia4yB7W5VVXevDA?=
X-Exchange-RoutingPolicyChecked: Gcyb+Vw+j5uPToG1xSKaq6gHFQNWzwc7sBcoY7WjvGC9d80vkd74VDTZVlc+9fPHMqgmtdmYWVvI9F76uVgFLbNuQ7+4pA2nQ/q+3WwIN4Pr1flOt9AP+JoJHLeh3ZZO3Xy2KTXGiOOlpuVchCogSDEpXjizXnGYls1QRbkQ0U3dEzfuwHqMZrt5QLDNK31qTM3tZ0gUuqG7ydTn8BOaUBXv3vH/L2TyZY2TQmW5mKJDMxzOIQZQEFUnfbeN5gm/d1OcFuZ7W19FakscHqBZUQi73t+TDYC2pBZ7mjA0vyMgiKZZ1owqhmI4T6l3VhZAGHjn6UMzqA2KR62I078YUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e501691-b50c-4c4a-0511-08de8bbe7bb2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 05:05:37.2137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OugsjwCqckim8fWBkiq8eCIjcEukQsO40NpHJ549M/2DSS1nqkAmUzWJp1wqNh/yOpCPMJH/CN1s128QuzZ051qQo0OPhXJzPDLnN3C7AVdspxwXJd8J1C2Gy5aqB2OH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
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

Hi Vinod,

On 26-03-2026 12:55, Vinod Govindapillai wrote:
> If the FBC cannot support the plan size, skip the tests
> 
%s/plan/plane
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   tests/intel/kms_fbc_dirty_rect.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
> index efbd46985..ee13e95dd 100644
> --- a/tests/intel/kms_fbc_dirty_rect.c
> +++ b/tests/intel/kms_fbc_dirty_rect.c
> @@ -401,6 +401,22 @@ static void cleanup(data_t *data)
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   }
>   
> +static bool check_fbc_supported(data_t *data)
> +{
> +	if (!intel_fbc_supported(data->crtc)) {
> +		igt_info("FBC not supported by the chipset on pipe\n");
> +		return false;
> +	}
> +
> +	if (!intel_fbc_plane_size_supported(&data->display, data->mode->hdisplay,
> +					    data->mode->vdisplay)) {
> +		igt_info("Plane size not supported as per FBC size restrictions\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   static bool prepare_test(data_t *data)
>   {
>   	igt_display_reset(&data->display);
> @@ -411,8 +427,7 @@ static bool prepare_test(data_t *data)
>   	data->pipe_crc = igt_crtc_crc_new(data->crtc,
>   					  IGT_PIPE_CRC_SOURCE_AUTO);
>   
> -	igt_require_f(intel_fbc_supported(data->crtc),
> -		      "FBC not supported by the chipset on pipe\n");
> +	igt_require_f(check_fbc_supported(data), "FBC is not supported with this configuration\n");
>   
Since the change in fbc dirty rectangle is independent of other changes 
in the series and imho this can be a split as separate patch from 
blocking it.

Regards,
Santhosh
>   	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
>   	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2, NULL) ||

