Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203BDC3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 19:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9828410E162;
	Mon, 31 Mar 2025 19:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NLo32cXF";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3321010E162
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 19:12:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5COvM9BuLx8SqyYZoQ8i1cqt9d6pwp0jPcsd0GLeVV97fqUZjQdzxmX7rrXjw+UxJY55pND0Hooq7Nz2gmxnSNQYSWMJzG4igD5EvXzhtVcna2pig0xXbzlif9tMEkgrLYGLXsx0EskNDHKtA1UdmEOtJSNHDN1ghe8afCQWGc6/VBC7wQ5Pqewiy0c80K6OitD2dOnBZouUWDcInWvuwSfef7Szw0C3xtc8AmFEDq8eXtOGTdAnFVeVpK4nvvxNKz0RRDvynxCulRdbeq0BjP8nClAGO0N+fBjeNt7pV4ixoxtbZGPnuRxvLKwH2DBUjCcmaEpovUcskvJzKBwPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPKPCU32G1GeMQPuQpGiqfzDz+BuMS3HHkbMBmOD4xA=;
 b=iLi3nzUZYVmHuwK4d45/0mKDrP0NNsj5LdrJXF3cxQJ9eFWLysmgD05maocLZ2X4Bye0ScMwhojC6gHbNuoZlgvdz8HxBwzBt2cwcohebbql98MPmcRa5FQn19JdaO++6UHW6SEjLol0/4Parv03NkNm/9wNm3xZpG1dIcbbj7DBWjooYn3nIF/9/KJRMSMlh5+SPQqoZSWCqyZIbSvGQONijx4o6G9O0BQmaBkMO8SaUrAybgK4Z1CG9D65uvDQRjOpf3VRY9HnIuqpd8SjxYkQM8p2DVtoQ6AtN/iAPh/VqFx0C4L0Urhvz/fFu655DuO3Db6xgy/5W2ezv74zxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPKPCU32G1GeMQPuQpGiqfzDz+BuMS3HHkbMBmOD4xA=;
 b=NLo32cXFdlGWqS1dk2fhNSxeaGgL47nKKHP0ij9j152gyBR4OwfjgtvgsEPdksCL+eYBjO8rTJShqx0nu9Y20q3/FUOfOxBSmkU4eOVS0J/7+iPR98pcTXV8CNMJbhOydPvV1sLOykmFFT2kBwnG8o52Fh12f5AnI6HwFMm8X9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SJ2PR12MB8881.namprd12.prod.outlook.com (2603:10b6:a03:546::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 19:11:56 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 19:11:56 +0000
Content-Type: multipart/alternative;
 boundary="------------TsTY6pwPDw8qgUEi4wTbMwxL"
Message-ID: <9c9978cb-0193-447a-935a-2f146a84f9a1@amd.com>
Date: Mon, 31 Mar 2025 15:11:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/19] drm-uapi/amdgpu: sync with drm-next
To: Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
 <20250328082416.1469810-2-sunil.khatri@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250328082416.1469810-2-sunil.khatri@amd.com>
