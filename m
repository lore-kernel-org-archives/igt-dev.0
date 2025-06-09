Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B735C61CE8
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 21:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E85310E085;
	Mon,  9 Jun 2025 21:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u47B3L5W";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54CF10E085
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 21:35:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mT9Y90imCHGK24VaYGWhudaOlKrf88P42aNtHNnqIZgIIQ98IBy48g6ECcGMFFIsMp+jUVSM5Qzd+2iIhnOL4NOeV4Y97XYTOw68k7/BCOIBixioRqz393gDyEDnMnXJ3w4aIFMkPK9PkWBdlCeFxU/gPwQZl9OjrUGGbW2U3D+MBq4W4wsBqLOivr8G74NKLVEIkPmrFfzAJmQLMiW0HNSKPGiZBMlikqFirRKyqO9CRPenh2wPv1sgMUBz79HiXqCnxxBWJzXPFpcWmePMzqZJ9eOkGFUcx61DPCJe59S+B9K+Ma2TsaD25BejEu9aPUcTbSaryXBrJ3FfAPgN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etpOG3TAx5W5yPrqA3OsR3L11Q9ji6Po2Q5iwTsYj74=;
 b=tU1EcVAYkoAmiWwHB/iilw2BMp90568NQ946TfCtQNq+68wIaMetME1odkyNBsGdqJGiNdqzQQbYHsCntIQ1jidOZvUWnS+0jMO9Lg6UL2O3GpHYRj+ZC3atbwK/JYPgAI6UpSCGTGqLslgOk1KOH4Zp9g0oLBlI3uyahniloXyLtUYJuXIustOBHlJ4x11cNw7QCp3BIbvAyBTqtU67empuDC44HjyhrxTvkTUi7I/Aa4H949JATgBnSxU1c46iCy6I/cUnfvt63PxEd+Nuz1s+gd2roy3Rc/T7FTR0K3DVw04XhMVpjFe3/GJxTlpAPlSR/HdJBhgkFk1gqlZInw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etpOG3TAx5W5yPrqA3OsR3L11Q9ji6Po2Q5iwTsYj74=;
 b=u47B3L5W1cAut5HIJeNgn0r7lJoG2CPkb+N8+7yvCVWIZvZOzPUUJM3shYKK8e8WCMsMFxIowWIN6eQw5/kGEgTxMPrJByuy9BU79DEWTnD0Z3JcL//uSpiv0AgvMGkDutTUdZOlLHLjNboG/xu7ejBVc3yhErc2dR/14PV2/Vs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CY5PR12MB6153.namprd12.prod.outlook.com (2603:10b6:930:27::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Mon, 9 Jun
 2025 21:35:36 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.8792.039; Mon, 9 Jun 2025
 21:35:36 +0000