X-ClientProxiedBy: YT4PR01CA0421.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::23) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SJ2PR12MB8881:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c655f2d-6866-45f7-a107-08dd7087e71e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dExJWHNGb3Q2eXlyM1gzZ1hzTHdLZXo2clBWL2dpWHVBdXpkYXZDNjNxTlFN?=
 =?utf-8?B?R3lWbFh0U05hNnRXU2t5ekhHdjliRU9OeGx2NFgrR0Nka2VLdzFEVVhMdWtt?=
 =?utf-8?B?TUFISU8xalNkK2lyQ1pkcHNjTkRxTDRGeUF1UXVrY25JQnVUZ0ZFTlJDdjN6?=
 =?utf-8?B?Wk1mdkswcmFCSUYzUUFBOVlERTdNeUxTVFVBSnoyVTJ5UFBvMUxuT1BMaFNE?=
 =?utf-8?B?TUFBQ3VNV2xCTlh0K1BlMzJONHkybnlZRWc3TzVVcU00dFpUUGM3USs3ZlNP?=
 =?utf-8?B?Q0ZnTWdaUzVLSXNvdGVyZkZVbjN0eTFLVDFCZUZ2VndBNnZmZUhWRUdHTzFK?=
 =?utf-8?B?c1lDVjIwYlZDNEwxNjlOV0tvR2h3OFRvK0d1cFE2bHpNLytCemFLZFc5ME9R?=
 =?utf-8?B?ZUdpNnAwT25tcFpCY1BPbDhKWE1NM3VlL09xVVNnRzdCK1kzWmh1a2lhWm9S?=
 =?utf-8?B?M0lRUjBMbndDTWdrWHFLWXlTb3lTWFJWUFZweE5lTzY5NFlGbjdKdi9BVGY3?=
 =?utf-8?B?YzJJcGN3NFJYZzlTeE9QTzZBSVIwbXdYYngyN3ovSUVsais2TnVZZXBCY3VM?=
 =?utf-8?B?bU5uNlA3OWxDaC8zSnF5U3kyV1FpV1IrOC8zR3pLclVlZXl1alhKMTdNRkZU?=
 =?utf-8?B?RHBEbmt3MzB5Q1A1RGZIOGozdG4xY243YWcrRGhFdUZtK0JjRkg4OFNtMmxl?=
 =?utf-8?B?MC8rUzdEQlBGamxkYVpZYjNtbG9mMHk3dzluai8xbUd2L0ZFUTBmZXdRbXVi?=
 =?utf-8?B?dHNyb1phVzhIUGpqWTh1bWlDeGpsYWJaV1NjNnBSYTViQ3IwbnRBYy9CUmtE?=
 =?utf-8?B?Q3hMMFh3ZEpvVWtZT2o1YzhXY0FZQkNJUDlLZEQ5bUhHaGxNOUJlTVRxbmwr?=
 =?utf-8?B?ZkN1eHlVRDNET3VhODU0ZzlVbUFNbjRKblRwNmIyL2VjZGZRSnFIWU5xVzlZ?=
 =?utf-8?B?cnU0NTQyc0J1WjBub1dJVUdQZjRxMStoZXhEeFdjaFNuRkhnbFhDRnlIUGZw?=
 =?utf-8?B?cWZMTTBVamFBSy9jLytiQ0lKeUoweHpldTg1cklMbFE3QU1Ubkt6UmJSRWpX?=
 =?utf-8?B?ZGllK0tVZlFkSytGQ3grVzNMeFNlcDZMM2FzTGJVRzBBRjBScGRrV3YxV2hm?=
 =?utf-8?B?c1hUelZFdDhDbGZCWklpQk1jRUNrK3pnbjB5bzZEQUh0R0s0QXZJcHVuMW1D?=
 =?utf-8?B?NDgwSTFuT3RaSm8yTGtHaWt1YkZET0pIcEx6andWTjJrWWF0MXdnZzlxSkFx?=
 =?utf-8?B?RVdHK0M5aXFHWnRBOUhldlZXbUFUaEt5cHdySzZnTTB3Q2J5aDNkczBCZVZq?=
 =?utf-8?B?a3NKRFpwc21tendmbW5lU05DM0Y1Z3NubnlTRGNYNjZkNUM3b2U5M0hCLzQy?=
 =?utf-8?B?KzdjZDBhTHV5TmVLNmR1OFNHL0gvZFdVeFBDSjR5T2hpU0E3QXFoTktpUHhp?=
 =?utf-8?B?SDNHeEdmQm5iZ1JnMnVxWUR1cHQ3TmRnS2tnZEFmNWd0WDFBaHpOUVZQbVc0?=
 =?utf-8?B?dnYxdE5SUm9Cc2lPUllEY0Q5b3NrT25WdzM2NnNwRk51RFlucU94ejNnU3gv?=
 =?utf-8?B?dlpGQVRSY0RWc1JpNWxOcitXVFFFZ1JEaFh2Y3NmYjJ1UnpHdllIcnhOK2RR?=
 =?utf-8?B?NXZxcStFQ1ZMWEVVMHVVZXdnR1pWckk4ZXZ4RXVmZHJLbTVzVEdUdGcxR0VP?=
 =?utf-8?B?bEthRHBYWXZmT2JCcVZaWnBKWHhJM1VBTXhJTG9Va3l2TjVtMVluNEhyaUNa?=
 =?utf-8?B?bjlaVnFuVnJncW8zN2V5T2F4WW5iaVJUSEh4ZXd1OTdRdlVTZjBuRkRYbmZu?=
 =?utf-8?B?ekpVUjIvQVFER0JjL2c5cDQxM2VBc1ZDVEVUOWl5TERrYUtoUjF1M1JNYzBU?=
 =?utf-8?B?Y2o0YVRqMkRKUUY0QkpRZ3doVFNkd0cwNHlldXZja1pvazlqNGV2QVM3bGZG?=
 =?utf-8?Q?HBVxvGabkg0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1laNVVubHhyK0Rzc0dzQTBWSUZNRHlXRG1sM29MVTZsZzJCWE9XRlZOemY2?=
 =?utf-8?B?ejFicWNDV05QckFScVAxNG5sUXpJam92bDQycFB4ZnZnOExnYTdPSUtod1FT?=
 =?utf-8?B?UWYvdEJPaXl4dkJFZUVCcml0YmRtcTVmYys1M2FYOXpTUDRhNHMwME01UHdS?=
 =?utf-8?B?S2cyVFR2c21hZUhqNkpmOUdNUFgrWGNvcVd4dnVDK3hzNjgxeU5QMkkzbnFR?=
 =?utf-8?B?OFpicVQ2UVhmUUxML1hBV29malZmZEdpWUJ4K0N5YVBvZWdNTkE5UDZzdUJs?=
 =?utf-8?B?ODc4QkY3R0gwVHhzOW9CM0swRFd1d3RGOFBwNzBVMDB6a1FpZDJtTnV2dk5z?=
 =?utf-8?B?RnVKSjZNOHdnWGRBNUFtSlBKNlVxLzlLc2FRcUlJM2R6Ykcrd2FLWU9ZUkFC?=
 =?utf-8?B?TG1lZSt2QlkxUnc1VlNBRmFOMnltcDlEaDY2cDBla2ZOa01xZUFhOWlrOXRR?=
 =?utf-8?B?QTVvdmxaS3pxcXBWWFlVVlpwd2QvU0xhcXBIRmgzSGhwYjVYSzliSXluUFVN?=
 =?utf-8?B?RTE2WmxrQ3ZkVUdvSHZYTkloZzhYT054ZWVrRzBKeTBFTjRIdWlXWDNKZS9U?=
 =?utf-8?B?SzdWWERZaHdpYlgrWkE4TXJVQjdHNG03cm1pQXU2WEttb05zNkpTUVI4MHp6?=
 =?utf-8?B?QVdNenJ6WVAxUGZwN2FTYzhVK00zaVo3U3F2bWIrMHpyTkZzZXZnM1NweUJE?=
 =?utf-8?B?NkxGSEVycXVjRXRrelN0VUtJcm5MMmlIeFdGSFhaMEJtRWplQ0RieUd1eitN?=
 =?utf-8?B?VGxvQkZaaHVwWG1pam5mcFIvc2swdFYzL1dvZFY0ZUdRa2cwcG43ekE3R2Vv?=
 =?utf-8?B?bDRtMUpTb1M4cTI3Szk5TGdqNnZ3VCtKS2ZEalN4STQ5ZzdNSFZteDA3RDlq?=
 =?utf-8?B?TTV1VlUyYm5PbE9zTjZSanlJY0RZNXp2ejFVQ0JnVWVmWkFYRHYwYkdLV0I3?=
 =?utf-8?B?bFRkZ25WcHAwdGJuQ0k2UUYxcjFySEx2MG9UZ2ViaGZENDVZbGt0c3VRRlVJ?=
 =?utf-8?B?NDVNUXBuZmEveWtoVEgzSVNzZzYxdm9EVVV3WFRkSmk4aHF2d2FZTHh1dHB3?=
 =?utf-8?B?T0hmY3ViOFVBRlhMbEVWMmlTSHIybmZuZFNKWEl0VU1VNEVJVjBpV3JwNnVH?=
 =?utf-8?B?VXNWSEdqV0NWUFlKaDV5SHkrQ3M4OEpaVW9JRnNxNWdpTzhWMjd5aTVwMXRq?=
 =?utf-8?B?bllNbEowdm5kSHFoL0hyTmNjWjFFZmd2Ym1IOWg1b3ZNUTRBSWkxb1BBOE1U?=
 =?utf-8?B?WHd5YnRtTGdxeHFsYjhTLzFQY3RGclY4SXk1UlZrOWEzQURDZ2pucWo1YlJi?=
 =?utf-8?B?c2YxQ2kwY1VDdFptdlllVzkvbno3WW51eEtjSUhDNVdsMGlYSTczL0t1YUxZ?=
 =?utf-8?B?aDY5WnNmV0FyNUpNRzdJTFdQdXoxZnBHZ2ppRHAyWjl6NXNiMFJlZEI5QndC?=
 =?utf-8?B?K29jejNLSHlTakZxOEV0YzNYYTUvQ05wd0lsbVF1eFZ0MnMxK2J3dHZUcXN1?=
 =?utf-8?B?UWRLSHhjTlVCUWZUMytkNlk5V2grYms3WnpUYU8zVENsdUtkUzEvYU5VbUpZ?=
 =?utf-8?B?c1ExMTR1NHNPV3BoazdqSUNhN1VUOGV3RmN0Z2JLNngyN1FzWVZpeWtneWFs?=
 =?utf-8?B?TkFjRHJqdTFPZ2Erbi9jWXJSOTBybmFGSzBEVkMvRVdFdUxuNHV6K3hFbU5q?=
 =?utf-8?B?VjAzQnk0S0wwTThMaXNzOGtpSklhT0E3VG5sdHloeFowS1VYU2JaV1JTNG9q?=
 =?utf-8?B?VGdxUW1DZG5FaVc5MW84YUxiNGxydkVyaTZlRWV1UHB4UktlRCtWR1BaWHRP?=
 =?utf-8?B?SWlEOSttSktVdzBOZWt1dEYvYzgzanRQaUtwTkNOamVoYU4vSzF4RUZtN3lx?=
 =?utf-8?B?TkNhSGY4QVI0WGlIVkRtSGQ0dUVpMGU5QTlYUDBJb0dNL3MzZ3crMzNJVmFu?=
 =?utf-8?B?eXR1aThDNXRRSFVweWROVFpIUFQxZWU0OUJ0L2dRMDFoR0UxN3VzSW9OYkNM?=
 =?utf-8?B?SmJKZXMwQTdCZVJsTGFWekFBTnZmTjM3bGtteXZmRTJVeGNkQ3psbGduNVJr?=
 =?utf-8?B?cTVHNFBQUmxSWHVITk5IOUVDR2xQV2lFVlBJOGwxVlJ4VEZIY2UrR3M0MERr?=
 =?utf-8?Q?KqV8D0Gfx1it4K2j4JmASF5pP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c655f2d-6866-45f7-a107-08dd7087e71e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:11:55.8959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fez0o8EoUf8CzvObY3pcvO+SIX7IB8lBwk0rRgeFg22J+A/TH4E9mXHG2d9pqoTy/0e+/EuB01f3i1YwEmTX+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8881
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