Message-ID: <df4c7d4b-2a35-4819-9a92-ad686adc555c@amd.com>
Date: Mon, 9 Jun 2025 17:35:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/meson: Enable userqueues based on libdrm version
To: Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250609073311.715013-1-sunil.khatri@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250609073311.715013-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0033.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::10) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CY5PR12MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eadcc98-890c-4bb7-42f7-08dda79d9250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFdKSEl4MjlkaFJ3bTZ1R0RFMmtHMVNhS3Nkc3BjSTFYaGJSbEIxRnl0UDJt?=
 =?utf-8?B?WWwrdmFTT2hibDJGZG53ZUhySE4wYzFrUFRsNVVhMURwWXh0cGplcmVnMnlR?=
 =?utf-8?B?L0tPaEdKWGlCZktWdkdhM0hpV08rY0FuSElUUVgyUUI1VE5ycjQyVkxmWG5U?=
 =?utf-8?B?M1pwVHlTb3J0eml6a0R4REh3elB3a2FzamNvSmVxa3gwK2pBQ1Vja1hzZDZ3?=
 =?utf-8?B?b2gwT2NlSFZGWGtyTCs4TzJGNGRZNzd2NnVFRk9tUXBnMUg1L1dtTjkrR0lu?=
 =?utf-8?B?Z0lZS0JXWWpGdmtEOWhxZWNUNXFhdE0yZnlqb2JBTHZXRXdGbHQzTS9hTnAv?=
 =?utf-8?B?elBOODBmS2poakdKNmpYbkRCVWFtYVN2WlY1N3VIVmxVem14Nzk3MlJ0Yitx?=
 =?utf-8?B?QkdRRFplNEJiaDVIUmVXN3kvQmtZRlBMOWg3MFVjdDZydStGMUY5Q1hpSi9H?=
 =?utf-8?B?ZVdRS0U3OVVuQjFib2ppdVRWcWFpcGhKcEtkc1E4WWR3Wk9lSFl1KzBJN0VE?=
 =?utf-8?B?cGRHSHh0SDlZelJ6Y29PS2E2Z3ZXUlZibjdKekpoZ1ZqZzJRa3p4c1NEK21Y?=
 =?utf-8?B?cktuUitGbWM2UkJXMXdPemN6Y1puNEYxbmFtVmF5UjlKK1I1NU9TaEtBMWRO?=
 =?utf-8?B?Z25DOUdvR28xMmFhTHFyYi9NNER0UG8vbXQvVmhwK1ZiMldtNnd5YzhVL0xW?=
 =?utf-8?B?UEpZNVhPZnBJbDBNbTZwNU5PNXMwdnd6aUFLN1F5aWdSSnV6R1drVXgrMitn?=
 =?utf-8?B?cERPSjU2QXhXUU9zVFJRSFJib1grUU1hcXNkN1JmZU5GNFpEaFloLzlwUGFO?=
 =?utf-8?B?U3luYkt5ZGtNRFVnWHJ2dWluMFJQMHpOaGhLNHFRcTNIVmw4TkJNeUtmZnk4?=
 =?utf-8?B?Wmd2MzRaVjFoWFFxL0NBL3h5Y21oVFVKc05IM0V3KzdvWUZKYmVXSXQvZmlY?=
 =?utf-8?B?SEZlWTdUTWE4dVk3MTIwZ0NSb2luODZEc2QweUg3ZHNRU3FGSmxOdmF5MzJW?=
 =?utf-8?B?YTVmVmNpaFZPNHZBaCtLc0QvL3RzRXcrVVMySWNLTk9MYjUzL3ltZVV0RFUr?=
 =?utf-8?B?V0hnNnpUUkRNTFhEU0lvMzAxQnViQUlack5VWUF0STBBaDF3L056WEk2ZTRD?=
 =?utf-8?B?aVc2dHdRVXFEaGVOY3Z4N29xZ0NYWlNtaExBV2k2VjNubWhzRmloVjZKUXVN?=
 =?utf-8?B?OG4vUjRWY2xrek42NmhPV2NwNkJpYmt5NjFWNXQzeCtJUmJ6c1J2V0RqVXNO?=
 =?utf-8?B?U2U5cE1yZVBlZ1QxeUZZZ2l4YlMzQ3NwelY1bjNRZjBqUUhkQk96eUhmQzRl?=
 =?utf-8?B?SXEyK1M5WEp2RkcyV2VURi96eS9PRlF6K2Z0MmlyUitaQUpSemVza29aRFJT?=
 =?utf-8?B?VWlJbU04VVVlamJSNmdEWmZOK3hrUCtJRWk5RlR6M1huc2tFL2ZseFlheFo3?=
 =?utf-8?B?eERCZ1J2aUtyNlBJNVEwWDZuWFRZZHZjMzI2TkIzenAxS0xCUE1BK0RsM0tE?=
 =?utf-8?B?V1NlNllpc3h2NTJzQmNUNGJUMU55MGlJRnR0UGp2TXdmUml0MFE0V3k1ZTk3?=
 =?utf-8?B?eUs5NkMzcTgzcDI5VjFKRjdFWFVEVjcrS2pOcGFIRno5NkN6eFNIZ3hnOTJo?=
 =?utf-8?B?VEFDUzU0ZWRiVW1ocjNHT2ZTUGcyZnlxQitaeHJhd28vRXRvc2kvcDZLZ1JU?=
 =?utf-8?B?b3lZSFJQeFNIVVQ5Q0ljWTBzWDlOeFBEZ05neDdHQzVEMlFvKzI1Nzl5STdm?=
 =?utf-8?B?cHhXTHFmS0dzVnFzYjIzOW91c1VaVkdtQXFBM1VhUVhObStCenNMa2ZHWmhE?=
 =?utf-8?B?T1FVRzBsbVNJcHJnK3pVaVI1RUtHQlBmZEsvRitsNnI5T3NLbnFpRytRT3dn?=
 =?utf-8?B?VzhESzBTRDJNNnNBcmVBemJ0M2o5azJWN2c5NUlqOS8rd3NscXdqck4yM3RK?=
 =?utf-8?Q?cr4vKULirIg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnFWZ1ZLaTBrNzJwc3pLK0l4MWsvNXMzRmVSWTh2QW9Na2g2a2xwUVRScG1t?=
 =?utf-8?B?eFIyN2hHUHpyZll3SmI4bVUvdmhnbHJDOU1YRVRRbjVjRzJtSUw3RkFiai9v?=
 =?utf-8?B?QTdUZDNwTFRxempmb0p0MTBMbktXUm9xNUw3ZHF3d056VUJvOWVnLzYySHZ5?=
 =?utf-8?B?WHdQTGxEQmFXc1ZqTW9jcnRJYUhvMVBYZTRlbVZlMGE3ZnVwRnQrZzB1c001?=
 =?utf-8?B?aCtod083c1hoeWlxaFpHU3FFb0IzZzhLWHpZTlVhYytVRE9CQlo5NzRQbzhQ?=
 =?utf-8?B?bmJTUnY3YUV0V0JpclpiWUJhSlg0V3FPdGVYSzJPZThtODRKUnVNbUJZMStt?=
 =?utf-8?B?cXV6aG5mSkdLVkVpOW8wamRjR1BWUlhLSDNrSVMvNll6dTU1c1NoYS9USS8y?=
 =?utf-8?B?OTIzWEdZaGlUR0VQSDJTZzlsUGVabzk4WDNRM1NQVi81bTF2a1VZcTNXRk5z?=
 =?utf-8?B?bkxoalBOQWJ2eU1jNlBjZGxtNjRJbUpjSVNlZG81RHgzakFrNno0UjljY0to?=
 =?utf-8?B?RHdObktCTUFIdVZtUTZyaU14ZUVaeFdnN2VoVU1ZQ3RUN2xONW96TFJlWnlM?=
 =?utf-8?B?Z2tKQ0dpRHdiSTBsdlpSckVZTVNJTll3eGx0dkJwRjFxZEUyVlkwWXFMM21Q?=
 =?utf-8?B?Lzl0QXR4ZFkwbElZdWFFemEyWHM5WFlabVFaYW1EMXBRVHgyWVI5WWlkZEZ4?=
 =?utf-8?B?RDNacWRrdG1RSVAwQ3FFY09aanNLeU1tMmpJVkh1cmpSSmp4NkwxRUc5TkZC?=
 =?utf-8?B?OFRwelN4STdPcUhXS21zUHVLckJ2ZW81dTdlRUFFWTk5N3R5M090VW5FZFNx?=
 =?utf-8?B?RWJsWXh1NW5uN3c2UU1kYzNXSzQvdGw3ZHRkZFpuNGQydDhEYmhybU5LL3U3?=
 =?utf-8?B?SzdyT3ZlZnRMZzVEbVBVR3JLTG5EelhmUktsOEZGQytlTkk0WjFmR1hydmU5?=
 =?utf-8?B?dFhET0F3RXlaK241QVNPclByei9VajAya1hSM3UzRGRlS1Y3MHZHdnRFTDlW?=
 =?utf-8?B?YWxMdEVSNFVaQVZLcnlLK2dwZmJpS2FObGt3eUlaSEF6d3ROa3hqay9JZzNN?=
 =?utf-8?B?WFJMUUZTNkhyTVlvSDdGOWZ0Q250bU50UFl5T2xlaDl1K2RoSlNwR0hyWk9B?=
 =?utf-8?B?N0l1KzBMUUNCM0tTS01DalV1STNnWDhSOElNV05QU3VxbjhJck5FS0E3RTR3?=
 =?utf-8?B?c0dSVVFpUUdqdDdIWldSblRzUG5MVlVySkxxc1RQalBtcW9NbkV1bStTK2Uy?=
 =?utf-8?B?bjRYZzRjWkc5UExGWitVd2FraytlcTBtSVBaM3FEU3kvZXhwUFNpVlhGRWlq?=
 =?utf-8?B?S245bUJhY3BsZmdSVms1RWdsQ2VZRGFvL0I2aFViNEpCQUlHZnhVVldFcmg3?=
 =?utf-8?B?RTBZUkZjdW5samVVb0ZxcHkzUU1mbnFkcUs1b2NtVktGT3lQS05XcDh4S1Ir?=
 =?utf-8?B?MkxGckkwN3FCSS9YU2JjNGcrSXhaaGVBK2YrdGFES0R3azFyUDJ5bHY5TURv?=
 =?utf-8?B?dG10TXRrY1dWTHN6TXJpQXZ1d3h3U0h3R1gySnAwSHloL2FNdTVFKzJwT1dm?=
 =?utf-8?B?cUg0aWpDNmlVQk1YVnUzdHZuNVBaNi9RWjc0SVJRZ01UNkM0RlpkeWM2VzlU?=
 =?utf-8?B?L2g5eko1TkJyK3N0UzErbWdXRys3WkFkK2YyVVJjQnJ3RzZ3a2kxTTdjYjY0?=
 =?utf-8?B?bTJqVExBYmdxWEtZK2s5c1UyVHZxL3Z4MWNYWkxySWhhdWlOUm1yWDVKV2Qx?=
 =?utf-8?B?ZHJqcG1yRnpZOTVib0VSakdIeWNSODVQSDI0cFlxUUk0M3NaN29DdnB4cTha?=
 =?utf-8?B?RTNaM1pXdUlvNzBTUGwyOGY4SnBwdE16Z0dyYTJpWEVSZ1BUZ2FWL01LdUxI?=
 =?utf-8?B?ekdlZHR3VGhGQXZPeEVJNm1WRTZpY2JpaGpMQVZTa041MjQycEl3SjdNWGFJ?=
 =?utf-8?B?VmdLUkc0WDdsMVoyK2t0bTFGb3p4Tkt1OUZibE0wOTZBdTNkWmdEcjJqZEtM?=
 =?utf-8?B?U1JoWGw5VFA3bFhrZ2FhR1lsZG96azlTMUoweWV1bjcwNUdQZUM3N2ZIcnhz?=
 =?utf-8?B?ZnFEUXFlanpYK3FtTVRoL2F4dmcwci9EZXF6Rms4R3VYb0ZWT2RyUDRUVXds?=
 =?utf-8?Q?zL9j54fVsLxM/w4aQM5gFAGHJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eadcc98-890c-4bb7-42f7-08dda79d9250
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 21:35:36.6012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gKqMBlZl/IvKSbJQSeFhnBAjD6CPjIapa76xXUom6ZlxO+ao2mu4VU4p4RydNZRMImFcwF9rBYxCX9aeMXxWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6153
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

Reviewed-by Vitaly Prosyak  vitaly.prosyak@amd.com>

On 2025-06-09 03:33, Sunil Khatri wrote:
> Enable amdgpu userqueues support and test support if
> libdrm version is >= 2.4.125.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  lib/meson.build | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/lib/meson.build b/lib/meson.build
> index 04a568cf1..dda30e4bd 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -179,10 +179,12 @@ if libdrm_amdgpu.found()
>  		warning('libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable')
>  	endif
>  
> -	if cc.has_function('amdgpu_create_userqueue', dependencies: libdrm_amdgpu)
> -		add_project_arguments('-DAMDGPU_USERQ_ENABLED=1', language: 'c')
> -		#conf.set('AMDGPU_USERQ_ENABLED', 1)
> -	endif	
> +	if libdrm_amdgpu.version().version_compare('>= 2.4.125')
> +		add_project_arguments('-DAMDGPU_USERQ_ENABLED', language: 'c')
> +	else
> +		warning('libdrm < 2.4.125 found, amdgpu user queue support is not enabled')
> +	endif
> +
>  endif
>  
>  if libunwind.found()