--------------TsTY6pwPDw8qgUEi4wTbMwxL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2025-03-28 04:23, Sunil Khatri wrote:
> Sync with drm-next commit ("866fc4f7e772c4a397f9459754ed1b1872b3a3c6")
>
> Added support of UAPI for user queue secure semaphore.
> The semaphore is used to synchronize between the caller and
> the gpu hw and user wait for the semaphore.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  include/drm-uapi/amdgpu_drm.h | 117 ++++++++++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
>
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
> index d780e1f2a..fed39c9b4 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -55,6 +55,8 @@ extern "C" {
>  #define DRM_AMDGPU_FENCE_TO_HANDLE	0x14
>  #define DRM_AMDGPU_SCHED		0x15
>  #define DRM_AMDGPU_USERQ		0x16
> +#define DRM_AMDGPU_USERQ_SIGNAL		0x17
> +#define DRM_AMDGPU_USERQ_WAIT		0x18
>  
>  #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>  #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> @@ -73,6 +75,8 @@ extern "C" {
>  #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
>  #define DRM_IOCTL_AMDGPU_SCHED		DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
>  #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
> +#define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
> +#define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
>  
>  /**
>   * DOC: memory domains
> @@ -442,6 +446,119 @@ struct drm_amdgpu_userq_mqd_compute_gfx11 {
>  	__u64   eop_va;
>  };
>  
> +/* userq signal/wait ioctl */
> +struct drm_amdgpu_userq_signal {
> +	/**
> +	 * @queue_id: Queue handle used by the userq fence creation function
> +	 * to retrieve the WPTR.
> +	 */
> +	__u32	queue_id;
> +	__u32	pad;
> +	/**
> +	 * @syncobj_handles: The list of syncobj handles submitted by the user queue
> +	 * job to be signaled.
> +	 */

I am not sure about the correctness of the 'list of syncobj handles.' If it is a list, the field should be of type |list_head|; if it's an array, it should be |__u64*|, since the next field declares |num_syncobj_handles|. Could you clarify this?

There are several fields like this ?

> +	__u64	syncobj_handles;
> +	/**
> +	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
> +	 * @syncobj_handles.
> +	 */
> +	__u64	num_syncobj_handles;
> +	/**
> +	 * @bo_read_handles: The list of BO handles that the submitted user queue job
> +	 * is using for read only. This will update BO fences in the kernel.
> +	 */
> +	__u64	bo_read_handles;
> +	/**
> +	 * @bo_write_handles: The list of BO handles that the submitted user queue job
> +	 * is using for write only. This will update BO fences in the kernel.
> +	 */
> +	__u64	bo_write_handles;
> +	/**
> +	 * @num_bo_read_handles: A count that represents the number of read BO handles in
> +	 * @bo_read_handles.
> +	 */
> +	__u32	num_bo_read_handles;
> +	/**
> +	 * @num_bo_write_handles: A count that represents the number of write BO handles in
> +	 * @bo_write_handles.
> +	 */
> +	__u32	num_bo_write_handles;
> +};
> +
> +struct drm_amdgpu_userq_fence_info {
> +	/**
> +	 * @va: A gpu address allocated for each queue which stores the
> +	 * read pointer (RPTR) value.
> +	 */
> +	__u64	va;
> +	/**
> +	 * @value: A 64 bit value represents the write pointer (WPTR) of the
> +	 * queue commands which compared with the RPTR value to signal the
> +	 * fences.
> +	 */
> +	__u64	value;
> +};
> +
> +struct drm_amdgpu_userq_wait {
> +	/**
> +	 * @syncobj_handles: The list of syncobj handles submitted by the user queue
> +	 * job to get the va/value pairs.
> +	 */
> +	__u64	syncobj_handles;
> +	/**
> +	 * @syncobj_timeline_handles: The list of timeline syncobj handles submitted by
> +	 * the user queue job to get the va/value pairs at given @syncobj_timeline_points.
> +	 */
> +	__u64	syncobj_timeline_handles;
> +	/**
> +	 * @syncobj_timeline_points: The list of timeline syncobj points submitted by the
> +	 * user queue job for the corresponding @syncobj_timeline_handles.
> +	 */
> +	__u64	syncobj_timeline_points;
> +	/**
> +	 * @bo_read_handles: The list of read BO handles submitted by the user queue
> +	 * job to get the va/value pairs.
> +	 */
> +	__u64	bo_read_handles;
> +	/**
> +	 * @bo_write_handles: The list of write BO handles submitted by the user queue
> +	 * job to get the va/value pairs.
> +	 */
> +	__u64	bo_write_handles;
> +	/**
> +	 * @num_syncobj_timeline_handles: A count that represents the number of timeline
> +	 * syncobj handles in @syncobj_timeline_handles.
> +	 */
> +	__u16	num_syncobj_timeline_handles;
> +	/**
> +	 * @num_fences: This field can be used both as input and output. As input it defines
> +	 * the maximum number of fences that can be returned and as output it will specify
> +	 * how many fences were actually returned from the ioctl.
> +	 */
> +	__u16	num_fences;
> +	/**
> +	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
> +	 * @syncobj_handles.
> +	 */
> +	__u32	num_syncobj_handles;
> +	/**
> +	 * @num_bo_read_handles: A count that represents the number of read BO handles in
> +	 * @bo_read_handles.
> +	 */
> +	__u32	num_bo_read_handles;
> +	/**
> +	 * @num_bo_write_handles: A count that represents the number of write BO handles in
> +	 * @bo_write_handles.
> +	 */
> +	__u32	num_bo_write_handles;
> +	/**
> +	 * @out_fences: The field is a return value from the ioctl containing the list of
> +	 * address/value pairs to wait for.
> +	 */
> +	__u64	out_fences;
> +};
> +
>  /* vm ioctl */
>  #define AMDGPU_VM_OP_RESERVE_VMID	1
>  #define AMDGPU_VM_OP_UNRESERVE_VMID	2
--------------TsTY6pwPDw8qgUEi4wTbMwxL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2025-03-28 04:23, Sunil Khatri
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250328082416.1469810-2-sunil.khatri@amd.com">
      <pre class="moz-quote-pre" wrap="">Sync with drm-next commit (&quot;866fc4f7e772c4a397f9459754ed1b1872b3a3c6&quot;)

Added support of UAPI for user queue secure semaphore.
The semaphore is used to synchronize between the caller and
the gpu hw and user wait for the semaphore.

Signed-off-by: Sunil Khatri <a class="moz-txt-link-rfc2396E" href="mailto:sunil.khatri@amd.com">&lt;sunil.khatri@amd.com&gt;</a>
---
 include/drm-uapi/amdgpu_drm.h | 117 ++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index d780e1f2a..fed39c9b4 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -55,6 +55,8 @@ extern &quot;C&quot; {
 #define DRM_AMDGPU_FENCE_TO_HANDLE	0x14
 #define DRM_AMDGPU_SCHED		0x15
 #define DRM_AMDGPU_USERQ		0x16
+#define DRM_AMDGPU_USERQ_SIGNAL		0x17
+#define DRM_AMDGPU_USERQ_WAIT		0x18
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -73,6 +75,8 @@ extern &quot;C&quot; {
 #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
 #define DRM_IOCTL_AMDGPU_SCHED		DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
 #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
+#define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
+#define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
 
 /**
  * DOC: memory domains
@@ -442,6 +446,119 @@ struct drm_amdgpu_userq_mqd_compute_gfx11 {
 	__u64   eop_va;
 };
 
+/* userq signal/wait ioctl */
+struct drm_amdgpu_userq_signal {
+	/**
+	 * @queue_id: Queue handle used by the userq fence creation function
+	 * to retrieve the WPTR.
+	 */
+	__u32	queue_id;
+	__u32	pad;
+	/**
+	 * @syncobj_handles: The list of syncobj handles submitted by the user queue
+	 * job to be signaled.
+	 */</pre>
    </blockquote>
    <p>I am not sure about the correctness of the 'list of syncobj
      handles.' If it is a list, the field should be of type <code data-start="165" data-end="176">list_head</code>; if it's an
      array, it should be <code data-start="209" data-end="217">__u64*</code>,
      since the next field declares <code data-start="249" data-end="270">num_syncobj_handles</code>. Could you clarify
      this?</p>
    <p>There are several fields like this ?<br>
    </p>
    <blockquote type="cite" cite="mid:20250328082416.1469810-2-sunil.khatri@amd.com">
      <pre class="moz-quote-pre" wrap="">
+	__u64	syncobj_handles;
+	/**
+	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
+	 * @syncobj_handles.
+	 */
+	__u64	num_syncobj_handles;
+	/**
+	 * @bo_read_handles: The list of BO handles that the submitted user queue job
+	 * is using for read only. This will update BO fences in the kernel.
+	 */
+	__u64	bo_read_handles;
+	/**
+	 * @bo_write_handles: The list of BO handles that the submitted user queue job
+	 * is using for write only. This will update BO fences in the kernel.
+	 */
+	__u64	bo_write_handles;
+	/**
+	 * @num_bo_read_handles: A count that represents the number of read BO handles in
+	 * @bo_read_handles.
+	 */
+	__u32	num_bo_read_handles;
+	/**
+	 * @num_bo_write_handles: A count that represents the number of write BO handles in
+	 * @bo_write_handles.
+	 */
+	__u32	num_bo_write_handles;
+};
+
+struct drm_amdgpu_userq_fence_info {
+	/**
+	 * @va: A gpu address allocated for each queue which stores the
+	 * read pointer (RPTR) value.
+	 */
+	__u64	va;
+	/**
+	 * @value: A 64 bit value represents the write pointer (WPTR) of the
+	 * queue commands which compared with the RPTR value to signal the
+	 * fences.
+	 */
+	__u64	value;
+};
+
+struct drm_amdgpu_userq_wait {
+	/**
+	 * @syncobj_handles: The list of syncobj handles submitted by the user queue
+	 * job to get the va/value pairs.
+	 */
+	__u64	syncobj_handles;
+	/**
+	 * @syncobj_timeline_handles: The list of timeline syncobj handles submitted by
+	 * the user queue job to get the va/value pairs at given @syncobj_timeline_points.
+	 */
+	__u64	syncobj_timeline_handles;
+	/**
+	 * @syncobj_timeline_points: The list of timeline syncobj points submitted by the
+	 * user queue job for the corresponding @syncobj_timeline_handles.
+	 */
+	__u64	syncobj_timeline_points;
+	/**
+	 * @bo_read_handles: The list of read BO handles submitted by the user queue
+	 * job to get the va/value pairs.
+	 */
+	__u64	bo_read_handles;
+	/**
+	 * @bo_write_handles: The list of write BO handles submitted by the user queue
+	 * job to get the va/value pairs.
+	 */
+	__u64	bo_write_handles;
+	/**
+	 * @num_syncobj_timeline_handles: A count that represents the number of timeline
+	 * syncobj handles in @syncobj_timeline_handles.
+	 */
+	__u16	num_syncobj_timeline_handles;
+	/**
+	 * @num_fences: This field can be used both as input and output. As input it defines
+	 * the maximum number of fences that can be returned and as output it will specify
+	 * how many fences were actually returned from the ioctl.
+	 */
+	__u16	num_fences;
+	/**
+	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
+	 * @syncobj_handles.
+	 */
+	__u32	num_syncobj_handles;
+	/**
+	 * @num_bo_read_handles: A count that represents the number of read BO handles in
+	 * @bo_read_handles.
+	 */
+	__u32	num_bo_read_handles;
+	/**
+	 * @num_bo_write_handles: A count that represents the number of write BO handles in
+	 * @bo_write_handles.
+	 */
+	__u32	num_bo_write_handles;
+	/**
+	 * @out_fences: The field is a return value from the ioctl containing the list of
+	 * address/value pairs to wait for.
+	 */
+	__u64	out_fences;
+};
+
 /* vm ioctl */
 #define AMDGPU_VM_OP_RESERVE_VMID	1
 #define AMDGPU_VM_OP_UNRESERVE_VMID	2
</pre>
    </blockquote>
  </body>
</html>

--------------TsTY6pwPDw8qgUEi4wTbMwxL--
